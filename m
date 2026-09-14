Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF10C33F599
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373826; cv=none; b=Jw7pqsW7l7CdYvYdDvnZwY0O5SYjRcR7sAGCXqc79QHsd3yCFdCv8sD9IPo6r7soqJzMiPyG2nCseLEkSmYICuXl9D47HV6JTSQwWxXkGLS1TNs72uPOqrWdVWCNNDXRFmzst1I+9p1hWc6MGdG6vqNobih3JzEwPoRDNPya49w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373826; c=relaxed/simple;
	bh=U2fObva/T4kb4gnGW2Nd5bcGjQpO3qUpI3v+NuFZT80=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZNuPfjRnFMl/6554USpN6vmht573FsEmvC2gL9HriSKa0A3oz8rEkuS+4akAcG6bSleOZtG0np8Xh9aPkQ++ulTzNOz2RM3xvEY7D3MURnp/3+83fV8wnJoAkEJ9im8D4150x9YUtRiV8UxH2IS8XWa43LfsjbysSgNRNvShAuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZK4k8zT; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZK4k8zT"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843cedd129so1014002f8f.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 01:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789373823; x=1789978623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bDdWbQbVn5+bafx3DiaQBgQ61FY9LOrox9bmnpws3Bc=;
        b=IZK4k8zTtDuva5FJNWkxh/YAunjlvDUeOuwsPgN0/ONSwLidsMf1GdJTDRv1Gskf3R
         XXM/WcoRhUON13Tb3oPy+oTfMNa57c6xgyMs3pJuklo7HzDhLadq/Au+YLqDbiESiMZN
         NIof1TsyDzE2XtBtipxEwkpZ9gW71nJcwVk2wB/WveaX4RNc2PglNl3d74wU9/meX88I
         3gYlgGXYpf7xDinlQEQtyxlR8W7GXgewfNtp2Rr29oeJBczewPSQ1uVi4vs/QTepJ7ko
         rp9umskdHnBESNoAo/pvZeD7ZfTk+jcr8Idx/D+f25xblIVbirJxTtOENxVHmFfH5KuW
         iMpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789373823; x=1789978623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bDdWbQbVn5+bafx3DiaQBgQ61FY9LOrox9bmnpws3Bc=;
        b=lFdjr5ysSZT3mxTAVRGN5iIzE+GyOsL/SKZuljLJASL6Hg+xpdLzNYAIxO1ei3+htc
         lYblZ7biZnAM3GBaP/1gD6DjnjF1Iz3q+nA3qXS8lS0I2Rb8ELGXieK0TAttBtwzTjMD
         02fKgFkiZ8EYUq8v6DIWqRt2YRHppH+Krs2qlRtZCvluIGgYctt8PAZ5QoeO08rpYMIS
         U7MsVUAyZKTfK+xlN+fxVyO4v/nAQGjWKEZVbKNPOP05MCC1nc++/x3tlEpfQgJ2mSjv
         yfJl40EdzN7uwdwgVTdMYeX0SKD+/198FJhmy22hdJzVnFFD+RbYWS6kPvhNLxlSJrFw
         8cSA==
X-Forwarded-Encrypted: i=1; AKwUvBz13BwBbrVY4KJSYps2Aekh7jaSohJEyja2pGW8c27p+gvED7GTC/Ibc3A+Ca5la0y+2R5NjkmyRmWH@vger.kernel.org
X-Gm-Message-State: AFuF++kY3Tn3J/Cnc7HoGIyRSdAluEWi52as6gL3PPVkIJ3h/AhDkxhx
	F0DKTBWUvRR1XLbSsdUw2JKGq+feadmkL7QzCG4FGffBJn3OOE2x5vqSyTm+TWYtXHlu/A==
X-Gm-Gg: AYBFou2a30/4a8wqtTx+yfhXtp6hU2CvA9ZCJ51wt1eBtdOh9aMawNArAUP0Kpm3bsD
	5V0j1LcwF2ybQa/UeOC/O6UOLgJwQUf3wapeJLHar5hopwYK2uRk7UI5HZDlHK6p45A4FXjNcOq
	RHzAEeTKlhEMMyEcU40Cb0fTe2qWUT7b2mFWkL7yRGV8V/tfJy3KAX5w3pGR6x5A+Dsj1sRPGj1
	u1YHQNTlHd0m/6N95/IFnFyod5xUubcuswhGo3D3VSAycz4MSfrypa960gCpxqITWIzEWj8LCwU
	w5vW4o3FLTfzOe6Ls3GXdYunTLKl3ckAc57SO9U0+Ce0r2kNRb9hGmWFjdzY9QA6Omb43s2mI4x
	cqElHoHNxsHd5lRYoZdwjlBUNjWJYjAggWFI7bWlWj2o1Nz17P4GVEy1ITn6UxFA+V0N7Ex9v90
	+xk4/Dq4nTUJEbsnNT+WB3hIzuu7ljkSdy1KbzoFjCote0h6NkZcW9OxufsoWVZIlRRlVWcYR5s
	+2E2rGbmUoc9n3inw==
X-Received: by 2002:a05:600c:3e17:b0:49d:726:cc9f with SMTP id 5b1f17b1804b1-49e7a65e422mr30100785e9.5.1789373822299;
        Mon, 14 Sep 2026 01:17:02 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.25])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e6221963dsm202053055e9.2.2026.09.14.01.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:17:01 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add the camera privacy switch
Date: Mon, 14 Sep 2026 10:16:52 +0200
Message-ID: <20260914081652.5935-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The laptop has a camera privacy switch on the side of the top case - a
slider, not a mechanical cover over the lens, and it does nothing to the
camera itself. TLMM gpio99 follows its position: high with the switch
open, low with it engaged. Describe it as a gpio-keys switch so userspace
can act on it.

SW_CAMERA_LENS_COVER is the only switch code the input layer has for a
camera privacy state, and it is what the Lenovo WMI camera driver and
Dell's privacy driver report for the same kind of electronic switch on
x86 machines, so use it here as well despite the name.

The embedded controller also raises event 0x29 whenever the switch
moves, which makes it tempting to report it from the EC driver instead.
That would be the wrong layer: the pin is a plain level that tracks the
slider position and needs no EC transaction to read, and the EC event
carries nothing the pin does not already say.

Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 .../boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts   | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
index ecc8c34fb983..b5848991dffb 100644
--- a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
@@ -51,7 +51,7 @@ sleep_clk: sleep-clk {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		pinctrl-0 = <&hall_int_n_default>;
+		pinctrl-0 = <&hall_int_n_default>, <&cam_privacy_default>;
 		pinctrl-names = "default";
 
 		switch-lid {
@@ -62,6 +62,13 @@ switch-lid {
 			wakeup-source;
 			wakeup-event-action = <EV_ACT_DEASSERTED>;
 		};
+
+		switch-camera-privacy {
+			label = "camera privacy switch";
+			gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_CAMERA_LENS_COVER>;
+		};
 	};
 
 	leds {
@@ -958,6 +965,12 @@ tpad_default: tpad-default-state {
 		bias-disable;
 	};
 
+	cam_privacy_default: cam-privacy-default-state {
+		pins = "gpio99";
+		function = "gpio";
+		bias-pull-up;
+	};
+
 	edp_bl_en: edp-bl-en-state {
 		pins = "gpio18";
 		function = "gpio";
-- 
2.55.0


base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
