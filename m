Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47E031F9B8
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 10:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779099168; cv=none; b=PZH1BRHsJUQp4ac5W6nmvzUwOem8meS74LtLLdO2KvYQC8zmzy3ArXj+ndbU3VZs03uc16IFi+6sswv/Fqn9NLd8hEp2yc+qgVOaPPrhOVKxEzBlISpRyExy9fLLu4tEEVZcpSi02mi7blupRe3v3Lcbsjrjv4/QTKnbfnIuasw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779099168; c=relaxed/simple;
	bh=HHoyvLjypv/XHA9Vamy+kGhoQHPAMAXQNoJk5ifA7rw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lyTXpuTX0iNlWvTMUnsEjkVLYBkSAmrc/l5Soupdq3Ctz59LZBZiD2HjO8PFKN3dtLVNoSjODvb/1AnG+AfFWVWDX6S0X4xJrQgI9i8GqHJp8wVOfTwjyt9hq51RG3YLvNbRaGk0l+Gt9NX5ErgYTZrzNPv6IUUZooJyETr03LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XGW3Momc; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XGW3Momc"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48e56c1bf5dso9363265e9.3
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 03:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779099165; x=1779703965; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HHoyvLjypv/XHA9Vamy+kGhoQHPAMAXQNoJk5ifA7rw=;
        b=XGW3MomcCtdg7MJ+0mt6yQJ42iRh6PrKOYuzbXetOhCC4z0HZnEBTQIa6kPj0blt2m
         WXF441/WlwwUIq/gsW5gzZdnZX9xHihxSYZb7pJmhlMaejn5Ky8zRKhHxcn6ysq13ET+
         vOaj1SaxD6kyXei8Tm0gaybNDzfSZt2wAStVu8j1jda/ILiKc/WfBLZOm/UXEUsXX07n
         /jUpnx7gwCTpv+EwSdheHnbTirQleRq8IrBFxGxAPQ0QKJqSVl9VrxTAdDlFgZ3bbRsB
         vT2syiijYGrvZFTY1msGVeFCnNCGWErRN3J30xnhoa9i3N4lAEK+o5vH5fuOFmNnllCk
         Nucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779099165; x=1779703965;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HHoyvLjypv/XHA9Vamy+kGhoQHPAMAXQNoJk5ifA7rw=;
        b=fe5ogyhZZtQrs9AbxgfUQbqTPcSVhg/IWq+mxB5YQZyk3HArGgQWQHfU1CWOvexex7
         B9Pt3+/4koDNz4q4GwEBzx80vvq8UiT41dBlnkKkM2incRT+xQGvAQDIcJjgcF0GMJXg
         77glXkLYlkjdHi0mQ2983UJfI3CvHu3RVF8uIaF1Q+1hX/PR9OQrsOKLkToz/zxwfd5R
         i0WD7THpFgeDNkA9o0R5eHKIPhwvukfj/VwtTmlsxtPiKyuX12Gngh6Qx7ap3wzkYqYf
         rT/eUW5qpGBLG1E7B7A7EFxzMkUJQOUSOvdzWc7z7pCjOqk/uu+CXkO5D7aUX4m3UESK
         FJ2g==
X-Forwarded-Encrypted: i=1; AFNElJ+sTGQGBt1pH+KoFDocYiVSNUBZL24WiPJ/HAcM7T9chNiesTdPAdsFdYYVAW4QnGPfim1Yc5VOrpLK@vger.kernel.org
X-Gm-Message-State: AOJu0YxdEzeEE67RogBBvERSQJkhEP/Gd+MJGQilyjDf02opLwwUn4US
	lHbeqq3DEHr4OA/xF+cN9VpIzXvZG5/fEqCGC/ZiiYYz4BDjn+6j34ca
X-Gm-Gg: Acq92OGjQNcIcgTaZSbfESvbInNCE6gqvsDz7eIdzWtBdWU3QODfj+oFnOi9In1J//z
	M2B/C+FNhNwYFlOchbT3tJeMzBKMs1LdMHqprK9mrOyoGuY+N6GxCS09P7Ol26b/Gze+Ms8oq4m
	0mSBrumrpYam0eNDCprKXd/NqlMqnc68P/l8IMxo+dpwxByd+EOwCDENH1BdfctkQ8dAM/1oW0d
	e5LoGmoPZAX7VEh0HdLNmLjrN87qPqIdXhokP9iOB4up7xt/7NnN1hUSY5oAH413qcnQTILvECV
	MdEJtpthSw9SbLfmFoOuyVP31zLjg0H1eczh5KSYHTAoiOXUrsXNnZwFAL59URqju9v9MXvW+zl
	wxsIPaUwpk5gAiQxjkWiOb9Lp0xhZ8V/+yI+QrW9WSlLKXKPvd/fW0veFVrpEI5yPHePMmZOQfe
	vZaJDpDHFe95mYSpuWWFSsK2eZpcwmyGPB943jnmhTRCmvxNdOb7I+v12y47MIHvPVbBEVlU4tH
	2E=
X-Received: by 2002:a05:600c:1d99:b0:488:c078:bfda with SMTP id 5b1f17b1804b1-48fe631389bmr204052725e9.26.1779099164795;
        Mon, 18 May 2026 03:12:44 -0700 (PDT)
Received: from giga-mm-11.home (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5ab52a6sm242649805e9.10.2026.05.18.03.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 03:12:44 -0700 (PDT)
Message-ID: <58e882977f7b4297e67d785467ec681c43ce3606.camel@gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: wens@kernel.org
Cc: Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,  Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Mon, 18 May 2026 12:12:43 +0200
In-Reply-To: <CAGb2v67tjOCE=Xk=pD84wBG4WTt1nYhDoW3gu_xfx4J0Ooc_VQ@mail.gmail.com>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
	 <20260510201644.4143710-4-alexander.sverdlin@gmail.com>
	 <2306dd3c-6362-40ee-8d9f-77f89be3a502@arm.com>
	 <14a7e289ff5ffed8fcd6dcb9b2e8455a1b2c9420.camel@gmail.com>
	 <CAGb2v67tjOCE=Xk=pD84wBG4WTt1nYhDoW3gu_xfx4J0Ooc_VQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Checn-Yu,

thanks for the review!

On Mon, 2026-05-18 at 11:30 +0800, Chen-Yu Tsai wrote:
> > > And you should provide a top level 5V regulator here, to be the root =
of
> > > the regulator tree. Look at reg_vcc5v in the Liontron .dts.
> >=20
> > It doesn't look to me as if Liontron had reg_vcc5v as its 5V "root" reg=
ulator.
> > It seems to be only used for reg_usb1_vbus, while HelperBoard A133 does=
n't
> > have USB power control. The second issue with Helper/Core split is that
> > all PMIC story is inside Core board which has 5V input rail, while Help=
erBoard
> > around it has indeed 12V->5V DCDC regulator (similar to Liontron), but
> > putting it in the DT would introduce wierd dependency of the core to th=
e
> > HelperBoard which carries it. Do you think it would make sense?
>=20
> In that case I would probably put a 5v "fake root" regulator in the core
> dtsi. And in combined dts, I'd then add the 12v "real root", and use that
> as the supply for the 5v fake root.
>=20
> Does that make sense?

"core" board has some battery management schematics, switching the 5V,
I'll look into specifying this part in "core" .dtsi, maybe it will result
in some kind of regulator in "core" part. I'll send v4.

--=20
Alexander Sverdlin.
