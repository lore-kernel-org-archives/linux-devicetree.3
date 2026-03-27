Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5533D47DB
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 08:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774600286; cv=none; b=kFiEv/1CFQktGj+y7LEPvqHHbJxnJAkqDAxOaD0gEk+PgWgs4+HXSWLQNCOaGtlEVuxRt6Ij29WHc2vMTgUWBLhjgZZgCTE1UzWP8BUA8osww8sA83HrphU6soYmwYwEDFdMkb1QdOBOz2AslTm6UQx3wNXoTz1IJ+nNqz4w6qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774600286; c=relaxed/simple;
	bh=rEvXfRjXGnFiPFkzSq7G2X0rafT0YoJFCHEzbQPw7Zw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=m8eQRGDZkoxiTLfFbwCP4Q+jhYRtk2ZEJJxt6cem1zo+QWhih9OrwjdA4/OE4LYL+tbeLG0B36j/FINGknh7cmA8aq+96FsKFysQQkAKtfNQjWaoujFY/PKDWdcDlmsa8s7tFLFQQBar6sSeE2jylF0T0hGVnk09bLFEVGVbzas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fhZfLO80; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fhZfLO80"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439bcec8613so1339751f8f.3
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 01:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774600283; x=1775205083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQ1yZdSv4qzrzrFbTamOK/pWWsZOMgXzJj/IX5g2c2E=;
        b=fhZfLO80KOdH/xaQq+4gchwLnEZwAM81BRCBD+Hzxixf9rEKIv0MmeFkv5oSXCQx+p
         Rodx+82lHLCDe5WxjO4Yj/OFvFXm9SlZPt0zhx7mKGt8uXpVb/9DLerSPTIcO6jiJmy/
         emu2ziX8fBIlZMlchwbJbDyud9K3t47MDde+vQnKMNy4LvjRHw2X97GD1Ks0Imha0m+H
         aw6v95+9mtbV+0rtldKAm4W7ovnzLj0R6ovqqUcxaTX9fjMTx11YsRsvSMU9Kmta/qpp
         XpKn42VUtsi49IJzQboeT1qEjUr5al155ngv1uGmRjmqA51SyG4/REkAp3vD8Dx9NGtN
         j0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774600283; x=1775205083;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HQ1yZdSv4qzrzrFbTamOK/pWWsZOMgXzJj/IX5g2c2E=;
        b=k+3/SskBrsQgc79l5nw9+SKddt1+CANwDeH4CyfJWPki4Y7xD8mL2XB5qS40ydoh/l
         7IG5HABBVcnVog5WrWRQ6yY1zbFDNuGG5wX7SB+yM29SVzxuteHlj84VuwZZK4F7mmpu
         HgNJw8YZElXGm1it/QOO4AG1Df4vJpvvlb/205UI+f872oUNNBtQFpIkPT6V2nRw1pP9
         dizBNFMhymLfzQp8O5E2/SAtbhZBaNiQJa2tqz6e8sFyxVDoxzVnR7+Zsw9ayixqC8HR
         ffXUpwirC+Sz6WX+ncSshHEtEKQvPlYN1yx8VdgpU7HCy6C/XfDRgbuX4BPvj7uS9Z0A
         fCGw==
X-Forwarded-Encrypted: i=1; AJvYcCVVYzGMzWPSLh0axAzZdI3ZOkVgXrWSqnsEZKidICVRrLvH1HjA5y/JuS+u2ExNdfXcWgl50LV8/vlm@vger.kernel.org
X-Gm-Message-State: AOJu0YyvYlsDWOi8RmdlPvveimDhNeLaaS8po2oDmRRpn27jTZhl4uK5
	Fdc6fmmmc7kbNBp223We+cUSy1r6X7HDw42ECUEdhDdHbWuPgJOOVYGUMptjLL5xxq8=
X-Gm-Gg: ATEYQzzDHjuEcnUWtWSEAI29ccUXQxAzDpMcf3+8/1TELSsc7lBXP+8SNLKsVX8/HDi
	EdUXOqt47JL/90SDp1AA/Dw0MsvrFQJyaDZ75Sisgfmy2Ua+79PTs2lfzoOxB25NdMGXpyKVu9D
	p6mBUcI0CSukFNSGeQyJ4uGoAuVsIKL1k610hQQ0VTDL3EORJpuz6EYPMvOPXeM8FFFcpiKfM7v
	IYI53f53peQxqeG6G5tvPvW4WOxPjDjW9VLQKoXzjh1LhwEu+mRmBdAhjKZ1+CvdUPiA9ta+XNm
	IWlEWExVqL3iDGKdIZDeofMV9hQoNxzuFy/fgAHt6uWqvmnDsO5sfq5rOmEhkgFh8HjEsikRKLA
	4VYO8iYQWxWVCwv8BdFCM8h7CYD4S4YBUiIsqqlvzVvbZ4YH6SVJTTbReZOBwNHGLytZweqnU+0
	RUqm+yIhaIf0of1cRZ1EYoVeBvPCXon1iLk6OmYBEmLZHd
X-Received: by 2002:a05:6000:2505:b0:439:caf7:a5e5 with SMTP id ffacd0b85a97d-43b9ea46754mr2454666f8f.31.1774600282992;
        Fri, 27 Mar 2026 01:31:22 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9179b212sm14490849f8f.0.2026.03.27.01.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:31:22 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: khilman@baylibre.com, martin.blumenstingl@googlemail.com, 
 jbrunet@baylibre.com, jic23@kernel.org, dlechner@baylibre.com, 
 andy@kernel.org, Nick Xie <nick@khadas.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
 linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260325070618.81955-1-nick@khadas.com>
References: <20260325070618.81955-1-nick@khadas.com>
Subject: Re: (subset) [PATCH v3 0/4] iio: adc: meson-saradc: add support
 for Meson S4
Message-Id: <177460028211.2323693.5107431910130043283.b4-ty@linaro.org>
Date: Fri, 27 Mar 2026 09:31:22 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

Hi,

On Wed, 25 Mar 2026 15:06:14 +0800, Nick Xie wrote:
> This series adds support for the SARADC IP block found in the Amlogic
> Meson S4 (S905Y4) SoC and enables it for the Khadas VIM1S board to
> support the onboard ADC 'Function' key.
> 
> There are no known hardware differences between the SARADC on the S4
> and the previous G12A generation. The S4 bindings utilize a fallback
> to G12A, but a dedicated driver match entry is included to ensure the
> correct part name is exposed to the userspace ABI.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.1/arm64-dt)

[3/4] arm64: dts: amlogic: meson-s4: add internal SARADC controller
      https://git.kernel.org/amlogic/c/3b095e9b3674da0666aea3021167ca44097ed7fa
[4/4] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: add Function key support
      https://git.kernel.org/amlogic/c/97c4d4b7de6ef264fbd45300a168c2a0874d6c75

These changes has been applied on the intermediate git tree [1].

The v7.1/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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

