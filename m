Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8E13F54A7
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 10:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783592662; cv=none; b=Oc3+eYi0bE3ue+LBAxoycKO/wEfsA1rjvLTwKqNdTV2yJxlmdBl9iZ/pWOBKVhuOnWiRwxJb9H4NBWeZ2n4kTOM5UHL2mz1tuVi7FrSco2iKemL5GyPleb5wqIqTIQLAYXQCPidEfjPTPqwacIdtP49uPPqoDfq73eF2Z9eQXXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783592662; c=relaxed/simple;
	bh=zToVtsgCxCMPYVRioLeAclnBcQbq7OYF6zfr4jb3MpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NOg2N8TxgfAQnVx3pNeQtRgettb3f+aptvw0sd3vSVtyCTugmltCHiS68XTbEvTYAOh8Np0Gf9nthD4rKq4BDCnPw0m8Ah18zo2KrIEPoBfUf/8UwlK8gaTYNRR2XS2yfPrL+ZMNK9+xtRCrwba2L1pwWajpra/pAIg+Ss9JdIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GNxW58ap; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IPNkG7r7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GNxW58ap";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IPNkG7r7"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669ANL4p1522104
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 10:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y4Pw9A3R37LzZiXhg2G3UEJEcOVQOeZrAuzBQeaT5jY=; b=GNxW58apUmk/1FwD
	2B8qkYTB1bSlZhO9R3FMRjP0QkEDhVryRfLX5QlnNsCrNDwcqdq5dDG14YFrwERg
	8BFMooUuos4u6bAosyTgRrPbYbKWhBgOwmmT3EWJ4YrpkFQOjhyotFHgq4x9s/kL
	F4fBQ/hbqUYn+Xg3Op0xTboHr14H80JelLROzo9+z3Tjuk0/DKiZbFJ7Zq2jmj4b
	4OoZyK1uKJJdId7nEYRstpW8tK59r72dCPsHeiCtzhaWjOjWAlrrLQ7OL5QXBn3k
	c8y1Ynvnjn0CHhdN5Y8w7BchYUWU1IepsPjdBh9ZXF80er4am+rq/lhVQejBpHLF
	cQIv3w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa6p3ryy7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 10:24:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c27616421so4564221cf.2
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 03:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783592660; x=1784197460; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y4Pw9A3R37LzZiXhg2G3UEJEcOVQOeZrAuzBQeaT5jY=;
        b=IPNkG7r7bf+IGLVy1Jm27SWA3vWwUnjkcCD3ok+4HzzjHsl11+BMzPoD22qjrBajUJ
         qL4S7N5s2AovkQeClRbRg1FT40i8tOw7iJKQca+mtHKfglhDd/2ddmbXofIRduaw0DV4
         g/uAtQW+9EePjwlLJaRniidJkh2YEIjnzzqDI/Cj28oif8aQjEGOhoPMAiOLyFKqE6nU
         K6NIVj4eRImIV+jJZslonTK/3pZxHuNJ4kBsGRLopIgBoNxyLS88oZQsmMsqa5rgk3gf
         DU5wGyDiYNRVN+jlo6rta0gqtylo71OmDbY9sH4KByI2+gC8H0WtutgPbaRHr5ZT1hfs
         8nfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783592660; x=1784197460;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y4Pw9A3R37LzZiXhg2G3UEJEcOVQOeZrAuzBQeaT5jY=;
        b=Mpug+2IPFnAAjr+Z4OKMW+vjeBv6VxpPXlykxltshgvvF/UOVm2M4CLjGkTLd9e0ML
         CE6BFxqRSw5cz8M2QFbuJAi0aEbZ7raqUxju6sM00dacZnDrY5NxVdqym/Pq1cteB4hy
         mV2k/W26kUd93YFQceJ5rMfbzbGSTh4i3lGXJZHzsOzojc+/C9s7qQfpYmjPAcR+b84Z
         ZHLIEUWz4UR87xXV9UUMUeggJdn6xVa/13VeSfYxtt5B6Z25e6xQM5wNEhArHHHhsC7/
         GzpL1VioiMuDfvMXvXCDvJGADCF6rbh5PqbFFjlzQRF4rg4sY8qmpw/pg+A8HBitGrAT
         J6CQ==
