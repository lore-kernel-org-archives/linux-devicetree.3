Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910821;
	b=SIZaCfhIOoz+/HUgmGwMFGODASsMWZmP0NQX/j6n5kzdFX+vS+EhC8IRlsO8gcVGHaHh
	 +g45I0CkbqDqL/jAlhYD7HedCrhAq9ylYHkq3rd5LKKiWmR3h6IyjK+XUVB0osC07m29B
	 qNpO0fE/a30Nvpi6IKhIz6N3evnWCDXnfkpqhOgXA7CWJG3JehV2L4HwZAtRd0XXEWkLE
	 FS1okBhA+a1xWEd6xXVXid+FHJOJR4DNROHPLknr5E+1voRZUI5dn2oQRDe9nZ4eanNvm
	 RPOO5T2f4zCtdeU+cohOaQ80/1LJ1ISwc5is08Rtp3KdFtCn2Ulx2pKzMpNZb3+77Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910821;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LYjA64OY7mzK30+EmXCloZ1d2MnMctrR1lEa4XYe6Og=;
	b=PynGeHGrbXYdMNvANmwE759xEJkaHyHu3UikPTtomsgfETYywzTt+AgKqPE6hnORz+Qa
	 B5qD2czhj+ZGkIpsfPoyvJ4TmW1duVM0stxjbTnNQwcuGGRAQApi64daXVzh7FNipqQBo
	 ExziPx+z9ri3WIfkgdPjX/5UTsF6cTCrll+OL9VgAHkojLZCM48qInOfOs2b9cs3Sv8Ys
	 UlKu9ETGOqiU5Rl3iDoi+0aEIUytLkkHGoqf5c/DryvTuqdV83CvHtvsfxcPE9I4UYvQg
	 3P2h56K85HetZ13yPcxkAL1jpDaydFSKAlHHV//8pcAkHIpgJUOjZA0hvfno+UBq+JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VY+cEPzz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAAB606A32C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 10:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VY+cEPzz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 253A41F000C8
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 10:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794910821;
	bh=LYjA64OY7mzK30+EmXCloZ1d2MnMctrR1lEa4XYe6Og=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VY+cEPzzOeQl350iSplr3YTbz/NtmEMKg6hNuwMjP304qeTNTNVYjYn69bfPeDIrr
	 lS7RhvYXF4dCg9CZ8zAIS1K9t+Ts2W6/CwaJXt+xpLSgkZ0KkEjPZXcp/4WYY1aOjX
	 KgvvCBalfuTh7MDTCxX/lqDxO0eqA51GFCKXPRmVhjH860W+HS8ZWHfZiUv4Pdg1Ot
	 NCKtr9f/uT0p7JoxmLwfDWgnAn25r4zqaX1A+yEahv/mz5de0wAQrWh37dAKryhSDf
	 cNDA/Jg4XwFcxwYpEWDh98BL5zveMpdl6T3nP6EeJ1kkzMzwF5iA0j/fkoFcXeZHyS
	 WTgYOuBxjFWFA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c17a1775fcso2833575e87.3
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 02:20:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHhcKl2oI38s2ulvDUa/2U876f/83Zjjue8qLjuaB7QNXpeOh5HeIH90jyM45IK47nIe2DNjrgbFY8L@vger.kernel.org
X-Gm-Message-State: APuU4Z8uNxgCbZRVLX6Afs+MSa/0HRwaYZQxLCX1/M5dCVvY/HDyOicG
	3Vix+tV63Qz82A5TsKDlIAcW9pc8U77DYstUpgbCyOKdZPFKzCbWgWPD6iPAfg0CPjv4/2bwXWt
	xPhCjm2a5fESw4qzsmPAfHKYnF19rCOc=
X-Received: by 2002:a05:6512:3c89:b0:5c1:57d3:efd0 with SMTP id
 2adb3069b0e04-5c170b45aa9mr4736734e87.35.1794910819929; Tue, 17 Nov 2026
 02:20:19 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-0-3aad0860b984@free.fr>
 <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-4-3aad0860b984@free.fr>
 <CAD++jL=Np+_+wTkuLCiqjNY5EBqn5qq8zKTJB6F-=1G0R+7=Ww@mail.gmail.com> <au9YgytCc4TKfETI@l3017727.home>
In-Reply-To: <au9YgytCc4TKfETI@l3017727.home>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 11:20:05 +0100
X-Gmail-Original-Message-ID: <CAD++jLnWcVDbh-vf20w4nfvOSZik619XqoEjXTBZ29sJkX-bCQ@mail.gmail.com>
X-Gm-Features: Aa3M54rAvJrdH2ioBjmTcd53sA32PoIoppu6eV1QG1zyBMjvlTxU-cDEh9WFtc0
Message-ID: <CAD++jLnWcVDbh-vf20w4nfvOSZik619XqoEjXTBZ29sJkX-bCQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] pinctrl: freescale: add the LX2160A RCW pad-mux driver
To: Vincent Jardin <vjardin@free.fr>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, Vladimir Oltean <vladimir.oltean@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 5:58=E2=80=AFPM Vincent Jardin <vjardin@free.fr> wro=
te:

> > Can this be applied separately once reviewed?
>
> I do not see how: this 4th patch needs fsl_guts_rcw_read(), and
> few other fsl_guts_*() which are from the patch 3.

OK

> Could an ack of Christophe Leroy be enough on patch 3 to 1...4 could land=
 into the pinctrl tree ?
> Then, patch 5 could be managed apart.

OK let's try to do it like that.

Yours,
Linus Walleij
