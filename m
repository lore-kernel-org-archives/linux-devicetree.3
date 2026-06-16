Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0762D438FEE
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 11:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781608421; cv=none; b=PrhXhs/tJmYnscXvXsd2tU3M4AYlkuHaNsMQR3HBviwjM/PGgj/HS1TJazGayAy2z5DRZ28C8qGM0xu5Gp58l/N1lP/F7+kP7pYsyI9muOtOcOVbXuqeINVsuX7LGxX598f4xwQD/GjdYvfz2OfkrPW4cz8/Gw1p0IwJCWgFV5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781608421; c=relaxed/simple;
	bh=55ncl2+pNbNqu+wEL/BWAxYJSg/Eb/jmWeFv/fJjbr8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qgt4Knjho+64EEi8ol+NTBP4Wz1bvVGqKQ4thTQNqHzPABXaMDFaaRB44CqMLL3+NTdhDTGOIIU3QA/8l8imZyeFjI6/IIWzYiD8biTSkKpJzFDIbxJtMddyL8ThPWjtaJVt+EFEWk9neNWqhHA3BbEvQZ21hzaVM9+634j2P4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lseo6HLi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hDkncOs/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lseo6HLi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hDkncOs/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GACPg33456285
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 11:13:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iSr8MoasSHBE8JNNqOM36HV9oQteT/dMFprDB+IKzdo=; b=Lseo6HLiLxDnepYo
	dStkJc6pCcLu+CuV9IburIB/oYCviQbeg6XIMCB9Dha/QS2e7h5rFC0Pcf+2S5qk
	nx3SaNtkhNDJOMwygLHnkv6JUqYo0wdYyXWsQ/4pYD/1LupBk5mqVUl/VMcIK8YS
	Ne20mjXBBY4Qbyi02BqJnd281ILMo3q9I54yKddglu8+ad8pSpLKVCQr7iJvttNW
	E1CppnylcPShLDUgnOAQuxJ9QtJB/dyzGhOMJ03YXdFfKEMxt6fGPt1vjcPTf/Uz
	in/LD8J64uyZiKCDAFYM1LJs8lTEh9uohm5XZ+5kIHQkDgKlHmASHq25ImLKS/Cj
	1uxndg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu4dkg9y9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 11:13:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517647fbff1so12536211cf.2
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 04:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781608418; x=1782213218; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iSr8MoasSHBE8JNNqOM36HV9oQteT/dMFprDB+IKzdo=;
        b=hDkncOs//ouCDfkQmpBjeKez7HD+KBqszxB/5Pv1/0QYXBPO0Kws4l805m1XiYeA0S
         XD35WchftmCtjxCGWmeHanVE62+HvdijG35mpVHkLq15r5wF9dqMsemAUd+OVfBN59lx
         exaK1d1SGWE9ZomqNEfxCjhVRtO6s5yrEfOKN58FUNlLuL5bf7DiLXM5ovwv2xJwrJJN
         hkTGAMTZdRcoH4KIg4M9fynGr5ckH6nLyruB3ZryB4kb0xatwiYtvb9kdNMsEnvuYYSK
         5jJYS89+dSauhDm2iR6sm1Tvp77qSvxqaFRllh71WMG3aMHXDonEr06yt9mKo8ZGfs6b
         +6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781608418; x=1782213218;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iSr8MoasSHBE8JNNqOM36HV9oQteT/dMFprDB+IKzdo=;
        b=nuBSiCByeIduNQKb2SSMD+AzWyOB7fhUolWqJAy8iHGt5bpvFCvZsf12bIK036kprI
         qZqWM4h2hWi7mAdue23/o5Qf2CxSHLm6ulFGd4QuHHgByreKmWvYTDtdTNl9vrXnnX2L
         HNasUJ1WgiINz7X3crFvtdylw1Nr5E9LGWjkZvmWqSzeWjaiWk0qFGyCy006hT3DI3JR
         080a7ZOsjgxMq4QZKPjs0ys7AslWHXC35W41aQhAtOKkT/u6fH0NIjvExEPiIZTZOLSw
         C9ARe/oSgV0i5rH4mL3H9OFGGXyuEiif+CUKonOEW/xYycgGbp8i6qdKo5EfVu+27ElM
         jRmw==
X-Forwarded-Encrypted: i=1; AFNElJ8CdHCrjEn2JUeB5o0L9dF5+nrxOqj8gpuv2u0mgktLuLK7jhyD4ZsKALi7gPJ69XwYEfGhUflJOiic@vger.kernel.org
X-Gm-Message-State: AOJu0YwAyCM6hLqVh8VvlYeI2p8npfGui7me9qcUuXJ8/Of5tER+tnz6
	Fyl2olo1warrUJ16tUchByowyn/Gl/FeycENAGq/F7o21IbTL7i00ONbSGj1X2YekqFadEZceOH
	eW0i4K0NVqjLm4h7Fey/4/4Mrm1rFBYTQTDu2N6MEACO8/CAjGLWlIPdi5eCP6Ogf
