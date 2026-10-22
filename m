Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792704050;
	b=lCS3lMHltJ/nZVn22ivJ55VlR4SbjDNgOAzedxUnr6DR1+JFGRfvde+2X1OQ77Ee0Jxf
	 vMcwZ01fLn9SnTas51czi9qiFNdbI7t+9a+HpKvdG06lWXaVsMm43rE5O5Orh0uzWMPPC
	 z8KZVHHFhebvxGC1Q2pJk8z++jUC9gdcvLWkozhBwoSpcXT/hyoo1R1YY5Cugsl4BHtyx
	 V1SfCpQ5ZdgK6y6Dw47OG+jXvIZ34CJwuz56uAgDluQz/Nhr8VR4wvQwqLhSWKVCMjzlV
	 Unq2lP7DUfCknC+6XKTt/p9u6xbjccbQzpTDbXKR16XdGSkxI54IfPCSXDOzNvQ3BrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792704050;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Date:
	 Subject:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=80wrSG/B3VGkS+ZZcthzUgcL0p6ipfvHuu8TjHdZlpk=;
	b=B7i0DTTHeFpZfnEEm41aS60JxBtMIhV42Oz0j7u8lq9Kkqzouk0tlm/qRJQKdAHTnBJe
	 7bg8Il6PtHKRIGxZir7TruEPIuPFFLOIPZImOCCapUDhF3yHYd+ggpAS2GYvPOaJohve8
	 xZ1Okr/4Pf1ALmUqKQPn2v3hdLyUPblm5sgNTgHCAmkX6n9f1YGg5IU5M1fpx4OYipgw2
	 5xZOMm6VvFYDiLoOxkjaKZg3dPLYMDhJUeOZrSZPZUDyY5LmiqkQxu5k7UYGigAPVaaAk
	 Frt3NHjTmsEWdDPJKGt9Tmd3CcE9xmgAT3Qg9ns3qpDKlofOkNWB+hshFqOP+HX3+mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=I1Lg6isB;
	arc=none smtp.remote-ip=79.135.106.113
Received: from mail-106113.protonmail.ch (mail-106113.protonmail.ch [79.135.106.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D66606A324
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 21:20:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42D66606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=I1Lg6isB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1792704043; x=1792963243;
	bh=80wrSG/B3VGkS+ZZcthzUgcL0p6ipfvHuu8TjHdZlpk=;
	h=From:To:Cc:Date:Subject:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=I1Lg6isBhZlphlQ3vltRNAJlyhjxdVfv07YFnWURqYMETlcmVW/9GQYUlSxyYHuv0
	 i3owUd8c1lmcV9aa9HJkbPUsrHNq+IoHkeXsvD6cc+WkzLQeejdQRmlEpV5BJo48Uv
	 XFDnkR/a+crx7rw9dMy+ADuVqXvq5oN2+9v5RDyNjw+5OHHomp78uHIF89NI/SJ0sL
	 jTYUkOH+Q9MJ4X6GBUs9o2VMBpJ2vhE9mhtuoUAuXECRTY4E7CxJRkruZ2wJc80zrL
	 V/YrdwGsutTVcBR8Swtafd4Jf3qAljcwmMpe6MW0xdbA9QVKg7VJPUU9fZBmhJqt0T
	 +7NsQy+i4GJsw==
X-Pm-Submission-Id: 4j9fFj4nLyz1DF5J
From: Michael McAllister <me@michaelmcallister.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 22 Oct 2026 21:39:43 +0100
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Add Motorola Moto G10
Message-ID: <3878c144a3adef2b734e660d0870fa3488d36570.1792703903.git.me@michaelmcallister.org>
In-Reply-To: <cover.1792703903.git.me@michaelmcallister.org>
References: <cover.1792703903.git.me@michaelmcallister.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Document the Motorola Moto G10 (capri), a smartphone based on the
Qualcomm Snapdragon 460 (SM4250).

Signed-off-by: Michael McAllister <me@michaelmcallister.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce..963fd482be 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1051,6 +1051,7 @@ properties:
 
       - items:
           - enum:
+              - motorola,capri
               - oneplus,billie2
           - const: qcom,sm4250
 
