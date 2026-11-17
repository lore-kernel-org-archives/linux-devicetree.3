Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794932272;
	b=ac37zTp2XgqBrjGq/AVIQfVkJpQ46s0EeG4WH9QPuPUvIKTQfwG9nof+LxZbvQufBP4K
	 OubO/lZ7XZ1hfk/9bep52QnQtyicN/uYnov/kBkNSA0yCVzKJX+DNDwkyCSUfAEI/fEbT
	 a14iCni8dpVFKdIuPyesnUDDloKTsIE1qoU/z0Y3mlp5M+VmDH30rEZLY9NK7ct2CSI0d
	 CUGn7VzzUvTbUZckfkNRIyIOENZXyTrq8xJKSiP4Qyf3m1t0rSZgbktfMUoO5EvwqwwjD
	 25SE38x6mhLBiZZ7MRjgIYuyE0VkMbmthTqFIRBlcoYFIpBiVkyqLsENSgVxJvZfT2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=JRkNuO7f+W9Ho8PIBHE7MaDQUw/2iOTiv6p4KY7Nkys=;
	b=bGKEJAE9xnyv1kB4nw8okMRFXo/QdBd/XrhBrEy3CCHrRQdlsAVZByFTOLdwoo7WiQF1
	 Gp8rpyu6aFXCFZ69Le+zLKfYvWRIh8/CbnMrtiLnppLCKSDQ/Jga59K7JojvPAGKn6PGS
	 /nSzYyXX0Lqx95IAjMYrvjqG+lE02/2Mw9qrvLhQ0b96z9kdcHUDu5eZJBvNU1H2wqKtd
	 8EKiTfnrd3qTaJt0VYyOz1OjfcE9E25u3BiH0sUF8NTE9nudDrDlx/fkLvkU2AFpQzn7Y
	 Z3nLx6S0xqRzp6Fy8rNissuQ7L7QiG0jL0uGETM2kJ9ZhWOPmIOKpVChGqTGcsltFjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JLJT2jYq;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054FE606A33A
	for <Devicetree@vger.kernel.org>; Tue, 17 Nov 2026 16:17:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 054FE606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JLJT2jYq
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c50933bdf4bso260469766b.1
        for <Devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794932270; x=1795537070; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JRkNuO7f+W9Ho8PIBHE7MaDQUw/2iOTiv6p4KY7Nkys=;
        b=JLJT2jYqv4c9sMaodXg5HMSIhRlsPLMyNXf5bL1vJxEpK1eo38m3TSyA5VRRFr88e7
         u0zzjgyksFlvo6euYYqE4gvPTHvmmgzwJMhgPqDcotd0Ja+WH+ll9q2PeBh3OeWSwNjI
         K9DfqYzfR1+5YhxrxmYMcuX1JYmS1H6TYrsSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794932270; x=1795537070;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JRkNuO7f+W9Ho8PIBHE7MaDQUw/2iOTiv6p4KY7Nkys=;
        b=idCxJL1xaPH4G7KV2UXDeA1IQAi+/qSOSv9dVXncopOy4XoWL6jUGqWohbuCbkOFOG
         n24Z7lbzNQ9XRfdyJI6BhyVOLguPR05jMW/TFmghi+75vXLRh1MnyDTTE/+848uA53YJ
         VanfGxGvjf1SxaU/DRAG+mQwrS3rm3KmtUcqxLJl0Gg+c5OhktiLsEgT5qHfX+4sHZw7
         /bCPoJzxSxLkT4zcdLCzmH6iZTZQRgOBHhgrZITaqd96nvOcJ2KIzPspYWN/8Ij93ugk
         4kIWm+nsnOFjtNkWkBRLaOBFRyfiyWEsvNNGdOzsRmD/dwfLiOqagi/UAtRkiwuFEEfm
         tEXA==
X-Forwarded-Encrypted: i=1; AL+hErHBfy60uL0S5oczqCJQG/8ApGgsT6YGS6lSj8go8dlbQQHFVqc4UGnWTzOFeeK0lws1GYzRmsFmSl1i@vger.kernel.org
X-Gm-Message-State: APuU4Z8WOibQjW7wNHxJdlCy7DIojxwKKvlMnMQlUiFaZIDnMhcQSJUU
	l1CGWs9PIh6DSZoPUK3Xe1M7b86huMs5b7nkFQxuPvoQGicKoSROWBKYoPFRbiHnnJWNGR6hbvP
	ITyb5Ww==
