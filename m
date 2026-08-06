Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E6340F8EB
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 08:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786005353; cv=pass; b=eMfj9QW36AWg9RduIfF1v+Eox05zJseuDC2NQa1QlHzAfRL0x8ATYaSYh8IdKCLUTefEViJLFqsDLLn9DUMsnNwDIUnivkJcF14niUzmanTK+uFa6N6qkCCbgvOfPeJuZvBh7VxvPvGnwFpZWFrGNGYkQPk2lmSAEk5ti6rXCdM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786005353; c=relaxed/simple;
	bh=2q59vm3N0TmAwGhIjwwQXTk20j8PQSGjXydlnzSOE1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bgmIMroO58Ey/W2R7eDbpCU4Fy+U91dq1nq5/XDeyCiyuV1H+CHNhHP9ZSdwtUYqJIl5KgxqYwVu5gol38Y86ixWGp31csuwet0cv/zKAbX9kkx6IliDNFSCoE/S+dn0A5XTtrHhga1dlXt8yedXsJTaVne4BJh2mLjQXKApjSE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=knNYuJzw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KBwD5ECh; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="knNYuJzw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KBwD5ECh"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6767kPOS731976
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 08:35:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IO5BjtLwolVVWGPuthMC0L545oHTgrgv0T514NGc5jM=; b=knNYuJzwMETlbVQq
	5tzrVBeRTrcQ7s791gy3Mm03rctd8+8OWYzsTd7anzKam5atqAbaN9X99a0RFh5X
	UyTgUQCJEvyziraHMOdDe8ZMGDUEtwHj0rdfl5936m1cPmiu6V+dNw1nBdmVL6Nl
	APzUNDDfo5sbWl7sTMGTOPNQ6a+u5iGduvLbhdVN/AmzuzWoVx3h+omU3C6OiNxx
	3gUqZ43gke7QWYZaQhsHf/ZJkVMvbBIemgyZ5nG+hMUgjOx45msQYUIevxr3PYa7
	W/kCCULdfo2ccMRkiRgt9vVpYa6yx0WuMbxSOWzu8pjjQm5HdLWaXobCmosw62qK
	1KW60w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5dk4gg3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 08:35:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930b571432fso60133085a.0
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 01:35:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786005340; cv=none;
        d=google.com; s=arc-20260327;
        b=ejmxcyUgZdktvDJv3UCYJFVa/YyPEuBVb0Iq4y7AkyuXIm0XvkBlRMtNaCGke+hWDB
         8Vic0fxSKvTanBUZNj/VXRd7MpJ+sNSVv5zU5sgMOfy2iXCBGC2+qlF+qEGmKtKD8WT7
         ZbnVKiIP94jxWuz7PXHGrOavI/w/Vo6PYu5LmPn3PC1i4mvcKIsQs73qOuVovYYps5q6
         Z9yuz6AaZea7MCr0waLK01JawBr6bwFcs+ze2IB3zjBc3OHtrnPzM4kDFoM+/d2XFsKi
         pgblEfQQ6ufXrpAg65KOl7/gZzV8ux2DN34f2rQ1TNrL1N41Xv4Ru+/q6ij1aNp3+tgj
         qNGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IO5BjtLwolVVWGPuthMC0L545oHTgrgv0T514NGc5jM=;
        fh=TpbFzXy3rJdf45rpSq7tSZYPz3BcZbwsDtJfKWQyYeg=;
        b=UHcQTdUIGLDPOXTSgVOCvmSncLC5yldtW/gIvzsCZenrE6KNXARVGv0x1WDDMX5PUT
         OG8NUwxhJG2st4RI/1lpvd52tVAGVwp0EeHBqMu2brVilp37/X3jarRWRR9DxnuILf3e
         01o4zP9J/geVdRBOZlHwyBbcZZdLuJOjNUeYf1xdpSdVplnuZ0PJKQ3A4h99G1FxRfKL
         5uX++YjvmRwxaw/63B/TILe3jTgcjlg6YySY1lF/GOoFW44qG/iS/km64ZLFgxoiddIQ
         Kjr6Z751ATSBvc0F6oFcXXFBZWF6lvzX2fIeplprgHmkarhnX8qewRsPj5LnrUq1wd5y
         rmVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786005340; x=1786610140; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IO5BjtLwolVVWGPuthMC0L545oHTgrgv0T514NGc5jM=;
        b=KBwD5EChppoyBO828fCEqYJjIH4tCttEPpOPaqCoTxFu9FLE6D95DGk0pvjY7QvgxM
         Hp/G56/UyCazUpSU327t3L7MJXUaItfFEJ2aDoGpTF4Dcj3Ocox73OmF9AQxfRHrWpdH
         tvqO/4wdWeSdXRIUJcpAmehzNt5qxoR9OGVZV8dcXaBB0jtET1OACmEOxqXC+CltyaRu
         QLrOb8D9lWPN+bHOFcYcidtcN3fKqihRsaYmDDPpA3JVdIyNkYUnqFnK0JWlVJl+YoDS
         uINFhr4j64oDcFbCxf2GmU9mT27fiRcoXbUU/mgNC50pjB5ndbGnfZInj5AThRMPU97y
         v/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786005340; x=1786610140;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IO5BjtLwolVVWGPuthMC0L545oHTgrgv0T514NGc5jM=;
        b=Xd0EBZbVWXjAMwIIrD2GHJZDdoJT9+SGhGhRABi0tpraot5/X6Cc29i0xbGnPdLKV7
         DVLl8xKuWsRGmE1qZvdT//tLZfCsLoggZv2gQ8ArszAK7afKUWJl0lz09/jExOW3Rysp
         SFHFUdarpVqVxyhqKtHdlQkb9mK7rzOFrmYmAkSAY2r4fft30kIYdJiZYsTyPC9P0wN8
         y1dDtQ4W9J07IpwNmTiIUFFD0D5KHi+fn/P4UjEC179YedudsGXlvvQWVkD7sm2Sp8+m
         +VZe+qCXd9VKxeZQOjVM8cQKqNtVEvwJIV9bBPL1dMcUFtc0mMNrTpdr3k/bzpFmBc4/
         4cUQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp+Lz13cE1j6hdoIYwscMeNwe1U6CsQZP5TulTozaoJRkXIoFxV4seqsh6eTgztSXa5dAKHz8pQKHWy@vger.kernel.org
