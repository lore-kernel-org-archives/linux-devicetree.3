Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9FA3F823B
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 07:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783497479; cv=none; b=s0F3VUYXtAmRJPubh19zdgHp8IHgZY0QPYda6YY67CM+bEOOV0b0/kgVVAVzncXik1sKV7HI/BTnsCIEMGsHCUqT+u4dQinhEXyu9JKRYV5zw4ev6K5ZrItBPdjstTEfm4DEiUHte8h0pXTJ63DXOo1pHVZO8nwoO1VbtfLkSYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783497479; c=relaxed/simple;
	bh=ZRGHs0a+qfDgylSMx55EXpetTauglfrAaSbb8C+lrZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UHftmUUqd/HuP/vsYSgPwOsOxsqdLM/jLRltj3vB7j/nqw7S4ii3/LfpU4yYyxZa+goMKaxfUy42N2+bqSxOH5IY40TEqS55fj1apvkJ3jhgBDr6O4s/A5apd8yr7TFvzkuwfmrQ3+0LWvPKAVFERiuQzBRzxiCwQbUToiaV/f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PU8/vcfK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AC/ZSxOo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PU8/vcfK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AC/ZSxOo"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842AgA1572654
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 07:57:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b7/2rDe+YZrShkh7k9aN4OtrvlntieYHsD2DsjmlTmQ=; b=PU8/vcfKX1fo/ZQN
	aSsgqS1xBjpwT50Ehq9MywKxYew7GuuVud2x+EJFdcWbhVt5gIgUK1FveHNMcJfA
	NZcgkHBdijXOthlq1zcWte0N1foQBZuYSZ2I70m+soHuyONBf43MpFPK+FhJea+f
	T5KhO3cwB0gbyyRiQ4wuG9uMO79Sb5KlhP7S3PCTwu5k8hPMwfiJN50+P4etLpJP
	RRReNGbtq38FlL//rHV90H4bgUka3wg5IJJufNGOpSVFGjUphOCbz6uMLPYSuwS/
	xonu3Z2oz+la24pdA+ftfVujCRexTKGd7P+AqdWHETwsA6vDZttUOPRwKGV52SCI
	ynk1pA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f99hgt3c1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 07:57:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92ec3146553so81645085a.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 00:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783497466; x=1784102266; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b7/2rDe+YZrShkh7k9aN4OtrvlntieYHsD2DsjmlTmQ=;
        b=AC/ZSxOoOnRNn6MtIcItUbHyaNzblx8uU3MNIhZPhx/I/XXL6e/BG3L1kEVn6Nv4HB
         lUEqYm4W1KGIqgE8ykpOkAMqHlkaSZG7XWWdBj0OBJWEHkerNUDIhLbcAWl8M6TEpEUw
         itjLe/MDlm8EHnIjNib0DpObF2jpvsbdg65Yc6F+dbXT02MUG0+HDSoDhEofhZzw5uvg
         p/vEhKOFHk6rOXptYJMU7BtDZ76TVVExrQlTMRormDpCC+QpA78ZPJXfGLkqUsXq40H+
         pqn3IWP7PJsiTAPr9rmrH8DTiv/Bg4pl8JNE1vLNrtsZJHZjYFnrhLn9OSSts2XMiOxf
         JF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783497466; x=1784102266;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b7/2rDe+YZrShkh7k9aN4OtrvlntieYHsD2DsjmlTmQ=;
        b=mID4yEOnrmkD+JCRx+jogMQp3DyDt8cpwP2787DEncVrsP596FTOUGuAaE+ZcvGThF
         d59ZDXZ16THlCHh1X3TNew/4EuG1r0yQO3ktsxjs3VqIq1Jxxd4WcqMjtJl6RTSQsttq
         0NizJ1RaxNFrZb8X696N/XEFNUuQt+4K50Hj72sS4vHD/1Plscf770pplPsxSZhN+tP7
         eoOAf1QOM2GYrTSv9oOCkxbvKQ/SUbCiuT+lQtErm9EZSDVqs7KJy+zpXu2fDMnvmCEW
         7x+CelwhYr/1m8E0Q2+XM/dY2DbK+YuTu6U28et+c8OO9pcOZFrI8WLMPeGg6tju8Vrn
         FYVg==
X-Forwarded-Encrypted: i=1; AHgh+RpMtbc+R6FXMCdKB7hW63ZmpFbpze4JWcI5ByWKE0aLeApE4Aq6ToInk6qM5hAIEbo9hKEHcx3iViFY@vger.kernel.org
X-Gm-Message-State: AOJu0YxQrAEByrurpXJOnLmWA1hgpjkyuGhwH8WcPHe9GfC8NGwrCjB2
	3q+9EbaQM36yGSJOQIgIeew1kE9C2Zi+GOfOQTBNZkZidq10Rb6vKK1xZgjn7j4r0ycZXmkydwF
	/ZGRBQKzQf+uT0jAk5XJGTCK3VRXD6gh75GHybjjszniY4oqBB1sEJ8FG1Kv7GRAJ
