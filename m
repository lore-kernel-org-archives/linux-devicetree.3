Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891202;
	b=hP+JwklcdIc+EXKdveVzVl/uID3MOA8ywHCLmwSJ6XYuqWeA+O1kqzOQ4Tdak6H1HSVA
	 EoGchcoYX5BBvII5iYY7zBYxSc8IZ75m+s3lmStLo32Xzt89NPZ34oEtwAgt/yZLLPoLO
	 Yn+BZmr/EjJpQ6Rbe8E5wFGkPoakfbgLSg1d2IIhfF5UQALzi/1CTgCC+UGZdVeBFozIG
	 GC3SLTC3SU+9Wv1/jkByJf3/UVq8Cat8YB6SkZSCRara7F9XBgpYOgDK7dkCEWqBmTaEL
	 RmrStVQ4SSYo9opJWmvhNNLUE73nDqxgIyZ/ruLx8Iucei7SHlujQtgM6QiCD1v8RMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891202;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lbu6CYbZmlg9LDpHvg31OE0O9sdelylvCrdhRi2mD7M=;
	b=m3SSi2ppwTS2kTuGk+R+0RaLEGu2ZwO4sLr6582iaw08uucWUtWAQfX4YH+vWk2U5TsB
	 bRBROI3heVRdFCKxf1vk1brR91FFIgY1RSxjT+XxsjIVxgLE+u0O7GGPuEpuzGCqs7JrQ
	 +7KNGVXIypudPPCj5xQbpDC2NbJ0sMaNe0a9ZZbKUNIv3TR2cxjD1UIBsWtkSCVEexYoF
	 LF4XAfYNnlRGKP1u28u2M/90IizVPkAHpDn+fB9mcPEiBYuxpuXrJKAHd9SGHjy10LfCC
	 Erjx0D74stGEObMFkFF6hQHdrN5QzAWLjgV6jqN+mp5RkUzisal3aPrmtmeDoEQh9vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ln31vRMh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F88A606A326
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 15:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ln31vRMh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2E071F00A02
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 15:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793891200;
	bh=lbu6CYbZmlg9LDpHvg31OE0O9sdelylvCrdhRi2mD7M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ln31vRMhbFvxkAtvzVW75Y4HBOLjjrZC0SmEKIotyieRcq6ES6mnQJRuRutgvH4na
	 2ntrXnFKWKITMWAZDTiek9ZeFMQEUUB4NGEi2Eu0bNaA7hZoFrl3esKlIeoxQpstlP
	 KePk/w8r8S8D/uxBr+FuQ5L8SwZ+izhxnROeVnAgjSXp1NqLSl9MqJocmALEoO6rNX
	 zrIqZEf7SHMIsj1kXWMvhq75PgcbWCWYYrY3OtcMtIQuqevvJt3ppSSdrpSe26Cxli
	 WwCbuMef7RBXF2M9c5Qo5l8pNwwemhlpMcyMXahWz3nvCEa4pFLdfNv4nlc9T1WEB6
	 zv2yO2mIsvHyw==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c169ae1cb26so127447266b.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 07:06:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwQFK14I9cLXM965nF7uOjOf78P5Ffm4i55k1RmeUw7Rd8/DiNlsanRGJOiRMoUvVQaBvN5V/UuKSH2@vger.kernel.org
X-Gm-Message-State: APuU4Z8D+a1vumpCr5M6HAT4Stx5GuPloh532BA0mu/5pWX7mPpE47vs
	9Pogz1Tzrgs8iPP3JXzr/byHE8iW+vbkikSc76aBFXiL6e7oHAGViI5AX3PDjis4x2oZsUN7MEq
	otvRszPfIvylEhhLkqj8O/W+0Ed6zdg==
X-Received: by 2002:a17:906:c102:b0:c46:d493:47be with SMTP id
 a640c23a62f3a-c4d206aede3mr244770366b.19.1793891199414; Thu, 05 Nov 2026
 07:06:39 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105144920.2796623-2-robh@kernel.org> <krvg6bwsueypasvt6fqszh7itqr3gu3qsqbji2ernqqy6g3t4c@b7hqenmaugik>
In-Reply-To: <krvg6bwsueypasvt6fqszh7itqr3gu3qsqbji2ernqqy6g3t4c@b7hqenmaugik>
From: Rob Herring <robh@kernel.org>
Date: Thu, 5 Nov 2026 09:06:27 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLETyrx7ew0zirS9r6+3=GEFaRE0g96OZHYwqjxMCZKcQ@mail.gmail.com>
X-Gm-Features: AclHuK9D1vVYdU6bP9ipfCUqtMD7cNI9yWkFwUZwsKz1kc9xgefpf4aNgPCbR6A
Message-ID: <CAL_JsqLETyrx7ew0zirS9r6+3=GEFaRE0g96OZHYwqjxMCZKcQ@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: nxp/imx6: Drop unused .dtsi
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 9:00=E2=80=AFAM Marco Felsch <m.felsch@pengutronix.d=
e> wrote:
>
> On 26-11-05 08:49, Rob Herring (Arm) wrote:
> > These .dtsi files are not included anywhere in the tree and can't be
> > tested.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > v2:
> >  - Rebased
> >
> > It's been nearly a year and these are still orphans. There was a promis=
e
> > to upstream something for the kontron ones, but that hasn't happened.
>
> That's unfortunate, but these includes are used at least by the barebox
> bootloader [1,2], dropping these would cause a DT regresssion.
>
> Would it help to upstream [1,2]?

You said you were going to do that on v1:

>> I will add the som.dts, please don't remove the kontron dtsi files yet.
