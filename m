Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC4B3D9DC5
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 12:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777550985; cv=none; b=Syyz9mKYJd8JyUcShiqwpzLFNR4CPH+cDPvkhTULz/tcfAKIP9pMPmJoxkiGqMOwMz/8Q+o7+bDaZt0OOmKmfb0VPyXgTfQN2DMhl23Uxjn2Rez3ChdfMMzDl/W5G5EgxYdhNJn1yFYHTzmW8/0Kzjonima62FyR/aqS82bJl+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777550985; c=relaxed/simple;
	bh=WtRpYo6GDoysiCnEePvP1nlxfoacNG5k/WFMHKRYaMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l+Tq7yblAL5ahYldQRAFiGa5lTG2pLmJLtgTOrdWD2OKllLlCK2N+kcXJbkOHJAZcsmf30IyIUECKKWmB00BqyhJcANNMpKuU8Oi+/QqlOnOon2eG96Rx2pc/CMSW47r8w+Z9QcPJtTajFnag7UJBh7m9ne14/sUp6N1cJLmf6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zo3ISrqX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zo3ISrqX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D8E9C2BCB3
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 12:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777550985;
	bh=WtRpYo6GDoysiCnEePvP1nlxfoacNG5k/WFMHKRYaMw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Zo3ISrqXmx4KRCyb7V2B/kmrDn28YuyIykWt3/qFfXtEX95v8Y6PCnpFMav1nWJwX
	 4MQjyAIPqdGabwTRspYrHVJjPZyqF4Sejd1CBjHDuHeSVOoZCT1NihtEcx0XayygGz
	 lpP0Od+pftdmAWks140AVjDhKYvi9EhxbW6m9oKGaJZP5StL5w7tjqDIUnLXYdPyT4
	 QYFD1TNQw/vno/Hv+wCxTILmOomqnz2Vx5Ja1+8JK6wvLGx0Ks1rwrjou1QtgPrWwY
	 LrQFSS3fawHlpSgFeqafuVS199ZHxTabxkkDZOIx4Wo2SWdVSNuR6/JuegWMd6AX9r
	 /yPWUOeR43RrQ==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38ce0ab821cso8109821fa.0
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 05:09:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8K9F6kiPZxk4Kx+saBCYk1t6Xjq1r+lE/emasZV+pSeQG12LL1iEvDaMhbuUDgB7sfiHUCB5ewyZ4C@vger.kernel.org
X-Gm-Message-State: AOJu0YwIjwmeRlcIKiJ5/EL7kHdnZn5MkOFsQHxPYKs++svFAzjhOG+A
	2/JDcaccuBY8LC/kWS75ygr+o+LZy6PX89/0HZhxWN+Zd+CBPd5Y63pg7quf8NaQ6+F3wjNVGSa
	0zeHmkOodFrg0YThp9EJzOOkrdy3D4rk=
X-Received: by 2002:a05:6512:2396:b0:5a4:6f5:6c4e with SMTP id
 2adb3069b0e04-5a8522d4faamr1002483e87.19.1777550983920; Thu, 30 Apr 2026
 05:09:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776872453.git.happycpu@gmail.com> <20260429035134.1023330-3-happycpu@gmail.com>
In-Reply-To: <20260429035134.1023330-3-happycpu@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 30 Apr 2026 14:09:32 +0200
X-Gmail-Original-Message-ID: <CAD++jLmOO2UmBUx0CseCnrK_Dyw1O=MbeXzOmvuvSSnN12Vchg@mail.gmail.com>
X-Gm-Features: AVHnY4Jr_k6fY-XfEPOL5H9ysXirj6oKMgyfrNTv5wAAO1433JVOLOacEMDqr_g
Message-ID: <CAD++jLmOO2UmBUx0CseCnrK_Dyw1O=MbeXzOmvuvSSnN12Vchg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: 74x164: support lines-initial-states for
 boot-time output state
To: Chanhong Jung <happycpu@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2026 at 5:51=E2=80=AFAM Chanhong Jung <happycpu@gmail.com> =
wrote:

> 74HC595 and 74LVC594 chains retain their output state from the first
> serial write onwards. Today the driver always kicks that first write
> from a zero-initialised buffer, so every output comes up low until user
> space issues a write. Boards that rely on the chain to drive signals
> whose power-on state matters (active-low indicators, reset lines, etc.)
> have no way to express the desired initial pattern via DT.
>
> Read the optional lines-initial-states bitmask, recently documented for
> this binding, into chip->buffer before the first
> __gen_74x164_write_config() so the chain comes up in a known state on
> the very first SPI transaction. Bit N maps to GPIO line N (matching the
> nxp,pcf8575 convention); on this output-only device, bit=3D0 drives the
> line low and bit=3D1 drives it high. Property absence keeps the existing
> zeroing behaviour intact.
>
> Suggested-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Chanhong Jung <happycpu@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

If more users of this appears we can start thinking about brining
the support code into the core gpiolib but for now this works
fine I think.

Yours,
Linus Walleij
