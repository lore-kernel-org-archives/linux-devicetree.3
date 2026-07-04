Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3DC3B27DE;
	Sat,  4 Jul 2026 12:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783169231; cv=none; b=kVjeLcDy8th/+t8A7HQSLt2idnTMzzJ7JEgXJPVdtbU1AnOuL3etn7iiSXyQHl1+sD6LEnfANcULDbaiyT1miikjQdapweJvyBrsJTuIo5JjwNRhtbCWJYqVTc6/aRcVC1oLWxCdkfmEYgacwQYj+ll4EqMMQOlUj8F1juW5pRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783169231; c=relaxed/simple;
	bh=ziuyR55W+h2otLyuwKE5T8P+RLr06IgeGcVWwMZ+AOo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uljLeeQCKkmTY9zta+HVk9UnJ7WtRadQfIpk0kxb9c+oYrN/wPbm5vsW4WloshkkUdBo7M5YSwqdldoW2JNxFX9pPIvh9UGJjmYm+iusIhK+zEFk6y+eVCJb+dCNQv1IRLN7ueqX71IJ8g6IJoVEZZq/0yomrYcjGFGMXV+kYrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mm.st; spf=pass smtp.mailfrom=mm.st; dkim=pass (2048-bit key) header.d=mm.st header.i=@mm.st header.b=eMsI5LtM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MgRylLIg; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mm.st
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mm.st
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mm.st header.i=@mm.st header.b="eMsI5LtM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MgRylLIg"
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfout.stl.internal (Postfix) with ESMTP id 4F6A41D00066;
	Sat,  4 Jul 2026 08:46:57 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Sat, 04 Jul 2026 08:46:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mm.st; h=cc:cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1783169217; x=1783255617; bh=DSopaZRgPpL0KY92Lt0HxUz65nngHTif
	/3wvnAu5v0w=; b=eMsI5LtMgPSmOZR9XlwDS73uj1zvGaPqDbCFB6Wk+DmtX5GI
	4osRs+h2KoSrKs0ZeWM31185xOgVHWYryCp3NqGmjJklbcGVUlu9ZEDZHN9THo91
	aKt69TslCHE8q2tsX0Ya/nxNPYhZahdiQ7CGEke2bgTXMl+fYdO+8CcRU6/dkLbM
	bbOJ4qXUncVAToM31AUT7v8aXhqAeY87iXsNQBdrn1EYIuIKM39TUj8zMiX2v7dZ
	au6hzxkopqM+hxbC7bH6ID6SypPJXmhiQ1HnfK4kpEc8TNdBnaiy77gVhnqxvhtX
	4Yhj0mqukZoCojCClgTSAcE7g6Vj0xfoY+lpSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783169217; x=
	1783255617; bh=DSopaZRgPpL0KY92Lt0HxUz65nngHTif/3wvnAu5v0w=; b=M
	gRylLIgIByTJQQH8oJsO+H+QaYuJoU43hSBCS8RKrtRCZ0Tqgi3KUI0HU2+Oob8G
	U/GRB97cVKpQO6iVWzn4aKqyYnDuuxAKlDHYnTjKGiFxEr0A6PmvLYq/KbG3wISL
	UdBlmp6pDV1QXE7JONwdY5db0fWRr+h0LGW9isZ2w7C4PzyippxlLCSQbFamOv9e
	88MhYX1XxjUg5+AuXa47XstSPFokkiPfGBi/4EBIzHzSZLzy8FYpOZjpKaGF7Xco
	SMBNomO48E4Sj3SDHPqp1lcRZyvXqExC5n8BDU5Sk4u3HKpTYNgAOBM3GW561jNv
	3oX9dXlbyVyktgdjnmPQA==
X-ME-Sender: <xms:wABJaiFtrN-UwK_mBD5BCoRn_wVufERpJyodcWfRW0Ng7qZqK0eb_A>
    <xme:wABJargtVCG2zee3WOvnv_VMcf1RTVjZBSaLEQUUQoLlESRTKAnCnD_4EnCltAwwC
    h3fqyXQPNab7ctvTINfLOFRm0bqsEAGSOPXDGGkCiJFCE0RuqtT4g>
