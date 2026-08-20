Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D93D43B6F0
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 11:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787226446; cv=pass; b=onC6GuGNOq1MDqqHWVzv2aw7bnUxH3Ir5iw5oimtYnh9KnVdZyL2fbSAMxr24DrKGI7Fxo+lr2k+g9q+kTB7V6i464ywuBfrK71cN67EtGc+9K+nDyYnjWufm9AWpq+Js76A8Amt6f06juOoiCQT7nSk50ZueO5JY12cr1QxuYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787226446; c=relaxed/simple;
	bh=tYrk9OYg6hzo8toMmW3s71eJpYFDZEFwW4Kkciy6p98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q0kyuuB7h0qjh2czcdLYkwDAw3AckF223qKDzFQO3zjmF873SpDYPSgz97XHHIfHc3aTOTL2VhxA127H/98Mm9V3D6AZEu7zolZ4y+HMuzWfyTS0YAWC6sQU5zZKBeAAQdFAOjIoNHx/PHUlbb+aVL58nvUkAs4YMoy4zp5h0pM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nXw20yO7; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nXw20yO7"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c167aa9500dso303943066b.3
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 04:47:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787226441; cv=none;
        d=google.com; s=arc-20260327;
        b=Vn4aATslxxavzacM3DniQHJtIYFSJKFJXLhUc/WiOaHhBozghabEquqb2ByxEzuzuw
         3n4keMfLmzrCe6r8uBtzn1/rXfyflCEZoEyxGFL11LCRR0m5z2BtfvUDtwsb2MYbgBbO
         dg2SATNGqrvJhBIoTEZ4wsW/H4JXg2mg1gnv+XEPVYjfhxofYeZ+lJV/RZ+zqzvhpVmZ
         cBthgx74GYBzs3J/ZRq3yMotHnGBNMlI55FsASKyeaOkpXAzYLLT0OZTtaUTtPRMz3pt
         x6upB5ixJa67WEN+u5jFGC8lTUThfFgEJQT+4pNYBORTxKdoJjjpMHPs1Qi5oOgd11rl
         niTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bXKBm3AfG3en1bXUPpD4OIjt8IDcThCjJyOOTe6eAbU=;
        fh=sU2aF06eRPmH+Y/dpG2cr0XwxWqEMboedtoMef9VeOY=;
        b=dVDP+HcKA3ipKjcTiq6hN0BL/udnOPuyEARjj9nfD1CmhO1qc55baAH94kDzo4z1tV
         ojdNCsHGh3YJAaubg0fC49/wdBmt9IVcW1xR9tc/YItw1SjNC9QCNX400emQ5YU7kM7J
         5hUCo66vyd4de9hIJpQ5rEyc774iQYZCiOOEEpek0zPa5pkFjIRBJ7U7HO/r7iqinEn8
         n/uLUuihMXhbzvicPqGIkOOQfRRwMM1xR/gjkEA5YNOFZYh766YkuPj2Hs4DnkeNW3Bt
         Mem50GASBULmGx9D5OaXVoFtjpr19zA9hN6Kyc7fPXaOmM90CaCa/chtrV2Rf2j4yjuC
         E7Bg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787226441; x=1787831241; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bXKBm3AfG3en1bXUPpD4OIjt8IDcThCjJyOOTe6eAbU=;
        b=nXw20yO7PXq+Py7mUE4yQAVFpypyJAM/xoO5ohK/kDt6VrCqsYHTFBsVVkYDm7ao76
         3ecraqYgDHxXw2jTz9DDSxdj8cTafzpQTsejKA+vomeSR0rW0+qdYPRcPfZsvXvZYJfA
         cYyJsYz5xDpvhZ+9oiR6nXmwdJkmuewDFSJdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787226441; x=1787831241;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bXKBm3AfG3en1bXUPpD4OIjt8IDcThCjJyOOTe6eAbU=;
        b=aJ3YZkqbVbhGHX0k/UPhSdx6WFWT8zvURFq23a3Aw3xzSspNPR1C7srruG6nlTR7G0
         imyncswPoaCWUpyw2ZbMkgX6CnKMC/SI+Ef3Le8heF1YRIV90XjJEnAjzoccjb0WiCQg
         mccT4CXZBqzoPDfzHX3KkVF1onzkyzzvOO8bmPyttn/q9p+Q5Nk9kFRmLCOslVtAkC0j
         B136e3g8jCbr5HMPVZIG96Iad4UenuW37qeQ9Hpx2wu9WTN9CaHyECUKkJ1EtptGHRRb
         VrkLoN3hzWOEzqtkg6F0rn0Q2m7tcRBG2TU6gIhiG9BwVmG6yOiodJ50IVuplEJEvYS/
         ZAEw==
