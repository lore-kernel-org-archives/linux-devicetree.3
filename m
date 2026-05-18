Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B87D3815C3
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 20:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779135786; cv=none; b=GQ5wcCgSUL+lFCwnps3IRJTShiladrBifRIcQYXngwUEUGEGs3iU3SEBaPiAsDgb9V0TLWhtcNvWwnGFnTPOHvbmB7TgL5woYqgMvOPCDZm6C2suOlOGnVSPEFkVn2J/JcGer/GoETQiSRz9CMyVqHfh+S3r2VQ2ouR+c+O4jUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779135786; c=relaxed/simple;
	bh=76imd3xvKIwUkGBVDpZRcuQTnCY8Hnrgy5OngDhkblo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rL8VvYQ6ozmKEQhMOKfvsqI2jJxYt1UZAI7VClkc717IsaeOPg5isUxSNK/nkjmq2mEeGirumTrr476borH3WRrzLIHH63ZE+IBst5SSfSxruxf6EkTicEYoYam9tgGm1nAtcF1Jyag7YDeXE/gV0fAU9EI+gF74f5leE+oiS4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mM9+02m6; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mM9+02m6"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38be5e86918so37336921fa.3
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 13:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779135782; x=1779740582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tw2B0mpnGoOvamKzgFhtoftN+PwqkKvsefcUjvNFdnY=;
        b=mM9+02m6JXu3/BhrglIhDvyLkMp0xUnvmGEqTbI2en/IQMN9/3jf+hedyk5NBEFttD
         RMy1aR7NUgX9ULlYAOUZ+sNI9nuBoyUOkNxkzBJUxpwYkKFgFQiIcRWTQOPhNYfyUnAG
         3uYWhANZn/dccRx3oU4RiKUBgYWDy36c1w5mV2ZPUhpxa61T550WQVYIwjWjP6ckTm5q
         uTy+8iUML/hjVvsd7KX37fE9m1cIRqNMaiaC2p9lGLGBob3YiQva7Dgyh4iDW9Djokl2
         Jt6CrUZaCa4w0TdS6cOWyisNNHMiioICtWKfzSe1syZ1p3T8+cx3vrD7OEKARV5F0BOw
         87nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779135782; x=1779740582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tw2B0mpnGoOvamKzgFhtoftN+PwqkKvsefcUjvNFdnY=;
        b=gYs0Qe3K62dJQ/tOjfIc9TU/HM6+VpBr0euawKDrIAyIn+N7BTaUEtkceFqURUeJ0e
         aReLLCuXWNGAvx+p3gLA3ULDTlYHGbJiCfAdtX3AW3mtQSxzzymUIde1PwGx21yEwDVM
         JoEGONg80pOxyEIYYnmkhrFvRyRaorTTC6XdXQ5CL6TDyEAh2chVpX0MxFoCXwuvz/f/
         /3VqFgUmLs8AtM4h2+ClfiXkCeAY5ksvs8fZuA75gO6L6UUE1qMCoxq1tA7HHEuMMQNX
         47Q+HC6YVjdxotannhqTKAzrRXfsJBv2C4UeQo9b2cViy5w0NP8ipvAoUAeNxWPQG8Ry
         Ll5A==
X-Forwarded-Encrypted: i=1; AFNElJ8pXVFHXUFWBlfgWYCO30oCu2oUevFlr9hIHPLGiNmAfRpy0Jv4W3zeOaKfvv3B/GRO6SloFfYo8jWE@vger.kernel.org
X-Gm-Message-State: AOJu0YwEQmPfuuP1x10VmtQ6IEqOW6N5eGAER+8JmtidW7rz+A2feECo
	sOL3qtVEQWSPloMLSkMt9hWOC/K9YnwC7WXFHmOpP01jnn4snOukmI99
X-Gm-Gg: Acq92OHmiIbQxmdiLGb+xCbdHg451/J61r36q28N9mK2SmA/UvdiWXbTnfWXX5PXi86
	UQ1RXSC0k6KRcarBHlenv38LWl+yxtpxcue6c8oknXIzJPIVTDt/DRtWadINwhhRRZ6GAO6ARPs
	dl/lVcbTuhz4ZD9ZetkuhBHTWLsJKK7ZUiNeaBa8ZwWBW4IKakE4sphGrpIvZkmHFzLRZKpuu4z
	KmPSpvOYoJyf0aoFjr//+5X01meOjeLMBlfT6oh5cs5w0aeH04onceTkP9crYfQSGhAnNuE3VnU
	8XHoOiED3m1tXMEPo9eOglWgzuXa6cXDOUZFh+I1pES3aTPC2pDQk3Zr5HGFMNPPsM11r/9W3Vx
	clQ++66f2LoHdPH1//lrDK6QtQr/TyBcHFGNPOPg4SADGyZinF1gYYFlI95+0DP3X6NWkweefRf
	8wOHtBOrZxEdXt4O2zfBYNsCRUtYGLnXI7yGvne63EBCqfSYqoafo=
X-Received: by 2002:a05:651c:4393:20b0:393:9ee6:1b7b with SMTP id 38308e7fff4ca-39561c3734dmr39284741fa.22.1779135781624;
        Mon, 18 May 2026 13:23:01 -0700 (PDT)
Received: from localhost.localdomain ([90.157.113.57])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395887b42f8sm15225061fa.36.2026.05.18.13.22.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 May 2026 13:22:59 -0700 (PDT)
From: taygoth <taygoth@gmail.com>
To: linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Casey Connolly <casey.connolly@linaro.org>
Subject: [PATCH 1/6] dt-bindings: regulator: qcom,usb-vbus-regulator: add PMI8998
Date: Tue, 19 May 2026 01:22:46 +0500
Message-ID: <2a3c65bbfb85d944110b14b40ef375f238ca3932.1779127507.git.taygoth@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1779127507.git.taygoth@gmail.com>
References: <cover.1779127507.git.taygoth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Qualcomm PMI8998 PMIC integrates a USB OTG VBUS boost converter
inside its SMB2 charger block at offset 0x1100. The OTG control
register layout (CMD_OTG at +0x40, OTG_CURRENT_LIMIT_CFG at +0x52,
OTG_CFG at +0x53) matches the PM8150B SMB5 block, so the existing
qcom_usb_vbus-regulator driver can drive it without code changes via
compatible cascade.

Verified by inspecting the downstream qpnp-smb2 driver and reading
live register values on a OnePlus 6T (sdm845-oneplus-fajita) running
mainline Linux.

Signed-off-by: taygoth <taygoth@gmail.com>
---
 .../devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
index fcefc722ee2a..9e2e2c8f9539 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,pm6150-vbus-reg
               - qcom,pm7250b-vbus-reg
               - qcom,pmi632-vbus-reg
+              - qcom,pmi8998-vbus-reg
           - const: qcom,pm8150b-vbus-reg
 
   reg:
-- 
2.47.3

