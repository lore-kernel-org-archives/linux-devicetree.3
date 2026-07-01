Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D413D4921AD
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 13:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782912984; cv=pass; b=ZWf71dCsPhgvdFOY7WngvndmkTrOGQi856Qqfc/x2GuEWh0qDOolBWCzCTdbItkPbxk407MLyI8Hca7fr+gTGESeSKz6X59xhciU8F9WFcUoMgu4Wymo5WjiV0OQy1z/gCvfLj2d7+AOC7eHToYwea2A1vNpOHLd+0UyGXFyKmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782912984; c=relaxed/simple;
	bh=N+n/R/mlFs2wkRiMkBtopMW3wGbtfZ47UIAhPinzCC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VVjDzC51gsOjNiDKhzTvQ9lUUnw8WtXa1UF2dsIvxViGu+kc5frEheGQHIZbygFVomhm+xStZXGAjIc9XVSt+Qm284OOPCXWsiuK8P89PVIW8aChKDHBSRElHGE48G+SFM1WQMfc4eb5VErhHQ596IJC3Zf2iyuKj1s2lc9hSeU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D0TYYJLh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HRVwUj6T; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D0TYYJLh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HRVwUj6T"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8kUo762137
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 13:36:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ViDlik4RCW62sl/RLk3cKzJ5UtFbYqrOCQjRpG10ly0=; b=D0TYYJLhf1Zwu2jk
	spVTvuXD1DtrAeoeC2o9zHuxnGi5L2oNStqdVlMFzAka42qve3FCqsZ0imRiSjGS
	wY7ttgiTuQozDBsloMvMWMZ7rH/qOR9G1lDsmLiF7+3AQRgTZm29mCqmNwGw2zKN
	vUeqWlghwM2RkTREn3uRhASvg6bSZRMNTxyjChtRcJbcOyj43Bn47PrPRgooNtem
	izYRe/87MwRcAlgJr+M4KcqpvbGLoJprSrbUKhtWlVLLmIPX48qaTHAE596YlbJv
	Qs74Yv6HObEi99FocjmPI1rDGZPAdejjSZRzvLFUsQfNCiXq1CiD5iYcCYaKTrC8
	PAdhXw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f50sd0vn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 13:36:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915f6ff639aso126249185a.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 06:36:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782912980; cv=none;
        d=google.com; s=arc-20260327;
        b=LxdoEhF1dw29iqfVTSMVco4Sp694lHTX7Gequ1m+BhRDI68LM/LWZs1S7pIYFan0kQ
         Fs/yq979gBtMJiZnPY4EIgHBFzIP4QvVivoG4kfpyJcQWugYWXsb91/acM8rwp4wfKXq
         DfbvNqF1Pq7BvXaxxyPEdlNa+uOVGVMkU7J8X6m7XiPfv94AyzEeMPdQL0OkrRty/eXp
         Z9GAjKZ82hpPHmcjKADe0p9E66i3GIwmJXxJk6iNycM6CKwddoqrGuGpeFNsWgfxZyeO
         EaZdA3Q9QJrAvpuql3csVpGrtRhxAQZy67ZpBmittiFYw8cGZSipDJyriA4tlPFUTlFW
         luKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ViDlik4RCW62sl/RLk3cKzJ5UtFbYqrOCQjRpG10ly0=;
        fh=N8XHUR+KYf8N4SVrbGKEM/d/qt0nOMzsaYbss3dCB2g=;
        b=q/gxjWjnTblvZP9yTg8V4W5dUOk/Fad5cM2ScmDpABHgtQrNTSqRaL4vwCkeh1d83Y
         uRS+IbMDDnxKXwcGaUNK8PfFO3SPoHNym1tldJs0wZpbvnj6AishAwnGDB/pLflCmEH3
         leM8Z/K18nXN6gv9DjDa6sKAPbsp+jUT2fAfQJgKvrdU/0Ozh7Ax3XdlIypLpk/ikzyH
         DTXy1bGzRBb3cwf4jWg+fD/NoOYHapPKK8Vf1Rew5kIK7dr1+kBGZNVnxQZMo7xH49u2
         c3xK0PqoRVc3ZzQFATVhZYlFS1OywBKw3Xmw0xSepXF18MI7nk1j8xEucelleFJIriBk
         EqRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782912980; x=1783517780; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ViDlik4RCW62sl/RLk3cKzJ5UtFbYqrOCQjRpG10ly0=;
        b=HRVwUj6T1WFzJgHooPCenbepuTuv74haEPIpemts0maavAE/jfQGfddDr1uo7W6DGh
         eZO0TVkEOlJ4qdgSnxOxgrjvn2LIEM80ctQtYFg3FgZSUteksjeaJszZZpr3Hm+uhe2X
         Ho2Lhbpx9CoYLh39bsXkraMGTKzjfyxPcI4HRAoQekY5WsYRCzzUd0JZ6RToG2p5aAPV
         NSri4rD9n3MlGC/Kb206UAvoXv4W7eOO6hqFO9Bn5/041IIrMop8QXhpZlPMbkgqMI57
         gSIoZ/rDnFVKSPMv5MA1Ugvi2JasMTR/clxSCdpuAoOF10eHQR/1H/15zr9xLsOTrMXQ
         K8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782912980; x=1783517780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ViDlik4RCW62sl/RLk3cKzJ5UtFbYqrOCQjRpG10ly0=;
        b=Vdzk2hPLR8X32lWwNwHl202UBbtcAacdZnpt9TXJvWlWhik9EXZ6haNN5HsuDDdfiy
         mfAfHWEQkgg2CmNfWEV5xhK4MQxCAv6123xcB4+ndw8CT4xX1D5Xgf4wIuIIHD5CNEmE
         2YFwge4quExsGF7+4o7Am6QxkoKixk+t141BVbf85OFvhVnxs99pwD4DnVyGbnJ1Lxf0
         M9CwlERj+FVtHJ8utmwvCan8XODt1jIvCC1uJRTCu5FpF7hdriGFfvcGUcSAEQmyfUTl
         JYPqdOPNOOEVVoHD+XFODusWSDFsKQiP7uHfINHHVhuexsStiBgNWY/F/8ZeqJ6hivXc
         gDDQ==
