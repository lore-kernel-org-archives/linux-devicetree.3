Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=149.28.215.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795721279;
	b=ddU2RJZSWsChBCnVR9ri0kPKBy513HNeUlmOj9mHajt1oq+/Hf+UgWcJGZV/rxa6eOMz
	 7jgGa9gkZelU6SrgYTwJE/Z4ppC9NArlLZuEiCPkPqxDJ2GxcnxM6JAFbAFHbOAzbF/tW
	 PnEwGqG7oUUa5c/NYEIV2H0YMKO4iTM+mSIzMhl2tjxmDwhS8w72TvgFdBGGxkuPZ3nUL
	 NJ5P1ruHyutA4MJ6ovE4cdVk04rquXF/2WmM9TQn/nkWmg2TVkiLrtcCXWl7injoM/1mu
	 Kt8kWFMxiz+WeBhgwd/ndCYHYLQRnOlJI08dwCS0djl7k9W1LFV6mlh9GFW4BgF6Cpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721279;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=z4mLuE1MnI8cLrSDXrkTRUCT/LoUIRcdV4rRUnKpvlA=;
	b=zhJwTzLTLJWTRBxi4wVH+gL09UjKorZf97fL7Hhi8z6Luhk3fyvbs5gvtxo1T+RbBwGF
	 ZqbT62++tjNxjmRmd5Abu5BmjLnqBLvoGh+gqcIjdixE2lh+l43nf1UTxkrQ77+q7nHKR
	 DD+jLD00hPCFDcJd+zsXszxEbnE+3ZSF+yaxgtKFVEz4/CqTGMj+l+3uzTHrDdXFUPm5B
	 OGOosy9B5cTsfbMHwwzTYZFF/aFWDrXU6kvKWC4JEVcOTBzTgtH0rq45OCv+wF0Zl8Ag7
	 U9TpYjLhV+L5rnF844LHONDy6l9GswVdklgjTnEV/mY1gNr1r82yrs9KU0+yI51JQDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kwiboo.se;
	spf=pass smtp.mailfrom=fe-bounces.kwiboo.se;
	dkim=pass header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=OJ0TMnJS;
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=a3K2shaI;
	arc=none smtp.remote-ip=149.28.215.223
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F78606A327
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 19:27:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69F78606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=OJ0TMnJS;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=a3K2shaI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=fe-e1b5cab7be; t=1795721278;
 bh=z4mLuE1MnI8cLrSDXrkTRUCT/LoUIRcdV4rRUnKpvlA=;
 b=OJ0TMnJSP8d+XLlHFN5Q+CyWMxksNeVm8roh3KXfWEUzuf88sX5ss/tIeAEu23wfIHLaVMaK5
 9bmsNUaslBvl64hnEWSmAOh4UeCLz1xOg4lix7NbUYXlJnBZJBOzhvcvBPIKo4yrjVf7FcStps3
 i4XloLGr+G46dlq3opqQBk8AAGCXqwSL7wWLr1Za6QhzIuGR5QuLkbEHfvWJsQ6G65PSpF11DXZ
 U+2qJRNAphu+c29gXbblMSRPYAoE5xkYOx0YFbGFYx6wcpm3PErVOvpA0lqCVOermBOMGOvK4j5
 oJVeMXGZRygLdOvIQuwVyOPqlA4+YXKaba1VmqZQ7MAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=default; t=1795721278;
 bh=z4mLuE1MnI8cLrSDXrkTRUCT/LoUIRcdV4rRUnKpvlA=;
 b=a3K2shaIK85Dyc4UtWtCo+KeiTgAr2C0VySFsTHAE7e75XdrRQ4bjiebcMMEvAKbZlEQrujC1
 tjQXSozgMBNUDrap5aN8Ip2TROP47glWX1JUOES18FyYyXTYmdl4g/29XokiqZy6Sq1Dvir1tCG
 4WbXB9oyJP+um6ojfKx2m4s=
CFBL-Feedback-ID: 6b088838b69a54ed847adb45:bbeec19570182d8701aa3de9ee115af1
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b088838b69a54ed847adb45
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.19.39
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add ArmSoM Forge1
Date: Thu, 26 Nov 2026 19:27:44 +0000
Message-ID: <20261126192746.1595707-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126192746.1595707-1-jonas@kwiboo.se>
References: <20261126192746.1595707-1-jonas@kwiboo.se>
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

ArmSoM Forge1 is an industrial-grade product powered by the RK3506J
triple-core Cortex-A7 application processor. It is specifically designed
for industrial gateways, HMIs, PLCs, handheld POS devices, and home
appliance display/control applications.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v2:
- Remove unintended use of zero-width space in commit message
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 49c61ee985e7..38ae73e8a34c 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -84,6 +84,11 @@ properties:
           - const: armsom,cm5
           - const: rockchip,rk3576
 
+      - description: ArmSoM Forge1 board
+        items:
+          - const: armsom,forge1
+          - const: rockchip,rk3506
+
       - description: ArmSoM Sige1 board
         items:
           - const: armsom,sige1
-- 
2.56.1

