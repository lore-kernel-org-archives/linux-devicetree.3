Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601381;
	b=u045Tn9ZJVtteuEhY2qTfjglAvnqGFx8ADi6/WEF0OrYfIgg1Z8as1bFsHWYHWCBycXs
	 BJRWI3ia0gk9/MtIo0z/gZwt90BL6c1cZ46/K/phFMTwY/SyX+OEWS1ascxNsLSORLRdl
	 k05jiO34v6a2DIUdh3KohwtpaMRyiMHCaqqH21blTWHVGXg76hsj1W6C5i/R6R1JrIEMz
	 wd8GYjsYxHoC4z4tOR//n78GZykhgJoFt8VdNmz93TYseP52JUgCMIWCwclzU6PBtt/LK
	 Yex2Iq8iyR5xyq4ATVaeWq7q0QON5AIGwQyd3+p/t7qJju+QyMjKvLyjgDStj9ky+wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601381;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/CSLBkwK7M6kc3FeV+Y/Zo5UoNR9nNAx0M0S9ToR02I=;
	b=ooBH2YZFB7D63c+9iZQwgWlKvgp6E5zNgTtksfCQiuqMhzVhUTckRdQ7w02x9FEmw5Ip
	 RbQbdgvSpWdFwV2wf9kOU8BLeXoJT4qcbu8HcVStmkBLgIhfbxPD4MQ4FV1ZLHPdxzoIR
	 KrWjazjE/eLJ2O/FkERZ6DfgPxUryXmCVeNPOQmibBLYgBWujq54cmvx+rWCh4zVaz33V
	 rSdayfnF8NQq1QkgS9nyitBQyk+FEyV3e4EZ+/FuzOEYhP0y/Kskqcg2loCYTXyJvyRCt
	 I1uGNVTEzkuZi3w91nLOF6a/MO5emBKtY0uGh53YRN1VkxySmG3gL7F80VhDT00D0xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e3ft3L20;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GaoojMnf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15038606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15038606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e3ft3L20;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GaoojMnf
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mH972121176
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/CSLBkwK7M6kc3FeV+Y/Zo5UoNR9nNAx0M0S9ToR02I=; b=e3ft3L20BbfVP0Cr
	orjedQSocV5vKsKHSqVfpOqvNtpWxarKhIaPvId+I54N9aiKAW1R6CIjdi7KINrH
	63lIeoXf+mfuTdiGW8V3jKet0lU44u437LnD8EoK41SOH9JEoadALRTsAX1/+4gk
	SNJgzFrMhdJk9o4ex2YxKbmmaG4TfpNnCyIjxQk2gomItUeHPdTEttPKajscvkE7
	8pY5sdOq/B8HDiR2ND21tBfbenAI1b2CLG7Jw122plXdctZNEs4Tt3cHJ2dccY8Z
	KeyYlBbW2NQBV3t5AlOvFbSnlRfyYhEYLpHP0ojQpEKZw5+t6+I7aNVY/KEJ4esC
	aGshdQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vukr9fe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:09:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-55d03bfd50aso14206301cf.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 02:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795601379; x=1796206179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/CSLBkwK7M6kc3FeV+Y/Zo5UoNR9nNAx0M0S9ToR02I=;
        b=GaoojMnfP4U1FUJkBOhfLE4DtFMcOK/JO7fbT96MQdmMQREHmEqgHuYAs6rqF5Zblk
         H4fzrWkRiZtOU6OLDKOaw9hvZXkfCCXN1RkxQqofY/zyyrcv3XX4QGS8hHGYehmYdaHx
         8hNoJ10thUfszgtWKg2xu2qYYp8Iy5f6aAsITnxcEn5g13iR0speE0iAXdssz7J8y6TD
         xAh6vRsou973THUDbmFizrwQptIytozEH9/uruU5zpI9FRo4FYds2VuLSL5oVokRs5z8
         rHK/cr2wHqmJ+E3QFN9iynDl072GDLJ7aDpdXBbrilYdEl5w6Tn1TIFqRxd7M0Lum/Ky
         5UTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601379; x=1796206179;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/CSLBkwK7M6kc3FeV+Y/Zo5UoNR9nNAx0M0S9ToR02I=;
        b=ODlAJs1cd77qTFmj35KNfK433Zjb/sOTbbH9F2gflBb3qVlVZ+lwe0LoWOpG8TQoLq
         s3oXOVUKQ5/WXLuzxOEVKba4q39p0ecxeCYIghvRbzvrQgQnwRgIBPrUBpkBznZlupU0
         cjzuHavpg1drOdH3ARjpFknGCodfZatfKBZl4Yt4d/7C+gIR+a2am8thGE24pc8X0BRn
         AXF2Gpy842apf8YBnNUxHdghiFJTexKUYJ4cCCErP0q7D6ZBW9gy94k9ELiuD2kluluZ
         Tqg5NArogaAgi2Jw3oHFNAyKbcwoPqcUtfLJKjZ9DlM0dBnHL1N1sgX7dCEoln2SFQca
         a1yw==
