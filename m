Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3743E3DAB
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 03:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784691442; cv=pass; b=jJ0G2mWTvyKyw4rt9k0H0WMRWFxuDkpERpn0Sd/xlWveX1/OACN6hQY15el99yxaW2qYDQku/N9kgvTm7g9lmDL7r/ACoDyG7cAqgWwgKLJ1oL5LYcMsgPtywbrk4WyLhCGvq/fbw78l8yQKFEjCbIJCDId6NvC0zPkzqZpfiNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784691442; c=relaxed/simple;
	bh=FKTf/d7nFmKcsSFUbAB3exdk2dVsrnMxmbCxkgyTBek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JDruoO5AQvWsvfEtrUGCPD3Ytr3uIS/S3GcYkUhPVvOLvbbc/uFQNE4yV1ZNaZjIU5OIDdKv5g6toqHBMeR4J0IxIX5V8U1MIekKYJ/1l+xLgsEh+Q+Lg/agCzhyqV1UM02uImgTUrYAucle7OPCCqjBiDdKT6XX+uEgDPJRTlw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=I+YBlPFe; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I+YBlPFe"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-81dfdbd86d1so79853737b3.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 20:37:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784691437; cv=none;
        d=google.com; s=arc-20260327;
        b=YAPQEA0U3jRzZ9QNu0GjlkK7DA+wHgT73bBU/p7MZNH1i5isZNbhL4QhpPciEHNOAm
         3+vaHtNX+6uQJK9SW5drIRRzY11bW/dBWBQMQHbHd6/lJ1razoL4ZpK79Csrc8m+L1rr
         Of2CSvclzwuqvVfRHzNTJSuHA163GHlqPdqA9LUZx6UoB7xeapeD81VIMisj8iVffyeB
         hfAGdH0kFYm21wo2GyCgf68gw2yEX4BuFsXyxvYmLQJGvMGdOF3FnOeU1vWbm0PW4QtK
         IRJweFLyFzCXsTTxAG2MlR7ViQWKFWBYGdvYOj7QPk5lFj9VFIuISFvZ0Kk5Eueh3DJS
         PsqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FKTf/d7nFmKcsSFUbAB3exdk2dVsrnMxmbCxkgyTBek=;
        fh=J/LcVmETeAZzVgRMIQDcFJ7k2sxZviWpz5uKLq8dI3Y=;
        b=Mh3PFGYTasiyAK7wEFaLi4zN74/nqej5j12ob7CcT1xaoVmTftzaqdYYkQNzJSzZg3
         g9fKt8IaAgZ+on8XN1DDgl9WmK58ukNaQgQO8+DvM2JWfTRDJMrGvdEYx65xpnrlmBg8
         vZfO/A7wkSUnimTwlA7YvFj9Xlgx2du2HVC0yokweWkAkcpVDunFvBCykMOGDuJcJI/X
         XVPhN2wsMLLA6f1F6dcTSc3APjsa0lfQjfYa6hIzqgkVfH1xoagjbdKQJI6V2iWetRHU
         x05BvsMwnZqqud+6WF+YyujlaJ7RrwSrVhWs9sJ2K3QyyDKnJBqHIyjXCXv4uqAx1wuM
         RnYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784691437; x=1785296237; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FKTf/d7nFmKcsSFUbAB3exdk2dVsrnMxmbCxkgyTBek=;
        b=I+YBlPFetDH0VadtA+QUTCMaFJyWpmjAB32wo/PnbkoJXgZj4u5Mt8uZEg6pXgCJA7
         KUE1RSSMBOn/vnYvL3vgQ+HZwqFgQpBgQuwFgICTKMGyifTB4fC4gwrywyjw0OBk08e4
         ZkVpS5feb4wraETvzbXGQCGjPIgCKkis24DMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784691437; x=1785296237;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FKTf/d7nFmKcsSFUbAB3exdk2dVsrnMxmbCxkgyTBek=;
        b=ovXGKrhfLTSm66fjjMcmG/euI0HBkUdNa2VwV+Ni3kR3IPHm0tfMMWz15j3D+DOsq8
         38jCme3zxPwdzhLlMLFz/lZ5CTnk9c0vuEfQDzPGBgbWII+3J6MoNo0B7Bvfkoc/nWX2
         Zm6BcaCIuPDVvBfJUd7SqieHj3Lveq44FZtkEvN1otcIrvZ+S4/7JN42rQtvlnU0O0y0
         bggQ7EPUsYSkD3FYSrAEFtdd6RCE3j8FRhRfZck8S6pwMYC5DC323VwahfUnjDLOJ87N
         aeF70dEYjMeX2lLHBVdkzfxuJAkTQVK1Bl00e2FiA9JHsGqXze3D+nOenTOwv18l0YCA
         ZgCw==