X-Gm-Message-State: AOJu0YzFamn4uqOKd/UOB32JuZMjsMsXv9k6qTD3r+MAVc8VwSe5C1rG
	Skeg8oJIuwcixCv5gBdAuFADGPL6b8wID6oAzEA702HjLgxVmL9ioDMGN6pzq81WmiFZHFnSLy+
	vmKv3xiGzvfqwV27o0f9AloK0elpEyIVbwR2xS9g94Nvc1MJSfrngT9UR/FyOx4ognnXF0Ix0J9
	ePhQcxAgDp8QELVQmtd3TGXDiTeBD1OV5H4yMibyQ=
X-Gm-Gg: AR+sD10+IslZuVF/dJVU1nh3/emMpv3n3BVCgdtZtuvZEn1ghyM7lPHiWOHCTQzBlI/
	subsaZMbjrxtse6lL0Mv2p3HTXHbVzXbD1r7fjotFUoxYd3GOUA0Af0688JjiqvvfQaxHbzSvg7
	T6DCX+pBUQI43sbo0ZBEeVi5C35xTO52j87TJKMUqfDjzh/D0sLl3WXak3274BV4ZhXbnhiBXF3
	L2rL5hUKVXVX3CKqKfqlWekIzPEQ+eJ3KuytXnR0F7IQUzdX+JYZumPWOK6rr+UhJoIZ4ICVDo=
X-Received: by 2002:a05:620a:2715:b0:92e:eed7:91a9 with SMTP id af79cd13be357-9365de921b1mr229154285a.7.1786005340158;
        Thu, 06 Aug 2026 01:35:40 -0700 (PDT)
X-Received: by 2002:a05:620a:2715:b0:92e:eed7:91a9 with SMTP id
 af79cd13be357-9365de921b1mr229147485a.7.1786005339701; Thu, 06 Aug 2026
 01:35:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730-block-as-nvmem-v9-0-f72935817dbf@oss.qualcomm.com>
 <20260730-block-as-nvmem-v9-6-f72935817dbf@oss.qualcomm.com> <anIU7FSBT6VMzsf3@infradead.org>
In-Reply-To: <anIU7FSBT6VMzsf3@infradead.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 10:35:27 +0200
X-Gm-Features: AUfX_mymqcS50Qq-y2dDzlxCgZvzowjJtigqHjeUXKY3p0hh0LvfQj0GIbG90FQ
Message-ID: <CAFEp6-2kOsFcvBYk9Ow-ua7KAzdRgPD4Ky009O0Hgm-MXhJAMA@mail.gmail.com>
Subject: Re: [PATCH v9 06/10] block: implement NVMEM provider
To: Christoph Hellwig <hch@infradead.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
        daniel@makrotopia.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 7934XrpiYwYdCcuDtWFPCDNvAwCYHN2L
