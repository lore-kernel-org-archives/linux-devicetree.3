Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795161948;
	b=PCfKfiBgE1XwmgSTAt6q6/Z293gjmZy5+MWUlBz9KBUh3hefXNa0A6Fozv7aEVwzKlSP
	 sUpomzDE2GTvdqQnGGfJzXuxcygMtGuzMBm13MquUM5vgqC08HF65ljUMdpoWiW2XFtXF
	 DFdomktORK+CAVlxUVOe0ur3s3h6tL5c73ilb2TckJC/iyvsiAdIu81zI+gWnV6w6KXR5
	 IkAcilEcmaX8M8ekCQeh4N6vlvgqgBrMl04t6CaEIEPgrCucRbrx0+jKR+o3PPG6kCCTY
	 8+tIBvGTy8fD8rCayqJ0TQ3wamXc6+8Vd1AnuVoNLbez2hc14HwPDWzid0F8IQhBmAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795161948;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=xeffjzmHyFonYOOtAADjPMxDZdPCRXQMpGu0bFB66mQ=;
	b=HsB+MNyLRG7FL7tO87vrU2np75z3f1lRDXmjvv2sF3QCf7a6HNwISYDZa2pdDirwUZxB
	 ZyL7hR33xRJiTvnMWeusTytaWohwj3/vhpHWFz7vOETgAuwPgGAyMv3hqq4rfj1nO14mQ
	 cOyTklxXVAUUhv7moTfZkSRVhHdvbbSl7+NDW7HrZbxSOg5qg4G/zEqgkBYlsuftu2dsI
	 R8mJUWjq/he1XYLFcARdq5oQKJ762hXiJEfLr0TeQpyhVSsfVG1TsVFu2I5tPoOuYmgd7
	 0vh9dbBHtFMq4Cf5CURJpoxY9mZEnbul4KErgvyR/Yro2RbRkp6cpEOYlg/igkVqMNQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=icrEpvad;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDAE606A326;
	Fri, 20 Nov 2026 08:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=icrEpvad
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795161948;
	b=uQcs6cana1D7y++89yKkwq7RI+GsKnVOm0LxjzbQriFSpQ1PTv7WbonEeCplrAXdaYL4
	 wapLngg64TlgFGTltRavwkbm3KPijWlc5qKfzPJwmE3+XXYR9vhe+KIXm9v9IeQBx1kni
	 02PpUIKb7bypnoDjJe4c0tpZBO2HaV1ENYO9HGfUj1u0NTXcpXQZhrzvtxtGBMw50Pkxm
	 wtMGyoKf1mAbOLPeDBWm7KyGrCRaphsb793vm8X43hEG/uX6g2FVsI3vDulC49y86vCPA
	 W0zaWPyoONWUJcyRHhW+hbrgdcTr08BaxXHpArJWdqOHTF99C2MPkAtsnS8XOdUAKdw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795161948;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=xeffjzmHyFonYOOtAADjPMxDZdPCRXQMpGu0bFB66mQ=;
	b=lSCWGGAg2/XP3eqkU5yB5lPDVElTkpFaPbm4VV3NPK4+rcKNnXTDUzGkpfQ67KLZ+raT
	 HktqVQszDwAql5Olqpy/owl1+NtjB9BzXU0hxBi6l3gk7oLYnvEKw48lUD+muGMX0tmQh
	 imC1/1VXh1Hfsloj+V4rgNjIwtFb1YzFE9hrMDwE4NgCWaUr+D5J8dULjSrllsixAOWkR
	 xqqD7fJZHom+yIKn6HhleNZB23W0KxHT1swI32ODVFK/pEMgY1c+4QaZjpi3KocMRIP1e
	 RuDm97BXCppURv8QKYh4RWUCDOsS8Si8Z6jW74iX/1+d3c8GGw+4JDDDkaIHzUJmiEA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E217D1F000C6;
	Fri, 20 Nov 2026 08:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795161947;
	bh=xeffjzmHyFonYOOtAADjPMxDZdPCRXQMpGu0bFB66mQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=icrEpvadeVN/7NPKS1qhSbQB/tUKHZ5xbxQvv3nrQATVzI/9seaYbQwbDDG2Aybpb
	 vr5uDOdC346UIPUuMTRAkj9wHn75qf7WWv9tlIKTEWMEn41x5yuauzd+U0zzy7J7x4
	 Wv94cqUFtWbtPRSldcovcFO0s+auDpvecke0IhDFVap3C9AGRsCnIsxPWfm4FElofC
	 Ocsj8ndP9WiE0GmSlu4YqXFo/AW4q381uWcCDw0X+DkZZ8+ip140WT13BdvUj+BloA
	 sIn/wzpqM1EzwDEDSSY8Ton8k7fz9yTHy8fR8T6SfUgAOB1qRLdx6LAVg/jnwslqLt
	 wg5qmLXV7FbrQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6CCC449778;
	Fri, 20 Nov 2026 08:05:46 +0000 (UTC)
From: Alexandre Rapaille via B4 Relay <devnull+arapaille.atlr-engineering.com@kernel.org>
Date: Fri, 20 Nov 2026 09:05:46 +0100
Subject: [PATCH v2 2/3] wifi: wcn36xx: Do not enforce interrupt trigger
 type
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
Message-Id: <20261120-wcnss-series-v1-v2-2-3fed518decfb@atlr-engineering.com>
References: <20261120-wcnss-series-v1-v2-0-3fed518decfb@atlr-engineering.com>
In-Reply-To: <20261120-wcnss-series-v1-v2-0-3fed518decfb@atlr-engineering.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795161947; l=1310;
 i=arapaille@atlr-engineering.com; s=20261118; h=from:subject:message-id;
 bh=fl24+QXJej14ixsS3PP+/Yde4CZKV/tbL7KavByENog=;
 b=jOVeRhQploDdl2usEZ5kRoAUO7AklsBT9dK43kVpb1jIaOBVKD3GKmgYmTUUsDNGa5PZKLwmu
 x0+dmbYMrPMBruIEGeq5p2t2SYrvYCDuQYwsi8Tx5yGBbQx71AY5Imz
X-Developer-Key: i=arapaille@atlr-engineering.com; a=ed25519;
 pk=xskH/sIiNU/aZCeGeBB1TK/AuiG3MXlX0m2wMlbMl08=
X-Endpoint-Received: by B4 Relay for
 arapaille@atlr-engineering.com/20261118 with auth_id=1560
X-Original-From: Alexandre Rapaille <arapaille@atlr-engineering.com>
Reply-To: arapaille@atlr-engineering.com
Content-Transfer-Encoding: 7bit

From: Alexandre Rapaille <arapaille@atlr-engineering.com>

request_irq() with IRQF_TRIGGER_HIGH stores level on the IRQ mapping,
which outlives the driver, so a DT with another type gets "type
mismatch" and -ENXIO on the next probe. Rely on the DT as ath10k does;
every in-tree qcom,wcnss-wlan node is level high (msm8974 since the
previous patch).

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


