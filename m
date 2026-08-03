Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6878138B147;
	Mon,  3 Aug 2026 03:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785727476; cv=none; b=dycxVLFQ6FcsfE9whUBZSyix7uWbQmd6M8tu3QMB3CMSNbL4J9q74hZOReqhlAb42ZqIy35jR1/1jQhTltalqfhdTcXzhwg1T0SfczBm8dklgNlOoEYALNijwKICKWxVUIcMZG/6q4lmw5Pi8OfmwnCXao72BPdpdnLNjd5BdE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785727476; c=relaxed/simple;
	bh=J52LZoKwx/WttWGUHdFq2WK5D/1SwkuLcC4Qu6pLMLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TAzZ6+6wjnQC5E7nOtIhqWzrScGv01MFuffP8u/C+E9ayqixrL8JFQY2XRz9+GC4FXv/iEDxFl1t8DWGHHJ5JZ7xlUFLo1U1OdujKQ7WssV56cKEjgUpbETJ79sv6AI2w53plMLGEh6CCFkHyqMTOABOhusYA1DYNt1dyyfEcXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EmLTuWOn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EmLTuWOn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4D8F1F00A3A;
	Mon,  3 Aug 2026 03:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785727475;
	bh=lLQx0VBp7PfZd0B6c1DcMF3igsFD1WaDTJqxjKY1brA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EmLTuWOn9Y7Jp0yzEK/LYBkgzf3l5GJD04JTHoJT7PDXCRHq2blClLVHjZjz3TPai
	 X1Pysbpqqqs7Q0qToiDVNXSARvVVDxEAlW5Wem3VGRQz+3jfP9MBLnvTGiiBmfBv+f
	 C5eOzYbn+t0t1SEMfLrfu5NaVh5H9hPOZDT1ewEj+8t/ueX6/Zvu38coXvaNReYNMt
	 eYDlEW2jKSzcFlRJZBNktHkWbH6/Y7hnzdg+guZzJS4fWklyKn1vxbh4CLZUeepf6N
	 qCp+LZjKgShj8Q6VQCbslyaD/TT9sj0MyzyTvVNdrILdEFTuRiCIB1EyzJNXPyO1A0
	 jGILUK9FECAIA==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	William Bright <william.bright@imd-tec.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH v5 0/4] arm64: dts: qcom: Add IMDT QCS8550 SBC
Date: Sun,  2 Aug 2026 22:24:08 -0500
Message-ID: <178572744559.408250.17059013846909752468.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260723-imdt-qcs8550-sbc-rfc-v5-0-2fb988854623@imd-tec.com>
References: <20260723-imdt-qcs8550-sbc-rfc-v5-0-2fb988854623@imd-tec.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 23 Jul 2026 19:18:06 +0100, William Bright wrote:
> This patch series adds DT support for the IMD Technologies Ltd (IMDT)
> QCS8550 SBC and corresponding SoM. The SBC DTS supports the following
> hardware on the SBC:
> - USB3 (No DP alt-mode support)
> - SD card (SDHC2)
> - Regulators
> - M.2 Key-E (PCIE0)
> The SoM DTSI supports the following hardware:
> - PM8550 PMICs (similar to the SM8550-HDK)
> - QCS8550 and UFS
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: vendor-prefixes: Add IMDT
      commit: b4387e476fb2fdcc2c4697bd607833ea567db747
[2/4] dt-bindings: arm: qcom: Document IMDT QCS8550 SBC/SoM
      commit: d15c4f0eff1e7b6fc23ea2e37a32633642ce4b85

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
