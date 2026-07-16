Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00ED3B0AF5
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 08:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784191963; cv=pass; b=kRM6rmSTL+iDhJk8Kn89c5Df7MRY1wrQb8AwVuGYd4iGp6Iw0YGVyT+Vo3IeaYC9C1xcaXd6INOL0REo+9kRESMy1avTdaSJ8SvJXOhlAetJGtBfspuo1c9wFrFg47YGVtKJDr563csGS37iPPM76QUygSKapdmL4RgYIVYjIzw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784191963; c=relaxed/simple;
	bh=bY5f5NUrAmXPEdBrsvfj96nHb5zMKiNKEpHnjthNsRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GKxFccJp1ge6Xs4XEloHXhdCnHeWPNSgHMFsoyMT6mLDc2ux39sv/2/LfqFtv4zH7QGqnrZ3wbJh0sAtalNXDrbrOsqoJfQGTcKUaFEd7+DS2hgPm+aBoRsIZ+HUBU+pKogkDaMzO+P1vIQEQLwgNtjiJ7UEF2LiLiOwcClIOT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WDtrg39X; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WDtrg39X"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-664b05d408bso2703716d50.1
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 01:52:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784191959; cv=none;
        d=google.com; s=arc-20260327;
        b=XJpVJ57W8WWpyUylniJbpXwSrw5yY/QZdbOUJ6dtBgwNXVPF8xgdnGzGbnEN31E4Cr
         fnQqsAbOyW2LhpHXdX4VYpD8e5jvcT19+lq9FoIXqaunMEG0RagkBfPhYn67mPOQ1zOR
         ndONh7F/+iQHpeb1moL7m8pKZX6Pxa2d03UTNy7ycyJsYnwn9TjnPdZfq5qn5uwqB4Qv
         y7vF1xGFr74m7xCnFK4+1FIt7pDvOKmQyzm70qMV9YCa0uVEoqsdvfuT1bEV6boNIHWP
         soHp94BHebHw7ooyx3uQ0vi3rocHvbHTxE8pUHsQTYcgnOQNXN0CjdP24Q97K7y9DWTT
         4tDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IQq0m8gF/uxTNnEpTPTV3bbQ5uoOyMBO8OOWoNri3OY=;
        fh=V6kcQS1327tEc6/i2ebCWqEIrhHECi+Dw9tAqmakQGk=;
        b=PXMFkYxkq9HmU0G/5NIRTPRvdIQdbltOj0r2Ts6OYKbION7eD1skjt2gL8Xqs5ORjd
         /fP3quc7YDmeF0ybxaMLE7oLavYndthRRj3ouFNO4UHlgDLuERQTvw4xjTFcpyVVw45w
         TlrQ+UJJJqLtdzh2CMN52uWKlqiLzoCpIUwB/P27ah1O4xDHVRBkats3Q8Hnml1CDtnO
         5PO85EQBDD6jNlutIuI83lGyfi+tBIyMPhnIKLoYYvq8rXXCy/I62S86ez9mih6JNm4i
         m36caar0e1bvvbEaHu2M12u527VQTLX70uw+a8EUbx//9QwLC4QiQCpBCAEDpuDN+1p6
         /UZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784191959; x=1784796759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IQq0m8gF/uxTNnEpTPTV3bbQ5uoOyMBO8OOWoNri3OY=;
        b=WDtrg39XsQgiS0R3TdpOCIa1XszEwc2ZIhtpFril19MAy1Ikzz2e6cvZWKVJq4E+IU
         e+1qAQ+7m/8OxTE9pIrzGfz+kNsCO4C6MqZ2bVsz5L/oyH6d9tvLdBeHinquE7nuC+0r
         0VILWG2QeodHiR3EizcmloaApGS+zvD7gkm6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784191959; x=1784796759;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IQq0m8gF/uxTNnEpTPTV3bbQ5uoOyMBO8OOWoNri3OY=;
        b=JrBJuUbyn773PPcsTrOrn40rr0IPQE0l2r/BpyngEgGYtTHIZ3B64DLOlB9pWLACNA
         wG85vFpj8txtYywn0kFoOd0iNzM27ALOFUvuSbZfd0m+MXw6LffR8mAPeV/SITvzb9gX
         IIgUqxa81SN5yxKbJWwPt6o9aNCu7J50KTP0UmemFJ3DJGDoKwl1k6dPzFqwrzeijz0a
         672Os5F4jUJ5qcC/KARBYLEDzWpvQhnbhPP9vycg9HfvR0Yr0plauFb5oT/WoNIZQzbe
         yOJZxSzWT9sK8wt1k0hKEqhmWQO12QektqLncGJBnPZ09+a8xP/LXarLNN1DS3pYmRa1
         HO3A==
