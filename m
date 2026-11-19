Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795128016;
	b=AshhL4ltOJM8uPDrq64LNiauyErId62KnCfh/eWgCWuEoOL370Hjasp7OyciP2SnJcHt
	 xM+wS3u/Ia45+wnTsLAwjFmA8uqLm87IgvafB7TvPUafSgl5ykUjqTGuSpjPJQTskbgNL
	 /9evmn77cRg1xs6xpfwZkNUmUwtaQFgtxBMRfp8h9qReQJGeKYwUL+hamvNU1I/pi1aT/
	 mhcHAJAhiXLJRRu7L0eWu+Q5t7ykQd63BpXLHlBN4m8dPvwniF5cGicrS5SWm9Qq+7rmG
	 qcmg40tla+ydep2JH6YMHMsjsIwXdjSGDP3t+7PKNHBTjlHQGMY+Yez9ij8jVgMryTA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795128016;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GZbJnJrsQpQ1xMshKqNDWW4gqUaaunYDWTGTeENGsfA=;
	b=SR9Sou6hD+YqJBakIVY3RQhsjgI8PrU3skY+tRiEqeve8e/UlqdpmOtK0AyQPEEz8THw
	 Z9kmXJicehV6XUWdW13BGFoub2H73xmoEoFFsmc6/vLo2fZm0itNTsmDe8tCy+3002D/s
	 G5FGfOpekI25c/22fUUE00LkbxNqn1NMipOuHe6c99MZMGwTtGUyyYFIJ7xpgFeNbvllE
	 0zN+RxVr/7Ql3KMhjKRtq7XEUtp4d6+043hZzxM7v29dwCzEIzKrbBAZsmgc5DVP9nfBW
	 65Q5eTy1YaAcPLPwOMUg0bke8J+1qfbVhsaj3SvwB9DfY5MaIFjizuJCH7gHaKpV8zA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="H8sF9/Jj";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03BA60A2602;
	Thu, 19 Nov 2026 22:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H8sF9/Jj
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795128015;
	b=etvpPfYQXWlsi7fhRAbhqCfwKZtExKbaXtpX0qlcLBcQGwXLoK+dBbo8g4iHFc6P4IiF
	 +JWE1XEgrotf740v18VHnEMeCv/Z7N+q39T/Q6SpK/m1lqcE0vXXGzM0/RAMxUR1USvVY
	 tG+JxZm9i321M0h0Rph/o7hHO3DXmZmANaso0ZLPRnZemT1BMO8tlRUdJEbUcGqyzl/Ok
	 sgHYcm3ffTtOtZ1CrtJ6IzTqPFrVOyAc9sYYfzeITvZ2dg6yocDVuKLn/AxWGT68yarV+
	 itmS3UbeGNXD4hKoak3Eca5EQGeEE1o/FCgf0V8rKBV+jQxLZpuj+KoMHFO7+FvNkDA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795128015;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GZbJnJrsQpQ1xMshKqNDWW4gqUaaunYDWTGTeENGsfA=;
	b=Ndbk3t3yJwBnBZGNzCwffa6ubQgwYrZaryCLYE7wWqh7M2SYUafLdKQ4MYGoY9vUN3Yx
	 vXigm2oStOAT6Ah+EYICg9RwBPDeAE3vjeW17mt2pJS8TuHMWbBPfAdljeBjiRq8KnCSq
	 pKBu9DlYopaEaMymaM1TtOqYBX1DsCzRl+7nx6CFpzcmTasHuOgPSTkYhOY8rM2mqAkyQ
	 dmAXdflg3i111nCV5MisFi3sTDLxoHgxUR6f+A6ZTvTVu2duyoDFLO5KaD4csro2SevTL
	 lBvjGFghl4orAnVCEvoeEudzrbDcQemcG/FSCINWp+PapYNDALAAmCngXPdcI8QQIKA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 218491F000E0;
	Thu, 19 Nov 2026 22:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795128015;
	bh=GZbJnJrsQpQ1xMshKqNDWW4gqUaaunYDWTGTeENGsfA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=H8sF9/JjvDYhG5duyuo5edkb6z+EHK6wZk6/tBKJt/7j1AZSgZ5zyvEW2+a+sg6IQ
	 cTF2NGMFyF7TZ4hsEDYSqBqH7z42kmkv0eWwXINe+0ExUjElC1HqXmvnz2lnY1V6Dz
	 GoIBN7NSahCUIeSb+x2OB+LQUtWMOEc2KDKGXT5efa/OIAPwGzJbfo348wBjhdse7f
	 UvuGDBL0p4n1uFjF30TRSbOEsWjHQjj8ocNqr0odGGSdtFem7qwBPZ3vx3k05IFjkd
	 /7+4D/NAtHhpEJLLvX2WuCtvg459L3k1x8bf4tpjSzKGP8d4DyiaGqkaOgyIUPisFV
	 6iT9WEzM0Oo1w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3A33A422DE;
	Thu, 19 Nov 2026 22:40:14 +0000 (UTC)
