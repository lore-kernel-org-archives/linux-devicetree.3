Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E69E45A287
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 13:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787665876; cv=none; b=g3g5ouktO1xXuPV0HV1de56WdC6mySISgVkGO4NScqzvFp6RM/+DYvSLigpbxyzv0alwCHmCed7SFRfy0EU4T2mQhAGLVDRDrDXh+J15/xdyeApqMk2sKoRraOp2UDyABEfV+s97tMb5KpUBUz0HcERAXyy8GVDglPBcuGh95BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787665876; c=relaxed/simple;
	bh=4Nhf7wYr5y5kOmehF2+mwwOUzZfIYgBl4L8KXVm9JcY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KaWlghHPvx8S6T/LNzeHfhwy+/dZy7CXkV5XIRDZOoiezvUTsMaLEbedJ8w9ZLmzEGi+aaunJI3EyZMm4c1UiZ2huadvNcHin/ubA1pQjHQwRPRTS0DIKRdmr3A6UD5Ur5LbM5jKsG8Nf6qx8WZcS25jmLpFYRrAlpNV4ZNtiDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5c5ac25089bso1750051e0c.0
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 06:51:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787665874; x=1788270674;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r3HqpL4LRyR8Q1Zvn+1cvkTShpZ++E7BIg5onQopH7Y=;
        b=GBY1rtX9Q/pP41y5ilGiaMwol+ocI7TzZX3QQHlYT9YtqWxQg9q1Tid+ZseBVJ2IqB
         k5eejYL37LO/errL4X5/CElk0SsGYMUBImNqFmBifUsQpNpU5tGUKTT8KnBGF5Y2mvhP
         026dmrcPL3pfFB1lDmr17kOn+9tU1K0sQM9KH+6zIT7oRfGd/WZg1GULOnj2C/+d46zn
         R1ogSkjUPi76k/0OVQ4s+7i0B32kviT4bSNB/+LI+pJiytW/Beq26WYZ8DawUN4+BQDc
         qbZSyC/kakZ69nU3RVeQ/hTa4EIEoS48sJaWQ2gDStAN493IfzHmV76fA74e/W37525V
         or7g==
X-Forwarded-Encrypted: i=1; AHgh+Ro06UEML+/7pXhH5nWZM5+ts+rJDQx9IeVcMJYmPEBI1SP3MNctLGsK84eM5Y1EO/Noc2HWu2Mwc1LU@vger.kernel.org
X-Gm-Message-State: AFuF++mEpoGTikZA+2cMLz6gho4kd/DcHSFdTPy3OFREi2yym5e/v0wL
	mmjFZW0PBqyqB9e9J0DpwAdzkbMAsv0cNu7XgGNbT4BwXwaYPLR44p2GvT96oJ56y3Y=
X-Gm-Gg: AR+sD124iAnpgtOCzRyWmSCdSYyhzLIl/uIscUDdOLArok6+OF9qfr3n7iHkmTEVbns
	edq5j0gtNDsHLTRqAhxTZUEdBkgTG+yuNLL9CAlV36eSrrWWyG31v6VXLxCj4LBMkx1xoR/pf3k
	1LDDqnyK1dKT4VrM+d1v6GAwKWkVk3N/phc4+VJGrT9oNpZsYb23qb7w6DyABL7/9SSCDFsWRQL
	YXo6hxVUXkTY0QBWfFwLJkwkQZadaiWoAZlL68K7sBVp/vUBT2Qi0p4Vz4JCFIdjC9FYMpSB/sm
	di618eTcKbq3aXIDjV9NAEiKLkodtfVfiPqqv2uco4G5tx2KALumEIXVWubJesBMabKP5bobBU8
	jCA0BgoMwe/ps0omomQYKW7x8/g/kFI+0s5ohDiKaC98q7Awn5sAtWPrF34UDrwUoFGkFI9HVmz
	er/U8XWwm3qcaX1DQeFD4B7EBIeAGNoZ/lMF/YxFJ60NTCVUGFYcF717M26wouvmvFH6UXi/1pD
	j6TuZpGbFSXil11ZABcU5wGUg==
X-Received: by 2002:a05:6122:46a0:b0:5c5:d531:2f4e with SMTP id 71dfb90a1353d-5c5ff7f198amr13071397e0c.5.1787665873766;
        Tue, 25 Aug 2026 06:51:13 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c632e87d61sm4527422e0c.1.2026.08.25.06.51.11
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 06:51:11 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-77bf892b496so912348137.0
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 06:51:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp3wQvYwyPYnyPeMDuvq73wiAmwd5KjnSAka2oVySOuDWF09P1OwlxSFraoqEuTkuizEoNrNWcsBD0d@vger.kernel.org
X-Received: by 2002:a05:6102:3ecd:b0:74a:b1ee:e034 with SMTP id
 ada2fe7eead31-77a63f3f870mr10636886137.8.1787665871110; Tue, 25 Aug 2026
 06:51:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714173315.1981708-1-claudiu.beznea+renesas@tuxon.dev> <20260714173315.1981708-4-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260714173315.1981708-4-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 15:50:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVBL30LN-+9e5LAVFCaK1y2BEr+VBs=sDgjLCgpc=kgyg@mail.gmail.com>
X-Gm-Features: AcwNN1VGPHnBk0TXWTegWV3RPljNeX5vHxO1DRox-RPTqr-v1ZX5lP4j3I-XFNY
Message-ID: <CAMuHMdVBL30LN-+9e5LAVFCaK1y2BEr+VBs=sDgjLCgpc=kgyg@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] can: rcar_canfd: Fix typos in macro names
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: mkl@pengutronix.de, mailhol@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com, 
	biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com, 
	claudiu.beznea@tuxon.dev, linux-can@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jul 2026 at 19:33, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The bits 1..0 of the Channel n Control Register are named CHMDC (Channel
> Mode select). Fix typos in macro names by replacing DMC with MDC.
>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
