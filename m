Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1C93E1CE8
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 07:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013195; cv=none; b=PQk3E6UDZGMJEt5oE9Se4j/Kf8WLSb7GN6brjUAzvk4eSwx1j8TAJTNnNWIe0UWroPbQDUB3RfuLf9LmBNjFskE9uZait0o7tLwWuOzAjwF1LFHI7ljdZwOoCrQqp2jo3hxcx4ZiTYvu8Om9n1GOtr+wMdZsXSyFHuaZnuc3T9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013195; c=relaxed/simple;
	bh=oMF9fxA6TUqHssYpmwKnwt+AK55xxGpKjUk40Can0EA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fDsvjw4HWTxeWYRXA7q/tYMSmTOiCJMrJeujmqbNQJGFJirIr39CwzRYklX76eR0KwBIgrcVWmspIxPbWEhIRYjJyJ6HR1qH6juPZWwupJYadOIFqlUxbLw1OU3DaGb+XyEMHjupfwObbq5oP3bE+8qAU55uRm2pdMKI6xWUn4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S7WTkp8J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fVvGlbpE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S7WTkp8J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fVvGlbpE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6Sen23954845
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 07:13:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	90GBrB280GiRPxiqYLOldEYRgmQr41vcQysmzxNp5to=; b=S7WTkp8JhFNzoly1
	yI+Za7iHvAZkdLL+ld9sy/jAWRNiW5wMj5u7ce5zDMo4U4Id2cwjpOYQ0j+SQWks
	UbN06BkNXLTpRdp8wl26+3brU/iPQrMoGCdR+DEvnjSjYz4F+WEL548q04hGVzmH
	ReVm345aUEPaSbzImiMvvj9hrgT/LUxmJbKMCsHHlmLmL12zvT7CEWIEQ0DKlDgM
	sGWkLFrYbPJAQV5h/Jyv6GOgbT7eorRZxWHQEGdyyMVhSUUOlmtiMyUMWb7QwVnS
	OyIKP5u6fprSHVNmAAYCLDLUdmYDlsAnXipfq78O74sSy1OlYwlDBsCJ1xwjuQMq
	w+twhg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44jtjkx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 07:13:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51cab6f7517so6512981cf.0
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 00:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784013192; x=1784617992; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=90GBrB280GiRPxiqYLOldEYRgmQr41vcQysmzxNp5to=;
        b=fVvGlbpEBIwEeUutqTjTggsNeepMUJLhdNvUTaUTerQ89rljAYLUt3/f2w49LTsfUF
         hOdtcTQMFlzElQK/+J9j+f0AQGayAFeDu2Mdi9lYP+TdgbtDUkhc2lkbi7kvrj8SypjI
         EI1EU4SxWreZYi3uXi8GC58wqiHO9LzsSaBA8YIUHnVxnJ0f6jNVdEEj+5Nw49mfJpIg
         GdkPtUjbjIbdEEMgWGLAY3hYdmU416gtjcpk+hcgktgBt5fjzBbIvticwoFB6WgWxZkE
         QoCKu9UjgJF4co+4Ah/B/lvl755wqVpjagrPKpd+DepCw3RcBmHCGtjupKBppCt6qx9i
         dAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013192; x=1784617992;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=90GBrB280GiRPxiqYLOldEYRgmQr41vcQysmzxNp5to=;
        b=ltS/i09icKQY6jradr6JMVeTfPLGu+PYziNAMy2GnTyTLcv1GmGsix9xLxGCeWoXPr
         arp53JeuIHKFLstBv0ac4wAy9oEfBEUUkZK8OGL/RkA+qaV5z9q6NtbMC4wZWa568VAT
         Z/EM2jOjw4hKLmyTvYJ2i01vmDp5+cXiYV9hBJcJwSBq+rfb69YITQqKnhaZhwpVKP4G
         ahP9cyOIEkbILcr6JerEShXh2ARtpe5XDnG9+p3J1ft/14K9o9G1oydsbHDUzWBY9JgT
         dCyidrMbNeV2tAPad4VxT/CB+c9i/DzC4kI7EWue6q8ItaJ6gbjbKa6wedmLgYBwlYqe
         zKLg==
X-Forwarded-Encrypted: i=1; AHgh+RoRMmNu+cr9vd9aVV49IDz+VdS5CDUBlsrkW4GB6gPC+Nw5dNp8Pa/Zk0klzDJO5AoXkYO4HZj++y1X@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4r8FeIXAPuIqf6stCJeVL9YEi0tsbzcRuK9vKjE+e/OuBxbeo
	gkdSL5/DPcMlMfnDAG1npvGsuWHkUvHwv/XA8agqFF4DwQcmGA5/ooeGAPXfCfguqHHJ84l2tMe
	FyoosiOuNTcZX6pQnaqR+Q3K2MtUPYwlwQfjyqI+UME8JAWqlhtagBHJTrSTmCl8T
