Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03853D810C
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 13:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777899630; cv=none; b=uwWGRX/553KtRyjVNeEdst7W58y9W+bpTSR2kUN+XujX3Awye50airSvMpYAvLgx7J3Au0zL5HsaqheZ3pmiwFAuZm8dkA1uagSbaIlzMtBdLVAi3G8bggqM9yt80a9Ucxq1qUggpRApQaFyLc1sD/1yyYvtCouwaI4lVMRpwjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777899630; c=relaxed/simple;
	bh=QlSLErIpPIrAq7gne9d8LKjCLTvPr9i6cnS5fWdDeh0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B87wSofz8seydoX3HPU6I0ke4hEGam+IOQ780sHvLYwdv6CxAEtO1ljMDMp2I2VEvhcE5sgq/KEpbcLx4DGC1ZNAbFIs9F3wHd4vqFOLfmgBwzCkMakE+LAIlBhCxbw+VY28hlBER92hvM8grQ7ewJWq/RuxCgXBuKwpuiCcViU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mWokuxnV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Blmhe6+J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mWokuxnV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Blmhe6+J"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644B4K0X636831
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 13:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y7R5OwNR2sXVADh0qkhRo/PpIXRQLWA2ulWhCmwHzUU=; b=mWokuxnVRKEudnsS
	ZbQ4Do/IOAcWC7ZeYUAq3NclelHZd//45f6uUSByPH7+sscshk/Ot4qOZFrb/uYh
	pErtNbpSZ3GvazMMsXyHboJRvZFBfL1E0JaXL3a22Bec7JwWFvUmt9eTs+ZbMXkH
	T/sbRztwYWbCKpUfp/JAhr6OJna/W7qif4HGdLOKsX95nLxpr4q30NwDdIQoEizD
	pjp6DqpEBGhLioXfGn6tZ+iPdwPU+b+hXzRVtDOzb3/DhDPeZqawG6qJUewpt+xV
	jKH2L443KtNAQmXAzvjLiRGf+4wk6ZGNiSuYUOmeM57mX3ozWCjmlUI+EIpIcKrE
	jLwmOw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxsx48c4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 13:00:28 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56f7d6e7a31so263980e0c.3
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 06:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777899628; x=1778504428; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y7R5OwNR2sXVADh0qkhRo/PpIXRQLWA2ulWhCmwHzUU=;
        b=Blmhe6+JBmxwNH6m/6c77pZuMdbNg71ne17zd2VnuBDMfRtx/XDv45BZ19eWgiWlXf
         zopOsuxZWMqe20xX96XonpTHNqwJyNGf7xFOD6mdm1o8YQv8vGPoLm2JJU8bbEuSfG1s
         BfcSAPZVaOB3qV7s6McK662IUQuegHQikCBI9GhMpHCYvYcApK2s1n2rAAULUo552ZBE
         QWHZz15/m4Bfchys0mZyHJDTuY3feKZEDIGz6/9ifOdowSCxV3TUqBVEuT1xSz3Wb8KP
         Wiui68/c2yiV02r+7aSHFRMq01JDm5zCMAkOADFV2EAhvOOhB22K8l+reEsOUqZEbNkk
         bP+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777899628; x=1778504428;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y7R5OwNR2sXVADh0qkhRo/PpIXRQLWA2ulWhCmwHzUU=;
        b=r/vTAR5dgq1ZR0stK8Vk+bxXPZJpPDWX+CHvNHKxbbozjWEq/4QL2bVXOebMClQ4ha
         VPZZ1I+VU2zLUWvMLw9O2DM9pvfak24mBhirUjXm1L8FefaP9IhzT6Lh35/oQp4lcob2
         OFMWUfW/9R4/5PYWeGCSjUibg9nMoOGMK69pzMvs6tfRCSgjSZN3lJ0H2MaDM3KSOfqI
         JxzPJOrgjO1Zotk2H5T7dTM5+GjndKsrOGCjnXJPjHpWa6NHGgOqDbv7K3wASoIHfqsx
         8aJm6ihbyf7As2IhspDPR0oBOSaN1wAojc3PVf0KnmXbj7C81n+pcwtT32RBZAEg5X3A
         9j8g==
X-Forwarded-Encrypted: i=1; AFNElJ8afpd9w+QAzKdmsOWfk4FklvDGRgV9HG6sk9YS4FD7rMPTGKkqDztFtYlrqkc6+8u9FX9q91f9QN24@vger.kernel.org
X-Gm-Message-State: AOJu0YyAddJf2s7oodFbZGWlSWFddFaGjqBhTEd/RG/NHuhLXg7Rccdx
	Mxu4pDfAxRwfhYHMBe89/IWWrLGAcATbKuS3m2aRniP8c0LmiSCM7ePjkR0A2aDlgFRDmFQLa+y
	2+plDlA/SGbfujM1OtZ7SpQA3N7c2d2OL++6YEwbcPIPY2t8xNKAN/gHTeaErMLQZ
