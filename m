Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E0C3AE706
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 21:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784236782; cv=pass; b=fANfmGDANTlbcD84ldf0CT/3q3xYYYXczxs8TiW2fu/B3z/pLU8UIOTXExxULyTrIU5vJnDjt25pLtdjHHJHLKAga6xvfNTd4E8kd8L0cTxPigu9LP02uyoY2FLwEBg2AAJadjMDAnN2Nr+zLk+S8KReVY+j+6LDXcuDFEdDzls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784236782; c=relaxed/simple;
	bh=sFhCVkngWCGw3B3gBsl4+13q2+ArEajPoD0Hm7zsDQk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iV4Bb/Vd1HLhT0MhmiswSD9eWGqxLTWLtrECi4QigqmjZ/AAo3iAd7AXypHrv+gZgPMkXzl3M5X+IjbBnq0l1xL9YcNa3/3vLGognDp16lQ/Gi1boYrLlZPamm0WnnonR+kKK3AYeY++RAqZLGU2lKE9m9h/8yIW4HZu++E02Z0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PLdtsoon; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PLdtsoon"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b0148201fbso3175586e87.3
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:19:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784236779; cv=none;
        d=google.com; s=arc-20260327;
        b=WDs+akjTDoR+m5ndCzvSdH2OtIZ0dy1dcDNWiBnav4qXFPRZ10SwP3ul0xnGfQPkO6
         ZggI/pAqEed9kUzZdEypSyKxFWsRfFWwVPd2Gf6mdOQYOCBcPW6Tjx2pwV4odIMKupmU
         d9XOFAMFvsmyquec4rBUvjvEaW61RaJFXb2qJaE9jYz1p1PQDVq35eHw4yk7fhA2avE+
         102xk4mXy6Nid5A0KbQGX1LNA537aNtmFAttGAqo4yqMoeQbIudpq1NwM/FqD5uzs4Rm
         8p+dR8GVZZrPJIjTbJNSsf/ipMOFocg2UJHDC9iFK2GuXJCyEKPfz4Mkqy0/8aU9tX6v
         eymQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zYJZVa6pJsj5mxAW+2FCJM9HLntDNEgnj0RiqQalRx8=;
        fh=a+3It8PIErcLHa+JIEH2XUxfrGUgvo4Zzv/fW+LFPus=;
        b=E5ajo2RsC1qmfrJdXkfRimFZeUwVQDnSWrgwWs8bRqGkVA7Uou1UcvshmleUk65Bz/
         EAgBuWNzywm66+jSXV6eL4/BdrY6jYbvpb6DLcFw5bk1RP4i84kAp9T48Rw1ZGg4w8cd
         O3nmBLjAG3BFUqfTkSK4Q7IWiU+0fHlwj73vb/nFeDjqbPmgl8bYR04Cms8PfUXA6NAr
         IGib3ZX2o8oVC46ygO28W5UODgSzm9RdlYUSnRP0S4uBP/mQXBWPLMwN4Yk12lIERPMw
         OZG7ZpcetFKCI4YCGP5cvzIAaRkLIaKqctjOu1+FB1We+dxF9Aht/Hxijeu3cYPJ1MeD
         B4tg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784236779; x=1784841579; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zYJZVa6pJsj5mxAW+2FCJM9HLntDNEgnj0RiqQalRx8=;
        b=PLdtsoonVpKa+w0suY0ZV0Ex5/HpYEvHolbiZkTlPH1uy4+ZbWvRboqS0Rxr++Zeur
         psxDRFRDZxjgeR9wMpMw63zmYQ0+6Wsn4dlme43WQSb1nDB/1HkryB8Id9tB8r46nS05
         vK7W1A/iGD9pK5LqChK6ZlYVhS49p15y0UR8YPCqzr6psanc6N/zNd3f4E2F7f5Irr8F
         OQ7DcfwMnvrYJhW7iBgNTss3sH6hPAYMr0BvdeD8crc66JP9/c2xDtbEn9XnypZUbKxU
         lRP9vWLgkDcTM7BGCBSbIP+XN80IbTG7erXlBiWpxrp57XsmB51sCLr/tiEa/6HHyubu
         lxyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784236779; x=1784841579;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zYJZVa6pJsj5mxAW+2FCJM9HLntDNEgnj0RiqQalRx8=;
        b=pXwsbbv4IE50r/VRUBlLah8Yqj0N6RgZQ7TS6SnzX2XTiCJeCnTEjeVCmSpDC/gaz1
         7xqa0bAtZ/01H2ihUT8Veq7SaMa9DWQpElaunuNUKDO+9HUGQxfcaJvBkMe4MLuOHWUu
         Id70iA9hvbLra8DFwDgrHa6RlIu38eJNsdvn1ZnLhjtE3RsJSL3N/PC4htRmrGbNOdbf
         XBluHgHIbKWKKxQkV4ZLhYUrkVCIrBw7QQehD0VRY28Pr61zdyUzd0WaHd596dUuJZ5G
         /ERWy+RykhQ0x7eidX4wVr7DopSEoz8cFMkK9OEO4Q9X1AqVyHtuybytkoC7qWM155vL
         hpcA==
