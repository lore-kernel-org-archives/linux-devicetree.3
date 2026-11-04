Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793786979;
	b=DXPBoXYPHBKPfx/Tba9uncIJ42i1A8TQ3jm2poxRQJp7E4fFpTKYFQi72Fx2PS/pTE5C
	 aY/zb+CmPo7FRQgDhpbb7B+K96n4sQN5y3p+6z8fCdCeTYuwLpTHfA1DzfwioquRnucNf
	 J563uuOrkmzsQjlhc9UrTJWbBF/7Knnfg562eUtLEHyWmPqXcvoJ/qplENK5BajW/KaSr
	 Qx6UXmR3APNaZxKaPSTcbGlFlfHnKlxnBGcrcmRs0kzWj3vl13JCw0wEDGZJgCd6ynJIu
	 /1MOle7nGa31oLa4KzdMZxgNdnMs1/rPWVEIj0UmJsDczh0GJQreLS2MiBt4HKNUxuQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793786979;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GRB1e0g/RzNosgVh22Q4nbJS5JXGJ4/s7oJ6tqlGbYg=;
	b=0wIyt9NjEAvqmx9khvjjW1VOxlk80Ej4fXP7rU3y/8b9xp6yIvzM/sjzX98DSCzH2kfC
	 VFERDY1m87g/FJ+mtwCjnLG+si2aSdMo4qU1tUD3FFGC20/KsYU3UWjLn7fwtyqIEwu9v
	 Twivx7XI0T7skxQNag+ezrpq/lEs2rpJPQIkpGtVvfjyTPUncPnW7jdgQM+H+i2kLIhG1
	 YVrVRBqAb4T7SbBNxf4zDYcf9Tz72KB6bv/Wu2OPjMgjd+S+6x2wdFsZ8zdlbdFK3Z9zO
	 +C9D6VU2VglNiHuiqgxUknwdc9laPrfCvM9SAhDU6auLBXqxdojC9chJKIdgF6Gb94A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=tomeuvizoso.net;
	spf=pass smtp.mailfrom=tomeuvizoso.net;
	dkim=pass header.d=tomeuvizoso-net.20260707.gappssmtp.com header.i=@tomeuvizoso-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=UcHCwjZk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.170
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B35C606A328
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 10:09:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B35C606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tomeuvizoso-net.20260707.gappssmtp.com header.i=@tomeuvizoso-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=UcHCwjZk
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93e6eb77f0bso61146885a.3
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 02:09:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793786977; cv=none;
        d=google.com; s=arc-20260327;
        b=Ayg2N2IwXr6PZ3odnZJPHDZrfumppHl2BLF8jTy+LilWGLEc5Gt2obnxKdckfcZmnk
         llaGFHCVLuvlgZG3PBSy2UoU7xu6Elo+MINAGzdN8afZERqFtj2Rl1V8L0SC3HFGO/0f
         lMzCnjMU1awrWAN3hh7PHZAqyamrIWc2xFwsVeLhRzImNt7KvcNrn2DL2n2wqDa7rAvZ
         1UnkmAGFrG0jkj26Khj1l1fb/ydEkTj/MD36OOBLI1KI/f5qrM0qfFTF1AYw4YBt0Lk+
         BJ7lREkn0Lv0crV+7M6TukITItK2I6ORPxeMsYffsOlhyrSV7tFB9IIt0E8jXjP+dBPh
         nDhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GRB1e0g/RzNosgVh22Q4nbJS5JXGJ4/s7oJ6tqlGbYg=;
        fh=psMWwe33N003bEGkGoq8uthAoy9CeNDKzi0oIhXQCgw=;
        b=aUf+zHkM8XGyX42Th2uQHUy+ZPI5GCUvrvkRPCK9RfmCCLlLZf5j0HvZQotZr35c7+
         DS4PK7419wDgmE5XpIzrt5AgSJfwEgKwQvs/NQ7nX/soIRbSik0HpVRdNEejZUc9DKli
         tB/yuoW0xkFzUTHC42DPNvD39fndeFjXcMVwzsiiTOwcvegxdqsAF3u3s0B2mOmsHCAV
         EnEr+t2UYgDN3s1f1GySgOmXN3bv1G6XkTDHN1XTgrtSxQxncZc1+j7/SE0AR9f9/UVp
         1W9zPmuFvmLx9mH8qgU1PFgkjx/pK+Jd7WQi+/lIC3YPSN9oKYmjrDBKxM+SeYEvMmVo
         US5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20260707.gappssmtp.com; s=20260707; t=1793786977; x=1794391777; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GRB1e0g/RzNosgVh22Q4nbJS5JXGJ4/s7oJ6tqlGbYg=;
        b=UcHCwjZkxJdU7FrRZcBt1CxKGPzG2AJoKdOEXy6bT0/6tI1dlsBE9UxkNQCTTl9iFg
         CzZsbKtm2Zhe8y6Iek5l+jWdVirGy65os5o0NtAw6vLC1uBwHyEz4DFZmAz9vXWKRjFA
         FyJ0geUDEQnCktWcgRKGpHC5iCBkdyErjWGE7xcafrhlinEyZSdvmGyMbMt14g/ishMR
         7aP+AcCLRYYxfJUen7AxTSj5XlIcIcy2Y4Oy1G37/F5M2NJirI03RNV9XL6KI1+WF1dP
         e/vZncP8FzVcOBM8lQiXqWisOGl+f+l9GXvsQbpEn30kZ99OtKtdpyJju075XZ2QyLUF
         sKyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793786977; x=1794391777;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GRB1e0g/RzNosgVh22Q4nbJS5JXGJ4/s7oJ6tqlGbYg=;
        b=2kNjfz9yd2wFEXrPsMU0Lxz4QQljZjrem6Pjm6VWe1/qFu69v4F9Ru4UZ3KotWgqxR
         dmeS+ZPGE0Tdnd4P3Py6U0YhaF7ClRs4wEXx2Nq2eaDNO266y3NrIFMKpEqaiQcEHJv4
         Hh9t2F5KMRJ8V26laqwzWQ2PrRSIMjncaeVKdjC3u/YH0Jpm1aL4oHPsrpztt2583sK0
         26DINQ9TtT+fT60eX945UaN3b9VIDpMtqEPaKf/BguWmOU4ce9cdNFxIvN5uk3761n1O
         qk/7e1gi3AZ2vcXfjotedB48ctDS7llcwbCkMzlt2wvRe5L/296cwvq7Dc6lcWBqgd8X
         a0OA==
