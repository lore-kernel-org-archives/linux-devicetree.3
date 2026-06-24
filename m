Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FF02E736B
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 07:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782286586; cv=none; b=XKV7VapizZHpWZEIzD3vKPDPS/yPoIBvX3iBY1rywV72VTzDYMfytihbecgYjajTHnVD3M1kmnumeHjpqGB53JGidZ9reDHlU6Nsf4wvr6El9tTAXVHlxhBspHgomfhUJ1gqMp1PF1lpoJYkShDBmG2WxACh9zbjzCbsMeLUJnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782286586; c=relaxed/simple;
	bh=zd8EYRTUqO0t+3O0wv/ubwpl+LZPfemplxSr05rbdbA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gbDytvI4BvsZP3UarR+vFfUvLHcoh80WrRbnmwxIEYqJP8agZSDX5MJV3MnZyFSOoofGwQ3KWwKH9zUD9aCH6qIJscej3YKPN/OR4uUF6EhSkGg5c58wWE966PRhrGy+N61OaOJ3i4TFFZ6/1GJ/jdQJlWSwqvziWubdRXZ3w7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HpTUhmIL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HpTUhmIL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C28CB1F000E9;
	Wed, 24 Jun 2026 07:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782286583;
	bh=+SAqtamMeDaGdOZqFV03/n34zmecNDUAdFERo+ztHA0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HpTUhmILn4UWGUz2oxWYYxEWi+FHc1jSad8SeKiSboDZbyzrmsZ1RmLE0PemqOAfB
	 UVN5OpqY+VKHVBu25OW+bKvMrMBhNL6HZyqRmwQ+mRkIO/yfLv5xVxvfdXDtBEPST8
	 ec6Wj2P9LI4t6GON103ngC13X14CAcd3Sl676j/2C6bCyxnHOV9R/2tZaC300jfB8d
	 1KVQwkssQTwxn/dumsW9Ze/+WZlQ0sXFyyOjbF2p8oY1N6Q6T4bbbcRSHqaaRmh4Cg
	 MqxwZHhg7AAGZjHjZN1QUmNXkKLyMh48y+SLi4cgJ7fqIuMuXwOblTsNxMi0cZ9b3z
	 0ytLMn4CCDHEQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 6/9] media: chips-media: wave6: Improve debugging
 capabilities
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nas Chung" <nas.chung@chipsnmedia.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260624072043.238-7-nas.chung@chipsnmedia.com>
References: <20260624072043.238-1-nas.chung@chipsnmedia.com>
 <20260624072043.238-7-nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 07:36:22 +0000
Message-Id: <20260624073622.C28CB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Kernel panic due to division by zero in debugfs FPS calculation.
- [High] Lockless access to `vb2_queue` internals causes Use-After-Free dur=
ing concurrent `REQBUFS(0)`.
- [Medium] Checking `IS_ERR_OR_NULL` on an optional debugfs dentry inapprop=
riately triggers `WARN_ON` when debugfs is disabled.
- [Medium] 32-bit integer multiplication overflow when calculating FPS stat=
istics.
- [Medium] Data truncation of 64-bit DMA addresses in trace events.
- [Low] Use of 64-bit division and modulo operators breaks compilation on 3=
2-bit architectures.
- [Low] Incorrect chaining of assignments with comma operators in `TP_fast_=
assign`.
--

commit 59a3991812bdf6b7f45f197b804c2beea6a0e9aa
Author: Nas Chung <nas.chung@chipsnmedia.com>
Subject: media: chips-media: wave6: Improve debugging capabilities

Add debugfs entries and trace events to provide detailed
debugging information.
These enhancements help diagnose issues and improve debugging
capabilities for the Wave6 core driver.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Tested-by: Ming Qian <ming.qian@oss.nxp.com>
Tested-by: Marek Vasut <marek.vasut@mailbox.org>

