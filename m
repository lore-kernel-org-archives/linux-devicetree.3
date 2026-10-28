Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793207711;
	b=3BPRHWKtijphTA6XJscM/Md93pNMDBR5PoQUj9PjRFd9ORNpNXJk/pYITOdT/js+ML7b
	 YLONaag6fJnbwx2L1+N9LOGPiRDeT+kESQj3TKv+JWbdG07B05Rrin1RBqAcoe79R6r3D
	 H1k/UjzaN6NyyLgjoqqu+R4EuqzRgK6LoO+pdejl1feJ9sUie/qUhhVdbFVmnTCDnzgPS
	 gGdJZnenrz3k0fvBEZnPkTOYcDV3bwUD0dmpCFfXSQgRTTZ9YFyYnQZBze4TioSQeOlXu
	 CK5XFDDI+jM+3ZybdvHIxiTgSmhlX0sotFswwqCmgD3GQYyjbHDdAigD5nvoWyJYyEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793207711;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LnugOozrP9VXqnObYje6VqLo7X1iy+GTdieQ0zj7BwY=;
	b=EGm0HjGpedjnjgQzrMumPojBepTQSA90Z254l7xo9uQbWTecx5PMtIcEkJw6nBd/BIEC
	 B9Me5wLLPTvBXVy0BBzNCk+xRjQAg0u/egB2De8gt7f0ILkzQ10+PNTnHXSpsoRrz4ARU
	 kITvs+lMP9SkJWADIRCfHmgN1yIgWh4Xxb6MWZmam0KltskJQZHuT8PRTELDSAwY6YX8h
	 jQ9mx6QOH4K7gKJsPC/znQqgb7YFuxBO8ow0Y8Rb7HZou/FvgP/LS0mi0vdeLNLgOuYq4
	 MToCBjVVB7Qk2dftmwylCRb9M54AYhR4a0KdC59lTazz0sp9IaNJW/Vog5on8h8CedA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FX7BORYH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GNWToNHe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2968606A322
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 17:15:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2968606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FX7BORYH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GNWToNHe
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAXMe1153188
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 17:15:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LnugOozrP9VXqnObYje6VqLo7X1iy+GTdieQ0zj7BwY=; b=FX7BORYHJdGVYKvP
	zR05piPoIjX63d2tWSfCH0J6bCKixFpnUmf1n0mhrH3EC29X58LJUIr0LMWnDcrt
	bhBIetCLQUndTqTHCfCeDfME5hyzY1n3eqewj40uPzif/a0i3be5ZtooHM/QHDq5
	VDW90hWYqF0meKrmTr6FHQWoz1ztHZvQk/2ymvsLUXEW60148Tto7S/iOHhqVac2
	0VL2hz16Pjb0nLEdQZAoea1bXtJaWNLpNaDT840VxNPKzHnIWXv8/dM7Z28XoDAA
	4oMdN4NRefuwGCVQ5hCYsMIP9DFz0ZoQZGDorG5vt14rJWtpcHyc2cAf38G3DxQK
	mJtQfw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6be3pm9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 17:15:09 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so1158165a91.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 10:15:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793207709; cv=none;
        d=google.com; s=arc-20260327;
        b=e+mSKeFimBHonbeI2+HVkV2Us5k6Zzu6grdG68P/JgU8M3rvMMK4MVIY0RU9jCuHWI
         oOjL5Rc3229C5yNqYXZaxZWj6ByikWfs2KSlImVnq/8ai0kwiy9Liekq2hqnkTQjeo41
         7glRdO0bV+TFBTCJgjKp6OFhAIgEeyfmoDDnTHIX0anDzRXFXw/N9xr2mL4wjcmUBnCf
         NRfakGpqgSIQk3KQ/mYIZnhK0qx9EpactwBM3R+WT4lyTA44IYe4vOnqQ4PGmu0/pQcT
         qlZTsL+jzAERzyPG2HwjCIzu6Yap7tr+OEKu4vLT4jiYmTXYStinyxMgxeA17bgt5Ta9
         D0mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LnugOozrP9VXqnObYje6VqLo7X1iy+GTdieQ0zj7BwY=;
        fh=r4W0g5ZGlzareGM1eyq3Hvqom0L/GanEnR/wI1LfhEY=;
        b=LWaqatnCaIsiiHnYLYubADGx3mnFCBZFMH6R597PkPo763DUgJ09G8D/JulfZkGZCI
         8AHREsx76ZdcSwot6op6pNiX+SSWupCtYO3BcY54VHwV12LN0ds+HEqxhGeimxyIE9hm
         E7Qxh+v4R6nO2eEzUxXlYBr1PiG4NY+aUUWTE9VF25dHJiSD1D6mgJ6SzmpU/hqAVqiY
         tQShG5YQPhGWmEDEgAzBHdF+aUHAn9BA06Nm6xWe8fS7fKEhBmfSz5MOHJIjgtVkwDBg
         9Mhzdhbb+QYVdmpwGelTuL72k4S8m0zcnsC6oaJxr7bzjw+Ped93iRjOsEHJZbBMAKVi
         mwew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793207709; x=1793812509; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LnugOozrP9VXqnObYje6VqLo7X1iy+GTdieQ0zj7BwY=;
        b=GNWToNHed3bYT4+kWleZscnKYhPlHPwActwHmXX/XBwgnIMIsdJaIIBlCZ1XTTCyvr
         eoZ4uK22Q82Pmt99l9+BWT4Q7TXjJeIHpjDeVIqEVnQu5zVh3WplA+6NFM0mBOK85zPt
         GixX/jHVxbjoPaiiCU0TnZ3Armxy9VAnR/NbON/WQVjbpvep6e/grtVSpPPXNdWWgyhU
         Yfe21AP+BhsMhx6WL6fskkpKyZjt/lQUX2lNu34WoHnl5ORBKjtcMZ6ikZB2IZkK9JBT
         SlAwvsWUJpoQz7Y6wMoFMANclJZYvjqnvV+SxJDvkcOfz1QTM+77PvDUkXrVArXmdqZB
         EP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793207709; x=1793812509;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LnugOozrP9VXqnObYje6VqLo7X1iy+GTdieQ0zj7BwY=;
        b=xybVT4YM2tPLpSJr61b8yeOe8zXRBcvEHHo3RkjDbLFqY5uf0alMMAWFAWIk+U4H1l
         Mb6ePWbMsygf46e5B2IV3GGVmaRHrTrfCtTBPqA7wfNrzcTS9B1MqmIu5G+g7/rpiRxl
         g6vr4Cdvb7XrZpalmCrmGic1r8G3Jr/fv+dpSOngRYxMKq9kSTmHVh1kXjkmH6/9dyro
         B+/7Bouoh+FwM/K0Ix8FO21Xt/SW4QWCSeEbVZeNO/OngI2eABNoPs8xchLZYsUIcDtC
         M3FxdAnt7JwnSStHTLnmpJGTr/TA6SRpwtHh2E4XhzyrdOJEMuzOUAn2KxnPgOIj235C
         fltQ==
