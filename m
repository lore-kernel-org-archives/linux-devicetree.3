Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F88363C46
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 14:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052045; cv=pass; b=O+Tm5UcKZGxccLnCH6AgHRCw9ItOPOTwWavR+OPmJJGCcmlSZM1NjYgTs6c8fPSqEtKskKjgPqiBxlPFkJoryTUkGFvvNdhJDqS7ph9cCso6lPP0iAw7q0YI3sKX5k3C7BWrbuFET591jQyBujg4+wMYH3DccA40WYptGkvGiPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052045; c=relaxed/simple;
	bh=IGzkZ29oQC5+zM7j41y1PzuVxI/kR6lS50DPmDPTu28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qTqTXAjxRdFSTrBFh/hPIbCT92rmBZrmLZs7PnrTgTTvv86xtPi99YQBrv9Ocemc0Ep3Ya/z3gTrqoJNtnwX27AW07sslYi4bqMcGsSIM80m8wHsD7HV9/A0d2P3qwQrEiT7GqdSB5g5zhY29xFFq3AZu2zQ2RhD5ztCH6HNeWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=bmR9DOE1; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="bmR9DOE1"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6063d7dc4so2200900a12.3
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 07:54:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789052042; cv=none;
        d=google.com; s=arc-20260327;
        b=cu09+Itkr6x/dP1eZ417Z6Pk18sbpT0GwHwm6KPUDSBjVuwL7gwa1oNoFAckDv03mC
         F2lwMRJn1lyz78uicMqUXbrcuI3dmSQUU14WuZR7nncOPMgD5BcbU8DVqbb0HlAQ9zc/
         QB++QiqACTwM03+N6S7zrbKMJMY5+8gN8X8N3l9sFZDEKt+4nSiusoCVwpJD15ZwEYiF
         VK6tDY7HnkjDqM4xuW3Rgv5D6/yNhvpBmYMCM2EKS7+QycfsVrzQQByry12wH2bpQ2Es
         j0HBu2i/HZsfPGy4g1ZbLek+/ypk+l6IBHvWxweCX15b5rAtCzjUHFQjqd729cXpldvo
         31/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZGkfTmvcfg2tYgnaJgCLfP1/mFjyPE2KGae6+BF91/w=;
        fh=AldpnyhbCTHKWy60/w8jw2Cz9egKGmRo0ydzExlLP6A=;
        b=VGN51FrJpuClF52jT6YTlmG4y4/RYHkCOPxncMRuuWTUO0RWlfweniNaoNvIobV6W6
         mnzDFoQmdATa7a3ZHne5bvhup9BdWrGf1WbZnF16RjTLiouAfUtS9LeMZjGa8GlDLLyn
         VZmAe1k0mM4soZ0uN5xod7RgdmFuK5obu30mAiL1DL9hsV+1q6zcqo2UWygIst87ofNp
         Je4vx51waNvHrRBLReuUVrtpWIfWAhoRbkSq0XwLFl5O2Z9elfsdIQHJ7aN9jD7oB6w/
         EjQbcrASTIHws6nWhZoFC6MrqXo0Wedu8P7MS8JsX9prYEznPpE2YR1zNNOxgahoPNPG
         Kzkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1789052042; x=1789656842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZGkfTmvcfg2tYgnaJgCLfP1/mFjyPE2KGae6+BF91/w=;
        b=bmR9DOE1kiuwo/0EEYBWYaFXPCazkgK3+YC+fcIWVMElfEPXRcpZauAfFfOJ/xAAWC
         Y0YOvJnzOcxuI76Ybw7x4R26ACCJDGFAWo0naEewthOogK1jd37Ey3JTto+uFhJqEEhJ
         i6Y7EDpScFK+I7RBgjjjh9pky3yidw4vJCSFJk9TFG9yU4Qcp6vo/KSPdaxQyWjMWn5t
         hWNsj3a2yGzjdUHYZ4dz37IewDMMZQa+I1pVusjNL75c630pXEBP/DnVlJFZH5OoFaKp
         JhDd8hWME2feD3Lo0ZG/8721XQFqbSbYZ+399jb3EWuKoOtpthAHXFFRHSULJWf/FCUc
         L6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052042; x=1789656842;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZGkfTmvcfg2tYgnaJgCLfP1/mFjyPE2KGae6+BF91/w=;
        b=L8hJrhvSxdJQ+/etljmlNMU5bDfVOA3Ag3F6zaokplfGTIrl4EI3GzdH/rtmKl0SLi
         83x0/XUZE2wJbeu5YVNIMwcxlY3K0sEHF7v2B2dcrmRO0m2YtZLZF8suAFMbecmjR5IC
         8b+Y3Bt4qrLfSSNRPmR65/3RX3U6PG8Y0vgJCh0wZDrIyY8SIQdvkmIoSIIiJbicjozf
         zWzZllKOwthtz7PWjVtFx24keoll0d1jmQx0KVDUcaE+YKklaeg33O9P/MQg8ZIQvW+2
         3WNahTf7li8WRnvHN19Y0ggcJymRleIewvElrkm4BR7CHaYCDg7XAfxrsvfl1bWu7mlW
         RffQ==
