Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794751503;
	b=b2Oj0rKRFP4epiCt3Nppr1xSZxmnoLItDREihh5iDob2SXP0e/rP/Cvdmrt13eLMU5fX
	 J8DZZ1cL2A6nLCp2aFS9jNCwZDj6moP4S4HREXnz7HheM4QNlbI6nPzDnnoNY8m6Jf/E8
	 YeLbnkjPZW0ZV32Pkgl/zqpUP5irX1Mf2Sxdt50NvSblg0lOFn3AkPMYHQDtuTTlEjWel
	 bfEuvDTVB8Ah9yH34P7Zlq9pq9BctlU5QGoPH7M9595Tvums2jKqPxwjJ2ZY3/4Ehjcs0
	 UyF2K6fRx2YVwERis20AuorKHEyMmQ5vvm6nKW+qC7QaOPJVuiQk2ltag080m4c9dFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794751503;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XWgHxxw6EzmAFNHm6I5mTHp/KXf3zQq3hfRAvmIG95Q=;
	b=4FkLRDjRAJIODP7IZzD02Lfvtu9fXcfqOw31gkmKSNeJbvkx8TNqDXGld6ClutaTuu05
	 gdZn0XOnuFoxFAKQKdwdb1YR2kdtxvlr9JKF9h4oi5F2ym1h9As02liBfTnZI1rqGedab
	 8qi1m5Jb9xpmWAlLfuLjHxR4ImH/0C48SyCVDGgxn5MSaeb1L8Yyc6KXeoBNk9vAjOHzQ
	 H+GXmhIS9KMpBLsm7ZkW+aVAEyzKsldnSPQAID4TQC6UHTgThuiD5JrOgdCINioJera8k
	 SJV+rdjqklBv9SrisZe1nzBn9C+WIXcrAQZC8gHaYfTAoz/R7wuA+332EdU1Jq+G8hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DHmikIoq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4D3606A323
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 14:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DHmikIoq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FDD21F000D1
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 14:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794751503;
	bh=XWgHxxw6EzmAFNHm6I5mTHp/KXf3zQq3hfRAvmIG95Q=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=DHmikIoqoA22jou79nFPP6iVVKr/WcDGON2aE4C8Axj7L8F3fkMNUoZYTdklMRKXG
	 NK7tyA7Fr3XZD8iHHH08E3nedo/wrttTJTg+tXtgk4OC4oQzo1cS5LJfD8tw8+pxR8
	 Ra7wLraVk3W2vsCxI1CjtIwSptBSqIkSycIMbG3lTTxD9d0ccAovYYlEEqWoGW0h2l
	 p0N6ZDFg2U22SOOx96Gl3h0kWiGDck8cKBw9oriP5k14J5egXlPMnfIgj6pLhk8MuB
	 z3fNnAQZ8ETyO0lwv22D6FIr/ErOsFIpP1NK6ROiHzWWbXelmSxK6A+ucgy/yAH2p/
	 pSX4yQOq885Vg==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5be4a2d94adso2524822e87.0
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 06:05:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFw8tc59JKPVif3W4QfzO/EyWWQtTnr4aX7+4cKspE60KGP4FvMKWFB94ZAM7B9M7qaRxDr/iebIs+3@vger.kernel.org
X-Gm-Message-State: APuU4Z/YHgtTP7OQd89Vsv4W9ck3cvQ/D1RFWV2WW+/gr+hlg2NUQf/q
	bK3gGu/MJeanTW7l3nUHZzQ2m44G2yB+xufG/r7u9vuo5c5/s/0WMPRfPVwmQMhUp1O8ehWKGdQ
	Re//V05tfG+toZUFv1rP1fqjzS4g04Bg=
X-Received: by 2002:a2e:bc90:0:b0:3aa:ee7a:5466 with SMTP id
 38308e7fff4ca-3ae2b4f52f0mr25507651fa.16.1794751501306; Sun, 15 Nov 2026
 06:05:01 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115061102.229680-1-jernej.skrabec@gmail.com> <20261115061102.229680-5-jernej.skrabec@gmail.com>
In-Reply-To: <20261115061102.229680-5-jernej.skrabec@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 15 Nov 2026 22:04:47 +0800
X-Gmail-Original-Message-ID: <CAGb2v643JrFOwrLrhUOTenSVbRgOVz+hEDFqXDR+0eF9fNpOfw@mail.gmail.com>
X-Gm-Features: AclHuK8_QfEct_D3A6zPG8V_CU046sWNEFKONymgEnMQSD9bb71yZqe8AOLlRsI
Message-ID: <CAGb2v643JrFOwrLrhUOTenSVbRgOVz+hEDFqXDR+0eF9fNpOfw@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] drm/sun4i: vi_layer: Limit formats for DE33
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>, mripard@kernel.org, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, sboyd@kernel.org, 
	Andre Przywara <andre.przywara@arm.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 2:11=E2=80=AFPM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> YUV formats need scaler support due to chroma upscaling, but that's not
> yet supported in the driver. Remove them from supported list until
> DE33 scaler is properly supported.

Somewhat related, but I think you also need a patch to block fractional
coordinates? IIRC that also uses the scaler.

This was flagged by my review agent, but I vaguely remember it being the
case from working on the DRM DMA helpers.


ChenYu
