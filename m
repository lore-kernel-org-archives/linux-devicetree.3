Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D793A31280C
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 17:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774113562; cv=none; b=iPBM+SqnFVYKFrGh+dp2Z9fdoYk8PEcFIDxS50df15ru6GVpcDvw0rAPBIfvdC68iAEBcwr7gMIHDgOHKWr7Vnn9BS+RHnsNEoGfX+0TvsjRpMU3E/pgFa/aNBprMMQ2JqMAavRixE1Fw/9ZqtEtrLqlqRYgJih1BQaKMiVba0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774113562; c=relaxed/simple;
	bh=7lbuSXy266xvscn6Azstf5i7N7zEFerSJLOUbFcN/qU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kdz9nH9cpVq3dOSbWywdhTp7bgQ+IYGdrz6SiIXZc/Hxzg24QskeihazN4DSRfGzhgDeL/D5uMkHpvxm2dPGQr4vMxNWvyO07kSOZx+LZvoPu6GSK2WgeVMvWDTTOIXMiWgXyW+AIl2PNhYTjx8vbs0cCgCZFLd7cEpbqRCPMpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=tomeuvizoso.net; dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b=YAf3V3VW; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="YAf3V3VW"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-506a747448dso13825651cf.0
        for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 10:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1774113560; x=1774718360; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7vHL3NHwLvAmvTyDujeMAKynQAKPZxIj2hZIIbS3qhE=;
        b=YAf3V3VWURkCcplJnWyO/BbZuCFWrfzr+kvQCe3EvS0LhOrXBjqjsoSQ5J+3zpMWas
         6vxBWFKyBNOnuVmDF4uBuAzRWMVf2XCc2eDwXfHhB6hL7OFH3NrNIYmEfeqj2u88Pvum
         bgWvRnY6V7qTJIC4p8jQWCN6HT9KEM6kstVVcE48r9fFhPVAjAI+tzUxRRRj4eVuGT8d
         LDo9zSGCWRKzKBjfOwWu+EMriRQ/S9tfD18uBJlvVzGI5eLpFzLkrhH7DKDqWaeM8JHc
         v5KhcORIj/TzXjGhqdKDWIU/YMy/jgQWOraWrDPYFynht01noHe0BzfzAC60qe6Auzzx
         EZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774113560; x=1774718360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7vHL3NHwLvAmvTyDujeMAKynQAKPZxIj2hZIIbS3qhE=;
        b=kN22pCywda2EgAATNS4/21jLGbBx6sr3yQFHDvaAWxLqshMOdBloILd1oXYho0Eb6c
         mnSDNkvol8C+g0yUnPZ/XpaelbKZLlZeOkb6y8mQqz2ijjjpGGalq7Naq0VumGHp30Lo
         sbTVOrYHzep1zf3Q0LTpiWseLlNEQ9XhiowQdvdCuzkWJhP+J8XnXgHy5y/ZgGvExYpU
         Jwihdb0HSYSg+Rr6843RrMFE/gSrdzq8YpSAMxZrhQbL4dLbrJi553b14cToksd6Pu+4
         RKOtnf5OEJ2taLUdHEmGaB6YfVpTdJL46rQJR0qEGDLS+B4UKKHWZST9hn6abwY33iiF
         JOkg==
X-Forwarded-Encrypted: i=1; AJvYcCXdvOckEfC9x0xsGM0Xl223SpwpQDbHAvdpJpSQ24sG2EdfiPyGNl+JtsTK9JPv/3FvNGtZkNoAXUX9@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf5Tni483jtn8vbiZ1TwojUv9BS6kRZQoh5/v1nuayz+yBup8+
	skfCfokwjC99PjVHBijxPW5BjYyoKPfH4+U5kfhuhXefHiE4ZMPitYqjZbxyJTZv3UGwmC2s1MS
	gkLbZdImoIe7A
