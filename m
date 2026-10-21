Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792554105;
	b=EUpQzWUAppaCYZvu8QYaPPuW8T5muM6U22ACk30feX8Yi5I8DYMlnH/+hxHatJuSp7Kx
	 qr6gxtvaChCzzrGwBVAQBElajmhxZp/wax63/3hBH3SBm8WuD09TG/aKi+UJsEzT19SN9
	 C2fOkJNGBGxCEcM+bCFToYYRoSByZQGf5FSecV6kVB8m67HlGWjevr8nHcGaqHl3i5OYk
	 WdZpJDhRPuGTCTaO3jMSsPFEn9NIMgrq5b3eVlPaGxCraDUPqCAVZnc9fTUPEgKxgze0u
	 2BS3bO6vCNSR0FD9SrM4HEWfeLzqkLFNC7hlM05h83CAq0I1Y9k46OM/AtTfHzm5rRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792554105;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=z/poii7ntCkR5hoPGaSnYaJo+ShhLQXyXUGSuRcNbA4=;
	b=MVg/gjYxn8FPhNUQM4Np9oayCa5rU3FJCbcCED4+ir2rMdPWxskL8NpUIn39m5oI7T6H
	 L21z3Pt64yn6mbCbaE8th8AREDcMOkI5npZXaDEKYUwNFGFVikpBJjrp87JUHJFVx5+Dv
	 hBbYK1IfOEi6kirZKeR/pWy1+tNmco9BKaWQKJXn+wlgkLxNFy0i7vFVyGPU3mgz4NwY+
	 pDZDXPndyYlvL0vgOs0GGGlGiA9zqzNJkeWaKwVhcKYtlzYbRgGcZ7LnWB2mfzy9a+BzB
	 e5fV8OCaGS+JHhFGUuEtbE2O+p6+CIvZAKoMEYjD0Zl28CWWjbk+AJS0cX/BbBmhe9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vssd5sII;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CcJeIcHc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4652F606A31C
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 03:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4652F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vssd5sII;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CcJeIcHc
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2FBYR3116143
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 03:41:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z/poii7ntCkR5hoPGaSnYaJo+ShhLQXyXUGSuRcNbA4=; b=Vssd5sIIrq4j8ts2
	ijkmHc7MV0i+ppTspuxGSeXl/ZH9hsFZ3HwCKL8402xJXkPgW6jllrGqbPa+afbk
	/1usO2KZxw7ZWF+UhVts1cQ26Ewagw09xYtYXjCzXlqmrGho52GS/vTIbsNzRAiV
	ozBsNyW2T2N9qOI+UYJTUI8FToxlgY/go1Kt9EENR2IGrhWyBfpOOxwzD+IDxq4x
	Lbo86PHKV6K8irh+5hYZkARRqsJZCZq3q7Jfhg9XWEB3M5AEdkcXwvPk/GlnFxLO
	Bm8tqNtDX26AcZBX71YpEXDMWpoiYC5/HJ4k2VaifOuloot+pspHckXLJzMN7sfp
	qIaVgA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9hsttx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 03:41:38 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35cbea41088so486394eec.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 20:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792554098; x=1793158898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z/poii7ntCkR5hoPGaSnYaJo+ShhLQXyXUGSuRcNbA4=;
        b=CcJeIcHcG7oDszfV09U574nRRY69IX5wtr1qG2u+A+7FlbMujc4wDKqWUoarzUO5D6
         FgIaA9TbK32E10WfJH0F78ozHHTDZC9J1fKS3bQiy73JaLCPrOqvS4TOXoj+aUxw7lwu
         iiFTrJRdvD491zUlPKBlNTPDPI6cI+7P++l/uDLhCZHx+NcCPmP/CVFg/9G6KSJS+Ba7
         DS5mSgVohhQdWUhoPJpqyXwgPoBpWN3vRnz8Cq1kCfyF7r87EzoMlw7S5jW1vwuEYfl0
         u++FlsP4Y2V2tDPUEukjwmuii8ah38So+lB8veCXiDVMUibG+r1xEqllGX3opWM/V6dD
         s/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792554098; x=1793158898;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z/poii7ntCkR5hoPGaSnYaJo+ShhLQXyXUGSuRcNbA4=;
        b=dpIg7/Qwxbj27Fb8cIHmr9I9JfdzYLkL3fCZsroUCPBc49U6Hsbyyig4dHQ4/hIig8
         2vvi+y1pxChArLqyk/Vt6pOSd0GzzbVvuLXyz/iYA4us5ozqBKX23g4cIrao8gRftcJQ
         iHnkjoG+3/S8sJw7hvfIFminv5VXFttse76hT2bQzYjCRIIemO/QcgcX2hmVM8WZSYfA
         LcvRPTckr/GV3HofWi8OXpxOlqvz7eoShCo+4gIqHHqMPxvR8W90BobetDrUkeBV+/oA
         7BIekPRs+VpXsrC68B0ryIsXBcHsb5I7oGxN4V0JW6X0TDfgoXZCssqYIkjmBvXmH7sw
         Wa7A==
