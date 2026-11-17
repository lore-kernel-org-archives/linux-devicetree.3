Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939552;
	b=n8sK7VEEDYciGzes7RRQ6rvwNsA3zf19tSqwMWAs3UtAHlcqjKly8NX8ZmhlCyinmGy8
	 nNNGKINRC4yUC6vqDnV2K5YXUkWrt0y9FSkcgpjPfhtfJn/RbXfuzCIGKICxu+65woTpm
	 r9wNttCA+9uAefZBtqmRfqSLC7X3y4vgC3lo5ZMAleHTxDUorqKV4MoHPPNG3jzEKar6G
	 hk37Jmnt7yXsa8LJ02LEOl3XcUPZB1ac9FPg3NQB2dpT5WJJKp+RUnNgq2BF1QBByk2JS
	 uNxrctfKsA8PWh39FOezKRGX8BgSnbOrE2yMmeO7qxNgNS6CwZ0VYLRN6Bo0aqDUFXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939552;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=CW/I17uRA+9OoTPu4DOFZ3sl7gn3y0mirZMDPaSXl+o=;
	b=gu0kd8P/f2G8FyKYqTpThQD2TKadVH9AbGRBZ7N4XsOfga4MKUimutIawnpFSwoBVAv4
	 kaDfKm9FFQT2L+Cwp5h7lXW5vufRyMIXNNqx9p9iDbBFGeW0Ng2O+P4rMMJywVmU3INvL
	 IkMcsDzb58gDKabggb949aomkF2D8o5Oy5Efkbf/rz+X7O8p2KLwSdZMcy94UzW5uwRo8
	 X9n7wWQLINlUmP+yvEKzJq5SmfwGZktMax9fAUpzmnnUvXUi2x1bdxnVPix3iN6lENYLK
	 HTzNYcpNoiEUU0u6NLBCovRL6hiG0e8IUIQcKg6mdnN3BvAqQcWtkcU3/AScyvuRWnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fZCh+R25;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F093B606A31C;
	Tue, 17 Nov 2026 18:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fZCh+R25
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ECF51F000C5;
	Tue, 17 Nov 2026 18:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794939551;
	bh=CW/I17uRA+9OoTPu4DOFZ3sl7gn3y0mirZMDPaSXl+o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fZCh+R25zEsDeFStPRcaQPGJbY+3MapI0tO/jH6dJPLXtA7nRnjHMAoYTP6j+MZxC
	 VPmtIAeYMma3numyw7ToI4T7mUEMzyqRwSK1ax30qKJyQnKMkk3PGRByK91McgnHQW
	 JEbLuIT4Y3nIXKvSuT3AZvCRbdCdbps/8P0CNyDmkSU8xVV5h3IuHqhRKe+9lilNYM
	 bLipzJoFvnpLw38iUU/6fnm5GqZSC2DIElM2RxxY/p1rHTOU6jrplzbtyJEwRUAJYs
	 3Y52Ila56RZsKXU7A7TogR45nGk/+ZZiEAu4BCED6walBUCmOfyI9npB0AOHFA+ggb
	 iutZdY/5HNyaQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
In-Reply-To: <20261117052257.34849-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261117052257.34849-1-xiaqinghuan@mail.ustc.edu.cn>
Subject: Re: [PATCH v12 0/2] regulator: add the Will Semiconductor WL2868C
 camera PMIC
Message-Id: <179493225071.77896.10185420836573973098.b4-ty@b4>
Date: Tue, 17 Nov 2026 16:17:30 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1575; i=broonie@kernel.org;
 h=from:subject:message-id; bh=fMx7Bkqimjjk6heIhmF8dptsJXfqkwgXFBsNOPjpWeo=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+zJrzmUt3tsLLZ35Mvnv9Pi2K8BTfHDjlDX/39YpNi
 /QMunybO0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCR/UyMDPc3al6TmsOy/UPi
 gqNWL22uPHLc4LbGpPIql8bRbuFl8/YzMkz58TzAw/x+T9ezvXP70jg2TUhk/PPpr7/5Fs51up3
 aabwA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 17 Nov 2026 13:22:55 +0800, Qianhui Xu wrote:
> regulator: add the Will Semiconductor WL2868C camera PMIC
> 
> *** AI-assistance disclosure ***
> This cover letter and the two patches below were prepared with the help
> of an LLM coding assistant.  The author reviewed every line, ran every
> gate quoted in this letter himself, and takes full responsibility for
> the content.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.5

Thanks!

[1/2] regulator: dt-bindings: willsemi,wl2868c: add the WL2868C camera PMIC
      https://git.kernel.org/broonie/regulator/c/84e67d2ee13f
[2/2] regulator: willsemi,wl2868c: add the WL2868C camera PMIC driver
      https://git.kernel.org/broonie/regulator/c/602f57223457

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

