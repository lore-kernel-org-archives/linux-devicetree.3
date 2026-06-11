Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345F4376A1B
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 08:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781165442; cv=none; b=dIaROLu7jmIwui3/5YWCmujUPgUJY/XUQ8/fiCdReOs0n+7hLG2LW3o9gGMLf/emMpUlgX9qRpC6iWTW4w7CG4hdVQLNHNWv3MpLtQieUyBtknkUJ54MFW4yVH5exIjMIdqmUJSzNGwYz0PrVDkkamLnmasQVzTnUQn5oecsy2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781165442; c=relaxed/simple;
	bh=k5Yn//yvMxoJEYHLyKMM/OCVLrQkkTNBVjc8D+EXWCw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mt8x+t7hPQh8E/eRUCirdnsw5u0Tu6cdTPirs4dOpFe50bgMnmI5ckW/o+K8kKEhi/+l6H1EOKEss0EwJa7CmdeSJIzB+hvvinT/TDbCuBQs3KbaIwjj69naDMKzb2dJEZagGXgsKXuawIX6GkU8flTmtFkUh6ihExQ+f1OzHsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MEdYLt69; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MEdYLt69"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7ECB1F00899
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 08:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781165440;
	bh=OzBpfItUtOEf2eFxypCcg42sLsvDwHVRXaXNAUgljuE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MEdYLt69EMFpPaL0Hz51jolIDCO4fX4DB/cyRNiPyLZVerYoF7awB9mQgbzd5FI9A
	 +nvsoY6hFHMeo8NlCN3yH17tuCRhK2na63H0gWGbVW7SqBniaXF6qgApn0+/UBE5xj
	 VRDHibBYK59o7d5BSDJ9HQuYV8YJQ4R9VYJx/rJxv8Hart23nBVD3C/BP6shZ6DPZr
	 9BV2zWq7jW/2p2Akpq2GBVhVmnDCfBfcJ+JrKsDCJMq3WcqBTdroxYbE2JtRpt9whd
	 W95o0lJ2sA+HarABahmu82cZVs7+OrPiSmJU8eUu2Ubj2W5Fup9mbd5T1TNnv/Nk1x
	 m58LHI2hnPeNA==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aa612bf6efso7734572e87.3
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 01:10:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+5GkUB/2FK91IWi7/qDTL/GX0B8M5el2rJhZqOkjedJgW0yYBq6tOTSdINQVb99jFHFBsxo9HDdONt@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/vwxBqEALlWP1ZJCPbCJAdOpe4T1k/VzXVpFdaAJ8/S7nKfMv
	tzU9kL+6R1BqdXktJ4K5SZ39IOA9MIi4aiEB346xBb4Pxe63gfmsUN6/6RNEBkrxE8sQRdlwUUq
	+y3OyNM8i2yPif5YD34hscS35K7IQSDQ=
X-Received: by 2002:a05:6512:1243:b0:5aa:7653:49b3 with SMTP id
 2adb3069b0e04-5ad27fb3734mr609184e87.32.1781165439670; Thu, 11 Jun 2026
 01:10:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603055347.66845-1-changhuang.liang@starfivetech.com>
 <20260603055347.66845-3-changhuang.liang@starfivetech.com> <20260603-sinless-mooing-48a37d3d05ea@spud>
In-Reply-To: <20260603-sinless-mooing-48a37d3d05ea@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Jun 2026 10:10:27 +0200
X-Gmail-Original-Message-ID: <CAD++jLkBeDkFAXLMDvEA8LjbBNJCz_ycYNPnDxs26qLTqDhXTQ@mail.gmail.com>
X-Gm-Features: AVVi8CdyDNSFfJSkRGe4nWHY6bfkMBmY29TaiK6kirTSTVWDFpGWXq8lEWJvp8o
Message-ID: <CAD++jLkBeDkFAXLMDvEA8LjbBNJCz_ycYNPnDxs26qLTqDhXTQ@mail.gmail.com>
Subject: Re: [PATCH v3 02/21] pinctrl: pinconf-generic: Add property 'input-debounce-ns'
To: Conor Dooley <conor@kernel.org>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, 
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 5:18=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:

> >       PIN_CONFIG_INPUT_DEBOUNCE,
> > +     PIN_CONFIG_INPUT_DEBOUNCE_NS,
> >       PIN_CONFIG_INPUT_ENABLE,
> >       PIN_CONFIG_INPUT_SCHMITT,
> >       PIN_CONFIG_INPUT_SCHMITT_ENABLE,
>
> Should this grow a mutual exclusion check in parse_fw_cfg()?
> Part of me says yes for consistency, but also as this is a new property
> that's going to have had exclusion in the binding from the start part of
> me says that it is unnecessary to add that.

Given that it already has a mutual exclusivity where it matters
most (in the bindings) I feel it's unnecessary. The only beneficials
would be out-of-tree users and I actively don't care about these
people.

Yours,
Linus Walleij