X-Forwarded-Encrypted: i=1; AKwUvBwjyQ5Ivd6QFYNpUviqQw9lUC38g7EBcJqC5QryjAHakG4SZK98rmetej768nthO1gj0p9YUoNqb0T4@vger.kernel.org
X-Gm-Message-State: APuU4Z+XUiTFf42pChM2NRg0BBfENY4sRK+RW6xLqGx7PExdoCrjKqW5
	3wrD/q/RklQAwRzS7QyBKEHtetSIRNzLWpaF9hG57AIsOIhcztK7Z8TcR/HgDPka6aCCspd+CUw
	L521MW//W/ueaQpxpSx+lPfAtwL0zKjBgv/U72a7GDw==
X-Gm-Gg: AYBFou0O175EW/yFNfDKwpcdMmtiA2uMMsox5NF9ZEbMGCqEModvJNe/L9AB2dBkzKM
	SET3lc4rljKTqsOnHevR/7ITJt2YtnKWVx7t7PRUWaqYEFmtBmmvQwjj4dMEutfpu/E0x1iDH/6
	sieXwSi1XRlxY10ew9ZW3AKiVVZN//Gl9ziIKv+FCZgf8/GmhzgvQPr2vwTbJYFZMNOPQ8c43Pp
	hGUTVnMXX/PIfI6FFxLZo9M8No+xP+nvm5M57O+jst7CNW98F3bYwpd53718o2ImSvdBWQh/f/2
	1b1kbR8kw7YMTsr5mzx8BXYHsafQs9XQ+1iob0/Q5uEGq6/m4Gn9jayqckcv84ZgXHIB2ckbs4c
	oz6RKzDw7Y8gkgjbU8nh5SUx2/Beue+HhwAubaxfZ+jBsuBRbF2YlWhGdLK8W2to9EHOwHJD8Hs
	/72i4vcQFZ1kOQbeO8GpY=
X-Received: by 2002:a05:620a:460b:b0:937:6de8:b40 with SMTP id
 af79cd13be357-944217194b4mr2663985585a.15.1793786977174; Wed, 04 Nov 2026
 02:09:37 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101082307.151957-1-gahing@gahingwoo.com>
