Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C783F4101
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 14:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161688; cv=none; b=cfqkbxcxPkml6a3heua42qqTwsUtzTikv7yeGpfJEkcz6H1dqnrRz2eG/rv4zCLOXMpmIUE8a3WpWXjRWgTXUeyM0NRqc24CBm7aiTuWf/zFwoyVlkUC0ACl4hGCV+FM/WzgVsjVJjPsxuxPZAZ541+y1k2BY7wqSj4mLCcRkkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161688; c=relaxed/simple;
	bh=rQYMzDtVh44VYgzn8ZF81rVqoyDsHoJv3ovI5wxNPaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lXuF2zbL3K/ZtBhjK570M/YzhXF7V0r+9zN3pVoBsfKNrXsNoV8m4Iil6yYC2JVveUf7V2bjbieclrbYbQ1TTXfpJsjzPDgmrGxWYYbNOUm0KoEaTazB8g6lMMmSdeC3h01e02rkXgxIfXozIV8zatXke1aOz/lTjRiOnsOHnIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ULH+ggqs; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ULH+ggqs"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1d665a5efso264015e9.3
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 07:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792161685; x=1792766485; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pte3u3WxOgw3Qgy52tQrveaoQhV4YTR7h3cZS1HtB1I=;
        b=ULH+ggqsHjUAOiZdLsxQxRGfbE7CedKqmY0pprZ9bw+KNwL/ajYt3B1CiGPSvzlE80
         vvXIIh7Rlo+lowlX+oFWptW6aGwiMEDJ9pQLNplMqCF2vsEW+9WRjAWHSRSldB+OuWqF
         /CsfJVzUUlTLRdmUzPNl8j2+N8PfQWj+fzu3Yk6m5/Zt9QuWRZzEzmcYUfhBEbEc6qqR
         jhet7+jBjwQZi+X3jAk78ikLIroOL33chgIFHqXJ6XCG+Dl05UowFKiWxrDtOCus/xw6
         2ivxDfS7AJx+zrp4iwhoRXgLxn3BUMgwUcwBnLTTTXEsIWpGY/JZafApO5oj/h8N06u9
         xNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161685; x=1792766485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pte3u3WxOgw3Qgy52tQrveaoQhV4YTR7h3cZS1HtB1I=;
        b=zCf/J9bBdEp4JIY96Q8JIbr7NUDcBPjm96p9TQtTpfb+/9MpQWT6IXsbcNWs0eZxVP
         llvz0O9+DwSAT3qz9mwSaChEKuEOtmaZWU0h9AY9rWAf0VUzfUBdI2te76tFAL2bM/n5
         /y+gIPrYS1aNx5gn9f4uxlplKp22ZxNRiH392xqIK5183xGMKtZoZCXusLtVZNtbECy+
         Sxd51JGSTiJHF7tn4LindLYxiU11FhkvDv9a2zE91juoUpa9qrRp+SnUQtZfzsawfhjG
         4ixFKYoInMXmQWBLgE7ddJYKZaJt3KkLkXH8kQkTBb6lIpUZVMWpUPx9ssiSJ10DC62Q
         gjWA==
X-Forwarded-Encrypted: i=1; AKwUvBwEGqsrTzNf2BQB3TU9J1vZIZlyMKaQtWrWK/1TQZ4YLJMQ4BWhVmtucJF0BPHyAr2McOfl5KEbh8RS@vger.kernel.org
X-Gm-Message-State: AFq9FYIILRXtwgTbFuo1crtMMvKIcVE8waqIhC/wNO70HV4FAidO53+i
	Ce+/PXxTatiW65xbdyCm5L7PJYRNXigl+SLb4Scu9ql1muM8gB5NAj1Ldj0O9PmbexI=
X-Gm-Gg: AYBFou2B1vV+Yp/ywf/ocn1qzD4mN5EXBY2IfTNcJ486gOcpRpjqaB0Mrycox56VHcQ
	dfdPTcCOiIwkBMS7I5HxVSlSNTjnRyhbzZwSWuX/M1o23RCXYP4JH5lsqLaPPgvK7l+yPUCnZcG
	Um448EnMB4d83GZGr42DlJJI+1upfTs2NcGuxY7cPFvFlnmLlewUc5Cczpqc5BKiqUDCuxgJ7y/
	x4qmiYI+sizKCFCb9h6wcZKcRBFvf8e1ViU0MaQ+TcwhY5DMNhQtfTB4FxTObmQiL29JfNkBuKU
	iSVIw/D25WHafjOSaEh4fDZXo3smmrY+gEVlEhuunhq4V+ESFfVGgWVD7ykH1CfClneLfLuNu8t
	DLBzmczMZrQByU/XpIKjH2MNPx/enc6zILIo94K/wUEAzIF0HuFoI6omulpedjA54YcyAMcYERa
	n3Jr8b4/tMlA4jTkI1bPStqqU1C5JJK92eApoRUmgcHQQaNkuQ72PRirFqtyBmRYfIWVpbGjY02
	wQb2iFLOekwjEjPSZlMqCJHK68IyfCqGLwt99VAH7DmIZ6Am7B7ClEaBOBC3fDeA2UIUA==
X-Received: by 2002:a05:600c:1394:b0:4a1:d492:1604 with SMTP id 5b1f17b1804b1-4a1d75f2524mr381415e9.11.1792161685121;
        Fri, 16 Oct 2026 07:41:25 -0700 (PDT)
Received: from z13-ek5.local ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ecac3sm5949648f8f.27.2026.10.16.07.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:41:24 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Fri, 16 Oct 2026 16:41:18 +0200
Subject: [PATCH 03/10] ARM: dts: omap: dm816x: use dedicated SoC pinctrl
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-patch-ektor5-dm8168-dts-v1-3-b4ce30217028@linaro.org>
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
In-Reply-To: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
To: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Linus Walleij <linusw@kernel.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792161680; l=991;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=rQYMzDtVh44VYgzn8ZF81rVqoyDsHoJv3ovI5wxNPaA=;
 b=3S50pMz7zQmvtFmL+2YZ1KgPdiCvRypjaxgUOOH+3aWGkFuLX2ipy1EzPmzd3M2yImYr6voQo
 syqhbr54WckBewNboAWAqmAJKY/GJNXAurDQYOCbAHJZBNcilzj5MjP
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

In the TI Sitara DM816x SoCs, the pinctrl configuration macros are not
identical to OMAP2/3. They are actually inverted between Pullup/down
enabled and disabled (third bit in pinctrl registers). Using dedicated
DM816x pinctrl header to differentiate between the SoC families.

Tested-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm816x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
index ee0090f7aa64..de4d48babf77 100644
--- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
@@ -3,7 +3,7 @@
 #include <dt-bindings/bus/ti-sysc.h>
 #include <dt-bindings/clock/dm816.h>
 #include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/pinctrl/omap.h>
+#include <dt-bindings/pinctrl/dm816x.h>
 
 / {
 	compatible = "ti,dm816";

-- 
2.56.0

