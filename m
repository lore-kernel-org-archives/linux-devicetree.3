Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602291;
	b=h8znkFOHmTgMjzXe4Db6Ct91Phx7rJ4x/QNMQ0n+W+zfD5LkukEASM4IQAs0GwFRb41q
	 lM3vz91O4kmNUiUM1xUTH1lCyRef/9UC7lW4orzCcJIOjYN7DQ+YTVAIQgE/XSPijYBEx
	 euYpuVBxWH9lQULIVAMy3kAlLM+8cqbOAy0u+2sFxz1Re7WSbqvhNYa8atrcUj7io/83C
	 9szHOOeqjVGh5AKRDwH98ini8ZYh+32diLouxwTSSO4U1TJiWMklpO3rPaOsPeB3Sz2o4
	 JS6qZwUUNRqcty+IRnd6OOR7eltko4ylyb7NsoK/z6djHmKOGmIFgLidxTKwG4NeGug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=cQWS3D95HYvPb7PWVOlG0meKch2x/9ofLSM7aTh6608=;
	b=JeB3eqz0WT2JNXvY/W4PQV56fsZGKtfVAtXYMAMyzkuLJ6e28q6s6FDldsb9hDFLCZG6
	 w4KZZo9X+GME5r8Bi9xLXtQmK1comLm5PxCc4l74q3KW3AcJmcGcepYQEQXZI14mCXSQ7
	 P5xPmvgVKFZDvEBpmngkLs5nd5MBWLqlS7Bd05pbdo1wSFWGqZ8o4i1cNSY5c/bHv5MfY
	 akbeNaDtKN4y0YWG/H7FNuviwEzaLPlkwsgzXMAjQ4uxsXIdaaoRSjjc1L3c3ZUZZl4Y+
	 Hvay6jDKT6Uy22MhoKaa9yynASG4BVewgNUxVf42gNZueNhiVENvnlSOwLADK9+eiFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MybRHCY0;
	arc=none smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7348B606A889
	for <Devicetree@vger.kernel.org>; Fri, 13 Nov 2026 20:38:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7348B606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MybRHCY0
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c126fa1e3aso1511372e87.2
        for <Devicetree@vger.kernel.org>; Fri, 13 Nov 2026 12:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794602290; x=1795207090; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cQWS3D95HYvPb7PWVOlG0meKch2x/9ofLSM7aTh6608=;
        b=MybRHCY0KekTi3dMCfO7BY/FAKUsxAW/lcDjn7P9WPNvQkCyNZ158MP2TK5groFZIv
         c4rlCeSFzFFm8GJiB4kf7N+Mp8BPOeXh+cGqNpHZ9o4x0DqZwkqxwloavXq2HxofpDqY
         9TS73eDrPqkAv5799x6dATu7XokRVsZG6rhsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794602290; x=1795207090;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cQWS3D95HYvPb7PWVOlG0meKch2x/9ofLSM7aTh6608=;
        b=fQZlBWNPjZpb1JQPfiM2iCGb/6tmUJurOStNIEyLIzI3zRLZBxj9vcKGkL2HU/lDuM
         WLg+0XV3aSxNyofID9206GhzyP5nz+nWN5d4orgHQlyHXsGj8Q/UN1fBo7iFSJ5S2bpj
         DLF6yTFkFIdGPeq34NR2QXUkyzxmJVlTC44zDOmgkdidqNEhepQBgaeueUTPfQihmNuH
         +UXIg1nA9vP71jUc7PKB1Y7jbwmrG1Xv319aRncnDCNBPt+7xNXJXKRloMiU4DoN4x8U
         +g8B+NSTvEio1QocCOk6nAd4MIHw+wrXsPGsn0oa51JGXkRvdcEhzdA+jXe+cy3YILQE
         GiqA==
X-Forwarded-Encrypted: i=1; AL+hErFg8W/VhaiJy0g5Glp7WYjPvusAtxaQz7ui8WNjL2CHGhDG1K0ZFtuQ+TtAJHb+XVN/AMinz9vf/rf1@vger.kernel.org
X-Gm-Message-State: APuU4Z/I2Pnu1VW/gfSaFqFaV9+AJUFa129QKOpbtlyQGCeQqvv5apMN
	99oA08uWLcg3F1RSekhc0SNJPo8MHpxbhZwQBGsvvw8/Siv90qrxmZlM9D2L/kglYnjzRziZDt3
	w+QZ30vgU