In-Reply-To: <20261101082307.151957-1-gahing@gahingwoo.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 4 Nov 2026 11:09:25 +0100
X-Gm-Features: AclHuK8sSyrPUh77ae7umfCvxuLdQ-s4Z2b2nFvZD8O11RHz5Wmhve3hcOyzmnA
Message-ID: <CAPsqS2SOj-+VQxsFvMQ1Hqcep55J0yT++76QZ8or4a9kmF7Bdw@mail.gmail.com>
Subject: Re: [PATCH v15 00/15] accel/rocket: RK3576 NPU (RKNN) enablement
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, ulfh@kernel.org, 
	p.zabel@pengutronix.de, ogabbay@kernel.org, zhangqing@rock-chips.com, 
	royalnet026@gmail.com, abel.vesa@oss.qualcomm.com, 
	sebastian.reichel@collabora.com, sidong.yang@furiosa.ai, 
	u.kleine-koenig@baylibre.com, chaoyi.chen@rock-chips.com, 
	diederik@cknow-tech.com, alchark@flipper.net, leonard@lausen.nl, 
	jeff.hugo@oss.qualcomm.com, rfoss@kernel.org, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, iommu@lists.linux.dev, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 9:31=E2=80=AFAM Jiaxing Hu <gahing@gahingwoo.com> wr=
ote:
>
> This adds the RK3576 NPU to accel/rocket.
>
> v15 is v14 rebased onto next-20261030. v14's 12/15 no longer applied
> there, because Sidong Yang's regcmd validation added two defines in the
> spot where 12/15 adds its own. Nothing else changed, and the tags carry
> over.
>
> Leonard Lausen has the series running on a NanoPi M5 and posted a board
> patch on top of it:
> https://lore.kernel.org/all/20261019090348.378183-2-leonard@lausen.nl/
>
> On Sashiko's two points about v14 9/15, I measured a CM5-IO. U-Boot
> hands over with the NPU domains on, and the power domain driver still
> probes. The NPU QoS is saved before its first power-on, so it is not
> zeroed. The domain whose QoS does get zeroed is the GPU, on mainline
> without this series, and that fix went out on its own:
> https://lore.kernel.org/all/20261101055633.101309-1-gahing@gahingwoo.com/
>
> 1/15 is the patch that carries Igor Paunovic's name. It is also part
> of his DVFS series, so whichever lands first, the other drops it.
>
> Ulf offered to take 7, 9 and 10. 1 to 5, 11 and 12 go through accel,
> and 13 to 15 through rockchip. 15/15 needs 9, 10 and 12 to 14 first.
> Without 9, 10 and 13, the ROCK 4D takes an SError at boot when the NPU
> domain powers on.
>
> Link to v14: https://lore.kernel.org/all/20260924102135.92217-1-gahing@ga=
hingwoo.com/

Hi,

Could you please add a GET_PARAM IOCTL to this series for userspace to
query the hardware version? I think I would return an enum that
matches the NPU DT compatibles one to one. Then userspace can have a
hardware database indexed by that value with sram, register map, etc.

Regards,

Tomeu

> Igor Paunovic (1):
>   accel/rocket: request the core clocks by name
>
> Jiaxing Hu (14):
>   accel/rocket: take the completion register writes under job_lock
>   accel/rocket: wait for a running IRQ handler before resetting a core
>   accel/rocket: let the core suspend after a reset
>   accel/rocket: factor the completion tail out of the IRQ handler
>   dt-bindings: npu: rockchip: add rockchip,rk3576-rknn-core
>   dt-bindings: power: rockchip: allow resets in a power domain node
>   dt-bindings: iommu: rockchip: describe the RK3576 NPU MMU
>   pmdomain: rockchip: add optional per-domain power-on settle delay
>   pmdomain: rockchip: cycle an optional power-domain reset on power-on
>   accel/rocket: select the per-core clock and reset counts from match
>     data
>   accel/rocket: add RK3576 NPU (RKNN) support
>   arm64: dts: rockchip: add NPU core domain clocks and resets to rk3576
>   arm64: dts: rockchip: add NPU (RKNN) nodes to rk3576
>   arm64: dts: rockchip: enable the NPU on rk3576-rock-4d
>
>  .../bindings/iommu/rockchip,iommu.yaml        |  28 ++++
>  .../npu/rockchip,rk3588-rknn-core.yaml        |  47 +++++-
>  .../power/rockchip,power-controller.yaml      |   8 +
>  .../boot/dts/rockchip/rk3576-rock-4d.dts      |  22 +++
>  arch/arm64/boot/dts/rockchip/rk3576.dtsi      |  86 +++++++++-
>  drivers/accel/rocket/rocket_core.c            |  32 +++-
>  drivers/accel/rocket/rocket_core.h            |  11 +-
>  drivers/accel/rocket/rocket_device.c          |   7 +-
>  drivers/accel/rocket/rocket_drv.c             |  42 ++++-
>  drivers/accel/rocket/rocket_drv.h             |   2 +
>  drivers/accel/rocket/rocket_job.c             | 157 +++++++++++++++---
>  drivers/pmdomain/rockchip/pm-domains.c        |  89 +++++++---
>  12 files changed, 467 insertions(+), 64 deletions(-)
>
>
> base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
> --
> 2.43.0
>
