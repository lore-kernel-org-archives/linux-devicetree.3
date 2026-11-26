Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795680851;
	b=brrxPLxgLbgCw3Xpl639kcUaTsNwgwb6ANSKPIemQwg3ddP2ESPJPXy0Rx6wT0d83UdX
	 tWhh8LHHTmuuYnG7z2TmQJpnCz/ecHXvpj6DKIIHY3wOssOWCwKQXxKbRZHHMFqgiFO7z
	 y+jNmhDtyixah7JPfn4LmqAtl5lglC1qMyETrp6qcnyJZGp8NIYXUiL8LuNhSFXCDRoTa
	 lhqX5+dwfojyMZfb9nbSRr/uTVIQoCIaTuA8B+iDQ8wqRE+jD8M1uDjvZNSVk1JiD6Bb/
	 +tMLasIL11hZRgwwbEpwgsLZHUHquPY9o0cd2A8spjcy1ItMVqdbGBcXAFOGBTBhicw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680851;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=huqWM0eo0fyX26dQJHUvYM8kb6xLmmHqJZknA1XlnBI=;
	b=qGamMa/dAmg+ZVPaqZXcIa56PQfp1KEr/kf6DrcDfW0cgd03ncFJapADkZPBpuNviWpL
	 eRtgxuSHmzeD/386ihxbSptVwA7q+5JiT7wctmgjCXHa0Uqir5adPFWwj6dNTa2lnx0PJ
	 Z9i/gG35XOuaClpAVPhm9Xr8mD/jRMIwc+785oPy8x+2BhTROTTxihpAChdnuI0k5biut
	 4g/O24/xYpCQbqLNF/Xwj0ViQELqYZYKiR0cgTM9WFlK9QjYb/TW4KHEXbXtDwRwuMsEH
	 oGAqUdcxLSui3z3C6MLzqmReDmFQfLNDPNv+7QtbjF3IxO+Pc40hQoa9rNMpI5OioyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eax1i2c1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14730606A321;
	Thu, 26 Nov 2026 08:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eax1i2c1
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795680850;
	b=W3PQtRonekxWOVZOoFHxfqcYxYccSf8VHwclQhuUD7F2bTfMsD3vM/DBrgmUxra2qy20
	 mfyath2AxNcOd1rEoKIoHX9iYk12n5uD+W/ECBJQzpfQN5KQL0xWyCz40Tdo+SEW2oWpD
	 v/Pegn1V0OrhrpJ4p25E0Dmr8pQ4B+2GhsZpDvy59ChSDJsX/3Xl6mNgu+fxA7omOL1/N
	 rb14JZ7ZFM4baV/v/GHxWUBvsDm1PIiwgSuJfoR/GjiQu82zy/df9ViEvku8AhVdA8QVl
	 3FePh/mj2bIWR6Z+mqBXAN6kdJr4NAgAehtrjwoqfkVm+0o13BOv44SM5CKJHXgqB+Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795680850;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=huqWM0eo0fyX26dQJHUvYM8kb6xLmmHqJZknA1XlnBI=;
	b=UgesoyPYSga95dN5nSas6ZPy8kEC8lksk/5FHy8MXU0AedEg7cWenjHyEwXXRKyOo7kl
	 LSMfPDKTB3PLrTKS2e5ubvpnvPbs8nH/whJK5EKaBIAaWXpskRdQ2xGK3qbJEd33xSnSP
	 BNPv826ZVO88rHFhwg7aPJHFQ7pCKy2ew7xaga42T63frFne4Xe+MmmRGDwSFTf56685y
	 rNEFVODIoDIB1XP6r5cEPsXErBO83ivkJMsxDpkE3fS3hQdNLolEl7aoQGTg1uercuWHm
	 TulMwBhQB9JMIhprWWbCt2CpldQK5+DJxH+fIaF3XnZLER1KbJgEp4Pz4emWabWTDZQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A99881F000E1;
	Thu, 26 Nov 2026 08:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795680850;
	bh=huqWM0eo0fyX26dQJHUvYM8kb6xLmmHqJZknA1XlnBI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=eax1i2c196w9D4jYYrnIzZBTu8/Rn5Ii3lFWCS+uuIKAudBa7G60vPgLmgh34PB0c
	 gGSln4w31I29gET9uG0kOsOQgrktc8toIn3NDeUKRDUTS1nx+ohRuaFzqJujZaJmUk
	 z1Ql0Ek1KXPODyVPqdGUcIDnn5siJuhk5pGR1plFh7Ueg05AjhnBOY86R2Pnus2qL6
	 jiDTEUnbCEMRFKnWTCDvCWJh7Nu+POxiT+Iodi9kn+Iv0WJpkcqJWPWYDGFKJWCwBs
	 foL0PWRtxsMLXkuwwyh9jDB9Y2HI/tFOhqYp7raC2sx1fuLFSw1CEjm2y9NfsOMZw6
	 TMCVwPb7nOZcQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 36C154D2EE;
	Thu, 26 Nov 2026 08:14:05 +0000 (UTC)
From: Robert Ijtsma via B4 Relay <devnull+robertijtsma.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 09:14:05 +0100
Subject: [PATCH net-next v2 1/3] dt-bindings: net: qcom,ipa: add
 qcom,sc8180x-ipa compatible
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
Message-Id: <20261126-qcom-ipa-sc8180x-v2-1-89eba621da95@gmail.com>
References: <20261126-qcom-ipa-sc8180x-v2-0-89eba621da95@gmail.com>
In-Reply-To: <20261126-qcom-ipa-sc8180x-v2-0-89eba621da95@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Robert Ijtsma <robertijtsma@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795680844; l=911;
 i=robertijtsma@gmail.com; s=20261122; h=from:subject:message-id;
 bh=Zda+9Ammsc4s6lMXOWoTtjkZ/oA5KShVVsCnmBZdGAo=;
 b=I40e9SfuC+UdZBZLKwNCpF9MbOPhueCs93NphBRuYb6USVNiQaO/L3nOJhJ4Sj/u4o873DA3L
 BZHwwh72z74CLVsV7IH/QcJk/F3TwPAYyHqnSAhiKUZ34CUtCP3g1GG
X-Developer-Key: i=robertijtsma@gmail.com; a=ed25519;
 pk=qiDyKVqFicxFIR5sB5m+p9SWPKL2/+mMoiQnUx0C9P0=
X-Endpoint-Received: by B4 Relay for robertijtsma@gmail.com/20261122 with
 auth_id=1604
X-Original-From: Robert Ijtsma <robertijtsma@gmail.com>
Reply-To: robertijtsma@gmail.com
Content-Transfer-Encoding: 7bit

From: Robert Ijtsma <robertijtsma@gmail.com>

Document the Qualcomm SC8180X (IPA v4.1) compatible string in the
Qualcomm IPA binding.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
---
 Documentation/devicetree/bindings/net/qcom,ipa.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
index 38e3830512feb375572c8801e06fbb97c33d9d89..99e5464dc47e53514dc8012ecd06654789ef6019 100644
--- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
@@ -48,6 +48,7 @@ properties:
           - qcom,msm8998-ipa
           - qcom,sc7180-ipa
           - qcom,sc7280-ipa
+          - qcom,sc8180x-ipa
           - qcom,sdm845-ipa
           - qcom,sdx55-ipa
           - qcom,sdx65-ipa

-- 
2.47.3