X-Forwarded-Encrypted: i=1; AHgh+RqGVh6KarcRyEGpfBN3TtPxYTuZxZHoZxKWyfZBP7NZL1A4N/sLKFaAZ0zC2TctDaPmgYnudyfJ2O2O@vger.kernel.org
X-Gm-Message-State: AOJu0YzSJrlVw7ufdL5z2hWUU5MMGioT+vALjEKxy6z7JPXtVTAaB7ZJ
	FB66710Aiq+vmCHX0/EM2JItoPZSYOBoxxdcMGXe7wcd/zcKYiDqvRl0P34gHbnaaKKZn+VN75L
	DRNAh5Em5FBzGbzzWGFA3JKcLDGQu/KcG+ILGf1Ko
X-Gm-Gg: AR+sD12keiEyKWMEtqQ/dsPBrssIDbDucYrRc2iXLeQTvYtDqQmAJBIrzcAm22QftwU
	tB6fnFsRq89nt4vNBuhbuRUJRI+DM2v7+UmD0yEo2+GXJ0trdPbUY2bOh8Zd6rYOYWygADmDTph
	5tZfdQ9QyfUrmlwePEAMg8mw+88z2bQtezhyDAe9QwBbn0KXp+tyvwNZyoMH1jeztdmsXBLGv5v
	nYxpflBMKnBIW/MEp+RbB6/F1wk+XJFV4Twuk/KNL8620SzLUlTwE/DY/E+mSSnkqOzF/R3ydzP
	pHO59ll66hxbR46i75e2Q423SripMP1LyX19PAl0H0U=
X-Received: by 2002:a17:906:99cd:b0:c21:74ed:4608 with SMTP id
 a640c23a62f3a-c23f9750de3mr814724566b.10.1787226441540; Thu, 20 Aug 2026
 04:47:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810121121.210040-1-vlad@zlab.su> <20260810121121.210040-24-vlad@zlab.su>
In-Reply-To: <20260810121121.210040-24-vlad@zlab.su>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 20 Aug 2026 05:47:09 -0600
X-Gm-Features: AcwNN1UCnC12nuoA1x1viqpRcNtcnZpIWhvuLlHFbx5J3DwZqfYkTadrWwnjlvQ
Message-ID: <CAFLszTiExzcYKBpe5h2SorR5OJEJgRx9x1bSCdwTtw4mN0Fcfw@mail.gmail.com>
Subject: Re: [PATCH 23/25] ARM: dts: rockchip: add arm,cpu-registers-not-fw-configured
 to RV1106 timer node
To: Vladislav Leonov <vlad@zlab.su>
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Vladislav,

On Mon, 10 Aug 2026 at 06:16, Vladislav Leonov <vlad@zlab.su> wrote:
>
> The firmware on RV1106 does not initialize CNTVOFF, so the virtual
> counter may have a bogus offset relative to the physical one.
>
> Add the arm,cpu-registers-not-fw-configured property to the arch timer
> node so the kernel does not trust firmware-configured timer registers
> and uses the physical timer instead of the virtual one.
>
> Signed-off-by: Vladislav Leonov <vlad@zlab.su>
> ---
>
>  arch/arm/boot/dts/rockchip/rv1106.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/rockchip/rv1106.dtsi b/arch/arm/boot/dts/rockchip/rv1106.dtsi
> index b31cdb1c19d4..12e87d25c72b 100644
> --- a/arch/arm/boot/dts/rockchip/rv1106.dtsi
> +++ b/arch/arm/boot/dts/rockchip/rv1106.dtsi
> @@ -57,6 +57,7 @@ timer {
>                 clock-frequency = <24000000>;
>                 interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_HIGH)>,
>                              <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_HIGH)>;
> +               arm,cpu-registers-not-fw-configured;
>         };
>
>         xin24m: oscillator {
> --
> 2.47.3
>

I know I am using different hardware from you, but in case it is
useful, I just wanted to mention that my boot log says "cp15 timer
running at 24.00MHz (sec-phys)" both with and without this patch, and
userspace time seems unchanged either way. I am using a board powered
by USB and that power is removed on each boot.

I do have a Luckfox Pico Pi now and I will make time soon to add it to
my lab (lab.deinde.dev).

Regards,
Simon
