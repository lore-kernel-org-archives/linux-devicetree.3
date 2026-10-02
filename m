Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBD13CF02E
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 19:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790969984; cv=none; b=mF6raY26x1CZbdXzSqRV7zlbKZbuZByYsKeFrRUmNjzx4p6gHLs3QX+ubEC2sDooSzX2HltJKqPdFMeka+1mqSIazaL3bIO75Q9bwl+KhREcSXZMw7ojZuMB44huVj5NzzTUV19KQl/LLi+jwCxoxKTDfE+DHClJv6iU8WAaGZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790969984; c=relaxed/simple;
	bh=PsiLckdoCXlaU6XGuMWWxAwtoHeZw/ZbAbJywb95DOQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tfeJ1jVlFZPnNQato9Iu8/HVzlJRXAhTIg3V939KIN3ARSjq5bwl0h03OT7asHE90uE1Wp8R0Qx7NfLsyHkuqnXgwn8v30GlG0mv2DGcHrq15v0baTMQEo16+6b3kjnIBqJIlXshKHEP0ZQENTz0UXs2tJ+WoGi83LJ2KIeUSp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O8O3CVgu; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O8O3CVgu"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ff9642c57so1021785e9.0
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 12:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790969981; x=1791574781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ECA2Ii7AnEG4kznNqv+ar3v6vnQStjMbIFJDndf3wus=;
        b=O8O3CVguB/cpdLiaePG1wc3dkUF3m4Rr1SzXZ/Jvux4g/nUv1wYLWrd2E05E6R8RUo
         Ahcc6Yby3tRRHNnraQaQ9qziBEN1FDaAzuxrroKjyoFd3m5l6/W2Lg3cJo7eXWu5iF9k
         5knff6gWFqmBnc4/ZJYEDqdrMlrqPdgyYJaX8Jvh70hJViqk1RO+4bQK+vkbQz+nQS1n
         WQotfUvo9QAdOJGmfqnISP2HksjTl11lT6J+hbu14VVKU01JgT8bEX/kvYABo5OJ7aAS
         wP6I0MGTQYmUOugSRGc8hVpDp9md8hQdmQS6/Yco7FDGbZX/rUFbL0H7obYfVUO2XplV
         C7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790969981; x=1791574781;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ECA2Ii7AnEG4kznNqv+ar3v6vnQStjMbIFJDndf3wus=;
        b=oU2pzGtrSa6B/bUHzIaQBulOSix5ZIs225c+NCRTujhauYp4A8p2DQznkVUIkf28GY
         vr0jM28QhiX7t19yP1OmvppfWi0FhKlCsaeLN7u7MsRVI6izUlqJZ1ydtIWAwUQma+xU
         Gk72LGZ8J9l9Y1u5UC62pkPN1AAFrhklp6NdtNeGFDjKpCpawYZNtRtPZN7bx92GE9dY
         SWqYHtdj3JHWoTJAVme6bflBBsAosZz8Xc5GzWjfKz2mxwnyhi/5qyL0t+CuWfUbiR7+
         RBLsXlEaxSvW/GyTwHxe920AT5UPhBjD3tGjJFJPbowEgduj5zsRppKkH06Z80h5LrNR
         zF+w==
X-Forwarded-Encrypted: i=1; AKwUvBy/9AROhoUTg9zLkxJAUuaG0+hoj4vxBm6C39qoknWSwTx4IHigoCjOE/Q3DnDBs517qehdzhfdIhvF@vger.kernel.org
X-Gm-Message-State: AFuF++n3S7m/dAcQUbT8mAE4fnni9MDpPX2Jo+X6v9UZiEjyZQVpDDEF
	RmopdEGaQLBFNnTBq9MEKoz7LjZMG1VJTAaxl/776SZDZDiIvDaDngS5iiNfV/Gjyjs=
X-Gm-Gg: AYBFou1FD2K95CP8UZzCy7qmAZFAIZv7HfukPYSafHajw4oD76nSASXrCSYZ6mZ3EFE
	XsU2HpTnWFODBQvCjbHW3iNNbMe0+pEx16DfVoQDubQpHjSjposBA1S3HjMV0F3XhCYF/uNqj2b
	xE1io2dkNnolkEUVn1Zr+elQTmFXGQxT1dX3LWtSW7R8JLhUZq6HzYq4CKtLNZeGndCtOtSirhc
	9LzvCv/3Nim7C6JjQcISkPuh/VgUYHMPbWO+jz/bqTEAtPNThAJgz8YX5CkAbmIj5opEgPIQs3V
	gy0+sVkfTEgB7ePt2y2bxgUuDTk4w5DTVku+rzjmVyaE1aKDHPCBjqA2G6iN5Dy1A8dY+p0URzS
	5Oo6CMvVhBcuKxXe66pcvjw2odiWkVu89p5NQMNMhgBnFqxoEFPliDED+O055JooQt7H3Sxu1lq
	Q+ctztroHw6NpaK4Cb4ZYDhwH5WXoJ9/xh8iv2Jkhh9rN8TmsXqiHfUfCtB8zOxGbdG8Y8WProI
	R4c799IDbADCZ/kf0U=
X-Received: by 2002:a05:600c:354a:b0:4a0:ec5:46d9 with SMTP id 5b1f17b1804b1-4a027447475mr68982555e9.0.1790969981261;
        Fri, 02 Oct 2026 12:39:41 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0276f92d9sm104389955e9.4.2026.10.02.12.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:39:40 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Igor Velkov <iav@iav.lv>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christian Hewitt <christianshewitt@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261002-hc4-spi-nor-v2-0-8366a4f91049@iav.lv>
References: <20261002-hc4-spi-nor-v2-0-8366a4f91049@iav.lv>
Subject: Re: [PATCH v2 0/2] arm64: dts: amlogic: meson-sm1-odroid-hc4: fix
 the SPI NOR
Message-Id: <179096998039.3351815.5090635259555854831.b4-ty@b4>
Date: Fri, 02 Oct 2026 21:39:40 +0200
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

On Fri, 02 Oct 2026 21:36:45 +0300, Igor Velkov wrote:
> Two fixes for the SPI NOR flash on ODROID-HC4. Patch 1 lets the flash
> probe after a boot from SD that bypasses the SPI flash. Patch 2 lowers
> the clock to 40 MHz, where reads stop returning corrupted data.
> 
> U-Boot takes this device tree from dts/upstream and gets the fixes with
> the next sync.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.4/arm64-dt)

[1/2] arm64: dts: amlogic: meson-sm1-odroid-hc4: mux the SPI NOR HOLD# and WP# pins
      https://git.kernel.org/amlogic/c/0b825126590879812321cdab53786fcd906f7761
[2/2] arm64: dts: amlogic: meson-sm1-odroid-hc4: run the SPI NOR at 40 MHz
      https://git.kernel.org/amlogic/c/b44e2be772f866985cafdf90355285069ea68495

These changes has been applied on the intermediate git tree [1].

The v7.4/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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

