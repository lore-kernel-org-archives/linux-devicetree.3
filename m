Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FBE37B007
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 04:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777436280; cv=pass; b=Sz2btKk9zVA8UC4p0xdv2K4wMENAYUIX7GNBeCpUNSxx6B0s0chyn7QhctjIL/yLgLxNN6wwJ565K2MGNw+fwsY9IidL6P2JOg56/GK9skfPexFn0zClqo30EIQU6OpS8kEYThNAROlMTuzRhz34Wt+NmklN2ggHFi81Lbq23CU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777436280; c=relaxed/simple;
	bh=AzwVlyIqYxfmPExGHlhzDdBcn2kCaAcRsyV/IiibDeo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kUV7nblf4es4ajYsyi0MNwT3Gd8ekgbKFAr2oxJWldDByBZNCWxLM10rndcvP+kj0H/4CPlq0onQ4J7f4YiAZfNjcsZw1a+DjbzvCvxDQHhVXDt8EtRc0rxxWsmLkBMG1z8Gbx5LU+0XFi1moaR1ntLoSsmOFhkCn4ygYeUcJ6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FOYbthWP; arc=pass smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FOYbthWP"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38e9653b580so135210901fa.2
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 21:17:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777436274; cv=none;
        d=google.com; s=arc-20240605;
        b=k9zYWH6zqpbjLHwWDyi5ewf++6U7RG8pUK7AHOmyHbblr1s4G+o67BoLTVqb455kWU
         VyzOrUcR0VbgRWjdEri06vKecI7MVwveueCqms/ipiwOWuZrtOPOSmYHvFKuw4B8sqKU
         8ethEtvAASjWIld5Z/fS29QL4YhSZ3iHQM9ybYIsazpeHQLLpxeWY81xMPD4Zp8UPf+3
         3tmeldyumxuGBdD7lbu6900XkY025EL+KCG83oSDoa21lbXI21NCCN3NSMlPGvYl0Aa4
         RtI7fADssURaN1Nk7NxFZbCTgv7FgPR6c1NObbnnHg7T3QPCYLYJYC+DaxwItVQjsiie
         afAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OGT5/UW9QnYnxFplrWMvYfyGjM/y+JrwSoKrwJn5UdU=;
        fh=2BY7r2wlbduLzuWiyK1dj+0mIzj/aJrHDttnr9+5T0g=;
        b=EFu5iCVAG8essyo6DCo8XEHLdyoNvbt+M2Ul0l0T/9k00A82AAlWL95BkNCXhNJwq/
         L5hxZxU+oZ7VMrxiz1Q8tIG14YdejA0POoylaGgDVPKE+nDmrFjbSPSmBSYZqEP3PUEw
         sqVSKnuJPrTAsj/X1ZH6Cl2qgTp85sKyIcVI4vG5EYe9oKrmBxhTqh8wNBLJeWntnMT4
         H8XEfJOqCiyLVzMwL5PyCQ6asfd6Y0ggEt/vCZecuUkp1q99LH9lDSRnBWqkJkSlE5Xz
         pc3zspBS8vRZLFMY4URgvDFAzD2anxfvRf8rw1/XYUCyNDe95nCts+10BdwwGM0rfV30
         2JrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777436274; x=1778041074; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGT5/UW9QnYnxFplrWMvYfyGjM/y+JrwSoKrwJn5UdU=;
        b=FOYbthWPP8lZx5mA4McOSfJeVR0BRGPHdmtlgr+cFqDyaIit578GgtZp31cw0VznxH
         wKUndv8E0Ym7rLT/XDgblyvzj9usFKBf1rj3kFh+mLXvelnaKsP7iTgtAULRzrmny72b
         FRk3AuvUtX08mGI610FMukA4zPRDmNgO5zMjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777436274; x=1778041074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OGT5/UW9QnYnxFplrWMvYfyGjM/y+JrwSoKrwJn5UdU=;
        b=gjc7GqGdV+k0/10rMcmW/bUWIY7/P98L0px7/c2yt2h78Ft61QOgSMfvhxg8BgsGfr
         4W+Uzv8LO8HwMGzYY6BX3hlVtjxnn2rp8QMv/OHGBUFnNv75BtcdBO97NgyA4FIeRtR3
         lwjuSDU9pkjktRB9Gdsafj2j2TW66SiX0gxEQt7GyfEnKSByIYhYOg0hfAdZj+kBG1Gm
         HaZxPm34KjOKvqh1oHWIvvuihjCl8YyhsGnY5HRCxZxkFj4ciUpIG1QqKd5vufLf/4mY
         5x6WqsQ+lxKftXwIcKxqqWalFMCe+PUTgkx4ZICIq388CnmOU86wXiJ15Fy4MEGXRANf
         1btw==
X-Forwarded-Encrypted: i=1; AFNElJ/Ljp7J75wPHrvgGjXN6zhSn/RYApqWnRBOqp2lguKXybO4/xVA24pdW1AU7x2fkTc15HM/IHFeEDnX@vger.kernel.org
X-Gm-Message-State: AOJu0YxY4wTox4eekCZ15SGiUuup+he06JTm64S0qp3m3IfwWT67I+ne
	pz7Ac1EbgLwTXWAnDEFMbfFhCYJx8wN5WaBDEKWtjwnsjUq+YjAiV3imBqzpb4YmXwq/hnKVC6x
	qKYkkCvKgL3m/mrHEXu0KIEJzs0gPMuW0wPwjStpu
X-Gm-Gg: AeBDietUkcdwAnBZcUBcz+xJhkW6afcu+SbCe6LkCzPox3nzayRXPuPkHPrgwfg1+LU
	XForPFvGR+8hfFLqcheHgKVwrc1FZeKwad2Y2uaD7nTLHWrZcLIe5Y+51pX2X7HY3GAJ4QcvO2X
	4ZJjtls7vJ5Av6khy4lLapPrCZgv8pNBXP5joAX94x3/4eAzd9H/gXJK2Rk4uu0jAhq+dWaMOXW
	i1YKIiYCLCP1u6NxifUxro0oeRXYky5w4b/Bbc6Hwh96/8MLgAcwqRUPOh9byIYhjev1I+QKCAh
	F6/OyQ/gyptn+rr4mw==
X-Received: by 2002:a05:6512:3b21:b0:5a7:46f1:d96a with SMTP id
 2adb3069b0e04-5a749cf6fd8mr890120e87.13.1777436274082; Tue, 28 Apr 2026
 21:17:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-2-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-2-briannorris@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 29 Apr 2026 13:17:42 +0900
X-Gm-Features: AVHnY4JKvPmufJ1LEj4mzB6PnqIoSu-1P7-pbmF9YGak1q31h2Rrygv9WVJBRdY
Message-ID: <CAGXv+5EPpB92d=ttP9ezOipL6=bC6WYpQakkd5L-weDjLpkrFA@mail.gmail.com>
Subject: Re: [PATCH 1/7] arm64: dts: rockchip: Add #{address,size}-cells to
 Chromium-based /firmware
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, Doug Anderson <dianders@chromium.org>, 
	linux-arm-kernel@lists.infradead.org, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	Julius Werner <jwerner@chromium.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2026 at 1:12=E2=80=AFPM Brian Norris <briannorris@chromium.=
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

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
