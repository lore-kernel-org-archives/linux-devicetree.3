Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793099714;
	b=Ig53dlq1CsbI5sAIZ4U+zkjX6Ilk+SKkXcpvHpBsYzgCrTwB/DMboLgCYYdZtsH62Nf0
	 tKzUx7NjHWL2nD36+NreSbpSEU3keea7ORJXVxY31f95/29nBYdjMsfMtmHIkK9vFGZrn
	 1aJXsF7R744/jJ2pW7mfkOhYwjrlNs9BnL27f9aBecoO4Gtyz9Ip1nBjuZcRYhLmYHrKK
	 aEw0Yv+bksmFaYU+dAXquTXi6swuj9oQld7wKLhNUUoTW4LMZrSzpLrh54WGqOH4PBO2I
	 B+wBujyDRQpBk5GFEAvxhGst16BquhR9BRi4TJYNCnamI1enXMEK1VVmDot1hXTOoCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793099714;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tRucvQt5o49jG1TwiHHjvTf2I1AR63Jc3hAhI3GDX5Q=;
	b=LppAvWSBRs2L3CDuf73+V4mOcaA2QYwRNSeIwtRFf7Pnuc+bFKWkq1qoSS38lIpy32WD
	 8W8z2iaICCX9GrXjnIQYVCh46gYtngLgIWyY8JGn3TQ8VimV+TF7W32ii/dXlqYhHQz3I
	 aqa92do3j61a79GOJuETBrKCwnqI78pKDOwVGQtUfgTlI1o35OMGPoolX0a9txL5OFn/S
	 d4K11ePSiG/Q3M7cpyiue0RDD/BIxPYECu2w1x7IceBehD4l/gLuVqovS0liA6mZAtltd
	 MO7DS0chotW1JJ4DYI10i4i0CEfuL/58GrfTzZ71T2NcuWZs960dCL4kqEDSO0hyZJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dC26IiSe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hxRIPlB4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0ED4606A31D
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:15:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0ED4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dC26IiSe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hxRIPlB4
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeKP91427437
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:15:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tRucvQt5o49jG1TwiHHjvTf2I1AR63Jc3hAhI3GDX5Q=; b=dC26IiSeUN59GFJo
	RQx8oyqKnkOoM5IaASm3NFGndcZBXQvyMcM3uKDSxqjVbTNnDEb3ssNNdiAF3Frn
	An/0XYKg5r2a53M1+gWpBXgKmmXv6hOA9UrY/lLXWWZuNszv8KsNBkMq+jC8jVfG
	VvSDqQobri9ti/7TgmT2vkkK9su3XGGziJ3o0Me4cG9I7PyuK2EsCpYc6Gd+zW5i
	3lwcWKa6c2dJL+ZbzcKMy1fztEha12NosOv4mCnNrlziXsUSaPXxjtyBLTwM6IN8
	apARx7ayk4qAUvQjKEBp0acX0+ZT006B33M87ANpr9JqzI7TtnA14Ni3Tj1Dwyf9
	/l9Osw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmmb9m8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:15:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5356c6d98cbso13851131cf.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793099703; x=1793704503; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tRucvQt5o49jG1TwiHHjvTf2I1AR63Jc3hAhI3GDX5Q=;
        b=hxRIPlB4ILbHz1FGjyCwyTmUK1dgF+HADps5LknqZEWj7FzsbzCzGMNP6f+Hm9ukKC
         bIVmLUUT7Bb3v1sjjZi7ge15evIuMilO44zx0YxisacVoe7DIBfEvdd0A6A4X0321KC8
         MpW+qXmkIi4o9LoQl5e16sb/tMHbB7L7T6NFwuK83AXM4l4cdBpYAYLY9T1k9JLIyVlb
         hxaRrcO/kOtaifMQ7WpRnMK77KilqoIwMipRaviBowppj32JxtSJWtCEBW5O8FtaqlxZ
         HKDba2xO6gEqIa2gcid6z1wem9JaSsIEIoOcJk3Qc2fyOb/M+qcWZm+lWQhOYnFz/dGz
         CjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793099703; x=1793704503;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tRucvQt5o49jG1TwiHHjvTf2I1AR63Jc3hAhI3GDX5Q=;
        b=NnW/ThmJTQLxmeEV/TgiVOAU6MRutYP7CT+punfXXkgeurSBAnDCunzB9YrHtDXSXY
         YuPBe4gNsPoYlQ26udvzanfSRDCBP3gtLCzJ8kjgee647OAgbzHwfYrEexAkYVzfDJEA
         tkcXHFx06uRcVFh+b5PC3YKSemMN1ZuQiBPUzLvJLIHOPDEet4xzyai8WTbjitCmxj96
         lgdHwuDIyLJ4UJDgzsrw3wmW9+tTrbmMaJMu2EBjvTYJpvtW8+kRSZ32RBFwLgRyKk+6
         ibyvtEaMQS/WnQD2ywp9Q+4W1e6aQY/6QXODshtEMINXFcmhYWfpaq4kXaBwV/KMCKKo
         ToKw==
X-Forwarded-Encrypted: i=1; AKwUvBxNQP98bnCK0ZNfCaU81Kf0yc/eM18lfkE0AQHWR/CpjGnQxUoGuGr0mcVEZ/7LRUQdTCFW+UPtb2yg@vger.kernel.org
X-Gm-Message-State: AFq9FYLS6IOc6VOxyOZiDnmITGMlwEbd4cGVSiK5XwNyaZ9EcyJAR6gt
	X146C681SYJWVYLkp85VAtWCtr2G5JVwX82C4I4UjTAvt+vcLFAgFYhh12BR/0CcGTXZC51IbWc
	6PsZ/ttGkH9ELcPv4eatDti+xw5kbr4H23Toju8VUpRVHwvFsMv3KIqVtBaCa8E7U
