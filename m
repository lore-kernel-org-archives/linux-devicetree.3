Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A0C4349A0
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 20:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791318346; cv=none; b=dRgRrawYOjhP3gcFkCf99y23yJPO3jC6sboqNno1WIEeCamS0aonL/VQMDmh+OmXxyBDh9oMtqzIh20X2inUmDQ6dDY2nIyUSIwIO+k8FDP7RyRqFDlXCXG/DQzq2fDFWXRifr209YEH1yUOvOin+g3Siqwe5zcbD3rRsuFJA28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791318346; c=relaxed/simple;
	bh=+6mowQPvO5/qbWu07+JM4tpqCNNR0Oy6FVUyr6NCfh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uhAfq5J+w3HpH7i4BQLQrEnphE5gakK8aOWr+Fd9fCVu5oja+jrgyJkDgJgT9MKqqVjHeI0FLgIloit9vHFtO+Hf1oA+fd4Z+SBVZyP4TPriH0AiT8necJME7byHaZPkH2QiKTml0Y4lrxJBgoD5UeglLuBdw8OOEdh76w8pDio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=TEiXhiuG; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="TEiXhiuG"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6d68de53053so446149eaf.0
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 13:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791318344; x=1791923144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B7d8+d8Jg6e4zgR7b55B5I4HUSkrjz23uBlGgAf5rGA=;
        b=TEiXhiuGFEg0ccQgfPuSAz5WFYX8BvKgpf4naBpaTPHHa2tW3F9XfQ5zHvsjoIeP1E
         e6oa4hAoGJkJOM6SR5tC000S9SQp2WspG1UxusIGVVxCNt3KvEGpYL+E4R16LrlO2rT4
         N63dA9zOWHuWvEn0n3xcNAok0nZEnC8KyODpfHVQW2SAtUgQhutLUHqRWAzlR9nnCp8h
         +OkbTs6UIOcxXAJsorcRB53bWDjqaycpxD97+SCQbqB7rPO/loWL0dtxyiKpM5X/iIeg
         60wQCxBLgYqC6vdwPyCU/rp3rDOGYtKGHcIot1unlln6acEgOdVff0BW0+5Q/zS9tu2A
         /60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791318344; x=1791923144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B7d8+d8Jg6e4zgR7b55B5I4HUSkrjz23uBlGgAf5rGA=;
        b=z6khxUnU8RMl9j44hwUYIfc8D/5z9aOlKe98SqPuFRwqJ9w0/SXY/hgGAU99f+lgY5
         h9fqCW1BRW11F535MeQpvMiFjfV0BEOqu3uyfkhrEARHfIl0vzfoq2fI3HrqNrXVuUKu
         N+Fe2WYZrfB/9zZ4/C2AdQ5e3mygtd/HZwhqQ3CVhkP7+3KojFRmyP2yYeAcdsyONj2A
         s+UjLN7oi3LTwnX/JjF3HctJweKJn3/b5mhsb0dq/39fSZhAfyWRf/GwfxwWTY1ibyRZ
         TkcuoPJd7tjQs4beB1OeK5Z+K8O78FxBgkEeHk9VyLCkJsovxSQ7aKrpvsDdok9MkoJ2
         znsA==
X-Forwarded-Encrypted: i=1; AKwUvBzMsaT07ZsBGYXYXFcV4pTD8qURyVfB0QP7Gri/x7Kv0R9T+gzhRYvyoj7lBMUM+0aNKsvXRRgIJ0ft@vger.kernel.org
X-Gm-Message-State: AFuF++muJ5tKM+JIcrlwAS4CZUf0+OfzDschZI1j8vdMIGcUFXuD+vAc
	EpCmGdMRHSU2Gi8IIWon/PUHHkozcF/HrXhzuoO0pcmEEIIXud9w8wqZDuoom1z8hTZ2zkZ3t1Q
	BHgAf
