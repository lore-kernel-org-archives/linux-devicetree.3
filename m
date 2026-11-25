Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795613321;
	b=dgWZIhL24rrlYQOuQpCHEBgCPTniEIE1KL8PIFFjwqiWjyCMR8mUnI7989WAHhUeXLDi
	 6zo+RE4yWmkOKSRqO7LlOYMwppyuPPCZoAZby6IP84ZGkPONI5QDtBZo3UWiAnaaxk9xj
	 QrchWcR1AVQBfqGccRU6GXi3qyxopaH+93EJrU3JIjvXSinMHw+6HawF5CZDxxVUWRIm4
	 JmPIsCTj6+l5fyNTE+UqgDBqBhXGTCTQxaTamnWhugqtW5HvwKhniiSTYTShjo0I6I1pV
	 LJpnwS6QlFl2HUtuocFktk2a2TJM78Owz6Z/h2CIrmlSUijW4CxXkopBn+VOKmC9jsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=AdBqif1XdprtG6YwyZi9UA3LL5Dre8swdPb1+TR3fvE=;
	b=tMXYlFbbpGdbluoHt/NNEnocoBU8AJq3E0jkMvgGWPNrUXjh6E2vBa39nrqlCIdbsHuR
	 eE1EPdsE/esaqHimOCqwD7wAhPSFGHHn0xzWLKD65qwacNydO87KdDSYEoRHBOH+1P6h3
	 BK0pNsSHC9mV4uXsFACBiIFhpROygmbYC9f2gKwicRNV2RTpA2+1/ovARSQIhKfDKYeFt
	 F2er90sX+abrZQAV0hIrpr4f3ZDyZH7xjrnl6KL6HyR7Jmy22oaCPW3R+iDpx6uGQUP3O
	 Q4UJ1e41+7lQ5XAgfJwcAjt8/qZJPDeWAh/OW/juVqkJDT9W6AKU8yTiFZBNh6VfNCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Lc98iv8n;
	arc=none smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF95606A326
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 13:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFF95606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Lc98iv8n
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5c14b6ac47eso735148e87.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 05:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795613319; x=1796218119; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AdBqif1XdprtG6YwyZi9UA3LL5Dre8swdPb1+TR3fvE=;
        b=Lc98iv8nhLEW6JdTzd/vHJpSezeDJHH6M/66PZ1oXpIor2ipcSI2kOuCTfZkI3fQLA
         ZGHKgfCKDJwOdC4Hs8i9o0Fn5riETmKP8hc+edIRV6EUGqW3cBmEuA77uoWleYlzLIXd
         b7iR50U/1vohH/C6Yj+7N6aTLNBvKvLLKI8mekY770Gs/3Z8IOH41zI1+2qjOzAIsb8O
         N+6RdLiQvvPVU+0p9Y5sLoDSUZgZTjJc+9H3sph8aQyVaiSurPMSS9ncOiAy3PL/ts67
         bncGENx5GHzrxq+3rVTNmlKUWUTclbJ+VOpsyi1P4MhOFI+fQs0oJ3HYa8O52Qoi36IJ
         IX4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795613319; x=1796218119;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AdBqif1XdprtG6YwyZi9UA3LL5Dre8swdPb1+TR3fvE=;
        b=QwhVbR/JbgWgvCCsrbkEk0QZS8fQ1UeU+fKaZeVzvFD+z+FlyNAyUCLLcIa3Dde/TV
         LZQFpFNPy1T0XJXlnMv28gcCA4e4MEwWGhFs2R7R63CCYQ+dN5krV5vw31b+8o5k2QNw
         OKn/GHQnfn0ouvuVqySypz4bJRX+t1NjK/GL2mqc6lUm5eI48ymZ0jx4U8uvAenqK202
         3YKBEWcLWIA0Qt9SwbqaKbQyY1JRekTr+xcTeLbrLyqEsztVpHFLfYZL7vFL20E3OFCb
         LIAGq4VIrkGKKrzMyxwQXT885CKLcCmi/LLWAIiWmMc9p9xSBjrV7EcWVd3wOwu96HYu
         9W2g==
