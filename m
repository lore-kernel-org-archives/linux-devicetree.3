Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C476A2D59E8
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 04:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788321958; cv=none; b=kg1UxBj8qyFPc/EXPEnLRZBIdERQpW3gXtsHeFP+101yWXHGHd6c2fpAdYTpUEfmMwfhI9+278o3bAESP8t+wvchnY+PbRWveTIBS2KiAMKB05y5i/9iJyG8PPkSKy7hbKlIBLuFbLyD1S9Wqq+jyll2IijLUaozZnGpj+uryCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788321958; c=relaxed/simple;
	bh=U02rSKyzUzmCOmMCAOGr7JPyboEYq2F7JqSsroq7C50=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ThqpcGbylzXazgYMUUtJdOBNCy/1soP/SFmvwgSkO7GtKrFnVx7Dj/YceV/aRe/FNjgW1ykS7f1yCxFXEn/yZMKxBFTUoJYilPM3CDSmQxOzLauFocLTj9oHiUyNTFnVMiUICEBt5BvoRtB9vLzjSOsi9WDp3YtmAFGJYZL6GFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W3ea2ono; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W3ea2ono"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso7604825e9.2
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 21:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788321953; x=1788926753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GFvygFZGUjQBUvyTV1K8zmfQ8M+g/wd4Pqbb8y8IqXE=;
        b=W3ea2onoKooBqbCDJnvgzlYoAdt89GyN7/iCwdILcLjgDl58tiZscDh6UiWXXkOLky
         Zk3t5/PQv/4jFRXE52e2kSU6lAQwjAp4A5kCcSQ5mtgYk0RlMp790g+RRNY+m4PPkUrO
         b51K7NZhFuNaJyVutDfkVUgF0CbWCvl1JIDtZCxxoJ9m3sOAD/J2IeHi/dajyrqw57fF
         xX/JxScysSEPM6xZkpOEENiPdO/94OUX0W5oOGOCHVHsoTN1AdcaNpNtzMKkuhtNlx+f
         fqJ4GHaSdAt63/SQvDGg0vdBqPKcHrCt+7HyTPXDePWnSbVK8nwkagwsZjkPnQwaOGoC
         x5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788321953; x=1788926753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GFvygFZGUjQBUvyTV1K8zmfQ8M+g/wd4Pqbb8y8IqXE=;
        b=Ij7Ys47TuaVr65DD8gofD4mVZwbTAQOkjiOYJb9+s/Xa0XZ4u4CfuiJFS194M5x4ct
         tboAynR+dWJs1XxPOgyAyuoBlbCmQ5r3QQPxc4EYfnK6p0YFSHjBGaMk9o7akbgVSt53
         OXFD5g/N4WXdn6/fc00iZJJ8C0r4Vl7iI+AX+DXKK+bR8Y7wo+p9TPZn0zb5nn/fG6+q
         yP5ZhbdDKZuwtVfBX3qacZH9akA7UWlJgvjJfrWoNgTjnE83P8wHgaeiJvPnQoqlCxHa
         RLzWAGhY+wIP+IisW8+EMcudVxaZTTlGdDl14yjtXEdu+CNUR2pYj8A+9xBHT0FlPxTL
         l/sg==
X-Forwarded-Encrypted: i=1; AHgh+RrD4Qroa2n+NwTKiar6KOSh3S5ECc1PTWns3U9mIi4n66fyYjDQjr99OAO9uxVZbmzhc/iXJy7qxFPF@vger.kernel.org
X-Gm-Message-State: AFuF++lWvPWFMOJLA3UgqHDuBrXFBdapubJzWWoU81kJruMwKFMhEFWX
	OfQzXYfgpzvTPCW7ehh7DFMEqSnmbji3wXibdX+t7IXyAOEzJrdkQ+dnV5ebcpy+5xE=
X-Gm-Gg: AR+sD12Kf23qal21KwzbuBYxTMOmkEZtAgdbOnwUzxk49FcbaL7AwgH1HkCjWimzfgN
	FE/vygfbtQ+gWRep7M/SlipRKVzxn7QZin/7fQe4/lM91P42nmUCo1LArawfg2FPmnXbZ2Lrj98
	9obzwUSp8Rb7ZTH/msYPmlcEXOx6PHHcvoFUfoJxGQQWyi1RNXn5qYAOOKmvlOop9TgfYFJVc42
	oZCPW3ZUojdHfL4boYG2EY1jOLztr52B0cdCGgMl2n0vevwdBbrNTR/9LWx4VbpcONTxnb4W2pd
	TzdFRt1HqUVM099d4IvdlMksb8tXgLweB0H6Mh5j/fs5f1HLEIKpDD8b8sBvqrlnTcifAaJCqoy
	66e4GsieJBNN4HN8H9PEGRdQWu0CE8rq2PSrlcPOswVi6CSka+if8FuhpbYsBHXW1rxWjiZlnna
	JC1clOpzqQPccUROd4zZQxxvKoJc9Jj3swjad7cU/vFNx+IBYiSpvukqnCEKL1+uGEGvUu1iwEa
	Hr9vLIwZiJJu7CXOci/i53ajD9AntND6kRTzF0oSLkJBKJCzVv3Siclsl2d01Y=
X-Received: by 2002:a05:600c:1f92:b0:49c:dada:30b7 with SMTP id 5b1f17b1804b1-49ce5816440mr28643995e9.2.1788321953089;
        Tue, 01 Sep 2026 21:05:53 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce58da3acsm42979395e9.0.2026.09.01.21.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 21:05:52 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 02 Sep 2026 05:05:42 +0100
Subject: [PATCH v6 5/6] MAINTAINERS: add Exynos850 PMU entry
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-exynos850-cpuhotplug-v6-5-a85bb55bb118@linaro.org>
References: <20260902-exynos850-cpuhotplug-v6-0-a85bb55bb118@linaro.org>
In-Reply-To: <20260902-exynos850-cpuhotplug-v6-0-a85bb55bb118@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Add Exynos850 PMU entry describing new file
drivers/soc/samsung/exynos850-pmu.c.
Add myself as M there since I contributed Exynos850
PMU support and intend to maintain that.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 554246ef6d91..44986153183d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24290,6 +24290,13 @@ F:	arch/arm64/boot/dts/exynos/exynos2200*
 F:	drivers/clk/samsung/clk-exynos2200.c
 F:	include/dt-bindings/clock/samsung,exynos2200-cmu.h
 
+SAMSUNG EXYNOS850 PMU SUPPORT
+M:	Alexey Klimov <alexey.klimov@linaro.org>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
+S:	Maintained
+F:	drivers/soc/samsung/exynos850-pmu.c
+
 SAMSUNG EXYNOS850 SoC SUPPORT
 M:	Sam Protsenko <semen.protsenko@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)

-- 
2.51.0

