Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9737740F8D0
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 16:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777479755; cv=pass; b=SD+++e0oma0X7YOmPgrF0/9HoBDwA5LNqRXla50pPvR2GyMGKe3cEez4bcRVB7SoRimm3F+mXAjpm0LYsHkcEPBmHG4u+4JKSpavLRrxBuiDQe5ckXY1vOhk8Q/HWB04sTHCRDp/Ed2DYUYWEXkJHJCNEUGPMXtpQH2y6q5mODk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777479755; c=relaxed/simple;
	bh=zeHlRNAL/iq8k8oB+OXu5Y2acD+IRikshmtnJE9EZ2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d+R6Z0EZABQho9+DOfJR7YMo7qpP5OSQ9FXtktwxHO8a21N2F2q2YpQ6Gd+GyrzjzEIaDnGVX2k4uAewRpKyuxybBfrJRr7AUQ6iu6Gy0/4VA29T6VfLujqwzX6qX6qhpWhy78Xp8e9ZtKZ3QneQL7U0dlbli9YnDmFGdCToUX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jzRi40++; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GkK2GDLC; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jzRi40++";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GkK2GDLC"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TF1iUF2095332
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 16:22:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zeHlRNAL/iq8k8oB+OXu5Y2acD+IRikshmtnJE9EZ2k=; b=jzRi40++qm9IKV3W
	DFhl2OnAx5ljK0yTl5sdGb4NA1HEADBLS++TGqlMn+WPdwX2/6sEnm3lmv9ZYp99
	LlEcReCx/bYzwF9NLAtO7bcrJFlciMJRn4aPd4eD+Stm98eR/lZ9R/efJuSpDVl6
	p4AC2qFIxVW4C9vjed4kHsoulcpLPjlt7B+SFd8FKtUQRBzBx/9/HZp7wa0xKWjF
	8rM2KO4apJFk/+YVNR4yaMCdO560y5Z1GaPSB3DeLIl+du/7wdBMFdHNxChQbTN3
	j6zhYqIDgiwDKkVDo/UJGD/sin4FGYQlmLRq69LZ29Ly82bOVP73uBopj5ec+ouI
	5qGwVQ==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dudh3t7ak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 16:22:29 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6966f1f4490so1134729eaf.1
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 09:22:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777479749; cv=none;
        d=google.com; s=arc-20240605;
        b=DRxuGpNfvOSFQFDWaYDDdOR+STOn+p6ZnNUSUOWcTGu7HD63pjrZASiN+RefOS4IRA
         Z002dkQOFLOIqGp52x+yR5bxHXAvtnD+1QQ4d680tj2oqOoO0abL/Jl3O+b+Dz8mGbaW
         O+hEX9Wh/EkP/eb0vXAHSRiz7W8ZAAG+7Kq1fw5zyFcV+S5R3mo6cnRVyDFCTGv9XrMq
         TVuAgRmzDF+WT4lvGyXBre8nzxJojm0gfZUxbKGdsm2SPbC/la6KIEnV0UuDYF431qTd
         Czz60QdXNoQinilFKNYSwI/t66a1w+iyaXSO5+b+odhP5qBKftqceIxRiFzelguLb2gV
         dI5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zeHlRNAL/iq8k8oB+OXu5Y2acD+IRikshmtnJE9EZ2k=;
        fh=J4rwjZSj4v+bHuO4QlQroqdfAy0DXlNtxTWsM5NU4r8=;
        b=FfWgAu4N80tVVzKSHZKKDTLSyvR3zoohUE90O9RIzROrfCJ5Tb6U0PU5YoKiIU0avc
         j2aTcOvU6wAcmgU6dsVbp0KqRqgJCnymJcjz7pt9yOQmzGOFmdNFVQyUYsemnGrA9nZs
         R05yW38/OWRvBmZ6kcY4wScBHAPpNuxYVH4sFQCluHIolKjHPyGRbIu02oT3OFrfkjIb
         3lzZDo1zCGuLrHNtPQDFwAbm9ENWCgPQXIaVAv5iODU4QMWCPW2rnqJY6YWeoqBbtG8t
         XJgRl8TtirEfVOgpY0baevomFy/bLLGOndEOpRMwg/A0xyBtVxISdIqzpn9241k5Jy27
         YZYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777479749; x=1778084549; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zeHlRNAL/iq8k8oB+OXu5Y2acD+IRikshmtnJE9EZ2k=;
        b=GkK2GDLCkQqfYx6JvKVq9FxU+hMrvsfGpUfPRavqDCLTUpLBKUdKe5rLsqys6FDmtP
         hIOvvEfK9Q6faBvDu4cyfg+UhizleVr7xWuPGM+/O/Smc7rzLbfFpORp6rQ6R9u9TB42
         YPliTBBJ/jTM060xEkWFeIHanPsz3QjsND1QRwNRc75XReEhwvQYDq/sOJ5sAZqqa09m
         mGS5XsOIV6arpJMMcEf7lnuj1cFn5E1nVJlL9a//ZJIk7eITAA7hTvndy26W2QBSoky3
         Dia8pdzWoCz5Ns+Xld2S5VTzXxMwdwCZB56H5G8oStRP0rifd4r3PNpyuomi6/FBTwRr
         emew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777479749; x=1778084549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zeHlRNAL/iq8k8oB+OXu5Y2acD+IRikshmtnJE9EZ2k=;
        b=MukkxApMAaDEn7cB8tVAuh0LW7fPUHku/fb12xsphlo9a+079cqD3//UMieJCS2tWf
         Ubf94SUvmhfz2KBdzVx/JLCyaSYnLabKqN3PyRnyTqQKulw+rc4qxr/dvM5GM/0iZEIE
         pV269IE/G9LjL54w5aTatocO50hDTG7Bt8C9WFrUEYLpmxtFLCOu9fkpLY51UzjQPiMa
         VGfcTaQC786Ol5CMRTHhyuP1mL5YC3vvCxvjP8PNMrRfVOCxM8vN3i3utGAxWlTQsh27
         RHgIiggKx/vgOAzlhyg7pYJe4fjDK857wwzRV1my8Ef0uLPO7FITbm3aP9e6mryYgs7n
         mcOw==