From: Nizat Mikayilli via B4 Relay <devnull+nacht.dxdmail.cc@kernel.org>
Date: Thu, 19 Nov 2026 23:40:09 +0100
Subject: [PATCH 6/6] arm64: dts: qcom: sm8550-samsung-gts9wifi: Add battery
 fuel gauge
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
Message-Id: <20261119-b4-gts9wifi-followups-v1-6-2e2388589a62@dxdmail.cc>
References: <20261119-b4-gts9wifi-followups-v1-0-2e2388589a62@dxdmail.cc>
In-Reply-To: <20261119-b4-gts9wifi-followups-v1-0-2e2388589a62@dxdmail.cc>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nizat Mikayilli <nacht@dxdmail.cc>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795128013; l=1170;
 i=nacht@dxdmail.cc; s=20261004; h=from:subject:message-id;
 bh=SC0fR7IdkPE9KI0mhNhppX3NRSeVztJ4Sg+R3uWJmHM=;
 b=rUTWbpFzV8ibiDY7TqHYTQe09CIeutNAS64fOQk3yhCmxPEFhE9Zo4f7Sq2KSzrQy9OQciSTj
 N+dsVkDNZ/ACzee0eN6Zdm0AFtnMYoL5r78K7+igiZWRJcjFUYbBZU7
X-Developer-Key: i=nacht@dxdmail.cc; a=ed25519;
 pk=Kay3P3pOJq5klUD+0/I8QX8JGOh0CeQXEwRVv7CMm4k=
X-Endpoint-Received: by B4 Relay for nacht@dxdmail.cc/20261004 with
 auth_id=1111
X-Original-From: Nizat Mikayilli <nacht@dxdmail.cc>
Reply-To: nacht@dxdmail.cc
Content-Transfer-Encoding: 7bit

From: Nizat Mikayilli <nacht@dxdmail.cc>

Describe the Silicon Mitus SM5714 fuel gauge on I2C hub 8 and the
built-in 8400 mAh battery it monitors.

Signed-off-by: Nizat Mikayilli <nacht@dxdmail.cc>
---
 arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts b/arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts
index 8323eb837710..511bdd05d49b 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts
@@ -31,6 +31,12 @@ aliases {
 		serial1 = &uart14;
 	};
 
+	battery: battery {
+		compatible = "simple-battery";
+		device-chemistry = "lithium-ion";
+		charge-full-design-microamp-hours = <8400000>;
+	};
+
 	chosen {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -604,6 +610,18 @@ cirrus,gpio-ctrl2 {
 	};
 };
 
+&i2c_hub_8 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	fuel-gauge@71 {
+		compatible = "siliconmitus,sm5714-fuel-gauge";
+		reg = <0x71>;
+		monitored-battery = <&battery>;
+	};
+};
+
 &i2c_master_hub_0 {
 	status = "okay";
 };

-- 
2.56.1