X-Forwarded-Encrypted: i=1; AFNElJ85PLkVSyC/0feFzAJ9+e9XsvXwOXFZtZicpW2gkQJstyAPU7CqoxQSAt7Y6AaTip4MiZIEmLLvJGms@vger.kernel.org
X-Gm-Message-State: AOJu0YxX6bvvHagauHZlaBclYPr9iPIIatFXAkFUZILG81Of+OkaKDHM
	cEsiooiVFOIFx2b6iEZfQBGg3nZ9pXUUH62FR8qAAZxSHB9pc9JoIJHkNhvm4wHdOrSx87RSKH4
	vXPTX/rn6Wc+Gqp61nYxMZWIjk98mAFSuATuNtt4dgsFM7SXnFevbrD29A8TK8mRH/rwFoSYEMY
	fCqtuxicoTUHaya8k/85ZQ1TSxNLavZ5zXL0LeRwE=
X-Gm-Gg: AfdE7clizoqMV4TTiYm58XgNyy3czFQTzFs6uUAn66KtTANbTmvRFIK98QsGrD/qkhW
	/PUoCadX9w4DEnqGzusRO80J8PWCHKlmxsmfZfXfMPKfX3OWTey/7iQxzr4AaD7N/rasXxniayA
	4T5K+x+MzPvv5LgseFTgkAbjvrLd0Df0HtmTP0NG6wv5p3qyO09KDKelzrFphQDIfisH1E6QVSs
	Fha4R+Lnya0yO5eKIiy9IxOrh9wvXbMJZQ7dKsNW4JmEGhWLWWj533KdmL2FBrou4lTUtnkTViO
	fjII/+tBhA==
X-Received: by 2002:a05:620a:28d3:b0:92b:6805:91be with SMTP id af79cd13be357-92e7853d109mr199454585a.70.1782912946581;
        Wed, 01 Jul 2026 06:35:46 -0700 (PDT)
X-Received: by 2002:a05:620a:28d3:b0:92b:6805:91be with SMTP id
 af79cd13be357-92e7853d109mr199161785a.70.1782912918609; Wed, 01 Jul 2026
 06:35:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629-block-as-nvmem-v6-0-f02513dcd46d@oss.qualcomm.com>
 <20260629-block-as-nvmem-v6-1-f02513dcd46d@oss.qualcomm.com>
 <20260630180219.GA4139943-robh@kernel.org> <CAFEp6-163adAq8-H_pCzGnq+Fo4jpyKGs6Jv25j3fSpZg3COjQ@mail.gmail.com>
 <CAL_JsqKFjk-mdaAAOzNB6rFiJbw5gd4eDpRBLQL-4q+uJKnp3g@mail.gmail.com>
In-Reply-To: <CAL_JsqKFjk-mdaAAOzNB6rFiJbw5gd4eDpRBLQL-4q+uJKnp3g@mail.gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 15:35:07 +0200
X-Gm-Features: AVVi8CfNT2AJJTgPBXfFVJQmZjW_-a9Isbc3rycVEtJcwbZkpqGBU1gJZohgDaU
Message-ID: <CAFEp6-20FXTOKQ6EPuR8OUDkqE4JXcUbXaFy7kRFt4fzszPQCA@mail.gmail.com>
Subject: Re: [PATCH v6 1/9] block: partitions: of: Skip child nodes without
 reg property
To: Rob Herring <robh@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-block@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
        daniel@makrotopia.org, stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a4517d4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=bM2Xkg4KEcMkddnjsM8A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: MixYCG8E93r_SsCb2B0QkyKlrNg0RWW5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE0MiBTYWx0ZWRfX2E7dKGZsCyn2
 9k+MEoHoB23PbcOBaoOTuCNBnZnJJ4hf55cNps8+hJcAXeGdeYeHbJkbgbOKGbVmVj6whodR9S+
 ewSw5nKnjydAE8UqXly1TjrosktMsVI=
