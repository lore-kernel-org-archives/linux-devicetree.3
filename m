Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D2E37CD53
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 19:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786993886; cv=pass; b=mbHeilLWVs6PTCukItXkZH4s3HFXSbEtVb8ungIBJoydEwzwU07p4rbih7nAfUISnNcqPclQBAaZyxu8e+1IAW898TkLVN0Y9MmkVV77mryZncgVKCXSObpiYOPMEAfI1nT+ORg8gcVg4fd/leJBgTjdbkdwMS63Qg6gch8Iwzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786993886; c=relaxed/simple;
	bh=uTnougUIG5rsOStz0iODpKJHP4inO0xB8c6yl6xAlyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HibsnwrX9jiu/9oX04f259aTkGXMlSsCBSkSibVSOaDQ8xaXYYuSd59HriS2H5Y7odQOAxO+yU3ynQcaCPFvbwUDZu5vALNX4YccER6H3NXGg+jgGFRoSW1G9S8SOrqht0Vv1QKzla1JanMzIxPKnHsjWXBYY1zwPg8DzZsXQw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jHxne63W; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jHxne63W"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aeb8c19017so4946568e87.0
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 12:11:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786993883; cv=none;
        d=google.com; s=arc-20260327;
        b=GMm4uWQtarKtlSa9x2v7eTBkAXppRxYHZseBkZmXl7cf4mDuDq0C7WuSyGoffZX6hN
         hNxA+Unmg3CCn0CKjafltohFq5LZudSyenBpWc7gGy5iDjkMEiTTEGcBListJLAkTM6p
         0eEP0pOPk/vfjRHUGJtRIuWx7NwQvICRRJ7MmvQgQNtLb4uX/xl+nOm74+uF1s3qdFiB
         /o5J4pO7/Xaq0vMYSATjORpC82COTsoR7s46Ud0TxkIYJLgUtEXyNxFMuopkvTc0Q1w3
         Dz89lbF9zC5pkC4Xu83MqzoMTJA1N7b5fpNzoS0vIjiGs2hGu8GxjzZVwqFceQz8caB7
         ru8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o9Xq57ZK871Bs82fmpBhlH3gJ0wVVRq6jr0byiqzgis=;
        fh=lsgdZd9NNSkBsqPELCrpXYPqjFn5tJ0yW0eAK3d9+K0=;
        b=BLdwVkNeOH0bvpTk2oU0bmTM7bvpEAQtGU8y8T9LChAmbcIPoa3irGDmIlg/eQbr6e
         eoneVuyBQvDDU3ta9gU3PZHLhp7q0ZzTEd3TFyNqtQ98Eoh59/NVLYEXT/a7Cll2/nYA
         UqDbSymybebv2IwWLM4ZSguvgSEFlVz2OESOY7dZd3LSZp4w1msEdPqOL6cVFiH2aftU
         bx0OetA12VUZX/Y9Vrbt44Tu3nIoTno/Bzvg4rovjWq3ZNAozVuLtFqW7mMC52Lv4rAJ
         UIDHRz/M8zTZGhBjKMC1VgraIMEFG418sfL5HjpSoxeVDEfxejZRwnkI8U7Gw9zaj0pi
         FeFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786993883; x=1787598683; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o9Xq57ZK871Bs82fmpBhlH3gJ0wVVRq6jr0byiqzgis=;
        b=jHxne63W0n5Vz5scXxk67+eE/3f3mxoUPN/Kndvck5aKDlgma6uUbWOuMkyH7zdzUL
         GvNL6E7kVhx2gi1RnwbPevdGEvNwrxLwJz+XzBf/swzlCGy0yvpsKUgGiMj0FpM2qPPl
         C0grekBaUPzI0ESDFIm9ZGk4Yo3j3sy/7DHrtL0kr0kgdp4QU1+nmQ+rOkyYmDA+hxXB
         rQHGKbn02EggaRDrTsXr9RRI1rL7lhKvXVf4F2yscXU8HkTVrw2tiTVY4nBdUOycz08Q
         NOzaN+w3flboeNbTvBZfltZi53jdTFWSFI4T41I/TlXAcjAjJlUl+vNiosBdntoBIXow
         Wp8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786993883; x=1787598683;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o9Xq57ZK871Bs82fmpBhlH3gJ0wVVRq6jr0byiqzgis=;
        b=TloX+aGxl8USCmv/7IHz+iKlC19vjG6hA4oEBYWPDtVhUmIdDCqA3lOSpYFB+cQUBk
         tnigEY6aGGBWQ3wpeLUlOUPTnODD+/ng1Qq6nrbBaX18R6h53znwyjZrdRY2azlkjRuD
         YEwo6uxna0lnLicsdwXfzYf0rldKsd7fGGlmyYryVdAWOT0bzFGxQV/T1ScT95DvWXL4
         zBX2xD+nLVZ++OmfDH5uE2Uumxvd9iJ+nHJFH1wAqINQ/qtker50qsFuVzfYfl9lAB64
         GlFlWzcmCAEuoOTpbKNyavPwZ2YL7EVTNLKAvRPznU2tZKy3dnO7d6ysBXGoiXx9D9zx
         Bl4Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqqer/2Z5lnfvGgrGcIMGQ3BQ0b+u/ufgMU0XRRNz7UKCgsQZGmA8Z6l/BhjAt6nWTpVTenTidKkDyr@vger.kernel.org
