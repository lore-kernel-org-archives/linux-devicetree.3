Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9911736D51F;
	Wed, 22 Jul 2026 12:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784722364; cv=none; b=HPvu5F05JqxxytjmbawQ52ouIw2nC1OOaL356Ng2aocboCItxRap4k4VOlclZxk6/seq1B5kcyJOsCcX8pEDp4NEI5Ql0mjsSg5MebFTag2XUeGaKuyJjDb9JscColQX+fV4qQtNkefiyeWjX9oaiIooQ8yCLmTgfCjmIm8Ncc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784722364; c=relaxed/simple;
	bh=FTNxJkwiQJ7tuvSvNyuWkAUz4Qz2dWQ6BOkYo8BOCC8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=V5H0/ZD2FI/WUN37FTmgPlSh7TZ1JQsOIXG1l2cXIT9VEo7SSaME95AnPnpE3uBP2+nAMNzq0HE5yI0QVsSPSbyk/qlIQKMLNei6kUQWs/xRX+7z5yfZVznPPfR0iOminARrgW0El2I8aWyEkWjZEHJo/XSzZcaMohGPylztl8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RWd+2bVY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RWd+2bVY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81F121F00A3A;
	Wed, 22 Jul 2026 12:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784722363;
	bh=YgVuWaxT3B445chB97NRUqYb6AIPcqRb+nmPPPc1R6s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RWd+2bVY+NkWo862qDedl0L/92N6iBcjeApr9d3G/P1a23CIurX2GMJhqJfW4qB5R
	 6ZSSp0Q6UGP9Hm223+w6cxJOdX+aaFJ/n9U8GpcGioBURXaXNC2d2ztg7rXePCa/f6
	 z6d/RvSW++pdVuvCRH0oUj4R/ltxxfYz/E587/9rOzsd0odVK/d0eXXRWPVE3OhoH+
	 Eb1xqzyrMtUupwyDIyWp3GypNbhCYSqzlsG/7pWXTS+uQa4pa5YiF7oSgjIrInzaHO
	 Lz3vRhkySlQT4HccYqYAAP9unpPjsYUOOdPWNjOk1UGDM9ZyXUhWcksTQOF2olrhpw
	 kruP859T4fTAA==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>, 
 Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20260712-usb-shikra-phy-v6-v6-0-1b3e51bf1541@oss.qualcomm.com>
References: <20260712-usb-shikra-phy-v6-v6-0-1b3e51bf1541@oss.qualcomm.com>
Subject: Re: [PATCH v6 0/4] Add USB Phy driver and binding changes for
 Qualcomm Shikra SoC
Message-Id: <178472235911.252229.4302044215068298267.b4-ty@kernel.org>
Date: Wed, 22 Jul 2026 17:42:39 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Sun, 12 Jul 2026 20:58:33 +0530, Krishna Kurapati wrote:
> This series adds Driver and binding changes for USB Phys on Shikra.
> There are two USB controllers - One of them is SS capable and other is
> highspeed only capable.
> 
> Changes in v6:
> - Fix the minItems and maxItems for reset-names in qmp phy yaml
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: phy: qcom,qusb2: Document QUSB2 Phy for Shikra
      commit: 8d3f1d5ce02152044cd3fbae201e47742b957dfd
[2/4] dt-bindings: phy: qcs615-qmp-usb3dp: Add support for Shikra SoC
      commit: 49e3105844f8dbcb7f92567b77e9f3a0a802a433
[3/4] phy: qcom-qusb2: Add support for Shikra
      commit: 346121aed2866a62c57395689f021f97a532a749
[4/4] phy: qcom: qmp-usbc: Add qmp configuration for Shikra
      commit: edb7772bb3b5ebd5e8efacfaabaade643fc4b77b

Best regards,
-- 
~Vinod


