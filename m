Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794308943;
	b=Dm5o52MSvUR2KFy1+M/WmBQwRZvw372Ku4wfiqmbyHI/SkqjDW0pMjKSxQeZHYvKP2uk
	 JJf2LIr4VaeegyUlMsWp2G9YrvC7PYx1TIOVwf5lmyOBK5jg+BA1xorZXgmM7tedA8gg0
	 irXtROoN3w90NVZO8P1Db/rN8FOlZstkiNLi1mIkoHEFTSTpGZvZo7RHz8A/pP/5ZJJUM
	 zNsATxc3QfVVOX10Mcb/CQjLPI2fwItIJJD6jG3zso5jlZFNWQTzswwVqFObm9EyIOG5B
	 H/ZUSSZ/M/GAhA0hIqhMVC1jHqCzVSUDuQuolwLADLJeU9BQC9LSDrC3bJz0q+/1z+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308943;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=auzMHF9mizeGPb4pIAKNV1dcFrP9ke4ZkvXnr9sGJcA=;
	b=r7UavGndmGWbVFJ1iU0c/MTOQBohs0veA+CmAdzfrh8JYh/V+HcBznwWVmEgu/Jk8H9q
	 NHBsHpDBk1BgMJVWnpKnkN7Eyki+rATBc1DFsI3Mj8sXBhxl15wvuV7K4T6MTi5k/afAP
	 pQVdfhattHJ77gTnxdJno8skUx7M1KBc9BQ3egrGHlfoiQF4X8qyh4LmG4IbjYaGZw87N
	 rCNnEUDqJQkhutkMJeUEyuA+Gw6DWjOToutlCYmdQcoNZDhCktmlBdtzVPDUj5F8+N0yj
	 UX8B/d+C9KLZvDa3nA+YNzSJAiA6iYBFqK4BqpPL5QgMB+2A9CFoKyaVuXYq8X8PFPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.44
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4090606A31C
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 11:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4090606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-97ccbba8e86so484130241.3
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 03:09:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308942; x=1794913742;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=auzMHF9mizeGPb4pIAKNV1dcFrP9ke4ZkvXnr9sGJcA=;
        b=tdloBvMsPAVWC7S/wrT9fmzF+BfJ8BRJGZVMUD6VCI2SPhxQl++hyFnxaIppi6jF7U
         0THugqv6pwc2P3zK5iKsqZJVQwavbN04R9cZzL989xGQ/XjpMxJFc/PBQb6curuVSytU
         rbvKJ4dLoQb0gkl+JRAuKTRgAOTF9+FlULXgjeBrFgo9iHcMAef+kwfJx6y3A2FYgGT+
         WP75oBoiCLQI35/6K8PWTd+ZFNbVjZU453cvbtba+OOt1xilwCYQIg0oJ5sLlLhGGynh
         TYwE0Io22Ecqy7Zhnia+hIxhT2pHS5vfBpDo32NskTRi6xeLYjpqJdI3VvbZSsn3FQsm
         m+tw==
X-Forwarded-Encrypted: i=1; AL+hErGw8tTHP479UHbrx6fJksrFJjMNRXYLht+uCkdep/QxQgwY468XVtCLYYPMyAf9h5pXGkv+kYHGkJ6Z@vger.kernel.org
X-Gm-Message-State: APuU4Z9UHygSN6oIyTihr8JtSZOdjx5MS7O4r92v8bu7f0EKRcFgLDci
	a5O32mK1Io351CKFqUye/ID/WCpjUoU5tYFlCkVUBBB6jQN+CC4xo3/xcrEG0jGrVIA=
