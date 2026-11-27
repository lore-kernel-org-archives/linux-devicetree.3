Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791029;
	b=KAfLdHJG+Ue0FRCsPdtHCj9g+DJm1DZUZDohTiI3xJt24O2JUO7qB2pXh349h0nB21h3
	 xJJqmklXlp6/ElGKchc8m+OX7AgAr7fWhGbvLsAN77L8XXyJFAUHGK4vnnA8o7pd+7Jvk
	 DNZ3wHs/kIo+SQrGkcc+CCIbtHY0+apkhmIdSHw206LqpJCdzFkyBvQTXTRwycVfNfp23
	 xQ6+M8Gm+8wEev7khkTsqT0zTclGeaVGyJ3Vfc01jOhFTL5ALJ8g74KgmlOASdUaNIyQ+
	 zLEO/pNQc+NVS7qI4GgJbV1rtjmL6ASKJ4A5BSlsJt5Y7WMA0WJVcLU0YJVgZ16l2Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791029;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3jNoWnulbrsDpVqqs904fRidVqIbZWsGQHKPgCx74o0=;
	b=OdP0ja5Ngf5OIpuG8dviG+MWQ8c+RDbJsh4s1egW6Kjje3UncKCyDOjD/QXVPIUnbJl2
	 xxd71Vz5wf6dNc0wBo24ISE5yn3mS82xwZlx1UmNN2VxmZCAWpX79D28UtHp13Ev30nvs
	 od5098uEdlyYAL4IBcBvfUEubN2OGK9okSxE46pjUtxXanJc/JJIi1f1KjicEWgxA17nk
	 tKQhrr4vhNCCFzg8x+45/xAKv0DYEZbI+aSBIUHcy/llOoLJgZat053zeSDtxcweMWwcI
	 lp2l5cz+awqdUzYo/uewsoYw+I79zMfSBSqpshIxvkg6jraaKLaEtUYHB8FkNNX8Pxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=asvmTp1e;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F78606A31E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=asvmTp1e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EB911F0089C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795791029;
	bh=3jNoWnulbrsDpVqqs904fRidVqIbZWsGQHKPgCx74o0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=asvmTp1eHdvI/IZXhgvTmgWBGVGWINsxFfv71+oro5tsHYG9zv/HhjEIicEE+VfXz
	 wWDsg9tMFeXqveIKChi3wbKSCL9rVkS5a39EVtZBJu9VHHItnWI9nS1Kp/fAIUDRFl
	 sr2H4J+FeZKJNkfqnwwjRzgmyEUkPEFqwkS2AyozNYOD3Bb52EWAxnjQ9mH0q+H1lb
	 5YFqJLdstQJvsMU+PE4CPe+sP/2cqiTGkMSLJjoQqi8788H/LPlMeLXZpJvFd/aRDb
	 AvzT05/HWtdV6qQ6ZN0pvu90wxtShu3uUc0nri5ZkNZ/iRrbwi8w6QjSrWwYMuu+Xp
	 yWndXD6iO/xaw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5c102ad8420so4371472e87.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 06:50:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGIwnt1wAaA27c8UwO+iWNZA0qjs+ByOjSIaSBfd7ti8kxlXK2fnO+KciXaU8ENI2wyskoEbsheK15+@vger.kernel.org
X-Gm-Message-State: APuU4Z+RBHKoniT7JsCm65Nq+u9dMEBpDqLPflrYFPzbHJYERMlCgOn2
	h+wii3HdlGO+IqohJwB2RAqMyywX37FkUmYqPnBjAD+LjfWnRzS3BYs3nNIf5iksEfNMlp3KlaX
	atmxD8zwoWliUZz9CQjtNHyAjwv47oAY=
X-Received: by 2002:a05:6512:2353:b0:5bf:c3e2:41c1 with SMTP id
 2adb3069b0e04-5c1bc809895mr7113918e87.44.1795791027796; Fri, 27 Nov 2026
 06:50:27 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261127080649.1982883-1-alastair@d-silva.org>
 <18637573-d20f-4a58-9e63-6bf71b015cef@arm.com> <d4a41c5cfb33d6d39f0ba927541beca1175ad001.camel@d-silva.org>
In-Reply-To: <d4a41c5cfb33d6d39f0ba927541beca1175ad001.camel@d-silva.org>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 27 Nov 2026 22:50:15 +0800
X-Gmail-Original-Message-ID: <CAGb2v65KRdVqauuJ0F-fb3Fvtx5HJqv-fUTaFJS+xEsQ+Wb78w@mail.gmail.com>
X-Gm-Features: Aa3M54oOaQujivp7_3Q1utEL14RKW5So41dM2VxpASzKJxC7DwsjG9miI_JHOKg
Message-ID: <CAGb2v65KRdVqauuJ0F-fb3Fvtx5HJqv-fUTaFJS+xEsQ+Wb78w@mail.gmail.com>
Subject: Re: [PATCH 0/3] arm64: dts: allwinner: sun60i-a733: Add simplefb HDMI support
To: "Alastair D'Silva" <alastair@d-silva.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Hans de Goede <hansg@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2026 at 9:58=E2=80=AFPM Alastair D'Silva <alastair@d-silva.=
org> wrote:
>
>
> On Fri, 2026-11-27 at 10:03 +0000, Andre Przywara wrote:
> > Hi,
> >
> > On 11/27/26 09:06, Alastair D'Silva wrote:
> > > This series adds boot-time simplefb HDMI support for Allwinner A733
> > > (sun60i-a733). U-Boot enables DE3.5, TCON_TV0, and DW-HDMI2.0 and
> >
> > Where does it do that and which U-Boot version does?
> > I don't think we really want simplefb in the mainline DTs any more,
> > unless there is a big blocker or delay for proper Linux DE support (lik=
e
> > there was back in the A64 days).
> > In Jernej's HDMI series he hints about A733 support being pretty
> > straight-forward with the reworked H616 DE code, so chances are we see
> > proper DE3.5 support in DRM rather sooner than later.
> >
> > Cheers,
> > Andre
> >
>
> I think the blocker was firmware for DE for this SoC - it can be ripped o=
ut
> of the Orange Pi OS blobs, but that won't be acceptable for linux-firmwar=
e.
>
> I'm currently reverse engineering the GPU firmware blob, it's not very la=
rge,
> and is a well understood instruction set (MIPs) so that may be a path for=
ward
> without the vendor contributing the blob to linux-firmware themselves.

GPU and DE are completely separate blocks. You don't need the GPU to have
display.

And slow down. You sent out dozens of patches at -rc5 (closing in on -rc6).
Realistically none of them will make it.
