Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71A5368287;
	Tue,  9 Jun 2026 23:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781046335; cv=none; b=talNcIc90brWVr5CXWQ9igi4iUVht9XwMRizSONXRQbPtWHF+nxlG5uoYqvWB+34FgKFWq9AX2Xw4gWqXrNn10qJCn8bFntlxWpkz0fOu349H+rrk2cbVMrG+vck+t46mI3zKbry4jugh927Wzckt5uUZgJnNgSwnQXpCT+kvUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781046335; c=relaxed/simple;
	bh=qtcaH8L1yvluTYbrwvjWN4eUHVFuFYQeSf7xQZO5ssI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mSw0PhMmR2bP7QrUil3hUAuA+ipNPV2UaYquOY777zP5pxNLQIQG7HetMY82BRiBMIb5Jta0yq67dEmEHuFtk4yoDcxWTDtMJRLxivrx2KS9Z9/T2bCj81lsiJSLgtQAOwBVcW176dLTrGVZ2+Aa8Bdt9KHUv6VUPKnCK+WY2wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eo8oPCId; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eo8oPCId"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B99F61F00898;
	Tue,  9 Jun 2026 23:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781046334;
	bh=yT+5W4H2TlPWKtpdh47hOBHtSwupgqsf+iMTzAB9YC0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=eo8oPCIdnrtV24DIf9pJ0NkTUK1QbfnktXv9OBpd/nvsvVcgAfoeoZagdu3H2Kvo/
	 YojjiL1toX6uuedw5yRYjaJnwMNloCHU/s1PrU4DbIRywalaAxRlmJe0s2o535FJ9i
	 gmP0gY+Y2REXFVA/pFz6NZ4vD3yTiJ+EEpySv6itHvPbjAqi+b17T7O2Mw00seYglf
	 YSm/NNJkMbawhmgxpdC1K56EkH+OtlVcUsQYvJL8Odb6/KgvPNV+9w1IVaPqxmWiSx
	 fuZbhVq/k8sLkHkkbaRXw6zzkkoiAUXh63gGXbqnZYeg8PXmgEmxXxqnE/pDgVevXm
	 iH1CAjkvdGJYQ==
From: Mark Brown <broonie@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260608-rpm-smd-regulator-pm8019-v1-0-c671388b9ea5@linaro.org>
References: <20260608-rpm-smd-regulator-pm8019-v1-0-c671388b9ea5@linaro.org>
Subject: Re: [PATCH 0/2] regulator: qcom_smd-regulator: Add PM8019
Message-Id: <178104157125.34323.11061766000197294354.b4-ty@b4>
Date: Tue, 09 Jun 2026 22:46:11 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1443; i=broonie@kernel.org;
 h=from:subject:message-id; bh=qtcaH8L1yvluTYbrwvjWN4eUHVFuFYQeSf7xQZO5ssI=;
 b=kA0DAAoBJNaLcl1Uh9AByyZiAGoonDqgzCd3S5Ere1H3bu5vA8rWNWwRPxGB3h2ycM8Q41T4K
 okBMwQAAQoAHRYhBK3maKpnVxi1n+Kf6iTWi3JdVIfQBQJqKJw6AAoJECTWi3JdVIfQHc0H/0eJ
 6UpqB5LCb49w4KSAriBQ5pOnkgxGwR3CgRDSZJW80MwXwoAIbVKTsAXLlzf3s+Llnmf6GmLJKJG
 Bw3ms26/rSu37QzJ3ddmJ0RqYayQWDALEftk6rPahlckhuzjs9Wp0NB1+O3v7Qe9KleCISQRkUz
 HvEHhFgNLzQaGPor58TFB7yoVGZMzL0mnhoUtYisnDxPYS2Xjr6CBYeD00tg72Fu1aSe09sLDvr
 ZZ9slck+1hS2fARdZ3M3uZ7duAixctfHZijd3Bj3nPuZzb0etZSwcO1HQPBGUfPSwfCQCB4213Q
 HUz20HIvKmJL6xai10wxmEKRk2KslZkDJRnpuJw=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 08 Jun 2026 14:05:42 +0200, Stephan Gerhold wrote:
> regulator: qcom_smd-regulator: Add PM8019
> 
> Add the definitions and dt-bindings for the regulators in PM8019 to allow
> controlling them through the RPM firmware. PM8019 is typically used
> together with the MDM9607 SoC.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.2

Thanks!

[1/2] regulator: dt-bindings: qcom,smd-rpm-regulator: Add PM8019
      https://git.kernel.org/broonie/regulator/c/b13a590e3aa3
[2/2] regulator: qcom_smd-regulator: Add PM8019
      https://git.kernel.org/broonie/regulator/c/5116c7f0e7ba

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

