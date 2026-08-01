Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAC43AEF20;
	Sat,  1 Aug 2026 04:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785559853; cv=none; b=jcIMVn6/6o5vd2Z7zzLc0oW18M1b9ghlWfg9M9jS6D/PcWp690DrGcGlquXZrJPd0Eescmf5T86e1le9tyBS7b3m8/JQdKtfCDAfe+2vafFru0l0CC/jyT3HkEwbmTSCNufBNc5U/SfLzKoCidy3WXr7RTWasTjQziKk630F6Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785559853; c=relaxed/simple;
	bh=sB07q6l8hnJnsljXCkCVO/skx9D/csQUS/jGGbgXGtQ=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=WQra7uGZrUhGQfnxQA/ZNmYnlRyLd2kiutP5DSwa2ZsEnI/ssVgWxMsS1eliu9MDQAEurknkakVFj23V9dVeGVhrDvuSezGMYlNyxhuXnfWv/3F5WPTWxf7xMMGVALB94D3f9ilDiqi27CbZkfM/SIYYXo6go5Llohz6Uio/AvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=CZ9WhUoi; arc=none smtp.client-ip=43.163.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="CZ9WhUoi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1785559846; bh=No7Pu3tcjEAADdHGcFgLAj3F1mPvZDUYYqN+X5/IaJo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CZ9WhUoiZBbwq01Vg7QQ3WFEDUB0QEy/zIhdU7463zRcD26FZvmTd4LLzKPPa9tgR
	 UnasAfg1vb9WOn5hRm+F61XBVYF++I1EQ0xAs3lUsn6CvMj6zKDBuyh5NzZ1p0TDtd
	 S81mwW/tsefTezv7FJeUCPNEG3pdyPz12AiYmZ1Y=
Received: from AERO17.taila7786d.ts.net ([112.43.117.189])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id C9E2EA5C; Sat, 01 Aug 2026 12:50:30 +0800
X-QQ-mid: xmsmtpt1785559840te9blvcwc
Message-ID: <tencent_1F34C8A722B644F01E486007EC91C9350605@qq.com>
X-QQ-XMAILINFO: OGvxYKx7ShGEuAwaZM+a+SyCxk9ihAx5WfZKVDoZxR1Yf9a5csHiMEj3DzjJSd
	 IpwxEqLjOltpGJndf7HbowTbiEoE9hoybMziI64NFS8hKrXhDH7yqA2RQAVdGJJWgtBAE0gLU9VW
	 blXx+DuBnsBcy586vGq5QiXIgWf2FKQt4VSarAAqx+SdaKduJW+/7b/3OsGkQajC0VWkN70YeLzF
	 0DFwVv56KnKf5Fit6hqCEWWIC0d71xaQCl4GIV5vWSmKWeaLtwiP970IfglFSvl97/f+bC4ZEhia
	 HX5c6AcEmal34A1Rm2iXuQHBDdie0mSWp/12kr1YMA1s0kjZYKl+r4o8HTywADZnNEhIFTFjpGiX
	 L+pQWeeSgRCQV7njzLJbYVDPvzGEXzDFTRZkJIFfSSCJup9i5Gi7pHLyVwAVxI2GtyX7P3C7SxWo
	 JpKtfRR2DwB/CuqDLyjhmsnNDk3RYKlo4FslE0BDELjgX6bZ3VGE4qCfU8V/76+CbAGJ0uYE0Huz
	 fDDvroxJiWPPHD8EQka6IqywQv9Dy0MjgdeaVk5McZRz9XTZk14pETF45Ck4r9Y+mjUVI0ko3naJ
	 i27QeASuFuXfoFglenTKo3d2wmv0L4xz/awSj7NvwVlPDrgpjLmsNFTn51e0kANrSG5ejDQh9iZw
	 Vc4+QJzg9lvb0tqMzweLyVstWb0TohSbCTXPI0xBreyVGs8JOTZ7gc/Fpo4+yv/+uEwXayrlD1IU
	 Ugo23hxwUeOckhDFeb3+c5UA9Y9voVOUuo9Krc12+iqU7oUNyzvbgmv8dZ6GsNEZurxVqbbh35F+
	 FDwgGa3ywVrfNIPfo9w4G1RKQhEBhK6PgpPlLzaJ8eQoxmAK5/wohHZeDLs7SCl3qVugwIP6crZW
	 GL+mpr71XxBk66081khfqfLXgmqykNFpKwsI4IwnSUFfiUjbRdOQ/Cph64dY/ft15joAQ/rzKqt8
	 xhOCYeOQ+IDCweQmWJ/cx23qYTJDZzR7mDd2UyDsQXuBcI4BwHjepkY4dk+AjrYm8eeMXtW53ezz
	 9BGDaT92q8F18LT14xCtOFYO9h8mjVn+rwbrXvt41QiI68yObvr7goR+lmMhvhNQWaIyDQluWEoR
	 hH/zzL8y6ZW38rpWmPyKrk3dRInf8gj+mQlQGS
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Pufan Jin <2254650260@qq.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: rockchip: Add fan cooling maps for LubanCat 4
Date: Sat,  1 Aug 2026 12:50:24 +0800
X-OQ-MSGID: <20260801045025.67512-3-2254650260@qq.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260801045025.67512-1-2254650260@qq.com>
References: <20260801045025.67512-1-2254650260@qq.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fan node has no cooling maps, so nothing binds it to a thermal zone.
The pwm-fan driver deliberately falls back to the highest cooling level
when it probes without a thermal zone to drive it, which leaves the fan
running at full speed regardless of temperature.

Bind the fan to the package thermal zone with one active trip per cooling
level, reusing the trip temperatures from the vendor kernel. The lower
bound of the first map and the upper bound of the last one are left
unlimited so that the fan can stop below 42C and reach full speed above
65C.

Signed-off-by: Pufan Jin <2254650260@qq.com>
---
 .../boot/dts/rockchip/rk3588s-lubancat-4.dts  | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts b/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
index bf413de979cd..a0fc128ce6e1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
@@ -11,6 +11,7 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/soc/rockchip,vop2.h>
+#include <dt-bindings/thermal/thermal.h>
 #include "rk3588s.dtsi"
 
 / {
@@ -300,6 +301,58 @@ rgmii_phy1: ethernet-phy@1 {
 	};
 };
 
+&package_thermal {
+	polling-delay = <1000>;
+
+	trips {
+		package_fan0: package-fan0 {
+			temperature = <42000>;
+			hysteresis = <2000>;
+			type = "active";
+		};
+
+		package_fan1: package-fan1 {
+			temperature = <55000>;
+			hysteresis = <2000>;
+			type = "active";
+		};
+
+		package_fan2: package-fan2 {
+			temperature = <60000>;
+			hysteresis = <2000>;
+			type = "active";
+		};
+
+		package_fan3: package-fan3 {
+			temperature = <65000>;
+			hysteresis = <2000>;
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map0 {
+			trip = <&package_fan0>;
+			cooling-device = <&fan THERMAL_NO_LIMIT 1>;
+		};
+
+		map1 {
+			trip = <&package_fan1>;
+			cooling-device = <&fan 2 2>;
+		};
+
+		map2 {
+			trip = <&package_fan2>;
+			cooling-device = <&fan 3 3>;
+		};
+
+		map3 {
+			trip = <&package_fan3>;
+			cooling-device = <&fan 4 THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
 &pcie2x1l2 {
 	pinctrl-0 = <&pcie2_reset>;
 	pinctrl-names = "default";
-- 
2.55.0