X-Gm-Message-State: AOJu0Yxrg9KdTzWqe1Gt2JRKGJgoCBxOlP6pQZk2VW67nhyL/tMmW5VY
	QMIR/6cW2eEHefvST7Jn/o72cP05OpMJ7EkbVrhD8gi6YhcIJTG4VriMQZAfm7pkr/WM4l3gNrj
	hxKXT9xa6Wfc0LQrthY4EXfiY/LTil1gIf+xGV1mCkDSh7edqK1TP6A==
X-Gm-Gg: AfdE7cmLOzu2QWLTaI+aSO16DCk3EPIe3gn8p7bx0DWkfNAfCaKfVhWlVQehe3FDn3u
	tQNkRuCc1cXdZAomT2c7doxFs+/YSoDXXVBt/Jp6pI8LDSmWLYP8tJpWruYIXT8leV5+gePo3U5
	aNbSYc0zoACLkZHl6I4yeY0KC70U/NGge08wYX++oP14pQk6djstNNTGAwzGn3abDQzOliE6ZzK
	OSestV6K6lzxqDsKWE4aGZCJRc0GsW50jItQftocyebdT0A2nCSP+U8jJgpOUtMh9q8kUt2q0Fw
	13UJ4lqmKkgAPgPl
X-Received: by 2002:a05:690e:154f:10b0:664:c436:e523 with SMTP id
 956f58d0204a3-667d7babd34mr11429992d50.57.1784191959478; Thu, 16 Jul 2026
 01:52:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715085348.3457359-1-wenst@chromium.org> <20260715085348.3457359-3-wenst@chromium.org>
 <20260715090944.2B4441F000E9@smtp.kernel.org>
In-Reply-To: <20260715090944.2B4441F000E9@smtp.kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Jul 2026 16:52:27 +0800
X-Gm-Features: AUfX_myLEQVBTlPy6_HTTPqxRUbMK0BTjrNXj-lz-dRMS2F8a-I6Tld4DGNkvxg
Message-ID: <CAGXv+5Ffsrc9r6d_RrgL1mBW1Zmt1RxCrMCjaD7vuF3+EaeAqw@mail.gmail.com>
Subject: Re: [PATCH v5 02/16] device property: Add fwnode_graph_get_next_port_endpoint()
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, driver-core@lists.linux.dev, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 5:09=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
>
> New issues:
> - [High] The new `fwnode_graph_get_next_port_endpoint()` helper breaks th=
e `fwnode` graph abstraction by hardcoding OF-specific naming conventions, =
which will silently ignore valid ACPI and software node endpoints.
> - [Medium] `fwnode_graph_get_next_port_endpoint()` fails to unconditional=
ly put the `prev` fwnode reference if an invalid `port` is provided, violat=
ing its documented API contract.
>
> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but iterating over=
 endpoints using `fwnode_get_next_child_node()` causes an infinite loop and=
 Use-After-Free when a device has secondary fwnodes attached.
