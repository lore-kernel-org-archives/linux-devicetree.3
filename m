Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795013896;
	b=rXvJL2Aj/M5KU22CbMhfqJeBYBJUbYH+YSDNRzftQcNIzdWQhBOSBdM5wFYHcb9BZnuF
	 TW1wWyl2rKsexTt5BHUe0EPjczfO15Yo6skqT7LUFpGpggBZL6I3KfJk+XrT2wW19tIPI
	 d4PUmep8OiKH9oYaP1IH+i2MDE48O/r/JT5D6ux4iSZ6/atcP+kWVwyO9WM63knSf9zy5
	 U51Qv2xITtIuqiLZx/nkf3WG1xv2vUALEe4xa/bPPW9ZKkAdTuayzycSOkqE9yorCDQ2W
	 4gOAUIYhgbWAJhvfFXp/N9PXPPWJzNUQHeR1WzW144VrKNGUHQmcGdF4hpjK49WJscw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013896;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=0XaXdrDvphgQpimZx5cBV74V3RkBkYmldb9F3GdEaZY=;
	b=t3uT5wwUzOjXIlitOKk7gRgYqhPMi+ZdphiBBxbB8WBAahCUGs6um7W/7y9edJFXbcKO
	 Buiuv6bBbOT9ulxaTXehWmwsQ8GjklEIJVGMsM3ElJOoPQkwjMpGGPBbuEvkAMfXpvie4
	 wc+7cb6H6i7h2QjsNXBHYkhnV/EfY7Rkxa7lMoQdTUDQgVTcaxfrBxx8MLHOQ2sxbbiOd
	 0s+fVuQgNjyBpdk0WjKNIMyKDmQSLwFuBwQ6LmeYS9OKKqLRba/LFjwbSZPfkZKuBq+YF
	 +LJUMCjdHlIQhOI2+d2RGMRWmLh64JpC38evFC4yPzQVi7VctFcNK6qT/BAi1HT7+7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fR9D4MB2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FEC606A31C;
	Wed, 18 Nov 2026 14:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fR9D4MB2
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795013896;
	b=H13zCjhqAj44AdEcbGfIzoxvZBj1ciT969lPjo5Ny+E3i2CkadgynjZRAMBJRco0h8bY
	 evIpZs+Jywqf2ItcbnL45slwuFnxyDnLZvHQL7QMkfJrPWVKc3V1U3o4EngtIm8oJWNcU
	 3E0FuGSYDASVhdl6ZNk9ECUfMpUass/DK1HsCFljvCKHjF7tM04wN7+gvemaXFEf8hNyM
	 N4dFUf3vHkFaxywM7Qqa4wKt94TkLhEZvQUzVOcq+JDCgoeA09ExYkCrUCa944xJRcpOz
	 6IsfWyII6oB0C876rIsjMEfj230mAflETNpWY7wsWCErOeJJwewpv8Am/gYBdN7ik0w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795013896;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=0XaXdrDvphgQpimZx5cBV74V3RkBkYmldb9F3GdEaZY=;
	b=sket0ox6sk0kIyGBk1VBx0uebXGuyaqlQc7BTfL8x0vQ/JJ2+tS1jGduP5zaEis+pLc0
	 pkRgByU6BBUwEEeM7tqt1GjLgphOGc5c+CNsUTGDyuMEM3nliYO2/tCVwmF25wM8rHG7I
	 UJoG9siI9ZVMMm77vjfUE9Lq8nKqo4E8ee7I+1gMQCD3RLR2qKxqiiyNmmXRKUc24KzUk
	 NhVqrmXiyAfsj1TLgYYkdC+CvZOMYlIdCIrkYIzrElByWyBQJrOUpvxX+F07C0GFQLL/i
	 jX40VkN1aw8VNmdJpn6r6SjtZn/uchf9ivqjH5LRt1hQ06PVyS0f3URo4HRRzG+69aw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8F2901F00925;
	Wed, 18 Nov 2026 14:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795013896;
	bh=0XaXdrDvphgQpimZx5cBV74V3RkBkYmldb9F3GdEaZY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=fR9D4MB2d1Qjol8H8XVYBNwby89AJ3DOQ/sBGoTxJ+CWo5X1QAvhJj+ks5HoLwlZR
	 hL2K8ZA6yO5997znys+egTGtGoJfYd4BbiF82PEs03hxYtPNAu0gTZNZHs43g/Uce8
	 RISzsc1HfngjZcBAVuv5XVuF23ESo3u+K3tzTFFzFGrqFYotGAMnF7IBR4k2TR2dmU
	 YpJpjNuYMrUix1yahje/32vGKdqnfOwZugLqZ8q9+cBy8WhFAE/kmwe/W3W2EwSI8C
	 W3mQT8Voi62kUiMyzeT95ccj2vMWgJ2sUwWudrYiZ2SAEQPahUTJ0UmzaoJYJz4m7+
	 h+b014e3Av9Dw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0A0704AE00;
	Wed, 18 Nov 2026 14:58:13 +0000 (UTC)
