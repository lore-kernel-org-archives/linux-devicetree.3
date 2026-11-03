Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793696357;
	b=OlnhcRk/LpC/35Hu9CoPpzA9UrwS/6lfkihINwXbfJP6GLvGerucQyl9/e7406InYkwt
	 lP4k8Mu53jhFwKORzE6bLjTLWF3mudAE5JU3EAbxXS09zCS312XWMsDTHyGfzrm9u7k7B
	 V0IsXl7NNgQyAp0h6099LyfnQWs5tX9oRKK7IUgSea5F3v/n2cyeCi8cmVMyvFeLVmNr9
	 9CBrYPZT6NUJ4tI0f9k3RJuYZQx5wQ+/Gym6wK4eIBlQ7lvaxQg/h+iwzkcDZWEqzHfI4
	 UTncXR+5m3/ZA13+kM4taPHxPgDwuupWMoFftxnV+WvM6Oh74pufh36Sy1S7tKWmQGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696357;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rA1Ovd0Kzmkr6NATBzq19LdNhCK5jrPNyVR/5XvodLA=;
	b=SMVWo8tqHNgWlnoqrxjSnBZ5u5T8vuuL8KwVWH9gyOw/7MR/hWAs7IMXYwmk1tRjAB+K
	 lk1YxOdb4hRXQVVaJmPmMpecWihFfxQVtx8Hr+SxZD5HI5csxjBpZ7jdVZtbdg6+o9ghu
	 tYMxfGujhTIDNhvsynch/OVV6adKALUISphZgKw6Ue2ncty9ub0mrRlGLWETnHV3munEh
	 0cZ41VHwI34WuIFOr3ZDOMwkmJ+U+38d1MHMmjcikBW9aVxP5maEQEow9ji72VPxp1lNa
	 agPSCXUbUq9E3lf8c/NHt78u6NccTP6tM0hoSE62gckWSOZXiOwkcRQ8O9TsguOUJVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GwfWNW3q;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9C6606A327
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 08:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C9C6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GwfWNW3q
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ad0c2e71ebso566772a91.2
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 00:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793696356; x=1794301156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rA1Ovd0Kzmkr6NATBzq19LdNhCK5jrPNyVR/5XvodLA=;
        b=GwfWNW3qDAiD5R4hrCV0GCl+mXn2dw/xdGiCMYzVXnh8sAo5j30pzKaJQ2c8Yqb+2y
         R2NhPV6XfLLtSftaQyzY0ccCktIvRfCOIIxuseEwn/HltiMoK38y+JTGogIgZUwfaw46
         tdbC23erg8nvyt6asc4sC+Ns8l4T2E9EjfmJ5LkE5tkJ4sFHbCnN7NiFOMtoS4azkeFM
         64lF9Cz4bFrJ7/YlGIFvdlMi/jQ11pfGwapqs92V9N7LndtS7ou+8UGIujsqvaUoqBSb
         XHuRVmowHsCLH17yFAVxR9OvuXNTXHtCiqNj/nRYcOIMLlHTNUdBr38yq2PURkXJCVx6
         +RFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696356; x=1794301156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rA1Ovd0Kzmkr6NATBzq19LdNhCK5jrPNyVR/5XvodLA=;
        b=P7yXKSVsnuhYL9mm5PxEYhPzTObWbG2jQaETwOtprOF/OvhTCPr2Aa2ofOQz8n5Q04
         CPRXYCC+KLaaEi39pV5s60oifOgZT003IFKFRe9C5K5uMRaAy5ikhiuBTR3pqoIH+AOB
         wTTf1u5GeRV+ZYav+j+8HZrNA0DoDec521V7BjEHT21OauWrLr/3oHscBa8G2DYu2AYc
         LmzZ7lDABlLqUDofCWVsGEh46itQbjpsTUoDB12o12O8WWFWvw93tpLRVKqNRHRYFG63
         u7NY4TymDMA58u2uAw+ahe3zAOYUXWEpVGS16pS4MveWPutjFAzgiMBiwr1bGy/x2hlT
         KjUA==
