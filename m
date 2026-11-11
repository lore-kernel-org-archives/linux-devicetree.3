Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794404993;
	b=Nglu0S/8yUpCygfKXXpz8olT809kzqLDXmGSzdC3Ul/CAYy8MZI5iYf4i9VoDxHPUjB5
	 z9qGO49j4DMlaCbYQ86MdcEbJ/hCHyM6pR/QGY1L/HkqXUP7QMTV2lLdq3KpdscVCHYDK
	 s9zJTZtRvNP4JIO3DjcflnMYXP9JmMIyS6RxlyCZ6lmSYzYuJxdKTM/w1mAkL7grWzbNk
	 4kSqp101wYQUL1288GByvkNsrQXVVIhORuKq3CVr1QqqhB/43i6FKEknWR0LKPhembu4P
	 tKAH/hQGETttGG25SJGRKFWmIKvGjzDR/6K/jE8gBZMHf5bLOipaP4segWBgalKsR5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794404993;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=K5vGCoq82de48Tm6DcVbUfpg0uUXTUpd+UWgSwr4YJQ=;
	b=4bOQDnKyqn5HPcffQ9cm1DwCtgTnFHoaTco/+KSkGmQl8PCE6B/H+PhClqH8iuazHou2
	 y1btwMHSkEyCnE+Xq7Rt/328I1twvy2ub3gGayv0+ldHf+vjcN51Ci7wcZEl5uODYOT4Q
	 cMbR13+DKM9JO9+K4KVDjBWhNnIuGNWvd1vlCJYwy5kyxX0AqMcnPPWxhkj5HeiSw4duM
	 wU+CywjibVX+W+mHGkUUmYAb8kYTBcl7YO0/WpdrUAdBRu/082x3AA0hfMdV/xXmaZ/LM
	 PFPhY/P7POL5nANMQnP5Dqhf+BsvOmOGVhVbkq6UxdWBBSs2P4s2snQrvj5EpBWInTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pYQ0BwmB;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7FB60A2600
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 13:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F7FB60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pYQ0BwmB
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b0d126f631so32987997b3.2
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 05:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794404992; x=1795009792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K5vGCoq82de48Tm6DcVbUfpg0uUXTUpd+UWgSwr4YJQ=;
        b=pYQ0BwmBN7j5F0+YO5ZOHBIKoZJO+i66S+uz824Tgp+USMufWqCV02G/jtzbLe2ne5
         qcHNff7cYToyTlPepLeF+k57sUBhSp+woJEYkV6Cg3LgWw/tpJG+fsHa0yVZL80RmxTF
         YXqw5VLwrM2Z58VqYYbevsk7ywDlppA/a167OLd9ZB7k1Hh1dPEjLbp9JvA1W6/lBXNL
         2xh3RK5sEsVFEoJwgwWEGk0l0YcxO6YJnPMPmK6JJwwmWp1p1VjBv5FJ6QfvPk34izPy
         J5R2Il2nshrBUDE/4euIhIlJXXP7YyZvUMHoRWByHsFPNPB+YsTuppwlHrlWEodUuJNS
         Ahsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404992; x=1795009792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K5vGCoq82de48Tm6DcVbUfpg0uUXTUpd+UWgSwr4YJQ=;
        b=ga1prBzoGLySzBI7AE0eCE2E1w7tRWNdtU5gAxORW2Of2rZrrM8SvF0TR7IOiPgnuh
         JDkRfyWPuZNq6wUz4Mckf207IwwHDrcxdAqZ80f5szcoR/KI1ozuv7bhdfnvKTeBvWJd
         X9oJrH6AYCp/aRabL2JScRNB3zcPLuFQjzVnRmhITQPSiwYMCVSJQxiIjXTahQWL7jIj
         qGeg2gsrYeDdZ8DFL6vrjcRYlQmQ1I5PrcPKtMSLmL8sFfzt22WkOM1oW+SoUh3sPnKT
         LHEGn+mE0fh05VZxDLdJ1crH3LU+9MMB6aF8YjLz5G1m7VVIfQ92nMD8gKaNNh0hYjKJ
         yp5w==
