Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9810939183F;
	Thu, 26 Mar 2026 16:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774542095; cv=none; b=Ec57ryBr0YLDVPw6V/L1YZaKnL17DnWOsZNHyyyS7FA0lenoSOBthNCLrlZ4K8Yb+SYVbZpW3tp8IeCokzdZDrLof3su/dVDEcGjRkrdlGBrPgpZATBi0Xn9sThxwKtErZk/6hHCTvMNlQEFNwkVcGCDsLKPKiw1vbXbv1ZWNA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774542095; c=relaxed/simple;
	bh=Hu6yCmKFhpF8KsYaw6JMZq0ywUgmk9NRpJpO3yCBaJI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dIHucOvmvM/loqTpWmBP4kXfsDOhnoUigglUKTzhjFR3VlPYILRoUc2i1hkZp3Mg8rj8LHUDFwSwt0oS8F63gpEuAhhURxklKW6ue7T4JupaDf0KrZWfyabnnvQmad3MKcy7iyEiCjSnoKA2Dz01jIYMQbp0AcdjLJUyR33VhpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tQ13c5bZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tQ13c5bZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8F0CC116C6;
	Thu, 26 Mar 2026 16:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774542095;
	bh=Hu6yCmKFhpF8KsYaw6JMZq0ywUgmk9NRpJpO3yCBaJI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tQ13c5bZBl9WubaovdBQPBpj60vOnkZowI7G9PEBHe+C4fXORlzAA44AwBIS0yBF2
	 MXIbiFLpxHSVxO30HpdQ1JKLKEHl39cTj2h2eVyxhCG7DWw/p0TB3bAnUubY1hpQBf
	 TP7ybBqHTQw2cFOPnu9AUNoq02PQ6ikUOIHEvRkdDtHxSZYnujaDphsfrkt8JlW7rn
	 DI6IrCYSx9aHWPqll+zhOXAQyUg+hVzczEiehXXjWmp0Pzb3uMjNNt9T2HXxnmcirj
	 NX4gqjD67tNeHa/VxuQh8G8d8oE6VZor6stse2fgZwt32Xsbu8n69kBVoxENUQovvj
	 0+s9RaC2Wld/Q==
From: Mark Brown <broonie@kernel.org>
To: devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, reichl@t-online.de, sravanhome@gmail.com, 
 lgirdwood@gmail.com, Bhargav Joshi <rougueprince47@gmail.com>
Cc: daniel.baluta@nxp.com, simona.toaca@nxp.com, d-gole@ti.com, 
 m-chawdhry@ti.com, linux-kernel@vger.kernel.org
In-Reply-To: <20260325230559.73527-1-rougueprince47@gmail.com>
References: <20260325230559.73527-1-rougueprince47@gmail.com>
Subject: Re: [PATCH v2] regulator: dt-bindings: mps,mp8859: convert to DT
 schema
Message-Id: <177452613865.64163.9836789020511532055.b4-ty@b4>
Date: Thu, 26 Mar 2026 11:55:38 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-ad80c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Hu6yCmKFhpF8KsYaw6JMZq0ywUgmk9NRpJpO3yCBaJI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpxV0LeZE5mc6CtR6sTPhI/ijBhYTMyFaWapIgq
 uYlb3rf/aSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacVdCwAKCRAk1otyXVSH
 0Pt5B/0WvKUGDVj+Ws4HA5rhap6I/ue8b1HMCHJu2nOsW+u2/d7V5fMXOiW7Nel0iCQAI1ZcqPs
 4Dh5fSq/IVSQva3PnXevIXokTLHTwYaywvcfRcwyvz38Sht6ptoLqYmiMPTEKjNzs/8OxN1f5EV
 vD+aMqpwHhx7zFaSzBnzwnjXjrBD+krsb1zlI8lqR+XMBntuXr2B2TqvoBUId8JmVhFhO4qacq8
 g76UvNl2/rpAk/JSiM/FDEXcRlnFwFqV+6XblQUhJctnMt2r8hcrY1Xf9KHlAVDR7zU1CktxlmG
 JCquiucR1CyijGnyRQHk+oxC+VPseWDKZNq3ANsppsOgLxVV
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 26 Mar 2026 04:35:59 +0530, Bhargav Joshi wrote:
> regulator: dt-bindings: mps,mp8859: convert to DT schema

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.1

Thanks!

[1/1] regulator: dt-bindings: mps,mp8859: convert to DT schema
      https://git.kernel.org/broonie/regulator/c/32a4cd3d451d

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

