Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com [74.125.227.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD3A318BB5
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 13:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790083150; cv=none; b=tZIEdeKqgbqERyGcch7XncLNg1edA+JEelAiJC5PlbmAscJhUha21SaZ3m82HnqxWne6voZaHVxR0NvmOxUtjlRplGUKv8uwiUKpwT6PXUg1IbGlrw4J9fW4tPzsbv7ivPk/5nyrsFv3OSv5Vt+WhKFy6kuVJMiplH0a5w5Sf9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790083150; c=relaxed/simple;
	bh=cL+fI7yP1z+214KskulSw5sR9ItYHUC3I/G1UL4DIWA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MmUdlrI3i3Mpy+JkCIFKyyqi8CZLL2GKaR2oR0vc1gNiSUa8EtOvUOGoWghMtt9BWx37Xdzfg7NCSpCm5HqN7cQdTwnTLziNiaFEqQFXoLzfoSxSYS/Z0x8voILCHouaKkMkRcP6fzWVFJLODEoNj/RDSN6yDhcDB1R6zFUteo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f40.google.com with SMTP id ada2fe7eead31-7ab11c26693so303915137.2
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 06:19:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790083147; x=1790687947;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1bNH0lrL2XpOj9M8wxgD6IqfQ0UbYYfZkklr2oZ0W2I=;
        b=aH0i+cR6bdy46YKztf9T3vg9UELRs+bfqLZJC+nRBP3aNeNOEwVLYgqm6oYX4/zoj6
         9rFmKJGbOdTlhZZoLj5xT725TE7QMVT9qfIjEfZua/15DIVi7JMw6u7rsLq6QjfIYB+s
         l1APOz++NwoA0qFu3mKuj1hUBOfG/7Tw9xLqRyucMoOp/C7d2YwM7XVaQkXjwiTgXnKv
         juhoQZQW2wI4AZxrKx+HDXT/UDP/CPfgSroAeZGTheXpLCRKY/Kw19X9pVhFw8c+UjUV
         1HqG7DGl29NiXtWWBFZtqF29JLeYJLq6S+O06mIMF/p6mgWEnjsPuq+pYSifASedAKJ9
         VlHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEs2UnKwV75/O3YcPjuDd+arlg7bhl6w+JGce35N4myTBcOP2wWjC5/dyGGGjWkE+BunRwzWmuIDRZ@vger.kernel.org
X-Gm-Message-State: AFuF++l1n4n7aSEiSjbEWPF3QLHC1734cPLgFnzAF0lPIMJRiiJYKyy5
	VorO8MVEFF4JW1y0NmLUv4BNU+NG1Jr3Z86N55lSPxJAgjxiyxaO16CNWaQVHnwn
X-Gm-Gg: AYBFou3WLxb9dlLiOrzKHN0Zo29DxmFu1BucEv5Iqls9DAO30C72mp1rlr1DeqRILKI
	CYKOyaIsaq+Ocbz+/rCYP7ofko3H5dYWrhX0BMxpYNQ8DLC0W3z/UN+n4QM53buHBY7PMd+alQn
	JNkUykErIZ4UhE7DjLEDoSWsy+IaI5RY7tkNobsTwTrziNpyP+nA9uV+Rv7T9LDXj3bZfa3LUrI
	lQlJAdIFzE8PgJCtdgN1PkjNC0c0Z+ABAPEWFuDvUwYDAyL32tnEYrYaK0W8jsoyWtf2jvd0kho
	6y3CnxxOdACw4ECxI2BUUFuPfi5fuyOaKnZhp8skN3QaLl14ao/3fKufY31/9tcDZTuEOWO+6WH
	DR5Fc5d7IjTFY9+ESRivZiqllU3TxDv0PQ/NtyO1EbRf3t4bdS9hd9KFz+EEY5Zvm5MlORX2Fkx
	XJVU0GvAowq2lpVbF9wR8PpQ27oZCuyieFdiE/CAHhSImExW2XT2gv84PgsjEzrDw85oYYY2cGW
	AuCyK9T4TBkDPm9hCh88ld/fKp4D3VuC34w
X-Received: by 2002:a05:6102:5cc2:b0:7a7:1b62:2d3 with SMTP id ada2fe7eead31-7a71b620fb6mr5763820137.37.1790083147626;
        Tue, 22 Sep 2026 06:19:07 -0700 (PDT)
Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com. [74.125.227.40])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ab17a0cc11sm1694992137.4.2026.09.22.06.19.05
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 06:19:06 -0700 (PDT)
Received: by mail-vs2-f40.google.com with SMTP id 71dfb90a1353d-5c9d8b323d9so1313540e0c.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 06:19:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzc6B8CL1RUvNSxIWWDRvozk/7+v8E3ll8wJx9WMvB4B/UBuC9buwbpoPpBXMPWo6IT8VzQBQJJaJdV@vger.kernel.org
X-Received: by 2002:a05:6122:468e:b0:5c7:9445:f468 with SMTP id
 71dfb90a1353d-5c9b58a57a9mr8626707e0c.6.1790083145505; Tue, 22 Sep 2026
 06:19:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921232551.3129244-1-robh@kernel.org>
In-Reply-To: <20260921232551.3129244-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Sep 2026 15:18:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV7D4RZ6zA_0jBqnCz8gee2=9bbNAXETbbNQxANhJ5pZg@mail.gmail.com>
X-Gm-Features: AclHuK8ei4T-jqiTZlN6RJORisuwZufxDS4cn_ittDTbFNHhpoPmq30pEuWosgI
Message-ID: <CAMuHMdV7D4RZ6zA_0jBqnCz8gee2=9bbNAXETbbNQxANhJ5pZg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: renesas: Allow power-source
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

Thanks for your patch!

On Tue, 22 Sept 2026 at 01:26, Rob Herring (Arm) <robh@kernel.org> wrote:
> RZ/V2M pin configuration nodes describe the I/O voltage with
> power-source. Add the property and allow the 1800 mV and 3300 mV
> values used by the DTS.
>
> Assisted-by: LLM

Dear LLM: please consider the actual driver source code, too.

> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

> --- a/Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-pinctrl.yaml
> @@ -73,6 +73,9 @@ additionalProperties:
>          bias-disable: true
>          bias-pull-down: true
>          bias-pull-up: true
> +        power-source:
> +          description: I/O voltage in millivolts.
> +          enum: [ 1800, 3300 ]
>          drive-strength-microamp:
>            # Superset of supported values
>            enum: [ 1600, 1800, 2000, 3200, 3800, 4000, 6400, 7800, 8000,

drivers/pinctrl/renesas/pinctrl-rzv2m.c does not implement support
for PIN_CONFIG_POWER_SOURCE yet.  So I'd rather not advertise the
power-source property in the DT bindings until the driver is fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
