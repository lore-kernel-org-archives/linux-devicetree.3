Received: from mta1.migadu.com (out-139.mta1.migadu.com [95.215.58.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CF94908CE
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 12:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788526133; cv=none; b=hwIfZeqkdRVSo7Th0IsNecSCueXpGZIyKdnsF9LvpxK8UB6a2pyMgIYjd9SCltq6vYp40X7VwJ5KV8x2ZKcxnc5u2ZoxpwoPmZ/zNAkoDXtSXNUF4KlWp6Sf86vEBv4FO05GSrzx2CEfLwB0wYUk7CDpPJvx579tfgceggRRGvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788526133; c=relaxed/simple;
	bh=tvZFMMdnKHz7OPvyKechTJTWyD/PoxIJiVI+e2daVYw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YxxGLhsWIHmBOabdmzSF9z6Xct285A+hQdtKWSlpuumehvjYqbg2XVKTgGkzQauUdb8DDtRULVgM6QIxnb4hJIJf/lH1R5xdtAeGFcf3a8LufOXbsULOI3qO8GiSpu4s6r2ImxzRNTqI0BUTMjnNLJ30CfJIqjB20TzD0KlB4rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=g5K0cMOW; arc=none smtp.client-ip=95.215.58.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="g5K0cMOW"
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=tvZFMMdnKHz7OPvyKechTJTWyD/PoxIJiVI+e2daVYw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788526129; v=1; x=1789130929;
 b=g5K0cMOW9ZKpLOPORM+ciKf4kHdkM7mo+6NPOrn/sMx2n2GJZglSBvqn1QUiK1322nCxXl0v
 2udO7Mj3g9cmLJ4WrznvyXDhVN/9we/VPkqJmWSN3SgIQviW7ViLGHx7qVnbOvVRVw2mXAqi4YC
 DwGgInZRTVVngsC9P59ROT0w=
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id eba4691110d015d9;
	Fri, 04 Sep 2026 12:48:49 +0000
X-Mizu-Trace-ID: eba4691110d015d9
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b17358so4765e87.1
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 05:48:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwtTPa/8ce7ljzKXdaxfnvhJn7XLtdCj61c52Mv/oopsRxfUs59Q7VZl8EOinHEntenxyz71ak8ekRB@vger.kernel.org
X-Gm-Message-State: AFuF++mDpJEJSvg4SlURTuiVWYTw8ONwdBBaqC4oQpQyIQWb9UgulaIP
	czg022tzIaOZBIef9kisanr802eI/OkkSz8xvubaNMdejdctmSZy77TF7sx70y6PQPWQzMMpIWX
	eKEOhECxnkGTCJBYl9O5AsN29b+7zIMqGTiilpj+Y
X-Received: by 2002:a05:6512:2243:b0:5b6:bea:f091 with SMTP id
 2adb3069b0e04-5b6170f843emr110245e87.10.1788526127966; Fri, 04 Sep 2026
 05:48:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904073424.3855365-1-fuad.tabba@linux.dev>
 <20260904074800.875391F00A3F@smtp.kernel.org> <CA+EHjTx6ZC90qHoccTE6CLvGvxrXBe3Ph0bFKcgBvfRpCCAVuA@mail.gmail.com>
 <apqnaNmeuUjfC8Ng@red-moon>
In-Reply-To: <apqnaNmeuUjfC8Ng@red-moon>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 4 Sep 2026 13:48:11 +0100
X-Gmail-Original-Message-ID: <CA+EHjTy0sL8our+KNigZbc7-+uu2-OX=L3g_49-c_C7UY_quDg@mail.gmail.com>
X-Gm-Features: AcwNN1X2ZIAe9-WNal5RVk3dI8weKYROYg78bFJyd_QW8RLSGBo0CIEAN0-FVKE
Message-ID: <CA+EHjTy0sL8our+KNigZbc7-+uu2-OX=L3g_49-c_C7UY_quDg@mail.gmail.com>
Subject: Re: [PATCH] of/irq: Fix device node refcount leak in of_check_msi_parent()
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 12:11, Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
...
> > It does continue. -EINVAL also covers #msi-cells != 0, so
> > of_msi_xlate() cannot tell a phandle mismatch from an msi-parent that
> > is not a 1:1 mapping, and breaking on it would stop the walk for both.
> >
> > Lorenzo, Rob, should the walk stop at the first node declaring an msi-parent?
>
> First off, thank you for fixing this.
>
> I think we must stop at the first msi-parent and apply the same (convoluted)
> logic that of_msi_xlate() executes upon of_map_msi_id()'s return to make
> sure ref counts are kosher (we already have an msi_spec scratch variable,
> we can pass that to of_check_msi_parent() - that is, always drop the
> msi_spec.np reference if !NULL and get one if !*msi_np to initialize it).

Thanks for the clarification.

Cheers,
/fuad

> >
> > >
> > > [Severity: High]
> > > This is a pre-existing issue, but does of_msi_xlate() fail to traverse the
> > > device hierarchy when msi_np is NULL?
> > >
> > > When of_map_msi_id() (which calls of_map_id()) processes an absent map
> > > property while filter_np is NULL, it returns 0 instead of an error:
> > >
> > > drivers/of/base.c:of_map_id() {
> > >         ...
> > >         map = of_get_property(np, map_name, &map_bytes);
> > >         if (!map) {
> > >                 if (filter_np)
> > >                         return -ENODEV;
> > >                 /* Otherwise, no map implies no translation */
> > >                 arg->args[0] = id;
> > >                 arg->args_count = 1;
> > >                 return 0;
> > >         }
> > >         ...
> > > }
> > >
> > > In of_msi_xlate(), this return value of 0 triggers a break:
> > >
> > > drivers/of/irq.c:of_msi_xlate() {
> > >                 if (!of_map_msi_id(parent_dev->of_node, id_in, msi_np, &msi_spec)) {
> > >                         ...
> > >                         /* msi-map present but no match -> stop walking */
> > >                         break;
> > >                 }
> > > }
> > >
> > > Because of_map_id() returns 0 when the map is absent, wouldn't this early
> > > break erroneously abort the parent traversal loop on the first iteration,
> > > breaking MSI ID mapping for callers passing a NULL msi_np?
> >
> > It does break early there, but not for fsl-mc, the only NULL caller:
> > AFAICT, an fsl_mc_device never gets an of_node, so the walk carries on
> > up to the fsl-mc platform device, which is where fsl,qoriq-mc puts
> > msi-map.
> >
> > > [Severity: High]
> > > This isn't a bug introduced by this patch, but is there a fwnode reference
> > > leak on the error path in its_v5_pci_msi_prepare()?
> > >
> > > drivers/irqchip/irq-gic-its-msi-parent.c:its_v5_pci_msi_prepare() {
> > >         rid = pci_msi_map_rid_ctlr_node(domain->parent, pdev, &msi_node);
> > >         if (!msi_node)
> > >                 return -ENODEV;
> > >
> > >         ret = its_translate_frame_address(msi_node, &pa);
> > >         if (ret)
> > >                 return -ENODEV;
> > >
> > >         fwnode_handle_put(msi_node);
> > >         ...
> > > }
> > >
> > > If its_translate_frame_address() fails, it returns -ENODEV without dropping
> > > the acquired msi_node reference. Can this leak the fwnode_handle if the
> > > frame address translation fails repeatedly during driver bind or unbind?
> >
> > Yes, every failed translation leaks one. I have a patch written,
> > moving the put above the error check. It goes with the irqchip fixes
> > rather than here.
>
> Yep.
>
> Thanks,
> Lorenzo
