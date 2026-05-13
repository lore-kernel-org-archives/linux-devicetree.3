Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A4237F746
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 07:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778658659; cv=none; b=dPB4Xf4LGHqeoJ6KIHA3WGKiVg2KNE/QCYaezBIQh74RogwspZ5LNa/AEFMyBsRlRemzij9IQHxoDwKE73wCspwS7gc5/AJ5t6YDfIDbRzRUb6XFCxo7rumVqE7OhQtGsxppsTHuA1DW9ExY7r8/RpvqLeVzVdaLHgKE8OLTgjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778658659; c=relaxed/simple;
	bh=p9Ohp9WPIQd1AoIgFc6IB/L4M72lF1cObc3C1yrOMLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sSkD03R7aBmWAuo1ooDmF3amKpjwkneEmLpyHwlvm9hITEUiiupqBmuxjokyUP7rsMImbUoRaNW3h1XNkO8uuG2CW9UGqLSgtijR0sZoxXF+NOnG5qN2m50OrqYJFB9psqETibMoRIw6PU+OWaSXpFUsiz4uJ5/OtNTCbzoIEro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OTkCyt/K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OTkCyt/K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E803AC2BCB7
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 07:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778658658;
	bh=p9Ohp9WPIQd1AoIgFc6IB/L4M72lF1cObc3C1yrOMLc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OTkCyt/K+2jP8+YeydzzjXZAlWFD93inR2nAdcd1KRxXKOGr4Gx/qFfsFSZdhLvRf
	 na0+IFfQTgJ8C/Lg4ffSCDYSCXKvXEpor1rV0CsRclKOl65dNA8skKQ7xV5E4rs3Lx
	 ixBbpSdfJBI0MGVTyv5fFtwlxj7xFOd4wxMwbPuZjIQdlQ7JPGn1W714R6I/L9fojP
	 cUegbBHDkDaAiGoMXA0Rv7+DjUHYHxOKB19bWvMQhgMRYl/foSkInH18elR6aYSSKN
	 KUqHDTEWokk5Co08WYhsZqR52yZpPXGRViqkPZ0pdevY4RQiGz6PbiQGqi6FE5Mifv
	 g6Thh3fYeIOTA==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-394095009beso30437281fa.3
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 00:50:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9ljFkNvSBSCTIZ0bSTG4hzBEDlaRmlZ+JNN4zRF+ToTXgwsTdMNXe3HxSK0KgTu2D+qL+7QZqLf+vw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/ovPyohHOyX1FIQY/JXKOz+ReJEZQL1mK5HIAKqPQusSUcRsY
	ukb6l5f2ng7Q2ms6JB1vOW3/q37TZJur7AjZxXVE8q0+JYfyMrzw1bChI/DoWnTYnGn/7OuZPEy
	z1SiyZwhx/lOYfXuHRT95KKMpazaGlNTKxdBVZ0Mo+w==
X-Received: by 2002:a2e:ae18:0:10b0:38d:e744:8663 with SMTP id
 38308e7fff4ca-3944b60bb79mr4560581fa.26.1778658657667; Wed, 13 May 2026
 00:50:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511162528.84508-1-markus.stockhausen@gmx.de>
 <CAMRc=Mc-EbMu3eUrMA5UDCEp-xzbyndy8_U8OjfcTDJcATThQg@mail.gmail.com>
 <004c01dce29a$0e44e7b0$2aceb710$@gmx.de> <agQkbnSHblUNz-IZ@shikoro>
 <CAMRc=MddGonpdukfZ_eHa8C4ysdCTqhYva6yVRue06LVkyubxg@mail.gmail.com> <agQspjVCkbmVDnt_@shikoro>
In-Reply-To: <agQspjVCkbmVDnt_@shikoro>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 13 May 2026 09:50:44 +0200
X-Gmail-Original-Message-ID: <CAMRc=Mf9j9Y3nFaDD1t1nqhd8ogH6TVceKA=vtM-u5dY6_ptrw@mail.gmail.com>
X-Gm-Features: AVHnY4J7mArgZfFLDspRetTPfaw6yjD5xgcHAlbljH1t9z5KbSl0zlXC_WKFXlw
Message-ID: <CAMRc=Mf9j9Y3nFaDD1t1nqhd8ogH6TVceKA=vtM-u5dY6_ptrw@mail.gmail.com>
Subject: Re: AW: [PATCH v2 0/2] i2c: Add i2c-shared-gpio driver
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: markus.stockhausen@gmx.de, andi.shyti@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2026 at 9:47=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Bart,
>
> > Yes, in that case it seems to me it needs a separate virtual device
> > driving it. In general, the idea Markus presented is fine but it must
> > not be described in DT. Instead, you need to create an auxiliary
> > device from subsystem code.
>
> Okay, I get it that it should not be described in DT. DT should only
> have standard i2c-gpio busses and the OS needs to figure the details,
> right?
>
> I wonder about the subsystem involvement, though. The I2C core doesn't
> care about the scl-gpios property (except for GPIO recovery which is
> moot with the i2c-gpio driver). So, maybe this should be handled in the
> i2c-gpio driver instead?
>

Sure, the driver can live under drivers/gpio/ and still be
instantiated in i2c core, no problem with that.

Bartosz
