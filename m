Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBA8481AAC
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 16:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789403577; cv=pass; b=cIO8amnMyHyyXjguV1JSsGBG/4zkQZCj5now7B36b5hbTQ+1mhDpKIxdp0nfHvHba2dRn2uhhSQXqgz2m1ZmBhqX3HMMyGPHfWrkl3oju/d5uYYIBmB7dHV4ffbuF/zUSzZEQ2xL8KIHEIR7oY6tGGVH25fB7c0B0LVJ0HsGKes=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789403577; c=relaxed/simple;
	bh=hQHVRS3j3qwCMZvufegvdPbwFnAZmaOwqMLjoj+NQog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PSId9zqBppkscEMzxS5CX3vtNxJfSSCiS7YMmUi0YJOUb6PzB0VU3QgxxEq0uyIK1e5b9R0KUI+NjR//zLY4t2yrBp3am/N0S0+AersROSbaZDLs/98LbKtnVoCHSWeDFVYVJ3UYMBBCGOExeWsRfPloPz/U/16mXozRuOzC0m4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=ZPGHMV9y; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="ZPGHMV9y"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-8659af7454eso20549427b3.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:32:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789403574; cv=none;
        d=google.com; s=arc-20260327;
        b=VsOY2MzEZCPLQVYRxOnq3OMs3DfLYa7E+X+a3NQ4pwAgIRdaFKOszwGMg0iB37BHW6
         frwMSgOLRxaCiWR9VQ+Np0bXunUC0kCSHXvLNlsSm/w+/38PM5VRILv95MkVwIamWVyo
         cudi/js2LB+thnlfgs3QMRYCiF0PbggTKhdoJFC/6op6gmUgqMmV769LBM+NangOxTSz
         sIvA1od7Hqzkyt12ifdaeqCXrhV78DmseN+fLS1udObaW+zibQVs6xzAFX0vD4JYsEBA
         XVR1bHYAqkfEQ8L2pTIPuvazzxxw+b20vM/LvOP7ErsvzovTVGL88lUY0bHvMKKEFv3j
         tAdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U2puunLcCA0Ud8zKAQs4npBTHlIwjTI7Amm7eOrF5FM=;
        fh=4xP42Jzy5VF3gelmUISmFLARdCu0VhrBwlV57qcsws0=;
        b=LLRcY3b8A7aJSSTyRvu2YXhhipCmjeAeDGREjjMeydmINtxrHiCah5n0/i1Ps9/7Ri
         F/PXGyQZnIsZ8Q1fy6SQ2NNyVkmb3UdsoZXQSwZFX1M35UC6upSC1vfNGVozx8mvHNf5
         WTpx9HxBDeahHgRhW4w58Mec+Dr99TVfDoBhmh8VlBaBcyc9J68klLwgFVYOQ3DDe0gF
         U3TCluBdnRcXT3DxIkR2YWTbuRMckwk5vmgKIRRJgdGBT9kBlmC3xlBGR3mBNRcYSonF
         dS69k+8EhvchlDKULdx8F3Hcbaqhk64wJuuRoTu/ToF0L7f8+I6TVosn9ZK1VU8gioFd
         Kjew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1789403574; x=1790008374; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U2puunLcCA0Ud8zKAQs4npBTHlIwjTI7Amm7eOrF5FM=;
        b=ZPGHMV9yuARSC0LlxJW5/ydUkvViYv/bjhgCcuyX63K4CqaLu5IbgEyA3GP/XHic6s
         ryXFLpI03+sYhUpWVhzDN6Vag2Gw8A8dVWtnr3Hi5UoNJdI6ZSpcWxWB3tIl8CBLBpq8
         FDit62sLjMLg2fJxVok8lThOEoEEs9N0NjOz4X31jjd9fU2rxLku7gIrfPnEc9MHhhu+
         M8TjhEpete7p5j9s3nXlfz3RXujrUdzipboqhih2SjzssW+9/q9KoSGqmO4O2zBycSZy
         4HQHM0/azPrGmX9jO7OUMn7w5bNa5PJbSuLWE0PIg0dqj4xTvveIZuPoehlcqVoEZvme
         a5hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789403574; x=1790008374;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U2puunLcCA0Ud8zKAQs4npBTHlIwjTI7Amm7eOrF5FM=;
        b=uBtNa4ZiVayHfPkAC2x13A49DN3f9RLmR3OQXpRA6da7Mx8CW9khMkn5Bljo7DbzIf
         bHzU7GvrLYCUgDLksUzkYySM+G6zvkuAS2x0ih1HOikoocKrKpAjqKYmHO8PxjBUHTVL
         9bc+H253ctHKV6xfvBPMC6ycynuoJ8FFwbtrvH2ugFjosLMlgf7X5AvHUbDLYKpOirhF
         qTlQc2BxHaRGatQTfcJiloa20JcbNZ4gt2zkCBElsQ+i5a2pzJQ2axnc1+LZgaacfbsi
         KVnvFBY8Ugipb4BwuJaJcDfHl4uzwfw9gwNyAiM0gmh349ypFwP5SNpMm7S9iZGmlxak
         BG4A==
