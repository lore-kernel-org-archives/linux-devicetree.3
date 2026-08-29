Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6403D953D
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 18:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788028900; cv=none; b=BTJ8nz2snWg0CQ09XjoJMenOpgtAyyPpkNNY/DavxhZilVxbYvsGZ7X9HhMI0LFHmbye9nUBrMjvdEW/fgHnI3ZOlwW6kj/+oEk32gDT0xICAHGDrMJJVrhgJP9atvL/2ldSTD3F5dZicyDBa394ZUPEH4YokX18VbK2WXMa6IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788028900; c=relaxed/simple;
	bh=gjh1l+NNPC/cZ6uQzI1O65AFFuEkwTycyBvCBbn0TTY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=u4E7A+c17bNymXitkvyL4YArmKAV3O/SA5bjnXj+DcA6rObzgRh0gMMgtoHeOGni1CXqMYF/xNvRLvIQ/kqOdbSnjFobAtkNpaR3EFyyVqoA3bd9LnJRBvd4d7jS5MNZ/sl6kMeZUkwmVPWNfGVQRQikG037xRaSLKUoh5lLoxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PgyLkuXw; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PgyLkuXw"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso26887205e9.2
        for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 11:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788028897; x=1788633697; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0H8PyiwPo+CDsOXKQ6pG40Z5MKHjfZ12JW+zPqmUMOM=;
        b=PgyLkuXwccJ/iB5spApIN4v1aYJaXlKq1yg12HCq4KtSCkXDaTlT8BwJ+wVROxeWwJ
         Khcw6xQ8XmNcfEdtkWhRJEp56KDmfHwVRe/uz8E/FilsZOzb3qiX4IduS1sn8/V1ubVl
         hBL9nHMtfJma6+qu3aHPh+cbts9I5wisLc3GT+2jVcNBhq8lWyfaOsCUlJ2tjdaDfkIn
         LcOAbgeo2ynjHz/5x+pjf108/ijktlIYno4UbPpBEdJ0sApCvwxC5ik9dThSFZyTSgpU
         5zz3AUcSblasQjX+e2GQtvEKCmv/UyE4Vtlm9koKIhY2JGuP1dDj21LdIZB2Y3hZt9yW
         u/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788028897; x=1788633697;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0H8PyiwPo+CDsOXKQ6pG40Z5MKHjfZ12JW+zPqmUMOM=;
        b=In79b/Kg9oHzAihZkYpni3iy08YgjZ1XoLwlm9aWrZsZAZtYOFabEUEKypZ8N57yLt
         0LsgwiItT1PnQY/jthLgpOizURXGQ1IL/MEOm2zFDv3vbhahybC9ESKQAWgEWQFSWBhf
         /WrPqfcpgt4HuioFJ61IhT7U1qsxFigYrvOZTw+SpjXxc/Y5xZs3SBhdhM7REel1QpAL
         mqKbOd/l1IJ4JlgXoCD2RZhlXgjSi7vrWl/bC5fxCDTdu/FA2YoechjNr2QhykwLgVcw
         geWR34BGZ+XEwpU/bykFvN7FubwgD17nE0cpB9CEuj1ltYc3z7KhFzH0cdoqnpudI6d/
         5Cgw==
X-Forwarded-Encrypted: i=1; AHgh+RodxH+ZKV90I6W4XhOGvfDdSH0vqhbqXb9WM1vNQhdoybNThUaNERmjthbUZUqsf2h2lSl1UYbphxTN@vger.kernel.org
X-Gm-Message-State: AFuF++lkt8o9j68CvWNXXEdbTgQweK+rA0nvtbhKIIdjpZfr2CeObcmf
	BPE9mu7xifS/KWiRx0ngGP8NlPL+0muZ98sMAOB64RrT/jfZYQecmq6P
X-Gm-Gg: AR+sD11BqJh+15mRnDyqRXL/CNUwlmZnVk5A9+KO/JpDaIIZoPjlXRCYOQeX8Ub1OFI
	Pv9GMnkZvLTRBEnHIEHo04sY9j020mRtiJTB3QQi/I7a3XJQq8i8fanOw12yVimoE5JIXW9CBNc
	SQK33Fhzz9amZ2u1qa7adIDvDhvR/XwbeXBf01bVD263Zmms1gZHzlAd/BmoV/0H7a5y7tLqWYt
	ddP9UI/aksRgXUjQ+lvKcPozDX9ev1nXzncOSEydh4jCztOUVh7c9NCB57HvVkID6AJFAk7vwl4
	fxZYw9+ppJQ3sZfaBCc/TRRviFnBhH2SoUnG+pWJghBPdtc6srRmZnkGEEfDnnmrqWCqVdds7pj
	h9z7gVrgt75+x1RvQrLlQgTJKQupsTyaBeGtP46XreRfWFMeC1Kbe0V4broVZUsgHUa8PsbO4Bi
	1mSjUnW0WpHWXzRYbZRErQFFSJScDH2cbKn2cPMVJzcLqxxEoD24rTS6yGNXbmpPW3yI98ZsZTF
	rTq9MYscFtdEjBVjbHT9Q==
