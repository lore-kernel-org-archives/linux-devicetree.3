Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FAC37BE7F
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 08:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783325806; cv=none; b=V/MivtYi469xAjJG7XsgSpVMe7B1VCYt4vhn81lpcIC+u9hyjOlkRMC044MwTnRObjOntP9RWYWUo2XEqJh1iQrgQrsA1GHiYGM47iD+wjplcqOha79gIkhH04foVxFcVAPFqUU5f+U63JhCT2c/pogQ4pmUAnFFJQg3jaitaOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783325806; c=relaxed/simple;
	bh=KJatOBmAq352QrXFVmfzjgc8bnC88IRW7JAIsO6hyz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HHtXhGnpzTdd2UyClxZTE8z5jHgiNb74Sd/302I2J/vf/gv10jsogAYptVv0unb4ij7h9J3Ohv6CUxgbK7DonOqu7LywEMX/ZSF7RjDhVKNFG7USDjXx7TQE5q9U10i2MoMDNkPYV5mYvFgicZ3gDAo71orrLTtF6SBMqcc5oeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5bbc717c52aso749079e0c.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 01:16:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783325796; x=1783930596;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dbFPkCHMyK2cMipYCshkg+R5wrSHUFxUQ6/ZQ0r9elE=;
        b=noEt9a1KVo6jrZi2xtBL1a0ZtpoLAd4fWyhNeN0v5SbMe+CwI4r9VjpR+M251r8wHP
         VygN5FGLJ92uJcw1F26jIKsY7HGM/vcVHAkYErqw3iNd3SsiEuOsm/mZa8WDLwan2hfu
         GQFPVli/5exyPoc73ESpTxDrkzG6fFxnVDDlscnZ3NNM60ysjVNnBAEYUk4AUNI+0W8R
         Z/iqoMRboI/7PCFU9Rqf/iVuH6yQpwsRFywxVlkUYMqoRScrygEXSb77z/t6KHrg/Zw1
         9MwHnmGGdbqQxSeAdz54bTxJjLI1+zT4a1+U5GjrcfUotzLl3gqljNOLQD6AVIibI9ay
         SfBA==
X-Forwarded-Encrypted: i=1; AHgh+Roaknr7/633+zCxQdFV4/cFqGpOS/1Pj1DCiTDA9IfCe/XOYpcYkQd8hKksI6WoT1XjI/hRQeB/j5Px@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc7Q1PF31zHxQKyvK+cicTkCVBTYK30uZEJmDL8Bnn+N7OGT1x
	EMFryoTBc5TSVe2gmXzAfx85W6VZDQEGz/OzD4asixnj39Vw0HvGYJ/Mtyp1s+RO
X-Gm-Gg: AfdE7cl53ZA5AbDAHXbEDc92MnEWhWXClST1NxadD0idJBd/QoxtbS4AzFiFwzqRAzs
	4v0g11Es+xsabKmUsfJ1pbfYWwIbWQer0tbPLsepXTayhsTvqpz2EKjW7mTumK2uwL5zPUaVWq4
	3GaSIEHTQd+2G4SJye8TJ7SK563Nb8pZoEGUHq+tFqBYyQcQky/tH4TS3dEQjXel9U8ct8zvL1C
	jTE3n6x2vaPZtlAN8ymJojdbC1l3YereLw+qCgM+RFEUgnSggwcJwoW8pS/3xpPrc4qjIneufgq
	n5qrqiMlmjCGBMlRybJv+v16wjTOGE+ntTZOcrk3wJ9/DgdXTaaTShpO9kP2UDTeQprzb05zfPV
	zti/BSe8LX5SHCKjrECJsefZz/lII7QCj6roiP1z7PvZET58D9XnGpr96yyQxFjoQpbDZqLjYv/
	IMdUseXCJ7xlkTiTgNWHjXKyYGI+GCqrY7DzjxX8TDFvyMQk/3ui4B2g==
X-Received: by 2002:a05:6122:6d15:b0:5be:2177:70b3 with SMTP id 71dfb90a1353d-5be21777e9amr1915426e0c.10.1783325796092;
        Mon, 06 Jul 2026 01:16:36 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5be02c74ca8sm4421329e0c.15.2026.07.06.01.16.35
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:16:35 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5bdff8c02b2so725612e0c.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 01:16:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqnkKvoWfNyBk48s1SkXrTdfH+D57Tc3PkCIRV7l9aqDiuMda2zpHGnquXaqsuYqP1Z3qsAZdAKWoKZ@vger.kernel.org
X-Received: by 2002:a05:6122:550:b0:59c:b1f7:4df3 with SMTP id
 71dfb90a1353d-5be102ec434mr2809370e0c.12.1783325795169; Mon, 06 Jul 2026
 01:16:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260705213542.28987-1-laurent.pinchart+renesas@ideasonboard.com> <20260705213542.28987-5-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20260705213542.28987-5-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Jul 2026 10:16:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVtK2qKHLWfyWYaPx1cYgmF0jtzh3CAPrJ4QbZ0VxypXA@mail.gmail.com>
X-Gm-Features: AVVi8CfGdsdm5FTOvhTH4n31WpQq9-pZfeJYTHCuuEYLuLxyLezJUgX-zWbA-go
Message-ID: <CAMuHMdVtK2qKHLWfyWYaPx1cYgmF0jtzh3CAPrJ4QbZ0VxypXA@mail.gmail.com>
Subject: Re: [PATCH 4/4] [DNI] arm64: dts: renesas: salvator: Add overlay for
 Dell P1911 VGA display
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

On Sun, 5 Jul 2026 at 23:35, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> Add an overlay that hardcodes the EDID of the Dell P1911 VGA display
> connector to the VGA port of the Salvator board. This is meant to test
> EDID hardcoding and should not be merged upstream.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/salvator-vga-dell-p1911.dtso

I know this is not meant to be applied, but nothing below is
Salvator-specific (except for the comment).  Hence this can be applied
to any "vga" connector, and I'd rather drop the "salvator-"-prefix
from the file name.

> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Device Tree overlay for the Dell P1911 monitor connected to VGA port of a
> + * Salvator-X or Salvator-XS board
> + *
> + * Copyright 2026 Ideas on Board Oy
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&{/vga} {
> +       edid = [00 ff ff ff ff ff ff 00 10 ac 74 a0 55 4b 55 30
> +               2b 14 01 03 80 29 1a 78 ee ee 95 a3 54 4c 99 26
> +               0f 50 54 bf ef 80 95 00 71 4f 81 80 95 0f 81 00
> +               01 01 01 01 01 01 9a 29 a0 d0 51 84 22 30 50 98
> +               36 00 98 ff 10 00 00 1c 00 00 00 ff 00 31 57 4b
> +               4a 56 30 41 4b 30 55 4b 55 0a 00 00 00 fc 00 44
> +               45 4c 4c 20 50 31 39 31 31 0a 20 20 00 00 00 fd
> +               00 38 4b 1e 53 0e 00 0a 20 20 20 20 20 20 00 ba];
> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
