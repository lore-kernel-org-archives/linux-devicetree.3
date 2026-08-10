Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457FC23815B
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786376854; cv=none; b=WlO77WpWu5ZY1STu1aUh7M8rERMEFjiiyYpg517xrhv46m+cvDY5fTMr1v5kS/GAiK+OzQa1THz90uldmIu2+n/R/xi9rjepW/FCMWQVGmZ1qn8HJ6hehR3Y43IfDk7vnaTkrznKDLfzpU1H3GlNV5GTm5cjtqg2t6he3Kddfic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786376854; c=relaxed/simple;
	bh=0dVPCAuhSGHbUFd+C4ng0IhUzomJz20RkE+bf7YKyTo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Dvk1kr60Gpbeg+Uzpa0B/YtaWTqclqOlx+bRMdqt8uAQ8gWjMa+gQZ4TmnEDcUXqpbZYimZsmUlTzKoXNYMYClpx2AAmxQHZdeH2OCOP3Fhw7OA/z/M8RMQK4rpXmbsF7gjnDesRwMKHHVt22QikPMav9W8xSdKZ0Ou5x0d2eRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sm8V3ZsA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sm8V3ZsA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0C771F000E9;
	Mon, 10 Aug 2026 15:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786376853;
	bh=Ec6QoLmmWKnvbpQI1giFwtBve4SfOuB5jqHuea3Sac8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Sm8V3ZsACs2KA+v8aGhoKEhGNx11tZOFnyJBPSlrvYSjYgyleVeoPvo3Bz7FRGf0d
	 RqlJqU8V66gTymYES1KJ7f1hpve/7VvNllPCFm0S7tpNl2Zlq4LwlfsydWNX1qQz3i
	 SBd8DroKf9CsSHAIdgejgkMCzzm6KorZQX0Fw0vn1GHVn6KPMWMjSGDJ4S9qIVH+nE
	 5yqqijeo36d/fb2HLN8AaHj1sbxUXe12L6hlzhuV7ObVgemlEV6gZs+cDZQvRneyAR
	 iUYnsQPYD0+nk/PI39VuzW9n0XBKopRDOtG6nvXD2xNQVLOxRShWaBVFJiUAJxtDZQ
	 ryB4O2qkTV/+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 09/14] gtrace: Add RISC-V Trace ramsink driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mayuresh Chitale" <mayuresh.chitale@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260810152223.3946743-10-mayuresh.chitale@oss.qualcomm.com>
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
 <20260810152223.3946743-10-mayuresh.chitale@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 15:47:32 +0000
Message-Id: <20260810154732.E0C771F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [High] Modifying DMA pointers and size after allocation causes a DMA API =
violation upon freeing and out-of-bounds memory accesses.
- [High] Missing bounds check on the hardware write pointer (`wp`) allows a=
rbitrary out-of-bounds kernel memory reads.
- [High] Trusting hardware limit registers unconditionally overwrites `priv=
->size`, allowing hardware to inflate buffer bounds.
- [High] Trusting hardware limit registers can result in a zero-sized buffe=
r, triggering a division-by-zero panic.
- [High] Using signed `int` for lengths in `tbuf_to_pbuf_copy` causes an in=
teger overflow when bounds exceed 2GB.
- [Medium] Bitwise OR operations update configuration fields without cleari=
ng previous bit values, leaving old configurations active.
- [Medium] The driver does not export its component ID table, preventing au=
tomatic module loading.
- [Medium] Buffer truncation logic error when hardware clamps the limit add=
ress.
- [Medium] Missing synchronization protecting shared ramsink state in `copy=
to_auxbuf`.
- [Low] Format String Type Mismatch using `%pad` for `u64` variables.
--

--- Patch [9]: [PATCH v5 09/14] gtrace: Add RISC-V Trace ramsink driver ---
commit 07a5e011c3c5f12851ee9400f1bd383cb0538970
Author: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>

gtrace: Add RISC-V Trace ramsink driver

This patch adds the initial implementation of the RISC-V E-Trace ramsink
driver. The ramsink stores trace data into a system memory buffer for perf
AUX buffer usage.

