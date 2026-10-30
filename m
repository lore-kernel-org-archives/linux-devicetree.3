Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793364623;
	b=T1T53gfxErSTtuUHFTEIpHShkgtUCnGud6SNHBU6aZeTm04tgEDrkr/HvJNZJh8C2Zjj
	 OOMz/ApEt8H94TD+wehgATMrrXLPWUK0nOQkJDnQPC5DW9iGGRQUUPgt3rPFovo29OFB1
	 X+3FJueItNeOJ4OVCvDLrx6zO8+A7cA7M9HIpxYiSms+dFjSjsmWXx2kDO7wClyKpR02u
	 qqZVQqq8hBL7Eek1++coewbC34RuQF4u8CdNwdpAJme3BcDFx0WvOab4lNvepr2/TisYJ
	 hI/0dNQr0bipNRMXOjBRktOuGGCTGEIQr/7bUVmH4eYlWbbXLAzGKWzUnihK8mscB0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=t8bRsjAT3AdjzhLPogNnMwZmSFERnjnulF5It7XvgSQ=;
	b=31pZQ+qDOQZ1Uvna0vvaGD4MowZLvqc0Wq5DQso0yY/rKP7ojYXGf6sK3iFJ8quf7tkf
	 jPBzpSMor0sxm2020MNQhGR5tPKM24J2RreyXE4gS+HGsbnqlKiLEXqfN97GnU71GkqEr
	 tS4QDQQ2kWBpHDDKB0n3AiNXHUC1e2ZVgboYo3dRYT1TOw0F39+/IWhWe3Ef3B/mYETpS
	 21K03UFhS2ck/R9I7O5zQNBoIrqauPLYvOhndmIX5vq+ShKB19iUxxtkxTGWkwb+NRkT9
	 NdVeAebU+HXSyu5PSBSaBj+A5vrJi1isZjuCR+F7BIJUwOPBnrYsix6Itmvn2Jg8H+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QHrlIIjP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8376F60A2611
	for <Devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8376F60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QHrlIIjP
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b4b7dee316so630189a12.0
        for <Devicetree@vger.kernel.org>; Fri, 30 Oct 2026 05:50:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793364621; cv=none;
        d=google.com; s=arc-20260327;
        b=pHUMD2hM0W3pa9LXLkwOoc3QgYjkwDH20eDLiWq9MmHiv0cUx6LimWpj1C+tl9i7Bf
         JfSdrMb9sq0gtwVgloD5snFI9nhDOUfC6BlPmllUYBerrPTE0DLoVP7FRNDQeEK804gp
         P+2r9bumaCpyvels1Q9t95ZTq+CDuA/6XXqjmAtN96dHkiC9Y2Z4LeM7x6l1B5z+fB5l
         F+GZBqFml3mXLAFqrnS+xVHBids0IApFCnRASZwuXHQXJtk/hmot9lEGnSDh/rUKrrp3
         IA+9YUYutw4e2y6FoFPZNcTYVlEAVBYHO9lvElwtKO26qEIvtmiCEPDWipcPObPFvDG6
         xJpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=t8bRsjAT3AdjzhLPogNnMwZmSFERnjnulF5It7XvgSQ=;
        fh=nPjjKR1yj1Nt1a0fmCtH9nbKLknGTsQ1e/EL48jIj3w=;
        b=FHVAKzaS1oDQ05/B8NKZ5Y0chvYAOVrLaBGY+YarC/mqyvOLkldDOxQgj1zP7flCV6
         eR8Eu53xj+ppfLkZ6ZAhta4fxdvtC6CfRopjTM6j3eDCvmvnejTxgfh9pTIk6zIS1QIT
         MZ2MQLFenWqXQlMKzV+nXsD5fPFvXzC8kPSQ2Vmv4xIRXTRovQr0xkSgCBOdPedYFM2L
         pPUWxASadWHHTwTf/2ySeSWxQk5VdmBB92lYXYWMU6PBAltD++aRgRLb0Hmmwok+FPNH
         WBViHPBcWh3sJJtojckbxvIq2gq6quZcAgcAXTiDRTDH97urDtDbWPjZGxO2YepoCL7G
         GTxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793364621; x=1793969421; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t8bRsjAT3AdjzhLPogNnMwZmSFERnjnulF5It7XvgSQ=;
        b=QHrlIIjPYRpyvppFPBu8+5vfCTAFEeBT02gaKSYxL7dgK8lo4tdAzO7fwvBEqG99z1
         XgorNXrxNiIcXvim5XZdlbG86BCc2jiApMfdqY6bN8FzNmjqQgEWd3DO3w+vc6ZLMXsi
         8BYhGzf+Fv27F3YR6Y+2yrh/QYWKVzIsoHOgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364621; x=1793969421;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t8bRsjAT3AdjzhLPogNnMwZmSFERnjnulF5It7XvgSQ=;
        b=PPddYClXbVGBHMmuHiFGdgciqgogS932+2X3sJ68QMdAnXdrZdWIenmIR30ACUQlYh
         26TXt4qNRWzHhegFx2977cDupii+uK3Ceox/5LksZAdza4yAjtDJww8iTAbIrVp1vJHt
         DFhFTrXmu4qSK3JLW+Ihpf1Cculs/awWUSjpNck/MUV1RvIKAazV0cLF1xwDJQcCg7n1
         IbhVw6+WbCuYiVMcd1W5TvHTKhgDe2zI6tDK91e9UDHiYsKUCN7N8f/TkCfbj7uLoQaT
         vqQwjBavaDK09k1Uqm15x5MaCOF8QP40yX3anrqGS+K69yQACXU37X4Y8nkP4U0hk4lr
         lXEQ==