X-Gm-Gg: AYBFou3xC0YOtHM1MS1DqXl1L73wuWPp39GJpexO5IIB6f2R2eZ0VdU/w8Q3zlpfCU/
	zLYT/lhR05bU5xQwjiuNdeswiqPnUXFH4YAbV5h3xS6vDEzMvsP6GoeP3IN+Vg1gN42Kl3YrQTb
	AZ6qTrd7yZ9nmX9qYK/MCpuL4rjAxJu4sZK8og3zazwrvO8C4JYvjnCeRq05jvUm48j+DfIBUhJ
	dXCX7za0WXk8wvmriMfxN4z+8Fq36ycFrgiWFE3hMljV4559IBz2ASz6DdJ4c7PCNhfm+cBBy92
	dHvEghzv7JT0BGJCae8rsyD2x4YGkR/fUfyTDjcKcfnishYgN+v1PwNiKX0NmS0wdi/8FH8wDHg
	X8M9ykNgznSraPFWW2w8UpGb3NIShd6L+29rGvQ3HdxowW7dfMdzPSqyEazEF4HEbHwozA/99DP
	yBBUJK4EPz5N+HrLIdkLLLorZ8UhcGLdhvub2DisnYfaxZ91a7g5lqBDA0E3BAQKRvufZiTP7AE
	EMd2Ki5geu7u5A8++dxu4v72VAU0JJx5ZafnMJRsO8CrhV+O2Zpjva6Yz2RlNcaY2nVvCxxw/eQ
	75P6NVLYd4gRQ/FZ2YAu1QfLw7kTcX3MgMI/ZVAa+0b+nDsjDw3Jbll+oA3JXs10ZtPx
X-Received: by 2002:a17:907:d88:b0:c36:777f:824c with SMTP id a640c23a62f3a-c50f320cef8mr311735166b.4.1794932270352;
        Tue, 17 Nov 2026 08:17:50 -0800 (PST)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b886a827casm3388a12.10.2026.11.17.08.17.47
        for <Devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 08:17:48 -0800 (PST)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4a5024b3c28so389480f8f.0
        for <Devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:17:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGDmm/XnXU2VlLBTchUKx2OgWmb32ba3mUtz02G0hw2GqtvZdUzbD94uXDK10iXSUAnB9cOBPStKfHk@vger.kernel.org
X-Received: by 2002:a05:6000:2201:b0:495:728a:5f6f with SMTP id
 ffacd0b85a97d-4a36fc5d49bmr7617593f8f.19.1794932265537; Tue, 17 Nov 2026
 08:17:45 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116205320.1621386-1-dianders@chromium.org>
 <20261116205320.1621386-7-dianders@chromium.org> <avvOUIIn9t00XqY_@gractus.seuss>
In-Reply-To: <avvOUIIn9t00XqY_@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 17 Nov 2026 08:17:33 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WAWUn4t8nyjyFP1if=i1ik1uQ4w=w=28i2MKPr=zsvXg@mail.gmail.com>
X-Gm-Features: Aa3M54oBu4xzuKNJkEO-tZuQ5G1JdKIa1DFQA984jaIf5jsKQ9Mw1Z6-99t_t0I
Message-ID: <CAD=FV=WAWUn4t8nyjyFP1if=i1ik1uQ4w=w=28i2MKPr=zsvXg@mail.gmail.com>
Subject: Re: [PATCH v4 06/14] pylibfdt: Speed up FdtRo.properties() with a C helper
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Simon Glass <sjg@chromium.org>, linux-kernel@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Mon, Nov 16, 2026 at 7:47 PM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> > On one stress test (walking all ~573k nodes and ~2.06M properties across
> > 438 arm64 Qualcomm DTBs) this reduced `FdtRo.properties()` time by
> > ~1.8x.
>
> Hm, optimizing pylibfdt has never been a focus, on the general
> assumption that if speed is really important to you, you shouldn't be
> using Python.  I'm happy enough with patch 4, because it's a speed win
> with a very small and simple change.  This optimization is a much
> larger chunk of code, so I'm not so convinced this is worth the source
> complexity we pay for it.
>
> That's not an outright rejection, but I'd need convincing this is
> worth it.

Right, if we're trying to get the absolute maximum speed then of course
we wouldn't choose Python. For a tool like `fdtfactor`, speed is
certainly not the top priority and Python is the superior choice.
Writing it in C would have been a much bigger pain.

That all being said, just because speed isn't the top priority doesn't
mean it doesn't matter at all. When I started looking at optimizations I
was seeing my 438-DTB run take ~25 seconds, which is just a bit too
much. With all the optimizations I ended up with ~12 seconds. That's
still a lot and it would be nice to make it even better, but it also
starts getting into the realm of acceptable.

`FdtRo.properties()` stood out in profiling because
`DeviceTree.unflatten()` calls it on every node (~573k nodes / ~2.06M
properties across the 438 Qualcomm DTBs). In the pure-Python generator,
each node makes `1 + 2 * num_props` SWIG calls (~4.7M boundary
crossings, each going through Python `check_err` / `check_err_null`
wrappers and generator suspension/resumption) and allocates a fresh
non-interned `str` for repeated property names like `compatible`, `reg`,
`status`, and `phandle`.

