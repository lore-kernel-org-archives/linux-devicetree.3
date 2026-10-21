Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792578892;
	b=3nsOAAvUz7xC+5WoQMP34X1vRlwgFaEVInEeU8tEw/XTClQHfulpQn+znOU0enIxHvqI
	 bcfEUNI2ELOqhcYY79TNX4h/yClrms0M0hSInkv5NV6/kW8wRyIcP4hcO3dqK49+FQdUN
	 WdgsWUPe5pHaF//EHd2FjPuAtsskokSP5v6d/tcgRA05Er+lIw2+fCG2pRZdpUrelcMxd
	 f/YbULL3X2bjuSd93CDcRlrxfd2KZ/gyDT80O6HdIQPI0bmT01eBfZfiV7EZ4mPZas7BB
	 aLa7za2GB2R3ytzAh8EzMnHCI4odu/FmPcgYaACzp7ONOBjvFAD/fbmvy86e19/x41w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578892;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GRV6xyghtvclnyTeVw1ch2ppma1cwDC0cp387OCS+mk=;
	b=KnwBbbizmTsalFqdc5CDkq/yjXrGPA/3YPa7GGlWXoSQfhAqHtpFcI6r1G8WZc6849ts
	 +JO2CsJV1hUPemrlfc5LM1Gb0NSmsd/DbuZ8SCrIiEhGhdc4SAa/O67MWcc+bmWzjqDnj
	 iTRgDog4kjwmo1id8i7Leexdq/fXk4pG4QjiM1g0CMh1wCMbn0qq/FUkw2fNRGvwVAGcs
	 c6Ymr8sMaxLTkWAdBFr7gFDkSvW2f4YUmW3BRXLJtWd/LUXzjdnUqdophwoWT/+G5Ms4k
	 TSBmuFInHm8suFlNsAggMig+3e1HIhwWGQyJEPBDzaXqN+OuGZ0eAvIYhzWw6IQLesQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="eX/FNpXU";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TS+kvIc1;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BFC606A31A
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81BFC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eX/FNpXU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TS+kvIc1
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LAJY5d1422161
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:34:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GRV6xyghtvclnyTeVw1ch2ppma1cwDC0cp387OCS+mk=; b=eX/FNpXUfuenY2Ci
	2H6fPOnzL1G/ukqW3h41RL3Ppdv4fb/9Y9WyXizK1AuN/zqBzTh14wDgkVXuI+lH
	C7az/ySApzI5KVb3AKzf1KrYgTD+diCfzchyFvE4QTTW31uprRaftSsaSW2UgmVb
	7CXftigCpNTHEpVR0eToUgCXUmobcqPXsFacTsCmcEU+hy1YfzPIDVzRD/r0Va90
	fbnNrfEKJAxvoAMQKD7r4M0rhBD8q87yUrkcrw0FhYh5ZiMf9UNrYiUVw/YCtKUT
	oeI8Ky9E9SiURn3/f9E5rEiENz7J7IAGRjYKCSwdazYdSMPlbDORQjAEYF53dbC2
	84mRZQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heuhug1jv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:34:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93edac5877bso18052585a.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 03:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792578890; x=1793183690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GRV6xyghtvclnyTeVw1ch2ppma1cwDC0cp387OCS+mk=;
        b=TS+kvIc1YxETwAdzrHZZl8hdfVSnxLkFDqGajuvIAe4j6/xMbPyPJI5QkPenpAyjI6
         l9CcPmJtfglG683Lu8jZg84Pc/W25dKJT2E2Jv+ct3cwaIYqCVnU1zVIQHOBWqlPKEgr
         fTaBbo3oF9HvSsWaqH2Wofzei93riVGYLo1CzNsdJFbT0+5APc3jQe8h0hpBcEKTwWEp
         Q5jL5HKhk3zq6kxEObmwqCMaDg4SrMV5VeEFgq8QtaLV7EPg1ZCot8novBZ+ZNNMyxta
         W5HKqjKdsrfTw01/zDvjibNEv/dzYR+n2azzkJQDI7VWlCXsmpc2R+vqcaRoj5sJ49SD
         dhXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792578890; x=1793183690;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GRV6xyghtvclnyTeVw1ch2ppma1cwDC0cp387OCS+mk=;
        b=rob9l4KABDzZEKwjrLEkUSqg287xBpHu9L/R47jm88IoNv3uLohvPS9k73UMEvoM5e
         YdoulLCl6Bhs7v4J6Khl7ubEivt49REGJ9CdDKAAa5JGm7y4mXvz15QSGo59YXUF3xsv
         A8zz7ILF9fWbBV73cU1G/s/BwbJ5lwoG6gss2h+w8YFVQ9IRONEXZXRKjmYULZrHqhIc
         5BUfUqTlrSlSAvwJEXBUhhXpLzDvutsvtaedFiHi6Y0+Rb7HucSwER9iBYNIqFijKPYz
         9A6Dvbwddva7HQsYiHKWaChOMv40sT3zVNBpoQyeuWY0bIKOaJnx9lfQOmBM/v1OBV7n
         rnxA==
