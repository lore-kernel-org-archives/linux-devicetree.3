Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05025DDCD;
	Sun, 10 May 2026 12:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778416305; cv=none; b=G4gGE8T4qKK8cOdc5UxfmPuOQdShv1hZParJiP3o9IvF3sHsHnal0H5c4fT2JOr4uT9NXzwAXYBUZfAKRejp8xgEutcU9rUYVBp4/EDghyHK3VD17AmpajaHLwXE+XC3/FuGafhNzXG0N+bJ4bjkI4L06hfnMhLIbUEhjR3tp1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778416305; c=relaxed/simple;
	bh=4sTIU6geCY/ofxbF1Nh9piJovvy17EjyERLoBxmWfXU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=shdMp3YpuiomlnFS/HD8AUMVbX+LcAQ5vZ6+6ZxKpfMS5+fYfl2q0zP2tc+r7p0luJ9AGhv7Bnm9t5kMJ8h2eTDs0gcdIu7GcraaxW5qGz5Vj35XhNtfnEtPST7KlPWokQtiXD7Ob16HyJc0gzNYQrOmXsad9w4+glI80h08XUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iwN6jy38; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iwN6jy38"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E04CBC2BCB8;
	Sun, 10 May 2026 12:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778416304;
	bh=4sTIU6geCY/ofxbF1Nh9piJovvy17EjyERLoBxmWfXU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iwN6jy38FZsJGhyHrd3rGfDNTGiQp/9tOIrvIHRK8/NOPNZLFYqnKAYMudEYwFesC
	 WqKhjTBM9MsbBOIkj7SQX2vWr4lBjnIlpETIUB65A1Vn8NXeiAYrg2inrHscyzQSMA
	 fb+PM0HqQitNTnq5uPzNakka+yA5SvHzBOShXVpRW8VhnA1eGnexRF1hqFw4oNoFtG
	 4/K3BOJhjE4VsfLy122sCWfYm+t37sbw0R0d+F3MtzZEBfZsTjqnIzC0fuAQRpLNAS
	 8t152qSjsT9S1hw3PtLncacqzc6jfUdyyykxejokl1/hagWZQEbr3JeeUEMCIi6pgf
	 6H7JbMmt55auQ==
From: Vinod Koul <vkoul@kernel.org>
To: SriNavmani A <srinavmani@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org
In-Reply-To: <20260504-axiado-ax3000-add-emmc-phy-driver-support-v3-0-3ab7eb45b0c5@axiado.com>
References: <20260504-axiado-ax3000-add-emmc-phy-driver-support-v3-0-3ab7eb45b0c5@axiado.com>
Subject: Re: (subset) [PATCH RESEND v3 0/4] Add eMMC PHY support for Axiado
 AX3000 SoC
Message-Id: <177841630053.434434.9292071839258247877.b4-ty@kernel.org>
Date: Sun, 10 May 2026 18:01:40 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 04 May 2026 09:38:31 +0800, Tzu-Hao Wei wrote:
> Axiado AX3000 SoC contains Arasan PHY which provides the interface to the
> HS200 eMMC controller.
> 
> This series includes:
> 1. Add bindings for Axiado AX3000 eMMC PHY
> 2. Add Axiado AX3000 eMMC phy driver
> 3. Update MAINTAINERS for the new driver
> 4. Update Axiado AX3000 device tree
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: phy: axiado,ax3000-emmc-phy: add Axiado eMMC PHY
      commit: 1a75ecefa4fbedefc1600e43445de4e1e7f03b55
[2/4] phy: axiado: add Axiado eMMC PHY driver
      commit: 9e7dfa4bcd4e2c3541c4ee954ea5e66edab94d3f
[3/4] MAINTAINERS: Add Axiado AX3000 eMMC PHY driver
      commit: 13ee293a904b7b7b0507aaa8c71f7be7e683800e

Best regards,
-- 
~Vinod


