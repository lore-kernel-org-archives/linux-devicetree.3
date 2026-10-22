Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792668970;
	b=T1Iy9ZGI2KibUEllDRJ50BN/Upz0sRZgK20o0HL8KaZN1LrAm2oZcjy39IS+1B4emmjP
	 Jy5ZRMvDr+iW1OkG0a72EHlv+1LYgMfo+R36P1GGKf3lb/XcAOIqT75ZC7shBiTkbd/Wa
	 6t0yuJf7afGLfidZNILnLfp3ABXt6rTRR0nBl1270Yo2ENd5g1Uv55WnsvhIOpyVTiwMl
	 Lx2bZxiUypSKf6kqQNFuAsjkLxpFoD7tA86XmbulScFJyZPR9iK/trXrz5bhu8XaDpqim
	 04ZSClKRxaZuD+yN03/Vg8l+4UajrR42b25DTIpjXItryO4eCZDm3v+znhZtt5LTt/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792668970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vrUa6hIUvxLqwy7q5daZHiibTuImBxQY/Z1eTJ1hYug=;
	b=cNXGPvlfFIz6ZiHUWnTGAjSApOkn9syFtKVJUXtBCVwPAJ3x38Np4TJlsLfrBfH3LJvH
	 uwMzLo7dJg8IsSQ/mqpj/LUNvUd7ry4cE3Y58tCKx/m82kmZ63fIyYp2zyxpte6P5ttrH
	 jb5ggThPtfKqY8WbCGwOhAUpK9JrTvDRDUse+RUgvbbbEJCCaTh+FoXN7g6RGyJesi6Ew
	 2Az0lvnDLazqWEKl8qXJmCCXkDrGgVQogaaDTgAnepgI7q657sqZXnpM/P1SA2I5qP/d4
	 I9oOfj6/c1Kl0PDDDRDmZE9hw9Ca/HXJ+/hfG2TXSUNZT5b+Quc5LFskTP8l1VlAj5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CqwBtmou;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEFB606A31A
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 11:36:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EEFB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CqwBtmou
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso1024853a91.3
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 04:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792668969; x=1793273769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vrUa6hIUvxLqwy7q5daZHiibTuImBxQY/Z1eTJ1hYug=;
        b=CqwBtmoue+V4z2cEgqgcyAKEEO9D7Fmxj4ccfmc9rKZd9c3SxPNjXCFTL2WS3AIpVg
         689UEoIN3EYXhJaTEZ1QMtFU+PKsNzvJ34PhIWk+P931KeZy21rY2H3qIH9BjCJ10cWH
         GOKnFbtQ79LL/UZjAWks10/MgAE6rkdR2iHbGIAuc3Wqr9o5UZzMeJXD9WABzpSvEA9V
         j/cgoEw4y+hrJ6wmYC1EMym85Po3LwiMS/32u0/pO3jw/9G3JNlb2p5uF5bF1S/RU+tm
         +KZupmN71U/As9EYGGzleE6ZIwMt81gi1MEJ7n+23mgow/Tji999OTsoKqVwAaiQ6TeS
         mtpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792668969; x=1793273769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vrUa6hIUvxLqwy7q5daZHiibTuImBxQY/Z1eTJ1hYug=;
        b=MwPhVNvhS9l+68jE/EWqOWChEEwOeV/oRn9oiM+u8T83NyruJJ98SAqmMA1DcXuwj2
         cai6Zm/IDGiR3GwHpy9V8qc8VJNuSmGDlT5wy3sJ8URcqSQ3lIPKZuVwzHmKQl5NZbJf
         8xTzC4fZnqhzBHUD7HZYOK+Ezj0U1icxAEya74bFsnsEUCouw44T0cKjWwTGW6iw70hC
         GK/FbqPPQcGcnbqPOETw/s1RYxH8ACQgrOpNiTwvbNyn2IwCKTJfIc21E7+AO4yEEj8n
         dGlmukGIkOr5sAPb0MycTBoHH1VuQKF/kLGhnwa5IRb0G/cjKk1gAntYKzpIiXeovfoj
         w54A==