X-Gm-Gg: ATEYQzy6Qt67xlbUP6qcn0Sv4qA6ZsR+m81xaCeh+aPyIzs27oP2EhFF1UJ6V0kUjqn
	WqOyx/MRHBzM2khyKbzTQNGpld6su2rlOFg29bSATXVoPdEHHaZDehH7Z3dewgRk+W9H3vFg1g6
	0e/0eLa0hj6iaSnmlkiw/7/4ToczJUGCoGOHsGO2Q6Q4onF1DJdOiC8ePNfAd6X+3TWN1l7SPfp
	nvdX2OmQCmnYY7MM2lqqWiGQScAYWZc1pBznEiYe9Mkdojzzh2jA9bGhflGKZVU5lmRZMZg6BqK
	VjrlydDzkUtKPUoGQ95+xbCudGzz9NPVlhVyC3imUqCR0USABTZMlb3xi8NF/jrXesWfgIZF08J
	IZzWwFl1Z0xeTRGwi8Wc3MP3WMRIi0lb43ZYPf+BAo4Nzetzlj9lWCgJ3mn6HP2Rm/Pu2cr5Y+x
	N+GaVgw2D+8T64pxMCi4Wlr6FLiLwX+VoinP5rLlS9zBdWew2zGp+rDLaqMrrHTw==
X-Received: by 2002:ac8:7d48:0:b0:50b:3c5b:5a13 with SMTP id d75a77b69052e-50b3c5b60e6mr89254761cf.61.1774113559897;
        Sat, 21 Mar 2026 10:19:19 -0700 (PDT)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com. [209.85.219.45])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36eb4f8esm43782041cf.29.2026.03.21.10.19.17
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2026 10:19:18 -0700 (PDT)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-89c55a0a470so20787576d6.0
        for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 10:19:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWC1kvj1mJdrDtweE8gmIFDxlzmwi5JfgSXl3058pPnLVLI6yvkSzJ/Nvih6J20zEUA/Zs1c8KIs5w5@vger.kernel.org
X-Received: by 2002:a05:6214:2503:b0:895:4bec:c629 with SMTP id
 6a1803df08f44-89c85a4415dmr120844646d6.31.1774113557567; Sat, 21 Mar 2026
 10:19:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306-neutron-v2-0-3019bd8c91ef@nxp.com>
In-Reply-To: <20260306-neutron-v2-0-3019bd8c91ef@nxp.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Sat, 21 Mar 2026 18:19:06 +0100
X-Gmail-Original-Message-ID: <CAAObsKDAzfib86rXqt9FjXV68yRkBzmijcyR+x=1MsPYd=MQWQ@mail.gmail.com>
X-Gm-Features: AaiRm51EiMaDZyOBoTxsmzhD9LKdQqqk1TUMHYTLZEpIizj3O9FXdJaoYzmTmY0
Message-ID: <CAAObsKDAzfib86rXqt9FjXV68yRkBzmijcyR+x=1MsPYd=MQWQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] accel: New driver for NXP's Neutron NPU
To: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, Jiwei Fu <jiwei.fu@nxp.com>, 
	Forrest Shi <xuelin.shi@nxp.com>, Alexandru Taran <alexandru.taran@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ioana,

Looks like the userspace portion of the driver is closed source
(libNeutronDriver.so)?

https://github.com/nxp-imx/tflite-neutron-delegate/blob/lf-6.12.49_2.2.0/CM=
akeLists.txt

Regards,

Tomeu

