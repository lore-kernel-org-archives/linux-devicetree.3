Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793356466;
	b=Z+/fROAyYM5R1yrZ6h5oCGRh28bGocCjeaxI7TizbSDPmZHMJnMyKMJnFR9JY8Ay4qmb
	 SZAVwRlzHambG54gaQ4FLaflaZiuSxUOVs67ORQFiXqdgtY+koEsfGUeeUdGqcpnvDL7p
	 TuKu1QEjBnpyVhg5Fj7Au0S5nrxBUfm4vYdk52Vykdg84xZZIzxddtEp31Z4CdhRP04BZ
	 5vZ5/jqEOTe+KpuHLe4GP1QPglm0a2XxZjz1so+qfJhO/MewjEV3IGmSRBQxTOCJUm3KC
	 0KmZmonXxbKFZamCy3tijSM3Tgg59EFxeFs6eh/I2Y5fa1W7buI3m2xufzYo+bALoiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=M7JJASl+nuTr5h0hwNfOIsigjQbehWTAWvZV7+ghWJc=;
	b=W2V9ywtVL21VJvbIQnfDUa9ZC+JicA29HW9HfIrbDeVF1UuiXL97XOoEBe7faCdeV0ga
	 DCrw/kzDhT0eW06V4fNmeFLbHHv2mmTbiODV580LCHvrpbJR8jiJQsur7lEgwG2tq+5ia
	 lFzUhDmzmQ4DmcrR7HNArTXI1fhLuq9lvreyOTOCCFI0DFGMK+0U/meLsp7s6rxlt4vaY
	 y0Q3Ih17qKmtE5aDsXliyu4fByBuG1Ee0E5gCx+gH2ZFX/YeXpV1i/XnNbNh5rauNEtKT
	 QRfIGiAOlK6uA+7dKxiYLZtIaDbR1Ev/tgUizWNa5Qfitl+tYhX5xskgLxLypLdkLTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YUrSWzpf;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE1660A260D
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 10:34:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DE1660A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YUrSWzpf
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3535a54bed9so903396eec.1
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 03:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793356465; x=1793961265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M7JJASl+nuTr5h0hwNfOIsigjQbehWTAWvZV7+ghWJc=;
        b=YUrSWzpf7rEQ3aAa0oXonD5YmD6ZNwZ8VIsDTCVuQwMQ2onrHFnzF/GURSkjiLUapc
         Vuf5A0cdueIwto/xKYl05FqMDLpavE7zk9wAagx3QuBWKGpYPEnhEZyq5cBLqHDv+/DP
         29xDN5BV0pRM8YISl3l7Yn8tg0OaKhRGDuf8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793356465; x=1793961265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M7JJASl+nuTr5h0hwNfOIsigjQbehWTAWvZV7+ghWJc=;
        b=bZmF4MBABR8NdcPUnnBGrWnUEd7+ykyNXsQpCNhP+gJm6EyodA1v+7BTlsI8WDDfnK
         nZrdKRy1j4k/MiXjIPrEGf0fpBhGHsLSKNDXK7PSCNHpHnNDPZzEwwdLvO3z/VJHKEXm
         2dGIk1VeiQQTW2RRRXSPm84S4Mt0EzXfGmApJYwdCTZ0gH14ifG6qoyBgfhDfZ8bDUCE
         cTKlt0xrqKrQ//vejR/vc69PrE4IRyltLte22D4f30Y7Q1oYEdZ8/nJJscybktu/iwrX
         kcN2ILEAjJXv4TEhRExb1vJQWsfXBlxcM63UoMuRiFiPMNtndYfw7+NJqI5/A8GS3dpz
         Yp3A==
X-Forwarded-Encrypted: i=1; AKwUvByUP/vdlQsnspa24Bw325KygzkTQwFUxsP9INeeEe2dciyClENPry9YwNGu6iUgQEMpWs0rv+hplWH4@vger.kernel.org
X-Gm-Message-State: AFq9FYI30NI35949wHMjDhGXRgUP2EOvSlcoJDft8aTGys8GnnIUVQuk
	uDJZLAFfqco4NZF8aUoT8U5yBa9tbmRl8SSQ+MbQdGEOPka1s/OTvrf2SZOADK+WHg==