X-Forwarded-Encrypted: i=1; AHgh+RoHeICLj/VM8mRaNEU7Q2OgZx0bk/7ZRNzYNcgHWuGB1IXatEAoyJVtrtlMX0mdV4bex47EgbOsadK1@vger.kernel.org
X-Gm-Message-State: AOJu0YzUbpzA0oxm7reE+Elbn9OnQyqD4HBVfPQcd/f4kX187EfEudLe
	6EG70LcfYcaKM5qPs5hDPx2ICiScpT2pwzdlEiPmjkv7P+oZ5QJoDthwjZdUla1hAEHP0cVKJkE
	Gw951Vq+iALAajNagcHBOItMn69hzElc=
X-Gm-Gg: AfdE7cnvWtK8gDYczIcjV1wMJbGAxVdIgHdcgEmWO6CXfBeBVQKi+6yaQwpsowR++/v
	GrF4QC/QTsePhzE5GID9gT7LJW0L5QaHnXMYoPyxjQ2fTiMMmwsmNv5yX6THrldeMO82eR9lL7P
	Hh8ObeTdc0XkKdK/PGxNhClZiZ/wf/PTGYCKgkV+56bCctxHANWKj/zMPNWAH6+PlKvUt2MWxiR
	UXBvzkbdcU15+NQB3eyRN6XixGB6QHxFpC+eF8gvPypdXVeb0CuL/S/kI2PHsl+aebZwILyotug
	DMSq7AFkN7NA2ht4I31GHYDdHP0cRBc56a43tTjWl9qb4A2IYqru14W0u0jUy328IT9X2GvxLsA
	rv5Af
X-Received: by 2002:a05:6512:3ca0:b0:5ae:bbe5:2076 with SMTP id
 2adb3069b0e04-5b28dd6f98bmr123691e87.52.1784236778311; Thu, 16 Jul 2026
 14:19:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714101146.200416-1-kieweg.leander@gmail.com> <69a8c2a6-d0f3-4362-bfa1-04923db6f3cc@suse.de>
In-Reply-To: <69a8c2a6-d0f3-4362-bfa1-04923db6f3cc@suse.de>
From: Leander Kieweg <kieweg.leander@gmail.com>
Date: Thu, 16 Jul 2026 23:19:26 +0200
X-Gm-Features: AUfX_mzGxb4_nZhrElpdqX1OGlkRyvGXZ3ROjXjZTkwCFoQscuHHMNBlRZzaLmk
Message-ID: <CAMwcS0g6S5f4vnyS6KEmsLFmTW=YmnSAY06OTovPWqza4iFwTg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] drm: Add DRM driver for GlandaGPU (VHDL soft-IP GPU)
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

Thanks a lot for the detailed feedback, this is exactly the kind of
guidance I was hoping for.

> We already have a driver for a RasPi-based USB display that someone made
> in their spare time. So being a hobbyist project is not a problem per se.

Good to know, thanks for clarifying that.

> 2d primitives are likely not very useful for DRM. The canonical
> reference of why is at [1]. The tl;dr is that there's no standard API,
> and GPU-CPU transfers and setup costs are too high to make it
> significantly faster than software rendering.
>
> Various people have proposed to add some form of 2d pipeline to DRM, but
> nothing concrete has ever emerged.
>
> Conceptually, DRM doesn't really render anything. It composes the screen
> from already-rendered buffers. Rendering to these buffers is mostly done
> by Mesa drivers with some help from DRM's kernel drivers. If you want
> hardware rendering, you'd need memory management for off-screen
> rendering that Mesa can use independently from display output. Therefore
> these simple draw and clear primitives aren't that useful. You need to
> design a full rendering pipeline instead.
>
> [1] https://blog.ffwll.ch/2018/08/no-2d-in-drm.html