> diff --git a/drivers/hwtracing/gtrace/rvtrace-ramsink.c b/drivers/hwtraci=
ng/gtrace/rvtrace-ramsink.c
> new file mode 100644
> index 0000000000000..7ed25cf364a71
> --- /dev/null
> +++ b/drivers/hwtracing/gtrace/rvtrace-ramsink.c
[ ... ]
> +static void tbuf_to_pbuf_copy(struct trace_buf *src, struct trace_buf *d=
st, size_t size)
> +{
> +	int bytes_dst, bytes_src, bytes;
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: High]
Does this code risk integer overflow if the lengths exceed 2GB?

The variables bytes, bytes_dst, and bytes_src are declared as signed int,
while the lengths they represent (like dst->len and src->len) are size_t
and can legally exceed 2GB. If dst->len - dst->cur exceeds 2GB, the
subtraction overflows the 32-bit int into a negative number.

Could this negative number pass the bytes_dst < bytes_src check and be
supplied to memcpy(), which implicitly casts it to a huge size_t value
causing a fatal out-of-bounds copy?

> +	void *dst_addr, *src_addr;
> +
> +	/* If destination cannot hold entire source buffer then write only the =
latest data. */
> +	if (dst->len < size) {
> +		src->cur =3D (src->cur + size - dst->len) % src->len;
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: High]
Could this result in a division-by-zero panic?

If the hardware limit register readback exactly equals priv->start,
rvtrace_ramsink_setup_buf() will update priv->end =3D priv->start, making
priv->size =3D 0.

Upon the next perf AUX buffer read, rvtrace_ramsink_copyto_auxbuf() will pa=
ss
priv->size (0) as src.len to tbuf_to_pbuf_copy(). This would cause the modu=
lo
operation here to divide by zero.

> +		size =3D dst->len;
> +	}
> +
> +	while (size) {
[ ... ]
> +		if (src->len - src->cur < size)
> +			bytes_src =3D src->len - src->cur;
> +		else
> +			bytes_src =3D size;
> +		bytes =3D bytes_dst < bytes_src ? bytes_dst : bytes_src;
> +		memcpy(dst_addr, src_addr, bytes);
> +		dst->cur =3D (dst->cur + bytes) % dst->len;
> +		src->cur =3D (src->cur + bytes) % src->len;
> +		size -=3D bytes;
> +	}
> +}
> +
> +static size_t rvtrace_ramsink_copyto_auxbuf(struct gtrace_component *com=
p,
> +					    struct gtrace_perf_auxbuf *buf,
> +					    u64 *format)
> +{
> +	struct rvtrace_ramsink_priv *priv =3D dev_get_drvdata(&comp->dev);
> +	struct trace_buf src, dst;
> +	u32 wp_low, wp_high;
> +	size_t bytes =3D 0;
> +	bool wrap;
> +	u64 wp;
> +
> +	dst.base =3D buf->base;
> +	dst.len =3D buf->length;
> +	dst.cur =3D buf->pos;
> +	src.base =3D priv->va;
> +	src.len =3D priv->size;
> +	wp_low =3D gtrace_read32(comp->pdata, RVTRACE_RAMSINK_WPLOW_OFF);
> +	wp_high =3D gtrace_read32(comp->pdata, RVTRACE_RAMSINK_WPHIGH_OFF);
> +	wp =3D (u64)(wp_high) << 32 | wp_low;
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: High]
Does this implicitly trust the hardware read value without bounds validatio=
n?

If a faulty hardware component returns a value outside the physical buffer
bounds, or if concurrent accesses cause a race, the calculations like
bytes =3D wp - priv->prev_wp could underflow or overflow.

This would allow tbuf_to_pbuf_copy() to copy arbitrary out-of-bounds kernel
memory directly into the perf AUX buffer, leaking kernel memory to userspac=
e.

