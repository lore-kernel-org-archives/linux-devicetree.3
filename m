Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=121.127.44.66
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795101674;
	b=qFnQnsGa3MPtxxUDwSYYNouS26RtQSVxFuQR3XBYCMM7IorEhwKI8RMP1sVyTetsbqeB
	 hdnJPCWal2HbtYMdV8ldz/iDatXtAV/tnGTGBOhkQ2Bk/YXwyzmj5L43x2ZFQNRlqDyLP
	 vZ0Z6hl3xO4190jea3aWSEkxWpbWdick+XYlfRPkq8ugpqr7Qt4NvGS6zK4g0B8tu8AQy
	 WFtxUjqwtRTDBNruXqRyCcfAbWH/77clBAPNu5fIhiR1134+eBvSjRcsCvg8xQ8eCc8Hg
	 d5TN+pCkXs3FBTNVfg1b1NhAuyWgM29oJv7t3BYnx/5+fmfXKm1tk40oBLn5vtVAG2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101674;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xYb4iO+Bg16fPg+PfVk0mrwOPvVkJFPhzu/AKJo56DU=;
	b=h0INWOJB1edU4cBuS3dpOQLQ54ady+yQx7EsPFsqwgMdDnAAbJcYTszHEhJ9PIL0GpCB
	 cBOYDGtosqjzPVzQW1ln2wilP03qm0tnfQZ6r/fIJzI8rmYe9saaXdGDYvWr5YVWC6T0I
	 Z1PC96lmwtlo9gYB49ZYFKVCJu2QCo1BxnmvvKHEOPI4IgfdjayblhKyD44NHtu2b+fLn
	 dHSmRCLN+nRM3p5kli4J4LVwDWazEoVqumJDG8AF1H2TgMVQjG4wwyRVS6GsSieo6D8fT
	 PLz3wbsbcdG8JE1ImQBOpM76oII/R4p3ddwJ2Eq7CK5WGKOB0qQJgO2VRXa/Lx0wO5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kwiboo.se;
	spf=pass smtp.mailfrom=fe-bounces.kwiboo.se;
	dkim=pass header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=fJu7ClMq;
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=h9039eqa;
	arc=none smtp.remote-ip=121.127.44.66
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7567A606A334
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 15:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7567A606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=fJu7ClMq;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=h9039eqa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=fe-e1b5cab7be; t=1795101672;
 bh=xYb4iO+Bg16fPg+PfVk0mrwOPvVkJFPhzu/AKJo56DU=;
 b=fJu7ClMqkLwCD0rlavfk51XDJTjinbF91czpP/pRtbt9Tu5REr5JUmxTaTRPfM08H3oiP8kiE
 IWAKI2paWcAsdJT7nSbag/s7jTUmtzgHpZYMVYkVOTcCyNQyVYUN26D+ncKhB4JqNbkyS8at2hk
 HnUBd59ME5riiEfRB+8HfAB1k1qUVEZjYXoOr4ZLU0rYtasTNZoc9X7jq+7WXjdNbd8j2y0Marl
 vd4dbEml0BPGQgWvNXbpQXchxeoEKIN2MJ7i3fOUnx606yRBKsXf+YBywkO3KthCbIZgsdpUtt1
 T6wUEbnmZLYTI1cALHbQfCd+O5UdV2o1ZTMEDFcOCGiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=default; t=1795101672;
 bh=xYb4iO+Bg16fPg+PfVk0mrwOPvVkJFPhzu/AKJo56DU=;
 b=h9039eqavaA3xw60kQz4hyh288rUlyWN5pTw5anyVX4SuK7SRFGYjRLVKyEN3hDmJsIuuwhKC
 DeIep2FJP6xgk0prsAN1ivS1yTROalwgHk6edsWUF1xd+MCksVQFnZiqq1ZQHONhEtmC73aGJzU
 ONTIADMQoi0dzV1lLCQ1dFY=
CFBL-Feedback-ID: 6aff13e683f3cb488062ba6e:dcdbee2e19552aa93ba40c481a4ea65c
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6aff13e683f3cb488062ba6e
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.19.33
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	netdev@vger.kernel.org
Subject: [PATCH 2/8] ARM: dts: rockchip: Add support for RK3506
Date: Thu, 19 Nov 2026 15:20:45 +0000
Message-ID: <20261119152055.556266-3-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119152055.556266-1-jonas@kwiboo.se>
References: <20261119152055.556266-1-jonas@kwiboo.se>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the initial devicetree for Rockchip RK3506 SoC.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 .../arm/boot/dts/rockchip/rk3506-pinctrl.dtsi | 576 ++++++++++++++++++
 arch/arm/boot/dts/rockchip/rk3506.dtsi        | 540 ++++++++++++++++
 2 files changed, 1116 insertions(+)
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506.dtsi

