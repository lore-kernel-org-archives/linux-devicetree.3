Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF49360EF7;
	Tue,  4 Aug 2026 11:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785843784; cv=none; b=ezavQdqBYs5UQqUlSDaecFr7DDIrbSPPn4pxmPZj02oe77QPWRjLyFzVxMPqnor2m8L0T78GWLlMmlaCMtmvjLzbHYcaEsEePNbeM5gbM5qCgp/3GwsJy8u/WwWoWI2mrS5GrtjEWCD4M3v8MerYc9sWRHjlFGVl84JasoN6Os8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785843784; c=relaxed/simple;
	bh=Zy1s6k4xFjAsae9gDHml+01wbDvmKlo1v2fgSRHCf9s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bwHvhgDUoQaKzMujK5CuNP8nTQTgUdStAqLm9UzjFAEkzb6dcpPgPFheingEtbjAWcyiZB1efTtuf0K7IWKJD5m8MnzmM2rdeKhCE8v6cUZDoLK0mihBPRIT+BVYK6EcyLyu0V9g7+EXJPtIeOJpFSSUlSIGRCPU2qvd2hNULbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ff5WYfYO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ff5WYfYO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4033B1F000E9;
	Tue,  4 Aug 2026 11:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785843782;
	bh=8kwtSjShrUzbT4zlEgbhDWplwWeVDnZkpVzMV+T03B8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ff5WYfYOyMP2NbmrIB2IdaisRuFuJEiccprZPH6RMQQhEVlB5Pc8GaeKRyuGSddBw
	 2bhW9ZkDtj99Fc1ONPuvnLUbhjKQTwn6EcRqtLebZXRITPvS0KzCZqwlu20ts5jq/Q
	 QG1mr+98tgz8ftb9qoZHj6o5hQOSJykv2WYkegm9cr6trbfV9JOZQ0yTCyqy/m2xFK
	 YtVCE7StTNdLB2zKOZr0IQFjsIXKPYnCqS6iD46yOBAN4N3aN+Bkdz06rireG4DAxL
	 YIq3R/4rPv7HUL2BCtJyK9BZW2euhgPayiFCCr+QPLJ1lpFDS1mbQtVuXL+8zFos0N
	 F4xWi51Zc+N4A==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com
In-Reply-To: <20260729-ti-pbias-omap-v3-1-20fcc0bdc890@gmail.com>
References: <20260729-ti-pbias-omap-v3-1-20fcc0bdc890@gmail.com>
Subject: Re: [PATCH v3] regulator: dt-bindings: ti,pbias-omap: Convert to
 DT schema
Message-Id: <178579633855.881378.16970784433207225982.b4-ty@b4>
Date: Mon, 03 Aug 2026 23:32:18 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev

On Wed, 29 Jul 2026 12:37:55 +0530, Bhargav Joshi wrote:
> regulator: dt-bindings: ti,pbias-omap: Convert to DT schema

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.3

Thanks!

[1/1] regulator: dt-bindings: ti,pbias-omap: Convert to DT schema
      https://git.kernel.org/broonie/regulator/c/36c3ea842899

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

