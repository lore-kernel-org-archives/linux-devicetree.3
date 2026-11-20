Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202506;
	b=0vqvuQHxLs83Ubv+uS8Er6moY/iN7jbiSwoo5AEXpTULgGp0z2mIushBlfD9Z7SiXGkN
	 cCLEz1C2sehc/nnJZq5WH+2OjnA7fvhdVlwgxrDXk4Ly0JKufNQm5gj9hFtQuN2JJRQv4
	 JqnPYGDvDMR+ZPUSiFdX11yvS7yAwklXvCvYOTkRuCYpEAJi6K2dMNAlTEfr4TJFDvK7k
	 k/kvrcwv7xA39Vzwa4sio5YotsaCx0a6A9rXiO4ny1ER71a+49h/aA9752RuED73gTqOu
	 ktEJxLQl7aYJ38IqQWdr8S5haju5Zot8c8beaLA+fH/+9JBvgW2lvvHEbm3In8N/77Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=qEVHtiKYBLIel8um/QH5PKwY2ZuAggHrE4chfoek6uE=;
	b=nHH9FsC64+eBiMtsdi5PPnxXXA6hKgv991B9SMmj2cD3Nel7W22CJOOoIwLIndXkA36L
	 Ps81cNfj+Jk9xpiP8/xF6JsThz/S1QbIiFrnWc6xCOsynmE0WO1QFxFZ63CLcpapzCv89
	 I1BrjbIeF37LWdQI1RxBHGK74YJWjBU6fdYjonfMdTzk4TVvFZ9mmvMRPXv/M5b+0xGWH
	 yJQwkmI/CXmqwGmXM+5YgQSzEDj7daSuvDbjJUvQX3nYPRgv9lSKZHYHwhQUjmyEQkBKV
	 4FqzL+9oWfgu6m2VWLLwrk4Bec2wgfEdIuOi09t7g/e/hOpV2NkaKNdxMSy7WsQdApw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hMrXUZAR;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F23606A6FC
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 19:21:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63F23606A6FC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hMrXUZAR
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so18992345e9.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202498; x=1795807298; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qEVHtiKYBLIel8um/QH5PKwY2ZuAggHrE4chfoek6uE=;
        b=hMrXUZARRGU59FPPHgFv4/IGmhhGJOHVMMpSO1vlaR+Ih+NlsThC7FRn5On4gWfx79
         WMyakxNhdUwTRSJ674ERC2DyAJpEY1TrEkGY0aXaT0eGDQy01Fl6gfcxrc1g2HOKMo0X
         7IMEUW8DQPbZ8B46kS7OZsK1oH3yrf49uY6eoRemcWpK8CRyu6N80NKu6A7p7Clpf8UN
         1dOOz9hXQkR7FkIpZOLY4BmeC5+ifv77XlvBtaM4xFPwwspKwLuYglrxGOexxhAtrtBL
         trYL5OJngGbZGlSdpkrRoC6nOiOjGbI3IiCXYxPXv1flEDvLtUhJqw6a5lF1yzT9azA0
         vFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202498; x=1795807298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qEVHtiKYBLIel8um/QH5PKwY2ZuAggHrE4chfoek6uE=;
        b=runA4j4Mukkr/yIA6ezqNTQ56xZPeJjU20xrRqc6hHZNBzCGOiS3PxlFKOjFVIvhpk
         E9y9v5sU8oKnvd1Ojp2AYe2t4zEJo4FY/sxFgVRz2ns/ck7K2zM4j7dqLA+qjNcOwnfQ
         X5dsYzXcbmBgH+UsMapBLLuhfp4iWizaZfJJGLlESNr5uiC8G8dh+QykSU8Zk/ynI3om
         Ga5yMGVPrgJNjq0Ga3BflWSxyE7QNRXpDL+MpPWzOqkrqS9PQ0q/qpKEqkMHdT71Bmdw
         jaKi4ELcw7IY9jorJqAlYuHXkLats5AG20goIHz4pu+LwuRPTwiUCi2BC/f3x+Ngh/+G
         CvFA==
X-Gm-Message-State: APuU4Z8G1oNlcZDBskv3zKHKG9gfbOQ36m7aHdJBaJ+hdeiW0Skiq49A
	7BDCq4DhdyKjSu38diAud4O6L74nAUdIIcVmISmVJiHfRARlTkhRlw1E
