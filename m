Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.79.68
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489171;
	b=CfWi5clpeXrkjLM/pOJbVpcxK1TGBjp7ZE2wYVmr5bBS3L8+SFA4NYpLrOdK1U5pyzCE
	 jeUjp4szaHIwqIAspOxcfGCt38D0WAoD5aUninbgsWzYPv3yUmiBWZs8VfhjVX3GR5kii
	 JGIjXB4ccy65c8PLiFE6RPP2/dv0d3YrYsmD9QhGURl9rr4sN/+2EIgpYKhJp8AaBEa7C
	 uioIvCuZCAkmA12XBpM44b6oBWy9vm/bvmL/eXfVZp03Ly/YKJpNYLtVfqGSAdlZ+6PJT
	 cHzrVmbRBpD4IxZGk4jT0knSHEOGjrG7IaE33SjTOsqRwheAPaRi1VJrCAAaEqoRmcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489171;
	h=DMARC-Filter:Received:X-ICL-RepId:X-ICL-Out-Info:Dkim-Signature:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Proofpoint-ORIG-GUID:X-Authority-Info-Out:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-JNJ;
	bh=lWKKiCcB+cIw5mjLwZ109Y6WQBeHvSpKP6wajX95av4=;
	b=hxe+uq36IvqpRa0RU3YYUqlkLzeIVZAX3EEDNOeZyHcWYhxyRRxWE1KtCZqw7l3m+SfQ
	 77iNrg8ORMORdDtGivhucoi+ecdVmHmYSxKZYu2j0rZmJsCUurvzGKZz3iGt2sjLbqW4C
	 Lj/XCZm0YnRK2mpPU8i98rpcK8B4rESWC4xshk2lhvs8SK+iZFgAPdQuWGckG4TSdZwd5
	 XmhjWTVqRHUodImCdKHVdHZ5oF+5iQc4URhTivjD+tt6rdqW8n7p4TbdtDkqzNZE/zPFu
	 YSiwXHyReftn7baWNiarAmTk9efGVz1aPPtK2lOr6aH1IQdIA9EaAfKfyT38Ka5vnCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=tc8tUyuH;
	arc=none smtp.remote-ip=57.103.79.68
