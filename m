Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B38401A1D
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778674208; cv=pass; b=HL+ZH3DX0c0KfSOymVwrDtaXCZ/Rf56oQl8Mhkhu0v93D+8KYQy/pC4ror+lk5gq1USGlHgJYcb55eTAqPMLVJH/BdZhX87EAtr4lKGJpFGy5XNoBfkvAUe/G0V0alGbWcY0TP5xUbmkmci7RGj316cehtTA7GDlaU1fYW2gikA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778674208; c=relaxed/simple;
	bh=n0zVUgor7lvWPciDrZ5fzZFpulIyyAJJoNWui7A5iR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tLPwRBAsuyFxS8u/0DzCWSTeSAV4deW8lcwh52lb98bFPzCKTMLl6gACp6ZbEDgUfzeNOY5Aab8I93U97eRnMhU06kL51brI1Vsk8JbiMFy28fKbODuXiXYBkZhDLRC6L8NTREuLuiGIctlDDQj9NfNJjg7kyoOLpZKNMmcSKvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gCYB+wO0; arc=pass smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gCYB+wO0"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-95ce7b777ccso3753161241.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:10:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778674205; cv=none;
        d=google.com; s=arc-20240605;
        b=VhhOP9OiqvWJg/wS0wVzfm0z3tSGnwPCoCzVgfarlxfylwLv5DmTvGwVPUe4d2MQCz
         jpgd5XWCZe6p55zXHdZkGYbGe3QqVssbD+M1zBR2kHn3xu9fzDdjdSt5KCsJduKm4AAa
         jt4njxKnl7D/2ve9Idjq3KRIZ+CiACwQQaLGjDAdabB3UyDCR8RNo9wrSncj8eQ0yhRb
         9/PI3FBdHFNQLTfBM0nm7liOVbJ2cXkvLTCB3Pm5oQIFREVEZi/2ZgdsMJlzl5fZCSTy
         urkh/n6WWi2zOlqtfWQI5pQPty3jOgb8YOIyaCLVX5m1eUQlVYrPjHIhuADW2cSDOf2/
         zWnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QJuK7DvHMj1EAy7tj/RVkf9fqNfoJVTMmH7EDF5zYKY=;
        fh=4xrKATRS/9/ZKTLh5ieIQrwlLAk0VZHRACi80xcwdPA=;
        b=LdFyoCZi3vlCbkHNUi6FVgQNOZcb1t2P6MMlPsd5aXC0kpnrfcRu8ZT/LKRSjMLqG/
         +yido7GFuelTrdzeLenSmHz6Rk0Q7Jh8cZrvkjmEUsespbGR4xyT7dBt5+P9b9pDLZR9
         iPNhrpfKRLkFvxGtHeaKxIYCxbYxk3gGErmZdNmPRkfJPbwuRjrcwheC4qa2p3D9Ejix
         BSoqY+VWGjnyoWtz9VFuM6S6WAerf50SX76i2gp50vmgcljfFtrUI+fg8g1lpC25kLae
         R4mrNP5+vVNQ2QqqyTji6cKFMJ9D8zfCTtCaDX2GdB5DYgkb6A4UVZEHgxBcXW8Um2BP
         HU3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778674205; x=1779279005; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QJuK7DvHMj1EAy7tj/RVkf9fqNfoJVTMmH7EDF5zYKY=;
        b=gCYB+wO0Vjk0gM8TRvgCzUZgfJeRk/rcSWpNtrbYbOOl8CDACWO7ncXQBg+A5Z/i48
         TIQjQTLUb+drdyNoBtGHfSksYjpHg9ms7bL2kZWl8hbPaHgGrGnEf6+gmM/gG9t7ZCKq
         0DCyJ887g/t27B8dIBXKH38oZZIbJI0XerGKxfiDSEuUMz9f9hyeryryr9KvWviMP9ct
         hH0uarD51tGgLBVaTwnb32e3DKyTBlGehJaJMq8oCLLPelPkJ+za++8wxxTThxy8saac
         ct2eduaZwU8lVlbhpXphBZfDM8LaNPDzMG7X0eynmOrqKwq+zznKcFZedrmKQnAIXjqT
         Qdpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778674205; x=1779279005;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJuK7DvHMj1EAy7tj/RVkf9fqNfoJVTMmH7EDF5zYKY=;
        b=L8hbUoFnDYnSKRygx36sBcARQxTsGP/nTBssGH31FDH7C2Iy9k/vnWmYYAmeVuUeYU
         iHw1EVcjs5Ilqkloo7em7qysL3R/ei9XR8j2y0RQzOvQukLgsFGgnZEIV/n2uphgf4YJ
         aHZvTfgvjRGIJHyP1JTEV/6LyOtyCgDet95aYL8BKycJNaYx1011UPkufvCUWSNw51TS
         3n5eFtTjyVzNzDLXV0qc/uEtiSxy+LWJ7AnBu5EK02X5KgeeXmcYk7HPXd27UxRX3XRI
         fuapqN6fme8ShuINzZUZe30p4oHUhEO/7jdKF1CCHh1BK76Z5JaM39y7XsVt0e5apdry
         cd0Q==