X-Gm-Gg: AfdE7cl/KQFSdAVV2FKLTeI4KGhCKhgrjqwfJXYQh21t8WNeUg0g/EN2KYKw4jeuGYk
	xAsdabBbjPHGnYNkyNvdBTiR79DZFCXddROCX8xOITey0/2B/bLbVjCYGt/vJaQ53sH8nVH9LAF
	oNCriH2Asj38n+UsAEKoULxAr1pBOIGnyOi/CBxHc3bOtJSXWm8p8Jyj6v8DpxLni9gVUNIYQbn
	sDGg+hZLYZGVsgu1y9dzuo1R2uPUQ6Ucv4f9A3qS5yqJtCuUQaEVda5zkuxmSXnnjeLoiXWPXjN
	twFK6LZNqL9gbnbyOU0OYMVnV0gZ/6eaDtFUWdxmRjH596Ryk6heFCJxQ/A3AtuMJJFY65OThB4
	ovTopVod+jCnoKl8CIhhti3YzDqBCoFCvF30=
X-Received: by 2002:ac8:5f13:0:b0:51c:215:3e81 with SMTP id d75a77b69052e-51cbf0e8ca9mr96724941cf.4.1784013192261;
        Tue, 14 Jul 2026 00:13:12 -0700 (PDT)
X-Received: by 2002:ac8:5f13:0:b0:51c:215:3e81 with SMTP id d75a77b69052e-51cbf0e8ca9mr96724821cf.4.1784013191831;
        Tue, 14 Jul 2026 00:13:11 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd29213d7sm910711a12.16.2026.07.14.00.13.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 00:13:10 -0700 (PDT)
Message-ID: <3f197b61-3188-4c0a-8413-b43beebaf3e6@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 09:13:09 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add Xiaomi 11 Lite 5G NE
To: Alex <oleksiionchul@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260711184934.55701-1-oleksiionchul@gmail.com>
 <20260711184934.55701-3-oleksiionchul@gmail.com>
 <3f923649-34ff-4089-87e2-8989dae335ca@oss.qualcomm.com>
 <CAD3ATv2awRTVKXD_+fK1vMv7R+du9deuyZoBqsZCT49mnLB0SA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAD3ATv2awRTVKXD_+fK1vMv7R+du9deuyZoBqsZCT49mnLB0SA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: v5Qy0F-y7OtblBp83LA8wr7lualj2as4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA3NCBTYWx0ZWRfXyY+/NUO5O9Df
 rBNk1CKNOoREgkOX+lOvGp2PwB2a2lMrJ/tMELV/vLuATUEku7N/sixRFPZez0TT5AsiATCRrYc
 8SuFKLPnwpbP7i8TXxxGEI5JniecNAUN1p7SSK0UAaeRFddJ4o3NCApd62fqA78xcinWFWE0yMe
 HD9+VCwADS+K/hiyWctSzjpV2kMCoPbUr3TXm+qsEWdI+KRCSLS8vZL2lTSVxXqIX3uHzxWOv6i
 ypJ77n/CRajD7ZNKN65n7plIfkk8wI+pkdnRSWe+gjBWS8JtiZtPzYYmjH2cA/djaE/b6TxTG2Z
 DA87ZtiaLigIKeJ3+GC3Qey+98Shg1F0YHqNRC9dgdqkOxaVT9UiA8iqm8NAvhIb2W6dfR3gSkf
 V9IJA+TKcn4PHnBP1OQMtTWeusRlEXA+/GznIqHwodOUwYofyXzxa3KZS+R2jvBxub866UFUrao
 tANwO0cgOSPYYpThNUQ==
X-Authority-Analysis: v=2.4 cv=XonK/1F9 c=1 sm=1 tr=0 ts=6a55e189 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=3CuGTW51vA1zEpcHy6AA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: v5Qy0F-y7OtblBp83LA8wr7lualj2as4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA3NCBTYWx0ZWRfX29ttptQPlFM1
 sqJ/53h12NRkS+O8qlhoRvQt/3v0UCZiL36rEGY1rlJiN240pvpzGunUrnoWn04Pd5OOdTZVV8z
 wHZd2quv//3vJ1M3vobZy8usnofyM4Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140074

On 7/13/26 4:10 PM, Alex wrote:
> On 13/7/26 at 09:52 AM, Konrad Dybcio wrote:
>>> +&usb_1 {
>>> + /* USB 2.0 only */
>>
>> Did you test that (with an actual USB3 cable)?
> 
> No, I have only tested USB 2.0 operation and do not currently have a
> USB 3-capable Type-C cable available. The downstream DTS configures
> the generic Yupik primary controller for SuperSpeed, but I could not
> verify SuperSpeed operation on Lisa. Therefore, the initial submission
> only describes the USB 2.0 configuration that has been tested.

That's ok

Konrad
