Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793156374;
	b=d7h9Ru5NSOrCIx//9+Eyno6l0g0UB6QXgXjEvjn6LffLyvXbor2wN197AJHOw33xXu4z
	 bOabyEUcu9L5yaXWSDTgZmLMipbdgbimCvEmz8t8JBWPyY4DVM6qdCK0fm/53j5dobHxr
	 Bg+x6yTKulvD7zzduNVfCZ2FaPl77NqFEiUerQvz09gR+hceG79XY6k7vU7uFWra53LcQ
	 Xksu2RQL0sw1TQux3fsZPBiQ13cuhEDr05iBAZvt3FLz1iK63hGz+Awk5Az6uVnVUI2iz
	 j+46syOYhSSyORZ/w5cZc+SHvsScdebPwwLvhpL+RJrgH7SlyLdjjoys/UblLuqwzvw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=T2DPmyi1uKgewOwOxe3WhQYBJSJPRynqMh4U5o6K2t4=;
	b=121SHjTGJtWtj2dkplDu6BWcwku3sFywTWt81Euc5d+Eb9833WhuoQYAxFCpFBo6NjaA
	 ZOKg+jQdGI+vLO1esrDG3fIN11G8U1tGHgJYxqvj1BFocK8ux7DoLjL65sDRYYCHNJjeN
	 bak2Rbu8FSZqtCTyR46j3YMiod+lMKweqzu4WZE3mjzwdDoRWBSg1CnSyj+mFnWty+s2Y
	 IQ6c4PKEyCsDFFUboX5I3Mv5y/X5/VQ1+9bY6latI/gsUBvk/vR7Jl9IrpCrQh8IL95mz
	 PE7HkpjtcoK+JAGKfq3AEH9v32zpqPk+7SHCJdbdwwcX+esP8wgpevCPi3N9s9OKVSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=crbcFEMN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47FF606A31E
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 02:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E47FF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=crbcFEMN
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso2474715ad.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 19:59:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793156373; cv=none;
        d=google.com; s=arc-20260327;
        b=fQoBGwj/oHMNV2nhA8qsfIYJNO4Fx6U++UhoI4iNeDW8NX/tNHnE4JijyetiQk3WZm
         6xOI/bdZkKwiiYPP+xi+2datiy6/NlzPUSzqrJmPH+R7ChNH8s1w3Naa3AHF02dyzkbL
         KgTNS/r4ci0l6CFVDTLPll9c6MVTZqHq9DHO0/LgwpSt6HsDSYuyd07WhgRCWLzCiqCx
         C5iU0OJNFynOSEAOq+4XRgLT32WLn+KopgYtjq6XyVSCp+EzFyVEO9Hg8HyYVPaw383Y
         HMaQtyGgiCbW1eVA1O7iG9+l3ekeR55Ha9sXcKzCKAytxCTGhBHcKVTl9eLYMaFtzBcV
         Pt0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T2DPmyi1uKgewOwOxe3WhQYBJSJPRynqMh4U5o6K2t4=;
        fh=lrBBPzfjqa4dgN3AY8Wof/VlmtxaIxKOXoToKGoHbTo=;
        b=j66wJic57ByBx0lXr26LDoEP9pLFfAcgSbt2qMSjQPESHFXqrBQXuaR73JhXEVFvtP
         b4k3l/0YxomP9wlYGqo62u9EffI7w/tl2QvT/KR3sM7IGdkswL5yu4326+rr/2evTEJN
         Ch1qukTZ584WMvHEkiHZpBR6WrWXrCkONBIB0Qjw+WTH9EQgn/xgNKY87ntEUFuJeOUy
         9/q3wl8tQ73QTWJmcAFlafJEOhV8zuQM7xO2fEJ9bw7TuhspyL9YjPvsAqkbpvoQGFvH
         +nwl6bhVHoG5lDmi415yTF6gpUFp9gBmKjgXdiFxpsvpwjbBDvDLGGNZcGKj2kjCRPJK
         TIaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793156373; x=1793761173; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T2DPmyi1uKgewOwOxe3WhQYBJSJPRynqMh4U5o6K2t4=;
        b=crbcFEMNt8APwJgcJwjxerfnVJcN7B75vaq6MdGTapuOpIxG+dikyqger/rqqf2fEb
         XlOAr969DLFYnmHeKVPY6gZbQkvLCR13V0kAPys52pRQKVTMdjH2occi6ZrRLOU2x+RT
         TgPjy7vauujvmeRlhifPRLqFXU6kpi5fs9Yv17Htx7qxFky4/DzZIGQ6XanIbFN5OEYt
         lRfMzsH3AXtuGb5VsrE0TVi/SXclt2vfdvLUwRkDMm3U9LVXevW76WQojWNGMdc4wBE9
         mMnnCv3DJlngkY4/qPIJ8LUot400zIaApzLG2m2dVVM4lFtBLn0vCtOmVxLXbv0Liz9c
         G9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793156373; x=1793761173;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T2DPmyi1uKgewOwOxe3WhQYBJSJPRynqMh4U5o6K2t4=;
        b=vKJWJ1VftTcd2UK4JpRguZL8RqqcVGl5f4lX5tT/8jvlwkknhw48g+CBmtNvuNIc1a
         YHY5SV6JF8X0uX/ZOUwX+KsSAHZC6x3A0IzMy/llTFPbNoptOooX6zApWgnlzPtkc613
         M64BNo+V3E25/1+3YkQ4sFx8H18J1SWfd9GhduPShXzGRF0brx6WDIA3ub9fDZIooyBi
         N4BBb7CMDhy8BZM1PXt4/kjHw9GWrmiDqim0BlXZk2Pz6uAaxMdOrKrgt3hnXpa07+44
         9dizgJTMBEmF334XHrcKsnJGaM9P+RFv/EKD8xGUbYVdHp+IIjqG1Fk1IIVOyxBq0Tkw
         k8iw==
