export const lambdaHandler = async (event) => {
    console.log(JSON.stringify(event))
    const response = {
        statusCode: 200,
        body: JSON.stringify('Hello from Lambda!'),
    };
    return response;
};
