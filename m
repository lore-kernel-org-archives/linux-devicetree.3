Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC20348A2DB
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 15:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784041674; cv=none; b=O+AzbtXauBYTBJnDH4a78nnICVzNL8SX+ixNLqiKDAJgiirXVVUMpLV8JX8eDaMwgQzlkp3PoLq+zWK0R0yWZ1iFyCm/KX8kdWx4QbEXcYErOzVuZzWvboy4qNMaSDSFk2BuDIsbnKqkJZAEgUV/I+h9n/TRWlnOkua7KXOXlYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784041674; c=relaxed/simple;
	bh=EydTAVFmfsnxHYlpbg8UU22Qc+XHEBpnj2CpvQQHEJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Spr1bF+3jalF+1Yj2YKrwswhD34BPUtX9VsjVM93JkCqAhfTBWEihTW62OVaN+/myG9rORnbFjsF5dAhTHP2a1meLkJTfqs2wzWqq5nPwhlawMVFKm2lI47vajnomxgaQKiX+IVrIKE3KOa9xCR0YDJXNSApLzeeacylCeYnyhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c15e592da74so540074066b.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 08:07:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784041671; x=1784646471;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Jo5VGLZCIAx58XGGknenbn6fKSICDfYV+/5FruvF+xY=;
        b=doN3iXDex7+AhZWI4TQcWqfBODHd/v9+dZKvQGsSBwEXWkc9X1HX16CZgoScCtQjAq
         AVnk08CNbuuatkhVa/GX53UpdGT53nUDifLv3M8EintHv/jl5F40Aor4ebEHriLIPuG7
         n5t3bbNu5tZXPe8vutnIJLHptSJV1ZOD9KmvdQy5mtxZL6IsucpSe4yEpH7h89J8dE3P
         2pRnehs1INqV1xnQCunCZdiHhBWAwAwSlgEk78lK1l4piYIijdJOMdZD3BmmjpzOqhBN
         QD5GQT0/goJcrWpqP9qPm4NSKysjxiwqKVHWnmxfJToSAHNAhpyBaJi3dgHgof2vK6Wu
         WaWA==
X-Forwarded-Encrypted: i=1; AHgh+Rq/SMaPFIKxS3Qc8BxXBGlNSFpD3M0dyN8FHLyprJ4SqGRNSmZqlhiH2urLaNFrDrp1YuJmVzbTI/86@vger.kernel.org
X-Gm-Message-State: AOJu0YxPH+D0NPk7zrOxA33iRyUDMeQTwbkyKYdFkPh+VEtVfk4YmSFS
	GgenkbVm5cc1IO5JiMEOh+Q+zEvGcbB9fh9fr/EiIImj8485ekjBsVL3xdvDbDaWUo4=
X-Gm-Gg: AfdE7cmqXH6awIcy7qSYsZyGZK+/JGuYuu3B5QqiOcQKHRaFdxdkR5DVNoJyV+INqGV
	HE7PfMEUZbENT5HxNZqVM5vcoMRKqiCzeuvHbcCK9YWKKbjsV57FdMC4zH7Drf3pmkyzAVfpFQJ
	i82DEwHDJB6I1Hq0cdIutg5xbh1X0MJP1d0/4gfAvKsHoKfdZrxsIvGeYJuL7bMOF6Qgjy/0PxO
	wbfEe044jXGbBBfD0mDJ4dUH7VuUpOfMmZHGWZxmIcg1Xnn7rGa6j0XTeV8RX7GJJPyufLpsEai
	RwHL9peZWVk8InUT9f7ZRH86DOrve38dHNWyX2m3031oqDcoDADT67cSKOowTzGoBkQbRE5/iVJ
	z8fqUL5wpW7aUBVw7sfd+ocChopa0OqfwMg1bOb243Cpxrzw5OS86vCbZcaGQv2npNRJMUKDkJs
	NPR3ua8qzyBno3zfu8BTKmKdt1SJb93uBXJr1Iy3H8eB8sRSbnAQ==
X-Received: by 2002:a17:907:c510:b0:c12:8c41:3beb with SMTP id a640c23a62f3a-c161eaa5c2bmr640942466b.50.1784041670927;
        Tue, 14 Jul 2026 08:07:50 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15da821c58sm879659966b.48.2026.07.14.08.07.48
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 08:07:49 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-69a50189d25so7725994a12.3
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 08:07:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqHW9VP7WnMcG5NLQCEKqL4R3iLiJA8lS6NzmUBIY7/Sbu54wmdHcXSaDXt3GdbmxvsfwbOSmbC3J+x@vger.kernel.org
X-Received: by 2002:a05:6402:5518:b0:698:1504:e3db with SMTP id
 4fb4d7f45d1cf-69c5f12584bmr5921618a12.29.1784041668249; Tue, 14 Jul 2026
 08:07:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260704202748.355708-1-marek.vasut+renesas@mailbox.org> <20260704202748.355708-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260704202748.355708-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Jul 2026 17:07:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUVqw-gqydVg5N7WiMj04rVAPuLjJjzgrk+eEgJpbzS2g@mail.gmail.com>
X-Gm-Features: AUfX_mzNY37K7gCxxfwbxm0n7Y10BRypx8qySLz8CYFaayTElsV73S_ymVmDRtU
Message-ID: <CAMuHMdUVqw-gqydVg5N7WiMj04rVAPuLjJjzgrk+eEgJpbzS2g@mail.gmail.com>
Subject: Re: [PATCH 4/5] PCI: dwc: rcar-gen4: Handle PERST via reset subsystem
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sat, 4 Jul 2026 at 22:28, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Handle PERST via both GPIO and reset subsystem. On R-Car Gen4, the
> PERST signal is operated as a GPIO, on R-Car Gen5 it might only be
> accessible via SCMI reset via reset subsystem. Support both options.
> This is a preparatory patch for R-Car Gen5 support.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c

> @@ -299,10 +300,27 @@ static void rcar_gen4_pcie_unprepare(struct rcar_gen4_pcie *rcar)
>
>  static int rcar_gen4_pcie_get_resources(struct rcar_gen4_pcie *rcar)
>  {
> +       struct device *dev = rcar->dw.dev;
> +       struct reset_control *perst;
> +
>         rcar->phy_base = devm_platform_ioremap_resource_byname(rcar->pdev, "phy");
>         if (IS_ERR(rcar->phy_base))
>                 return PTR_ERR(rcar->phy_base);
>
> +       rcar->perst = NULL;
> +       for_each_available_child_of_node_scoped(dev->of_node, of_port) {
> +               perst = of_reset_control_get(of_port, "perst");
> +               if (IS_ERR(perst)) {
> +                       if (PTR_ERR(perst) != -EPROBE_DEFER)
> +                               dev_err(dev, "Failed to get PERST#\n");
> +                       return PTR_ERR(perst);

return dev_err_probe(...)?

This error condition is triggered on Sparrow Hawk and White Hawk,
as their DTS does not have perst:

    pcie-rcar-gen4 e65d0000.pcie: Failed to get PERST#
    pcie-rcar-gen4 e65d0000.pcie: probe with driver pcie-rcar-gen4
failed with error -2

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
