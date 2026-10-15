Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875994EDCC9
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 12:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792065888; cv=none; b=GgnDNzZC9qXuwyUrPQGkRwt1bRn/2nL0mjIRNeXK64V3wmU9Zxq0dKE1wgq5WOgjX9ajxaDguM/a57VTK6kpUbbZXpQVwSfMdLXP9LoOIumUZpZhB8UkMx2sppJoUQ5acPGub7tjEHilFLu2yXjpM6bisjWzgXJaeVCrIoInYoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792065888; c=relaxed/simple;
	bh=AFxw+K7lzv7pYrWZ/G3VFcRCcPRi94Zq+V199RBe5fE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HvPlS+afHsi8yPMKKBefffiM5wHw5pYKL+Fy4NkkizXzS/FYpLs9yRAtwvmCNdjkdA9PEFXRvM3iiJ30EG0Hiomoh6rcw8o5Z04qZQBwHxiKkesYZxZQP8+6W3MYzXaidn0p1eCDRCbvihQLjdMrSVWe5VKTJtNkX69gdxl8r2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RdhsciG4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mwzwbw8q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RdhsciG4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mwzwbw8q"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jVWA2416867
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 12:04:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ySfCv8TU3dePxZNOzz5almNTjV7i8r2fPPb3Gn4l2cs=; b=RdhsciG4knO9l7ia
	jweiEwa03+Qzns6n8esY3/FnDnmrEWVztibX2tkDzrEbw/K7OBeqE153klWlGiDc
	RI8wjrxuMOp+xhmQTdmgJmHuGE2tGvM1mNRvJNlcvbsOOICL70yGcZJ3KrT0M32B
	hcz/vXbl5va1CsSLJ/9FbDMMhotYeDGZ9JbPZQMfA0gQYNGjP7BAoviczgeUf/ht
	wlmoxayeSjlgkzUTCZfUOGF1L/eEz2a9ai1ndStQjM/5XolR+iP4GQl+nBCBtbzr
	0qaxcf3vwamlFI+IFj2mGUPq/M2AWQgim34OtCQb2+Q8J0MHvJpk7rifmOuK/iEf
	E3GJAg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqdhhybe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 12:04:46 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5e97167fb2eso53620e0c.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 05:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792065886; x=1792670686; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ySfCv8TU3dePxZNOzz5almNTjV7i8r2fPPb3Gn4l2cs=;
        b=Mwzwbw8qS0jSM7DmgXPg1/fdydoOljUSmNr99vb2NCgYD8MMtBsxAyM6xnyOXXTj8D
         wXHKnP3A9xgT5B3/8xAr2y+9dDCiRQta9wm9uyKydgorfzc8a+1nWCmZijaDUWwT4MQ0
         p0rz+f/zkrV/bZWHKgC0pQHJihofdw3NbJ4bfEOqjBFja4tZ8wS/TKUMuk8mplGgVNdY
         xJenA/mmAcQg4VuswXPbmQ99lGZWyAwtkp0sigUjwhvcsa6ScdcdqqZqW6iX0M5kw3K9
         OMvyiDb5i+TDdPdRHgoZrmZPnDyD1lPHHfiI4sJ0p4u4L2kI2/XYCvobVMz0BOqNV/AW
         KJ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792065886; x=1792670686;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ySfCv8TU3dePxZNOzz5almNTjV7i8r2fPPb3Gn4l2cs=;
        b=A239o/vFGLnOmsn7LmcWQc+J/ONoiC9268Y4t35GyeHX61CVm7Xcp+h6xdixWFX1bm
         Isw7DNqFDiEizrqf2KCvXhAKiZDrPxCvfaiBjes+6IH0ShLWEtsLBsXtwy4V9FzlW2mr
         lWUDY8N73eINqYGkbA3DpUBLmDIySZi+UAjAVSRfvY7kLe+6R3j/yM96qakOr0ukMozq
         JCE/P7dc92+5dZGAbIseiW/5y6CasZzum+MC8OVC+9JeCHuPPomenb4v0useNEvtw7+o
         Ry0lxIBxCEAPk4xSZqwYPZtHbkuxAfbcTrwJ1NJmkXfDaa/6Vjh4StTa5GVgHEB7U8cK
         nSnA==
X-Forwarded-Encrypted: i=1; AKwUvBzRmtOAX88Wp2lvTCxYJQYovdEeh/6TNGfivNqvKTRiJmo6b0WKSaCtJe7CjROGbsg+aOFMhe8BJ7dm@vger.kernel.org
X-Gm-Message-State: AFq9FYIimtVvHdTeXvfw8oxRjfPwyXFA3es8xdviJQ6AKo03XtML20ge
	gb7v0xlTDVTilGIrXO5PHMNEjgU0K8DUo0zxD+ZpBNbT2lSyqEoVohLcOTbatJ7JI+26JJNqCtC
	lupgSMPZq+NhwmclP0VI2NKu86RayCakTiWozpfGQo/BRpSOG5OFCVLJus/vYr/tc
X-Gm-Gg: AYBFou3qjftcrgV96wk2J7tNsMvefw5IxuPodM/yWRJkVSFc7e6uS1wtwe9CISB45Et
	Vef0Yom4KmsEXrgkt6KENi1fvOM5xGQJSEidJjs2n+Al2Fkul/fOspWM+nQN0ZRQ55Q+zAzAvD4
	bcZ3/A5lOh9chWn0RXaoJ8t97O1zGn5udo+4aRBnAnBL60dG6O9RcqbU3LPVkDMX0WW5XGI5yon
	sG9r+Ec0BMrhSQEP2I3anNIx2ybjA2cAEqfT2G7TqvDTBPeA3E0Cn/wSxa8mGIwA9F1V78+VPGu
	ppuKzedceX1r827wa47nmzFXYYMNphiqqI4YJfnrbsaa7Zi7hCfaWOqYhAdwvn+jZTimWt0H5Dz
	SJpoi6eghGgGVAZK5nE56ow==
