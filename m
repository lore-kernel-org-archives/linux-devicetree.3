Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11AA3A3E6D;
	Tue, 24 Mar 2026 03:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774323741; cv=none; b=QecFExqVZOlM4GnQP7JXzALLLbgibS7g0dZIKsMIHG5nXvLbG6unB7Q7Wjo1Fexw4cxb/RuGm/MWModSY0/fWP43GHP9497k6j4Ae+WOKG8knjgJwC1eZa68TYM26f6N7yOiXnKn1G0qaLKPtxpbRTzknsMMNv5+xM/YQx3C2us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774323741; c=relaxed/simple;
	bh=h6bLlsaIXSzfbwAdO3zUhn4B+RhQrr7LMpOMFYR3HpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rDWY/z5VqLYuKqaTmZ8MYh3o/AKeSQe/ETuyYXovMhOuaTXkonfgS8X0WTRcCwBRgcO/qnqhWRi8axxrRxzE64si0OM+HOcpyh4oL/UZLGZWfXl22NHEascQglATAVfY/YZtVuwdae0nfeXTD8MBPAIZSQCDDp7idEZWTD5Y6iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=teP2IFSe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="teP2IFSe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 509FCC2BCB5;
	Tue, 24 Mar 2026 03:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774323741;
	bh=h6bLlsaIXSzfbwAdO3zUhn4B+RhQrr7LMpOMFYR3HpU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=teP2IFSeY++e3p46Fb8cv4KUxdTdmecUTDOLrGN8VZMuIQ1vDXdsJ9NqjMMeg0I2e
	 g+ciEZsXFADqMBrSYU9GHXR0msyDS6mGzcc3jfSQef7lmtS90sQABjPO4eAkIYIqjE
	 yxSqY/ibqXbYlEKnQ09GKd2DlscvHkWzviNx04/Qt2g9rYFmH1VCpDGmrd2KaN36Gp
	 2nWuC0kjyXLUQWZclkG2cIiCn6SRuBiyabQh8Ri2GHeCdsowUo4XJwH9CeW92Qquxc
	 g3DJ3uA2QMhgTh0CLjrnxywdQGK/5gyuv6rJsEJkM2PrMmIwASwrVoo8Elzm72QtWc
	 h9CsPTjX+ejvw==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Sumit Garg <sumit.garg@kernel.org>
Cc: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	akhilpo@oss.qualcomm.com,
	vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com,
	robin.clark@oss.qualcomm.com,
	lumag@kernel.org,
	loic.poulain@oss.qualcomm.com,
	jorge.ramirez@oss.qualcomm.com,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/3] arm64: dts: qcom: agatti: Fix IOMMU DT properties
Date: Mon, 23 Mar 2026 22:42:06 -0500
Message-ID: <177432372691.35532.13655501633127781259.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260122121042.579270-1-sumit.garg@kernel.org>
References: <20260122121042.579270-1-sumit.garg@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 22 Jan 2026 17:40:39 +0530, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Fix IOMMU DT propeties for GPU, display and video peripherals via
> dropping SMMU stream IDs which relates to secure context bank.
> 
> This problem only surfaced when the Gunyah based firmware stack is
> ported on Agatti replacing the legacy QHEE based firmware stack. Assigning
> Linux kernel (HLOS) VMID to secure context bank stream IDs is treated
> as a fault by Gunyah hypervisor which were previously ignored by QHEE
> hypervisor.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: display: msm: qcm2290-mdss: Fix iommus property
      commit: 966a08c293cb9290d3fe932961404e87b3f81327
[2/3] dt-bindings: media: venus: Fix iommus property
      commit: 7e59cd4ad586afd87f67491cf91fa1141292cf57
[3/3] arm64: dts: qcom: agatti: Fix IOMMU DT properties
      commit: 2c409e03fc04b5cded81b7add9ce509706c922e3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
