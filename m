Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8554E3469F6;
	Wed, 22 Jul 2026 13:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727234; cv=none; b=W3Lz5tUlIuhNjD8JqqANP5imB6/VcKO82x/rVsa0WJIu0u8pNXi56wxwODfbqbC59OlwKALsH5VeVFlf8bql1JOQgO6GE7/Rd2POHNrUpt3r9fFRn05Z/ZihUPFUf/5cztet1DkJBDR292LdIkSXAOS1VkFxanBsZMbPI0us21M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727234; c=relaxed/simple;
	bh=3rCQ2Fmk2NK/HkYoBrMYzxvyH4uayvH+vkL1maA3suA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JHmW7fNLIs3k5+yV+H1IHcPyzS8JPA2Pq6bZUAybfP4Qium/OlIfcHFoLYjoUwVYjSA7XIh6W78+boqoC3dzl3mh6QpOytTzOTqJ9j6m/x0Owi0IQxtwsP4Qu3q7AdQR0DgymGuAOX+WWEYYF3d4UJs1ztyREjAR6mxQ2LvVA8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BScDMhv5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BScDMhv5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FB001F00A3D;
	Wed, 22 Jul 2026 13:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784727233;
	bh=3g/Vt3TYvUpEPeLCu7wGYk+zJmTfD51xKVj1hcVJx/Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BScDMhv5E2PHORY5T9efapcPtC4rUQj3ovYcHHT9hwCHs+fkrMpxY+//kxqe1CCT0
	 CMTJPFmLEx64AdQauN8MS3+jK1F6PXNaa+oL3TbAS2VXOeF+LxinK6lCdYrM9br/oS
	 fjg1P/Ve8j9bhdmnWMPUo9lq+lWNuXpKpJ/o89sDfTL+e/tP23dGisnCgeK7dNLtn/
	 amg4txbsOI1OFzhA7YZtcWzKW+1TjCYtQn6J2oPQqHdnIAGJIA7iZ1RB8JMM7NRND8
	 eSPfmiXlO5F8cR9H8f/fAO/czO61MBOiyMQKCm1VZGedJysiODAwLbrhlypzRFO75N
	 XPLq+L22268/A==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com
In-Reply-To: <20260717-ti-regulator-tp-v1-1-a49d41dc56d3@gmail.com>
References: <20260717-ti-regulator-tp-v1-1-a49d41dc56d3@gmail.com>
Subject: Re: [PATCH] regulator: dt-bindings: tps51632: Convert to DT schema
Message-Id: <178465638048.123404.5812577616146344789.b4-ty@b4>
Date: Tue, 21 Jul 2026 18:53:00 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3rCQ2Fmk2NK/HkYoBrMYzxvyH4uayvH+vkL1maA3suA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqYMa+cAMuNmw6iSpHVKx1+jWSS4QHgBtx3mGal
 pvsenQ0VXWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamDGvgAKCRAk1otyXVSH
 0BjdB/4vbj0mKmu0jp56w4MxwZqcmfORELPE2sp+b1qQule1TKLlRNufxCewBQMT6wONV4Zi1LS
 sD1JOirPEHHXkd/8KufhzVaYJJA6C/71mxCOSjM+iomSfbtVai/MUbP/Yc7oBuMOuphUhr5Js1k
 e7ixxErQj2vMrdBejT1O3idysHpXuXTI4pdp5eflEVOWz/lysd4iIvh1cIeg3sDLZbNXHZCEIfm
 FpiGRkS2p94GaXjoj4hCK1Px8yQzu8IHLCWN1YXluOL/5fSM0pTTIgarpYU4OYSMhjUr86RQC/t
 UJvgokB165bylmbg7HmN/EbrvzDXVcoytcAEr2Kl2eOySiwc
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 17 Jul 2026 02:54:03 +0530, Bhargav Joshi wrote:
> regulator: dt-bindings: tps51632: Convert to DT schema

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.3

Thanks!

[1/1] regulator: dt-bindings: tps51632: Convert to DT schema
      https://git.kernel.org/broonie/regulator/c/07f0feac5f58

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

