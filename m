Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622169;
	b=QUprVZaSm5OU8UuFoKaunU4X7FaCBH+whXAU87k5uTZIZZ524hu0KKggtRRZ49Vx7TfO
	 Har0W5T9nSMUwpNWmjeIq4GLP5rMDeVoWVOiTeyg+yTbstehjBkCP0DhYbvNLGhcFlLyE
	 JZQWjUf8vito6VuokMAtKk2o8xBiKyhbPNXCAqJ7DPZ9k1prDNPv9ODH/obJNUoHSHLKC
	 pfeTql3VRaKM62GQlVHeJqy9DGE8wjxaz3Rpt76jUomSe4ZpyqW9rJQX/vzAoknZ4KD4L
	 PCn71os1nqBuxk2vjugTq+XhzZ+lhPtBgkibHfz3R3euUoaLQYYJ1AOEjy8VgxzOLqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622169;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=kmQzGUYJq8GyqElmnF+m9lGa7P1/BodBcOMVYUFmNvw=;
	b=4UQ4EVV+l3xO6GkTZWCH6xxmwFbTIA/jyTB1yFaXZUbOtO5iSmE7JKauWxbflziPPtYb
	 6vCScNR9haLs61OpSN+q4BH9PvvG8HGJAsbCswh02vJbYww3CacZLa0vftX8AMMNyzQvE
	 tkR3wWFnQEvSVxXZ5iGTzMEZcA5ia0vTjcmF2kKrY/JP2MLOV4GT5tO6BuuE0U8IRbZ6z
	 DcZPhvEHO1PLqpZvCl+wjCmnRd5lipSaB2Q5DbeTnPBA6grP5sEZuugmDtRXjQ/QiyWbl
	 1SIORRFkdWmqTYp+biucl6cRFBxtpcdZcdKD3HGfVyQAQulAht94Z2NXkp6D/lKHlTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="hD/qB7WJ";
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38CC606A330
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 12:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C38CC606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hD/qB7WJ
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso428065066b.2
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 04:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793622167; x=1794226967; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kmQzGUYJq8GyqElmnF+m9lGa7P1/BodBcOMVYUFmNvw=;
        b=hD/qB7WJtkPSzakBjBrg0ErLrQbefMeN50hPSmPc4DKcYcJYvddKvLdIEpAyKkA6zU
         ZnSw79AKQKyL9hZ26uuMsJRLlRUYP7+uoRG6f0DtD/D94HWijt4yN1hxkR29rhYaG0E9
         3HNwIij6hjEnZ6teA6Nyc+Ng1oQ0MwGwFAK2RlXjGxEJdXZeM0ubnC9b4rAlBiwTVyDh
         ZkocKd/uKbHmcQZnb/aB19Sd3MdfyQFLktM7R1jfsRUXyq0LLPa0d1IeM20C7BJEZMA8
         bpTRQMW9dtw9SkvGNyVFd9h2FA+D3h81o2LVSoNbGQd5pxzHE28FYlBPal1IIrFs8h0L
         IjUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793622167; x=1794226967;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kmQzGUYJq8GyqElmnF+m9lGa7P1/BodBcOMVYUFmNvw=;
        b=c8Omy2LGcKHL36sAVrGKaTb+JTf6vnXcbq0qNcKxujOaWP59AOG74aTjloIn9hu5lE
         GPVAaUYdgdvoJ2QhnZk8cUEw2SNAkNiuLL7Z4kfOhs2kQulq5Pi0dG0EjimveBpD1XgZ
         H3kLrF1A2G2iM7MYnE44A7wVzW8Mxpm062zr+N9lzkpMWgk2Fa5vXxy72hN6u6SVawyO
         M4J7rikuVqPbfrjsR3uO9fIyzg62n4OYeMw2Puh/4eBFjaPCVYuO2vG4foEjigBuD+T+
         5izijAVSMLGep3vlGJd5Rr6+FDxvqDDUD0mg+EpwAFwrSdjMYb5sJkJihbmsE+4p1H1v
         e92w==
X-Forwarded-Encrypted: i=1; AKwUvBypyV7tFj2PHI/3kerTiCeIt/rHEHocQvTpUZc4Yb/+3iQlO5vge+65BGbIvKitQSZrm5cVV3Gvbn75@vger.kernel.org
X-Gm-Message-State: AFq9FYKYRQ7HGNNPaMcEICmBR5JmI2o5IWLIDoc1dqeRtDlkN/zL5ppg
	L/NotJpeU7sVZJuVoKQ057h5c8T1goo/32ldvh7cHsfBvNMR4IW06bC4YDoAqIx98S4=
