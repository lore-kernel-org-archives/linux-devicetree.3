Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CA6363C74
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 04:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777524403; cv=none; b=ZGjG+rCLPG3MJqh8xNsf8QTeb6r8h74SxpCDWI87QhlULl6xmrBKNLjM8zaMc6kuV2nLFXsp00HNzamzgwHeexMxiwBg9zpCqdjKJvq28HpgehUTy0oZDqY8M1k8X5SEoXrIrn55t7WVFzlzh0KTFiPVBkJg6E0oohSpyXEpuQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777524403; c=relaxed/simple;
	bh=ERhZOvBPJGPRGOnygQd9Z24lOzXG4tJMtlhFjmEopLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M2XQbAecbh/tp8EtPUcPWJoXKvWnBHioFVcydinSrQS47ciudKkxsK0HTjBkIT+pehrKln6e1O6SrOunSLFDommLpTxUzTI5gikDATKI3446CiTKkI8h+tlvbmRJqnOhcDvwttfjHpgaayR+YLjIn51ssvs0Yk8Nj1++y8Fvy4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pauSl8Ye; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YMG2rh5d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pauSl8Ye";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YMG2rh5d"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TNeUfZ831427
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 04:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UHHyy1jhBLSCQLkczwQR9iTY7y+sVIfuoEj3zUQPDRo=; b=pauSl8YeBI7B11Tk
	8T2OP/Hl1HpR7rcTTzMTrL1rTlJe9v8o7NIHtPxoea5QcSJKKdnlXICKsB+Qv8DZ
	aH+7M/YUFBQV5bs4rIvJW1CjtXdPdt5rV02NAxCIeFY3FqBI+pzjCkYlzmVnUzba
	0Xw1o76B1sF5pQqXv4RpKTQSKKo6N+Bdho7VKA4A4kGFWxlX5HRaTaC6icD2zova
	4/UO99JL5/xl/QtaiS4of+V90FgMNuHNWrHMRJHymUvWD6pcN1xtI1KJCFZHwM+S
	ubSH4GxZejEzCzGk3fZG4EAxBgCFuLG2JDnGcBqUstmp+7nc5/Q1qJhPKlnDi7zV
	YMB5AQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duuvb0uav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 04:46:40 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35e59791605so554123a91.1
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 21:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777524400; x=1778129200; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UHHyy1jhBLSCQLkczwQR9iTY7y+sVIfuoEj3zUQPDRo=;
        b=YMG2rh5dHnf4LkrK2VObCBcugfclPfBmIO6klmm7fDOAIQjPNvxX2NzflnYitMQMJU
         HFm+meHBGSxtmNfTc6eTfSKBD7HWqqbBj6wahVIH5TmtrAlG5vfru+HEaIeIR/4tRuZ4
         MLr7Xt01i2Svlnjbx1QC+lI5Lqs0QOv8bcHjQFagRqXBw5cdorfTFp2cKr0HQqXPm8Wk
         WmRx2LpOCgVV1Kl22znFphTjcjZ3YypAgkdE3XrWTovOsaItyzcSqcdX6CdKK7JfqIH2
         YeiXZjxGzyPIcY/dR3+CekZLKfPKeHIavI2lNeRA4xmskBFC96CdEYN92/PDwN4YADvb
         8JZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777524400; x=1778129200;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UHHyy1jhBLSCQLkczwQR9iTY7y+sVIfuoEj3zUQPDRo=;
        b=Rr0/2cfh+A+2OVeZtO5Wgzyby8nKcJ8cB8tklciRaGHDVScrIVn2byozQgzd31WnFr
         KA6sYBMfgU3vpBGq+9kfA2J6creQVndAkwpcL7ZyLBbLmn5p6S9Cas6HNFc7SEIB76Xo
         3NwLL0gQNK/imtJc2SCTCoKmYA41bWz1tkLJkQekQQ9ACvoAzf/9CivDLMmcybWFIzdo
         mRzqhgVlsy+us7VdTwcmMNq3xB/fKohG8cycWJ4ut9cVCEBQMksx6icNggHm6IpWxe0A
         ksRoT/srQo1rA0NiBo0npMVpIRCiN6rXranHbVsGeeSXMRxm07o/XE7CtwEJNFBYgr4C
         Dbaw==
X-Forwarded-Encrypted: i=1; AFNElJ+Ttm3/XhSAEm4KC8dHC5LzRArAvZc91PapLgvyVR3GH+tOTwJ8znlcEwpxmW9y5+L0qQuiy289Rs1y@vger.kernel.org
X-Gm-Message-State: AOJu0YwgRcFQG8AnHB6dwcvzYaA9y+yxfAi/qwb+zAvhx8nXOfpE/CdL
	8L77Hsl7ku/QCEXn7CdsX1jYX4TS84QCeb0xx9AIICY85qQ76r/fGPTauvO/rTEnCb6JKHHAvXr
	z+GLUeiEkIftgTsTuZFpavmgKPCXCNqpkCS0YIfMUVgpZVCwiHr5IuFLBlPjTWAdY