X-Gm-Message-State: AFuF++mmJ9XCV0BU0Xa0TD8HZ3ZfK7+4aFTlIZysWYg/rySyDiSLE2e0
	RK0bGCxh2Wl8OFtHrVKlfIVd/neXfW6fNfsmVZ92yTrXV/dn3UA9gHdocxgrkhHI/HkL4ro8eE2
	vNN503hE6C4YHXIPuNe2sj0SlbIG6lZv85741me5up3XiExVIbgWWWXg=
X-Gm-Gg: AYBFou3SFtRIHYaTGv0t2NDJtFy/2OHvNofxx91JkWvvCQX6nM7bWi7ClMAHKw8bgV0
	IAzDJdtfGe/gd/tOSmnF2rL5zq4oHwxcg4bV/1vPAYimkUUXFmmJNriO4KkGNR6QUhr06kC9Vbw
	v5V94isxgn9+M6JZCAm3Gil2+RWZ7ugo8m/g6jfrcnGYmWbz12zydmpDysj7XZgUJ9lfzpjBpYf
	TECkv3MsGlJ3J8TFsm3+feeCDjqKJ8rnRA1+0yU1xddha0Y3fM5xhz6llgBlxZS4I0vr4nh0Wb0
	BDD7+CS+6DE1Y7M1ATlyoyoupN/KrrkFy5QvzvNc4hJr1GReIAFeOhGIwnBUOHM58V/GV5NWe4B
	HcebxC4MjOwmk+vDM7E9ERPA=
X-Received: by 2002:a17:907:c5ce:b0:c25:47a4:fedc with SMTP id
 a640c23a62f3a-c29418b652emr491393166b.2.1789051729432; Thu, 10 Sep 2026
 07:48:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-rk3576-otp-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net>
In-Reply-To: <20260902-rk3576-otp-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net>
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 10 Sep 2026 18:48:33 +0400
X-Gm-Features: AcwNN1UfoxjgFqkNtB6Aosk9zTLZTrJucLfz7oY5DTmBgBUsxij8crpGNXoG4yA
Message-ID: <CAKTNdwH9QAgreJ-6+t1j_P1di4VyoMBSsFkf_g=mCi_-M8g9Pw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] nvmem: Derive Rockchip MAC addresses from the OTP
 CPU ID
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Michael Walle <michael@walle.cc>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Finley Xiao <finley.xiao@rock-chips.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 5:08=E2=80=AFPM Alexey Charkov <alchark@flipper.net>=
 wrote:
>
> Rockchip SoCs are shipped with a unique CPU ID in their internal OTP
> memory, and Rockchip bootloaders use it to give boards which have no
> dedicated storage for a MAC address a stable one anyway: they hash the CP=
U
> ID and patch the resulting addresses into the device tree they hand over.
>
> Kernels started without that fixup, e.g. straight from the SPL in Falcon
> mode or by any other loader which does not implement Rockchip's derivatio=
n,
> fall back to random MAC addresses which change on every boot.
>
> Formalize the derivation in the DT binding and add a Linux kernel driver
> implementing it, so that a Linux image can use the same stable addresses
> regardless of the boot flow.
>
> Only RK3576 is wired up here, that being the SoC I can test on. Other
> Rockchip SoCs keep the same CPU ID at a different OTP offset - 0x7 rather
> than 0xa on RK3588, for instance - which makes supporting them a two-line
> addition to the driver's match table plus the layout node.
>
> Patch 1 is a prerequisite fix. The OTP hardware has its own internal stat=
e
> machine which only works correctly with serial access, but the current
> driver serializes nothing, which results in timeouts and/or corrupted
> reads (e.g. returning splicing a TSADC trim value into the buffer of a
> caller asking for the CPU ID, or mixing up trim values of different TSADC
> callers). Hence the Fixes: tag and Cc: stable.
>
> Cross-checked on an RK3576 board: the addresses fixed up into the FDT by
> U-Boot match the ones derived by the new driver, and the driver correctly
> assigns them to the network interfaces when the kernel is booted without
> U-Boot proper at all (via Falcon mode).
>
> Sashiko also rightly pointed out a use-after-free in the nvmem core when
> a layout driver is unloaded leaving its sysfs nodes and the postprocessor
> function pointer dangling. This is fixed separately in [1].
>
> [1] https://lore.kernel.org/all/20260902-nvmem-layout-unreg-v1-1-2d16bebe=
b518@flipper.net/
>
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---
> Changes in v2:
> - Switched from a scope-based guard to explicit lock/unlock calls in the
>   OTP driver to avoid mixing styles in a function using goto error
>   handling (Sashiko)
> - Link to v1: https://patch.msgid.link/20260901-rk3576-otp-cpuid-mac-v1-0=
-ea9135270fc2@flipper.net
>
> ---
> Alexey Charkov (4):
>       nvmem: rockchip-otp: Serialize reads

Incidentally, patch 1 of this series also fixes CPU thermal throttling
on my RK3576 device: apparently, the mis-read OTP-programmed thermal
trim values broke the thermal governor logic, which now works
correctly with properly serialized OTP reads. So it would be great to
have these merged.

Best regards,
Alexey