X-Received: by 2002:a05:600c:a403:b0:49b:924e:9a28 with SMTP id 5b1f17b1804b1-49b924e9b14mr211725925e9.1.1788028897076;
        Sat, 29 Aug 2026 11:41:37 -0700 (PDT)
Received: from [192.168.1.11] ([148.252.146.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b49cc61cfsm252044895e9.6.2026.08.29.11.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 11:41:36 -0700 (PDT)
From: Dale Whinham <daleyo@gmail.com>
Date: Sat, 29 Aug 2026 19:41:30 +0100
Subject: [PATCH] arm64: dts: qcom: x1-denali: Add volume up/down GPIO keys
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-surface-pro-11-volume-buttons-v1-1-ace589343a68@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQrCMAwA0F8ZORtoyxzqr4iHNaZa0XYk7RiM/
 bvVHd/lraAskRUu3QrCc9SYU4M9dEDPMT0Y470ZnHGDObkzapUwEuMkGa3FOb/rh9HXUnJSDL3
 vDbsjMXloxyQc4vL/r7fdWv2LqfxS2LYvAJTkYYEAAAA=
X-Change-ID: 20260829-surface-pro-11-volume-buttons-f4b40e25cecb
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 Dale Whinham <daleyo@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788028895; l=2043;
 i=daleyo@gmail.com; s=20251214; h=from:subject:message-id;
 bh=gjh1l+NNPC/cZ6uQzI1O65AFFuEkwTycyBvCBbn0TTY=;
 b=3g5gzi2RSLoc0SXrt332SzG91tDDODYz0ZGabjDixgUXJYo5rQau/5fDMmno3A9Wonyf6rJwC
 eAw2VtwPBI6DBPkvaqSbzF1UX5DQUjN7ZtPr6l+iXHfYAx2LjZOXzeO
X-Developer-Key: i=daleyo@gmail.com; a=ed25519;
 pk=M4mvgx1TB2TniKaedTDsO3PbLKgFosJuegXRXPbn2Ds=

Configure gpio6 and gpio8 as volume up and volume down respectively, to
enable the volume rocker located at the top of the screen.

Signed-off-by: Dale Whinham <daleyo@gmail.com>
---
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi | 36 ++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
index 7559557610ed..c467f61545cb 100644
--- a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
@@ -20,7 +20,7 @@ aliases {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		pinctrl-0 = <&hall_int_n_default>;
+		pinctrl-0 = <&hall_int_n_default>, <&vol_down_n>, <&vol_up_n>;
 		pinctrl-names = "default";
 
 		switch-lid {
@@ -30,6 +30,24 @@ switch-lid {
 			wakeup-source;
 			wakeup-event-action = <EV_ACT_DEASSERTED>;
 		};
+
+		key-vol-down {
+			debounce-interval = <15>;
+			gpios = <&pm8550_gpios 8 GPIO_ACTIVE_LOW>;
+			label = "Volume Down";
+			linux,can-disable;
+			linux,code = <KEY_VOLUMEDOWN>;
+			wakeup-source;
+		};
+
+		key-vol-up {
+			debounce-interval = <15>;
+			gpios = <&pm8550_gpios 6 GPIO_ACTIVE_LOW>;
+			label = "Volume Up";
+			linux,can-disable;
+			linux,code = <KEY_VOLUMEUP>;
+			wakeup-source;
+		};
 	};
 
 	pmic-glink {
@@ -995,6 +1013,22 @@ rtmr0_3p3_reg_en: rtmr0-3p3-reg-en-state {
 		function = "normal";
 		power-source = <1>; /* 1.8V */
 	};
+
+	vol_down_n: vol-down-n-state {
+		bias-pull-up;
+		input-enable;
+		pins = "gpio8";
+		function = "normal";
+		power-source = <1>; /* 1.8V */
+	};
+
+	vol_up_n: vol-up-n-state {
+		bias-pull-up;
+		input-enable;
+		pins = "gpio6";
+		function = "normal";
+		power-source = <1>; /* 1.8V */
+	};
 };
 
 &pm8550ve_9_gpios {

---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260829-surface-pro-11-volume-buttons-f4b40e25cecb

Best regards,
--  
Dale Whinham <daleyo@gmail.com>

