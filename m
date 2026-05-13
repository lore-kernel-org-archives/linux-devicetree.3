Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A5241B373
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778675828; cv=none; b=ZU4UuiHPPEpDX8wpUlQA0LA47dofYRmKJ5PD2bofSHLxMuern6DIDjPmGRC0dBVIHOrtNttFQ9YFPL8aeeQ7p8jONHTBb9nQbTnIamka0X24iBTUHHgC0C7Zwpwz3I8B9j+hDh68SZlAdouGxpmX3XPA1KJgqM2up47scoCm4CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778675828; c=relaxed/simple;
	bh=xoGNNxV19SHliZ2yD55l3aenK58wh3MnsHt8rZUZb7E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=puDtin1qjf84L6NT0kf/716sBGzOs+4C6wrScvVcLTJMSrN1fGpH2QsMET4gWNXQt6vIRLSvd3EYOzi6oW1TOFvLVgrb+IWHay7PUBPT+Ec16iSCICUf0iU1XjKN37KM7I4wTORNHRXYKnt1W83LGppG1cXpmUbY0si84jPs9Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sXfve424; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sXfve424"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48909558b3aso66860435e9.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778675825; x=1779280625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wDZNYuJTOodTUWmKm8ygZ3ux+hmWufjjKn9F0AZmjY=;
        b=sXfve424pFYNCjr+bpqO7Hql9yxPLgDv49r+qyAkU2BcFG5HYNu2oVIE/fc9I8HIuN
         zkLGL0rnsr+7rbcov+gUdsnsTmJDaZ4fx0Xy8sNMP8hirqiqiFQiA1PfhaGGbv4V7RNQ
         31xnmZgss1Bq94M7Z3PlnQPeZCAEzkQlt/dy9QhDth3GADdSpSpm1OjUx5DJ89kLadk0
         5d2j3R7BAQJdPpiKVSAozp0PaN3sCTOhW7U+/GfV7dI9Chkfm5tA6xMEjo5XZew/Ti5F
         Soq1YFM66MbPPYEdC8NbeSLt4/69pf392Z/rp1bmhcKw5SpZzXP3faMUBB+49D9Nhsta
         29Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675825; x=1779280625;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4wDZNYuJTOodTUWmKm8ygZ3ux+hmWufjjKn9F0AZmjY=;
        b=EZqWp4FJ75F8XjlSfrmgi/AGImpvEKdYwQMb9NOss5Nyc6mSsZSTLepP7iquipiDex
         d8F3UI7LXBvnlJPsOoQL0+MXsP+NWeNVJOTNIuJrAWNipa2+JvRb7kvH54l1dIoZWSlD
         LhSH07nPZZM+0ra19D09Xolf4VtS6yuEh9bhZeFoC1ooSGiYc7jBKx7Vi3O6QpQ6eiYv
         fQdbyEMdUXghVqoxT6E8ko/66t8ufzzEFmDbLW2m28fIJe2q9SX5Kp1vklxIlcMqVY7I
         /836elG+NJeojMQxpWzxfWG5vqu5mBFii5ZBhgNQi8FC4SNe53Sk5wSMRugLB0bgOw90
         zhDw==
X-Forwarded-Encrypted: i=1; AFNElJ8MpmM+4wOaCeVhDYJdoeSkAFXJJG7nhjvtKFZaYghem8yrQsC4LSgoU6L5aarVRx5OK1Vw+GpygUFx@vger.kernel.org
X-Gm-Message-State: AOJu0YyqdQu5QNicEOkJjPpQn+fEsZelvl+ATncLmKmVoo3cofliZN6d
	MBw0tjn8fe1dbQlyt6Q4BjE1nWYnWG85jh9A+2DwkzNGgrW2p93HRMsbN85WJ/qE9G8=
X-Gm-Gg: Acq92OFGqlBOrTi2uisWanm5HKgl2nriXaGsyVPy5s6VRDsiXaWOt3z+H3oWmMpTJmc
	x4vksC+9aR5jKjIy7mkmEGILLAyejyQypt8rz9eAqT9cqFaRgEFcBa1xA29DAUw40x6ex8lAlyL
	iohGOQwSdQvmGxG8yszVBPVfjcaomx1a0UuhBJYZuYAoq/ctuAiVBRydxAJMlFzEHJunrxH6+NC
	kR3v+duQnXiLX1AcAM/5I2P5sn9Yn3DiEBWJs+pb7AjzqGgJQeoRkpFB/xkHP4FoFF+GMQUMppv
	5U4y9wHC7jgDodMqzKPdhUnVYOHoZitMAocuOuy9Yh+yBvUYLCKsFSk6emdjlNdTyK9OcSh4RWY
	F9M9WVCcL5C7cDPUK/TuYxD/QwUCNlhQJ6yYl16hKY0jPY0WH22ZdL7kQao0FeMp7rLv0pD6WJe
	INpEBk/Lp4KcN5P7evANegf75P405QTl91RChBr9qa5zRq
X-Received: by 2002:a05:600c:a31b:b0:488:b187:3c with SMTP id 5b1f17b1804b1-48fd5b4f6cbmr4318735e9.14.1778675825113;
        Wed, 13 May 2026 05:37:05 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d74536sm75006895e9.15.2026.05.13.05.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:37:04 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260513-add-kvim4-sysled-v2-0-3ec9779e8875@aliel.fr>
References: <20260513-add-kvim4-sysled-v2-0-3ec9779e8875@aliel.fr>
Subject: Re: (subset) [PATCH v2 0/3] Khadas VIM4 PWM status LED support
Message-Id: <177867582446.1433419.3719715146957232929.b4-ty@b4>
Date: Wed, 13 May 2026 14:37:04 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1

Hi,

On Wed, 13 May 2026 12:43:52 +0200, Ronald Claveau wrote:
> This series adds support for the PWM-driven status LED on the Khadas
> VIM4 board (Amlogic T7).
> 
> The VIM4 exposes a heartbeat LED wired to the PWM_AO_C output, routed
> through pin group pwm_ao_c_d. Before wiring it up in the board DTS,
> the SoC pinmux definitions had to be corrected: the original
> pwm_ao_c node was conflating two distinct pin groups (pwm_ao_c_d and
> pwm_ao_c_e) into a single ambiguous entry.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.2/arm64-dt)

[2/3] arm64: dts: amlogic: t7: khadas-vim4: reorder root node
      https://git.kernel.org/amlogic/c/308e24fb9571be23aaee2e2a5de3da6f5cb3b029
[3/3] arm64: dts: amlogic: t7: khadas-vim4: add PWM-driven status LED
      https://git.kernel.org/amlogic/c/2bb37dc2976dc980a05ca93f529ff9977a24875d

These changes has been applied on the intermediate git tree [1].

The v7.2/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

