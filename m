Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449266;
	b=lMdiECzBoGbgsj8uF2HfS98tCta1MkQEYn1u+ij7OcpGWklL6svYHY0bQ0WaBv5/aBnu
	 gG0L0365frh++WNXScs8pe1rqspbDMhrE2XWCMKTNfYpNMMAvusN7l0m+PZNCpnbeaOSN
	 /68c8CN7RtfIgrWG+D70bnPlbZWANj7gOvWGFi0uENTRSqC0mwYmWNOry+h9Hs0iOdQ+1
	 KRpI61tDrQibAhqYdm7HdJEeEPMXUx4rjbs2f+zP+MzdScfh64eilIJ2wETnVOu0ZmPj3
	 olrNyVhAotjRXziNArREFa/xkBMj+PQOq8ovmyeV4F/E+Vv5MF29w2p6PVMAOZ90UfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449266;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lU8Coo8wWZO2xm73msPjjDouSOiEjViRNz1SBuRFc0g=;
	b=l3ICbKcQJyfgHGOBAW7rCWJZvC2D3e/vu3eoIxAhXysBYBfNfsK393xkgwnvYGOPdzHv
	 2NF4D4Sp+8so5VdY+v5qGoSkowdD2LZEymBdwx+nu5Wvg6YetybAuoh4riFj2+RLAkXmT
	 BRNQ/+R3ea3gPnzNoTO/liZSIGmBNPlTyqN6vgg9ZHfnkd8CFLMpg91qrT+vQqUEuL5xA
	 TugA+AiIz6MnZiuGUFvTfVUdNu2pnuKqBV1jqDsWXBzmz89UoQIwPqARW/jxfYzvBgkz8
	 /8FBFETcE6cB/kSHE7Zt8sKSBaekpzUTPgp0zKXaKH7Kw8+AwZARSMTiOitXEv3nzew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VR1fJlMt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GztqMX36;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DE3606A321
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:54:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5DE3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VR1fJlMt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GztqMX36
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDL7ZL1938030
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:54:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lU8Coo8wWZO2xm73msPjjDouSOiEjViRNz1SBuRFc0g=; b=VR1fJlMt4WmeCj/9
	MGhs9jNJ4GGEbFs+HFKXU65iNmMWlrSiSCMdRLD/GJb3ZEEuxdWeQyoB+4jBvi4k
	sWcC0X5u+pdJ+Z4z2tkXXTQ93G0GQ5V8Pn2DI3/6AA8eXVOIakbVqcvDk4aczLsK
	S5BZ3GwKcpX9fi2JyR3SyamK19igcSpo1g276napf70pl2O91dMns5iB7vyfO6PQ
	HW/1Uhk/vQFwUOXiNcDislXDqaNlBMObGvWMRTgODOsAb/1NdVbn9Je0ViD6G1cD
	kBmpSaJ1SB+EbJu+8cmg1mJ6rDcZFbWxGQBgoUlRvxUWND3X+Gd+alTrM6YHbjFT
	A6INrg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx2dqh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:54:24 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-382af5cfc58so1187203eec.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 07:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795449263; x=1796054063; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lU8Coo8wWZO2xm73msPjjDouSOiEjViRNz1SBuRFc0g=;
        b=GztqMX36iNxB0SdYXm1AeFHaA4lG+B9p+C/LDAvzCXNDN4RVpAivsxTENP3zWI3iO8
         NX1BgKWemhCnDJF9txyK++cWLUrpMlxfAG3Uc8f8eA21tIm4y0BTaF8u3bMe+cflOJHN
         ht+S2Q8gbVPXsJ32Lsnj2jZQf8YlLsYeQtzNMHH2gqezEtJKpRWSNpzvLbY0dJvBvR/B
         xbZIwnjz485qi2TgyR3qfBVDRDLV0ebLcd9zW+h5e76b4A9gYYDVWEpXgPSpNCJeRU4v
         K++9FFQPUL9BvP41OgcIrjzBgKLiUIbkjusLi6nawa8txYjJZeNW7WF7igoujsvc9T4x
         7dJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795449263; x=1796054063;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lU8Coo8wWZO2xm73msPjjDouSOiEjViRNz1SBuRFc0g=;
        b=xA3zGRrCuJuXK4O9UqQxv84nnUELcIBTtMBnzYHjXVwA4OmhUwU135YSEPN4YrFGkI
         gfAPwGS3NeCxfBXV5Q3KSLbII540JTdrw8kjyeqOnSfibL+dJOcZ0XXTTcICP1ZofLQB
         xc6ims3odaXzPHTfpIJC0oR54G88tk7Dge+KI/rMGC+aov+dpEvpptV+KVIGf8+JGKI/
         UqbAHSBftEJxkemxrXCf+aLm/d1en5f6D6m6QAwy/D+uvSOOuT92he05Ivi5ZH1hcPVj
         BCOFLKhtUYcXfmH6LuMqYWmzz+cY+kZE290u5BDBEJEmt+YNe8e8pkEPeliwY5Ihgu0p
         VBDQ==