X-Forwarded-Encrypted: i=1; AFNElJ9dTsgNCxNlqmPgiObvq7dEqDZOwQE4MBJd/1nMupj8kUr8hOLoSEpnLmXG5XUntkFrbsOolTDbomel@vger.kernel.org
X-Gm-Message-State: AOJu0YzrBopQBCYyF/p8L74+kNfCWMCABmlXLY6DySgyM4wdPnq7dVQq
	qFjzSnRqBifNhM9TEUDGUkaObsiBfHFWS4UA/V6O8fSYQqA30AC7EgJ1t8L17O7nFjJn0BKqTUT
	LIEnCB5y6AJ8RWr3Fr7JUmLfK1ACSipSy06qvL0A76lVyOYYQM/g8Cx6Z/D89+osiencLSX9jKc
	6xO08HKN6EAmo1nqe3RebNthtYu6mv4SMu14jFJc4=
X-Gm-Gg: AeBDieu4YvOO201jXkoeXsW5e/GU+yvdP7xdpzEu8kBaCLO6XOmvafyOVornHcc7L/3
	7lfAZJJaCXlyAw+3OY4N931djHpL/w4BVzyyJCgOcvP73LpzQB9fvx82hXqcep0AzetZ2GRZNOD
	Xw3tun0CZ2hloRKK7zzXXI523y3UEYmH4GCB8TVfhDLMvbTnwyc9mfAF1ZYwVmwTvevPdUcS9kd
	kA4vbz0LsN4lyHLWy1JAMmBtGf+ECVMaQP8vbs5zOqekjqslg==
X-Received: by 2002:a05:6820:1014:b0:696:6e28:8c19 with SMTP id 006d021491bc7-6966e288f89mr732616eaf.20.1777479748809;
        Wed, 29 Apr 2026 09:22:28 -0700 (PDT)
X-Received: by 2002:a05:6820:1014:b0:696:6e28:8c19 with SMTP id
 006d021491bc7-6966e288f89mr732600eaf.20.1777479748427; Wed, 29 Apr 2026
 09:22:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com>
 <20260428-block-as-nvmem-v1-7-6ad23e75190a@oss.qualcomm.com>
 <CAMRc=Me9G9vd06a39vi_UrXCTkUtJQRogm2MqgnwLS_r3Thyzg@mail.gmail.com> <e0adaf64-10d7-4e28-8403-769e3070ec30@lunn.ch>
