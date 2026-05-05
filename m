Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45048427A1C
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 10:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976090; cv=none; b=MrWGt35B7rcM3N8S00sqNA93PO5Fae0qmjGToxR1mLcAojkyWYin+nrDrbQnsKZ0EURZt6PLRwWKWVC1H35Z6+iSvylVM/sVUAWjr/A0Sm0zzDCIdH6BjX9de3uVbjD5Z+1wui9oW3Ok+RTfElBgo1/dG1RaQtvfu78pgtb7k4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976090; c=relaxed/simple;
	bh=c9/tfIFhuF55QlbUqQ19y2/pm4iUf2fDl9rfd66AzIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ULtOqbVEA2CwrQqzBoV4OT7CSkpJB3hDJERFcMsfCn8eojjKvsj7swI8h0U538//NX/nRoXcaESyObX5w3A7Bn5wMwLL9uuLZ9mnBxqlX2Wc4NSgvVErnlMpCEPwhkgI4ikRsEsV/y/vHtw+dZxGDU1U9VavCdRRFMeC6lmWuv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VExg2mms; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VExg2mms"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-83538fbd0b2so1119251b3a.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 03:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976088; x=1778580888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/+HU1QYQZmhqORfdmiy8w2qez1W1MQHoWlaTLfNyCo=;
        b=VExg2mmsr05+NWmVxDjYa0EWYq3W+h/+S7XD1ozovsKFr74B7doJYiYpiVSFpvaiWi
         Phx/ZwhkEn5SIYJksFSfQTwbUVqnL9srQ4EUQRnNRPNaKgeDcp2TbqxPpjgxNemAZjD2
         CnizYqvOYCQIVjrzuGYH7K4XlRNzPKuFHJABQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976088; x=1778580888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U/+HU1QYQZmhqORfdmiy8w2qez1W1MQHoWlaTLfNyCo=;
        b=HeV2obT35lyLSSw1Ymb3DHgzVwbBeGerG6Ijxvngmk3nkiOmSMfRXgqeVrGpIEAebM
         HsvIIGapkq5VtXYSNtKjLc0FzlXryRO4YeM1g/yZs5k/Pg3cGHNpkqYTdZcPu6GWxcvm
         v8E13YwMxLxIbyOtPwRa/7p/P1u7RNm/C3K+MEQWSGQFUmXHzqmc6hiXLR23o0dSAtTr
         i0GWHxir+5dzA4z70B+UGNr71tTCYLfDXPUT202AAghe1OHJdZUEDCgL/ed0ZW78fOJN
         VVZ+8oSM+VN0eDZTelMsBWqe6kWLMEAIah2t1LF5nbHwOhh/dDf9On3/8XrEFugaJtwo
         0N7Q==
X-Forwarded-Encrypted: i=1; AFNElJ9pKr1jHkMk5SBf/M5A9dHOo9UwJIsHyXMiaAdWJ9sVtaLga008skcomHPJAXetu3WjHq8IxcIZ1nlJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzlDZajyAKyLwztVHZygGTbbgNIaotb+TzhXr1TUE/GFq9laHwk
	7wIXiavA7T8LGnIpidsTQPsBovZ4Im1Kl7WBUGfGOJTxc4nD/XCAJXKn40EVm41La3C8VU7bAQ3
	Q8KQ=
X-Gm-Gg: AeBDietlGS5EkWnB+E9L0Zzmhd1cdh2JCxSKZa0d2BrFfvdzP+utBdO5tBqRjNBuVz9
	5HAVKW4Zbli08v3NDlVh5ufeqZ7XNKjdvLihEOcRRxCliWflwCTPRR/UjXcoQaLYScQXz7QjWOH
	LHvYUGHVjL0hQ9e2ge+ss4Ic+iGlNm3OIHBoKgkdYSqXgRXuLYyYvhTIis4UxVGD5sEi7Mp6/3L
	pJJpQGa/yH0XNBkFnoFHq3lqC91061a9RR+Fgi45jnPIHm/Q5iBs2tnx7CvmjCiyfKINX+RRXqX
	WqixIyInWhYgViaFNS6GYipLch641kiN/f/pTmM+bnAYn5qVFYBzxUkWTFOY9ti07f2wN5MbCry
	u2e40A22FqDFiZc62szMUp5IpTDUCsRRZRUMtIKf+cjb/iqUYKAIILBk2YtDpe6epU2JtZfgX4E
	ZNXi9575Toc0fVXgkeRKt5QDun54Kx0voMyVybdUorMf90ME9MdaC+qKnJbiDII5C+rh7gviy0f
	ysKG+Yb/D4Yqv2JcMZGd47E1IngTw==
X-Received: by 2002:a05:6a00:1956:b0:82f:5c3f:94c6 with SMTP id d2e1a72fcca58-8352d26b9f5mr12659407b3a.28.1777976088522;
        Tue, 05 May 2026 03:14:48 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:14:47 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/16] arm64: dts: mediatek: mt8195-cherry: Add MT6315 PMIC supplies
Date: Tue,  5 May 2026 18:14:00 +0800
Message-ID: <20260505101408.1796563-11-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260505101408.1796563-1-wenst@chromium.org>
References: <20260505101408.1796563-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MT8195 Cherry design has two MT6315 PMICs. One has 4 outputs ganged
together; the other has 2 outputs ganged together, and the other two
unused.

Add supplies for these two PMICs. Since the outputs are ganged together,
just add the supply for the first one.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Moved supplies to PMIC top level node
- Added all supplies

All supplies are connected, but since the regulators are ganged
together, only one regulator node is present.
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 0b9fedac842c..cf9855618494 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -1472,6 +1472,10 @@ &spmi {
 	mt6315@6 {
 		compatible = "mediatek,mt6315-regulator";
 		reg = <0x6 SPMI_USID>;
+		pvdd1-supply = <&pp4200_z2>;
+		pvdd2-supply = <&pp4200_z2>;
+		pvdd3-supply = <&pp4200_z2>;
+		pvdd4-supply = <&pp4200_z2>;
 
 		regulators {
 			mt6315_6_vbuck1: vbuck1 {
@@ -1489,6 +1493,10 @@ mt6315_6_vbuck1: vbuck1 {
 	mt6315@7 {
 		compatible = "mediatek,mt6315-regulator";
 		reg = <0x7 SPMI_USID>;
+		pvdd1-supply = <&pp4200_z2>;
+		pvdd2-supply = <&pp4200_z2>;
+		pvdd3-supply = <&pp4200_z2>;
+		pvdd4-supply = <&pp4200_z2>;
 
 		regulators {
 			mt6315_7_vbuck1: vbuck1 {
-- 
2.54.0.545.g6539524ca2-goog

