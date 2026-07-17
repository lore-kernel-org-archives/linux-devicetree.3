Received: from flow-b4-smtp.messagingengine.com (flow-b4-smtp.messagingengine.com [202.12.124.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3B33BED46;
	Fri, 17 Jul 2026 06:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784271557; cv=none; b=BEGKVse8u0+Gfn+bGWx8a1QzaTX3y8GXkkLAbmCLCiLFe1mMkyE3HBtzEmIKLRpCg6RUbAS8aGVga6rKM0ZlAHDTVjqHyNWTc5h2qsa6th7OZw+Oiec6FTa2nji8JZPxEwNtp3pnLEHC3MTgkEciXNqW5885S7WQhwz6A5jUuWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784271557; c=relaxed/simple;
	bh=bSVcFXSz8Kz2fscPyehV1KmsX9WgJS7kepKAGf/QI9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yosx8A+gLoKWoSd/gTAYTaC+R7W9Xll6cs+rLxHjeIPyqaRO8hwPIQNBYqHZvzYTrug3mdWQIvSb6KATBmwOhsbyfdCI3nqFS1BhzeUFzR8LKL1ncZAVtRPl+bPWJuFEGflNA+q0l8VDFygOcwJZOdxU//FCQlr1K1c2oXctw2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gahingwoo.com; spf=pass smtp.mailfrom=gahingwoo.com; dkim=pass (2048-bit key) header.d=gahingwoo.com header.i=@gahingwoo.com header.b=vzAGbyUm; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Yd7coY3d; arc=none smtp.client-ip=202.12.124.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gahingwoo.com header.i=@gahingwoo.com header.b="vzAGbyUm";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Yd7coY3d"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailflow.stl.internal (Postfix) with ESMTP id 32DAF13002C9;
	Fri, 17 Jul 2026 02:59:15 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 17 Jul 2026 02:59:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1784271555; x=
	1784275155; bh=5qG5vKLbr5547vLcXdg56vJVJbxeGTUoEF8EAWRWmQM=; b=v
	zAGbyUmN4B8KGUy4yyO0P24h8UIwgMszqyBcVcjOLiDNMatWQaFmyFLI9vZd2S9R
	rsNYWFRbXfcQ3jLAJP1MQM5S5HbpTYvw6dEBmyk2zcMRK4n+qoUoANxvllFlr6Vu
	FHcVrxUGspgz/91RYzizHDRiY3Zu3ocAliGf5TxOM/jXuecImm9BcIVJH1cRIaad
	Yh8NOhjukBl6QWrmT416QlMbPyt19Yv7udZZU5F+UptGeu1PfCrB46RmQ8JHVVqU
	fefA46hFaTb7OV/ZLP6lUcbiIb9hyC3N4vjT8c8O3rpSLpfnfkQsX8I+ccBwAvba
	vBoayaR1sY3Z+2SBuWQLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1784271555; x=1784275155; bh=5
	qG5vKLbr5547vLcXdg56vJVJbxeGTUoEF8EAWRWmQM=; b=Yd7coY3dHkMvdiuC5
	PthVUg99g3VcabMBDiducG9SA7qQugwMqsmtgD0cXMmgX3v8AbegW42zEcEF62Rp
	Pnnlyre/HZ36tZXrr4d0yptftDNZZ/UX/J7jwhNEVsti9D7i90pSPUyj/sEIS9Xe
	u5WM3ZJC0ujqw+FM5cIcNQQpAsNr5W94zDppZ7HUMJdaZfwP9lK6byHYepwF0PG/
	WPYhtAYS2KuhZteGw3XSI9Bl1cG1fgn1fEz/RLC8q0azOdRBvoXLZCuMyUMge6gi
	Rq5Si61Sb0TI6QXKT5XKYesPbaLO6LAB0RrhFQjCp+Uvxki5qLV9IA4R52L/ncZV
	K9Fkw==
X-ME-Sender: <xms:wtJZappTDHBPHE_NZsoJzHBJZmo6_1PZcsvgr8jJ0VhEhIWzHitTsw>
    <xme:wtJZap56zMhrjrX_ht6d8GJ54D7uUhahVeGkiPVOCpSYgJ35hVSnyiP0KMu5x7YKD
    eTVBpjB2g9Avg8eRRlhzVdgUM8rQRzzINT5gBtsBejeJlwZ3yKicYk>
X-ME-Received: <xmr:wtJZavhsMDo2CXcK1-DggVxJ-2OOUBceSb6fuZYntbmb_sZsshepXaXoU5NKyrmn4sgZoJuxzIhysYYEzKc>
X-ME-Proxy-Cause: dmFkZTEiszmro9qc+KFdXHhZ+IUKh+rMk4+x4z/kDLQwec+76Rr1ijkXldNawvDaUl5pmb
    bI1YAGDSFzQAkjfL24TO9QoehNPso4GklVLPtwbMUsi42UgmmHUoHRXUclnmzgedBIhNFR
    LTkZCGphI7Wli12CZTrevY0C0UQGxTI8STPrTYOImE6gTcRsOTs7++uXmT1571Oo4o1kFH
    B5f23YLFVLvWTh47RKnOIgNa392poEHLjjeHZ9kKCkVDZzFBEY0mN8nqDdtQZypCVkRhfw
    Hl0RQIrhEA9K478RwaulkcqPLcNk44xuYUpqeGwckMxRfdz2ghDJuVBBwurQftRtg9HrJl
    HI4HCt/zIM7iojbyJAqR/ZW/EKHmCG5EJe6SgrERPMVxEnCmDXsYS1cqMvqAvFfBPdYG9Q
    r4beDBg3USbk15GE10YIfk+tJaXoFLHvwQFmiFvinix5VE9syvlh5YuktDr507t1DQrI/t
    s5ldRHUKgYGAlK9kHZrs/qpmZiJYCShjD+1dpiXtD2mk0RufgzGvKOQlpCDfyawosxsJQc
    oRVV+ANl/Eoxe4rczHLWwL5qKzaoOGgkJ30vqw43l7QRvtpfaMf8su78UftnySdW8k1Hoq
    QoJ3/CBW+rnUtI7MFPKagg3o5jKD1raN/2+CSLerdHFllWXAg4cB6iDARTfQ
X-ME-Proxy: <xmx:wtJZan4ICsSR9alyT6u_OF2jYYeHSGwPGAr_WLqiIpSYcgsF-iPbzg>
    <xmx:wtJZasHs2WOsNGBjsfdgRgV1gLbqWovwwes9MMhYGyGFjFTa7K2sfw>
    <xmx:wtJZahKfnKuE-R2LZna3Dg-D9OsiLrulUgtiJ6doGPpsZugELjKbNg>
    <xmx:wtJZahggg9GuMD-i3fkFZ6NOLWJJgra5rbZVEDC_9AGc2G4PvBoAnA>
    <xmx:wtJZakhX0EWXeUgoW1e4rjc0h6o6txA0P9KOcZcPeaMsvoA2d7dmjcK1>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Jul 2026 02:59:11 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: rockchip: Add ArmSoM CM5 and CM5-IO
Date: Fri, 17 Jul 2026 18:59:02 +1200
Message-ID: <20260717065903.2629399-2-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717065903.2629399-1-gahing@gahingwoo.com>
References: <20260717065903.2629399-1-gahing@gahingwoo.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatibles for the ArmSoM CM5, an RK3576 compute module, and its
CM5-IO carrier board.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde186..5c7697f4d 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -71,6 +71,13 @@ properties:
           - const: ariaboard,photonicat
           - const: rockchip,rk3568
 
+      - description: ArmSoM CM5 Module based boards
+        items:
+          - enum:
+              - armsom,cm5-io
+          - const: armsom,cm5
+          - const: rockchip,rk3576
+
       - description: ArmSoM Sige1 board
         items:
           - const: armsom,sige1
-- 
2.43.0

