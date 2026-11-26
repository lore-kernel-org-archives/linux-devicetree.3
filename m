Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.238.236.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690972;
	b=rIvJQ3SVXmB8TDdn+jGhVunE3xu3Qc+/tVrdj/5mLkM2VWxb1xhP3e1D3GYVzKh8miKJ
	 yLPvZIU4W1z6JfkKlzhKbqhirmhVXOhi+8lhmgIBZl3O/ZoS2x3jBMhxD1FpyHunxkGuM
	 Qt3zUeYmpT4SOqYfBYzn/WwHEflG0mAygfz2Vcxtt2TZGadJxcb0HAFhdZZD+hC8+zjVP
	 KYQ2UxJ2IXJPOGEzwnujKB8B5jOvK3CPHBfPNmXDqFooqGbdhIRRkQd1bnWS7jLdASxsN
	 FBpXruB5cJscyasrBFOZ5BOODvOEF1gp0c3D1aK7JBrbGrpU4RH3TKqGc5WGLnEdnAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690972;
	h=DMARC-Filter:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=2fB2d9MyTQF7jCP81vybIK9pxCDJJ95bED8R+qvM5f4=;
	b=Yu+LEmT/CVb+jpwyhEm3Qz6kFIx2fVaiWl7F/hFAhz0OssaLE9rTTa3iG6Nv+gM892Zc
	 zt8nTgY57QO1OGBprm685vPLR4nqnzUvInQK4yCcc+0l2a3MXtpwWwuYqvm0r6Wj5S/x6
	 p63DtKdG8f9pIEvxYSWV7H2DNruuriPsF2XhbFjMMQx4nFwuQg7CR0yHDtDYk6s2i/knY
	 /f02n96BXR4l8LsQ7eogf34ShNN9W2gF7MrEGUqE9cfytxCNl0Rs2OvDEyNJEEV4YmnuA
	 AIvS+DafI1bIVOPQPJ0PL/bcpZkjx8+6+pynIUX/4tWQyCYV3GUVokU2us4WWTs+JIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=u+UDfkv5;
	arc=none smtp.remote-ip=178.238.236.174
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824A7606A326;
	Thu, 26 Nov 2026 11:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 824A7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=u+UDfkv5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:In-Reply-To:References:Subject:From:
	Reply-To:Content-ID:Content-Description;
	bh=2fB2d9MyTQF7jCP81vybIK9pxCDJJ95bED8R+qvM5f4=; t=1795690972; x=1796900572; 
	b=u+UDfkv5VrDfg81TQJ7F3cfqn7ITgvQ676A6p1bwUQod0q+c/kgnVPcHL5dBYH3FIy4DkhuuRH2
	FZ5JUFmR6hALFrH3TAkiSrKBj2p4cIvz6jaln5lHHoxYBjrkIu23cBgJPgHbvVxaSwY0vmn46+VDu
	gJOuenBt9SY2qvvxRh6JCFdz5eyR3ZnIk2ukMh4EyspxX4dEuDpI2SWVNXFevWzVxmYhfoYtCPAZ0
	XqWt57IpwDYbiqtVVz08wIANHSIvyhF+YR7kkj/78W8lFU0v+nBoBtEltcjAiYCmYjNGc38worsuH
	avomtVwY6o2TlPj9jiAW6uEWE5RN5+9+KBAQ==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Thu, 26 Nov 2026 12:00:56 +0100
Subject: [PATCH v2 3/3] ARM: dts: imx: kobo-clarahd: Use 32K clock for the
 timer
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-imx6-idlestop-v2-3-c6987e7a392f@kemnade.info>
References: <20261126-imx6-idlestop-v2-0-c6987e7a392f@kemnade.info>
In-Reply-To: <20261126-imx6-idlestop-v2-0-c6987e7a392f@kemnade.info>
To: Russell King <linux@armlinux.org.uk>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux@yoavmoshe.com, Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.17-dev-1b309
X-Developer-Signature: v=1; a=openpgp-sha256; l=898; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=TE2zpYr7D6tueCqMdj/GlDbIYgtArbHlYHvdQ6KtMC4=;
 b=owEBbQKS/ZANAwAKAYRhRfpAKNzxAcsmYgBrCBHACZkPmg2RebgXVzb9oxwY7kNO9vpCvk9e4
 DI9TVXITWqJAjMEAAEKAB0WIQTY6xCZL0TEE1XHfFiEYUX6QCjc8QUCawgRwAAKCRCEYUX6QCjc
 8eZQD/0e8M6REzMmZyyXSvymM+PQe/nS/UjoGIOIEB9BallaCRMqYC77PF7vxvFHyKK8Kq77idi
 8uFehEYpLVt8dN1uYiCNiffj/97d5Klj5chOspRgIlIsBhgFPUXYFeaKJk4bPgtvfRBVu8K4zgy
 YXYgNYsKDnC5nfGJtHSJQAHdD+GxEh1v9g6MQvnnM4/4IQk3Zz6ycuSMlbbk4b8EQ3vqmpDrKZu
 uCgkI6KcXCNELPErz1dS2M7nAxorewA5Z4mU53G6Qsgr+cFXRBszLnQeQXufrH23zD+h/Fflggo
 vsKPN3wqyA9cEvRsDUuA9/eUJfHQwYSm5G91Rsk1b3ftSwMIDANEe4yD5aKe9pBo2FkyBOnp91K
 BOv8NxYTYKsiN4Kxuxik7zc4j501nUwUnmzEYe/Z4qnmIUrw1UPS23rnxlPhzsXGfsagF7rAn+R
 kx8BSh7Px9whWhoOc2UyXuXuCCyJTYnI3sUxK5ZtY3FM1ll0Zj349a3SZlDwvg2cFB26r75dGlm
 qwZsrTsWtnfWICe7IxizEDQ/VwUW4M7rRfzzLcfXgocC9bgEJM/kgCi2nvicLl5rxtaNgTFIfCq
 65II4o9QoBFIMqtb395KTmBjp96MZLDYgt/gYA9/kHtOWnaRc8t7Rb9iMO3SLy0J4h6gD24ItKK
 85IvCKUwg+F1Nwg==
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

To avoid depending on PLL infrastructure for timekeeping, use 32K clock
for the timer. Avoid changing the clock globally since other boards
might not profit from a slower clock in the same way.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts b/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts
index 1000ee8b807aa..2e907c4163629 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts
@@ -46,6 +46,11 @@ &gpio_keys {
 	pinctrl-0 = <&pinctrl_gpio_keys>;
 };
 
+&gpt1 {
+	clocks = <&clks IMX6SLL_CLK_GPT_BUS>,
+		 <&clks IMX6SLL_CLK_CKIL>;
+};
+
 &i2c1 {
 	pinctrl-names = "default","sleep";
 	pinctrl-0 = <&pinctrl_i2c1>;

-- 
2.47.3

