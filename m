Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E09404BFB;
	Wed, 10 Jun 2026 11:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781091859; cv=none; b=D0fh/WfKKdRC8ZMgiMgU+OAJrwPmo4eeWH0l2rhocLEZenAm5Nq54VRAxOHgqfFECIDuf9e1xckM9ZDhKjExz1CyIxs/pTdB4xU+fqB91oBAZqzNobgNTgt4fKetkMRBGDotAai+yRE7gBDT0cMf8WfofDPKjbhIHlBWncQEleA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781091859; c=relaxed/simple;
	bh=c9zVqc+Dg0vMNXViG49tyap+X0Kh/Gcx0gmpuuGB2S8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ntnbXdbkz6VQUD2AZaqNBOHUSO9R1q1AKfAn/V96/B6mwcdsKZPPNK5DsOv6jw69Y5iy0Z212VXy5RfflVJsAE4rySYFcFNbpTSfxyiJcYC1/6uq/MAZGrcHAyiP65j3VMUQAly03+DnEYG39tFnnjiGkt+OmhtozugU7sVxsqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NQkonQ6R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NQkonQ6R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A61D1F00893;
	Wed, 10 Jun 2026 11:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781091853;
	bh=eRJvBOXJ/Qv5JJo142rYyyMf3WPgC0W2vX9VVYiXlhI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NQkonQ6RlavGI/5D5JoMtQ++jj4sGflaqKGJqQJiZ1k3QkbFXcXVB/437qK5Wwy8p
	 NjgxTUp2Iajww3c3ptVtURaB57bQCfm89gsBPRjIu/oL8mHsYc49wpzl+5t53ZZq5N
	 nZFamnI1h3wKcMBWEN3JpILiO47QOXwFnUZzNydJIzhM12YrBxWU1xmNVbiuul9msv
	 iWJfOOCg+W5Sa1LZuC75AHW0dgVXKf7vzJejrPD2RewjNZkAKUB1uzv7bN9IEl6oUn
	 zF3yFG3Qw36EmQPULMQyuR2MPe9ji7YXfkjMjfPoxYd1FRAT7VoQUNnd49HI2ipCkB
	 upY3XLWfaY0kw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 10 Jun 2026 13:43:50 +0200
Subject: [PATCH 5/5] arm64: dts: qcom: talos-evk-som: Fix BT RFA supply
 name
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-topic-june26_dts_fixes-v1-5-2e0c953a6c08@oss.qualcomm.com>
References: <20260610-topic-june26_dts_fixes-v1-0-2e0c953a6c08@oss.qualcomm.com>
In-Reply-To: <20260610-topic-june26_dts_fixes-v1-0-2e0c953a6c08@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca@lucaweiss.eu>, Gabriela David <ultracoolguy@disroot.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781091829; l=752;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=nEE1IHsqEXA3r32tvW6HQEnG8rfUgsSym0NIWAlgBVw=;
 b=eyrjCyRKRKpiC7v+2JPST/f27erblO+cPk9F4WL77EakiK+a0gUAsJ7RdnsgdtdUDM4Z++ue7
 l4qENEMKncLC8Wp9y5TNiO8allW189SYzVA4erBTUfU+2vdSYhjzTSh
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Fix up the supply name to align with bindings.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
index 294354c034c3..93e08e141dfb 100644
--- a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
@@ -527,7 +527,7 @@ bluetooth {
 		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
 		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
 		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
-		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
 	};
 };
 

-- 
2.54.0

