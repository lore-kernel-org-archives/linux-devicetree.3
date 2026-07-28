Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379F53B892D
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 06:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785219903; cv=none; b=Zt9G7Rn6k9ratau2Qy+XaCh/ghZRcE9Ca9mWaGsNlCZJA37d1EI00olua7CO4TCEE0dmNxCL93FcGl0QcowuhSpdCtEa/5hbcORNmSQm7VS2vFXmHuebgzwRsgJLzxXIrGg2uUuZZgVmccH4DK/2SipeeKGgCzI9MISegq0P8l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785219903; c=relaxed/simple;
	bh=3/ZO6zGkn9ru2PcIl0J3RTnmHzcjul+BnKZKqTk4mbM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oPa2/Q8xcJTk4nFGFc4skEuBTrGj865scmjWJr+V9ek8i3eynNHsqb4BUa24srkV2S1WmNfeJxVUaOWRHjkEWOFUEsGHnC3p4B94aCjcLR4WN1oRBdJmKGJLPsYVq6m+Aj5xgiq4NEqDY8s9nYxOtdhuRZk5N8QXQL/YsGhsQa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IYy8g4FW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N9p/9Ot5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IYy8g4FW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N9p/9Ot5"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S40jSO1594067
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 06:25:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6VCxAzwtFaouNE9V1I6LWmfhLkv+iNrffp5f3eT2ZMY=; b=IYy8g4FWMnJo6eqK
	NJyaKwcnSDVJBE28vMe5rK1xSuJXW5Y0IrPNUR2cDI4DfXBREHUhxvOyCC0lLxu+
	cznxhXBkq29iHmutSjw4v/cGOR/sJImTJ9uqeJd47LIblzmheKDIAKD0B2ESjy9r
	nb+b3SF08Yjrnb972TtOyM8YIDV1p5gSHF4jecY68quZwCD5Ey9IkKL2JWy7daRS
	/o3rVtP4BhO/Y4ZXeqKEzTczmjOVjKr0uu22h9ah9RN8i0lZMhxNpLvLSRu8HxTn
	AYjHjaRbTdIHUMrrQEFeeV2kJ/tSCKd6+KdyUs5ojvDD1WCPQV4a36cwE2TJBfBD
	rPcYvA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpn19gfkj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 06:24:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so71069905ad.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 23:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785219899; x=1785824699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6VCxAzwtFaouNE9V1I6LWmfhLkv+iNrffp5f3eT2ZMY=;
        b=N9p/9Ot5b5Q1jEQYBwF1JGKMRU2ZIdOrgdH6h3GAzBan0idtgb4I0ps326OIStcduQ
         kOxv0QqOLN9CQ7Hi8kgIeaNHhnxqx3qBO11/QfaionzZ6Sx/6HaWbA++2yMe8xQbEIXa
         5GJQsDrl7J7ZIkPsiNuXH2Aye9ViI1WQuucp19NI7YQSc9yxIkT8OPVNKfEV074N5k8e
         mbvvSMZFGfpD0Wcvvl1Lkd6CZ/FPTVcgk6aQT8QLLN31BIF+jDwZ5N0M6nA7uMuVyDc0
         nLBIGmeuXNAuyjamExUnep4H3PRs9BmsCr3XUd9qXSFPNxCCtvG23HlvCFL3nPUbzV3f
         8n8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785219899; x=1785824699;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6VCxAzwtFaouNE9V1I6LWmfhLkv+iNrffp5f3eT2ZMY=;
        b=rV90KPeNKHnBzgwVkA4Hf7AZ1z/HoU66Gan9818H0Y5KMGDD1B7RgzRLeeEqccKywU
         uxM9Zc6W0Z6rMm88ajFGABfPTSr1EWLSCV1ZNp7H9Q7HVLlFf7tLS32UkArvQ0dHOsGt
         Z9WLJLr+H/jtqLpHFtXH234NcZZswKH5SUMOA8Jb4nJHw0K0klkWqAGNwBGcW20FrBxv
         HoiG/6cbSGu63YwyKCAKYe5Z40G0m8hnI+h/AJQ8jP8O3pw2YCIfLq86AW2+xZi1B8mY
         z47u7491tjNItV3mE9TTKIW4590GC89BK1kcH1kH4bk3ts82DGdqgY7E3kune+JFpJFF
         /61g==
