Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B997639FCA9;
	Thu, 30 Apr 2026 09:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777541900; cv=none; b=J73gKUk+oiUPUnuwFn5hfQgiG1Mi4lo7U+/alRmYkxtt+oj0Vw4SRrTNIybJrENYTl8J8QE5pD7K+p+o8NLSeCJCC8uPElrwB6K0KdRQ+OVjw0fmb+k7VxhFXGuaxmh9rMwDllRnHpHDO3tUBae7jPDgLS+wAQD/XuPk75JiuzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777541900; c=relaxed/simple;
	bh=kv0TUkmohaaqYzvigSROWOOzro5pbUlGjS6X3h7CMWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CJShbMt6nXt8eS1/BjXpnofqP3eRp6fg54VNFUi3mTXNtLMz4/lLVRtWfcR+cO1LPrlsBRh8juJNSNuVXg58SyijbxMQr6ZO3xgkLwoPwBHPU6qfphuJt3WlW6ICmcQu44kOpRsqCBcYYt48q9FM9VbI4R9RlGoiejp2Odi+7Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d06rEknN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d06rEknN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C61D5C2BCB4;
	Thu, 30 Apr 2026 09:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777541900;
	bh=kv0TUkmohaaqYzvigSROWOOzro5pbUlGjS6X3h7CMWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d06rEknNIVee+8zoY7PiRP5KAOiSW/yACu/G9K412A6It94tMNqBC2poh4DkNprgS
	 r1JwWAK0ShfDuFpHus3P1bEEVz9rCbohI6sIeLesW4F0sQ9eeSKseafLLRpnBdBLwO
	 cGw4Wb5GjM4c4QLcsorBDrtMV8oaMvRlphiig0813czL2pbXb0JufNHHVlOe8J6vZz
	 zeZU/TSjDX7waW99gMhlydF5nIGSmJ6S2SHlbfGti0kAwRCimLZ4SkwAY7gZp8qMei
	 mIeXvc9CSqvRNn/kqXowptVGEoL+t8X6oOTnlBMhHF06AJPpgFc3PRWBDDiL9Lf+Lt
	 pZ0/LN2+OF95Q==
Date: Thu, 30 Apr 2026 11:38:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for Shikra
 IoT variants
Message-ID: <20260430-unselfish-archetypal-lemur-6e4bad@quoll>
References: <20260428-shikra-socid-v1-0-6ff16bad5ea2@oss.qualcomm.com>
 <20260428-shikra-socid-v1-1-6ff16bad5ea2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260428-shikra-socid-v1-1-6ff16bad5ea2@oss.qualcomm.com>

On Tue, Apr 28, 2026 at 02:47:46PM +0530, Komal Bajaj wrote:
> Document the IDs used by Shikra SoC IoT variants:
> - CQ2390M: Shikra Retail with modem
> - CQ2390S: Shikra Retail without modem
> - IQ2390S: Shikra Industrial without modem
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  include/dt-bindings/arm/qcom,ids.h | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

