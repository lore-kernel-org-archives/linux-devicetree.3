Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A3A48EBCE
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 15:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635520; cv=none; b=rEge9lgqqPapY8r6tysvKS2RraUiWXrOBAYLv9/XqAtZTVem6NiajHqXlO8NIwAD8J/MIXEdkeCm8N0vVqhmsIl5itCdNfqbyLa6dOs3zT5jQO86J+dp6YW3WhcLvGBfJHB6p0nDTH3qF/hORTFGVx/osY0x2Byky5YrplcZxq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635520; c=relaxed/simple;
	bh=k6S+nF1N46l3nOYZEqyctylLIW1t/PguGUfiU/kfXJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XSvXC60aUgzHJtpYPtijKJRAC8inlfzDUtsRubRFByCWDVdikZgA0ckvaDkmbWfkAaIew9pQERkTwYGXcPnBGylJC3knqPOuqNbodZ26U0Lg2q1PH0XcHp9q5TxsSfcuMmFpJBWH+6IGF133MBLIFoC43QLR/sstEsQacRXbgGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c20e70a0962so10354966b.2
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 08:38:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786635510; x=1787240310;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iQZB5Vbs2uVneosoReOIpi44y5pPlIBq+1BJ0pK0+A0=;
        b=rF4UKXra6pxjiJwnWnnzZWT5iREWKcAmGEvuz/MpyQtJAI45IBVoyAxn7EydjWY2l1
         621+gx0ZIYbEXJ5YyrGt0GuBKFo3rqRGwu0w2pgr+9ZYvhPabjJFhMZMoktcpn6tFRkk
         JmUTv6ypalgoiSY2dJAuq12Je7jOvgzYdcDSVLZLcnWcHmHMJbeQAJflAdGeLEzwOc8m
         HXUayE//kVv+yE9/nuEN6HaQokBYHIQkE14NeOyBfYmGM8rOX+RkTm0gm134g7waCI7j
         bWg/8A0LQtqZ8FyasQ/XXxhRVix8fYolm6izdw9eYJp9oBa4eii/XiL9rFIPyK3FIuFX
         dWbA==
X-Forwarded-Encrypted: i=1; AHgh+Rp+b1z3SgYY9omltW0jdkZcDIhn5ObKMuNlqRnvP3r1sSJ9vIdS1zsC1dSxRNn9JtScmKRguVIjKHuF@vger.kernel.org
X-Gm-Message-State: AOJu0YwCGv66JhhN/v3ZmMEvuSJLzqM0N81utN2rWIp2axxf6Qh3kgg3
	KR3ZHmyLikQ+O8xBW3Nk81cjmOMj2K312w+4imZy/dQaUIdLxBnETOLrTax7jjp945o=
X-Gm-Gg: AR+sD12OXh3z0Uz8AMyule+VNikLvYcWcxxmEtLVcUM/++eJroDA4XjnRBFYn9nuIId
	frd8e9KkayoLCC5oB8QGLJOuOw5ZHF+OrK3cgQkhRqbwZS3girnmrZtkPEDD1ty9OfwCwCbmjxx
	ZWw9VA8opIsIsV55u0v9s5SiNtcQC1564WPRZx7kPqxdbrImnRS21p7c8pj/tRJOrVStbaf1QLH
	EIPUP/AfeSSpvZ/Gvq2zguUO4ztBinIfaNsOwvlFUpWhV1F5O2fhucThqaKlxr4X4qMOdXGPgUh
	gJKj8JqDhS/13/GljeDAPNCwZExZU+Jfxc8fOlD22+gY0K+36if63FiuPD+/8oWA5lleF5nP4a3
	hBDyeRlzrw2ia0MRLPjRw6HoBPkgi9I+ZUvHESnrg53Li0LV0eHpk8VY04TMaCBRF5xkIQ1JIN5
	3dU4b09kBlEqfaNiCMTA+QDX7w7RRfwgS7BRrGjk+8HKE9fy1Rn7YyoBmnbhxCwLxsX9akh8s1k
	MhekXdMp7b3UIQ9QnEJqx5HlQ==
X-Received: by 2002:a17:907:d08:b0:c20:1bc5:7002 with SMTP id a640c23a62f3a-c2108f37913mr297528566b.3.1786635509505;
        Thu, 13 Aug 2026 08:38:29 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c21238700aesm4506766b.63.2026.08.13.08.38.26
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 08:38:26 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-698ae09e356so2944962a12.2
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 08:38:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr0gGRVv+4hRF5WVOx9yo4CTwJruYXFtLAyAvymR8rFPOEM19/+8LiaovKfgcO7zH0JolC6BwXdstLC@vger.kernel.org
X-Received: by 2002:a05:6402:a0c6:b0:6a3:6943:d64f with SMTP id
 4fb4d7f45d1cf-6a38057796amr3391764a12.2.1786635506209; Thu, 13 Aug 2026
 08:38:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710113637.1328000-1-claudiu.beznea+renesas@tuxon.dev> <20260710113637.1328000-4-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260710113637.1328000-4-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2026 17:38:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXx=Pc1jM-u54kJ+_jBJy+-hSX9r8wj2+grLDSfrCkqOw@mail.gmail.com>
X-Gm-Features: AUfX_mwU1q7iAxt-3a5e9AYUA8dMo_UbwN4uqhVMSa3bBY4klxKTW7hgnQosl_g
Message-ID: <CAMuHMdXx=Pc1jM-u54kJ+_jBJy+-hSX9r8wj2+grLDSfrCkqOw@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] dt-bindings: pinctrl: renesas,rzg2l-pinctrl:
 Document the missing I3C power source option
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, claudiu.beznea@tuxon.dev, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Jul 2026 at 13:36, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The I3C pins on the Renesas RZ/G3S SoC can be powered at either 1.2V or
> 1.8V. Document the missing 1.2V power source option.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
