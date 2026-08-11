Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2343E314B95;
	Tue, 11 Aug 2026 17:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786467805; cv=none; b=haS7s8D9ivxu1maueT0RaBca5o+h41ake2hAlRKBnn7Qi6vUMHjJb404l+Hf7AgGZb3ollLWh5KuU5hjbc2SPgEFU4UwggO9MHm7s+kN4FTz7K3VfGnYSJFOEQF0Y8Xn3cbZNqEvuHNWkprU/Odin77j0XSO4y7n0jE2JZ2qdFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786467805; c=relaxed/simple;
	bh=VP9cHkFP8tmLq/cBeJ2nQN57HXTW4Fzb7Ii3ZHYcGyw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=It+nJEHkwKKEOtM6JG6EHyXp4Z74o9lO7CXNYn5ilqzRmw3D/i8CJ93FItWwLmpNNCRFhE8xgyHK3vgr5eeDlJFgIY6beQ/X43+CzIYQxkA6q2lHV8p9JhUYnToZP4TptBMhLlll3smE0N1+KKf2HhqgagU3eDbnYOo8HanIOww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XV7P5E05; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XV7P5E05"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA43D1F00A3A;
	Tue, 11 Aug 2026 17:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786467803;
	bh=R7+SYlMBF01F6LVt2QHUIxWBhZCgFZwi08xjiut6eoo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=XV7P5E05kYPlhke/8MmWCKe4LvpoCbUHhX9zWNiK9VPiSpUhjtYNSjUlBlmHdvuHT
	 uFlgw3MNA+bFgsNn5kPkeqaOehXBDGCmdkPS9C92tTpmaeJYd+LsdXKGAQlEPNKPoE
	 zZ+1RvsDJ1zte5oy2g7EvobLXLEmSaXnARVfu557n5zLoZ0q3jp3m6G7WOujOqpMqf
	 7XrKrZieLTEaP8ksXXwk4vTzDksWc3ij12KFYaxHv/YI724WZbS5B5FrthyZQMFZB6
	 ycLI2e0Rdk9gyEEZIA6NAl71XCGD1l2lRpZ759iPgwiOcJche/XW15E5jF9C3shkR0
	 jP1V0HcrLyRGg==
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260730-glymur_linkmode_0731-v8-0-a455265ad8bf@oss.qualcomm.com>
References: <20260730-glymur_linkmode_0731-v8-0-a455265ad8bf@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v8 0/6] Add QMP PCIe Multi-PHY support
Message-Id: <178646779847.1081354.9443968795839438752.b4-ty@kernel.org>
Date: Tue, 11 Aug 2026 22:33:18 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 30 Jul 2026 22:13:49 -0700, Qiang Yu wrote:
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


