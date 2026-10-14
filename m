Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7288F32D0EE
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 23:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792021832; cv=none; b=JfZWtDOHemAt4F8tKLYq0DNyawx6KIAB13+q/L1lmU76ZGRj6to/Gs0TimHy7C+zwYAqJ6vaRrTHTz469vNbVVVzseVSITtvQ/clP5jmPhfYGzxWLTFBmQeN/zQpP30F+Py//3TjYxEKGB/ZySMOZkljhqScJdIPAocx8dbWNYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792021832; c=relaxed/simple;
	bh=0y5BaPfBnBB2F5gvoNjnMJlozpeCD/xk1dfufIqSxdU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nh5DWmqj5YwOVXqYS5uCmt3eKmRG1sAkSkZBUlrqFRgXekSTZETzznD+EoKI2lJEjJShJjDgYd1x6MP4w/CkLjZbKnMnVBQ526DKv7ZaHSy4vg6c1qzwGG4LXymYh1Kb0gYvxEUIau69AfYgG+Kp2Joo1XA9Rlc7n4spUJwfFKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phorex.org; spf=pass smtp.mailfrom=phorex.org; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phorex.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phorex.org
X-Pm-Submission-Id: 4j4ny94FbWz2ScPL
From: Luke Macken <luke@phorex.org>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: abelvesa@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	srinivas.kandagatla@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luke Macken <luke@phorex.org>
Subject: [PATCH] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7: Add Elan touchpad at 0x15
Date: Wed, 14 Oct 2026 17:49:49 -0600
Message-ID: <20261014234949.1730808-1-luke@phorex.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Like the T14s Gen 6, the Gen 7 ships with either a Synaptics touchpad at
I2C address 0x2c or an Elan one at 0x15. The dts only describes the
Synaptics part, so on Elan units (e.g. 22A7000VUS) the touchpad@2c probe
fails silently (nothing answers at that address) and there is no
touchpad, while an I2C scan finds the device at 0x15.

Describe both, as x1e78100-lenovo-thinkpad-t14s.dtsi does; the absent one
fails probe harmlessly. Both share the interrupt GPIO, so move the
tpad_default pinctrl state from the Synaptics node to the i2c0 bus node
rather than have two nodes claim the same pin.

Assisted-by: LLM
Signed-off-by: Luke Macken <luke@phorex.org>
---
 .../mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 21 ++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
index 26d6d8285..4c805e486 100644
--- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
@@ -646,8 +646,26 @@ &gpu {
 &i2c0 {
 	clock-frequency = <400000>;
 
+	pinctrl-0 = <&qup_i2c0_data_clk>, <&tpad_default>;
+	pinctrl-names = "default";
+
 	status = "okay";
 
+	/* ELAN06B4 */
+	touchpad@15 {
+		compatible = "hid-over-i2c";
+		reg = <0x15>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
+
+		vdd-supply = <&vreg_misc_3p3>;
+		vddl-supply = <&vreg_l15b_e0_1p8>;
+
+		wakeup-source;
+	};
+
+	/* Synaptics */
 	touchpad@2c {
 		compatible = "hid-over-i2c";
 		reg = <0x2c>;
@@ -658,9 +676,6 @@ touchpad@2c {
 		vdd-supply = <&vreg_misc_3p3>;
 		vddl-supply = <&vreg_l15b_e0_1p8>;
 
-		pinctrl-0 = <&tpad_default>;
-		pinctrl-names = "default";
-
 		wakeup-source;
 	};
 
-- 
2.43.0

