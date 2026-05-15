Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E9C44D018;
	Fri, 15 May 2026 10:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842702; cv=none; b=auJV5WDKNQkPS6ChdP6F3G/chCfw1KfalJJRP4zYDXG9JhGFT9mI3kBsKSSPeC7qkKOCQcqM+wk1UiMbaIkr/wmZnXZgnxzp2Ul0298k7esFtBheqV5GG7KvzvFkVs2TecwemCrX9fu5eD19RDPWdlQDAXyJSm4n/hfKffl/TGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842702; c=relaxed/simple;
	bh=/eB9+0ySYJg6AO90guQIMsZOV7IaVx8WW9dg2ssULmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uxhRaSfOh+QmnNijEr/64DBpbib7kklXpMRHnx5P5ySykxys0HHzKMF3NzxnEFdnIFqtweo5K6s9IqO7ArJlleeH8JQPwroSoC8MP0Zb8MdIor9QsRqPTRZEzPaUoUUc1SpL27jdbMknlFHcGskE50SwXvYvCBCPzLLEIGmw9TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N9Ngp25i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N9Ngp25i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A91FC2BCB0;
	Fri, 15 May 2026 10:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778842702;
	bh=/eB9+0ySYJg6AO90guQIMsZOV7IaVx8WW9dg2ssULmQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N9Ngp25i72JRKbMTHMrgId0bn+ib3IocjtV5zKV17jMRerLvBJcWoPwOgA9vCivEj
	 oA3/sFdVE8N9H5QPfLTM9YzHMjneXbTX25Abv3cN/vxvdI4W4FSq5fE9geFW55vuCU
	 Y/xcL7MnIP0hRCqTLtk74NHs1wcwzNsqMF4rWhr6XMBtBUTDJb9hA5zq+9qgMoHtNU
	 k51ofmvRzIcFW0l8dcxLKoW5DcsEgXlr3EGAK3UTUAa3sOzFZ7mZOp9pH+Yghga8E+
	 6q2+s6R+MPGo+lmWoKEW2tcb6LaeJjUTWmo6GH1I1Lzz6o3K+kkTlFY52Q2o4ps3Do
	 3KyWTRGWf8gFQ==
Date: Fri, 15 May 2026 12:58:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rudraksha Gupta <guptarud@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: soc: qcom: saw2: Rename MSM8960 SAW2
 compatible to v1.1
Message-ID: <20260515-rustling-spiked-shrew-020dff@quoll>
References: <20260514-expressatt_cpufreq-v1-0-487fd2d78859@gmail.com>
 <20260514-expressatt_cpufreq-v1-1-487fd2d78859@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260514-expressatt_cpufreq-v1-1-487fd2d78859@gmail.com>

On Thu, May 14, 2026 at 12:04:00AM -0700, Rudraksha Gupta wrote:
> Rename qcom,msm8960-saw2-cpu to qcom,msm8960-saw2-v1.1-cpu to follow
> the naming convention used by other SAW2 compatibles that include the
> hardware version (e.g. qcom,apq8064-saw2-v1.1-cpu).
> 
> The MSM8960 uses SAW2 v1.1, the same hardware version as the APQ8064.
> 
> Assisted-by: Claude:claude-opus-4.6

And Claude should tell you that's a NAK. If you throw AI slop at us,
don't expect useful review.

NAK, ABI impact without any reason.

Best regards,
Krzysztof