X-ME-Received: <xmr:wABJanuJBRES_74U_fiQe3IeV1-t6wwv5SNzLe4iCjpyGSDfnx1j9DSE2ZKTKUYpKgWbdZf6NT756Ll4QQ>
X-ME-Proxy-Cause: dmFkZTFr3i3xkzXRpTDUGWiH0crRTBA4ga4Wskl6XzSwqcORPAWlvCH6ez+ye+BrZRSPRy
    DNQY6ViUjFBZd1tkQjeVlXy5FVwQiCSafw/OoUDdznp10hgACBRGZJUa0TZNyBeUnjb7nU
    zrB2tZjGr3sZIq17zYcT3iL4Roe2mF3K/xcWf8y1ZGhkLXTs8dkpUJrR6uVntvy/+FV8jd
    xP/HhVmnHlip6SqPBd7U4H9VVEf9TfB6Ryni5TVgWJn7K3Ckcz3auvRJfo4+oQEsa5ZZFg
    mjVFj2gXHWdl/Zc4g5jCASsTC7/fEA3oN+gnq2jlzt0GalADbg/0sV8lrdNSgp9HCgV2nJ
    uV1YASE7z7xho27iC0zHR1bpvF8DFYF0RZ2c298pIQvv+aeb2f5urf2yhQ2iwQmOfG1FE6
    DLtL+D77Ex3AvFPoknNrFvYLe2bQ9PSXjXFL+KCllF5qG/hYBhnb0fVg8bmWrrOVcco5N7
    HFxkGzCFdcTV/s8msB0v6zLcr06/A5MQG8Yu7IRepibf0hVcjTeLTpKWKL6Osg5FCVQ467
    FlSfRch3vwAlTRuaqwV+ACXyN9/5WE+QDLHHaWIrdUkFYXJsHdci5RPVRfhv02JOyvFoV9
    2Flw7hY5T1ttj+cRhytF15MwtVS5oqrH0JJwKYD4PMAAxmIRhBjr/bBJpCog
X-ME-Proxy: <xmx:wABJamuRvAK97eBZ1gduVR6IjlYyKoNm2OjDgY1lDt9M9hdekCc9Gw>
    <xmx:wABJakFQ4mQlfUNBe6Y7bLAU-Ho0pLuhMNQgNoMolCVDSPQOJ8A7UQ>
    <xmx:wABJapNkR5lBnQDwratSsoFfgVgO7xOCGiPJYYax1HUvpn_X8Mxs-Q>
    <xmx:wABJarL_EGmO2LMTngk8FxMGm9XbvvPaSGtwtIO4nopYFlRoffdofA>
    <xmx:wQBJan3GDxjRwzPw8M42UB9Ni777O_LUW1BFgW3z4_cnd3AXhjdzM8V6>
Feedback-ID: i4e034308:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 4 Jul 2026 08:46:55 -0400 (EDT)
Date: Sat, 4 Jul 2026 15:46:52 +0300
From: Vsevolod Kozlov <zaba@mm.st>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, David Petry <petry103@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: fan speed control for FriendlyELEC
 CM3588 NAS
Message-ID: <akkAvJap-MtbKp8B@Vsevolods-MacBook-Pro.local>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

The FriendlyELEC CM3588 NAS kit is often supplied with a case and a fan.
Enable control of the speed of the fan using the trip points and cooling
maps from rk3588-nanopc-t6.dtsi as a reference.

Signed-off-by: Vsevolod Kozlov <zaba@mm.st>
---
 .../rk3588-friendlyelec-cm3588-nas.dts        | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts b/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts
index 0dce96ca8c28..f4c34da61c4d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts
@@ -12,6 +12,7 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/soc/rockchip,vop2.h>
+#include <dt-bindings/thermal/thermal.h>
 #include <dt-bindings/usb/pd.h>
 #include "rk3588-friendlyelec-cm3588.dtsi"
 
@@ -457,6 +458,36 @@ &i2c8 {
 	status = "okay";
 };
 
+&package_thermal {
+	polling-delay = <1000>;
+
+	trips {
+		package_warm: package-warm {
+			temperature = <55000>;
+			hysteresis = <2000>;
+			type = "active";
+		};
+
+		package_hot: package-hot {
+			temperature = <65000>;
+			hysteresis = <2000>;
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map0 {
+			trip = <&package_warm>;
+			cooling-device = <&fan THERMAL_NO_LIMIT 1>;
+		};
+
+		map1 {
+			trip = <&package_hot>;
+			cooling-device = <&fan 2 THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
 &pcie2x1l0 {
 	/* 2. M.2 socket, CON14: pcie30phy port0 lane1, @fe170000 */
 	max-link-speed = <3>;
-- 
2.47.3