X-Forwarded-Encrypted: i=1; AKwUvBxB6Oinp+NEtxwU8cmHZN+dNbEaU7Vo5nIQjEqm3sW+jd8nVd81lfXkLMTHxNoWmUUBsopqEQaWbWhX@vger.kernel.org
X-Gm-Message-State: AFq9FYJGviHpNNNgLLU7oFKvcr7qSViggCkTwPajbxdL6gbstZ26OKDN
	cCBAdFDNQM+FP40BaxfgHA7T073yV2kowjMSfodqQy4/PT7ymBKy24wtI9RkqvVwazCxZIVB/LC
	/p6m/OvkysSoN0/W2neVLHVBrNKK25ZjuYwLY8AjVk5IsPt4VNcQFbQ==
X-Gm-Gg: AYBFou0ZAkzV1n4ls8l8VsPHEF5Sw/ifsFL+PuwmYALG3PeYy15Md30GatNqDy6XEiW
	ykyxEAJkkjvRddwtgCTUPLv1+ZZr9zlYcydDWr1Jm1O16xzGryiSbBbuushEOgaMq7uC7mSdRp/
	F1jA4wTKFVP+H3TgGwSDdKw4fYxIssLoiRZqqfJhRSD3HQ/H9KPmR4SBnxM/rEjAQ7B6g43iZ/n
	EvaeQzhUDuhmQzpUAirfQH363z2P6bNJdsV/OVLQDGL2c0uWgLlZWrG5HbynUfo7wTOw374RqW1
	PJSQC/T0pezYNjQa33qTDL0r8ZW+nsE7W3gf1ucUTc4O3B8ggMdEjVqadeet5DlbKbUDlGy/V56
	I3mtesjCro/kP6GeclBEPPPSquMRztG0sxiGYJbp/gSmSPgBBWeJvKfuKUD33YBr+yyhr4As=
X-Received: by 2002:a17:907:2d24:b0:c2d:bc33:7be3 with SMTP id
 a640c23a62f3a-c4ca7b804abmr217479166b.47.1793364620924; Fri, 30 Oct 2026
 05:50:20 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 05:50:18 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 05:39:26 -0700
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261028215600.1713475-4-dianders@chromium.org>
References: <20261028215600.1713475-1-dianders@chromium.org> <20261028215600.1713475-4-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 30 Oct 2026 05:50:18 -0700
X-Gm-Features: AclHuK9XH5inA75nLtEVNACEt-kvj5ilQrhpx6qKrKd1EbyJPnQrCjVXnDxbS0A
Message-ID: <CAFLszTh+c8H6Xcz0LXGjO40XA4=y0jdyAFUr6ygc2OkS9GrHYg@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] pylibfdt: Add NodeTree live tree representation
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, Simon Glass <sjg@chromium.org>, 
	David Gibson <david@gibson.dropbear.id.au>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-kernel@vger.kernel.org, Julius Werner <jwerner@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-10-28T21:46:49, Douglas Anderson <dianders@chromium.org> wrote:
> pylibfdt: Add NodeTree live tree representation
>
> Add `NodeTree`, an in-memory live tree representation of a devicetree
> node and its subtree, to `pylibfdt`:
>
> - `NodeTree.unflatten(fdt, offset=0)` builds a `NodeTree` hierarchy from
>   an `FdtRo` instance.
> - `NodeTree.flatten(mem_rsv=(), boot_cpuid_phys=0)` serializes a root
>   `NodeTree` back into a packed FDT blob via `FdtSw`.
> - `get_node()`, `create_path()`, and `walk()` provide path lookup,
>   intermediate node creation, and pre-order traversal.
> - `get_str()`, `set_str()`, `get_stringlist()`, `set_stringlist()`,
>   `get_u32()`, `set_u32()`, `get_u32_list()`, and `set_u32_list()`
>   provide typed property access and mutation (updating
>   `Property.as_str()` and `Property.as_stringlist()` so empty `b''`
>   properties raise `ValueError` or return `[]` rather than
>   `IndexError`).
>
> Add unit tests in `tests/pylibfdt_tests.py` covering `NodeTree`
> unflatten/flatten round-tripping and helper methods.
> [...]
>
>  pylibfdt/libfdt.i       | 262 +++++++++++++++++++++++++++++++++++++++++++++++-
>  tests/pylibfdt_tests.py |  54 ++++++++++
>  2 files changed, 315 insertions(+), 1 deletion(-)

> provide typed property access and mutation (updating
> `Property.as_str()` and `Property.as_stringlist()` so empty `b''`
> properties raise `ValueError` or return `[]` rather than
> `IndexError`).

When you split this out (as David suggests), please can you add tests
that call Property directly rather than only going through NodeTree?

> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> @@ -1210,6 +1212,264 @@ class NodeAdder():
> +        node = cls()
> +        for prop in fdt.properties(offset):
> +            node.props[prop.name] = bytes(prop)
> +        for suboff in fdt.subnodes(offset):
> +            node.children[fdt.get_name(suboff)] = cls.unflatten(fdt, suboff)
> +        return node

If a blob has two sibling nodes (or two properties) with the same
name, one is silently dropped. I checked with FdtSw: with two 'a'
subnodes under the root, only the second survives. libfdt does not
reject such blobs and fdtfactor reads input it does not control, so I
think it is better to raise ValueError here than to quietly throw data
away.

> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> @@ -1210,6 +1212,264 @@ class NodeAdder():
> +        self._flatten_subtree(sw, '')
> +        fdt = sw.as_fdt()
> +        fdt_set_boot_cpuid_phys(fdt._fdt, boot_cpuid_phys)
> +        fdt.pack()

This reaches into fdt._fdt and calls the raw SWIG function. It would
be worth adding Fdt.set_boot_cpuid_phys() to go with the existing
FdtRo.boot_cpuid_phys(), and calling that instead.

> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> @@ -1210,6 +1212,264 @@ class NodeAdder():
> +class NodeTree:
> +    """In-memory live tree representation of a devicetree node and its subtree.
> +
> +    Attributes:
> +        props: Dict mapping property name (str) to raw property value (bytes).
> +        children: Dict mapping child node name (str) to child NodeTree.
> +    """

BTW in patch 7, fdtfactor adds 'phandle' and 'fixups' attributes to
NodeTree objects on the fly, so they carry attributes the class does
not declare. Since unflatten() uses cls and create_path() uses
type(self), subclassing already works, so a small subclass in
fdtfactor declaring these two attributes would be cleaner. What do you
think?

Regards,
Simon
