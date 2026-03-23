Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770023BD22F
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 17:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774285845; cv=none; b=UhLCoGc/hY5Bc14oNSU151LDSiPrWivNlt+n6I20UwGBNZ8HvluuWRfgBC/mFBcx16AX1heipz44sAHu1nv7/5bBcG8p3hCi5h0x+ioM1b+afg3aK3GOvaT/oueguG1q7Y1YUYs9ukGeDuSqsQH9JUQ+lQ5bt++8/GoQlTE4qlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774285845; c=relaxed/simple;
	bh=5wdgibwLF96dQBbZ/WtNrCZzbZ9lrlLtoVcZ8BLt69M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KeqNNeBevECOO2EOYnX3BPLhhLefDHhGnHG2Q6gen3KW33RNnrChif7pxeQzlgMO0pYHry0trkEUOQxDAsebTY/k7uNQNm3KdtlODWcQyjq8ffOT1Ik5Ix47FZRMPNef3GLCw94TEU9z7vI49ZFTDFCpHt1NdLy3oHTYsX2mixA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a277379151so2100353e87.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:10:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774285841; x=1774890641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5wdgibwLF96dQBbZ/WtNrCZzbZ9lrlLtoVcZ8BLt69M=;
        b=nNzGdlnbd9QlBkRkP4tpq7abnnAlye+AIu5yaBvMl5FoD2OHzjHsQ8qHGm6jMWu0yt
         pay6PhYmUCkcCUNTWr2XdLsXjX9tJ3ZgKyIbA/qDrjA/cVZI8c1rFdRt9bDGKr/x3xLq
         Oep5fvT/ttRfQDZRJ+RHFOKMf7UeOPyOImk0iy5pJ5jn9dEk5+9nfQFo1OUF0q2Y27/M
         DY5g572RvM0K36JmDA1I+Ssfl773/lNMFJGxB5I9qCKTU0+T0mvewQHj40CN4PR/VH1d
         dCYRDNCNERofRnQIZBVj0Ga3q/SSbHwxqBwhfL2KtANZB7YKIKj2EULRAXt/XESNSPnl
         tBew==
X-Forwarded-Encrypted: i=1; AJvYcCU6BYRrCrObab6IHebm4JLEc3odIWi1EHOz4IFnCTMC9mwYjkubglQTc+CyOVpvBKrpK9EFHhHacmzO@vger.kernel.org
X-Gm-Message-State: AOJu0YwQT2OU07Ab4ZSsu24IVJ3wqSyvlHu/g9ewRmmYx07Pr2zU1QX4
	iVdDgGA8YnBz70EhRrUkYq7wP7XGfkAqe0dFjX36jJCwkJbUbyBeGgZGA6loS5XT
X-Gm-Gg: ATEYQzzSISpcPE/BrtpPqrjbOzmLZUO9hWCOTwY9Rn4e6mgx8U/7pNX+o6EaVW/z+8g
	UYVcHFAhfEH++rwJ9fPWyOjg0IzvEJk/57uAAGw54NsMv9P4uqv8bBVtJkN+hz8i+PgntmVP0S2
	uuTUM4VG81P4PWZfYLWdFiHxH1Y3rP7Rp13MDjOtOUq+Z6zix75ZxAMT1RzDnkaFs7ZwbB//UXb
	deERr4WvISQ+MrlGOqILDuzFUZcJ7Q+x/FGBWxUYUlNxIOkUTk8WHSqyRupEYn3BNOCB4RXLg07
	txfAtM0PzM4FzYxbZOh7NK4ptI2UEiVXqO5M1qfmzYZQN1501F0LB7H3XbaPA90LxDGL7JyrRqx
	dI4BPuEEbn39A4hvygpvvV/9DsPSdzbWcvv7j+K9CpLLabj54b6KWGLBQBy/vOSAy+dSq5C1oZj
	GOBC2Cv9jb4qpfevrnvuMkNIKv4YcmbpvEvUFC/V7rb+66Fm7zROeosVg=
X-Received: by 2002:a05:6512:39ce:b0:5a2:79c5:a320 with SMTP id 2adb3069b0e04-5a285b042e0mr4448870e87.13.1774285840644;
        Mon, 23 Mar 2026 10:10:40 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28530cf93sm2582781e87.84.2026.03.23.10.10.40
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 10:10:40 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38bcda08c76so28383291fa.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:10:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVPcNwp6C2DOBpDYuWV/ZK83ah1bAwHi+Cqm8sCAJZrFNF9CX8I/RLeIqbRyWIEb7zewmGZ0e0eumAQ@vger.kernel.org
X-Received: by 2002:a2e:ae0a:0:10b0:38b:f110:aff2 with SMTP id
 38308e7fff4ca-38bf962a085mr30981391fa.14.1774285840106; Mon, 23 Mar 2026
 10:10:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323110151.2352832-1-andre.przywara@arm.com> <20260323110151.2352832-4-andre.przywara@arm.com>
In-Reply-To: <20260323110151.2352832-4-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 24 Mar 2026 01:10:28 +0800
X-Gmail-Original-Message-ID: <CAGb2v66j9vNEZ1_srapB9T2ASiTt5ERPfS24LE=aOKAMPt_-Ow@mail.gmail.com>
X-Gm-Features: AQROBzDk1tGxLjoHwtXmw1tvFQAdkXahJu6ZBHXleJQXSQSs109gwXgcaBwuezI
Message-ID: <CAGb2v66j9vNEZ1_srapB9T2ASiTt5ERPfS24LE=aOKAMPt_-Ow@mail.gmail.com>
Subject: Re: [PATCH 3/5] dt-bindings: pinctrl: sun55i-a523: increase IRQ bank number
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michal Piekos <michal.piekos@mmpsystems.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 7:02=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The Allwinner A523 SoC implements 10 GPIO banks in the first pinctrl
> instance, but it skips the first bank (PortA), so their index goes from
> 1 to 10. The same is actually true for the IRQ banks: there are registers
> for 11 banks, though the first bank is not implemented (RAZ/WI).
> In contrast to previous SoCs, the count of the IRQ banks starts with this
> first unimplemented bank, so we need to provide an interrupt for it.
> And indeed the A523 user manual lists an interrupt number for PortA, so w=
e
> need to increase the maximum number of interrupts per pin controller to 1=
1,
> to be able to assign the correct interrupt number for each bank.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
