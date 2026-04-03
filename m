Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC69285406
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 08:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775204501; cv=none; b=szdA4HQNaYiPQ4AXuVRm1ZVt3zEmqQ3wKKy5qvQezhgc1f0Jj1WhDkVXqqMrjctUhWxDcC/rxQm1B3re595DtBvflaBcdfY1i4AopAOVdiqgcvfYgdUITpSTaAFkiFgJSFt5UguMyXuRTxCR4hSUxJfGzfBHI48EZ4l6zTSnPRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775204501; c=relaxed/simple;
	bh=D8VbY9ar43HVFZIxguK8RYeUx4U66Ej4MgpOIkN24qU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ACWQ0nR9rcEOona50zJuTCI8rOhIXtC2TIY/IBFaKE4IBn3o/tlENVt9VhT4kbJg6m4F9VZk18wr6UpVebYoPbABsgEZ8pNxBtOaKmuTrJHhvnq+qIkH0gnuVGMQFZnZH/D7PYJ5dH5I2vS8CzAlEsbvHnZGnQL/VtYfXXYuRJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Eb12A/j5; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Eb12A/j5"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-66d65646c65so3413187a12.1
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 01:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775204498; x=1775809298; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c6mDGlLBD/1/EQOe9aCWFmXD0WzOt3S5VFbWUDVz7VA=;
        b=Eb12A/j5pEFOUrbCKebq2V7uI73mC/xyiDGM1Zw9OMhK6BHLsJuASGu/bc9W3VSqZ8
         ChEuVwwR1Qs01W88Wuvs/Qrbn01uZcB2I39LyvJShr02swzHggmplx8FtJ7FWmp6PRZX
         Qu+kLnSGpuBl6mdR/gYeVNvBhahp9hHsvXBKaPpnO5e+kIrgU7M+tU8MCvMebNLe0dfe
         6850aGa0v39f5Se4DDBPQpgQAQZGswgovI0oq/FWdoEmSnMFVJI1WEGPu9zePkYnqfB8
         H6/OAvxxFrbKYlQwpJ6RQyJp0b6EVh/ptlCGsloqKQ9M80jlzxKmuQq0kywLcledGYW4
         9J2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775204498; x=1775809298;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c6mDGlLBD/1/EQOe9aCWFmXD0WzOt3S5VFbWUDVz7VA=;
        b=lTDOQRMd5T2BCGP+W2LdYoWtaiKFkMU8KRUfGepZBruYmtlstxSO8IXR4r5WMtBguD
         LuvRH+nH93gJrVe1wHX2Xvu/V/5kGbWuuQleSDfCb8Ii5X4M6XfUHC7aSI8itNSxo6ST
         Z3eyhx/hSU0UmlSLTV8KtMgyTRXKdhvcbumFQJkfF4Q17bkP4iLxzI93+eNWmR8HrXXb
         s8/R6UWKp00SoCbC3r7DqQN9dKnJeu43qojdkCvP3RP2k0D1QbVAm4VpYQmDMGUx7bl/
         mUkK1u38CwTaQuJJpOItP5Aqa/p3SVMGI04IeJNlR2Nrs79VkKW33CI9z+LIaSeO8fBX
         AwsA==
X-Forwarded-Encrypted: i=1; AJvYcCU0cJw+GZvmRVmxNrlb6bhd9HegLn2HvdQubh9NuAvD+EhkmUoC50k52WtQhFpJrTHWR4x2iqbDvaYH@vger.kernel.org
X-Gm-Message-State: AOJu0YzdTNxUV2gCe/NVxmxIkB72RdnNQzAOqovDhQB7kdLGya9myEke
	sYDPTgOB1OujIqqCbBH5TgnBhPjrVZZDHxfkqcjpnKSU6U4g+J8mgn9MtQpRXlcA6VU=
X-Gm-Gg: AeBDietQxkNfeME7FTSjaZRMXp3/BltKpSeBOqYiJsn3YdB0uVAFAdhZQw4VFbR3LHB
	+JHyutJKkNZhzc+BQSeDimMbGPNGtwnvPjmptM7XktKKihcBeoHyfgRsRrgU2NfrvkAPqCQOSlO
	Q8AO/BDl+1l5p5eoBzWZEN+2hXFEupQODsWeCWcO691Z8oap/1tRhooQJ4PkkFv70377fbrRk9y
	1wzzJ1koWyiQKt+FrlmvQjex9Wog9zdXm76+U/vJe4XgtWgoLxSK1n5RuCHuTxJ05UG2NBab3Go
	mloP1U3pO+I5UkD+jqTAZHf8cfh94VMKtQbHM+hEAVvQC5QKCyain+poAAwSCCQ00XMvJY4cWcD
	9K/0uVs1Yx5e9L7pX9dVlQ/6JRmOANuX018PrrswMCoSG1PZTD2VelgSpf2pPKVF6yQAT5+KBeu
	BhvLzgT2pDzrXGR5Z6uxIDpJI6BOlFBtP4GCcOXbi2Hh98/UXJ2OJZtQ8Us8G1VcJC9lxMyJnpD
	DqEDGtlkSJMm31FPjHJTmisjOC9ftlI635u2zxIOUUY7lw=
