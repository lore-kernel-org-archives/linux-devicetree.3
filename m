Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962523859FC;
	Wed, 22 Jul 2026 08:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784708147; cv=none; b=RsYQLxro9fAmir/eM4LftVL7qac4xcTvc5Sv8aFbfW5AEQg/C2NBX/nLXdCwc51BTbR8xSQBKtC0IEUNRSe2+CuB6faKiA2nlKcApoBddrnJ0KSlmplIfsaOizFXOqSyFEzqnm9cC0RVDW5lIk5ujZZqBcD/0CqnGGbEioe6L4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784708147; c=relaxed/simple;
	bh=lK3S/e51/wOin5/AYS4OljJV1kMQZmeEwvLMC/il78c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O7C2SdNQ/04v0dlkqtFGImEsc6vFC6XUBh6t+FExiY1u3KX3UkM8LeNtdt+yjrRTJjM4Bt+PaFaw4XRn5gK3D0jpFLSGFMijkBlYbM1eIpfEoJCiTDtDPEHSzILKAl7dBRgLxYKqnkpR8xjR71F8B7VszPsMTTxYWSLb05Fwp58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m/UjfeqV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m/UjfeqV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88E0C1F00A3A;
	Wed, 22 Jul 2026 08:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784708146;
	bh=I6Ed1fhe7PW7ckJOG+hYO0SyywFktvNrPM+HhA2LjQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m/UjfeqV7P0pT4AddZEvv2ntNn8VDrWWTYV3e+pKEv4pEe8sBrum5Ks/ifrw9ThMA
	 C8uH0jwfiimwFnbcpPD4eDTCjM3UW1B4R5icrhYreoVCK7mHao5Rax7eXU0l8pjTBg
	 YrSVusT2mFhtIiZm3ldNQgBLP4Ajt0oRkVmLBZVFtFVm0cteLUR5lFUefAo/d90boQ
	 H+81/pEhHWuArkrKZWP5Ynbqr/EoOD/GmRQwsmlTkCbonesDF8gJ5HWmT6Dj0s2eyl
	 43dl4lZFzlSaIdne+sYBR83G7UYQPmj7D3dvFdtr+tLq38DVBvRa2rm2+N44TcRfDm
	 gCuSOZInsw1hw==
Date: Wed, 22 Jul 2026 10:15:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>, Mao Jinlong <jinlong.mao@oss.qualcomm.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: coresight-ctcu: document CTCU
 device for shikra
Message-ID: <20260722-astonishing-loud-labradoodle-bb59ce@quoll>
References: <20260722-add-coresight-nodes-for-shikra-v3-0-1400a3454e9f@oss.qualcomm.com>
 <20260722-add-coresight-nodes-for-shikra-v3-1-1400a3454e9f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260722-add-coresight-nodes-for-shikra-v3-1-1400a3454e9f@oss.qualcomm.com>

On Wed, Jul 22, 2026 at 09:13:47AM +0800, Jie Gan wrote:
> The CTCU device for shikra shares the same configurations as SA8775p.
> Add a fallback to enable the CTCU for shikra to utilize the compatible
> of the SA8775p.
> 

This is not arm,coresight-ctcu. This is qcom,coresight-ctcu, so the
subject is:
dt-bindings: arm: qcom,coresight-ctcu: add Shikra

I already pointed out this problem at v2. Nothing in your subject is
telling this is Qualcomm! Not even mentioning such trivial mistakes as
lowercase shikra everywhere.

I also do not understand why you add so much redundant information to
subject. Subject space is precious.

No, at this point you should not make such mistakes.

Please take this feedback to your entire team, so I will not have to
repeat the same exactly next time.

Best regards,
Krzysztof