X-Authority-Analysis: v=2.4 cv=Or9/DS/t c=1 sm=1 tr=0 ts=6a74475d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=VT4XjZGOAAAA:8
 a=nTbZda4seY50gyMA9OkA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA2NSBTYWx0ZWRfX+/Q+1UncBW8y
 b+GM/1u/rteePYSWPOhCs/cd65ZvrAK0pucjeApGx6QLqWjSyAxbHlzD3ENZLIUN1oNQFWAnZ3V
 oK7q/2x5k2BBvdhmB2Ktz9rlihTSK73VexBO3Mu9VCPJguWHQTzDP+Sm6cZk8GyipgTjKtZboeC
 zFRRro7h8f1mHKBS8L90/2NxXX3AAptLeRkV6uh2hZfGH28ak34AYplY1MXAQdEY+8glbOIkho0
 /qMj5ZlJRgz3SV1ku306nb8176T8tF1YtHupDue9CAKweJijTq4nnJXrPIJbqVqwiGuAr1gv51h
 RC4OMvcU5ZfD/tYQRobcdPt4dCAHCjwWUWGgd6tCQjwJOdBSBd+0SwG2RlWHmDdoeLshKse02kp
 9J5hWvdCljGob1iYRiU0iuR3WLXMmSJkEcjg/1oVELC6eZNGFbR+Jf9P1+S8Sgo/RBZBbGpsP4W
 ZBfidCEAWW3VzLXTCVQ==
X-Proofpoint-GUID: 7934XrpiYwYdCcuDtWFPCDNvAwCYHN2L
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA2NSBTYWx0ZWRfX2w7OCCkcXnOg
 648ZlUn+6WRX9F5bv1efRk5kgaNdQtq20YBKZAexXi12OjtehFyER7Yclsyw23pRy/12tLpmnM6
 pSM4OQN9UUushvI8hrwIHD7w8lzZeGQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060065

Hi Christoph,

On Tue, Aug 4, 2026 at 6:35=E2=80=AFPM Christoph Hellwig <hch@infradead.org=
> wrote:
>
> On Thu, Jul 30, 2026 at 06:00:36PM +0200, Loic Poulain wrote:
> > On embedded devices using an eMMC it is common that one or more partiti=
ons
> > on the eMMC are used to store MAC addresses and Wi-Fi calibration EEPRO=
M
> > data. Allow referencing the partition in device tree for the kernel and
> > Wi-Fi drivers accessing it via the NVMEM layer.
> >
> > NVMEM is registered for a block device whose OF node describes an NVMEM
> > layout, either via an "nvmem-layout" child or by being a "fixed-layout"
> > node itself (e.g. an eMMC boot partition associated through its mmc-car=
d
> > node).
> >
> > The NVMEM device is a read-only side channel: the block device stays
> > fully usable, reads are performed with a non-exclusive BLK_OPEN_READ
> > open, and no synchronization is done against concurrent writes to the
> > same region. This is acceptable for the intended use case of write-once=
,
> > factory-provisioned data.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > ---
> >  block/Kconfig             |  11 +++++
> >  block/Makefile            |   1 +
> >  block/blk-nvmem.c         | 104 ++++++++++++++++++++++++++++++++++++++=
++++++++
> >  block/blk.h               |   8 ++++
> >  block/genhd.c             |   4 ++
> >  block/partitions/core.c   |   5 +++
> >  include/linux/blk_types.h |   4 ++
> >  7 files changed, 137 insertions(+)
> >
> > diff --git a/block/Kconfig b/block/Kconfig
> > index 70e4a66d941ff66ecb0ec34f4f7eff7fd1e4be40..4899ad572c71ffdbb62460d=
57623216254893ddc 100644
> > --- a/block/Kconfig
> > +++ b/block/Kconfig
> > @@ -209,6 +209,17 @@ config BLK_INLINE_ENCRYPTION_FALLBACK
> >         by falling back to the kernel crypto API when inline
> >         encryption hardware is not present.
> >
> > +config BLK_NVMEM
> > +     bool "Block device NVMEM provider"
> > +     depends on OF
> > +     depends on NVMEM
> > +     help
> > +       Allow block devices (or partitions) to act as NVMEM providers,
> > +       exposing factory-provisioned data such as MAC addresses or Wi-F=
i
> > +       calibration blobs to the drivers that consume them. This is
> > +       typically used on embedded devices where such data is stored in=
 a
> > +       dedicated area of an eMMC, instead of a separate EEPROM or OTP.
> > +
> >  source "block/partitions/Kconfig"
> >
> >  config BLK_PM
> > diff --git a/block/Makefile b/block/Makefile
> > index e7bd320e3d6971a8abf584f5de42776bb54e8216..8200297fbcbab304beb4239=
d0c33da07011c3ed9 100644
> > --- a/block/Makefile
> > +++ b/block/Makefile
> > @@ -39,3 +39,4 @@ obj-$(CONFIG_BLK_INLINE_ENCRYPTION) +=3D blk-crypto.o=
 blk-crypto-profile.o \
