Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5413B27EFF7
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 15:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774278420; cv=none; b=sSs1ZqXlemC+alDisuzNKwbIsw78C3rWirKQh12C4DASIpSVGrrGjdFjPFvRXjILtKvhZL/wqQ6GalrlLa3IBiS50GMlSFqCfcMUQDhZZiEA6HCV/QHdb6Y3ZtDpZjDO5mxUN6rbS2ctUat60rq5m7hEccxtZo6LXiGVE5pE3m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774278420; c=relaxed/simple;
	bh=vWfLZulYF98bbONuCI6H4gbtLYhlwHzI2I0yFc/vPEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rOE7YijcympXzHfvcdAPZHZqtpyjYFAi0QBxH1Hv1JAoOblyWsJZVEdqH7EuIGNUREYwJaEcbA9SRevk2U28tk0Wor/lF5q9yzkKWULCOd5aoB517icnhjvgPusfTQX62n0ieJGvnU1xfnbX7C7Li/9sO2ZJV+fNxxJPgv4poa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C3K7cxPe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WwEoIQm0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C3K7cxPe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WwEoIQm0"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NDVEll1364051
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 15:06:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uI6pvx4mLZDASpyKDCFK5aLbfXSRJ4d0KyNwYp6ZJPM=; b=C3K7cxPeJCD3Zrme
	ae37zx9TXSitQ0nY1zjkU7AMZzkjOp1n3J37UkEIuV053Umq4LmRD+BJr3gr57bz
	EEjCDdpDEZn62QCufrg6qvHzvTw6Jv7qk2wwW9OWKgE3EoGNmvKOoDSbKSGbhmr0
	vtkl82qfxb/WVVYlVScpze01konGKliOGIQ0yQ7ZMW9CdKELlKGLwPzrGfiW65Q3
	4kS+SSmetGGzjls7feMEM6epROvoNRjpV2t/H+xxJx9C57eQ7WdCIOr5uZTEysj7
	xWhRDn52JX3a3CPSAzMm+6QDlj3J7ddTXzBkZD/9m4dbTtm6LycWz0IV5XNHpM+B
	G+cLaA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31p79gy5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 15:06:58 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-94d7f83198eso483447241.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 08:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774278417; x=1774883217; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uI6pvx4mLZDASpyKDCFK5aLbfXSRJ4d0KyNwYp6ZJPM=;
        b=WwEoIQm0XxMmdCyWaRLIV/xRYoQRpu124u7MSgcoHe5HtwzW8kxJZ/NFpIYXegRgzZ
         tupCxbgM8Cy0dWJip6oelB9bpuhK5c2Ebr12D4eyJB/N4iOvU59OXvbeIXOlV/pQKgJl
         Zu7MhHW0YrvQUU/vT5zdzDX4zXV3DSJniPb5HPfEOm2Oh6OzqTLnL4cloxo0r72LH/d3
         i6k1oOTxgY8Pc0x5iuNeStbrqAHh/dW/GnUlsOBgoWxLzZeWoIs8pJyttOpEQsppozqo
         p78cDfeYQSIy/+d2n0gFtvkzpLW/U3zoYRtQCE6mQpXHc3YTDeX5ZwvAlrfuUSi230uT
         7Kag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774278417; x=1774883217;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uI6pvx4mLZDASpyKDCFK5aLbfXSRJ4d0KyNwYp6ZJPM=;
        b=UB+g2UYW5LhAcIa9aiptOqyQynr4+ifqYhxGbDnTQVg7AFkqjorSp+2muXMdFGjDcE
         6tv2bcK+czZZhm0WumgnM3EzOjicS9D203yMazDvqBRbyPKzSJX/jhl0EZB+dtdiANZx
         TwYRLiZsgUHq0bYsiaBInmKKKVOqR8VJbIXyr537M1jMJiAfJblRigGHWXiQlpmzmfK/
         ZpkdVAxqTtn3paDwDN12zCioQNx8ksx92qp+nGWNegHzWuwKYZNWDggGKYP6HgLiqZzH
         i5jPOxENPlro1xK3VQoZ+fJtbbW969VJWR4478h8p4JpmWRe9Za9yuhewLXmWI9ePCAE
         IlvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlRneGk7xe4S3SCEG4/u1b6RZif97T//S+J+nEuICbBV4MEl8z8LliJKTD9W119o69BPD+DQEViBEs@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx1FDi9xJqqJ12LaDIgghJ2mSFTsVDbVT2QNjoJTzOFMwZ8v1k
	usyrHj4eGppVqd/zf6Xo+RX1a9Oo3L6iQMKhZ0ZqaId7fKe11R4c6l283F+yHadNcIz2n7OW9+8
	4KKnUrVxTs6yQGHeRX/NKDRmA7MGYXGPB3WiqnDG99uFB/qVqta7rlqAUwuD1FUyQ
