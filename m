Received: from mta0.migadu.com (out-135.mta0.migadu.com [91.218.175.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C32434B1A3
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 12:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782437; cv=none; b=u4WlWpIcCUU2yd2PgIyeBg0wN66PlAk6q7jkaLHIn1AGvvmPMxvV+zXkEGeoZ1YOOckzlUVRLWRFd/YzvGM4vkPFcquc7Q+wg59EQ44SN8RssMtkc3gMSXKQBNC7fqXWsOyMJ66hmpJtnQqIu6FBg+qA9Ro83+dYkj3qoYAPq1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782437; c=relaxed/simple;
	bh=ngQPkjIQhnImDOuM3WuuixU0yFgu3iX8vqPspgh9oKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cNfzwZgE1UDXfbc7F/9I1jtomkazQCgES3ZmLJAlv4bV0VUUCXhZAOniYvCkgTlpdtcF4NlMH0cIoRsxvU2S2g2E8XVFptwqU0ZLn0QBNJeBa8z608qbji99Xjdq+1cCYn3ebI2NHDP+yWTAz9wP3JnGiIRoaq7xz7X84pP1U5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=W+4zm8do; arc=none smtp.client-ip=91.218.175.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="W+4zm8do"
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ngQPkjIQhnImDOuM3WuuixU0yFgu3iX8vqPspgh9oKI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788782432; v=1; x=1789387232;
 b=W+4zm8doU1JOTyAKBzcDnCEs+O5hULjQ2IYZ1XpSf1k9a9ruof9XnpPz15WX1v6tQCk6EXC2
 P6jOuSZrGs7AEu18vdxX4Qg6cN6nF001Rod3oK7Wvk9um7kEXsdn775MuekvZ5T7FVStqg56eeR
 6dHI9Twfzt/BgZckj5GhGuBg=
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ae22519ed6e7cc5b;
	Mon, 07 Sep 2026 12:00:14 +0000
X-Mizu-Trace-ID: ae22519ed6e7cc5b
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b17358so6313e87.1
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 05:00:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwxUoN+H/T9j+gJ1t2O3MThizl0IQqB3vXEA7pvwiZXqCWyIBac+sGINikrCDmMNWFh3WAhAu4KVmNq@vger.kernel.org
X-Gm-Message-State: AFuF++mlXVSZv1zJxWlnTjYYNee/y4hBD6OP0QTcIsV3P2p8crhPwL0A
	J5XYuIFAHzBCbUjIYH/O5jq7mgdRjIatWvXx1FHEfkQZg+g/XMu+uidnq/ksdIn2rXIsBJFwnRf
	sBscFLeixyO9fAPDybcCV4SPj2sO+90HmUEUkwpAG
X-Received: by 2002:a05:6512:1d1:b0:5b1:4fd9:ac with SMTP id
 2adb3069b0e04-5b75074fa17mr49498e87.3.1788782409953; Mon, 07 Sep 2026
 05:00:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907112944.313618-1-fuad.tabba@linux.dev> <20260907112944.313618-2-fuad.tabba@linux.dev>
 <20260907114514.44DB81F00A3A@smtp.kernel.org>
In-Reply-To: <20260907114514.44DB81F00A3A@smtp.kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 7 Sep 2026 12:59:33 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzc1cOh5Qe+0svp6nOOgzeULVwxDmDOZr49xJtLFiaRhQ@mail.gmail.com>
X-Gm-Features: AcwNN1Vt-aJ3tzj_QZnkbvQgo6kaZ5kSdh2tbtZ0uO353EJiAohmQi6mASJ03L8
Message-ID: <CA+EHjTzc1cOh5Qe+0svp6nOOgzeULVwxDmDOZr49xJtLFiaRhQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] of/irq: Fix device node refcount leak in of_check_msi_parent()
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 7 Sept 2026 at 12:45, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] of_msi_xlate() prematurely aborts device tree hierarchy traversa=
l when msi_np is NULL.

Already covered in my reply to v1 [1]. No in-tree caller hits it:
fsl_mc_get_msi_id() is the only one passing NULL, and an fsl_mc_device
has no of_node, so the walk doesn't abort there.

Cheers,
/fuad

[1] https://lore.kernel.org/all/CA+EHjTx6ZC90qHoccTE6CLvGvxrXBe3Ph0bFKcgBvf=
RpCCAVuA@mail.gmail.com/

> --
>
> commit d227a3bc08eef0cbb22a6f227edca082ac29a9b8
> Author: Fuad Tabba <fuad.tabba@linux.dev>
> of/irq: Fix device node refcount leak in of_check_msi_parent()
>
> This patch prevents a device node reference count leak in
> of_check_msi_parent(). It ensures that the msi_node reference is
> only kept when the incoming node pointer is NULL.
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
> This isn't a regression introduced by this patch, but could the traversal
> loop in of_msi_xlate() prematurely abort when msi_np is NULL?
>
> If a driver calls of_msi_xlate(dev, NULL, id) and the direct parent lacks=
 an
> msi-map property, of_map_msi_id() passes the NULL msi_np to of_map_id()
> as filter_np:
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
> Because filter_np is NULL, it returns 0 instead of -ENODEV.
>
> This translates to !of_map_msi_id(...) evaluating to true in the loop in
> of_msi_xlate(), hitting the break statement:
>
> drivers/of/irq.c:of_msi_xlate() {
>         ...
>         for (parent_dev =3D dev; parent_dev; parent_dev =3D parent_dev->p=
arent) {
>                 struct of_phandle_args msi_spec =3D {};
>
>                 if (!of_map_msi_id(parent_dev->of_node, id_in, msi_np, &m=
si_spec)) {
>                         if (msi_spec.np) {
>                                 ...
>                         }
>                         /* msi-map present but no match =E2=86=92 stop wa=
lking */
>                         break;
>                 }
>                 ...
>         }
>         ...
> }
>
> Will this cause the function to incorrectly terminate the loop on the ver=
y
> first node, conflating an absent msi-map with a present but unmatched
> msi-map, and failing to find the MSI mapping in ancestor nodes?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907112944.31=
3618-1-fuad.tabba@linux.dev?part=3D1
