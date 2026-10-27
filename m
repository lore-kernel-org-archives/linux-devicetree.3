Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793088632;
	b=LPaY49ixwgqsHbT22/iggySB/Epn36geVeOLhqhKInoG8IljME7QxkAqD3QBLp+sK2TB
	 8sscYO/4bq0yCpRjYcXCb4s30w4SXnIpYPk79SBOmn/SGG6DqpeFUVVfOLa3UNwf9EvcE
	 rfG76jSYNDWFW8fX73hPxnK39NIzrLyOX9wMRizg7JJ64FZ3x6NIXVYaNa4ipnjSFYfqf
	 +MwmbUZbRxH9bwaXA8Fe/UilJe/UkuKIwoLy9tbLGdlTucyLgoNqIfreIxdW5YlNxJ8I/
	 4N5HlHtAFgx/r4U3UyRQIq1f6P0n/66pI6mKRngyFmTbqWzlnnBIam46HGivs0thzkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=AzsQXFv7FsTwkUEghkVXxk+mAwyaKwsw0bJgHhcNoYU=;
	b=5IDwvC5GjopRSj10FR6yB3XAwRBlSefCbWtMtpKVBza/sSmdAGHz0sYI+cu+WDkKniBA
	 eTqnBNLm8R1oV7INts3QaceM9Jt01AS/mPF31anKdDYqc7XsJ5vzyi56tSVihPCAkFcYc
	 4gfgJ4huzeHFBlPodQ4kF/DGxkW4O2tp3oHu6Ls0nPblQ7JfwFeWbdcBgb4NKf0ifRVfY
	 XZWmU2PMwXi9umdZnwKf0Jn1yP6m0l5/JQj86vJD0tDKZnT55vBxngYC5F/9YCkf+84+6
	 WROe9HR5rLQ92nqEeqYdKJ33RPwVg7p2V0IqrpxnPcj5wKCgosQAgVnI6TizM4NrUeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jXpfxjzk;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB66606A31F
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:10:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DB66606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jXpfxjzk
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so2022473a91.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 01:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793088632; x=1793693432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AzsQXFv7FsTwkUEghkVXxk+mAwyaKwsw0bJgHhcNoYU=;
        b=jXpfxjzkz6z6bRUqVUQeO/4ecumjeItXaGjnLKeVThkI48nQ23ZozcvxBS1w7xZjsF
         gayLrgF6258/KC9RYZHynUferQjle1UiZVUuGhSpS3Tj1ewbG2hHb/MfkBZfg9PUcxI5
         itdJjOMwMwJo5mgaxxGRFjHIwg5euu2ecr2IbuFjWpYwezfU2UrasehMz4fOheuHt/5x
         bRN7ihM6ZKsUe8tjJ09wSS6+7uIsDGLUZXBFYjVhxe55TlYixEUHcZHA+/HCi+OiuYA7
         vPaYNkgf/bKKchxvCyn+Y9UJkN5dGhTmw5KKq4VZ6YTKcThCN1xYKisLBxOkzXg/e9op
         7qmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793088632; x=1793693432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AzsQXFv7FsTwkUEghkVXxk+mAwyaKwsw0bJgHhcNoYU=;
        b=ir9u5UBPNs2bA5SBWHCGt9zQ+RdRxBFHkNeiOsSbZLnuz/c2zIC5Wpx6bSvU24IJXt
         asxwzUOOOBVOeo03So8slLIQQXMf+s2vVZphAIcgncROe0lngY+YNlm7ruhnpQT5bIlG
         G0FnE62WKxILxANSziiwMin2aNshVcAIE3vQ+Tj1hzHdAtzErbktfioNfEibMV+ZlWAz
         9rK5j6nvDZnS3YFrJlpErF4gqbh7qIh7yEDBbfJt/c70nUUMYLpLMb2Y5tkoyS9YJI22
         TLmL35+pL57POhJ1Nnj7/QsBLawZ0nFC74QmYhAgh1+ZGTHjRweTUOXwj1QKej4Pqh8k
         0YNg==
