Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672795;
	b=aBZBgu5gjzp4vFNIF+TLi4z8Saz7ktle/8OuqcjqM+XnTRCw13ZGFYECwDRfb5ItTBwR
	 tl6cJP0r8asgbVoLP8XGNMn+byyDGRdXrI97eon/L47UCH9jGba0iWxjh/egSCNe7OEI8
	 17sx+QWd+MD5aM5rsnc/yIFcHE2ZISj1/1ywLrm1N37PPmY6eY+WKc0nBERjZESTjNSyO
	 PHhMGC1bGQIc5FSqRs7OuC78uc3kMG50ecWVpi5ijQQjmuk52a4T/gf9plMTQDW6mLWHP
	 jxSveuXcshqEZrp7IyFB8i7TGovHhzpsQiGs2CRwq/KRR2K2yWUd9RTGmtdXSlOVEEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672795;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=k2IRBl9gY5e2oSUNrEWY6jjQeC8ZZ1pQO6bdpjOXj2I=;
	b=vJm6pnzC3EfWgpznLCtf3glppi+0hzcH8WQVg/lbis74FIByjJb+ALUxPlzcJ73C0Wn7
	 rt6rEqV7+pEdpXGFsMt1qnZ2utmbePF+kt2QLyKcf/2eEGh9g9Mt6YMZu/6OcZE+Rm24Q
	 p9HEvFiTDtxfkabuOz89rT4xs6rtAhgMZJXX13TKdqY33uSrN0vtzcDLH601L26JhsFwZ
	 37fegsQi0m/A4PnsSF3waNxQsWnJQ3++zLl4l9OE4rxzfLAkru14ubRihnTBotQ/sYyHG
	 nza9mjUw9KVyjz5zj9S4d4KaOkFylV35MP4cjRr23Z3kg2H320O6eo3JdJ4Lurov34w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eXnfkOdx;
	arc=none smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19BF606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 05:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D19BF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eXnfkOdx
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5c00b0866b0so382031e87.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 21:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795672793; x=1796277593; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=k2IRBl9gY5e2oSUNrEWY6jjQeC8ZZ1pQO6bdpjOXj2I=;
        b=eXnfkOdxJc0Gj7vmJ8rNyjwrixGiB80YcEjr3kfxXXWycGgRixJo8zxbnIzNFq3yNc
         2mMdoAgIIepQ2rgKnIcqF0K8Ll9eeCF+H+HCXTEzWIn2DGA2jL4fMrPxUFQy3HCk3Xho
         YM+CEtXOh/+YQemc6c8XUTfwL7cc73Wxn5BAxKVko7gF0qH8FaoP1GFQFthtGnYhYhj4
         v/6KADYgbLYCA3z2UPDOvPzdlYW2TEnWANnnfLA9bWYQTYBGWmyjVSZkSQtsixl6N+8z
         7fuqCjnuZdhE5DFOtA9to/FYLZvKfJdwZDx64/SawBHM+x+VrPGbavm2BWt0jy8yf4eq
         00cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795672793; x=1796277593;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k2IRBl9gY5e2oSUNrEWY6jjQeC8ZZ1pQO6bdpjOXj2I=;
        b=wRjyyQ3R+3icFiIdtFu47QNNUC2D23xaZWKxaZXWRmSh1gMThh3Uc1a2SLdwZbj8ga
         AnCjly/Ehrl9kRE0QWs2U4WmdS+SAFb/R/wV/XlD2QNlkaWsp9n14UcV4OhRHMAn/N4j
         Jj3CAlPculNrTYUnSi+GmhwzcE9FKzDC8WI919OdmcLXjqNcGJx5XPzlgsnJuig8oZbR
         DWUDe+6b5E3sS92A5k8BulXkx9x+pX61nuO32HHmkvwN8KiqzVN+4s3WjVoaaw+hnBpO
         uU9/r2Yo0gNup4ZQHv/MRNNd+g+MqPokivxHHBOL0EHjzX+BMqWyUTBseO1VENMtmEhs
         YqBw==
X-Forwarded-Encrypted: i=1; AL+hErGQONQG9b67b62GUHoCW30oY/MImQm7BFRaCk6iv4sGLfnAVORXvwZUZzhANYlDGwLyWiyGU/Wv5rAb@vger.kernel.org
X-Gm-Message-State: APuU4Z+dbmY71g5/ly7AUTLpcMqRkKSzqqK5QMRJbwQ+j/A36ijaLDu5
	1whDW6Mt8INjT3i1mXNzJX8KfXCopzfUEW42Y1VZT0k+kxnoyFevsaXZTjGC+WHaDtk=