X-Proofpoint-GUID: MixYCG8E93r_SsCb2B0QkyKlrNg0RWW5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE0MiBTYWx0ZWRfX1Z0dW1fTrOrp
 avG6yWM68qXN1eaLUnGgRTkLAHo2My6CeerSSATM8f4PPUJ3oWMct8wdlxbXD4PVGCsRNaBkHpj
 HhkK8TYfuQfK64vCjzNK0nUddGyqDfuv43wehyqKSiyI+Eayq9xSn/wqg3dCR0sykwaJJejRbCF
 rOHKPvInAQEA45zs3Mi4UPGCgjStSA+Xj07D5YIgyLXo1p7lSat4O1c2dfCqbGRv3HOGsosbQoT
 W9ZjIoQx4ZhFJDKsDbacNuqNv0Ywb9Wl8Wdzgn0X+XriTtMUUQwEg22t2jfEAWhHUfU2SK+99Y+
 DKevqsq1SKh7SmasKIDtys6y1a4NB4d6pPNp2fhkq5BiZILtxETNu0sAmThHTitsHFG5dqInJK3
 xYHQeqLB2FjS/aYhsNXvD5a9vprqlN7UmpL7u2ks7ElVqCr7AJ5+D/eMpyHstN96cMxzfBGXysg
 qmv2OClg3vDnLjALzYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010142

On Tue, Jun 30, 2026 at 11:46=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Tue, Jun 30, 2026 at 2:59=E2=80=AFPM Loic Poulain
> <loic.poulain@oss.qualcomm.com> wrote:
> >
> > Hi Rob,
> >
> > On Tue, Jun 30, 2026 at 8:02=E2=80=AFPM Rob Herring <robh@kernel.org> w=
rote:
> > >
> > > On Mon, Jun 29, 2026 at 10:55:20AM +0200, Loic Poulain wrote:
> > > > Child nodes of a fixed-partitions node are not necessarily partitio=
n
> > > > entries, for example an nvmem-layout node has no reg property. The
> > > > current code passes a NULL reg pointer and uninitialized len to the
> > > > length check, which can result in a kernel panic or silent failure =
to
> > > > register any partitions.
> > >
> > > That does not sound right to me. A fixed-partitions node should only =
be
> > > defining partitions with address ranges. I would expect a partition n=
ode
> > > could be nvmem-layout, but not the whole address range. If you wanted
> > > the latter, then just do:
> > >
> > > partitions {
> > >   ...
> > > };
> > >
> > > nvmem-layout {
> > >   ...
> > > };
> >
> > In our case, the nvmem-layout needs to be associated with a specific
> > eMMC hardware partition, nvmem cells can be a simple sub-range within
> > the global eMMC, each hardware partition (boot0, boot1, user...)
> > having its own address spaces.
> >
> > That said, your point about not abusing fixed-partitions is valid. I
> > initially dropped the compatible =3D "fixed-partitions" from the
> > partitions-boot1 node when it only carries an nvmem-layout and no
> > actual partition entries, making it a plain named container node. But
> > it's a bit fragile if we want to support both nvmem-layout and
> > fixed-partitions.
> >
> > Regarding your expectation of a partition node being a nvmem-layout,
> > do you mean that the nvmem-layout should live under a fixed-partitions
> > node? Something along these lines:
> >
> > partitions-boot1 {
> >       compatible =3D "fixed-partitions";
> >       #address-cells =3D <1>;
> >       #size-cells =3D <1>;
> >
> >       nvmem@4400 {
>
> partition@4400
>
> >           reg =3D <0x4400 0x1000>;
> >
> >           nvmem-layout {
> >               compatible =3D "fixed-layout";
> >               #address-cells =3D <1>;
> >               #size-cells =3D <1>;
> >
> >               wifi_mac_addr: mac-addr@0 {
> >                   compatible =3D "mac-base";
> >                   reg =3D <0x0 0x6>;
> >                   #nvmem-cell-cells =3D <1>;
> >               };
> >       [...]
>
> Either this or replacing "fixed-partitions" with "fixed-layout" if you
> want to make the whole boot1 partition nvmem-layout looks like the
> right way to me.

Well, now I think both approaches make sense. We should support a
fixed-layout on the entire hw-part/block, while also allowing it
within individual logical partitions.
Support for the former would only require a small rework/addition in
this series (to have the hw boot partition a fixed-layout) . The
latter could come in a follow-up series, as it would require some
additional fwnode logic.

>
> > That makes some sense, this would require extra work for the
> > emmc/block layer to also associate fwnodes with logical partitions,
> > not just the whole disk/hw (hw part), Is that the direction you'd like
> > us to go?
>
> Yes.
>
> > Also, Note that regardless of which approach we settle on, this
> > specific fix/patch remains necessary to validate the partition node
> > and prevent NULL-deref.
>
> Fair enough, though the reasoning for it would be different and
> perhaps should give a warning.

Sure.

Thanks,
Loic
