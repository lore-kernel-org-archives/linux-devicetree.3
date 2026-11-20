Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795166712;
	b=jxlnunGdxE3Qx8JF/fj0pCu+HJWkbVwcEbUryovECXe5GpPwLmCG0csqhVbt06HDZYJi
	 giYsYNG3fJXtyti6I+llrW86GywlMlsMLVTEAe+r7z/EEElKw0I2zVCdneZIXvbfo4SUL
	 s4ZV9X4C3E0kajTJWjXFVYPMfftP23zmUx3lMyvpx5i0CcKSmbCGQJUJ+HKRJjDD7Rwwv
	 KFKLFJ9e+J24rEJzKnr3395J/VzWliQT6sdcbx2D1GdJY3OCkv6hbwSarqYZwdg0tbk3Z
	 2fxAa/ioGvneHn3IQGv4S3jshiU7KDMjXL+ADRQM7K/aXYDKIPYlGkUpaM91DtMIiUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795166712;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8SzIHclfGO7rIjAKlxWY7h5C1tqRdUP4RNaZqN79MuM=;
	b=JbYXahi81VwQ+ugb1fe6SnCoTMps+rFwnCLZV6m7kHzwCFy/XCHczbN1Lj8c8lvxgzYd
	 82f4r3n97piT6dDjq8PRv73VTRYLs3gSD2OQD/fBcWf7TRYL3JbGfAEXXxtSajTMl+GV0
	 cGFHq+DIKisX7Mg/30k1rFOVbPpTaRisZOEsKl1h6r57h5xjCchSyFT4eTghf1P7KEdKh
	 l7BxGFy68EfPwKXf7w/LkVu6YbIzaFSrPOH6SXEtsOXEQNfiW1BrakiB+dbDr4CaXExy/
	 Od9NsGY4HMW3rVSu+x01X3FRtLSChKmD+FxD2yvTiQ+pqc+jp9t1gtunYO7m4k2JvXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B5ZDMOWE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7948A606A335
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B5ZDMOWE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 558AA1F000E1
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795166712;
	bh=8SzIHclfGO7rIjAKlxWY7h5C1tqRdUP4RNaZqN79MuM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=B5ZDMOWEHdnhh2/umOUmDyebT2Q50s1hgR4xDpum/5dqqoMqtjXVEdU8aCG9sLmQA
	 7A6AoINlMkFawC02saPlGU/UG/hx+Ve8Q49Ae/eZlx2izAu6qkxYbT8PBExCep30Qc
	 cIKFHKeYrow0KilYBJXAu05Oo1CIxqWoGzdcAB4xOFdSnA5ipUK+6pmAZZGQKczT57
	 5U5FYX0g1tEu7APgsdhwFuInYTVpzswscUD4Z8Qs45W2nDr1nbveiYtNzYB4TrppYV
	 8pctZ+ScqMMKXovSWloMW7pcezlqSREFM6P5p3mvobzMNRf9HWvMu2KMDKw0zP2X5m
	 a5xa8vTyeJJhw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c1465bbbdaso476760e87.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 01:25:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGAq2OPAi9RPJr4oVOprOtffSF8YEwnWjhZ+Wh/L1VQGcMBP/0QlViDEWlMPrJUacXP5F/Sz2nZnjW1@vger.kernel.org
X-Gm-Message-State: APuU4Z/9DXBREblwO8ML7NNpqEqOWmxCbxBx4V3yclKFQjtG73jV4eAt
	un23ySV41TkY+S6PPdjhFlCNlV3VaK5118UwbDuf+qGqxHR3G042PzCwmhEz20xiqwLn1TqLMp2
	JdQnLFkDzwzPeGNQINf/oNNyXwWv4Q2k=
X-Received: by 2002:a05:6512:3e26:b0:5bf:dfb9:33db with SMTP id
 2adb3069b0e04-5c1bc894b28mr761513e87.38.1795166710840; Fri, 20 Nov 2026
 01:25:10 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015142552.4128028-1-ryan.roberts@arm.com>
In-Reply-To: <20261015142552.4128028-1-ryan.roberts@arm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Nov 2026 10:24:58 +0100
X-Gmail-Original-Message-ID: <CAD++jLnXQHkYvCO4raM8enm2NNwU5WDNE4cFhvcVUnUZVHMPLA@mail.gmail.com>
X-Gm-Features: Aa3M54qJyeIPO-XfHd9glHLeVqDiREjcacNXijYh3kod1cJY-VZmSyNAF3F7zP0
Message-ID: <CAD++jLnXQHkYvCO4raM8enm2NNwU5WDNE4cFhvcVUnUZVHMPLA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/15] Arm Core Local Accelerator Driver
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Alex Williamson <alex@shazbot.org>, Jason Gunthorpe <jgg@nvidia.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean-Philippe Brucker <jpb@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ryan,

please keep me on CC for future series for an SoC perspective
on this.

On Thu, Oct 15, 2026 at 4:26=E2=80=AFPM Ryan Roberts <ryan.roberts@arm.com>=
 wrote:

> * The location of the driver: although most accelerators will likely be c=
ompute
>   ones, CLA is a generic MMIO interface that could handle any kind of
>   accelerator. It's currently implemented as a misc driver. accel is anot=
her
>   potential option, but given the current SVA approach, we would not use =
any of
>   the services (memory-management or otherwise) that accel provides.

Given the extremely ARM64-specific nature of the accelerator it has a
lot to do with arch/arm64 but then again it is a platform device + driver
associated with the cores and we don't want platform device drivers
under arch/*, so it kind of falls between the chairs.

My spontaneous placement would be to put this in drivers/soc/arm/*
what do you think about this option?

The argument would be that this is arm-specific, we do not expect
the code to be reused by other archs, and it is used on some specific
ARM SoCs, so it goes under drivers/soc/arm.

If a very similar feature arrives on other archs which use very similar
code we may have to rethink this but for now I believe this is the best
option.

Yours,
Linus Walleij