X-Received: by 2002:a05:6122:a5c2:10b0:5c9:fe51:53d5 with SMTP id 71dfb90a1353d-5e91f242088mr3878484e0c.1.1792065885571;
        Thu, 15 Oct 2026 05:04:45 -0700 (PDT)
X-Received: by 2002:a05:6122:a5c2:10b0:5c9:fe51:53d5 with SMTP id 71dfb90a1353d-5e91f242088mr3878461e0c.1.1792065885133;
        Thu, 15 Oct 2026 05:04:45 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda043b93sm115554566b.56.2026.10.15.05.04.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 05:04:43 -0700 (PDT)
Message-ID: <a940a7e4-95c1-4207-91d0-6aa5e715c2c7@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 14:04:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] mfd: qcom-pm8008: Add PM8010 support
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-5-b395d2b3f668@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014-pm8010_i2c_support-v2-5-b395d2b3f668@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0NyBTYWx0ZWRfX7qZDfMSsrctl
 uMKFUkL4yIHusqL6P97Wod/lmhnwesSSvHiEIEZ/aZFxNvEC33+Gj94goK+M0Dlhm5jrTnv+EuM
 DCwtP2Uu+4T0eReXR6tNW28hMumFvofuEF8MS6T7Su/ZMM7EAj88DGj12hAg+mZudWB/M9M00U3
 TsSEudQrrKkl+J8Y2H87mOFZ5/KTD12JNfosfjU94PLLR80y9COUmTWkRZacMGu3HmbyOLfG3n4
 M4qkk9VLiF2WWeSURMtfQAfw6A87/Zy9o7FER+7cMBkiDUgsjNDMBi0fB9WSjNGfSkL+wpuJhOu
 X4lBQ0QwE5bLVh5WLp8UD5XaJGf5N4NNYh3xX9FD9RiehA/zn/I2+PS2dAg41EhbJ/XsgMrmVsZ
 rC4nj61KnY/49w5uVwMRyQK9NWfWM1Yv1N5CuClASqmPQvj/kD3/0Hrk0vLEznhjFGKvCCECFoP
 DtwmMIVI6Vui0KplfEw==
X-Proofpoint-GUID: 5Dyt-ed4lCvaCj1lguyzu8sOXi4e1mHB
X-Authority-Analysis: v=2.4 cv=DeeCOftW c=1 sm=1 tr=0 ts=6ad0c15e cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=UejlFaKpO2bYa5uMUq4A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0NyBTYWx0ZWRfXzHJq/u5tDOIw
 OL1EQBzXeUoAmbhGGcWUgS3SE98H2QU9YkMC7tm/zMJrL9kVp5OKB+55khx21dj1L8v3Lvq+GYG
 lNghOJ7rsXkNUT4xkTjYG6UEf8TwZ4Q=
X-Proofpoint-ORIG-GUID: 5Dyt-ed4lCvaCj1lguyzu8sOXi4e1mHB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150047

On 10/14/26 12:32 PM, Jishnu Prakash wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> PM8010 is effectively the next generation of PM8008. The device is
> generally designed to serve the exact same function - power camera
> sensors and the associated supporting hardware.

[...]

> +	pmic_type = (unsigned long)of_device_get_match_data(dev);

I don't understand why you changed my match_data_struct approach
here just to reconstruct the same data

Konrad

> +
> +	switch (pmic_type) {
> +	case TYPE_PM8008:
> +		irq_chip_desc = &pm8008_irq_chip;
> +		mfd_cells = pm8008_cells;
> +		num_mfd_cells = ARRAY_SIZE(pm8008_cells);
> +		break;
> +	case TYPE_PM8010:
> +		irq_chip_desc = &pm8010_irq_chip;
> +		mfd_cells = pm8010_cells;
> +		num_mfd_cells = ARRAY_SIZE(pm8010_cells);
> +		break;
> +	default:
> +		dev_err(dev, "Unknown device type: %lu\n", pmic_type);
> +		return -EINVAL;
> +	}
> +
>  	dummy = devm_i2c_new_dummy_device(dev, client->adapter, client->addr + 1);
>  	if (IS_ERR(dummy)) {
>  		ret = PTR_ERR(dummy);
> @@ -233,19 +293,20 @@ static int pm8008_probe(struct i2c_client *client)
>  		return ret;
>  
>  	ret = devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap, client->irq,
> -				IRQF_SHARED, 0, &pm8008_irq_chip, &irq_data);
> +				IRQF_SHARED, 0, irq_chip_desc, &irq_data);
>  	if (ret) {
>  		dev_err(dev, "failed to add IRQ chip: %d\n", ret);
>  		return ret;
>  	}
>  
> -	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, pm8008_cells,
> -				ARRAY_SIZE(pm8008_cells), NULL, 0,
> +	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, mfd_cells,
> +				num_mfd_cells, NULL, 0,
>  				regmap_irq_get_domain(irq_data));
>  }
>  
>  static const struct of_device_id pm8008_match[] = {
> -	{ .compatible = "qcom,pm8008", },
> +	{ .compatible = "qcom,pm8008", .data = (void *)TYPE_PM8008, },
> +	{ .compatible = "qcom,pm8010-i2c", .data = (void *)TYPE_PM8010, },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, pm8008_match);
> 
