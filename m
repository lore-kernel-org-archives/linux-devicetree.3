Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922299;
	b=r+SmvOixA+WLKv/oNKc/pFleCMJOIKXu6krq0j8n1gY95hqkLJBtyZ9/x6Wf0ighjLmB
	 /bOLC5pviQdDjiUpPLoZDgv+/yaLCuQyKB/L627xqYxNAFpPCtm70xruCKFNW8OJBo52w
	 e6b4lw9ZRRnCOAW/TV0jXxIN94yayOcCi5yiqemANznAXfgkmfgeyWJbW3hx8OGGJq+db
	 GF2yubDxzNXKllWlnmnHo3WoZ1TAkifw56ZdPZdUDt75+Yx343FsYrY0LEN1Yfp4HeoCK
	 KUb0tMhYEsy7dsDjBiC4F6JCoXSORwF4fJ4ElQeKICnJv3k+sl5d/s9H+uWsQrYNl4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922299;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=EeCtp7snYUo/kEjz5Jxk/wAX9V5PpdKoukdWg5ioibg=;
	b=kJ+liWx3iFnl7klEKJLYX8AV8FjVntQPgLrVwWNjWpziML2bIoUKWfet+H8j7juIhtlb
	 Ad3vcgo2i4hPStwx+kJvmH2gUlTtCLlFeg4uvMUCxIDMrly4wNbNYsVWA5VO9PuXOcnbz
	 qaSOcwkXUaODZXyVJmK8KjKCgqmM/GI1+zqM9PzwlsiZ3u+VxPtgpn37ewo9k5Lk6sKg9
	 /nkpBMyb0z65UPkih5KFLQwSIvdLI9yVoUE0z1wfAQTjQi6Mqudb2KSqct/VB1TS7OosT
	 4DKtQ3lpgfM8zZzuFQwbZSolQ0az3gBKU1SNLjGreBfHgz9TCewvAsNfeCFdYLHEKlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09C7606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 13:31:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D09C7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5eaa5e03c47so711732e0c.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 05:31:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922297; x=1795527097;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EeCtp7snYUo/kEjz5Jxk/wAX9V5PpdKoukdWg5ioibg=;
        b=P+Ac1VaGK6OfIojgnvauA6P2usR3IsKwKj3rPRbhoA0oohC0z1ene4t7mI55fb3g70
         FVP+rtRICX2E2JJO9WgNmc/vqBiFWnnwDNieUkrtu9/7V6qwfOcGAfyBsD5v5mpBrOS+
         CIcw1ZM+Gk+Tu6IxEzoFP/8vFEXF4IR548WA0nArfVND3xwn50wX6gZBJnq+aBpGmILM
         HO9o+DS5WeX9xMLaZcitw0v9qVg9BxYSklTBNgybLNJFzWXyXJnx15SfKwZ7oEqCGKJS
         1P9eLITNl5bb4MIe3+glRle67SvQuHXQM/vSJeFAWkBywieBXc/riacRyVwUXWse4gJI
         P3Ug==
X-Forwarded-Encrypted: i=1; AL+hErENh6kQ6arUP8L3sLPQwJP8+WiEFqymhYkupYmftRgRU+ddg8VrPMaYZvJ+OQfdzFfn9LfbqA3Cs971@vger.kernel.org
X-Gm-Message-State: APuU4Z/u4zgFhscvhRaHRleOhqNxFzqVBOLNugKjI7LB7FQOajf4TbIc
	Ovl5k5yHsROcWLLOLyNq046Eaeu4i++POWGbpQir3unrnk7euHGpycWyIn/dKMvc
X-Gm-Gg: AYBFou2Up9qtxW+MJh04dBVXKaLQXJGPifvJkhkL+A2gDtU2wpVBXl1Hixnowlr3PyW
	e1Jfg/2uqruFhYV1FzuphW2LXnXzprX9zvIgmhx2wISurMRat4FIcAiEXAy51zWYekJFz3kIUGz
	/VCK1I+FrHJvltDv6MGl1kiX2xXZcaNyjwkPOflAp7M2rpboCET3AL2gj8Q/yvpKC8NtzrnWdwV
	nSMaXNWiygl8ri+/elvYbAESrRhcpGCeNFCjukUCAJk5ISl+hEeT/ZGcQbGPRGNllgC0jK8/Z0T
	BV5hZVtypyspAxI86jzu8QOr+8vCXTFsAt1uIqbcCgWzWnLu1LnKO6RrFJoR7Rer5t6zfA1YkxV
	MIm9PoXc2B6CXQYD3HNQdjEgpOrol+EHbQ5Hcm8amICmAk8COICa5df7sfvpRXl6sZ+psM0of7V
	exzyXGGiG+5mihGbhR5tVk27aTs0ZArcYj1w3ZkuwL9ctggwK131ApyT9Yer1kqtJ4+AWhErO/t
	fQlL3suyEcQK/g/dZnLUzcNNKqhyjCQrxipEXDRFXGsZIvjQqaBFveOdgPO1c70O45Rx/0Vob+F
	pRWbBsKhg49xPtDAuRBjqlb8f+Q92+yOY2SSm2sRLEPSSTc7Mk4/qk3YwEvc9qe/NAdPUU18
