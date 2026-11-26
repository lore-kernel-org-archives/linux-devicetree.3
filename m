Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795686829;
	b=eCy09cSpxNfojpm5T3Hg2adadGak+zK2qx/sVWWG8+l3q7cZuOzA8zyQR+3FPYNxDQDU
	 YmhpM7LWLCU6tCPZ0/C7A63M9BelnSZkyy/IMotF4DXVOsUBR+8AfTN7qoDxJ2YRnIIv0
	 VSYVE20mRDYFVwbf8gwlD/2c+ytHNpamOZQMUI7hbim/NNFu/EKuTNAv9dXnqw9eROR+e
	 LcRVa5dI9GxicuU4maI0zFgnlJMJ62b7F83vOdWI1PX6krV7JJQd0fGRgm2By9HZmY9MN
	 UzIn9kfmT83+NB37+0TsN69HmlyzAT9g2g+PmeNfpN9SPrZtu1WA7znrC8r6pOaKWDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686829;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=4z2oKg4uwmOJVBZfpANbqdPA2a5xQkXipkOD6MSZYT4=;
	b=W32dKAsyxum7A7Sxv0vz/bKZu5dY9/mlm6S21K+K9FTVU/P+HAXajiUqI+86LB1WJBHq
	 zXhSGrdaghELNCsJZmh5hA7C3FidvInfxREbQnJfHLvU7h8K86SmMCSKmTMmbiHp4Xb1B
	 2mjU/aarBJx/fdJEfQR6i7FbK+B62vx452REFP01M/pprDYjnAEfxp7OmxVX3G/MVZFU2
	 d1uSTnCdjrJrOGcI22MwayeAF55rT5ONu/BNdYtVHLtlNw9fluLWXss+EZI7td2IcfqdQ
	 yBRnhFOdwFEPuq2WZqpr/mH7MDIewjEcAuJFzboo+NB4dyaBXe+nQLBB8+JLrngNViw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QoqNCh7n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760F1606A684;
	Thu, 26 Nov 2026 09:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QoqNCh7n
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795686828;
	b=rSGvo3dup4oCPBHhslCBCSG6KgEcFlBIioBrKy6gPc1cXZHtkHwE+gXEeEamtX4IYUD3
	 SdjheIOfta/jF2FShQu4rb8fnr1a0ChT+YBGSpoDeiB9kQTrnRou6angsRay1rjpQcIwN
	 RzNZssmXgi0mSKOUPDUcZw43AGn3XVkJatIMJjQfxhspSJ2j9uub7bzVyGxgENV1Uamkk
	 ofnIx7aRm1cg/MjaABOJnIh4nTQm+HEzjeuCgin6J5tV3D5OdFwO+oqEpTNWYhDJEJ3f9
	 NqSGgLzVy5g3aCzfQTpAwqkkx3J7/DWTuUIiN3hTikjU6k6fALD9XrLdqLA8aHBv5AQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795686828;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=4z2oKg4uwmOJVBZfpANbqdPA2a5xQkXipkOD6MSZYT4=;
	b=qwA3WciiQsBt5yuKxASsAi5fnTKcqGnYrZnnru6Cqe87qdqR5tTU1YXR5R2CwhY+Sqqb
	 OV0cV7SKm9Jv/1BRDdmLqdaE/QJNKNjpNntEFfouKT6vXXV9Wss1cWkg/l3/NErrsC4xE
	 NqsjXhNJ53/ZEUDeE9kOuLbFW6CVq7oBNlsDSOXgYzD/y72wlrkp0L/jfJHLfIOwNM608
	 9t956ctwxtv7MZyIIdwLB52uYZR15HEWazr9a791vw4Jxh3P5bjEBDJwnhOwuAUu/ttzY
	 lTH7/zbEmj1nQ25EVumNPIgiE1BjZ43r6n+mbHUkgeCVxSL79m8Gr3g/p5zWSQckD0g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 576881F000E0;
	Thu, 26 Nov 2026 09:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795686828;
	bh=4z2oKg4uwmOJVBZfpANbqdPA2a5xQkXipkOD6MSZYT4=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=QoqNCh7nDB/nDGu4fo1Txr2KQPaxgTi/TIfBMZA4MhbpO6X7m06V1okNDe5tSGN3I
	 znmWqxi1DaVV1GEqd9aQtk4LjJKYJ6QXcGd0VTeLAgLjykKjKiheKbqZ7C0HzcL1Y3
	 eTZlpK0sp49zGHz0CzNz3ZGeI/fQSqebC4nicD+8vuP4w1P8Zhs7DZAfm8tkhAhHM/
	 0AlvMZ/zkdxraj1ghB26LoA5IcFXn4zORELOlaANv/DuD9Z1Dt/OprXMz94alZ5kZv
	 aUudvbMUDbH6SRcxBjlsnTGXtT1nmcwvamV9HHh4kTr6wXMlzIXeKQKjqKPC7Rk2t5
	 d/qY7UyOKdUVw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A21D64D3BE;
	Thu, 26 Nov 2026 09:53:40 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v3 0/3] reset: support reset for Amlogic A9 SoC
