Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795693478;
	b=LqUFU8ewsjuSIQmpZVr8/5lvpFLqbote0+xO0MDwgQrvEflaBIc5RUagEmYgE0w4ZdG4
	 0mv0EL8RnQPw9+da6+vvneuusC/+5LVcknxpetTlOEpHSr+QyBti7BLX+HshiOStgk5xV
	 j847FbDhMflnEqdnCAq7mYykja119m8V25rgIptJiwHgS1oQKABA2afevnSP/SywHNy08
	 xBJWQKD3Afc2ugpNYqCWfk/uxm7xn79Xr21IeK0UfHUzzfZYPzRZnhW3kXcp2p1jEDv9x
	 lfetYafrYDYExsINiAGLeNdaWp/DqTeEaHwsLFL3hSzqqcE6GFjO+kjF7ERcivGN9aA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693478;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dasQhEugGyhjw2vWgB8+KQ3T5J6mdhNR/K9EdifPI5Y=;
	b=A+RjDK+ZC1Ovb/6OG1g3ocYYayMBjoqLFH7SZ+SJ5hCYP/PyhXuhyRST3I2L6UXw3DKT
	 RpJZLZoBSEDRHAuHtL5XW6undF8uSwVeuSjLgnXMDgZxmI/uK0dPUXFKMMbS8CnPAGbMT
	 MX8S1azfij4CEHDbNH9NC81EZoUtML20UBvEZH3ydH5lMNBUXDmcHG6SXc7hvKKJWzOIq
	 0wlyAkUOUu06/TQvgE3LicCFWJgjS5PhS2voc/QGHVsdfmuD9FgGRNncifaOcMwD8HBTn
	 h0IaXSBjfIzDb8OjyqQgVhYpyzoBdyvD2me3RVfPM4pWwG5wM7jPtc63J0dj4DzF3bA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CqwfbaA+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N+2oZXb8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1D3606A321
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:44:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF1D3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CqwfbaA+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N+2oZXb8
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVsoq633354
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dasQhEugGyhjw2vWgB8+KQ3T5J6mdhNR/K9EdifPI5Y=; b=CqwfbaA+k+gbYXLJ
	KjRoylV3rZ1exJ5uFizbBBFmPc3iHg9CbdXGhJ+tmiw2PhP3GlRg9wDGx5NbHRVT
	4LgUXCORp+6oj/xiORGchdy62D+3Kx+41iZIxU1MsJIbs1mr4w5OzaUu93LrF0Br
	TSD32oRkHoQceeMLp9TyuwYNGBmcg5LZjGS2yqWr6s6qT8DCLGDTu1usvMetSJUi
	acwNGUMmC2kYTlOM64VGQQi5PTiHBbhtkUMTfwpNlWlkug+np2V7uk3J647Ezn1n
	0/J7aUKU6vU9H4IEJA2Op5LTX3apNELYGvfFomigOxrU+RdnFlOVGJwVAXPL1t9d
	bN/emg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6gne0vnr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:44:36 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b2fb1f981fso85076397b3.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 03:44:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795693476; cv=none;
        d=google.com; s=arc-20260327;
        b=JPqDGdAbDPlMPet8ps6t+uE8hjwEaJpNov3AufW4l9xDV+3zhC10m/uZo3iGe/tr++
         oQYIG6zMcaaTztNLN+iS7kunvYJTjomX1Az5O1fu1Tp0G22EG0v2WnmQTS/B13srG+OZ
         wkyoH8oaPk1iixvXNjfaa1FHJGvvsORyrfm38Vw10AFw2WxAJosaXNo9EoE+Gbx8NkBj
         +EOSH2E4oNSzRJO3rwk+CjK93cSC0mLeWUYtB3BNSScMdINpJbCZIz+fVzxYBwUUKUQ9
         cq5zzJjbqTYx5mmxv913bb53mPz1qX2C2JzIQ8SC7zTU3vgNgAV8P6VSNIsIltAeUEfN
         u4SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dasQhEugGyhjw2vWgB8+KQ3T5J6mdhNR/K9EdifPI5Y=;
        fh=7o7B9UbZ7UjN5IO6I6gkWCHh65NCr+P+UGVrwW1xOig=;
        b=BJenMMsji8s+xlUP7QoUf7JujFkmfAfZuW4FsnbUq9pOxJMf/d3mRhBtgVnwrBpMc0
         J4chzWqXfxAhHTbz4Zj5sHFIC1Z1jAWb0OY7YtdAyrM4L3kjB1l4em6NiZGtGKChmw1q
         lbAnlmEhAPvMPKTFFUqvFySglpoupjhwlKMbI/6O0Pq88h1b10vIfxOAYWTc2Z/UZ2yk
         aAPPIuzRwzxIBJUOSw72y4WUMT51e2RgVO32owi6qeLRQEMJtzWVfs4LEQ7akzs+snRt
         tDcsmIm2cAxrLK5szVMdmDgkWBBmPeUyhtNq+wHPJKDhvh0iI9CTC+y776U7Ak6heSNF
         Qi0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795693476; x=1796298276; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dasQhEugGyhjw2vWgB8+KQ3T5J6mdhNR/K9EdifPI5Y=;
        b=N+2oZXb8j15uMH3VmvohZTgQT+tkIUlKOnrkFcO4qMq0HrgXAi0vTabIoUd+qpZnZw
         qnNfva6/73k0NKHUlmX3JhXEmpl9+sI8QqxQ1EquqCLe+Mo2BRLK2TcgxpJeNiFzpANj
         xrV38pYLHTB5jkF3PVs0KNlqp2ZEosKhAcNHx/9ehSAALac6Ker31b48YZEmDrpN/B3h
         c3LeH30wcMqgYec6WBJ/HwLyvShUIZiCNtTK33Z2blpzjC15vNXkHqHB95YnWl/u0DJ7
         zG8wl7WzGMFbgGWkjTiRZDkx/SCdbRIlIWI1KFlMv/5K7LZ39wTACzAt19vDOVnuPAc2
         3l5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693476; x=1796298276;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dasQhEugGyhjw2vWgB8+KQ3T5J6mdhNR/K9EdifPI5Y=;
        b=IbZFHypDEecmpeSZAXrisisTXkvIP0TgHa3h+W9vcTAT6FK/5j4GKvNsEWKnc6EC/6
         UVW5dypzG7BBwinXmtZUSucMhhWMqhhfttres3LveiU6HIY0vUPbxTAZxmYiyBhTWm1F
         p587m4Idf/6rEH6Cmz3el5doqj+xXLkOnXqFEDlTyIw9HMuAv7MkxPCQCQv6vjAxHu0U
         J0pffcC3GL8+uZKOxoGQiYxhY+mkjAh1BNo0MJ4nMXO7SNELQOB0TevhG0F2mJMK/U7f
         5wzKTEcR5O5KgN5rcLWPPDTK4o2oEEUAgBX6qJXzpg1RZNBkUYsQF4q5YqzeewAdkswk
         S5Ew==
