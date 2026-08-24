Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC8A3F3285
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 10:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787566701; cv=none; b=ECLvG7WaItWT8C680ApKQtvAUBmRrXmJQ5RND78cakQQctf9V+F/PFoaV7YNx8w1ik5SxyCa52YdUAbhRCES3wR6d8eJnZb4M+AmJaiPNqwnqX2l4YlOklPS+kEe1a5sxBtQdPBB0zDJKmBAK1i6ZWqNIYm8vkCImlGe7SOnWZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787566701; c=relaxed/simple;
	bh=3cfC7qo7h9ePtXWXBaunVx0xslZX/a6Eepv+CkyC4j4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WGiFvAN/Rjf3sTGGW5geyc793mqc6lBh3rIlXyetFr2u6PPJhi1rjsqs1as9aWsES5epm/cRYdLVFJSYsDvdjqGgX5g178VUYTuaAQbKSU30oHC58/1sD85FNDFAYcGEJQ/vcgTaLPPK6hzH/U20GtVv4kQQvbBNCzMRn6Mjeec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JKh6PCe1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ddcv10ba; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JKh6PCe1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ddcv10ba"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O99Aoh2547842
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 10:18:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cd7y2v7ZbQcd6P8BeTtHdryoBL5iEjibfBxom0P+gPI=; b=JKh6PCe1GYAYfMAa
	HP2gCYaTxo6N+Ap3zbpLQyHEJb8vOSRu3qgnH0vP5k4waFDcMg/+DKt+4U421hMD
	vXN7Lqq8c1+4bDR6DwUjktc9aqj5yRQM/ydU3V7crzOLqiSM95Szz2uGblxQxuRS
	TOmXbTaLC8nyzyTwhe7WmUh01MAnP0bRM7PCZxjUlNSKSMVQ0pJDVkzz5dCIg2CV
	QwUtLhcgl9VVkydhe5QeChzDW9K/7/qA5twhkMw6GoDNdbIXSr+cSCMN/lof9iJg
	82EF6j6PEXhqKSPTVSEPsok1RMF/XtqfFf+mCoBkw0M4G4c8U/IIT414/AnyENRV
	ZGw19w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88k7j669-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 10:18:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d54187d8b0so29744585ad.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 03:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787566698; x=1788171498; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cd7y2v7ZbQcd6P8BeTtHdryoBL5iEjibfBxom0P+gPI=;
        b=ddcv10baqtkeZ3i83C2XA1RlJMb39EtZQDxpX8uiwj1A+Ppoz2vD9RnLbPYHq14d0B
         IhcE/s7i0nOOuNhxoa85Wgb7SfTxzEk5bWWPUjnzAXdKuX7iH854u7dbRzdV8U75TM2I
         kZwJHm9RW1IYHfPQ1PM+P506nGAN6y0417djAZEbmUUb3M7g3gtesUn2D5/AOFUaX89P
         LgXRgt/wrAWf0tdDIveWomS1YIHAKwIIn3v+ShcN8PGLkr3QqMrgvGqWafUOuNUFnkaP
         XYV7gi/bb0c1fxYCJcznTa45o/qd0DPgEjKQ/SZ8gHzqoBAw/7P+cK2G2GwPgY2loq/W
         k81Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787566698; x=1788171498;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cd7y2v7ZbQcd6P8BeTtHdryoBL5iEjibfBxom0P+gPI=;
        b=oK553qKQPq3RTEapaq//mWRom/RXLH9iIMCl2izPCCFEvYHdJEl+3v/Tka4W2PvBvo
         BqMVQFufgWXjx3HlidW1qABiv3cgjMiM7ejqanW4pl/5w4sL8z7pxXYtXXZzVbZmQaN5
         FDz1Fdj+e3Rt9TnOc76Ov267JK1NSYCD0VHmw1q3EbA6VnKi7L+273I+i7ZR3Lr60RUx
         32FyHIpa8pdMAxzFqKuiWgWb+ZFbLXpj/I7wzQSI4R17Md+t5H9Fedr4s+uH1SyDkJqV
         WEjmEWuzLkESEZCF/FOIxLbpvQOS5JPfaSj4ppAGIOCu2d++6niE2pUaBFvQbhUran8B
         ip4Q==
X-Forwarded-Encrypted: i=1; AHgh+RqRTDIXWq6azwjnd7liIvx4JN51Ho5KdJ59AtQV/PyRXdRO81E9ESRZxbrJq0/vvk6Hug3q0WdrVsFf@vger.kernel.org
X-Gm-Message-State: AFuF++mTgSDWUvRCiVL+UoeqNX67xbgDBfW+E94jkEWXWM0Ld+7qK/Ns
	/D6GKtsyjw3BNE+0a9V2d7RxOQhI2vcoAW4xrkW7g1hS4QtGmhRg4CkOIVAEHErc70GOe2rTHQf
	eJNvKqHlqaZde8M18dolvyYm7my1+6W02XzTopDPrc7bzPSDPKEH5VBdKahT9PjPy
