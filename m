Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D053DB338
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784010554; cv=none; b=eYah+axNoJkCdZhzXePzUXuzP0fsY+ZYIEE2d35+dJGHN7iGzGF3vLXSXSqc+iHuCMPU9j7U9f1ZBzbzrji/+cQZfW5oCcyW6zjyc8du1nCqWTkzf6YaCItXvlcBhokyzeomXKCVPEljVl4Fw1kVOOPI9CuqhUdnV/cWDwTIZJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784010554; c=relaxed/simple;
	bh=cPhUEwaWC4vFg+vWUv3YAUV9bYjnh8Y5E9GoO7RBxkE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bfjh/h0WbIjhCBUKtYYZgvWiQ63VJrnVXvkeLxYJUw6CL1+QlUzFs5jE3mI/pavMTQjAZC/hKS9wuvKN41am0wkhNdnwcWmV/wKToF5TMd9HjH3xAwIRpNkHfIlgo+CRowiuMoM1gF8m5SSPkLJfoD78Qds5tUDGsh9fH78w0Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1y1lpsY; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1y1lpsY"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cacf197759so8958075ad.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 23:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784010553; x=1784615353; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ByqUUoCmAxr64mZfxOgoGrIy+E/ii+Kkqp5CiJVXt+U=;
        b=Q1y1lpsY3/4dNB4duQ/eaIAaV+mRVRJa2JRBxqOqrPk7y5KM2Ucn9vskjqrSUrTZhM
         TsXTJc2LnR7qyQydT3eHpMSi6peS5XkDGxGYJ8FgGH2EzLopdE8scqt2JL0Xu7Hj5m/X
         YSXrNjSjxML6kUOoxl8S7RxkkOPiCG7JLuukYYfrhdwoSOqLdvyBy4eknjZV1Q/FJoVm
         EB4F5ZNRhzxzuRV9fnSAYSCaboBILZEQhBt5ilRARh6Roj1/R2jwHDUGlcePwbGfqjcJ
         4IG98k/MEDHmYoyK3DkBXeuYl+Wn+iWXOdDsEKR0GRsZUt2YFKbAtXVIF6hXXI3U22By
         KTOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010553; x=1784615353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ByqUUoCmAxr64mZfxOgoGrIy+E/ii+Kkqp5CiJVXt+U=;
        b=pv8zq4RPOJD6p7qWTjmWJzDEnN0BiZPux0G7iYuHkLud8GLeT8OrWTM9F9bZxQ3mMm
         Z72uW4sJZ3e6xTmY9juFdUQOGgc6gcWQF65oj1kOGDrEnYfW2pbTrNp6h0su91b7nw92
         D7X9hblF3Oc89vkigCpa81sOSMltuv9+BumXGL76nRW7lZmEK5rPlq41CrGwSiY/Wf4h
         s1hyINEooSP6NMwLal4+FYZNIEQBq9dCN1Hs56qCP7yvyD/LEWYto6cO6O1mzHdpIvWk
         vkb6GT5RrmHE8TS/vAoXfthu1YhcM8sIY51P1pKPJlFQtQPgQryEiozmR7TFU4wR7Bs5
         EP2A==
X-Forwarded-Encrypted: i=1; AHgh+RrpobAIM1c4UebVievy2CUVwjfBXpHRoyleZF1xvDQJeI6eeg02QKueOdcLfEh1UJlxaZ6f6x2uRNQU@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp++5lVXCLpUYfO/iFWifBdAa/sW5OMIgGqTxX379wJ8JwD2uO
	vr3HMrka0KHmNDV1dtJe0Nv5MdmhSMaHeOwS/pohUPdWQOCVop7kuz17CQDvNw==
X-Gm-Gg: AfdE7cmcMLSPAO/JhBbE856ddg3IPuwt3l6IhRqnSJ2IBU3QNj9pccmQmJmMzYpXrFO
	xYouOzhtUBnuUBGXeSALdoCxUpisPf+Z3yB2Y1jth3U8nsD3WNZeAPEwZVptS/Gu9fTI1Fhjhov
	92n/+aLEgU+HCQKiE/tTwu0YRAxdOMHjHExMZYgEa1/Fgygz85tFezDM2PCCL2lzI3+Jqwk9lGs
	hzk7SrRMxE9+iuJzYYn/91J1RM8G9nb10C2ISkWNH73MM2g5NWSeFTJdlDJDjUe5+E5f6+YF4+9
	x0JBq2KcC0qcVfwKCXTko0rjkCGM6xxHkEtRhUzhCDmHXY+aiGZvwhTQOPgk0dyWqHchx6djsPk
	G10UjsDmiFgsSjrMkNJKUl0rRVcQXfrWq+q4N4y79nK+nRnkffQvAmT8ig+K4Ay/4N8qiDndbw1
	nTf6GdFw1aWDgCzrtlMRxKqvEGDj20S5HHFxcpcKEfhNNaXOKqFhRp0jy19nKwQMaDWN/1UBj9l
	QoAwIspDDtzioVR5N65FOM4ZjgyIfUQIQ+6NFNU1STw2hWZ7N2pjyJsiI6lV/of
