Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899FD33D6FD;
	Wed, 15 Apr 2026 09:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776246161; cv=none; b=feu2IOiaXjCMXm290qV1AhNF07jLdiYaDorqFFfvrlYufQVS/mIWaSO+rYVCYfI9HSECJXBslVA+JoA5EVVCcS1wLz0MhLOk0Bu5GItXiQDuvfttbkV7tbytwkfvf4W0B60vnclQ9UsUgIzuIdkQ5dMbmT1qQEvy7vZTKfFlDkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776246161; c=relaxed/simple;
	bh=bY/S4hu6X9QJewoEOT4tXALWwNKym1hBsseZvVMfhaA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ufqex8BvPcsbK8zDVhQVCP3cJYK+ROaX1UE8ZD9DLu711PF4L+XLXs0lPu+ZkjJqvR7MkheVsOSh1aOo8N9pyxTIP4FaUARt0w+EZJCIGrysN7h17aE0Mi5kPJt2/5ChWp5PCYzYH9zh5Lnz8NqP1TPyfTVwUs5XRPZupExtvZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=NIX54GiQ; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=WR/JgmL6; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="NIX54GiQ";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="WR/JgmL6"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1776246024; bh=rPQTV++r/ttt16dk20cYZPD
	5nj+WDYeqVAMFbghOh+k=; b=NIX54GiQ4GfPglpD+3w+3nh2bMtUU1Ih5V4IHjkD+1fY2vzTIy
	W2sfrJWkpK6LCyHAoS9ie9nyeLUaCQmesIJVjrHkQo7jGFhV8EEM27GFOIdWiGa6bAaNabZrhmr
	U6z5rAByM/mIM/Z+9x4LohT7oRIJMKtKGCUM/NgDR2gFJZC+jw3viYrM6fpa5NXCkaeTb+UprFY
	J4Zzj+eXTn+w4pnIqnXYVc8wUhLw9S3Zjlj0TLGcdvzI4bpjpEsctZ9QWif2igbVk51u9E9HjLi
	Uiphiyp5Eu0gspGWd8gJu8RbNAiGbL+mGOtqaigM/6dbMq6x44VDRD5jHUcPAJs6/SQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1776246024; bh=rPQTV++r/ttt16dk20cYZPD
	5nj+WDYeqVAMFbghOh+k=; b=WR/JgmL6DiQe71QhoAIcSZYcCvRPJm4bhQEP8k7s5G2rJ9WThC
	HfusK8QXR1KMBVuLNNryjWToL0/e4UztujAw==;
From: Nickolay Goppen <setotau@mainlining.org>
Subject: [PATCH 0/4] arm64: dts: qcom: sdm630/660 FastRPC fixes
Date: Wed, 15 Apr 2026 12:40:22 +0300
Message-Id: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-0-03b475b29554@mainlining.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAZd32kC/yWNQQrCMBBFr1Jm7cA0thG8iriIk6mO0DZmUhFK7
 26qmw/vL95bwSSrGJybFbK81XSeKrSHBvgRprugxsrgyHnq2h5fPI9ocfSekKMlDPsMwUpOjLE
 YDvrBSBxO/uio6wNUV8pS71/ncv2zLbencNnlsG1fy/7SvYkAAAA=
X-Change-ID: 20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-d0ca7632045a
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Nickolay Goppen <setotau@mainlining.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776246023; l=1055;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=bY/S4hu6X9QJewoEOT4tXALWwNKym1hBsseZvVMfhaA=;
 b=RFr81dRlKdSe42H3yBpDQj4fEZf2cXqOHf/X26M+kTJKZ0uKqzzu9QG6OgROxs9newDZoBGid
 3I+9FDp8EK5BlF0G1HnoTS4Gs0+H7RpQqwx1auATYDRwBDtzrSdJOGm
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

This series introduces fixes that make FastRPC on SDM660 work properly.
Currently only the calculator_example test passes on both ADSP and 
CDSP [1].
Also assign adsp_mem region to the ADSP's FastRPC node.

[1]: https://github.com/qualcomm/fastrpc/issues/269#issuecomment-4232125297

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
Nickolay Goppen (4):
      arm64: dts: qcom: sdm660: set cdsp compute-cbs' regs properly
      arm64: dts: qcom: sdm630: set adsp compute-cbs' regs properly
      arm64: dts: qcom: sdm630: describe adsp_mem region properly
      arm64: dts: qcom: sdm630: assign adsp_mem region to ADSP FastRPC node

 arch/arm64/boot/dts/qcom/sdm630.dtsi | 20 +++++++++++---------
 arch/arm64/boot/dts/qcom/sdm660.dtsi | 36 ++++++++++++++++++------------------
 2 files changed, 29 insertions(+), 27 deletions(-)
---
base-commit: e6efabc0afca02efa263aba533f35d90117ab283
change-id: 20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-d0ca7632045a

Best regards,
--  
Nickolay Goppen <setotau@mainlining.org>

