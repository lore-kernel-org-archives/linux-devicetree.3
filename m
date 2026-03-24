Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB0F312819;
	Tue, 24 Mar 2026 19:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774381439; cv=none; b=XVqdjEBoENyUWaJuQrgs1GC8uV3dHMGg1BbaadimzLkoLyXiWHuN7LSRLpEx8Wmyz5y6NmUXg/TE6fzdfcstY892n3U6kExfv4aB8BNA1GXzYYZby3AUFJxbb01c5XD/XwXybP6pKND/JfY7HlwPijfpJU32m/x96vWOyiWCm+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774381439; c=relaxed/simple;
	bh=HethXfN2EcM06h2lkygl0/XZu7GWdcBUKincFN0YY9A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KJUsxtfdXUumlD118i7WtEzoRU3rGq+RPH7dwzb/fUQwHWcZFNBR9touJbzMaUjBiHe9iK1GZvAxPGLDHYQ3aYz4ly0TTIBVlX/uo/C+mVzanivBQhPNLW1MxMfJl03S1AfOe8zxSex5hdA9upzmap4FHGMu3+L7udFhhmb5L+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RcUm+IP1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RcUm+IP1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96FC0C19424;
	Tue, 24 Mar 2026 19:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774381438;
	bh=HethXfN2EcM06h2lkygl0/XZu7GWdcBUKincFN0YY9A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RcUm+IP1lNcY6jmVcxdbrt0ymnvT1Ln/coc/5SopfuBPfZ2NiH4Yp2zRg/abyUX/g
	 gKWbYd4CLJk+JBxRqO/mc3PELAM2c66FchC3zSPGVJvApN0cclIEFFNuVTdUv983j2
	 HPgAcPwTSWbHhTz1yoH8l4UOV4lmyqZG5g+MKBi7WewM/QTm1gpEAc48Ggm0BGtRRS
	 2r0/h52mhU6pM9NpAnEyL4a1gr3EoXj/ItZGd1Wsyt4YU/GJI3x89+ZYJFfR+11DYe
	 JdWvf/q0y6VMNBfMXIth5neW6PYA+ccWrYMfzh9Oz4yIqZZvyJwn+F0NAIN5ZY4pxy
	 uQeSwdKHOVxgg==
From: Mark Brown <broonie@kernel.org>
To: Support Opensource <support.opensource@diasemi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Adam Ward <Adam.Ward.opensource@diasemi.com>, 
 =?utf-8?q?Andr=C3=A9_Svensson?= <andre.svensson@axis.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 kernel@axis.com, Waqar Hameed <waqar.hameed@axis.com>
In-Reply-To: <20260320-no-gpio-control-v2-0-dbc938e462cb@axis.com>
References: <20260320-no-gpio-control-v2-0-dbc938e462cb@axis.com>
Subject: Re: [PATCH v2 0/2] Allow caching of buck registers when no GPIO
 input control is configured
Message-Id: <177438124724.316776.606338597466169321.b4-ty@b4>
Date: Tue, 24 Mar 2026 19:40:47 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-6cc06
X-Developer-Signature: v=1; a=openpgp-sha256; l=1539; i=broonie@kernel.org;
 h=from:subject:message-id; bh=HethXfN2EcM06h2lkygl0/XZu7GWdcBUKincFN0YY9A=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpwul7K4rJ2JA9wIXaxqiVFyJ849GIYLm33mVEo
 xgtUqGpgMOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacLpewAKCRAk1otyXVSH
 0LjCB/9xQeZcfubIZIveIPOv1n6r4eFN2CQ1wJCOig/KnaaMs4Ps3L+ERLXW4L9/7C/rjD6kMyc
 N2LP+BYZVFe/9l+oJGPbOBKxnwl8eZFOZWmPg99LoEdksaD0n5Mv/xoALa2oMuN7tZhnzubSMVL
 wKyyLShUw+KeJSdnbFAbUlcz3WTlwmtcJjXEsePcyrlvRX8NYANwKyS0b8jXIeA9v1BeLCsgWE5
 B0MfcKbsTYIcJXpAnu9JPmcQ+9yvucBFm+cVa9xKw7c3sFOUNV0+qZZxPWFKRM3DCT9jjvxFp2v
 dqokfqxz1DwP1QH8TNSyo5DcXo6NCTFehjOmfa5W0rqGO6yR
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 20 Mar 2026 08:33:23 +0100, André Svensson wrote:
> Allow caching of buck registers when no GPIO input control is configured
> 
> This series introduces a boolean DT property, dlg,no-gpio-control, for
> the DA91xx regulators. Use this property to indicate that GPIO control
> is not configured with the functions DVC/RELOAD/EN, allowing buck
> registers to be cached.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.1

Thanks!

[1/2] regulator: dt-bindings: dlg,da9121: Add dlg,no-gpio-control
      https://git.kernel.org/broonie/regulator/c/7795014962fa
[2/2] regulator: da9121: Allow caching BUCK registers
      https://git.kernel.org/broonie/regulator/c/6c2505e185b0

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

