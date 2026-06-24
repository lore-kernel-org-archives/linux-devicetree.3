Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B9D382393
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782329265; cv=none; b=XKstT/LMkKxl4tGOfry6bMe64eWr+uIOFuJSQc5zENIhieqnY3CN0TMAl8XqUxPJsnk2pXuL62MaT8g+iT7I2THfwzMRk9DHvea4iwIHRRNIu1u4CBmt2zgtunijH3QzgDwnchvjVaFivPaZfpe1SEyckxp2F9JLuDkbmjlta1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782329265; c=relaxed/simple;
	bh=9E65z7OGWd2P6qUZoSyq/lFPj2UX4EeAgZgWnF+37+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KX4tJOxdrkgAtDUIy+0jA4a7nTnTHlgkUxKHumEof4bgpBP6Ugn1RqcogZifbkUOWt3HuYM5KXqLZ6w3cjKBtcIXP/9mJGcEdu6Og0BRWW3VY4d6VElg1ucFHvpweN4bnzhnUT5RJ9Q4W6JMc+QTrFYw/rKaSw2pclahs9mlIa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=p+HrM0+l; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="p+HrM0+l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1782329257; bh=Z99Q29vxpTumNbDlSLV/5spk9aNhNsdFqpygOCzOZY4=;
 b=p+HrM0+l0GEQWHc+lPTMqwE6E6QulYtJnr+EOhMYjhAki0wdENoGZUVpOjRQO916lQvCcdGs4
 /Ig+kh8IOM2mt4z7vFWCHS5p6m3EvBreDsGWpqfvEwEmsE+Pnun4eNhGW7hzLNBYIkynC3L+sB2
 oXw8ayMHDQV/WErC0YtMklJ3G8lZtEoJsIMBxlqWdYZo9FLsyrLUWsC15sBJi+Lf+iqXPp8OY0h
 QlFcPFaE0L/KOt/kuFfEQMXoxof810+XPybRei2OjWWUByMkKl5+de7xd4zRwl3ZngdK5uTYdZE
 Uj3Lb+aWYlr9AGa+5Ij0OXymqzRBgk2RD637DEuRX0Hg==
X-Forward-Email-ID: 6a3c2fa5138f49c481104abd
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.8.32
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Diederik de Haas <diederik@cknow-tech.com>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 1/2] dt-bindings: usb: Add Rockchip RK3568 compatible for EHCI and OHCI
Date: Wed, 24 Jun 2026 19:27:24 +0000
Message-ID: <20260624192726.781864-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624192726.781864-1-jonas@kwiboo.se>
References: <20260624192726.781864-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Rockchip RK3568 EHCI/OHCI controller depends on clk_usbphy1_480m
being enabled, or the system may freeze when registers are accessed.

Add Rockchip RK3568 EHCI and OHCI compatibles with a similar four-clock
constraint as RK3588, also extend the EHCI constraint to include RK3588
to match similar requirements of RK3588.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Existing DTs for RK3568 use the plain generic-ehci/ohci compatible,
next patch make use of these new compatibles and adds the missing
clk_usbphy1_480m clock references.

Existing DTs for RK3588 have contained the required four clocks since
the initial addition of the EHCI/OHCI nodes.

Changes in v2:
- Include rockchip,rk3588-ehci in the EHCI constraint
- Make clocks prop required for EHCI and OHCI
---
 .../devicetree/bindings/usb/generic-ehci.yaml      | 14 ++++++++++++++
 .../devicetree/bindings/usb/generic-ohci.yaml      |  7 ++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index 55a5aa7d7a54..a39f01e740b1 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -52,6 +52,7 @@ properties:
               - ibm,476gtr-ehci
               - nxp,lpc1850-ehci
               - qca,ar7100-ehci
+              - rockchip,rk3568-ehci
               - rockchip,rk3588-ehci
               - snps,hsdk-v1.0-ehci
               - socionext,uniphier-ehci
@@ -186,6 +187,19 @@ allOf:
       required:
         - clocks
         - clock-names
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3568-ehci
+              - rockchip,rk3588-ehci
+    then:
+      properties:
+        clocks:
+          minItems: 4
+      required:
+        - clocks
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
index d42f448fa204..19449a6b3033 100644
--- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
@@ -47,6 +47,7 @@ properties:
               - hpe,gxp-ohci
               - ibm,476gtr-ohci
               - ingenic,jz4740-ohci
+              - rockchip,rk3568-ohci
               - rockchip,rk3588-ohci
               - snps,hsdk-v1.0-ohci
           - const: generic-ohci
@@ -198,11 +199,15 @@ allOf:
       properties:
         compatible:
           contains:
-            const: rockchip,rk3588-ohci
+            enum:
+              - rockchip,rk3568-ohci
+              - rockchip,rk3588-ohci
     then:
       properties:
         clocks:
           minItems: 4
+      required:
+        - clocks
     else:
       properties:
         clocks:
-- 
2.54.0

