Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93913A901C;
	Sat,  4 Apr 2026 09:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775296273; cv=none; b=d+2qTFJocuL5SXHOHaG2E2vdYQVvxXfZd+9Rzwnkpe9pdHnizIPHWhA/n9BO0Kfc2dhjtVBnnaSV/yZVS9RZXD6XXGtzByPmazKhVtKT2Mq4hU502SEqf4B77sxdMgY2dLI/78jte3WiOyhOunMpKUqFgM1c3Jde/RTatSmGTa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775296273; c=relaxed/simple;
	bh=YhzONHcHnPtcdh0oJCQOSgrpKU4uyFrSXxBNxGXJ9Hg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BuGNG5rzHmGaSHLTkFBAV0fTKVs9iYLa4MOT1+E0gnmET2ABtG6GCgOpp/wTROJ1igeQqn4c4hPSb+VcxUGcHqLeHrogBHqQLw/01zohwxcCy77NS0OzifKn+rCin/JJRdEAWnaNQLNVAtGghtI/J0zQfm1pOG1KZS6Qp1SEQdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NgsqiTau; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NgsqiTau"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 95916C2BCB0;
	Sat,  4 Apr 2026 09:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775296273;
	bh=YhzONHcHnPtcdh0oJCQOSgrpKU4uyFrSXxBNxGXJ9Hg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NgsqiTaudFNsHsj44QWNue9B35JUIrA5LPJEyQXiLzUbzVYuHy2YujvlPzr0qTKNK
	 33+uXEz6V/WsFpQH/wViYpi+zdy+O930GjThoOOml8SCuKB5gXsaG3BPeBexzA/Al2
	 nF2fRzr2hxlMaMg8IYfKWb42O/tLlp6BYOsF79b/e/S+lOXFIR7IqNp2zQKOY6quSx
	 Yx+ELyye0g4DY1I9wN8uFhT5+pVzXDSFQ2cVo7nrn362cHRyfVM2s+BVGuu4dOpl1x
	 67/U2kl+hTJ5+imbjXRS7mcDPDaUw3bdLwqjSteZWaqGshy/Bc0Njq36mpMzEwQ443
	 KSse4IDOJwMbQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AEC4E88D8B;
	Sat,  4 Apr 2026 09:51:13 +0000 (UTC)
From: Joe Sandom via B4 Relay <devnull+jsandom.axon.com@kernel.org>
Date: Sat, 04 Apr 2026 10:50:56 +0100
Subject: [PATCH 3/5] arm64: dts: qcom: sm8550-qrd: update PCIe port label
 reference
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260404-rb5gen2-dts-v1-3-895f8fc494fc@axon.com>
References: <20260404-rb5gen2-dts-v1-0-895f8fc494fc@axon.com>
In-Reply-To: <20260404-rb5gen2-dts-v1-0-895f8fc494fc@axon.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joe Sandom <jsandom@axon.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775296270; l=716;
 i=jsandom@axon.com; s=20260319; h=from:subject:message-id;
 bh=biasXB222hzEaLoXAD4N9CkWdtezEit9QdECECb0yUM=;
 b=NB1JN8WQ/Bx3FQNESndN4DFVm4b95WoTwn8wy/OjSS+N9jn1Vomh5e6wGWscmfQpmk02Xp6qN
 /Hf3CMNDwddAoTns434Ee4AHlyMOTdXJV3pTibRfj55BnMFlJUDU2OE
X-Developer-Key: i=jsandom@axon.com; a=ed25519;
 pk=Q/yflwj2WhkgBVTskrS9Vl5oScD0Bp3vTzDi+OxskTo=
X-Endpoint-Received: by B4 Relay for jsandom@axon.com/20260319 with
 auth_id=687
X-Original-From: Joe Sandom <jsandom@axon.com>
Reply-To: jsandom@axon.com

From: Joe Sandom <jsandom@axon.com>

Update the pcieport0 reference to pcie0_port0 to match the label
rename in sm8550.dtsi.

Signed-off-by: Joe Sandom <jsandom@axon.com>
---
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 2fb2e0be5e4c6b597f20f332cdf063daa2664205..cf63109ff7bf7b6fc827f108e22e82b8b04273c1 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -912,7 +912,7 @@ &pcie0 {
 	status = "okay";
 };
 
-&pcieport0 {
+&pcie0_port0 {
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;

-- 
2.34.1