In-Reply-To: <e0adaf64-10d7-4e28-8403-769e3070ec30@lunn.ch>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 18:22:16 +0200
X-Gm-Features: AVHnY4IKbhM_HKhU56A0ru1z2waWryyeh9i-sfRAmlk4QJVuWsNhvXilz3QVxic
Message-ID: <CAFEp6-26sVj21JVECREORdq+UeFTB22MoqAm6Pd2fTosCQau9Q@mail.gmail.com>
Subject: Re: [PATCH 7/9] Bluetooth: hci_sync: Add NVMEM-backed BD address retrieval
To: Andrew Lunn <andrew@lunn.ch>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: UB3o8uQVDVJjF79au7PJFtqTMdgEhZLx
X-Authority-Analysis: v=2.4 cv=A4dc+aWG c=1 sm=1 tr=0 ts=69f23045 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=J1Chn9sQg74BwZjCRdUA:9
 a=QEXdDO2ut3YA:10 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-ORIG-GUID: UB3o8uQVDVJjF79au7PJFtqTMdgEhZLx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE2NSBTYWx0ZWRfXxfLxNCd9l9qK
 2SLQQqh9AAYYeR4Gzd3s1oW3vraYAIiPXJRejiyqBdIBpeKQhiaWPjObxNZyv2Xmoq1ldlUuwfL
 Q5RMYmC4xFpkBhjVKjpEyf258yx8iObLwQfBvh5EsjC2vNytCwWRJ3ctHfttAh4cWArt92nfB90
 yre34i88cOSV0uwkbstAo9CMeCzcUlNepAP6kqWglliYwr2ZHWBG9zLlvDCuOlWbmYCUg7tTJJy
 +zZXiNbh/MlmFHZjsf0V/pK3v4jiu5yqWF1xUE+5KQuaCuEercscsOkdrYrZfq1fHB5EUNKEoeV
 op+qlmpDocFdeC5n4ffbPW2dqEIpijf+FCKaODyY9u0bvmvmwlQ+gJEGqssJruCqwBl7f3RhxB1
 9qdYreeyecWuG33/iZB6YA0h7Vnt57YkIvUYIscJb5NMT05ju5GoQz52eNZkKv0PnK38JqykrBu
 CpJ1U72mkOLRDNq7zlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290165

Hi Bartosz, Andrew,

On Wed, Apr 29, 2026 at 3:15=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Wed, Apr 29, 2026 at 10:53:13AM +0200, Bartosz Golaszewski wrote:
> > On Tue, Apr 28, 2026 at 4:23=E2=80=AFPM Loic Poulain
> > <loic.poulain@oss.qualcomm.com> wrote:
> > >
> > > Some devices store the Bluetooth BD address in non-volatile
> > > memory, which can be accessed through the NVMEM framework.
> > > Similar to Ethernet or WiFi MAC addresses, add support for
> > > reading the BD address from a 'local-bd-address' NVMEM cell.
> > >
> > > As with the device-tree provided BD address, add a quirk to
> > > indicate whether a device or platform should attempt to read
> > > the address from NVMEM when no valid in-chip address is present.
> > > Also add a quirk to indicate if the address is stored in
> > > big-endian byte order.
> > >
> > > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > > ---
> >
> > Is there any reason why we can't extend the existing
> > of_get_mac_address() with another property name and use it here? It
> > already has support for mac addresses from nvmem.
>
> Does it even need to be a different property name? Is a bluetooth MAC
> address somehow different to an Ethernet MAC address? Isn't it just a
> EUI-48, independent of it being Ethernet, Bluetooth, wifi, fddi, token
> ring, homing pigeon?

In terms of naming, I followed the pattern of the existing DT
properties: for Ethernet/WiFi there is mac-address property, and for
Bluetooth a local-bd-address property. So it seems reasonable to reuse
the same naming for the NVMEM labelling. Also One thing to keep in
mind is that Bluetooth has historically handled addresses in
little-endian format, while Ethernet MAC addresses are typically
stored in big-endian format (as far as I know).

That said, a more generic EUI-48 identifier could also make sense if
we want to go in that direction, with expected property/nvmem-cell
name(s) as parameters?

Regards,
Loic
