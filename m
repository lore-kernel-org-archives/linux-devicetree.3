Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319ED3B5E10
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 09:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783072271; cv=none; b=ADAt3E7nqdDkkvVQWyPvhlffdc0PpLqKDSbwkpmjK3D4QDpr04V3eReDVcDWKPEKvrAjQmhabB+ueGvUB+mijXRtxdUr6oeQLzxEC5NiKnW0vqXBYEwWikcjf87jQO5IQpTetP3AmyVlPR1N0nCMLNA1uJo3svTLCb6U9c9bfgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783072271; c=relaxed/simple;
	bh=Sb9MKvpyIEWg+e9imFuHUT9W0Prjh7jGki6fNOIBXdo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GAfwH6dc7C9xVN5Fyq+6fQgRgPyVFjwykejr6NWoQPrq7hpGNJc+KhRveCkMkjsG35D5SXs2DvnQuGfOf8lJ2Bdqu35H3GArSvi10McY5ktjETM4Et8oHsBSask4AW9K1XTb4fOVcR3Od8u4DhA0MlKgaNCB9AGJRvcdkxIv8Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wJwdAF6b; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wJwdAF6b"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4763b0c1dcdso392448f8f.2
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 02:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783072266; x=1783677066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=np1GDiFHQ1CuNSD1vWdE5qciQiEtsdk58lh2fmJm4uQ=;
        b=wJwdAF6b99Hf+LolSWUpFDXF5MKQo/3er91GoVfBgeJH4WMgwUkpDvjGitopLpPnsT
         +I9XOa6yBIQM1luGx4Qs9YvNt6CbhRdWV1UjwuyuLtFKId94qEi7wt/LmD+kMwa3+cJj
         FIhfkuJPSXbmjeMzTmhs+pYLXcWCx54qGcz69dFCeDPE43cJjUT2TY5RTMczS2ZkoAB5
         CJ43lsnd4Y6BM2NIIeTd4kb/Ul11U4GYorNcT3GDhZkN/pWNIaIqMhfwoh5C0l9dT2n9
         wl/75U1HbA0OgHTq7/p0rDAhx9hfYl9jrlzw6FT3y3vlysNdGvT1xCJJ0RHFc28z+5/F
         Zzsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783072266; x=1783677066;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=np1GDiFHQ1CuNSD1vWdE5qciQiEtsdk58lh2fmJm4uQ=;
        b=TgJIM9BiIFNGM85/tDDDf+y4/BCggPYFMY8JC0djCu3eOgYy9nqn+VGdAX0zDeXTrL
         atCvqUa3SMMYUeE+xljVEYbSPaD08kcQF3yJdmRVIz1bTbVT2fgTCgRFS1jLctDd22BM
         0d0p5VsOEWkZEnKoJ+3p8MavtiuUizPaQ3Zo7LkdNPYBsNAlAKpRvj7YJDVXKnAg/+/u
         1Tb5kRIOD7tIoPzMMLr+z8AbuEgNEZ6hDpm3XUT1DEGCX3Sl6OXSvCC/udfsSg/qySQG
         u3rfY/SMe3InU9qFSioKII1hCntmbxxxMhlOGHud7ct/2tjpx6FAr1HuBjq6OMO6UcV3
         2YPA==
X-Gm-Message-State: AOJu0Yz4FDNSi/l1oeQ9dLs7orDufyXjATacI/WkdMDIkgW3xpv1dei4
	WfaBP0rW+3//6ybK1cE/aAugtn4etLuezhbH/LGp1DUdNJ4Y9lTGoVZZSkgkoxyTgVo=
X-Gm-Gg: AfdE7cnYGw4/9V+fg9lBPzjU4aM455uTXETxbKmnizqc+36Nx6lh6+gvM7HxvbrI1vA
	2d1KQo46uIOy/XitryseGIftakVKFiz8hliMW5LF72YSwQ7L37pZq7PkBocFiPYr+ERrzS/S6Bb
	3/EKsyTW4MmH9EBvzpPooboCezrxjko0gH1xPRU/w4XQ+/4pUjFOAejOaEPn/qVPAb+InFLHr0a
	xvRnowCYriTI3oQq5jbpOAzUprhh0TxC+edkYfZEXoKEpHlPrfsEYugNScxgzhHWWM0S1/Y2anP
	g6N6Lu5DKciODjpgSac3ascEWWuptI0G9az5hXICq1uG07VS1gcLfH8AivkkiBZ8Jx8hTRXtwx9
	oBQbTQUkzS6+dEsbOsCHaOCGGzMBcg5RuOO71KZ1uSKNhQYq+msQBm+V8lHfE1dLJFfVevLPZIy
	TpsTwdv1uOASq9sz5eZilpWDLppgfd1Lfjew==
X-Received: by 2002:a05:600c:60a:b0:492:68bc:3237 with SMTP id 5b1f17b1804b1-493c3cf8cc5mr80908995e9.32.1783072265643;
        Fri, 03 Jul 2026 02:51:05 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bfe616f5sm126116215e9.1.2026.07.03.02.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 02:51:05 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20260421-clkmsr_a1_t7-v3-0-efc00b0f9e6b@amlogic.com>
References: <20260421-clkmsr_a1_t7-v3-0-efc00b0f9e6b@amlogic.com>
Subject: Re: (subset) [PATCH v3 0/4] soc: amlogic: clk-measure: add A1 and
 T7 support
Message-Id: <178307226476.3253856.1594545228633804096.b4-ty@b4>
Date: Fri, 03 Jul 2026 11:51:04 +0200
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

On Tue, 21 Apr 2026 16:17:40 +0800, Jian Hu wrote:
> This series adds Amlogic clock measurement support for A1 and T7 SoCs,
> including binding updates, driver additions, and device tree enablement.

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.3/arm64-dt)

[3/4] arm64: dts: meson: a1: Add clk measure support
      https://git.kernel.org/amlogic/c/dd3d4327240dbd5e4a256f7428f92f454e23edba
[4/4] arm64: dts: amlogic: t7: Add clk measure support
      https://git.kernel.org/amlogic/c/d0a92020bb87b45a235d9d1f9ce76494e9ed02ca

These changes has been applied on the intermediate git tree [1].

The v7.3/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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