X-Gm-Gg: AYBFou3k6W2wheM3zR0i/qP5tcEG4nKLvlk3YgehEpC5lkZdT9jXUsz8A/QuvnpGSoW
	XloYQh2KIqcnahTwEtnT+SkMG34cEAkFxlcQZk+cUbeN4X+KUhmMGiA2/UAZQhZRH1Sx/MkmaE3
	VjkVRbFMo4ajKgXytCllWOfJNZ5m7DCfEZT6oJ+amq1uMev/wnofsLu/1dL6f1le67kuFW7xP7g
	8jqX078KaoxdcR34djkf/yLreCQ+l9QYwRziCskG1gl/eUyTW9hsyZNns2YPt3qSfGFncaPANdn
	PeTJdrjBqQLjGDSpJ64LxX4hK/MMxAk1SkAavj0KaEpIbDg43KPj9hEYmCn1zJvI8pHY91Yb6lT
	dxFYNV3pwy9J1NvX8zcx1dF9R3Vb3VtIRY7/3YR/tAtje5BG16oq+hl2jVbruDX4/fzI0bEVkYu
	ijRQ4H30ebur0el98z2mE8iYlrOyqTtxdLDIdai5HGq4AoXpue2CnWyrxqwK6VfGy/GqEsGaE0V
	sATJ/qu5qP52nQaOfCjHODEZ6LJY4BFcDQKvIEwMt3qRbEhwIKatjhZyhekC4H7jMT7Q/0ZWPLY
	bPUGvopJeO0u/agjVqNKMMqEdlqeE3WCPDPcMuxxDrfFqcmwKRPsXn6lOzHtao2vibI=
X-Received: by 2002:a05:6102:448a:b0:7b3:7653:5487 with SMTP id ada2fe7eead31-7d301c3067amr588235137.32.1794308941667;
        Tue, 10 Nov 2026 03:09:01 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c1fec2818sm1549202241.1.2026.11.10.03.09.01
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 03:09:01 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7cc91ddf447so768314137.2
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 03:09:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH6CHpfH+6UTVO8r74daFmpaARFeRlfk/LtmZsmwDU7IFuxaVTjpSr5slNPB9Ug9JtCWgIwJ7MTDtqR@vger.kernel.org
X-Received: by 2002:a05:6102:688e:b0:7d2:d65f:b479 with SMTP id
 ada2fe7eead31-7d301c226cfmr561698137.28.1794308940907; Tue, 10 Nov 2026
 03:09:00 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260902141544.565763-1-claudiu.beznea+renesas@tuxon.dev> <20260929-loon-of-remarkable-romance-197df6-mkl@pengutronix.de>
In-Reply-To: <20260929-loon-of-remarkable-romance-197df6-mkl@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Nov 2026 12:08:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUE1Jh605kgj4ADU7p1UjE-0u3ydBehL_5wsQPbe1EPMw@mail.gmail.com>
X-Gm-Features: AclHuK8XmPD0hM0Yy0td_5BzKaCizARWIEsuGHtnTdehhY19YbtXTFG2NJSt-Nk
Message-ID: <CAMuHMdUE1Jh605kgj4ADU7p1UjE-0u3ydBehL_5wsQPbe1EPMw@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] can: rcar_canfd: Add support for Renesas RZ/G3S
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>, mailhol@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com, 
	claudiu.beznea@tuxon.dev, linux-can@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

On Tue, 29 Sept 2026 at 16:19, Marc Kleine-Budde <mkl@pengutronix.de> wrote:
> On 02.09.2026 17:15:37, Claudiu Beznea wrote:
> > Series adds CAN support for the Renesas RZ/G3S SoC. Along with it a typo
> > fix patch was added on the CAN driver.
> >
> > Merge strategy:
> > - patches 1-5/7 should go though the CAN tree
>
> Applied 1...5 to the linux-can-next tree.

Thanks, but six weeks later they are still not visible?
Same for " [PATCH] dt-bindings: can: renesas,rcar-canfd: Restrict
resets in top-level"
https://lore.kernel.org/20261009-holistic-warping-puffin-3b92fe-mkl@pengutronix.de

Am I looking at the wrong tree?
Thanks again!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
