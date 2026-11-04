Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.149.156.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793820708;
	b=cAYRqLaRtmjftpV0Vm4tv/EsbUQP04N/B1ErM7fy70Juv1sYdIE0NbWwLwVrCRYsqmSj
	 +jRwy5W08c9vMhgMQ8hs2Jx0BmCMvKJWh/C93QPmjia9l4T0zMQNuv6ayUHjPNm8kKWOj
	 S1RgnzZLscuHFM0lMhdbAia+LBKX51dbxDUAcrKwDiGzfXybbgkuzfFdiYNAqmUp37RdE
	 2SCs/eqo9Efik+N06g3Bb6Af+wo0eraxpxQS7Nfd3Zd+XG3A09VB3U4+2boDGMp/EumLE
	 Svp2Z8YuTI7k/Z8dRQ9VTKJ1Y+BBQE36XIL0NO3O4ilWQp+2x/hmyfYvNYxvxPsWN/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793820708;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-CMAE-Envelope;
	bh=pu+6nJHRWzu5DmYTz5hrEJkJSz+341qHqWf4WcosOnY=;
	b=uM74l3yVLAn1UIlmslKrwtNKDEcayGaVbU71xktZ6P4i3q6v+8H9Osp7lMVxh6IUtyqs
	 /fyt/p3/aoD8ZCQp2Znn/55U0IjfZqrSsY0E4uuUZOiushvc51fcNBsXLWcdxWmdcmn5w
	 SXD3nyQIJoVCVjIkBUu8FIkf3bHPiIiIfsOdU7XgoSiul7e7nu2QWsfC2mLQbmWrD7M1N
	 E35gDSJOOEuj4wmu6XYWjCZmGHumY5btjA6DVNSQ4sk5VWhYFuAZVH8OMCwFTNSfuYWJk
	 Y8IrpR5NllZdTHJe1mI9ENXxILzQRFgBrZA5lIJzgkQDkFLXYP+PF/JMZp2IjlHfjkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mythread.it;
	spf=pass smtp.mailfrom=mythread.it;
	dkim=pass header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=HyM6junJ;
	arc=none smtp.remote-ip=62.149.156.56
