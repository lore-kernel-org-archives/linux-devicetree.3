Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBE9470429
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 09:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792230806; cv=none; b=paO+pDyK5aN6rBr5R/uSYHI2FzF1vazPK3gOq/szKVQUstqI9/mE+0N5FUJD1OJfFLrYz5s3AE3RvnZs5ZYndFFeZERWsWYMMr5baVJnp9Fuc/s9i/d9L5XsDiKLNm1LHTZuaFTIcxc4jH0rnpUXKrDX5iz+rlAo0pFd9ov14RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792230806; c=relaxed/simple;
	bh=j58n6xlP1WdLlmhvGi/Za3kYOwUNNCElJDpoHZoH8UE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vFrZO++hmQjtKAIBg77Q9XcEHxplp3M6SjNsCr9kuqmDy9QuXRtzOUYb2Mqpopn0aseA5qzw4BvF0eF8KQK+2fsrt0YiqSg858+4BmhYjtOzdYD9b6O4q8iG9j4VQjGF7Ma9G0MrDP/c+4JbOUJJXajLiKcrDic702cnG9OqBG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X62dA5hr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MXz/lOBQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X62dA5hr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MXz/lOBQ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H6o2ta389746
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 09:53:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XtXS4yD9Try/qCHd07nuVF72
	fRP9oxFrjzBY101VuBE=; b=X62dA5hrbOOwcSzXIK8DZjEgKA5+PWQ5ybpWnqa1
	8yqIdGl7fAX+uVEehWCiT85sopw3Mf8a0BJLphDpWhJISrG4OpDzE8A/v+WorWyV
	yIZjMnqVqyPo/Lc2cLQrEI2Hf1eirStcsENm2ZfyCU5nikmbUYW7ADHR932Klq3G
	TgHFR3n7vLI5AI6CXDuD+aB8prHUGlhHpCxYQ91uNwoiVIc3Xk530e2pPy6QE0d+
	8fbwAJu2Q/RHRf6nLmV7Rcsgey2CNvY67Iib5dF7dcAi0NRJMiUL4oh4x6xu8uGl
	EiJYSTp3kQMXWKGrm8ptLfW5khDdZU5kaEzcLAX3Abau7g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1838n1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 09:53:25 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35cbea41088so1014895eec.1
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 02:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792230804; x=1792835604; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XtXS4yD9Try/qCHd07nuVF72fRP9oxFrjzBY101VuBE=;
        b=MXz/lOBQvaek5smvaQ3dO+1Z+Ay3XeWy7UAfifQCVFxIvup7ugjMNdhOO9AQnXJbhE
         ZuNqJm5hWhH1gG8IAW5knmmdLFlB/ub5XfnpQLkJwCFG/F9gAMkPopD/Q8j4b1/joyiL
         i3CVLXiT1OE37LlQy94MhJJuxKQU7b0Su0EZjB6Z8eGjTCgDj95oTER09cCT4U53b4q9
         Gi5lnCRCpWr4C+GGiTTMxW3WtddqI979Ot7ud3i8Oj5X4ndF6FmpdYv3EeO1FY5sGUz5
         NcQyzkE/c+36QZYeSWyoXXqF/tJLoB9SyVtnMiIpViPdPxoHvs+AHod4+GYclrnWIkUp
         gyVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792230804; x=1792835604;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XtXS4yD9Try/qCHd07nuVF72fRP9oxFrjzBY101VuBE=;
        b=iDgEPK3SkevpPRZDRhXtnFOXRNXFeRKqYWr+2OHy7kI2ERrP+wrIr2V0nDfyglGdFr
         30BppLxh1KeMPf4jiPiUolKhFkQZ2TLzi8DdHtZXJPTyicVnIDqcqCoHaeidzf5L5geo
         QZ3OmYF87WZyoiYKGpR8YcSDfJMBKpfksteyXviBx9fu4aN3TVZ/efuHU20K9d0xvw6M
         Owifqw3JpSmq47zJGllJIkMgLVWGdBrwzcJjWrKUYe43XS1huC2DXGHQQVhv6YGo/OVU
         3Hesa3ixSLISsc5DcvZINDk738SoawPgNxLR1fmeHD6i1JXs48LJbe1KOTPH8TB0B3pW
         7fPQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+9+p1L2HgTSuNDb4ctJ7EO2yDQqRZ8g7tSzzBEXUgGGLwK653WjjvCbY8K2G9zxr0DobAbzlM/92k@vger.kernel.org
X-Gm-Message-State: AFq9FYKMZVwh8b0kRMB/4SbzVOeKV/iswqsA4rebYCrt2lBDTWQvxksB
	1Ei2CRYOQrOByGrvl17G/+RKn0paGmwGBgVQNypM4YwQTSWbTrzxG4L3hvLmsZDyEbfJMarzdND
	kzJOAS/FNHLdtTN6hfyE8xeRKmAIo8Mc2XKB/h3ucr2MZhbqj8kf6ebzoi38GIpot