X-Forwarded-Encrypted: i=1; AL+hErEaDCu1x+LYGM75jukzWhGEatcDDm49D5Boh9nR4+CTnjTtguAnDZtVc8uxctY6FMz+SeLDnejz5+2b@vger.kernel.org
X-Gm-Message-State: APuU4Z8tyW8rBGhJVMnWF6wpoOYnoFOVzRBF4t1qwyvY8iUMnj6GkBt8
	uL556ywvlgARxV2ya9iU9lis73pp/lny42wQHcZh/xumtpkXPzb6XE4M2SWMsw95wRwZhoADFcH
	bqXViGCvXbaqd3ChKprMu+30hchu3EkDfFUR1G/e0XwY+LdZzktQsnHBxzKQx2jxBJiHLA1rlme
	keCPbIQcNjMbZNRmKaXLykzIQ+tQwjOEaw3wm8OSo=
X-Gm-Gg: AZFdTZcrZk0+n4GqbdTlYhP74lCH7udZ6Z0BYp5rJ8uVFKGRp1DlM3R+vCINUYluMmG
	f5eSHFuU7VEU8KUA1swxmNHllJOGx0cDZwbPmEhNKTzv6m7nCr9O5pXLjyF3Y0bUuNZhKEugW5f
	CKfVWh/DiiUpI5MKdShRnbJVufCeml35ZyfRIBI9GvDUrJfVph3+EQ2CM=
X-Received: by 2002:a05:690e:191a:b0:67d:b753:f6ff with SMTP id 956f58d0204a3-67df43ce21emr10002164d50.32.1795693476033;
        Thu, 26 Nov 2026 03:44:36 -0800 (PST)
X-Received: by 2002:a05:690e:191a:b0:67d:b753:f6ff with SMTP id
 956f58d0204a3-67df43ce21emr10002155d50.32.1795693475552; Thu, 26 Nov 2026
 03:44:35 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126-agatti-el2-v1-0-4e25fd64f198@oss.qualcomm.com> <5b3112f5-6b6e-4796-bb71-3ad92238bd33@oss.qualcomm.com>
