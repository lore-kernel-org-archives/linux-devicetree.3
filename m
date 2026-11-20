Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180286;
	b=KA3DPLUWk2QWjqe5RJXpwGB9btq4crBEl+eKU0LZ8dTPbl+23Yjed0TVup06zrd7jCZZ
	 Xm6sIBn5CaHIsGJgR+un0Qu01l3tLEZEC04WLAQbXn+m/k2yA3ofcuV8FTr28egF2hTR/
	 iC+dE9C9Iq0uRY2IKDYwjS2c513jSAUpY5EbVl7URG0fGrZikI2xLXoRD20j/bbZTVQls
	 QXMPjGLL3XXTJgdm1AlctsWH2yjrEmOJt3kaw6Dy5N/yJffhHX5CsOwhTYAxpPu/O+PjH
	 Y+uWck1GQkVSE9LLZBcxyOaenduASLvBnFhcwARkFX9xXHXkTHkPwFPRQZ/UKUC4MzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=PpEHmlaRUkDXxpGvranXTA8vWqHmYOzyD7cdKeA7b38=;
	b=bZr1iAvaVEKGahzxrUnNEiiBkuu2tYHJWg6cWI8mFQ2H2KVGwPl1c62Q4K0dUE+ekg3n
	 7nyKy1eAgklMygsmYSqfeGneTSbtFP7RI18xvRCfXsU4zQJMWOqvS+9mKAzCAxNpmbKbd
	 y30DKQW+zG2gmRH83JospA5lI2rGOQLkvJbAZSb8W+B61rPN+tOTiTnK/oFPTWu662tXr
	 57D+r3pcBz7EstJUTVP8mmH6FlYN065WRBUu5QJz8Tf3kvodVH64qq17c69a3YQjxEmSB
	 mBZIvt6sSsVlMZAXlThKArj9q9hXfeqjlOSuzhkheK9wyaZJwpcdT8Z2Qey2zoRJVvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GyHa3yO9;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A3260A3806
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00A3260A3806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GyHa3yO9
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so6633375e9.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 05:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795180284; x=1795785084; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PpEHmlaRUkDXxpGvranXTA8vWqHmYOzyD7cdKeA7b38=;
        b=GyHa3yO9XcmmXHRNWoSYegz5+DaD0NxLYkgoLQuVWReArzev9zK9iZUnF160zbyY1R
         AaYi2Kn9oOyjWn2ek2RAHVemv0qwJcU6jJ1J1ZCmoY0afljg/CCxcxPHc+6g0W/TP6fg
         KQcx1tovEgVuGDmRNTDRogw5sL37aBwPz+sFkm0ye94vNdsT6+a00o/Z/FC/Ey1BWcql
         scRKK0s7xfJhaAaZbjSLDddst69WUIGZ9dr3A1Xd5fv/sZA21LX+z35siG22exq760Oa
         7gaMmE5pR33kM27vug4vIwEL+F6z7Rq3JFSxJLFlrkQB7ePzP9GRY4YSdt+opRaVQuum
         Vong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180284; x=1795785084;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PpEHmlaRUkDXxpGvranXTA8vWqHmYOzyD7cdKeA7b38=;
        b=HR40JOzisJSjW+bv7XwNqt4m3JXrdjrQLBp2C04y7ldkBhNK/PIz9FcEHljZRc62oh
         ngvkuPySbkUC1VqvQ0xtve8+g4uMY9p0xiNCNLGocD8sNLDPzX1jMvoEDUOlXVnNjNTC
         AWpcqkFanXx1EXtKOHCY8t4NE35GzfBjdEQ+j3oKOu7f2wVqIaFXGT9vL1Js86OGYTkO
         PXF+PlkfMEsOoXtSMifhtqWoUXBOyPbhgvlO/qFjzjEwDfIhjigcSBTsO8V+d34nHQv7
         7pj5RhoNXR1Rmgy2nI13lAWVzTRydyzPo9UEVgJZoWssIGS5jDncph1wW4aQGzIQUu2I
         N2oA==
X-Forwarded-Encrypted: i=1; AL+hErEl2L5HfZWSAqEvCvPSAKP9UIWzeCqN7xgRCulPIWvRHHZcSlgjhUAHdvzAE+ldKNy1Bvx3ciPzmOYh@vger.kernel.org
X-Gm-Message-State: APuU4Z8ur8HPwF+4CJzfrOlpjsx7BCyk2sHMJgceZVMY2NmfY5R4b1kJ
	QkLMTwFF2Dx9fdlIRhS5V7eKlqLEILRcQgvOCQCNQnUaaukIHqI7HNTHeTw0xWb4urM=
