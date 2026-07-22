Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46923414DDD;
	Wed, 22 Jul 2026 12:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784722368; cv=none; b=Go1iIEnkVkjgxGCIZPuAKlOf+iLBWaNhnfOj2L9qL/xAQjcCP9mHPlvsB/gNPrxW6XkvmZC7bAM1cW1EMMnsfwjKEuCEC4ehFtAsm/Ronz9APkh6uuWjWQkZoamGYyeJgP5lu+JKAOIXSzNNem3bJxoyngaEMVsbwDHaC91CyN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784722368; c=relaxed/simple;
	bh=9lyX3DKp1osWsoe1PKnazCmkT18VmzbrlU3QUR1sVRE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=I5sou3fnpLKXwTemKFlpKbhTLA4myl6WD6xJIjkQHoaNx2FsYqHMohPysK6XuaVfZvM4LFNvtFEwab+UBk5Jr/tlLBTemcf++o/WXhPizxVmnpEuNfSotxqfCp81JWMb94QBBqSItv2p1hRpYFm9du0sx/u3unbKttGyVjbE8qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RK68lArv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RK68lArv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA4231F000E9;
	Wed, 22 Jul 2026 12:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784722366;
	bh=kxy9IkJA1uRwp+6ROEfBzXi6wfRZUbHqNU5AuQ4hJ98=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RK68lArvyyOxxsGvJ7aZvhKAqBR+bsGrzN889gFTw+eX1IeY2+oLLQ8fOIbEnZo/T
	 /zLkLcv2Qz2/QqMvTyZakFw7ixsEcBwHY4Tfu54UHZki+0kHBdP3d0UG8w3l0xTS/v
	 peEZYKQxXwBa9dk+D6xskuUTLx7UghhB/or+dNKnDqs041NuB4i5wMVwuRHjntXeGe
	 ii6n7WVRMMiqxphcr10h/M80uYYH+NCjm2pc7nqOqFdQLtt8FhMNeQxhMeXGlRYSm8
	 jBAOSK+lQKFJ5GT65Tz0A8B5ROo2Olrj+X6m3+rjA04TOClc5CoyLr/GmmGjmh8vEA
	 GjPoGfBPfervQ==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20260721-pcie-phy-v5-0-8d403ef7e780@oss.qualcomm.com>
References: <20260721-pcie-phy-v5-0-8d403ef7e780@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/2] Enable the QMP PCIe PHY present in Qualcomm
 ipq5210 SoC
Message-Id: <178472236341.252229.15794109314464682618.b4-ty@kernel.org>
Date: Wed, 22 Jul 2026 17:42:43 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 21 Jul 2026 13:05:25 +0530, Varadarajan Narayanan wrote:
> Document the bindings and update the driver to support
> the PCIe phy present in Qualcomm ipq5210 SoC.
> 
> 

Applied, thanks!

[1/2] dt-bindings: phy: qcom,ipq8074-qmp-pcie: Document the ipq5210 QMP PCIe PHY
      commit: 9bc73298911064f405e6252ab30ce0ed978ab800
[2/2] phy: qcom-qmp-pcie: Add support for ipq5210 PCIe phys
      commit: 3c25d3d97428a88f451590aeca9e6da3c12e495d

Best regards,
-- 
~Vinod


