Received: from mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40CC3A6B67
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 10:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788777860; cv=none; b=HCrw2FLrDwYk5yhwxnNCV4je5umYeUz3+JgqikihSYnth9B+O6GfLMzNsoYccs+izISyzVn/K/EIGoFRGpufyp5Y6smYL1eY1fdrT2Nyc/hz3T1mGZA4LtmYnm+uJEyIrmkopejNx78ExUGhhLSNdd/yFlaQLn5V6LY6dWt7dAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788777860; c=relaxed/simple;
	bh=6VhZ9+8aL846w8ojD8eezKxyPan82L/O7oRZZU+/bw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GBCU9p5JnPGDnGit83+f2YfD8RXdVfhyt3UpYqES5VLoRbFTFEEG6Cg/akLmDx5He0T5UcC2dldKsbI0fTePqjJaYF9VlXjiXBtE/kGZOa5hQCaUl4jksdoRyCdkb65xIxjurl82WmIibWt078HHQiDeP5td3jn7YgtQ2EyVk1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BM7CYiuR; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BM7CYiuR"
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6VhZ9+8aL846w8ojD8eezKxyPan82L/O7oRZZU+/bw8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788777855; v=1; x=1789382655;
 b=BM7CYiuRJAMoIWnRRKjHR/xDaqJX+yWncycLlR048oZ9jSu4ODyD2lu917lcWskzVsDEHMJI
 8jk9gsu9kFAEr3zyvhCc/DxwOoOeX3EP53FecsX4B9rRenIwlNGmNTJ8L1UHZy++ner4w00zo7Y
 Oz+uR/j1lGsYbRIPwIb2K1dk=
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ae33b288050b815e;
	Mon, 07 Sep 2026 10:44:15 +0000
X-Mizu-Trace-ID: ae33b288050b815e
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b17359so8021e87.0
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 03:44:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxAkXFgl93tM3IPZsOOYYnddg7saKWHMyi38P55EO8upL3qEO+E9oxe0H0qFebPSPloDtMG8qBWERFy@vger.kernel.org
X-Gm-Message-State: AFuF++kyQW5X//Xj5zVHi/W+mGAfIc+4Z95/KyCkUsx73GV6scbC5Oca
	VpPelEex0ipJK+Cv+9YrIcOnKm0ZinXdg58qUZ9HSUnRaVqiWna7ZZg4rDwHEfPqHNzMMZ8U8CJ
	EoBoQqpdT5Ud0Q0xNLwkI2omCarwTpE6uPd5biZ6L
X-Received: by 2002:a05:6512:3185:b0:5b6:19c6:a91b with SMTP id
 2adb3069b0e04-5b74d1e0c5bmr188929e87.14.1788777850442; Mon, 07 Sep 2026
 03:44:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904073424.3855365-1-fuad.tabba@linux.dev>
 <20260904074800.875391F00A3F@smtp.kernel.org> <CA+EHjTx6ZC90qHoccTE6CLvGvxrXBe3Ph0bFKcgBvfRpCCAVuA@mail.gmail.com>
 <apqnaNmeuUjfC8Ng@red-moon> <CA+EHjTy0sL8our+KNigZbc7-+uu2-OX=L3g_49-c_C7UY_quDg@mail.gmail.com>
 <ap6K1H_5EI3g1D3n@red-moon>
In-Reply-To: <ap6K1H_5EI3g1D3n@red-moon>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 7 Sep 2026 11:43:34 +0100
X-Gmail-Original-Message-ID: <CA+EHjTw5V+ujG=d5FLvULxK9wb550gqGONXA2bC01cHAqz2jSw@mail.gmail.com>
X-Gm-Features: AcwNN1UbsOeOJoFZnSMs3VAyEzxfeag7BSvXgh24D-uMFrbyg04MM6dPO8KMMUY
Message-ID: <CA+EHjTw5V+ujG=d5FLvULxK9wb550gqGONXA2bC01cHAqz2jSw@mail.gmail.com>
Subject: Re: [PATCH] of/irq: Fix device node refcount leak in of_check_msi_parent()
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Lorenzo,