X-Forwarded-Encrypted: i=1; AKwUvBz12AIQRs3KLjB7uFSD+fO+ui9rFT0pQhu0k904HxGgtkHvPSwjLqX8JT2yupZE//co6dskKQfX0qg3@vger.kernel.org
X-Gm-Message-State: AFq9FYLO2v93Fzt2J1jrU0w1VjXo3hG0+ZtAS2MzG5HVzf0YJE9FvlNQ
	rFpf6PtQYfvDAgyW2Ix1RDvVbM2z4JPXbW2/VbmB65URyrIh/LmX7de/GFgK1iOpFpd3R862bPz
	zR7UxFaIv5QJXMpbD+cVk/qT9E0ekUrZu9XPTGY71GtX7wsTjTTdaTyoodk/XAqJP
X-Gm-Gg: AYBFou35HtguClj8i11LCDqK0gpb2JWiKTKMPan7rfjhRIiIG6UKJHrn2bKt01qm8QK
	6vS3TDe2T8TH+ei9PNY3rn6vltRzvD2ojas3FWDuIwBkS2DuWxgs5Ogk0seJJawS8dqz6p8LFF1
	/vk6NjxLRfdh3aWC5sVuBZUA5kCypi1xcYKkvYrVg3GEJcMabQjlulN4A+wkJd0dLVAmEnXu1z4
	eJel8lwhaMhJkBaVUhRtw4nKfJyU3GKDy5Cq7LlVanEJ7X8GUmznJVs2otXSUNOXDbb+xsHijiM
	KbLX0VXEzJSzbzns1lHnc2fdZ5aSvIc9vzxph1FQ9+6YtuE4gzD67VIcVkYHP3gEh3xcTWezQxU
	ICQKB+9ndVSbAfq6Moq7AOB0pt0Nb0g==
X-Received: by 2002:a05:701a:ca01:b0:151:8280:2c1a with SMTP id a92af1059eb24-190a6dbd524mr1236454c88.42.1792554097916;
        Tue, 20 Oct 2026 20:41:37 -0700 (PDT)
X-Received: by 2002:a05:701a:ca01:b0:151:8280:2c1a with SMTP id a92af1059eb24-190a6dbd524mr1236425c88.42.1792554097382;
        Tue, 20 Oct 2026 20:41:37 -0700 (PDT)
Received: from [192.168.1.10] ([103.211.19.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8439sm3336442eec.11.2026.10.20.20.41.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 20:41:36 -0700 (PDT)
Message-ID: <92c02649-454e-4b68-a9a8-2371f8a6e5da@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:11:28 +0530
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
Subject: Re: [PATCH 2/7] dt-bindings: phy: qcom: Add qcom,sa8775p-csi2-phy
 schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>, bod@kernel.org,
        vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        mani@kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
 <20261016235502.2274268-3-anusha.nandi@oss.qualcomm.com>
 <851434b3-4cf1-4371-9b4a-57dba8022e13@oss.qualcomm.com>
 <20261019-funky-real-skunk-eda6dc@quoll>
 <7766382e-5187-465b-aa89-ff1bf9a16588@oss.qualcomm.com>
 <708b9edc-3ee9-49f4-ba62-9fc2806168dd@kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <708b9edc-3ee9-49f4-ba62-9fc2806168dd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad83473 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ocEEpg4cTnoGtXECQz/e5g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=TgBa4wLDfMOKYiLJ7W0A:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMyBTYWx0ZWRfX0YDFZ+nt/7yh
 iKVpYozTOvRMl0Pwt3Hy46LDbQqGZwNSoEklOaO3XsLxXM/lCA2Trg+YGNKTgAYfbBTOod04cYl
 jub1HZyG8YbjZGmtPdnAh7j2hvAwFGc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMyBTYWx0ZWRfX/HbAs9LpspTM
 lu8wJB9rsbLBmuR2GmSSQRT8UHdtX4iuTEj/1KZxUjo4x8beSIUw5E924/mCVzVxgF6XS8UOoJK
 Xovlm/lDrl9MFa7SmEuDuoL99NwwGC6QYdSjphcuVEJDKJa+M1NkQNjkZ8zpD2pPR94Jb9BkIE5
 A2OU++IFDqNkETMohOUngxtMW87/0gwv4UtT3JOSQ9nqx18MvqwcKWkbUKY8+PTwmFfXKTYR55D
 Q0N+pdu5PLY7sHvKXxTItFaC9DgIHG9C+AjEbBSNY7rvop0oq415ePt4XV+Pji09t/TvD/Jj1XX
 1M2B6IV52OW8LcwJpz+KxIEuEFL0TPnoNrxfXR2Sv4baG0o2TX7iG70HJqFeLUnsGQBF/uJdk+q
 1nHSlUh6zhqxUVk0sTXXLr3lbJrYPXUiNm/tJi35s1suU2kZ0n5MS8VCFI8vJ/j+GVMcjoNn8+2
 rGTTXCcy0E6JsNUOJzQ==
X-Proofpoint-GUID: btjdyRaaCHuBhCbmc4jDb-KxUI87VAzj
X-Proofpoint-ORIG-GUID: btjdyRaaCHuBhCbmc4jDb-KxUI87VAzj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210013



On 20-10-2026 11:24, Krzysztof Kozlowski wrote:
>> Krzysztof, should the binding example mirror the SoC bus address/size cell
> Why are you suggesting in review something which maintainers never
> suggested? Or actually opposite to what some maintainers were suggesting
> before. Code has correct example.
Understood. Thanks for the clarification.

-- 
Regards,
Nihal Kumar Gupta

