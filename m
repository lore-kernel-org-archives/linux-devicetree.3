Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EA131A81C
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 16:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778084261; cv=none; b=Bm88ouuaexutMX0IflzhkihSSpEtpytZ2bYMwSlLhTBfcgMt7Wrrdt9oVkc06oPZehw54u2kOgsKlDFdaIK3DcCsH9IoLwhD0aswCLIzUsaWxds10uNaAVoSJUC5vNSxGQl+NuB6ObPrh+KLaKdQehZdzuGfcpkjpvEhh/oESbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778084261; c=relaxed/simple;
	bh=k8mdGwOI45VMWhAk3cO2z+9fxW9u1DI+6A8LfvpUqic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ut2Td5ntO+v4wqpzqTThBIcRDiARxKANyyZDp6xYCtRF+loO8ZmQsYWWMgenR4c2yBp3Yts+48uIXaBx+AtTsGuWYemldlGZw8wZShGEClJ+cNYfq42hZ3l/hPAeSI7Ztz47iN9JITyh5uya0LtRuH679XdAt82awi/NbSMBtCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f4hebraP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Quz7Exwz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f4hebraP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Quz7Exwz"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646CYOJ11514824
	for <devicetree@vger.kernel.org>; Wed, 6 May 2026 16:17:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vl6gtDEwP/WGqP4XGKgcHTsYq0tg7ZJDq6KWRqpyQPY=; b=f4hebraPSXWso2xB
	ZVPODWHYJbqc3TcCB42zbDmh25VHSdrAzg8ksAJxrehsSfknt8AJiTyZlX2fQc2I
	RrIWQz+LLUrdBF/iEkdFr1oas3qykbOLqYaYEqFEOGxofcMzbDduREJH9y8gkmhb
	EFj2lNsg1jiKixua3ZCuwkin7hPgn89sbV1uMqspGI1Kr+RliKkx8eYOuGTOisbA
	Re2F/bnXgehXejg1JUoKj8DrOxLdVjotiBCBnLG+/7cTVo5nh6GVdZaEAz0nzNMO
	+oYBELy/9yLHek0rBE/FVICz1PsvlXge5e+KYvwb4d22kiAQacqe0mC3Za8j8RmA
	H62Dsg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e00v1t8w1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 06 May 2026 16:17:38 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95cf2f6a8d6so2746253241.1
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 09:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778084258; x=1778689058; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vl6gtDEwP/WGqP4XGKgcHTsYq0tg7ZJDq6KWRqpyQPY=;
        b=Quz7ExwzkvOvcZPHEWDUWcUY3e/ovnFsMxzgjMZIcM572EgLQ2I2Y342ATT0nbdlH8
         ItR+g7CA41mzv6zZRAfMqsdSSturJ8Aw4C+nJ8D7/fcnQC+tr5I8C6vfhFaP7w0QYKtL
         +x+B+DAL120YGjLowhyW8yJWH3aOJzakEtMKP1bBkiQL6YKPLQoaTEpk3+sx7oMFHsqq
         ukV+gyF9cYvNkMGwT1cltC/lAISLfG67wYDaXeERTDTocN3PM7N2NbWKYuKtQtI+rFb+
         FqhDuJa80G/cqFj/OgsFYJ9I1CVre0TjBqeEl5Y/COZIy6ubvkc7wWmm0ZDkaiIrt+DZ
         KmOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778084258; x=1778689058;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vl6gtDEwP/WGqP4XGKgcHTsYq0tg7ZJDq6KWRqpyQPY=;
        b=AGtqtn8vEFzVWpemb6ku4yZFKQS8yAIQx7Nyd6kbfm+hIhaGy0vMs2bHImwDV9YZUG
         9sOxcgs9TegjkOzjf3YcMqo5kA5qDkLodUyk+TJdLmsDC8HLdeEBBKMjld8qGLEtrNpc
         J79Gcu+eUa0fKW1RQ6NgtPAxCXWLUK9WC9PzRR7Q/LZc99r6sReRS+kgj2xSWYooYMF2
         3++RgblpF5pWSoC6sYhvFEDrtrAr3+aHnbZ+sDev7MP3lizMZFTGcV4EtIeq+zQz1vEw
         CcXBPjjOgrhBA4TR/tnAhW5O0jSXpelX3U5rxCoXrRuqJL7xVUn7agtaENdlU/IKFXTV
         zj4A==
X-Forwarded-Encrypted: i=1; AFNElJ80BQP4vWrziGbVU8Nm06KurgkaTS7Bs/GMxtD62CWYyR9S1UirzJ/CmnL3OLFlaTQmnnr+srCh0tTh@vger.kernel.org
X-Gm-Message-State: AOJu0YxOGn17kBD6WJi87vpXENG1vHyVAWDsEH1iGL1XW9wqX0mbLUhg
	msd3WxBj3gfeFBPqAh7sRPWsA/2yR43IvmQlGCOvDHKmV6d5b+REKYo6eSzSh4dVIvK5pp/Desf
	TzO9jzqGJPl589H8IbQWdc7iCBJC0V1FuH4KqMLeN2ZW3p5mm66mp68MliMCHAkod