> +	wrap =3D wp & RVTRACE_RAMSINK_WPLOW_WRAP;
> +	wp &=3D ~RVTRACE_RAMSINK_WPLOW_WRAP;
> +	if (wrap) {
[ ... ]
> +	} else {
> +		src.cur =3D  priv->prev_wp - priv->start;
> +		bytes =3D wp - priv->prev_wp;
> +		priv->prev_wp =3D wp;
                ^^^^^^^^^^^^^^^^^^^

[Severity: Medium]
Is there missing synchronization protecting this shared ramsink state?

If rvtrace_ramsink_copyto_auxbuf() is executed concurrently, data races
on priv->prev_wp could result in length underflows and corrupted hardware
write pointers. Is a spinlock necessary to protect this component's
shared state?

> +	}
> +
> +	tbuf_to_pbuf_copy(&src, &dst, bytes);
> +	dev_dbg(&comp->dev, "Copied %zu bytes\n", bytes);
> +	*format =3D PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE;
> +	return bytes;
> +}
> +
> +static int rvtrace_ramsink_setup_buf(struct gtrace_component *comp,
> +				     struct rvtrace_ramsink_priv *priv)
> +{
> +	struct device *pdev =3D comp->pdata->dev;
> +	u64 start_min, limit_max, end;
> +	u32 low, high;
> +	int ret;
[ ... ]
> +	priv->va =3D dma_alloc_coherent(pdev, priv->size, &priv->start, GFP_KER=
NEL);
> +	if (!priv->va)
> +		return -ENOMEM;
> +
> +	priv->end =3D priv->start + priv->size;
> +	priv->prev_wp =3D priv->start;
> +	if (priv->end <=3D start_min || priv->start >=3D limit_max) {
> +		dma_free_coherent(pdev, priv->size, priv->va, priv->start);
> +		dev_err(&comp->dev, "DMA memory not addressable by device\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Setup ram sink start addresses */
> +	if (priv->start < start_min) {
> +		dev_warn(&comp->dev, "Ramsink start address updated from %pad to %pad\=
n",
> +			 &priv->start, &start_min);
                                       ^^^^^^^^^^

[Severity: Low]
Does this code use an incorrect format string for start_min?

start_min is of type u64, but %pad requires a pointer to dma_addr_t or
phys_addr_t. On 32-bit architectures where dma_addr_t is 32-bit, printk
will dereference the pointer as a 32-bit type, reading only half of the
u64 variable, resulting in incorrect log output.

> +		priv->va +=3D start_min - priv->start;
> +		priv->start =3D start_min;
                ^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: High]
Can modifying these DMA pointers cause a DMA API violation later?

When rvtrace_ramsink_cleanup() later passes these modified pointers to
dma_free_coherent(), it violates the DMA API, which strictly requires the
exact virtual and physical addresses originally returned by
dma_alloc_coherent().

This can lead to a kernel panic on driver unbind. Also, because priv->size
is not reduced, operations accessing priv->start + priv->size will overflow
the allocated DMA buffer bounds.

> +	}
> +
> +	gtrace_write32(comp->pdata, lower_32_bits(priv->start), RVTRACE_RAMSINK=
_STARTLOW_OFF);
> +	gtrace_write32(comp->pdata, upper_32_bits(priv->start), RVTRACE_RAMSINK=
_STARTHIGH_OFF);
> +	gtrace_write32(comp->pdata, lower_32_bits(priv->start), RVTRACE_RAMSINK=
_WPLOW_OFF);
> +	gtrace_write32(comp->pdata, upper_32_bits(priv->start), RVTRACE_RAMSINK=
_WPHIGH_OFF);
> +	/* Setup ram sink limit addresses */
> +	if (priv->end > limit_max) {
> +		dev_warn(&comp->dev, "Ramsink limit address updated from %pad to %pad\=
n",
> +			 &priv->end, &limit_max);
> +		priv->end =3D limit_max;
> +		priv->size =3D priv->end - priv->start;
> +	}
> +
> +	/* Limit address needs to be set to end - mem_access_width to avoid ove=
rflow */
> +	end =3D priv->end - priv->mem_acc_width;
> +	gtrace_write32(comp->pdata, lower_32_bits(end), RVTRACE_RAMSINK_LIMITLO=
W_OFF);
> +	gtrace_write32(comp->pdata, upper_32_bits(end), RVTRACE_RAMSINK_LIMITHI=
GH_OFF);
> +	low =3D gtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF);
> +	high =3D gtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITHIGH_OFF);
> +	end =3D (u64)(high) << 32 | low;
> +	if (end !=3D (priv->end - 4)) {
> +		dev_warn(&comp->dev, "Ramsink limit address updated from %pad to %pad\=
n",
> +			 &priv->end, &end);
                                     ^^^^

[Severity: Low]
Does this code use an incorrect format string for end?

end is of type u64, but %pad requires a pointer to dma_addr_t or
phys_addr_t.

> +		priv->end =3D end;
> +		priv->size =3D priv->end - priv->start;
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: High]
Does this trust the hardware limit registers to unconditionally overwrite
priv->size?