X-Forwarded-Encrypted: i=1; AL+hErGqKaXvTGYZUnGqUKA2r4g6Iko3u0e3SG023k2dNkoON64YQL7JwB4GCd4Mq8P2QA+FmFGrG6rOMKsF@vger.kernel.org
X-Gm-Message-State: APuU4Z/tgCFOd9NQDAxxhr2unUlzBCbTlDvg2fWd1pe9PxefQkCtjtLf
	7nKBK9s4l8e7eoboecJsqIvFSCHGCqdci9kwAf9BOlrWtT64eOEtEujHeBOv2bA3R2BEHFikEm4
	TSt/oYTbaWQ2zgrCK5IWjtMdcasJk0HbNKUtrW/3cLEBBxFVnry9hkBml2sCUdn809qXj4Txr
X-Gm-Gg: AZFdTZd8DG9fTVfYBpdSQ1cbvzntkYUVFx4AtiAmH3fof/sLnodAALZHQxjohDgyViq
	uMUZbg2mbbcYx7/eWEMM2RkKU/eySnuxEB/fW/ri6oTpSxND28g6glThA8Nsf4jXvnJgRYyjezi
	/aA+C0+TrZ18UIFUQVDHaQD9Jyp7VVHyJwtgyLLP0a+hL28fgCN40GylvRz6ANAQcs+zYLuCWzG
	b4mZu05Ag7FtB0QGKvExhNhvoc2bjcXdBpbaL4G+/Xu+428UXF3meX5RTqh5NreWUZLN7tkPeLP
	yrz27fEEPsSW7NxjMRBEe8mObR13by5IWDITjctFn/ZCw5jDgdwv+ht0OaWKrZ37KBXTh0xxxmw
	fub3KfntqOtCg3f0CggZUjAFeEkcBp0I56BmkrGHhRj2oLSCEBXSDB81OoF++/YszBQu4lPw=
X-Received: by 2002:a05:622a:e411:10b0:54d:2f0d:a83f with SMTP id d75a77b69052e-55d769e8959mr290006431cf.3.1795601379470;
        Wed, 25 Nov 2026 02:09:39 -0800 (PST)
X-Received: by 2002:a05:622a:e411:10b0:54d:2f0d:a83f with SMTP id d75a77b69052e-55d769e8959mr290005981cf.3.1795601378974;
        Wed, 25 Nov 2026 02:09:38 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc42bbsm608990966b.61.2026.11.25.02.09.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:09:38 -0800 (PST)
Message-ID: <def07365-b34a-45d6-b439-078cceebaaef@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:09:36 +0100
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
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sm8750: add periphid for traceNoC
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Rob Herring <robh@kernel.org>, Leo Yan <leo.yan@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20261118-fix-tracenoc-probe-v1-0-0298dc5f05ac@oss.qualcomm.com>
 <20261118-fix-tracenoc-probe-v1-3-0298dc5f05ac@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261118-fix-tracenoc-probe-v1-3-0298dc5f05ac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KfVHIgYD c=1 sm=1 tr=0 ts=6b06b3e4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=RthPVecxuDhBgGMHIBIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: -W38aEjp-K2Cb4ru9U-0m26dt3A0ZUGT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX/yrkY1PGxXCR
 SLf4gsEgRHXZntXUq5HaOMqB3WAyUgJhEGTYQ4NRAhC6PdiGaEzGvDODwWh2lp8o9UefKSsuA7B
 GW/Vg1XAtY6smwCkY/FQpGRnjVmPPaM=
X-Proofpoint-GUID: -W38aEjp-K2Cb4ru9U-0m26dt3A0ZUGT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX2HQ8UlqblbK+
 jfyIaRPjA60yTDS9ICR9dGY00O4qcHSJOskMZwnG4twzrfhciPh4UQ+ghPCpGA0kgxqgYhApZLz
 wD9aK3BYcp5XLppojqAs0IYdYEHN7WQUz5X4enmTGqKWKFPeWGeMk6ABsy0BrvH5uPU/BYfhHKl
 8w0O6jb7k5x9J+RAUxGh5A8jzrIQUl71NSFj+jpKQulchrCVEV8GDl2Zxc/+WWj4B3DCmGdgEcD
 u6luOpFYITnMW2E88c5ZHK8JULRnIkLOBSvd2LZW4rzTfZIN/FLNaZ42VrzZzlz9c1tZfEO3J+y
 xkbMd//y6Yhqxp7zyHWB+P53i/QCluwUQXzj/kJAuk55JGEfBPeQXsgBWnZyyZOsqWSsacoCkmx
 6QG9ULEvSxjT6ysTKPcCM+FAkrZ7QG69ll481/HvEbb/N9ZVv5UdAGmhtsGe5IXayCVNCyuWb8d
 CTq2t8+ziXMFAWqQyiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250040

On 11/18/26 8:01 AM, Jie Gan wrote:
> The traceNoC node uses the "qcom,coresight-tnoc", "arm,primecell"
> compatible, which places the device on the AMBA bus. To bind an AMBA
> device, the bus reads the peripheral and component ID registers (PID/CID)
> at the top of the device's register block and matches them against the
> primecell ID. The Component ID returned by the hardware is 0x00000000
> instead of a valid AMBA Component ID, so the AMBA probe fails and the
> device is left stuck in deferred probe indefinitely.
> 
> Add the "arm,primecell-periphid" property so the AMBA bus uses the
> specified peripheral ID instead of reading it from the device, which
> allows the traceNoC to probe on this hardware.
> 
> Fixes: ebd1eb365cae ("arm64: qcom: dts: sm8750: add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
