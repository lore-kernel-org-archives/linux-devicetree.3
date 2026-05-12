Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D6A3C1978;
	Tue, 12 May 2026 20:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617409; cv=none; b=dDMMWKWic4EdPEoIO3k/NxcDMBBHOnSt5XrqaeJlFVEB/3M2Fo28AAVWRiPWyV0r5ixJMkOv+QP3RlYnzkSyB4RCfJq746/CugazVnHHN14Ez3867mPOWIsne5pSvCF/S06kLtigWh/Fn9CjtaEx/lQH97a+2nqAA7xpqA+Njb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617409; c=relaxed/simple;
	bh=tOzB3bU60pCLUisS4wacLD0TC6NbfISkd6ymRGzF7+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lBv3Bx4nNShcoJAsrkLP/jVTgw+MEZd9f7PvuheqMuy1KIx8dmw1OrtbUT54ikdtDT5CurlYKmyGz77Na6uZHUsFsWmXbuMxe/24PAQMD1D6fnmNbZGOCV2rh6rjTy3iz+nmA01ZVcs5hb5TAkZv87a9qG0qMGQZMuE4HEvus5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ItVROd3A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ItVROd3A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B262C2BCC7;
	Tue, 12 May 2026 20:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617409;
	bh=tOzB3bU60pCLUisS4wacLD0TC6NbfISkd6ymRGzF7+0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ItVROd3AadnFnFVzC8wAaxfUOXVc5KIeUl3wxCP6ykEShb97irWndh6FUCwUz0yuq
	 wsi1GX0ZzdH5BAGSdwrxkhICD0x4bV3M1pL+pt79pNbFvdsY1XRAYRbJ7KrDGmil4Z
	 QDze2/U5XrWvzC5PQvqfSs2btyeycrYURIC8XrDTHGXox10wcY1Rj+jItweKaqL31z
	 2Azohv16/uqs8SUP0fZuHiZC/exuxj4MuOc1IwqghwR1/0UqHMUUz0kzN5sE3pLmKI
	 L/Fhjd6L6aQkeMy/dbFv6rhE3f9jL2YCUPSzzEegFV3l4j0OxIS8WqeV51M85N9XU7
	 8Xdcd0U0+TVug==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: soc: qcom: qcom,pmic-glink: Document Eliza compatible
Date: Tue, 12 May 2026 15:22:41 -0500
Message-ID: <177861739354.1242344.11249481683773737305.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260504-eliza-bindings-pmic-glink-v2-1-d6b5397b7899@oss.qualcomm.com>
References: <20260504-eliza-bindings-pmic-glink-v2-1-d6b5397b7899@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 04 May 2026 18:53:33 +0300, Abel Vesa wrote:
> Document the compatible for the PMIC GLINK interface found on the
> Qualcomm Eliza SoC.
> 
> It is fully compatible with the one found on SM8550, so use that as
> fallback.
> 
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: soc: qcom: qcom,pmic-glink: Document Eliza compatible
      commit: a390203b7eb4dc67324cbae8e10d7adcaf9b2b4b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
