Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A970402426
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778675826; cv=none; b=DSDAADtoHRtL7vkXDGrMNS6LOvvEw/VS1xPP69/L6H2TnQYqGPBNMrfLpUgi6cAnzIuapJIebwRV5VQ5/MnivUDQIyBRZyXCdS1Exp1CXjD3q18mcMkXkbc4noAqUIyhTrGlPMYhwYr1dRpxyOvadh3y1H1axfE52r1CBQWZeXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778675826; c=relaxed/simple;
	bh=OPu1FgN88MOMXiEvgUMhYcVD4hvVSYhgEyQqBkg7fF4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=d6uqknlgM5wR/U+eh621gx2IeNtYLPmVz5p2cK1pGbkPcYeavRsnmWJnrV0DMAJlFFmsB2sSTl026SWneVe9meWtad7dEZFNCFI9ZfUH5sXjjqP5U3y0dW+4u/ItKpEw6sum+BznZPNblJKRnzhp/exGJuB4slwB26gLTasVZCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ylR2+VY1; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ylR2+VY1"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso37258255e9.3
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778675824; x=1779280624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0OjILpIxhty0m5xDC2n3oCru1zYqs+0xnRTwGa41TTw=;
        b=ylR2+VY13zUTpn+LG1VDCpnCexkHd06ItA7sZjQptFgkJH1nyAcjOeHWMWdm0XK95w
         Wmzkm0W/IWiQjCV7vO/uSRAIysgRrYuY08xI20kT2+u1DhraXk16utd05qL9Z0sqgx0m
         C1CTFnV5qyX9V0wen+H8yfdRGGtULywEw97iczSluDzE9SSOwp60U5VIu2U6v0qFcmMU
         ABe3d6LBYwAKjVSiMIqICvUoF8+SqlsmlSqGifRUm8pX98FCRq8U737Ra/nRkVeH6meS
         HZkbJ6gkKII6/Irgj5NYdGzqrpIXuP9ruNlsi9Q4Xzmbt3KzbWxcwFMkyQq//cwfkQu8
         eLUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675824; x=1779280624;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0OjILpIxhty0m5xDC2n3oCru1zYqs+0xnRTwGa41TTw=;
        b=GvKf+9vSxrtUQ+tcZc/f8HcsgqJIq0kmNeDfGb2W5M68EzLUV2vtc+mlNJl5zHZPOk
         Fro9byAwyXligdccKEiAicOFR1AolzFVblDUzuOH11JkrtNih4b6GyC+Yl8/jlRcYNgM
         H463H9t9UXx4+vY15WGsMuJgnhG8D550ArbOCzTbFM9dXYkEAqBwwiRYWEDWMuPdiMwN
         tMseYVjPrJe7y1qdQd+Ly5iSB1UpL5ox2ooM23j6DzWhhe27EV7KXCRhz4Uu8g9Hr2cq
         UW+khi7uzx9LOv7TVtJHSQpxDeQoJ02IBK8+J9aAJ/YKZcVobINd7x4Ra9GiK224m0py
         lHnw==
X-Forwarded-Encrypted: i=1; AFNElJ/lRbdFiGNrUD0/uPTOJdaOn50QdA2Jq6jz6jMfUzqSXAdkGEbYlac4A9OtoqkLpbsq09uyIqYhOO2W@vger.kernel.org
X-Gm-Message-State: AOJu0YwNnmtrTXaP7p0SX+cv1av22/ZZQQqnqvJ0Mmmzc+190L+f/fcB
	zPI6/vbDOH+gi9k4w0aBuUFF8G7FabSM0+DPUJwgkWx5F2ziqdzUKDygSWdoPk0iR00=
X-Gm-Gg: Acq92OFuk3JM0/k5Wz+ze3Gl9tQy96XbJlOuicTu8f3Nhk4pxlfs6rtOH0gZq0YimnM
	q2jQkvLxoRzLcsaldyNEa68eF4CQLuyO2CS7oL4ZBuuj9wgbyv+a6+ogMa17svzRHdk4k6/9e9t
	9CJrFqaeVucv+7/1LR+VhSWRZ+1LWdrCdivmxRjAA9RMDU3udzRz4fk41QltQzIphCV6ir80mTx
	ruNmMj655rg43NamFt2/RICiCpfA9hJiGYz2g9Rs4aKpSnJBrRHNEb6S92Xi8+pw7K2Nnro+ZUb
	7TtNgU0HFj3xBuRTU3wEMKcTtLFm3m5VCHCnzH1+eQL2E2cGgEdfU4Nr48/gXrx39IvNKbNFYqr
	RjNTc9fUTsH7h1VluuoIUPHRIiiirLSBr6Wd/GfpBFaLM6LFM8goDrbv5/tcm6rQ8mkerWQE6YQ
	v0XnpJ/I635J4izFVsuj0MEGW7E97PV1x6kMlT6qdCzhkG
X-Received: by 2002:a05:600c:5246:b0:48a:52d4:888c with SMTP id 5b1f17b1804b1-48fce9b5f95mr42872205e9.3.1778675823502;
        Wed, 13 May 2026 05:37:03 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d74536sm75006895e9.15.2026.05.13.05.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:37:03 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260330-fix-invalid-property-v2-1-228c51c8de93@aliel.fr>
References: <20260330-fix-invalid-property-v2-1-228c51c8de93@aliel.fr>
Subject: Re: [PATCH v2] arm64: dts: amlogic: t7: khadas-vim4: Remove
 invalid property
Message-Id: <177867582268.1433419.12828948814232574314.b4-ty@b4>
Date: Wed, 13 May 2026 14:37:02 +0200
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

On Mon, 30 Mar 2026 14:11:21 +0200, Ronald Claveau wrote:
> Fix introduced invalid property for Khadas VIM4 sdcard regulator.
> 
> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: regulator-sdcard-3v3 (regulator-fixed): Unevaluated properties are not allowed ('enable-active-low' was unexpected)
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.2/arm64-dt)

[1/1] arm64: dts: amlogic: t7: khadas-vim4: Remove invalid property
      https://git.kernel.org/amlogic/c/6f14ba3c3fa3d67b72e052f431f6776470eb2cbd

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