X-Forwarded-Encrypted: i=1; AHgh+Rptso9Fw89P3U0JsHI773atjXGMEa+HX3qMsUoG9pMRnuuuwy3wA0aNNLwjfNkQaKkm6B6xZXk6Npvt@vger.kernel.org
X-Gm-Message-State: AOJu0YxU/LWxBMXNXqy8lk+VZJHoJipIQDrr+cEIIQv4HujG4YY7LRHh
	k6xtSfJGUB6BxMJGt5SAy3SJgURBsSSO7v8vFd0Tsw7stDg65G9JunM/NANms3Y+zm8V/qJvkUe
	YgjBlYiF/4Z8iH1XYYPYQOj63GsErkFme2HszeM5epmE/G+bmjVlxmEs8VOnZif0hSuH86DOJ
X-Gm-Gg: AR+sD12QgGz0NQNuyWZuge9B+9Id7vNXDQKqcQTepczjTIxQfkVMRgiOr6A4pY0Xokk
	mzzREEoacWakbvN6QmcIE6guDeDk/xsCPHo22vk5r5hNbqIBsFdTFwPO3CxjTh850wKrTH5OlNm
	kV195DK8wVJ53CHbCK5t2tfYuRYUvaU5MhE+qTLN8s9BnZgqFXbQ7W81ea8E3qBtDMHar0xnPpc
	NXZTw3qLz3gSk1QJIR6CYHxwda2p5NlYVcxx9TYbPv92y0Z5q0PGfsgxU/7N+h7HxzlxN07/Uuz
	HGSQ6Z6uaCwDvxem2OVofP62J/Ga8mhoMT6UL7LlsQ4ReYz+I7E8ZSZQrrbOniAtvOXItduxUDC
	p79ggbU1o8o2+sWh2B62FgMAtwD2y9Id63w==
X-Received: by 2002:a17:903:388d:b0:2c9:e69f:8b0f with SMTP id d9443c01a7336-2d015d01806mr12359005ad.17.1785219898794;
        Mon, 27 Jul 2026 23:24:58 -0700 (PDT)
X-Received: by 2002:a17:903:388d:b0:2c9:e69f:8b0f with SMTP id d9443c01a7336-2d015d01806mr12358775ad.17.1785219898337;
        Mon, 27 Jul 2026 23:24:58 -0700 (PDT)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5fde87sm45693045ad.37.2026.07.27.23.24.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 23:24:57 -0700 (PDT)