Received: from smtpcmd0756.aruba.it (smtpcmd0756.aruba.it [62.149.156.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FCB6078737
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 19:31:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76FCB6078737
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mythread.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mythread.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=HyM6junJ
Received: from [192.168.1.237] ([94.34.125.0])
	by Aruba SMTP with ESMTPSA
	id Ogh3xxDlIuuRMOgh5xJX9D; Wed, 04 Nov 2026 20:30:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mythread.it; s=a1;
	t=1793820647; bh=R6vo2ZVstSoaH11TyX/V60vwdcI9Qd37oiQ9RRJwb8A=;
	h=From:Date:Subject:MIME-Version:Content-Type:To;
	b=HyM6junJKfjMGHqIJuH4zwfzL7C2vvaKA9fIgnaJiEIPrSTt23vpHKPuGG8Ob10/I
	 pcVy8Nncen7UbUbk+Pl3J9qm6ETxhMMoW3PqnaWAPqrb+/24/X80KNQtRfZ2VyxMp6
	 q3NRp90v1JfrUszqd44x/9AAPR+8bnY5NIVFSnKjtwMkuuqifp6zwbK5+WVW8Aj+bB
	 XyBKQcjrdcVLo+WkOxCjfyvKp+n1mFfrFgfn8imy9xicL7c9sBiJT+FQ3tDC+dAqAr
	 sa/ZdulcgcPN0e1JPnJos03fyP3Jh2jYEdReMyL7TcTOhxmdg5/UmQxyblKjjUKqFq
	 a4fGd/ea2eFzA==
From: Alessio Ferri <alessio.ferri@mythread.it>
Date: Wed, 04 Nov 2026 20:30:48 +0100
Subject: [PATCH v4 5/5] MIPS: dts: bcm6362: add the integrated WLAN
 backplane
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
Message-Id: <20261104-bcm6362-wlan-v4-5-f001f6d75dc3@mythread.it>
References: <20261104-bcm6362-wlan-v4-0-f001f6d75dc3@mythread.it>
In-Reply-To: <20261104-bcm6362-wlan-v4-0-f001f6d75dc3@mythread.it>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Jonas Gorski <jonas.gorski@gmail.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 Alessio Ferri <alessio.ferri@mythread.it>
X-Mailer: b4 0.14.3
X-CMAE-Envelope: MS4xfBvkpWepbH7IU9x6gOlcj2XdseRrzIEwzb8aMq9Ie9uZi12I486TIMfZq51vhX63e5Jkoijj9q3DFpapXqB7SAE/cGbhf1JOjRdHXt1KHRrQjv4HvgX7
 a2bhn/2Mt7wiWjSdUPCUJoFsIh0SaMOOmifuPAAnzzPnBpkMCmKv68cj7qByu8X2F7+MAqabVLBdwah15tr9nPXAnZRjBmTNhv3+Q7NYFhYmMhwkYUnuMKsl
 iYt/pKbevs+YSC3tNq/R0Tgo1aY6Q2h47we/NOfJ5gGSitnGVZYyNhD8dNDHbN7UEe3t/onYdmSbeDZY+KBCFNWcc48pKnKBL5KXeiFQN18KgiD/OdOUgMAn
 30xmGiSOKg/k78firSUfV2VAyeg/UPaPMKk5/57Q51oFqZOUU5Vbiy4pxAoZIwUaFQTU4RbPC0Uy2KCJtOF7C4AkBdzd2sjPuUoRwBJwY4Vs+M/O0iVaylVY
 MUF6kkr0sxPe+2BDqQp3PpNJ9RmSBeDjsC2zoAL8Biw5V1A8fsY6mianKpCFbItWDiZvqPb3esRnpQ52TtOzF5+Av4EPNxA0evbhG8B235dxlbYgNJ0DAImg
 AogSxD7bUubk9Wenez8RMtlZ70BebuhviSzfHzmSnzi+bsKPf4zmDDLzUZ3hWpGVw0uVsN+5qa8hRIsxqA8UUpCkiPiIwzXQpt6ZPo4VJl/dZA==

Describe the bcma backplane of the integrated WLAN macro,
with its clock, resets, power domain and the interrupt of the 802.11
core. It is default disabled, boards having the WLAN need to
enable it.

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Alessio Ferri <alessio.ferri@mythread.it>
---
 arch/mips/boot/dts/brcm/bcm6362.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/mips/boot/dts/brcm/bcm6362.dtsi b/arch/mips/boot/dts/brcm/bcm6362.dtsi
index d74021925c53..c6de39588840 100644
--- a/arch/mips/boot/dts/brcm/bcm6362.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6362.dtsi
@@ -261,5 +261,25 @@ usbh: usb-phy@10002700 {
 
 			status = "disabled";
 		};
+
+		wlan: bus@10004000 {
+			compatible = "brcm,bcm6362-wlan-bus-axi";
+			reg = <0x10004000 0x1000>,
+			      <0x10007000 0x100>;
+			reg-names = "chipcommon", "wlan-ctrl";
+
+			#address-cells = <1>;
+			clocks = <&periph_clk BCM6362_CLK_WLAN_OCP>;
+			#interrupt-cells = <1>;
+			interrupt-map = <0x00005000 0 &periph_intc 7>;
+			interrupt-map-mask = <0x000fffff 0xffff>;
+			power-domains =
+				<&periph_pwr BCM6362_POWER_DOMAIN_WLAN_PADS>;
+			resets = <&periph_rst BCM6362_RST_WLAN_SHIM>,
+				 <&periph_rst BCM6362_RST_WLAN_UBUS>;
+			reset-names = "wlan", "wlan-ubus";
+
+			status = "disabled";
+		};
 	};
 };

-- 
2.56.0

