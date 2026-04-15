Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2593CAE9E;
	Wed, 15 Apr 2026 08:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776242052; cv=none; b=u+7pH6IxSRseSVsaAYboauX4IRIl23WaDqXFpL5n5n/iXavDoQy16hqU3zugWzxlADoZGRYtR6XawIJb0PzktqvfxPqkgFQixiMsCRE1WHQj/FplBIU1s7fysIIyPuDznkTQ8IYonxh/Q+oqIr16dLAfUXvAaEvnN/Woqrq0GWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776242052; c=relaxed/simple;
	bh=awWIx1f9dR7GIP2hxnIcbP5W1aryibgP9I+hBEGcbjU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TvK5uW9/rxTILl92nUVCt8ncibbnGGA0FLQ50pKmNE+dzL9rNNU7OmLNjRAz7vLjclpDUJP7paQzJUTLec7mBRQZRJOmjGKX3y2iHAwpJ0ZFyQjYDeB0pjaK9QbVS1JhHCAPvMfMOOPbQP7kFgKhrAWURwFhDe6etuTQ9/daUqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aa3ZEw3X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aa3ZEw3X"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C36C6C19424;
	Wed, 15 Apr 2026 08:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776242051;
	bh=awWIx1f9dR7GIP2hxnIcbP5W1aryibgP9I+hBEGcbjU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Aa3ZEw3XEWrUemWRn1AexKJeZj1H8Uui4nPAdFKJSSzpD5NsxcKfmgT8W3lVo2XN6
	 08alNmioHz3w6XjsLoH8TgUcPF6yTQFN9XxXz2L0yKP7Nd0+XJQX0E0I79npboarLC
	 FhG7/Ama69goGItjgeWK6kRMxElsSV4/NxpISjoSivWmGKqHaISN2mwDd5RN64jQ6r
	 4MyTHsofU2dI+tQeeY9hiFtXnwRtI4ANqpUDO8lY4OgowkUymwR4PIr9G/IWyazBEt
	 zeRkNHNe89vNOyRyQK4xh5C2RhSip1ur7aicQOlIvCTjvt+ULUgCjB9SJLa9MqYGbS
	 3rkUhhcUZSONg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE360FA0C38;
	Wed, 15 Apr 2026 08:34:11 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Subject: [PATCH v2 0/4] soc: amlogic: clk-measure: add A1 and T7 support
Date: Wed, 15 Apr 2026 16:33:40 +0800
Message-Id: <20260415-clkmsr_a1_t7-v2-0-02b6314427e6@amlogic.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGRN32kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDE0NT3eSc7NziovhEw/gSc11LCyMDSwuTFIPENEMloJaCotS0zAqwcdG
 xtbUAqpd5oF4AAAA=
X-Change-ID: 20260415-clkmsr_a1_t7-9820984d0af1
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jian Hu <jian.hu@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776242050; l=1104;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=awWIx1f9dR7GIP2hxnIcbP5W1aryibgP9I+hBEGcbjU=;
 b=lFxpNnrVZaBBtu2+PyhMAD8jPnDZsB51zmR7K2E4pSd6jpoRRgvpHYZt7LRJreDOXR1UEHg33
 4Qx8jsvTlacBFUuD4UiAHWO74DXB1vKl6V98L2sGqBeiEEw3Hp59A6w
X-Developer-Key: i=jian.hu@amlogic.com; a=ed25519;
 pk=zHUE+rNtH9z+Sb8au1/elWknjFQmy5QDVkBoxleuOIA=
X-Endpoint-Received: by B4 Relay for jian.hu@amlogic.com/20260415 with
 auth_id=735
X-Original-From: Jian Hu <jian.hu@amlogic.com>
Reply-To: jian.hu@amlogic.com

This series adds Amlogic clock measurement support for A1 and T7 SoCs,
including binding updates, driver additions, and device tree enablement.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
Changes in v2:
- Add const for a1 and t7 clock measure table.
- Use b4 to send this series.
- Link to v1: https://lore.kernel.org/all/20260410100329.3167482-1-jian.hu@amlogic.com

---
Jian Hu (4):
      dt-bindings: soc: amlogic: clk-measure: Add A1 and T7 compatible
      soc: amlogic: clk-measure: Add A1 and T7 support
      arm64: dts: meson: a1: Add clk measure support
      arm64: dts: amlogic: t7: Add clk measure support

 .../soc/amlogic/amlogic,meson-gx-clk-measure.yaml  |   2 +
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        |   5 +
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |   5 +
 drivers/soc/amlogic/meson-clk-measure.c            | 272 +++++++++++++++++++++
 4 files changed, 284 insertions(+)
---
base-commit: 401e5c73eedde8225e87bd11c794b8409248ff41
change-id: 20260415-clkmsr_a1_t7-9820984d0af1

Best regards,
-- 
Jian Hu <jian.hu@amlogic.com>


