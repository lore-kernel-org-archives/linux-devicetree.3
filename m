Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616550;
	b=Kx5HuP70HCR8PGB1/0jA1VwFw3SRDliX8t8cVFBzVyu604iqrkBpPW1ZurkP1Iv9Z94+
	 frVFuAAYMiWk43tuLPNHee1axoGqZU9IlGBXEhriZns+7gRIeaKpNxgPxkP8Vb0RLvd7O
	 sXFj9GfWsQxd5v/AYOZr7RQQlxL4pxOYqrW5nX3Sj+6jt6wxv1WtodS0SaAzhHDWZdirt
	 UIQvu0cxErivMbxUb01OFTQrIGb+pcFfaWPHp6H4wCiCV2W7BSmQVUvzk1chajoO9IE+K
	 60yGVZdeNmYim3AoQFad0iXrk/dXplbdpNzOYvIqRtxl+Y/le3U9aDKRCW9fzZ9jtPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616550;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=GDvxlFRxYJ/hkyDYpmeqRD4w+SNrEBTiATTaXGwEUVg=;
	b=VbmB2gQ/MhmG0uoWHziCRFia3S9im7WNXjQ3B+1feQhlAuiKcrSRFHvOYuN412mNpmu9
	 8L2ncgbvi0TQmReTkXIGoeF2Ut6z6UsPRnX9WEN3kqqG6GD69fCh94K68DOvy3rCm5vIw
	 SXLMvcEK0bzx8G3f5Q0y4FdkVp0aCUqrtUkyhLuOU3/asj/j+zBf0NnIs3NmrDXufpWds
	 bpMhEOMdX6TMsryubjIlZb7dtkhX3crDiYQgVVW0cFvRq7ClZGkWWFBjYvO6+DsB3bFGW
	 SFGC93IPp1xiU00Xfl8DGqkLaU+HF1IjFfMILwtchnFtGEFliX7wBRfAV5Jdn2yjtjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JBqiJyHV;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F54606A33A
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 14:22:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01F54606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JBqiJyHV
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b88b74e54eso7212379a12.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 06:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795616548; x=1796221348; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GDvxlFRxYJ/hkyDYpmeqRD4w+SNrEBTiATTaXGwEUVg=;
        b=JBqiJyHVxbIaJhvX7CSXxgauJzThYhz2o9o5ZBtO+G/porJf6N7RAEpkZpWIShdHQu
         KM5Qra5i5l6Xg9/rWu121XMDeXmc7077dP75qwmvB9/5YolJvMThPptG7jwOsn0RrPkm
         2pkDiCST7wizNNkVZUmCTB/s9yx3Lp02qDRDvfIOLUIO1XZqv9zq2EB/LhDW2Sbd9AaP
         J28Q3+TK3OTHI4giiyG1ZQyMJhl8fT1siMF/vfD66fvfHb5/61HXRGGFhlBahGPZDylB
         xahKpqaEPYeghWRoUN7I3krrMItEuh+quY9s+/PaSzra/cDgjEG9yVRJU1Ad31w6LNOU
         e74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616548; x=1796221348;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GDvxlFRxYJ/hkyDYpmeqRD4w+SNrEBTiATTaXGwEUVg=;
        b=OEXvOkW41yYtwSrFSUf975q5CxP0MyZawPxi+6+twybv8ddLghc+UQBfgVYsd+TJ9M
         74vuIxzx1dgdyiA0Q61CKx2uGn/7K7Ot7dAlBtEhsmBflfo/8qvGcyrJAdZGXP21Ex4a
         qGHVbfvHTkmQtFp3/Wu6VwQHb2GtWg4ZcVAhps3QFEVjnkZLKFA5LaB6gE/v+KB+o1dl
         2PMopF221cAQrbGlqa1rnGvW0ZwSeBu25zvLYSRRhkgOQWAHncwOSY1tQYGHKtY9pWDI
         45Pk+aNCAALASSTdq6n+yV7/bMMuPK9T2BmTlrM62YGjYc2zRXmzTzpyrN9/7TqusRaZ
         dZMA==
X-Forwarded-Encrypted: i=1; AL+hErGaRFqqqPkqLViifXfut24FFfNMJVROHVUDAYujKsVlpQ3N20pEW2Heoxxj+C1Hncg8quYGqWabPQdD@vger.kernel.org
X-Gm-Message-State: APuU4Z9sql8BNg5O6Mx0kt6N80fStcH9U5ZeBL7yfjIvQbzxzJiFaDqB
	KBo3VGCdqwyeQmwNNpzrdwuzWWWarCM5lNwhnbAT1zxZMwa0VzoJ6j8BH5Ig6FYTINI=
