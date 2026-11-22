Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795324379;
	b=LjeykSh+jmzOZxRSxasgOkepAkc/vopkcHP/pPOXJj9N6Z4D/1eBBkD/x7MeTBgw4HtB
	 knd0nK52+1CJZ3xUghzSO9y+LLTRWnx7SVuK2Tf4EHdJBYPGwfoq2ypS7gxXYNEeaw3TM
	 FUrDb6cMzpHpchFhLO4c1HjVYlghvBkg4vJOmJMSnBmBqAMY+7NArRJyUkA+6JnCRj9ss
	 iC95xG+CxvGrxcqSKpCVGpxS41eY12LsFsfSacdHyWw/SWe/EltEMQIm/Qm0dqqfpebe7
	 zo5fcdu+VFTK7Zijc89bbuIif2UKRjxQHh3PUo+EG+CWvPSIJYnUdKPZZFc1FhjYmAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795324379;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ELedR2xD4QyBr1Z8sO1r58rTXSQvGwZ6iFfOWU641rA=;
	b=fCeFUP2gmC7B/sMyibSiagcwngV7rByWUx3lGDo59A/SE+6StCzjpM91Ic/wCM0vj3gn
	 PODyL0TPzlxOcif4lscVj5RZ0hEI887EVWDVv4M8/6GxI4jF2kHjme/teJuOqNcLPif5J
	 o5of1opgesAN/QA+I9XrGCpHSeplznyinYqX8bRcI7w6+XXtcZ72N/rj1Ql85AGx4O9pj
	 1otLwsxiahsrxp4KQwMtLg4gF1RnraItmPEpAXhlz/YvWO8eymSjR+mHZLayotDHqgiFY
	 y6/FFnO8yqkWEUL1mqWTD/XVt2xbLQT6i789OcgHwa78YXMRAWiknhYkvuxdYmYXknA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gw1lhnVP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70709606A320;
	Sun, 22 Nov 2026 05:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gw1lhnVP
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795324379;
	b=wvS4iz5ZYvIhrBw2wZGgrU2miNqMoeuZangPLrjxGuIKwoegbT5bEl+Mf8smTwRqr77b
	 Xuza/i7BqMHEPpgnCGHdVQL74CP3htxP8hKFI+cEp4puu5NmHDGW5Wx6qKqfZVZJjPSIj
	 +9x4Gni5qoHBmQNfEUtFk7GIjENkQmYHESeT4WwLRkf95yVha9ZCYSmPawoGXfDQ0BeK1
	 wjb3+Rqf5QiRHSGY+7qwiJPBEmAjvK4ZM9n6Sz64M0UO6eTs141IlA08kbGMLdlQuGuU/
	 we21mhlos1++2sXJGXN0NRBi0NZy7U10SxtkZXiCA6eTYJNtbWiE3FSa7XIB1UIIYkg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795324379;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ELedR2xD4QyBr1Z8sO1r58rTXSQvGwZ6iFfOWU641rA=;
	b=U7B7/IzPVW0ZvEtLrlPO/5AWPxP+I0u1AZURUmGULY/5rKWt69/BIXzm2jAIPxFpu/0Z
	 dTQIHxl6fCsiE/hrGu1b0po+hH2ysyyw0zFQ1t3JArq6eAbleyFvD4nx+G3I/m25uyWY1
	 o+2pO/n61ed91iqvtTDArIkg6Busticjckf7IFRR8PwQI9qq6Laik6mDxa3EWX5/rUHg3
	 M7yuzLOUclI/3tvvzIBTOlQgyt8dTmf62k1q45wvR5wMxFEST9aiZopA8zvd97WA02FOO
	 +Ic84f9GiJOm3UKBQyvDrkzQAe/9HJMOSddcBHH8yEaIucRpykuFSO5aWf1qjJcDc6g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D24A31F000C4;
	Sun, 22 Nov 2026 05:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795324379;
	bh=ELedR2xD4QyBr1Z8sO1r58rTXSQvGwZ6iFfOWU641rA=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=gw1lhnVPSpbDUsIxOCPM74VCNV05fONaueoavms4uJkypvCEXkNzrXWqke468nyyG
	 MJi4Fg454H+8fW3HeqJFqMTT6qTDhpxRMnXoJ7ZgFC5sk5IJq6QJBaJOccGzNBRnsd
	 PJg/S/MNR/+JvuJN/iKFex1Gbi0XlM+rAhuuosqCinL7km27NRZDFdosdfZL1jDPiu
	 GTFaMS1j1zWQO2yYjZcB936oO44titka0lAMNX911NscypP3ymHxGTkWaF28XV72Wb
	 H3Z5zr0eASj/FuVkxvRYmFOUeFjCcVbvszoJiMRUGucr40bqOnbuFvE5KPOnR6B4hf
	 PNSQAettHGhUw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 628014BEEE;
	Sun, 22 Nov 2026 05:12:58 +0000 (UTC)