> diff --git a/drivers/media/platform/chips-media/wave6/wave6-trace.h b/dri=
vers/media/platform/chips-media/wave6/wave6-trace.h
> new file mode 100644
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/wave6-trace.h
[ ... ]
> +TRACE_EVENT(wave6_vpu_source_change,
> +	    TP_PROTO(struct vpu_instance *inst, struct dec_seq_info *info),
> +	    TP_ARGS(inst, info),
[ ... ]
> +	    TP_fast_assign(__assign_str(name);
> +			   __entry->id =3D inst->id;
> +			   __entry->width =3D info->pic_width,
> +			   __entry->height =3D info->pic_height,

[Severity: Low]
Is there a typo in these assignments? The width and height fields are
terminated with commas instead of semicolons inside TP_fast_assign.

> +			   __entry->profile =3D info->profile,
> +			   __entry->level =3D info->level;
[ ... ]
> +TRACE_EVENT(wave6_vpu_enc_pic,
> +	    TP_PROTO(struct vpu_instance *inst, struct enc_param *param),
> +	    TP_ARGS(inst, param),
> +	    TP_STRUCT__entry(__string(name, dev_name(inst->dev->dev))
> +			     __field(u32, id)
> +			     __field(u32, srcidx)
> +			     __field(u32, buf_y)

[Severity: Medium]
Does this truncate 64-bit physical addresses?=20

Variables like buf_y and buf_cb are dma_addr_t, which can be 64-bit on=20
platforms like arm64. Declaring these fields as u32 will lose the upper=20
32 bits of the address in the trace output.

> +			     __field(u32, buf_cb)
> +			     __field(u32, buf_cr)
> +			     __field(u32, stride)
[ ... ]
> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c b/d=
rivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c
[ ... ]
> +static int wave6_vpu_dbg_instance(struct seq_file *s, void *data)
> +{
> +	struct vpu_instance *inst =3D s->private;
> +	struct vpu_performance_info *perf =3D &inst->performance;
> +	struct vb2_queue *vq;
[ ... ]
> +	vq =3D v4l2_m2m_get_src_vq(inst->v4l2_fh.m2m_ctx);
> +	seq_printf(s, "output (%2d, %2d): fmt =3D %c%c%c%c %d x %d, %d;\n",
> +		   vb2_is_streaming(vq),
> +		   vb2_get_num_buffers(vq),

[Severity: High]
Can this lead to a use-after-free?=20

This accesses the queue state locklessly in wave6_vpu_dbg_instance(). If a
concurrent userspace thread calls VIDIOC_REQBUFS with count=3D0, the buffers
bitmap is freed.

If the lockless read evaluates vb2_get_num_buffers() at the same time, it=20
can race against the release and cause bitmap_weight() to read uninitialized
or freed memory.

> +		   inst->src_fmt.pixelformat,
[ ... ]
> +	seq_puts(s, "fps");
> +	tmp =3D MSEC_PER_SEC * inst->processed_buf_num;

[Severity: Medium]
Can this multiplication overflow on 32-bit architectures?=20

MSEC_PER_SEC and inst->processed_buf_num are both 32-bit integers. The resu=
lt
will wrap around after about 4.29 million frames before the implicit cast t=
o=20
the 64-bit tmp variable.

> +	if (perf->ts_last > perf->ts_first + NSEC_PER_MSEC) {
> +		fps =3D DIV_ROUND_CLOSEST(tmp, (perf->ts_last - perf->ts_first) / NSEC=
_PER_MSEC);

[Severity: Low]
Will this break the build on 32-bit platforms?=20

The calculation performs direct division using the / operator on 64-bit typ=
es,=20
which results in undefined references to __divdi3. Should this use a kernel=
=20
math helper like div64_s64() instead?

> +		seq_printf(s, " actual: %lld;", fps);
> +	}
> +	if (perf->total_sw_time) {
> +		fps =3D DIV_ROUND_CLOSEST(tmp, perf->total_sw_time / NSEC_PER_MSEC);

[Severity: High]
What happens if total_sw_time or total_hw_time is non-zero but less than
1,000,000 nanoseconds?

The division perf->total_sw_time / NSEC_PER_MSEC will evaluate to zero.
Passing zero as the divisor to DIV_ROUND_CLOSEST causes an immediate
division by zero exception and a kernel panic.

> +		seq_printf(s, " sw: %lld;", fps);
> +	}
> +	if (perf->total_hw_time) {
> +		fps =3D DIV_ROUND_CLOSEST(tmp, perf->total_hw_time / NSEC_PER_MSEC);
> +		seq_printf(s, " hw: %lld", fps);
> +	}
[ ... ]
> +int wave6_vpu_create_dbgfs_file(struct vpu_instance *inst)
> +{
> +	char name[64];
> +
> +	if (WARN_ON(!inst || !inst->dev || IS_ERR_OR_NULL(inst->dev->debugfs)))
> +		return -EINVAL;

[Severity: Medium]
Is it intended to trigger a warning when debugfs is disabled?

If CONFIG_DEBUG_FS is disabled, debugfs_create_dir() returns ERR_PTR(-ENODE=
V).
Using IS_ERR_OR_NULL() here will trigger the WARN_ON() every time a new
encoder or decoder instance is created, dumping a stack trace into the kern=
el
log.

> +
> +	scnprintf(name, sizeof(name), "instance.%d", inst->id);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624072043.238-=
1-nas.chung@chipsnmedia.com?part=3D6