Below is a small standalone script (`bench_properties.py`) that builds a
1,300-node (~140 KB) DTB in memory via `FdtSw` and walks it 400 times
(~520k nodes, ~2.08M properties) with patch 06/14 applied. On my
machine:
* Default `meson setup build` (`-O0`):
  - `FdtRo.properties()`: `2.52s -> 1.50s` (1.68x faster)
  - Full tree walk: `3.35s -> 2.25s` (1.49x faster)
* `meson setup --buildtype=release` (`-O3`):
  - `FdtRo.properties()`: `1.76s -> 0.98s` (1.81x faster)
  - Full tree walk: `2.24s -> 1.43s` (1.57x faster)

On the source-complexity side, roughly half of
`fdt_node_properties_stub()` in v4 is repetitive `Py_DECREF`
error-cleanup boilerplate -- using `PyObject_CallFunction(prop_cls,
"Oy#", ...)` and a single `err:` label trims it from 55 lines down to
~30 lines. That said, as noted in the patch notes, ~1 second on a
400-DTB run isn't make-or-break, so if you'd still rather not carry the
C helper in `pylibfdt/libfdt.i` I'm totally fine dropping this patch in
v5 (or trimming it to the ~30-line version if that tips the balance).

---8<---
#!/usr/bin/env python3
# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
# Run from the dtc repo root after applying patch 06/14 and building:
#   meson compile -C build && python3 bench_properties.py
import os
import sys
import time

if os.path.isdir('build/pylibfdt') and 'build/pylibfdt' not in sys.path:
    sys.path.insert(0, 'build/pylibfdt')

import libfdt
from libfdt import QUIET_NOTFOUND


def old_properties(fdt, nodeoffset):
    poff = fdt.first_property_offset(nodeoffset, quiet=QUIET_NOTFOUND)
    while poff >= 0:
        yield fdt.get_property_by_offset(poff)
        poff = fdt.next_property_offset(poff, quiet=QUIET_NOTFOUND)


def unflatten_walk(fdt, props_fn):
    off, depth = 0, 0
    while depth >= 0:
        props = {p.name: p for p in props_fn(fdt, off)}
        if depth > 0:
            fdt.get_name(off)
        off, depth = fdt.next_node(off, depth)
    return props


def make_sample_dtb(num_nodes=1300):
    sw = libfdt.FdtSw()
    sw.finish_reservemap()
    with sw.add_node(''):
        sw.property_string('compatible', 'example,board')
        sw.property_u32('#address-cells', 2)
        sw.property_u32('#size-cells', 2)
        with sw.add_node('soc@0'):
            for i in range(num_nodes):
                with sw.add_node(f'dev@{i:x}'):
                    sw.property_string('compatible', 'vendor,periph')
                    sw.property('reg', b'\x00\x00\x00\x00' * 4)
                    sw.property_string('status', 'okay')
                    sw.property_u32('phandle', i + 1)
    return sw.as_fdt()


def main():
    if not hasattr(libfdt, 'fdt_node_properties_stub'):
        sys.exit('Apply patch 06/14 and rebuild pylibfdt first')

    fdt = make_sample_dtb()
    offsets = []
    off, depth = 0, 0
    while depth >= 0:
        offsets.append(off)
        off, depth = fdt.next_node(off, depth)

    iters = 400  # ~520k nodes, ~2.08M props (similar to 438 arm64 DTBs)

    t0 = time.perf_counter()
    for _ in range(iters):
        for o in offsets:
            for _ in old_properties(fdt, o):
                pass
    dt_old = time.perf_counter() - t0

    t0 = time.perf_counter()
    for _ in range(iters):
        for o in offsets:
            for _ in fdt.properties(o):
                pass
    dt_new = time.perf_counter() - t0

    t0 = time.perf_counter()
    for _ in range(iters):
        unflatten_walk(fdt, old_properties)
    dt_unf_old = time.perf_counter() - t0

    t0 = time.perf_counter()
    for _ in range(iters):
        unflatten_walk(fdt, libfdt.FdtRo.properties)
    dt_unf_new = time.perf_counter() - t0

    sz = fdt.totalsize()
    print(f'{len(offsets)} nodes ({sz:,} B) x {iters} trees:')
    print(f'  FdtRo.properties() old (SWIG loop): {dt_old:.3f} s')
    print(f'  FdtRo.properties() new (C helper):  {dt_new:.3f} s '
          f'({dt_old / dt_new:.2f}x faster)')
    print(f'  Full tree walk     old:             {dt_unf_old:.3f} s')
    print(f'  Full tree walk     new:             {dt_unf_new:.3f} s '
          f'({dt_unf_old / dt_unf_new:.2f}x faster)')


if __name__ == '__main__':
    main()
--->8---

-Doug