X-Gm-Gg: AZFdTZfx3Hlg0da0LhJQyAwq9C9El+uPS46edmNd7QtMFjG1kv8B23abWu5Bv4nc2Ap
	VbQjfUcyATzuPMVsRzKNmlQTY70fKq8TrvgG2GcDKhR9uX/eZPMJGRrGcLsbhNHxLDxXiuoP9CP
	IVPB+OvXoIoLgn/gOgsviLG77Tmt24y9KdkvW4Faexqnhw/6cKdN4ZkfBvgBDusWr+AkARckZ/N
	0g8sEcRiNZ+GzpaMnH49dCOD8V+P9heAl7vY1Pj/A9geYIiVnEuQz82z7r5scwzqgF+GjnP4Mhe
	8oFguCHgTN6onx1W6deIC104BeSYvFr5zFLBInY/GoAP8vFGfNrq0oW/jHsgGlhK5ArveIGxMn6
	MGiZshZ0oJMYhJ4NnyMKHXGfqGK49WN4DGNtsmY2d70WZ+sDN2DLGCasG95i70xU1X8leNp3St6
	4UcuCQPixyYWr/Td1FfsWEz3KOm4zPJxqbatRwDSFl9v1SeXIBkBVaN5WWtuTbnZy2u9ysltL7O
	ZRC4PSd+Jco25keT26DFee94tkkUq3qEQ+QszuLzJaU1bLEm/376Co4VawiL6yAY2iZgyIBvhEo
	RknzqUrv0jXkLy3wk/FsaYLJCj4IlfRkw+dwAwMrpeEpbRNQDeBpzyYbyNekU3TNmLOO+EDo/II
	fSRS5TccFGT+7QAPspA==
X-Received: by 2002:a05:6402:1e92:b0:6b7:d55:87e4 with SMTP id 4fb4d7f45d1cf-6ba37e831demr13309656a12.25.1795616548357;
        Wed, 25 Nov 2026 06:22:28 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fbf0esm8315989a12.23.2026.11.25.06.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:22:27 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 25 Nov 2026 14:22:26 +0000
Subject: [PATCH] arm64: dts: exynos: gs101-pixel-common: add BC1.2
 completion time
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261125-gs101-bc12-completion-time-v1-1-8fed7a3a7f43@linaro.org>
X-B4-Tracking: v=1; b=H4sIACHvBmsC/x3MywqAIBBA0V+JWTfgSA/oV6KF6WgDvdCIIPz3p
 OVZ3PtC4iicYKheiHxLkmMvoLoCu5g9MIorBq10R6RbDIkU4WxJoz22c+WrFHjJxmjZ+X42piF
 voAzOyF6efz5OOX/us8bmbAAAAA==
X-Change-ID: 20261125-gs101-bc12-completion-time-cedf7baa41fa
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Juan Yescas <jyescas@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3

On hot-plug to a non-PD Rp-default charging port, TCPM can query the
BC1.2 current limit before the MAX77759 TCPC finishes BC1.2 detection
and read 0 mA.

TCPM reads the Rp-default current limit upon entering SNK_DISCOVERY,
and the gs101-pixel-common USB-C connector node currently omits
sink-bc12-completion-time-ms, so TCPM does not wait for BC1.2
detection to complete before entering SNK_DISCOVERY.

Add sink-bc12-completion-time-ms = <500> to the USB-C connector node so
TCPM delays entering SNK_DISCOVERY until BC1.2 detection finishes. Note
that this adds a 500 ms delay to every sink attach, including PD.

Verified on Pixel 6 with SDP, CDP, and DCP hot-plug and USB-C PD
attach.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index dc908dd7e1c6..13cc8a90a3b3 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -668,6 +668,7 @@ connector {
 			cc-debounce-time-ms = <170>;
 			ps-source-off-time-ms = <870>;
 			sink-wait-cap-time-ms = <450>;
+			sink-bc12-completion-time-ms = <500>;
 			/*
 			 * max77759 operating in reverse boost mode (0xA) can
 			 * source up to 1.5A while extboost can only do ~1A.

---
base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
change-id: 20261125-gs101-bc12-completion-time-cedf7baa41fa

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