> >                                          blk-crypto-sysfs.o
> >  obj-$(CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK) +=3D blk-crypto-fallback.=
o
> >  obj-$(CONFIG_BLOCK_HOLDER_DEPRECATED)        +=3D holder.o
> > +obj-$(CONFIG_BLK_NVMEM)                +=3D blk-nvmem.o
> > diff --git a/block/blk-nvmem.c b/block/blk-nvmem.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..05bc35b9b8f373ccb606bdc=
a35d211c41d2764fe
> > --- /dev/null
> > +++ b/block/blk-nvmem.c
> > @@ -0,0 +1,104 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * block device NVMEM provider
> > + *
> > + * Copyright (c) 2024 Daniel Golle <daniel@makrotopia.org>
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + *
> > + * Useful on devices using a whole disk or a partition (e.g. an eMMC b=
oot
> > + * partition) to store MAC addresses, Bluetooth addresses or Wi-Fi
> > + * calibration EEPROM data.
> > + *
> > + * The NVMEM device is a side channel onto a block device that stays f=
ully
> > + * usable. This is somewhat mitigated by opening the device exclusivel=
y.
> > + */
> > +
> > +#include <linux/cleanup.h>
> > +#include <linux/device.h>
> > +#include <linux/file.h>
> > +#include <linux/fs.h>
> > +#include <linux/nvmem-provider.h>
> > +#include <linux/nvmem-consumer.h>
> > +#include <linux/of.h>
> > +#include <linux/property.h>
> > +
> > +#include "blk.h"
> > +
> > +static int blk_nvmem_reg_read(void *priv, unsigned int from,
> > +                           void *val, size_t bytes)
> > +{
> > +     struct block_device *bdev =3D priv;
> > +     struct file *bdev_file;
> > +     loff_t pos =3D from;
> > +     ssize_t ret;
> > +
> > +     /* open and prevent other exclusive openers */
> > +     bdev_file =3D bdev_file_open_by_dev(bdev->bd_dev,
> > +                                       BLK_OPEN_READ | BLK_OPEN_EXCL,
> > +                                       blk_nvmem_reg_read, NULL);
> > +     if (IS_ERR(bdev_file))
> > +             return PTR_ERR(bdev_file);
> > +
> > +     ret =3D kernel_read(bdev_file, val, bytes, &pos);
> > +     if (ret >=3D 0 && ret !=3D bytes)
> > +             ret =3D -EIO;
> > +
> > +     fput(bdev_file);
> > +
> > +     return ret < 0 ? ret : 0;
>
> The error handling here is a bit weird as you seem to handle the
> positive/negative values twice.  What about something like this instead?
>
>         bdev_file =3D bdev_file_open_by_dev(bdev->bd_dev,
>                                           BLK_OPEN_READ | BLK_OPEN_EXCL,
>                                           blk_nvmem_reg_read, NULL);
>         if (IS_ERR(bdev_file))
>                 return PTR_ERR(bdev_file);
>         ret =3D kernel_read(bdev_file, val, bytes, &pos);
>         fput(bdev_file);
>
>         if (ret < 0)
>                 return ret;
>         if (ret !=3D bytes)
>                 return -EIO;
>         return 0;
>
> ?

Yes, that actually makes things clearer

>
> > +     struct device_node *child __free(device_node) =3D
> > +                     of_get_child_by_name(np, "nvmem-layout");
>
> Please avoid the __cleanups stuff as it doesn't interact well with
> the goto basd cleanups usually used in block drivers.

Ack, will remove.

>
> > +     config.id =3D NVMEM_DEVID_NONE;
> > +     config.dev =3D dev;
> > +     config.name =3D dev_name(dev);
> > +     config.owner =3D THIS_MODULE;
> > +     config.priv =3D bdev;
> > +     config.reg_read =3D blk_nvmem_reg_read;
> > +     config.size =3D bdev_nr_bytes(bdev);
> > +     config.word_size =3D 1;
> > +     config.stride =3D 1;
> > +     config.read_only =3D true;
> > +     config.root_only =3D true;
> > +     config.ignore_wp =3D true;
> > +     config.of_node =3D np;
>
> Maybe initialize all the static information at declaration time
> here?

Ok.

>
> > +     bdev->bd_nvmem =3D nvmem;
>
> What guards access to this pointer?

bd_nvmem is only ever assigned in blk_nvmem_add() and cleared in
blk_nvmem_del(), and those are only called from the block device
add/remove lifecycle, So registration and unregistration of the NVMEM
device are serialized against each other by the same lock that
serializes partition/disk creation and teardown, there is no window
where blk_nvmem_add() and blk_nvmem_del() can race on the same bdev.

Additionally, recent fixes in the nvmem framework have made it robust
against concurrent access (for example, consumer reads) during or
after nvmem unregistration.

Thanks,
Loic
