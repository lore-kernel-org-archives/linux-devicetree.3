Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794000384;
	b=EN4VYFw/2KS3aiBpowHwDBm001LbrDzrjCdJlX3vnTH8TU54E5VNP/uzkZOFfUUqWznc
	 Vvgh/YMGx97Dy2C+ta9AkgJUto9wBk6VTb+kUUCXqNm4WxVIDi0Nc0YLyj3HTO0/n8It/
	 sfRXaOAuLR1KKAS0kiNKprGJwJKM/+mEMpsiw3tgYAPfXQ5t1bW37jBLJdVUjNQtR64Vh
	 l4BgL0UueUQWezzacOfkmC31tEnOUvD7hwCu8bTH7PvlIZbY8XSvKOAI3YOEnXqPltq18
	 CBxuQtO04v7naAE9ehG4B+0eib7D1VjN+K46n0AOV5494Jkl4gh+jhowPssgg0pTHYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794000384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=IS0n6SvtrSel8zY6vkWXqf2dHmq9Z3b4+UIE+41Cj1Y=;
	b=U/gFL7Nx5qU2FW63JY0h6msagKWKLGlSTgpGxrb9ZJOTkjVgEV4sTeO06jRjsucMriDX
	 xmXTdvb8gjVULCavLbgNR+PP1nrR6Du/OTceEO/4SFmFIGJYGmoZB4n8OsvYwCCHi1S+4
	 U+uNwjYxsX4Gu3yPpYamxshuy/38pwq5QcV9bayvgSIheT3K92GrsdWBKxh4NAxgbtRrA
	 c69Y2nXk15MreEf8Z3FqfFMvyx5SEjjJXKGPXaVNgkNhY+xP41I0g0eyHQCPolLzIK6dm
	 XpFxojoP4csxdpKngfHd7ZZ2mESeNNiLaPzcVhlp/S+LSLdvq4lORx/iB21flhAvkHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fElw+eI5;
	arc=none smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47033606A337
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 21:26:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47033606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fElw+eI5
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ab35a9d9ceso1322251fa.3
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 13:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794000382; x=1794605182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IS0n6SvtrSel8zY6vkWXqf2dHmq9Z3b4+UIE+41Cj1Y=;
        b=fElw+eI5A1w3IHAlBMJDLXRdBdImdRRuG7tpGlwkAMmBHAk16RV4TH/P0ZmbfhQYpp
         US2j+t2uTpkkH6Tvzs7OH4p4mgNUfQ9kbl2ANOSRPJSY34f++LIT70jAr/dBguYOgU1+
         0pfQQhuSZa/m9R5bhgoimw63HMKZMgihXiH6MUVCIYnXubaiAJZMT4kjUqLQLQYamQV7
         ADuxWSh3ffVdPJN5Mf9g8EhiqF/11g4M0XzKm2TlnCPDha+NBvRjeJ4Q9UjaAIb8cAIN
         bEsbw5aJM7boNpVe9K+HcYqpeB60vwmXjr/2qzSbU+YM6FsexXa4G+xwUar6b+1OoWIe
         6KrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794000382; x=1794605182;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IS0n6SvtrSel8zY6vkWXqf2dHmq9Z3b4+UIE+41Cj1Y=;
        b=M8gjI7g/AAja7xTcCasKUFvhH/HP6TJR8wNmWVvSx6SPpBRSYtfRml4OH2JQ6aH7bv
         FQdm/9hgCzdO6yMXSmVQIMjCUdA4H3TMJQfe/vKBPyfg5LxzpQazK0gtB8MG/t+oF+AP
         lkpc2kiLJELa3oHvO3Teo+tg3YJEJD6+PGNyL72m6XuhX503zXaP2+7d0TcowbsehYwr
         VI8T8A/oPUPYA3ChXZuSfA6tpXxT4tkcJDh/IsB/VsNwLIlaDP89JdT4pUfiZYnCQdmx
         YzOrvpomiVfiEib4v+uF5TVgdsmpZ8nShRMQ+q9HVupk70P73khInNSFl1GOReNEodiJ
         3H6w==