Date: Thu, 26 Nov 2026 09:53:37 +0000
Message-Id: <20261126-a9-reset-v3-0-fb9bb01f33d1@amlogic.com>
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
X-B4-Tracking: v=1; b=H4sIAKEBCGsC/1WMwQ6CMBAFf4Xs2ZqlRaCe/A/jAdotNBFKWtJoC
 P9uITHicV7ezAKBvKUA12wBT9EG68YE4pSB6puxI2Z1YuDIS6ywZI1kngLNTCohqTa6xVJDuk+
 ejH3tqfsjcW/D7Px7L8d8W78R+YvEnCEzulIGhWzri7g1w9N1Vp2VG2DLRH5Q8+Kg8qTW2qBsu
 SlEpf7VdV0/PdiiEt0AAAA=
X-Change-ID: 20260706-a9-reset-9c39e8fdb06d
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795686819; l=1303;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=L96yI3Yx/j1d5Y6jYRCC8qNnGbrQ6QxdVZQl+y4ySbs=;
 b=WMm59vQS484rXbcEcS4wquK1SzMIxM+At+yBWURtC90oFy1BzU7wucfOBfl3VRHdXvT1ICQoB
 P6l6pxsUsTSAf1vR1tF7V7HtpxD7gOpiR05J67x6YVg14qSBKDWXRD/
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

Document the reset controller compatibles used by the Amlogic A9 SoC, and
add the reset configuration and compatible entry for the Amlogic A9 AO
reset controller, and add reset node for Amlogic A9.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v3:
- Update the header guard to use a consistent naming convention.
- Add Neil Armstrong's Reviewed-by tag.
- Link to v2: https://lore.kernel.org/r/20260714-a9-reset-v2-0-8df09b2f437c@amlogic.com

Changes in v2:
- Use standard node name reset-controller.
- Link to v1: https://lore.kernel.org/r/20260709-a9-reset-v1-0-fd7cf039b853@amlogic.com

---
Xianwei Zhao (3):
      dt-bindings: reset: amlogic: Add A9 reset compatibles
      reset: amlogic: Add A9 AO reset controller support
      arm64: dts: amlogic: a9: Add reset controller support

 .../bindings/reset/amlogic,meson-reset.yaml        |   5 +
 arch/arm64/boot/dts/amlogic/amlogic-a9-reset.h     | 247 +++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi        |  14 ++
 drivers/reset/amlogic/reset-meson.c                |   9 +
 4 files changed, 275 insertions(+)
---
base-commit: 807a34cf91c1d91f2beb3cacef9eaa98bd56d172
change-id: 20260706-a9-reset-9c39e8fdb06d

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>