X-Received: by 2002:ac5:c011:0:10b0:5ec:e45b:b5a6 with SMTP id 71dfb90a1353d-5ee5b79f589mr487468e0c.13.1794922297476;
        Tue, 17 Nov 2026 05:31:37 -0800 (PST)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e3389bb37sm1961605241.3.2026.11.17.05.31.37
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 05:31:37 -0800 (PST)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5ec3561b07dso568395e0c.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 05:31:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFaibZSb2tmzkIJK0rFOHA+gjL3jvr0Y42+lk2+Bt+L/Uop2ZF/7nCYDavUYfOBiJnfBkytY8UeqSIj@vger.kernel.org
X-Received: by 2002:a05:6122:680e:10b0:5e9:54b9:40a with SMTP id
 71dfb90a1353d-5ee5b70f820mr569387e0c.3.1794922296878; Tue, 17 Nov 2026
 05:31:36 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112204944.1427733-2-oss.patchbox@gmail.com>
In-Reply-To: <20261112204944.1427733-2-oss.patchbox@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Nov 2026 14:31:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUKKAVhPZ=473QzM6pQ_3GAhnDte2WSBLj5c+gAni-5xw@mail.gmail.com>
X-Gm-Features: Aa3M54pQZqX6BYtGrH7PmQPQgi-XDFTxO2MIGthzf4F_ODNzK-JgBMe7vBScNM4
Message-ID: <CAMuHMdUKKAVhPZ=473QzM6pQ_3GAhnDte2WSBLj5c+gAni-5xw@mail.gmail.com>
Subject: Re: [PATCH v3] irqchip/gic-v3-its: Drop ITS node reference on
 its_of_probe() errors
To: Yuho Choi <oss.patchbox@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Radu Rendec <radu@rendec.net>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Yuho,

CC devicetree

On Thu, 12 Nov 2026 at 22:47, Yuho Choi <oss.patchbox@gmail.com> wrote:
> its_of_probe() walks the ITS nodes with of_find_matching_node(), which
> drops the reference on the previous node and returns the next one with
> its reference count raised. The loops are balanced when they run to the
> end, but the three error returns (a failed its_reset_one(), a failed
> its_node_init() and a failed its_probe_one()) leave with the current
> node still referenced.
>
> Declare the iterator in each loop with __free(device_node), so that the
> reference is dropped whichever way the loop is left.
>
> Fixes: c733ebb7cb67 ("irqchip/gic-v3-its: Reset each ITS's BASERn register before probe")
> Fixes: 9585a495ac93 ("irqchip/gic-v3-its: Split allocation from initialisation of its_node")
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
> Acked-by: Marc Zyngier <maz@kernel.org>

Thanks for your patch, which is now commit aab02e49f0b54a08
("irqchip/gic-v3-its: Drop ITS node reference on its_of_probe()
errors") in irqchip/irq/drivers.

> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -5572,7 +5572,6 @@ static void its_node_destroy(struct its_node *its)
>
>  static int __init its_of_probe(struct device_node *node)
>  {
> -       struct device_node *np;
>         struct resource res;
>         int err;
>
> @@ -5582,7 +5581,7 @@ static int __init its_of_probe(struct device_node *node)
>          * reset, don't even try to go any further, as this could
>          * result in something even worse.
>          */
> -       for (np = of_find_matching_node(node, its_device_id); np;
> +       for (struct device_node *np __free(device_node) = of_find_matching_node(node, its_device_id); np;
>              np = of_find_matching_node(np, its_device_id)) {

So the old code was just an open-coded copy of the existing
for_each_matching_node() helper.
The new code is the open-coded original for a future
for_each_matching_node_scoped() helper?

>                 if (!of_device_is_available(np) ||
>                     !of_property_read_bool(np, "msi-controller") ||
> @@ -5594,7 +5593,7 @@ static int __init its_of_probe(struct device_node *node)
>                         return err;
>         }
>
> -       for (np = of_find_matching_node(node, its_device_id); np;
> +       for (struct device_node *np __free(device_node) = of_find_matching_node(node, its_device_id); np;
>              np = of_find_matching_node(np, its_device_id)) {

Likewise.

>                 struct its_node *its;
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
