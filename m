Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F13F47ECD1;
	Tue,  5 May 2026 13:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777989130; cv=none; b=cLiL8zu++P9aS+8OgdcPGOcHVxFVEErx89E5xpm1G/Yy22wMUwnaF2xHLgGNYCf9d4ylIJJFYlSHpjgeaWpz2qsLNdcIT9IJyFrh3Xwwy8GpGOgI/FuhSR9li37T4NioBLpP/4lyy36bBmN9ZtqITK2wLgu0tF9PW21ZA69kjds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777989130; c=relaxed/simple;
	bh=AibvCBZ8Yr4YAy8YqBvl7h6bbfZ1zXprocEIa1dOlVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dmPqatNiAf2uLL90+FPZ7FKv8dYDzBczj4uWK3Sam6Fn5MHFv+RUf/fiAfPAM8qsIW5kH7qMjvwipVfO7153zUK/NwLlEiSDryYscsiFGm2Lpgi0Q3EZ4F9D5IXqeDswyv7mzfCVjYuEm0tYvRWiO8w3WkE9wCC5pmIfoRMR0h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VEMdwgua; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VEMdwgua"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B5FFC2BCC7;
	Tue,  5 May 2026 13:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777989130;
	bh=AibvCBZ8Yr4YAy8YqBvl7h6bbfZ1zXprocEIa1dOlVo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VEMdwgua53UZSKOt8mQg85X0Gc8h2OOeXgD9f7EIXCB5OXVzExinQvOen29CMSspG
	 cmVQKUbLKgf5kSooiAg7qltAcvgpgX7ZjTBVXTecAzthVkpZmu+dIFa1KIvpFwpAqg
	 odiNwAWQ76hlWjcZ4S3ihroh/dW+PlCZRlbPGIpMD/2m9DVK+ZlcqmZ2DSz3F/+9KD
	 7SfBvXguEZRLzs+4ClLHv2RE1UtVkz9C85xwEn648q0v3MXH/+W371rnhOvLKkqy6v
	 hBzoG36872ikYYg0PkZ7qVmQQJfzgbZthd362arkfKNSc4Zl/VtS5IxIOFgIh54V+U
	 yrSDWuoW7ne8g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4157AFF885A;
	Tue,  5 May 2026 13:52:10 +0000 (UTC)
From: David Wales via B4 Relay <devnull+daviewales.disroot.org@kernel.org>
Date: Tue, 05 May 2026 23:51:41 +1000
Subject: [PATCH v3 1/2] dt-bindings: arm: qcom: Add Motorola Moto G2 (2014)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-device-motorola-titan-mainline-v3-1-8fcfa280e5d0@disroot.org>
References: <20260505-device-motorola-titan-mainline-v3-0-8fcfa280e5d0@disroot.org>
In-Reply-To: <20260505-device-motorola-titan-mainline-v3-0-8fcfa280e5d0@disroot.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Wales <daviewales@disroot.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=871;
 i=daviewales@disroot.org; h=from:subject:message-id;
 bh=jBv/WRLzVN0AQTAYpLJKebbhWke/WqhwJrSIev0LDSE=;
 b=owEBbQGS/pANAwAKAW1jV4FG9KFmAcsmYgBp+fYIdOiKbh3PMOHt2cCqRxlOYmuueZDP5adnV
 6q1AUPHu/CJATMEAAEKAB0WIQTXikd3yUPmOPWSLPJtY1eBRvShZgUCafn2CAAKCRBtY1eBRvSh
 Ztn+B/sGWFPHU6DrQGrMnFoOVjMtU03LoDDL2FMM4H9wKVH7pNrgJErMLRnt4e9am/k+iOAnLRw
 XjB8XXPN0S0erQaTAmEnRFGJymCM/yp1UPA5iQCQ7dT5+EoztFudzrhcxXYVoSzVk07JKwgadY3
 rCwR24wLysYHu4g+mdK4K1pGN+8keRO0xk7FemG9KYxDxnZr0UEpFKhVUGzw8gvu3UzZHes7sAJ
 kYRzYdt5elcs2HINxjn4hoc4V6YpMRXLHMR5YPa9xDnJssrLCjAv36l0H2iNo4skV79GwYqgxqM
 sg9ZppCOXQaneGimU57y1DtVaZZ6UX6de4gQZyqINSs+nFB6
X-Developer-Key: i=daviewales@disroot.org; a=openpgp;
 fpr=8F5BAFB15444A769DC3B61684022B817D275D037
X-Endpoint-Received: by B4 Relay for daviewales@disroot.org/default with
 auth_id=737
X-Original-From: David Wales <daviewales@disroot.org>
Reply-To: daviewales@disroot.org

From: David Wales <daviewales@disroot.org>

Document the Motorola Moto G2 (2014), which is a smartphone based on the
Qualcomm MSM8226 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: David Wales <daviewales@disroot.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d48c625d3fc4..3dec521bfd11 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -72,6 +72,7 @@ properties:
               - microsoft,makepeace
               - microsoft,moneypenny
               - motorola,falcon
+              - motorola,titan
               - samsung,ms013g
               - samsung,s3ve3g
           - const: qcom,msm8226

-- 
2.54.0


