Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795392696;
	b=Lx1jq+CY0Aiiy/nPnyoMFQtIFo5aZF2lBynPWqikJdxO/ShM9SnKMMdc/241OirQA0NT
	 r1wdV2swDlKxy2DV4udDjSQx2stsa9JaPmDnd9W0SMckrkW3fYahOx1ukCQv4PO2guxoZ
	 3jqMi5x3jc58yyqKydXHOAKzUbE34qGP+hC4mcu1yJNGLOi3rWRb8p/7gTBLCgHRUNO4o
	 TtpPtLBLAFM2MV0pyh7c/LvQoaooDNBgXGWNDMDRCPmZbYSd2b0yaJdJ80OZdKCi4pOg4
	 Cogj9mKvUSlrBtHtnyVX8EoS03K9bs6w+atexnGaX7rRFwLdOIE4XpymllGCrCW0hLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795392696;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pzL1OdNmy4Sn4HuW7URSYpC45FZ9iIyQh9nhTGJnRkM=;
	b=XILghx2D/VnJnZd+fo806JwtYXoqypS5fkEnwsWfx90UX2umTglfFQHt5rhHudK1bDEC
	 HV2MkLWzkvjAIQhv7mVqLA1VgcmPzA98Jv//wBj0pEHzHIMjPOcm331aec2Z3+8uvtWYu
	 rzZUVxZcc3Dm4roXPsqM/4btd/fUTbSTAePZRqbLB6wxTc5wT73d+ocUI0eU50A0pi2X8
	 JhbEwjR6xVMUXHX83k8WX7uhFkPghdnQ4Vx20CivgVBJsqR1Fa0RYB8xjoCtrjmmnmTRk
	 7k2K9K1wvCajBQ6lBYol//IOi+OVV9x7nlFpNz9C0285yqTOkwCslP+5wv0wrDy8kVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZMZ+2RYj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE094606A31D
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 00:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZMZ+2RYj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0810F1F000E0
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 00:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795392696;
	bh=pzL1OdNmy4Sn4HuW7URSYpC45FZ9iIyQh9nhTGJnRkM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZMZ+2RYjViG2bmZiZGIipjwncVIeQyEHxkeGVgpmu22W7CUuIX0cycyklNR/CZaH8
	 m6f2i1YqfBuIEb2bdZrvMtTbc5YwxvhgYBMZz474HCj4VJ6M5zYYTYj4yloOlz07vl
	 TNjs8Us/HR2AOVtrtXEKS8MVZizK0oYiiP5mziUQ7qKadNIFQo81I1c9aKwALhYLJm
	 aMVHWv1hV9oGaBZX5YQfQcFaAOi2zXwu7oh7qulZo+DbiiD45AQsN31YrdjUStWf4t
	 Bwpfak1Ro35QHZVD4lJF1H9Ck0RoZPDePY6HxAAxP2WEnL4hkSLWsazJzZtSpkrDFW
	 tV6EYfgs0+xYw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c126fa1e3aso1742646e87.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:11:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHvTpAXyHdUZuj4VaaSxsrwX9UNvInMl70Rn88CbpFLgO3jbh0yrsUOibrUTDhOb+52bFd8GrzeYgeI@vger.kernel.org
X-Gm-Message-State: APuU4Z+LbSf+zCtErwk6Dr0cpEpr936qvgBgwuTcaQ42AM3TtLpOwlGR
	bhAxczjIxK4hDfsaoamjG5gOvyiFJfmtsqR529L5J02QY8gHVGTMJ3ffSb2IEDL1eXBt4IPX0JL
	Feosq7OuRSpDv+Kq4dWO0b+0LkoN3Wik=
X-Received: by 2002:a05:6512:1391:b0:5c1:5a23:ec04 with SMTP id
 2adb3069b0e04-5c1bc85b7b6mr2662412e87.44.1795392694735; Sun, 22 Nov 2026
 16:11:34 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-mali-c55-renesas-dts-v6-0-7dff41bf7107@kernel.org>
In-Reply-To: <20261105-mali-c55-renesas-dts-v6-0-7dff41bf7107@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Nov 2026 01:11:22 +0100
X-Gmail-Original-Message-ID: <CAD++jLndZTg0tk+GRo3aZrQ=0rVL+5CA=Swi7_KKQr=iBDs6Vg@mail.gmail.com>
X-Gm-Features: Aa3M54rrgEQGFcFfn8yM1_2n_V2A0OA5mXHg_mnx-6IzawOxF5-bkLruJCdf87k
Message-ID: <CAD++jLndZTg0tk+GRo3aZrQ=0rVL+5CA=Swi7_KKQr=iBDs6Vg@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] arm64: dts: renesas: Enable ISP and IVC on RZ/V2H EVK
To: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 1:53=E2=80=AFPM Linus Walleij <linusw@kernel.org> wr=
ote:

> Describe the optional ISP DMA line-tick and IVC frame-start/frame-stop
> interrupts. Add the RZ/V2H(P) IVC and Arm Mali-C55 ISP nodes, connect the=
ir
> video endpoints, and enable both blocks on the RZ/V2H EVK.

Gentle ping on this series, everyone happy?

I guess the DTS patches go to the
renesas tree and Jacopo picks up the dt-bindings and the driver fix?

Yours,
Linus Walleij