X-Gm-Gg: AYBFou1eMNtyxXWjQE0M/lRZEnRJcoUQqcYSxCR63znm3yj2VVWZlOffYGUCoubzxXL
	QBFrDz4PZ6dJSBKUhErlTyNRdPFIrwe8/npXLCXa1HQCMdkOUMkY9kLXId+Gtlsr506qsykTD8l
	Dkii/17bMiKbA2XppvhDZuMXulopTsHzOR/bQUxCXXLyK4RWhnjaYqC+OSEYZuMXxrIiRuz3MP7
	ScX5/TdrsBSUR93OA5wwaHUOWWakj585YfzkDrSeT0IXZBT/dDZj0FpGa7BsnPdRv4Useu0FmXS
	4xpLJLwsSMZMEiKIa9o0OVeblb3kh8o5n9zaid0LIpy1BMECt3bYmwYY+rjvD9rC1/bxjvQTU64
	cm/3fkAdQHodATHQhzTOqzgMZ0cxJFxaHfq/rxKvbjiLiVXoY7/fy4HebZFjxMHCMsCeyiLsq60
	UbT02/gFodv6RSGdiUcnpcFDRsY5PtjLy595evmI2x3i2PwLlShJU6DzThlhRKK0RnyNSzSZPE4
	6XEo1c8wgM5cLhijloyyquC0pbw999a4T3eOD6WaWamn+hEacElF62JeFkyN73Xq0zzvJ2+2mCX
	vMnp4NdM0TGNpDKGYRvbws3ZjjNxXNZo3XaF9nd9
X-Received: by 2002:a05:600c:a085:b0:4bb:85d9:156e with SMTP id 5b1f17b1804b1-4bb8880fe46mr94748195e9.11.1795202497703;
        Fri, 20 Nov 2026 11:21:37 -0800 (PST)
Received: from [192.168.0.2] ([197.250.160.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm8405703f8f.21.2026.11.20.11.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:21:37 -0800 (PST)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Fri, 20 Nov 2026 22:20:55 +0300
Subject: [PATCH 6/6] ARM: dts: zte: Declare the HSIC controller node
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261120-zx29usb-v1-6-b0433258e51b@gmail.com>
References: <20261120-zx29usb-v1-0-b0433258e51b@gmail.com>
In-Reply-To: <20261120-zx29usb-v1-0-b0433258e51b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Lee Jones <lee@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>, 
 Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev, 
 linux-pm@vger.kernel.org, linux-phy@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1349;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=ShJdMtJccnJuS9VlQL1+Bdgxlkv6uh6Giop1oqviKs0=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBrAJ2XBrdRPG9C3eFKyU7PnA49Uabdls/WYzMcO
 WkzRMyqm46JAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCawCdlxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiK5Iw//cCN+OqmdHZIesFYbXSmmMdBzwCEi/5E
 A++ezMAgQAwIgDawlimHqrPh8v7KOZ21+gTKfEh7ncmonS3duzqqXvwBNE0ZWZJLuI6VB8oQrxR
 Spms7VnDkKnCWCJY9lwTNTZHiR06DLnlF+2DrauSlWa/6nEsPpIeO5t7IjWkdMC82Nx45kt2kTi
 CRIMWib3xl/OUol5GZ0JplSVHjEeawQNpdTHI9+iaGClORXVFFm6BL5FN+h7/OCFmRt7iqFhrg7
 3637vNdQgvX0WkYq1tg/tCsBt70ZDMbsgxdrD88lrKg1DvkCToKB5r5+KK2TlKEXAz8P1c6z/ug
 4R8tFWrCZxsZkzFTb1a8eLWVt8/3dI99n+163gd1Zu+4t3/AksqtGaMDgXA5ERJ2shUqZhFs/Xb
 q8G4njYOSnTSmqKoYENf/26Kw24xW/ttjqcWploIYjRp7vR82311DAoRXKTzhKZODzPbWYliMj4
 RJtZCS3ZazBCo84x1e5pyyQbQV+tcj8HuVm5jSfvIf2KqK6q7TvAYnooGaIrQo0Yu4LscP8xmwI
 ToFA0xXUfKHLdUVApN4c9tawezCexUY6fasofMNz7kToQ4wuTsKTm9NEFut8zjOFqv5m+xBpEAA
 Hrwn4mejfFyqzdQpJuSwZcy/rL9bARrA+TKCmztVmIi69bu2+A14=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This is for documentation purposes. I have not seen any board yet that
actually connects anything to it. On newer boards it seems to be removed
entirely.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 arch/arm/boot/dts/zte/zx297520v3.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
index 2fc888b10006..56d6b46a8ed1 100644
--- a/arch/arm/boot/dts/zte/zx297520v3.dtsi
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -199,5 +199,24 @@ usb@1500000 {
 			phys = <&topcrm ZX297520V3_USB_PHY>;
 			phy-names = "usb2-phy";
 		};
+
+		/* The HSIC controller exists primarily on older hardware, but I haven't seen any
+		 * device that is actually connected to it on any board.
+		 */
+		usb@1600000 {
+			compatible = "snps,dwc2";
+			reg = <0x01600000 0x40000>;
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&topcrm ZX297520V3_HSIC_WCLK>, <&topcrm ZX297520V3_HSIC_PCLK>;
+			clock-names = "otg", "utmi";
+			dr_mode = "host";
+			resets = <&topcrm ZX297520V3_HSIC_RESET>;
+			reset-names = "dwc2";
+			power-domains = <&socsys ZX297520V3_PD_USB>;
+			phys = <&topcrm ZX297520V3_HSIC_PHY>;
+			phy-names = "usb2-phy";
+
+			status = "disabled";
+		};
 	};
 };

-- 
2.56.1

