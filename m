Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E825338B7D6;
	Mon,  3 Aug 2026 16:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785776342; cv=none; b=rX7RPYCDgYtrj9jaXs80FMKAYwCnZuiyMSfC9eYpPxXmOhfvIc0jxhfDMBdexiUVYP3mTGXX6OA8uyjf95oJFVyYGQan6SDNL2x2VEp0IyGiLLsVg4pyZv0I8RkJcD2vaf9vo5KQXSQII3gMSh2CGw/rPImy/7NgpW/v/OKoxuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785776342; c=relaxed/simple;
	bh=BAEQrlJqrouW5uCPmtDZMCviSOhGCyYupanKmxINdbo=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QpAcUAamUxMwiQAU2iOZDKmMbnG9zUPg4v5ilxh6R+HHvy7ljCFYIVRqmVNT+5XDxF/oAip28y4XgFXOgD/muxgekgB9DBbpS6ixMp1oyKcnr9NAMv0xuvwjX3lBdB2+1GVTWNJKZds7sVFNEhFXOwnUtYdzmI/Lk2ayMIfdtgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f39wxxK9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f39wxxK9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE4AA1F000E9;
	Mon,  3 Aug 2026 16:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785776340;
	bh=PW4q0KQmWMHecwKrmolSBkPoiVQTjYKQPNP+4cmx9Is=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=f39wxxK9k0xTJe8LldySaRpQqzD/1yfoAjAcGFk56H/qoiuIHPlGol9qNUytGrAn6
	 q7S+yJwoyI3qObIrHKSSXIGEhF4udJxLhqnmWhYtkD/6wfTogYi+cPvD6TVr8ULKdl
	 4dbQA4CaU2LwTB4srlfE9FuUahLGhgJC2N9F9+2ey2di4gqnxiNNQoe1Xt8kQT3Xp4
	 bPJjwGrxLH47q7PuDFC7aESxHnlTM0nSZr8iLjYK/Kwl6bgz8DcGnSqkzzvdrsXGL4
	 NVTz3stVJX1yxGg2+pwrs3TP0uG21eHtmDHgMsKRxrjhUFFI+hoG+ZwECLdR72mJBA
	 C/OTI0aLND8zA==
From: Mark Brown <broonie@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Troy Kisky <troy.kisky@boundarydevices.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260801195440.234183-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260801195440.234183-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] regulator: dt-bindings: Correct white-space style
Message-Id: <178576580811.255647.18095123204094746997.b4-ty@b4>
Date: Mon, 03 Aug 2026 15:03:28 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1131; i=broonie@kernel.org;
 h=from:subject:message-id; bh=BAEQrlJqrouW5uCPmtDZMCviSOhGCyYupanKmxINdbo=;
 b=kA0DAAoBJNaLcl1Uh9AByyZiAGpwyNHIT1ue/F4HdkJBLOkdMMU7z6E3TP/F+4fzb1kkXBTYB
 okBMwQAAQoAHRYhBK3maKpnVxi1n+Kf6iTWi3JdVIfQBQJqcMjRAAoJECTWi3JdVIfQjN4H/2v6
 nEQa25SSoAPreRwONowf56pMDeqPB5TGvCk6ny+/tu5M7A9mKNsREhdqrDX2MU4XykdmgrGG4DT
 3PZ8h4l52N9AVKsDn2bTWWyQLS26mhx+Ev59OlrnVUtMpcwMgLEd1q1cDuCv/wVS9p7ukrg/KbL
 7aC0Wz8J5wbt2krr3oN642eNpXU+65Uo73kWxc0la6FxVRWkzEvkcP6aSL3luD0STALZ6n3dz5L
 XQJ7Db/hx0dJbrJBEYjDBi4XlzPP8LLdAOj1JDJVkujyP9IQXSu0nXraXzt/aVeZI3/ueqRzNbG
 QjwoBbHyQrKZF70RaAkEG2uw5liUIIOsL+IeYGA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 01 Aug 2026 21:54:41 +0200, Krzysztof Kozlowski wrote:
> regulator: dt-bindings: Correct white-space style

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.3

Thanks!

[1/1] regulator: dt-bindings: Correct white-space style
      https://git.kernel.org/broonie/regulator/c/6f06147a5df6

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

