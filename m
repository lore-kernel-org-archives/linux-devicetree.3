Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3B948380F
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 13:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785331075; cv=none; b=ZZ1lrznxRhYR0TVll1bKya8u3Ayn2TMtceLz/sGsU/DBlfvdcCu00MKifnwNa+EvLnsm+AE0HNLTagxR8wwgg7UQ32BLNS+Gmj915AWxwS7vVpKVci2MsjnKkHo9IXfjyGfsA0QPa+8g6JmZyEJtcOQm2S+8WTEZ0HF3tef10N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785331075; c=relaxed/simple;
	bh=ltbFZt7Cv/TuKt7cLl0bASF68exLUdT3n3ZTYEEuYS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kzYQWWOMwwtL1Gfz3cOsqcw7qEUd5AaiFsSqIWDsnOcccrmwdKeyFftpS69E0y5e88phq3PMm5gWmEFkdmcY8lYcTL8ZF447kIFCRReMcbdG9KJsZVXKFI+qzqF6+RJt6f+2ttZqp5tUOOZygQff8EQSnJG0NZKsmWGEmBt/dLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XiIVs3lj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XiIVs3lj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60B471F00A3D
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 13:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785331074;
	bh=48XNN4g07zjeNMh2MkAdOMxyZFFb3QLQsG3AajgwEVQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XiIVs3ljKBeYOc0ZMoiSxhQkAZjjVAcV9Fv/7jfb2vSpD9P7AFExLWU25uFfal5Ai
	 hWwwIsIJeqJMO/bL/d3R7N/0jWLawV9O7UXaUp2/viGl4zbtQ2m0DAAiw5gHdQU7Fh
	 dgj6ynWZiBMzmZC7+YM7lYWkzh6b0lXOTT/Vo3vwy2Gj48YRITx5j9uW73jVDGApyd
	 I/wgfB2txyke83hX9zr8+WpXTHSQ3cQhMrnyMd4YCxEYjQptp68aL4/+ucQF81kfnH
	 5TH/ndZqA6tzSH7d2pWfgiKw/ltI/NmzTPduDLhShnVHoJ3TEzVRXcONPDwYzD5UXN
	 zlzuv26VnHYSA==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c1c4c7ddaf6so141854466b.3
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 06:17:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqJYp1csD6/FY0osAada3dj2y1h2f+AdnSnqReqEaVY5rC9pTdjh1dhIuyEhcn5q4Nh+aaaMQuhOzWG@vger.kernel.org
X-Gm-Message-State: AOJu0YysNLb1ayVZZUi5B3uAbSsDBSlc2LPZmOTBhCVRC/cVFefB+xE9
	Il9tjkSflR/qXKsSZNZJRfxo1VNsZ1PD/7kBUYDOq9p62mYj+bDQzshTPDvR1LXz+4AwtXzvPZL
	pO4X5JZO4jxcZbl2KR3rsU8ewEldJLg==
X-Received: by 2002:a17:907:3f83:b0:c15:f65a:43a8 with SMTP id
 a640c23a62f3a-c1f71e917aemr350404966b.12.1785331073073; Wed, 29 Jul 2026
 06:17:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728085640.1001890-1-jackyhuang@nvidia.com>
 <20260728085640.1001890-3-jackyhuang@nvidia.com> <20260728143952.GA2121505-robh@kernel.org>
 <20260729060612.1085870-1-jackyhuang@nvidia.com>
In-Reply-To: <20260729060612.1085870-1-jackyhuang@nvidia.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Jul 2026 08:17:40 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKx4OEM-asdvs1wUiP3FFObzJHZtNTtqiwtcRhJ5CPRyQ@mail.gmail.com>
X-Gm-Features: AUfX_mz9kVcB2p0XmnaO_w47PYg5nxBKrgQw2D-RxR5WDjCFz7aeXdayL1fqqeI
Message-ID: <CAL_JsqKx4OEM-asdvs1wUiP3FFObzJHZtNTtqiwtcRhJ5CPRyQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] ARM: dts: aspeed: Add NVIDIA VR-NVL BMC
To: Jacky Huang <jackyhuang@nvidia.com>
Cc: andrew@codeconstruct.com.au, joel@jms.id.au, 
	krzysztof.kozlowski@oss.qualcomm.com, conor+dt@kernel.org, andrew@lunn.ch, 
	devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 1:06=E2=80=AFAM Jacky Huang <jackyhuang@nvidia.com>=
 wrote:
>
> Hi Rob,
>
> Thank you very much for the review.
>
> On Tue, Jul 28, 2026 at 09:39:52AM -0500, Rob Herring wrote:
> > > +                           cp2112g: device@2 {
> >
> > This and other devices should have a compatible string and associated
> > schema. The hub probably should too.
>
> Will fix in v5.
>
> > > +   flash@0 {
> >
> > Needs a compatible.
>
> The flash@0 node augments the corresponding node defined in
> aspeed-g6.dtsi, which already carries compatible =3D "jedec,spi-nor",
> so the compatible is inherited. The same applies to the flash@0
> under &spi2.

Is the flash part of the SoC package? A board level component
shouldn't be in the SoC .dtsi file. If there's some components that
all/most boards happen to use, then those should be a common board
.dtsi file.

Rob
