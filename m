Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9704F37C112;
	Fri,  1 May 2026 22:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777675856; cv=none; b=bD6oq6rR9iNSvjOmE5E8xNS56dsx7OmryMHWTQ+o2cmezssRZR7xi4ss6bMKs5HcEIC8oVXqxzgQxw4jxwXF/Emk2NXZiun3hJqHDv9ppgSYguC9UQ/ec3gD6lLdGu/jJqkcALALghDwOgnXa2ugWvsDDabeWZesE163IHeJZkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777675856; c=relaxed/simple;
	bh=DNgHtlNMFeLZZcnjfbOkjAjPInI/34SrkWeC1TkHIfs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iyqbWwvyPMCNcVXo8X6RkBvjRlVKSAB6P1JLtGaIDzFEq3UiF5pWEhtmP0DHBrDbzRvl/X9Wbb5Hvzr9WMQpF8U1zsG3XHk5+PPkDB1jhchNTNqIcVNkyYa6LXFpR72a7ryPOxQTzsGW6j3W13SdL6Z4o3fhIFO/Dce4Xzb7cFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oxrovrtC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oxrovrtC"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C89AC2BCC4;
	Fri,  1 May 2026 22:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777675856;
	bh=DNgHtlNMFeLZZcnjfbOkjAjPInI/34SrkWeC1TkHIfs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oxrovrtCjZ63upftv8gulYR5AWgc6MEG/6XBn2tPPiB60Byasc+S6j5WgyurJYLFx
	 5SfLJTaq/x3aN4wSZPb7cxco/A8dzgF/DJbWqQoOM3s5mJyyFfkhN5rVFglmXZDiR4
	 6/QMMBB8EYQReQhTaYbghoFK566kkeHA/qmmnDcTGHAQsXtysJ3tzM6nUIK1BcqqST
	 jk2XEr02eP8BRZPw5LeIAT73eWneg2lC2u5YSKAY2aqGKw1CZ+wWRQNMwncDks/v/V
	 zCEgYaE+Fc/85bG5XV3OR1AVQvjj1vMsmXqfUHSCzrlQP0TwKTZ3Z4xPcDGR+9sDo/
	 z3Q+kjYPM0bQQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D369CD3427;
	Fri,  1 May 2026 22:50:56 +0000 (UTC)
From: David Wales via B4 Relay <devnull+daviewales.disroot.org@kernel.org>
Date: Sat, 02 May 2026 08:50:17 +1000
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Add Motorola Moto G2 (2014)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260502-device-motorola-titan-mainline-v2-1-c791277c740a@disroot.org>
References: <20260502-device-motorola-titan-mainline-v2-0-c791277c740a@disroot.org>
In-Reply-To: <20260502-device-motorola-titan-mainline-v2-0-c791277c740a@disroot.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Wales <daviewales@disroot.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=801;
 i=daviewales@disroot.org; h=from:subject:message-id;
 bh=oFKMnqsDC3T2vvql9PrtiyhX6OueJR2YWdPHmaYDyKw=;
 b=owEBbQGS/pANAwAKAW1jV4FG9KFmAcsmYgBp9S5NSQdX2Kk5lmtIlf8pG45VGmpGZBDci7EZu
 ENP7CAm1HKJATMEAAEKAB0WIQTXikd3yUPmOPWSLPJtY1eBRvShZgUCafUuTQAKCRBtY1eBRvSh
 ZmaLB/9FKybEHHrH0cg2oqJYVxh7OS3p8nDTwoU/Zy52G6pb7yymlfWBy79dTnsILOy+AcrEC4d
 PTmwC8oRs1yFqmFMgYphY0I1LwIVa1ezK0oNeH+95dKs39Ph+fzVfqjvFVSuJtk0kPnAbgoF6ej
 qqtNiAlrp2gf5kgjpDRlThYrkmG9PQkacm/c5Jgt+bL7Wu0dceNZrcpDO9CzdrOAM1xPhobKHA0
 bdvpTl0W6JwBhWxks/yTjoETJD1CMF7OJ/1IgbLJIgetWJG/JO6ULa/fG2WzwuDEk9yVN/8/4Qn
 Y4bqPyBtg9tRt9/oz6YLw2QIYf8CRWbdrPlzL8FjlYMiXTnw
X-Developer-Key: i=daviewales@disroot.org; a=openpgp;
 fpr=8F5BAFB15444A769DC3B61684022B817D275D037
X-Endpoint-Received: by B4 Relay for daviewales@disroot.org/default with
 auth_id=737
X-Original-From: David Wales <daviewales@disroot.org>
Reply-To: daviewales@disroot.org

From: David Wales <daviewales@disroot.org>

Document the Motorola Moto G2 (2014), which is a smartphone based on the
Qualcomm MSM8226 SoC.

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
2.53.0


