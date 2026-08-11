Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677493502A8
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 22:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786485625; cv=none; b=tJ6RYMKjKh4XTLxAW7ereWBQUmZJU+RCLjmEb5KM/quzL/lhOn3jatoSI0KMqR7x4i54QwAyafZBEwUlwdcxn4GktuO+ocAgAIxzJxjjlYyUQrhkEi6dNQLsliadv48yoQ7tU//2eELTM1i8joBr1qjx4hn/ix+0k1cmQj4P/cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786485625; c=relaxed/simple;
	bh=0Df0wcFfjUSURul6U6jUfcBYgmFA16siTeYWTmMNhuI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IAaFw0TN6EzJAL0FAXpRgsmAaQKA9ei0HXQDQax50aeqKTjld5boN0NYHBtUflvlDokZj4YX4w0rtuXpCyEBEel4ogr/07q4lpiyllL7wZ2+vBReTca2iZz9VedILzejg8RkBSN9CmiTu1qp85YxXZ4bQMXVndhUBFFMubcZGeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gB5CjjkY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gB5CjjkY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0F801F000E9;
	Tue, 11 Aug 2026 22:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786485624;
	bh=weCsvZmlXX+BTGHro8nQq4ynoz/F3nAmgGCSuNqDgME=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gB5CjjkYYVjXC8EJIiV1welap4MEmru2nSVMp4k/tbNCxIWYgSHjboUjDit6h50zQ
	 AWMdLqKHWf4SUnUER3vsDSore9GOrlj8YggE/6kleRDGQoYlWc8HaJ7IvyzAkeBlL0
	 dEsIczgMQ0PvRWoxKeR2lka9PkhZ5gbX9R4TMCZ8L3Yh6rE0z+H56aLuKhZeV0v5oS
	 j4IXnlrIJjOCuhzzWGR3IiGt2MMLRAQnADKwhDgVKHHFxo67rUgSRO/wbQC14aFdgw
	 98Ft2cM06Ym1eqr66e9oujepYlw7Y1tDoM2FopCgUDGV12UeutwNIbXT7FC7/cysDS
	 6zQBP11iD3/Fw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 7/9] usb: misc: qcom_eud: fix virtual attach/detach
 event handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elson Serrao" <elson.serrao@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260811213610.2956147-8-elson.serrao@oss.qualcomm.com>
References: <20260811213610.2956147-1-elson.serrao@oss.qualcomm.com>
 <20260811213610.2956147-8-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 Aug 2026 22:00:23 +0000
Message-Id: <20260811220023.D0F801F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The top-half interrupt handler attempts to sleep by calling `readl=
_poll_timeout()`, which relies on `usleep_range()` and will trigger a sched=
uling-while-atomic BUG.
- [High] The hardirq handler silently ignores concurrent interrupts because=
 it uses a `switch` statement on a bitmask, falling through to `default` wh=
en multiple bits are set.
--

--- Patch [7]: [PATCH v6 7/9] usb: misc: qcom_eud: fix virtual attach/detac=
h event handling ---
Note: The format of this report has been altered to provide a free-form sum=
mary of the findings due to recitation restrictions. The inline quoting sty=
le has been omitted.

commit a8a02ef8fd7fc3586fa115aa0dd7a40742fbcfe8
Author: Elson Serrao <elson.serrao@oss.qualcomm.com>

usb: misc: qcom_eud: Fix virtual detach USB role
   =20
This commit fixes the EUD virtual detach handling by setting the USB role
to NONE instead of HOST. This correctly represents the disconnected state
when a virtual detach event occurs.

[Severity: High]
This isn't a bug introduced by this patch, but looking at the top-half
interrupt handler handle_eud_irq() in drivers/usb/misc/qcom_eud.c, it
calls pet_eud() for the EUD_INT_SAFE_MODE case. The pet_eud() function uses
readl_poll_timeout() with a delay of 1us, which relies on usleep_range()
and might sleep. Is it safe to call this sleeping function from a hardirq
context, or should it use readl_poll_timeout_atomic() instead to avoid a
scheduling-while-atomic BUG?

[Severity: High]
This is also a pre-existing issue, but does the switch statement in
handle_eud_irq() in drivers/usb/misc/qcom_eud.c correctly handle concurrent
interrupts? It switches on the bitmask (reg & EUD_INT_ALL). If both
EUD_INT_VBUS and EUD_INT_SAFE_MODE are asserted simultaneously, the value
won't match either case, falling through to the default label and returning
IRQ_NONE without clearing the device interrupt. Could this leave the
interrupts unhandled and potentially lead to an interrupt storm where the
kernel disables the IRQ line?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260811213610.2956=
147-1-elson.serrao@oss.qualcomm.com?part=3D7
