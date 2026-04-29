Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F70D2F1FDF
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 04:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777436245; cv=pass; b=qqeeniOLsHZHQOTizmizZLkK9KSqwZjv+YKuxg/J/J2k2y+ojJjKaaQM2NayhhU9fEZVn1oRPjhmBnBC4/KTsf5I/zyjScpKL+UgFGFZzcSvgVWhg4iNajpoZNcti6oZ8cAgCQ/CWpmaqbUiNduaiMkPS4zYFc99ed0RyP+ZMuY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777436245; c=relaxed/simple;
	bh=ucY3TNrWMvRb0oHVhltYdiDBL03lh8F0+Cv3NgZ1q9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iiR7q+1nW1u95QiDwNERLL8vr8Q21TBOL2fzk1IbPUNCgsFsFumURkYwMdfXcXX1pirHekAcgegoWEsDQtQ9R8pGFmCixnSB64S9XemKOHI4dJQ08gPLQYL7mu3wPQGWCZ23aMB1IM3tsGG1DrF0HxMKokyB6ySydutug/YLPJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dvDACpim; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dvDACpim"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a2c7427ad9so11859952e87.1
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 21:17:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777436241; cv=none;
        d=google.com; s=arc-20240605;
        b=Lcgxjk4gLYfPVVM44BaK50xMlS+IOgAvGpCMSNvXEuA3AWId6U7sdjWdK1hdkbvkY9
         NTRPcLW+zhNQ0DX1b0Ozg1JQEsdPU1x/Rh+yZkLZHTNEhrQHiuHqj85c/JkyHSyXr6ri
         2ilhweu5NedFxj3H9wtTTHSfS4G3sISsHp61ajstuUilf3tTthfMo3tIp44mEmkMeyfs
         DkVQfTE2tWJyiIuoVv4YE7SHeSA7d+verHLxX1axt4t5tKRiEFtF25KJA9L09enTGEQ4
         /g01DLNP5jIaxQtS7mYhDc1sUVTIoVEu8MNLI2RTG2g5elMvCWOwAduta1O1wjBn8z19
         14uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S+wgx278PuWohl1935Byl8WX7gkc8WHJmkUS4pGdFI4=;
        fh=RC6jJXtJX9rGhPkc3COyMyo0kax+FWO1dKpVON+bpyc=;
        b=ZSLJDQuV8L0ticeLtZTlqhsyvUUKT6zKZHZymEZt4FcvWzy0P+Rjew4E0T4tdlCZ+S
         KeVHS0yfKKqQ/0Fr9D9lOpUdHrF6no8AdL8O5rwOI45xVIitqlVWXt/I4IwSB5yclKwh
         gH1jULk/MvRt6BV9P/Oeff2yzoQxBe0nTt2yPGvkdSKyZb1NK4v/30Tns8FcIlZcvETS
         z58d7RM0Ngf75B0fbuyBgxdqRfiQBpedcInoQec5Tdf3RKTPNG8l2W+gyFlqYLDL58Cf
         NYzl2whqZ/3N9p0CiryziNlowCsbeYszmsVxHUSiMX58L1x9+nQaAmM9afzfHmCJvhyK
         aWOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777436241; x=1778041041; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+wgx278PuWohl1935Byl8WX7gkc8WHJmkUS4pGdFI4=;
        b=dvDACpimEfz+lkjDu+p4DjT+fvQBqaJ38nt13vAj6O5Zjc3j5SRV7RVEUyAsHY5zDy
         k7SDY3R2RpdAJvuxg2G9SneYMEVqCzmGkqLfRFIYzTR0vB68T5h0PdGzttJYBLPSjwwp
         zysiSnFZUrxLZPQ4xUk/g5MimDPy32mTPkyA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777436241; x=1778041041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S+wgx278PuWohl1935Byl8WX7gkc8WHJmkUS4pGdFI4=;
        b=PjL0+xtGIzE3XzRCH1J4Xn3kYgWAG3whIxn/rvW1414OGkaJGqtgo2zdYwW6a7sESU
         AUGNUDM7E6gZF1V4KK1wpshOg7J3OWvWRhCdHqq4UPaKbN6KQM8rhyuyNWZYl/jOMy3v
         GatZY9ygmOq6Gxpy7BOTI11Yfe57cWlwNu/UVQQpoeR/p7BzxjEQjmYIU4s9e45scmBB
         S/NxFyM7yRsHQkXRM66Ecw80TipvZJBZyiW+Dwvl0ZOY1xR9KGVvrmPfCGz4oBj6079l
         e0jTKqurEBujdhqSoswZtcSvkFu0kczZFQeyKPFp+PsR+wDQ/PDbWgVPSJ+ITp0VU5Lb
         NF0Q==
X-Forwarded-Encrypted: i=1; AFNElJ/gkM93xFFJAmtpd11ktIG43ZVMSPmKs2T8jJ7L4RwrwQIH/mL8UW8g2QEqieXeDY7wk6GF3JjSIYh3@vger.kernel.org
X-Gm-Message-State: AOJu0Yymo6nSiAdXmlJituHre5qMJS7oBK/AkFKdaks67Ufme46l+E+g
	QuPB1RAKhOVNAUWpBRWlniZHFXPg5+oyfkmaJ+pW70J5YU2Dyd8LM9kmVnjxV6VwmeeanEBUH70
	NmJNFJPIsYIzHdXIcN/msftm5M3jU6aintxRZAM65
X-Gm-Gg: AeBDiev/cwWR1v923/sh2qbd+neIIAwThWkNWMrJ8dUHQidUDYg+z7Mjocj4vFpR07y
	KvA2Yu2Ggc1X4nQl5FxsHf6PZpP2Ky9x3/TeXT9YWUce7QgUy/SrJEGpelxgfWADu2siKfiCOm9
	aOgk2RCCTRgtKUKxON4X0gGoiFfjPozyYZxJW9wWVntCSLeOcGafT4flpAV7REULEFY3CC3BPHm
	Gv4S0CCYP6qcrOv9HUJxASEQgeZy7k73AaDBN4R53xTRto8QPkMfzBosgU0HMPCNu9f2p15+si/
	Ctux1ScAHxLuwazuDQ==
X-Received: by 2002:a05:6512:3983:b0:5a2:836a:ca47 with SMTP id
 2adb3069b0e04-5a746623733mr2096698e87.20.1777436240634; Tue, 28 Apr 2026
 21:17:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-6-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-6-briannorris@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 29 Apr 2026 13:17:09 +0900
X-Gm-Features: AVHnY4JUF2jGqzImUjvVT0R20VSVC4ANB99NMBVznnvWckelDQ9DcqAgZCUM5q8
Message-ID: <CAGXv+5FZ0kTqrqWEu8AX_1cxtEQD0urr=FJO=Van20h75_Z1Xw@mail.gmail.com>
Subject: Re: [PATCH 5/7] arm64: dts: mediatek: Add #{address,size}-cells to
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

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