X-Forwarded-Encrypted: i=1; AL+hErHsMa9kHvurSxD+YDpR5WWMlC4prgDWCNzIoHJy2uvjzfEVSOucZm5m/qmJmgAqVIVUJ368JimEyX9R@vger.kernel.org
X-Gm-Message-State: APuU4Z98Kpnllp8GIOu4KyMVi2zrhHiqK6dJhxY1dWEYXDvMpTpC6KfV
	XnF1G5F+HZSnuUZ3XSl1nD0DZmZrgddSMgeIn8X5oamYRcUJEwvTimY+
X-Gm-Gg: AYBFou1r60vC8FR9vY5VQG1p41p+ADg+8q2NPuIqo529KorzDIz2xHoIgceB19tfmwE
	FxgaeqsmYJ+aFiZLfmqNZo4t4m6OuONXAkYOY8D4OmVZt+1g4dtp2LwengSi84pmYAhzpDYqbhQ
	FmITMggdsaB0N0zYAWPkZVvMBi1dRp2apesqHQKMJxqtmtooAt8wzqCribDAawn0kyn7cOR7erw
	1lnqm0wU2ILV1tzYQoDtXdOv+komq3khn809ozh1BtuHgxkMqjRd2xCsRkiYrD3tqC4LguEMw31
	yvBT48hyH7PWRZctL+GP2/3UCInWeJKBwvcmL7MDYtHOvvF+tX3usV6DG3RdYHS1evYrehpE336
	SkeE/D/aqMlstknfHpgpHe/iUbsL3LuD9bNIcccZHTAtwjM8KhGo6fRIdc0D3oC19iJmle8aROx
	L7fHHFu4PeUBqxDGJ8LB5snGsMEiErqupoGoLmyURhZiBeobRIUGVc1kAzODQxYAizijTs10u+r
	I/kBFN3Jqrz5ka7APGxL7Sx0anfCpklYPNJFLSRofeyOOh15/tD5C3gQKiWXp5oFNvDmU6TuUMA
	ewCJOAOEfXAAk2zUnVgPFcm/W+Z+bj1l7JREQK5bJ3aznJFX3vsW39lKpw90eQ1QaJ918w/5sQ2
	w27huwLBWlEwZ73Z1ZXPrOyyh0lqU/KRSq09QS0VcC/B8hRABZYTOs4bXr4RcIHifclzsGUlmww
	U=
X-Received: by 2002:a05:690c:6989:b0:8b3:4deb:7cdf with SMTP id 00721157ae682-8b3a7fe512fmr20947607b3.22.1794404992067;
        Wed, 11 Nov 2026 05:49:52 -0800 (PST)
Received: from MaquinaLab.. (189.27.147.77.dynamic.adsl.gvt.net.br. [189.27.147.77])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b393426f13sm44519817b3.34.2026.11.11.05.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:49:51 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: allwinner: sun60i-a733-cubie-a7z: add the user LED
Date: Wed, 11 Nov 2026 10:49:17 -0300
Message-ID: <20261111134919.90264-4-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the green user LED on the Radxa Cubie A7Z. It is driven high
by PM2 and uses the heartbeat trigger by default.

Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
 .../boot/dts/allwinner/sun60i-a733-cubie-a7z.dts     | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts
index ab3d3d70f9ff..5dee2084906c 100644
--- a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts
@@ -4,6 +4,7 @@
 #include "sun60i-a733.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 
 / {
 	model = "Radxa Cubie A7Z";
@@ -18,6 +19,17 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			function = LED_FUNCTION_HEARTBEAT;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&r_pio 1 2 GPIO_ACTIVE_HIGH>; /* PM2 */
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
 	reg_ps: regulator-system-power {
 		compatible = "regulator-fixed";
 		regulator-name = "ps";
-- 
2.43.0