On Fri, Mar 6, 2026 at 2:27=E2=80=AFPM Ioana Ciocoi-Radulescu
<ruxandra.radulescu@nxp.com> wrote:
>
> Introduce a new accel driver for the Neutron Neural Processing Unit
> (NPU), along with associated dt-bindings and DTS node.
>
> The first patch extends the GEM DMA helper APIs to allow bidirectional
> mapping of non-coherent DMA buffers. While not part of the Neutron
> driver, it's a prerequisite allowing us to use the GEM DMA helper.
>
> Neutron is a Neural Processing Unit from NXP, providing machine
> learning (ML) acceleration for edge AI applications. Neutron is
> integrated on NXP SoCs such as the i.MX95.
>
> The NPU consists of the following:
> - RISC-V core running a proprietary firmware
> - One or more Neutron cores, representing the main computation
>   engine performing ML operations
> - Dedicated fast memory (TCM)
> - DMA engine that handles data transfers between DDR and TCM
>
> The firmware is closed source and distributed as a binary here [1].
>
> The Neutron software stack also contains a userspace library [1] and
> a LiteRT custom delegate [2] that allow integration with standard
> LiteRT tools.
>
> [1] https://github.com/nxp-upstream/neutron/tree/upstream
> [2] https://github.com/nxp-imx/tflite-neutron-delegate
>
> Signed-off-by: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
> ---
> Changes in v2:
> - rebase on newer drm-misc-next
> - dt bindings: clock fixes and renames
> - update DTS to match new names
> - remove unnecessary fields from neutron_job structure
> - fix use of uninitialized variable
>
> - Link to v1: https://lore.kernel.org/r/20260226-neutron-v1-0-46eccb3bb50=
a@nxp.com
>
> ---
> Ioana Ciocoi-Radulescu (9):
>       drm/gem-dma: Add flag for bidirectional mapping of non-coherent GEM=
 DMA buffers
>       accel/neutron: Add documentation for NXP Neutron accelerator driver
>       dt-bindings: npu: Add NXP Neutron
>       accel/neutron: Add driver for NXP Neutron NPU
>       accel/neutron: Add GEM buffer object support
>       accel/neutron: Add mailbox support
>       accel/neutron: Add job submission IOCTL
>       accel/neutron: Add logging support
>       arm64: dts: imx95: Add Neutron node
>
>  Documentation/accel/index.rst                      |   1 +
>  Documentation/accel/neutron/index.rst              |  12 +
>  Documentation/accel/neutron/neutron.rst            | 131 ++++++++
>  .../devicetree/bindings/npu/nxp,imx95-neutron.yaml |  96 ++++++
>  MAINTAINERS                                        |  10 +
>  arch/arm64/boot/dts/freescale/imx95.dtsi           |  28 ++
>  drivers/accel/Kconfig                              |   1 +
>  drivers/accel/Makefile                             |   3 +-
>  drivers/accel/neutron/Kconfig                      |  16 +
>  drivers/accel/neutron/Makefile                     |  12 +
>  drivers/accel/neutron/neutron_debugfs.c            |  34 ++
>  drivers/accel/neutron/neutron_debugfs.h            |  15 +
>  drivers/accel/neutron/neutron_device.c             | 239 +++++++++++++
>  drivers/accel/neutron/neutron_device.h             | 155 +++++++++
>  drivers/accel/neutron/neutron_driver.c             | 262 +++++++++++++++
>  drivers/accel/neutron/neutron_driver.h             |  16 +
>  drivers/accel/neutron/neutron_gem.c                | 116 +++++++
>  drivers/accel/neutron/neutron_gem.h                |  14 +
>  drivers/accel/neutron/neutron_job.c                | 372 +++++++++++++++=
++++++
>  drivers/accel/neutron/neutron_job.h                |  43 +++
>  drivers/accel/neutron/neutron_mailbox.c            |  47 +++
>  drivers/accel/neutron/neutron_mailbox.h            |  42 +++
>  drivers/gpu/drm/drm_gem_dma_helper.c               |   6 +-
>  include/drm/drm_gem_dma_helper.h                   |   3 +
>  include/uapi/drm/neutron_accel.h                   | 130 +++++++
>  25 files changed, 1801 insertions(+), 3 deletions(-)
> ---
> base-commit: 6716101ae42949e98ad4b9e71eeba08c055be410
> change-id: 20260226-neutron-c435e39d167f
>
> Best regards,
> --
> Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
>
