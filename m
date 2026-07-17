Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9683E51E4
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784286386; cv=pass; b=IbE3OCKd+aglibTW6qvpmIQmquQrkSHaEcC/wcS+aO2i6h6S5XayHMseOCxxhdIhb3XsBsqoUDLT7WSbyz0IUJ3mT+UWngto/hq0W2WofuYvYqzGALGZs0i4jTtSBoVTV4Q4wk0v44uDhTet/V7NRZUQq9wdV+zYmdCZJL7WDYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784286386; c=relaxed/simple;
	bh=MMxGBEHRYv0PhbSXHbgLbSrYRf7Oa/o80V8Vx20kOWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WBHFjaL3XhEYSK2J06izUL5UTKLfqqDq11lJNItNdFTgBdj9ay5yrmL3tjAPWzJ7BK2cMS3m0Fppex2zF1rHnznBStqmwi0JumN2+1dk9VLRWk86dJKkcI2ZlFmojLT01r5WqryWZK669fyYroEXryuovDnaCAMq0l/jemFUAHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=G2Gmmkig; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G2Gmmkig"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-667f1390f58so5472712d50.1
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 04:06:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784286367; cv=none;
        d=google.com; s=arc-20260327;
        b=XJmis69KkFpPMeAAgRqzhG6Hyz6Szo7qffojjN6JFqUHwHVcoWFSPXa0boUIvQOvfm
         v4DxpJTjD576aVb+y8+Z2JrV1j8GIyAVTqN/Xy0ZJ6effWTAZvpKT9jroOI+PAIxEYC4
         v6X+Or8Kf/zaVWV39hyLyzciJrAdOp81ypBgnRoApZ5kI1ZSRPpMpFUPdpwi7Ed1pBUZ
         XNXF0FgmdFd3iJopNFybOFQu8lb59aegvTqb3F4IRl+jJrhoJBIvfkXh1w2q6qyXrrN/
         +YBljcKU0z8vTHlXYJFrw7Dfgu+0Tav/4Hah1XGMJl8/ui6GKArWUiS8u2//Io6EwYwE
         ay9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=duGi7mDgkkuOmUQuDzMNdNsQ9Y99A4lhMKChdyaHr20=;
        fh=ctjmJBQkrJSpU24+2FDWlCEiP2JgZS0dRE+7x69bwZo=;
        b=hW1BOwR3Pp2cPzE2qRoJKTWULi7NkTZ6QJr06FyoWJrMltAbY9ujOUkuXqsaQLwU71
         tBEvOrFE+eYEhbczhN9D6tky+vErZFkN2D6pWekhOArYe1nYS3jNy8T5sFxbNrwDz2Pm
         gpgF9AJX0remLtD2uBLdwRxY+z8Mss+Tn9GAN1n3BD6CMGKeSche95cYMENsN4bUEArr
         7pBYK2c9HdSJQYt4kzbzryxhlx1TKBlo5KdKkyFiV4QRmJ7egnLGy8ZDV4RlXVyIhZEG
         MlKuJ9XmUcM1so7L1E42WWHx52qKZudbGa5UB/Jd7SFikLAiqwSGOQj7qyJnKvIu+r2U
         6ZZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784286367; x=1784891167; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=duGi7mDgkkuOmUQuDzMNdNsQ9Y99A4lhMKChdyaHr20=;
        b=G2GmmkigJqKGkAF6/E4n+cjIFOdCqNDpzzlTNSUbHsQ3ng+TRFQb7BES+bHlDz/vFq
         o7owoUHkmexE25tRZyo+UVC0JL9u8eU7hIgl8lUdcxqsWNjtU25gDiz6CGWF6a1fps8B
         fhoRIIap67rO1bP2dMR6+zSSxORssdS9htTF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784286367; x=1784891167;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=duGi7mDgkkuOmUQuDzMNdNsQ9Y99A4lhMKChdyaHr20=;
        b=FcK314gEY63OOySM0jNCJ9Ld5ZaERik9hP9y2lXSxaFNMxUS2bvlSIogNO3m/iLJe2
         JBAmwVr8YIVjA5iQ+xlA+31FF9Wq2yiXG46K+1y7e7eHSxrtM6oTnkcpZhr+2ZvzX1kM
         /Sw5djrCmcMNJMlBwiwqkk6S9PIhy9xXp710gl5qPlCCVJ9KO/HtG/cE3GHOe9VSqcv3
         1TNgq2MFHIrL5Ef88/HrJWhPdk44UT5rMXAEV8p1p5mEQ0ajKc3Ijv0Im5d7OmK9kEzG
         zbbXjpGXBTgZdWU6FcWLV+nvT3P3thqHmwh9M53GFER/CzsyBKgYO/O6ZPM2EhM8dipF
         PZEw==
