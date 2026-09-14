Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0ED048C40F
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 16:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789403579; cv=none; b=JbE9IuYxHBi4sD5ReScYIE1wBhHJCOo+smwGajqeiJ17egITQfWPc4ba8NYwIc/4z3rM/jhqSgsPx0zLgJsDOG6ZUhHWLNTqRY9zsL34KiBEymRq4WaBWihVBv1pFAmEZWkXx5wiKhIsJwIkZVI4Hg117BiO/Aav5t5iRGYqq7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789403579; c=relaxed/simple;
	bh=u3ip+RRXt4HMU6c7yGbkOPs35P2CelDhQnnshfbNVW4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=W6cwWTMIwBkv8LVqkT0Q32y9gJzPshw18/L03YUj3v1knLQogEAKdY7SRX9c+L+o5WbpHkjbZLnbhSioT62C7zA7sEz/zU8rEMece2svA17dbxvS6QeSC3U/4UGRHYQT5eXHZ2z31NR4goofdt8hEyz3YWn+m0vr+VUfNk0L3Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xSrOcZcL; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xSrOcZcL"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49d05d51553so30167305e9.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789403576; x=1790008376; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GVoptFjQoPJzZR3oa46rPkqQ9t2mgiZ9r55mFPnK2Qs=;
        b=xSrOcZcLQ3MJJgmmv6k2ziMsycCZHwzbN0QTjzQc6ebO/m+9SShRaov3wVnWIA5KPz
         5+CXNMQTQ7Nd4OxcNl/I7kKPZWlRV8KNYz/D9Ig0Bv4ZdFrckswpvDpn2TGFACydAwzv
         QqlSo766z3CzZ9qiebVJA0G/UswqejvyshFG2/wWrf/yCdOwjcFhc2eTNRujN8vh/Rs+
         /g16BLdSTjTdmNu8+gkCGdajo/sbiJvtaRRjZsp1DGCV8dTsJK2ZXnuFmR9EWCJ38A/t
         vQH2hkbMWaJayivFk3/0kzcXyLlyGdSWO/Kp/aI/gxKk7iianH+DibSDwLbM+DHoND9G
         ADvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789403576; x=1790008376;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GVoptFjQoPJzZR3oa46rPkqQ9t2mgiZ9r55mFPnK2Qs=;
        b=b6bLuhBDdMGq0uAq5pjgG78xLlsYnwnfUSOFlvu4fvjKMw6rWDaIYZBzkulfmNP3He
         7YWGaOxB3y2eavbwCkoVMMgUdEu/X7MG5Ry5jUEea+N+54Fb8WKvI3YEG65usqypM/xA
         yR1etHYSI4eQE0ugnGxTZnI7kAYgNs9r346wq5FdihvdZGaKyqo3w/vheq3b7jKLNkgW
         YupVtI8h5ljJxqvaRHCHEwGVugeEnpXPet+w/MlbuWMywLnABOu7jPVmkmnNbP6yfrfd
         n53mB1JMWcIJ1AeyMa2gjosZfyT5mpMaquLy1EOvo3GD+zhzEoY3rMq9OsKSVOlQr6VH
         fcBw==
X-Forwarded-Encrypted: i=1; AKwUvBy7YNG2If3JF6OG0Aro0lbl9i9aYuYMO7qVbsiBLBIQRcrkJhPZ+xj071Djnr+ukuM+EgcHD6SPpugW@vger.kernel.org
X-Gm-Message-State: AFuF++khi84/O6M1roFlxD98kntVSJ96oR7R6aNEyzNkbQ96/XH9xi3b
	N1CNGSQXU+2Z7ULsPsyJ+WdzqyKmPupW11jO7vCkQrg6RB5t/2Eas7gSvZPlSwBW8aU=