X-Gm-Gg: AYBFou2AuZjLx1VQ8kw2osup5hCYBfxCIpmMIwMF4bFbUKB1D9e+l+kzxg9/qVbUvKl
	gPPvz1SuLX9gL1+soqmYdt//gYF1BdZd4woeCz/Io2CXkxKhAIGSmT0HGQ49Y6HEHEPW6w3FhbW
	35HuR5InLiMG4L3BBfSq/n8jxROwvAYSrbVIfVR0KMGDAFmoywHO/DTNTYkoXnFR02MlyK6j7rg
	WrkI/8eKa8tWDjUdyb37cHaRaQckZh9+5C9E/a/OGy7CfyRnP+EknJKqZiPXXvMZmFtZxfyDjjL
	8qHJ8r3syvTampGMC1o7WoeHBNNqslpSAwVpygSBSl8xVC7YdlkSwSia+Lp/u/c7B5SRoq631mg
	rH8nTI6kF+0D3C4Lpjc13oIiTjLxq7plLe74cc5ribOzMancYvYUbKqzLzY6hSC9712gnwf3F0R
	HjPWjtGh4t1S1oBBKzdX8BEEImOBQXc1Y1B7iP0YNjMxdDo4T127UQunyFXoOVMmfHvSmsGipIn
	BmeyHPNJXBvVr62a4Ukb2lLxhPbJh66qLhGxdwi1+zv3xHP8kkH9gg4wnRliOABOTrCnjnOEiYO
	RElWIvy4PSSLtX5n+ofkj/g16bQK73km1S7Hvw==
X-Received: by 2002:a17:906:9f92:b0:c29:4915:83cb with SMTP id a640c23a62f3a-c4ca7ab09dbmr821664466b.39.1793622167110;
        Mon, 02 Nov 2026 04:22:47 -0800 (PST)
Received: from [192.168.0.167] ([64.43.42.35])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc19167sm384387266b.10.2026.11.02.04.22.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 04:22:46 -0800 (PST)
Message-ID: <cb4fbc79-d72b-48d4-962c-479e4ebc7e51@linaro.org>
Date: Mon, 2 Nov 2026 12:22:45 +0000
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
Subject: Re: [PATCH 5/6] media: qcom: camss: Add SM8650 TPG support
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
 <20261031112203.545319-6-vladimir.zapolskiy@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261031112203.545319-6-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/10/2026 11:22, Vladimir Zapolskiy wrote:
> Qualcomm SM8650 CAMSS contains three test pattern generator (TPG) blocks
> of hardware version 2.2.0, add their resources.
> 
> CAMSS TPG on SM8650 needs the non-real time CAMNOC AXI clock to be enabled,
> otherwise VFE receives the frame start event, but no data is written.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 53 +++++++++++++++++++++++
>   1 file changed, 53 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index cf4687a20dba..9eeb7e4a7315 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -3423,6 +3423,57 @@ static const struct camss_subdev_resources csiphy_res_sm8650[] = {
>   	},
>   };
>   
> +static const struct camss_subdev_resources tpg_res_sm8650[] = {
> +	/* TPG0 */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_ahb", "csiphy_rx", "camnoc_nrt_axi" },
> +		.clock_rate = {
> +			{ 0 },
> +			{ 400000000 },
> +			{ 0 },
> +		},
> +		.reg = { "tpg0" },
> +		.tpg = {
> +			.lane_cnt = 4,
> +			.formats = &tpg_formats_gen1,
> +			.hw_ops = &tpg_ops_gen1
> +		}
> +	},
> +	/* TPG1 */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_ahb", "csiphy_rx", "camnoc_nrt_axi" },
> +		.clock_rate = {
> +			{ 0 },
> +			{ 400000000 },
> +			{ 0 },
> +		},
> +		.reg = { "tpg1" },
> +		.tpg = {
> +			.lane_cnt = 4,
> +			.formats = &tpg_formats_gen1,
> +			.hw_ops = &tpg_ops_gen1
> +		}
> +	},
> +	/* TPG2 */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_ahb", "csiphy_rx", "camnoc_nrt_axi" },
> +		.clock_rate = {
> +			{ 0 },
> +			{ 400000000 },
> +			{ 0 },
> +		},
> +		.reg = { "tpg2" },
> +		.tpg = {
> +			.lane_cnt = 4,
> +			.formats = &tpg_formats_gen1,
> +			.hw_ops = &tpg_ops_gen1
> +		}
> +	},
> +};
> +
>   static const struct camss_subdev_resources csid_res_sm8650[] = {
>   	/* CSID0 */
>   	{
> @@ -5786,12 +5837,14 @@ static const struct camss_resources sm8650_resources = {
>   	.version = CAMSS_8650,
>   	.pd_name = "top",
>   	.csiphy_res = csiphy_res_sm8650,
> +	.tpg_res = tpg_res_sm8650,
>   	.csid_res = csid_res_sm8650,
>   	.csid_wrapper_res = &csid_wrapper_res_sm8550,
>   	.vfe_res = vfe_res_sm8650,
>   	.icc_res = icc_res_sm8650,
>   	.icc_path_num = ARRAY_SIZE(icc_res_sm8650),
>   	.csiphy_num = ARRAY_SIZE(csiphy_res_sm8650),
> +	.tpg_num = ARRAY_SIZE(tpg_res_sm8650),
>   	.csid_num = ARRAY_SIZE(csid_res_sm8650),
>   	.vfe_num = ARRAY_SIZE(vfe_res_sm8650),
>   };

What happens if we apply patches 1-5 but not patch #6 i.e. if we have an 
old DTB ?

---
bod
