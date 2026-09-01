Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7987538F94C
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 02:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788231005; cv=pass; b=bhCHgbzZoS37xbsMwYLVnjAi3dUM62i2O78lk5x9BXNHTsbxhmmYYAypIYwlV9bqBb1fhguZfPmfsCh7A8eq8kFjJIUHbSBMSmST4Ly9pZhPvDM/a6TYJybry1hY16tSizyXx0oksvA9Bc/E7JxaxQo0SW6owRBvheuTLWU1vu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788231005; c=relaxed/simple;
	bh=d+5sNu6yCImmExOIG0N8b7ccM60ZupY+qjLmAb2IucU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VZsG4dq4Bg+g+MbWbMN0Yf9/ujSNYactcaPrtDCqkGEdqKWh0eO2CEmM4KTd7vhB+GBg6rKwgoceXlA/syZcHqQIWpnD2hy0HUfHgMXChijLGbIxHcN5uD6ssSmp0KNr5MCzALsYXziSLnDuUTjhrBWFcMsdvv6PkjUX9GjtRrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c6LR3cfI; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6LR3cfI"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c1c26d7e951so737461066b.0
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 19:50:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788230999; cv=none;
        d=google.com; s=arc-20260327;
        b=NzIi5vmnfHYjyzDQEjAUD016Rn5/b1x/X+rRgSKNan4AWp/QB8wjKDK1EtO+lui9u3
         BMevE9s3FRs6gcOwy4yNpPmuUmVuL+wgbG08WlHF9mPoVSqe7d/w7+DS+XB3qBPUFhGK
         ZTWFpcAI2zqF8B7O9QZA5PaKmDTm6yhLOB2evxcfdWRVbN1cj9ORHQM5az8YFog8cp1Q
         W1xmIUxQrbO4Hj17wxcQX5c0BEa3/Ga3eCNDADyScOQMPFOaaHa2OL9yfj0ev9oMdSRG
         Tucd2mum+Z7hxxtoQ8wDWrc6e55HF9JlfaIH1TX+BsTwI5cjurMweMfi63hnUMXD2COK
         H7hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FE0XcRGmiiYWJ9U7pQXykX2gv5/KOpFiI3Aylrs/Qqo=;
        fh=67m0T7ne9qGt+iA3hsjq9xlwqdufWmMZJahngj4Gnqw=;
        b=Nb0OX0XWAhomoNzkDomXcKGEc8KbXCXByIwyUrysfkn7XPv8Yp0gUrk2uEHQRdplUC
         hqi0qRCjrjBvP0py+G9bDkPeP8cv5RhNngMeXIQSHhpZEsL+4qD/rDGfqrO4CaaP4ASH
         EbnmF6tK5Xy+Iq4fZhgsUiKOqNwNS9ZW7auaH9GvC8qDCmZA+zL+rPehxHO50CF4G6jV
         Fsz03fMLq8SyIzwDMj/TtwxgeGM14Ait3B4GfM2ns+BQHKLJtWAL8YPPNaFgaXp9Tda4
         foXQMPSZN4mR4Nz8ufBCTc0QBU0X3N6Q6mIbeArwelh3UCptUP7v/ks59sWMqOC5SH4A
         GE1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788230999; x=1788835799; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FE0XcRGmiiYWJ9U7pQXykX2gv5/KOpFiI3Aylrs/Qqo=;
        b=c6LR3cfI+ZqH6iXHEZX3EmzvUVPFYc3RQgs8t/1X7FtFLto/TZxs6wVV6Lgn3DIp/h
         jkIdFDloc/lB+sHFCSC6RBtNNIuvgv5FMsqvqptV5QFjFTQLHR5I4kRuAfFAxB3PuWCG
         8GJv7DHkZHji3Q8lb7vZnQJLKOA2KkNHAsnyFbwabCQGw66R+Pm3Sqkrsux2f1xc75Fm
         jyVtNAQVpx/kY74ue+J7FPvcNJeQ53sQ2vK6fJ3CSTMuWl06aXHzKKVoRoHry9ZU4XNH
         G5D3aDHIb3sCeaXyDRSDO2rogkcnzFVVo19oPjSLkb/fqtqJPb5eeJGOrPHCFYjOdE/s
         VPdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788230999; x=1788835799;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FE0XcRGmiiYWJ9U7pQXykX2gv5/KOpFiI3Aylrs/Qqo=;
        b=lCqp/yl2+JvFTl8Z6CO6uWC39J9C2tku4ZCYwAzftImJqNr1GWH8EEFdAOJM0vSfKR
         hrFCtaJwzXT6jtHTWpXljp7R80HenuAQpowIy9i5uz6tPd+ngDpgvFcZ5ENe71EtJmxE
         oK4Dm5tOBeXvzSqvr2GWRzt4v0U0fW5Y1p1s9ZYaI96CV6DModo4UUQ657mgJErI1Fmz
         QD9W4iI3VG7KLZhjfcezDxY/7UbgZAybT1TQ/v9ZjQaabKXdwpZl8RWi82v0PzF0rxD5
         K49+a7QgpVd30FlMUtMjmaAVQXvbUc/odi/02Mpjzmaz4KZWpu6o59d759eWBeV39dUj
         JY5Q==
