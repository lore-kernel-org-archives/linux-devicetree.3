Received: from mta0.migadu.com (out-190.mta0.migadu.com [91.218.175.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6926408602
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 12:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787746831; cv=none; b=Tmg57bZrZ2DalTYxwmAlkm1ykmMtdbJswitATxTPuRZbIEQxYktlItGUZlL4hu/XRSFjvJYRF0+F5LPO0Lwp9ljg2Zx/OTM94ka/S6apYXui5D3fteRHkcblO1jeOxa4PR0sUGJzrT9TNF+bDgugkajLgqe1Xykfs60NF7SiiQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787746831; c=relaxed/simple;
	bh=rIlM0NQoQUlchZcULrodvjFJYq+jUxt3o3RA5Rzp6EM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SP67zD5Aj2RgRr1fX0J7rERAidN6wbj9LnFShiqHq2LVn3jSUMjEuPqJGp4tZ/2MPUvi9KGPeYRy7sVnazSVzPtAgGNYKhhEJns46+gL5zScUuUfDEF3NZu6wrY/K2RipFf81mO2FSN6/MXXIHRiKEZM52oQnWyCJv7cYc93HHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=MMXGD0Zy; arc=none smtp.client-ip=91.218.175.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="MMXGD0Zy"
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rIlM0NQoQUlchZcULrodvjFJYq+jUxt3o3RA5Rzp6EM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787746823; v=1; x=1788351623;
 b=MMXGD0ZyX4puArICB4OK1v9vBUb1BnILsxHze5otJNdJzQ8DiHVz4qqS1xKbeZYpEQrAigZz
 OFQoDtauDFfFyEqUNSoym3NH4G69JVjDXDNX/gn2E/1jrHBRw6koYHK12XeeZ6mx5zohOu74mBA
 Bp/vNka/TLr3SKXy0HJ7JKjI=
X-Envelope-To: devicetree@vger.kernel.org
Received: from mail-lf1-f45.google.com (209.85.167.45)
	by smtp.migadu.com with ESMTPS id 5e6e0cac847a10f7;
	Wed, 26 Aug 2026 12:20:23 +0000
X-Mizu-Trace-ID: 5e6e0cac847a10f7
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b0129cf6ffso6442e87.0
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 05:20:19 -0700 (PDT)
X-Gm-Message-State: AFuF++nvl8FSYru2a8NlhqBzpHQRGpFMR84AV/DlfeTyEaakFMY1oRYO
	J0vTfdO8Dg82s1qwQs3IjT46uunlIZBsN04kZ0E2LBR+2V3ijqSO/Zt6ArI0ic+Q2j8Nwqp7YYR
	wPS7F30ka49tJLwc545doTqFG9ar1dNGk4xbahWEQ
X-Received: by 2002:a05:6512:104f:b0:5b4:9dba:4ecf with SMTP id
 2adb3069b0e04-5b4aa73d14amr54954e87.13.1787746818855; Wed, 26 Aug 2026
 05:20:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826112234.1033974-1-fuad.tabba@linux.dev> <20260826113604.010C01F000E9@smtp.kernel.org>
In-Reply-To: <20260826113604.010C01F000E9@smtp.kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 26 Aug 2026 13:19:42 +0100
X-Gmail-Original-Message-ID: <CA+EHjTx7eP_30vP47=UFk_wMAut-2uf+2DF-MZqn2SLE_k-8qg@mail.gmail.com>
X-Gm-Features: AcwNN1X7Ijm9xP88CaLik-BqoFSdvMVvWe_PBW84Ymr8H6mymlVXSBSWTsQ7m0s
Message-ID: <CA+EHjTx7eP_30vP47=UFk_wMAut-2uf+2DF-MZqn2SLE_k-8qg@mail.gmail.com>
Subject: Re: [PATCH] of/irq: Fix device node refcount leak in of_irq_get_affinity()
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sashiko,

On Wed, 26 Aug 2026 at 12:36, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Device node reference count leak when resolving MSI domain RID v=
ia 'msi-parent' fallback.
> - [High] Pre-existing memory leak of device node reference in `gic_irq_ge=
t_fwspec_info`.
...

> [Severity: High]
> This isn't a bug introduced by this patch, but there appears to be a
> device node reference count leak when resolving MSI domain RID via
> msi-parent fallback.

I think you're right, though not on every invocation. In this caller
of_msi_xlate() only hands back an owned reference on the msi-parent
path: the msi-map branch is guarded on *msi_np being NULL, which it is
not here, and of_check_msi_parent() puts the node itself when it
fails.

Separate fix, and the question underneath is whether of_msi_xlate()'s
ownership of *msi_np should be spelled out for all its callers rather
than patched at this one.

Let me think about this though.

...

> [Severity: High]
> This is a pre-existing issue, but is there also a memory leak of the
> device node reference in gic_irq_get_fwspec_info()?

Yes, and I have a fix for that one written already. It goes to the
irqchip maintainers in a separate posting, since it is a different
subsystem to this patch.

Cheers,
/fuad


>
> drivers/irqchip/irq-gic-v3.c:gic_irq_get_fwspec_info()
> >               fw =3D of_fwnode_handle(of_find_node_by_phandle(fwspec->p=
aram[3]));
> >               if (!fw)
> >                       return -ENOENT;
> >
> >               for (int i =3D 0; i < gic_data.nr_parts; i++) {
> >                       if (gic_data.parts[i].partition_id =3D=3D fw) {
> >                               mask =3D &gic_data.parts[i].mask;
> >                               break;
> >                       }
> >               }
> >
> >               if (!mask)
> >                       return -ENOENT;
> >       } else {
> >               mask =3D cpu_possible_mask;
> >       }
> >
> >       info->affinity =3D mask;
> >       info->flags =3D IRQ_FWSPEC_INFO_AFFINITY_VALID;
> >
> >       return 0;
>
> The call to of_find_node_by_phandle() acquires a new reference on the
> device node, but the function returns on various error and success paths
> without calling of_node_put() to drop it. Does this leak the GIC PPI
> partition device nodes during IRQ affinity retrieval?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826112234.10=
33974-1-fuad.tabba@linux.dev?part=3D1
