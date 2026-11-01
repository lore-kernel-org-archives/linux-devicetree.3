Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570696;
	b=fvGNNKRnOBrx3cfJWKIXOrq+it2FiADV3M0tXSe+LyHCXv4mEF2PW5eU4y0HHCH6Az0D
	 lrY2U3amXh7uo4lZGn1FEA6WuZEEkBWC2NqTnubuiXP39imdGm7ZK3bu84nKnUgASHbld
	 QvauIBL204Qoi8yjYUHgnCEiJKt8098m43biZAqzKmEqfdJ1TnIqAz5nwtOavDXb7t0EF
	 AF2hwvQtsK7kGff8TvUUkOuwyQDzmRX+cBTqtjNc2FamuEANpgfe+LYwqIvZvq1vF/thL
	 Qr3mJ63ULJFAsoIhNBtJKVbqolSzkjel4iLP36hP6xNjwLAoNvkaj7gI7zxvAxcx41g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GfITPaw+ci0cbhGP7Wv2b7wNe84LbJlDz+5I1hOer3Q=;
	b=CG4LtW98kRgPG0aFi2nrmFqwBToWmO8y/rgxTY+aWJaLI4bUP4CooVrhPL3Bhncg3A7n
	 mRCNwbyuqdyHUn9tXlfvrXKRF2+I4qukrTY1CjfQsPnyp47pU8Ad6zAxPPLPd/68lj1J2
	 BqG/aqoajjIP1qH7LPOF91R5Gbr0A7+bHUCy38jYWmMeIoRuCTADpuoYQs2Hj0FmSE+dn
	 ns4wa0RqW/Kn0d68rJPBLzhKNl8IhXbh+oYaVmGAua7df0bQN9WguJYzlB+sTIwoSFbMo
	 06TyRIzjtcav5a4hrsuaz08i7d7BS69LjbuM9lciy0ZfyBVPeFSZKs6hhp5qxIFDaew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Yd3huhSl;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5593606A327
	for <Devicetree@vger.kernel.org>; Sun,  1 Nov 2026 22:04:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5593606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Yd3huhSl
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4395d31228so362426366b.1
        for <Devicetree@vger.kernel.org>; Sun, 01 Nov 2026 14:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570694; x=1794175494; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GfITPaw+ci0cbhGP7Wv2b7wNe84LbJlDz+5I1hOer3Q=;
        b=Yd3huhSlSrbDKLcIy7yrALQ9CIa07BTK5t0USLjcsXeiris5wjP4WzWFOL3o6Fr/UB
         ADcf5s1CRO2zpFn2R4LQpkOa9yZEPURcyc0bfRlPdsbdcEHWbAUpOoFUcHIJTu/icUTE
         +8vTUomaGxZIlaAkKvVckE6Di2U/UVXIzHDKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570694; x=1794175494;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GfITPaw+ci0cbhGP7Wv2b7wNe84LbJlDz+5I1hOer3Q=;
        b=0a2gx39odazC1U3VZX4V1yxiwJUXDVPbcgZ5RMGGtuDqDNVhCaSPjKHCdsdbbj5P2t
         tYWZmXjzn0t2n2yu/CxSidE9fN0TkFmXKrmjuHqBO587cp5Xah5xpuQOD24vUW1ZYlld
         /+GvUXWvUtuiTUHaIWf/Nh8JzMjzdjM7D75yB4Q1HiliA4AXZV+hB8jMKdwAo9IwBEdh
         xZ2wu3g/zmd3KT4XZusUOf0q31fnOuoLi//MToKKLhGeaxTOHoFvVn16UTZpIcIIQnT9
         +t8bAuo+Hr3s44ERsGX9n7VUwoq0GED8sZwmtrASO/Mi+OTHnUSNLWFizFWO5pIbEMd8
         +zXA==
X-Forwarded-Encrypted: i=1; AKwUvBxSFzQzC+il3Poh+sL9Yhn/RvDeYO1LPescF1CKpTxpfZr6DrVxa77tNZxQP1Qll904k5cGJOgbOArX@vger.kernel.org
X-Gm-Message-State: AFq9FYLhPs5qM/K3R6BsFiwAIV+su51MnbkYI3FOT8KQg42dphg+6RWv
	VEAq/ANYrf9wgPsGquHtht/47b4cRBw72h7hy8zmLq6wHCW/u3dPp95g0mNhlSN1qeMu7wVW0GW
	/VggdJ0VO
