Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793766562;
	b=YoY6l1og/CeGenZjiNCERw7IihwPSnzf15YKE9OKTKWvCFhtmU+z0dYNlYs4eaBItCiH
	 VbpFc417SYYX0c7SD2gXj8Th9T/pLWZP0OAhfTcUgJrLoP2v02dcEtNj9B3bQAlLxhtRb
	 tAe8U2N1KzLQMa1CFXqw0Lnawyw/k+ikQadtqu/he49oJE2O6N12o1HPyID6zO+SN1qg8
	 DkMFVA/nt5EKSjOdYPoLzy62zUEw6o+8Ul0XkvlTzZw3T+kLJAzrmfwb0GzAy+oQZ9h1x
	 0Ce2QHune3LMyC1pqMogAcEyBzkwRBz/0XuXVKkLaER7tedovhlbDuPvPvBSI253+sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793766562;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=s9VTcseFRjItBb8M0/dM+uCKSe8QR9zyb/UHNpdb02M=;
	b=W98p2bOO0l4hU+APOmRIBq7QOUtI2UZbShSwbRw0HCrHN0AuNxCgStbIA7xrIbduHXTt
	 Hmoqgd/MoefRbHJSImbPH+I3AnuaZGbRUa/l4r10K6Mh4aPd7DAtsZftNBC36LIqfXBzr
	 BsVoHbXa179NmZBwe41E5ZLxg06+GQTXGKfzggAhx4DVS7d97y8AwG98bdkJq5P9SFhLJ
	 foYPbkuSASFEGTunllqXGPfQhGk9dAworNidUB572uisWL3HZOJSskPuaobvLn3ocZ+6q
	 jS+ADt0KR8D5Vqu7PBFiDec1M1W3VHmtG1w/VSOuCMA2PD+apcDEwozlltA9kVd2utw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=UIXNMrgN;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5D6606A32C
	for <Devicetree@vger.kernel.org>; Wed,  4 Nov 2026 04:29:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C5D6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=UIXNMrgN
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c45551fa84eso47546966b.3
        for <Devicetree@vger.kernel.org>; Tue, 03 Nov 2026 20:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793766560; x=1794371360; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s9VTcseFRjItBb8M0/dM+uCKSe8QR9zyb/UHNpdb02M=;
        b=UIXNMrgNukq8PJJh5G1xlaNLNBUwu95EQX/j/TDzuTSJD4iI+TRgDgwweFxwIbNmAk
         Ity2m0kF/b6zwmMINESMTTrRGygFT5TQd9O9TTCGr/KmWt6GBp6gWYtYfwFBZLpFbHv8
         ytDkM++AMv5NHun0HwDP52pLeVa8ZIZdVpCqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793766560; x=1794371360;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s9VTcseFRjItBb8M0/dM+uCKSe8QR9zyb/UHNpdb02M=;
        b=uGxWE0P7P3MZEkXZUzcMgznvJU4eXIYVln7mh5G26XMRQEMuOFnKggf9TlfkAhfXxR
         dVWlERms3aKU5H3nqR1ys1R6AcJ3DB4uoR5TgXyul6x3h+ClYLJpfn0FyRdyq7Y8WtRL
         cscnJ+94iEvuEHOvu1Q4aeRXfkxYTLR92BTqJXaGl/gNaGgCYds0KnH9oPrII8gWC2AM
         nTSG6xfVpjP6oY5saVcTIuqftylkPh9kZIg8ZcKKyvYEUvGrVglBdJrwbQQ2PPTRV1TC
         0LgwwL2enpX16d82HlKlWQsLD10HWIEI3hfXAKiItjEnRdGUdGlK2sN8FDmuydq5f9LS
         ZX0w==
X-Forwarded-Encrypted: i=1; AKwUvByS2zckvZ6hrliSaidX8K+OpFJ43rMdrUejiVA8of4SQc+B3ZxLwaRVs/h9wDaKZ/+BXhRxCofWI30t@vger.kernel.org
X-Gm-Message-State: APuU4Z+Q/LB7++z/rx9wxgcjhiahyZzVGi/7102ohwvV+WTgMAi7vkJ8
	sC8yvcD3Mhv03dZNdozWi4r/Vu1TUCe4BRiI89WnP9V6pldeDdIZ+OjUHSVaj8uHAPHv8zSIOBj
	RBV+dwA==