X-Forwarded-Encrypted: i=1; AHgh+Rr6FV+Xz+X3q2jrhtvnmT3nb7CFY/v4o9Q99/LdWBgCxHV3fz/Nee/yihIgQPP3spdZGC5XDuWn0uT/@vger.kernel.org
X-Gm-Message-State: AOJu0YwGCGcVb329/hYV392kZY/AXTPrVJYvdMkjcntq3QvbmR/wJ03H
	qJKJnolrWJ/4spfgMYpHjXgzYoEn/CIwvYLkOcoBgJ24H7axzpDhcUoh9kkU1942FszdBXezfJB
	4lmNJLbM8cXMbFuPz42w8Xy/FUG0+R74qyQnX7CZW
X-Gm-Gg: AfdE7cl9vvjYGqD3TjM4FpTCzL+AQxI8gBgubx9JkD/S2EDHWUe7MPUxadjhTuGapcI
	aECuhfgAil+HhdRx5ZcJ3QLa6FN66jCWVuKAPH6oSmYo39whfv36y23nC9cdjifwOyFFZiM5sFT
	tJHyeWy0gihToq2lN4TJPel/6wuOxmg2qwAhyJUf+dqe72K459k9/bbG35cqtanSknxr3C0Rxq+
	W2geMXaGzPuTzZe0TGcn9VMjxmQuYNI+zb7YMePClFKNmPCSx95hMSqQPX8FdA77msqp1uBbcRv
	1BnCVv4Q5dXL
X-Received: by 2002:a05:690e:454e:20b0:667:a285:7624 with SMTP id
 956f58d0204a3-6683bb6a945mr405792d50.35.1784286367356; Fri, 17 Jul 2026
 04:06:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715085348.3457359-1-wenst@chromium.org> <20260715085348.3457359-3-wenst@chromium.org>
 <20260715090944.2B4441F000E9@smtp.kernel.org> <CAGXv+5Ffsrc9r6d_RrgL1mBW1Zmt1RxCrMCjaD7vuF3+EaeAqw@mail.gmail.com>
 <allHTc-bJrPwDA0b@ashevche-desk.local>
In-Reply-To: <allHTc-bJrPwDA0b@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 17 Jul 2026 19:05:56 +0800
X-Gm-Features: AUfX_myBJ4V-SWOZ-GDiqFvmqO85fuN9BhTsU3Z0DMM9loQQI8vJniOKvrsXuws
Message-ID: <CAGXv+5HS3neb=8EW0FT2-tP-dhPFqQ+q8YRS8Gy_XBic4z4Mug@mail.gmail.com>
Subject: Re: [PATCH v5 02/16] device property: Add fwnode_graph_get_next_port_endpoint()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org, 
	driver-core@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 5:04=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Jul 16, 2026 at 04:52:27PM +0800, Chen-Yu Tsai wrote:
> > On Wed, Jul 15, 2026 at 5:09=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> ...
>
> > > > +struct fwnode_handle *fwnode_graph_get_next_port_endpoint(const st=
ruct fwnode_handle *port,
> > > > +                                                       struct fwno=
de_handle *prev)
> > > > +{
> > > > +     do {
> > > > +             prev =3D fwnode_get_next_child_node(port, prev);
> > >
> > > [Severity: High]
> > > This is a pre-existing issue, but iterating over endpoints using
> > > fwnode_get_next_child_node() can cause an infinite loop and a use-aft=
er-free
> > > if a device has secondary fwnodes attached.
> > >
> > > If a device port has both primary children and a secondary fwnode, th=
e primary
> > > ops finish and drop the reference to the last primary child, returnin=
g NULL.
> > > Then, fwnode_get_next_child_node() incorrectly passes this same dropp=
ed child
> > > pointer to the secondary ops:
> > >
> > > drivers/base/property.c:fwnode_get_next_child_node() {
> > >         /* Try to find a child in primary fwnode */
> > >         next =3D fwnode_call_ptr_op(fwnode, get_next_child_node, chil=
d);
> > >         if (next)
> > >                 return next;
> > >
> > >         /* When no more children in primary, continue with secondary =
*/
> > >         return fwnode_call_ptr_op(fwnode->secondary, get_next_child_n=
ode, child);
> > > }
> > >
> > > This can result in a double-put. Furthermore, when traversing seconda=
ry
> > > children, the primary ops don't recognize the software node, treat it=
 as NULL,
> > > and return the first primary child again, creating an infinite loop.
>
> Yeah, it has to be implemented in a way how fwnode_graph_get_next_endpoin=
t() is done.

If your patch series addresses the issue, I guess we can consider it
covered? Sashiko labeled this a pre-existing.

> > > [Severity: Medium]
> > > Does this fail to unconditionally put the prev reference if the provi=
ded port
> > > is invalid?
> > >
> > > If a caller passes a valid prev node but port is NULL or an error poi=
nter,
> > > fwnode_get_next_child_node() returns early without dropping prev:
> > >
> > > drivers/base/property.c:fwnode_get_next_child_node() {
> > >         struct fwnode_handle *next;
> > >
> > >         if (IS_ERR_OR_NULL(fwnode))
> > >                 return NULL;
> > >     ...
> > > }
> > >
> > > Could this lead to a reference count leak, violating the documented A=
PI
> > > contract that prev is unconditionally put?
> >
> > This seems like what the other fwnode_get_next_*() functions are doing.
> > I'd say this is a pre-existing issue as well.
>
> See this series (not yet applied, you even have chance to review it!):
> 20260611203537.1786399-1-andriy.shevchenko@linux.intel.com

I believe that series addresses the first issue, not this one, even
though it partially mitigates it.

The contract says "puts a reference to @prev unconditionally." What it
doesn't say is that it requires @node to be valid, i.e. the function
is a no-op if node =3D=3D NULL.

"node !=3D NULL" being an implicit requirement seems to be the norm for
the fwnode_* and of_* APIs. It's not explicitly spelled out and Sashiko
lacks the context for it.

I'm not sure this should be changed within this patch. It would end up
as a mismatch between the various functions and possibly lead to more
confusion.

> > > > +             if (fwnode_name_eq(prev, "endpoint"))
> > >
> > > [Severity: High]
> > > Does hardcoding this string match break the fwnode graph abstraction =
for
> > > non-DeviceTree platforms?
> > >
> > > By strictly matching the "endpoint" prefix, this bypasses the provide=
r-specific
> > > fwnode_operations, which could silently ignore valid ACPI and softwar=
e node
> > > endpoints that don't follow this exact naming scheme. Shouldn't this =
rely on
> > > the backend-specific graph_get_next_endpoint operations instead?
> >
> > From drivers/acpi/property.c it seems that ACPI graphs follow the same
> > structure. I don't have visibility into ACPI implementations though.
>
> Sashiko might be right. ACPI has device and data nodes, for device nodes =
the
> name will be FourCC, so never longer than 4 characters. For data nodes, i=
t
> takes their names, which are arbitrary strings and seems should follow th=
e given
> schema. You need Sakari Ailus to review this patch.

OK. Will add Sakari in the next version.


ChenYu



> > We also have the following in include/linux/fwnode.h:
> >
> > #define SWNODE_GRAPH_PORT_NAME_FMT              "port@%u"
> > #define SWNODE_GRAPH_ENDPOINT_NAME_FMT          "endpoint@%u"
> >
> > So this should not be a problem.
> >
> > > > +                     break;
> > > > +     } while (prev);
> > > > +
> > > > +     return prev;
> > > > +}
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