X-Gm-Gg: AYBFou2R8KQPUmAGY0NvQEVSVYugKEpONOFJ1vHw0MeYrG4ekLGBbeWpgf/BL/E9Eyc
	WMZTm3As3VEupUN5ycnIBVna1WjC1p80xXTRoCmF7/4n5ulRMHX+IeIfLtEhPvNIzs3DSnJ9jLI
	AYiObM1q1dDhud2U0GzXJiiv0hnHW547g6unrUqwRhxhsISQN7Gsoi0Nj5ovmfcphNiZHP9WQRr
	VJXIjdoJzbHLJD7FZo0DrrXHzTaSyncKzQo3oH1F0aatuKdp64S6n/3CSzBeK2uuAf5iM3hoQDz
	M65VH7Q3euUc0/bCAEhwk6OdYHHlYE4AnpULoFFuZ2pTWxsLrvXS4Sp0wHnvLA4M4RC9RI1iFS6
	OzV2GM4mIsu4JeeYYTTjOJ1VmXW/CB5P07o7qZx45zmvPJn6ENJJfDjr7gNso90dPyqfwbFgdng
	ATYhRs5sNwcIx3/DTVXPCe942FmzVsiMJ1PPXXr9CKIp723dC+k62lUUwwvr6a4dPtI0TNDJ8/v
	m+bQa/NCwciipZAJ23JE68EU/8324WjBlwglMoETFTiJAeZFWJpmD1VYEK2z5kYT7DeYJoC55/i
	5lJ6+PXQtkNTg8gtJ9Lt+pQN3ymaMZbgfMLCr96ewH4blg34jrt890H73Pf9Uc8WrrXKAHJQ1vM
	BwxskfwWV9q86
X-Received: by 2002:a05:7300:cd90:b0:34b:4b99:24ab with SMTP id 5a478bee46e88-36a42454b8emr4378368eec.22.1793356465021;
        Fri, 30 Oct 2026 03:34:25 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:6ef0:e162:ed32:a99f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a61a0csm7471774eec.22.2026.10.30.03.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:34:24 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: mediatek: mt8192-asurada: Add ramp-delay for MT6315 regulators
Date: Fri, 30 Oct 2026 18:34:15 +0800
Message-ID: <20261030103418.2355854-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
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

On Asurada, the MT6315 buck regulators (Vbcpu, Vlcpu, and Vgpu) are
missing the regulator-ramp-delay property. Without the slew rate
specified, voltage increases may not have settled before switching CPU
or GPU to higher operating points, risking undervoltage crashes.

Add regulator-ramp-delay properties matching the slew rates configured
by firmware, with values provided by MediaTek: 8000 uV/us for Vbcpu, and
4500 uV/us for Vlcpu and Vgpu.

Fixes: 3183cb62b033 ("arm64: dts: mediatek: asurada: Add SPMI regulators")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Patch created with LLM. Values were translated from raw register values
by MediaTek.
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index d1993b80f9ce..43286241cd22 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -1812,6 +1812,7 @@ mt6315_6_vbuck1: vbuck1 {
 				regulator-min-microvolt = <400000>;
 				regulator-max-microvolt = <1193750>;
 				regulator-enable-ramp-delay = <256>;
+				regulator-ramp-delay = <8000>;
 				regulator-allowed-modes = <0 1 2>;
 				regulator-always-on;
 			};
@@ -1821,6 +1822,7 @@ mt6315_6_vbuck3: vbuck3 {
 				regulator-min-microvolt = <400000>;
 				regulator-max-microvolt = <1193750>;
 				regulator-enable-ramp-delay = <256>;
+				regulator-ramp-delay = <4500>;
 				regulator-allowed-modes = <0 1 2>;
 				regulator-always-on;
 			};
@@ -1841,6 +1843,7 @@ mt6315_7_vbuck1: vbuck1 {
 				regulator-min-microvolt = <400000>;
 				regulator-max-microvolt = <800000>;
 				regulator-enable-ramp-delay = <256>;
+				regulator-ramp-delay = <4500>;
 				regulator-allowed-modes = <0 1 2>;
 				regulator-coupled-with = <&mt6359_vsram_others_ldo_reg>;
 				regulator-coupled-max-spread = <10000>;
-- 
2.56.0.317.g454f8302e1-goog