X-Received: by 2002:a17:902:ef0a:b0:2ca:9ab:e725 with SMTP id d9443c01a7336-2ce9e59d62cmr125013935ad.1.1784010552958;
        Mon, 13 Jul 2026 23:29:12 -0700 (PDT)
Received: from [10.160.5.76] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc99cc5aasm110915985ad.0.2026.07.13.23.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 23:29:12 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 14 Jul 2026 16:28:19 +1000
Subject: [PATCH v2 12/12] arm64: dts: apple: t60xx: jxxx: Add
 device-specific SMC hwmon sensors
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-smc-subdev-dt-v2-12-13fa78873121@gmail.com>
References: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
In-Reply-To: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2868;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=cPhUEwaWC4vFg+vWUv3YAUV9bYjnh8Y5E9GoO7RBxkE=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmh1xnnR1SwsOTv9eNQ3bE66PE5DjtG/yOLj7VfcsmLO
 cbxv3xHx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKrldjH80yzWPOwV2XW/ap3i9sV/e+798Dn1aptA26qa2r/cEh7ZXAz/jINkVvd
 eP3tJW8Us3FL5ktTfJ9lz/lhN9pKTXen746g6GwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the device-specific hwmon sensors for select T60xx-based devices

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t6001-j375c.dts      | 2 ++
 arch/arm64/boot/dts/apple/t6002-j375d.dts      | 2 ++
 arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi | 2 ++
 arch/arm64/boot/dts/apple/t6020-j474s.dts      | 2 ++
 arch/arm64/boot/dts/apple/t6021-j475c.dts      | 2 ++
 arch/arm64/boot/dts/apple/t6022-j475d.dts      | 2 ++
 6 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6001-j375c.dts b/arch/arm64/boot/dts/apple/t6001-j375c.dts
index 2e7c23714d4d..08276114c1d8 100644
--- a/arch/arm64/boot/dts/apple/t6001-j375c.dts
+++ b/arch/arm64/boot/dts/apple/t6001-j375c.dts
@@ -24,3 +24,5 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,okinawa";
 };
+
+#include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6002-j375d.dts b/arch/arm64/boot/dts/apple/t6002-j375d.dts
index a2a24d028cbb..e6eb6b6c386d 100644
--- a/arch/arm64/boot/dts/apple/t6002-j375d.dts
+++ b/arch/arm64/boot/dts/apple/t6002-j375d.dts
@@ -184,6 +184,8 @@ atcphy5_usb3: endpoint {
 	};
 };
 
+#include "hwmon-fan-dual.dtsi"
+
 /* delete unused USB nodes on die 1 */
 
 /delete-node/ &dwc3_2_dart_0_die1;
diff --git a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
index fee84f809a9c..caded1636f3d 100644
--- a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
@@ -367,3 +367,5 @@ &atcphy3 {
 };
 
 #include "spi1-nvram.dtsi"
+#include "hwmon-laptop.dtsi"
+#include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6020-j474s.dts b/arch/arm64/boot/dts/apple/t6020-j474s.dts
index 7c7ad5b8ad18..e3c2635d84fa 100644
--- a/arch/arm64/boot/dts/apple/t6020-j474s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j474s.dts
@@ -45,3 +45,5 @@ &pcie0 {
 			<0x200 &pcie0_dart_2 1 1>,
 			<0x300 &pcie0_dart_3 1 1>;
 };
+
+#include "hwmon-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6021-j475c.dts b/arch/arm64/boot/dts/apple/t6021-j475c.dts
index 533e35774874..9fe17f1f7f59 100644
--- a/arch/arm64/boot/dts/apple/t6021-j475c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j475c.dts
@@ -35,3 +35,5 @@ &port01 {
 &pcie0_dart_1 {
 	status = "okay";
 };
+
+#include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6022-j475d.dts b/arch/arm64/boot/dts/apple/t6022-j475d.dts
index 31f24bbda968..32938a3bf96a 100644
--- a/arch/arm64/boot/dts/apple/t6022-j475d.dts
+++ b/arch/arm64/boot/dts/apple/t6022-j475d.dts
@@ -44,6 +44,8 @@ &typec5 {
 	label = "USB-C Front Left";
 };
 
+#include "hwmon-fan-dual.dtsi"
+
 /* delete unused USB nodes on die 1 */
 /delete-node/ &dwc3_2_dart_0_die1;
 /delete-node/ &dwc3_2_dart_1_die1;

-- 
2.55.0

