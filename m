Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C2715665C
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 00:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790727200; cv=none; b=odgMLPS2EKGVqLv6+j7RCeKGwEP9yDi/OuX96uW919uCK0E7zg4ew8MbPumMpkvagsh377B9k2jrt4giGcZEWJ+5BywCYmd5ZJ0tqcNuvy7VxEI/ch5FQQ/IzDwxCdey6mQM9kElsp7zYKNX7HEHRWX0gEdtdEcEBFWVrvSVICc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790727200; c=relaxed/simple;
	bh=RakvmJw5IkGbBl14MJEb5sEKCKJHoqcetMUQUhf3ra0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LckyzP3Z6xCQwvenZXRh6qOWPlEMBKHxgFs4vuc/vb4leqOTGuRsDb9jZ0+0GJnw3m/7SQN/Z/DjsTnlwSckMAmmRM1mxyUGpppYPAZ1VGQx8ATTEybk8wznNTy13roklXmDGlXTVdbHLxbr2ZYWuQMOd0ZaoLRk1+JcQUaHckw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kap0kCJA; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kap0kCJA"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffe281cb1so22841895e9.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 17:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790727195; x=1791331995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=awL/I0DSNdektaGl90hrS+nSMvd7q8sCEI8KJnLzrw0=;
        b=kap0kCJAX528IJO+GW6dPvK24rf3SvLfHvjQTdpRLGoqUq1FkQ0sOpgEaYaB00PTMP
         gpB37c4nVU8suJbq/y1pV0NtOiNZjqH6G28/6AmC4xFCjiY1zJSGi6oWBVYW60+NeDfT
         /uMhlYWGNcDoeactWu37gR+pq9A6kFHqBIJD2D7IXMpEC3hwtms64WIECEbYJIi97e5V
         oFo4aMZwHtpaj/cphEJOTEXH9GB6wifbnH0LqnV69rS5vLpL6tCC2ILGWbo4x535HbTe
         gVHx9VOWpenbNXoNqFuC/In+S/HUBdklqeYPLM2LEepNtSOo2wPoah+bkR6YXSWTI6Fo
         MRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790727195; x=1791331995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=awL/I0DSNdektaGl90hrS+nSMvd7q8sCEI8KJnLzrw0=;
        b=vRHQiWhh0L58uqsyBJU4byNF0Hmm9jef6bRAj8Asxwsm3FrAwb/1T53gJJM3YVLWTT
         tCOci6/r8hg5OThZiEbC8+pr9EuF1p6HJAMBUMga7StmB1XJHVws5locVeKX9HZrS77w
         UGa4zdPx8oDXeai7MiO7a48WMrP1Nn+b0boE/nmViKcx/nsVyk3mxfxsYkebyVxIiWkH
         MLWwUduL/7FhknldDpAoohVHrTzQAvqYnFggt8uKC2U7DVigXBQNINB5UGBMkXXrX0Oy
         BJbbtpi5caxEpwk6ZkTYM7RitVgi7apR2heAgaqtV6uM+0S0Eoqd7GcSDCSc0z+yQd0w
         bHoA==
X-Forwarded-Encrypted: i=1; AKwUvByhgrrsbX2T7o1ae0fe8GUfYtR1d1AbcwFeczpvGYUOvGHq+5uPWXLXUS31uo72zX3OmsVTPgKbMoQ/@vger.kernel.org
X-Gm-Message-State: AFuF++kNbXrfgV8bSeUzU7zZBbgpKn/lEm5D3Y0A7A3GQlDo/X9FeB3v
	7lK/HXltFcs4vpllmWMc/H1TXZ4XdSU2/5H45ZzHxJTO9QUY7Mfpx7UvWyaIUxMirhs=
X-Gm-Gg: AYBFou25wzO8+sVKsbUISIigrUpuliquxoW7giTJVuDrxneRUGgDnYMKch8YuRNIMtY
	81t813XxWx9/p4PcJLaUMvY04eXt0jPLVNhStP2lUCZPIbM1JsgJ+O+kk8MznsqLZj2gaWnqta9
	M+44JdYSW3TTrmuKdWs/xYoKBhEE2M1cnmWco3ub9d02Rv8mtURLZVL7X1cT7U3A2kmVQgUIDCJ
	Yyo0szjaP1QVqv2KSwz83FHsgHWqXU7fPoif9G6i6+i/U97Kh7qDXpQJABUkXnzYWI0qjFzkBY3
	LAQRHjnsO6LJccvbIa+LxTl/i3dUjQB9kPl/+lNirxyyTlyULF33p7jbHZWnXYJhBQJYE7iuVx6
	GVa7DqnSOu4wh4odLLOugISOXFkVrZ1eIbiYICVP1QJydzlUvJIEK2kU2tLoakT+BRXmISfDuO+
	gg8c76I9NdZCYqRGwoiGyrU/P2xCIOj7cUjfoEXMgRDaJuSCI20i7YTv5shyZM+2JQWmCzrIRv/
	QlzKl1St72EybztSPm12qhDBqRNG7xiC30x1CsXzugN8lbvi5kugWb7tk/86g==
X-Received: by 2002:a05:600c:4fc5:b0:49f:f997:7ed7 with SMTP id 5b1f17b1804b1-4a01503ca46mr9945865e9.11.1790727195101;
        Tue, 29 Sep 2026 17:13:15 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a015a89ffasm6320635e9.1.2026.09.29.17.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 17:13:14 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 30 Sep 2026 01:13:00 +0100
Subject: [PATCH v7 5/6] MAINTAINERS: add Exynos850 PMU entry
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-exynos850-cpuhotplug-v7-5-203245826333@linaro.org>
References: <20260930-exynos850-cpuhotplug-v7-0-203245826333@linaro.org>
In-Reply-To: <20260930-exynos850-cpuhotplug-v7-0-203245826333@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
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
index 137297bf508b..810111c83478 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24622,6 +24622,13 @@ F:	arch/arm64/boot/dts/exynos/exynos2200*
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

