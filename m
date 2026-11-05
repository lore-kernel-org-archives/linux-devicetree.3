Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869831;
	b=M1IFibNNCslpiNbk/PVZOmMiXxCZxoT6LweA/6biuTcNlCNHOIsO/M7kEAQt3dFQ9Pj3
	 w90Sx1wIu8BmLJ1A0wdi5HxXduD3lL3kXaLl0/h4XoySaqnwd+8JExoHTgtCnCzQ244Xv
	 7/C3HxzgXReRd4hE66fSecVS6Jn/8Ek58GVcNekAfjK52U4BinJTQgBbNfS/IYHAYe9Rn
	 Rxi7V8IU64MeVcd5gGMhGQYbFj1CU4jahSzKrP5QhZRO62jcMU8VjASQa+emfFJ1I9o1j
	 Ln501yXtoek8uvcPxsf6N3FHwhTO3vk5xMraNT2cmItirqxx/yJcrlyoX/5Lpio94kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869831;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=l8FVoARO3j3t6Swl/r4USV4n/IIP1DJGnmzvtDWkxwE=;
	b=Uvo7FSkQNLRN88Ap2V+J6Nq0zOR3EAbEmqm78BTcV355vPpP3b/2ykhfx32vq5J9ibMb
	 2S73oRQscLTVzDK398nb3ftu25sjb4PnjldLcHy+INYQZ6NaQbml4U6N6MxEOHUVmp7q1
	 tj8D7FisbckVh9+fHwl2LwpqmbkhS43tb2fYbBX29b/NtT5AQk5tphnANqsaWBp6wxv11
	 nHOhG0l2Q57J2jXnO6dZITK3hGPx1RvlYqb5RPhHWACkv6rI/hDHPvNTnnsk3TSr3dueQ
	 3sl9L1kxjFD3sz5FvH4bEXeCHUnli7IhgiIJu5GNeq1dBk4lTNZB7LZFbGS9ZD/2EvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DAR24fhg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4314606A32E
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 09:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DAR24fhg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 592261F000C1
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 09:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793869830;
	bh=l8FVoARO3j3t6Swl/r4USV4n/IIP1DJGnmzvtDWkxwE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DAR24fhg1o12QPYF8w+7b8HIwsxRutsHpEf4cTFEyfIe1ri9nazYsDIocFwx5ISJP
	 /3zIPoK5gQ2uI+H1WEkOK0X8GhFfj+9hv4l19yz1q/DPecQzQz2d5wbU1n2ejd3hHg
	 /zhtdfWlMuzov1tVk4nMgIA2qtMOnpO+yRJas9gvpgUs9txLGJr7ilihbpns5ihEDF
	 4/2yV2xRNhSNdsLoCt6rVfexZqo5PI+2bh5Zb6srEz7QL1UDMhOmHpUYxCXABSTIqt
	 wtkhqxb8Tr9xqccUmW68LmRoovBaE4sFySPUjEpNYZPRH5NW5iNUtVbG0K+6xqcnIW
	 aiNZNsoA0p13Q==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5ba36cc21cdso1598168e87.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 01:10:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByeHhaDXnfCxQ/mMIxtU0TpMyHAogpZeiQy2cnjrMt5BJ78A268t/pPZZLL0Nw8FfqDam+qZeorLxEL@vger.kernel.org
X-Gm-Message-State: APuU4Z9PJk1kprojTV/+SEvRWZIYvmL+F5nmgKakqNy5nFuzPriosKOf
	FRG8MaGZRAsd3HigwjO28UrPMwYXl3KUKu/jtDerwOxgeIDJNC2UIHGtrU+NKPAJQMGmoMUtzs0
	8kOV6qQQDY7HvR9gKBVnNLzDtudahkBs=
X-Received: by 2002:a05:6512:31ce:b0:5bf:be3c:6599 with SMTP id
 2adb3069b0e04-5bfd957cf17mr5726763e87.67.1793869829164; Thu, 05 Nov 2026
 01:10:29 -0800 (PST)
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
In-Reply-To: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-4-3aad0860b984@free.fr>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 10:10:16 +0100
X-Gmail-Original-Message-ID: <CAD++jL=Np+_+wTkuLCiqjNY5EBqn5qq8zKTJB6F-=1G0R+7=Ww@mail.gmail.com>
X-Gm-Features: AclHuK_7g7nY-8H8wprNfNKV8lgILSoOexV2IGLiXfskv9qSmIolBJEeTn_Fqx4
Message-ID: <CAD++jL=Np+_+wTkuLCiqjNY5EBqn5qq8zKTJB6F-=1G0R+7=Ww@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] pinctrl: freescale: add the LX2160A RCW pad-mux driver
To: vjardin@free.fr
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

On Tue, Nov 3, 2026 at 7:12=E2=80=AFPM Vincent Jardin via B4 Relay
<devnull+vjardin.free.fr@kernel.org> wrote:

> From: Vincent Jardin <vjardin@free.fr>
>
> The LX2160A muxes its IIC, XSPI, SDHC, UART, IRQ and EVT pads from
> fields of the RCW, read-only in RCWSR12..14 of DCFG and changed at
> runtime through the same fields of the override registers in its DCSR
> view, which read 0 until written.
>
> Since commit 8a1365c7bbc1 ("arm64: dts: lx2160a: add pinmux and i2c
> gpio to support bus recovery") Linux drives them with pinctrl-single on
> the override registers, so its first pin state clears every other field
> of the word: a board whose RCW programs a non-zero pad mux loses those
> pads at the first I2C probe.
>
> Add a driver for the pad mux as a child of the DCFG node: the fields
> of RCWSR12..14 and their encoding.
> Then pin states select them with the generic function and groups
> properties, and every change goes through the RCW override
> of fsl-guts, which reads the status register, writes the override and
> waits for the status register to follow.
>
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Can this be applied separately once reviewed?

Yours,
Linus Walleij
