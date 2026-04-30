Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8814E34AAEB
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 00:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777593663; cv=none; b=kji66XLI01hZRkpsPC8G3zjXwsiitLSjHCFmxkjaLlquBdXkzhc09jupX6ul3/cP5kR4NZg1ahCqVhf+lROGKOy/XhdTNn5Z6jL4gp++VmoCIz4qw/NSoGhwH9MwzcUKmA4CcHJ9d5g+RhBrkBQMI5h0e6UMH++ZkliWv/JaJRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777593663; c=relaxed/simple;
	bh=1iYFrQZWmKEVWrScCekgHrk90TTezLU+zo9EhcJOGkk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=le/mzmFV5A6szYrW+4jIn2NfzdjoXlQHzdnfzgpR5FLqXYMPmiLS+/65wdgWSKnLfzTlZHUKqg+xhlPLSvVoZzVGQtCPR17Qw23TmSinfxKaFNwVPmp2LgKpnpuO0iP8ev4xbmuUhtekzry7dtgwXoqYSxcJ2sjy2vdkTXmynRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FalEIf5n; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FalEIf5n"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-67b8d9c26bbso639647a12.2
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 17:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777593656; x=1778198456; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+mZxHBvv1WgYnS9amllda9wyu/ABf+laADAiAQpVXA=;
        b=FalEIf5ngt0zAY+IZnv5+967HhUFM2oUYJTOUDU5HizdeIDtLzbS1TsTeNTRSm9X6f
         PjLiQiaeL3rzwn7Pal7vQmwZoI0JHS4hw515lnVpyvv5Bt75mv49Nls6FktsPboqzJcg
         j/YOlfK6i1f5aamaDhAzjO7dogl5JMLeWZPDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777593656; x=1778198456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6+mZxHBvv1WgYnS9amllda9wyu/ABf+laADAiAQpVXA=;
        b=b9/aN+KFiH8hPt2S/tUKsLUJ+Yxfb6L3k13mbONVdcbL+Y9d0ySMBhOtrDw/iun9IL
         ucGFSogxdCmBoYhbRovLQxy/oHCgjxXSlaIhx6f5Ui0D+ue4wyMsmBk8R/6A1AI3TWzM
         7v9i1o+OZ2AvyYC8MTFaGr38Zogy2ejzZOwxoIEjDYmp7CfxrzWIVT/HriEwn4Q6zAOJ
         1VihcLd7aX1a1Fh7wEL1pJk1iucUpXzCQ2yqFWllv2EZcmNlrBkf9yYCuFo/7FGHURLl
         9SQb64MpGhxNxNgEV3wrNXZ+6npS0pEWVX+3q7z/A030EiMDr1Gr6279K7b7jr/elguX
         ZbLQ==
X-Forwarded-Encrypted: i=1; AFNElJ+qfgGLVkSldNUYupkNjxPtO7NrawTGkXUonVbDNN9ujEaI2w/4swO0M+ktC4yHsas785BZdwaEMiVJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzU/dPBjzrOGrBWkN1KSKbdbNAaAzYiEbhs+60vSaAZivAD9aoL
	BjMMM8YpoDq/qI5gKJ36nnIEpKUWKW1utmUt5/RER+tAboFufKwW0Ge2WFbkc9xKSQH2JdiZ1nb
	/b0mtudrm
X-Gm-Gg: AeBDievP5HRJEGmZzZgWAypucnXy7HslrgKMgaBrwsMMR0P2KL7nHivRSDbgDAFV8A4
	uB0baAfbnVnil5JnGtJTN+p3N+vt1P1XfZJ3bwHZI2cn8zPZ9/o32fnojbaJWKdxTgzCl4jU3m/
	z+sOvHLTp6OShZfus46SvrxkskwDnvY5BEv9pQQg2ECMkem2IgazlfjSMIUrpmP/sTy0buoj/r1
	VKvpxLMZWlZ7I7frybRIC1+zbl/aTFspxfYKFr7iHqXc2+6FeGMgj8e1Cz/1sIUZ4SDBEejk+SV
	XXYezoYDrmaX7BsekqXjQoti8pmlJVmi4N4ippiWIPe39Iz8zQ46zr7fzKr2hRopN/aj6g+S2zU
	NjMwwn+I9t4thjaQJ7TGDoO95hb+LlLpMseCSUxeok2omH082xQJ2plXz33hwAm7cVPydf2DsTn
	cVWvvNx2L83wDHnyPTf9DWozB8Wr3TkJpqcZecd/6DFav6i4vHAGn0iXLYT/uw6LJAFozE5nbZ
X-Received: by 2002:a05:6402:324e:b0:673:b696:8830 with SMTP id 4fb4d7f45d1cf-67b5d82279cmr1955352a12.16.1777593656376;
        Thu, 30 Apr 2026 17:00:56 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b877d5a64sm394817a12.15.2026.04.30.17.00.55
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 17:00:56 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so259048566b.2
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 17:00:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/D69bM5WnoWqvufywhfOjArYi09TZyw67aOxHuWLapkyCFH90pKubPcjV+SoYMylV1QRyylrgM6hy/@vger.kernel.org
X-Received: by 2002:a05:600c:8483:b0:487:2671:fb8f with SMTP id
 5b1f17b1804b1-48a83d73324mr83882365e9.8.1777593300707; Thu, 30 Apr 2026
 16:55:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-7-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-7-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2026 16:54:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Whp6JADcVOZ11Jr=5THGrCe9cWZhX0ye54wQ84GtUOwg@mail.gmail.com>
X-Gm-Features: AVHnY4Jn8yjvVDQMrk9sfxS2s1IXmKHM3MKByZAYOfzP-smNW0WjILYj0XY4G5A
Message-ID: <CAD=FV=Whp6JADcVOZ11Jr=5THGrCe9cWZhX0ye54wQ84GtUOwg@mail.gmail.com>
Subject: Re: [PATCH 6/7] arm64: dts: nvidia: Add #{address,size}-cells to
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
>  arch/arm64/boot/dts/nvidia/tegra132-norrin.dts | 5 +++++
>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts  | 5 +++++
>  2 files changed, 10 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
