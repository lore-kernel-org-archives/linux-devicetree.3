Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B2339FCCF;
	Mon, 27 Apr 2026 21:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777327075; cv=none; b=XaQ/Llr505QQytzhyhdbDmX/4VlfcULX7cF93pWrHR6Qn57L1zgaLHkKdH2Bz4WrJ5wc9mMY6JG0En4dR6wQGHa8JdR26EduE7cMucAVaFrEDEUzPKr8KpQHLdNjbWpek6p9ZqSz3NP9FO0AXmLYw3EuNNUqTuLxTc8V/WZlpcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777327075; c=relaxed/simple;
	bh=L8fHGnYJyQWq1k1jHm8DfO8Gn8xMdJZNXES7wUUBo9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nzm247aQ/Pi38pB0/8yectQu6RNVo31+xcEfeez1E4tvm9ue5pF/PeMWLZFmo/Q7x1PHyxQR1ypRGM1CBR9EpUzHh4myhpanTJi2i3PN5fIPqiiJDfUydQ2uUqFX7gup+WUb5fTb30wZLnv+EA46Zuw5YlZePiPeotsivO8ex/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ggm058k0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ggm058k0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777327071;
	bh=L8fHGnYJyQWq1k1jHm8DfO8Gn8xMdJZNXES7wUUBo9c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ggm058k0+YbgMqt05i7tTW6pf9RqHbyXgydQijp8VJES5aK77XPSjSp8n3kvNBXBu
	 ybZaEsDWpYpcmmT0S0ZoF8LQUxgDjPQBcbRF2sobpdybIiIE95AFusregoagXVzFMd
	 hdsKanc1SMBYANsyAymDv5DYG6+/SXU8jv6HRzR72faobSg8KFf5Q0h1pL4cUjNhv4
	 i1nX74FGneWfPx+koeVN7igKgM9IBVg+a72u8rzQChW5/bJ1F9xSrX2RggYK1gXxQb
	 clUnpmpMTS//Ox6/abwtN9cR4hLfVHw9qS9/ZTnYIfBK/gqnAFqwZASInrWndT+axD
	 phl00X6KJ0CoA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ACE4717E1562;
	Mon, 27 Apr 2026 23:57:51 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 28 Apr 2026 00:57:29 +0300
Subject: [PATCH v2 11/13] arm64: dts: rockchip: Add missing pinctrl-names
 to rk3576 boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-dts-rk-frl-enable-gpios-v2-11-924df9db884a@collabora.com>
References: <20260428-dts-rk-frl-enable-gpios-v2-0-924df9db884a@collabora.com>
In-Reply-To: <20260428-dts-rk-frl-enable-gpios-v2-0-924df9db884a@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1

Several rk3576 board DTS files override pinctrl-0 for uart0 without
re-specifying pinctrl-names.  While the property is inherited from the
base rk3576.dtsi, add it explicitly to the board-level overrides for
consistency with other nodes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts | 1 +
 arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts      | 1 +
 arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts            | 1 +
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts           | 1 +
 4 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts b/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts
index a9e3beb3ee5e..05fb4a7f9a16 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts
@@ -815,6 +815,7 @@ &u2phy1_otg {
 
 &uart0 {
 	pinctrl-0 = <&uart0m0_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
index c3e8966c09c4..4ac4465e39a5 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
@@ -975,6 +975,7 @@ &u2phy1_otg {
 
 &uart0 {
 	pinctrl-0 = <&uart0m0_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts b/arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts
index 54de3a50571f..8411c16fa471 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts
@@ -776,6 +776,7 @@ wd_en: wd-en {
 
 &uart0 {
 	pinctrl-0 = <&uart0m0_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
index cc054c837317..272af1012ab0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
@@ -833,6 +833,7 @@ &u2phy1_otg {
 
 &uart0 {
 	pinctrl-0 = <&uart0m0_xfer>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 

-- 
2.53.0