X-Gm-Gg: AR+sD128dtRZvNErJwzwCyzVJYod7ld/z7D9oRDDxztrfw6ozTQgsy8H3fEhCc77rse
	JmoqRrZYKXvKJ7vzae+GCoemsf5E5DM3iLkjZShTH14TxUeyb025iQScpo5C9vhWqFOq7dZPVsm
	Eo5fnr8/xHzl2MYI24FOC0r05nYkTp2fujkrA/xhON2cmJQROUScc8yGhx4mOVQOHJC6h2vb2/w
	X+sIyRVfcsNmj+gB3f0owo7Sefym8QR+SjKwAEJ01HdCDtWBXJD8uKDnslO65PnFsOOhd5+8HTX
	5pltcUZaHCLDIKCiy0n2SAvaxzgIlioDwbHXVphnM1ABbJjrCYZuujRtHiO6YcE1BmLcpTVUOby
	uzpED0WLuUxyqsqycW0MQm7v+RSS4Eik=
X-Received: by 2002:a17:902:ec8a:b0:2d6:3c1a:85e0 with SMTP id d9443c01a7336-2d64b185640mr442373975ad.14.1787566698520;
        Mon, 24 Aug 2026 03:18:18 -0700 (PDT)
X-Received: by 2002:a17:902:ec8a:b0:2d6:3c1a:85e0 with SMTP id d9443c01a7336-2d64b185640mr442372585ad.14.1787566698083;
        Mon, 24 Aug 2026 03:18:18 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d676761fbcsm15891965ad.4.2026.08.24.03.18.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 03:18:17 -0700 (PDT)
Message-ID: <d27d1c7b-72c8-4295-b308-52541348d1ea@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 15:48:13 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/2] Enable sdhc inline crypto engine for kodiak and
 monaco
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
References: <20260707-ice_emmc_support-v9-0-701c86f3c25b@oss.qualcomm.com>
 <f5b538dd-b350-4eb3-a300-78a02d5e4f1e@oss.qualcomm.com>
 <d4c65f68-900e-4d1d-9b31-350d7a88343f@oss.qualcomm.com>
 <7d78ea3c-3de3-4f90-8964-18a962218fca@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <7d78ea3c-3de3-4f90-8964-18a962218fca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=b4iCJNGx c=1 sm=1 tr=0 ts=6a8c1a6b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=90rwYzJkSxp73LfnE_QA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA4NiBTYWx0ZWRfXzJ24PsGYwjBl
 KKymvAXrUXgwT1HTxke4ys4DZfjqtRnsN6N6sTc5z8mhg+VTNM3MsYbeyj8gPEKmCY3pLcih7rM
 VckinZlnVUH2k7FLv2VvqxPNxMGdnTA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA4NiBTYWx0ZWRfX+A7Ja+xkcLuT
 WbuRLGGqjwnQcF8v7YwsejJRtnFxatFEyEKATKP65G5HXIqAca619ZkLF6ew3d0mHRSRYMxmL7i
 0gksQ09oXhPkhb8ZAYYzKNncd8gn8lQx3A0ynKbXAFMIZLoRG3//v9ol06FvQM8XVL9k8S4CFt0
 k7JpBBjYG/ip240ZS1ldEmqlKYYbVvDzVa48ipJNcUJLusbfMUtgK7Vzc7LnV3WTgs0Pfiyo06P
 CboBERMHI6nKlQgHlGi/89KEgVuop37OaYIHX3Bot3eI1n43qGxAFmy1eEhw8usmIpt2JJErfFS
 /g/SYCdCo43rCZo3tXjjPxsPXpVwYxXd2cEQVfMchk2xYJzUjngYCz2MQWMewOmXyoXs5UroOK5
 WBWuiATYbtMfURzBevvlMSZfjV7uPoAcGYW0LNe3dmfKhK8/217dvLQ+kQhMfBy3r2d6OmD5rgD
 NFPT+1DCwdfMP/npoWQ==
X-Proofpoint-ORIG-GUID: _Ix9E2yRMMFoBe33WteC5MTvYv0Xz-P9
X-Proofpoint-GUID: _Ix9E2yRMMFoBe33WteC5MTvYv0Xz-P9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240086

> I'm afraid you're unfamiliar with the release process and have
> mismatched expectations. The feature development of 7.3 on
> maintainer trees is done already and the RCs will only pull in
> fixes to the new code.

Sure konrad, what I am more afraid here is that patch was in ready to
accept state but somehow got *missed/skipped* to pull in maintainer tree.

I think i was well before that timeline but still couldn't have this
patch in(for v7.3). Not sure if something to change at my end.

Can we atleast pull in for v7.4 now?

-- 
Regards
Kuldeep