X-Gm-Gg: AYBFou3HL1Gg/IO+aogw2SKxDDvesce4fKTkYrxsRImHItod82p2tNN/y25Sywn/IYg
	fzkLJTtNWO+9aUOBbt7V3bLoJOLV1xkQedDrPnNLPMxuGgai/5sqWAfx7TcJ9VpoDUVuWsEs9Q0
	8uAwr54CljIIx22gM/f6b5tELdbrHSqeEDg2xzlvHetkGJkp6Vb+NjtD3H5yt4JhoAp3VGmbbJy
	PAmwNggoSC/ci42RCDoYDX1rieYVoxenqbXLqWGJyW0ct00MElECqGymcU0EoDEjqhHX9QjLKQm
	CRaIXyB3lCMLpxRObsqtpCfZUkRL78LirlA/QsO8/9T6/V6WreKSJqmYp1G4nN2SWC15MW7BjFn
	KM0hTRzY7wO0VA2SmXE1Qbr98WMNlAB94juPKfgSaAt33kpMjB1HKkDXCExYQSJBfO431xPHhDr
	qHEl6M2669DcKAmPC2RJ38bCGOncLsSrFYhg3jNM3h7XK+MHFJNZWBzBtWPcSM6wjYR4He6/rOU
	YmOafTrTsyOk5YVur5FU3BAhkX0qrfCj2Ffvzb9KlNBst69b3K+Y42xWQqa3KGMt5JVRIjypUae
	Ro04H+kNp/JWAJkcJ/B3vstYLKMG2y/x/L3UcTyBSKAgUrPOM3V57jvM2BroWSFOw7o=
X-Received: by 2002:a17:906:d54a:b0:c49:b952:5425 with SMTP id a640c23a62f3a-c4ca7ab94ffmr1218921366b.45.1793766559717;
        Tue, 03 Nov 2026 20:29:19 -0800 (PST)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e46a44esm30514166b.59.2026.11.03.20.29.18
        for <Devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 20:29:18 -0800 (PST)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so1733015e9.1
        for <Devicetree@vger.kernel.org>; Tue, 03 Nov 2026 20:29:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwOmCTEopvTT15jK98YbItuKLEdPHSF+KoQE6s9Ea8pltE8rvnjHFRfCr2cAqUMDX7yRy/6jjMBgnY/@vger.kernel.org
X-Received: by 2002:a05:600c:350b:b0:4a3:2f35:38aa with SMTP id
 5b1f17b1804b1-4ac1932bac0mr304971575e9.29.1793766557744; Tue, 03 Nov 2026
 20:29:17 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101220224.1436242-1-dianders@chromium.org>
 <20261101220224.1436242-8-dianders@chromium.org> <auhYb6FV2dPrbVxB@gractus.seuss>
In-Reply-To: <auhYb6FV2dPrbVxB@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 3 Nov 2026 20:29:06 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vzyu7Jfg43yZQmThc5O007h2Ch5J3cnc4FG3eJUj8pNQ@mail.gmail.com>
X-Gm-Features: AclHuK-EI94Ty2au4xO-ZKZ76QhCMiI3A7chng9xu_64EGkNq0XD6rjuoimiGkw
Message-ID: <CAD=FV=Vzyu7Jfg43yZQmThc5O007h2Ch5J3cnc4FG3eJUj8pNQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/15] devicetree: Add DeviceTree live tree representation
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, Brian Norris <briannorris@chromium.org>, 
	linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

On Mon, Nov 2, 2026 at 1:31=E2=80=AFAM David Gibson <david@gibson.dropbear.=
id.au> wrote:
>
> On Sun, Nov 01, 2026 at 02:01:14PM -0800, Douglas Anderson wrote:
> > diff --git a/devicetree.py b/devicetree.py
> > new file mode 100644
> > index 000000000000..198ab73eda88
> > --- /dev/null
> > +++ b/devicetree.py
>
> This should probably go in a subdir, since it's not part of dtc
> proper.  I think putting it in pylibfdt is ok, even though it's not
> technically part of pylibfdt either.

Sounds good. For v4 I'll move `devicetree.py` to `pylibfdt/devicetree.py`
and update `pylibfdt/meson.build` and `tests/meson.build` accordingly.


> > +        node =3D cls()
> > +        for prop in fdt.properties(offset):
> > +            if prop.name in node.props:
> > +                raise ValueError(f'Duplicate property {prop.name!r}')
> > +            node.props[prop.name] =3D prop
>
> This is, technically aliasing the Property returned directly from the
> flattened tree, which seems a little risky.  Or at least it does if
> Property is mutable, which it appears to be as a subclass of
> bytearray.
>
> On consideration, that kind of seems like a pre-existing mistake - the
> way we use it, I think it makes more sense for Property to be
> immutable (a subclass of 'bytes' instead).  I wonder if making that
> change would break things.