X-Forwarded-Encrypted: i=1; AKwUvByKcwTbRA+uBewf6SknZsd+a21zWLcCkjkOywsMccHCzhivFr7RXFAnS34Yy3t4LVb+MvzYVdkOM5le@vger.kernel.org
X-Gm-Message-State: AFq9FYJk7LqLaSim3tsuHuAFmsHUtWm6Ga3FBGcmDhspCx356Gmq+Wbx
	OjAxmeJJylmDeEoZxAjZRTrHC1N4yeRXohr+CBCB2K2olbuQdnogGWhlsA24R/MJ1tpLfFqfXeG
	aFuaHB+ujbCxqSokqwVNqmSTPDsQuFCE=
X-Gm-Gg: AYBFou3j26EdSn+7ZUIU5dFIS0vNIcBh8A6im4FKqZhTZ9FUCH3RGeGkh8b+KgdmcY7
	YIs6Zxmsj2FH7KWT3OKI4DW2mfU6N91bCuEvEOYsmb6j7b74v91wbEyDuuvqYfAbBvR0AQb+it/
	R1yuTbVaz84MLh8sn/2XUvdbhDYqmZii7cDutbCytaJiEEySucO3Hod3y54ZqkecHyjK/T7d4yL
	YUEhf/w3xFGIye6LN9Du0ahIwMKDRifZppYoCHr+eOrsDec2yaamBZDdzOcxHunAwhVi89pdIuG
	gXEAnJDddm/mm+0hHzjhI+A2bLsvjfeVDswWyRspvAExYN/bZC0JKEWctg2K5Z8C1I9ZNgwfxQt
	R/3kj4UjUAAP2wz3ZNchsQv+GfZlIyJ1/6zj1
X-Received: by 2002:a17:902:e889:b0:2e8:3566:b53f with SMTP id
 d9443c01a7336-2eb003bf1f6mr12865955ad.33.1793156373309; Tue, 27 Oct 2026
 19:59:33 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026085352.4009534-1-shengjiu.wang@oss.nxp.com> <9b6c85f4-5881-46d8-b247-ae6bbfef8f91@gmail.com>
In-Reply-To: <9b6c85f4-5881-46d8-b247-ae6bbfef8f91@gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 28 Oct 2026 10:59:14 +0800
X-Gm-Features: AclHuK-tGLoHs34jMEzH16dC5P2hcrMRxMtYOVpGan1D-YWjOsuDop2uhxHPtLo
Message-ID: <CAA+D8ANey+JLj1v0wLh9cAWCD93Pg+gFoH-FwZU49f4-6zS7tA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: imx952-frdm: support AONMIX MQS
To: Chancel Liu <chancel.liu@gmail.com>
Cc: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 11:01=E2=80=AFAM Chancel Liu <chancel.liu@gmail.com=
> wrote:
>
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > Add support for AONMIX MQS (i.e. MQS1).
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../arm64/boot/dts/freescale/imx952-frdm.dtsi | 77 +++++++++++++++++++
> >  1 file changed, 77 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi b/arch/arm6=
4/boot/dts/freescale/imx952-frdm.dtsi
> > index 7785eb1a68fc..750046e1a5c4 100644
> > --- a/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
> > @@ -222,6 +222,12 @@ cpu {
> >               };
> >       };
> >
> > +     sound-mqs {
> > +             compatible =3D "audio-graph-card2";
> > +             label =3D "mqs-audio";
> > +             links =3D <&sai1_port1>;
> > +     };
> > +
> >       usdhc3_pwrseq: usdhc3-pwrseq {
> >               compatible =3D "mmc-pwrseq-simple";
> >               reset-gpios =3D <&pcal6416 8 GPIO_ACTIVE_LOW>;
> > @@ -390,6 +396,70 @@ &micfil {
> >       status =3D "okay";
> >  };
> >
> > +&mqs1 {
> > +     clocks =3D <&scmi_clk IMX952_CLK_SAI1>;
> > +     clock-names =3D "mclk";
> > +     #sound-dai-cells =3D <0>;
>
> Above 3 properties have been defined in dtsi node. No need to add again.

Yes,  will remove them in the next version.

best regards
shengjiu Wang
