Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371372DEA8F
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 17:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778348352; cv=none; b=D0YNKsyaTqx5CpR6Tvty2hPul9ow5W24B4BspzBRnQRZowCP5j6B74PTX15IhgTJTvWCWIBOrFIZSUZoW/ptXjeROeyieMpPoxqYE15wwF2FmZ42DKg3H1Jk8gmP/cZouj4KFO+7ndpIVHew3GPWTEvpDPUy1yf4rJEuamEb5wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778348352; c=relaxed/simple;
	bh=fYXILq2sHTH4l65dF+0EzDOgcKBS45FOY4SjxnUwUWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gjMFW6+4+BhB7uAsD5BZgEws7IiJOtbb3N9AHZVLEHXC1fKXv80H2O2UUgM56DEwlmsIcQVQJ2fcmdT3I25YyPbyM6phhbn7rbBXy3i8ZAAAv7el2Fsh40EWJLhcugq+UdmNrwUpMqP2KjsjeWbYFy3SNiUxV/3IjDP9uQBTjhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jd7cmZ8b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jd7cmZ8b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B20DEC2BCB2;
	Sat,  9 May 2026 17:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778348352;
	bh=fYXILq2sHTH4l65dF+0EzDOgcKBS45FOY4SjxnUwUWc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Jd7cmZ8bFnCR4HitL36qY0WFHy4m5djgWocQqGSR9MsXIsg3PqA6ERpgsj6LTuPYp
	 odu/7qqgMQ+Z0fLWrQCZqaYml2tTb8bbazhE+VvN4bqGYNgE9x5GUXJFzcR8k8+VGX
	 VlrazGhSsNr8IrEWYJtI3JP3vER34ypCDSQbbY/Vi0cTMBn/nSRJFO+POfEWGdv5J0
	 OGuFN83PcjqSgJN/2Y418tuMF6y91Eexd9nws9USk+C0pBmGn48JzI2TpPo3xaHfLe
	 0HaU+BkxIbivktGJMAHIaDQ4qnmFJObKO3IiPH+ZSpvxrlYdK4GUcImoQRIRiJylvR
	 7AX4qFBxPEBHA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 09 May 2026 19:38:46 +0200
Subject: [PATCH 1/2] dt-bindings: arm64: dts: airoha: Add an7583 entry
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260509-airoha-7583-v1-1-e5ad085b258e@kernel.org>
References: <20260509-airoha-7583-v1-0-e5ad085b258e@kernel.org>
In-Reply-To: <20260509-airoha-7583-v1-0-e5ad085b258e@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.3

Introduce Airoha AN7583 entry in Airoha dts binding.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 Documentation/devicetree/bindings/arm/airoha.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/airoha.yaml b/Documentation/devicetree/bindings/arm/airoha.yaml
index 7c38c08dbf3f..6506c64af4f3 100644
--- a/Documentation/devicetree/bindings/arm/airoha.yaml
+++ b/Documentation/devicetree/bindings/arm/airoha.yaml
@@ -26,6 +26,10 @@ properties:
           - enum:
               - airoha,en7581-evb
           - const: airoha,en7581
+      - items:
+          - enum:
+              - airoha,an7583-evb
+          - const: airoha,an7583
 
 additionalProperties: true
 

-- 
2.54.0

