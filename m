Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3702E5B2D
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 12:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792154259; cv=none; b=QiyKKdCDok8cuq9x6Ek1scVEWcCHXDCR+i4b2i1HptzO6K2TwIivCWXV5EUPsbuGd7H1eFHXeicvw8ihNIxboum10e0LgD3+/pRjawnBANJDgTUtMUSfmwkIaDnCVlwreBOl5AJ5ndVXSwGtphMUgGj6sdaapX0clhKOEv4BMZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792154259; c=relaxed/simple;
	bh=6ULYsNnXuuMP5V5MqwyBSWGlXbT+V9+9/vXc46PHsiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qneHgKqtECx3YxTSssTsMCoBpLtY9p7YQZT/lMWwxD4OjO/BmE1BAXueKve6jBCcz68qIPmvpqW03p61Q9ALETqeHCHaCHC/BkcfacPqCFPVj4rVADVNYluNNe1u43dIaw4gqf0oz7sE2NC4xqUqI5tWntIpZHqZMaXm/QbJpW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YujULWuo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SSnwMHjZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YujULWuo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SSnwMHjZ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAA3mO2402951
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 12:37:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	smFMWotWexxQO1gKPRdeBevwDTS+xa7Iumd45V7n9/A=; b=YujULWuofzL9WQkp
	rjsH/y8mhDoDz+XT2qv5HwyslXN5mXkWNI7Tg8Kj+qk5n5+43MNklkGxeQyiJLf3
	MF3pTRaNcG/TLT3wnjTLrXGrW0Ff+4QlI70Y5mDHN715UU97bV3vzP2aKxzzHsfV
	vedLIv9fpa9QfYyEp4l9ClNMkN3HNyvXYknmK313UJVQi+ypvAPovEIstOv59RbC
	NHpq6FRSxqH2u6iVfioEUBR/ZhygHn+oog/Nltf2zT74vP+xljLEDmiDCpXGzpwk
	gu0B58MaIY6CEytkp2DkveIQuvxhtNNbiGjOm1cF1fzDOhfGwiWdVLL7exOHG/Kg
	WggilA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb19m4e3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 12:37:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ea8a9cfe6so116647185a.2
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 05:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792154256; x=1792759056; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=smFMWotWexxQO1gKPRdeBevwDTS+xa7Iumd45V7n9/A=;
        b=SSnwMHjZ714x5bVQfLhf4yMCjGOCnaowcD9csprIFZoPjh2KRy0XDdcYjGaYzGXjo3
         +Vyh3xzngYEFSaZE4W3eTmyiRW8WPPLmaGJCaSugXNXjg5WfkdbSamImIPQ9i4/8UIBV
         v4y3vSUcX5s7u5G1Lis8PDYvXGuI/cSVhULQupcgmG8GBjEbJ3PIbTPaQ3X6zCYXtvsz
         p2ZMPm69ZVL0xzW3zLLJvFOdN0y58Ix+sXs/iVaCURpMPoH1QLYCSoMhD4TVkLIBtgZV
         Pm3/iQVDhT2CKXGMbpSBHA94q1ylKaq9QXEy1lq/SCrf7ZrxiQrI6njGBtzF31Kk7Ajl
         8OvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792154256; x=1792759056;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=smFMWotWexxQO1gKPRdeBevwDTS+xa7Iumd45V7n9/A=;
        b=SOCbbNefoh1nwrxZOUKzpmTNBo0fPXJRsB/r2SkiNWsEnlgtiv5Dq+Wt0BL3EaukUH
         PSjCFsGk6GAm10jlBWtbo2kO+sdD3jKQT2A7PLdH6aBfAnVL85ezxIZFkyJegDWSJjxm
         x7qPaweTKP2Iva4T0rM/Q/Le3IJa2NAE9YV3Rlf9DE1WQqnmzku0Nmo/IEtyyVEBhpOl
         F4/4GinDHf4vIeMfxJM7OU36OwDuF7R3kt97cBksLZ+mx7ULqq5n1fufwfjCIttuqf46
         9FlrGUi9TCCJuabyBmAcOa7UKOgBSERla7hcIQ4xe14Waw0F8a10ZjuQ1tIzTNubZSzI
         WAqw==
X-Forwarded-Encrypted: i=1; AKwUvBw0soJLz6LqVhDkhUGACNNfUfHzSNkSw98FEsa3MAHbVwlJvoJ6WYvq3bveVLRu50OfVsXnC6xYxuKO@vger.kernel.org
X-Gm-Message-State: AFq9FYI8FP30GfQadXCczHiUogroXD3PNnQFOglZtHDuwDkOiTcpZd6O
	iX/rccBFAMkwhkZ8jIlXhmrTSQ50dssU8t8R9ZXo/NDJMBg4ADHnwPqlvG8kz57jSvMrfnyz5Ti
	nozdrCXv3c4MPQNgs23BPiprA+hK8wL98npwW/e1YS0MXeqbib+7PgancpW2n5Ki5