Note that `fdt.properties(offset)` (via `get_property_by_offset()`)
already allocates a fresh `Property` object with copied bytes on each
call rather than aliasing the underlying `Fdt` buffer. Even so, having
`Property` be mutable is definitely footgun-prone when `Property`
instances are stored in `DeviceTree` or shared across nodes, and making
`Property` subclass `bytes` instead of `bytearray` has some nice extra
benefits:
- `Property` becomes hashable (can be used in sets/dict keys) and its
  byte value is immutable.
- `fdt.setprop()` and `sw.property()` C SWIG typemaps require
  `PyBytes_Check()`, so previously passing a `Property` directly to
  `fdt.setprop()` raised a `TypeError` unless wrapped in `bytes(prop)`.
  With `Property(bytes)`, a `Property` can be passed directly.

Looking into compatibility for external `pylibfdt` callers if we switch
`Property` from `bytearray` to `bytes`:
- All existing tests in `dtc` pass without modification, and U-Boot's
  `dtoc` (`tools/dtoc/fdt.py`) immediately converts the `Property` from
  `get_property_by_offset()` to `bytes(p)` anyway.
- Indexing, slicing, `len()`, iteration, `struct.unpack()`, the buffer
  protocol, and all read-only bytes/string methods work identically.
- Equality comparisons (`=3D=3D`) against `bytearray` still work, since
  `b'abc' =3D=3D bytearray(b'abc')` is `True` in Python.
- One subtle difference is that `bytearray` has a `.copy()` method
  (`prop.copy()`) whereas `bytes` does not (`b''.copy()` raises
  `AttributeError`), though we could easily keep `prop.copy()` working
  by aliasing `copy =3D __copy__` on `Property` if needed.
- The only things that would break in external callers (and can't be
  shimmed on a `bytes` subclass in CPython) are:
  1. Mutating a `Property` in place (`prop[0] =3D x`, `prop.extend(...)`),
     which seems unlikely since `Property` is a disconnected snapshot and
     mutating it never updated the `Fdt` blob anyway.
  2. Explicit `isinstance(prop, bytearray)` checks.

In my draft v4 branch I've queued up a preparatory patch ("pylibfdt:
Make Property a subclass of bytes instead of bytearray") that changes
`Property` to subclass `bytes` via `__new__(cls, name, value)`, updates
the `fdt_get_property_by_offset` SWIG typemap to return
`PyBytes_FromStringAndSize()`, and drops the redundant `bytearray()`
wrapper in `FdtRo.getprop()`. Let me know if that sounds good to you or
if you're worried enough about compatibility with external callers that
we should keep `Property(bytearray)`.


> > +        for suboff in fdt.subnodes(offset):
>
> So, this can be a later improvement, it doesn't need a respin, but
> this is a pretty inefficient way of unflattening the tree.  To get
> from one subnode to the next subnodes() needs to traverse everything
> in between in the flattened format - which is also what the child
> unflatten()s do.   So on at every level making this roughly O(d * n)
> where n is the number of nodes, and d is the depth of the tree.  You
> can unflatten in a single O(n) pass over the tree.

Since I'll be spinning v4 anyway, I've updated `DeviceTree.unflatten()`
in my draft v4 to unflatten in a single O(n) pass using
`fdt.next_node(offset, depth)` and a node stack.


> > +        fdt =3D sw.as_fdt()
> > +        fdt.set_boot_cpuid_phys(boot_cpuid_phys)
> > +        fdt.pack()
>
> The pack() is harmless, but probably unnecessary - fdt_finish(),
> called from as_fdt() leaves an already packed tree.  Unless something
> resized after that point, which set_boot_cpuid_phys() shouldn't do, it
> should still be packed.

Good catch. Looking at `FdtSw.as_fdt()`, while `fdt_finish()` packs the
FDT header's `totalsize`, `FdtSw.as_fdt()` currently doesn't trim the
backing Python `bytearray` to `fdt_totalsize()` (unlike `Fdt.pack()`,
which runs `del self._fdt[self.totalsize():]`), leaving trailing buffer
slack in `fdt.as_bytearray()`. For v4 I plan to add a small preparatory
patch ("pylibfdt: Trim Fdt bytearray to totalsize() in FdtSw.as_fdt()")
so `FdtSw.as_fdt()` trims the `bytearray` to `fdt_totalsize()`, and drop
`fdt.pack()` from `DeviceTree.flatten()`.


