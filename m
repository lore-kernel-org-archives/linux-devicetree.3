Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585BC3909A7
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 00:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783558226; cv=none; b=azdLCKMkUMir4X8edoID2BogulJixQSKJOJvu2swpoUxcJTzGQ8Jix46yCA2S1SYxj58avi3thANU25gLhkz6HPgq32uF/AcxxmQo9U+Rfu+qbeciEM9VoKlnZV82skYJjKubi7y7R0BkhAwdNn7GW60OO4LOlIx1J0gd/n5mm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783558226; c=relaxed/simple;
	bh=jr0jXQ9u/Eriff4ukSa+VuWIPf5TuQwic+1mOZqt0RI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mj3i8QVxL/Kleu03WZl9POdJ9KZ+wbV+cEnwJAZVFnONho4VFE9tST518OanyVVjsHoYMYnkpSSaldPr6FA/mtX0eEFBBVjol9zl51T7wsyICZYU7vDkSe4OnhCTY2y6hy9fRQIkyCrQngJTLwpjxx9HDL5ms3U+ypnpMN/kKo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AwbKYkmu; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AwbKYkmu"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-80bd5b5b3afso13848767b3.3
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 17:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783558224; x=1784163024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MMeVGfxElC0Lxj76VZe3jY3LwxYN+PY2gW2pcA4KR74=;
        b=AwbKYkmumt0RbUIeOX+fB8H7YoBrJdrRF2L5nYlBgWinSpkaHUd32trSwcBHwZ7qMH
         NZcEhnQqbEwhZmft3s0UToTVmogmBgfv473fUmHSQcGHX7xAWdnWshyIOhS3mLqdnqPf
         0YY5hAfCpv6Ycr9JwCIDt4e23gIw7FUTXSIThiECxe1AELU2PIMRN6ocZkaxAykYrxP7
         pi6ako2p/sTBNJ9UT7k4oDMJW9XI9fDCLxK2Tqe9/LLgn9X2A3Tqvmt/4QBt4/FmqMCb
         ZZItDFKvmTnqgAldx7056Hb0aardOjNlzcC/ZXEuit+zq7fYh8f8TBfBVLwsg0C/8ZWL
         oZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783558224; x=1784163024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MMeVGfxElC0Lxj76VZe3jY3LwxYN+PY2gW2pcA4KR74=;
        b=NMQOPwqfD310dOQUxuiTK+UQzNte3GBreqYyfuAhTGbrCgvfKXq6rwYFOJ9mLuo+hj
         SAwQkhuFpoF5NHs8oRFkBtUhJBiM4dA8JHqVGYZfcDI/2YV8OPPkxl1We5JHltrGoc8I
         JgY5D4P5naKI7HzbDXgVhyFMk4qJ1/RceVX6mvEUVaNCWEktWq6QvxowSwlAD5H631g2
         nmMGjZu2QBdPFs7CAPWK5UmbrXdZHFEB0wsFmt6mGOEvpENC18soCAUVbWY7S+k87PlF
         82ASPGn59H2Zx80PMlNB71Eo5WhUrkR5QwtRGn+Rg1RJg5lcY3KodP5e8InjYvYCLh54
         FULg==
X-Forwarded-Encrypted: i=1; AHgh+Rr+qGzEWU4R0g0LZeXrJpJ6Zy48PjimHaCrBN5dpo0XIVEL1p03gdvfujrlevdbceDH12Fv/25armiL@vger.kernel.org
X-Gm-Message-State: AOJu0Yw43UcITQIWrFHqwOnEKwgk3bnxNF0SsUU8KtWDGM/4lzvAu+gI
	HQ//NXPERvGezNjQRScsbwRqwBKe+lGc/N8JaSzIab/z5hD1BY4eu2qI5pvoMg==
X-Gm-Gg: AfdE7cl+q2dRZ/4C3T+0E3R8O+H8zutbKADFZBXJl8y+CKJd3+5UPl3PQkzRopaTHbt
	nGvo/4nNMGlQT08W+Ye9F09fDplPN7dScA2H4pMymW6PX0BcINWJA/N9DH1KFUZdx1fpdg1Dv2h
	1fNpG308kHSe8xZQ+nUtlSwzmEqngeoLLawd5k+6yTz8eM22YJ8YOLpAsgB/O7zaqgxyl5DDdsA
	+ZNBEVtKKzApZkI3WnW7pEV+HXTY/1VnoygXYjLkilkU084LDdH9kzWZ7Pr+nyodfFSgfEjdbT7
	PhmYk6h8bTLGXyotKeThhDRTx2cka6Ah2GSZ3dGKgQiFgdzLCqdGSldaR+jvcRw4wxjbtrnCEt4
	CBPC0BEJZaDYitzFjS4KlFS0jU1fQ4tNLV5KlYLhx8Qg+xUE0qGN1+06cFQKaf9DJdvahZYrAbG
	eKn6AUQ8Bj3eFlRqsE95Scq4yLWqOAeJ5XsV33NaJ515ohJA38qnnG3/IaCQ==
X-Received: by 2002:a05:690c:60c6:b0:81e:6a10:f90f with SMTP id 00721157ae682-81e6a10f9edmr12376517b3.17.1783558224268;
        Wed, 08 Jul 2026 17:50:24 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:1b3:a800:b434:bc3c:5012:1fe:ac7c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6befb688sm5645667b3.14.2026.07.08.17.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 17:50:22 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH] arm64: dts: rockchip: Enable USB device mode on rk3588s-roc-pc
Date: Wed,  8 Jul 2026 21:50:05 -0300
Message-ID: <20260709005006.413145-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@nabladev.com>

The USB3 OTG controller on the ROC-PC can be used in device mode,
but the board description only enabled the DWC3 controller and USB2 PHY.
The USBDP PHY remained disabled and the controller had no role-switch
default, so DWC3 did not register a UDC and USB gadget drivers such
as g_mass_storage failed to bind.

Enable the USBDP PHY and describe the controller as a USB role switch
with peripheral as the default role. This lets the controller register
as a UDC when no external role provider has selected a host role.

Tested on a Firefly Station M3 by binding g_mass_storage to expose the
eMMC as a USB mass-storage gadget.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts b/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
index 99853880aaac..7150d5f7684d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
@@ -833,6 +833,12 @@ &usb_host0_ohci {
 
 &usb_host0_xhci {
 	extcon = <&u2phy0>;
+	role-switch-default-mode = "peripheral";
+	usb-role-switch;
+	status = "okay";
+};
+
+&usbdp_phy0 {
 	status = "okay";
 };
 
-- 
2.43.0

