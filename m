Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F94247DD6B;
	Thu,  4 Jun 2026 16:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780589930; cv=none; b=FQJcOc3xVzz1F8n1AgSEunxcfEaIlsh99/PiY6kGy+EMFAgaapFHXovBSJio3wh7wewcLjwo3E59hb1vAl9A5Tnvi+/2qy7WplR9pQnNwy52GjOcONiWcpoFpdO2ChvJ6f4alg/EUuIATDmXMHXGBmf2oavd6aqLodNfVJCmIl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780589930; c=relaxed/simple;
	bh=HlnxicECOaJGFUNn4uuTlkWF6gz28FOW5955bz8C4/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SfFXhq1cF10yhYtG0JG4k9+50EfaSFHG4vRtl4OsiFWdO8X+H/nAGVk847zClvZY8uFJyFoLXZOJNRzw6Ju81Axe/YRC0N35as5in3+oNOMke2NbwtwbC8j+AUsdQ00IjJxo2YUXPis4EGelTpXK3+pDEBlTUsPG3AgQqCk9lZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ecDgGXlu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ecDgGXlu"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EEEA5C4AF51;
	Thu,  4 Jun 2026 16:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780589930;
	bh=HlnxicECOaJGFUNn4uuTlkWF6gz28FOW5955bz8C4/0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ecDgGXluvDlAb9ziM9hFgn5IW+ibS+D/vTaRgxA1UqFlauhamfdXJh5bV6q9907Md
	 U7b2DmQVbY+PqlY+uNTaGe1DCy9rDK0jGDn8qQiHhsM9LxhC2RV40MYZc0PsQpnag1
	 64NlRQZcjKU5NQ9Y71O9pnM6MsX8hYwSoMvQag8/ov0F69mmz1Wj0BwOaFT0HobBS6
	 5CvwJIdqYBVB0pIcUi0CAR684nBkUUob8OO9963Ua5mJH+krzq377Z5cIM238fxAM+
	 QlGDokYPC4h9HJzmxJ9XthKhNV9KTF35qdaQ12x2Pac9cREbF8gbiM7uAho1fB+Hu3
	 1DtoyS9EL9EXw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E57D2CD6E7C;
	Thu,  4 Jun 2026 16:18:49 +0000 (UTC)
From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne_via_B4_Relay?= <devnull+jerome.debretagne.gmail.com@kernel.org>
Date: Thu, 04 Jun 2026 18:18:45 +0200
Subject: [PATCH v3 09/10] arm64: dts: qcom: sc8280xp-arcata: Switch to uefi
 rtc offset
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260604-surface-sp9-5g-for-next-v3-9-6aa6f6612c10@gmail.com>
References: <20260604-surface-sp9-5g-for-next-v3-0-6aa6f6612c10@gmail.com>
In-Reply-To: <20260604-surface-sp9-5g-for-next-v3-0-6aa6f6612c10@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780589927; l=1363;
 i=jerome.debretagne@gmail.com; s=20260520; h=from:subject:message-id;
 bh=DHDnAoJLxGRzZgCQPXZ9YZ8sqp9U3koHrcqXIq/qniU=;
 b=dV6kXk42HLb7SKFt/YgS8mFOGRY9U1c5MTVtilRg2CJTJjy8whkThnwFnak/7xwW9iaSAm7nF
 5929rMl2Ja3BAYd8MktztOqjilKGxpcxupi/uw3HS+0Li+tFW1AUYlf
X-Developer-Key: i=jerome.debretagne@gmail.com; a=ed25519;
 pk=3/JYhgYjGg5V9mlFxc0A0+pFiyjsuDB/TtDlNMId9fk=
X-Endpoint-Received: by B4 Relay for jerome.debretagne@gmail.com/20260520
 with auth_id=785
X-Original-From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
Reply-To: jerome.debretagne@gmail.com

From: Jérôme de Bretagne <jerome.debretagne@gmail.com>

Align with the reference implementation from the ThinkPad X13s:

Switch to using the Qualcomm specific UEFI variable that is used by the
UEFI firmware (and Windows) to store the RTC offset.

Use the new 'qcom,uefi-rtc-info' property to indicate that the offset is
stored in a UEFI variable so that the OS can determine whether to wait
for it to become available.

Cc: Johan Hovold <johan@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
index d1f72cddebf1df7b67be698a77656532d2f74766..60f65fd450ecba8196509a620be029314e5efc05 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
@@ -732,20 +732,11 @@ &pmk8280_pon_resin {
 };
 
 &pmk8280_rtc {
-	nvmem-cells = <&rtc_offset>;
-	nvmem-cell-names = "offset";
+	qcom,uefi-rtc-info;
 
 	status = "okay";
 };
 
-&pmk8280_sdam_6 {
-	status = "okay";
-
-	rtc_offset: rtc-offset@bc {
-		reg = <0xbc 0x4>;
-	};
-};
-
 &qup0 {
 	status = "okay";
 };

-- 
2.47.3


