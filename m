Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792751087;
	b=uqs+ja1ZPyu2KQHCMfHXwPgWf27YQ39At4DAeuS7jUCrOVkGu+qQJJp1Uv5veFM+Buec
	 TVeq2UkI27UbApxo+R/MU3df/WGTjwdIwnBh4v/yA+g6VXvwyuORo4KpZx5ea1wkfNRO4
	 nuXyqWqmggkz4Pi3Xu2w4phBIyOHEy4kVZHOOhv31v0xtLtpSjJibANuk3Az9mUPA/dsh
	 PtdO7fKS6ANexF4dh5UVluP7U32qan3PgWkbBpxAd72fGIrbc/AIcck4pZv7Zf55KVIeE
	 ozIKUsBtk4RzTJ5vuuSHnL7ulr07WKd3Oa6EPft8Mlt2yYMAW6uvqibZsYhF7F37usQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792751087;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xaaScOGIozAWpXbcitdyI9ltdmgfQyDQm9ySsdDqK+0=;
	b=X4eYKptlIO/X6OxLEH2KUX/5POWW4akepfHLbmdqCGVCTZsjQL4K60Nu+c6EqCWcfN4q
	 SEs4OAXQIjOtu5VJtA3EAC417/XPnR7+MDgw7aISjn6gdTc6znLLOFT1z4wmXqfYcU+MY
	 nThRPJQi8G3HUkc0HXF4QYX3KDT0qfBAyyMF7evHHMTgK+6ah/zwtF0XyviX+vlV7fd2l
	 YMpUD8t+IiJKi/6RYS2nRjqMmD2IlQRTLaX9taJcUHV99AVAjtXFRGwwHDYFGXkorhAss
	 M7n0OzUHCnGkpjd3EBmzKqQciSEHOoumlUFeRI9R9y9NvEMa2EwajC+v0P9uElorqEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lyzXtAuw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BzHppfrh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F471606A31F
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:24:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F471606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lyzXtAuw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BzHppfrh
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAH6D1597391
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xaaScOGIozAWpXbcitdyI9ltdmgfQyDQm9ySsdDqK+0=; b=lyzXtAuw69wpYjha
	pMHrUT0p2kEBkfcfdpMFEmya0cZYYFkuD8waEtPZn8eSr/tFf/UHh7wMg9W0Np4o
	3d9iggS27yhaJeSrOQ6pGSZlwTq9eOiVgulI/UDTpDWy8EM29oaaZGV1uOlASvA8
	kwb2HFQImTUSH6x1r6SMVcF3H4w454jZ+R1l1+v4Vk9PxELDM6SRh3VwYn26SuE/
	SvhBafkK+wOhQTeFBat/qk4Ssn1uqLpzhtei70N1fvnIa+CN1j7iD7Z4Y69tjTl/
	BX7+LiWbWT6S6pg9H0EZp8Hj3FEK8nSdUGBFhUECe+RQn8XylW8Ksy7ugFrVwRKR
	FjBZEQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms36qv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:24:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc50fb0d2so15442785a.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 03:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792751084; x=1793355884; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xaaScOGIozAWpXbcitdyI9ltdmgfQyDQm9ySsdDqK+0=;
        b=BzHppfrhzws9t7xJX/+eZ5S5bA5NdHAfaqG1sk48XWjrQARwfLNXzCi9odpKPHUJn9
         YGgnTGKO4NoWjh2fO97w9y/y90hQXIBIA4kabsOHRC93lR/zjbf7T1/pGOFaxHPC77bA
         rZBLZq9IRuM6hk5jGdHuMLFCWbsAkiN7rLQWcbuqf0UJIdpeYW0Au7rxhBTTcdbu1aFE
         t/vgj19vuD+AF4ewR7d/xdS7beLti8bjAbOoaJVF7Y+ExtsJI2MsLjlbdr4Y+wLM5HmY
         5/Vo5feWwkeHSym7dCEwnYMmqZrEAJgJFs2xk0en+Wq+y34x+fm3ve/8ZGAEr9cX0kCY
         bmdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792751084; x=1793355884;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xaaScOGIozAWpXbcitdyI9ltdmgfQyDQm9ySsdDqK+0=;
        b=aE61tHef4xF9WKhGTNyAHsVWJJ5SN2a/s9ROn9k7esRneikcNCl5OI+bLGSrnCwgZr
         PMweM2M0bPBh4s8qdSLQGkNpTps4NNecVCUy2ncUaUffYUb1Wrzo3jN28gWYRdelaU/A
         YWJsXwDNDdskaaZl4pz5/fcrPXWscsUJMqj6tSFSjSbnhJZZtGTwuxQEE5Mldj/280OY
         /4GeR8TPMsH7N5e1ogPeRaxXhiOWgzYPixSdS5Ds0TeO2+A4XPb27nfJ4vtc4ZdFopFS
         /UXUSTztEEpaik465rGw/gDIEpDBgLQcMh8wqHhB/YgjqnPCFo+Gnfz8TtfblmkFPqtg
         cD0A==
