Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F57B2DCF61
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 04:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778473336; cv=pass; b=f9JFdLTEbLU9W6MPdKID83Q4kgFU5e4w+EYyunXbst/pTlUHyoyHtf+Eej1urPpwGZv/drACZg3kDfhT+oPq4X2HL5RJI8oX0IhAubumipWr8Fj/zr6Njes0WDmxOfkfoBQIVpDJTkMrM9RwKN6asAtq/WVrhToGvvp/mtp3UzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778473336; c=relaxed/simple;
	bh=OeHacbZXrsMU4ngrgTltuf0nP+fevY8eP/EXHUfGj+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OW6GH7QPF2mQdTKk5145C69lgrlhABC2Iw25smRosZzk86C0Qnj3HszObJ+iBLv19ovHlEHFFaPoy3NBg9LgNMQCIvsQkK/INyrRHAgyvlpVjHyNws4V+EqT9xYDtkn5DXg/o8Fl5mUBswIU9hBTk6ThR4QJCxpTc1YX1IKXL+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a6u+AOg6; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a6u+AOg6"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ba3e3c4f87so35181105ad.3
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 21:22:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778473334; cv=none;
        d=google.com; s=arc-20240605;
        b=gqhsxETUo6GJI7jJ71Y/vbO3UzWdnMMahd/ePIsbZVBDgzO0wrYL/2P4wleTLEhMXA
         /F40YgvbmUm20pysP711BAx0yyNNVM6nv0pApI9cFccha3ExSrm+MzWMTIzbtJr2UPxo
         /XIjVeWVfCI7TippiK5Oez/4gCBYNc89xK8nWGlaeAGqUi9r+3AjLZEsx9YWBwaZW/41
         efUyON1oNi1WAHZZH2St2XqpVHP79udKqXd/ATeSUsmHhhD3L46Wa/sK+8XtZ7cFZ1Ki
         21q586SupITXpcMmr6HipgDKAc1WtF5hcMMKJjKdz/pj1oauCG+xCRHCkc2j94R6hqKw
         +Ssw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OeHacbZXrsMU4ngrgTltuf0nP+fevY8eP/EXHUfGj+Q=;
        fh=HJazYjLsz07nzHVIygog8hxFoWzyVubWMJla7Rlh82o=;
        b=Mlw/Dmnm+kLoImoy4Z/wqUJQs6ExlabElQC1yjnFrfZNLhOP4rTf/kED0+QMcA8LvT
         kVXVyI5b1gLcZ8oZamfZkEIm4bbpdM2EA5J0vAph8ed2cdjvHi+2WUP4p0rSNer0CQPj
         i5Abr4eOQf8IdGItExEUAydI1SbyTWfEDIeUWSJ0nq5hcHOaY6Bp5RfEw3TI1WXr+QGI
         UAarQuBe3xFs7n9n/Ya5Js0wgdkEgLZbbnzaNfvCU5QYEAXhX4dIl0H6mYhsiv3ksNDZ
         RRNPrkf1c9fACMPnLcNax92DpnEPJRhtIdaRytnuu/LkXzbQsLPO6454hxKx3OcJqYdF
         d0pA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778473334; x=1779078134; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OeHacbZXrsMU4ngrgTltuf0nP+fevY8eP/EXHUfGj+Q=;
        b=a6u+AOg6ryqMldY2LRUux9/1qorKERpjRkIZxjg7rDFY4GhXDD51OXd7JzVJ3/J93F
         5dw4Rjo6rBMa5KJH77oYlXuwpdYt7xsSF2LO9MddUZKzr9roG4P+t1FdDyB7+EnwkhX5
         xQVU9ON5K5SFgBQYueY8596R1H2+b/K3l3vWeUQx9kPaTsMIInFYxY0g4DxNKlImBFOA
         6uEVPdFTyQA9jHnnuNthxXC5GjXijtRbn5ScBm1TkUt6og68eFukiAb03B2TBkTwTvlN
         wsxaYz2ZLuUB+8MNgPPVEjpyUieNhQJylhexe2GPVBagqODc3zChPMKxGM9xkrQtcSbq
         ERAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778473334; x=1779078134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OeHacbZXrsMU4ngrgTltuf0nP+fevY8eP/EXHUfGj+Q=;
        b=d8pmTbx+69fI7G4mpBU2084h9L40fz078Ij97Yb4iZZh9fs7Qdb6sleoSD3D5wZJYJ
         XWvzPnN44jhSkvvyyJkp1S/gDF8IjdkvnAdsbK09WEi883QOZOps4U0w7+VdwAuLF0HB
         rEtq3IOQXt/EwRsLYcMc+4nIn8prZAEgyYKRge7bb5gDiJrOp1ZVV0Fzbq6nzeMYmRuq
         hFDpWl34p1JCpEO9LYbDOV78LWNNbgJ+nP3TqWJ2dGfBu55JoIQzEULGOUThypbhwO3D
         aPS/yVGUOdvRLKTDi+bZw5jUUpMV+lVqtxmhafmXLxyIdHntDlvtAWZKUE5jwQdPqplB
         kMNg==