X-Received: by 2002:a05:6402:5286:b0:66d:d385:3515 with SMTP id 4fb4d7f45d1cf-66e3e2f0456mr929345a12.6.1775204497943;
        Fri, 03 Apr 2026 01:21:37 -0700 (PDT)
Received: from [192.168.101.179] (2001-1c04-0504-7401-4b2e-1820-6d24-b264.cable.dynamic.v6.ziggo.nl. [2001:1c04:504:7401:4b2e:1820:6d24:b264])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e445e5b8dsm292229a12.12.2026.04.03.01.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 01:21:37 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 10:21:33 +0200
Subject: [PATCH v5] arm64: dts: qcom: milos-fairphone-fp6: Add vibrator
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-aw86938-driver-v5-1-0712909df423@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23QwW7CMAwG4FepcibIcZqSctp7TBzcxqE50LKkC
 0yId19ohSbBjr8tf5Z9E4lj4CT21U1EziGFaSzBbCrRDzQeWQZXskBAo5TSki62abWVLobMUXa
 1J3Aa0RKKMnSO7MN1AT8PJQ8hzVP8WfysHtWVQqhfqawkSO7cTtnGOq/pw1OI52EaedtPJ/HgM
 j6JBhTaNwIL0RnFDLYh8uY/Qv8RCO0boQth+l3be6+hbvGVuK9XRv76Lt+a11NFR4ll6Z/CvK9
 Gvs5yWVADlon7L+jgIGhnAQAA
X-Change-ID: 20251113-aw86938-driver-b4fa0d3228a2
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775204497; l=2607;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=kF5xZxBnLGJc9TH7GPnIOSpNJyqHaQaezUn8kdci2pc=;
 b=USoCAMwtN2U7qE6Ftw2A1txh65zwNWIQv+F44BDmRWWgBJ0umo4d6+io9QpFwkwI1+7fw6aPW
 lzjTVzTPOJSDCRURwDB+VfMrOrFZSkG8Npi4rCtJ2x3NbrXYLaxukFc
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>

Add the required node for haptic playback (Awinic AW86938)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v5:
- Rebase on -next, drop input patches
- Link to v4: https://lore.kernel.org/r/20260302-aw86938-driver-v4-0-92c865df9cca@fairphone.com

Changes in v4:
- Changed how vibration intensity was calculated, added a seperate patch
  for it.
- Link to v3: https://lore.kernel.org/r/20260209-aw86938-driver-v3-0-5c79cff30492@fairphone.com

Changes in v3:
- Changed how compatibility was handled according to feedback
- Added reset gpio config for vibrator node
- Link to v2: https://lore.kernel.org/r/20260128-aw86938-driver-v2-0-b51ee086aaf5@fairphone.com

Changes in v2:
- Added AW86938 specific registers
- Added chip model enum to differentiate chips
- Link to v1: https://lore.kernel.org/r/20251204-aw86938-driver-v1-0-ebd71868df3a@fairphone.com
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 26 +++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index c1899db46e71..44d13966d6ff 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -687,7 +687,17 @@ vreg_l7p: ldo7 {
 	};
 
 	/* VL53L3 ToF @ 0x29 */
-	/* AW86938FCR vibrator @ 0x5a */
+
+	vibrator@5a {
+		compatible = "awinic,aw86938", "awinic,aw86927";
+		reg = <0x5a>;
+
+		interrupts-extended = <&tlmm 80 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 78 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&aw86938_int_default>, <&aw86938_reset_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &pm8550vs_c {
@@ -824,6 +834,20 @@ hall_sensor_default: hall-sensor-default-state {
 		bias-disable;
 	};
 
+	aw86938_reset_default: aw86938-reset-default-state {
+		pins = "gpio78";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	aw86938_int_default: aw86938-int-default-state {
+		pins = "gpio80";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
 	pm8008_int_default: pm8008-int-default-state {
 		pins = "gpio125";
 		function = "gpio";

---
base-commit: 83acad05dee54a5cff0c98dd7962e55d4c6b145a
change-id: 20251113-aw86938-driver-b4fa0d3228a2

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

