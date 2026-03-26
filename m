Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF11371D10
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 18:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774549457; cv=none; b=TkYU72uZahGneUnQTA81yos2gmc/UEEqNfTQKqkY3YvL6u/lJ/UG/4XgbXxkjUilLVoqDl65f7hTsjo+4vMLjy7bttHmomcHjo2mNSRkRFs4qRrHFA61I7w88M9MCqPq9sd3a63mObjkfAZGSOcFSpgtk/3uztJHMlK8sUp5cNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774549457; c=relaxed/simple;
	bh=tO0kKqMcHiRW4jgj+xRAYt7gnMl3D/ehWiA/z8rWMQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eFK/pkrr6f/9JZ40NSllkaL7BqYkcJ2aiSUb52R/jle7yXEDg5DRM+OUm9FNyUqLHNMBSBfh9gLExa20e7KWR3zKx+4dN3H9ZylP4k/68G/YjfCsY+C5apy9wYJ5BVXEUAgDhNyDvfLuKi3uz2V5+Y6LvQmNuVZv6we+OKt2MrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56a9076813bso740553e0c.3
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 11:24:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774549453; x=1775154253;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bj75loc1E52Z/CUJZse9tw6FoxbOVmuknNYD8Ky8Q+c=;
        b=fzeWVI2dONcGvgKH+w778uDHkpci0ECBTOEK3xvuVWqs2pa3PY+CgwVs5D6Mmk672Y
         vXfQYfk2YBwSYh/50IczrVz/gCuwLRWRQxVt33ES+MXXJv9dE2GXRaQjl3px8vwSMBt4
         RoZ5FZ3v29gU1sgDjgi0M5PaLRDrq3aJ3DiLIrHWjCD1qelujqfEMRd54SN8V5jJrtnH
         X6bubiaAicahLcc/OD8VWsUUYnOO5db6RH7DuZxvBFTNBVhYAUK0z+Cr5hzFYI1N5Ib2
         DYSrI4LAV7iowIAwwr8FrgFX0EEQVfzO0oOxJjzEW89G31Ahp0OgiGn4t38LNL4ZLJX4
         hbpA==
X-Forwarded-Encrypted: i=1; AJvYcCXpLg1y/Rnh/CMm5cVCHz2IrpgiGi+Em9a7qYPLuy427YsdO1wweRDIIzM2ckDQMy6SchNM+89GKBbp@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5gd6Uk5sM9fl3oR8Ug8cUts4a1ho3y4Td+5L5ztTmuuiUtMaK
	S5GUIMRjNbdxd7Uos0cUfUbiJtLxGd3dzyGJ/2GeH0fGkjFucKSGdr+0POp155SaKoU=
X-Gm-Gg: ATEYQzyoVei21qiaYDlTUoIrryR0iWMzL6lT7c3WbZosDvqY0DiKzxoLd32feMaT8G2
	fb82I5/Q6zXRut6HU6fUmhfCBm31qU6rY/L1EE2MtD4IS3VRp7F7vf6R5xb1qBCtYbb5a3J1Nag
	MSiCgkfZpjTv6iV+WJVNpvMwlqsW4NTdw5fP7KmeIU+v2cvO5Nl+dIz5b5DwzrT5w43xDE3xSlt
	/pscJXl8dnqcZ1/ayDOEHza9QQbnyn7QPXMp3+mA820ldmLeP2va4u1nCCKrPhhz1cD4/Txa9im
	aLbjFxZSd8bffktVwz0WE+U3It/+QcViAKrwn+wbQ83yPi0IjmpRgVp4wy/9KwpSoaF+D/6b7gn
	UvBczvQKV4EjqG3p6v9dVHxcOGY3nb17XLiw//ZmFFel5mA9SIs9/3pyATvllYsHmG/gS6eDDNW
	Eib36OtObhN3uP6U9dfglsE/huzTu3X+XC6mSK8qGsimfbAg7CFbBEldUMVEtOsBIU
X-Received: by 2002:a05:6122:6594:b0:56c:d757:a045 with SMTP id 71dfb90a1353d-56d220616ddmr4278570e0c.9.1774549453431;
        Thu, 26 Mar 2026 11:24:13 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d31d3851esm5132920e0c.10.2026.03.26.11.24.12
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 11:24:13 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56ba039eecbso510413e0c.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 11:24:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXAd1owGdr5ESpMGjCnr4eVjxpRl3dWbeYGnjMwOcOhfUMLvBny7lnwB2W/t7FD889nB52hywJn4S0F@vger.kernel.org
X-Received: by 2002:a05:6122:6594:b0:56c:d757:a045 with SMTP id
 71dfb90a1353d-56d220616ddmr4278555e0c.9.1774549452747; Thu, 26 Mar 2026
 11:24:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324114329.268249-1-biju.das.jz@bp.renesas.com> <20260324114329.268249-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260324114329.268249-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 19:24:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVjLuAWrADbKY9QqD4MY54G5P_jaU4=4aHTeiZXaoR67w@mail.gmail.com>
X-Gm-Features: AQROBzC_p1Kljv4QwMsHpFr_0owHvWZf4w8nt4uS54T258NW1gw6G16asR7xggw
Message-ID: <CAMuHMdVjLuAWrADbKY9QqD4MY54G5P_jaU4=4aHTeiZXaoR67w@mail.gmail.com>
Subject: Re: [PATCH v8 01/11] dt-bindings: clock: Document RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Tue, 24 Mar 2026 at 12:43, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Document the device tree bindings for the Renesas RZ/G3L SoC Clock Pulse
> Generator (CPG). RZ/G3L CPG is similar to RZ/G2L CPG but has 5 clocks
> compared to 1 clock on other SoCs.
>
> Also define RZ/G3L (R9A08G046) Clock Pulse Generator Core Clocks, as
> listed in section 4.4.4.1 ("Block Diagram of the Clock System"), module
> clock outputs, as listed in section 4.4.2 ("Clock List r1.00") and add
> Reset definitions referring to registers CPG_RST_* in Section 4.4.3
> ("Register") of the RZ/G3L Hardware User's Manual (Rev.1.00 Oct, 2025).
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> --- /dev/null
> +++ b/include/dt-bindings/clock/r9a08g046-cpg.h

Missing "renesas," prefix.

> @@ -0,0 +1,342 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> + *
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + */
> +#ifndef __DT_BINDINGS_CLOCK_R9A08G046_CPG_H__
> +#define __DT_BINDINGS_CLOCK_R9A08G046_CPG_H__

Missing RENESAS_ infix.

Will fix accordingly while applying.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