X-Gm-Gg: ATEYQzweXRvkpytkiBVTh8uIO5O45r74evvNPaTkm7fm2lsrA5KbkjIxPn5DTfB5ORI
	KCdACJvNpLEnCWq//g6al/x7gXIg7cqXJuKvExVigeJ0NIBmAmJjb49t8a6wZ6thrbNfOe+ookp
	OEaL3v6uAolIjhIa42hpqy/16DVBMOIqAOuPKbJTSqp9QJDYTIeeuP/FIQ/pqqTtdXCcUTxJz4M
	PK1uvYFWHxZCGgNLvXKcm2VBsaOuQXMwb/KpqefOPf2kjpg02b8fZVDCi533cil0yhpNIN58Q3c
	7ZmRIA53qkl73nGbXaxnlYSP0+4REe2TmcJeFw+pMJNuc06AXcQ23pYGO8ieB0r47zGi9pOG9VI
	9ZcFsu/kPE38LyHfB1uJWpkMFeyU+jHvqwfR95uYCOZzUxSPAK5uqnGtrOGu0HczkMm0qVA4sNv
	yLBHs=
X-Received: by 2002:a05:6122:8701:b0:56b:8426:b00f with SMTP id 71dfb90a1353d-56cde31dcb2mr1912405e0c.1.1774278417404;
        Mon, 23 Mar 2026 08:06:57 -0700 (PDT)
X-Received: by 2002:a05:6122:8701:b0:56b:8426:b00f with SMTP id 71dfb90a1353d-56cde31dcb2mr1912372e0c.1.1774278416834;
        Mon, 23 Mar 2026 08:06:56 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f43c3bsm502731266b.2.2026.03.23.08.06.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 08:06:55 -0700 (PDT)
Message-ID: <0ed387b7-c4ed-41e7-bccb-eb1a96064c69@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 16:06:53 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-dell-xps13-9345: enable
 onboard accelerometers
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, laurentiu.tudor1@dell.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260228-dell-xps-9345-accel-v1-1-daf9e3b3b5ee@vinarskis.com>
 <630bcc07-5290-4099-bdf3-b7e37105619f@oss.qualcomm.com>
 <kFzSXZV8ReVKN_rvfVDZw9pOzHeLI1ia9bepKas6qG-7G4WiRKk1RcvEhMnPrKrFDvRzLMUSIZgnDY5oerb7kdSBreCjnxJEdPZG9iyYp9o=@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <kFzSXZV8ReVKN_rvfVDZw9pOzHeLI1ia9bepKas6qG-7G4WiRKk1RcvEhMnPrKrFDvRzLMUSIZgnDY5oerb7kdSBreCjnxJEdPZG9iyYp9o=@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=69c15712 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=vwHDffmn88hdHWJo-3oA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: sWNp-9Ej9_4SBDhZloy1r1XBoZ_YvWrh
X-Proofpoint-GUID: sWNp-9Ej9_4SBDhZloy1r1XBoZ_YvWrh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDExNiBTYWx0ZWRfX70Chr94KiaOM
 ZloIrFBabLGSoKkflzkwqv7pJDwb92xBL6Im9QlUKSkstxiTN3BQVBWk0oYWEkTlH37h2pHME63
 E9pEJ+69+cnGUkknil4fMcQ7EUwDpKR/OVZpgHDy14Qj8ItrAUZfxBdypTb0NhRKIE+Sp8OOQMX
 vEBxsZZKPp+EKxhuqgTG5UwsA1MupqQerY7yHJEt+kqhLjJVYeQDe3LMPGDu20kqWs/3vdUzgFL
 AFCHoE3uEM+4aYy6yUFbcByDBweavISFF60MXkTmjUNor65HUTlSNPm666ttCuTpdNMu1BM0q1q
 ov/5LEQXH1Irs3MiDEnFzSmTqQ+x20npfY+17tk8SBZPUdm8iHS8H+L1PATVppGz3tqeNbKakvi
 NHY5pBLgUcKeya7Etzh0Dul3635NlusQx2bdVl3qmEb0jKxvQcf01Wk8qVrmV3S9To+Eg+YPT9Y
 Yy9fKmIDaFDYHkjS2wA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230116

On 3/2/26 2:25 PM, Aleksandrs Vinarskis wrote:
> 
> On Monday, March 2nd, 2026 at 13:14, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>> On 2/28/26 6:46 PM, Aleksandrs Vinarskis wrote:
>>> Particular laptop comes with two sets of sensors:
>>> 1. Motherboard: accelerometer
>>> 2. Display/Camera module: accelerometer, ambient ligth (and more)
>>>    sensor
>>>
>>> Define both i2c busses (bitbanged), sensors and respective rotation
>>> matrices.
>>
>> These GPIOs correspond to ADSP/SSC-bound QUPs. It may be that you're
>> poking at the same bus as the DSP is, concurrently.
> 
> Indeed, Val already pointed out that there is hexagonrpcd to access
> sensors behind Sensor Core from DSP. I found corresponding .json sensor
> files in Windows for all x3 sensors, but could not make it work yet.
> 
> Without these additional things in userspace it does not cause any
> conflicts: I've been using this for a week now, no i2c communication
> issues and device orientation information is present.
> 
> The question is then if we want to keep this series which ignores DSP
> capabilities with the advantage that it will work for everyone with
> the new kernel vs doing it 'correct' way over DSP which requires
> additional json (and binary blobs?) and userpsace configuration,
> meaning that most users will never have these sensors?

I don't know what's the endgame for sensors. Maybe +Dmitry knows whether
there's any action on that point.

Going through the DSP allows you to keep aggregating the data at close
to no power cost (""low power island""), notably without waking up the
CPUs if there's no other work. That, plus I'm somewhat skeptical about
going behind its back, since it may be that a firmware update or some
other trigger makes it start trying to communicate with them.

But I'm not 100% against this either

Konrad
