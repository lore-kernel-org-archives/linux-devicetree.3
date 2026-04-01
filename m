Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9728D35949;
	Wed,  1 Apr 2026 02:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775010305; cv=none; b=emwwr7mkqoYoldU0QACreLWa3O5XAX9XTFDnV8GU5S0DRpl2841NRdPYgTaUEHnY/aHDwiCGGTDRQEg0O3a1HlQmzRM5tJ012syZty34Aja2G79sEqozmLUe+sbDo30xXOLN/ZN84/fz5umzRFN1y/ZILgBy7cq/BssL6qlSa+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775010305; c=relaxed/simple;
	bh=8POcrN5wnN5ByMKttfeFqnJNKqMVB9OcWP4HShvXOjU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JXb4Hs1jwFwseJggd59fgsdbZ6yV7lzauUD9meYNRkNV7/N1iU5tNSJ6X7lWz/qT831r9vYTeHxff+WVaDjf4xM4F7SngY4vCf0RIqPffak7rP8bCJr5Z8YXzvbKAQGk7bn7AXJlfrP0q0D/aoC4U+spQpywwkYkXykD8jw8ank=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=F6QHDS+g; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="F6QHDS+g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1775010302; x=1775269502;
	bh=sEQuisTUh50Um6C7iNonScow2WxqVdrBoPWXCIZYEbI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=F6QHDS+gUu/AdJ+vwj8NQHL6yoi8BX59z047eE830al/a68xiXbHpKDrbwBX8OUiS
	 /A7sj5tzehE1g422wMNvhKxYHAE86CmhFbWjkcgye6Msx6o3Tx9HzQ60wkFzysQQz/
	 EJqNzsvKeF0gDsYaFNbGYMmQwhrD6UNzv6ayW6WjJ3fmbCXzosXBXyzYnXcVpsLnqL
	 gAbP7CIemVDHaKEBHjcjbWLEp8DGgYhBRPDkLgKvG/Dw2EQiOPPfIQ0KEw6o4uvvQ1
	 7bnoMRP9H54IqqnUkkBPJHWCjLCABlBlbXbiTDHuUFPT9+cNChvs7jgFlHFJvlG8NV
	 d4EECjMGJBe+A==
Date: Wed, 01 Apr 2026 02:24:57 +0000
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 1/2] dt-bindings: nvmem: qfprom: Add Milos compatible
Message-ID: <20260331-milos-qfprom-v1-1-36017cc642db@pm.me>
In-Reply-To: <20260331-milos-qfprom-v1-0-36017cc642db@pm.me>
References: <20260331-milos-qfprom-v1-0-36017cc642db@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 24e40e4f8e8e8d0cf552c6cbc285bd4c7db75904
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Document compatible string for the QFPROM on Milos platform.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Doc=
umentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 839513d4b499..936878e74895 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -26,6 +26,7 @@ properties:
           - qcom,ipq8064-qfprom
           - qcom,ipq8074-qfprom
           - qcom,ipq9574-qfprom
+          - qcom,milos-qfprom
           - qcom,msm8226-qfprom
           - qcom,msm8916-qfprom
           - qcom,msm8917-qfprom

--=20
2.53.0