> > +    def get_str(self, name):
> > +        """Return property `name` decoded as a NUL-terminated UTF-8 st=
ring.
> > +
> > +        Args:
> > +            name: Property name to look up in `self.props`.
> > +
> > +        Returns:
> > +            Decoded string value (without the trailing NUL byte).
> > +
> > +        Raises:
> > +            KeyError: If `name` is not in `self.props`.
> > +            ValueError: If the property value is not a single NUL-term=
inated
> > +                UTF-8 string.
> > +        """
> > +        return self.props[name].as_str()
>
> Rather than having wrappers around all the class Property acccessors,
> would it be simpler (and only slightly more verbose) to just have a
> property() method, returning a Property instance and use its accessors
> in the caller?  Looking up properties with __getitem__ could also
> work, although maybe the fact that doesn't get subnodes would be
> confusing?
>
> I guess that would also require a bunch of new class methods on
> Property for the set* side.

Yeah, that works out nicely. For v4 I've queued up a preparatory patch
("pylibfdt: Add Property.from_*() creation methods") adding
`from_cell()`, `from_uint32()`, `from_int32()`, `from_uint64()`,
`from_int64()`, `from_list()`, `from_uint32_list()`, `from_int32_list()`,
`from_uint64_list()`, `from_int64_list()`, `from_str()`, and
`from_stringlist()` classmethods to `libfdt.Property` as the
counterparts to `Property.as_*()`. Then in `DeviceTree` I've dropped all
the `get_*()` and `set_*()` wrapper methods and replaced them with a
single `DeviceTree.set_prop(prop)` helper (which stores
`self.props[prop.name] =3D prop` so callers don't have to repeat the
property name when setting a `Property`).


> > diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> > index ae46b29a8f5c..cfdb8f5749b6 100644
> > --- a/tests/pylibfdt_tests.py
> > +++ b/tests/pylibfdt_tests.py
> > @@ -11,6 +11,8 @@ import types
> >  import unittest
> >
> >  sys.path.insert(0, '../pylibfdt')
> > +sys.path.insert(0, '..')
>
> See above about location of devicetree.py.  But.. for that matter,
> with the code in a separate module, it probably makes sense to have
> its tests in a separate file, too.

Makes sense. For v4 I'll move the `DeviceTree` unit tests into a new
`tests/devicetree_tests.py` file and run it alongside `pylibfdt_tests.py`
in `tests/run_tests.sh`.


> > +    def testDeviceTreeRoundTrip(self):
> > +        """Test unflattening and flattening a tree via DeviceTree"""
> > +        tree =3D copy.deepcopy(devicetree.DeviceTree.unflatten(self.fd=
t))
>
> What's the deepcopy for?  You're not retaining the original
> unflattened copy.

I'll drop that in v4. (It was a leftover from testing
`Property.__deepcopy__()` before that was split out into its own test in
`pylibfdt_tests.py`.)


> > +        self.assertIsInstance(tree.props['compatible'], libfdt.Propert=
y)
>
> I don't know if directly accessing the tree's internal dictionary from
> outside is a good idea.

My intent was for `props` and `children` to be the primary public `dict`
attributes of `DeviceTree` (rather than internal/private state), which
keeps property and child-node lookups, iteration, and deletion
(e.g. `node.props['compatible'].as_stringlist()`, `node.props.get(...)`,
`del node.props[...]`) idiomatic in Python without needing a parallel
set of dict-wrapper methods. Dropping the competing `get_*()`/`set_*()`
wrappers on `DeviceTree` and adding `node.set_prop(prop)` makes that
model much more consistent; for v4 I'll also update the `DeviceTree`
class docstring to explicitly document `props` and `children` as public
attributes for callers.


> > +        tree2 =3D devicetree.DeviceTree.unflatten(fdt2)
> > +        nodes1 =3D [(path, n.props, list(n.children.keys()))
> > +                  for path, n in tree.walk()]
> > +        nodes2 =3D [(path, n.props, list(n.children.keys()))
> > +                  for path, n in tree2.walk()]
> > +        self.assertEqual(nodes1, nodes2)
>
> I don't think it's guaranteed that walk() will get the nodes in the
> same order each time, so you probably want sets instead of lists here.

Will fix in v4 by comparing
`{path: (n.props, set(n.children.keys())) for path, n in tree.walk()}`
(and using sets of paths in the other `walk()` test assertions).


For now I'll hold these draft v4 changes in my local tree. If you have
any feedback on the responses above (or any other patches in the
series) I can make further changes before actually sending out a v4.
If you'd prefer me to send out what I have now so you can review the
latest-and-greatest, I'm happy to do that too. If nothing else, some
of the changes we've made to how DeviceTree works here bleed into the
other patches a little, so sending a v4 before you review further
could be nice. ...but I also don't want to churn the series faster
than you're ready for it. ;-)

-Doug