From: Alexandre Rapaille via B4 Relay <devnull+arapaille.atlr-engineering.com@kernel.org>
Date: Wed, 18 Nov 2026 15:58:00 +0100
Subject: [PATCH 2/3] wifi: wcn36xx: Do not enforce interrupt trigger type
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
Message-Id: <20261118-wcnss-series-v1-v1-2-a64d82e151bf@atlr-engineering.com>
References: <20261118-wcnss-series-v1-v1-0-a64d82e151bf@atlr-engineering.com>
In-Reply-To: <20261118-wcnss-series-v1-v1-0-a64d82e151bf@atlr-engineering.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Luca Weiss <luca@lucaweiss.eu>, Eugene Krasnikov <k.eugene.e@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, wcn36xx@lists.infradead.org, 
 linux-wireless@vger.kernel.org, 
 Alexandre Rapaille <arapaille@atlr-engineering.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795013892; l=1329;
 i=arapaille@atlr-engineering.com; s=20261118; h=from:subject:message-id;
 bh=khOZHEXRcSQmbq7KDArufnHPyg+ogBAkMuAIzDyD5GI=;
 b=nII4Tr6E80HN1n9xJCpvsfRQtm3voa4KEvn2sUb3dTDXcNFbHiKQ1Jq+Xa7RgMMY+0XXn1unX
 8swV0TgKt1hB9hMZ9nFdCy06x0CvWp/RXPAMmDJqGYkbiJHEgW3AC9T
X-Developer-Key: i=arapaille@atlr-engineering.com; a=ed25519;
 pk=xskH/sIiNU/aZCeGeBB1TK/AuiG3MXlX0m2wMlbMl08=
X-Endpoint-Received: by B4 Relay for
 arapaille@atlr-engineering.com/20261118 with auth_id=1560
X-Original-From: Alexandre Rapaille <arapaille@atlr-engineering.com>
Reply-To: arapaille@atlr-engineering.com
Content-Transfer-Encoding: 7bit

From: Alexandre Rapaille <arapaille@atlr-engineering.com>

Forcing IRQF_TRIGGER_HIGH over the DT type makes the re-probe after a WCNSS
restart fail ("type mismatch, failed to map hwirq"). Rely on the DT, as
commit 1ee6c5abebd3 ("ath10k: do not enforce interrupt trigger type") did.

Fixes: 8e84c2582169 ("wcn36xx: mac80211 driver for Qualcomm WCN3660/WCN3680 hardware")
Signed-off-by: Alexandre Rapaille <arapaille@atlr-engineering.com>
---
 drivers/net/wireless/ath/wcn36xx/dxe.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/wcn36xx/dxe.c b/drivers/net/wireless/ath/wcn36xx/dxe.c
index 801f1218ef..7852f71368 100644
--- a/drivers/net/wireless/ath/wcn36xx/dxe.c
+++ b/drivers/net/wireless/ath/wcn36xx/dxe.c
@@ -552,14 +552,14 @@ static int wcn36xx_dxe_request_irqs(struct wcn36xx *wcn)
 {
 	int ret;
 
-	ret = request_irq(wcn->tx_irq, wcn36xx_irq_tx_complete,
-			  IRQF_TRIGGER_HIGH, "wcn36xx_tx", wcn);
+	ret = request_irq(wcn->tx_irq, wcn36xx_irq_tx_complete, 0,
+			  "wcn36xx_tx", wcn);
 	if (ret) {
 		wcn36xx_err("failed to alloc tx irq\n");
 		goto out_err;
 	}
 
-	ret = request_irq(wcn->rx_irq, wcn36xx_irq_rx_ready, IRQF_TRIGGER_HIGH,
+	ret = request_irq(wcn->rx_irq, wcn36xx_irq_rx_ready, 0,
 			  "wcn36xx_rx", wcn);
 	if (ret) {
 		wcn36xx_err("failed to alloc rx irq\n");

-- 
2.43.0


