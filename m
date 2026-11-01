Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793570139;
	b=sCZfH0BAwxmXRpUi+XxW7EAbnm0eDeJsz2XQXtdPyjoD4MrjjUzbh/c5XoqUsFRjUYyt
	 9PuMll9eQvVWNMBuEc4zRfcG7Deii0DkTtDsB/ATscCnocLDXhykOpRRjWvHkWIbYW0eA
	 8FRoX7lgDT2IhGn7A7iPXgYIkLPkpJvuOQUovddwv0coxWBALx99T7+FOnGYJfKdqELg5
	 QSMrWCPqo5drjd25LqJZxUrxVh5PqJTq6vRX+h3HeAw1VWr5uBtGvtNimhupVNSlhicL+
	 igioVT9vYiJl9oXaeQuYFuWpcjg1BT/W332dUgHAYZf6G5GHs+KVIASyvPMFE2lE9rA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570139;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ikDdtShoooMkULgvirxHE2XAnR30Kk/84OcnCY3ATGU=;
	b=4WZd78cYiOXgGLwHyUCV1q4WTlD/lNd8ywT3rzyMkC7TFdyIT1YJeS9SJFutQVDbKDep
	 DDOPnESOOZFJcz15+Dm1YbcsUJdDzeyFw2F0xlqQVH1UbGbP+hSnteMPHua8TKcAkmGXj
	 ajft9WkQmvdICxwzbC2K220bdky+Qbny94QbgQnyc7Q7zoAs4PDr6UOkFZHrxwAQoKyUY
	 wiE2exwO0Gx2DhwBdylEHopHL+f2mOT8UQ72OF96IZ2KXd1RyijiE1+lfG1pvRZS7gDYt
	 J1BYbc2P81i08roaMXRv0Kt2lZaL0nEgY3iRE0PNW8UJ1g4P1TEagFhAEmhF0vXLkkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RRUo1WkU;
	arc=fail smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B95606A330
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 21:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RRUo1WkU
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793570139;
	b=wtlWP7LPdAPcGxYe3wa+CEEnhbi6yDalQMyds/Du7dPd8iOLu/zx+PV2tqXtbAmZB4YV
	 GjLh93UgyUIoF44Pw9sK7DN++CUAjQWlD1NALGDnWOAlq7AV893Encsrds0XBZkBuihns
	 5m6p9R3dZgk0po0q/hfbduVA5kuqwVzwgMvR1YdUFh6KZSE8N5nl0dgtqdv21Hkv9MAxH
	 jeV5LX0eEk2Iy2wlxuwdOz0F4sG3PAcwRHoPcvN8kzffsgCSEK4dnuzIbpypltB1MN8/h
	 0XKfFnAtCG8RnyUfqG5YGQ70W47AjnhNfwn6jfLIUbSpd6LcQ89xfh4oHFSRiNqfg1g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793570139;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ikDdtShoooMkULgvirxHE2XAnR30Kk/84OcnCY3ATGU=;
	b=fobu7NQGc6Sp0yLAuqdA2RDI7VxPoW6PmgxXlXsyiX3UUq7FfIDjm23ZZjFihabl3rP0
	 mPq6040FaRuQ0uxyGlOJmdJ1xmzW76WxjfIv152tSMENrKZyqYCfb+cabxQd3aMPQ6sFO
	 cn37agfH6PUtUtflnlW3b66WjKiaiW85idkhERv6z6lizRgHmqi96ysnNqKam2TKgpL0J
	 zrKljwaAhnN/8ExMHtwnvhoXMY3L0S/luw7VYTDbEQqpRPizfULmLHongOmB/+ZDD5YfM
	 5uwNBpk6OiVsUcWYX2VXqB6KbQywaeKxHkkVhLvxGsAE7kNTpLHWdkPfhzXjgYizCIQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ACFC51F00A16;
	Sun,  1 Nov 2026 21:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793570139;
	bh=ikDdtShoooMkULgvirxHE2XAnR30Kk/84OcnCY3ATGU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=RRUo1WkUi3gaN+mvkQvIKHTTI+RzzUy5uioUQ6KrB28B/U5LT1Kb1JuljqHxtDtrX
	 UG8cog1FySvJA7Qhdtxu67a99gR8j7Z7VS9akmjBndtRvJBIRuWan3w5uPu46CCN6M
	 OQbq7Cc6iE6Eo5RqDiksHFz8bfxuVB0csTmV/VrKJ+V401z6pX9x21j3aaXDn6+Fme
	 MEfPajfFOMT1N3AlH1XhpRPlJfT6oMds9iqOE/yCxsHerF7+f/EiRZ+mMUvFxFQBAU
	 Okygzwv21KCJ99/abCA5owWAMrPepHdUiXzjzfUXRYM5S5UGk4ODSKt7WyHWuBK6PX
	 7mvhQ83nIQjpA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 30226462A4;
	Sun,  1 Nov 2026 21:55:37 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Sun, 01 Nov 2026 22:55:24 +0100
Subject: [PATCH v2 6/9] arm64: dts: rockchip: rk3588s-nanopi: rename usb
 host power pin
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
Message-Id: <20261101-nanopi-m6-improvements-v2-6-a24769efda23@gmail.com>
References: <20261101-nanopi-m6-improvements-v2-0-a24769efda23@gmail.com>
In-Reply-To: <20261101-nanopi-m6-improvements-v2-0-a24769efda23@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <Shawn.lin@rock-chips.com>, 
 Diederik de Haas <diederik@cknow-tech.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793570136; l=1219;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=CflUJdIxsWjoqVlMu/6/MIyqLpRBfOQA+mPJNxxQcPE=;
 b=KjeqjJSow57CVCI8aelfifw5cndUKU7bXvhqttUKf+NoTCbNEUQZ3RSESyXKIFyR/aO9CeAQS
 +MX1CrhBOwcCXrx0BDICFCzG8wV0kAQ5MVAc+SAN7m38mh86sVPxlFw
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com
Content-Transfer-Encoding: 7bit

From: Joachim Eastwood <joachim.eastwood@gmail.com>

usb_host_pwren matches the signal name in the schematics, which
simplifies cross-referencing. In M6/M6V2 this pin was renamed to
usb20_host_pwren.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
index 1d37862edb5b5..56264ff3b409d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
@@ -79,7 +79,7 @@ vcc5v0_host_20: regulator-vcc5v0-host-20 {
 		enable-active-high;
 		gpios = <&gpio4 RK_PB5 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
-		pinctrl-0 = <&vcc5v0_host20_en>;
+		pinctrl-0 = <&usb_host_pwren>;
 		regulator-name = "vcc5v0_host_20";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
@@ -340,7 +340,7 @@ sdmmc_pwren: sdmmc-pwren {
 	};
 
 	usb {
-		vcc5v0_host20_en: vcc5v0-host20-en {
+		usb_host_pwren: usb-host-pwren { /* usb20_host_pwren on M6 */
 			rockchip,pins = <4 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};

-- 
2.56.0