X-Forwarded-Encrypted: i=1; AHgh+RqT5STRQjRow79jiAGFHKTBD6yLUq9B9KJS+X50yBeKcVub72nidnIviHeKKGH4B8UySreCaA6CrWq3@vger.kernel.org
X-Gm-Message-State: AOJu0Yynm/hMQITJgy9j6sCUy76jX3GTz54bHHANjD4IL3M9M9kI4g9p
	dfslDijMcY4zN2YgzLnTkAKiCJn7xk5Evs18FnFAeMf7Y/waq6cv3FU/TaDnVbKaa9gP2wlDd2N
	N8xiI/BX0Q6gf4I2Q0t5zIAVtVU8IO6BUmHROrz9a
X-Gm-Gg: AR+sD13cGoJOEdc2iRQHeqQJ+ipP7zuswGzacNuM4ceBClpFa3cqKILnHyufxlAaYcF
	uZTAGzFW/17XZX2Pw3Cv5sje5I57C0C/RJlMWLHnmgWlftB3m4O26/MaSovr04PUrrrbeYyJJ3v
	tt8MK5hIgltKWPLJXhwSa06NgLLUnn5ZNOt9MkbJ/HTVtAXN/cdOmwJHt4FgXt8Fvs3Kmd4A5Wq
	kvAr27FU1jl6/B/8EFYUgeMO/cGFxeWkFNtUsDDdxC0b39EYF2oNxpc/68EmL7FEWafMxurAc9G
	jNzptataBgckH5A=
X-Received: by 2002:a05:690c:6c0d:b0:812:996f:176f with SMTP id
 00721157ae682-81ef22d3ea4mr70445607b3.11.1784691436993; Tue, 21 Jul 2026
 20:37:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721105230.101906-1-angelogioacchino.delregno@collabora.com> <20260721105230.101906-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260721105230.101906-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Jul 2026 11:37:05 +0800
X-Gm-Features: AUfX_my3u1BuHiEh3Upx2wok8eAOOGJ_r8yDp0XbplwggDqqh2JVTYtoDhYXOKI
Message-ID: <CAGXv+5GrPZCZ=jNRi1AtduyZoB8DF_FUZev2CXhu4WzGri6U3A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] thermal/drivers/mediatek/lvts_thermal: Make reset
 optional for MT8196
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: rafael@kernel.org, daniel.lezcano@kernel.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, matthias.bgg@gmail.com, laura.nao@collabora.com, 
	fshao@chromium.org, jiapeng.chong@linux.alibaba.com, frank-w@public-files.de, 
	bchihi@baylibre.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 6:52=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Depending on the SoC+Firmware combination, the LVTS hardware may be
> may be actively used by one or even multiple concurrent MCUs!
> In this case, resetting it may produce either a severe slowdown of
> the entire system, or even a thermal protection AP reset, as some
> MCU(s) may be reading a very high or very low temperature while the
> LVTS is being reset.
>
> On those, don't fail if no reset is found as that may be omitted on
> purpose, but still check if there's one, because some board(s) may
> be running on a different bootchain with reduced firmwares or using
> firmwares with reduced functionality.
>
> So, use devm_reset_control_get_optional_exclusive() instead, as the
> LVTS controller always had only one reset and retrieving that by
> index, specifically, always made little sense anyway.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