X-Forwarded-Encrypted: i=1; AL+hErF3uuLJi+/l7rAGsSb+W8VYo98F37HpqD8fFtFE4bqtHP1EXOrgnRIPc8p/uGmyyTOg1yj/8DQ75i31@vger.kernel.org
X-Gm-Message-State: APuU4Z+MUi+DhDEdCzVrjWm/IBy1K2ZtAmXA5uG2DLorQ7fx1TslAeiG
	eYxQ71OV0enrVMi+jTXgxckmD7NPMSRKW/QWkZ0vm5ooayR4xQ4s93jYq8pLCJ58fzo=
X-Gm-Gg: AYBFou2X4TA0GDTEn5xUTIzNLpZhdTESeYLTqDtohXUJQ2c3uzvQvomjpKWjmM5CGck
	/TPUKF8xXwmyDSbeTe5njHUIuhPz0cGfe29C+CsXlHwn7D8UKSLAgS+SiK3dBOsjsrttTcf+U2S
	Smr9+qEPN9gyPGcnaDezndVUIGaGD9gIMOLmJXw+BqDPSxOFLb3Wwf9CMdvdaFJfgQy6IyAKpnN
	bR2Khrukng9EOOEJXQ+WBH568GP9qAyuIoIt/W9uv+NY2sfRT5aroglaou6lkr2xF76CxlpHYT+
	6uqJ6gFhgWHL7fbzv8APgblmHdPw+iOX96WJVnRDP3oAoLo5wAmZ9M5Yy+9lc4mvZltciwBp6om
	qnv/ECligvbshqZTqXnYerW+tVDrPuSo5wrAWjDNfsq8uELOOy9jbSbLy9JNq6Y3jBjG3ahj8t/
	1lDnNwxPpSmLxv85FgD6B4UrAJ2QfRwyA8g35WbkMlMzbOXdzyX8kZP5hzzIZQSVdfkr9Wgl0yy
	kfnQp4lbWCv2NDzSkPxwRGqa8JaCkFFndklAXey5APeYJ7TArQ8WQjztiP/+ne/PnjTlf9TUAjs
	7yjFrtKLTVi6teBFyrcLwnHJRoqAAugSbUxbRLZCy7ftT0EQebp9Q4gSp5trEcaNsoaEF60Ly/R
	16pFy9y4HD0kzrQ965BzE87gqe0c=
X-Received: by 2002:ac2:5690:0:b0:5bf:ff57:b346 with SMTP id 2adb3069b0e04-5c003c44406mr1296500e87.5.1794000382152;
        Fri, 06 Nov 2026 13:26:22 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c00ba6e7d0sm4667e87.64.2026.11.06.13.26.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 13:26:21 -0800 (PST)
Message-ID: <ba22b7a6-83a9-43d3-9eab-93503e23a76e@linaro.org>
Date: Fri, 6 Nov 2026 23:26:20 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] dt-bindings: i2c: qcom-cci: Document SM8150
 compatible
To: mail@andrewgigena.dev, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261106-sm8150-v7.4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v3-1-0103e8a0bbcd@andrewgigena.dev>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261106-sm8150-v7.4-rc1-camss-v3-1-0103e8a0bbcd@andrewgigena.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/6/26 20:35, Andrew Gigena via B4 Relay wrote:
> From: Andrew Gigena <mail@andrewgigena.dev>
> 
> Add qcom,sm8150-cci as a CCI v2 compatible, with qcom,msm8996-cci as
> the fallback.
> 
> Signed-off-by: Andrew Gigena <mail@andrewgigena.dev>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 1e8def25ec0e..1e7a8efaa398 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -39,6 +39,7 @@ properties:
>                 - qcom,shikra-cci
>                 - qcom,sm6150-cci
>                 - qcom,sm6350-cci
> +              - qcom,sm8150-cci
>                 - qcom,sm8250-cci
>                 - qcom,sm8450-cci
>                 - qcom,sm8550-cci
> @@ -218,6 +219,7 @@ allOf:
>             contains:
>               enum:
>                 - qcom,sc7280-cci
> +              - qcom,sm8150-cci
>                 - qcom,sm8250-cci
>                 - qcom,sm8450-cci
>       then:
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