On Mon, 7 Sept 2026 at 10:58, Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
>
> On Fri, Sep 04, 2026 at 01:48:11PM +0100, Fuad Tabba wrote:
> > On Fri, 4 Sept 2026 at 12:11, Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> > ...
> > > > It does continue. -EINVAL also covers #msi-cells != 0, so
> > > > of_msi_xlate() cannot tell a phandle mismatch from an msi-parent that
> > > > is not a 1:1 mapping, and breaking on it would stop the walk for both.
> > > >
> > > > Lorenzo, Rob, should the walk stop at the first node declaring an msi-parent?
> > >
> > > First off, thank you for fixing this.
> > >
> > > I think we must stop at the first msi-parent and apply the same (convoluted)
> > > logic that of_msi_xlate() executes upon of_map_msi_id()'s return to make
> > > sure ref counts are kosher (we already have an msi_spec scratch variable,
> > > we can pass that to of_check_msi_parent() - that is, always drop the
> > > msi_spec.np reference if !NULL and get one if !*msi_np to initialize it).
> >
> > Thanks for the clarification.
>
> I can send a patch myself - I understand this is a nuisance for you - I think
> though that since you are in the process of fixing it I don't want to get
> in the way either.
>
> Let me know.

I practically have it ready. Will send it soon.

Thanks for the offer.
/fuad

>
> Thanks,
> Lorenzo
>
> >
> > Cheers,
> > /fuad
> >
> > > >
> > > > >
> > > > > [Severity: High]
> > > > > This is a pre-existing issue, but does of_msi_xlate() fail to traverse the
> > > > > device hierarchy when msi_np is NULL?
> > > > >
> > > > > When of_map_msi_id() (which calls of_map_id()) processes an absent map
> > > > > property while filter_np is NULL, it returns 0 instead of an error:
> > > > >
> > > > > drivers/of/base.c:of_map_id() {
> > > > >         ...
> > > > >         map = of_get_property(np, map_name, &map_bytes);
> > > > >         if (!map) {
> > > > >                 if (filter_np)
> > > > >                         return -ENODEV;
> > > > >                 /* Otherwise, no map implies no translation */
> > > > >                 arg->args[0] = id;
> > > > >                 arg->args_count = 1;
> > > > >                 return 0;
> > > > >         }
> > > > >         ...
> > > > > }
> > > > >
> > > > > In of_msi_xlate(), this return value of 0 triggers a break:
> > > > >
> > > > > drivers/of/irq.c:of_msi_xlate() {
> > > > >                 if (!of_map_msi_id(parent_dev->of_node, id_in, msi_np, &msi_spec)) {
> > > > >                         ...
> > > > >                         /* msi-map present but no match -> stop walking */
> > > > >                         break;
> > > > >                 }
> > > > > }
> > > > >
> > > > > Because of_map_id() returns 0 when the map is absent, wouldn't this early
> > > > > break erroneously abort the parent traversal loop on the first iteration,
> > > > > breaking MSI ID mapping for callers passing a NULL msi_np?
> > > >
> > > > It does break early there, but not for fsl-mc, the only NULL caller:
> > > > AFAICT, an fsl_mc_device never gets an of_node, so the walk carries on
> > > > up to the fsl-mc platform device, which is where fsl,qoriq-mc puts
> > > > msi-map.
> > > >
> > > > > [Severity: High]
> > > > > This isn't a bug introduced by this patch, but is there a fwnode reference
> > > > > leak on the error path in its_v5_pci_msi_prepare()?
> > > > >
> > > > > drivers/irqchip/irq-gic-its-msi-parent.c:its_v5_pci_msi_prepare() {
> > > > >         rid = pci_msi_map_rid_ctlr_node(domain->parent, pdev, &msi_node);
> > > > >         if (!msi_node)
> > > > >                 return -ENODEV;
> > > > >
> > > > >         ret = its_translate_frame_address(msi_node, &pa);
> > > > >         if (ret)
> > > > >                 return -ENODEV;
> > > > >
> > > > >         fwnode_handle_put(msi_node);
> > > > >         ...
> > > > > }
> > > > >
> > > > > If its_translate_frame_address() fails, it returns -ENODEV without dropping
> > > > > the acquired msi_node reference. Can this leak the fwnode_handle if the
> > > > > frame address translation fails repeatedly during driver bind or unbind?
> > > >
> > > > Yes, every failed translation leaks one. I have a patch written,
> > > > moving the put above the error check. It goes with the irqchip fixes
> > > > rather than here.
> > >
> > > Yep.
> > >
> > > Thanks,
> > > Lorenzo
