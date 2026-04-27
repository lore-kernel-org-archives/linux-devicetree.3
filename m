Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393FE39184B;
	Mon, 27 Apr 2026 21:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777327075; cv=none; b=hezrcy3mJQ5LdBaaYY20cr44HJPyoEmpZFuZ0KPqYZz2yIFaJvsHbv0JHZDsXbRJilgWSUFjAmdmDgYvTQMQ0PXyu/6iN8z+tXRyzJItx6fRLTSX2V/kBpBhN8lipPlQEnDLLlYnT/0qALt5jqObeoq9ysCVMHhxGsn3ZWzkUGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777327075; c=relaxed/simple;
	bh=pqRtbplYE8IdJKdBWhM5OHW77gHMGDEF1m/tI0sVmVg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OSgKQb4uNCHrD6ZR8D4Uf5c19CfH1OaigafBk4AuImEPgCSyIiBEG3T3jakRVoLkb89xnLKdf8moF/Om+rQy639xOwALD2mBjpynicbG+S8IPL7rqMIu9UNS3Iy4/ve3AH8vfCeMG3s908otAf8mGE1r8+lb921QOUknOgMZ9Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KQLXIHWJ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KQLXIHWJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777327071;
	bh=pqRtbplYE8IdJKdBWhM5OHW77gHMGDEF1m/tI0sVmVg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KQLXIHWJdZT0TECVDrV5VZQulabse1tqARayoCENAjGajdd5B5KWN683h6Y3vIu3U
	 5CVfEqlvA3dilYUNKiO+TrtyWoyUJnTtsJIduQICpxwoesLS2fABYxCowaeIwW3jYD
	 zsfok6b79zkMnZzdofnsKK0lRaCTrOmE77rQLOc2LWcs4zZcMK0ocsLOisn+MQu63P
	 pYS02iAetB/LAyB1aMrkpAqY+UlTBq7t6RNCuxQn5TvMCUg7hp3Bg0l5n/c6gFnPR/
	 Z+PAkRZILC9fLTjqMDKyTsK+H3/EVTL7qGCDdhuFrL++UeYsbFn3UevNYGhP9FEv/J
	 n4LzWoTtnCv9w==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D5A7E17E141F;
	Mon, 27 Apr 2026 23:57:50 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 28 Apr 2026 00:57:28 +0300
Subject: [PATCH v2 10/13] arm64: dts: rockchip: Drop unnecessary
 #{address,size}-cells from rk3588-jaguar
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-dts-rk-frl-enable-gpios-v2-10-924df9db884a@collabora.com>
References: <20260428-dts-rk-frl-enable-gpios-v2-0-924df9db884a@collabora.com>
In-Reply-To: <20260428-dts-rk-frl-enable-gpios-v2-0-924df9db884a@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1

Remove the unnecessary #address-cells and #size-cells properties from
the usb_host0_xhci and usb_host1_xhci port nodes, as they each contain
a single endpoint child with no reg property.

This fixes the following dtc warnings:

rk3588-jaguar.dts: Warning (avoid_unnecessary_addr_size):
 /usb@fc000000/port: unnecessary #address-cells/#size-cells [...]
 /usb@fc400000/port: unnecessary #address-cells/#size-cells [...]

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
index 05b524f682cf..033db78aff67 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
@@ -1142,9 +1142,6 @@ &usb_host0_xhci {
 	status = "okay";
 
 	port {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
 		usb_host0_xhci_drd_sw: endpoint {
 			remote-endpoint = <&usbc0_hs>;
 		};
@@ -1157,9 +1154,6 @@ &usb_host1_xhci {
 	status = "okay";
 
 	port {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
 		usb_host1_xhci_drd_sw: endpoint {
 			remote-endpoint = <&usbc1_hs>;
 		};

-- 
2.53.0