X-Forwarded-Encrypted: i=1; AFNElJ8tJv6JmNbeLl1IvWdrDQkQ9usiH47cPtw9qRuDuAo7LhdsYMjfgCgYlUFOKxRQr8kCOLRKfKe+tx1o@vger.kernel.org
X-Gm-Message-State: AOJu0YwSFkQVf4jIBoGD2p4UeMFPYTKsLTfB8Nf7Vd6iwhK4+ZjU7f6O
	lV2XMwHJobO0Ckx0MchMOiWtvE1NcAeg6ZEngaowIWTtgXXpzrRfZkNgqJjk5BOEKRBQqCWWq/L
	EVtztpfj8MwMManiqewlhjUmGQZxP5Oc=
X-Gm-Gg: Acq92OENp1VUr7O96bUynPvcVSzSbOULZXKHQDvLmC28Ek5BwlCNxyj9v170uo3QQwk
	jaOH1GQbIfLgbQRRMWs4E2rJFsclMEhgTUSyymPOCHcOdqcJKbmELDdqbT/SRvGEcDPZ1j/jAES
	41kfDzUNEDfvkKBe5or1ZznCKXAzqNTvz6Vrwkq4tDlYvh6ZH+AdDk4WPGphpduFTVGNwejAOLX
	JXgPfHuvNHJI0pwVTPJX8mQIsMHQRKEYfbjw8FR5YzATx+bzw71jl5NO60kWmp5D4StxyvGSWs1
	9Ylf0aIR+dbE5C1UJGiB9kGxuby7iFcE9Bj7s4WE3HERp9d+brMBdER4ugw=
X-Received: by 2002:a17:903:13ce:b0:2b4:62bd:ee3 with SMTP id
 d9443c01a7336-2ba79c2cfffmr234513675ad.33.1778473334534; Sun, 10 May 2026
 21:22:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423042831.21114-1-phucduc.bui@gmail.com> <20260423042831.21114-2-phucduc.bui@gmail.com>
 <20260423-ingenious-psychedelic-jaybird-40bb4d@quoll> <CAABR9nGH4yZcgyzm=wNYVHB2vLhojZJSHKOC6dSeQPm0rbh4KQ@mail.gmail.com>
 <ce219aa2-0bb1-4a74-b40d-bd753f1a22dd@kernel.org> <CAABR9nHaGBU9KAWJZrnBy8HO0Waccp8CCGmBdKJ3QOEb8WZsXA@mail.gmail.com>
 <20260505211006.GA3875657-robh@kernel.org>
In-Reply-To: <20260505211006.GA3875657-robh@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 11 May 2026 11:22:00 +0700
X-Gm-Features: AVHnY4Ilmsly8mVMu2VKK2pF9rv7AIJO9kq9XO5ctET-fhRje978uj2nKP4vMgU
Message-ID: <CAABR9nHEVsS_Tf6Y7AXnLJwsDahwn+o1vS5dd27m4QLQAixL_A@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: drop redundant wakeup-source definitions
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Joseph Chen <chenjh@rock-chips.com>, Chris Zhong <zyw@rock-chips.com>, 
	Zhang Qing <zhangqing@rock-chips.com>, David Rau <David.Rau.opensource@dm.renesas.com>, 
	Animesh Agarwal <animeshagarwal28@gmail.com>, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob, Krzysztof,

On Wed, May 6, 2026 at 4:10=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> If this was a problem, then it probably would have been fixed already
> because it generates a warning. An I2C device probably isn't all that
> coupled to SoC power states, so boolean is probably always going to be
> used here. But maybe not.
>
> If we do any cleanup here, I think that should have exactly 1 location
> that reads this property instead of 77. Perhaps the driver core can just
> handle everything and drivers don't have to deal with it.
>

Yes, the I2C core already handles the 'wakeup-source' property centrally;
therefore, individual device drivers do not need to implement their
own handling.

While no I2C devices currently utilize the 'phandle-array' type for
this property,
we should ensure the infrastructure is future-proof. In cases where a
phandle is used,
additional firmware-level handling might be required depending on the
SoC architecture,
similar to how the m_can driver operates on TI SoCs.

References for that implementation can be found here:
Firmware: https://elixir.bootlin.com/linux/v7.1-rc2/source/drivers/firmware=
/ti_sci.c
DTS: https://elixir.bootlin.com/linux/v7.1-rc2/source/arch/arm64/boot/dts/t=
i/k3-am62a7-sk.dts

To address this and align the code with the core schema, I have
previously submitted patches
to transition the I2C core and clean up the m_can driver:

I2C core patch:
https://lore.kernel.org/all/20260505043145.33284-1-phucduc.bui@gmail.com/
m_can patch: https://lore.kernel.org/all/20260504050702.34013-1-phucduc.bui=
@gmail.com/


> It's really outside the scope of a device binding what is used for
> wakeup-source as that depends on the platform. So I think just
> 'wakeup-source: true' in device bindings is fine. I don't think we have
> to change all the existing cases either, but the patches are already
> written so I don't have an issue applying them.

Understood. I will update the commit message wording in the next
version.

Best regards,
Phuc