X-Gm-Gg: AeBDies5lZElB6wAHyybUo6BHMlBKjel5xy/ScP4s9sJHruijcckzFtXtgumW/wT5dd
	P1C9t5SXTzbE+tlmRJagYfBmiwv2lnR2tGp/7sABxs3RwXjLOtztnUfB5FFj6h4flNS41qNdmW8
	3pGgDVfkfP5gJfW4t4aNeOdWm7F+GWRX6c8iunTn9ogJJlB8Xr+zm5x+ASAl1S9MihkGo0tQU9w
	fmylqfnp/3SwtPqULJI6w1N3SSBxaSnbIxoTkE/1RUiDmGMu3S7oNoAXddlh6qPpPWm20SjfuFR
	yLxEVEX1+bmvF/PGQIzDOP604cSBSy0zLkb/n299y2tFi6mE9PrQBnjAog5193JAaoWBmOQQB7Y
	062gTmEpistVoizidwvBVe4CpQBCPcorda2vugbt5oTjCau+GlzF38EkxukxHW36dhdSV39aZeX
	jUftUBelgxw7EUkw==
X-Received: by 2002:ac5:c5c6:0:b0:575:1954:439d with SMTP id 71dfb90a1353d-57519545caamr763030e0c.3.1777899627572;
        Mon, 04 May 2026 06:00:27 -0700 (PDT)
X-Received: by 2002:ac5:c5c6:0:b0:575:1954:439d with SMTP id 71dfb90a1353d-57519545caamr762998e0c.3.1777899627080;
        Mon, 04 May 2026 06:00:27 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6d66c90dsm401289466b.43.2026.05.04.06.00.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 06:00:26 -0700 (PDT)
Message-ID: <95dba514-378e-4f1a-8050-3ee8fe96977e@oss.qualcomm.com>
Date: Mon, 4 May 2026 15:00:22 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/13] arm64: dts: qcom: eliza: Add power-domain and
 iface clk for ice node
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com>
 <20260416-qcom_ice_power_and_clk_vote-v5-13-5ccf5d7e2846@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260416-qcom_ice_power_and_clk_vote-v5-13-5ccf5d7e2846@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDEzNyBTYWx0ZWRfX5VE2fxzyrORu
 SgSNyh1aCPNkXscHReGh89vEsGic5MJo3eLM7v6AvdewB3rLmoIMKRskAWxl+WtLX6548xxJmXR
 oxjxI/h0FGWPpklKcZA9lP+asznK4ONvZS0NPyjN1NJIgvtWpz2YF2E/8cxkbrR3In3tfBqUVkQ
 ql3MuK9/ikM3YAdyaES1CT7lMbhxmVZaoCrJJ4ItZYLKqCYb1URf3K6SF7KwmMFSQkNXnjUhvOR
 dKXd/X5vwUx2hh5nPQkcJyYBNNxXPhyuUCM8cX2HIe3s6dr1ovisMy1iRzO2txRfsjptEcHlhEx
 O6qBVESybJIUngvrx1P0IY0hviNgGlzhn/AyLmlstTohM1imzW74KNChaNpBWTuGvN/kDvxGb0Z
 a/xRdbrNfYS7uLk4yuRq27zgZhGmGURxXW1d8qiTKmCVBldS5tOT2P+E1tWwxMgJtX4MElrRZRC
 majyELwCPRSbNIBGHmw==
X-Proofpoint-ORIG-GUID: pKObRm4Vmr4wcFCX2NHX05E_y30Ppjn6
X-Proofpoint-GUID: pKObRm4Vmr4wcFCX2NHX05E_y30Ppjn6
X-Authority-Analysis: v=2.4 cv=LdIMLDfi c=1 sm=1 tr=0 ts=69f8986c cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=RcdfdvLsBkETvr5PKcUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040137

On 4/16/26 1:59 PM, Harshal Dev wrote:
> Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
> for its own resources. Before accessing ICE hardware during probe, to
> avoid potential unclocked register access issues (when clk_ignore_unused
> is not passed on the kernel command line), in addition to the 'core' clock
> the 'iface' clock should also be turned on by the driver. This can only be
> done if the GCC_UFS_PHY_GDSC power domain is enabled. Specify both the
> GCC_UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for
> eliza.
> 
> Fixes: af20af39fc09b ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
