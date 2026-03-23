Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529393ACA68
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 13:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774274109; cv=none; b=ZaiPJmJ4n3ngm5kh9WBlEKZpemw0rEULDFkELFSlOElyodX7YAfQhX/8pYfeBQz668gRjBN1yZuaeMEjdwtt66GiDEsdcT04K78b4ML7jH56MjSXlvllksKvt4IX0bVs4j5C7j1S3umjRB/MwB+/1eeU0lHG5lDkDOlmVTHGmKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774274109; c=relaxed/simple;
	bh=UEreFWWLBJFmuAItGcpZ6+qXRrOzHIy6NJZREzOyEiE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C3Uqm+rb9borjKsha1aKUDmhulm7oEEqQaoFMDoAfOdeDgc3VUeH2t2nM1TkeEjdWHjnUbyigUPnY00VS3zhKabHWUusGAmz7QmFjdbKZ+IOw2PPKiMPuL+Z6Udcur77jQ5Nt3Hk644UXL4LxhX9qP6OmSy7+lnAVLgtKA1gR1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=foC1RS1p; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="foC1RS1p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1774274100; x=1774533300;
	bh=+ZWa3YsogKXIEf9nJdsmauSQWEO86dinJQD1mqooGYY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=foC1RS1pbyuBdbxaP4H8ElDqck8m5msmyx4ZqTKCNYWrOQuNBtmnk3XRIyMmHXEK7
	 54uizq8yomxzPbag18+1GkBcBhtKTJe0mAlRaFJoQY3b78eTV7cAklUl40cSp5R4Yi
	 QQmbnZ1c5f14yF60R9Dogzboew4bF6VpXodL0Q6LClxNU8NgxD331sE/iQeZQ/NySI
	 XOcfIkkntShYI5jhAmxWjo6AYlVOh5foVKbEcV22OV8mw9zmMznpjXpM1ItTsYyZ8U
	 qGGKG3rgeJjkZY2B2lNDqCkk43MbUAW0unC2S2EvXtzaUMVsv9d4YmDq9Pxv3mzUQy
	 lrIN8LWV9V/eA==
Date: Mon, 23 Mar 2026 13:54:53 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Luca Weiss <luca.weiss@fairphone.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Alexander Koskovich <akoskovich@pm.me>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 2/3] dt-bindings: arm: qcom: Add the Nothing Phone (3a)
Message-ID: <20260323-asteroids-v2-2-1a35fa9e178a@pm.me>
In-Reply-To: <20260323-asteroids-v2-0-1a35fa9e178a@pm.me>
References: <20260323-asteroids-v2-0-1a35fa9e178a@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: d7eb4e224a96784ac3c4ac5098eba0780e4f4fb9
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Document the Milos-based Nothing Phone (3a) smartphone.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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


