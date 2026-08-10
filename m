Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73EB34EF03;
	Mon, 10 Aug 2026 20:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786393596; cv=none; b=OlomP/xv5s0l9FCj/2acwJKEIH0f9jVykJLF1oY5FHMfnOTo6N9U8unO27FVMn6PkX9Ox4wRKcvcEafML+wLPzQ75kTLePSQ9/HSEm7UWewgWsOueIJ4i0sm4CP7NxFiXBX937ONgYO+pKzdLaM/SjzfpmxQ4lgvWRNaakJDSio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786393596; c=relaxed/simple;
	bh=+rRZGWkOPwgSd/A3Gd2WBWuoa56lNnyZ5hnzluMF+3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=I3LIT1eLNmt/66LVndJ04iIspmOXO0bW0HDwWR6Vpn6ncEo0oKgXsWy0+9gxeQHuwZNWHEKFdicNrnLV8UZ5LUu9R5BajjywaBqiwRPwINb9u6LG0XVFCrNPZdgALg+hecC7R3ETEZUcLeKo90wP4I0O3JZAzQ7dDIkCtzkD2XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B6zbm0Ww; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B6zbm0Ww"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 377BCC19425;
	Mon, 10 Aug 2026 20:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786393596;
	bh=+rRZGWkOPwgSd/A3Gd2WBWuoa56lNnyZ5hnzluMF+3I=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=B6zbm0WwgZG+zH0XtSyPcDPZGK59sqRXAeZE9H38zbCdef8DKtQmPNupikf1iLvj6
	 joLYzPcjAaOdRRU7zH0e0TCC1cUDuZhCY4oFBjrfD3vUKztA67BgV/sShkJaYg3EQO
	 tkyi9rfdV3Ur+KVeDVAH7+8IqjPlvI7kQGWZus0wBXLkqNcBPjRVN81Rr0dSGSxQtH
	 6fs9Xh4JOUbakqfLWiS6vmizTtlIzaPngJNAwzDIFBxt0iXummCI5LDffBT/vgPOaF
	 ydNHwSkscZiWNgveVdXmM2sxdEygIZT7NWqybd3tQaCWLYSAr8QzdCJZVnkPjTSmxt
	 u2W+/z+m231Gg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 109BAC5AD7B;
	Mon, 10 Aug 2026 20:26:36 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Mon, 10 Aug 2026 23:16:19 +0300
Subject: [PATCH] dt-bindings: gpu: arm,mali-utgard: add mt6572
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-6572-dt-mali-v1-1-fb908627bf23@protonmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC0MDXTNTcyPdlBLd3MScTF2LJEvjJENTy0SD5FQloJaCotS0zAqwcdG
 xEH5xaVJWanIJyAyl2loA1qQsdXAAAAA=
X-Change-ID: 20260810-6572-dt-mali-8b93b159a0ce
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786393594; l=1015;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=w9n8g0GvmLHdo4ZTDe8Qbd8jCW9LIeOjEpTJ03K8T3A=;
 b=Wl4b7fBK2XQcGb9Kc4Pqrn9gaLffzHfZKwfl+k10TPwS5Q3Y5WE+9SGFjVRrpTZpsY/d731yr
 uFMh1XUT+M7Bp5ULqe8NWew9WYkdx+wB/eRSn4u3ghdHyY5Eun7sMYb
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com

From: Roman Vivchar <rva333@protonmail.com>

Add a compatible string for the mt6572 Mali-400 MP1 GPU.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
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