If the hardware returns a value much larger than the original 1MB DMA
allocation, the software size limits are inflated. Subsequent trace data
copies will read past the 1MB physical buffer, leaking surrounding kernel
memory into the user perf stream.

[Severity: Medium]
Additionally, does this introduce a buffer truncation logic error?

The driver subtracted 4 (priv->mem_acc_width) to avoid hardware wrap
overflow. If the hardware clamps this limit and returns a different value,
shrinking priv->end to the raw hardware return value recalculates
priv->size without adding those 4 bytes back.

This can cause the software ring buffer math to wrap before reading the
final 4 bytes of trace data written by the hardware, leading to data loss.

> +	}
> +
> +	return 0;
> +}
> +
> +static int rvtrace_ramsink_setup(struct gtrace_component *comp)
> +{
> +	struct rvtrace_ramsink_priv *priv;
> +	u32 trram_ctrl;
> +	int ret;
[ ... ]
> +	trram_ctrl =3D gtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET=
);
> +	trram_ctrl |=3D priv->mode << RVTRACE_RAMSINK_CTRL_MODE_SHIFT;
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: Medium]
Should the existing bits be cleared before ORing the new values?

Because the driver doesn't clear the existing bits, a previously set bit
might remain set even if the new mode evaluates to 0, leaving the hardware
improperly configured.

> +	gtrace_write32(comp->pdata, trram_ctrl, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	trram_ctrl =3D gtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET=
);
> +	dev_dbg(&comp->dev, "mode: %s\n", (trram_ctrl >> RVTRACE_RAMSINK_CTRL_M=
ODE_SHIFT) & 0x1 ?
> +		 "SMEM" : "SRAM");
> +
> +	trram_ctrl |=3D priv->stop_on_wrap << RVTRACE_RAMSINK_CTRL_STP_WRAP_SHI=
FT;
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^

[Severity: Medium]
Similarly, does the stop-on-wrap bitfield need to be cleared before
being updated?

> +	gtrace_write32(comp->pdata, trram_ctrl, RVTRACE_COMPONENT_CTRL_OFFSET);
> +
> +	ret =3D rvtrace_ramsink_setup_buf(comp, priv);
> +	if (!ret)
> +		dev_set_drvdata(&comp->dev, priv);
> +
> +	return ret;
> +}
> +
> +static void rvtrace_ramsink_cleanup(struct gtrace_component *comp)
> +{
> +	struct rvtrace_ramsink_priv *priv =3D dev_get_drvdata(&comp->dev);
> +
> +	dma_free_coherent(comp->pdata->dev, priv->size, priv->va, priv->start);
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^

[Severity: High]
As mentioned earlier, if priv->va, priv->start, or priv->size were modified
in rvtrace_ramsink_setup_buf(), won't this pass illegally shifted pointers
to the DMA API and cause a kernel panic?

> +}
[ ... ]
> +static const struct gtrace_component_id rvtrace_ramsink_ids[] =3D {
> +	{ .type =3D GTRACE_RVTRACE_RAMSINK,
> +	  .version =3D rvtrace_component_mkversion(1, 0), },
> +	{},
> +};
        ^^

[Severity: Medium]
Should this ID table be exported?

Without a MODULE_DEVICE_TABLE declaration, the driver will not be
autoloaded when compatible hardware is present on the system.

> +
> +static struct gtrace_driver rvtrace_ramsink_driver =3D {
> +	.id_table =3D rvtrace_ramsink_ids,
> +	.copyto_auxbuf =3D rvtrace_ramsink_copyto_auxbuf,
> +	.stop =3D rvtrace_ramsink_stop,
> +	.start =3D rvtrace_ramsink_start,
> +	.probe =3D rvtrace_ramsink_probe,
> +	.remove =3D rvtrace_ramsink_remove,
> +	.driver =3D {
> +		.name =3D "rvtrace-ramsink",
> +	},
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810152223.3946=
743-1-mayuresh.chitale@oss.qualcomm.com?part=3D9