X-Gm-Message-State: AOJu0YzH610yrdTZdNXLvxCbYMerdPbp8rEBn9Rr1844WMA0b/rQr+uK
	b/FJda7v8R1MEe6yjDhsGYss00oJFjyTobQzn2P7kwazf9mSEfYsXtybzRxWzRRXwzQx0Q3dWln
	4UM9f6y6oGZycJT4SWKEMDMvHxqmJjvo=
X-Gm-Gg: AR+sD12nuRz8vpGbfas0bz3N45tBxYx1fatkbwCxjN2B9Gw7kb3pHE035/EO9XOgxhy
	wWgSxovzdg/0okDqLNy47j++0hy1VckXIRws3YeVMuAorAEAT3BfHXoqZLBvkRF7Hd924/k7Fqh
	ubekiKUWi7R22shcJuUly3EuExj+D2/z1/rDUQWEx9yG4WgA8heJrMfwvoE/QZOEsGTN+or5b3w
	h88xmaoOZe/GL+NR9pUE2++HaG1YntsMt+6fJAu2StS5WW75WJ5E91jIClAGbaVRnGjY2CAmA/s
	xEe8qsGRZ4zVAmuntEQvtNUYS3V1DxCKN0YYeaQVKx8uDAJ4/wTCMAi/XBeYImCUBx3917a5lum
	2qUg4ZpWwfMBZFVGatBM2y7iVq0oQTA==
X-Received: by 2002:a05:6512:2382:b0:5b1:4e5e:559c with SMTP id
 2adb3069b0e04-5b47069e8a9mr442389e87.30.1786993882910; Mon, 17 Aug 2026
 12:11:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525-tegra194-qspi-iommu-v2-0-a11c53f804b2@gmail.com> <20260525-tegra194-qspi-iommu-v2-2-a11c53f804b2@gmail.com>
In-Reply-To: <20260525-tegra194-qspi-iommu-v2-2-a11c53f804b2@gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 17 Aug 2026 14:11:11 -0500
X-Gm-Features: AcwNN1VtAz3TzQxDcDRv29ZIlK7LcvZGlrKziZlK_QH60cI6-b_6Gt0v_fcOAnw
Message-ID: <CALHNRZ8F85rJZ4+v+B_jsETeG9cUJWeWSe9vw77AVHcRMasw=Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: tegra: Enable DMA Support on Tegra194 QSPI
To: webgeek1234@gmail.com
Cc: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, 
	Mark Brown <broonie@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-tegra@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 1:47=E2=80=AFAM Aaron Kling via B4 Relay
<devnull+webgeek1234.gmail.com@kernel.org> wrote:
>
> From: Aaron Kling <webgeek1234@gmail.com>
>
> Without dma enabled pio mode is used and flash storage such as the one
> on the p3668 module times out and cannot complete any transfers. In some
> cases, these timeouts cause hangs and cbb faults.
>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/d=
ts/nvidia/tegra194.dtsi
> index 1d659454a6f9fe..e2ddbc6715d5e8 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> @@ -923,6 +923,8 @@ spi@3270000 {
>                                  <&bpmp TEGRA194_CLK_QSPI0_PM>;
>                         clock-names =3D "qspi", "qspi_out";
>                         resets =3D <&bpmp TEGRA194_RESET_QSPI0>;
> +                       dmas =3D <&gpcdma 5>, <&gpcdma 5>;
> +                       dma-names =3D "rx", "tx";
>                         status =3D "disabled";
>                 };
>
> @@ -1013,6 +1015,8 @@ spi@3300000 {
>                                  <&bpmp TEGRA194_CLK_QSPI1_PM>;
>                         clock-names =3D "qspi", "qspi_out";
>                         resets =3D <&bpmp TEGRA194_RESET_QSPI1>;
> +                       dmas =3D <&gpcdma 6>, <&gpcdma 6>;
> +                       dma-names =3D "rx", "tx";
>                         status =3D "disabled";
>                 };
>
>
> --
> 2.53.0
>
>

Thierry,

The driver change was picked up some time ago and is part of 7.2. Can
this be picked up for 7.3?

Aaron