X-Forwarded-Encrypted: i=1; AKwUvByHFU5nI/ArJp6FG3jP191EL7KgR6WUww4coiVDfkOFaIXISTZYMtACwTIK6DjwB3buRtmXdTDWR/Yu@vger.kernel.org
X-Gm-Message-State: AFq9FYK+d90sNK8d6lmoaAjyg3Y6RH4aRM+MFRdBI5BfA93c4ngeyoRb
	LNHmPVzsTXF7s9NKM1RZ/RYKOb7jIofou2nd3D12TiP9t9p5RV8bHu+e
X-Gm-Gg: AYBFou3q/3TKPh7SzaLolQxXmqhNArf4/7dTrDCVbmxkaXN51X8hZBw/j5eI8xhBTTj
	W+x7d/kQY3bySEvBrXmGiprRpzD3we1BQEaLYXTt9yvULHnlcBSXnmTlAKloCAbJmodqgISTkws
	fhgRisa3YPawj96QS1Rh2ATI5veI53SaW0Mb/OUBzSZfuwgII/XsRqsab02Msirqpin4twGcl/P
	WMlYi8zZyoSGETsc1qgvHyHHCqMlO6bUd71JbPsd9Grn7ZAYJ9dxnp/E7fOeGo8WPvNmOudq7Gc
	eL/NiFjp8uI0oJVs1GwAtS9WsckEr2VzX1JizkRNS/Ojqj9pwsUt8IIHrmdB21kg+0ZzfaYLgNQ
	5coVELnffHjyhsgxaI9xu8k7arxo8a5sijMk8/cYgbgEIDnNaGwVCb+BBXV00W+rEDKRCD3z6FC
	ZKsgrrBF/c6d3nSWAeAsW6Bvfdx1WbKydOKbH5bF6onOUM7vr5Gzf7mh86WO1w66bcYKtl3b1HJ
	FNDIEdJPrjHKGYztt2AINV+K2bhBOTtlVc7j9nZuhMCQbhtHVACBPLKl567Z6vIXkqP1V96Cg==
X-Received: by 2002:a17:90b:390c:b0:3ab:1b19:78ed with SMTP id 98e67ed59e1d1-3ad86c792aemr4034503a91.21.1792668969475;
        Thu, 22 Oct 2026 04:36:09 -0700 (PDT)
Received: from localhost.localdomain ([218.194.41.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada490e5edsm3997668a91.8.2026.10.22.04.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:36:09 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	redstonee <1516235445@qq.com>,
	ShiTou Hong <dc_redstone@outlook.com>
Subject: [PATCH 1/6] arm64: dts: qcom: sm8250-hdk: Enable the sdhc_2 port
Date: Thu, 22 Oct 2026 19:35:56 +0800
Message-ID: <20261022113601.2320940-1-dc_redstone@outlook.com>
X-Mailer: git-send-email 2.47.3
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

From: redstonee <1516235445@qq.com>

Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
---
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 19 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi    | 20 ++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index c1c673086..5975878ea 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -398,6 +398,12 @@ &qupv3_id_1 {
 
 &tlmm {
 	gpio-reserved-ranges = <28 4>, <40 4>;
+
+	sd_ufs_cd_pins: sd-ufs-cd-pins {
+		pins = "gpio77";
+		function = "gpio";
+		bias-pull-up;
+	};
 };
 
 &uart12 {
@@ -467,3 +473,16 @@ &usb_2_dwc3 {
 &venus {
 	status = "okay";
 };
+
+&sdhc_2 {
+	status = "okay";
+
+	cd-gpios = <&tlmm 77 GPIO_ACTIVE_LOW>;
+
+	vmmc-supply = <&vreg_l9c_2p96>;
+	vqmmc-supply = <&vreg_l6c_2p96>;
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc2_default_state>, <&sd_ufs_cd_pins>;
+	pinctrl-1 = <&sdc2_sleep_state>, <&sd_ufs_cd_pins>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 90f8b0916..c2500e5db 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -5809,6 +5809,26 @@ ws-pins {
 				};
 			};
 
+			sdc2_default_state: sdc2-default-state {
+				cmd-pins {
+					pins = "sdc2_cmd";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+
+				data-pins {
+					pins = "sdc2_data";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+
+				clk-pins {
+					pins = "sdc2_clk";
+					bias-disable;
+					drive-strength = <16>;
+				};
+			};
+
 			sdc2_sleep_state: sdc2-sleep-state {
 				clk-pins {
 					pins = "sdc2_clk";
-- 
2.47.3