X-Gm-Gg: AeBDiesBc0r+GmmQXp85He6JAfCK6GF8UOt5PFhFGNBgFccYphIi4IfKNCOWonOFeMj
	U/0x36+WoFWzhIMlc9QpXtTAXa1hmoSeFFTEmDVYTLgBvFTA6Fn81kHuSbfga/GqB/0tczS1zwL
	hcTUcbpssxLabpCLGfA2fTR7ORuUM6SYPXPYfONt46JqqW84p6wX3nWWFr4znRzVjfb4v89WWnU
	fDD63lL7pXLXyuGQhDnSiQ9HLRGcj9mCe5Nprbk5CMZeWSlaowlt72FxuHeibvHwGNwlWeHIe7o
	SeKX1DWOgPq54Z1zNggrpvgP7w39p/8pg71C4QCNJWjY9hXls1GQ0dgs71/d0/UsSyrlmzGb4uC
	VtzM39smfldnQS9HbEhEskTzeRt9ooDfXJL3OBv4y7UmBLR8l0DuvnPHJFs22sg==
X-Received: by 2002:a17:90b:4b8f:b0:35f:c729:de9f with SMTP id 98e67ed59e1d1-364c32cdbcdmr1280466a91.27.1777524399739;
        Wed, 29 Apr 2026 21:46:39 -0700 (PDT)
X-Received: by 2002:a17:90b:4b8f:b0:35f:c729:de9f with SMTP id 98e67ed59e1d1-364c32cdbcdmr1280434a91.27.1777524399270;
        Wed, 29 Apr 2026 21:46:39 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364be044f23sm1211837a91.17.2026.04.29.21.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 21:46:38 -0700 (PDT)
Message-ID: <c058b0ce-08b7-44c6-8558-959711a6ddbb@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 10:16:33 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] pinctrl: qcom: add the TLMM driver for the Nord
 platforms
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
References: <20260428-nord-tlmm-v3-0-f16f08d084cc@oss.qualcomm.com>
 <20260428-nord-tlmm-v3-2-f16f08d084cc@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <20260428-nord-tlmm-v3-2-f16f08d084cc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Hrd4KJcLImshIwtY_vRJGdnAnMVZu-4q
X-Proofpoint-ORIG-GUID: Hrd4KJcLImshIwtY_vRJGdnAnMVZu-4q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA0NSBTYWx0ZWRfX6Ppbx+McVOMz
 DSnmRaxD0Uq2kzozr8QJ/kJBq8AxvpOwhJT46L1YgEsOMPQH/PttItCO/sKJc+Zy/yDtNl7hPMS
 N/lIGfo/nKmtxZlLIBlq+5CgeIDzXZAWrLURqKL6tm4R8kdotOAPDj9tO+3PMtXJDuwPRBoH88Q
 J+ipL1JOl7R88e5JjDqswb3tbYFkWdIOIn37+tmT6I9+qgRxHc9R47cTzk1pIQKaPwxQQBxIyd1
 MTNEAvmEpABbTUd+n8tBsetrwYGcspaII/g4/JZH3qykZ2QF4XIoj2BOD4aMB0i4rZ8iXMLsy6Y
 ew43iLaQbWyKjCxLO1T3xVFk5lYK2A2JoV2zYiNewE4aW0KTd5gTWSh8d59hr+mhuhshfp74fLA
 g5uClliPStTxviNf2OQzoYSFrYeQByP/+1CP+TAN84kw51kz3shHUInWf3sCtqctLflilF+OlA7
 nAlONU1QqyiiO4kc+Rw==
X-Authority-Analysis: v=2.4 cv=V+JNF+ni c=1 sm=1 tr=0 ts=69f2deb0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=d8IIXGk-wedfOAHOyJQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300045



On 4/28/2026 7:18 PM, Bartosz Golaszewski wrote:
> Add support for the TLMM controller on the Qualcomm Nord platform.

> +
> +static const struct of_device_id nord_tlmm_of_match[] = {
> +	{ .compatible = "qcom,nord-tlmm", .data = &nord_tlmm },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, nord_tlmm_of_match);

[...]

MODULE_DEVICE_TABLE() seems to be kept as the last line in other pinctrl-<target> files.
if you are sending a new revision, better to keep at the end for uniformity.

> +

[...]

> +
> +MODULE_DESCRIPTION("Qualcomm Technologies Inc. Nordschleife TLMM driver");

Is Nordschleife expected name here or should it be just called Nord?

Also since all other pinctrl-<target> files have this description using "QTI <SoC> TLMM driver"
Do you need to replace Qualcomm Technologies Inc. with QTI to have uniformity across all SoCs?

Otherwise looks good to me,

Reviewed-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Thanks,
Maulik

> +MODULE_LICENSE("GPL");
> 

