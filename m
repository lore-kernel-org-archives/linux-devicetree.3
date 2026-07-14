Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1A23DB31D
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784010550; cv=none; b=j36t8VT2B957FhGbjOfKC3L8ORs0aX+J2IrL6MwegInJYZuj+uJu9VhUfC2/zAONqVIg8HpzsY54pYEUjCUPL8LPbMKmNUscWNOclr43U+qaNumxdMXJ4ccS29kDQF4LNvDxZCyfM/y/x/S7QK5EW6uKDZBvj0Irx64Y2sieg1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784010550; c=relaxed/simple;
	bh=b5cJQbI2rPQBqmyd+tyRrl79csKGqBEcw6hZJ4ZNy20=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jK3ldKpGzo8T7CgdXyIgETBnRN3pYptSgOwHNqtf2bROnhNBfEs/+jciM7zSMeRpfKX/ZqPKnV8bCldYltcys7uABAYmChdhc8uhEZiEeSwv1mUBqe6UIFvbEyQiwxufI7q/N4DVIYDZE/R46N4XR3m/kPsa1UxIsHRaNBhDLY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qciQsVyI; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qciQsVyI"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso5383535ad.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 23:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784010549; x=1784615349; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8XZtIIseDB8jd5vi9+iZWbpGqG/Pge6b+zJURkaj8iQ=;
        b=qciQsVyIoOAzcLjrB8/ZYdX4ycNxU+5lqTIT+svLsbJmgdIxtrrNCpUyvqjJqlcnqs
         7TdEUBm1eY9rK2Kh+H8Ty6LKSo9VJRlgFyTtPn1Jgl4MYK1IppFpEOcKYNJ2Ku9xIe/b
         /kK/9+EuyA7y2u/i/eRgAeYyJGF9f7JUU28G/aCtt9fTEF3Wb0X4T8tVZrUKfDqvXTd2
         0/iUdycp/+9Q6atz4+15ioY1KBdoUpYfeQ4iyYqdK20L+RpDOXgd48BIPwLybH/M6K16
         yilwiKiYTYvmVgs0MWUT8w2DiDGxw4DFLP2QWtPlsRtdHbO49Fcxz4pNBNVjSN0dlfyp
         SUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010549; x=1784615349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8XZtIIseDB8jd5vi9+iZWbpGqG/Pge6b+zJURkaj8iQ=;
        b=SZS9QNBGDdO1t7RA0M55EHwAuh7JrNkGiWgNTRNuZCZBoQ6SxZFEQc1DaS6O0+MR1d
         LcYX/ey/1e8sSDyNEYYQRE5UqheqVIxGE1bibBVmTtGSFm2P58VA/sfBKA2p4g7FuFm8
         TZCRWKxqKR/6p2Qw+X40UtDHUmZpOYjzeilnKGey8dyIysc8UGgssODG6F7H0fPfSO/w
         u0wA/eu1N7gMbaBNb27nLsU76raNnmVnLzJwbTefzajULcIxLWaxykZ3JIYbtzrGW3Nj
         e4KQSWnZuQOE9E03o+NdroZwwbdbFfzPINu51d8wyFijU90lMp0v17T9oYk5cnaJEf1x
         1cMg==
X-Forwarded-Encrypted: i=1; AHgh+RpwK49tAt0C2kpGrdMMDwNxjdT/PZDr9b4xzLdKf+8z+M1JksVH/c0yyBwdgOdthnHc83NFv5E113Rw@vger.kernel.org
X-Gm-Message-State: AOJu0YyP6E1Uv8dzKvE+8mXfLLjxWXN/3s41wrvzooBxx0th5nhUmMCb
	PAbFVJyxPm1S9L24NBR3FFvqPNdnnuwmE//FH67ooldMbDCWHuuK6tOUfHXrpw==