X-Gm-Gg: AYBFou1YDX0m/hO/FTKsQQSuMScENjRA3csD71j3ipSHEZwbtImRKmGLldEfG4OyJ2y
	L8uC/uJNc1L9UPhlVal2p0KoTzhyHjLNyAdJmBuAzb2UKgQtNiwvCec09a9kIqGqFd8O8iB7j3k
	CQEQPX1SbHzXNd5/eGgdd/FYjbnFAtXojbyf0xaMsIdMfW8DppNRYELd5fbqvUxvWR4fmxz2uLd
	0Nzu3ZLGfIPC7QCs/JfvRbZlMXPfq9mL/igVlJ+nRF++8gJ1nvc7GdOitYtFeieSkpOFWIbTdOC
	ZLayAbEQmsMAHuAizbmobfu7ypnoL1TgtYwiQB+941aAiNv7+sQZUhGmRYIIVEmEnW5lQlvz49Q
	DsNLRtnTNP483h/usYCGjvw==
X-Received: by 2002:a05:620a:2718:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93ebd6e4c09mr4374567585a.6.1792154256246;
        Fri, 16 Oct 2026 05:37:36 -0700 (PDT)
X-Received: by 2002:a05:620a:2718:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93ebd6e4c09mr4374563385a.6.1792154255717;
        Fri, 16 Oct 2026 05:37:35 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1d5262sm858422a12.22.2026.10.16.05.37.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 05:37:34 -0700 (PDT)
Message-ID: <fba94a0d-9fe1-40b2-87e1-fa8227ebbeaf@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 14:37:31 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: shikra-iqs: add M.2 Wi-Fi and
 Bluetooth overlay
To: Linghui Wu <linghui.wu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, kernel@oss.qualcomm.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>,
        Cheng Jiang <cheng.jiang@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>
References: <20261012122934.3240030-1-linghui.wu@oss.qualcomm.com>
 <20261013045527.56941-1-linghui.wu@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261013045527.56941-1-linghui.wu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aLdlOr9m c=1 sm=1 tr=0 ts=6ad21a90 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=2RtADc9jSS7t45LdzhUA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Sba5uh1A4Y5EGrRVf4ceRKLXK0h6Tv2x
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1MCBTYWx0ZWRfX1/URQw4FwPaM
 CSTpAv3e6NIvX3zFpMh4SwyBXkXmeUBX49enJWA/p7M7d8e+lvgYmc0rByB9dYGr5NrtfSmbtmS
 RKBGWoZ9FwxTifsKrtsYIwbXQvLNKTw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1MCBTYWx0ZWRfX75Mv93n72CxK
 2TAyM4K6KazyOI+gVNX56dw7e4Fb/pd3dmwIq4JRMdKlQjE1TF9NdYWnXV8CbDNK+EKS9oVzKG1
 jEbI3zeZApbUaZQx6COBzLMS4kAX7/ILK0TxywbcnzHl0SAzh4fy50J14OMNVUxmFLuDtT3Q2Uo
 UOIyYQrV268dKhp2l4l27T8CMCV9XtFQh+5VBQq2tNjQQIDTcUBjhlmGXNqPt+DCvyJCYbP7DJS
 AcDq30Bz8UbVGVAQY0FbEOQewh6XkpG8TWa1MBI0RpAMrU9pUn73nGqjCLMttL2ft2IXnczbyRc
 h1YvGvMQXpg6rFAjFVqh2w9BEQFJixb1Y4xpfx0NDIpsOtUb3QZHIvoJAjF0V8O7w27ML3HQbrs
 6NSCpWkAwqbaOvSJddun/sPgN+mhCnFtSDJGU8l7aBgAGBVWTT08CdDzDYz5g8DKE4MKsMlC3Ya
 UzU2kMxuRSEhXMoJWcA==
X-Proofpoint-GUID: Sba5uh1A4Y5EGrRVf4ceRKLXK0h6Tv2x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160050

On 10/13/26 6:55 AM, Linghui Wu wrote:
> Add an overlay for M.2 Key-E Wi-Fi and Bluetooth modules on Qualcomm
> Shikra IQS EVK.
> 
> Describe the PCIe and UART connections through the M.2 connector, the
> 3.3 V supply, the W_DISABLE signals and the PCIe reset signal. Disable
> the onboard Wi-Fi and Bluetooth nodes when the overlay is selected.

Is this not part of the base board?

Why would I be prevented from using both the onboard and M.2 WLAN?

Konrad