X-Gm-Gg: AYBFou1YjH3VAFfafvgmAKebQQKPTWstDNlOlNg8hmTVDLMpIhXln2zjqSptqw2Nvxu
	A0PvhnVcZnIv0O/P5b9IbSCGR0oSjlckLC3ZJxKkLkVCsIvoiTzBpSHe4q582NZ9iS4JueVobnB
	k2GQ7iFU6V1BXY2opiznRRfdt0fnZCr7vbCRWT71wyWnnHAZCcAuLOK1hOORZ0Qy/7zZXEajRjG
	jSXx+dnRL7fvrEpIbMFF9+HETGzE9t75ej8PElIKrapNGHzGmAtnnz3YXYH4MJCQY+JD3LTSyuI
	GBtjPi788vDpegoFHRKAIolKVYxhs3d70f83mt6kP1EJntUC/YSYtrVyoAWGgRO1Q8TaAs2p5LK
	vPbq7h72WYN0cXvBKX3BoBt4qY1dft0LmC+woUCBPwO2wdGGjtsPHizuiQgLdpAahuRSFXv+YEe
	sTDPi/Sjk6HNKe9qURSoYGeuAFpcLLbj/nrhn9PCptWzkMS1FxLeRv6Xkuo5SgFtwRRAJWEi4Ni
	0tLYyE4l/1pX9tJCAGIkGnOTWJF2sBiZycpSwv70k6mTFjt9pzyxrrMcH7vTuvCEv8TwcJ3JKf2
	ktxvg455v81/kqlmlr1q+dOkkBSISx5t6GS3NZwSAKIjcwl70rDYcU4gVFUYie6kmvBB4wp45T0
	CuZrm3yAnPS9dKPEbYEFYjIVVAe6jlncj0XZMaNIHquBzFA==
X-Received: by 2002:a05:600c:6749:b0:4a2:d99:3171 with SMTP id 5b1f17b1804b1-4bb8881b52dmr64713635e9.23.1795180284211;
        Fri, 20 Nov 2026 05:11:24 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960110fsm43497995e9.0.2026.11.20.05.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:11:22 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH v2 0/6] Add Amlogic S7 clock controllers
Date: Fri, 20 Nov 2026 14:11:03 +0100
Message-Id: <20261120-upstream-s7-clk-v2-0-856cece3b9f2@baylibre.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/2WOyw6CMBBFf4V0bU1bQklc+R+GRR9TGeVlW4iE8
 O8WMHHhYhZncueeWUgAjxDIJVuIhwkD9l0CccqIqVV3B4o2MRFMSJ6GjkOIHlRLQ0lN86S50yB
 dnstCWJKuBg8O33vjrTo4jPoBJm4134SH15hU8RerMcTez/sfE9+2h5Kzf+XEKaOlLRi3UkjB3
 VWruUHt4Wz6llTrun4AhMrrGdgAAAA=
X-Change-ID: 20261026-upstream-s7-clk-3fbe6f33652d
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0

This series adds the clock controllers of the Amlogic S7 SoC family
(S905Y5, S805X3): the PLL clock controller and the peripherals clock
controller.

The peripherals controller is close to the S4 one. Two changes to the
common code come with the PLL controller: clk-pll handles PLLs without
a pre-divider and PLLs with an active-low reset, like the HDMI PLL.

---
Changes in v2:
- Drop the SCMI clock IDs patch: the IDs move to the DT series and the
  binding examples use raw SCMI clock cells (Conor, Jerome)
- Use exclusive or for the active-low reset (Jerome)
- Use absolute addresses in the binding examples (Conor)
- Rename the HIFI PLL to HIFI0, as in the datasheet (Jerome)
- Model div0p5 of the GP0, HIFI0 and HIFI1 PLLs as a read-only divider
  instead of a fixed /2 (Jerome)
- Swap the VCO and div0p5 clock IDs of each PLL, so the VCO init runs
  before the div0p5 divider reads its register (Jerome)
- Drop CLK_MESON_PLL_NOINIT_ENABLED from the HIFI0 and HIFI1 PLLs (Jerome)
- Declare one clock per line in the fclk macros and drop the default
  GP0 frac_max (Jerome)
- Clarify the fclk_en and HDMIPLL_CTRL2 comments (Jerome)
- Say why PWM H and J are read-only (Jerome)
- Fold the video and eth_rmii clocks with the composite helpers and
  local macros (Jerome)
- Add Conor's Acked-by and Jerome's Reviewed-by
- Link to v1: https://patch.msgid.link/20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com

---
Carlo Caione (6):
      clk: meson: pll: Support PLLs without a pre-divider
      clk: meson: pll: Support active-low resets
      dt-bindings: clock: Add Amlogic S7 PLL clock controller
      clk: amlogic: Add S7 PLL clock controller driver
      dt-bindings: clock: Add Amlogic S7 peripherals clock controller
      clk: amlogic: Add S7 peripherals clock controller driver

 .../clock/amlogic,s7-peripherals-clkc.yaml         |  125 ++
 .../bindings/clock/amlogic,s7-pll-clkc.yaml        |   71 +
 drivers/clk/meson/Kconfig                          |   30 +
 drivers/clk/meson/Makefile                         |    2 +
 drivers/clk/meson/clk-pll.c                        |   51 +-
 drivers/clk/meson/clk-pll.h                        |    1 +
 drivers/clk/meson/s7-peripherals.c                 | 1637 ++++++++++++++++++++
 drivers/clk/meson/s7-pll.c                         |  696 +++++++++
 .../clock/amlogic,s7-peripherals-clkc.h            |  245 +++
 include/dt-bindings/clock/amlogic,s7-pll-clkc.h    |   42 +
 10 files changed, 2885 insertions(+), 15 deletions(-)
---
base-commit: 363f97a1ce635b86be7fd263d56a040fbd87bdbb
change-id: 20261026-upstream-s7-clk-3fbe6f33652d

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>

