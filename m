Received: from th8-a.mail-neoserv.si (th8-a.mail-neoserv.si [152.89.234.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4D93F824A;
	Fri, 17 Jul 2026 12:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=152.89.234.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784289806; cv=fail; b=rtG8RuZAUOrunel8KrdDpn7jaSQ3+S2CGdW9nYK2Gtosqfdx1cTKZuA4VVH8EkeHPE7HfnDVUCb8tMuOFBnF8IBJP6IQDheOcSbaa4Nb6BPOQ/ZT8I/8gaQzaWbgZG99DnkWJ3tf5US9jJvdMmtklTrGeqS6j/P4OMzku3y7hPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784289806; c=relaxed/simple;
	bh=7o4gkyWUm5NRKXjCtq4QFPNOZqVGYX0NqrC25z6iTAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X6ctM0Gzs3lDpB7cj1cJWSgWFILAKPcfcWJZz67NepCRY2NTF/i0pg/T7NuyGFBWwHfb5gpYA/K2IXFfaWHot9qEY/QeosoXTPBuQ/fimbAlhByaP/vbHLej1mQyf6B0gn02wopcUzhMmJHi7RwylrNcxu0bFfx/U0TMXL6y3Zw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kanardia.eu; spf=pass smtp.mailfrom=kanardia.eu; dkim=pass (2048-bit key) header.d=kanardia.eu header.i=@kanardia.eu header.b=fIA0Q6bF; arc=fail smtp.client-ip=152.89.234.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kanardia.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kanardia.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kanardia.eu header.i=@kanardia.eu header.b="fIA0Q6bF"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=th8.neoserv.si; s=default;
	 b=e4wr1RIKGAKwFb7CvuoGhMJksMeo2X6/du0d44Wq3M86JsufEJ01y5xkiTjZ+cmiJQgGjB4QO1
	  1TbbpN3L7Tbdqym2X2awQ3EQrGWIZxh+U7wwbBTSvimGkQoC94d8eVA0DqAAuQwkHOGcVrBL1K
	  cvOVaE3NHoR2kaR6CNmVirZJOTTPwbNg5l+SUhhXWkyW6jcDkmqj4hvmkTTPb8Q168+VBdnHDD
	  qUfOr85z7MBLDvI1+BxnohyGqqboNAJ/q0ZT56ka3y01nF1t1xbQb+YTfVR/wKt20NhYNGk4eu
	  93Bc+VOsl1zz7+CgS36w/ayT2Wxm0DdaKVHPHxpa8WO1Mg==;
ARC-Authentication-Results: i=1; th8.neoserv.si; smtp.remote-ip=193.77.36.193;
	auth=pass (PLAIN) smtp.auth=rok@kanardia.eu
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=th8.neoserv.si; s=default;
	bh=7o4gkyWUm5NRKXjCtq4QFPNOZqVGYX0NqrC25z6iTAQ=;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
	  Date:Subject:Cc:To:From:DKIM-Signature;
	b=Fzw+J56PO1j78a7aA8LdOOs2v7ZvPZR2V0ma8jd8Fbjf1F4mmLuzSMOee751na36an2fjPpJUU
	  fk2RIDactnsZRThjMxmp8+ywjglcpvcpiuNNhWzzKR0lgcgyf/VwUfIvEDypMa1c3v978ZQBnv
	  XCVrhObnvq+dGtiQx8kRIuAKOVZ4sKvSSv9uXbjQNRDNyS7JXVmZuomzxAAwbPpdGsRgEQCKxK
	  h8wpZWA9kkM8n3W937gUXg6wXD3EuDI8hmZ3S5ZgeoZ1GhhFcHCU231b14VB7cXniltvAVT9tX
	  GfA/xaXrxsxBDIxy2H+BpC+eQ1S00NkzIUVoai08+TNkQA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kanardia.eu
	; s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=rhqQocmDn1ZVyttVBuCGSQaZNCEQDuZfGNQteeSIaWI=; b=fIA0Q6bFjuSYbA8c5wvLsqNuEU
	ggOi2blAwuHhpFw5QDqdoC7VaajtNA6OqXiB4DDkd6VqvIFZ82T6FeP1AmsfDCwBg+V4sCgmAaK0j
	mvKvRAb4MC0TfDp0rHyX0gT+oNHSz4wOR1JTC2X56T6Ujq0nOhbKYGcPbc8Ex7rLO2SgxCB7InYz9
	pv7Jx+WQnhQCsp/R/zBZLR5p+QMoxaO/pq/mxIXly9dkbJxdLKifLeauNPUtrCQj65oEcdoepCivc
	A+XaKBFNTpTc+OY+W5lwplzzMva2JT4/QMHQfm23NvsutXeftWWiazEqOTejZMth+aQty/7uoDHtg
	p4kD/n0Q==;
Received: from [193.77.36.193] (port=54788 helo=rok-trip.kanardia.eu)
	by th8.neoserv.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rok@kanardia.eu>)
	id 1wkhHh-00000001fP1-22Ww;
	Fri, 17 Jul 2026 14:03:17 +0200
From: Rok Markovic <rok@kanardia.eu>
To: Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alibek Omarov <a1ba.omarov@gmail.com>,
	Rok Markovic <rok@kanardia.eu>
Subject: [PATCH 4/4] arm64: dts: rockchip: rk356x: add LVDS node
Date: Fri, 17 Jul 2026 14:00:05 +0200
Message-ID: <20260717120005.2087386-5-rok@kanardia.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717120005.2087386-1-rok@kanardia.eu>
References: <20260717120005.2087386-1-rok@kanardia.eu>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: th8.neoserv.si;
	auth=pass (PLAIN) smtp.auth=rok@kanardia.eu
X-NEOSERV-MailScanner-Information: Please contact the ISP for more information
X-NEOSERV-MailScanner-ID: 1wkhHh-00000001fP1-22Ww
X-NEOSERV-MailScanner: Found to be clean
X-NEOSERV-MailScanner-SpamCheck: not spam, SpamAssassin (not cached,
	score=1.31, required 7, ALL_TRUSTED -1.00, BAYES_50 0.80,
	KAM_DMARC_QUARANTINE 1.50, KAM_DMARC_STATUS 0.01)
X-NEOSERV-MailScanner-SpamScore: s
X-NEOSERV-MailScanner-From: rok@kanardia.eu
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - th8.neoserv.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - kanardia.eu
X-Get-Message-Sender-Via: th8.neoserv.si: authenticated_id: rok@kanardia.eu
X-Authenticated-Sender: th8.neoserv.si: rok@kanardia.eu

Add the LVDS transmitter node. It has no register block of its own -
it is programmed through the GRF and borrows the MIPI DSI0 D-PHY - so
it carries no reg, only the DSITX_0 pclk, the phy and the VO power
domain.

Disabled by default; boards that route LVDS enable it along with
dsi_dphy0 and wire lvds_in to a VOP2 video port.

Signed-off-by: Rok Markovic <rok@kanardia.eu>
Assisted-by: Claude:claude-opus-4-8
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index 64bdd8b..9244b55 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -878,6 +878,31 @@
 		};
 	};
 
+	lvds: lvds {
+		compatible = "rockchip,rk3568-lvds";
+		clocks = <&cru PCLK_DSITX_0>;
+		clock-names = "pclk_lvds";
+		phys = <&dsi_dphy0>;
+		phy-names = "dphy";
+		power-domains = <&power RK3568_PD_VO>;
+		rockchip,grf = <&grf>;
+		rockchip,output = "lvds";
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			lvds_in: port@0 {
+				reg = <0>;
+			};
+
+			lvds_out: port@1 {
+				reg = <1>;
+			};
+		};
+	};
+
 	qos_gpu: qos@fe128000 {
 		compatible = "rockchip,rk3568-qos", "syscon";
 		reg = <0x0 0xfe128000 0x0 0x20>;
-- 
2.43.0