X-Forwarded-Encrypted: i=1; AKwUvBzyAaCwQj6YOAvFu3SuVTI0P224P/uXU+YzwQLtVk7Jn4DIZiA1sYceRYXjjPAZV1Ih5d/vDFx8XLqk@vger.kernel.org
X-Gm-Message-State: AFuF++m6AEikVSehC/zb7fxN/jXV7YU5bYogGD/PyDY3o+bS0FBwV3y1
	+4xUzjKe5YoKEdVFRPlDztBtwXbAsZYmfuOGY8GyETNwnvUprSaswVc0p6f/XVQL0XPnL1ET97L
	CiuKEz0uoK3ENaIjBjHlJdf9/Sl/aCE7r5J6rjsM96Q==
X-Gm-Gg: AYBFou2NvtUaXtJoIicIn+2heAg3EtrmtA/Y+x967+F2bXL3KiRZ/nCOs+y8p9h2yxh
	tHr3HcYyZ5H/DBvl0+v0i0DrtFFlyeNmLq9F8pv5Z84MuAzL92a/COyCwCfUr4iKGKbYTOFnZo9
	6i0h3wsTXmxVviMtqlJm5//wSF0+ATCMvh5LK0FYFqTOg11NHGIylHpfQXth+UPrVENLMsXB/30
	h1X/4br7L4AWi0JrKV0g7JXuQYQFRPp+wHew0Hg2gxJ2x8nUZOGqcnio86u33QTvHb7cnsSQpPA
	GFueqtAJyo+DK5KVb49ymT5EP5SxRkHO9rugDz7aMVaVpe3DarmYgfZDpnBeIFTEFP+hAMW0TbI
	neGaA1yi61aGkYBtFxaNMMV8mhLdIZW4sRTDcgXrThjaS
X-Received: by 2002:a05:690c:d8c:b0:862:ec8:d142 with SMTP id
 00721157ae682-88d1f505069mr12332497b3.15.1789403574227; Mon, 14 Sep 2026
 09:32:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-08-k3-ufs-support-v4-0-22aa2bd97d3b@kernel.org>
In-Reply-To: <20260908-08-k3-ufs-support-v4-0-22aa2bd97d3b@kernel.org>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Mon, 14 Sep 2026 11:32:41 -0500
X-Gm-Features: AcwNN1VyLPHubK4HBe4wLXnzYSfxOmAhK5WWmFPob51Sa4JHSy9JegsQyxuk3OE
Message-ID: <CAEev2e-zQotX9=QCfZxvYHpUD-hSgxbEjsVey4hEc2YbpoRjnA@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Add UFS Host driver support for SpacemiT K3 SoC
To: Yixun Lan <dlan@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@sandisk.com>, 
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, "Martin K. Petersen" <mkp@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>, 
	Jennifer Berringer <jberring@redhat.com>, linux-scsi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yixun,

