Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92FD312819;
	Sat, 21 Mar 2026 17:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774112452; cv=none; b=DOvj/IqK2PtRN2Ud1QzK8oAwQOPLUtC8z8jaaxzEF4rK+2ncRETHjMjQwyOfSZdq/ghN8r9HMCfwdCopEPBgcS6/8IoVcfmL5SF3CoRRU1Wa/QJkwC334Zx+KzFlCntTMnMfDM9Y/6oCnAZcJCjRc4M22kN3kYVmbtsFtoS3qFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774112452; c=relaxed/simple;
	bh=hobaOBjZr7ejNOP/cYwFs9u2HqHg2t/KRRJWgbUGqcM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dqceIpQTyqPMW7jZYLB4ozpK0m3kzetxEy4hs0bR/bkTJ/AAOJDW5Xks1SRtUhKeL0tL/l49/fWEXv5n1/CHqELjMVUwknxO+EZ4NF++GrDD1h0hbzOr7I8jMkClWtKme+4vHDGwwm7eYYw+3Jv4UjK3u/UFtf23yyi4y+ucDdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=GKluxcCd; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="GKluxcCd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1774112446; x=1774371646;
	bh=cN0oaw2LZhH/2rsJo+CiYENhJZm5c0pRbOxhybO6ecM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=GKluxcCd8cScMOF7muat5K5JwyTS2vAyooM89ygKbiGYWJ21vOZbk4TMEwgQmTXJf
	 rK80431qLMWA7MTSNyrB3++ve8Aavbpt21p5Y4vqvUIQJC2X+i/OJTO4K6ktK2ZxL0
	 Lepy1mgUuF8FuL/40GihXSwSwQEE1LrsUFtusRQh1YVEAGbi1+dM6up9KiawFLp0rB
	 I1PKiNAgiGX6rSCkbBbpyfkX4rOYnhrCWgMa93tnpaevOCsRH6V8paAy0UXCcZJbAD
	 C7OUMB0f4UIDPTEragT+zxKgvXc40/aQ8aFgoL1XYVeyVhT9d8fvKFMkvO5WgvKBfx
	 +voilTeFuj8Fw==
Date: Sat, 21 Mar 2026 17:00:40 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 2/3] dt-bindings: arm: qcom: Add the Nothing Phone (3a)
Message-ID: <20260321-asteroids-v1-2-4b902901cb49@pm.me>
In-Reply-To: <20260321-asteroids-v1-0-4b902901cb49@pm.me>
References: <20260321-asteroids-v1-0-4b902901cb49@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 0e9812adad25ac0896d2fd15e10f2fb80d2ee38d
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Document the Milos-based Nothing Phone (3a) smartphone.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentatio=
n/devicetree/bindings/arm/qcom.yaml
index d48c625d3fc4..63b55a7fbdae 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -64,6 +64,7 @@ properties:
       - items:
           - enum:
               - fairphone,fp6
+              - nothing,asteroids
           - const: qcom,milos
=20
       - items:

--=20
2.53.0


