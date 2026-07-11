Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5843133AD9C
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 07:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783755860; cv=none; b=clnLDut+5xYKHAEwa5s0HCZrKGNpX/AxcI7crMLKFmj3KoSp1kr5mKJ9wHAEfsLh84SVc6bV1068DFouzKZS3N32hpS2pfcl19MeTUztiEhMRpmHKju9vm4HU7Smdc9+dnA+TnhewF+61iS5qGEqtF/CcPyGXp9XBLLGTNhEdyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783755860; c=relaxed/simple;
	bh=9ouqP8jZf/TDmh9xTHXeEpZN1d2UP+puaSa5/485d1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sxSUhAaU8faKlfuHNzvTwbBIPUFsrCfDUCNftfCtu5vG8l8XFjgUON22khaYtxjb8q+2CvFxvPl8M2s8KLszcfgUR/YIU5wXXwwTVUgpBJgQnoC7TZrAHMuNRd80NihM/qtZUS6tEnB86009DuSArh9/R1g0rm8qd13GcD3DnH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p1kGabnZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HglcITMW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p1kGabnZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HglcITMW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66B6xbDs2967802
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 07:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3W8w4TQDb3xLJXJv3Lhnq1MhB2LIvVOPRYt4ylCCbT0=; b=p1kGabnZrUBJ2hlY
	yuorghfaDblqSdhiYlm7ctULfYW560j+L7l7+iB67vL341qh7nyxHnWQ3vWOf+JZ
	AyL+t/ITqzPyNPIRozB7MX8mEBWt+AvBtzfnRvLVuxL5wutnlAqMyCSiPFm+lHJ4
	5zNPRWE26Tp3vKzWOJ5TYm6fPNn3tnJGEZMYI+XOjqwA1q91QDMG/ygGBWECuMPj
	Z4BKER6Cv7GHz9YukZfOSC6BM2F8AATDw/MGHYxikN133urbTv+AIvifq6YwvJrc
	1nnbg79iFo9Kz57dXBNr1W3jPMJYNz2mSpDjJZtt2iZySZWN1F8lp5ezAH8V+q/X
	PVWFdg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf0gg98e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 07:44:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1a97644aso17626901cf.2
        for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 00:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783755857; x=1784360657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3W8w4TQDb3xLJXJv3Lhnq1MhB2LIvVOPRYt4ylCCbT0=;
        b=HglcITMWQ/NnqJ83qXh2ccUXOWJUkLVxBII936EHNf1rhC5aQZ1C20R3IYUCCO++Xm
         20dCOFIswpn00vA87k4eqXKTNIXy9XgJAqGXHI7b359uwc5ZdjaGlx5t59fN69shDuOg
         ttFu034xD7mf9XpCLQPGK1IvU+isILZk1P8yV27SQ7Svui6R3BUjoll/gSnzvrrFxJv5
         SYqnaetvEWjiC8KjdWK6OGAcKF43oEmmfei6wb+Dw4i/LEKZY7x6aK8ovBuBKiJsVBTf
         9nYMeEyBqC6Y1jZ4c1haTpLOlObR83W0b3CgAed8I1ZpekOWrj0YGmDhMQxJInoZy+rR
         g2RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783755857; x=1784360657;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3W8w4TQDb3xLJXJv3Lhnq1MhB2LIvVOPRYt4ylCCbT0=;
        b=UKsPLm7Gp0WgEhBb6vJQ54e7sZpdSQ+/e2+ZkY3VVOwFgjtuy1kKb/3q8RojM58LBp
         TIjw1hsoYNyUJjrXu6fxgGO4P/pQEro27bfFeA656RdfrE9V3fMPHsOT/TGE/+LduFXL
         7ss3ErBNFWoCeNYOtYawRkpdeE8oLNv6CtjVIj+nIODv6wEr+afEYpSuLEm9cHXk4yYb
         WpNY2MztoUj188iULiC85ido54bH0mK+b5B75JX1WCzMk+mD7OInLuv4nqwQgooD1yP5
         2dkHpQ/qFLaKj0wL9hQzXdihdxubPDk4u/0KpkNQgKSN+MRl9vMO/y68+BHjdveLVOOp
         24vg==
X-Forwarded-Encrypted: i=1; AHgh+RpskonS8NsLHHbozOCq5Kz4VVRMLjjElN5xtCCUDzS6nsTCYUY7HGRInrchE7Ai8CsTee25IVOnXGsf@vger.kernel.org
X-Gm-Message-State: AOJu0YyUPJY5gS7nvyj9LRAuqQ/dS+FDGOjmpWPnOWEr9Z1ldZg8Mc6f
	uC9jx9Cm1xBBITLxrCM8IxvF+BBkdV/i5wJ2cOpSacvEuQsLg51pgpNC7gloghiF1WGsvSAbHdn
	ygBll+3+l/O0SbKnPnfJMqWbaYuNLcPUNF88d7tWbzK4S6DIJKMnPytMzYip7ltyF
