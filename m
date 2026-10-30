Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793323937;
	b=Apr8oawfl11YgvW/hycfsnr1I0zAn3H6L8eYjADhhe2YR/5TxRikNIXBY1Fo7cJUeE+C
	 gX1Jz4RnVdnziuQ7sLJFqT/H1NA+ceIZHFzqSWNbQcs+r+m9Xmwj+4SRpqM1ltF7yv3y3
	 VBhZAjaxYi3EQht9Cckl0YoMxKVg4Nz+podJjDUrcx68L3bxCeBuNcnc/iazujEB+jBTq
	 ZMpFQ0OUdom4Il1CbyO1yTKZk2VdG9sDeEF9MVl60j1KKdnMgWIOiJJMoSsaR3Guq2tMP
	 TmnWvH8U5Obkkzy6OmrhJ7UoZ7ZP3E3v7EmFfJIdsaJ4frB0dVxz2X/rcT++0dAaACg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793323937;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=bLVb6wA6hpXv4ng1CXTKPHF6TirtWtpxB3LCEmyOUF8=;
	b=qZr3oxx8nSw5J7LJjPErnaoEoBcdyDN0sscjzROP/ktsmfvdCZbMIcdo/DbLbK/d9e25
	 EBE4os+l7GYZhyp/mPq0xaPthJwFBQpOqtcTOdgFQU0+uzI00aa92HbumfbhIagmCgcxe
	 b1MO4Bd9wTq976HHQCML0T5aPOZ4Drq1Ovhc3PhInGAbEya0Emqfrboqe+cPA3o0+sQrl
	 isb4UOG1nw9lr1F9bQzawKEdRllZoEp3OAJnNlvCvxhK/L/z4tzww8M4JBNBZcLc6yfw5
	 D0gyL+G0HTrulLZjDOEyruxl9NmVqJFO7NgVDWf/Fyi/HkO45aUGBTei64pDAYBh6lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nt6GIPQr;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67EE606A31A
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 01:32:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C67EE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nt6GIPQr
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e60f9af6e6so2089245ad.3
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 18:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793323936; x=1793928736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bLVb6wA6hpXv4ng1CXTKPHF6TirtWtpxB3LCEmyOUF8=;
        b=Nt6GIPQrGe+ghLLgDNrWtnfNPXKvsjyXRuuG86PyfO6+OWil7zALcj/CyZX5WNE554
         GVshKQ0HEaBtm/Os0EmXNh5yDLa6L4xlTbVvWTt59/P38kYTCeD1X/urdL/Xa4cfR9dt
         Fr/c+qUKtFrd8HADZvJ6SaJrfSGABhtjnzRhDqFE6TfPXp5UnGyDlI0Sl3HaDuTqxITj
         zdzpvATfCYrG4OqBDdt9NKipGDO3w7ryy3sGOjvX9hfJX+7ehEv4JG4Z3IctiORKhbWG
         TGgbUZG0d7MXCPCB+4SajbFvUcU3Nhlm/v/n7bmzJBpTAlFPuf3shF9BAvemoRQ2tV0O
         FyQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793323936; x=1793928736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bLVb6wA6hpXv4ng1CXTKPHF6TirtWtpxB3LCEmyOUF8=;
        b=sXvz+J0CFCMxHA3TaroLwPyvgL4FQj/kCa2A6nMcNloQdqEbAF66lDJ/KJn30lngjU
         zzJpiJOBo3vmTSTiucI1XWzuCV2+l0B2mnpggGgg1SRWKjF3gqk7GLg6bwGTBAeJkoAX
         3IfLHYGgO6rQbLktX7+WJkNd4AoSy+YN76x18FraN/0FC6c9uh8x0ob0cYYtjy1Jffn/
         8iGup0KA3J2F0bqSky10gu+ejjjf76MyShVy7SIaFK/HTV3+xj/uPA0W76qSf1640+ps
         gm17rK5qGFLw1vt6n/uKrbPu43Z+2emiIih1QUkSGoVa93FuWPwdruPEMYb6DElJMudD
         WtDg==
X-Forwarded-Encrypted: i=1; AKwUvBy0CTg1Tx0Tu8hU32V17oQJwSD66Wm8UQQxmYnoVgcwiUmLff9PRp03wmxHxiaZL74DHNWFxRLycs10@vger.kernel.org
X-Gm-Message-State: AFq9FYJRvZF7W2sN6R4zpaypbOuxzcaQ/JyFi8yeeyO3sxfTeaqG5FWM
	KSCI3pHvZ5m+8qzD7RH7jd7wd7LSzRLJX6w4YUlxTZc+LA7DlMfl8nph
X-Gm-Gg: AYBFou386lJHpkNv8xHtGMjAkyYrGtI17aeapzWlGF+BGGI64JiCw5rDr7zIo4mEX3x
	pNIoUiOVUJU7E/kknHgDsqw4CRM3W2Neqb3GfuR5xwNEKTgFCDykDYJUMqb3B95gQk17/hQusUk
	wgJXgdXbzLdWcEKxBgFyEtmyOsVCAKIPCWVpgZ0FAWanR3w7ZdduWPg3GIbwQCWifI1eWMQxc5p
	4F4++TS9ZbaSSIV7iPq4SjChCe2jrah9uCoRz6CS52G/sZ0aDlsJCOqj3gCevahkGjbWrEe3cW2
	pK94LyXaUZGx7w5AHDpMba9qfX33JxEnOYX5pPpkOUBcl1ZJPAA+56cK6kmpMvAtlpIg9c6lpm9
	E0IrgQQxQz9U8BersDQUNH0S9qY4eKaQaU8wKKS3rr/x4v6Tfz+eerGTki1P7a7VpWXcrDTel/K
	b0uioUkqvmL27weuwuv0grfHt3TvVPlOB5yySB2NTa96BQ0LuGIvRYiZ1ldLXwe8A1VwuaqaF4x
	Yt1zIcaB0/aqg6Oj5UelyxJo/8BYX8DsmGq9hY4t0cGvt8JVMswSF6z8Nx1ka9UkW9f8zALe9ns
	T1KFAeev1l1OgXTMMEU8SuBJwMgcYshVKt5G1dkjmD4=
X-Received: by 2002:a17:902:f70c:b0:2eb:a1b:e9fd with SMTP id d9443c01a7336-2eb364de4efmr10001075ad.41.1793323936252;
        Thu, 29 Oct 2026 18:32:16 -0700 (PDT)
Received: from localhost.localdomain ([240c:c983:5:4bbd:2481:c7c4:68af:3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392b15f0sm911575ad.73.2026.10.29.18.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 18:32:15 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ShiTou Hong <dc_redstone@outlook.com>,
	KancyJoe <kancy2333@outlook.com>
Subject: [PATCH v3 4/6] arm64: dts: qcom: sm8250-hdk: Enable the PCIe ports
Date: Fri, 30 Oct 2026 09:31:33 +0800
Message-ID: <20261030013135.158157-5-dc_redstone@outlook.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030013135.158157-1-dc_redstone@outlook.com>
References: <20261030013135.158157-1-dc_redstone@outlook.com>
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
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 33 +++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index 1efa9d53e..fe89af067 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -55,6 +55,15 @@ vph_pwr: vph-pwr-regulator {
 		regulator-max-microvolt = <3700000>;
 	};
 
+	vreg_3p3: vreg-3p3-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	vreg_s4a_1p8: pm8150-s4 {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_s4a_1p8";
@@ -499,6 +508,30 @@ &mdss_dsi0_phy {
 	status = "okay";
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

