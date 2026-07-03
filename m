Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7024C322A2E;
	Fri,  3 Jul 2026 19:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783106363; cv=none; b=iCVLbnTGdxDrsIQIAfV1hzTcG3h6HNXyX+o7GSHLMtu7K8YIRBWaJ2VQn0xKdQZS3psrLQEPs2ynLHc29wgGRXKIZQdty/IfGMvjs+/oreZZFDQy7aoGqPzgDNizznZDbDJCCSGH7QK1q94mvzRo+Q8ytNLIaUlAqJrt1+pkcoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783106363; c=relaxed/simple;
	bh=3ln54y7AYCnHAKVcK9OOxnbwpT2CY2v3Z3ZnPKuMFiE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FYfbILZUTtVudLKNl0J17QHQ1ylNK6kzHv3zjbsz8RnfCVJdtVJ7RgAHDtZnhUrOlh5Wo/iQm3+KHr31hvoOK/j9GQkbaDWIqRqgSqj36Qz3wGAeRxuET/Mx4prDxrEX+dRpPVh6k6XDc2Omf8sXR2qWzYQh+ueJJvHVzNjzD/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zsqq16SU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zsqq16SU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BED01F000E9;
	Fri,  3 Jul 2026 19:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783106362;
	bh=YfSaMiMr3qP+gCrv1tdZBrQS1fKgRIoZC8h3usekZZc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Zsqq16SUE9V7hlU+f3A2NDlsbMW8n2hgI7x0evTjwbytAuQoSHovrbpOdukpwbx0L
	 sfAIGHsxmE+zNNMRXdIXEPbyfuegtKcC6obe1QGnbhSAfj++oo5lvpdbShVoFDCGS4
	 4XC+naxU0siEYXh9pJOAnl3jJZk8qOCc/L2nFgGuzwdvhi58Yiu0AcThG7PE6/FPqO
	 socB7lsmcSBgd4l57HtGU6/Gn1QGS12O2KvG23moIEA7F2mZjNbi5+SaHemYO0+Tng
	 rw1OE2gh1hH1iNeURfxtUvK94LLPE0Gr8A9kp7uEmtatTsAfE03ya1NnfYsBqMTvKI
	 tPDAB5Tk6uTog==
From: Mark Brown <broonie@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Matti Vaittinen <matti.vaittinen@linux.dev>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <akZGe1CaQFDd3idm@mva-rohm>
References: <akZGe1CaQFDd3idm@mva-rohm>
Subject: Re: [PATCH] dt-bindings: regulator: ROHM PMIC state-machine
 voltages
Message-Id: <178309495388.182374.12534087417242175256.b4-ty@b4>
Date: Fri, 03 Jul 2026 17:09:13 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3ln54y7AYCnHAKVcK9OOxnbwpT2CY2v3Z3ZnPKuMFiE=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhiwPbvNtZ7Kn563QuabEsKVQwL5q9VShyxdXBJRGNLGcU
 0r9Wh3RyWjMwsDIxSArpsiy9lnGqvRwia3zH81/BTOIlQlkCgMXpwBMZE8rB0NLp8qUkJA2/8it
 eTMnvdapbJfe/kpMn3uNZJRRKtuPuw9Oxusw92kudTdVs97Xw50VkJMVK215Tk2U1z/rmWl9cnB
 v54kv1YvCjr0OyQmJmJDwn+m6x/OmH/Gpvnyu/opXXub2J3Lcyqi5f3nnwqhPjzY55PMr7rGWai
 3jPpti98n90eJ9vOqV/z971R5Qm6nAoXRdeeuB546/5lU+vN674EtVitXNn5MU8mwSVpXzRDhFm
 31Pl+m5/LeO++878ROr14i9ltjTz3nx2bZ9QS6afSKaN4I0dqRqBnKLfd1Y5Hd/1+7QlefOT2l6
 rfKUIfhUhu5889NiRrFPP2378TUk3lxwz6K8ZFPdZgtnAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 02 Jul 2026 14:07:39 +0300, Matti Vaittinen wrote:
> dt-bindings: regulator: ROHM PMIC state-machine voltages

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.3

Thanks!

[1/1] dt-bindings: regulator: ROHM PMIC state-machine voltages
      https://git.kernel.org/broonie/regulator/c/f29a8bf6fde1

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