On Tue, Sep 8, 2026 at 2:42=E2=80=AFAM Yixun Lan <dlan@kernel.org> wrote:
>
> This series try to add UFS support for SpacemiT K3 SoC, the controller
> components consists of System Bus Interface Unit, UFS Host Controller
> Interface, UFS Transport Protocol Layer, UFS Host Registers, Device
> Management Entity (DME), Transport Layer, Network Layer, Data Link
> Layer, PHY Adapter Layer, and M-PHY Interface. A more detail functional
> block diagram can be found in SpacemiT website, chapter 9.7.3 [1]
>
> One known issue is that the device will occasionally raise BKOPS interrup=
t
> when doing some high load test, log from dmesg shows
>
> [  806.710763] ufshcd-spacemit c0e00000.ufshc: ufshcd_bkops_exception_eve=
nt_handler: device raised urgent BKOPS exception for bkops status 1
>
> Link: https://spacemit.com/community/document/info?nodepath=3Dhardware/ke=
y_stone/k3/k3_docs/k3_usermanual/09_memory_storage.md&lang=3Den [1]
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
> Changes in v4:
> - fix clock and reset settings
> - drop function which retrieve value of tx_lanes
> - propagate return error of ufs_spacemit_dme_set()
> - check return value ufs_spacemit_check_hibern8()
> - drop call to ufshcd_vops_phy_initialization()
> - handle compiling warning if CONFIG_OF not enabled
>  add __maybe_unused to ufs_spacemit_of_match
> - Link to v3: https://patch.msgid.link/20260806-08-k3-ufs-support-v3-0-03=
7fb322acdb@kernel.org
>
> Changes in v3:
> - collect tags
> - fix dt-binding warning reported-by sashiko
> - fix low freq in opp-2 table
> - fix err checking in check_hibern8()
> - propagate err code in link_startup_notify()
> - update documents for event_notify()
> - ufs clock driver is merged into v7.3-rc1, update cover letter
> - Link to v2: https://patch.msgid.link/20260725-08-k3-ufs-support-v2-0-45=
036a2a2418@kernel.org
>
> Changes in v2:
> - fix missing interrupts property
> - move ufs node to k3-com260.dtsi
> - convert freq-table-hz to operating-points-v2
> - rework reset_control, fix header and drop global variable
> - drop dump_host_regs() debug interface
> - converge and refactor dme_set() operations
> - massive reduce of busy delay() loops
> - drop vendor specific hce_enable_notify(), fallback to default
> - drop unused member from struct ufs_spacemit_host
> - add COMPILE_TEST support to Kconfig
> - comment style fix
> - Link to v1: https://patch.msgid.link/20260702-08-k3-ufs-support-v1-0-1a=
64a3ab128f@kernel.org
>
> ---
> Yixun Lan (3):
>       scsi: ufs: spacemit: dt-bindings: Add UFS controller for K3 SoC
>       scsi: ufs: spacemit: k3: Add UFS Host Controller driver
>       riscv: dts: spacemit: k3: Add UFS support
>
>  .../devicetree/bindings/ufs/spacemit,k3-ufshc.yaml |  56 ++
>  arch/riscv/boot/dts/spacemit/k3-com260.dtsi        |   4 +
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts       |   4 +
>  arch/riscv/boot/dts/spacemit/k3.dtsi               |  22 +
>  drivers/ufs/host/Kconfig                           |  12 +
>  drivers/ufs/host/Makefile                          |   1 +
>  drivers/ufs/host/ufs-spacemit.c                    | 678 +++++++++++++++=
++++++
>  drivers/ufs/host/ufs-spacemit.h                    |  79 +++
>  8 files changed, 856 insertions(+)

Tested-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