X-Forwarded-Encrypted: i=1; AL+hErGl1IyX+7LF7bgb1QG4zDxIyuuQ3gg5rtE0bTyBPpgpTn9xElMvBHHcOm816/crjFftYrCfZPBJHrVP@vger.kernel.org
X-Gm-Message-State: APuU4Z/QDUgdRJNM4LEpJi20TgMpoGlpRvJW6U0hviBs5IDu2E0mnKqB
	KXvSarkuGlrbrxzMBUgVfN8HnkcNBgrIAeBpt/BHDP7clAb9sWRVe1nSRfpgkobk4U9jx3Oq+q3
	phKX0kmM09RdDojhuTbu0GmHYIqVFZHCoTuu1yPdsh3xZunj3fL1HPgj/iBrvNwgV
X-Gm-Gg: AZFdTZcnbfITX2S2VMfygW87xqj4doYJ6sXjTVGpDFLS/vfIQ+DH8MvC3bllk8Bo0Q2
	ipt79t6F6Vts3416sG+HXDpFj1gRnMAmFuCbbi9O0F3I6z7HzdA6JPttUkvAz0/lSJmHfJXJU2g
	VFdoICjtfW8A8K6uxPq65PFVykN19RIhUU/8WUzAOaUDpeG2/+Iv90fmC5mGu9EI//uo8h/HDZv
	GL5BB7N6Alp6mGRnwIfPdBZvO63xvuDEm79kNEseMOc8Tk/aLzThNBx/Z7GXFFcmciMd9D4KWRc
	P1vTQZje0JDOAg/mZsg8ZMCAa6JEcVaKPkOU3yPomvlFp+J0/P9pwIPlY0PiVrCANuMfqbg/Mbs
	oDPOr/7ZdgGnKLT9tG7muhxsgmRNU0DCHaBZqF9l8LXVJXYjs4sZOSr+v/gzFEqds2OdG4G/uPT
	wMmf7gmxB/jszBNxL+i/Y3SqFcDfB2
X-Received: by 2002:a05:693c:805a:b0:376:a6d7:8f51 with SMTP id 5a478bee46e88-3856e63bbe9mr14886559eec.12.1795449263222;
        Mon, 23 Nov 2026 07:54:23 -0800 (PST)
X-Received: by 2002:a05:693c:805a:b0:376:a6d7:8f51 with SMTP id 5a478bee46e88-3856e63bbe9mr14886518eec.12.1795449262503;
        Mon, 23 Nov 2026 07:54:22 -0800 (PST)
Received: from [192.168.1.20] (39.sub-97-215-59.myvzw.com. [97.215.59.39])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c0c1dsm40628761eec.21.2026.11.23.07.54.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:54:21 -0800 (PST)
Message-ID: <f2f50403-fa42-4ee2-bb22-c78309590196@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 07:54:20 -0800
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
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v3 01/15] dt-bindings: net: wireless: add ath12k
 wifi device QCN9575
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling
 <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
 <20261118-wifi8_qcn9575_bringup-v3-1-9875d2a3953f@oss.qualcomm.com>
 <20261121-lobster-of-unearthly-variation-e75ea9@quoll>