X-Forwarded-Encrypted: i=1; AKwUvBzUrboXL5SVx3oDSqv4slEI2J1kJDbAv/F7g7Hd9U/ITEF64vy2jsFKMeQPz0lviV/oSfNiJuWUN8tn@vger.kernel.org
X-Gm-Message-State: AFq9FYLZKgBf4ks5cjyybX29mg7hB8W4OQZLGncDrPsebOLxpXpASrpG
	b05P7BiV8/DeLLgFPN2QD5f/qtRiQIfJ1kqkYawgluNIAQ+9XG3k/2l13H1uO0NGKiZ+hjufrgz
	4FRy30A07gQNOCnzVaXbEU/Yt2RHXG3i41FKHQylMOv0NPtTe3AUYQU09oAIwFIgk
X-Gm-Gg: AYBFou26YR6WGWtZu9DFAjw5raf53IGa/5RtrLGdDKyzfCFgIGq5Brx30F7E2Dqws7y
	xqzDdho59tECQeYznrOw+hY+Bu+TkfkGvIHSO/+IwIPOljycNVcl+sK3MdBwysU6FCyMiyZZ6oB
	3UmBIAS4YcQ/oKBi2JwCe5/ZDujoUjVwi7SizUw1NO4smjO9z7aPeqAikOdrIdXqfayLochmyHo
	lXW7zmnn0kWEye7E3Hd5qAsHOKAEpEux7h3tnOUu00Rbs3Fc7OfNHG4DmDP6eSHHWitzh28lZM1
	1CDdlYkqPnYg2aCMWVZEPzHhAVJ7Cp05/c76uVkLhtQ/A3D4CIBVmzQZKk3kt9PN/9CLdaLSJE4
	m/mLa1Vt2Y7Pqllfb9DbNyg==
X-Received: by 2002:a05:620a:45aa:b0:939:9205:4d78 with SMTP id af79cd13be357-93f57f96010mr378214485a.3.1792578889888;
        Wed, 21 Oct 2026 03:34:49 -0700 (PDT)
X-Received: by 2002:a05:620a:45aa:b0:939:9205:4d78 with SMTP id af79cd13be357-93f57f96010mr378209685a.3.1792578889412;
        Wed, 21 Oct 2026 03:34:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678fa80d7sm62589866b.32.2026.10.21.03.34.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:34:48 -0700 (PDT)
Message-ID: <be89838e-0eaf-4b6e-b77e-7cb89a2351f9@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:34:46 +0200
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
Subject: Re: [PATCH] arm64: dts: qcom: sm7325: Remove duplicate motorola-dubai
 dts
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261018211638.1137923-1-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261018211638.1137923-1-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=d4JgWhjE c=1 sm=1 tr=0 ts=6ad8954a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Jfzu7Z7b5MERT2nfZJwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX40O2cwijgV88
 Qx0jA14WkF7tg30XpdpSySFqxNbJ8YeWYJAhfDB6h6PcagVTH9ilbCazptbbniDU3FnPxtNcMqE
 0HdfnLDb7gNqI5l5l8evHWeZwLwaQBk=
X-Proofpoint-GUID: IZOpaLvP1FNI9OC3uY7Zm7L4Py16WO9k
X-Proofpoint-ORIG-GUID: IZOpaLvP1FNI9OC3uY7Zm7L4Py16WO9k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfXy4x16UGG+dDz
 UT70/BI4PfuNtpQa/j5qffEH6Fvro6tUr+OrrX+GddKGklesLdIB2U4F3klEJc+eC8PI94e08ig
 SQnQ4OSuuvtQImhv5yrcdCnIi8Oe4YrIX2/r7A2h2NNfh6rBZGU5kS2wvBjOaN5Ze9MVw6aw11j
 TftheYiXiri7plVALg/UlbxKaXncX9CbSeEI4a6CZYlGJ8KFOVGndIZL4c5BZZEtr22C59vt/1h
 ZMv6G//iKPQlaE/5xNpoAD6s12Dt1Z4Jws6N1ev3iAw4+hg34heko5hY1qeR4f0cStG9DT/AP1n
 +c38qchtWmSmIeUEkaDs4OqjFvkmoWYumPh3f//3B34KGGgDxHt+ejU1UBT80/DUl+HqGhCfpfc
 uZzSgwfybKg5z1Tl9RvKQSk60s8WjYkMilTSbbA2rbyvdoVNXChdospGd0HGQR32LM9jWOCZ//r
 sdSQx/6Ge8HpTFOgSLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210042

On 10/18/26 11:16 PM, Val Packett wrote:
> Both v2 and v3 of the patch series landed, so the non-split dts is
> present alongside the common dtsi + split per display panel dts.
> Remove the redundant non-split dts.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
