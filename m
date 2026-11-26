Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795700388;
	b=Mnikol6E8vx9mJzHvvUe75KwOdRfNGM/Vdwade9v/p4jZTUEX+b/LgqM90/6t85FtbCg
	 sTP0Uq56ZGJTbhOL8ahcnSksX8z1fAIb5i/EXG9qH9RY8H1s9Lurf8ta7oiDxMhlUe3mE
	 fetoVJK8AqzQBY/Ibdkj8WqVttKoHsGy3zl0lWDfcZp/JdCW9qflngKgauvumUX1Pmhsc
	 bCSnD42pzQy+lVnBvnPiPLCsyPY9qB2AIjbcWxQvIczi3x+gaw6lRT2JkZHZFyAW08Rou
	 jPYeoiPJwenCAQ9vscEbd2HRp4ewi6ZGl9NumvPl10fuvvjgt2ko5PkCSdERLvhmT4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700388;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=DBljaZx1Ie/yPOiJhFP1dRpPDFPXYbPsWXbK8agzgEc=;
	b=fLakoVFV12tNCjUIVZKI1USoTBeoOowzSUyRcetYH0HXVDv57TM8WkBipP+65Zbyj6AI
	 a5KDyH1D+NDVoHEahj5AGYeUNhkEmbcTOMZVwiM1tCZqAEP0M9vdVROWIxm+6SsQ5uYrq
	 jQRW341JS0IBBvtzCNd8YmkA/RHT7TojzWX/RazLBphEm7rwo2DuVGHvRt4Vt3n3FCp2Y
	 hi+vK8xyEd+uC8ZPdpHny3jPi99uLJQcnjcugot9mKdE6IZvkd4D6nYd3OJ5jWu7E2HSl
	 kmr786t6j5O+3Pz3+41H+IvG18sEMD8aZVWGHxTJHmsdioPSKtJ1121ZFvXufjBhpfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QtJNZ1WC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E892606A31E;
	Thu, 26 Nov 2026 13:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QtJNZ1WC
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795700388;
	b=L5Ev+zRhX5uTK/e1o1FOHe6kQWkJTetJNRnBJIZak0z6R0OfffsBY7fe25A9x1GXH8HU
	 thJeh38RpUdcPKlq94hiH97AJTWghz9+rWWlwp0S2bk6sM5OrsA7GPtyPE4xCPmAZDbjJ
	 It6jqGwA7wDsxJ927kNcs/bqZDPBeXmPIwZ0c/WIS9ILyFR+GRAvFcmsOmpzfCDkV1gcN
	 TRGqEdkSP0q9PRzcL/XWwBCxVlzLi9/Zwf4jrzi9SG3Tv5UIMpuQB68u1Ow2tFhi/FkVF
	 pRvfQtvQdehklu3MlkbwVkchdY/ZFP+GZQtS+cVq7yHM1/6xmaOG1PZlQsbUMEurlGg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795700388;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=DBljaZx1Ie/yPOiJhFP1dRpPDFPXYbPsWXbK8agzgEc=;
	b=j2BExsK3mtr+Rxb0jAI25ziKgHY77c8bwDP/TW14jPGXLavJ6lrCLty7IH8qHNbdar3Q
	 0fOqFrHPvV7AF6WF39n57xLnNcR5MTxXpzKyjP45LApy/Y+rqdtxIEAN3CLJy69XOGhRO
	 oVpwrlUF6pTzuYSItH7nYcgCrAXNog9zEHH0S5CI9a4gIMhMHQRgG5MYvT3TDnEcwfC+J
	 xScW7BNVwKOcobhJcvYA/G4AdaTX6wskzF3tRNwRfVtRG7KtGLOxYqLNfy1OSyM7KiVel
	 0FpNPHc3aA7rcUz7SklpfroKkbT/UU+CFh/Kc+d4fkGp+eVMwf6nhZTDChYJAWZjt9Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1F5211F000C6;
	Thu, 26 Nov 2026 13:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795700388;
	bh=DBljaZx1Ie/yPOiJhFP1dRpPDFPXYbPsWXbK8agzgEc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=QtJNZ1WCGvBIt5yhrXsBJx33X+LUthgUvQfOk1dJkYGJLpBOEWOxYKrFduISmCAmE
	 iyr1bBWQw+scw+9AefgLZbsgcRySu3ImfVzc/BSnNwV43Jww48jrA/C709L3Bxc1/l
	 B5xq+QpexNBdmlxqQvuvh72JLmoyFN0OdyMtmxyxbVPMICZpb/j1Gx+Vwl2nXQWqOR
	 CNb9EonN1FyFxqZksPf5dnV70LJxVqrp5WRm5qouyzDjDuE+doWClTOwF0NJAuKj/i
	 rNhqBJbjJBFWeZVGSEDzVI8eBIGjO2RsPqn7F6AH45tumbCia7qMVDwfVEZttuWJ9c
	 /H6ABSO8a5xqA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A562A4D51A;
	Thu, 26 Nov 2026 13:39:45 +0000 (UTC)
From: Robert Ijtsma via B4 Relay <devnull+robertijtsma.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 14:39:43 +0100
Subject: [PATCH v2 1/2] dt-bindings: sram: document qcom,sc8180x-imem
 compatible
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
Message-Id: <20261126-sc8180x-dts-ipa-v2-1-ad57b1be7c70@gmail.com>
References: <20261126-sc8180x-dts-ipa-v2-0-ad57b1be7c70@gmail.com>
In-Reply-To: <20261126-sc8180x-dts-ipa-v2-0-ad57b1be7c70@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Robert Ijtsma <robertijtsma@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795700384; l=808;
 i=robertijtsma@gmail.com; s=20261122; h=from:subject:message-id;
 bh=nEQ+cGLgYgPSg71wgECg22VaJoVFfq3rn8jYugnx5Uc=;
 b=vzd6mOxpsmnXG8ZyobOX8UTLgHOJrDa++9/EF08MRlgNK/3IxUv1tw5c9oRifO/xljKc5KMVT
 RM8TfTrD3P/D+hUwbGQBoNnk7fjp53r7xaoWkUFagvxAazo6rDczOlj
X-Developer-Key: i=robertijtsma@gmail.com; a=ed25519;
 pk=qiDyKVqFicxFIR5sB5m+p9SWPKL2/+mMoiQnUx0C9P0=
X-Endpoint-Received: by B4 Relay for robertijtsma@gmail.com/20261122 with
 auth_id=1604
X-Original-From: Robert Ijtsma <robertijtsma@gmail.com>
Reply-To: robertijtsma@gmail.com
Content-Transfer-Encoding: 7bit

From: Robert Ijtsma <robertijtsma@gmail.com>

Document the compatible string for the on-chip SRAM (IMEM) region on
Qualcomm SC8180X SoCs under the generic mmio-sram binding.

Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index 6ee0b14..a6353ab 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -42,6 +42,7 @@ properties:
         - qcom,maili-imem
         - qcom,milos-imem
         - qcom,rpm-msg-ram
+        - qcom,sc8180x-imem
         - qcom,shikra-imem
         - rockchip,rk3288-pmu-sram
         - samsung,exynos850-acpm-sram

-- 
2.56.0