X-Gm-Message-State: AFuF++nU+Qgua4bCZkKNCSYha1NbkrLpJ+K1Bfk5QExeji/vQeKu0spA
	CbIFXPjfEJwlBY7bs78yle8CBKjqD8T7DDXr522wj2lzC+9GAZ7jcZyAEcnim6BCUcyBuCByQkv
	a1No/bygDKsyZmgCNiinNxBLl+6iM1R40qw==
X-Gm-Gg: AYBFou28RO5bqMpGKQmvVfkr51kd/vqeROej3z5oCTbfNXwqqAvQQYPYrazDAQJIS7/
	TpJIMXz4kIw60V5TpXieDtja3fGhjqKUHeyjskvh+bPJIuWTft8pzptm3O7az1r8gxFGJBkdTHr
	omzbhNV1JMSFR/D9qdv8l7N3zy5Swk2GbOYckoMEo2Y/Mve9G0ElKEH66s14k61NEOPgMZJD3Q4
	A0Amnj0mLhQ94v3hMkSjS/dHJS/GQwOWdnPR0h/n/5sBXYn4m/CsirqsA1QyhJbgFyvkDDOFNKb
	1oJSWmFdDo/lTVvFOECtTmnUZhwwIM+Et/Fo11Fd5X0zCcvlHytj5qGscXUNbpibhlQFTfxwcFP
	1VgO1hu2vcK20EWyymRx43cT9Ik3qtrroykvtt0lDJhoXzkBpjKSKtthpYulMXQV2iZe0uhW9rG
	iACGrIP7gqvIx/ymTcio/ic8zyHYYvu9x/q94SwhRpOIiOUfS1CMyhpL+vmalzxsG8mQ==
X-Received: by 2002:a05:6402:1ecb:b0:6a6:32fa:cac with SMTP id
 4fb4d7f45d1cf-6a663b43846mr2830056a12.17.1788230998708; Mon, 31 Aug 2026
 19:49:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831233653.14232-1-rosenp@gmail.com>
In-Reply-To: <20260831233653.14232-1-rosenp@gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 31 Aug 2026 19:49:47 -0700
X-Gm-Features: AcwNN1WtBJgmoVyxxnr1GxEJ1-2nuIjkP_fAURpv3voSdGn5BCgrhOsGs_1n4Pw
Message-ID: <CAKxU2N-qwFSPzLT1j1Bmo3-S8m+H5xaxGH5iHiACqHbj1+fiBQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: helios4: drop unused phy0 pin group
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..." <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 4:36=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wrot=
e:
>
> The microsom_phy0_int_pins group muxes mpp18 to gpio, but nothing
> references it: no PHY interrupt, GPIO user or consumer pins it in,
> and the sibling ClearFog board does not define it either. It has
> been dead config since the board file was first added, so drop it.
This is wrong. I have a separate patch that uses it.
>
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  arch/arm/boot/dts/marvell/armada-388-helios4.dts | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/=
boot/dts/marvell/armada-388-helios4.dts
> index ae03d42f92a0..e63b8b5e632d 100644
> --- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> +++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> @@ -284,10 +284,6 @@ pca0_pins: pca0-pins {
>                                         marvell,pins =3D "mpp23";
>                                         marvell,function =3D "gpio";
>                                 };
> -                               microsom_phy0_int_pins: microsom-phy0-int=
-pins {
> -                                       marvell,pins =3D "mpp18";
> -                                       marvell,function =3D "gpio";
> -                               };
>                                 helios_i2c1_pins: i2c1-pins {
>                                         marvell,pins =3D "mpp26", "mpp27"=
;
>                                         marvell,function =3D "i2c1";
> --
> 2.55.0
>
