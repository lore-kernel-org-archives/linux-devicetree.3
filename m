Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761F7402BAB
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 15:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774365281; cv=none; b=gbdFqSNeX8Qxw3rUxoQbE3pPEsy3BNAFi7Tgq+L6dMXG9vZxQBh//gWUp1ly36Ly3626zYQmF9LU5B/tjZVeriiQQyhnpe4pXbOoxg8gueEFvy+Uu7AgnHjIpaRMoI8S7T8yMmXILoWFknQXj7uukvVlFvVVGmFoHb1a4EXjAAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774365281; c=relaxed/simple;
	bh=+0Msw2IiBwdvvih8mH/Ec6kci4sF7N/JTLM7+9HfjPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eRzF0p4yS7piXQJNfFd1+JMlSuTdcp2TK9xjZ5dYIn9+pAo7ZT0gyX6YG5X9r4IUsz2olfuIVkkgWDigzl1esvBPsxrE+90tLYSx/80SqcCRzo2kShq53xo10QnEyFOv3A85jkgqvogiYYQdXgEji2CGGzahAIUoD1z2LyqXlv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KsABJsDJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hgy0CHXl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KsABJsDJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hgy0CHXl"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9gO4Z3903935
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 15:14:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P5lyBSfEzVjBjyepyepbFSRgh9rqS3iMe6uh0gGT5Kk=; b=KsABJsDJDbjTrv6D
	5dg4audenIHNcV8vGwAbViLj6O5qiamDV+wBUU0ENF7UzVSot0sT6mna03ATGtyw
	bD96SpP2dOCtbaPZR2tCOgGOjSxYWHrpzqBiT80+NZgXD5/pvGQgK7TaI51nbsdH
	8IoXgUHy5YJkUuxJ2GJNboMrv8rXJ7nKnB4ZYU2E0Z20l9CRSf8W+0sBYwT7xzMb
	cFREHQBa5FAxJ+xKSmuh+m6sUyfOMpdJ5mt0glfyV2ZWxrygwahMhvR19Pupur38
	1L9WEv3bYvOoa3otx7YerOIIpgxotLxfHu/p8FQzMy1AG3fusLA+YxaJBTG8cCGB
	CGXrDA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3jt0jj7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 15:14:39 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-94dd07e7d0eso300710241.1
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 08:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774365279; x=1774970079; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P5lyBSfEzVjBjyepyepbFSRgh9rqS3iMe6uh0gGT5Kk=;
        b=Hgy0CHXlfOYRhR2szZUVZMWi9MT5v8wKl2jk6W5udSf9KhDhmTRhXbWaKGtxbHEv4S
         TfyNTPb7twzYzmjmrkWfOKqISEscGiGkxhUEvEXljp7CTcwCfBmZJQ2OSeoNmbpLy8Hk
         XpUMMekGIyfO3qxLqRyxwW2wWIGOg5HVhLAGjRO04peZ3Yy2PJRk4vLeGJXwOEec0CVH
         0O/WZsncc8JnhEq7Wo0RUbjzG6B4txEheT8eEXyIXY4XBh0hT6G+hkH0ziZc4S/lt+Il
         4aeswOG5iKRNNyI2h/9jC8/ydM4onzuVPKV1H1/gJd9tc/SHh8YXdcDiaJIRigwpMmiF
         6pfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774365279; x=1774970079;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P5lyBSfEzVjBjyepyepbFSRgh9rqS3iMe6uh0gGT5Kk=;
        b=C4Jk6FqI5v4JjFkOeLSAl6TuCGJa8zf8Iu7MBgVQSvxPQGRJ1f6VsOAhQIDF0JdCy/
         jJe3U7zWbcu9UMT8U8Wa9EtvlxAQs7B0NgOLzUOS9R+ScZyvqhi70ldxAWfdH0CIWTxe
         qyZtrnUrL1Ybj5cPpDxcGQo6X59z8DEDT/vgKtwUOqEBisJ8WD7ehlchYz1I7d0EKD6E
         fNw29f1b0j5Ni77a+7egikD1jP/dJ7k/JzNi4TSb9d308SjzZyO4dPtYs5dflhWG0woy
         ojRUW5f/K9Ln4UiQeCHFqzip4GDJRH3LVU/B77b0P5JiWEB+MTu6nyxfp4Adu+o9uMuj
         4I4g==
X-Forwarded-Encrypted: i=1; AJvYcCVSjtFAzHemvoffMb2KbIkByk+WfUSOm0SP7jrrWFvmYXdqMCVw2PWk5P+cnxp6er6cnRHKi71iqu+3@vger.kernel.org
X-Gm-Message-State: AOJu0YwLOCX6k9bZiqwP8rCa6TInVmp6Gas9Bru0g3dcmp8Lp9D4fKgD
	c3iJSPC6S0nk8yR51jE2uOmtypQBSwn5ZYHHrDvDd2avr3U1e65rft7jHv9vUE1Ob+/xcMlAoaX
	bHW+FYEz/ih1l4zdK8+Vm2/vX9XhHQ25gfGsLaUz1ky3fUeih16GGlI881wotXbD5