X-Forwarded-Encrypted: i=1; AKwUvBwX7z2JUYT6w2sMO0qPmMWKSJtUUfShAH6EDQGaZHftIfxtt0YGRFm9ziJEsQTeEoyxmLR5j+HmaeCB@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+hNMibz/kcbZnJosj0kZC3YD48GxGfMOUjj2zefQZfFKFNBXM
	bmKuEvcu3x7xEnzsPIP8hx+7r4AjMBWgEbeWfI5D5vtQ07YDjrTQTSQnFNdn2zRszRbnel6XKCI
	s9XJ14SCAny/2FIOcdHLv350eJvOUKNAy8Sv0FGL71X/ksbj5UTj3qaWzlGeaudQpefz5/moG53
	cfwoNge0JOjPkizcYfrJ9jqZIiKxg/EsetwlPv3fg=
X-Gm-Gg: AYBFou18FEzmFAJSBiCX6LR73RSoNz6R2rXEpVXO6o/NJtAxNzvHzmEWNhs6E0PnzMK
	97LRZd4rVCDAshrigTwDuw68SdAw9kc4iqnlz08je/jF7PUVZjsT6gtGnBRBvjE8xOH6BEJlmFQ
	Sgv+BeepyLZ+wnz79Crjaafkw+abePhVdwOlsYzrEl5ea/SNO7iQS1xXJxdw==
X-Received: by 2002:a17:90b:4cd0:b0:3a9:79b4:d85 with SMTP id 98e67ed59e1d1-3ae6eff7393mr71044a91.32.1793207708744;
        Wed, 28 Oct 2026 10:15:08 -0700 (PDT)
X-Received: by 2002:a17:90b:4cd0:b0:3a9:79b4:d85 with SMTP id
 98e67ed59e1d1-3ae6eff7393mr71013a91.32.1793207708003; Wed, 28 Oct 2026
 10:15:08 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930103258.13375-1-changhuang.liang@starfivetech.com>
