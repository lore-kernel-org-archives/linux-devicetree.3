Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737450;
	b=pQ2bz/3cJANoSppL/S2axL12vwm9Z3uT7cWlNtwOAdoOmxYGNrSUCsNk+9EF0b2rf7Lz
	 I1nOMp21Kzcg5S01LoVZq/o+mKHAk/F5DXN27ZiclAXnD9LM7d1lQETd9MZiGpj4FRme3
	 SA10Ov0vEKrJ7Jptsb1hfiofiSDDbMzaNCmNbnjk1ZsQitDHCo72an9DQa7yKi9co+Dqv
	 LE8rwSThwCHk+xw0ODO9znMeq7NrtQYoOnliSgrZUCVwS6pxguzerNcLr/33zqx7eRR/T
	 tujU34y72iKHHfJrATjIwaw+TgXDViHTl43Xz+NeXoARlyBPcPto44+sv8PD6sneAgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737450;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/4w9d0sRIsQ7UXyR/DRVXY1zFUeXW+at3Um1GzAx8ug=;
	b=fXbDBt3SVcYYdXir/NZde9PEd7JfYSQs6xdWzYLI7pEV80hz6zPfrQ6smWpzkhfUN4kk
	 ben77oO7/UyrywxcYss2JVLYSq3Ifei0kjpwD0YU0sFDRYRakDoIEOHBzUp+59E7UcNZk
	 NnULEyQxQZCe+aL49GwwOdAqLWO11dGQC6EjNKqBUn5XzqIUohjTIduaRk2VKhQlENSNs
	 cuoWgVwPNLUPyiVL0+AjG5PJmarCleNE5vn5i/VYIc3ipGxyHjV6HRa/YtMIWxjak6pSg
	 yTr8reCLv0xr4iv5dbTUAR23S35FK/xWhCQc/TQAb3o1QkH7Xs5lK421L0cAO7JgoAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ENbUrwKw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fVGCXmYB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4F4606A31A
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 06:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF4F4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ENbUrwKw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fVGCXmYB
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1Fj0f4008194
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 06:37:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/4w9d0sRIsQ7UXyR/DRVXY1z
	FUeXW+at3Um1GzAx8ug=; b=ENbUrwKwANfB9VZ5cqxGMnLdt+7iBTxqZsStqlBr
	wO9G3FNVtMFEqSyfi35SvjYNEzqF7S7XLFlx06wItlOCffI2kxTGa7z6QV3euD02
	CZ2WCtzUMhdhFSHVZLdTRGMSonN2cf9wS8ES1FxfvFHHY36vLNW7v225W9A5s66i
	59MYsKf7AaKuk5f95DEZ5rzkk0cvV23yVo2wfUOmWLJci8Z3NuhSj7JYwMvltnx8
	XGAz9bm92jlcmI+Gc6hboVIMm3MT+Y2cZ9A1Uomyb96Ltk7pLaSm0Gjk9H71laSP
	QeMZYgd1V9xOS/p0en+11kCAxI1v4gUtD8+VtppQAeU44A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsmass0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 06:37:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad5f977673so142418a91.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 23:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792737448; x=1793342248; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/4w9d0sRIsQ7UXyR/DRVXY1zFUeXW+at3Um1GzAx8ug=;
        b=fVGCXmYBazdb8QScgD+XyhVDN5GaloEShl7S1P3dkarXLuofIQs1FD3wijAFBIpMiX
         xp5RPPk1GdxdeKgShSNHbPot3RllVZfA9lYaxJcBH8X5Ji9u8hWNdqlQcux5c8lo6kDI
         aknGQANB6YRBkmYOTEzQGmmQHsiB5Ta+SE7oaT5KHo5ukrPeuIFcFJtIeIxNwgqNib53
         hWahYfOsedi7dDP+QusiOO7K82UogAeJjQEdMabOWupNZmQZ7hwZ9nJO/fw158QlD5z/
         wmF+I8jEnLNHaaOxLrcQU3Vos4Njt6spdZJqc8ReaUHJfk+vZ+RQxPFKtBjJXvFCVIBW
         w1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737448; x=1793342248;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/4w9d0sRIsQ7UXyR/DRVXY1zFUeXW+at3Um1GzAx8ug=;
        b=j288CObp1XzGWeFWZaGrNRfHQo6NL93jXiufJF28DqXUtpnRGm/5oFXWLHN8digRer
         Ioox6BkjM/Fdf17YFyztPcWu6PjitQTwe0+WiLvgF/6mAxfEDmr+sOrNoowyUshKfIJj
         eKKiGBl2j1AVbe+l4dMsaVU82jOfAcpRMTs8OHS2pgFow7X3bHo7nAaSnTVSF6x1mTWc
         KjIElmguuBzABTvk1Cf0k0RCHSRV7Ro81NC1Da9wbOS+iS0V0QoZ7qGofgY8YwgdplN6
         Lc0txFmwt7Ft1ufmsQA6FGg+nTDP9+qxc8SBLzrt34Zut+w1XSW0pYuMmx+0deRJJX3Y
         FVqA==
X-Forwarded-Encrypted: i=1; AKwUvByEQ9aGJRmPD3LA4zyocKUiW8qqSPnaxeh3DvUQrQDqDV6MxTWOTtOBYoEk8DzSDFPHaur3yCyfC7Xz@vger.kernel.org
X-Gm-Message-State: AFq9FYL7TasL7B81HsDfyc1BpBkuVtWP6LH4RqhAdIonzWzplkxiPxx+
	oKzmGsJIJKGXZLCJrLRoVM0MTbwI4hs0b7Ds4jqa1e6+OXll/um94pK+g8vC35ZWWsXoyXQ5e9U
	OLc39aPWD0Dz0sr4li//16epKJIN0CH+QDVkoT1ISwoPwiV+S0iu9av245vaA47BW