X-Gm-Gg: AYBFou1LTrWM1MOv7xiaOWEXACvtRaO9dbPvJhBytDuaRapd8SVWvxd8NqwY3ipnQsE
	i0Fs85llHaApBoOzZm6lbQhbJhpwL6Wog2f1Qi+X5oqZt8+X0IjTUzP3P2IpLpNpbka8uMioajC
	wi6vJHfRvNpXEqR2F8ZG7XFd1PlUlerKammWL27CJFumZ1fP8KYptP/4I4bC/8M8X8TKGISRwb9
	+RJxdgU4iaMm07+3zJflQV2ljwq245K5+YoiAnGu0i48zM1B+oeXLNdh3IYgam15IbIb7BhKtWS
	rGflX/PeynKdLAjG7ElrKb9wCJsVaNGjhp6RSbTaGT/LY6bY3klEXwxRYpQe2jUp58dM8j26hFY
	oqnmF3sGEcJb3ghiVA3zfpx+ogeO4OQvXlVTC7sWA0mLmZTFbn+OOpYspzcdNqlRL30xTPBxWS8
	UQ0gTeuMuxTTWrIgfJGEH2GK4w4MYmbs5QZj73rTOlDOLssYBGKfa7IyyX94tFxxuPIq5xMxoMi
	9DLYhohvKUB/1pbY0GOLwdf9O7WO8DoP52hp0fcQiZP7cT5F7xFiFNOYdUIIN+nnmsfje0A1CQj
	jhLE4Rbu9kkNM4GRf2YU1ehyBgVIkzDLcAH7QI4VrHL64ocPAcs8t+ahwGbSG6ovQNLF
X-Received: by 2002:a05:6512:2348:b0:5c1:5a3f:9513 with SMTP id 2adb3069b0e04-5c1707af796mr1486012e87.39.1794602289690;
        Fri, 13 Nov 2026 12:38:09 -0800 (PST)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712dad7dsm1086964e87.9.2026.11.13.12.38.09
        for <Devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 12:38:09 -0800 (PST)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso1989002e87.0
        for <Devicetree@vger.kernel.org>; Fri, 13 Nov 2026 12:38:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFVZi6EthYxeP2KiKfjC6huPBtKubIIAkamLaQZWOdRl5y9Q2py9a2ZZ4IKFL9nqt5qgymJeeHGFh56@vger.kernel.org
X-Received: by 2002:a05:600c:8b05:b0:4a4:4d57:8462 with SMTP id
 5b1f17b1804b1-4bb55a99ed0mr76502555e9.24.1794601957270; Fri, 13 Nov 2026
 12:32:37 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020153652.2907186-1-dianders@chromium.org>
 <20261020083501.RFC.5.I4a691041bb6d31e5ab2fde8cd4139ca72ee72c5b@changeid>
 <CAFLszTh6vmFGVD4_Reewe9p4QqQjN=CVJ3SgfQKosAhedJpAQA@mail.gmail.com>
 <CAD=FV=V7neyofHdv-LdAtFaEhAcWEHHNRYAKrr5f2EHXWmKAuA@mail.gmail.com>
 <CAFLszTiVvuaMUsRHjhRTFxFf8Q2hbN1a1K-G=QFv4DyXNpWY6w@mail.gmail.com> <CAD=FV=XAj0f7vm89eCor2Ea7_nHaZmE-6VC+vsQ4vXido7Kj0A@mail.gmail.com>
In-Reply-To: <CAD=FV=XAj0f7vm89eCor2Ea7_nHaZmE-6VC+vsQ4vXido7Kj0A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Nov 2026 12:32:25 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U1JfzYKJDBjCkNGTAZCG6QAC76WrPCqj7MPJR0rDCAbQ@mail.gmail.com>
X-Gm-Features: AclHuK8SHFgoyjCXNJrs3RjG85XKuoNtkqoClolncw8zp41l0jasiLh2oN-rCLw
Message-ID: <CAD=FV=U1JfzYKJDBjCkNGTAZCG6QAC76WrPCqj7MPJR0rDCAbQ@mail.gmail.com>
Subject: Re: [RFC PATCH 5/7] kbuild: fit: Add opt-in FIT_FACTOR_DTBS support
 using fdtfactor
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alice Ryhl <aliceryhl@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Marco Elver <elver@google.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Rong Xu <xur@google.com>
Content-Type: text/plain; charset="UTF-8"

Following up on one piece of my earlier reply:

> The idea is that fdtfactor and the overlay fixes will all land in the
> upstream dtc project. Then as part of this series we will bring both
> in, so we should be all good.

Thinking about this more, we won't actually be able to sync and run
`fdtfactor` itself from `scripts/dtc/`. `fdtfactor` is a Python script
that relies on `pylibfdt` (similar to `scripts/make_fit.py`), and the
upstream kernel maintainers have pushed back against building `pylibfdt`
from the kernel tree's copy of `dtc`. Since `fdtfactor` needs a matching
`pylibfdt` installed on the host anyway, `fdtfactor` will simply remain
an optional external host dependency when `FIT_FACTOR_DTBS=1` is used.

By contrast, `fdtoverlay` is a C host tool already built in
`scripts/dtc/`, so we _will_ still sync the `libfdt` overlay
`/__local_fixups__` updates into `scripts/dtc/libfdt/` once they land
upstream, meaning composite DTBs built by kbuild are still covered.

In v2 I've documented the optional `fdtfactor` external dependency in
`Documentation/process/changes.rst` and
`Documentation/kbuild/kbuild.rst` (as well as in the commit message).

-Doug