X-Gm-Gg: ATEYQzwmEBT1kD5JXntnVLaaK15FIOUYdpqkSQLsFZp4Deo5kYiFCtHux8+TgF9h31X
	Wf/mjzZ5I/m6wx5z0l5TuKWJlepUIF5QLg+Lw2Zvr3p7UrlPi4tN6K3zlFjGkScOtoBq8BZ3622
	qouHtr/aBAp1apt7qveNQ+AcoH9NHm3DC+OXDPsR9AX1UE2NLLZOQ46VToBrxpi3JqUW/EfC0WB
	c6PmitwZImYFuka8z0IRNSfmDzeQPbkha1KcVZN9S7B6vnbVXtu2jrQvJNEXp6zrAsMyGNgVbMF
	ef2ZUizqGib3vfrpYUkA75M82cybwn1WM5bnYTcQpUL2vftDAXTVD5X7+84eoax2UWj8JJKCJJ1
	VJfokKakA5CrRuldpHZHzqvk14rtoFjGDyX4d517mofgkhO+yZ8HEUog3LVGWhH0Y8lqkuLF1pZ
	blWV0=
X-Received: by 2002:a05:6102:2394:b0:5ff:c0e8:d89a with SMTP id ada2fe7eead31-6036ce74b50mr94096137.0.1774365278652;
        Tue, 24 Mar 2026 08:14:38 -0700 (PDT)
X-Received: by 2002:a05:6102:2394:b0:5ff:c0e8:d89a with SMTP id ada2fe7eead31-6036ce74b50mr94085137.0.1774365278130;
        Tue, 24 Mar 2026 08:14:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668cf7e4048sm4840089a12.9.2026.03.24.08.14.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 08:14:36 -0700 (PDT)
Message-ID: <87749d7b-b46f-400c-bc0d-932b15c7a75f@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 16:14:34 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: eliza: Add CX power domain to GCC
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com>
 <20260322-eliza-base-dt-fixes-v1-2-c633a6064a24@oss.qualcomm.com>
 <acHxosznN-xbWtjJ@baldur>
 <qfaaehigddfg2mawxrat5fp25zu4ioo7ebc4pnojsrzwwx3kk2@4ke3phfbmk62>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <qfaaehigddfg2mawxrat5fp25zu4ioo7ebc4pnojsrzwwx3kk2@4ke3phfbmk62>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1ByP1bhedEIUUrK2J3Se6gdbXD_iyxcw
X-Authority-Analysis: v=2.4 cv=Nc3rFmD4 c=1 sm=1 tr=0 ts=69c2aa5f cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=uPu1DMKTd49ALcYfVI0A:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: 1ByP1bhedEIUUrK2J3Se6gdbXD_iyxcw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDExOSBTYWx0ZWRfX+/37uOvdn8EI
 hTZaq7iC5FxMmbfX8LqfnUdhzX2G/LYm5IVLwflSheaztlBR6msiiG9W0z4jNzvH6S6VJ8q4PCA
 zLIPT/DGUVXwnHCo3+m0fWnpuRSH2DBag4lQyfNjz4ttu0VB/0sL82Zn8atQ8Zjb9AEKS0JJtcF
 TkqQsetcY5KmfPYJyGC2kpZMMBm8eP6Lbr3lgYibi7Ad5KvnSc1au9N4ZUg7NSFDjrhRO76kvFJ
 tBmXA2kLuSvfw5YsjgOAJVpTEcRaPhP8R9ZG3T6agX4LE0f3/xlPzd2iMp+baPxdaaolSF2t64A
 uQwBvrC/WrRwNJI3L3YHEP86joBrMMX3+FGUJJBRwjUwIFY1tal5eiIV3n6FTIq78YOqTMANM4J
 sZuB845/LBcwrpA3RpTwIbWZFIgEgtb0zI5JI2QNwPCi3qnI+vFYr1rMgbJIX79vMUFTAcoWqrg
 R6LEcszFTWPv/WSp77A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240119

On 3/24/26 2:45 PM, Abel Vesa wrote:
> On 26-03-23 21:15:12, Bjorn Andersson wrote:
>> On Sun, Mar 22, 2026 at 06:08:20PM +0200, Abel Vesa wrote:
>>> Recent discussions off-list highlighted that the GCC should vote for the
>>> RPMh CX power domain on Qualcomm platforms.
>>
>> Your commit message should describe the problem that the patch is trying
>> to solve, not the story about how the patch came to be.
> 
> Sure. Will fix.
> 
>>
>>> Without this, RPMh may not aggregate the correct load for the CX rail,
>>
>> "may not"?
>>
>> In what case will it aggregate the client votes cast on the GDSCs
>> aggregate to anything without the power-domains property?
> 
> So my understanding was that RPMh firmware aggregates votes
> internally as it knows the actual parent-child relationship and we were
> supposed to replicate that exactly in kernel for reliability purposes.
> 
> Meaning, in theory it should know to aggregate proper load for the CX
> based on GDSCs voting, it's just that it isn't always a sure thing.
> 
> Maybe I missunderstood it though.

GDSCs are fancy on/off switches

RPMH votes must be carried out manually and in the kernel that's via
RPMHPD/RPMHCC/ICC

Konrad
