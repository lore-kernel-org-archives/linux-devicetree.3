Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD7E2EA754
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 00:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777593640; cv=none; b=hRspeXM9mE5n7Ys7g1dscaIZ3Osmbizu+4ON8ToNd5b4U2bmA33pvyNF2yFh+JeKHUsGjlgPyRPGWFI1YDUNfQgSoW8FmWb/fYQTXBzflmAn2peSqKAVOa1HB4WKBVmggvV9q4m3QfCFipUWqNrpL8aCwTI/FvxrLsIA4HgiMmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777593640; c=relaxed/simple;
	bh=sQxuhOfm4oyjjyHRHwYJHnDekKF9G661/WNU4U8f4VY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XVzzveLd046uJ+B6WB5HQlNMQmeQCbofcUA1Zzjt3lvKgMiXrf/nzPQfYty1641jcxctN9kd3mJLY7AcXfpYleb1tg6bgwc+wNvOe+tT9IGvJ2XoNGgONNfz5GIyh9ZhgCbYL72JSdZd89nhDl1A2hMs9MyD1nX01Mmpdb1p7hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cQhX5Un1; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cQhX5Un1"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-baebe98afa0so208324466b.3
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 17:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777593634; x=1778198434; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/X8TMTxizrgbcCVq8AAcQ8SrqTljyGddB0DA+TirOI=;
        b=cQhX5Un1I3H0dsESdXH1kF3/NjLzWteVb8empsflc65XbGPJQwDSYkEaP487nbqNoo
         uAWTcQCLnZ2RFlI2QNPwd2ncF6WG2lmcKOjSIzLFdPFEtnWPW4mo9PUcuSH39VsE91Z3
         ehy1gXbflgQu763BoPHrBa3Fr79rKARIrmaD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777593634; x=1778198434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z/X8TMTxizrgbcCVq8AAcQ8SrqTljyGddB0DA+TirOI=;
        b=N6U5+C8/6ku4J3Xme56ZJ71mEaFnfASKCiYohTT5mJkIVfQcjCqFF/iJL8pcF/W2UZ
         WoUpN7Fs/Lhn639c+8jGoWZtKdyeE0rTwBD6IrvdB5kjHiq82kXtp6pKYQhPm2Qs5wyX
         J7Yn7IIjmKfr6c13QrBoafzgY+2mQSvmTEb6YtyRw5knwqoAIrzOU23KxDKmXn8DAsIX
         rbXJplXLlnQbkOq/bMg2Tw50VggXp0Q/CA/YSZGbUGNBrxEv2eY/5L0gkw5Vn/NJKp9H
         PqXuf15jqa6QDXOY7JS0SNacy489Rn7N7uzgRAxYAP1IVEYl42OhKyCfNPrtrTSAtDLF
         qExg==
X-Forwarded-Encrypted: i=1; AFNElJ8i+XBqoknf5Mx9Up53sPhUiJNDyoQpcxQXCe781qtrUL72/3pd4rXdEUHKZnWCCkEWsaJyRXaOlCYF@vger.kernel.org
X-Gm-Message-State: AOJu0YzqBtTKfJwFaoU8zA/GjzQcIhuuDmYNkAwbc2Z7q3LR2LYv9ElV
	LuqKYznAek6jJoWe1DollAB33gFXVx2V+CshKyy3MeNxxTIh8caF9c5YK2fHVtKa7hQOEwHGcBB
	lTscnGWBN
X-Gm-Gg: AeBDieuLSgOwEY37vr3MW22FoQBf+hgVMcpk7RfrY6dlN7iM7ffRYEQqA0392Eu3JbY
	rOG5D+KGw708N3hNPW+G7C2uRdvpX7ImnFEbALciBZiE6aQf+pZSpTuLQUTacVr5sY1ik4tj+jg
	QSXE6OeJ9lhq9USnq9wQNDbUTi3KBTafUyCb87SPgbNVCWVHdLH4kf6SLy8MhMFGsHH/c4F1g5K
	AcDADmDf4iw8Ex4DrQP8DV4UI/0Oc8PKf/+8eCxAnoUUm4w/HJfFgJsPVIZtFNG4o32By9bYUlK
	mFdne/ZitnKlrEJdbAwbYrwyJs6wbwVx6ZWAkYoq8jtEIgTksr6E+quLAG4018Ye2uhfnWQOGFA
	izXJxSftYwYPa0AKOKtqvc3GeRDZ0vUrf8XWtwA5RK0NCto7xA+T4I5ZFa47KQQsFEXno4NZQeO
	6s3rkal866M2VlTLLoaeoUyrCc5+zTjUXZkiNnmljCZ1B3CjxMEwBj6bfVctjwAz9UGpKuKdVnq
	MpbcxnUZaY=
X-Received: by 2002:a17:907:2679:b0:ba5:60e1:2ef2 with SMTP id a640c23a62f3a-bbac7799fd2mr257506266b.22.1777593634323;
        Thu, 30 Apr 2026 17:00:34 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b85e28ef8sm425521a12.2.2026.04.30.17.00.33
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 17:00:33 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b9d9971d059so199289366b.2
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 17:00:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+52uChCI9f7s40tdiPvCmk+ecdl7YWOeRzM5b3iQM7gbiLToLB1HXZwBirwNrfO3S0iu8HcwmP3IcW@vger.kernel.org
X-Received: by 2002:a05:6000:26cb:b0:43d:6fb7:fedb with SMTP id
 ffacd0b85a97d-4493ec61e55mr8612204f8f.36.1777593293572; Thu, 30 Apr 2026
 16:54:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-6-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-6-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2026 16:54:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UcDrakNVEZW24hCRizyh-VkgCGiZaPd3z+QyPoYzU=YA@mail.gmail.com>
X-Gm-Features: AVHnY4KLFGb62k1dRvCKyy7EF6W0tPNO3zKHC2HCyssJ_nJGpMzpFc_-TEUNEXc
Message-ID: <CAD=FV=UcDrakNVEZW24hCRizyh-VkgCGiZaPd3z+QyPoYzU=YA@mail.gmail.com>
Subject: Re: [PATCH 5/7] arm64: dts: mediatek: Add #{address,size}-cells to
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
>  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi     | 5 +++++
>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi   | 5 +++++
>  arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi | 5 +++++
>  arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi  | 5 +++++
>  arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 5 +++++
>  arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi  | 5 +++++
>  6 files changed, 30 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
