Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFAA3CF031
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 08:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774339806; cv=none; b=mkrFZnzhIRv2len/laOGSeR5qQPYwWm9JCtzo4YJ0736ZWLyUqIR3madjyXphrhDZtjeFRUbxpj47K48imeGiDsKAgN2pdePLHVkIGxpz4otlaHcB29Tc8t85shFwJJIXW64hZNHjyBK0W4gcF1Zei2tit00ofva6YeXtYmwSTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774339806; c=relaxed/simple;
	bh=5veUeHN5MYsBgKYo51su9cxGnk+Tr4hhzuLpA/rvGlE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mQETIphlVRhCZLd3lsHMg50pfk8X8m6WyL4sxfHjy4dcWRyFdpqjiKkokmJOW7WT5OEnCp4IImp0vKeERClDwe7sq6uZP/EXhZHFFpiAVRyFr6z29OVgUrU8px3GtTK/VVVfNIhBGxZtSUMEiyWl003M+UwKb2dqR3s943E5xFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ONyydW/b; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ONyydW/b"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5673804da95so470387e0c.0
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 01:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774339798; x=1774944598; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TlnLPTqWgsSS9VoB3MdbPM19FkSZ+YMyn5gjx75jszc=;
        b=ONyydW/bKkEwP7IW6Ggw1LqHeshDI3QBfSvb5ClpNZYM99+qW/ySEMRUpH2GCKijFt
         g0sesfti/R1lqft8rslFjvq8TXReagl0ECT7FGBhfQ9DRUlMT/nXvhZ156q2cKKq4o/R
         tL67HlXiIdlY4iswoSbXBITPWmu6WUBvzWstM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774339798; x=1774944598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TlnLPTqWgsSS9VoB3MdbPM19FkSZ+YMyn5gjx75jszc=;
        b=LH1Lp7Q+olInIbOhCE5yYVkKSe1w0ud8Ap3KM6/jNhFOy/qnKDKiO1SFpiaP9/c6mz
         kWgmnL66pJc6sV+NT+yOGWzVczYQWE6nYgmIMFFZakZwZITTJWAL85lqZuRklCwzaJx+
         Ud5sXFXf2qv8Noj4VISUnl1lu8b2vkmR1oJRZetODpmRaQQ4iG/w02s36hhVdTZYt5vz
         /5+iSLHhpzZ6AnjyJiJ5YuU0bHICajqa7cGacSDxzVW2Ytxp00bBISfCU3vCVIBsuts4
         DFDRyXBLpUwLh+ndCfElMOj9A0NlyfvVp95X/0uOshl7JXi0R1YKbK1cs/ZfMyK1wQgb
         YdQA==
X-Forwarded-Encrypted: i=1; AJvYcCVVkLHbAn9HrB3R0VH1JJoJJ4kpoZOHFi7ob4EPXZbxi4oFy81SkDw/qtCnelaZf1fACLjnFXPFwFhF@vger.kernel.org
X-Gm-Message-State: AOJu0YwN79+LuOu296Z/7R8GVG06Jgww/VSV2z2xU9YxtkCXPpbjisqw
	cz5ypYYOHnygH1319C3Q81R9rWntCPQHn3vIxxolY9x+h5XNJ2O29k5JGkQ7kz2fWG410IEYPbw
	3aro=
X-Gm-Gg: ATEYQzzlLAorlIkcobbdFEmSISKSmWLGprQKjovOnmRXQlKIbZG92Oj+OUngvQyUUeP
	HEyxJnSeMV2yOX/ZY7w+UubgKKxUufEH2zq1xnaDvSC/Cp3935cWdLxQdDyGeSFufE7utW2l0DO
	LWYZm6Wm9TRR1IrnEyyV3XMLNIJkFASTYfQB7sgHxTso0Jxj8/qwEadNl5VCf0SSrQmKgvsaHzB
	nbzo1mA49BJMiDFa5VtsQbnxR40Rfg9rruAbL9+39I5PUPYubAWxPfOw1EY1YWIO83nQgdxnPkH
	qzQ2nelaUa2qzUKgR15pxnBAtEqWet8HdLax0ENEn+8k5tgg8o9f1LB8aTT7hiPi82uACgMADFw
	NhXqz6RDjZnDQDNzur/FYZPV5Gmq+cO+Lqy8b2BhG2FoK8XVIjl6iBlNYvnImbdLoM9rgia/vKX
	Zqx7hi+M1wgKSyvRGL89CcYUPh5K+VIEVCR4PI9OcelID6QuhzrTJK9639KpAzZp/xW4bm
X-Received: by 2002:a05:6122:e153:b0:56b:a6b4:5902 with SMTP id 71dfb90a1353d-56cde43a7bbmr7137078e0c.16.1774339797978;
        Tue, 24 Mar 2026 01:09:57 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95136de2dc3sm10983270241.10.2026.03.24.01.09.57
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 01:09:57 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-602903ad849so367436137.3
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 01:09:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXfavK+ZXIkBcFfqivZNhW/m9UVDxCJ5KelEfxvbIaVOdNrU0DBZ+OSOk5UMi4r8yqIKr/OZ6FjaZXy@vger.kernel.org
X-Received: by 2002:a05:6102:4b85:b0:602:95a8:c665 with SMTP id
 ada2fe7eead31-602aeabedbcmr5833303137.4.1774339796662; Tue, 24 Mar 2026
 01:09:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320084351.2461060-1-wenst@chromium.org> <20260320084351.2461060-14-wenst@chromium.org>
In-Reply-To: <20260320084351.2461060-14-wenst@chromium.org>
From: Fei Shao <fshao@chromium.org>
Date: Tue, 24 Mar 2026 16:09:20 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhBREre_kOTjzbfodCQMHqd_fX=im9PFayv-gFyQHhL4g@mail.gmail.com>
X-Gm-Features: AQROBzA8Z-8iiIqSqMrZecLtNyZ6Np86Mk_AZ4ugqrIbZNBYNSNcAaxSBrLyCNI
Message-ID: <CAC=S1nhBREre_kOTjzbfodCQMHqd_fX=im9PFayv-gFyQHhL4g@mail.gmail.com>
Subject: Re: [PATCH 13/13] arm64: dts: mediatek: mt8188-geralt: Add little
 core CPU power supplies
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026 at 4:44=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> The device tree for the MT8188 Geralt is missing power supplies for all
> the CPU cores. Power for the little cores is fed from the MT6359 PMIC.
> Power for the big cores is fed from an MT6319 PMIC on SPMI. The latter
> is currently not working in Linux.
>
> Add the power supplies for the little cores.
>
> Supplies for the big cores will be added once the issue with SPMI is
> resolved.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  .../boot/dts/mediatek/mt8188-geralt.dtsi      | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>

Reviewed-by: Fei Shao <fshao@chromium.org>
