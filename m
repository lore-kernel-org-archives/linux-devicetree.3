Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897193EBF13;
	Mon, 30 Mar 2026 22:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774910543; cv=none; b=LMd1lery/p5aUNb23L/Oy7da3zelE+LG/RVXUGge2hSwFUpAEDLZYwa0vR5BSEL2BnP2IK2H+jZFzW5iJ2CcU96WRN+jC+AqOzDaVKLdNx1DHY0eQOKdaK+ARSHBL6UK7BirOfdSX/ApBmWRLi2iWqJC+lqxqlhaiO2PAJ5WH5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774910543; c=relaxed/simple;
	bh=KEFQLZc20GWW8sgN2/76iip+g3PEt4uQ0FT8+1KvwXQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TPGl5Typpsx+RQ9eoOOrmwTyd88TrVVOcz0nzGVne+u4ROdgaP5q0FGlinQjTSQN96ZocKns0ZU71EuFEjAU88a+bqB7TlO4lCL48WPkxmvsYyAxwSYDMq/zwvHYfU5CWyv4RxgXFqtug4B3FS8kJ4BINu/YDEZocQGFXdf/vZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dJnLxUBU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dJnLxUBU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 482C9C4CEF7;
	Mon, 30 Mar 2026 22:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774910543;
	bh=KEFQLZc20GWW8sgN2/76iip+g3PEt4uQ0FT8+1KvwXQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dJnLxUBU5LnSUHF1d1WPIyOzKVijcgeaimKRu14Cf4v/aA1HMdZhuu5gSsYU6NALA
	 5+cIDn0blVJBbe87OIwjOAxMUFACHt1Zm55YRn4pWl0EtUmG1ncOPgQBippmBkvcLm
	 0DHcCIwoZd20JaJimS+0tfuAiTIcsDYD3BcFLNOeMofld5ZL+7TxgUGojmE8MNLWHX
	 PM7/hDtUf0esLdcycLnyMtzS/yJyEKf09FszjvYvZbWCC14ngLTZvswolbRcFibFCK
	 2409zxujVFUvq9OjpOMoT+lGs4jHEmjJgwlkqUo5NbWk+bGjvHyzey87GhqFPp096V
	 sU+BypcC13RuA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20260326081050.1115201-1-wenst@chromium.org>
References: <20260326081050.1115201-1-wenst@chromium.org>
Subject: Re: [PATCH v2 0/2] regulator: mt6315: add regulator supplies
Message-Id: <177488194606.167050.13383296010943273438.b4-ty@b4>
Date: Mon, 30 Mar 2026 15:45:46 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-3ac6c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1511; i=broonie@kernel.org;
 h=from:subject:message-id; bh=KEFQLZc20GWW8sgN2/76iip+g3PEt4uQ0FT8+1KvwXQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpyvxMA3ShhadjMJFm+yMuBgo1epnMA7LXIqnTb
 TaKpUtyeuKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacr8TAAKCRAk1otyXVSH
 0I5PB/9S8zgjJrYgaMUtuHun1Hsk1sZ5p3dpGcZqX8Xo24uvgAYM+mudCYj3OzvEhU4hDQXF9In
 HWmR+w098C190BNhR+dtPdBNP/SlSyLFxSuqaC3jZY9jlryM7d8uedsO14MGwnXhOZddk8Yi53d
 7J7bXsTk4icZTaA6ABms4xsL4Y8OKSS5HqJ1WzLxR9J9AghNHDfLDNLlaN9rnDfbtnT5p4q8GGG
 Gs+6BZMoJbWoK0/RVf5n7lBRQHIfwlUTEv5HxNh4nMuL/MwWGJnzsAittPyQbcY8mYBAaaQsKHd
 msOE9yKHKNFSI6SD9ZU/SO7tsyZvN82gzHm2YzTogAv8R0ES
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 26 Mar 2026 16:10:47 +0800, Chen-Yu Tsai wrote:
> regulator: mt6315: add regulator supplies
> 
> Hi,
> 
> This is v2 of the "Add MT6315 regulator supplies" series.
> 
> Changes since v1:
> - Link to v1: https://lore.kernel.org/all/20260324053030.4077453-1-wenst@chromium.org/
> - Move supplies to top level node, at the same level as the compatible
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.1

Thanks!

[1/2] regulator: dt-bindings: mt6315: Add regulator supplies
      https://git.kernel.org/broonie/regulator/c/d15d0f1a27b2
[2/2] regulator: mt6315: Add regulator supplies
      https://git.kernel.org/broonie/regulator/c/292d64fb98a2

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