X-Forwarded-Encrypted: i=1; AFNElJ9t2CwQpOAoIube+PXmpiI9tAMb2CIPb1VTaoK2u5t4SIeM8RHAhUKlNOkLSmXLS8NY50kts4xQYJGY@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb94Z073EASUiSwB56jZSZpL4FVfAG9TDpjrkgrZsx1n8p43k0
	OlQH6mgGP/QkruKnmkitJwfoHkrTjIp4p5l/UDzJu/WnFVkVQ7kDsvFNKGzIHyBSPthpBMfmksR
	LhCUfoXAGoeuXACY6IxrKHZ1SFZBdslM=
X-Gm-Gg: Acq92OE7wqzurEGNifZywFiQlcPecWzB8izMwZiphoZweX9CoNMd6w6VyWSaQgkGiam
	VnDqeEpjpjogJNLlhqlhcPhjA0+o4/9g0OuduUk8lCVQ93mcaSc5by6wDpyrOJathv5Vp5N8Nog
	9lu7ugEcCC6SSvTsXFPCkaXa82ymdKhp20eHGtTEh/P3BJdYn6IKpRdw/fWeAyxRQuDeX6HlbKT
	4lcDObqpVFiQ2FPRC2KtvlZBWeaoccGqYiKN+ugXFIsc4IPjVVB489BVihh/EGk+3mkS7R2jn4H
	a4l3AIQ7
X-Received: by 2002:a05:6102:38c7:b0:631:d445:171f with SMTP id
 ada2fe7eead31-6376463539amr1094442137.15.1778674204715; Wed, 13 May 2026
 05:10:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260314-panel-patches-v4-0-1ecbb2c0c3c8@gmail.com> <177818605997.73000.9692910497119100760.b4-ty@kernel.org>
In-Reply-To: <177818605997.73000.9692910497119100760.b4-ty@kernel.org>
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Wed, 13 May 2026 15:09:53 +0300
X-Gm-Features: AVHnY4LglPfFc_nbVIjyAIVKXzzO_CSHQSJk1Zv3noSm1yMcp9X7Hz7jaJLq39s
Message-ID: <CAHuF_Zr0Z+rP72fLts5Ar56XyY8VMROzE0wQ_S5iyO+A4YoMSw@mail.gmail.com>
Subject: Re: (subset) [PATCH v4 0/3] Add support for the Samsung S6E8FCO DSI
 and M1906F9 display panel
To: Bjorn Andersson <andersson@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?S2FtaWwgR2/FgmRh?= <kamil.golda@protonmail.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Kaustabh Chakraborty <kauschluss@disroot.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 May 2026 at 23:35, Bjorn Andersson <andersson@kernel.org> wrote:
>
>
> On Sat, 14 Mar 2026 23:46:20 +0200, Yedaya Katsman wrote:
> > This adds a driver to support the Samsung S6E8FCO DSI controller with the
> > M1906F9 display panel found in Xiaomi Mi A3 (xiaomi-laurel). The driver is
> > generated using linux-mdss-dsi-panel-driver-generator[0].
> >
> > The mdss reset dependency makes the screen work more reliably.
> >
> > [0]: https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
> > Original tree with patches: https://gitlab.postmarketos.org/SzczurekYT/linux/-/tree/laurel
> >
> > [...]
>
> Applied, thanks!
>
> [3/3] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Enable MDSS and add panel
>       commit: 493cb869874cd301c370adf9a3f9577942c4f0f1

Thanks for applying, but notice that this is an old version, the last
version is v7:
https://lore.kernel.org/all/20260320-panel-patches-v7-3-3eaefc4b3878@gmail.com/
The compatible string was fixed in v5, and other patches in the series
were applied with the new version.

The difference is in the compatible, 's6e8fc0' with a zero instead of an O.

> Best regards,
> --
> Bjorn Andersson <andersson@kernel.org>