X-Gm-Gg: AYBFou0LZQ3UZ0c0WnX00MSeygjTXYL2HNrKjxZzxSGGLcUnXgM9BSHulgdH3mmP6Uz
	LsC5kaw5XOaUuerdP4qVNIC6gooBAmWupdgpOEIcwkVRr9lJiA6Nbur7dgskSuKAceB8C4kNd69
	kddpTk1UKQ4RDRbUKhy7y5v3bimvTDCjTEM+CuMcj1ubRZYJBHgyAUCzjrUCGfzRprCeN1ChcWu
	fJnmejU2M9B20olhMyiKfMJhBFm2ElfTpNIS9G/m1rAfqmoxCM3u2z5S8jKJtHfg3pmxA36Szn2
	OIp/0yuMBjhQsDJGIqORCyYrtLqPjWIqlrUPVfN1g1I0EeomXu2t20i2XDmrCXLp/PRnEh8toP9
	KPGnlfILN7Gn8
X-Received: by 2002:a05:693c:881b:10b0:35a:47ed:c39a with SMTP id 5a478bee46e88-361a2f333b2mr2990936eec.37.1792230804312;
        Sat, 17 Oct 2026 02:53:24 -0700 (PDT)
X-Received: by 2002:a05:693c:881b:10b0:35a:47ed:c39a with SMTP id 5a478bee46e88-361a2f333b2mr2990870eec.37.1792230803002;
        Sat, 17 Oct 2026 02:53:23 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36083283478sm13189465eec.29.2026.10.17.02.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 02:53:22 -0700 (PDT)
Date: Sat, 17 Oct 2026 15:23:12 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v3 0/9] net: stmmac: qcom-ethqos: add Shikra
 EMAC support
Message-ID: <atNFiFvIeecfcgAX@oss.qualcomm.com>
References: <20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAzOSBTYWx0ZWRfX5iF5WKtOpJ2H
 hoA+xRlTYJBVZOO0kadJ5RmzU586ku7jLD9lS+iLU61P3RcfTwTKl1BC1PkcAfoRAI8UUG2K1HY
 xpI/E3D35Wzommz76Ea4zCx5Mnv8qIQ=
X-Proofpoint-GUID: dwBXESm4Lqt-K_RPrGJLu-3zAgXVy-s6
X-Authority-Analysis: v=2.4 cv=Bu8IUoX5 c=1 sm=1 tr=0 ts=6ad34595 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3MThnnmduzqR5zQ_0GUA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAzOSBTYWx0ZWRfX5THa0EvzeZSz
 WCYfrQMCInHqqYpNYvB/IgEXZ3j0udNI9BGQX32iV5GNsuKKk9Q2L+wKyoIXyUsfbypeOkCBnL5
 1pQiLhfUk5W9/OVlCg0mw42dCCBp/U8liOk+cdyX3kzh73JzAe4hEClApjkWks7jhOkSZ1T/qZ2
 splEpuuGlajhesrH1AMdZyqQo4HiSLS+CiDtF0wulOD483YD5n7VtRyHX8CjrN/6lVjmqtJoB5Z
 NWrc0CsoLuobhQRq7Zf8B74KmQ3GruJxw+UgAz0Qb7lKXlKcEIiMCM1DWVsuUcN6CUF4Tttqsp2
 spJJ7jguX+qPcUJPiU50qIl6D34WY1BrT7kH1yO18Gwshy7D8m5i8b80psIm31COXVE+9FTx8As
 TQLO50LCS/nth2Hboccgf7/gaHHg6h7QDAJifw9Nz300Mo6uos48uZQWJGAtnLMl+LKfe6iEJbT
 hB1vhhxYAqeWVL3tFlQ==
X-Proofpoint-ORIG-GUID: dwBXESm4Lqt-K_RPrGJLu-3zAgXVy-s6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170039

On Sat, Oct 17, 2026 at 03:15:11PM +0530, Mohd Ayaan Anwar wrote:
> 
>       net: phy: dp83867: add regulator supply management
>       dt-bindings: net: qcom,ethqos: add qcom,shikra-ethqos compatible
>       net: stmmac: qcom-ethqos: convert ethqos_rgmii_macro_init() to void
>       net: stmmac: qcom-ethqos: fix RGMII_ID mode to use DLL bypass
>       net: stmmac: qcom-ethqos: warn about legacy RGMII PHY modes
>       net: stmmac: qcom-ethqos: set initial RGMII link clock to lowest speed
>       net: stmmac: qcom-ethqos: share common GMAC4 address table
>       net: stmmac: qcom-ethqos: add per-platform NOC clock voting
>       net: stmmac: qcom-ethqos: add Shikra EMAC support

There should be 10 patches, not 9.
Looks like I messed up some b4 setting and it dropped the bindings
change for dp83867. It is the same as v2:
https://lore.kernel.org/all/20260908-shikra_ethernet-v2-1-bbe3389d0652@oss.qualcomm.com/

I hope I can resend the series after 24 hours.

	Ayaan
