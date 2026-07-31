Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985B4353A9F;
	Fri, 31 Jul 2026 03:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785468286; cv=none; b=mVdijBplT+8N6YcHNm8TGTAA6NNGvDO9OnmV79F/iEK4VIU6YhQgVx0CyL9HEN8hMtzaF34YHXtOh62b3Yxc9Z4isWwVNLf+tIUUPONBIOSmUJVIQ31uhGLV++nlaiczmzarRfboy05nTxKs+TWTp/kCATPSOdulurds2qDU8FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785468286; c=relaxed/simple;
	bh=ridNyig9+bJIzSvOOmWeJjhwBHNegejgAT0aGMRkqhk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZQee3NdmpIx1RW8HPU47dkScwdP/oJv2hZ//fDdFmdmICMvSEOik9ZiFdHlqL9Wu6DhpaV9z7d1L5ZP4OwH+LHzX5mA8qNpcycXfd+EUK8c/cLLlOQ+jlj0pZf0seY8CcQIh6vkMhwsSAnaotQDmjrJEYzYNPG5nREwgnF3YF9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ld+bM7dt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ld+bM7dt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A352C1F000E9;
	Fri, 31 Jul 2026 03:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785468285;
	bh=HyQD3e601W+wLWWWsxClkXaIdfvaHmeabi1i6xd1vFU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ld+bM7dtnwDRN3HclG3edx0Ek6Fp7x2ACsXUHFWDII6YUn+IoCS7mGFz3lm07nP3p
	 HrmoxBWaN2oM5CjTPtB/pNdrDYSPwI9aYtUOk5cx6fi32NEVyN67zTgWEedAUUUlzH
	 aZttfUNjdqjc8ExUQ266KQiz7bPAMmGDF8kYrD2pnIU0QAfhhTKQKy3egM6D1vF6Dx
	 iGgQj2G6OJOw9u1LwWt1Nt+S9yhBQxj3FcNX3AHa5pbX9jZgy/1fmCZ95ztyjszP+J
	 KJgiyjLcchIBIsl5EY5Rr3no+WLaPxaZeifgVfjOm7EN6vJnvxV85wd5vocutIxhzz
	 HbFE8o500AiYQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: eliza-cqs-som: Add eUSB2 repeater supplies
Date: Thu, 30 Jul 2026 22:24:18 -0500
Message-ID: <178546826832.316815.10274780198899785584.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730-topic-eliza_som_eusb2-v1-1-288bcda1fee2@oss.qualcomm.com>
References: <20260730-topic-eliza_som_eusb2-v1-1-288bcda1fee2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 30 Jul 2026 11:23:57 +0200, Konrad Dybcio wrote:
> Hardware works better when it's powered. Wire up the associated
> regulators.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: eliza-cqs-som: Add eUSB2 repeater supplies
      commit: b3938d240803b2b114f19f8375493033376d5dba

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
