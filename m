Received: from mail-ej2-f8.google.com (mail-ej2-f8.google.com [74.125.228.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C683D3E6394
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 05:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792216324; cv=pass; b=Nzc6G2GxwBdcDXT6xOCmQTD/iZ5cF8UdFZQ3WV9ox05/hokS1SXXDqcoLoFHA/IyxEm2WGBl2EhNSC8nmiuohVVKMi3nviEONMdKcoBKuZA5AKlhvoNaumlnevl2RSWqEJhtM21j527nPSE2bXMhIXYI4e0wUlcprrHFQPS0YDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792216324; c=relaxed/simple;
	bh=dAGUxU7S2OS9o0qphDYnHj84WBQWlXZXMIpBTNhn7O0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QrFbiTHfJ6hSeIzP6gMQh5fBoyhEH7VrQxs/u8ezNw/OTuvDwbKJcO/u/LzHpUnfkCH8nHWr15OoRKXns9nm+hshi1Q7+98AbfuS4gx9Ftk5eDBBAUr25SqT7SsAbpCCCDfZhtX5CwX2Ps3Dct+L4KEYnIrKEv0YxWBheD+SN98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTIcAt+/; arc=pass smtp.client-ip=74.125.228.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTIcAt+/"
Received: by mail-ej2-f8.google.com with SMTP id a640c23a62f3a-c2e790c38caso22091466b.1
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 22:52:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792216321; cv=none;
        d=google.com; s=arc-20260327;
        b=gng2z8U3ronDDDVxeQqcXReGFQPtrreYqyDzmz1Lt6fVa7aL7JaD38yt0TrsFX9ip/
         ZKOB22jGfjS73qpIK7mWuYortAekI0ZqlKNZseb8bUA+Bq8l0INKTnu0NXcwdL3hXmiA
         SOku6PghoVJ0HuCF4hBcPslemdTK76DDC+KcGtCACOzFS7/WiRmlSaj9Z+UTRPPpUDip
         NxBcm4ac5xwNniiTk/hUCFJBEqi7pDQB4mAMxgZwo8sWaujvzkWckndMz316rDB5Bt1w
         maNMIDsRR0OMJJuUK3Ir7Ix6cygZ7z5szvcWVvCpmmunht8EYvkQO/5nES+ztvtWCPpJ
         bUjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1NQoVsKz0LnNjJ4rVcBhJaqVhtFod/04Q9AhzSfJg/Y=;
        fh=5+yNME27ot0TXQwuLBpFfHaZqp71lN4EpHPYefZx97E=;
        b=ZymfBa/Y+gSoWEcKCjN8mzCnJphC7/pjHEIvGfwDv82xz2P+alCXRoFXM6r/qzOveP
         SI2YBXIa9CYfZe6/hymsvfpT/G6YB5nzZe9MjazTh+rlKnVkzA4F671XNLnFhekeG9M7
         A49GA8tRmxiHTC7LGxobsXEsnhCxdco9owmt3QFJoXsqHtF39TZUCbImsSA9ZwprTXP3
         2KHputsGXPCxclFrMMPuZjNZmlJ09T+wMfvjuTYMP1oFcS3MxawjrGEsvbXTF3a4m2k7
         9XDmAwxYJlz3x1MNCiY/cEsg+t9cDoG6Q8uTxd8qraEem9PNCDIJi1ZI+pkt24HBIbgP
         Hd3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792216321; x=1792821121; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1NQoVsKz0LnNjJ4rVcBhJaqVhtFod/04Q9AhzSfJg/Y=;
        b=CTIcAt+/DjtvuOUNJ/C8+B9Ul4Pfgo9Hd50liLLvWB9X9EcIhi2mqhlrzQtpDUdFVr
         AOSotTOXeJZWdUufE3JhQM7vxV9lTtfY/9lav8VkX4jaVTtbp83eH6/enwqquVT/A79D
         uUL0G72MNM6IQqZWuWC5WRiYtUbIE3U41j9JMCd4OETLzkwO24p0deL5B0nEtG3bJWHn
         waLXY34d+3Gt0pJSmTSGdKa3p31xn+w71x11gJHqZOyysc9qsbTjFLYWJibflIdzHULU
         zCcmw057Fp3ty5bi/ldnjxYOGRwo/LFQOMEa0iCqiu/ugstznCZkuMXKAVJottIHq0eC
         1k3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792216321; x=1792821121;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1NQoVsKz0LnNjJ4rVcBhJaqVhtFod/04Q9AhzSfJg/Y=;
        b=ozqHva/SyJszQ0Vj72tIAillJBS0MmNPLWkc9ok4vaghmF0ke2IHyLErKdpjR1WmP5
         OqYvnlHiP8LpilRDYJqDDgfA30ujfJGkRBm3PoSURxJqTHzGjTq7tnAKW90mw7eqdYhq
         qPQphfyGBLxZsN/gevFPrwc2Tb6V/Ob1oy05uiaVl9fRcprSiE/xovx5ekyxR5mxpBPY
         XnvIEI+jWDc82c7c9lRusYP/p1Hny8p+8w2MXnflJ//FXJHbtDWzAE3FB1HHxUf0qNtu
         2l8Y+2Kho1YtKCBe4hSenQKMldgxyJgLTrbvpmJZT7/PMtaJ/wHF3L8sGV2ud5cO5xHd
         VJqA==
X-Forwarded-Encrypted: i=1; AKwUvBztW4WoSF2QEnaoNkVjyMzfqXrXTGqzAZpidrgXZ8I7pOeOFe0scK24IsqPhohm9IMGqHz75vwiFzXj@vger.kernel.org
X-Gm-Message-State: AFq9FYLcslAm9bZJXksnVqqetO/OTNmw0fMTdlvE7ulAtrRZpRBMxt+K
	/hraGPTJGiGutK3LVehF6t3erBTIU5Ij5g4I0nsSK1dF7iEKHqsu15SL0EYTcVG/e2/U4nOmfqB
	7SRXagML4x4UJ6Yc9QRBI6w7Z5Me93Yo=
X-Gm-Gg: AYBFou0QkJz2FqlHaBOJopp/Ij57+wa6wvni4lwdJT3PLM1CGMoxehRGf7DqsTfgiq+
	/mdvcvbIFmOVaF7zjot/JYYa+HRyYFGyaMdoiNYZ6No4VdNPsG9jRyFjqHhY8sfHNWGrJ26ChyM
	tQ1+jALw+ygaRolhjKapNWNWkx14j38jrMUQOez1NRnZ5FpaOZTRsk7G+viX/n7m0ZPHr8wFXZt
	Q0TnPCDdseQ6XPhJpPOCa5QKrwfb+cac8v78j9I8EtDpbuG7KOwiFh1KpKfwDsOKc05quhKmv4T
	IMm0U1S0pYHB3i7efLupIegUidvnyTMacjh7eaAR/jOjT6A2z4t0UDkqdA==
X-Received: by 2002:a17:907:930e:b0:c31:8c48:e18b with SMTP id
 a640c23a62f3a-c419df3d9e2mr123713166b.14.1792216320815; Fri, 16 Oct 2026
 22:52:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008175225.3375274-1-coiaprant@gmail.com> <20261008175225.3375274-4-coiaprant@gmail.com>
 <20261016163709.00cc7c12@kernel.org>
In-Reply-To: <20261016163709.00cc7c12@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Sat, 17 Oct 2026 13:51:48 +0800
X-Gm-Features: AclHuK9gR2DkSi4xw_m2fA1Jz76Zlk0PlqVhdG4GFOV5ZHbiAG1eg9HG8sAydCI
Message-ID: <CALj3r0jc4GECe=Dp_gngTsVL03YmXhAt+BSQJei4QRrwLRrerA@mail.gmail.com>
Subject: Re: [PATCH net-next v11 3/6] net: pcs: xpcs: add Rockchip RK3568
 platform glue driver
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	David Wu <david.wu@rock-chips.com>, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jakub Kicinski <kuba@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=8817=E6=97=
=A5=E5=91=A8=E5=85=AD 07:37=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri,  9 Oct 2026 01:51:57 +0800 Coia Prant wrote:
> > +config PCS_XPCS_PLATFORM
> > +     tristate "Generic XPCS controller support"
> > +     default PCS_XPCS
>
> Why the default? Surely there are platforms with PCS_XPCS enabled
> which work today =3D=3D don't care about the new code?
>
> Linus is known to hate _any_ new symbols defaulting to enabled
> on olddefconfig.
>
> > +     help
> > +       Generic DWXPCS driver for platforms that don't require any
> > +       platform specific code to function or is using platform
> > +       data for setup.
> > +
> > +       If you have a controller with this interface, say Y or M here.
> > +
> > +config PCS_XPCS_ROCKCHIP
> > +     tristate "Rockchip XPCS controller support"
> > +     default ARCH_ROCKCHIP
>
> Same here.
>

Thanks, both defaults are dropped in v12:

- PCS_XPCS_PLATFORM no longer defaults to PCS_XPCS. There is no
  in-tree user of the generic snps,dw-xpcs glue that needs it selected
  by default, so platforms that need it select it explicitly.

- PCS_XPCS_ROCKCHIP no longer defaults to ARCH_ROCKCHIP. DWMAC_ROCKCHIP
  already selects it.

Link: https://lore.kernel.org/all/20261017054406.1828061-1-coiaprant@gmail.=
com/T/#t

- Coia
