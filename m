Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3427A4C8FE6
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 11:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790164061; cv=none; b=eFNt/QUxkTKB4ABlm8d0hB2go+yLpwi8NWmbLmALOYuJvPdR3f3cK0U6dMsLRi9oF8cWa6th+wE/4qBdwW890EwFRXnBphc5olnPch6j1qdlYMrcu8rcfjFh5J1VN76QTNRtUmznVf26mzdTC30fIIkER42YVz+5J8PjwBXm18M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790164061; c=relaxed/simple;
	bh=b4JaTkwpgWpFvEutTKRNoLeVewrcW54SZ1KMcM37Cts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P7QfxKuQ0KtpfEZElaXkpUYJuDSp3no+fJ4ChfKAWyKUd1WPPXZZ3me10ivoJ1ZpQjfayVnLg1xmgJjSjjAa0eyVlPUCbR+LC5BOqRD/ZNFBps4sTYTVFJ+q3nn4zcBOORaMVI4ZIwaHnjBlae1yRnStHS7+OLWraoO7PAWU0GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-982db8d3ab8so413653241.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 04:47:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790164029; x=1790768829;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j73mt4KTqGgT1ctt3j5CbTFsrU2/qf0J6FeV5JjO/3s=;
        b=JTsJQK9Cqu9/XYks4xQpZ93dJUg7+Z+ZNQl1JFqwnfjk8yEBNnrUnp65xO30Drps3a
         tjEi7MZDRp1u5DQma5zLNOp6cZUsQnButPA+IiWaxPIhLORtmxvUR9KOrB9i17gFc7ug
         RdVkJw0/vKMhWyZsvM/7Md0mejSTvrl1MxPi+l6SqA8RkDp44GanisDsiiZkGSO9eJct
         Dn2xzvUU5MP1hkuMt2or4tCk7k2BKXbUD2ws+V1m7bz5Z1u5rltm/rl2wW9SyKeiO66b
         E8hJloksBvB08tbqdAeonG7+P/MELvzOCmlTcp2ER/SeFvWtlRdfTc3+n2nRH/V4a5Uq
         1g7Q==
X-Forwarded-Encrypted: i=1; AKwUvBy72ZzXIssaprDteiUCxic5fR+TWykxGZ/ec5fTITcgVSMp4/Lpvyelv+w7jiD6SfbGVWHa/v3NDkso@vger.kernel.org
X-Gm-Message-State: AFuF++lIg2uRgmCpqFa+gpi9P3B3GE1bsIbL891Dy0P8gjPoU6XRsOQy
	TUaCfF4x8rJ9D7u8Mowr93BB3oKCwWdTYtsCnaQBfseMPkDcBqAP3fJGAvUGlVxvpmg=
X-Gm-Gg: AYBFou0yxKu5XTTiLOQV2uMIE0JoaGZGx2PdjAJTXlZDFpMBMgo7ALLH5AVB8KGZlNw
	kUf75AZayaBbQJ8uM7wWilsyKcgCbHh+yTrhNBY7WHXeX0XJlPL7anPKRxtAG51xat8iWrVFJrJ
	Y2EjoKZz5WC8h5PDAKj3B1qLdL30bl8Gl41lsAv0mrvRrF6HcrT/0ocuCMfEK62++ZKyjJ2uw9k
	t/Ii3fIYPe1R81t//eBr3GtF0ogvgvA7eGv1QKuKywegqU6NEn5PoGmvJfZo+BJQuqD6u9+lqWw
	f0JRLFLe5yKvf2p1sdYXW7hTow3DrOuOd3IThpfT3h0Ja8NrWI/LAWXfgJUOeCQRl1Hi4P8b43q
	MS5udv8fxxBRhRkkA5fCYtbI2OUW8kmDcJTlLEykkC9MopIgGloZtROZaBJTxy+toDUtRLHaVhH
	PeICpDJ1GAm6BH889iPjE5vxBFyF8f3UY/yaLMItU8gb9WDVLUDc8WJ3ZNsSC6bj8B/De7hcDhB
	Tf+BRwjETB7mIyUgi6Cu31H8+2WD1IZhLWz
X-Received: by 2002:a05:6102:5e93:b0:7a7:19aa:8a88 with SMTP id ada2fe7eead31-7ac1d6f297fmr2022879137.35.1790164029382;
        Wed, 23 Sep 2026 04:47:09 -0700 (PDT)
Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com. [74.125.227.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-985167e6fcfsm3225822241.0.2026.09.23.04.47.08
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:47:08 -0700 (PDT)
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c979c5eca8so624430e0c.2
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 04:47:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwhgdmEsZLDLqiz0G/w3yUNdTj8wBs8vjI8yrKTdBzpoBuwjdqWnUnMBFtQD4lNIE7XJPRmHmmoNUbz@vger.kernel.org
X-Received: by 2002:a05:6102:808e:b0:7a0:eb9c:dcf5 with SMTP id
 ada2fe7eead31-7ac1adf33c9mr2261613137.10.1790164028588; Wed, 23 Sep 2026
 04:47:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com> <20260921134432.50338-8-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260921134432.50338-8-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 13:46:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXMbponbT-u+b9YHUmvtssqxy0SybLF8BK4X+HXo8UcLw@mail.gmail.com>
X-Gm-Features: AclHuK_gLjg0SwxB_0NLKlTjLc_iXKtb2rGaVrXiIGYcW3acp--qIo4xNm9u0MA
Message-ID: <CAMuHMdXMbponbT-u+b9YHUmvtssqxy0SybLF8BK4X+HXo8UcLw@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] arm64: dts: renesas: Add initial SoC DTSI for
 RZ/G2M v3.0
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Ayman,

On Mon, 21 Sept 2026 at 15:45, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Add initial Device Tree Source Include (DTSI) file for the Renesas
> RZ/G2M v3.0 (a.k.a. R8A774A3) SoC with basic support.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2:
> - Updated include path to CPG, SYSC dt-bindings
> - Replaced underscores of node names with hyphens
> - Updated licensing to "GPL-2.0-only OR BSD-2-Clause"
> - Added soc: label to soc node
> - Updated register sizes for clock-controller and reset-controller nodes
>   to not use odd sizes
> - Updated register size for system-controller node to not have a leading
>   0 in the register size
> - Added Reviewed-by tag

Thanks for the update!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a774a3.dtsi
> @@ -0,0 +1,302 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +/*
> + * Device Tree Source for the r8a774a3 SoC
> + *
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/renesas,r8a774a3-cpg-mssr.h>
> +#include <dt-bindings/power/renesas,r8a774a3-sysc.h>

Will sort these while queuing in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
