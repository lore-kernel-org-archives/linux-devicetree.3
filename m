Received: from abi149ajj126.mrs1.oracleemaildelivery.com (abi149ajj126.mrs1.oracleemaildelivery.com [129.149.100.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D162D29BD82
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.149.100.126
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774257938; cv=none; b=oQ+czlSTR1WNewEb//aOSQrK4mBCegGSYdygz8enGDRGvYDNUvYcbGvtWTZ6JFwMHmEByiXJRYkDCrl624XGqkC9XHaUUi78KJUiJjzQSxEeL2YlKV9CRr528A3og0ne0vxrp5208W1MIl33kWJvwDKaeNzorwvizHVzdbpDSdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774257938; c=relaxed/simple;
	bh=jtuJ3sDSTRydL4QDqtLQQf/RxGRON6GfNn+9/Wpf6pU=;
	h=From:Date:Subject:MIME-version:Content-type:Message-id:To:Cc; b=Z5YQDB0VI6JYLaiE/hI8DvV5cr2m6anZ2w6S5DDiQxkI9o6FS+SJHfnC5hMqleWHA1l2BOflI9KFBPPcNBUEfGZnE434YjD0oTKQLGRmC7soqFR0rYyGkvDldgsKslHOq79qAyi7KM7aNQFzKhlfDrM7BZxDl8Gqvm58t3xQKNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pta2002.com; spf=pass smtp.mailfrom=mrs1.rp.oracleemaildelivery.com; dkim=pass (2048-bit key) header.d=pta2002.com header.i=@pta2002.com header.b=SGykjm1H; dkim=pass (2048-bit key) header.d=mrs1.rp.oracleemaildelivery.com header.i=@mrs1.rp.oracleemaildelivery.com header.b=dTjfB1IB; arc=none smtp.client-ip=129.149.100.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pta2002.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mrs1.rp.oracleemaildelivery.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pta2002.com header.i=@pta2002.com header.b="SGykjm1H";
	dkim=pass (2048-bit key) header.d=mrs1.rp.oracleemaildelivery.com header.i=@mrs1.rp.oracleemaildelivery.com header.b="dTjfB1IB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=pta2002-202603;
 d=pta2002.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=QqcNY84HU56C92q/VUNsNqUbrdG+Xf4zqhVnZIVoFdA=;
 b=SGykjm1HaHEpc6bT9Jssyqt9AwB5ELid06ZDnh0n5u9iNONzf7Q+Yq/hyp+MpQYIUABQpx7c2FLM
   hZ71V2eGNnP6SQmD+vkCOdWkEs0CeI8PANSz9HCqLn7HMlfVvRkbGiDXEW3VoImpSsqEIN95gFBG
   n5BmQ+5MweKTSQWJ6t+YGHkitAn855pCTXJ1q699ewzIlX6gsIY4uEwzsH66hkPFBzYjTfvsUN00
   ty7duN7YRDYhz6pDnZ5Vr1zMNDxPdg8GZ3q2R/yIAd9JyJGoRCbCnFmH8VekVcVbInZb7nLL6Na2
   wNhBqCDC9TfFOZxo0Sa9XbOGujTP9XQiFkwmew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-mrs-20211019;
 d=mrs1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=QqcNY84HU56C92q/VUNsNqUbrdG+Xf4zqhVnZIVoFdA=;
 b=dTjfB1IBix5pQoQ9OHqiSthvY182XwUZcdhSN55pqKjIoaXMfWqj1yjszEQHEhSUAUg5E23zc+A7
   saEA/t7Hgj1467E1jlaoehv4pvobH+FW7tc1gRizMO4Ho5MRKVhm1CulW/SZfAExei95FMrj6yFO
   Mdi9+rAphlv/QioTeStD2Z50CxWsZv39ZN7tRpmSJ5NVBO5FkCAwLly/Obgt795wcKTYMyLbgjjd
   mvSHmGrksfEuqhRQHFdDqMg1HSwiXEQgVI6/H2ddrepH2SROu3N6XO2UA2an/DFXay5l85ThK5vr
   k5+OlcNWYSQUp5dxyFhRYy3usrH+5eUXBr7nEw==
Received: by omta-ad1-fd2-401-eu-marseille-1.omtaad1.vcndpmrs.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20260212 64bit (built Feb 12
 2026))
 with ESMTPS id <0TCC00F3NI6NB3B0@omta-ad1-fd2-401-eu-marseille-1.omtaad1.vcndpmrs.oraclevcn.com>
 for devicetree@vger.kernel.org; Mon, 23 Mar 2026 09:25:35 +0000 (GMT)
List-Unsubscribe-Post: List-Unsubscribe=One-Click
From: Pedro Alves <pta2002@pta2002.com>
Date: Mon, 23 Mar 2026 09:25:33 +0000
Subject: [PATCH RESEND v2] arm64: dts: rockchip: configure hdmirx in Rock 5 ITX
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-version: 1.0
Content-type: text/plain; charset="utf-8"
Content-transfer-encoding: 7bit
Message-id: <20260323-radxa-r5-itx-hdmirx-v2-1-c52501909577@pta2002.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Pedro Alves <pta2002@pta2002.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774257934; l=2272;
 i=pta2002@pta2002.com; s=20260304; h=from:subject:message-id;
 bh=jtuJ3sDSTRydL4QDqtLQQf/RxGRON6GfNn+9/Wpf6pU=;
 b=u+oT4e3lQ1Mx0jJN9zwHOslJ4vLhPOFi3qoN3g3AHn7FFUgVyrilOyNoIzDraMN5SqUeNOFF4
 /KLBNb9KgoACNjDJsmTE0GdWftgOVYCBf2Mmox0xIMzxmltyicTF/Fg
X-Developer-Key: i=pta2002@pta2002.com; a=ed25519;
 pk=leagPTMCtYIB9nQJfoZ5+TYiuZUercAQHfGnFVTTaiQ=
Reporting-Meta:
 AAEZj3e2HI7KDnQhf5vUwFKE8bI//bFf2o2wX3x9dOI4xOQ0+M5dRFepE216EC/6
 CouR05T8cWH7WqfaWBvp+NownUX/HGcqxfVVhJFGOXmsRfhWHBEWuTS5V7OBFA/Y
 qaH2Vyvajfp3iJFG3BUzbQ2J/nn3oyVxLhoUQ8v0a8PvPZeXFjc7fK2DpjOOZXX8
 728UDfTSy9mjrMwgcjjz2QOase/QK55NObqjmW89g1PaC2JygIJac5/NKfqL6QA8
 zy/U1+2RTIESbOMX2vnhLqQzbXXxDesSjZCA9wfhkH4nD1asLkyeVs+k/fUTqchQ
 SihECZP6+A4Tc7x84FQo0VPWobxGxXSf9jLRO6RN6rJ57voN0pr2FjOgsdsw/Wp2
 SkMpj0EFuyh5dEzk36M+L6TAJXu4kuZWE9i/H2UQOraWGq+MqAvKN/DGuXgLIegm

The Radxa Rock 5 ITX board exposes an HDMI input exactly the same way as
the Rock 5B, but this was not reflected in its DTS.

Change the rk3588-rock-5-itx to configure and enable the hdmi_receiver
and hdmi_receiver_cma nodes.

The hot-plug detection (HPD) pin keeps the hdmirx_det name rather than
the hdmirx_hpd name used in other boards since that is what matches the
official schematics (HDMIIRX_DET_L).

The configurations were confirmed to be identical on the downstream
Radxa kernel, and this has been tested to work on a Rock 5 ITX board
running kernel 6.19.3.

Signed-off-by: Pedro Alves <pta2002@pta2002.com>
---
Tested with the following commands:

v4l2-ctl --verbose -d /dev/video4 \
  --set-fmt-video=width=3840,height=2160,pixelformat='BGR3' \
  --stream-mmap=4 --stream-skip=3 --stream-count=20 \
  --stream-to=hdmiin.raw --stream-poll

ffmpeg -f rawvideo -vcodec rawvideo -s 3840x2160 -r 30 -pix_fmt bgr24 \
  -i hdmiin.raw output.mp4
---
Changes in v2:
- Updated dts spacing to match coding style
- Reverted pin naming to hdmirx_det to match schematics
  - Didn't end up changing other boards to match. There are quite a few
    others, so I'll probably send a separate patch for that.

- Link to v1: https://lore.kernel.org/r/20260304-radxa-r5-itx-hdmirx-v1-1-f77bf1f7ce03@pta2002.com
---
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
index 172aeabba72a..8e0eead7d223 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
@@ -349,6 +349,18 @@ &hdmi1_sound {
 	status = "okay";
 };
 
+&hdmi_receiver_cma {
+	status = "okay";
+};
+
+&hdmi_receiver {
+	pinctrl-0 = <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &hdmim1_rx_sda &hdmirx_det>;
+	pinctrl-names = "default";
+	hpd-gpios = <&gpio1 RK_PC6 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
 &hdptxphy1 {
 	status = "okay";
 };

---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20260303-radxa-r5-itx-hdmirx-f4645e64f8c3

Best regards,
-- 
Pedro Alves <pta2002@pta2002.com>