X-Gm-Gg: AeBDievQGVSYyd9anRdl3FUJ7Vx11/qrQ9Bmg2GPLhj/DygcV2P4eZL5lFolR1Sh6Vt
	r7+oCw5mVthESjAUKmU4cAfTfgZNJLPwd2SFDD/Ailz6Lmf6gN7vQuc7UciAEchaIgtnTfAJR51
	vB5/5ZRaemAxLCpMoFvS2hKNTmdeeRCa1NqkZnTbuCV4/hqMTQVCACVUlfm/hYBpTSgBqvRX7xT
	fGnlD2GoU4xjAOyi1sMJSBlLtLDGh2AHSHpNkKZCbfnmVp7IRkZ5zl+XME1S1pCf+YC46/e+2Ov
	lSe+DncOZw/v5ZMz/q5OmwVO6CK00rWJzHtNf68+/NK5q6Nefh3lWGO2a3AHfOWC/y49LvaZ0xT
	VRjOGo+d1SJYfm4HxxPkEHobvQPM+lLzt1biyqd6HwSZRj1RoKfixQl+h3d2JE5qbxSXRuDtBuF
	spbQpTPnDxSe3dsdiAKn0=
X-Received: by 2002:a05:6122:8106:b0:56f:b831:909c with SMTP id 71dfb90a1353d-57544474e1emr3810512e0c.1.1778084257940;
        Wed, 06 May 2026 09:17:37 -0700 (PDT)
X-Received: by 2002:a05:6122:8106:b0:56f:b831:909c with SMTP id 71dfb90a1353d-57544474e1emr3810491e0c.1.1778084257512;
        Wed, 06 May 2026 09:17:37 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:41ef:7b80:b3e8:2c1a? ([2a05:6e02:1041:c10:41ef:7b80:b3e8:2c1a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e53891d62sm95223275e9.1.2026.05.06.09.17.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 09:17:36 -0700 (PDT)
Message-ID: <2e9dd9fc-a42b-40ea-8393-3bf66955c4f2@oss.qualcomm.com>
Date: Wed, 6 May 2026 18:17:35 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] thermal: qoriq: add i.MX93 tmu support
To: Jacky Bai <ping.bai@nxp.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Frank Li <Frank.Li@nxp.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, Alice Guo <alice.guo@nxp.com>
References: <20260430-imx93_tmu-v6-0-485459d7b54f@nxp.com>
 <20260430-imx93_tmu-v6-2-485459d7b54f@nxp.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260430-imx93_tmu-v6-2-485459d7b54f@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ATco9Gja3ZIfLjNCHMLdKp7puvNlyJv5
X-Proofpoint-GUID: ATco9Gja3ZIfLjNCHMLdKp7puvNlyJv5
X-Authority-Analysis: v=2.4 cv=cKXQdFeN c=1 sm=1 tr=0 ts=69fb69a2 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=8AirrxEcAAAA:8
 a=_0vOcDHEFh9t5MRidCsA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE1OSBTYWx0ZWRfX3Ds5gFqMzl29
 vTWkcbCSnCIs2w6DqHEv0YgjTqB03Hk1sBI0F0efHzw1kshWrRlVxoafDAewqnUA7LyswMqDHcE
 HmLhzp1pWx5s8u+sKqWSKViTWh2bUQuYPwVAS8ugXWQNxo2BQmC37OnfyshIn8FNj5JfxQln3jp
 S0MQ+QPAronttC8TFa4wJWmszghVm0E+Zp8m2RgMdUkYyxouqtJ3MHEpU3xi04I4FM1XJc1KNuG
 xH6xvvvrmYwXHwqCnhC1WhlzBDVgCM75vlzKF0Axqs/IvBS55G2KqWzSxpIpH+KjDul8qM6Kp3+
 HHgj/V9x+ztx+wXn5mGm+bVSmAXDTqopoTwvXpRRofxODRegBEoNrQFXa8MuSGbbWoA05M6+bdQ
 FkwIokkMgAfhvsEV5U9zTSHX84bEJ29P3s+ZiNYzdx0332EvVfiyIRwepRlJS+uhHgfabyheyuI
 GuDGOykL1s92pZx8Ycg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060159

On 4/30/26 04:53, Jacky Bai wrote:
> For Thermal monitor unit(TMU) used on i.MX93, the HW revision info read
> from the ID register is the same the one used on some of the QorIQ
> platform, but the config has some slight differance. Add i.MX93 compatible
> string and corresponding code for it.
> 
> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---

[ ... ]

> +	data->drvdata = of_device_get_match_data(&pdev->dev);
> +	if (!data->drvdata)
> +		return dev_err_probe(dev, -EINVAL, "Failed to get match data\n");

I'm not sure testing the return value is something very accurate because 
it is like the code is testing itself as everything is self-encapsulated 
in the driver.

> +

[ ... ]

>   static const struct of_device_id qoriq_tmu_match[] = {
> -	{ .compatible = "fsl,qoriq-tmu", },
> -	{ .compatible = "fsl,imx8mq-tmu", },
> +	{ .compatible = "fsl,qoriq-tmu", .data = &qoriq_tmu_data },
> +	{ .compatible = "fsl,imx8mq-tmu", .data = &imx8mq_tmu_data },
> +	{ .compatible = "fsl,imx93-tmu", .data = &imx93_data },
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, qoriq_tmu_match);



