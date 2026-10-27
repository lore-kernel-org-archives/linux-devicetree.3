Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793110873;
	b=GXvXTzbfNrzuHqK/8zGfvqfE5VcHsnPkYIRL8MNaQxCzneZVsB5RWPGXcPzU/GmAA8/w
	 AxbDP+9ypMrNMP+x8yiOdf9zaHl8cD8jTL3AXhjuMEgDZm0hDk7pxSyS4PlJeG+cLsMti
	 FWQJYJTKUik3PTvLFBx2oy+w1OGJRPVnLeI/J6Z5yu8mY2LVb5MM2RakT70pB8Lx+o5VB
	 ZpU9gBPqYrx2znvab9a4WRpRKDaK6sFDBvzbJ/MF/DKZbpBPf0oN2j6yFLe5VfVtiKP12
	 zBbmDwiRl8VWedgMvLPCQsn22iIGJH2oGmRfsZEwTVvC/KhX8rvHUl/sK+lsGSRAA2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793110873;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NbaKo2EojPBVQVK7LV8aGSsd5gN1hbSzP/sBhHan3BQ=;
	b=uKgrP4QBpvULOUaG/G1m/X2dOimwPE9LnU8Db6fhylECoazIVrHPEOTlni0I9cl0pzPj
	 K8umvyMMx7aXh1yqjwGNn22/G5opGHgcV2ttM18PCjzgI8W4J+WnEnO6cB3ERn+PnjtLM
	 /6+Eip8PLyvgYb+tCPu/g/Cj595PGIHvKdGAiQV5fwLxnxeA71jSrHbUH/6bkhytCujVs
	 wdnCjvV+LQlAmXMnvwF+4ktWGw+Ajm2ySdOehc3Scf9qEW6oJZLisfzavaCebfr8TrXs0
	 yFkbjBQCEOSNrjg+29rw3NV6/f3TVyv0A3Vkh6hYJsyvevjwpExewqIRfPf32zSw/TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ofhIRjS8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A66A606A321
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 14:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ofhIRjS8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B06A31F031E2
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 14:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793110872;
	bh=NbaKo2EojPBVQVK7LV8aGSsd5gN1hbSzP/sBhHan3BQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ofhIRjS8UEcNYvRQ7QGnfdQbpB4M4tcgf59FYC/8+tx0dVDsCcJERBhUt/ywGnGS7
	 Z7sw8QQSG7uwU6gjncZs+IwlfvhcrwE6aCGfPy4jNRVkGLuUnk63x7MGS/amO8dmHw
	 y4lQKO41tkZaNFLPiG2aan3Gg2+Zol2FedDrEmOyui0AkwlLkM7Ya49QyeaelD1Css
	 LDNOpLnYlgg2+jG0xMFwJrBzCcYuubAckbNCOAlJLP0KvnbI2YkPnBAT2eRDIRenUU
	 rxSu/IvzW4Ly/hucGVFn1y3e0XFgUnfZZ2rRXkQw+fT8W7KUEDOufo9jKr81kh6tzu
	 kTa8p1cfiEAbg==
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-4a89b4a59a1so792621fac.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 07:21:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzc02Dw3lal2g9Mk4i3wTUF5mk0RvkdUqYitj15DIEmF7lHtc1r9BlV5cPvuw3d0GbnAGro4pDw+mJO@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2mKMYgpzDcFEsi9ja8kbovFxnNMTIqKUY1tRxhcOAhAdNSxEv
	2jTPo9bGnBR8pKIdcat1lC8aCGrEYSBaxhB1qJtQAHo5B8H4hGRCZgRBJlHf7FuHn17b4exFmGV
	2CY+lzzFLIVdNgjJ74X7hztdzET+Zt2c=
X-Received: by 2002:a05:6870:3047:b0:49e:50bc:79dc with SMTP id
 586e51a60fabf-4a89b6135d3mr1718291fac.22.1793110872016; Tue, 27 Oct 2026
 07:21:12 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792776697.git.geert+renesas@glider.be> <f9de8214043ad4c8748fadce7fd2cc2fa95b1291.1792776697.git.geert+renesas@glider.be>
In-Reply-To: <f9de8214043ad4c8748fadce7fd2cc2fa95b1291.1792776697.git.geert+renesas@glider.be>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Oct 2026 15:20:57 +0100
X-Gmail-Original-Message-ID: <CAD++jLkrF-Fuqa_ojSyeO8ogDrY==nupNvZAUC+nPoK+PNJc4A@mail.gmail.com>
X-Gm-Features: AclHuK9wpK2sOZ4pxVax9gNRbt2j8VY4zFskPh_vnOw0mDesf_mVGe4CvELlVTU
Message-ID: <CAD++jLkrF-Fuqa_ojSyeO8ogDrY==nupNvZAUC+nPoK+PNJc4A@mail.gmail.com>
Subject: Re: [PATCH 3/7] arm64: dts: renesas: r8a78000: Add GPIO controller nodes
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 7:53=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
>
> Add device nodes for the General-Purpose Input/Output Ports (GPIO) on
> the Renesas R-Car X5H (R8A78000) SoC.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Co-developed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

LGTM!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