X-Forwarded-Encrypted: i=1; AKwUvBy2k1rk4OvRxMmsADsgPc+1XMvWs26dffqf1tP9y4ll2OyG/wKZtWLpq3oofMJ4iqj+m/aXF8paO3IO@vger.kernel.org
X-Gm-Message-State: APuU4Z+fqKK2w73aqqylq6LLZygqh8kS6u0X4mJIn+4hvBpHdM5xPwo/
	gpsew4fI478fQ6pYhXQGumvZFly7Kdg8+qm4i6FNkBBKcXKOlrNiME5Z
X-Gm-Gg: AYBFou1RJ3Q+VyZcq9FX7Itfv7c7jR4Jv7XixLeAyDEobrzrT30zuVo48g965oAp2He
	Nwoc9a1E5pxvymsW+4Kh7uErIZp3Ss9G3IqlpoA0T8sz2xi74/KiZ+AuoFiVQ8AzbLDWNFMhpxe
	4T4ayG4r13tmK9r0S2cb0nKc42mVPG8GcBEjuXXoIxBDTGREoMoWJsB+43AVMJFjQh/khWVxNxJ
	AkD1Zhyt8MKc4DQg/5NMgoP7v0D65isGQ91n09GjYKJXty460mqA6/ddUegsDOCYrxyZ5uz4RYb
	TGZ5BqiINBbUza0GSjZpORI7bZTQiZwmp06sh9qn0DhAMGBwu0wp8Y0e4a9wr0gklUrAX7y2Zes
	kMp8sDFMcWZI2Hf1bTX166q6/sIqQPmLuclglD5ByXPXPoosPkeOSFc0Iu6imBkF4QMAWPDefXF
	5wWiiwMyiYOXaZ0Afy6WlK8JFU77hPqPG7l6qKCgig/gbIRepku1J4B7jhq+Ofq2NNM6z/hLBe5
	esqaCiAtllc5dLQed+qEp0D/mZnVCdS0pZQMGPoS1nAOgDdcTC3FqsYWtPgJPJJI2mOx4gqNbGQ
	yIRtsht2nComDXXaK5fjCn+h4yh7TgUL6ubazieDi8f9bq64dJlzjB8ZPdkDCHxagLcZGGmrYEN
	U60RQSGFqQF06
X-Received: by 2002:a17:90b:53c4:b0:3ac:9e5e:d1a5 with SMTP id 98e67ed59e1d1-3ae8988339dmr19037670a91.6.1793696355979;
        Tue, 03 Nov 2026 00:59:15 -0800 (PST)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6740a1sm3345662a91.10.2026.11.03.00.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:59:15 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Chen Wang <chen.wang@linux.dev>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Hiago De Franco <hfranco@baylibre.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 3/3] riscv: dts: sophgo: sg2002-milkv-duo256m: Enable USB role switch
Date: Tue,  3 Nov 2026 16:58:47 +0800
Message-ID: <20261103085847.338613-4-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103085847.338613-1-chenyou910331@gmail.com>
References: <20261103085847.338613-1-chenyou910331@gmail.com>
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

The USB-C port of the Milk-V Duo 256M is the only USB connector on the
bare board, and the vendor image uses it in device mode by default.
Host mode is mainly needed with the USB & Ethernet IO board, whose USB
hub hangs off the same controller.

Use the role switch in the PHY so that one DTB can do both, and default
to peripheral to match the vendor image.

This changes the default of the port from host to device. To use host
mode, including the hub on the IO board, select it at runtime:

  echo host > /sys/class/usb_role/3000000.syscon:phy@48-role-switch/role

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
index d4e86c15664e..0ad1dfd9449c 100644
--- a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
@@ -105,6 +105,11 @@ &uart0 {
 };
 
 &usb {
-	dr_mode = "host";
+	dr_mode = "otg";
 	status = "okay";
 };
+
+&usbphy {
+	usb-role-switch;
+	role-switch-default-mode = "peripheral";
+};
-- 
2.43.0

