Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866077;
	b=xX5a1gIQBOEN4ERKxT0X/9nxHKWOVeN+ct3pIY/fJJNF57ayxB89I3+NiQYw3T4FvijO
	 uP/Zd0t+CdSb8mhSvbMksgctRSvvmVa987XmU3apYVNNhaoojm40FVMjhLxqKanZ2js0l
	 zcm83dRwW/o1ZcHmEE9RLha0N1+5VJu4NwqhFx4gYwpFhGm9BnG8dEru93DBI5cdrI3Em
	 H7MMkOTinwbD9sxzik1nb0CZlKzDTLIflBJIshOEluC8/PnyswYcdLIQIpZIUT10o0GEc
	 ebOkbbKtif54Mgo8t8sjThCYgNlgz7amrkPTi9D5B0N6oBTpXx1QuMc21066G9qSmWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866077;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=K5CgyL6wkC55flU3cPg0zwdEWrmj5DP7BYobqVRqAyo=;
	b=CYrak73kBGGHKEFXtd9W6mu7RuBjlBPoVidghsCyNP0TaHkhh8KwL/302VD61xak5Ayw
	 +eBYIAHbM+DSUmhB9IICBga5nQG7xFvNf/imu9We5L3e2kd1SMvPoO0X53TKx/W9/QAYj
	 k/g6cbLfUsY+/qLH6XpAcVhuJqgFGKp9cDl+NsX/40iJ9ul+/dEP4d6tZ6oTHl0cX8G+q
	 f9Gp7Li+CDWQdu4v8EwpzOMCDuS9KfAA5qigDjDJoRiYNLdpogToCtS6MoCYzqJW/2pKz
	 EEvjgIhl41uoxUlUPCS+zgh/J/NMTH8LXcKOyZarF6ZykMniEw/YX4m8gaGGlJ1Xt4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OzQDKC7C;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PzZcaNCV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35B6606A31B
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 08:07:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B35B6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OzQDKC7C;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PzZcaNCV
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56U5Ht565137
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 08:07:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K5CgyL6wkC55flU3cPg0zwdEWrmj5DP7BYobqVRqAyo=; b=OzQDKC7CxAHiLMut
	iSdFiHG8IFC3eQGM0ZWd75RncmWLuW+xyVeW1uJBPYMdmyvXPqC6gX5TYF9Q4GNC
	0mSWiVWqV6IF2Yl7XkVhhpuE179UZCBKgXkpVT14+fzxC8bRDh6DML76K++sai3m
	JKNawe4sK8cWyGGB/0v1mYLD51kfDi8nIkRnlwJdlPXJtsYeTVO2koc3RZe6l+pl
	uJ0nOxWDhUpozvuN/DwVGR30B/QMVtgBntMQ+X/LBVMLT9v1bG0M+jDWnXLGRQgX
	JFZx7LIhsnrX9TTn1f7usIieUsy2I8XYc7WIcJqeLWAGKbX4NRuOzJ07VI2zJOz+
	9vjNfA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrkaq8pn8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 08:07:55 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eaad898904so29281e0c.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 00:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793866075; x=1794470875; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K5CgyL6wkC55flU3cPg0zwdEWrmj5DP7BYobqVRqAyo=;
        b=PzZcaNCVUN6WoqFdqwAvSQwqwEQvdgBKxjRfpxHtvea6whNOaMU99v4AfsGcpx6nGC
         1G2yd5Ac721TqyJ9+kFuntIJ30bIbRfWLfpAxaPgZrL/B2rs3YAe86kyndw0x9Ho17X5
         JpWptze+Tjivz73XCs1GFtpfkm9QJ88fBa8e1zeM8DlDH+ppreG3PZGiAEX+hmAIGJl7
         o4gTxyecLDLyDg/ULxEcluGZddLdnapcB2AZOpUilavH2sSC8Qvag27Di7qFF/kd6liv
         9UQAsG3GOdVV5TY/xD20V3Na71DAPFyQmM2gi2sIS+b3FQLDjpO21VdleLMXOgQRmx2w
         HXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793866075; x=1794470875;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K5CgyL6wkC55flU3cPg0zwdEWrmj5DP7BYobqVRqAyo=;
        b=P8TZO14o3GY90s5ZHzjdPOHaak81RR8VAffWPocwB0B/DpKit9i8nTnm4DlssTPfiz
         Et/IHce3lpGYWe8N7OH0697xorgeStDxb1n0Xv01XlsH0MpPm9Tf1Rvv9gmS16Sf9nIY
         M+IpW+u3Gtnyc6CNthi06NBPObfWAcxL5jErIcFK5th6Oo0QdwPsZVQFIqcqMWrnaCPq
         q2F21l6sfeJw4WRItHn+w3J2KPN9NPbYhfFfwIfLhHW+lGOMVisomMvDkFKpiozTUZD0
         x3TN6yQl/o1e6N8zbmQMNvIZ6SzdH34p/uSFtnfbRhnxWCrIOBwOUCbOs6qx5JLP9giX
         JR6g==
