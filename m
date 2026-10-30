Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793364629;
	b=HwoxwFiG/QddiMBhT2NljyvsSUS1T7uui6Y3Xsn4wPJvklBmoSxKe9cDpfyzHIQjdXOr
	 s4Y9n7rnTINYOUwQdBvn4HRQVDT8JKExu7mHLQNlyyeiPCkoje14nVud32Ol0c4WnXist
	 ieCzHCc3NbCJY1S1/1r0+LKRTBHYqEZcAsWKtiEHPNdxDP7YKT8Sy1ImF6Dp7yzxUC+ic
	 IUiNuKS0FENvGM9dDIn5W6Z0jYDBXvmC6cu0Uk5vk29tQcX6SjiWoCJS5B9VGl0SWP949
	 umT0DsgEcSQhucDL/oDDrbyWmjonAM4RJjxInDHgMnJ6raPw+ENQsyzZPPefZ00lN5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=apsqo/umYNQ4NLY3kr6+1CRtc6C+cK0QqTdi+p9pSSQ=;
	b=u56KWNWdHeCl1W2KW/I/XQSW+sFLp1BpBRhhMDMc3fC3qOf9kd18orwBbliSKQfW1VPz
	 PZba7rKNTnTAQutqsGyjWs4de3Y7C8ifg8cqbXqZjFnJ89eXUaap9L/5h1F18vKxefcmS
	 vpWiDtnHeRTm/VCNTzXwMhVJXSkd66AWhXqtOrx8rKqSNVi38GEO+Hbb6z9VRDmtY543q
	 jdXY4sEpc5aCvBycSDe6XWbaRDXYK8+zcQJ9GDEAIp0TiB7Ox9RCmM10G1828gI2ONf1i
	 xUx9HiRH5QdOBPVXfVLQxkDPOs26rBNwsD3nDDRUVn6BgYDBSCzVgYsLi7XFB8KHvbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Jj9wHGbo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465C260A2628
	for <Devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:50:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 465C260A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Jj9wHGbo
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b488586facso782228a12.2
        for <Devicetree@vger.kernel.org>; Fri, 30 Oct 2026 05:50:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793364628; cv=none;
        d=google.com; s=arc-20260327;
        b=DUBRl4pGfAct8DWduyJD74Dmk7dtqk5indJ3Juhd1iCF6d0+8CorCuAZAjonMlX/3j
         k42McRN0wcMrtPuU5lGDAg8jdvR0fKLZrCLqSAFRk5hcIM/5EGSPpbuMVwej2o5HAlEl
         xNbIuZ0ZXo6kZQCMZPKr1DRuFBzGVdvv7yYJBzfPGgPYQcxpW9ahjvfYAmg2JhGWb9/t
         gqWGweJE3oqVdITy7VgyH6FW9ZjOFZXfJddpbJZYte+F9S3FwnH0UlGSQZYeNxE+2lsK
         3EB/tfo2TUvatqkk97+HstB8umSFDpEcFpZEPao4zA3T2rjDuD7rtsOA3EC4VXOkt44Z
         E9qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=apsqo/umYNQ4NLY3kr6+1CRtc6C+cK0QqTdi+p9pSSQ=;
        fh=cyEJHMSz0Y9qeXoh+OV/NRfVhM46W/jgF8S2jcLu7kQ=;
        b=XpvEbegDM44A4g2tFJPpLcbLt7IyV3ii5vz3eyZeuhDU9HQkQWjKa16PehJp5NnDRa
         rOike5tQnxht7tJl+Kh/aC8Q+vYfdx3CtfoqyKw/4GZe83BseQt2HYEZRBrFajGSQ21C
         /joN/z6rodOueADDmvX2s64Jfpg1JoR6r8gADgtX7I1Eggu1nTyQtWCLoByy4gcj9dYn
         DyeOanRdg2qaAfPLgpLlmKx5seUtexO59przsyAYtHN5PeArYafCSLs/fYgtpUX+mdzS
         A0dmrrb8UF9SIqt9iYsWGm4qTRW7Ptw0HLNU0ncM4jP0J50HrP/uGt4b3pLBlLIexJvv
         EY5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793364628; x=1793969428; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=apsqo/umYNQ4NLY3kr6+1CRtc6C+cK0QqTdi+p9pSSQ=;
        b=Jj9wHGbo/QDEQzjCYIErEejQnWr2dSfwImTX+2pg7uc/ZobTx7hM5Wmeye4LaTU9Ov
         DrbBOAB06J4r3OQGWY0ocJgidwc8fVNk3FoYZh/3A4+lerqVPnmUOVeF6ebntdWgg0a6
         y2kgkoZmmg6lzF4GQQvUXYPwo46uNBXOCLWsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364628; x=1793969428;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=apsqo/umYNQ4NLY3kr6+1CRtc6C+cK0QqTdi+p9pSSQ=;
        b=aFhF7GcwiCb7aQJ/qKZ7704ptD2mW6vLSNRiCRgtuCQuS/kGaS5/sTFzdmN4QIIpmY
         xjQK8t9YaItsCqhPK5lf82Y3J2pgqUC2Czpyz8Lp5RFukmKeNtG1GIRXh1mj5t2ZFxjT
         6Awm4f+KgcHXNCjkLE/IkH8nmU0ZMu1ndbjDcLbnG0FybZeI8y3Z1ht6+NJhP2drytHh
         NMB/mNj/jSKVOaTHXTSf9xgUmBXxcxWv6CK/PLMErUW/HJ2w51UXeeZw+O3joOqRbo5v
         Pg6w2cC2uANzzR+6DPalP2N5NcZ2zKydWYmEPqPsW+sOmFGvkYcwra6pWJWp6SstCJbq
         72SQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+e6VxkFA5j4+J1VMxdm6UCco6x5zKeptE8ZSRIIcTme3sFYTydvNDQAYJaL4sAyQuOcwsq9laTX1A@vger.kernel.org