Content-Language: en-US
In-Reply-To: <20261121-lobster-of-unearthly-variation-e75ea9@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b0461b0 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=7UwXyAtrHAWG9Tdc5CO1EQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=wpf9FKuRYqRxeo0qB5YA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: pslKeoeIMiHZZocP2Z8tWhefIACRmQB6
X-Proofpoint-GUID: pslKeoeIMiHZZocP2Z8tWhefIACRmQB6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MyBTYWx0ZWRfX93T9pCq4ygpU
 Pjx7q5PO4bqYjD2QNeT227w/Ia4A4nCV3D9PvQZydl2SaPFLF51Ml5R/8oya4qDGKobiJ7ovmM/
 IycZdBv5I/k4E/Dsxy8+gNhByylEHHg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MyBTYWx0ZWRfX/kkDyr3wS0KC
 QeUI9xBOUlYalOdFMDELK56GKXIn9SHQJG02T12kJEW8f5U7B5EWoW12iQQJeB19ISOOIJPJsLW
 kPEvNkSptoM+EOpznC0EDEBTZUbLQiIBAtEtAyJFXRIxCGNR873MVJS7WVILsIIZBhc9l5ZkJrZ
 fttAzRm+g9gslApE1UDBlxF1FJW+kguPD9hCTvTYVo8PqmxA7sLnXEQ7oXRLqRZ5pvHIb/+BiTR
 jH+yhpKbgvozCfD2iXiwkLcA5jhtVF2qtByDo6wr3NaddQngouojrz4eh4ErRPM3D3FYGxxYu91
 syDN0i64RvIyIryp0TK3moy1G7LVj7bcstxcakfoVqCu12flnc1jqxoNoD7xd9aeT4/qG2N8ReW
 SMSA1ELrDnF/aJqTVGP4PjlrUGJCkFH4NradasUDBr49RpYk6UwqK690xT83c4pPwWkXVo3UwPP
 T74H4xmPsZ8lr6Mxh8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230063

On 11/21/2026 4:37 AM, Krzysztof Kozlowski wrote:
> On Wed, Nov 18, 2026 at 01:45:24PM +0530, Madhavan Ganesan wrote:
>> -  The ath12k devices (QCN9274) feature WSI support. WSI stands for
>> -  WLAN Serial Interface. It is used for the exchange of specific
>> +  Some ath12k devices (QCN9274 and QCN9575) feature WSI support. WSI stands
>> +  for WLAN Serial Interface. It is used for the exchange of specific
>>    control information across radios based on the doorbell mechanism.
>>    This WSI connection is essential to exchange control information
>>    among these devices.
>> @@ -48,6 +48,7 @@ properties:
>>    compatible:
>>      enum:
>>        - pci17cb,1109  # QCN9274
>> +      - pci17cb,1113  # QCN9575
> 
> I do not see any user of this (see submitting patches in DT directory
> for explanation).

For this and the other patches you had comments on, the cover letter describes
the approach being taken. What the cover letter is missing is the scope: The
QCN9575 device support plus all of the Wi-Fi 8 functionality is roughly 160
patches which have been split into 23 reviewable patchsets with 40K+ LOC. This
is just the first patchset in the series.

This is similar to the approach taken when refactoring the original ath12k
driver to create the wifi7 folder and wifi generation abstraction. That
refactoring was also done as a series of small patchset due to the large
number of code changes (102 patches, 20K+ LOC). This was requested by members
of the community who wanted to digest the code at a reviewable rate.

One key difference in the wifi8 approach is that for the wifi7 refactor we
used a separate branch, ath12k-ng, but for wifi8 we want to directly submit to
ath-next. The reason the development team wanted to take this approach is to
avoid the pain that was encountered where there was a "big bang" merge of the
ath12k-ng feature branch with the ath-next branch at the very end of the
development cycle which resulted in a large number of merge conflicts with
parallel development and bug fixing. Some of those conflicts were
unfortunately not initially resolved correctly, leading to instability in the
driver. The hope is that introducing the feature directly into the ath-next
branch in an ongoing manner will avoid those issues since each subject matter
expert will need to resolve their individual conflicts as their pieces land.

As ath12k maintainer, this approach to incrementally introduce the pieces
directly into ath-next, but only enabling them at the end, seems like a better
approach than the ath12k-ng approach.

Specifically for the DT issue, the original version of this series vetted
internally did have a patch to add the device in the PCI registration table,
but it was decided to drop it from this patchset when posting to public. We
can also drop the DT patch until the point the PCI registration comes.

/jeff
