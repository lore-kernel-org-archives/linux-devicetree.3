Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22AD4973B8
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657753; cv=none; b=mfCMJn+ms6xAAaTKejb9SX+KZmX22ONRHMaFUwNb5g8yupy+Hx7xdyQryFuRZHznLt3TuShINxCMVD2x38QCBYE/2994rXQ6h75eUjg5K1ANVYv9dLnZNRdcB6uQctFW42/w/je0bHwnUP7loVFNXXN6Q+ZNQKsqa5u2t3QKd/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657753; c=relaxed/simple;
	bh=JSGj5xAcSCNQ30zQL91dR8x6nFv1RRyex1oTM12XUUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vx8rtzD/Aj1clVlJ14quByHc1Z/Sv/vKfMAgoIi3P5b2B5VGUf3wxzN4t9jdm0ZrHXYrbWraQ+ZyWAQdPlBMgLnyqdkHr5eGHUzORPqzq66PH316UGat4lem6q81ynylpvOnAgpllDHKmb2RQMnXI1euat33YoykCIaxpEkITKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UNJQ+Vmj; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UNJQ+Vmj"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d097b4939so5386685e9.0
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 08:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789657741; x=1790262541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kT758iWLtr3Wtamxp4dNWdKJ2omPK36POe0fhekDF38=;
        b=UNJQ+VmjgMGY1WleGMLZ7pAPqEZo803xjBWt/QyJbN+cxCK/aaEkXuQa36tTls0XzH
         h53nF17KPPri09kqWJWsP47TEPj3et/66noqWVr32cCTIiq5SmxoVynKcoiIywsUaCDY
         29iqN79pFxKIaTWW7bb8Q1/0QEVLKrU7ccEFVlCSiUqofiAYIhS8Ym2VchLl5teEflFn
         iG/5cY4Y9PBYQ1T9zHqRPpihPFN7qJ2pJXoPCx5J0ne038uqO1m0C0CtFWetywcZHMsJ
         njcvylvPMmp/83Rp3ILgFczYmqBWCZ9lvLTm52LIvHSdCFRq8Ww0BAHvhro4hHo44bZO
         2YAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789657741; x=1790262541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kT758iWLtr3Wtamxp4dNWdKJ2omPK36POe0fhekDF38=;
        b=NNZ/K9otzVE3k/oj6kJWdv8YAdBHBcDcBG09/FLExjp6+7TmiSuAYeiajtIDonYC+h
         ff1XuMc8EdhflqEHq3+4JmxDjpMFfmpcyQH++bsjigIc0mTrJJRcvz9Of/4/p4YZBQOC
         nuKnSTF1ZVrKXkMgmH4mSVfpO4OiABijXEuvE969fjUBP4LzIiGhn8kFXwHDcEGxqidT
         FSsGdGXLI0AddbmIfgbwFY2mf7SM8sz0UCcgTc/C4/3jmB6+sCViLk5fsco0DWRIvh/a
         ki4oeUyZIazd8XTTGJLAqqr+vFERoaVRLGHHVWlgM8n9sfce6n3q+ZGPEoACT2XKNIXl
         uNcg==
X-Forwarded-Encrypted: i=1; AKwUvBwEaYI7zj249XberESwXdXT8WA4svuzPwZlq86FKfr9YEtbchpa4kIPKmr7h4hG29XfBHDf5nqkC+NP@vger.kernel.org
X-Gm-Message-State: AFuF++kwhBRwmYJk9V69e18mwNoAe4KK3hJ+tI+QtewNIc4ksQZtAajU
	8lodkDErFwDP50wRNd8iCE2LFwbezlb5AqI93c58dF2UJGK/MH7xXm5a
X-Gm-Gg: AYBFou0eulw+q58jkJIlrhmf+CajWVtBg3PHBSUsN/uOey77sgV8geTC2zgXVQBJhJA
	M+5Psv38U3y0SYJHPcRmYOMxYkuYbdMfyDABwdFzECzA/43SvYpxI0iXvgFGm2dersvEsr7wU5C
	+II2Q8Mys/t4Sy/MeUG4v2W83w52RPkw8QDoYaAUPsaGkyCsMfMLg1lipFyVMw44x4rw9FL25Tn
	xSyz8/SQbC9momZHCOMtfXur/+miesqZXS0G2YdkZz9+7IViljocGPOe68qe3m8rbrVUydgb1rC
	Me2c6y+EhlZoj89jSfRH/u6dBR1dsvNjmPk5xFEHsB777cXeoi2lUskwOzjg6pO3u3+0tVdkA1V
	aHknGVREX4RwKvCnwbLXnhwR0d0gE0+ao08V1tejK/dksGh6wFL22SalK0SnflXfF2kJEQtGzmZ
	ai0dSAhjgubuLRcoEakT2a8dJ8as+nZ2myqq1iiXJqXavXeVvY+lUgJeSBgrf3eiN9yecLJQQXe
	Opc70i95lsgtrnmLqNr+lQSnJGtlLDkxKVs6SSkMnXefiCJszOtmAP0Ce2aAHY8njbZn+B/pqJO
	pR9M8B6oD+OxKGs69bXCNw==
X-Received: by 2002:a05:600c:1906:b0:49e:8418:3858 with SMTP id 5b1f17b1804b1-49eb51902b2mr88747985e9.9.1789657740710;
        Thu, 17 Sep 2026 08:09:00 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd226ef3sm82531345e9.1.2026.09.17.08.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:09:00 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Nate Drude <nate.d@variscite.com>
Subject: [PATCH v1 2/3] arm64: dts: imx8mm-var-dart: add TPM support
Date: Thu, 17 Sep 2026 17:08:44 +0200
Message-ID: <73937e762f723d9246778f548c4c9d4b087e4532.1789657399.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789657399.git.stefano.r@variscite.com>
References: <cover.1789657399.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add support for the TPM available on the Variscite DART-MX8M-MINI SOM.

Co-developed-by: Nate Drude <nate.d@variscite.com>
Signed-off-by: Nate Drude <nate.d@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
index c7a9eb23e5e8..9fc0f7e551ca 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
@@ -138,6 +138,13 @@ &i2c1 {
 	sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
+	st33ktpm2xi2c_som: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+		label = "tpm";
+		reset-gpios = <&gpio4 31 GPIO_ACTIVE_HIGH>;
+	};
+
 	pmic@4b {
 		compatible = "rohm,bd71847";
 		reg = <0x4b>;
-- 
2.47.3

