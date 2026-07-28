Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EFF48EBCF;
	Wed, 29 Jul 2026 13:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785331945; cv=none; b=pkRu9Ap39Mhny5+/vLpXhkQ+aAwUUWP44FgcFeKt7RaBArNPmJBojrBNPWD3GzjyDi6OpizbJSDSGsazbJI4yc1o0E9uq1cJEE4eJwr0EHkPE2DhNTVTE+iqH/rZmRbPQMtiPmG1y/c5dcDKreE+euA2mKxb1zrTkatQamzpkrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785331945; c=relaxed/simple;
	bh=7omhgANOMW8tu13ftsMKlxj0n7kyYrrZ8P3b4tAAgbU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=INMpnQu+l9RsdWHJ4yk9VVZu72L4NqQCDYS6sfqxBtWvKw/1ngfF4GyxcD1ELd4Pc/RRYn/LyCnwuZDEQ0r3FqlF6WwJ7+9KRRpNypwZDPjYmN3F49RRKi4j2D0F1/ye204SsFloi4Do24ivnRh2LWTfIZM9WUzgMtUBSm0dU+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KdrqZpdU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KdrqZpdU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0BC51F00A3A;
	Wed, 29 Jul 2026 13:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785331932;
	bh=yu2BfeLtBmLbSQTk5dD80Iarvh+V34WJ26NrJ7Cz2Fo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=KdrqZpdUhdqWmMu1jljMEEHXQW6wkby1dIlKTOXkqtCKUWd3hIV9Z5TN91XpKZ8Yp
	 sWFEVT99RTtbEAw7ME6zlIfKeEFHAEh7zqAMMa5MkWsgYSPfe2aPmB1yrplHOhJp22
	 tJnOOc3f5C4EJGXMmM9kFqcNGwe1/AHbY3Xc9CA72wgB/+c3MUbpD7MY2ksrTE2WSH
	 q+wXPCw+GjOaTGQML9qZD0i3V8QUbJWxJONUqNb6N8LwAr0CwW8foHeKfTqyygH5cd
	 IWv81rwgtZXUSFGI8GjK6ZWXdVJzFr9QvkfphzWJinuVa1vyPEiXbcEY+2HLfnr65v
	 SvWun8iRuqI1A==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, Victor Krawiec <victor.krawiec@arturia.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260723094001.120264-1-victor.krawiec@arturia.com>
References: <20260723094001.120264-1-victor.krawiec@arturia.com>
Subject: Re: (subset) [PATCH v3 0/4] Configure SYR82X regulator modes via
 device tree
Message-Id: <178526325165.318884.15207160978228885096.b4-ty@b4>
Date: Tue, 28 Jul 2026 19:27:31 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1588; i=broonie@kernel.org;
 h=from:subject:message-id; bh=7omhgANOMW8tu13ftsMKlxj0n7kyYrrZ8P3b4tAAgbU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqagDZ4IMQ+w9bAydfYbJ0yhmUZMkIqksfJjHSq
 WbxD4qs6rmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamoA2QAKCRAk1otyXVSH
 0ALsB/9NSS9NMamwsbuJwlOffEFZFlYCsqG8cxBiy0CA/k3U2i8A1bKJjjj70HdPWzzLr/mIOll
 8sZg/80e0CQZy0ab3CSpsZ5TqUPaImI9+vRrCYQbZpDLIldWkh/BV+y/+y9y7gVHc/vWBPx68nh
 TUOdocGzOXJHOPvtyoApJWd10cS+xgunYmD5MgNHJpXnHiYN+Ukv2fTBnnir6JKp1GzlAXZxzx7
 +WFUGc76i980ZOntSXUd/LRR8KD56XNMoVIAqVNJNDRbHoI3HylldCJv9hl+7s2MiSrTDoKYK5b
 0QrT31qFYb6QRS3YfaIJAU61hp3Uvb+FKgGkClY4afY8jeD6
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 23 Jul 2026 11:39:57 +0200, Victor Krawiec wrote:
> Configure SYR82X regulator modes via device tree
> 
> SYR82X is a regulator that supports two modes of operation:
> - Auto-PFM: Allow automatic PFM during light load (default mode)
> - Forced PWM
> 
> Some boards require to configure forced PWM mode from device tree to keep
> the supply ripple within acceptable limits under light load conditions.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.3

Thanks!

[1/4] regulator: dt-bindings: Add fan53555 allowed modes
      https://git.kernel.org/broonie/regulator/c/bde9b2c351c8
[4/4] regulator: fan53555: Add support for mode operations on Silergy devices
      https://git.kernel.org/broonie/regulator/c/99bc5744e966

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