X-Gm-Gg: Acq92OEeJDoAIGesxP4zUlJ04EF2YTsKtuku4S3e6JDz1zXOi75FZer7Ai42Iy6OUQJ
	SZhy1278MAP+Z6Z0KBuqM3kGQJvQtrYukcggwtH8V4F11GZgHFbHArPVLbCexgYqV7TQYkrO74A
	g8jiKHEzdGYDJeqN13JX52/so9oSN52zkS2f+LCmRWWnRTAgaZ7unPEOsaPLqGgd0LShpB07gl2
	lWQ09O6cm+k2tQC8ugHatpLNfESdd6/jsnlI6i9u8zVBdd7+hIqMFGsiRtftrUPmBCG2RuV4QuC
	QtNgf6g9wpZHElEjSSYmVsYhrjwOCduqSbBV5D+wP99FYIql1ARgzTxAg8AlrJAYqsRrxHG3meq
	jehqRHWsPxeJrHKGVB80GkaqQKynWbagDwWurJVkgRNpa6g==
X-Received: by 2002:a05:620a:458d:b0:915:769d:56e with SMTP id af79cd13be357-9161bab4498mr1747054785a.1.1781608418340;
        Tue, 16 Jun 2026 04:13:38 -0700 (PDT)
X-Received: by 2002:a05:620a:458d:b0:915:769d:56e with SMTP id af79cd13be357-9161bab4498mr1747051785a.1.1781608417897;
        Tue, 16 Jun 2026 04:13:37 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb7b6dbbcsm648217766b.32.2026.06.16.04.13.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 04:13:36 -0700 (PDT)
Message-ID: <12b8d20e-06a3-45c3-a02f-bde79f31e8ef@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 13:13:34 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs615-ride: fix sdhc_2 vqmmc-supply
 for UHS-I mode
To: monish.chunara@oss.qualcomm.com, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        ulf.hansson@linaro.org, nitin.rawat@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, komal.bajaj@oss.qualcomm.com,
        jsodhapa@qti.qualcomm.com
References: <20260522105020.3588377-1-mchunara@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522105020.3588377-1-mchunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xKwnRqs3rU8XS9s_SUWoFdv7eOgnjoL7
X-Proofpoint-ORIG-GUID: xKwnRqs3rU8XS9s_SUWoFdv7eOgnjoL7
X-Authority-Analysis: v=2.4 cv=Ibi3n2qa c=1 sm=1 tr=0 ts=6a312fe2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=6BLkkuY0k0j_y3qHMkoA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDExNCBTYWx0ZWRfXzUPGTp8ouJDQ
 YgTwOsxYypgJEWhAv9m5Gi6emYMqLTxdaBP0CH+qbUUNxWjHf+82IFBHjBmeq08bSD/fktRD+zy
 fYIVuc4rCyn0zPxj6/TkZhO06Am3M7Ad1RNz6IxzG4TbvcmojFLURuLru1lcM9pk6gN2wYXwoKp
 JIIwI9RK39i4W0fgdq/z9iN8tQDiJJ2GHRKwa2I9FBKUTIFvQFtfIwCw26njdceK59yrY36x3fm
 umr5Foz0ZNDowPEBPjkbXtS0lxqFHykt4FUEoGlNl0Fi83wjHtsB2dEvbkO+AXRSHFhwHPweY7D
 fLKbkyrsYbknPL5WbIzoTEi4LvXSA00/cSf9u8MXT7DTWWY6WHxvuxIwmTPDkMXIShMWmHJ7Esl
 +xOj+j2itvTlyB4AhGi562n6tyjYUk9A2yD0MuplhQmR85fVbzYU57n6ALf9z2c+fI62ifs7asH
 uyvNocRHrAQeNW+qkAg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDExNCBTYWx0ZWRfX3WXNqNg2KX4o
 Px6RZQ2dCeTKK/ateXnvapCOrt9pMVHeTSrldJqxFrH+zyguqRJjkJqOiJI4RCFmCMwSeg9d0vV
 Lvrv/IoPG3zqVNfIDDx8Fe5sxxhrauQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160114

On 5/22/26 12:50 PM, monish.chunara@oss.qualcomm.com wrote:
> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> SD card is detected as SDHS instead of UHS-I because sdhc_2 was
> configured with vreg_s4a as vqmmc-supply, which cannot switch
> between 1.8V and 3.3V.
> 
> Switch vqmmc-supply to vreg_l2a and update its voltage range to
> 1800000-2960000 uV to enable proper UHS-I signaling.

The way the commit message is worded almost makes it sound like
switching the supply in DT rewires the hardware power grid.. 

anyway

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
