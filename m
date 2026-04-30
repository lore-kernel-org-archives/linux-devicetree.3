Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A9C3D904E
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 23:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777593324; cv=none; b=BfME9HSZzUUq5AZnqtmjvo8BtHQfi2M2A0lqoaZ64yZwlHt9DjjvLhkDBzajrCQ+saJLCfl0EolIPZ0EIddTJpsTWDW6HDY31IxpsGZFqe/AUIhC5pjuwtab7ycq3nn0Fms0EoXOGg3R3mpA/pkDYS+JF2B04salsDVoBP74Kuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777593324; c=relaxed/simple;
	bh=Po793qEB14FDeszlUgfCZzMNPlO0hdsx5m4i9+Am1UI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VYWTiLTEABcoyD4CpuSOly235Ym+VQ4/7xYtppGWsFXuR6T+RSYScjpGtubszISxceunTIvoFQmfVQa6bQYuvejRX5HgwVH4JQPyLi+0GxpPQrwFnRlCCSl7PH0SnQTdntPLXJq84lYbKMYHgSMw46FoDscR+B9tyX8OxUSKQg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=H85GzRHE; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="H85GzRHE"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-671c5eb7fb0so1657260a12.3
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 16:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777593320; x=1778198120; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/stw2Li+z9zBw8IsGsJQTT0j6lAz8JjDjcZka6O6Bc=;
        b=H85GzRHEyNXOm+vNPL9yFnzHQpWHlxWlRNRsFbpzu2tcS5YYcbeDbMVHqAAp0Djv5k
         Um46vfmz+0f+FVvdek0HorypL42UZ+IdA6jg/PgF1NBa2TWx6kB5K9ALgtuvJwxLmI35
         gnL0ClGi3G6R2MffKvdzYk6V9CdNM2UjsBjIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777593320; x=1778198120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L/stw2Li+z9zBw8IsGsJQTT0j6lAz8JjDjcZka6O6Bc=;
        b=LZcDTBiJamFeJXT1/3mgZ2JhbBgYyCiuV8Y3mYbhjdScei6VkeRpKDxux0fk/p04pF
         RNFJJbrDhQIFLzpqq9m6R2lEuW7R4EbfIMcwQsxcHePSI4xlLoYaprCVeUTkkjn2BQ9w
         XKQxJh272jQXX3pMeg/3h5SzZT509c85t1R7Ysj7QM1qVpoDZ8HQrXU/7OzmgSh6eiIE
         0rox1etVpQxGjUQ9GScXNpiXoqx7NAMmw4Mz8yoDfKqQ2qPV5abNi8DarkevLoKEuey6
         paie7XIbD3HyWsq+lGvfALo+QCzGr+RGAxMsd7rgZU4lsVuQJdAIkcH+SHt31fa4RqVs
         aH+A==
X-Forwarded-Encrypted: i=1; AFNElJ9vreRt3sZ2/kyVDdYaHmsv/wMa9b9ID7YtNlZYGJOetwGp5+i9sY0KoiLKbiXlAJve/BR5Z7phlKO2@vger.kernel.org
X-Gm-Message-State: AOJu0YwkHNjmbUCoBymp6igxPf7iCwqWmmwU+hmZgw1d1by0RALn4bMt
	VISUDyBwMCOboX5FoVjkU2R6MqOlGlF1UrXriEMSf3VGTJzCd6E/9Y6umguigB57ImhDjS2Ltl9
	7pxTe4w==
X-Gm-Gg: AeBDietctz+EGJHGcM32IGc1TlrAhOkwP6lRReFbBI7Pwcc/xakSrffHVH8/wjr1PXe
	CVADglPt51I92K7jPwZ8azs31x35zwVh0eIxl9zh/+mhS+GcfSYOVSJVmoc+/YH8EWtNw2u0zJw
	n9ceehCdOU92qE4ij6790MSMii66foB79chmHJVFwmRbSZ4FpsgPRh9sognpHUbSrx934NjY3oO
	Dv4gSv80ry+j1Oe/6fGLYmPtakj8ld05xVAFp8P09L7kbIHwsJfhhZC93IA9uwPcxfLTOHLiRzq
	eLW4A0J1nnI4VivLTj8tTXCBA8P2aA2E9tsfhDmbvp+EOUhcMBlLy8FYYlueTNqYa0j797oBvO1
	jCqK3JhUAKc3jTxvWeY3a0gGxVBgGrRUzqrsbhEfKvDYckhRhR5SnbI/VetOYXKZSeShiQOOgjU
	KTMcSjWSJCaBrnhJf6z9QuMsoRmLV8RF+MkYRhpMxxXpJFJ7etO/aX16hpzKzyKvIiS6D89WjqM
	wcagS0qh0Y=
X-Received: by 2002:a17:907:6b0b:b0:bb8:c3a8:9ad7 with SMTP id a640c23a62f3a-bbebeafdb09mr36096366b.13.1777593319998;
        Thu, 30 Apr 2026 16:55:19 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe69f6dc3esm50444866b.10.2026.04.30.16.55.18
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 16:55:19 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so1162352f8f.2
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 16:55:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+JMA4+BzywRhXEn3QQkHnpVFfSYQdRflewfyjEKSkkRzOmwiZB88b3unftbRD1X3rOXpsGOskARpEe@vger.kernel.org
X-Received: by 2002:a5d:5846:0:b0:447:55b5:d532 with SMTP id
 ffacd0b85a97d-44a87f60a32mr1080919f8f.37.1777593318187; Thu, 30 Apr 2026
 16:55:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-8-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-8-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2026 16:54:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V2H426VR8z5EEm4bWuK-Fvg_wr+mAkkaAfJrWcU0kV1g@mail.gmail.com>
X-Gm-Features: AVHnY4JV5Y3mu38iXutrpDHLS51XF8wv90SD0VK4jxBhsJoT2PtDnx5IHddvQ_U
Message-ID: <CAD=FV=V2H426VR8z5EEm4bWuK-Fvg_wr+mAkkaAfJrWcU0kV1g@mail.gmail.com>
Subject: Re: [PATCH 7/7] arm64: dts: qcom: Add #{address,size}-cells to
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
> / {
>         firmware {
>                 ranges;
>
>                 coreboot {
>                         compatible =3D "coreboot";
>                         reg =3D <...>;
>                         ...;
>                 };
>         };
> };
>
> Notably, the /firmware node has an empty 'ranges', but does not have
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
> ---
>
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi   | 5 +++++
>  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 5 +++++
>  2 files changed, 10 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