X-Gm-Gg: AYBFou0buSI40dMmYbUdKxoecYfCYZqyWTExrZfft1mwudGUz+Fwjcuxigs2TOhP4dM
	LA0Dt3MqwykktOijw7Z4RsHWxX0D4w3N0qqXLo9kUUJTOdTekXziQ/7ODR+9avB4RUXOMg8XD6/
	HeHvrviPyYwg2Ea3HxGvQNMV+rNSf2IIECDkvRFGeNgvbqkVZjFNtUKFBdOx/aStKhlwNEBBNMm
	QXzw8ybM29o6FEkeSI722TDiF++LTrTaspaFtNOIwy2J3qLxZB1Cmj8Uw70k8JwpCMTT1wOWlId
	IGdd8NH4YsooO7O6mHrsbcmPQZz/oXguK1XbpEZigw7Epb6nfcAkl7NLkGPPgKKBK1wKGZRvIi0
	3+ZMRlve+E7yn7ZWOfiujgUHsJUwVIfXBIpG2k7dWMad1MJ5g3O8K+dXKRApgUKL+zz5+SUc19V
	1rUOB4D0hjpfEHafiGve/CDnvXjER1uFCHLea7AStsnufTWpZ2pmdca8npIZWelhjoAnTvHkxzt
	R0=
X-Received: by 2002:a05:6820:c89:b0:6e0:8fc2:84a3 with SMTP id 006d021491bc7-6e7a9125036mr295388eaf.39.1791318343680;
        Tue, 06 Oct 2026 13:25:43 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:372:3180:ce34:1fe7])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6e793f68bf6sm463442eaf.8.2026.10.06.13.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:25:43 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 06 Oct 2026 15:25:01 -0500
Subject: [PATCH 1/4] dt-bindings: display: panel: himax,hx8279: add
 vddp-supply
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-panel-himax-hx8279-vddp-v1-1-50d884b42aae@baylibre.com>
References: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
In-Reply-To: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2205; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=+6mowQPvO5/qbWu07+JM4tpqCNNR0Oy6FVUyr6NCfh4=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqxVklqqKz9ZZ5EYTPs3b/ghtQnZoefwxQSM+W0
 GisMCHkGeSJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCasVZJQAKCRDCzCAB/wGP
 wOHSCACcvVmVgg5xUxBOP/pHIgPMZ2Lhcfg4VZwwLRNcQLQE+uS/SQ4GV4kNd5pon4GVAyGLWMA
 hluJJJ+r7f4HXO+LMEXHe4siAm4FrOxhHWzzfvdZbpAes5TzM2ZzBI35cytFG01QQjODNLk31Ju
 ok2s6QEW3pyKLzVkkCJX1n4NCk4D0Tpcxu+wDjeWatZ49EPobpXz/MDhRyCL5eucimvRxWQkN+c
 q+XA6vMhr3/TSrVZwvozFK8v9/O75FHHxwIqe3DrzkJYxxRzxfNfE1s3Vh2BidaQN4hdgc0/qc3
 88m33Uam4PLXxnMeUHzrcdShGxwdILR/UCB3o87IYotFEd3M
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Add a vddp-supply property and make it required for the Startek
KD070FHFID078 panel.

The Startek KD070FHFID078 panel has a separate VDDP power input, which
feeds its DC-DC converter, in addition to VDD and IOVCC. On the MediaTek
Genio 520 and 720 EVKs, VDDP is switched by its own GPIO-controlled
regulator, and on the Genio 1200 EVK it comes from its own PMIC LDO.
In both cases it is separate from the other two supplies, so it needs to
be described to power the panel.

Making it required means existing device trees with this panel without
it no longer validate. This is ok since the Linux driver will still work
with them because the regulator core uses a dummy regulator for any
missing supply. And anyone who sees the warning about the missing
supply should add it to their device tree.

It stays optional for the Aoly SL101PM1794FOG-V15 panel, as it is not
known whether that panel has a VDDP input.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 .../devicetree/bindings/display/panel/himax,hx8279.yaml     | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx8279.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx8279.yaml
index f619aea82bdf..c79056c39037 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx8279.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx8279.yaml
@@ -37,6 +37,9 @@ properties:
   vdd-supply:
     description: Panel power supply
 
+  vddp-supply:
+    description: Panel DC-DC converter power supply (VDDP)
+
 required:
   - compatible
   - reg
@@ -45,6 +48,15 @@ required:
   - iovcc-supply
   - vdd-supply
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: startek,kd070fhfid078
+then:
+  required:
+    - vddp-supply
+
 unevaluatedProperties: false
 
 examples:
@@ -63,6 +75,7 @@ examples:
             reset-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
             iovcc-supply = <&vreg_lcm_vio>;
             vdd-supply = <&vreg_lcm_vdd>;
+            vddp-supply = <&vreg_lcm_vddp>;
 
             port {
                 panel_in: endpoint {

-- 
2.53.0

