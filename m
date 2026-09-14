Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83A841DEF7
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378934; cv=none; b=aIZEczCtVG5Yg/hXV1c6NBfOOcERupAwtgUP9raRyStW+/E0sYEehSZeOdT0fE+9dVCsoguos7WfE9mB3P2HDgu1i7mTy8i4OcTAE3VaJt3nPDTbtjBe9sGARUEBkWNK+AwtiMjNRpr7OMWHu2hiiGt4l4LsnspD8L7SScjpJr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378934; c=relaxed/simple;
	bh=sDW/aUbwwqIKdbo7NlCofhlvpdp67Pa1CeIZ4QAv9mc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tI6hYLYp/0R/Dxx7sxWWwdAC3ozrtGw5njXgLh268oGZleP+4yNFq/gE2W7uDv9efInLYnUemKeGkocylaOd23GsZ1YDzIgatxCy/A3F8tifw06KxVqzKWsBHai44z2DtJIHiPiqbbOhipfaPWi2o+HWUhDlQpfW3J/PAGQTpwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dk7pOs+4; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dk7pOs+4"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so7040725e9.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 02:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789378931; x=1789983731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rlXT5Vymmz2XHkxfsW/ZgZr1rgsCOvph5WJnVxHzsa8=;
        b=dk7pOs+4ko1nD0ddf2WC6nGetmYmLkIxDoy7hM9ID8JOtPa4HxmbZdZuBttEixGEeP
         Xbb+ZZc28WYCtfWtjChVa19u8CoOOzLGz5tFSFz/GMwh8rEsEa/XfSRcgri4rX9f1z+f
         iOuSbXK0P1UlMgrjZKPDBGfGjJY7hbO02qwAUUifV1SwKCIFNob790P/YXduioXsBXIV
         edMgxMTBrbN3iBjBCPYELA76Ui3DCD80b85JZ+yu5CI3Szr7MjNM/AYysrDlCFYqgGHz
         myCrAhZ8NQyYMkpxwWckaHvrEKWQhInTmh20X/Op9LNgeXbW6KZBJr+gNTRMgJ2MeLA2
         N37w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378931; x=1789983731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rlXT5Vymmz2XHkxfsW/ZgZr1rgsCOvph5WJnVxHzsa8=;
        b=eJhCUyBM+W27XFc2JmH68XfT9nHNbrWBZ7nnnWiHdOC0Q7gdlGZKxC/YRUiasoLNM1
         GEd7PvSTSmI4G7xEFLe/wB+63sncuNfjI3YgEC5jtOikWVLuYef4irgwshrn7a24SY4A
         aAVW/8bxibHOfsZ/v5T16PTIzCNgFrm9I+PttoiXu93EDBE3zmbQFJN5F9X/jOubbdNQ
         Z+6HkBROjsQYj2WEQ76f35Edow1x96LD9RjyBxiQUd9Yh7t72YDpQvKy5w595BmVgtFn
         keU/J1r5Dd5wSCuKu8oHBdh9TH6c3/14MIk80jMGR+lOvV+wCJ3nfXVxDAaeTf5S2tg8
         7Gpw==
X-Forwarded-Encrypted: i=1; AKwUvBzlQwSkw734gUL8ZSzDFvPi9kx1D3SZBNiNk2LfuLyYPIC70IvDw3tZggBMJoPJ/NIOaCtr7p3Ryx8V@vger.kernel.org
X-Gm-Message-State: AFuF++nwgnIwJwmw98tF93UggPTpGxfhYal9ZB4l9GQvPPXugxfuUiAN
	bX1mySdDJBfB12EgxKlTWlwoKL80XkbpCShwPNe2UhFsTzHNBMCW7fAD
X-Gm-Gg: AYBFou0oFcvPJIubs4//aER9s3+UE7luwPJxAvGefHAxfQd9Jv8OQvjF5EbLkz7jm5v
	nA56qw3cq963Q+9vTxiN73Ih0ZyPVq7UdkFowOWHD1r7A7FzvgpajMYfDXZguEVCnTqVRINHKve
	dzCyG7snQ7fcEKEGsFLWA7rBPqM2IGAz45Ri3p8kVAU4wY9n9g7U8Pkns11001sbsu4lGnrcd72
	1u55huq7ZwtWUR0yIlGq10km3dA6aNy/2F9zyewSuRFAb5TuCO5M8tTHj8wW7f/ZikVUoAPMyKK
	piDHzrSvLan5LChUZOJw6v6LZcbtlC9RCcrDDvKuuf4uUBY1J5ACa3iFHo+EvpSAaoupuwZXUgc
	w1WcExT2WKhWjJ2ennpdDqkb63NtZu6HODNbV4osJEQYlDxUPOmOnBL09WOsbP7gVctJ5IFecx/
	fRdTNN+v8DMm4KoZg74IaBQx679zMyNswRBcYovrTuyRVY2FkxPEepe19knhELcr3UraDSXTEyP
	hmMo6U=
X-Received: by 2002:a05:600c:6383:b0:49e:715d:95ca with SMTP id 5b1f17b1804b1-49e7a67e134mr19168495e9.13.1789378930817;
        Mon, 14 Sep 2026 02:42:10 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.25])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49d26c2a419sm429816655e9.7.2026.09.14.02.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:42:10 -0700 (PDT)
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
Subject: [PATCH v3] arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add the camera privacy switch
Date: Mon, 14 Sep 2026 11:42:01 +0200
Message-ID: <20260914094201.14009-1-okerixx@gmail.com>
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
Changes in v3:
- v2 went out with its subject header swallowing the first paragraph of
  the message, a mistake in how I generated the mail; no change to the
  patch itself.
- Link to v2: https://lore.kernel.org/all/20260914092802.12315-1-okerixx@gmail.com/

Changes in v2:
- Capitalize the switch label (Konrad).
- Put the pin state where the GPIO index sorts it, between gpio94 and
  gpio111, instead of after the trackpad state (Konrad).
- Link to v1: https://lore.kernel.org/all/20260914081652.5935-1-okerixx@gmail.com/

 .../boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts   | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
index ecc8c34fb983..769f195c99d9 100644
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
+			label = "Camera privacy switch";
+			gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_CAMERA_LENS_COVER>;
+		};
 	};
 
 	leds {
@@ -1012,6 +1019,12 @@ wcn_sw_en: wcn-sw-en-state {
 		bias-disable;
 	};
 
+	cam_privacy_default: cam-privacy-default-state {
+		pins = "gpio99";
+		function = "gpio";
+		bias-pull-up;
+	};
+
 	cam_indicator_en: cam-indicator-en-state {
 		pins = "gpio111";
 		function = "gpio";
-- 
2.55.0

base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