X-Forwarded-Encrypted: i=1; AKwUvBwvraPiulTrLI0rJ7n4GlRycFjP6CTbfrZCpsKNtS2dbrAlBqg4fKlBbiY0O/zV8130EoiJB3X5lG5M@vger.kernel.org
X-Gm-Message-State: APuU4Z+9fa5Hk0/dsFGoo38kZAyB+vvJb2DLOZZLp5DxP2B491w/B25v
	pHEDQimPD59wXTHY3nd9a+VHWZYULQcdMrnABjiD6DYpqdwcNrp41sIJF+UEw/OlUI/rxhqQZql
	vI/SexX00V4sDVxw2h4G1613IacSGMHxgxnCHBST1Wk72uVkd9wjmT3/xdg80XKZt
X-Gm-Gg: AYBFou0L1o9RZNmcvNU6J9jBF5qRdooKx6obSFKYePTfWxm0nj6XbxnV2h5R+lfwAWi
	9OMGJFo0WNbQg6sY2ooraRzWbFcstHyJcQctE+KG6Bawl/8jbRi558zZGJM4zt3mBuZ3OqN+oLt
	4A4WF7bvqEQWzUAnqvNIn4rlmxOdr/vTb6Hs1D9TUrRPGakZNIKOw8M7T6Ft2LwulmgUFvbfSim
	DTpKq+MfLIvtbZyGgBLdD9BTk/+ZloTGDVmvnr0MRS1taxbZAH4rh2zLWuGNI4mRVwp91HLoOXR
	Xl3OJ2RgBKg2evL4MMy5xXtrwWwO2W6te+IaUR8kHSjQCscNYAmpMK3ac3pWHvSTcbKJzlA/7c6
	kOWr8XsVM6jHr2T93a3ki4vuKfbcb4a3uPWWS7+KP7JG9F6tMx9bcnLw5U5CQjOpm/xKJ
X-Received: by 2002:ac5:cd24:0:b0:5ec:abdc:bb72 with SMTP id 71dfb90a1353d-5ecabdcbd50mr2502441e0c.2.1793866074905;
        Thu, 05 Nov 2026 00:07:54 -0800 (PST)
X-Received: by 2002:ac5:cd24:0:b0:5ec:abdc:bb72 with SMTP id 71dfb90a1353d-5ecabdcbd50mr2502424e0c.2.1793866074496;
        Thu, 05 Nov 2026 00:07:54 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e1402c6sm151963566b.2.2026.11.05.00.07.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 00:07:53 -0800 (PST)
Message-ID: <31d38c50-665c-4f1d-b191-55ce5d38660d@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 09:07:50 +0100
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
Subject: Re: [PATCH 1/2] arm64: dts: qcom: msm8994-octagon: Fix side touch
 interrupts
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Gustave Monce
 <gustave.monce@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
References: <20261104191700.676773-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261104191700.676773-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6esgINg6ZW2lvs4CMlzgQYvWMC2FZAnp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfX79f+3sDpUUVt
 mZQG8d2aESYS5WEyRrC1u+ZZM5RnPifThIaQeO3whsnqvPdfp/uIx2KRYgYRuM2yN+lNPuPT3dV
 w8996AhopUT2SQIT9gtEnwTP/9l4Iwo=
X-Proofpoint-ORIG-GUID: 6esgINg6ZW2lvs4CMlzgQYvWMC2FZAnp
X-Authority-Analysis: v=2.4 cv=OZoNnRTY c=1 sm=1 tr=0 ts=6aec395b cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=S5PwCt2dg2jEj5C25JAA:9
 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfX4MksMXL0b9Lv
 YACNcpxrO+tenP2onH/hCsdml/Mwx4dy+NRO/BI519LupEsTGZHYYLAA7M/pR9eZbPIsCQktsAP
 pO2jEI9rnhWRObU5M9/ZCotT1upktRgUhvvGLfexeBANDr6XcbyPrlp+WPAQwmWYWF7ntgaDHB9
 /Q+sE3gUswVhKOw87R8LQz3pLlXizs0s7alZuNcRtOr2RhkHR6llgpkFKsV2dr4+WZ6pAHp9OlF
 xLG/cDmJS+uzpPsSBtg2mTWC4kTpyFpEKj184fwfw6LrFh398mxsKiXscsnWfnHuQblVNyxt37H
 YuZnUUD1SlCyfvumLsNTDX0gYGMyWRkIyw3rEC6hDDdmYtWkNtASUH5RYThMeepVaHGZKx7eHW3
 kmpIwecCefP2LFlzno8maNZtN6Plf7An2ei4XDtH447+tGse+8lRBcc39xpjQynLKsOoK5Sb+8q
 pIv0Mi9HHxpuBtAKYQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050032

On 11/4/26 8:17 PM, Krzysztof Kozlowski wrote:
> Interrupts property takes a number, not a phandle.  Passing the TLMM
> phandle made most likely the interrupt as broken, which could affect
> touch operation.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-759fcb27-d081-4ec4-9683-6667b54fa3dc
> Fixes: c636eeb751f6 ("arm64: dts: qcom: msm8994-octagon: Add AD7147 and APDS9930 sensors")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

fwiw

https://lore.kernel.org/linux-arm-msm/20260911-topic-lumia_drop_captouch-v1-1-6f92f1f3c6d3@oss.qualcomm.com/

Konrad