In-Reply-To: <5b3112f5-6b6e-4796-bb71-3ad92238bd33@oss.qualcomm.com>
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 12:44:22 +0100
X-Gm-Features: Aa3M54pVVV5qmWM6b8CLMteH3KaRnJ0qbHg9-XNKHhrV2XXx2MVKh7bg0-fOIrg
Message-ID: <CAPzfCAajqBWB7OHYoxr=+2xRUzyWnGiiDAc--st0UGkutYrdOw@mail.gmail.com>
Subject: Re: [PATCH 0/3] arm64: dts: qcom: agatti: EL2 overlay and QUP
 firmware for the Arduino UNO Q
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=XpVvqlF9 c=1 sm=1 tr=0 ts=6b081ba4 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ycHgb9qKDJxlMUMqlp8A:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NSBTYWx0ZWRfX/pRomhKESsRW
 EokNv9bW0CUwmx5dSQ90ctH7H5eLMOYA+7gKDjtOKJggFj73vOyczBqJTW1xrqKcHfJJvlMyTg9
 rgznu17HzJr0QUVHVF2nTCufSzTHvRMXlm9yriO2IgNtAaPYWmvGoscijauKTYsBhr4uApAfBFV
 lTSxc9p0V5n4yBDL4x/2ZbK0RplDfrGRmVJ7Z81yO3gTk7+h6TrGzHJp417Ga2atVN+tJU819Pi
 je3AfCpDB5MQfG5u9EOSaiNg+uX0+kzOj6lHcpZ5yBo3OO98biGapc3kENG6SAvvVxURWQtlIgQ
 10N4QA3oIa6iqTblxtndIuBTS4r+Y9Ewww1/uY3R9VtpZ4ivIlLjbYviLOtyl43VjwtOFdGTRnE
 gY/LAuY6d8cZ1yh4yw4hp19B1/D1YF/DJHSNGBMLvWIF/Nn/OQ34kDlwxh3AzoPY8jI+9rJVkem
 eqKkIQvpc09iYnv93fQ==
X-Proofpoint-GUID: IWlK_dN0hFuqcB73Xnl73wL5hymPTSiy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NSBTYWx0ZWRfX85orhtcxraJq
 jHakxs9TOpTHnInmVDCwCK+0Q1ShgxjzT+gO0k/9JUNweFZnFMEFiUWuyIhP9ZG6ycu0nXZI8Jf
 hIBuIzIztkJk2cORNi1n6rYDbTJxaZw=
X-Proofpoint-ORIG-GUID: IWlK_dN0hFuqcB73Xnl73wL5hymPTSiy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260045

On Thu, Nov 26, 2026 at 12:42=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 11/26/26 12:36 PM, Igor Opaniuk wrote:
> > The Arduino UNO Q (QRB2210) can boot an open firmware chain: TF-A and
> > OP-TEE in place of QTEE, no hypervisor, so Linux runs at EL2. These
> > three patches are the DT side that this chain needs and that does not
> > belong in the base board file.
> >
> > - Patch 1 names the GENI QUP firmware, so geni-se loads it when the
> >   boot firmware has not. Where the engines are already programmed, as
> >   with QTEE, the drivers do not read the property.
> > - Patch 2 adds agatti-el2.dtso, following the existing -el2 overlays:
> >   zap shader off, SMMU stream for the ADSP remoteproc.
> > - Patch 3 adds the WLAN firmware's SMMU stream to the overlay, as
> >   kodiak-el2.dtso has it.
> >
> > Loading the QUP firmware on this SoC also needs the geni-se fix in [1].
> >
> > Tested on the Arduino UNO Q with TF-A + OP-TEE, Linux at EL2: I2C, SPI
> > and the Bluetooth UART probe, the GPU renders without a zap shader, the
> > ADSP starts over PAS with no SMMU faults, and WiFi associates.
> >
> > Patch 1 was also booted on the stock QTEE + Gunyah chain, with and
> > without the property: the same serial engines probe and the same I2C
> > devices answer in both cases.
> >
> > dtbs_check (qrb2210-arduino-imola, qrb2210-arduino-imola-el2,
> > qrb2210-rb1) is clean.
> >
> > [1] https://lore.kernel.org/r/20261114-geni-minicore-v1-1-a825dd549664@=
oss.qualcomm.com
> >
> > ---
> > Igor Opaniuk (3):
> >       arm64: dts: qcom: qrb2210-arduino-imola: name the QUP firmware
> >       arm64: dts: qcom: agatti: add an EL2 overlay
> >       arm64: dts: qcom: agatti-el2: map the WLAN firmware's SMMU stream
>
> Don't fix the previous patch, squash 2 and 3 together
Will do in v2, thanks!

>
> Konrad