> --
>
> --- Patch [2]: [PATCH v5 02/16] device property: Add fwnode_graph_get_nex=
t_port_endpoint() ---
> commit 8a16a51eeb8e99439d5b85ce61789ff1153e9060
> Author: Chen-Yu Tsai <wenst@chromium.org>
>
> device property: Add fwnode_graph_get_next_port_endpoint()
>
> Adds a helper function to iterate through the endpoint firmware nodes
> under a given port. This is intended to be used in USB power sequencing
> integration to verify graph connections and supported connector types.
>
> > diff --git a/drivers/base/property.c b/drivers/base/property.c
> > index 0bd45f8b01c14..62c6221d65d05 100644
> > --- a/drivers/base/property.c
> > +++ b/drivers/base/property.c
>
> [ ... ]
>
> > @@ -1099,6 +1099,31 @@ int fwnode_irq_get_byname(const struct fwnode_ha=
ndle *fwnode, const char *name)
> >  }
> >  EXPORT_SYMBOL(fwnode_irq_get_byname);
> >
> > +/**
> > + * fwnode_graph_get_next_port_endpoint - Get next endpoint firmware no=
de in port
> > + * @port: Pointer to the target port firmware node
> > + * @prev: Previous endpoint node or %NULL to get the first
> > + *
> > + * The caller is responsible for calling fwnode_handle_put() on the re=
turned
> > + * fwnode pointer. Note that this function also puts a reference to @p=
rev
> > + * unconditionally.
> > + *
> > + * Return: an endpoint firmware node pointer or %NULL if no more endpo=
ints
> > + * are available.
> > + */
> > +struct fwnode_handle *fwnode_graph_get_next_port_endpoint(const struct=
 fwnode_handle *port,
> > +                                                       struct fwnode_h=
andle *prev)
> > +{
> > +     do {
> > +             prev =3D fwnode_get_next_child_node(port, prev);
>
> [Severity: High]
> This is a pre-existing issue, but iterating over endpoints using
> fwnode_get_next_child_node() can cause an infinite loop and a use-after-f=
ree
> if a device has secondary fwnodes attached.
>
> If a device port has both primary children and a secondary fwnode, the pr=
imary
> ops finish and drop the reference to the last primary child, returning NU=
LL.
> Then, fwnode_get_next_child_node() incorrectly passes this same dropped c=
hild
> pointer to the secondary ops:
>
> drivers/base/property.c:fwnode_get_next_child_node() {
>         /* Try to find a child in primary fwnode */
>         next =3D fwnode_call_ptr_op(fwnode, get_next_child_node, child);
>         if (next)
>                 return next;
>
>         /* When no more children in primary, continue with secondary */
>         return fwnode_call_ptr_op(fwnode->secondary, get_next_child_node,=
 child);
> }
>
> This can result in a double-put. Furthermore, when traversing secondary
> children, the primary ops don't recognize the software node, treat it as =
NULL,
> and return the first primary child again, creating an infinite loop.
>
> [Severity: Medium]
> Does this fail to unconditionally put the prev reference if the provided =
port
> is invalid?
>
> If a caller passes a valid prev node but port is NULL or an error pointer=
,
> fwnode_get_next_child_node() returns early without dropping prev:
>
> drivers/base/property.c:fwnode_get_next_child_node() {
>         struct fwnode_handle *next;
>
>         if (IS_ERR_OR_NULL(fwnode))
>                 return NULL;
>     ...
> }
>
> Could this lead to a reference count leak, violating the documented API
> contract that prev is unconditionally put?

This seems like what the other fwnode_get_next_*() functions are doing.
I'd say this is a pre-existing issue as well.

> > +             if (fwnode_name_eq(prev, "endpoint"))
>
> [Severity: High]
> Does hardcoding this string match break the fwnode graph abstraction for
> non-DeviceTree platforms?
>
> By strictly matching the "endpoint" prefix, this bypasses the provider-sp=
ecific
> fwnode_operations, which could silently ignore valid ACPI and software no=
de
> endpoints that don't follow this exact naming scheme. Shouldn't this rely=
 on
> the backend-specific graph_get_next_endpoint operations instead?

From drivers/acpi/property.c it seems that ACPI graphs follow the same
structure. I don't have visibility into ACPI implementations though.

We also have the following in include/linux/fwnode.h:

#define SWNODE_GRAPH_PORT_NAME_FMT              "port@%u"
#define SWNODE_GRAPH_ENDPOINT_NAME_FMT          "endpoint@%u"

So this should not be a problem.


ChenYu

> > +                     break;
> > +     } while (prev);
> > +
> > +     return prev;
> > +}
> > +EXPORT_SYMBOL_GPL(fwnode_graph_get_next_port_endpoint);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715085348.34=
57359-1-wenst@chromium.org?part=3D2
