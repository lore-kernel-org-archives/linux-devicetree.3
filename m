Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839625;
	b=4iORwD/tNg4RAhaTHJoNBR4NQgb5W+77+BK9evJPMJ26XQuzyhPmXj7ha8/NfbAW4yAQ
	 67+Sd5l8CirhsGrYTuXD66vCuw/i4cxBT1uFHrvz8g13pjG7IyRP9dtQev++oSafLvZMv
	 J8IBONv2h8cjWOx8Zvho2pEgmToCMweP/mHjkH4Ks+hL11sBG1tuISsuNWEtj3thGxX2k
	 /SlMC3yMDd0P4dwZnAIwEL0OJ1nfhZIP9mGZb2JFrI7mt7dVN3hmh6GvgQjPBBxe6Kjx6
	 XrYOZ78LtAaTL2OYhIjy9kyQbP8XZIsnSLlmNtYyh7PaEpl5VyIWk5E7jipz7ZY4h2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839625;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gK7mnV0K5J5AZlPsKO/qnVm94znB+xyRhSHaNfoCvBE=;
	b=nSGGLOxkCC/enD9CQ8Yzj6ylMZCspv1rQLqCltWBLLxLrvpYSCcrJ2uWAtRo4sWqiLS9
	 mqskuuj6kHwIYc6j9f0o3ndqe+QmlrcJzWJWH8lSZwZOOe1ikfzglfR0+a0+GOrchE3cW
	 lrxBHdBpgVi933m0QJD+vA/vHUvOPvjLwSB1U87sNaZiWBB2s1ly/Q+aqUNCafkgjdbYn
	 P3J+D4mdBJBdx0zkpY4P/G6YmUbc7LjCBiENUWdOXLkl2H5MPyIzIQNgyg7cNECXUVuh7
	 Twdfo9uVUpcRmlKYbIGFFRLDT8vX5aJmAcEIzc0K+5EVQZC1wVeGlQ8Y1r0dTZiVdeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oUQWunDC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A138A606A32C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 14:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oUQWunDC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36DB81F000C4
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 14:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794839625;
	bh=gK7mnV0K5J5AZlPsKO/qnVm94znB+xyRhSHaNfoCvBE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=oUQWunDCwyheDaHGiEVDZgcG4hWfvsWBs2QCkprHpw8MX67IaQUh2iYSe01vKYcAH
	 EiRQNzEtK5tKIf6j8E4MlHfl3jf8dNN03Hc5lbVcGvnw4Jda8WVhVo1oNXwJqApcpX
	 RpflSVlxikJEz+X+bPL3IK4vT/rAhmByDUcNfqz8ZRFSXPaUjxmkPJ1lrSk8VVXwtt
	 q1RnPDMxR7G+ThyE+k2pFnJPuXnU9O1vGElAalCLXPIyy4wsDXwd5ZEigUML0BDXjj
	 qVLD+Sy9Pt/E4BE2q/MsnLjD03qq2T1D99uUJcaNHKDE8I25RHxUEMZBZf0IZjafkf
	 Vdu56iSZ33gYQ==
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-7190d9bdb2cso2882447eaf.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 06:33:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF1UmMuG617NX4DqMyTiTsI6zL8hpz0saGDJBRx3jj2x6jpsFMmjH8OGqClhs6ZiHVTw7ftzrj2k3Ht@vger.kernel.org
X-Gm-Message-State: APuU4Z+gLMjd/k49QkB54J206WM2N7u/RPP/hzpQonScHZiQeGrIKggj
	ukGd020HguzpspUaeFrV7PVPRI5aJPhjZjhJF6N8zD/PHPNWyRjP7R2sK1fiThlKycMf6tAd9aE
	zePAoTzNMZbP1b8Y7OuRb0cO9Dj7mURM=
X-Received: by 2002:a05:6820:c2c2:10b0:71a:facc:5a37 with SMTP id
 006d021491bc7-71afacc602amr779012eaf.63.1794839624591; Mon, 16 Nov 2026
 06:33:44 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-cs75xx-gpio-v4-0-ad80a944e966@gmail.com> <20261116-cs75xx-gpio-v4-2-ad80a944e966@gmail.com>
In-Reply-To: <20261116-cs75xx-gpio-v4-2-ad80a944e966@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Nov 2026 15:33:23 +0100
X-Gmail-Original-Message-ID: <CAD++jLnkP2MHE5MTggjqti2qxMvm=KCs+XeoNsrUtXbRSZfhFg@mail.gmail.com>
X-Gm-Features: Aa3M54rzZJA3A38fzb3Px9Gx86UMNQxM77NnKlrXCliGaLoeMKhrWBrxmYmn9Sg
Message-ID: <CAD++jLnkP2MHE5MTggjqti2qxMvm=KCs+XeoNsrUtXbRSZfhFg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] gpio: Add Cortina Systems CS75xx GPIO driver
To: filipp.dunsky@gmail.com
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 3:08=E2=80=AFAM Fil Dunsky via B4 Relay
<devnull+filipp.dunsky.gmail.com@kernel.org> wrote:

> From: Fil Dunsky <filipp.dunsky@gmail.com>
>
> Add a driver for the GPIO banks of the Cortina Systems CS75xx SoCs. The
> data and direction registers are handled by gpio-mmio; each bank has its
> own interrupt with level and edge triggers, both edges are emulated by
> flipping the polarity.
>
> A pin only works as a GPIO when the pin mux in the global control block
> selects the GPIO function. That is not part of the GPIO controller and
> is left to the boot loader until there is a pin controller driver.
>
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>

Looks good, use nice helpers and all.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
