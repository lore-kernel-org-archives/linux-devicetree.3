Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22AA3CB910
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445277; cv=none; b=XSNmcNrBfG0Anf8f8b1UZYKL7GNL2KNoG238tvr9eSs+QdVvoJQS7eFsmPz3u4tXtNbDYs/+x8md9MLjt/G37dRjQf1a6B8+66gxuTQvDCYMNOspCfddFQKt1gKLMqx7s2BD043clI+5b26ixFYw6Be4LIyhfefM9yOE/oWmBcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445277; c=relaxed/simple;
	bh=S86o6RsskkHWtZ3c4SAC2I3qNeFXbs4tllWVFU88BEU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iwQaiJYwP+0Hf0CVxxPIlr0AJNA1TtKjKqod2a5M4rpndLWXT/jafH05PO58T5TWNz/4DRSPbn3f88xrEoC6XvDkz4oZINaJDIG/SUNKjv+Trq3qko6SNve8yC1luB3PBgtHU3y7Bb+tPTdrddVrEaeZ0vTkuB50F+kgfJ15vFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NhkcvpWU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NhkcvpWU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45D741F00A3D;
	Fri, 22 May 2026 10:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445275;
	bh=2DgGODNadjgGJsoo1ylpwBE577qTB7GC2dApkXhqSvs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NhkcvpWU504XJCVZIPuxMhF+fcN7kh6dOwSwL+rQUWKSJFrMBp8taYuFNrkdISKN/
	 abWD5h50FvIuX7UjOZBUywR0mZaC6RXN5MpJ47RVaprIPPQ6N7FNhkaHL4fy9oLWE2
	 bNk3b8Rq1182L+j1Wb/k0lWztKC0eXWY4KfGYS6NfFSOBNPb1ZeeE6lFNwtMkEk3Mb
	 Kb0wvQDuYU0JB/n1n35ItS+VZmCk1aVZe3osldYV/ScWkqlRUqfXn3vCJyE/GOXg/r
	 pqFht5RWvoOULbjItGw3YXezQHj6JQEvAzJeI3PTUU0i4hq7bKqsxctyEzIScCRifk
	 TVuxXgR+11pSg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20260514091520.2718987-1-wenst@chromium.org>
References: <20260514091520.2718987-1-wenst@chromium.org>
Subject: Re: (subset) [PATCH v4 0/6] regulator: mt6359: cleanup and add
 supplies
Message-Id: <177929384264.56665.1047692628146708628.b4-ty@b4>
Date: Wed, 20 May 2026 17:17:22 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1804; i=broonie@kernel.org;
 h=from:subject:message-id; bh=S86o6RsskkHWtZ3c4SAC2I3qNeFXbs4tllWVFU88BEU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEC4YxSKtcKDBHMtlwOBWiLs/4dlCeUfDdAjCo
 bwUG1Bb2ReJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahAuGAAKCRAk1otyXVSH
 0BmQB/0ebTYeZ/V6SuHqtRkYGeTSKGRrPgmho05X8NIN9HYgS6LDOcttuTZCuNG7WN/j7BPMUsi
 V33UcE8/EW3SjzddG9h6BCurQ+IgT+chjLN3BeRpgIYUV6A5rui0Xlw+8+2quWAGyJVPi9UfamL
 ri8PPkEbzP8Oe5d1dxr3n3f+QfntPP8GOcCI4ZtreI/suhmwcuoQU/Q1Q26PPB0tng25HF44k/G
 S2r7dIDussmXd5sp1EzyEax09lMGi4f8vDJuwItc3uCH6SUvd3YGFax5zN20+Sm8HVOn0W4VL/+
 Gru5baz35mbj0LYOpAVvdj0FXNolFpFUedwdsc+QNqfNudnG
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 14 May 2026 17:15:13 +0800, Chen-Yu Tsai wrote:
> regulator: mt6359: cleanup and add supplies
> 
> Hi,
> 
> This is v4 of my "MT6359 PMIC cleanup and add supplies" series. This
> version addresses review comments from Sashiko.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.2

Thanks!

[2/6] regulator: dt-bindings: mt6359: Drop regulator-name pattern restrictions
      https://git.kernel.org/broonie/regulator/c/cdc517688ffa
[3/6] regulator: dt-bindings: mt6359: Deprecate bogus vcn33_[12]_* split regulators
      https://git.kernel.org/broonie/regulator/c/beb4fe279989
[4/6] regulator: mt6359: const-ify regulator descriptions
      https://git.kernel.org/broonie/regulator/c/eb17a319f1c9
[5/6] regulator: mt6359: Add regulator supply names
      https://git.kernel.org/broonie/regulator/c/10be8fc1d534
[6/6] regulator: mt6359: Add proper ldo_vcn33_[12] regulators
      https://git.kernel.org/broonie/regulator/c/fb6a6297acfa

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