X-Gm-Gg: AYBFou0SaGXkTfG/yT2JkdV4fSj4EoSwnMmoTYNRnQVFmn+m+xso0Q04mef97ddvioz
	e/xuqvCOQScehxFPNMDIY2jKfRDx7m337H3gTdV3n17UyZfkpXZWyob3UEjsp/saTLpc4Ig9EQm
	wvW4KepLfBgdVTWLjYJp5NS5aSJyeRh3HFaxExO4D9z5zHgOSz1U0lloNpBo60Ikehd/U2qokvO
	3iakBO3/gOzOEQID4+1a9mj2BbUcqCV5ri49jcbwVyyOoJVJm5iKbykJeszg+dmgQrmEZO6yAb1
	mtZ/zzaAjOJYy6hQPpjKuZZqK/boPZz8E77S/nciixLhTKqTsrfqJm2kLfthjAkvlQgFSCO3fpr
	3/UpaXNElLMbFdIwQEHYrucgP6knUa0VMS9mSAgaTPVe0fywUt6lAeLZfGRdMYCGHEQjXD9h3Ct
	8wgSnUVZbb2eVWcYMptGuP7BBdk31x9fnXGZ4kv/mCM5cOGpfZxOqRTx2uCUSdGKv8SM7OIpD7D
	ykWUNmMl/KtDZ9prAN3dj9Ptww/U2rnQdb41PxDFCyzsal7UQIqjscJT1ndoRFchTVzd+NSxcV8
	KqvviuSZLKJTwm38xOYxr9FW4rgimjKWj3ETV2oA3Nv8lDMdckeeajleIu93EgC3BJlXK65IxeA
	QrI/5yaass+kD
X-Received: by 2002:a17:907:6d21:b0:c2a:fcb7:62f2 with SMTP id a640c23a62f3a-c4ca7a4e848mr705961166b.19.1793570694091;
        Sun, 01 Nov 2026 14:04:54 -0800 (PST)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe4aa12sm313286866b.52.2026.11.01.14.04.52
        for <Devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 14:04:52 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso15439085e9.1
        for <Devicetree@vger.kernel.org>; Sun, 01 Nov 2026 14:04:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwvUChPSdnOjfg+VXs2jpVW97TIsQ3UMDTsqEL26e1/9A6pRnAJlKwDy6Q1uKV2I88+RoybTmHMR5Kl@vger.kernel.org
X-Received: by 2002:a05:600c:848c:b0:4a5:dc5d:20f7 with SMTP id
 5b1f17b1804b1-4ac175669d8mr216663905e9.14.1793570692011; Sun, 01 Nov 2026
 14:04:52 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028215600.1713475-1-dianders@chromium.org>
 <20261028215600.1713475-4-dianders@chromium.org> <auQjnZ6rd4wqoORz@gractus.seuss>
In-Reply-To: <auQjnZ6rd4wqoORz@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 1 Nov 2026 14:04:39 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VnZH+bBom69RSVT8kfuP-XO_6mVArUQ=ORJagN3m9QTw@mail.gmail.com>
X-Gm-Features: AclHuK_fDlaJvBpebQfnxbn9UYLGLnZlO-sk2Sumr6YeHeQumNhOKE78u883L_8
Message-ID: <CAD=FV=VnZH+bBom69RSVT8kfuP-XO_6mVArUQ=ORJagN3m9QTw@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] pylibfdt: Add NodeTree live tree representation
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, Simon Glass <sjg@chromium.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-kernel@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