In-Reply-To: <20260930103258.13375-1-changhuang.liang@starfivetech.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 18:14:53 +0100
X-Gm-Features: AclHuK8CaXJNTmA5tKbBoAyE77_drdIKa6H1QBEjzQPCv7RqE6LaFLcpv1yZaLg
Message-ID: <CAPx+jO9dthZCQ4V-25PKGgEJ2qF9Znu6VVFECYhjB-JabyV=6w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add StarFive JHB100 DWCMSHC controller support
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Inochi Amaoto <inochiama@gmail.com>, Chen Wang <chen.wang@linux.dev>,
        Jisheng Zhang <jszhang@kernel.org>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        sophgo@lists.linux.dev, Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: erAL-BmWoszkjeU6OQBPEj7OZqZngK3C
X-Authority-Analysis: v=2.4 cv=HeuB3SE8 c=1 sm=1 tr=0 ts=6ae22d9d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=Bq6zwJu1AAAA:8
 a=N58GgX4bPs6XW67x5a0A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=KQ6X2bKhxX7Fj2iT9C4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2OCBTYWx0ZWRfX+cAXsNCQ8aO0
 3lz8gXCVROyR1n8gzf+prDh0YbuorLGhwbqB5O8T2GZ0wPwN+LWF6dyJRr3kdyxYv95brv4EZAc
 AzWmHaIrrh2iZCZeNgwqqhVKRCIz0Tk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2OCBTYWx0ZWRfX/1PeAc4ojO9Q
 QgdUvyfHskcX1HQTi5Xj5ct1Ff6mBp3oBHPSTRV48ne3yiUlS5z/JRSCzMIRLCV279G2/Yy78VZ
 OBPCCO7GjbPU1rrXZagx5QGWxIoNAzF8f3dY30saeeiSRIY2+NzNRBcM2tU8iRhs+65FP9yhOAc
 jVFELnB+0B24/zhpeIgo6Bvb7ZDIk2JgTgrMlQFaUnld8rn/v6MQS+Pj/2PhgrfjN0WDeFJYKP3
 oAmh1qIc61P0jFVfP44PFXQ7R/Yhi78XZBOrSOROhlbEt8znW2hIzLS8lk3GsZ62+vSbCLjaQiT
 onN2BdSRSHMAFUz2nMoTezoERWXIpbwblhoQwgEX3csvslnc/jxxEam6u2bApFI8YIe4IWefFSQ
 Y0/+O24pWNUdjwoQzUxlZScTibkV88Oo59AOXvrYx6FHSM/MCioTHtZSeZNDuknYFGiPHmq0cLb
 u8JJOEIfe+3z4La9ouQ==
X-Proofpoint-GUID: erAL-BmWoszkjeU6OQBPEj7OZqZngK3C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280068

On Wed, Sep 30, 2026 at 12:33=E2=80=AFPM Changhuang Liang
<changhuang.liang@starfivetech.com> wrote:
>
> Add DWCMSHC controller driver for StarFive JHB100 SoC.
> This series has been tested on the JHB100 EVB1 board.
>
> Due to syscon limitations, it is necessary to use dma-ranges
> to restrict the DMA address space of the eMMC controller to:
> [0x400000000 - 0x4ffffffff]
>
> bus_nioc_4g: bus_nioc_4g {
>         compatible =3D "simple-bus";
>         #address-cells =3D <2>;
>         #size-cells =3D <2>;
>         dma-noncoherent;
>         ranges;
>         dma-ranges =3D <0x4 0x00000000 0x0 0x40000000 0x1 0x0>,
>                      <0x4 0x00000000 0x4 0x00000000 0x1 0x0>;
>
>         emmc0: mmc@11b00000 {
>                 compatible =3D "starfive,jhb100-dwcmshc";
>                 reg =3D <0x0 0x11b00000 0x0 0x10000>;
>         };
> };
>
> Changes since v1:
>
> patch 1:
> - Add Krzysztof's Reviewed-by tag
>
> patch 2:
> - Fix the DMA address range error in the commit message
> - Clarify the 36-bit DMA capability and its constraints
> - Add a named macro for the JHB100 delay line value
> - Use dwcmshc_reset instead of sdhci_reset
> - Detect 1.8V capability from mmc->caps/caps2 instead of DT properties
> - In sdhci_jhb100_set_clock(), keep cclk_tx gated when clock is 0.
>
> v1: https://lore.kernel.org/all/20260919092950.178617-1-changhuang.liang@=
starfivetech.com/
>
> Changhuang Liang (2):
>   dt-bindings: mmc: snps,dwcmshc-sdhci: Add starfive,jhb100-dwcmshc
>   mmc: sdhci-of-dwcmshc: Add support for StarFive JHB100
>
>  .../bindings/mmc/snps,dwcmshc-sdhci.yaml      |  74 +++++++-
>  drivers/mmc/host/sdhci-of-dwcmshc.c           | 169 ++++++++++++++++++
>  2 files changed, 239 insertions(+), 4 deletions(-)
>

Applied for next, thanks!

Kind regards
Uffe
