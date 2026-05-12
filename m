Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2783CC9EA;
	Tue, 12 May 2026 20:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617422; cv=none; b=QUoe0mOhjmG0rFBToSBB/0yAr4BxrZHO9Ra4VPfTDqdLZq/V60GiMVR8sLsE+hMzsDffLxPgmAQHv8QdQa6+G00GLkxkZJCskNQxOPW2SqRpOLr5CPN6Fs2/ztjl5AMQVKKqYVWK7P+18YTNKabb5gvYul/PBl6I2890r5pMyHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617422; c=relaxed/simple;
	bh=GagSECi8ecOTwWXQkUrU8OvlPHIHOj0zJQYR/uTvBO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jck6voYhc92WbmclnUR8zM3DrE/XeJqEjblT0E8bjl1PKFV+ahJOfEKyCDvlh9W382jcFqbzR1nPLNvsMzvardIfIB4unUpi6KnXyIuvCsnIXN2358s/2VDGVh3Qw3+nt9oIMW4FEgazJ6isazO74wH8KcVOmkBr8tdDplsAtrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eqC1YGBE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eqC1YGBE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 317F0C2BCF6;
	Tue, 12 May 2026 20:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617421;
	bh=GagSECi8ecOTwWXQkUrU8OvlPHIHOj0zJQYR/uTvBO8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eqC1YGBEM1WxajTe0qIRBqFdaHeuBrTmYgdjgqgA8pPEmF6E1khhBUMRB0ajZdEhe
	 SSctjPxJk3H2gHvpMW+EyJA/RHIEhIIry5Gr4FwMKrZA8WmnNC7puzA6c8k8jO3ow2
	 QoBs0o/ujBMMk4HxZHiQ+zX7qfvNpnWW7YOECHC/TwqFD0sOwx/DZxtpNDVeGziZPo
	 bH0w4ogkVvc3U/0EYde7ziVHxuFnCSG9JaGQpSIPc+o0ICa+pxVjgvmxGcfrRxkZi2
	 VCoXDzmG1iDKcYnuXhoQmeXJSUrjsSZzeTZjJtpQS66qF4SUd5i9rMpe54ilZe5+4a
	 VfnRD8OxihUoQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: qcom: Add SoC ID for Shikra IoT variants
Date: Tue, 12 May 2026 15:22:52 -0500
Message-ID: <177861739375.1242344.16950925404390248673.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428-shikra-socid-v1-0-6ff16bad5ea2@oss.qualcomm.com>
References: <20260428-shikra-socid-v1-0-6ff16bad5ea2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 28 Apr 2026 14:47:45 +0530, Komal Bajaj wrote:
> This is the initial posting for upstreaming Qualcomm Shikra SoC.
> There are three variants, distinguished by their respective SoC IDs -
> - CQ2390M: Shikra Retail with modem
> - CQ2390S: Shikra Retail without modem
> - IQ2390S: Shikra Industrial without modem
> 
> This serial adds the corresponding SoC IDs to enable proper
> identification of these variants in the kernel.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: qcom,ids: Add SoC ID for Shikra IoT variants
      commit: 928f6a0b1d88e526d5e8a6734e95ef20705fa98b
[2/2] soc: qcom: socinfo: Add SoC ID for Shikra IoT variants
      commit: b828561684a217e3363c595108f5e8d560b9fb25

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
