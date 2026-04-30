Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A48436A033
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 00:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777593663; cv=none; b=G0lFsAjHQEQ8GN9YWn8EXzApReyE2fZeTWy2jqNGc6nElqmAXHb9GaytHlfxZ5u+sqjjL0tCLy2GVOT+QxzO+TzKu12fKUJt2gSX9l5dcYm/p5vEDbcTkm9TLH7/FT8LKXdm41uz43YJ+RQd8iZJhBZeTk9lb5sByXDmDPagc+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777593663; c=relaxed/simple;
	bh=K6HjmbNrmRNPQFoeUy4vXzHlo/g/A/oFQFErhjwT8ZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fUntb0hW3CYkHKXRmz2VLngR21jNoU+o/3/Fy5RWKJKC6CIFx40jy8SkIcyXedaQ3beM5KoAd8PsWXPDD+AbyqJI/vl4jMl6Km9pmlKyKLE8En8stGT/mSLcyRz8pr+8aQ87brGZ5PXiSaQD9hTJZlbn9udu4Kz8DRjMoFbHs7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gpxYspYL; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gpxYspYL"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-67389cf78b0so2831647a12.2
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 17:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777593656; x=1778198456; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E9C1umI5D1atr9W6hfkEvQCrhMpTXSs9QJYfV/9UKu8=;
        b=gpxYspYLdmF1NuaDG89z2jx0tdSCwWUhcEqvZ7Z1N3YjejXfZze1GQR0T6zg108NtI
         Qaa2V33cZ+WwyoqlwOJCVVKUnuejECwsTMjGOR8719jBJcXUQ0/MIhFvI+7CEXtGb9CR
         FbdkIfY07yotL4WkIJ2I6QQ2NnxQy3zE/Og2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777593656; x=1778198456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E9C1umI5D1atr9W6hfkEvQCrhMpTXSs9QJYfV/9UKu8=;
        b=p3E5ZEkTSFuohsaYqaXm5DaJX5/WtQFS3G6rd3fzWeHig30/V1Tcb8a08FeDfR5GYB
         bbpM94ZEpNcPv3xh0zscJKDjsE0cmqD+XIGvQ4GHI18RjD5x54fJZdhMV2vpd+I2qXc9
         bFNTGYmMSm+VasMsjkzPBmguVW3iIi589W9YlZWFYL6PzzFxaRsBaqjOn5ctsS3V3+H1
         +am5Eb3Y4Dz+NjP1p3Kp32Uwtpzy7nuN0+LNR/GuXKbU3AvDUuievSFP08q4htbT11RG
         vyKJzwPscLFlulxn64IHvJX9wK40+VKu+enoBijFchrAUKofQQi2TLHGLU6yllMAi36v
         GRRg==
X-Forwarded-Encrypted: i=1; AFNElJ+kXI7RfWMpdpYuokqi4r1CllRqt3eABfqK39LJq8fga+v0tVx8WN+Wljgd71tmDviLM+s5EECchfsI@vger.kernel.org
X-Gm-Message-State: AOJu0YysEWGGxPdHDUVd8k3pmwHYpuquvaA8CQissh6+mm+jifX31PE5
	FtrbFS5uYsP5fx17eh63NBj3srZ8Na45X8nZht8I/okgwGQ8O05rgVX4zSAW+r/6KPKDsGl6eAG
	HRPzkrj8G
X-Gm-Gg: AeBDieuSAzBrynpT7CBvzYgjoUKKKWwHQMW6FrqVdSfGDDtI27N4/hx9TfI+APdyiX9
	HZx/yYyKsKEBHHzgeV3GTmBFqsJvj2lb18kI+sHNHdjv6OrNvLo1R3LBoEZSXcSMZJMLg4BGwIg
	BSubpeyFYweBMZmaDwbO9DC7ndNPrXUj0uUSKpSZxyDWPmPdpIOk9Qe5uapWM6R+VmNIuEcsQKk
	YI8Se+k/oooIfEKhettZhT0Tz/Vgtt4D59SfZsS/JVhGO7yM273j3MzpX2SAa+7HyYYDA+fL95h
	Ce3D+CXTmGk6uG2uXXBOwETdkssMihkxCob4bPsobIlcqOg2+vZETJLiAIPmnSQv95kcX7oNR+I
	hBFEvO+kXkAjkpr3UvDnGHPBHmcqder/49+VFZayhi3Qx+WEIYsoCcuh99wB+O3mwMpKvsZEVnM
	jNBMBDW3SDkUC2cwVBl0xN00vhSnFLld5Y55XbJw1QXE7ybOnV1j1ECIasL5VqQJV1CQmDSLr3