Received: from outbound.st.icloud.com (st-2005k-snip4-5.eps.apple.com [57.103.79.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5804960A383B
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 09:39:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5804960A383B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=tc8tUyuH
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-11 (Postfix) with ESMTPS id CDC9D180011C;
	Tue, 20 Oct 2026 09:39:28 +0000 (UTC)
X-ICL-RepId: 01a158ae-1f94-75f1-9864-4c4edc63b978
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGRhGXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOAl0FWx8RTxweGwRGA0EUQAYOVQpTQghKBgkPK1sTVRdGCRkIXR0HWEcURw4PGVoUXBhT
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1792489170; x=1824025170; bh=lWKKiCcB+cIw5mjLwZ109Y6WQBeHvSpKP6wajX95av4=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=tc8tUyuHz1hJ54hFpCD9CIc0X+QUqxbwtse0eTRX94V8vV+3Q1Pip0kx7gENFUi0munHwPcUXnpesddwz3rOitNOJ2IrXY2BVFg6USNyMB94Qa26y30Le9oBH56O3Nui1A2f/RQ8QqGojIdMlI6YzVTyCHaNWBvQ1ujGHjUGbzoOmhl7DcJr4o2oHjrJIP+TXSfZx2y62/3d+/mFaqgPyf6FizPBY2GrWxyUeB358IUOPrNUJ+Y632RTQxDt3D+awEmNwZUXmYjxBVyNydbbbegCp4l1I5Zxg5eVOyKOj7mh0pSYpPqJfc/mkNyWE/CnsCdqqWPcj8nJ9627DMFwzQ==
Received: from [127.0.0.1] (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-11 (Postfix) with ESMTPSA id 79D661800099;
	Tue, 20 Oct 2026 09:39:26 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Tue, 20 Oct 2026 11:37:52 +0200
Subject: [PATCH v3 11/17] arm64: dts: apple: t8103: add avd nodes
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
Message-Id: <20261020-avd-v3-11-85cbaa2125d8@icloud.com>
References: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
In-Reply-To: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sofus Forstreuter <sofus.c@icloud.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: 965y-1dmxP17w1Cj6rL1T66rqFwBim-N
X-Authority-Info-Out: v=2.4 cv=Kf/fcAYD c=1 sm=1 tr=0 ts=6ad736d1
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=X6JhwUuqzQq2NhyfIN4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzOCBTYWx0ZWRfXw2RtQse9TnwE
 7DdRYUOxGskTKeNc1fZNkjaXbgFA6mImXLTjRhmNkWANsL8WnnrIvIfTUDpl7JJ8a/Jrjr/aJ3X
 qF3X900tnYWA1JTR5FiOwL5R+sTyuV1FcSNhSaQ/GQbS30of7jCfh9MeaJdo4CQN69y/VGm3+YG
 w/5TE4aUKUm8jE4w1pG2FFMeEYY1aGar2vkyB28DsAl+hwuhlxTyu8t1m0n9V2jrzNly1h7Ys0I
 /lPCvfqRethZGK8AWWFD9jL8ZN0SgrWZ0vr7SXz9D/E+uXkRj1wh8Kj5YWvMNujNZYlHb+ynSeX
 bnNWwOILo4KAMFe5KjYKvMWDjzrvdxdTl1L3vbKIO3Ulzz/ZildCCFDvbe1P+g=
X-Proofpoint-GUID: 965y-1dmxP17w1Cj6rL1T66rqFwBim-N
X-JNJ: AAAAAAABojQKdI2u79cpxhHJKRpi/F6GWyqbEWCscfE9cWZZjf+dCPP1iugpqL9PN603dHyF1+dxviWb6jWpo8+SVxY3FPVQXjjhnCE5KaN/Ka+pBIOE8xBcm2I2xw2Em50LS9wuJ8yyX8amwSJowa9G9qdALoqToB5Tg9KpebYYKbYaYeevb9tb/yKHgjU5jQpBHWAP1fmQUU9u0jbRxDph+JAyvV4Z1E+ETTyivIR+NkjI6YHSuHZqA9rW7Q1vjrOsElcmtQWbIozX3922P7nbpnuQWrEsfaQAhwhAQs99AXyEhJF8uSc9nIOFrq1jUVEripLnWsWYzTFJid+0DhlXcKBVEXLmKNrkfWg3DRG4BK9mTCd2SkI51TUh9mvYsctp1cpUGzZfJd1yBP37sA2LgNqQeOQLGwDjVxG7v08lG5tLuX3ctZIOQO3YCHTqm5FjcyRqLWUvjPC5uCjqCCQRNUXZvHhOmpDbdnA0rStH4HZh7t+47f8WAWpy9M6VlC6ZoASMmPoztaS0UFhaeZWTXbm5nnZ+VtcZlLAhiH7xBLVUZZ9Pzf3LwqbjvdCgDlc8rWSWeLegzjdL0P9Oru3PhY7bmExlQu8kzN7sfNoae8+Rxh2NecUGaMRfx2YPnH23hwSWPfm3Ot8iib9OmwHibIi35oCeZRo3avitkqp4/pkWgOwoOpYTuG4BXKD3WmdIbwzBpWbdH+3cLXBLqY2p+IOn9cOMEEGcQ8lHYpxIaMFdI3k/b62wuEHir90ySUUc7N0KwZcDIsKcN5KGw+Rx8LcFTZGG8wVJ5GW+LmbFq5bYMlMxQ3tD1eUBd7OuQQU3hb6q1L3WE/PoUnusYV/4HdN6rdBulPkRs+od0Suw/w00YrQhfvAkvDhVlwpMRU4jzEJ9eRJ4xBm6s1woUs5Fpi0=

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
---
 arch/arm64/boot/dts/apple/t8103.dtsi | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 5b68bf0df4e6..530290e7cb32 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -984,6 +984,38 @@ pinctrl_aop: pinctrl@24a820000 {
 				     <AIC_IRQ 274 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		avd_dart: iommu@269010000 {
+			compatible = "apple,t8103-dart";
+			reg = <0x2 0x69010000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 547 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <1>;
+			power-domains = <&ps_avd_sys>;
+		};
+
+		video-codec@269070000 {
+			compatible = "apple,t8103-avd";
+			reg = <0x2 0x69070000 0x0 0x4000>,
+			      <0x2 0x69080000 0x0 0xc000>,
+			      <0x2 0x6908c000 0x0 0xc000>,
+			      <0x2 0x69098000 0x0 0x4000>,
+			      <0x2 0x69100000 0x0 0x10000>;
+			reg-names = "piodma", "code", "sram", "mbox", "ctrl";
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 540 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 541 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 542 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 543 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 544 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 545 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 546 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "mbox0", "mbox1", "mbox2", "mbox3",
+					  "flag0", "flag1", "piodma";
+			iommus = <&avd_dart 0>, <&avd_dart 1>;
+			power-domains = <&ps_avd_sys>;
+			resets = <&ps_avd_sys>;
+		};
+
 		ans_mbox: mbox@277408000 {
 			compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
 			reg = <0x2 0x77408000 0x0 0x4000>;

-- 
2.55.0

