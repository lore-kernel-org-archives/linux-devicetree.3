Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB1235F197
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 20:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774816684; cv=none; b=QCJHmBdhVXCFGSw4P0Y1PiIFWJU9l9U4yOlTbOcjosGrLHfXzqHFPrflKD6iVdY6AmbPx7Qx0G2kv8SfXCMqd8hNerv9Qh9wI2dDK2cJPLRJ2rkljBAJSmEDc3B+cCU6KxILfqQpZ13JBBprqkiwhBolLJxYQ4zNqp5YtjQJl+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774816684; c=relaxed/simple;
	bh=CpHGf1fptuxgjZbCL86R16p8US9srsbzMQGuHkCRttY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Xl1qYbkquWyCAGl/vsGzlO/8oPBXTIUxwOgaMzyJ5yWUcZBRdlu5nAZCJUrlGrC3zNexqX+JEV6nk+PovblAc8CjtWrmTXsgv0LOKK1MaUwsQbAk04m4SLlX/nqnlAFwFkcBA+/EZwV+KqnJmJtFUAmYrYCwCySmtRvFAK4MRQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oy2OYisF; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oy2OYisF"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so46762175e9.3
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 13:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774816681; x=1775421481; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+abQnCQaf1lWa+0MOlZOTTSG2J4Odnxh1HBL2deYlZE=;
        b=oy2OYisFgkc5YveaEfYb8RPBOECHicx95C3gGYR0rHu19n6FvyekTPYM3ULnBwVNK7
         haaRqbww7KzvT0B5MbsLCf7MF0H8ec9g4ttqBZ11uLqcYBacMzgRK1Dog4py5rqFBTd2
         6nR1uvb3nAtyWoYF8sjEkmDGw70RIw9qfyGWI6EyxRIvCp9WJenOUMF9PsKcWZyns29d
         uQaiKdrFtgj2QcmK2lGngz9AkiBE71xFZji56l89DvUpM0uuKxJRrDpe51E5wXgFvcQb
         iOY7IYio2C0BlK965BzHnZYMUelkvFIXrT6eNClH9Pl61oxrVvxQ3zMgDygxg6UvC8gP
         hdwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774816681; x=1775421481;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+abQnCQaf1lWa+0MOlZOTTSG2J4Odnxh1HBL2deYlZE=;
        b=SkQy3jLThW8MCQE+fB5m/BNZPF845pR/vtziik+lc12HPqMcvbL3B7s7LZY2k7UtpP
         vEPsnCIQeR6tW5zL+h/RRzP1Xja7rn7UhLrl54zlffvqzIcfRqzMuPjXUlW8W81sdumT
         d7RiqRcIUUvYsO9Qy7AVYStIoQq1lGXajXU4bCGrON3c40tFNpTvyshfvizRjodmAmWz
         m9eGNzDDiB3nW1MUo8r0cj05c5eRnWFkDfO1dcqoHBuT94ohC+PvVWcUyxJI8SgB7Ow+
         PHrVFgjP8wLwmRB1TWvc77ZoPxQsoQ7UeBxN1tS61BeUeZZs6NumcQ4arYPoTRDkbFCc
         3Lcg==
X-Forwarded-Encrypted: i=1; AJvYcCUAt5XoixbZaTJDVpW3NG+gQGMTHObFu6y4RWhy3TmBmD6keWWA2lC5WOWOxpk+EDp58YaO8em+74+o@vger.kernel.org
X-Gm-Message-State: AOJu0YwFdrFEgIF16cUp4CP9PTQUuagFgviUQz0uZtRV01zr+qKQIZtu
	lMKEjtO/VYlea1cUtzOO8kREBOIH6/z4BZ8IK+CBw+ueSjpzDkCACP8r
X-Gm-Gg: ATEYQzyMl491nDqp4Xa0N6OXSCNcBH4qAkxEC4xs1/a9xpXjRFBNmvKEIB9hWzeSmGk
	IyQKC92b26LuB2YreEP4u2+ytJXnhuwbrTnKsvfoNhbeTpA9YJjZzLh3CvYUzAORk7YmyhCXC4Z
	WsPgZ+tpt7UbTBsJUjJNUkoXitYiKOqoWoMljx/vo+CHb8jwOOOB0Rztuiq66pe3YGuTsB4mFi+
	eSjklHWBwX1TCUFXA3AB00fQ1KXFepI9V7pXv2h4UzweSe0v9PCJbHXXedmzGdXdYlJO1wtGnWA
	LwLDM8DPFHfq8qt8bcYkX/ijKD6klmRT6a0PApnXUdzKZGbpk+nGwlnPmIh6F00i28lVjTrnXdP
	nGJy+cxeQ/c8oAVLF9VRkvk6tCLB3AoBtRWBhSFFrIk6H+orGZMDDTD7khg49FMMCjO/mYsJ+/z
	QGlJfyQMnINO8oH/HJELm4fg==
X-Received: by 2002:a05:600c:5304:b0:485:f1d1:8f3d with SMTP id 5b1f17b1804b1-48727d67a43mr171196555e9.6.1774816680834;
        Sun, 29 Mar 2026 13:38:00 -0700 (PDT)
Received: from [127.0.0.1] ([2a00:f502:160:9323:a26c:adcb:8da8:2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487306996cbsm118974465e9.13.2026.03.29.13.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 13:38:00 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Mon, 30 Mar 2026 02:37:57 +0300
Subject: [PATCH] arm64: dts: qcom: msm8939-asus-z00t: add regulators for
 ambient light and proximity sensor
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-z00t-cm36686-regulators-v1-1-03e23b03bd70@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ6CMAyA4VchPdukbDqnr2I84ChYo0DaYYyEd
 3fq8Tv8/wLGKmxwrBZQforJOBTUmwrStRl6RmmLwZEL5N0O30QZ08OHEAMq9/O9yaMaxq72sd3
 u6UAJSj0pd/L6nU/nv22+3Djl7w7W9QNQfGD9ewAAAA==
X-Change-ID: 20260325-z00t-cm36686-regulators-8f138d47090c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.1

VCNL4000 includes support for regulators. Add regulators listed in the
downstream device tree so they can be powered in during initialization.
VLED supply is missing downstream, so it will be powered on by a dummy.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
arm64: dts: qcom: msm8939-asus-z00t: add regulators for ambient light
and proximity sensor.

This patch series describes regulators needed for the ambient light and
proximity sensor.

In the patch series which added the ambient light and proximity sensor
for this device, regulators were missing, as they were not yet supported
by the sensor's device tree binding. Missing regulators for the ambient
light and proximity sensor resulted in it not powering on when a
regulator supplied only the ambient light and proximity sensor. In Asus
ZenFone 2 Laser case, the regulators were shared with the panel and
magnetometer, so it was not affected by this bug. However, for the sake
of completeness of the binding, we add the neccessary regulators anyway.

The mainline binding for the sensor also includes vled-supply, however,
in downstream, it is missing, and we have no datasheet for the device,
so for now, we'll have it being supplied by a dummy.
---
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
index 1a340fa92755..90e966242720 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
@@ -154,6 +154,9 @@ light-sensor@60 {
 		interrupts-extended = <&tlmm 113 IRQ_TYPE_EDGE_FALLING>;
 		proximity-near-level = <30>;
 
+		vdd-supply = <&pm8916_l8>;
+		vio-supply = <&pm8916_l6>;
+
 		pinctrl-0 = <&light_int_default>;
 		pinctrl-names = "default";
 	};

---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260325-z00t-cm36686-regulators-8f138d47090c

Best regards,
--  
Erikas Bitovtas <xerikasxx@gmail.com>

