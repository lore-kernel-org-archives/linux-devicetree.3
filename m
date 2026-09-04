Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32752388E59
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 07:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788505355; cv=none; b=NxscvbSYq7k4N2nA/41I2yCDM1etr3drPPaTMU7vJFYdG2M5YuR78QgBZi8hHpFu692vHhsIQgGQC5djMOY2v+z3D+GBh1ZW1aWMhlqiGdovRjIxwdw7hUdB43x7RE11wozjHl34kSxLIA3CdjjjakeLFvQoJ7S2KHHDKPkwO7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788505355; c=relaxed/simple;
	bh=7S6ZOUsgSPQsmOS3mzW8mnXqe8DLwZtgGizwBXWGjBo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZaKxYpZOCvMQIVamEGa8+EM8+oSEyH8BNl0OE8uKUc2F3tZ0kHskeT7pFwCZ7imgpN/FLY7J8pB/wep/mTcdm2jfktpqXHtKkX/DnkjpVZkHoXj2DTA4Mn1V//zuq/LhwA1lWymk7KW05wACJQcTcXkEuSfUF90e47cTXuhu6wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BmClm1gA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BmClm1gA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 758741F00A3E;
	Fri,  4 Sep 2026 07:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788505353;
	bh=lxAx98qjph/eoCulJxtWlkv5xuQEKpVDxA1Z4Ay70/E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BmClm1gAUku5aetbUsy9UPsQCihGZQ61s8pF11BGZpqzI2OOtW+E1zWAIxOAif/sG
	 HzLM0ogLPcjjE05jf35JMbbYhveMpxxup8o0J7XMujE9GRjIe3JSvW99vPtAu/bZ7Y
	 00NX6jx01COmUowbZ19phrM6vqASYz90q3mcIp4wScv2Wwp/UHYRpU6pyVxMVZxy2S
	 YrpqW9I6CrabMI8S5wz1JzALqRpjZgf0hbuXjycDN/okm50BRYIlAkkRo/NxNilSgG
	 fNhw8B2vASWGyYrZACcM29T6gztqu2C3KrUk4jykA5JW7RpLjVAxgX2kScB4ZLTBiB
	 3S44jbeKLPnKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 6/9] media: chips-media: wave6: Improve debugging
 capabilities
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nas Chung" <nas.chung@chipsnmedia.com>
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org
In-Reply-To: <e7f599a5bd65900eb45daa3b637597fce464c383.1788496816.git.nas.chung@chipsnmedia.com>
References: <cover.1788496816.git.nas.chung@chipsnmedia.com>
 <e7f599a5bd65900eb45daa3b637597fce464c383.1788496816.git.nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 07:02:33 +0000
Message-Id: <20260904070233.758741F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Lockless call to `vb2_get_num_buffers()` in debugfs read leads to =
use-after-free on `q->bufs_bitmap`.
- [Medium] Multiplication can overflow 32-bit bounds before assignment to a=
 64-bit variable in the debugfs FPS calculation.
- [Low] Direct use of 64-bit division and modulo operators (`/` and `%`) wi=
ll cause build failures on 32-bit architectures.

Pre-existing issues:
- [High] Unprotected iteration over V4L2 mem2mem ready queues without holdi=
ng `rdy_spinlock` leads to list corruption.
--

commit a789f4b587c983369a5ba74d2b58395c60628047
Author: Nas Chung <nas.chung@chipsnmedia.com>

media: chips-media: wave6: Improve debugging capabilities

This commit adds debugfs entries and trace events to provide detailed
debugging information for the Wave6 core driver.

Tested-by: Ming Qian <ming.qian@oss.nxp.com>
Tested-by: Marek Vasut <marek.vasut@mailbox.org>

> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c b/d=
rivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c
> new file mode 100644
> index 0000000000000..ae71edeae0888
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c
[ ... ]
> +	vq =3D v4l2_m2m_get_src_vq(inst->v4l2_fh.m2m_ctx);
> +	seq_printf(s, "output (%2d, %2d): fmt =3D %c%c%c%c %d x %d, %d;\n",
> +		   vb2_is_streaming(vq),
> +		   vb2_get_num_buffers(vq),

[Severity: High]
Does this locklessly access `q->bufs_bitmap`? Concurrently, an application
can execute `VIDIOC_REQBUFS` with count=3D0, which acquires the queue lock,
frees `q->bufs_bitmap`, and sets the pointer to NULL. Because this read
doesn't hold `m2m_ctx->q_lock` or equivalent synchronization, it could read
a non-NULL pointer right before it is freed by `REQBUFS`, executing
`bitmap_weight()` on a freed pointer and causing a use-after-free.

> +		   inst->src_fmt.pixelformat,
[ ... ]
> +	vq =3D v4l2_m2m_get_dst_vq(inst->v4l2_fh.m2m_ctx);
> +	seq_printf(s, "capture(%2d, %2d): fmt =3D %c%c%c%c %d x %d, %d;\n",
> +		   vb2_is_streaming(vq),
> +		   vb2_get_num_buffers(vq),

[Severity: High]
This appears to have the same lockless access concern as the source queue
above. Does this need queue lock protection to prevent a use-after-free
if `VIDIOC_REQBUFS` is called concurrently?

> +		   inst->dst_fmt.pixelformat,
[ ... ]
> +	seq_puts(s, "fps");
> +	tmp =3D MSEC_PER_SEC * inst->processed_buf_num;

[Severity: Medium]
Will this operation overflow on 32-bit architectures? `MSEC_PER_SEC` is
typically defined as `1000L` (a 32-bit signed integer on 32-bit systems) and
`inst->processed_buf_num` is a `u32`. If the buffer count exceeds ~4.29
million, the 32-bit multiplication might overflow before it is assigned and
sign-extended into the 64-bit `tmp` variable.

> +	if (perf->ts_last > perf->ts_first + NSEC_PER_MSEC) {
> +		fps =3D DIV_ROUND_CLOSEST(tmp, (perf->ts_last - perf->ts_first) / NSEC=
_PER_MSEC);

[Severity: Low]
Does this cause a build failure on 32-bit architectures? `DIV_ROUND_CLOSEST`
internally expands to a division operation (`/`), and the denominator here
also uses direct division. Using direct 64-bit division on `s64` variables
emits calls to undefined functions like `__divdi3` on 32-bit systems. Should
explicit 64-bit math helpers like `div64_s64()` be used here instead?

> +		seq_printf(s, " actual: %lld;", fps);
> +	}
> +	duration =3D perf->total_sw_time / NSEC_PER_MSEC;

[Severity: Low]
Similar to the above, this performs direct 64-bit division on a `u64`
variable, which can break 32-bit builds due to missing math symbols.

> +	if (duration > 0) {
> +		fps =3D DIV_ROUND_CLOSEST(tmp, duration);
> +		seq_printf(s, " sw: %lld;", fps);
> +	}
> +	duration =3D perf->total_hw_time / NSEC_PER_MSEC;

[Severity: Low]
Another instance of direct 64-bit division that might break 32-bit builds.

> +	if (duration > 0) {
> +		fps =3D DIV_ROUND_CLOSEST(tmp, duration);
> +		seq_printf(s, " hw: %lld", fps);
> +	}
> +	seq_putc(s, '\n');
> +
> +	seq_printf(s, "latency(ms) first: %llu.%06llu, max %llu.%06llu, setup %=
llu.%06llu\n",
> +		   perf->latency_first / NSEC_PER_MSEC,
> +		   perf->latency_first % NSEC_PER_MSEC,

[Severity: Low]
This performs direct 64-bit division and modulo on an `s64` variable, which
is known to cause linking errors (like `__moddi3` and `__moddi3`) on 32-bit
architectures. Should this use explicit math helpers like `div64_s64_rem()`?


[Severity: High]
This is a pre-existing issue, but the series iterates over the V4L2 m2m rea=
dy
queues locklessly using `v4l2_m2m_for_each_src_buf` and
`v4l2_m2m_for_each_dst_buf` without holding `rdy_spinlock`.

For example, in drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c:

wave6_get_valid_src_buf() {
    ...
    v4l2_m2m_for_each_src_buf(inst->v4l2_fh.m2m_ctx, v4l2_m2m_buf) {
    ...
}

And in drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c:

wave6_get_dst_buf_by_addr() {
    ...
    v4l2_m2m_for_each_dst_buf(inst->v4l2_fh.m2m_ctx, v4l2_m2m_buf) {
    ...
}

Are these list traversals vulnerable to data races? These macros wrap
`list_for_each_entry`, and they appear to be called from the m2m framework's
worker thread without holding `rdy_spinlock`. Concurrently, userspace can
call `VIDIOC_QBUF`, which dynamically adds elements to the `rdy_queue` while
holding the lock. Modifying a linked list while a separate thread traverses
it unprotected can result in structural data races and list pointer
corruption, potentially leading to a use-after-free or kernel panic.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1788496816.gi=
t.nas.chung@chipsnmedia.com?part=3D6
