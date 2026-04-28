Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8BA3F65F6
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 11:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777377306; cv=none; b=koOb8LYfRpkF3pRIW+fOmZ6OuPUnAl5RdXKn1wiBWnOjfbPZ3XQ1j1SVU49g+hOv5qXy3AOe+/9kokCTkendpYxkmQWyfc1RwBYgEIf6ErAKS5UjWI6PwORBsgReDUYL+mOoiovlwLqYciBP5AJ1XYLHvzNKZHFOSH+mnleNsyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777377306; c=relaxed/simple;
	bh=5dJa+tGJRSBuI13nLl/GYz9NPVhY7r13IyAts1jqOo8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LxlMSy3+wZmzaqtfXWQbW57nMsJ1xEGUy6wr/uT95hLciz1oZMlk4I5YQHikCdCQUc4WWC+GozwZpHPBvyxouZbumeK5iEAfn4CK5YDxVHXmo8fHOgRjr/itrb/bT8t5B81xtYoYkrhf/c1KKpxRfeaGrjdgu5NaFXIChlNgr1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BHdeZn1Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BHgtB7Vr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BHdeZn1Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BHgtB7Vr"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SA1nfC1329581
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 11:55:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H09Zk0X4k8B+gAnXTVvs56d36dwNpYdV/aDUCW9XEzs=; b=BHdeZn1ZlOfzK2Lq
	SymdPaR0lAPQRP7+oYpY2dblSF9gH6++mORqqgfyi7xAyKsJrU7uOrOFXrIT9AzX
	7dfWAtquJQuex+Dv7dJdKnwcPRbcB7T4uVSQsRojzOZlX5cAsxYD8RLiELPegq6R
	LPY3afP2g6hYiTxteuV9SBa0VW2PFCdF+UUX59NMZF26Cq7pBT8KPmIAbzJsNbVs
	h0bvndziGPECkRZYIwYei7SCKnwlgwLrywv0LmiDycMQtR/jkt8M8+cQdL5+DT+v
	xf5MyRA89TxODVdxPceMg8lBZKZFmSCL8N6BF1Ogn3EKpNKl9I3nznDDEDuSFV2P
	kKnIAQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtnhahphc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 11:55:03 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2e6ee9444so122258305ad.1
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 04:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777377302; x=1777982102; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H09Zk0X4k8B+gAnXTVvs56d36dwNpYdV/aDUCW9XEzs=;
        b=BHgtB7VrdeHPtevg6jFjYkwt9C/TVY9wWPgM4xQVHrz3y7FI1PLsA7BoHxtkac/gPZ
         AoEsXxpsz/hI2cAckd1X0EM/boINe3zrMridvSRNZwluSHOHVwFlFlaTGl89Pm3bIU5I
         IpSt+fGTIanfVGd/DXJHVPcJ9iVK4dn21yvgczudilnMPnjabkNhrPkKwNopGWBFgD20
         j86qrlu+aVzH7UxnetGskCzFEjPYQq3SZAn8y0UlbE7gkC1J1D57h28zBsWExsm0eijV
         9pdyZ7s0x2DGhcQ2UIr/Evy+CfWzCB3d5sxVbTesSerDTOnlE8+SW78Wc5sAM1PoUrRD
         aYhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777377302; x=1777982102;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H09Zk0X4k8B+gAnXTVvs56d36dwNpYdV/aDUCW9XEzs=;
        b=J1bwQajURh+N7bHap2CxNVbvMv5/YpA8aAUCpRJTsxg6ZJ7cT4pLfhWu8QVVoOHfd7
         sCtpA3iSFYFMpBlaHRg2dSvXGjlFBdDC7Vh5SeqGCOZClL1MUgKB+yNa11v8pHNWg5R4
         xLSiOM9pU8+WChdLT/KbIAOK3277DWA4WJzBtE1vDQi2SAdxsbNzY/xLtmIjOuC3LMBS
         O4q7knEfui2gN6Vxo5LaloOiLNPlX4zg/TATeuYreDym7QPbpiA33FC5Jp3xXifAg7g8
         cI11C0qDZzNMWessM4PoNIUapjnifghZd/6k41StHQzMjufbn4BfvvzQLhn2bnr2QtKU
         WxwQ==
X-Forwarded-Encrypted: i=1; AFNElJ9awKzJnYJ1ypOwgO4+ktRQCm2IOMTUixGOKBhq1u+sKgUVT7gFilwM1OhcAnXHI6qz93CJvCQ3MNjk@vger.kernel.org
X-Gm-Message-State: AOJu0YwOzmleV0uX4x3EZOeTR73coFXVtfF1ztrgNFIawP4l6rSVv8tN
	SSQAXADCgKTAJMJocVUfCJtPxfdhCRRzkyfuekWnzWoOw2o6sBIxZ5DGQPyIpve4Or+jiXqzrQw
	B0iIcO19tyFX0SWpobScTu9OutI7esSoQraTGNPFgUfweFDDYcMaU05bRmyuOzSxH
