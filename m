Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4420B3A6EE7
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 07:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774857173; cv=none; b=XgUQ+BEutitjbQpR9uhtk2zT1fbbhH8jBNCyqkJci1DoBOJ4MII+F0ImPUicM8I2RpWTvKzN8Tg/5oMuSk4qRInd5j1Ys2d7+L3D32nTUoQEkHb7d9bRCoCN1+WVUopoMOUn+HysRI0ZryZAaEYKCmhBnCw9+MQlJeKWmvp/iOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774857173; c=relaxed/simple;
	bh=TNWH8dBExWYbDtbBGekk+2o1IvbY4Dlfq5ZhgA69MLM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=E+LkL6VSU2mEmMjsDu3a1W5TSUHCKzWtivVpRb9fAC4c1bMo//bupMHJZcH3u6xwiz8WkxXOkBML/SjmPEZS7XMmeRgnDDVL4Z1PZnwG1QYAtZM5e9gbNS+8QQfd32t2nnOU8mR6qALr9zHIZGODDxdKHIO+64XJ/zwAmEeNlAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KjwzSfCm; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KjwzSfCm"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48702d51cd0so49574745e9.2
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 00:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774857171; x=1775461971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uh6jX3rHtT5u2c4N5fbPSMcMHgGUvuAHAXYaitg0z7k=;
        b=KjwzSfCmOvVyJBU/hh7jRpMXJiBNSje4bh8KqLBsr8Y6bc0geUPRET8j8RitdM06cK
         uAgUiB74WKMeUw6erE6aX7KW6XwJklxyAJXA0EA6NxSJLMdmdsJ8s7srGA54n6LWbV2L
         U/NmaNo8zJSKksxerv7HFxUZ1o8rKo078tBsvvKdOTMgRYTrlAvcS7x/g4bNCuDRif5Q
         d+/B2oewOQ//N+OBWNFamU5KemkUQSgk+G+tFQvqi4Er2xI5qbcVI3cIWoze4zA4N7ns
         vF+Wda6/vpdlbPiMLgZ5s9NgP9W2bh1FzZrM9AMHQsYAsRM3g5W5TwwcwOio3uw65+En
         5rNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774857171; x=1775461971;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Uh6jX3rHtT5u2c4N5fbPSMcMHgGUvuAHAXYaitg0z7k=;
        b=ksPsWFpNQdA7MU9qWMVE/njcct1Bu0rCRrqAvZN8hqDS6NisUt4Hdzui1eeuV31vYk
         1y15m3pAXltAhiSngZsHP35+og2Tbq3KWk9pjZlBc/0hyKn4rp/CyKt9476w7hqm/TK1
         vhGEFcyxcyfGk8Mwb69qvINaylVxyn1JiLi9QoFCMeGpgJD9GMS7h9fGKKTcCwbwBjyt
         +FlvC6Imy0wVHwMHKqUBhflmg1+3WdhjoCbVT4N7iBu0dDM/vwCHCI8a/8kLCA1UyyeI
         SV8mvQ0KNLBUOeolRHdWuXlA5ESn93jkIh3Mx4oN3NwlwHPOf/1l11g75H5J1w1ikAGq
         sJ5Q==
X-Forwarded-Encrypted: i=1; AJvYcCU97Mq+WA2FVD8XOx6tXQAGti/kHL7HI5ZIhTo+CXT4nT/N9IVABYyM172dwHGLgjq+EejUCxO6GEv2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0wJZZPT6vej3gPHmHLOZQQIgDTe98KaRiWt7q5Z3RU+K8X/Yv
	wlnEPP5PFQKHoMEYl77o9SI9+M3b0HQ9gxQqGK7luN/A09kEpNO1LlcDX+vPTmtQapw=
X-Gm-Gg: ATEYQzxR8OUXuf8nkoFasSrrBhC1G1q+sXz2OILDrIAkhNhRdsXbayOeyrH8/fZ+JFi
	RpwWsCge3ME6/3JwRtJFTDdzL/DSMFl+qcguzI06cqoN8Lv+z9aVn72FBzAtGvzGuh6LlIqZqz2
	Hu9cv+knDmUn3B5GTrXy8dszHY2uHgl6nXiEEHJqp/IIsDrLRyn4hwsGLRuK8q+7bQ1AMC3lKWT
	gGTDhomqzJlxOXHI5lVp1drGz0AITVQN7GL7iu+Ldn5Ax2GEQmmNMNrm4igGHJertAqPGVjCUcS
	pu8GdRzwatBGk2859D9NLnhsy4KiclOqAlvSk9ZYPKBCD2fQH6qQR/q1bVycpLup9UAlp7tvRFa
	fDIToguI2lMESklxWPVUAGkc5jkTMZ4tEax2hJIznUdXP+Ax7694sz5CgAzk68xG0tH7Kz1oKWq
	/vPWwxDjr1EgFTmLiaWuLa6Y2kVzbsJSJsZOQN3VTYoxhc
X-Received: by 2002:a05:600c:6487:b0:485:3d00:efd with SMTP id 5b1f17b1804b1-48727d679e5mr181633115e9.7.1774857170616;
        Mon, 30 Mar 2026 00:52:50 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48725ec20edsm74580455e9.9.2026.03.30.00.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 00:52:50 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: khilman@baylibre.com, martin.blumenstingl@googlemail.com, 
 jbrunet@baylibre.com, Nick Xie <nick@khadas.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260327093016.722095-1-nick@khadas.com>
References: <20260327093016.722095-1-nick@khadas.com>
Subject: Re: [PATCH v1 0/3] arm64: dts: amlogic: meson-s4: enable RTC and
 IR for Khadas VIM1S
Message-Id: <177485716915.875961.15585645607067956492.b4-ty@linaro.org>
Date: Mon, 30 Mar 2026 09:52:49 +0200
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

On Fri, 27 Mar 2026 17:30:13 +0800, Nick Xie wrote:
> This series adds support for the Real Time Clock (RTC) on the Amlogic
> Meson S4 (S905Y4) SoC and enables the hardware RTC and IR receiver on
> the Khadas VIM1S board.
> 
> - Patch 1 adds the internal Virtual RTC (VRTC) controller node to the
>   Meson S4 SoC dtsi.
> - Patch 2 enables the I2C-attached Haoyu Micro HYM8563 RTC on the
>   Khadas VIM1S board. It also sets up aliases to ensure the hardware
>   RTC is prioritized as rtc0 over the VRTC.
> - Patch 3 configures the default keymap to "rc-khadas" to support the
>   official Khadas IR remote control.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.1/arm64-dt)

[1/3] arm64: dts: amlogic: meson-s4: add VRTC node
      https://git.kernel.org/amlogic/c/af0f8f769f89715692ba7abc4716ecb7aa9af028
[2/3] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: enable HYM8563 RTC
      https://git.kernel.org/amlogic/c/3da3598f65d00f72a17a16c171ba52897d8e96a6
[3/3] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: use rc-khadas keymap
      https://git.kernel.org/amlogic/c/c15edbda012eff7cca4c6c6bfedc04bde5e8adf6

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