X-Forwarded-Encrypted: i=1; AKwUvByldH+c/hYZZrTEdYwBhBslu1jmzM/tZe4O+8Fs5g/qIQZC+iKQiI0c6s6WDBF49GgYJSLWDtJqY43f@vger.kernel.org
X-Gm-Message-State: AFq9FYIYr8uEywUEBQLOt8TJ/SltYAlKoDNudWvl47N58GCMKzo9d7hx
	MaOmEOranA35kQS+KHE1sEVCIHDj7voj1kg/Iy4wy3BMsONZEKoKWDZhvdGXB4Uq5WI=
X-Gm-Gg: AYBFou07BH237Qycvc5F/xLt74cGf7kJSGXyFBGer61WkBViTBkEScN1S4GdGyeLgHG
	fk00LbhIbd6Vo7JwYI0TPk+BrzF8ZsCJxktWbKmK00DPdlHS1iNB9p8O46wBQTiJdeavOqb3xe/
	TO6LdF4zf1gYV/j3NllRd46B339CArNwXL3tnvGVS7/CEyUArqbrL7elPuR60PQ/erCAWMkL7A0
	xmKbr5m1DEQ+DA8qbCshMTnLpODyRukbee/vif0jp+46NsCngWA8bk2DLFwvUy/4htxUsT7NwW4
	+Ld/q9coeMW0hSbPC8eWn94XMFdjoc7JAhNO5pqqVBZbRObPAJzzDeQQ+zyXulffWCSrcwpEhCu
	NZjK2BblEMsWt4XQy/5V189ZQx+67dJQ2OQY4NilUbuUKVdvJc3bZ4j93GitFEz9doEm++8s/jP
	VA+NKcnKkVnXVAZJGieFlnuSBzyYx5+M/+W30pQycEVjy0uDU+68KUHOXmflErtmlqJODBvlLfO
	0PXl6DLcLBgMvsHmZAI0Lw1Hgdi+euQLjE0xspFl68gAzST12ubV3ztjUuq34o7UZS8mB9NAg==
X-Received: by 2002:a17:90b:1c0d:b0:3ac:7556:8ed9 with SMTP id 98e67ed59e1d1-3adea9dab5cmr6997154a91.10.1793088631459;
        Tue, 27 Oct 2026 01:10:31 -0700 (PDT)
Received: from localhost.localdomain ([218.194.41.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae406361e2sm2592284a91.8.2026.10.27.01.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:10:30 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ShiTou Hong <dc_redstone@outlook.com>,
	KancyJoe <kancy2333@outlook.com>
Subject: [PATCH v2 4/6] arm64: dts: qcom: sm8250-hdk: Enable the PCIe ports
Date: Tue, 27 Oct 2026 16:07:56 +0800
Message-ID: <20261027080758.3990418-5-dc_redstone@outlook.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027080758.3990418-1-dc_redstone@outlook.com>
References: <20261027080758.3990418-1-dc_redstone@outlook.com>
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

The sm8250-hdk has 2 PCIe ports which are not enabled in the dts.
The pcie0 is for the on-board ath11k WiFi/BT module;
while the pcie2 is for the M.2 connector.

Add the 3V3 regulator node for pcie2.
Enable the 2 pcie controllers and phys.

Co-developed-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
---
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 31 +++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index 96b4d6c95..6a7852080 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -57,6 +57,13 @@ lt9611_1v2: lt9611-vdd12-regulator {
 		regulator-max-microvolt = <1200000>;
 	};
 
+	vreg_3p3: vreg-3p3-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
 	vreg_s6c_0p88: smpc6-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_s6c_0p88";
@@ -497,6 +504,30 @@ &mdss_dsi0_phy {
 	vdds-supply = <&vreg_l5a_0p88>;
 };
 
+&pcie0 {
+	status = "okay";
+};
+
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l5a_0p88>;
+	vdda-pll-supply = <&vreg_l9a_1p2>;
+
+	status = "okay";
+};
+
+&pcie2 {
+	vddpe-3v3-supply = <&vreg_3p3>;
+
+	status = "okay";
+};
+
+&pcie2_phy {
+	vdda-phy-supply = <&vreg_l5a_0p88>;
+	vdda-pll-supply = <&vreg_l9a_1p2>;
+
+	status = "okay";
+};
+
 &pm8150b_typec {
 	status = "okay";
 
-- 
2.47.3

