Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6093EFFB8;
	Fri, 29 May 2026 15:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780068692; cv=none; b=fmbSaxgHtdbwBrkPlQs3h3zv7EYws/htofa7cUFs3fWkOCplyK3L14EUh3DvUcjwknUDPcMLn8wQMifwnRL4ZfnBG1xmbljqkULUCwNWqSkwZcr6uC11b9O3LlBg+R+1GEy6DpSE+GFpACfPFMuOknAqtMUC4gTCHCqml2C2vrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780068692; c=relaxed/simple;
	bh=c9I9mrSZss9ipoBnXCmsbn04ME4OcIddnFHzKREDh4g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hdceUfFKiMWOHOKPC6BUl7cygBhzdYLfd2QT1ePUvQL4pc5OWQlSvBdk+JnPa5tYoxja/P7d6rGJWYuuJLoQWQOzGTJ9/5v+93IbKIczAmvOTHWKGh6Yyf+RKPqwoKPTwfd4IB903Z5JiftCGq0B59MP8PLhj1ls29gZmoBOLwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pWWpdmpQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pWWpdmpQ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1FBD5C2BCF5;
	Fri, 29 May 2026 15:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780068692;
	bh=c9I9mrSZss9ipoBnXCmsbn04ME4OcIddnFHzKREDh4g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pWWpdmpQi1abzetdwtgJvS3URvDDWGCKPwfy4DeTNby7Pcjc8dxlhDvojqs3jv4pM
	 rLoQk9wwSwQkmAsDidPJd1/RJfqqNTv1msrzGX+jNK9gvaPsdQ5baMVCOOfI23gEd8
	 V5vOyZuxaM8Y4jVMUun2Dkxt8Luz0ti7IphmRkY1dcKEGzcgi55RXhNWVg2ufFHujj
	 /jYdY2PJNZaV6y7aC7sxmzkUEO88NYa6fzclj3Wazaz5zRuWKSFRIC9w9+H8vYxyKd
	 Kb9z6FZyXLUoLKNV2RWfZfl4Stf4XDD8xrKVUQr4d5o7z5zApHm2E1gx5o4y3VvgEB
	 ECvXRqCSO8W2Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1870BCD6E51;
	Fri, 29 May 2026 15:31:32 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Date: Fri, 29 May 2026 17:31:25 +0200
Subject: [PATCH v2 2/2] arm64: dts: rockchip: fix PCIe regulator name on
 NanoPC-T6
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-rk3588-dts-rtl-eth-describe-dt-alias-v2-2-49700248143f@pardini.net>
References: <20260529-rk3588-dts-rtl-eth-describe-dt-alias-v2-0-49700248143f@pardini.net>
In-Reply-To: <20260529-rk3588-dts-rtl-eth-describe-dt-alias-v2-0-49700248143f@pardini.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1834;
 i=ricardo@pardini.net; h=from:subject:message-id;
 bh=0u1U7cadCrfZljLfYE+rIEFeBThAN/F4SqtY240X3PA=;
 b=owGbwMvMwMFoHWf/eN7xty8ZT6slMWRJbgyaWGffcDNPdKV6xeNHq87baQTt8Z/yeEvA9IXlD
 90VkgIDOhn9WRgYORgsxRRZ1kgo83xb/+rUHY+OyTCDWJlApkiLNDAAAQsDX25iXqmRjpGeqbah
 nqGRjoGOMQMXpwBMdZ4TB8Ma5zeHZx+QylB6rWYYfenQtcPRWmabN52a9u/N/9+HllsZHfKRiy4
 MSBWJzHvleiYlyftBeyp/2r9VutPUGP32b5u4IpFTz32NW8OdyprGhV/PeJgIy6z9v6/Q8s+28D
 ahj9eK54iGnylnufdbx+/ln9/CUmtmpn9h4Z5zjtFv/X82cTuRpmdsOr+7Jxzy5Xpw9wer0dLPD
 gaRa95x6vaJlX53bFm5ylEw2claP+SzRfFSA/bTL9zl3gTyPZikZK9rU7aIfeqFOb6r+WP1+5UT
 ympXzjXac+7X9/T7p1rzH+knTLthHZC9N/aOWXK9SKWyCNOl+Ju2SkEhNXEJcqI7pe0yPnqLLlO
 5cCE3GAA=
X-Developer-Key: i=ricardo@pardini.net; a=openpgp;
 fpr=AC18230CF6AFEACADC4888933B5E3FE39EC7EDE9
X-Endpoint-Received: by B4 Relay for ricardo@pardini.net/default with
 auth_id=588
X-Original-From: Ricardo Pardini <ricardo@pardini.net>
Reply-To: ricardo@pardini.net

From: Ricardo Pardini <ricardo@pardini.net>

The GPIO-switched 3v3 regulator on the NanoPC-T6 is labeled
vcc3v3_pcie2x1l0, but it is wired to and consumed by &pcie2x1l1, and
its enable is the pcie_m2_1_pwren pin - i.e. it powers the M.2 slot on
pcie2x1l1, not pcie2x1l0. The two soldered RTL8125 NICs on pcie2x1l0
and pcie2x1l2 instead share the always-on vcc_3v3_pcie20 rail, so
nothing actually uses an "l0" switched supply.

Rename the label, node name and regulator-name to vcc3v3_pcie2x1l1 so
they match the controller the rail actually supplies.

Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
---
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
index 04c4479f08170..7d314df3f947b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
@@ -203,13 +203,13 @@ vbus5v0_usb: regulator-vbus5v0-usb {
 		vin-supply = <&vcc5v0_sys>;
 	};
 
-	vcc3v3_pcie2x1l0: regulator-vcc3v3-pcie2x1l0 {
+	vcc3v3_pcie2x1l1: regulator-vcc3v3-pcie2x1l1 {
 		compatible = "regulator-fixed";
 		enable-active-high;
 		gpio = <&gpio4 RK_PC2 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pcie_m2_1_pwren>;
-		regulator-name = "vcc3v3_pcie2x1l0";
+		regulator-name = "vcc3v3_pcie2x1l1";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		vin-supply = <&vcc5v0_sys>;
@@ -655,7 +655,7 @@ rtl_eth0: ethernet@0,0 {
 
 &pcie2x1l1 {
 	reset-gpios = <&gpio4 RK_PA2 GPIO_ACTIVE_HIGH>;
-	vpcie3v3-supply = <&vcc3v3_pcie2x1l0>;
+	vpcie3v3-supply = <&vcc3v3_pcie2x1l1>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie2_1_rst>;
 	status = "okay";

-- 
2.54.0