X-Gm-Gg: AYBFou2wPZ7nwzmzxfrmMslxia6MuA/QB2FbWcj98RXKYpcL3M05FIUnbEJmaCEE8b0
	74tglGwii4CjZyomDo06i5pA0cAgysyox59gLW8QuAi/FUvmSwNikBUDhQv68rUdAjyZOacYBbj
	ax4P5ejE6fRWZsXgxSYpAXP2ddRISE5SSjNc0sqeBRpu/KiVodrxp16OTCC14XQn3OUWdOGqn2R
	t7sa4w5ZCbt8y4SXXlD5tFNUXFX6+Sgfsm50eAwl2pSE0flt95CkRxE07510ecsujjzIOg/WKGc
	OcPgpp29wA9tKvBsSslWDARLxyBWmfRqZfvExWbOmeRpdtgtI+a/i2ZLQC733LYX6NiajXcg5N0
	emkfYt3ysjlAKfyzMfdjKNw==
X-Received: by 2002:a05:620a:8a0f:b0:940:f21a:eb64 with SMTP id af79cd13be357-940f21aef09mr1112254285a.5.1793099702682;
        Tue, 27 Oct 2026 04:15:02 -0700 (PDT)
X-Received: by 2002:a05:620a:8a0f:b0:940:f21a:eb64 with SMTP id af79cd13be357-940f21aef09mr1112248085a.5.1793099702115;
        Tue, 27 Oct 2026 04:15:02 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e99a2sm436376166b.24.2026.10.27.04.14.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 04:15:01 -0700 (PDT)
Message-ID: <c935cf4b-04de-438d-9049-7126fd82521a@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:14:58 +0100
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
Subject: Re: [PATCH 4/7] arm64: dts: qcom: sm8450: Add CAMSS device tree node
To: Vladimir Zapolskiy <vz@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20261023163057.775917-1-vz@kernel.org>
 <20261023163057.775917-5-vz@kernel.org>
 <CAFEp6-03Kqxya74Cd+hgueZ0D4xAcYNOx_R1sNqdMu2JrMBynw@mail.gmail.com>
 <378094fb-5f7f-42c6-a91f-158e2083a6cb@kernel.org>
 <CAFEp6-3XTotgkOKRACGLT91wUw30CgFB=44RtHnXfA6cOF7bVA@mail.gmail.com>
 <0d25a732-ccd5-4a7b-9809-93e67899b4e7@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0d25a732-ccd5-4a7b-9809-93e67899b4e7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NCBTYWx0ZWRfX/q6dDLWSyaGp
 95ZeKEOuHpAv85JAbbtERboTv2uCEavaSBlQ0LzVzHoHI7d47SC2MaonoL/r9TIe4SXrA4o+ETa
 BfnT9cDHhvigq2IgJgdhFipQZBqDpug=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NCBTYWx0ZWRfXxd+knckH3kFo
 iJp5yN2St3IHuu2Vqs8onSMdtgp+30AUlImCXtYpn1e0IoIQEjwqvkKhycYOienPNa1RgYHXe5g
 YX7+KLFacs9OsPtBjT9xfEfCk8gZ6whHTYrAKpS8w25YqMO82Uxje2ugdNtRQdJ+Zv8CHDB9uEd
 CNt7XkkeYVpyplfnFwjKiokTJA/gbJSNoLltkGvvcW8l6q04nH7smFnlUGeW1BzfSA7G5/h+6+J
 9pZJ+lJSLbEkTVVz09yQ8UTM/xocEzb8yxza0DMDHjFu1DpA8Cctj8bLBJbd7ExlkpOH5TYMglm
 7PndHXqwnmhhK5i2TiG10z/DN3Z4D7nFNetjL7qjbNmC7ds7hZPimUoOfu6ollhJ8yvKyp/za5b
 MvjxH6U7RqB0MVGMuSYde/ASwfa+mYwS8iStrYrD9It8oQBRldmku1Oa08G4w740x92v7O+E77T
 XFOanic3SZjfXtI6twg==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6ae087b7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=VFv3GnuNtnl0mo3CAFAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: _OrHNIljTRUCOdvMtrayR3JTW_Sz_VZc
X-Proofpoint-GUID: _OrHNIljTRUCOdvMtrayR3JTW_Sz_VZc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270044

On 10/27/26 10:54 AM, Vladimir Zapolskiy wrote:
> On 10/27/26 11:07, Loic Poulain wrote:
>> On Mon, Oct 26, 2026 at 11:39 PM Vladimir Zapolskiy <vz@kernel.org> wrote:

[...]

>>>> Is there a camss "top" register to describe here? e.g. to retrieve the
>>>> CAMSS hardware version.
>>>
>>> I'm not aware of anything like that. What is "CAMSS hardware version"?
>>>
>>> CAMSS embraces various blocks, there are CSID and VFE, full and lite
>>> IPs, and all these components do export their versions individually.
>>
>> I mean, CAMSS usually has a top-level register block (often top or
>> cpas_top) that contains the Titan/Spectra version information, along
>> with various global configuration and mux registers.
> 
> On SM8450 there is "cpas_top" register <0xac13000 0x1000> (not in the
> series), I believe you reference to it.
> 
> Is CPAS a natural part of CAMSS? Can it be modelled differently, e.g.
> as a separate device/driver, like it was done with JPEG or CSIPHY?

"CPAS_TOP" is for all intents and purposes the same as "CAMSS_TOP".
CPAS is essentially a wrapper for "things in camss that aren't
subdevices=PHYs/IFEs/etc."

Konrad