X-Gm-Gg: AYBFou0W+M3rkMKU7MmeUEDiMI5mB70FokHCQDysE9YO5you+is3QebktOv/Oa3lXdR
	UpJabBIbHpn7J1dm3iQqyCB4rmmyeOOQXkDI53hR9hcvi5768x+Dm+cQQOTWpCOxcFSm58G4h7o
	FIS0LDie66H1afQPb0cepPO9ELn+JGQ+TQ8D0qCrqg6s2QMYDBv8HsKNrf10aYmx04oA5A09nOj
	doQRuMc3fahpF2ZRoFgjeRfJJ2OaizpLHtU+aOe3IGgEApwC6aDHv7yhEzPxupG61BxOcWSc5pB
	Ji4vidpgKgXxqvmlCBayEZ8Yk/oPdMIf1EXT2lSTv4MbKjksWp4P7GtPGO11zI4cmhEB+WCYjVF
	TxfPGZ1ITM7W1nB7pWmUbAtpmuILrZYagHjlASCBlgZhQubxX7Br5tCSaz2eNyVGlRkTEgOSlbW
	MRNrI/5Xov6D89CZtWjnT2AHTffLtxedH/SVJ653EBVAwUPQ+UmN9W
X-Received: by 2002:a17:90b:4a0c:b0:3a4:c895:570 with SMTP id 98e67ed59e1d1-3adce72b4c2mr1870522a91.4.1792737448010;
        Thu, 22 Oct 2026 23:37:28 -0700 (PDT)
X-Received: by 2002:a17:90b:4a0c:b0:3a4:c895:570 with SMTP id 98e67ed59e1d1-3adce72b4c2mr1870495a91.4.1792737447564;
        Thu, 22 Oct 2026 23:37:27 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4890bb2sm7300020a91.1.2026.10.22.23.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:37:27 -0700 (PDT)
Date: Fri, 23 Oct 2026 12:07:19 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Subject: Re: [PATCH 0/7] arm64: dts: qcom: shikra: Add display overlays for
 EVK boards
Message-ID: <atsAnygcrej9e8Af@hu-vishsain-blr.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
 <9da45e28-ca6a-47e4-8a04-f1b916552f80@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9da45e28-ca6a-47e4-8a04-f1b916552f80@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=V7LoQuni c=1 sm=1 tr=0 ts=6adb00a8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=i8vls60rVJ9ycRQRyeMA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNiBTYWx0ZWRfX8BQZzvcAIF+l
 THBp/evENDLfyMMaCX7czCbeSeGoiZOxsXOIESX0gtGIaEEfI9utmpvU/GzLykFECjO0fmoyGp3
 TRSnQ262Q8pZlen6GHB7QRhJz/olYq0=
X-Proofpoint-GUID: LyFGzIL3fml8L5t-_QSzhoKjoivbMocn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNiBTYWx0ZWRfX+fkDt+5fnVcB
 F1BrOI3atT5PbIBekHRnuWwKB+SGsgosZ8QMQjqxnp+bUT0dTMWa+grmFaLQtf5cQp0MLtmbAbI
 71+8vxr9QlTC/rgz9qclNpd4HoNNKALMBsHwD+SJrXrnLhfXU5EnnWfa02EWQVI5VrqU87rWKmW
 qUrircmBSH1y80kBLCuR0eEKrItKJGPLHXwC/MR3dcIPVLKwUnYVIxPK/9KQjtktIzRDeN1Npwn
 FFEEtl6pwNuj8bWr+l9BQzKbEcUUiX7HsdGlybSM9q8I+9VYD2jlaavd57m+MN/YCBPWuqqysqL
 35NvSlSINQ2fk7AFzIYc9SvRhj78TmtGjYbi6LTtX22SsmxxUDtljbr1L0WQJPHm2esv08kFta9
 4iDiR50j2Fx+dlynBAQ6mNHY4KENtqSglnBvO7IJoMgUYuEMmpp2G+bgfudSJNcGGdKNhgPnAoj
 9XHlFYNCrJN8luNiNPg==
X-Proofpoint-ORIG-GUID: LyFGzIL3fml8L5t-_QSzhoKjoivbMocn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230026

On Thu, Oct 22, 2026 at 10:14:54AM +0200, Konrad Dybcio wrote:
> On 10/21/26 4:21 PM, vishnu.saini@oss.qualcomm.com wrote:
> > Shikra EVK SoC cards (CQS, CQM, and IQS) are mounted on the Lyra carrier
> > card. The DSI0 interface from SoC card is routed to either the 22-pin DSI
> > connector on carrier card named as JDISP1 DSI0 or to the B2B connector
> > named as PDISP1 DSI0, though a MUX which can be selected by a hardware
> > DIP switch. There are multiple daughter cards designed that can be
> > connected to this PDISP1 DSI0 B2B connector.
> > 
> > The below B2B display interfaces are enabled by default in base DTB:
> > - IQS: DSI-to-HDMI using the LT9611UXD daughter card
> > - CQS/CMS: DLC0697 DSI panel using a DLC daughter card
> 
> But if they're daughter cards, they should probably be overlays too?
These daughter cards are connected by default on the respective boards.
Therefore, we keep the default display configuration in the base DT so that users do not need to load an overlay for the default setup.

Users who want to use other display interfaces can remove the default daughter card and load the corresponding overlay.

> Konrad
