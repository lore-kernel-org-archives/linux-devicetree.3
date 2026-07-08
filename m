Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAFA36D9F9
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 00:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783471483; cv=none; b=iQ6Y+1e88lOErjbfZADYorx85iTF9ypJALUjlCe3fsIOjyqZtIO/ZCGhPhVYSE7piz0QWmpKdlDir3iFd9jcyqQCpJoi+c+FrP0PrnbX6d86jSRHTyAQUrkGwp4/CwefNgQXHv8Zz6y+PCG/JpZGGEX0ExCrikD9V8vN06BD3fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783471483; c=relaxed/simple;
	bh=DaFrKuVYLeTZ90L4aHjimFDoXaOk4B0/5sh9EcwRuPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rhOhwzpUaajzegjwJtCCF5LxynAs+Uk8mn5LyXNce5QUlHracYAOaFsG//6xPWKvP0xPZMvBprWqXcqFkFPL1E1da+ppuPHyu75Fmmy+gxXpl2c3SF12Y18T3YL5fuVGJEVaGzhdWoAc3bDnEqpj1lmLdzzRcLbLhZP72anNjQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OEJl86Gw; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OEJl86Gw"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso56690f8f.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 17:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783471472; x=1784076272; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ewU3w7kavvWMe5j3eglerWWyjL7M+ZhO82+OFZFUnU=;
        b=OEJl86GwB3lWKqJHIR6zIxdkHFXx67/BcSK0LEaYBbubkep27+AQ9OoWH6cbtlBaTG
         rnb+5hHiDxoV+1219uSgIYOLIpcuRdl3DlOLum7g/6k0Uqps/tEk6PQg7uLKtXE3z57C
         ih2DqWJSFUop3+Xxt545mfygN8GmvDuf3JulICw9o8vccOw2xXo525fVJwyu51z6DON1
         1rsTyC3pV7/Ou+0Vry/em5fRAz0lXNWSUd9nX0dPaC4noGAH5FQUjXeXTwC0WEJV4WJg
         kCEOC2vdFEgfc+EQM1zwdQtBeNpCfM2BorKrSyD6gtLOIyoqBNlxsZ4CJicgCDTsNx/F
         xOuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783471472; x=1784076272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ewU3w7kavvWMe5j3eglerWWyjL7M+ZhO82+OFZFUnU=;
        b=eKHNa6/2OO3pVf5/Vhp9xYkinJBbSpwkl0rb5txjqm7/Dw2aIjzlLwPOyJA70mBkEr
         hcur+wVfaBhYbs16VZjClUYYLoctAwQkMpcssCB9Hz/nnTV1lAx1vSiVsM5buQ84keoV
         n0ZAIiyAflBL0kAQXLAjQSJwd87yrsLlOwF7a3+TqM6JFi203OdvgZmGl+W4bcsgOdon
         YLpzmtFpvWHd00sJeNPtCR5NmSp2n2tOEJi1XU5vkmiSUAVtzRtxM/OHC6bAwa00C1qF
         zZtUVmWz5CBp40d0+MHOltJqHz6mGkHjY4LugH0Jf06uXFasKFyUmz3c48+GRIBvcmlr
         rFMQ==
X-Forwarded-Encrypted: i=1; AHgh+RpY1bDgyMBboTitExIq+8cLh7LqaDFjVhXusxje4ffnapsal8CYtDKEFwAHH2dzIyybKgDNoEVSftlm@vger.kernel.org
X-Gm-Message-State: AOJu0YwrMXAdppp6Bj2hPQTHowGfP61L1YOBlKnFoidOaqxwpcHruZLv
	dBWuBj3zBSQtM1snKAhFcIGgKMF9ZdYFwcHAsV9bQwgqGJmbHkD6k/gbBtuiP7iTZHE=
X-Gm-Gg: AfdE7cnaKt3kOLWj4SjMc8c9Pb/5Rr6CN/2+/vnGWHUoO9Hk6FNkERS/93Zn1rBkcDI
	HOxWDS6L8Sukub+SCOCXG+ILy0jIGwrhWKbVfXxuFr1NSCAAvVPUC3U/AgC4ZcCBcC+e9mFsh7A
	Yh5AqUu8jRcBYTKbADyGV4IL/iOODUO2USsKecyeBiLu8PiHBm1RRGuT9Gk0zU5O397DOYCk9k8
	z7SNpVgKga+SE+KioGBV661qYzoaI9gfmh20yMjhvCkqx72G0JWtPfZHCcc45Ryiy8uD5VRb+hl
	SIRXSgk3DqbNIqIJzqfjnD5ejxmZ8k0ZT95z2JWouaYk9aHYURiheOe/rWIeipJbF1odLT7b1va
	6tNX7BR2YkUvtmvitbuy6l+aPY931UIa/PS/HLLAfRPb9Yx4RfE3QdF7UBJ9FYMbI4SPVLJkVD2
	ekD3kMrH80lOU3WEujuMTlvdM=
