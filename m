Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BD03AFD12;
	Tue,  9 Jun 2026 23:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781046320; cv=none; b=fl1G5DgCi8U2FLyyxbDd9E9cs7+FWZiwIvy88mkPc1ld+PmSqXVH+MM3I6YNFoBSfG9xMrS1r1lGS5CCcdTADnV6uk/nnBiRvSgzhNoH3jgMJAyGU/zIBKfguOttAIFBItGXrOGdXY9OAT4OhY9+WyBZJ8zxJ+EuY38RBrQRt0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781046320; c=relaxed/simple;
	bh=BrNsfwI8fdZ3xvK+HTgEtwMoxMr8f36ajoVHWQye5Tg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LEL6zd6Kl5UQGfzEN2hEab8mcEXChmCxQPohS5iIY6q6o8l4WV+B3S6wfeh8l8GJnskEk4s4ylSNIe2VT/IIwNmMyaHPeIhamLg6Ec7Sedx+siP93TDHPaiLOq+OJPkhviPxl+7gi0L6B7wAKcZYmZRsRCe+vGFQT65TJKPhA7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ajazoufM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ajazoufM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 294081F00893;
	Tue,  9 Jun 2026 23:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781046319;
	bh=MLrtaZs1mOL3XxietgRzehFxlHUJlKCFPUU1hcZM/u8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ajazoufMS0kk7gY5c3Fsgmfh2zgVcJKmcpDc0OHM6QJy1qvN9eJIFZR0ycHqKvRQS
	 JjYGYwRoAcU70GnZAKSzj37v7qFbVaf5QIiZw89LIh98SOOfpwVOsVt396ZOc0bA3g
	 7osGZ7AEutzfi76pkduK6/5mhpMO3RALDwZ/HQ7eeFfRxyzBOGRm9AgQq+t7Y1Kd9J
	 ZBrsGqFLm6OkxXrNePnE6k9VI15GvPx/6NZPhQ7q/naaOv0u+JVUwU4alouMM+Mcjt
	 Iz6ceJhkuQSjz2I/OIrQs1gnz+Hvx7NPZ7l+VJtmFxexRpnO8bypk61FJiKqt6z7l3
	 kj8N301NO5H8g==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, Ninad Naik <ninadnaik07@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 me@brighamcampbell.com, linux-kernel-mentees@lists.linux.dev, 
 skhan@linuxfoundation.org
In-Reply-To: <20260604162624.644241-1-ninadnaik07@gmail.com>
References: <20260604162624.644241-1-ninadnaik07@gmail.com>
Subject: Re: [PATCH v2] regulator: dt-bindings: mt6311: Convert to DT
 schema
Message-Id: <178104161171.34323.12038798713855640788.b4-ty@b4>
Date: Tue, 09 Jun 2026 22:46:51 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1128; i=broonie@kernel.org;
 h=from:subject:message-id; bh=BrNsfwI8fdZ3xvK+HTgEtwMoxMr8f36ajoVHWQye5Tg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqKJwqUOYi3seoGrTA+jwJWSGqHVeo1WnR0pVhL
 jrxQb5wLaCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaiicKgAKCRAk1otyXVSH
 0IwXB/98uB2JoqhV8bdIngHR6+f5GXKRaPoPI565mm+ZOiuLfawxkjmVW007xnPhQKQLSOcoSR6
 6d2HELc7oykR7jzsTHG3FyVx6tNa0TZmdvqN3Qo8li2LYm29tbn+/HQC5PHc4YwYT3T4HIs4Aoh
 uw+oKYKk3NO9XbTLzafhqgz/Jt5XYH5gqGXBZ/A/CEbIQZMXDH8Q44CPZbkCk07hsbMjVlSu51d
 3loJm6OTvSX5jsxniF8WSG3DoxoLejK2e2q/16236Wc/bMqPbifRlvKF69Ls2Xttn/NYEQySVr7
 znO5/FXwKrKKwB8lxB5qWUDgTnAt0UNJl9ErJWZolYjmOrUw
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 04 Jun 2026 21:56:24 +0530, Ninad Naik wrote:
> regulator: dt-bindings: mt6311: Convert to DT schema

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.2

Thanks!

[1/1] regulator: dt-bindings: mt6311: Convert to DT schema
      https://git.kernel.org/broonie/regulator/c/fd964ee0ac9e

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

