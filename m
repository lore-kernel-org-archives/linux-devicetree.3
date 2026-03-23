Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F77A37E308
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 08:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774255703; cv=none; b=OX0EBouu8yc+grJc92TJ4BXpikpnLsdAx71dJZ7d8muR+cjml5875Y7gD+dUN22Srwj26ZJ+L1r8kvJGV9irjUeSN4HJ0p2GhIiGvYwJU3bdapVOitH1GsWyelmmP9SypSkAOgZchWnfeNIOLDJoZOZjGDrCOs/8nCrfSVWm+cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774255703; c=relaxed/simple;
	bh=bmimCA8H2hEtE2aKOouwiZmcnAiFz588K3Xf0CNXDqM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XfRmiR1AopkdM4FKzZTCcj6ryGwGEBwri8YN+in5EB2Xgbl6qTlkVYn/5LI3RrVYDa8lDpQ+8O+7eT0i5w4w+OhXNMsq5P65Zk78avB6bFWy2spGCi4FLIhjeWoMfiAIkrrxSnQpWYyD0DXhu7Lpp6f1beQ0+rWz9BAZ+bvgAw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WFnCvu1h; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WFnCvu1h"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48700b1ba53so22332285e9.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 01:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774255701; x=1774860501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+QzNDirO+Pun9y4cnI/mvQSADsIoA51wg/5R1jcim0I=;
        b=WFnCvu1heq4PUytdtxiBRWjHCpiPK+VjUSmTtQHNEr0wq870lhalNOwsC+xhBvvZeL
         Wb+8V2Phudo9GepywZrp4HLJHjSz0e4uhIcIMDkslE9Wy0FnBv056eQCDsMwJP14EAKq
         giTYEvpKcWvre3cKKrKJ+bqV6DUuWfFTbzarD9VhCLkJbF/iT1YKPbiTzQW1BhZSxgol
         rbisDRGUaLl+N4FTkrmyICOHX79AhtnbzHzfkvbRdMOIHxY/pJApBT5Qystbv7QSmqaC
         GQ11lqZO+ZBbOOX7+rIyKN34WgAfP2NvNMCp9fVkVOZE+n4ejF/dQdADEMSrl0UjNGuC
         Ujqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774255701; x=1774860501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+QzNDirO+Pun9y4cnI/mvQSADsIoA51wg/5R1jcim0I=;
        b=paOYUGWDdXidLxSE1dYzTxMdYG4ZC6QtRGeTU6bwoKNzyeMvIR0szh6m2EIOSktv7o
         iIR+FmluJJRx4AmoCpEJZKiKn8UVWWUAQIac/fLm5jOY6oknH2EiRIGg10e7ZSokUB3m
         //WErcQnhNkcIt5iXADUdk81o6o6/gKJjxnyxlZxEsOrECAX1oKwjMucKEfcr9Y3kKTr
         Bg3qaP7WrNzfr6s2/ei3M6QOtfJBR0qLRmKKz+Khhc21OWFgCzPfs7YBUL3iVRAX6uvc
         xReOg+z3qpbZskcF+OdyI2P40WDaW+0GBfJyL/jjWlnz6yR4W7XI1PmXHUk9utnxF9WA
         wMqA==
X-Forwarded-Encrypted: i=1; AJvYcCVa5FkBLqb+KWIiyjSSsiLOk4JVrHXi/l+6Ptlh2Hyoi3i+nWVi3e88IIfRaWzsejWtrcl7Y9OYDmT1@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxyfy/AuTaThVnTgrGcLGDWcdOmWkoPW8FIJeUM+UjDacxiMAa
	uzXiNLKpVLToocZ265GCWoBkp30Uc+Qf2IvtgCcX0PW3uFqswfCmjj+H
X-Gm-Gg: ATEYQzzn4vnJnM4y04r8Fu6nI7V03+iMYcazzm59mLocsC+Lc382Q6SsByMhQbtQTU7
	48gzAPNoVndamrqV6owr/4Sjsq/7MQaPIXGtoFpsUl1foi8x0XhEHI5C3wACkUNJeEs+BI5qsRF
	m/1Nqdujns+edJpSCAv3zAT8OeOrJUjZJT+WbljUOpIOJoseJ5KdHIG3+Tsf3irPpLC4K2pdq6A
	a8lhYFV0E3umzz8VF3zBmyeb4s3vt1xtTRvYSlD4QsNiBEK7cpVGUY/CN4VLkWFswM5XmixOfwX
	nYAe1JNiaL/ulZY0Q0XK+1KJsAG62nolR4IK+pcwM1gUxMGbZ+0YkCPTxjEH0P79/5BAwREHjZ4
	Smwqn8BeIRYNbu52KzH8Eaz4iT9blPWm9FmFbfY2Xt2tJxowVa/y7LFENzEK7aKMhTusuYtH7UI
	TVZ9eIuwtFBiEH
X-Received: by 2002:a05:600c:3b10:b0:485:3f72:3230 with SMTP id 5b1f17b1804b1-486fedcc4d3mr161337325e9.15.1774255700647;
        Mon, 23 Mar 2026 01:48:20 -0700 (PDT)
Received: from fedora ([82.77.79.23])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-486fe8367d8sm316822715e9.14.2026.03.23.01.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 01:48:20 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	egbostina@gmail.com,
	d-gole@ti.com,
	m-chawdhry@ti.com,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] ARM: dts: nxp: imx51-ts4800: Rename wdt node to watchdog
Date: Mon, 23 Mar 2026 10:46:13 +0200
Message-ID: <20260323084616.10469-3-egbostina@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323084616.10469-1-egbostina@gmail.com>
References: <20260323084616.10469-1-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Technologic Systems TS-4800 watchdog node was previously named 'wdt',
which violates the core watchdog.yaml schema expecting generic node names.

Rename the node to 'watchdog' to fix the following dtbs_check warning:
'wdt' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

 arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts b/arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts
index 5118a68db..3610ce395 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts
@@ -155,7 +155,7 @@ syscon: syscon@10000 {
 			reg = <0x10000 0x3d>;
 			reg-io-width = <2>;
 
-			wdt {
+			watchdog {
 				compatible = "technologic,ts4800-wdt";
 				syscon = <&syscon 0xe>;
 			};
-- 
2.53.0