X-Gm-Gg: AeBDietP1sd2l1xMwwhnQM9zfE2PlT45nOFYX7Xgj4CDe8VDzBhABc9rxA7m6pzUlSS
	68xmDpwhxV3I652OKpbA/s69aSMttgP/g8Qdwb9RlQ2n29ydXnsf5zKssRs/+kZ4mqZpikuHv6j
	fJpMfuS0jpw67B07q2taeLqJBhYw+XhMZ2MbTkp31n5fStcpm13RKxBP0yN9TFmj7t89mNdDCQ1
	ywa3e7bWu3yjhwaHFtkkhyDtM6elDs+Xhi9Uk1a5iUsg0VfAHDF7xRUxD9ifg31l19Vp/SnsN/L
	55mEZrYbGOcmbpgmbv4LnMMpR4ZX5tAmvTfY7jJ3KlbUmkx+flO91FQE3+bCK3xFaO7QDl+5uyd
	/ToyAD8BJ/Jch/7lH9LJGOvTES8LEjqDXsTySgYMtWael7iVKQTDm4ZH7sAuISMpl/dL7PVkv+Q
	aReTDhAO3a0KT+o1pLSZR7cTRAl9hVyNfqmoFJqsfCdrqnQL9SNTw=
X-Received: by 2002:a17:903:2ec3:b0:2b0:6068:4c5f with SMTP id d9443c01a7336-2b97bd6b567mr24234745ad.8.1777377302214;
        Tue, 28 Apr 2026 04:55:02 -0700 (PDT)
X-Received: by 2002:a17:903:2ec3:b0:2b0:6068:4c5f with SMTP id d9443c01a7336-2b97bd6b567mr24234515ad.8.1777377301641;
        Tue, 28 Apr 2026 04:55:01 -0700 (PDT)
Received: from [10.190.200.117] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97ac7b35fsm24140165ad.46.2026.04.28.04.54.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 04:55:01 -0700 (PDT)
Message-ID: <9dd3aa94-0306-47ab-8bc8-ec5ac4219f31@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 17:24:55 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: add the TLMM driver for the Nord
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
References: <20260427-nord-tlmm-v2-0-ade8e0f3d803@oss.qualcomm.com>
 <20260427-nord-tlmm-v2-2-ade8e0f3d803@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260427-nord-tlmm-v2-2-ade8e0f3d803@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEwOSBTYWx0ZWRfXzQbJLwXTWkmD
 QSvWX0l2O9gWxUt+gcykXx1IB/8cPUleklWjz66N20+6OSc5ZVQSJoO0Q3eJwjUA1KBPc/2WxO3
 pzhrPf5A3jVBwxt0H6z/5PpzPqel+nc2TsUhx39mILAXpHQ1dC5nJAc+OQIpYU5wq/5mfbm1usv
 FFdN5cEsj47TKjpS/yx2HxWr20uGE3KLPeY7CAZ+kIdX2rpqR/tgkKUceviukr1VngRuCkfGIMs
 O1kR3cPLbnecfC/zzlk3PKMlF5+l0inURmH2dYvQ3UIapXKyGan0m6jcvIuL6Fe+VGxgZSOYHVY
 z+W7DyE7MQ20xTfDhvNrH/Mlsxgdn6XBZQuhdO1j7+43E23Mhpa4ZpIe6RC2dLce/odwlWmLvTY
 BjeCdgkcuYqhOPYMxtB1K3uYUtGJxq9cN0+hAVbxLK/ro3XtbjfxxGfjwZZ1VadhCVxZJ13CBot
 6LoWAcYdIOluZYnCenQ==
X-Authority-Analysis: v=2.4 cv=JoDBas4C c=1 sm=1 tr=0 ts=69f0a017 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LJYSW8tzm8uOt92QnF4A:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: IpOetWqplw1QmXViCCgvHEg29uF6oi_P
X-Proofpoint-ORIG-GUID: IpOetWqplw1QmXViCCgvHEg29uF6oi_P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280109

On 4/27/2026 7:30 PM, Bartosz Golaszewski wrote:
> Add support for the TLMM controller on the Qualcomm Nord platform.
> 
> Co-developed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/Kconfig.msm    |    7 +
>  drivers/pinctrl/qcom/Makefile       |    1 +
>  drivers/pinctrl/qcom/pinctrl-nord.c | 2843 +++++++++++++++++++++++++++++++++++
>  3 files changed, 2851 insertions(+)
> 
> diff --git a/drivers/pinctrl/qcom/Kconfig.msm b/drivers/pinctrl/qcom/Kconfig.msm
> index 836cdeca1006ff7ad5030ac5c537d775d3f0261b..67124ac607baa0f317e0713760a0a2fefba1e2de 100644
> --- a/drivers/pinctrl/qcom/Kconfig.msm
> +++ b/drivers/pinctrl/qcom/Kconfig.msm
> @@ -229,6 +229,13 @@ config PINCTRL_MSM8998
>  	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
>  	  Qualcomm TLMM block found in the Qualcomm MSM8998 platform.
>  
> +config PINCTRL_NORD
> +	tristate "Qualcomm Technologies Inc NORD (SA8797p) pin controller driver"
> +	depends on ARM64 || COMPILE_TEST

+ default ARCH_QCOM
According to Krzysztof's patch,
https://lore.kernel.org/all/20260425155505.83688-2-krzysztof.kozlowski@oss.qualcomm.com/

> +	help
> +	  This is the pinctrl, pinmux and pinconf driver for the Qualcomm
> +	  TLMM block found on the Qualcomm NORD platforms.
> +
>  config PINCTRL_QCM2290
>  	tristate "Qualcomm QCM2290 pin controller driver"
>  	depends on ARM64 || COMPILE_TEST