X-Gm-Message-State: AFq9FYKceCJj9pk3Oj6D7Ry5csPU+D6QtxRgNWy/ZKjTLmi7z1iMOwCG
	UzSJfHvKkf2Tm508A+PKY3kXfM9cHRcLUNWYgCYJRNIYJt57CGG+gLARbVC8RtCxzSJ3MQu9aHv
	el2Dno38t8c/NBjdNkGODcN7Du4LBV58GfrwQNPiX
X-Gm-Gg: AYBFou36EnLdezpgFey9w3uX2SQ9aLZI2kATeJO95ifjxHKkkxMWNftJpAOzfjkx0Ie
	Emrv0sFJLNklDqRvRlNPjlm2wbC6ZxmvVCqQSHvKqzLjo1+qFNKEpFlTy7RxESG7Tkfjuuz/0EB
	UM/JQWr4mmwLmH8elSZlUVaHJBbt7l/V5ABK5Eubk9utsHpRpvac4cmVq90mlCOpyOqtIQOWpzj
	W5NuXhb6coyNsFU4uFyfKtzL3UHlTZJkIqOQ+zNzFW1nksLV0J3boWYYDB3SKKv/rcdlg1VT+gX
	F07Nq/1aC4oE4+0R9XeQR+RECIkoknJOfzkUoUN4Z/FezOBe8Y5N7LdmqTUhlzRGEGchBt0d188
	BTJ+MT03TorDBAdXT1j8/R0SVkbz35j6qmU6bf/fWzZjzYMsKZt3Mrj5vyMyKA/XHUVzbZ7J9
X-Received: by 2002:aa7:df01:0:b0:6b4:2aa6:2c01 with SMTP id
 4fb4d7f45d1cf-6b4d4388aa5mr1133675a12.10.1793364627770; Fri, 30 Oct 2026
 05:50:27 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 07:50:26 -0500
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 01:16:39 -0700
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261028215600.1713475-7-dianders@chromium.org>
References: <20261028215600.1713475-1-dianders@chromium.org> <20261028215600.1713475-7-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 30 Oct 2026 07:50:26 -0500
X-Gm-Features: AclHuK8L6meqwjbfB-L4EcqmtNeCHqn056gMpoY369WMlqost4cGNB_3vwZ7Avo
Message-ID: <CAFLszThT8vt_C+UCbDXO=Yxx=zK04g+6efRb+Ji5MLyj53UCvA@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] libfdt: overlay: Update base /__local_fixups__
 on apply
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
> libfdt: overlay: Update base /__local_fixups__ on apply
>
> When a base device tree is compiled with `dtc -L` (`--local-fixups`), it
> contains a root `/__local_fixups__` node recording the byte offsets of
> all phandle references in its properties.
>
> Previously, `fdt_overlay_apply()` updated the base tree's `/__symbols__`
> via `overlay_symbol_update()`, but left the base tree's
> `/__local_fixups__` untouched. As a result, applying an overlay to a