From: EMCP333 via B4 Relay <devnull+emcp.enser.io@kernel.org>
Date: Sun, 22 Nov 2026 05:12:54 +0000
Subject: [PATCH] ARM: dts: qcom: msm8974-hammerhead: Fix the IMU mount
 matrix
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
Message-Id: <20261122-b4-hammerhead-imu-mount-matrix-v1-1-fa38561de9ca@enser.io>
X-B4-Tracking: v=1; b=H4sIANV5AmsC/yXNwQ6CMBAE0F8he3bVFhDjrxgP27LaNWkxWyAkh
 H+X6vFNJjMrZFbhDLdqBeVZsgxphzlU4AOlF6P0u8Ge7cUYa9E1GChG1sDUo8QJ4zClESONKgv
 Wjuhq665rW4J95KP8lOV3cH/8nSf3Zj+W1dJwlBmdUvKhRIWnuTs2qN7Ctn0B/W3cp6IAAAA=
X-Change-ID: 20261122-b4-hammerhead-imu-mount-matrix-3baa8237755a
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>, EMCP333 <emcp@enser.io>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795324375; l=2485;
 i=emcp@enser.io; s=ultron; h=from:subject:message-id;
 bh=a4Uo4loghWGDy2GdP4EuwRI5EW4ASIfAHB0njp2Ccko=;
 b=X1TaWiE38cpMtXb5uNSp4d/YoKHyq9QX4Bg98BlrKaSljImrXnX5hPRbOypyVdVOODDD9ruqZ
 Tu2mQBcmA2hDqfjWWWHr/XggwOEwiqHdl9nmvZfo9xjpYNuKrjG0PaS
X-Developer-Key: i=emcp@enser.io; a=ed25519;
 pk=5sG48Lul+Vn7OzXu3VZrCWk5uvEFPYMXYnAV0TZR/tY=
X-Endpoint-Received: by B4 Relay for emcp@enser.io/ultron with auth_id=1598
X-Original-From: EMCP333 <emcp@enser.io>
Reply-To: emcp@enser.io
Content-Transfer-Encoding: 7bit

From: EMCP333 <emcp@enser.io>

The mount matrix added for the MPU6515 is the negative of the one the
vendor kernel uses. LG's hammerhead device tree maps the axes as

	axis_map_x = <1>; axis_map_y = <0>; axis_map_z = <2>;
	negate_x = <0>;   negate_y = <0>;   negate_z = <1>;

that is x = y_raw, y = x_raw, z = -z_raw, while the current matrix gives
x = -y_raw, y = -x_raw, z = z_raw. Every axis is inverted, so a phone
lying face up reads -1 g on z (face down), and held upright in portrait
it reads -1 g on y, which orientation daemons take as upside down: the
screen rotates to 180 degrees when the phone is held normally.

The current matrix also has determinant -1, a reflection, which no
physical mounting can produce. The vendor mapping is a proper rotation
and gives +1 g out of the screen when face up, as
Documentation/devicetree/bindings/iio/mount-matrix.txt expects.

Tested on a Nexus 5 running the postmarketOS 6.16 kernel with only this
matrix changed in its DTB. Held upright, sideways both ways and lying
face up, it read +9.7 m/s^2 on y, +9.7 and -9.7 on x, and +9.4 to +10.0
on z, and the orientation daemon turned the screen the right way up in
each case. With the old matrix, portrait was shown upside down. On
v7.4-rc2 the DTB builds with no new dtbs_check warnings.

The code and this changelog were prepared with the help of an AI coding
assistant. The submitter has reviewed both and takes responsibility for
them.

Fixes: 73c9729f0fb5 ("ARM: dts: qcom: msm8974-hammerhead: add mount matrix for IMU")
Signed-off-by: EMCP333 <emcp@enser.io>
---
 arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
index e34d7b864e..9128c66125 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
@@ -213,9 +213,9 @@ mpu6515@68 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&mpu6515_pin>;
 
-		mount-matrix = "0", "-1", "0",
-				"-1", "0", "0",
-				"0", "0", "1";
+		mount-matrix = "0", "1", "0",
+				"1", "0", "0",
+				"0", "0", "-1";
 
 		i2c-gate {
 			#address-cells = <1>;

---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261122-b4-hammerhead-imu-mount-matrix-3baa8237755a

Best regards,
--  
EMCP333 <emcp@enser.io>