X-Received: by 2002:a05:600c:8217:b0:492:1eed:3e67 with SMTP id 5b1f17b1804b1-493e6899b71mr1701135e9.26.1783471471767;
        Tue, 07 Jul 2026 17:44:31 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.92.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0fc1348sm99727985e9.14.2026.07.07.17.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 17:44:31 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 08 Jul 2026 01:44:15 +0100
Subject: [PATCH v4 08/11] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add pm8010 camera PMIC with voltage levels for IR and RGB camera
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-x1e-camss-csi2-phy-dtsi-v4-8-572348ad1b2a@linaro.org>
References: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
In-Reply-To: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2225;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=DaFrKuVYLeTZ90L4aHjimFDoXaOk4B0/5sh9EcwRuPU=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqTZ1exr++LCv1GrmaAn9ijiOPb21l2ezSBx2/a
 zM1+lXID/iJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCak2dXgAKCRAicTuzoY3I
 OgLxEACeaM2HCHavnAn+PH6R/6l0W26KCxfIe9pMqZsb81DWTgieLvsdFzwgH7G0u7I2PcXqnbj
 n4YB1NY9Y+X3wHtoJLoU5C2f7Qrgs8HxcbzPHwvL0TrXSvgeaZE6XGyYgnIE87OW26AB3Rz794B
 TBBIDdqVB2ut7fDEhGX4NMypO7AEghOb8d2Pf+OMji9rsYn1h0vz6AmMcnsntKbqs3tWzZQUqNS
 i8e36fXTWk0Q/OItSTF7fm6SCWz4s5EXiAgMCWpFFAlx23BNPnp31SDZhEqCaVoQcWpVUEUxvT8
 mHlBEpKeTltpc6/Yxe3X8pIOc8/TiST7bU1qXuM40wbWqOJSO4xsdXI57P/zewta+mTY5ITSLWy
 jvVtA2xq6Ji8P3ltAw8UX54lWSdpNGhXY+aYSmtfhWmcAB7jNKGKBbTf/xPWk4Yllj9Lxn06Xnm
 PXy1nyYGzuK0C1KA4tXPKvi14P1d6g05sen5MA0Bi670YAKzk5mMQK/GelgkvbF5cqE5wsZc8dR
 5pwqgF6MF23Dp8jMgrqmaYZ+BODeHQWfspcsBtWeTpoXCdGiRstCO/qSelN0rgEX+2zjKAmLtKG
 Dj+4sK+Cg7Vr1zvk1vQ052YiClSehLsR+75PaP3yGLtfnD5uheNsFcDGzfjMdbqU/SgNl8uHUTt
 OxDhmcMgWLl86pA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add voltage regulators-8 for Camera on slim7x including:

- vreg_l1m_1p2
- vreg_l3m_1p8

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index beb1475d7fa0c..0a8275d501f85 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -795,6 +795,57 @@ vreg_l3j_0p8: ldo3 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
+
+	regulators-8 {
+		compatible = "qcom,pm8010-rpmh-regulators";
+		qcom,pmic-id = "m";
+
+		vdd-l1-l2-supply = <&vreg_s5j_1p2>;
+		vdd-l3-l4-supply = <&vreg_s4c_1p8>;
+		vdd-l7-supply = <&vreg_bob1>;
+
+		vreg_l1m_1p2: ldo1 {
+			regulator-name = "vreg_l1m_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2m_1p2: ldo2 {
+			regulator-name = "vreg_l2m_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3m_1p8: ldo3 {
+			regulator-name = "vreg_l3m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4m_1p8: ldo4 {
+			regulator-name = "vreg_l4m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5m_2p8: ldo5 {
+			regulator-name = "vreg_l5m_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7m_2p8: ldo7 {
+			regulator-name = "vreg_l7m_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
 };
 
 &gpu {

-- 
2.54.0

