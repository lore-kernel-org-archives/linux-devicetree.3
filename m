Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41C039023C
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 08:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775636425; cv=none; b=QvEjkel6aBgcSpSWESmf8SbN3amwJIDY+CX1ys1xexp68kPPXoEUxgJBDK41rdtmDXhrMOZrdMnwj0m+kMG0/sg05CPO2HDupQwRPWr2+hBK6gxd3LnKf6lylEfCAIKP+v7bB7o2F5roXApOCCUFquAzUwiTIPSVJYUhvK7/Fr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775636425; c=relaxed/simple;
	bh=gtZfbxKRElMEZn8O6b4BlJRIdwl5gp/hWHEN0k3wwbw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AMy1nlVmz+g5qPjasPDL0MrMu8uL+GZIghwY6fnmMizJIICLUeb9rwSgFQ/IyKDEtLCSOIkpNIXGs3rJC5IKFMlRSg831KElWxGRULD1yLjbiRhCL/ZwFqwIz01pQe+q1s7WbSbW0DEsb7woYJLmM/4FKkgA/xBAc++9Syo2nh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=z8esgjH+; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="z8esgjH+"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43cf5d14d6eso4789695f8f.0
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 01:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775636421; x=1776241221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VRd+Civy+geLALzWFHgxsIesA9wBU9+u1x5Mut66okY=;
        b=z8esgjH+Gh3qIJaW05xkOEePSjAm895g8ZL0T4OekOPmHQwVIx7D5hlTSApfkA5R4b
         SsfmdI7dXVi91x/7Icu1VaPCz9OrOhGZPjSkpNyxJ7rpgx/Inx/zT5m3PPOGYUyWqGgo
         oI99geuB50ZWhKb9Kevjr01KFpg+wBeONiWSpJu8GsJsI086DVENyomGubXUf98OOzYz
         QL4NPRd7u4LToomxEAq9AjEynX/ZsxMFVLuM38ZpovMaND+d8Unj1vSCgAQgbgYtZIec
         /ICSB4tAbjEsYVjyp/FFT1lkFvzKgPPEiX7HGHCgIezp7v4zldFOEiHxZEy1g9Lswav4
         FSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775636421; x=1776241221;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VRd+Civy+geLALzWFHgxsIesA9wBU9+u1x5Mut66okY=;
        b=VynZ4Lf/d/2UIEO/0a+RmEi8fdwK3nXW3usZC9obd5G+F87GjTPslWZ/fbOryT3QOp
         reJf5p/G/2eoYEI3vT/fJGa+p1mHg8vJa0gs2C80ZgoaTVM3WwDrCKe/tLZP+MFF5AQe
         pPdkBplnJYl12ASe+2jkPNOJqseZMncm5ijl5AoucjnIhkcIyuOnzpPXgkadbS3dHy8t
         lb+qPxsBJMsBOlHm2XZnFpV4AeW/4Xdt7zv3yZUH5FiTfz95aZ3Urpa60ta9AagU+vR3
         4b3own+TIyzJ4Z6mSTJY/XiIfbD71LBG9wo57OSTiq0ig7MnOxt6i5kOoBFPqr4S+OkM
         om5w==
X-Gm-Message-State: AOJu0YwvUO9JDjYRjG5bO71slak+cOM1+Ffzrp3Umo3LQm6RzqwR3ukU
	JN465NDOrQfMQkebTLUl0np2w8rHqHkzRhYAR5DjEC8ejHY6LSEUUmmKE3AnKBzHz9E=
X-Gm-Gg: AeBDievGK37SqUCyeAz4uCsVxIiVF/npEojFvzmEXDCJhS2C53WpAvVTWt67gNT6sBu
	PSdL78El/VyEirPXQ0HBm05dLmQfaKuT9tweYjGdOAqorh/ngNfeYEztbPUxYfT19k94l8IA+tv
	djBnOTbxJr/8196hyuCtviWkctsoG/V6vedZPyS71ga5SMziw5XUBaT90+cea6Ni2obJvH/RgAt
	illDFEHzToiuCObP3geWKTtcN27TSLOvBUs40SCtLAFwdWhjOJ/gQwHAvR4gy4aquW4BYJAqR7e
	EBz8mHcyFKNjOd+wOa3wns62W+xVejHN53HQ1uNvwgCB0wIcmPn8x7nyN7RFg3QBMQodaPsbITP
	OW/ik/VCCXIsrhPEVOyvV/6IZn9arAzFC0deusCKxEMvILG6gWssajwR/m2qH9jahEdQzoeu0we
	s54+HKy1msWGkY0VpQZEtI8w==
X-Received: by 2002:a05:6000:18a9:b0:43c:f90b:5663 with SMTP id ffacd0b85a97d-43d292d4753mr27905582f8f.37.1775636420996;
        Wed, 08 Apr 2026 01:20:20 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:6715:3376:7379:78d8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43d1e2a6f1esm54494851f8f.2.2026.04.08.01.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 01:20:20 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, robh+dt <robh+dt@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jian Hu <jian.hu@amlogic.com>
Cc: devicetree <devicetree@vger.kernel.org>, 
 linux-clk <linux-clk@vger.kernel.org>, 
 linux-amlogic <linux-amlogic@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>, 
 Ferass El Hafidi <funderscore@postmarketos.org>
In-Reply-To: <20260326092645.1053261-1-jian.hu@amlogic.com>
References: <20260326092645.1053261-1-jian.hu@amlogic.com>
Subject: Re: (subset) [PATCH v3 0/3] Add the missing mpll3 clock and clock
 controller nodes
Message-Id: <177563641892.1659838.16115307647051827681.b4-ty@b4>
Date: Wed, 08 Apr 2026 10:20:18 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1

Applied to clk-meson (clk-meson-next), thanks!

[1/3] dt-bindings: clock: amlogic: Fix redundant hyphen in "amlogic,t7-gp1--pll" string.
      https://github.com/BayLibre/clk-meson/commit/6d6be1cca2c9
[2/3] dt-bindings: clock: amlogic: t7: Add missing mpll3 parent clock
      https://github.com/BayLibre/clk-meson/commit/87edca62c4f5

Best regards,
--
Jerome

