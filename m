Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795283769;
	b=h7TH14mIJM3Tpk9RdiGPASGDPOKCIQidqJ9ppEiP61XMBWQjklb4UXfsA9p+niSljI0S
	 RA+zbQOG/X05BKIj4I0yx1unqLd6qUWZMXoOqSDjBq5JGdUqYWes4T8+RPIfvAVklqgP9
	 QaiCl2qctRx/rh6/ekbJl9SHR77nURJE31rflFyAL9jiz/JwUpLzWBPD8v466HpDJsFC2
	 JUStbesrQX85E8gYtvvlkapzOCKkXaNQ/WmsG4NhpUroE3ENtdOkl/s5r3BavUj+5uLxe
	 BeNKxrL8TFwFXmXdVPjx2Xqz62Fh9Ghlt7bVboJtamHcK8BVXhzs5InW2Fq7o56mzcQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795283769;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=md8GbRzRNRYozgNCXp9C52wGnVSgk6I5/bfSCAjMp6I=;
	b=iqZZ2LIZZJWlUUx0gVHYGEAwoMa8NStKXqpEyZZ8jIHWiNFqPm7IS+/J22scZVkxb6Ff
	 OwxDo5iL+kZxzsUHq04jMMBagcQulgqghIv1HwBcd4j4g7hIxXSIhLmijsrcPvhFF07sO
	 Gf947ZHyif7BZyKcIN2796I9TgVfN5KJxlCG4gqS83yX1EqvdES83pvfX4v8kL65GvEUX
	 HHfbbWTH71ovO9l+22Zk/nAB9P8LVlfWpnmGoBwFCvsowjXWKp0suuh2PCeYiBl6pEWFR
	 MfGPAOj0WPQyF9COO0YaRSC8Om37hoEhWZvrsi5a55xm5yqEKReQx/P/epHrOa8RtyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Imk7jC9S;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E687B606A320;
	Sat, 21 Nov 2026 17:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Imk7jC9S
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795283768;
	b=O6+fmCkAjdi1VhJNVPqpmo6Gg+r2jd2IaGMY9w6TJSfVZjLKuPzn6EK6/dI7pyBtDC2u
	 m/W7icIjETwSpIcn5FqXpkFP9wzQKv9Z9Vn5EBVhPQmk9l51Ji34ayOdN9iNhIFInuZt9
	 e0uupMcmS+TaUFZQrkmzkYJhNE9kAq4muAU6HH4vugnImYIJklJs9GzxPfZ/O2AI3WXsO
	 ul9RkAOx7z2UsHjVGzgn36Itv8gj8s3xDDF8WwhJhg6AsOMwAh2bpPPo+lGPQV6iel5Zs
	 NtRdBcqjBuxQwiRL5JjP+2DnCIJgfJMhLgH+nmLFxvVksjLbTHkQwVlFyT+TlvVXkaw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795283768;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=md8GbRzRNRYozgNCXp9C52wGnVSgk6I5/bfSCAjMp6I=;
	b=lBfGKucgIAsxAZCzTS4ndulxyxE73cV9r2P+ApMAVrtLMW/dJisy8jPrQCD2ftcp2zps
	 /0liGNffMmTFXbBSJUrEzhXJyoo+S3hOTpq1nb6RNJcumC1rl9+ohG+FLgZ79MDWoujNK
	 epD6A5eLJF/RarNH2K9eEct3533uQ6Bki5uQUbmClORj01n+dJcLY1uSWfOsC4NHCcPbL
	 jDyo7wEOaqF6frAUEmjdVFHvQ2BSCBcxcwAHx0UfQD1JmaRmmNM2kXGHdTiXIdJPa6AXs
	 28EJ3eVoKavVuu4GR9xPAQVHzgbfMO2S5U81S0XNjk+vTR3fPZcpwGnmnkqM9IP7q2g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E37DD1F000C0;
	Sat, 21 Nov 2026 17:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795283768;
	bh=md8GbRzRNRYozgNCXp9C52wGnVSgk6I5/bfSCAjMp6I=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=Imk7jC9SbEpGJAwppV5RF8Dt92jjD8SJkGQTV+kMeKAuXi+W4aLPugMl3WLw/t4yP
	 S4zNkXSYisDdPFjWxWO1z97GULzaLAg+mJyzZeX83GP+28skCB8SjbJ5JsWWI2uVsP
	 azMXROl5Y78ph4mZqpZ8QdY4V6a7/08RPZAteaahh/mvw/ptjGq94IzOopXNm5HFbv
	 9NIsYC8sTOYopPw0+dolB/xCa1T0HMcHKuojJk2WYIlT7W620UKcD+Wufd8vMDvZoR
	 xE6Uq+uGF1fvXNSdg+wOqH3uSkKxFPfeOSvEvT3GCUeHsh3vJc2U1SS08WjRmJFM35
	 g4SyRmf+wgfvQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 448ED4BD31;
	Sat, 21 Nov 2026 17:56:07 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Sat, 21 Nov 2026 19:55:54 +0200
Subject: [PATCH v2] dt-bindings: gpu: arm,mali-utgard: add mt6572
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
Message-Id: <20261121-6572-dt-mali-v2-1-1c3925ec7ad1@protonmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNyw6CMBBFf4XM2jFtCS9X/Idh0ZZBxgAlbSUaw
 r8LuHZ5knPPXSGQZwpwS1bwtHBgN+2gLgnYXk8PQm53BiVULkopMM8KhW3EUQ+MpalSI7NKC0u
 wT2ZPHb/P3L35cXiZJ9l4NA6j5xCd/5x/izy8P+lFosTOVKLMVWE6ldazd9FNo+bhat0IzbZtX
 z4eTkK/AAAA
X-Change-ID: 20260810-6572-dt-mali-8b93b159a0ce
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795283760; l=1233;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=yarHUuGiHB5XDU5bIl2bWj8HreokggBNwjoTqcPSgT4=;
 b=aJF+XCEDjuAMvu1RDuLpBiDhOE3GNfJOGS8hGr/Vthvh9jCrPLfytowdDMsZZYu2JMsUjnYUt
 jcgdVQwbtEkDUvOJi/KLujbbBe5DSGFPRFwrlMSUrdInKFA/Sh+RBPX
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com
Content-Transfer-Encoding: 7bit

From: Roman Vivchar <rva333@protonmail.com>

Add a compatible string for the mt6572 Mali-400 MP1 GPU.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
Changes in v2:
- Pick Krzysztof's ack, resend
- Link to v1: https://patch.msgid.link/20260810-6572-dt-mali-v1-1-fb908627bf23@protonmail.com
---
 Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
index c8d0d9192d92..6bdbab82126c 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
@@ -27,6 +27,7 @@ properties:
               - allwinner,sun8i-h3-mali
               - allwinner,sun8i-r40-mali
               - allwinner,sun50i-a64-mali
+              - mediatek,mt6572-mali
               - rockchip,rk3036-mali
               - rockchip,rk3066-mali
               - rockchip,rk3128-mali

---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260810-6572-dt-mali-8b93b159a0ce

Best regards,
--  
Roman Vivchar <rva333@protonmail.com>