X-Gm-Gg: AfdE7clRXlRgHgGpmSsWQFJUV02/AHjX1x4UOulJ0bfKPq2ONKE1NY0QXDg1swJBHcP
	V5owkMk0OM71mjpYHkRjeQEsBiRhUmSjau+2mtBdtzMT+Z8HBquXhQTCX1Oe/QIir9XB1dCtwQC
	uWKk29rqTxw2q4x3J075Hz9CcG+CqjzA76fb8eV+NxQ2vn71vzznkDwIEVQ0yfEDPlnXVv2jtEG
	74zR0XFCUPC2FAJiGfDDvvvSmLr2z8AN33ZDORGNq9MYRnOHkB1S1DH2Hcggk43dI3un0kdr3nf
	sP2T+0Qe/nweY7FR22jRvus4dg7CKNZ60Nf8aTVmUSQGnRjSLr1KpT7a1F64GFx8cODr+JEBX8H
	hXV6vf4OTLGXPwGaWDXx/MvRmp9N67ild8DQd2aOVq8fvZbinA1S76Mrhoq6pmEUk6go+Jr+Ltm
	X0f8/2P54dT1aeAguXwATasK6A/s5aCeRTtmfeFKwW4xUa2YRB8gaOZpsPJWU9j5Y94NLGrlzNt
	55G/yd2FD6fifxhVPCmEz2Xdjz7JlYK172/Ydxc30CG0Mlbxhil7JfKYdCMrsF3
X-Received: by 2002:a17:902:e743:b0:2c2:62ee:5a0d with SMTP id d9443c01a7336-2ce9e99c383mr117865695ad.14.1784010548658;
        Mon, 13 Jul 2026 23:29:08 -0700 (PDT)
Received: from [10.160.5.76] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc99cc5aasm110915985ad.0.2026.07.13.23.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 23:29:08 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 14 Jul 2026 16:28:18 +1000
Subject: [PATCH v2 11/12] arm64: dts: apple: t8112: jxxx: Add
 device-specific SMC hwmon sensors
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-smc-subdev-dt-v2-11-13fa78873121@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1778;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=b5cJQbI2rPQBqmyd+tyRrl79csKGqBEcw6hZJ4ZNy20=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmh1xkjXfecdvyid23BZS7LGF3Wp2uLg6W7yj79/efnf
 FFxrUBQx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKojvBn+5+QzTDB5PLFblzHyzVrh59q/RKIE3yXJHZSu2rJo/xXfHIb/HuX75cx
 32d/lnrpzX/9Sp2Nul9Y98z9zJMohefu261c38AMA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the device-specific hwmon sensors for select T8112-based devices

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j413.dts | 2 ++
 arch/arm64/boot/dts/apple/t8112-j415.dts | 2 ++
 arch/arm64/boot/dts/apple/t8112-j473.dts | 2 ++
 arch/arm64/boot/dts/apple/t8112-j493.dts | 3 +++
 4 files changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j413.dts b/arch/arm64/boot/dts/apple/t8112-j413.dts
index 1a08a41f369b..7ccfceb08093 100644
--- a/arch/arm64/boot/dts/apple/t8112-j413.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j413.dts
@@ -91,3 +91,5 @@ &i2c4 {
 &fpwm1 {
 	status = "okay";
 };
+
+#include "hwmon-laptop.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112-j415.dts b/arch/arm64/boot/dts/apple/t8112-j415.dts
index e37c56d9fb4d..fdc3409d2e07 100644
--- a/arch/arm64/boot/dts/apple/t8112-j415.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j415.dts
@@ -91,3 +91,5 @@ &i2c4 {
 &fpwm1 {
 	status = "okay";
 };
+
+#include "hwmon-laptop.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112-j473.dts b/arch/arm64/boot/dts/apple/t8112-j473.dts
index 438f972546b8..105a9d118980 100644
--- a/arch/arm64/boot/dts/apple/t8112-j473.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j473.dts
@@ -84,3 +84,5 @@ &typec0 {
 &typec1 {
 	label = "USB-C Back-right";
 };
+
+#include "hwmon-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
index ec116da3e4dd..7cea5c594810 100644
--- a/arch/arm64/boot/dts/apple/t8112-j493.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
@@ -146,3 +146,6 @@ touchbar0: touchbar@0 {
 		touchscreen-inverted-y;
 	};
 };
+
+#include "hwmon-laptop.dtsi"
+#include "hwmon-fan.dtsi"

-- 
2.55.0