X-Gm-Gg: AfdE7clH9LqGLMgtYBb1C0QkX1/YuaUSvtKtUv5ic2/faGM8XUVhEN0LoRhbk66BJnk
	P0Uhw3krE0aPH0zcvga2Q/3ZGVab7FROmce7hiDH0Y+uGnps/OV3sA7QwIK9/RK0HTxynSMASzd
	BgCwZ0iWhOCXATiFkwwMQMSTaE0fIfBe9wcrmUToA0eC4yVdR1gAzUOLvFfuKfsjABRsQC8VqqZ
	6Uu0sUqaeHrFmYnJT0tBaK5JvXV6inGLvPuyvrHajsKWDz6fsOR4miueWk+rElALQuytxKH5018
	mktxBpYiE2g0InoothOF8pK3NQhGhZo+tHHfKTTYsUIJ6aTXAzlWyj8Hm88UmFB3Sh/8dTc+9Uw
	Or2177wl3qE+9X6+zuf/YybnhkkkFeYQ8dTy9Ju7DYx/uwp6dyQ/fmv1mtHzN5xL06WNF/fmg/Q
	==
X-Received: by 2002:a05:620a:19a1:b0:92b:6805:9188 with SMTP id af79cd13be357-92ecf8cbc90mr111817285a.64.1783497466428;
        Wed, 08 Jul 2026 00:57:46 -0700 (PDT)
X-Received: by 2002:a05:620a:19a1:b0:92b:6805:9188 with SMTP id af79cd13be357-92ecf8cbc90mr111816385a.64.1783497466038;
        Wed, 08 Jul 2026 00:57:46 -0700 (PDT)
Received: from [10.111.167.36] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90b80785sm1347514585a.3.2026.07.08.00.57.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 00:57:45 -0700 (PDT)
Message-ID: <402821f9-f566-4f8f-a839-95e419fb92f6@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 15:57:38 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260708-x1e-csi2-phy-v9-0-0210b90c04cf@linaro.org>
 <20260708-x1e-csi2-phy-v9-2-0210b90c04cf@linaro.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20260708-x1e-csi2-phy-v9-2-0210b90c04cf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: b5azUTRhddIPK6jzvJOBk2_UGLtXLlj5
X-Authority-Analysis: v=2.4 cv=CviPtH4D c=1 sm=1 tr=0 ts=6a4e02fa cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=QhmKzT3_Izh8C-SyOaEA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: b5azUTRhddIPK6jzvJOBk2_UGLtXLlj5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA3NSBTYWx0ZWRfXx4nkiSFI3Zua
 +x3VPH9+hCpnlnjICwmvARDYDytTdUpk54N6XigUrNlyE3pnnLi5qR9LQ3Zwn3SbzA4EzSS/frI
 JVk+aSn2J56EM6pXEfoYyTJ84KMn3bA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA3NSBTYWx0ZWRfX88uW2E+OW7gj
 /Wk1N17ucwc1kFpDBIHIGgH5MZ61Gz0sbXxU/sdIelLcD2Mfhw0QJKWcWsA2BUjzi3wd9SiHTrm
 wOO3vOoM5y4scKk4dzWgasB5lS3s0+HY4lw3wMIJJK3ryGm92bMlpWMz4GtjchUTSL60LeUQO2f
 60TfhaO6EM0FOhaTagNyiAu79e+c4LbmBLu/MoPpQkyB/GQECh4kIcu1x+Dof1bR8q+2wDR/JXi
 wo53dh5y5mPH3lfYDnItxqbNbb+pzJVLt4isHzBqH+RWvv8lbyUtIsO6CoEotg3AcMGJAug3DMn
 oDkvreIfpUE9cKQe/9+wTu+vmacFzI8bZyB9RoH8ul7IXT2IYr7RTh/YSV2YG3z0FsIBW7bEOoz
 Ie5lWKPWwPOEkux19vm7RYOTkFDwXKIJufgp1L8Zm4UqrszYPy8k1JboQW5BFDrGevqkj+bfdv4
 nNddF7xgBMdtWmFcrIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080075

Hi Bryan,

On 7/8/2026 7:39 AM, Bryan O'Donoghue wrote:
> +
> +static int phy_qcom_mipi_csi2_attach_pm_domains(struct mipi_csi2phy_device *csi2phy)
> +{
> +	struct dev_pm_domain_attach_data pd_data;
> +	const char **pd_names;
> +	int i;
> +
> +	pd_names = devm_kzalloc(csi2phy->dev,
> +				sizeof(char *) * csi2phy->soc_cfg->num_genpds,
> +				GFP_KERNEL);
> +	if (!pd_names)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < csi2phy->soc_cfg->num_genpds; i++)
> +		pd_names[i] = csi2phy->soc_cfg->genpds[i].name;
> +
> +	pd_data.pd_names = pd_names;
> +	pd_data.num_pd_names = csi2phy->soc_cfg->num_genpds;

Please also initialize pd_data.pd_flags.

pd_data is not fully initialized before use. Since pd_flags is never 
assigned, it may contain stale stack data and affect 
devm_pm_domain_attach_list() behavior.

> +
> +	return devm_pm_domain_attach_list(csi2phy->dev, &pd_data,
> +					  &csi2phy->pd_list);
> +}
> +


Thanks,
Wenmeng