X-Forwarded-Encrypted: i=1; AKwUvBy9irmN38/V5x8Nt0XbwgaTX2VK8BGF+4dqlSA8+GKAoP7dvO/uot4hHOuDe8gnkO26UCWz6J+ydkhg@vger.kernel.org
X-Gm-Message-State: AFq9FYJzMPomTctXP1UAcRTrlrUI/OJosC62CVZvOqcEKkEgCkkUFUP1
	y5Z3UYrXEhutT2E4hBjDrK6EYSKbMqKOpQhcSSpKZsJjEAHdWIqMehneUoisA1B2pB3j5+gkbVn
	BHB1OSG/1Hm0apC1OPqzvPLZqrDxNRHXbSoInxiz+lc0IewfJVOID0LqKBZuuXRUY
X-Gm-Gg: AYBFou0p/QYiV4K3z151BjjmkgwH9Vr9EObcN0w7gmylfKWXZA26dVdFXYILVcZWily
	sqPgSYGECmjf3FCngsWD+K0OvIFaCKtjTGxWrCG9H+Er0AqgpgYGhAoKxcMQoRgTCTa+AqWurPN
	3JOuNipeWxYfRakU7HreMQ8CFiwRcCHrdW+fBll/jRbzlWu7wFkqkrRm4Dccen7NLFbQeaQya97
	BWxV11/tYsZlKz3B5Hd3kgEXZspNXZnGCDE+Wy1FbLqGrHPDwZm8FZ18TwDNzZjSbfrBLXxV0KD
	lmZGHR9aNHzEcUZz7kuWM1yKIIH+ZCDlJbKXHGb5NG/FVa27tSpTZjVEWpoKc6TaR56EypJAvXg
	g0I5V3c8A9FE4gu8ofTIaWw==
X-Received: by 2002:a05:620a:72c9:10b0:939:c7d1:7471 with SMTP id af79cd13be357-93f6f926212mr320692285a.4.1792751084521;
        Fri, 23 Oct 2026 03:24:44 -0700 (PDT)
X-Received: by 2002:a05:620a:72c9:10b0:939:c7d1:7471 with SMTP id af79cd13be357-93f6f926212mr320688485a.4.1792751083725;
        Fri, 23 Oct 2026 03:24:43 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5cfc82csm85128166b.81.2026.10.23.03.24.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 03:24:42 -0700 (PDT)
Message-ID: <050e53da-4e95-4c45-9b8e-ce3c816fbe90@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:24:36 +0200
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
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: kaanapali-mtp: Enable
 DisplayPort over USB
To: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com>
 <20261022-kaanapali_dp-v3-5-b5ae8e6083c3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261022-kaanapali_dp-v3-5-b5ae8e6083c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0MCBTYWx0ZWRfX8NgSS0wfFfLj
 1PKHjeJjDoJPf45I2KS5HSYp8Hj158nhbqel0YPCW3ZzExvEkNAGWDA2KZWfvcFc0m9csV2otIi
 vQnrm0pBTYZZXu/HpnxAgtFJHlT4fruXqx5bX15dDmR/5eGgHQN/yE85y0Ke4+2lBNYFwrVrFR7
 WgSx68Z5l6sUzQBdgxppBi6sZ/nbnDT5cs5Ya9bjRyIh7eD0V5/3kWy4juk2xutskw0PZxySXah
 wJGk1W/8iq2g1DHJZxcbdSf1l7n0tEfrLVqgBh4bKjNNfe1NDrqOjY3UQySOZCXZij/Z/aJbkoq
 IPYmR40POJwj1M2gsIKyNf+2EUABtkZTJIlPyCPQHwOKGWoszpfiyGORaP5o0cqkW0EhdNbbuoP
 evVf7+c2TR+nBX1KpYmqfrpACAFIHn3a7pN0tBotRiK9XtRwoxQ3hMEWe+UtOI4FQBbEUASiBXf
 M4zu+Q6+GP04p1TbHCQ==
X-Proofpoint-GUID: TMEPg0L3RGIEyaU8A2OjYYD4yPvTEx9x
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0MCBTYWx0ZWRfX065qLYaDEaD9
 /Hr2Eh7WXV2iySKxdXbx2WuuZGuhha9GFqlDyakUK2P4v8/io90BDyvt9wIiG/qSlfTufFeTaSE
 BTNs94WB1tSi1obsXFxlP33zwxEyCcI=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb35ed cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=9izfxpSnjEJMC5M6MUYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: TMEPg0L3RGIEyaU8A2OjYYD4yPvTEx9x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230040

On 10/22/26 11:49 AM, Balaji Kalkonda wrote:
> Hook up DisplayPort parts over Type-C USB on MTP.
> 
> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