X-Gm-Gg: AfdE7cl2djfX30V3H+dC4Ijewp24cVYTXkOVnboZL21n9+VyIZzvqfUUGjeOZMFCW6/
	DXzAIb4DudwES84MmR/ce1ZTBqK9HOUtjfKMMshxu08ogghXffWFZuDzDmVD2Zwyc/NooZUyCUy
	6PPAm6vijaplYZHcRP0qNjuInoJ1ls3C3fB+05JKBYObCQcFiWHswiNGKRagNpQKtIq656mL0FJ
	UImCXz/8UXnkUeNx251EFOjn6pUDgapu+gvmkK7HcWOZoimaCQsSRf69Iv+FKjh1cSXBupL1sk9
	xKkiqfECXV0/IeVfGj04bPY7pqo7l8rOZttNXepEDD/LSel4+sHP92rfYYq8UCY8j8apXivxoXU
	lriPIFhoSNwH5seVY1a9ANO9ZmCDdkZwH6tveoH4p
X-Received: by 2002:a05:622a:1b16:b0:517:7e26:369b with SMTP id d75a77b69052e-51cbf0fa21cmr20914661cf.35.1783755857554;
        Sat, 11 Jul 2026 00:44:17 -0700 (PDT)
X-Received: by 2002:a05:622a:1b16:b0:517:7e26:369b with SMTP id d75a77b69052e-51cbf0fa21cmr20914501cf.35.1783755857118;
        Sat, 11 Jul 2026 00:44:17 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f4f09f89sm171709435e9.10.2026.07.11.00.44.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jul 2026 00:44:14 -0700 (PDT)
Message-ID: <bd5541d5-cd5e-4961-bec0-c9550c72ac65@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 09:44:12 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARM: dts: st: ste: Correct indentation
To: Linus Walleij <linusw@kernel.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260706101823.341230-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260706101823.341230-4-krzysztof.kozlowski@oss.qualcomm.com>
 <CAD++jLkQPHfq=_D_TPMbmmA4JFwbhhtTC+3Dj+uD2P6LFNtfUg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAD++jLkQPHfq=_D_TPMbmmA4JFwbhhtTC+3Dj+uD2P6LFNtfUg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Nq3htcdJ c=1 sm=1 tr=0 ts=6a51f452 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=CB77b5ot5C3TfE58PeUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: UrkNQYL2az-223FsO_CdlYBY8pA-1Oow
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDA3MyBTYWx0ZWRfXzes0EoI1DoJk
 zyFKl5D+e6S7pUU7Wpte33Lu1JXMQjnn0WPLOi00GK+yBE1028quAY8uc1Wc8Hk+sRg4EvPIryI
 Yc7EPQZg2XOFluj8G8K9slduzWgg9VYiI77u0YJmoNQW+TqjTW/u/omUeVu20JlvwNTFV9tJORW
 hvIbVtNJCgYoC/RQSU67id2cpEerluDi8yKHuNe6FWsGdmbEfOb3QAOCUF3KBiGakp5wPSawKsu
 DRacb8jLwS34mbTeh/fJkgkLlur6FrW0BMaQziQJM9lzFZDRCvYaVyTRbyGGWZ2i9B/93TlEOBL
 0M9k1vp5PrWb3exHanE2GpvI7KlhpOfRUrDavlAaROyWIn4tq/kVPJB+7j8xgIruj0FoVjPXo9C
 webKt+mk6jld4gliS/osYK+dlaHJgT+tTbu+s79r3y9gQs9NYA3RR+JY/74MOpLQW9mkS9yySUl
 rf3q6eKeLIvVfRpGHdQ==
X-Proofpoint-GUID: UrkNQYL2az-223FsO_CdlYBY8pA-1Oow
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDA3MyBTYWx0ZWRfX0wOz0x1Q7CUM
 RvrdhxX4el7pvtmX1cmH7nFLaj/jOzSwLeNrl9kNyaagOESBd5i8heOFl5h2bAAMJ77MpBet9MV
 9CLgi5G1MR3JquPj4cxq7bdSIGlhhsg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607110073

On 10/07/2026 20:53, Linus Walleij wrote:
> On Mon, Jul 6, 2026 at 12:18 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com> wrote:
> 
>> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
>> No functional impact (same DTB).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> This patch 2/2 applied to my ux500 tree, thanks!
> 

I think the same time Arnd pulled it into the soc tree.

Best regards,
Krzysztof