Please can you put the motivation first and use the present tense
('fdt_overlay_apply() updates /__symbols__ but leaves
/__local_fixups__ untouched...')? It would also help to say why anyone
needs an accurate /__local_fixups__ in the merged tree. Patch 8 gives
the reason (an OS that wants to know which cells hold phandles, and
the merged tree matching what 'dtc -L' produces), and that belongs
here, since this patch changes behaviour for every libfdt user.

> base tree with `/__local_fixups__` left `/__local_fixups__` missing the
> phandle references introduced by the overlay (both from the overlay's
> `/__local_fixups__` and from its resolved `/__fixups__`), and left stale
> offsets if the overlay overwrote a base property that previously had
> phandle references.
>
> Add `overlay_local_fixups_update()` to update the base tree's
> `/__local_fixups__` whenever `/__local_fixups__` is present in the base
> tree:
>
> - Remove pre-existing `/__local_fixups__` properties for any base
> [...]
>
>  libfdt/fdt_overlay.c | 621 ++++++++++++++++++++++++++++++++++++++++++++++++++-
>  tests/run_tests.sh   |  19 ++
>  2 files changed, 636 insertions(+), 4 deletions(-)

> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> @@ -1122,6 +1121,616 @@ static int overlay_symbol_update(void *fdt, void *fdto)
> +		next_lf = fdt_subnode_offset_namelen(fdt, node, name, namelen);
> +		if (next_lf == -FDT_ERR_NOTFOUND && create) {
> +			char namebuf[256];
> +			int old_struct_size = fdt_size_dt_struct(fdt);
> +
> +			if ((size_t)namelen >= sizeof(namebuf))
> +				return -FDT_ERR_INTERNAL;

I can see why the copy is needed, since the name is in the same blob
and fdt_add_subnode_namelen() may move it. But libfdt has no limit on
node-name length, so a valid tree with a long name makes
fdt_overlay_apply() fail with -FDT_ERR_INTERNAL, which is meant for
libfdt bugs. It also puts 256 bytes on the stack in code that runs in
bootloaders. Please can you either avoid the copy (e.g. by re-reading
the name after the splice, adjusted by the delta) or at least return a
proper error code and document the limit?

> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> @@ -1122,6 +1121,616 @@ static int overlay_symbol_update(void *fdt, void *fdto)
> +		if (old_len % sizeof(uint32_t))
> +			return -FDT_ERR_BADSTRUCTURE;

-FDT_ERR_BADSTRUCTURE means the structure block is corrupt. Elsewhere
in this file (e.g. overlay_symbol_update()) a badly sized property
value gives -FDT_ERR_BADVALUE, and if the property came from the
overlay's /__local_fixups__, -FDT_ERR_BADOVERLAY fits better.

> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> @@ -1122,6 +1121,616 @@ static int overlay_symbol_update(void *fdt, void *fdto)
> +static int overlay_validate_local_fixups(const void *fdto, int ov_lf_root)
> +{
> +	int lf_frag;

Just to check, is this needed? overlay_update_local_references()
already walks the overlay's /__local_fixups__ against the overlay tree
from the root, returning -FDT_ERR_BADOVERLAY if a node is missing. So
by this point each /__local_fixups__/<frag>/__overlay__ is known to
have a matching /<frag>/__overlay__ in fdto. If I have that right,
this function and its call can go, which also helps with the size
issue below.

> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> @@ -1162,6 +1771,10 @@ int fdt_overlay_apply(void *fdt, void *fdto)
> +	ret = overlay_local_fixups_update(fdt, fdto);
> +	if (ret)
> +		goto err;

One thing I'd like to check before this goes in.. this changes what an
exported function does. A base with /__local_fixups__ now needs more
free space (so it can hit -FDT_ERR_NOSPACE where it did not before),
and unrelated empty nodes under /__local_fixups__ get pruned. Please
can you update the fdt_overlay_apply() comment in libfdt.h to describe
the new behaviour?

Code size is also worth a look. With -Os, the fdt_overlay.c text grows
from 3040 to 4904 bytes on Thumb-2 and from 4770 to 7983 on x86_64,
about 60%. That code goes into things like U-Boot SPL, mostly for
boards whose base has no /__local_fixups__ at all. Could this be made
optional for size-sensitive users, or at least slimmed down? What do
you think?

Regards,
Simon