diff --git a/arch/arm/boot/dts/rockchip/rk3506-pinctrl.dtsi b/arch/arm/boot/dts/rockchip/rk3506-pinctrl.dtsi
new file mode 100644
index 000000000000..47f2962040d2
--- /dev/null
+++ b/arch/arm/boot/dts/rockchip/rk3506-pinctrl.dtsi
@@ -0,0 +1,576 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+#include <dt-bindings/pinctrl/rockchip.h>
+#include <arm64/rockchip/rockchip-pinconf.dtsi>
+
+&pinctrl {
+	aupll-clk {
+		/omit-if-no-ref/
+		aupll_clk_in: aupll-clk-in {
+			rockchip,pins =
+				/* aupll_clk_in */
+				<0 RK_PC4 2 &pcfg_pull_none>;
+		};
+	};
+
+	cpu {
+		/omit-if-no-ref/
+		cpu_avs: cpu-avs {
+			rockchip,pins =
+				/* cpu_avs */
+				<0 RK_PC5 1 &pcfg_pull_none>;
+		};
+	};
+
+	eth-clk0-25m {
+		/omit-if-no-ref/
+		eth_clk0_25m_out: eth-clk0-25m-out {
+			rockchip,pins =
+				/* eth_clk0_25m_out */
+				<0 RK_PC4 1 &pcfg_pull_none>;
+		};
+	};
+
+	eth-clk1-25m {
+		/omit-if-no-ref/
+		eth_clk1_25m_out: eth-clk1-25m-out {
+			rockchip,pins =
+				/* eth_clk1_25m_out */
+				<0 RK_PC3 1 &pcfg_pull_none>;
+		};
+	};
+
+	eth-rmii0 {
+		/omit-if-no-ref/
+		eth_rmii0_clk: eth-rmii0-clk {
+			rockchip,pins =
+				/* eth_rmii0_clk */
+				<2 RK_PB2 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		eth_rmii0_miim: eth-rmii0-miim {
+			rockchip,pins =
+				/* eth_rmii0_mdc */
+				<2 RK_PB6 1 &pcfg_pull_none>,
+				/* eth_rmii0_mdio */
+				<2 RK_PB7 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		eth_rmii0_rx_bus2: eth-rmii0-rx-bus2 {
+			rockchip,pins =
+				/* eth_rmii0_rxd0 */
+				<2 RK_PB0 1 &pcfg_pull_none>,
+				/* eth_rmii0_rxd1 */
+				<2 RK_PB1 1 &pcfg_pull_none>,
+				/* eth_rmii0_rxdvcrs */
+				<2 RK_PC0 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		eth_rmii0_tx_bus2: eth-rmii0-tx-bus2 {
+			rockchip,pins =
+				/* eth_rmii0_txd0 */
+				<2 RK_PB3 1 &pcfg_pull_none>,
+				/* eth_rmii0_txd1 */
+				<2 RK_PB4 1 &pcfg_pull_none>,
+				/* eth_rmii0_txen */
+				<2 RK_PB5 1 &pcfg_pull_none>;
+		};
+	};
+
+	eth-rmii1 {
+		/omit-if-no-ref/
+		eth_rmii1_clk: eth-rmii1-clk {
+			rockchip,pins =
+				/* eth_rmii1_clk */
+				<3 RK_PB0 2 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		eth_rmii1_miim: eth-rmii1-miim {
+			rockchip,pins =
+				/* eth_rmii1_mdc */
+				<3 RK_PB4 2 &pcfg_pull_none>,
+				/* eth_rmii1_mdio */
+				<3 RK_PB5 2 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		eth_rmii1_rx_bus2: eth-rmii1-rx-bus2 {
+			rockchip,pins =
+				/* eth_rmii1_rxd0 */
+				<3 RK_PA6 2 &pcfg_pull_none>,
+				/* eth_rmii1_rxd1 */
+				<3 RK_PA7 2 &pcfg_pull_none>,
+				/* eth_rmii1_rxdvcrs */
+				<3 RK_PB6 2 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		eth_rmii1_tx_bus2: eth-rmii1-tx-bus2 {
+			rockchip,pins =
+				/* eth_rmii1_txd0 */
+				<3 RK_PB1 2 &pcfg_pull_none>,
+				/* eth_rmii1_txd1 */
+				<3 RK_PB2 2 &pcfg_pull_none>,
+				/* eth_rmii1_txen */
+				<3 RK_PB3 2 &pcfg_pull_none>;
+		};
+	};
+
+	fspi {
+		/omit-if-no-ref/
+		fspi_bus4: fspi-bus4 {
+			rockchip,pins =
+				/* fspi_d0 */
+				<2 RK_PA2 1 &pcfg_pull_none>,
+				/* fspi_d1 */
+				<2 RK_PA3 1 &pcfg_pull_none>,
+				/* fspi_d2 */
+				<2 RK_PA4 1 &pcfg_pull_none>,
+				/* fspi_d3 */
+				<2 RK_PA5 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		fspi_clk: fspi-clk {
+			rockchip,pins =
+				/* fspi_clk */
+				<2 RK_PA1 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		fspi_csn: fspi-csn {
+			rockchip,pins =
+				/* fspi_csn */
+				<2 RK_PA0 1 &pcfg_pull_none>;
+		};
+	};
+
+	jtag {
+		/omit-if-no-ref/
+		jtagm0: jtagm0 {
+			rockchip,pins =
+				/* jtag_tck_m0 */
+				<3 RK_PA4 2 &pcfg_pull_none>,
+				/* jtag_tms_m0 */
+				<3 RK_PA5 2 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		jtagm1: jtagm1 {
+			rockchip,pins =
+				/* jtag_tck_m1 */
+				<0 RK_PC6 2 &pcfg_pull_none>,
+				/* jtag_tms_m1 */
+				<0 RK_PC7 2 &pcfg_pull_none>;
+		};
+	};
+
+	ref-clk1 {
+		/omit-if-no-ref/
+		ref_clk1_out: ref-clk1-out {
+			rockchip,pins =
+				/* ref_clk1_out */
+				<0 RK_PC2 1 &pcfg_pull_none>;
+		};
+	};
+
+	sai0 {
+		/omit-if-no-ref/
+		sai0_lrck: sai0-lrck {
+			rockchip,pins =
+				/* sai0_lrck */
+				<0 RK_PA0 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		sai0_mclk: sai0-mclk {
+			rockchip,pins =
+				/* sai0_mclk */
+				<0 RK_PA2 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		sai0_sclk: sai0-sclk {
+			rockchip,pins =
+				/* sai0_sclk */
+				<0 RK_PA1 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		sai0_sdi0: sai0-sdi0 {
+			rockchip,pins =
+				/* sai0_sdi0 */
+				<0 RK_PA4 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		sai0_sdi1: sai0-sdi1 {
+			rockchip,pins =
+				/* sai0_sdi1 */
+				<0 RK_PA5 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		sai0_sdi2: sai0-sdi2 {
+			rockchip,pins =
+				/* sai0_sdi2 */
+				<0 RK_PA6 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		sai0_sdi3: sai0-sdi3 {
+			rockchip,pins =
+				/* sai0_sdi3 */
+				<0 RK_PA7 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		sai0_sdo: sai0-sdo {
+			rockchip,pins =
+				/* sai0_sdo */
+				<0 RK_PA3 1 &pcfg_pull_none>;
+		};
+	};
+
+	sai1 {
+		/omit-if-no-ref/
+		sai1_lrck: sai1-lrck {
+			rockchip,pins =
+				/* sai1_lrck */
+				<0 RK_PB2 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		sai1_mclk: sai1-mclk {
+			rockchip,pins =
+				/* sai1_mclk */
+				<0 RK_PB0 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		sai1_sclk: sai1-sclk {
+			rockchip,pins =
+				/* sai1_sclk */
+				<0 RK_PB1 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		sai1_sdi: sai1-sdi {
+			rockchip,pins =
+				/* sai1_sdi */
+				<0 RK_PB3 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		sai1_sdo0: sai1-sdo0 {
+			rockchip,pins =
+				/* sai1_sdo0 */
+				<0 RK_PB4 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		sai1_sdo1: sai1-sdo1 {
+			rockchip,pins =
+				/* sai1_sdo1 */
+				<0 RK_PB5 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		sai1_sdo2: sai1-sdo2 {
+			rockchip,pins =
+				/* sai1_sdo2 */
+				<0 RK_PB6 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		sai1_sdo3: sai1-sdo3 {
+			rockchip,pins =
+				/* sai1_sdo3 */
+				<0 RK_PB7 1 &pcfg_pull_none>;
+		};
+	};
+
+	sai2 {
+		/omit-if-no-ref/
+		sai2m0_lrck: sai2m0-lrck {
+			rockchip,pins =
+				/* sai2_lrck_m0 */
+				<3 RK_PB1 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		sai2m0_mclk: sai2m0-mclk {
+			rockchip,pins =
+				/* sai2_mclk_m0 */
+				<3 RK_PB6 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		sai2m0_sclk: sai2m0-sclk {
+			rockchip,pins =
+				/* sai2_sclk_m0 */
+				<3 RK_PA7 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		sai2m0_sdi: sai2m0-sdi {
+			rockchip,pins =
+				/* sai2m0_sdi */
+				<3 RK_PA6 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		sai2m0_sdo: sai2m0-sdo {
+			rockchip,pins =
+				/* sai2m0_sdo */
+				<3 RK_PB0 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		sai2m1_lrck: sai2m1-lrck {
+			rockchip,pins =
+				/* sai2_lrck_m1 */
+				<1 RK_PB3 6 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		sai2m1_mclk: sai2m1-mclk {
+			rockchip,pins =
+				/* sai2_mclk_m1 */
+				<1 RK_PC1 6 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		sai2m1_sclk: sai2m1-sclk {
+			rockchip,pins =
+				/* sai2_sclk_m1 */
+				<1 RK_PB2 6 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		sai2m1_sdi: sai2m1-sdi {
+			rockchip,pins =
+				/* sai2m1_sdi */
+				<1 RK_PC2 6 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		sai2m1_sdo: sai2m1-sdo {
+			rockchip,pins =
+				/* sai2m1_sdo */
+				<1 RK_PC3 6 &pcfg_pull_none>;
+		};
+	};
+
+	sai3 {
+		/omit-if-no-ref/
+		sai3_lrck: sai3-lrck {
+			rockchip,pins =
+				/* sai3_lrck */
+				<2 RK_PB5 3 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		sai3_mclk: sai3-mclk {
+			rockchip,pins =
+				/* sai3_mclk */
+				<2 RK_PC0 3 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		sai3_sclk: sai3-sclk {
+			rockchip,pins =
+				/* sai3_sclk */
+				<2 RK_PB4 3 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		sai3_sdi: sai3-sdi {
+			rockchip,pins =
+				/* sai3_sdi */
+				<2 RK_PB6 3 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		sai3_sdo: sai3-sdo {
+			rockchip,pins =
+				/* sai3_sdo */
+				<2 RK_PB7 3 &pcfg_pull_none>;
+		};
+	};
+
+	sdmmc {
+		/omit-if-no-ref/
+		sdmmc_bus4: sdmmc-bus4 {
+			rockchip,pins =
+				/* sdmmc_d0 */
+				<3 RK_PA2 1 &pcfg_pull_up>,
+				/* sdmmc_d1 */
+				<3 RK_PA3 1 &pcfg_pull_up>,
+				/* sdmmc_d2 */
+				<3 RK_PA4 1 &pcfg_pull_up>,
+				/* sdmmc_d3 */
+				<3 RK_PA5 1 &pcfg_pull_up>;
+		};
+
+		/omit-if-no-ref/
+		sdmmc_clk: sdmmc-clk {
+			rockchip,pins =
+				/* sdmmc_clk */
+				<3 RK_PA0 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		sdmmc_cmd: sdmmc-cmd {
+			rockchip,pins =
+				/* sdmmc_cmd */
+				<3 RK_PA1 1 &pcfg_pull_up>;
+		};
+	};
+
+	spi0 {
+		/omit-if-no-ref/
+		spi0_clk: spi0-clk {
+			rockchip,pins =
+				/* spi0_clk */
+				<0 RK_PC0 2 &pcfg_pull_none_drv_level_3>,
+				/* spi0_miso */
+				<0 RK_PC2 2 &pcfg_pull_none_drv_level_3>,
+				/* spi0_mosi */
+				<0 RK_PC1 2 &pcfg_pull_none_drv_level_3>;
+		};
+
+		/omit-if-no-ref/
+		spi0_csn0: spi0-csn0 {
+			rockchip,pins =
+				/* spi0_csn0 */
+				<0 RK_PC3 2 &pcfg_pull_none_drv_level_3>;
+		};
+
+		/omit-if-no-ref/
+		spi0_csn1: spi0-csn1 {
+			rockchip,pins =
+				/* spi0_csn1 */
+				<0 RK_PB7 2 &pcfg_pull_none_drv_level_3>;
+		};
+	};
+
+	spi1 {
+		/omit-if-no-ref/
+		spi1_clk: spi1-clk {
+			rockchip,pins =
+				/* spi1_clk */
+				<0 RK_PB0 2 &pcfg_pull_none_drv_level_3>,
+				/* spi1_miso */
+				<0 RK_PB2 2 &pcfg_pull_none_drv_level_3>,
+				/* spi1_mosi */
+				<0 RK_PB1 2 &pcfg_pull_none_drv_level_3>;
+		};
+
+		/omit-if-no-ref/
+		spi1_csn0: spi1-csn0 {
+			rockchip,pins =
+				/* spi1_csn0 */
+				<0 RK_PB6 2 &pcfg_pull_none_drv_level_3>;
+		};
+
+		/omit-if-no-ref/
+		spi1_csn1: spi1-csn1 {
+			rockchip,pins =
+				/* spi1_csn1 */
+				<0 RK_PA7 2 &pcfg_pull_none_drv_level_3>;
+		};
+	};
+
+	spi2 {
+		/omit-if-no-ref/
+		spi2_clk: spi2-clk {
+			rockchip,pins =
+				/* spi2_clk */
+				<2 RK_PB0 2 &pcfg_pull_none>,
+				/* spi2_miso */
+				<2 RK_PB3 2 &pcfg_pull_none>,
+				/* spi2_mosi */
+				<2 RK_PB2 2 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		spi2_csn: spi2-csn {
+			rockchip,pins =
+				/* spi2_csn */
+				<2 RK_PB1 2 &pcfg_pull_none>;
+		};
+	};
+
+	test-clk {
+		/omit-if-no-ref/
+		test_clk_out: test-clk-out {
+			rockchip,pins =
+				/* test_clk_out */
+				<3 RK_PA3 2 &pcfg_pull_none>;
+		};
+	};
+
+	uart0 {
+		/omit-if-no-ref/
+		uart0_xfer: uart0-xfer {
+			rockchip,pins =
+				/* uart0_rx */
+				<0 RK_PC7 1 &pcfg_pull_up>,
+				/* uart0_tx */
+				<0 RK_PC6 1 &pcfg_pull_up>;
+		};
+	};
+
+	uart5 {
+		/omit-if-no-ref/
+		uart5m0_ctsn: uart5m0-ctsn {
+			rockchip,pins =
+				/* uart5m0_ctsn */
+				<3 RK_PB2 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		uart5m0_rtsn: uart5m0-rtsn {
+			rockchip,pins =
+				/* uart5m0_rtsn */
+				<3 RK_PB5 1 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		uart5m0_xfer: uart5m0-xfer {
+			rockchip,pins =
+				/* uart5_rx_m0 */
+				<3 RK_PB3 1 &pcfg_pull_up>,
+				/* uart5_tx_m0 */
+				<3 RK_PB4 1 &pcfg_pull_up>;
+		};
+
+		/omit-if-no-ref/
+		uart5m1_ctsn: uart5m1-ctsn {
+			rockchip,pins =
+				/* uart5m1_ctsn */
+				<1 RK_PB1 6 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		uart5m1_rtsn: uart5m1-rtsn {
+			rockchip,pins =
+				/* uart5m1_rtsn */
+				<1 RK_PD1 6 &pcfg_pull_none>;
+		};
+
+		/omit-if-no-ref/
+		uart5m1_xfer: uart5m1-xfer {
+			rockchip,pins =
+				/* uart5_rx_m1 */
+				<1 RK_PD3 6 &pcfg_pull_up>,
+				/* uart5_tx_m1 */
+				<1 RK_PD2 6 &pcfg_pull_up>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/rockchip/rk3506.dtsi b/arch/arm/boot/dts/rockchip/rk3506.dtsi
new file mode 100644
index 000000000000..d8e942e6d0b1
--- /dev/null
+++ b/arch/arm/boot/dts/rockchip/rk3506.dtsi
@@ -0,0 +1,540 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+#include <dt-bindings/clock/rockchip,rk3506-cru.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/reset/rockchip,rk3506-cru.h>
+
+/ {
+	compatible = "rockchip,rk3506";
+
+	interrupt-parent = <&gic>;
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	aliases {
+		gpio0 = &gpio0;
+		gpio1 = &gpio1;
+		gpio2 = &gpio2;
+		gpio3 = &gpio3;
+		gpio4 = &gpio4;
+	};
+
+	xin24m: clock-xin24m {
+		compatible = "fixed-clock";
+		clock-frequency = <24000000>;
+		clock-output-names = "xin24m";
+		#clock-cells = <0>;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+
+				core1 {
+					cpu = <&cpu1>;
+				};
+
+				core2 {
+					cpu = <&cpu2>;
+				};
+			};
+		};
+
+		cpu0: cpu@f00 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0xf00>;
+			clocks = <&cru ARMCLK>;
+			enable-method = "psci";
+		};
+
+		cpu1: cpu@f01 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0xf01>;
+			clocks = <&cru ARMCLK>;
+			enable-method = "psci";
+		};
+
+		cpu2: cpu@f02 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0xf02>;
+			clocks = <&cru ARMCLK>;
+			enable-method = "psci";
+		};
+	};
+
+	pinctrl: pinctrl {
+		compatible = "rockchip,rk3506-pinctrl";
+		rockchip,grf = <&gpio234_ioc>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		gpio0: gpio@ff940000 {
+			compatible = "rockchip,gpio-bank";
+			reg = <0xff940000 0x200>;
+			clocks = <&cru PCLK_GPIO0>, <&cru DBCLK_GPIO0>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			rockchip,grf = <&gpio0_ioc>;
+		};
+
+		gpio1: gpio@ff870000 {
+			compatible = "rockchip,gpio-bank";
+			reg = <0xff870000 0x200>;
+			clocks = <&cru PCLK_GPIO1>, <&cru DBCLK_GPIO1>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			rockchip,grf = <&gpio1_ioc>;
+		};
+
+		gpio2: gpio@ff1c0000 {
+			compatible = "rockchip,gpio-bank";
+			reg = <0xff1c0000 0x200>;
+			clocks = <&cru PCLK_GPIO2>, <&cru DBCLK_GPIO2>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio3: gpio@ff1d0000 {
+			compatible = "rockchip,gpio-bank";
+			reg = <0xff1d0000 0x200>;
+			clocks = <&cru PCLK_GPIO3>, <&cru DBCLK_GPIO3>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio4: gpio@ff1e0000 {
+			compatible = "rockchip,gpio-bank";
+			reg = <0xff1e0000 0x200>;
+			clocks = <&cru PCLK_GPIO4>, <&cru DBCLK_GPIO4>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	pmu-a7 {
+		compatible = "arm,cortex-a7-pmu";
+		interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0", "arm,psci-0.2";
+		method = "smc";
+	};
+
+	timer {
+		compatible = "arm,armv7-timer";
+		clock-frequency = <24000000>;
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(3) | IRQ_TYPE_LEVEL_HIGH)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(3) | IRQ_TYPE_LEVEL_HIGH)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(3) | IRQ_TYPE_LEVEL_HIGH)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(3) | IRQ_TYPE_LEVEL_HIGH)>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		dmac0: dma-controller@ff000000 {
+			compatible = "arm,pl330", "arm,primecell";
+			reg = <0xff000000 0x4000>;
+			clocks = <&cru ACLK_DMAC0>;
+			clock-names = "apb_pclk";
+			#dma-cells = <1>;
+			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+			arm,pl330-periph-burst;
+		};
+
+		dmac1: dma-controller@ff008000 {
+			compatible = "arm,pl330", "arm,primecell";
+			reg = <0xff008000 0x4000>;
+			clocks = <&cru ACLK_DMAC1>;
+			clock-names = "apb_pclk";
+			#dma-cells = <1>;
+			interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			arm,pl330-periph-burst;
+		};
+
+		i2c0: i2c@ff040000 {
+			compatible = "rockchip,rk3506-i2c",
+				     "rockchip,rk3399-i2c";
+			reg = <0xff040000 0x1000>;
+			clocks = <&cru CLK_I2C0>, <&cru PCLK_I2C0>;
+			clock-names = "i2c", "pclk";
+			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@ff050000 {
+			compatible = "rockchip,rk3506-i2c",
+				     "rockchip,rk3399-i2c";
+			reg = <0xff050000 0x1000>;
+			clocks = <&cru CLK_I2C1>, <&cru PCLK_I2C1>;
+			clock-names = "i2c", "pclk";
+			interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@ff060000 {
+			compatible = "rockchip,rk3506-i2c",
+				     "rockchip,rk3399-i2c";
+			reg = <0xff060000 0x1000>;
+			clocks = <&cru CLK_I2C2>, <&cru PCLK_I2C2>;
+			clock-names = "i2c", "pclk";
+			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		uart0: serial@ff0a0000 {
+			compatible = "rockchip,rk3506-uart", "snps,dw-apb-uart";
+			reg = <0xff0a0000 0x100>;
+			clocks = <&cru SCLK_UART0>, <&cru PCLK_UART0>;
+			clock-names = "baudclk", "apb_pclk";
+			dmas = <&dmac0 4>, <&dmac0 5>;
+			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart0_xfer>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			status = "disabled";
+		};
+
+		uart1: serial@ff0b0000 {
+			compatible = "rockchip,rk3506-uart", "snps,dw-apb-uart";
+			reg = <0xff0b0000 0x100>;
+			clocks = <&cru SCLK_UART1>, <&cru PCLK_UART1>;
+			clock-names = "baudclk", "apb_pclk";
+			dmas = <&dmac0 6>, <&dmac0 7>;
+			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			status = "disabled";
+		};
+
+		uart2: serial@ff0c0000 {
+			compatible = "rockchip,rk3506-uart", "snps,dw-apb-uart";
+			reg = <0xff0c0000 0x100>;
+			clocks = <&cru SCLK_UART2>, <&cru PCLK_UART2>;
+			clock-names = "baudclk", "apb_pclk";
+			dmas = <&dmac0 8>, <&dmac0 9>;
+			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			status = "disabled";
+		};
+
+		uart3: serial@ff0d0000 {
+			compatible = "rockchip,rk3506-uart", "snps,dw-apb-uart";
+			reg = <0xff0d0000 0x100>;
+			clocks = <&cru SCLK_UART3>, <&cru PCLK_UART3>;
+			clock-names = "baudclk", "apb_pclk";
+			dmas = <&dmac0 10>, <&dmac0 11>;
+			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			status = "disabled";
+		};
+
+		uart4: serial@ff0e0000 {
+			compatible = "rockchip,rk3506-uart", "snps,dw-apb-uart";
+			reg = <0xff0e0000 0x100>;
+			clocks = <&cru SCLK_UART4>, <&cru PCLK_UART4>;
+			clock-names = "baudclk", "apb_pclk";
+			dmas = <&dmac1 12>, <&dmac1 13>;
+			interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			status = "disabled";
+		};
+
+		spi0: spi@ff120000 {
+			compatible = "rockchip,rk3506-spi",
+				     "rockchip,rk3066-spi";
+			reg = <0xff120000 0x1000>;
+			clocks = <&cru CLK_SPI0>, <&cru PCLK_SPI0>;
+			clock-names = "spiclk", "apb_pclk";
+			dmas = <&dmac0 0>, <&dmac0 1>;
+			dma-names = "tx", "rx";
+			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+			num-cs = <2>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi0_csn0>, <&spi0_csn1>, <&spi0_clk>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		spi1: spi@ff130000 {
+			compatible = "rockchip,rk3506-spi",
+				     "rockchip,rk3066-spi";
+			reg = <0xff130000 0x1000>;
+			clocks = <&cru CLK_SPI1>, <&cru PCLK_SPI1>;
+			clock-names = "spiclk", "apb_pclk";
+			dmas = <&dmac0 2>, <&dmac0 3>;
+			dma-names = "tx", "rx";
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+			num-cs = <2>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi1_csn0>, <&spi1_csn1>, <&spi1_clk>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		wdt0: watchdog@ff260000 {
+			compatible = "rockchip,rk3506-wdt", "snps,dw-wdt";
+			reg = <0xff260000 0x100>;
+			clocks = <&cru TCLK_WDT0>, <&cru PCLK_WDT0>;
+			clock-names = "tclk", "pclk";
+			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		wdt1: watchdog@ff268000 {
+			compatible = "rockchip,rk3506-wdt", "snps,dw-wdt";
+			reg = <0xff268000 0x100>;
+			clocks = <&cru TCLK_WDT1>, <&cru PCLK_WDT1>;
+			clock-names = "tclk", "pclk";
+			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		grf: syscon@ff288000 {
+			compatible = "rockchip,rk3506-grf", "syscon",
+				     "simple-mfd";
+			reg = <0xff288000 0x4000>;
+		};
+
+		sdmmc: mmc@ff480000 {
+			compatible = "rockchip,rk3506-dw-mshc",
+				     "rockchip,rk3288-dw-mshc";
+			reg = <0xff480000 0x4000>;
+			bus-width = <4>;
+			clocks = <&cru HCLK_SDMMC>, <&cru CCLK_SRC_SDMMC>;
+			clock-names = "biu", "ciu";
+			fifo-depth = <0x100>;
+			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+			max-frequency = <150000000>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&sdmmc_bus4>, <&sdmmc_clk>, <&sdmmc_cmd>;
+			resets = <&cru SRST_H_SDMMC>;
+			reset-names = "reset";
+			status = "disabled";
+		};
+
+		fspi: spi@ff488000 {
+			compatible = "rockchip,sfc";
+			reg = <0xff488000 0x4000>;
+			clocks = <&cru SCLK_FSPI>, <&cru HCLK_FSPI>;
+			clock-names = "clk_sfc", "hclk_sfc";
+			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		gmac0: ethernet@ff4c8000 {
+			compatible = "rockchip,rk3506-gmac", "snps,dwmac-4.20a";
+			reg = <0xff4c8000 0x2000>;
+			clocks = <&cru CLK_MAC0>, <&cru CLK_MAC0_PTP>,
+				 <&cru PCLK_MAC0>, <&cru ACLK_MAC0>;
+			clock-names = "stmmaceth", "ptp_ref",
+				      "pclk_mac", "aclk_mac";
+			interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "eth_wake_irq";
+			phy-mode = "rmii";
+			resets = <&cru SRST_A_MAC0>;
+			reset-names = "stmmaceth";
+			rockchip,grf = <&grf>;
+			snps,axi-config = <&gmac0_stmmac_axi_setup>;
+			snps,mixed-burst;
+			snps,mtl-rx-config = <&gmac0_mtl_rx_setup>;
+			snps,mtl-tx-config = <&gmac0_mtl_tx_setup>;
+			snps,tso;
+			status = "disabled";
+
+			mdio0: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			gmac0_stmmac_axi_setup: stmmac-axi-config {
+				snps,blen = <0 0 0 0 16 8 4>;
+				snps,rd_osr_lmt = <8>;
+				snps,wr_osr_lmt = <4>;
+			};
+
+			gmac0_mtl_rx_setup: rx-queues-config {
+				snps,rx-queues-to-use = <1>;
+				queue0 {};
+			};
+
+			gmac0_mtl_tx_setup: tx-queues-config {
+				snps,tx-queues-to-use = <1>;
+				queue0 {};
+			};
+		};
+
+		gmac1: ethernet@ff4d0000 {
+			compatible = "rockchip,rk3506-gmac", "snps,dwmac-4.20a";
+			reg = <0xff4d0000 0x2000>;
+			clocks = <&cru CLK_MAC1>, <&cru CLK_MAC1_PTP>,
+				 <&cru PCLK_MAC1>, <&cru ACLK_MAC1>;
+			clock-names = "stmmaceth", "ptp_ref",
+				      "pclk_mac", "aclk_mac";
+			interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "eth_wake_irq";
+			phy-mode = "rmii";
+			resets = <&cru SRST_A_MAC1>;
+			reset-names = "stmmaceth";
+			rockchip,grf = <&grf>;
+			snps,axi-config = <&gmac1_stmmac_axi_setup>;
+			snps,mixed-burst;
+			snps,mtl-rx-config = <&gmac1_mtl_rx_setup>;
+			snps,mtl-tx-config = <&gmac1_mtl_tx_setup>;
+			snps,tso;
+			status = "disabled";
+
+			mdio1: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			gmac1_stmmac_axi_setup: stmmac-axi-config {
+				snps,blen = <0 0 0 0 16 8 4>;
+				snps,rd_osr_lmt = <8>;
+				snps,wr_osr_lmt = <4>;
+			};
+
+			gmac1_mtl_rx_setup: rx-queues-config {
+				snps,rx-queues-to-use = <1>;
+				queue0 {};
+			};
+
+			gmac1_mtl_tx_setup: tx-queues-config {
+				snps,tx-queues-to-use = <1>;
+				queue0 {};
+			};
+		};
+
+		gpio234_ioc: syscon@ff4d8000 {
+			compatible = "rockchip,rk3506-ioc234", "syscon";
+			reg = <0xff4d8000 0x8000>;
+		};
+
+		uart5: serial@ff4e0000 {
+			compatible = "rockchip,rk3506-uart", "snps,dw-apb-uart";
+			reg = <0xff4e0000 0x100>;
+			clocks = <&cru SCLK_UART5>, <&cru PCLK_UART5>;
+			clock-names = "baudclk", "apb_pclk";
+			dmas = <&dmac1 14>, <&dmac1 15>;
+			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart5m0_xfer>, <&uart5m0_ctsn>,
+				    <&uart5m0_rtsn>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			status = "disabled";
+		};
+
+		saradc: adc@ff4e8000 {
+			compatible = "rockchip,rk3506-saradc",
+				     "rockchip,rk3528-saradc";
+			reg = <0xff4e8000 0x8000>;
+			clocks = <&cru CLK_SARADC>, <&cru PCLK_SARADC>;
+			clock-names = "saradc", "apb_pclk";
+			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+			#io-channel-cells = <1>;
+			resets = <&cru SRST_P_SARADC>;
+			reset-names = "saradc-apb";
+			status = "disabled";
+		};
+
+		gic: interrupt-controller@ff581000 {
+			compatible = "arm,gic-400";
+			reg = <0xff581000 0x1000>,
+			      <0xff582000 0x2000>,
+			      <0xff584000 0x2000>,
+			      <0xff586000 0x2000>;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			#address-cells = <0>;
+		};
+
+		gpio1_ioc: syscon@ff660000 {
+			compatible = "rockchip,rk3506-ioc1", "syscon";
+			reg = <0xff660000 0x10000>;
+		};
+
+		grf_core: syscon@ff840000 {
+			compatible = "rockchip,rk3506-core-grf", "syscon",
+				     "simple-mfd";
+			reg = <0xff840000 0x4000>;
+		};
+
+		grf_pmu: syscon@ff910000 {
+			compatible = "rockchip,rk3506-pmu-grf", "syscon",
+				     "simple-mfd";
+			reg = <0xff910000 0x4000>;
+		};
+
+		gpio0_ioc: syscon@ff950000 {
+			compatible = "rockchip,rk3506-ioc0", "syscon";
+			reg = <0xff950000 0x10000>;
+		};
+
+		cru: clock-controller@ff9a0000 {
+			compatible = "rockchip,rk3506-cru";
+			reg = <0xff9a0000 0x20000>;
+			clocks = <&xin24m>;
+			clock-names = "xin";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+	};
+};
+
+#include "rk3506-pinctrl.dtsi"
-- 
2.56.1