X-Gm-Gg: AYBFou16c2GF7o1Gbt9dxyDQ73BnPlwEWsbnqPsOkJGHEfwL5RGaX8iVqAI/tZyp/FT
	x0NgXCaQtnGoPOv61paGuuMyYXDqXAIUsnDIIGsGt81Bn+gmoQmOLHeuepamYh8bMe3WNeSKEIC
	XfU4nlaJkNfhRh8yWq0yc4LxltbG+stpVALGGnKm4DITS3E3s+OARS6K8l9jzC3Hp1aZvLrToDC
	y5WWj5WfT1f32xByPMAKnTa1CTSvPj09O6nW12h6JNQbz2FyrQu+BN3gwyVKfH7omViGk7RPcTB
	MpU0Uxwp4/LyQirIRckWAeK7N3X1Z5zd9TuayihIY5FQJmwtfFFJWtP0sYZ5RDPs7YtrtPQvjpW
	1+8+XCXFeQi7r0LIqTcXmWgI493fITHl/Rdb9xwZeM+JF8H0sdNGt0LXZoiPYuAqPKiVMTe0/Zp
	5KZl92afUsctOzi7etbk8A8dR293uFBG+cFQ97L62B2PNm8+tr3RzzURq54aDr0B7lsehU3ACye
	MqpShONspXnqtyZB+Pm2BoDwKSurlv1cAKnx2AxgfQwvegwX1S0lzKEpTTfFXQ=
X-Received: by 2002:a05:600c:6383:b0:49e:74c6:d973 with SMTP id 5b1f17b1804b1-49e7a67e2d4mr40537305e9.31.1789403575710;
        Mon, 14 Sep 2026 09:32:55 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d284a7bsm25431815e9.3.2026.09.14.09.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 09:32:55 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Mon, 14 Sep 2026 17:32:45 +0100
Subject: [PATCH RESEND v2] arm64: dts: exynos850: Add ap2apm mailbox
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-exynos850-mbox-dts-v2-1-798585c8f1ba@linaro.org>
X-B4-Tracking: v=1; b=H4sIAK0hqGoC/32OMQ+CMBSE/4p5s8+0pYI4OcjqoKNhAPqAJtpqi
 wRC+O9W2B3vLt/dTeDJafJw3EzgqNdeWxOE2G6gagvTEGoVNAgmYiZFijSMxvrDnuGztAOqzmO
 VliklURRzySCAL0e1HpbSO1yzW3Y5Q776jt6fsNGt4c9ste+sG5cDPV+Qf1s9R45JHRVKJKRkL
 U8PbQpnd9Y1kM/z/AVG1q3P0gAAAA==
X-Change-ID: 20260429-exynos850-mbox-dts-c9b9e7336140
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Add mailbox node that describes AP-to-APM mailbox, that can be
used for communicating with APM co-processor on Exynos850 SoCs.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v2:
- basically no updates, dependencies were merged so just re-sending;
- Link to v1: https://lore.kernel.org/r/20260429-exynos850-mbox-dts-v1-1-7f3ad27ed4f4@linaro.org
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 911643008b9f..bdf177d08ea2 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -319,6 +319,15 @@ cmu_apm: clock-controller@11800000 {
 			clock-names = "oscclk", "dout_clkcmu_apm_bus";
 		};
 
+		ap2apm_mailbox: mailbox@11900000 {
+			compatible = "samsung,exynos850-mbox";
+			reg = <0x11900000 0x1000>;
+			clocks = <&cmu_apm CLK_GOUT_MAILBOX_APM_AP_PCLK>;
+			clock-names = "pclk";
+			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <0>;
+		};
+
 		cmu_cmgp: clock-controller@11c00000 {
 			compatible = "samsung,exynos850-cmu-cmgp";
 			reg = <0x11c00000 0x8000>;

---
base-commit: 1a1de54f7369cd2b5bac0f265910e60ad3a6b4c3
change-id: 20260429-exynos850-mbox-dts-c9b9e7336140

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

