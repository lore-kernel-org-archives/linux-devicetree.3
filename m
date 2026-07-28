Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEFA3D9699
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 18:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785262205; cv=none; b=EnLt9l8ddeaNtFs5gWk5BeBlXmxjWdsgII34oNSNfyBS8A5MmnfrBB0WkyEEexGw6GCk6Hf4fEfC1IEEBycexqPTU5EnGj5n1qIMlk+Kwc89Kq58zSJp3d/jh8drFjuLMgtbNY4Y6Q6aOk0dNPfikV7MIEfA2qz0xcIkbTLXhTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785262205; c=relaxed/simple;
	bh=/232i3ciMB8NmjWPpB05eROfdV+aUZZlZJYpjtc4qys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l/ZL3YLH23hBsQ3qnhwFcaIjgR/Vidwe0yS4F9jZh0gOstiAlhcCe+S9J3nVNMC1s4ymFW0rAM0jVoU2A2ykQWFy8g1URjIYnXwtZYGcVwZiQTleGb+7lkurC0cq/jYqJspKnpmngWVy93rx6QLgZfjb4OjKm8Lwr+hgYP1Kna4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RBPBdytz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RBPBdytz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08FF61F000E9;
	Tue, 28 Jul 2026 18:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785262203;
	bh=7D4ga2nTYroe9KumgB/K/vLYF94YdrzCaz7ws4KjaX8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RBPBdytzXFnrhilxhA3xuGiJtul7A7YfGACCxzg0FJTzkto9/bhn1AIydHtnpmZLt
	 csGD/jnXEJuFp41xvN8kR4Lg6d7iUuI+VnU/tUsVgDweOlTwXW2MpLScNENyfl3Mjp
	 teBiJaspzjKLbOCfvn/M+/fQqxKRtPwqL9pErapALPzVRgfTCZW54+FOAlzumF4WXT
	 UlIYnp9wX3t+tFzPCpmjUZvREkrU8vsQ0cquCp3D8Xrly1xqPX5OEGmlWp2PQZOa8q
	 FXDnEx11pBohAT9OLpZF6qdXtSeLMLAKsXrPl+Ocn2lCrmB6ulGohuH5KtvywS8ySp
	 KDU9rkyYmLXaA==
From: Conor Dooley <conor@kernel.org>
To: devicetree@vger.kernel.org,
	Ilya Sorochan <k0tran@altlinux.org>
Cc: conor@kernel.org,
	Conor Dooley <mail@conchuod.ie>,
	Emil Renner Berthing <kernel@esmil.dk>,
	linux-riscv@lists.infradead.org,
	e@freeshell.de,
	heinrich.schuchardt@canonical.com
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: fix jh7110 SoC boot from SD-card.
Date: Tue, 28 Jul 2026 19:02:45 +0100
Message-ID: <178526175795.1708098.11834005845749245101.b4-ty@conchuod.ie>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306171939.84568-1-k0tran@altlinux.org>
References: <20260306171939.84568-1-k0tran@altlinux.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=638; i=mail@conchuod.ie; h=from:subject:message-id; bh=wpfuwMxtLYazjXBoDLqpVWtb0tRDw4Q6cCQhVsKkTlo=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFkZ7471haoXZneF96k8OJRoUbjk8ILLs+TORUy/5lw/l znDn0+ko5SFQYyLQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABMxzGT4pzt9rXTYs471Aspz 6lZ7PflxzuX3dO3o2Z+VS5XE/JZ9u8Twz6ruHcMC9/OOK3f/vmh7wCjg3/Q7Sb1z/XdfqLMLcfe t4QAA
X-Developer-Key: i=mail@conchuod.ie; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <mail@conchuod.ie>

On Fri, 06 Mar 2026 20:19:39 +0300, Ilya Sorochan wrote:
> Add bootph-pre-ram to mmc1_pins clk-pins.
> 
> U-Boot pruned their overrides recently in favor of Linux which broke booting
> from sd-card for me and Heinrich Schuchardt [1]. Pruning commit:
> 27f617019dd070cb61f2 ("riscv: dts: starfive: prune redundant jh7110-common overrides")
> 
> [1]  https://lore.kernel.org/all/ffdfc550-559b-4c59-9873-3f040fc3bb0e@canonical.com/
> 
> [...]

Right, I am going to try this again. I don't think there's actually a
valid technical argument against it, since it just affects the stage at
which configuration is applied rather than configuration itself.
If the configuration is wrong, and more devices don't use this configuration
than do, people need to move the node to where they think should be. That
shall be done separately.

I don't want to hear about the politics about whether or not Starfive want
to support it or reverse engineering of binaries etc. All that I care about
is discussion of the hardware itself and which boards need this and which do
not.

Applied to riscv-dt-fixes, thanks!

[1/1] riscv: dts: starfive: jh7110-common: fix jh7110 SoC boot from SD-card.
      https://git.kernel.org/conor/c/42c57c049054

Thanks,
Conor.