Message-ID: <ad930b71-5c3e-4447-9888-7b5eae57eea4@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 11:54:54 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] pinctrl: qcom: hawi-lpass-lpi: add Hawi LPASS LPI
 TLMM
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260724141708.2212057-1-prasad.kumpatla@oss.qualcomm.com>
 <20260724141708.2212057-6-prasad.kumpatla@oss.qualcomm.com>
 <20260724144528.9EB851F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260724144528.9EB851F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TJV1jVla c=1 sm=1 tr=0 ts=6a684b3b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=sFkXs5fRGYWMjOD9uhEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA1NyBTYWx0ZWRfX7uHxSPyci2Iw
 jb5Qawlh+00wdhqyINvC/+o2TNjq0NroJcv7e3PIwqw2O280xJZ1FRlL3FDeqXwef4S0mkgdStp
 dp6qbBKm1mTA6BTF8X4PXjJBCLZFbW51jlLKmJgGesSTCV/sQpuKWJWYKTLHmVnIbRIHX9m59gE
 Lp26yggQfNdF4a64c6afGnYCsbcfqlxrWCLxlEROJxbJ54TAhRwyxf9luVyeL++jfg2O5UHr49U
 hNnTbD1QwcxRkjrWbfpbc+83F+Jb3GltWpNlQkB/7qqRPv/jBM1h7iR5TZKG/W3p1SiaTelP8R9
 Y+oqIgluUfqWwWXKlqB7+tq0NenmB6ceI3/c5x3cVXkAdCQx9d05QRV3n+Rrw6d7b9Yyu4DFj5d
 yk32alB7yHNxJZHUbSYuu71yTvc80BZ4aflVAcWYWoo0gYgOz799awhO0Cb86Wy4t2FE4jPAoLX
 1Yz+PNW9yAHbDVVvk2g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA1NyBTYWx0ZWRfX3tArImU+DUfY
 CwBFB7zAflN1TpPgqOWu7NjhlS+6zGxtZGqnTAm3wbhtTgWkN3oifRzZf6u4+oVV9g2eDGTt/SG
 j0ytFIsIoLqWW7h6QWBqkRT8grHAJWE=
X-Proofpoint-GUID: zbLoulf5LXVLhtLE_ihUASG0RenLO-HR
X-Proofpoint-ORIG-GUID: zbLoulf5LXVLhtLE_ihUASG0RenLO-HR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280057


On 7/24/2026 8:15 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] Premature mutex destruction in the driver removal path creates a potential use-after-destroy race condition.
> --
>
> --- Patch [5]: [PATCH v6 5/5] pinctrl: qcom: hawi-lpass-lpi: add Hawi LPASS LPI TLMM ---
> commit c233c0ac41f2bc46bdca1d1c9ea5842fe1fcc867
> Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>
> pinctrl: qcom: hawi-lpass-lpi: add Hawi LPASS LPI TLMM
>
> This commit adds the pin controller driver for the Low Power Audio
> SubSystem (LPASS) Low Power Island (LPI) of the Qualcomm Hawi SoC.
> The controller supports 23 GPIOs and utilizes the LPI_PINGROUP6 macro
> for certain pins due to a test_bus entry.
>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c
>> new file mode 100644
>> --- /dev/null
>> +++ b/drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c
> [ ... ]
>> +static struct platform_driver lpi_pinctrl_driver = {
>> +	.driver = {
>> +		.name = "qcom-hawi-lpass-lpi-pinctrl",
>> +		.of_match_table = lpi_pinctrl_of_match,
>> +		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
>> +	},
>> +	.probe = lpi_pinctrl_probe,
>> +	.remove = lpi_pinctrl_remove,
> [Severity: High]
> This is a pre-existing issue, but I noticed a potential race condition in the
> shared removal path being used here.
>
> Can this lead to a use-after-destroy race condition when the device is
> unbound?
>
> Looking at the shared lpi_pinctrl_remove() in pinctrl-lpass-lpi.c:
>
> void lpi_pinctrl_remove(struct platform_device *pdev)
> {
> 	struct lpi_pinctrl *pctrl = platform_get_drvdata(pdev);
> 	int i;
>
> 	mutex_destroy(&pctrl->lock);
> 	...
>
> Since devres is used to manage the GPIO chip and pinctrl interfaces
> (devm_gpiochip_add_data and devm_pinctrl_register), these interfaces remain
> active until the devres release phase, which occurs after lpi_pinctrl_remove()
> returns.
>
> If a concurrent request (such as a userspace process accessing the exported
> GPIO via sysfs while unbinding) attempts to operate on the GPIOs, won't it
> try to lock this destroyed mutex before the devres cleanup has unregistered
> the interfaces?

Thanks for the review.

Yes this looks to be core LPI driver issue, Not related to Hawi pin ctrl.

Need to address this issue as a separate patch.

Thanks,
Prasad

>
>> +};
>> +
>> +module_platform_driver(lpi_pinctrl_driver);