X-Forwarded-Encrypted: i=1; AHgh+RrJ05IJf2mmEUyVgXIpNbR6dPLdNRFzjIvwhHA1jYd4PZLz7jQ3KYqtA+IUmRR8nuSBxXPY//gNXD6F@vger.kernel.org
X-Gm-Message-State: AOJu0YyX6Bk4p2PWdKxved+zLExSrFaRbSmZ8mggMymfPubjfCV42tNz
	4Mq6Y/19wiZGrKO5az21dZ8aKh7kZunYo3lZkAylD0RxQrcVmd1+/cZXwvIhSd9ZklQn+XxBVdB
	coRa65OZJ6kc3sF6DT2YRbjp87WFDxSKkATwU3oQALXs9T4AW/9oBA7tO4Bej3QbB
X-Gm-Gg: AfdE7cneR5aDUD7VoY2iLqmixpcvUGimj4plr1Da5lxEeSLr8p76wCcOHhN0eBNCcCW
	588YVUz7ohl8L2oxTsnWpleSGgLxWFPSBewJDNAm1a2GALqrDecpRKTltugggTKW0GTd2DGWiqb
	ldO4aweahBihgU6dIMIJ4cXK3OolQFrn0HMBSEwqdE4T/D84BFg4QynHVrlFsykS5Q/LayewR0K
	z8tvYLA2C44e6HCevtlVRfMPyDbSXQNETs7OO1Q/PYb1IYY3sDOUkIUCqUnxOerAX3t+aASQgH5
	i30UgYdQ5CRYoz5dMgsM05YHZ6tmNBGUYCv9ShYn+QAerKFImpA/OnN4sWPZf6LAbZeN82U6TCy
	4aPCvz6bNxokV2SQ3q6HDBadHCmdb4N+O3pY=
X-Received: by 2002:a05:622a:5c8:b0:51b:8543:cbbd with SMTP id d75a77b69052e-51c965f4e62mr29852971cf.1.1783592660143;
        Thu, 09 Jul 2026 03:24:20 -0700 (PDT)
X-Received: by 2002:a05:622a:5c8:b0:51b:8543:cbbd with SMTP id d75a77b69052e-51c965f4e62mr29852791cf.1.1783592659677;
        Thu, 09 Jul 2026 03:24:19 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15c63c04fbsm285215666b.23.2026.07.09.03.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 03:24:18 -0700 (PDT)
Message-ID: <97816639-68db-400c-a5dc-2e5c32f64bf0@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 12:24:15 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: kaanapali: Add SoCCP for
 Kaanapali SoC
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260709-knp-soccp-dt-v2-0-6e2bfca96088@oss.qualcomm.com>
 <20260709-knp-soccp-dt-v2-1-6e2bfca96088@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260709-knp-soccp-dt-v2-1-6e2bfca96088@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9cMHafZMb40ibqOSrEEyjLXxGnPBqjwX
X-Proofpoint-GUID: 9cMHafZMb40ibqOSrEEyjLXxGnPBqjwX
X-Authority-Analysis: v=2.4 cv=TPh1jVla c=1 sm=1 tr=0 ts=6a4f76d5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=3-YoKPAtwUcdJlF2dtsA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwMCBTYWx0ZWRfX55oZbraCS+G4
 rknlnb27vLIdSOiKgf47luihCLA0E4e6bxoJ+7g8HB+5jZGs+lxNihgMKoEePFARuFWqTMxtKfg
 DanCtLIMSq6TD7vN6x5kNHv23H/yELQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwMCBTYWx0ZWRfXwBdZ/i9jmR3P
 B5aYM85Lp/l2G/zPACM33Bijx63DuP9nfmw9M6Bq49wnCtswYvZfLj9rcHk8+ueCmV/CAEgvYIS
 W8BGlPSYIw+ymjjeUzZz7l3yP0yUlFGM7No3Ea73Lpz9etIOqxpBHD/1pU2hbzoCAVwzNSm0m4U
 Q+YVR+PGScBBpP3A4O9fDCXJ6OZJ0/PtRlXhS6eASdwT9uR2WlI1JFezni6W4MyTxhW4vyARZUv
 ypqE3xxKL516WUvn0MrZXRnn1cjzsPY9+qiUjJY2t78XZBPQkkkHIj9DxZeg3UFPyUKNRxS3j8P
 KHdEooOlAvMIFmF6VWxX1yO90Q/y7uwH0IZwvV2pBU5BN79pgHTjN7GfJW4ObWBh0CQ9ZGOg5sv
 +Ke0/ic252ruYnQv1WuI2JTtVdipqVVSo/hm3muDkN/FDkgETY8Uhb4sAkXK2C8mnB0yu+d4YGC
 rl9cb0mBMq0oOk/TyrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090100

On 7/9/26 10:14 AM, Jingyi Wang wrote:
> Add remoteproc PAS loader for SoCCP with its SMP2P. On Kaanapali, it is
> brought up by bootloader.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