X-Forwarded-Encrypted: i=1; AL+hErGG71k4EQplfsEIO5yM1ac/0SEsWwripqZlsoyeAH4gGYcwj7477KI3qCF7X15jV+qMM/++WqmQvfmH@vger.kernel.org
X-Gm-Message-State: APuU4Z+mRlu7EmHtEz+gpoXoC4Pu6PvcpxrivN1C/UmY9rDBfUTHc9hJ
	TDeyv8NRla3u+eS/QU6GqBWcB8YZOdnx6ZsfyDjFSqBEqtK2CuIOcT713VDGhITCLe4=
X-Gm-Gg: AZFdTZfXrO1WE1NpfvpEBGFwfZzPNO69rEcFNEntkwCC4OqXbV3d6tF3Pctr6g9mzsS
	7qa9JHHhD4VXzHWxSGxMVsTabgEoOoR8duQrt8o2DcTaSG9Ut2UAg1sML+7Eu/7vutiVh0L2Djy
	SpPCfAlxk7O73XE5pjTFPiEMUc8SRt9vFTkAadCZts8A1c6UFmDYVOAV+MYwL1lKDHSQdMnCfMT
	dUgilnRCc9PGr2WgAmCBtAE6f5M24KkWMmzo4+E7DbnoaGeI/1hlD5tuDmIGDD2TMh9Dp+z8Jlg
	lN3XuWNmxXeA0OnRbChvDwYTJp5VNqOE2z5VaOdKCOFpQzN//joZ1oSX6td6c7ixJZ0k0njuM7e
	rRESm1vnioIkt5phzntU5XySUcN66tGEUcqiH7fDKrJbm6z5qUtW7yyr3nyDoFZ9obRqF79ZAkA
	/lNkykW739opMCUcViOpOPlf8/+hgEaUSvXLcv8mNr6Ux1CCE2mt79uQobTFaWe7woUdlJ1BnQc
	fk7/eyCkN03OOSR2Dy5TL7KGkdHKBFkxqIqraXTIDU9YeRSLFfw3Z+kzwqqROOONA39tmsxxOZJ
	e7nAMw/AMNhNDOJyAJ4ZxtzcGEXvbVbRM4zlRahMXvEEcyZldRmsfjdktxyjllcEzSgtxB1bOXD
	VUjnwd4Y=
X-Received: by 2002:a05:6512:2514:b0:5bf:a66f:e5e with SMTP id 2adb3069b0e04-5c1bc57989bmr6590468e87.0.1795613319090;
        Wed, 25 Nov 2026 05:28:39 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcf333bcsm4683145e87.2.2026.11.25.05.28.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 05:28:38 -0800 (PST)
Message-ID: <a2010032-8750-4289-b443-3afb57d656e6@linaro.org>
Date: Wed, 25 Nov 2026 15:28:37 +0200
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
Subject: Re: [PATCH v4 3/3] media: qcom: camss: Add Glymur compatible
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
 <20260925-glymur_camss-v4-3-d7c2983d6d7b@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260925-glymur_camss-v4-3-d7c2983d6d7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Nihal.

On 9/25/26 08:48, Nihal Kumar Gupta wrote:
> Glymur's camera subsystem hardware is a functional subset of X1E80100.
> TPG, CSID, VFE, CSID wrapper and ICC resources are shared; Glymur has
> three CSIPHY instances versus X1E80100's four.
> 
> qcom,x1e80100-camss is not used as a fallback compatible since it is
> already claimed by its own binding schema, causing a duplicate
> compatible warning in the DT schema checker.

This sounds like the DT binding documentation shall be fixed instead.

It makes no sense to add a large number of new compatibles to the driver
code.

> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 23f3cc30a15a5e098162bea98ba69fa636abdefb..9954a99981004590d34c722337bb6510fe759699 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -5751,6 +5751,7 @@ static const struct of_device_id camss_dt_match[] = {
>   	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
>   	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
>   	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
> +	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
>   	{ }
>   };
>   
> 

-- 
Best wishes,
Vladimir
