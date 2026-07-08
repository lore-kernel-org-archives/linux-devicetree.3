Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C8A221546;
	Wed,  8 Jul 2026 14:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522627; cv=none; b=r/a4vpZE7hncLGL+F8QjF9xVZdXsFg6jdNdfa5xyBc8jeuLRxovNAlTo/oui+DMN8kuGYzoOvolbwIC6aELdhk90nnz0cQkGNeEbpyHDna8vZcLAQxhQwDAsUBXvYMNI9F1cLesu9fKHpMFRdbUVHIazt0u7WBh39WWkBly84Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522627; c=relaxed/simple;
	bh=0/7Q7SOjOk1yCm8B4V/39JNT4+CBY/KVs2dhMdQKYE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UgCCz8AMzsvCknu6xCPl7wvtuKk014JUlKySd7BwS23umnqimATrgxBFGVqIIunYpnVocb9a8SsyE2hLogQVZLgb8oS5dtEg5DLhGyXcss5Op3yKSXXL82AUay4JSuAEXntdG4xym2vpF2Tn/ZSAZOc3o1Nky8AFToKnLKfOfoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EmHlQqrL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EmHlQqrL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A75F1F00A3E;
	Wed,  8 Jul 2026 14:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522626;
	bh=vOQKOnUlRi0Eys4keRgSEN2E6xi3jFOKzwm76WTc0wk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EmHlQqrLwt2KvkUXi7r3CT8Qx6rBhdDLEO9ZVHMR9HafhodXYA4q4HgxhrQMvMbft
	 LerVB7BvQGqua4CnECOaGTDbPMg0+d+HnXMjDg5ikHf5Br4+MHEstMN+biqTZ9IHWV
	 gASizcG7kAmeh7bcA6BjJwTDd3LH7SPSKbOfD2PmivzK9E3d6tuESHgs1ST6k9lCGy
	 dK8b1DfOMhCVmTScOTiEsnFgckz6NU7giTWrwRLEz8vcrle423kpMcetcGgERJLYMt
	 6tca1JcxgKnyY/FCAaZMUl6tbwnQdFLRNECP2TQQkpQoMsRNy5Ce+a9NyQnr5DuiJC
	 qzH7QgKg0o6Nw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/3] arm64: dts: qcom: Add Eliza CQS EVK support
Date: Wed,  8 Jul 2026 09:56:07 -0500
Message-ID: <178352261646.2235436.17862089371659762535.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260630-eliza-dts-qcs-evk-v4-0-18cbbdba6e7e@oss.qualcomm.com>
References: <20260630-eliza-dts-qcs-evk-v4-0-18cbbdba6e7e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 30 Jun 2026 10:22:39 +0300, Abel Vesa wrote:
> The Eliza EVK platform is built from a reusable base board and an
> Eliza System-on-Module. The base board provides connectors for external
> peripherals, while each SoM variant provides the SoC, PMICs, LPDDR, and
> eMMC.
> 
> Add support for the CQ7790S-based Eliza CQS EVK. The series introduces a
> CQS SoM DTSI with the board clocks, PMIC regulator supplies, ADSP
> firmware and eMMC wiring, then adds a common Eliza EVK DTSI and the final
> Eliza CQS EVK DTS that combines both pieces. It also documents both the
> CQS SoM and EVK compatibles.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: qcom: Document Eliza CQS SoM and its EVK board
      commit: c1186318ea9f991ca48f9cc46a260ee62f4890ab
[2/3] arm64: dts: qcom: Add Eliza CQS SoM platform
      commit: c20a13bdd4e57b54ef5a87ee3ef15277474891cb
[3/3] arm64: dts: qcom: Add Eliza CQS EVK board
      commit: 5e63ddfe1dd284a68aedc273f0342236944e62e2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
