Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8EB2874F5;
	Tue,  5 May 2026 06:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777963973; cv=none; b=jKmPTc36YCuAgo3/VgLUmllE7IPDKNQclXb2yaa9yJ0C5lbftYBv1ecF8wxECrBJOObnE1nTGRRPlyc1v1GRdHCzQJb5aDx3nxx+49jtdxgtDipS4p2UKHr2sxxwDUpHNxZnzgg3S5w/h3qSMKKjnCCp1K2DmSVGzShjltb3Mvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777963973; c=relaxed/simple;
	bh=pmjIppA1kE4uxm94KdNTJxGc3Oa950h/wVv5IRPh3eU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p5M/YC6XSG0uKa7vkvMHgCil1eRvwAbeul4kCTG1Nh8EyIJC+nLIOGS0X2+Il+xGSa0xFiG1C+LpYI9pl0yGO4+PcRHlSj1XgXk+3oqOMCW3JxXn0Bf52kxnNiZj9wIrf/71RaeHcy83bOFamorIY5cwf2jt6qFBickHp+1HjPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lCTT9Oji; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lCTT9Oji"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68DF0C2BCB4;
	Tue,  5 May 2026 06:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777963972;
	bh=pmjIppA1kE4uxm94KdNTJxGc3Oa950h/wVv5IRPh3eU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lCTT9Ojif9BDU6gwyRvgZ7+pNmOIOSG3QWyg+brrz6xsLQ/h0cg/gbwZgKKKBnR9K
	 1FnAhNYHIGIOjV9iidkvn1uxMcGKpR38FCcOjgci3gmTRhE1+dUHkeBmbcjUyjWyin
	 mZCgCaj8DB/tkQlUiEfAO8sm9JrgOvaO8wpDqkVBjCNc+MYymVUE9tkwf0tb7eCSkc
	 cPD/4fV/Uvgfa9O9x/hgNGgppFXC6dlrquj48aNHyuTk11MXhNXpXqzx5a86/2gKhb
	 Yi7IzuARFOQTi9R9es9ZN4JNDYJNMXz+X85/ha5+fsjeDjSNU0GBXzvAfyx1mZ8ATE
	 eESHwAxiJUTJQ==
Date: Tue, 5 May 2026 08:52:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: mfd: qcom,tcsr: Add compatible for Nord
Message-ID: <20260505-stylish-sandy-dalmatian-b5d6d1@quoll>
References: <20260504081122.825635-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260504081122.825635-1-shengchao.guo@oss.qualcomm.com>

On Mon, May 04, 2026 at 04:11:22PM +0800, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> Document Top Control and Status Register (TCSR) controller on Qualcomm
> Nord SoC.
> 
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
> Changes in v3:
>  - Improve commit log to drop "compatible with" part
>  - Link to v2: https://lore.kernel.org/all/20260427012116.231226-1-shengchao.guo@oss.qualcomm.com/
> 
> Changes in v2:
>  - Improve commit log to make the compatibility explicit
>  - Link to v1: https://lore.kernel.org/all/20260420042124.1247995-1-shengchao.guo@oss.qualcomm.com/

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