Sima's blog post that you linked makes the reasoning much clearer than what
I'd pieced together on my own. I understand this means the current
fixed-function
ioctls are really only a placeholder, not something to build on further as is.

> Using a single ioctl per command will kill performance. So, if anything,
> you'd want the command-buffer model.  To make it fast for 2d primitives,
> you'd likely have to model it like a 3d pipeline: have all 2d graphics
> buffers in the display memory already and submit a large batch of
> rendering commands that generate the entire screen at once.

That's a helpful concrete direction, thank you. I'll look into what a
command-buffer submission model would need to look like for this.

> Rule of thumb is that you need a working user-space side for ioctls.
> Mesa would be the premier target for 3d.
>
> I'm not much involved in Mesa, but I think Mesa is quickly moving
> towards programmable pipelines. Getting drivers for fixed-function
> hardware merged might be hard.
>
> How complicated is it to model a stream processor (i.e. GPU core) in VHDL?

I think it's doable at a small scope. Some memory to hold uploaded
bytecode, a minimal CPU core (I'd probably base the ISA on a reduced
RISC-V subset, mainly to get an existing compiler toolchain for free)
that processes it and writes the result into the framebuffer. That
part sounds genuinely fun to build, and I'm actually looking forward
to it, though it's a fair amount of work and I'll need to find the
time for it.

For throughput I'd design the core with multiple instances in mind
from the start, e.g. 4 cores each responsible for a quarter of the
screen, and scale that further once the basic version works. I'd
still get a single instance working first before parallelizing it.

> Can you use a PCI device for that and let the kernel do all the work?
> See [2] for how to get a PCI device id.
>
> [2] https://www.qemu.org/docs/master/specs/pci-ids.html

I want to make sure I understand this correctly before I start on
it. My real hardware (DE10-Standard) stays exactly as it is, still
using platform_driver via devicetree, completely unchanged. Only the
QEMU device would change, from the current fixed-address platform
device to a proper virtual PCI device (with a reserved vendor/device
ID and BARs for VRAM/MMIO). On the driver side, that would mean
adding pci_driver support alongside the existing platform_driver, so
the exact same driver would run on both, just with two different
probe functions depending on whether it's found via devicetree (real
hardware) or via PCI enumeration (QEMU). Is that right?

> That's indeed a good thing to have in hardware.
>
> I mentioned that the 2d/3d rendering is probably complicated to get
> done. If I may suggest an alternative, you could implement additional
> features of the mode-setting pipeline. Besides the primary plane that
> your hardware already supports, you could add a cursor plane. Or you
> could add overlay planes for displaying YUV formats (i.e., video
> frames). Or you could implement existing DRM properties, such as
> scaling, background colors, or HDR.  These features are already
> supported by user space. Your device would be usable immediately.

This is a great suggestion, thank you. A hardware cursor plane
actually fits something I'd already been considering for the hardware
side, so that'll be my next bigger hardware update.

Scaling looks approachable too, and I like that it wouldn't need
extra memory on the hardware side, so I'm adding that to the list as
well. Background color I think I can already cover with the existing
CLEAR command.

YUV overlay support is more future work for me, my current memory
layout would need a bigger restructuring first to fit that in given
how limited memory is on this hardware, but the idea itself sounds
appealing since the VHDL side looks fairly contained. HDR isn't
realistic here either way, my test display can't do it and I'd
expect to hit memory limits before anything else.

> Glad to hear it didn't work. drm_simple_display_pipe is obsolete and on
> its way out. Please don't use it.

Good to know, I'll drop that idea entirely then.

Given all this, my plan for v2 is to drop the ioctl-based UAPI
entirely (removing the custom ioctls means there's no UAPI to keep
stable, which takes the pressure off getting the command-buffer
design right immediately), address the style/review comments from
Uwe and from your code review on patch 2, switch the QEMU test path
from the fixed-address platform device to a proper PCI device as
discussed above, and possibly add background color support since
that doesn't require any hardware changes. The cursor plane, scaling,
and the stream processor work will be separate follow-ups once the
hardware side catches up.

Thanks again for taking the time, this gives me a lot to work with.

Best regards,
Leander
