Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9507C456284;
	Tue, 11 Aug 2026 17:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786467829; cv=none; b=hSyEsG4wxgFtLs6uXF4uaHiPnW90qNmn8Wtxd3jlAdRNhL2pFwUA/JgqcMTZrc8vlJp/LGpIkNOfzwlZJBSs9gjOBwBqXpI216Dp6iofmWE8PcyRZQIfjVIxgC7lT8/ZceDorwTvwApABG05IcGkSW8i+V4t3fNVyf8dpS17kWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786467829; c=relaxed/simple;
	bh=w683Gg/LZbWerfcISG4w4728YpQxQpNXzNyDASHShcE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dMgjhpNLIKqXCefLvCa1vq0JsPObhlK1NaJloyG5iHenGlWbxVE4DmAnsU3PDlSeQSssvjULJXQoYUYmEVWpBO9F5wQwB9PkuRogTbJ8VpOC8TQOrrRqbFUv1dIS2cpv7WXPngzKNktyZmck1KXwDkA69vwLjRNnxeWJlaMG26E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PC4Mo+Kq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PC4Mo+Kq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03F791F00A3A;
	Tue, 11 Aug 2026 17:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786467824;
	bh=0BT4ZisNR0PpCyKwJW08nRlJ32F0v3BRiESx6zP347c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=PC4Mo+KqY+4zTzmkQudd3iCkap3WG23VfQuCeYXBLquC3kckEFPT3JRHCFzwaEHib
	 exdS2jyX4aPTM+ELrupwPy2Ef0xmUK6gQVagTBspchoXgiS00N647zP9BzTEJJodSR
	 XVVr1zVhrIRI92symD9QC3OsxLnC71kkT2gTzBUEnjWHcVSTlnNhKWAGJn6BLmIiAe
	 60Ri0wsOIbnBUFpgSULTjxN1q6jHH9AOh+h+icGs7M2V1EAordwaSanSmy6e1fcT22
	 kXNNQ7Jqd7VyuBmyz+IWjflXCiPnNAZIQvc6tBd+qZMDMui6tQdeHSaO00MrkxhLNB
	 VXHEFL60fhZcQ==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
In-Reply-To: <20260807-glymur_linkmode_0807-v9-0-dd1c7e236e29@oss.qualcomm.com>
References: <20260807-glymur_linkmode_0807-v9-0-dd1c7e236e29@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v9 0/6] Add QMP PCIe Multi-PHY support
Message-Id: <178646781857.1081354.13726226205330576102.b4-ty@kernel.org>
Date: Tue, 11 Aug 2026 22:33:38 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 07 Aug 2026 02:51:09 -0700, Qiang Yu wrote:
> Some QMP PCIe PHY hardware blocks can be configured through a link-mode
> register into different link topologies, such as a single wide link, or
> multiple independent narrower links (e.g. x8 or x4+x4 mode on the Glymur
> PCIe3 PHY).
> 
> Earlier revisions tried to extend the existing single-instance
> phy-qcom-qmp-pcie.c driver to cover this hardware. That added a large
> amount of conditional, multi-PHY logic to a driver whose data model
> assumes one PHY per node.
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: phy: qcom: Add Glymur QMP PCIe multiple link-mode PHY
      commit: 5619458024925b3a488f9046b3ab26647582b99f
[2/6] phy: qcom: qmp-pcie: Add QMP PCIe Multi-PHY driver
      commit: 1781be3c8a5ddf40f5f9e7b9dc32cc577d491062

Best regards,
-- 
~Vinod


