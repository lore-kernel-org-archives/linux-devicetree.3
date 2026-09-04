Received: from mta1.migadu.com (out-26.mta1.migadu.com [95.215.58.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DB238333F
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 09:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788513965; cv=none; b=oL51hqhlZFspKWY/X9ArO48kqcJsaiFn2fXg8sd+qrt3zqn2qHAe/DY+0hBPHIHUiB767zNu3NCpfn8v5IZSECxKxZiJcl3zImt1+sUg2DYzVn8XNoAn9owPboSVz3Fq+lTbYKC3Ws0ZmrpLmfDgYjVR9hntOY3YVcpEO1t91Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788513965; c=relaxed/simple;
	bh=7DkiWjFPZ/wKQfHpr2XOju8oYakM7YeBMJ1a2lhu/k0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L+Gsa6IrqQ8SUY7JhN0+93gda6nZwG/cMT3hmxhPQj79S0L0pjODE4O1PAfOD657bwtHs+233D6J659TiBQ9njQRxx98n10qw6IB3uZeRJ4KTNJ/COj/lvI1t7w6ITZ9FSlwscKDIPe+jSYTqi8AeLA2OPdEpXHu1hJQdOO3Tcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Ufh7q8KW; arc=none smtp.client-ip=95.215.58.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Ufh7q8KW"
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7DkiWjFPZ/wKQfHpr2XOju8oYakM7YeBMJ1a2lhu/k0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788513962; v=1; x=1789118762;
 b=Ufh7q8KWRKq4Y6vGMToSz6hlrvKTA5G2tDucClKH0TM3eJoBXRJ0j2AgULkaExcgdmIxII46
 MQRaJrbEpPcKPD1rTG3iFJc7B9LfwFXJpcQz3/Z4SofFs4xLI13AbAAQrOSxS0HHqloN8Ny+N8i
 WntSkXZ2hu7P3QXiL77aG5O0=
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c06c1254588954e5;
	Fri, 04 Sep 2026 09:26:02 +0000
X-Mizu-Trace-ID: c06c1254588954e5
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384b7so4179e87.0
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 02:26:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByTnguSF3C0Dgu5K61umlwZTylrM8y1l5HX4vRZfwIdwO3yrWqVQqEMY/dm/DeSFcPf61DPBJwx30FJ@vger.kernel.org
X-Gm-Message-State: AFuF++lkGZGPjjmXKPbvEQJ221ufEpTigu7NRdXTWTbYbg2OPHpCKbHQ
	yFb923zN8m3mFkJEZCnaY+X21mh9DxlRFykBPGl0Mxya6Y+7GEu+qca84POtOda8GGEkkX69FV0
	0KSJ7/1BCWINY0ULXQP9OYu/VGW2y/4Dft4b5O+IV
X-Received: by 2002:ac2:51d0:0:b0:5ae:cf5f:4a88 with SMTP id
 2adb3069b0e04-5b6170da3f8mr92309e87.8.1788513960947; Fri, 04 Sep 2026
 02:26:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904073424.3855365-1-fuad.tabba@linux.dev> <20260904074800.875391F00A3F@smtp.kernel.org>
In-Reply-To: <20260904074800.875391F00A3F@smtp.kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 4 Sep 2026 10:25:24 +0100
X-Gmail-Original-Message-ID: <CA+EHjTx6ZC90qHoccTE6CLvGvxrXBe3Ph0bFKcgBvfRpCCAVuA@mail.gmail.com>
X-Gm-Features: AcwNN1UQpBIjoSKr6FrVVpMpZ-dywVzN3jlWv9ZmQWW-j1QShtKWrYG9-PfX4VI
Message-ID: <CA+EHjTx6ZC90qHoccTE6CLvGvxrXBe3Ph0bFKcgBvfRpCCAVuA@mail.gmail.com>
Subject: Re: [PATCH] of/irq: Fix device node refcount leak in of_check_msi_parent()
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 4 Sept 2026 at 08:48, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] of_msi_xlate() fails to traverse the device hierarchy when msi_n=
p is NULL, completely breaking MSI ID mapping for callers such as the fsl-m=
c subsystem.
> - [High] msi_node reference is leaked on error path in its_v5_pci_msi_pre=
pare()
> - [High] of_msi_xlate() incorrectly handles 'msi-parent' by continuing tr=
ee traversal when it mismatches.
> --
>
> commit b8991c82a3994d7ebf04943226ad5d1d9490a8d4
> Author: Fuad Tabba <fuad.tabba@linux.dev>
>
> of/irq: Fix device node refcount leak in of_check_msi_parent()
>
> The patch fixes a device node refcount leak in of_check_msi_parent(). It
> ensures that if the node was not matched in a 1:1 mapping, the reference =
is
> released correctly before returning.
>
> Link: https://lore.kernel.org/all/20260826113604.010C01F000E9@smtp.kernel=
.org/
>
> > diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> > index ec035367c9500..109c54f346479 100644
> > --- a/drivers/of/irq.c
> > +++ b/drivers/of/irq.c
> > @@ -785,7 +785,7 @@ static int of_check_msi_parent(struct device_node *=
dev_node, struct device_node
> >       if ((*msi_node && *msi_node !=3D msi_spec.np) || msi_spec.args_co=
unt !=3D 0)
> >               ret =3D -EINVAL;
> >
> > -     if (!ret) {
> > +     if (!ret && !*msi_node) {
> >               /* Return with a node reference held */
> >               *msi_node =3D msi_spec.np;
> >               return 0;
>
> [Severity: High]
> This isn't a bug introduced by this patch, but of_msi_xlate() seems to
> incorrectly handle msi-parent mismatches.
>
> If a device specifies an msi-parent that does not match the msi_np filter=
,
> of_check_msi_parent() returns -EINVAL.
>
> drivers/of/irq.c:of_msi_xlate() {
>                 /* -ENODEV: msi-map absent -> check for msi-parent */
>                 if (msi_np && !of_check_msi_parent(parent_dev->of_node, m=
si_np))
>                         break;
> }
>
> The condition !of_check_msi_parent() evaluates to false, skipping the bre=
ak
> statement and allowing traversal to continue. Will this erroneously allow
> traversal up the tree, potentially inheriting an incorrect msi-map from a
> parent bus?

It does continue. -EINVAL also covers #msi-cells !=3D 0, so
of_msi_xlate() cannot tell a phandle mismatch from an msi-parent that
is not a 1:1 mapping, and breaking on it would stop the walk for both.

Lorenzo, Rob, should the walk stop at the first node declaring an msi-paren=
t?

>
> [Severity: High]
> This is a pre-existing issue, but does of_msi_xlate() fail to traverse th=
e
> device hierarchy when msi_np is NULL?
>
> When of_map_msi_id() (which calls of_map_id()) processes an absent map
> property while filter_np is NULL, it returns 0 instead of an error:
>
> drivers/of/base.c:of_map_id() {
>         ...
>         map =3D of_get_property(np, map_name, &map_bytes);
>         if (!map) {
>                 if (filter_np)
>                         return -ENODEV;
>                 /* Otherwise, no map implies no translation */
>                 arg->args[0] =3D id;
>                 arg->args_count =3D 1;
>                 return 0;
>         }
>         ...
> }
>
> In of_msi_xlate(), this return value of 0 triggers a break:
>
> drivers/of/irq.c:of_msi_xlate() {
>                 if (!of_map_msi_id(parent_dev->of_node, id_in, msi_np, &m=
si_spec)) {
>                         ...
>                         /* msi-map present but no match -> stop walking *=
/
>                         break;
>                 }
> }
>
> Because of_map_id() returns 0 when the map is absent, wouldn't this early
> break erroneously abort the parent traversal loop on the first iteration,
> breaking MSI ID mapping for callers passing a NULL msi_np?

It does break early there, but not for fsl-mc, the only NULL caller:
AFAICT, an fsl_mc_device never gets an of_node, so the walk carries on
up to the fsl-mc platform device, which is where fsl,qoriq-mc puts
msi-map.

> [Severity: High]
> This isn't a bug introduced by this patch, but is there a fwnode referenc=
e
> leak on the error path in its_v5_pci_msi_prepare()?
>
> drivers/irqchip/irq-gic-its-msi-parent.c:its_v5_pci_msi_prepare() {
>         rid =3D pci_msi_map_rid_ctlr_node(domain->parent, pdev, &msi_node=
);
>         if (!msi_node)
>                 return -ENODEV;
>
>         ret =3D its_translate_frame_address(msi_node, &pa);
>         if (ret)
>                 return -ENODEV;
>
>         fwnode_handle_put(msi_node);
>         ...
> }
>
> If its_translate_frame_address() fails, it returns -ENODEV without droppi=
ng
> the acquired msi_node reference. Can this leak the fwnode_handle if the
> frame address translation fails repeatedly during driver bind or unbind?

Yes, every failed translation leaks one. I have a patch written,
moving the put above the error check. It goes with the irqchip fixes
rather than here.

/fuad

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904073424.38=
55365-1-fuad.tabba@linux.dev?part=3D1
