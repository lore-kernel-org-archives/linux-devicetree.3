Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24383A785A
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 17:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776706820; cv=none; b=X97XFVVMAUb0nN0M0Rzf1mS7mJ2N6V1Aa3FIVPLbjXdPpNQMvAvyj9+X4cUk2iHBUkUlI0laceq1+vDXR2AG2nS3f1yDyQuY7DI+JkOUWfh3BYZgSi81b608XOuK/XaHBppAKiSF9o3wTRUMWcsqrEpedIj5G+tdIRyR/73ZWLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776706820; c=relaxed/simple;
	bh=utGmC6SX1f1tsmdJMtEQdtOxlDLzgsEsYQAYl4X2W/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uw8eHGgulDlU5UBVcbzuzVWmUt0akWqtzubFO8N5OrxDxyfNy9OZSPzxFAh6zoPHrkayeHR9/TM+i+4wjiKOZQfEamAo4bsjP5eMJAt0ez3iUbIWnkEXJO0/UJxzDCGQ/LKZkeb05ctJmJFxMdjUwRHpeXYR++gXp0R0ktsYMy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sDnjBrPB; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sDnjBrPB"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so51848385e9.2
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 10:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776706811; x=1777311611; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=majqoFYlSL/xq0vEC9MR4HUJoBMpHEo2idjyzWrGGo4=;
        b=sDnjBrPB/7kBQUTlQHDyyMfhRibaGFCdQDG1TqlPH7QPloyKH/5o28pLAncaD5/zOy
         Vdw3QuwL4ht704Vh8XhjBdEgAoR1B/UopTGLC44rWAUSi8MPLwuxBYNNiI9qMzS8EB5U
         1VCNhIyUeJwy8d3wRAXeZmI2tAU9jst1uRDcWtTW5o6d65KaHFMZomtKMXcsPgl+Wn3u
         FT5EkZNr7J+4H4yT7onza0IUVPFiEDuQaTC9UeANDutohl3Vhj0ksv+N98B36CbrVTOs
         MhssuUb3gjcb689XNsYf5+8WSt8/6RndynAYKMsHs/e0UXwkzgr4PT8mDwK9QbpvP9Gj
         zMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776706811; x=1777311611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=majqoFYlSL/xq0vEC9MR4HUJoBMpHEo2idjyzWrGGo4=;
        b=n8LLuxVMHr1/6sJqn350QESZGVq9cIGe/IBwpd5mS+h4hJI0Kq5hILWllcw/og9khZ
         8aNQO1GB9MGBk6y3D5kYunSCoXHCKZhsHNfJNsBpiWiK4U6HRQqYx/jXmSd157RPY6NG
         7jIhTCn8nJjl6t5eKXGsvZcd6MzYbIdfTfn1i2yRBHE1a1dcatL8g3wosLvtW1HuRcty
         bbaM2bLdZUddyXbQIEj1zJl55arUZilbAsxAHbeXCiCJHqe1hqwsi7utdjM81WHvg+dk
         9gSjxgYnVlpoxy145grPTNEPFYflW4/aXrqQ5/ezO9U+A7NQkSM/s6BvDnwMG+L67/Vn
         PScw==
X-Forwarded-Encrypted: i=1; AFNElJ+vWGROddiZFXyUW8sEtKm8Rr7SgNigzGFEN5S7yZSEDbXYtgTQlOICQRNSGF4ZdwZlvv+i7sGpqHYE@vger.kernel.org
X-Gm-Message-State: AOJu0YygkLx7KEzHRZwvMzBLcneLZywBTHSsuzp7OvE4WpzXDz3fgdYC
	PiluOAVXJcYvNrEY1EM9JxFpSch6EFLJ4IsY9E4sFtRdNzCRScb4VNEv7FIAr0ePp8k=
X-Gm-Gg: AeBDiet7uoc44qXpEf9FJ1GBs5nJx0XF/+fBR8Of8v6WkqNVqaUfcljad+fbkRRFZWa
	Y2pd9oeu7/G+tDeWBWAJC3V2eli4La+8HB7SeLCpdBzc+5zXAKxtGes6TMnTa6Q0oho6cgq5TCa
	QSw98181B+lvDcpDeQdorfaIlr8nexhKdSHDwT9NRjvICHqunInpRFnsnPT/w9hB38I6wMn/na/
	Api3U6Y+Em1ULGxlNDb4Y+yy+sHp9yhoOCyXb/UrwhTM6qPAOZa6UH6P3o9LqzuLlKzBjx+EV+s
	DIG8H2oTJ0HXlRo/8jPeHZhjnipCgUj+JVlw5LnK2Yb3QpUx1B/TGaPwOh1rgIg9Sorhs9Vjf2i
	KRGp73Oq19PqGtCZjZiy7wZGaMBg0FXfj6oPLliUOPIMf809pwU5O1RVyJNzMQCuCHqApEBTbjf
	pjxyO9AhheR5tWzqsYJMUrqjJDP6qRBw6l1xLdJ3rqixI8R4Qkji3r6AOPpf+TrFoiVx3Ko37yA
	MHkQ84n9I3yGo4cZg==
X-Received: by 2002:a05:600c:4f13:b0:489:1a65:dd6e with SMTP id 5b1f17b1804b1-4891a65de3emr95027985e9.8.1776706810700;
        Mon, 20 Apr 2026 10:40:10 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb72d365sm144280285e9.1.2026.04.20.10.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 10:40:10 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 20 Apr 2026 17:39:54 +0000
Subject: [PATCH v3 08/10] MAINTAINERS: Add entry for Samsung Exynos ACPM
 thermal driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-acpm-tmu-v3-8-3dc8e93f0b26@linaro.org>
References: <20260420-acpm-tmu-v3-0-3dc8e93f0b26@linaro.org>
In-Reply-To: <20260420-acpm-tmu-v3-0-3dc8e93f0b26@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
 linux-clk@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776706804; l=992;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=utGmC6SX1f1tsmdJMtEQdtOxlDLzgsEsYQAYl4X2W/0=;
 b=ksF38PEKxEj8F8BXFtqnkVgT2aWgmm/cCh2qiLZZuahhGr02+y1RNkzFa4rchgDi3llZx0f89
 UBd/cw0V2JDB3Hr3mS1DuYCTqeAFm4+ZK/GDr40q1GekCyBRI6bSKdj
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add a MAINTAINERS entry for the Samsung Exynos ACPM thermal driver.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 76d8291237be..fa67f6f449a7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23676,6 +23676,14 @@ F:	drivers/clk/samsung/clk-acpm.c
 F:	drivers/firmware/samsung/exynos-acpm*
 F:	include/linux/firmware/samsung/exynos-acpm-protocol.h
 
+SAMSUNG EXYNOS ACPM THERMAL DRIVER
+M:	Tudor Ambarus <tudor.ambarus@linaro.org>
+L:	linux-kernel@vger.kernel.org
+L:	linux-samsung-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
+F:	drivers/thermal/samsung/acpm-tmu.c
+
 SAMSUNG EXYNOS MAILBOX DRIVER
 M:	Tudor Ambarus <tudor.ambarus@linaro.org>
 L:	linux-kernel@vger.kernel.org

-- 
2.54.0.rc1.555.g9c883467ad-goog