X-Received: by 2002:a05:6402:324e:b0:66a:8002:fe17 with SMTP id 4fb4d7f45d1cf-67b5d821dc8mr2104522a12.13.1777593656241;
        Thu, 30 Apr 2026 17:00:56 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b8875eb57sm403397a12.30.2026.04.30.17.00.55
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 17:00:55 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b8f97c626aaso302752866b.2
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 17:00:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+L0Kds1XbKROQiIsaFDfrCIUVcbQTcsoTvsW5RoqCHWF00Z0g1tj4sluqq9eQGNu95ddpvok+tcsTe@vger.kernel.org
X-Received: by 2002:a05:6000:40e0:b0:43d:50c:6f18 with SMTP id
 ffacd0b85a97d-4493cc3fdadmr8678277f8f.11.1777593256152; Thu, 30 Apr 2026
 16:54:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-2-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-2-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2026 16:54:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WhtAz7WM+AsQ9yTwzQMv2B--c1ca27a=fpvVFccRVd6w@mail.gmail.com>
X-Gm-Features: AVHnY4ITNUkQNF1rYH2AzAfyi5kerkzeuZiwFrCYx_qZbGHsYv-60K7BAEKUu9M
Message-ID: <CAD=FV=WhtAz7WM+AsQ9yTwzQMv2B--c1ca27a=fpvVFccRVd6w@mail.gmail.com>
Subject: Re: [PATCH 1/7] arm64: dts: rockchip: Add #{address,size}-cells to
 Chromium-based /firmware
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev, 
	linux-rockchip@lists.infradead.org, Julius Werner <jwerner@chromium.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, cros-qcom-dts-watchers@chromium.org, 
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Apr 28, 2026 at 1:07=E2=80=AFPM Brian Norris <briannorris@chromium.=
org> wrote:
>
> Chromium/Depthcharge bootloaders may dynamically add a few device nodes
> to a system's DTB under a /firmware node. A typical DT looks something
> like the following:
>
>   ## From a RK3399 Gru/Kevin Chromebook:
>   # find /sys/firmware/devicetree/base/firmware
>   /sys/firmware/devicetree/base/firmware
>   /sys/firmware/devicetree/base/firmware/coreboot
>   /sys/firmware/devicetree/base/firmware/coreboot/ram-code
>   /sys/firmware/devicetree/base/firmware/coreboot/compatible
>   /sys/firmware/devicetree/base/firmware/coreboot/board-id
>   /sys/firmware/devicetree/base/firmware/coreboot/reg
>   /sys/firmware/devicetree/base/firmware/coreboot/name
>   /sys/firmware/devicetree/base/firmware/chromeos
>   /sys/firmware/devicetree/base/firmware/chromeos/readonly-firmware-versi=
on
>   /sys/firmware/devicetree/base/firmware/chromeos/active-ec-firmware
>   /sys/firmware/devicetree/base/firmware/chromeos/firmware-version
>   /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-sto=
rage
>   /sys/firmware/devicetree/base/firmware/chromeos/vboot-shared-data
>   /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-siz=
e
>   /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-off=
set
>   /sys/firmware/devicetree/base/firmware/chromeos/hardware-id
>   /sys/firmware/devicetree/base/firmware/chromeos/compatible
>   /sys/firmware/devicetree/base/firmware/chromeos/firmware-type
>   /sys/firmware/devicetree/base/firmware/chromeos/fmap-offset
>   /sys/firmware/devicetree/base/firmware/chromeos/name
>   /sys/firmware/devicetree/base/firmware/ranges
>   /sys/firmware/devicetree/base/firmware/name
>
> The /firmware node has an empty 'ranges', but does not have
> address/size-cells.
>
> Commit 6e5773d52f4a ("of/address: Fix WARN when attempting translating
> non-translatable addresses") started requiring #address-cells for a
> device's parent if we want to use the reg resource in a device node.
> This leads to errors like the following:
>
> [    7.763870] coreboot_table firmware:coreboot: probe with driver corebo=
ot_table failed with error -22
>
> Add appropriate #{address,size}-cells to work around the problem.
>
> Note that Google has also patched the Depthcharge bootloader source to
> add {address,size}-cells [1], but bootloader updates are typically
> delivered only via Google OS updates. Not all users install Google
> software updates, and even if they do, Google may not produce updated
> binaries for all/older devices.
>
> [1] https://lore.kernel.org/all/20241209092809.GA3246424@google.com/
>     https://crrev.com/c/6051580 ("coreboot: Insert #address-cells and
>     #size-cells for firmware node")
>
> Closes: https://lore.kernel.org/all/aeKlYzTiL0OB1y3g@google.com/
> Fixes: 6e5773d52f4a ("of/address: Fix WARN when attempting translating no=
n-translatable addresses")
> Signed-off-by: Brian Norris <briannorris@chromium.org>

Reviewed-by: Douglas Anderson <dianders@chromium.org>
