Received: from smtp-42ac.mail.infomaniak.ch (smtp-42ac.mail.infomaniak.ch [84.16.66.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B37032A3EC
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 14:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786457325; cv=none; b=n/tJNfaLSldyISqRCdUo+tIZbc8Cz3GS8kXkIZ5sflNZ035kWuq9SMujc6P/ocoFx/G8wked7lol1HqjqmyD0YDhXVKOuLj7smfAsyuOBgHvi0PoB1yfVDmS6UHsBVasjD+tJnWbZ60eslBxpgwLR1WtanzyTiNQ7RmArLPoDmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786457325; c=relaxed/simple;
	bh=vJ97WuoZUR740J5SelyXM3NVOvLilvx6+4ot6gP8Q/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ebOZW6uT1+p00HmhkKGAGBnV8/lTxr51gAvpeaEms9hIMt4Qw25DlEM7zy8Mb8+69cFK+F74Ff5Dubz8adOAYGFtYqEJWt6QGJE2Li6OnoSwKW6thVSQFXUXvDVRjDlXN0f05YCaSEZOEtL4s9Q7BxSDNpqO6RVAbzBdOKl0Kmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; dkim=pass (2048-bit key) header.d=0leil.net header.i=@0leil.net header.b=h8fHbtN2; arc=none smtp.client-ip=84.16.66.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=0leil.net header.i=@0leil.net header.b="h8fHbtN2"
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4hKD4S0ZJZzMq;
	Tue, 11 Aug 2026 16:08:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1786457319;
	bh=zJqFjeEz2lMqJWlseT7sxSs4A4TdKCnjQFI/u/6gb6g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=h8fHbtN2KNtc608cCWn8Dpg6pFi9xpS2VWBxGIdM7tmP+SCXFq6FC4b8c/9xky0lA
	 WrZ5viGyIcRjire6WsmBB5HUmX4BKb7Di+4qHqnhAChtDS9ti0WJPLvU7za2Ve2FDt
	 bnK45lzwLJ2jIYqW21BAqveBaFD9xFp9n+1zEaYvzegmkei71it/XEnzz/UIH3/ByY
	 2S8JHTcZfrtDi3sLqY6tfNbNiVoOrA70h1BDG0bI1loSrJQ5IHjpHxYZWq0W0vYtAQ
	 8usfjTrJR3ZF+nKSSb/Uiug0ZeKBkzoPfZmoNQNZhifl7sYoWHDfNeIvMtq84nyM6R
	 Aut63fRYyWQag==
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4hKD4R0y21z68w;
	Tue, 11 Aug 2026 16:08:39 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 11 Aug 2026 16:08:26 +0200
Subject: [PATCH v2 1/2] arm64: dts: rockchip: enable CAN0 on RK3588 Jaguar
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-jaguar-can-v2-1-7e78415b5a08@cherry.de>
References: <20260811-jaguar-can-v2-0-7e78415b5a08@cherry.de>
In-Reply-To: <20260811-jaguar-can-v2-0-7e78415b5a08@cherry.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Cunhao Lu <1579567540@qq.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.17-dev
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

RK3588 Jaguar exposes the CAN0 interface on the P5 connector on the SBC.

Enable it.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
index 41758fe7d3689..ed6c1162bd821 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
@@ -195,6 +195,12 @@ vcc5v0_usb: regulator-vcc5v0-usb {
 	};
 };
 
+&can0 {
+	assigned-clocks = <&cru CLK_CAN0>;
+	assigned-clock-rates = <300000000>;
+	status = "okay";
+};
+
 &combphy1_ps {
 	status = "okay";
 };

-- 
2.55.0