On Thu, Oct 29, 2026 at 8:55=E2=80=AFPM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Wed, Oct 28, 2026 at 02:55:53PM -0700, Douglas Anderson wrote:
> > Add a `NodeTree` class to `pylibfdt` to provide an in-memory live tree
> > representation of a devicetree node and its subtree.
> >
> > While `FdtRo` / `Fdt` / `FdtSw` operate on flat binary blobs by node an=
d
> > property offsets, tools that inspect, compare, or transform whole devic=
e
> > trees are much simpler when manipulating a Python tree of nodes and
> > properties.
> >
> > `NodeTree` provides:
> > - `NodeTree.unflatten(fdt, offset=3D0)` and `tree.flatten(...)` to conv=
ert
> >   between `FdtRo` blobs and `NodeTree` hierarchies.
> > - `get_node(path)`, `create_path(path)`, and `walk(path=3D'')` for path
> >   navigation and pre-order traversal.
> > - Typed property getters and setters (`get_str()`, `set_str()`,
> >   `get_stringlist()`, `set_stringlist()`, `get_u32()`, `set_u32()`,
> >   `get_u32_list()`, `set_u32_list()`).
> >
> > Also fix `Property.as_str()` and `Property.as_stringlist()` when called
> > on an empty `b''` property so `as_str()` raises `ValueError` instead of
> > `IndexError` and `as_stringlist()` returns `[]`.
>
> Thanks for splitting this out as suggested.  However, on
> consideration, I don't think it really belongs in pylibfdt: the "f" in
> there refers to "flattened" and this is, explicitly, a non-flattened
> data structure.  I have sometimes thought about adding a library for
> handling non-flattened trees, although I wasn't thinking something
> Python specific.  I think for now let's move this to its own Python
> file / module.

Done. I've moved it out of `pylibfdt/libfdt.i` into its own `devicetree.py`
module.


> > diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> > index 09fa5fb9ef3c..874a03a3c749 100644
> > --- a/pylibfdt/libfdt.i
> > +++ b/pylibfdt/libfdt.i
> > @@ -929,14 +929,16 @@ class Property(bytearray):
> >
> >      def as_str(self):
> >          """Unicode is supported by decoding from UTF-8"""
> > -        if self[-1] !=3D 0:
> > +        if not self or self[-1] !=3D 0:
> >              raise ValueError('Property lacks nul termination')
> >          if 0 in self[:-1]:
> >              raise ValueError('Property contains embedded nul character=
s')
> >          return self[:-1].decode('utf-8')
> >
> >      def as_stringlist(self):
> >          """Unicode is supported by decoding from UTF-8"""
> > +        if not self:
> > +            return []
> >          if self[-1] !=3D 0:
> >              raise ValueError('Property lacks nul termination')
> >          parts =3D self[:-1].split(b'\x00')
>
> The two hunks above are good fixes, but unrelated to the bulk of the
> patch.

Split out into a separate patch ("pylibfdt: Handle empty properties in
as_str() and as_stringlist()") with direct unit tests for `Property`.


> > @@ -1214,6 +1216,261 @@ class NodeAdder():
> >          self._fdt.end_node()
> >
> >
> > +class NodeTree:
>
> Maybe class DeviceTree?  The "node" doesn't really add any useful
> information.

Done. Renamed to `DeviceTree` (in `devicetree.py`).


> > +    @classmethod
> > +    def unflatten(cls, fdt, offset=3D0):
> > +        """Unflatten an FdtRo subtree starting at `offset` into a Node=
Tree.
> > +
> > +        Args:
> > +            fdt: An `FdtRo` (or `Fdt`) instance.
> > +            offset: Starting node offset (default 0 for the root node)=
.
> > +
> > +        Returns:
> > +            A `NodeTree` representing the node at `offset` and its des=
cendants.
> > +        """
> > +        node =3D cls()
> > +        for prop in fdt.properties(offset):
> > +            node.props[prop.name] =3D bytes(prop)
>
> Since we already rely on class Property from libfdt.i, it seems like
> it would be a little more natural to have the dictionary values be
> class Property instances.  Yes, that technically has some redundant
> storage of the property names, but we're not particularly concerned
> about optimisation for this Python library.  Plus, Python's
> assign-by-reference should mean it's generally just a duplicated
> pointer, not a whole duplicated string.

Done. `node.props` now maps property names to `libfdt.Property` instances,
which also simplifies `get_str()`, `get_stringlist()`, `get_u32()`, and
`get_u32_list()`.


> > +        fdt =3D sw.as_fdt()
> > +        fdt_set_boot_cpuid_phys(fdt._fdt, boot_cpuid_phys)
> > +        fdt.pack()
> > +        return bytes(fdt.as_bytearray())
>
> For better symmetry with unflatten(), I'd suggest returning the Fdt

Done. `flatten()` now returns the packed `libfdt.Fdt` instance.


-Doug