X-Gm-Gg: AZFdTZfE6EgARzYXjx7umdC30CEasEulnx/JnLGaC31uYVCN0TNVlcs7yITwtxhVmqz
	XbYB8YgYUzpMccx1STnoR5LpK7VcKvpPhdJfxsXiov4MxPdf0UW7wNxa2OsTHLE74izKYDazAeY
	vOUSG7ikg/k80CANyCWkrtxOPaMADTwuE32b1VxJAxkP8gg2mmNv/vxl8rJ3jD1T5yqq5qLbyxE
	Px6fvk4IUKFw01bq+ry3YJm4IwpjYm1nk3QKXOCeitCPMAVuRSLBcFWBhzc16a/KIq8D2B6vIYy
	wt4K/+Sd/GDVFfSrCkFnM3v/6mC4qKO95qbYT7y6Azvaw/kzOGlpsZnvwU1knH+o6nlBvUjuTou
	6LIZp6iDdLnIKFA5Irt6sCi/BQWWjX8Yrr+2sbh9iojbeuYjFYPyQ56qTiGJ5DNHQdE53MbT8Dr
	Dl7W4KIdWXBsIOELxxsgRibmbpvK73LD6ozyLqDzIaCyIxkqWfgEHEalGWkdO61t7W7wPZxC+1T
	H1nCRJcPiRElBZyI/NV9Hu2AzsKwn90/jdHMEsQFwXfSDj5DrfYcaclBqhF9/gD20bAk3/kvPUo
	xcv3fshgeph6R1AVF744yzSsvF3zXvYXkTLzksGA3hV4q1HQ7vX5Nnr1qthLxznZ7IZPUjrKAuO
	M0C0N/BU=
X-Received: by 2002:a05:6512:12c7:b0:5bf:a48b:7827 with SMTP id 2adb3069b0e04-5c1bc6bf385mr6662753e87.2.1795672792982;
        Wed, 25 Nov 2026 21:59:52 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd01b3eesm5192662e87.42.2026.11.25.21.59.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 21:59:52 -0800 (PST)
Message-ID: <6d7257a7-92dd-4a1a-a598-9a4cd2be6e2e@linaro.org>
Date: Thu, 26 Nov 2026 07:59:51 +0200
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
Subject: Re: [PATCH v4 2/2] media: qcom: camss: Add Glymur-specific resources
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261123-glymur_camss-v4-0-d7db74f59e22@oss.qualcomm.com>
 <20261123-glymur_camss-v4-2-d7db74f59e22@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261123-glymur_camss-v4-2-d7db74f59e22@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/26 13:36, Nihal Kumar Gupta wrote:
> Glymur has three CSIPHY instances while X1E80100 has four. Reusing the
> X1E80100 CSIPHY resources also exposes CSIPHY2, which is not present on
> Glymur.
> 
> Add Glymur-specific CSIPHY resources for the three available PHYs while
> continuing to reuse the common X1E80100 CAMSS resources.
> 
> Fixes: 09d6c30d3fae ("media: qcom: camss: Add Glymur compatible")
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 42 ++++++++++++++++++++++++++++++-
>   1 file changed, 41 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index f8e5cf9f3ff09e96d3b48cd5628489715385cc5c..f3cab9ecef04273e09b81ee0cd4e31ca45d1c915 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4103,6 +4103,30 @@ static const struct resources_icc icc_res_sa8775p[] = {
>   	},
>   };
>   
> +static const struct camss_subdev_resources csiphy_res_glymur[] = {
> +	/* CSIPHY0 */
> +	{
> +		.csiphy = {
> +			.id = 0,
> +			.formats = &csiphy_formats_sdm845
> +		},
> +	},
> +	/* CSIPHY1 */
> +	{
> +		.csiphy = {
> +			.id = 1,
> +			.formats = &csiphy_formats_sdm845
> +		},
> +	},
> +	/* CSIPHY4 */
> +	{
> +		.csiphy = {
> +			.id = 4,
> +			.formats = &csiphy_formats_sdm845
> +		},
> +	},
> +};
> +
>   static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
>   	/* CSIPHY0 */
>   	{
> @@ -5572,6 +5596,22 @@ static void camss_remove(struct platform_device *pdev)
>   	camss_genpd_cleanup(camss);
>   }
>   
> +static const struct camss_resources glymur_resources = {
> +	.version = CAMSS_X1E80100,
> +	.pd_name = "top",
> +	.csiphy_res = csiphy_res_glymur,
> +	.tpg_res = tpg_res_x1e80100,
> +	.csid_res = csid_res_x1e80100,
> +	.vfe_res = vfe_res_x1e80100,
> +	.csid_wrapper_res = &csid_wrapper_res_x1e80100,
> +	.icc_res = icc_res_x1e80100,
> +	.icc_path_num = ARRAY_SIZE(icc_res_x1e80100),
> +	.csiphy_num = ARRAY_SIZE(csiphy_res_glymur),
> +	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
> +	.csid_num = ARRAY_SIZE(csid_res_x1e80100),
> +	.vfe_num = ARRAY_SIZE(vfe_res_x1e80100),
> +};
> +
>   static const struct camss_resources msm8916_resources = {
>   	.version = CAMSS_8x16,
>   	.csiphy_res = csiphy_res_8x16,
> @@ -5806,6 +5846,7 @@ static const struct camss_resources x1e80100_resources = {
>   };
>   
>   static const struct of_device_id camss_dt_match[] = {
> +	{ .compatible = "qcom,glymur-camss", .data = &glymur_resources },
>   	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
>   	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
>   	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
> @@ -5824,7 +5865,6 @@ static const struct of_device_id camss_dt_match[] = {
>   	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
>   	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
>   	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
> -	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
>   	{ }
>   };
>   
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
