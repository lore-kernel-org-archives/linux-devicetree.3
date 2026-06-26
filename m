Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A451A3EB801;
	Fri, 26 Jun 2026 08:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782462099; cv=none; b=qMje8WhZJyiJJ3GYsgWEca2HjbyVjQVWzTWBkV4NhEBq7mFgC6ukBUMzW9cM5uE7+M5d5UhJOazutI6eG+F59lWDVuz4iMuNnD5YG1PA5EilTMakr50/cwZllknALDx+CcPeCSsEjAwksluKBhmW14EiftJ0EEZ8E5atD9UQhyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782462099; c=relaxed/simple;
	bh=KKfZwsNULbXMXuKQ4L/hsV/GzFEQX4IGUo/kQ+gXwew=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Fkt/U7PqFeL6IEiY1SZucqob/TrCjA0ePzfR3XW9SgFHAOABPD16RI+fLOWWZ9Lt51brEVBkmr7iUFI1vJmV8T5osSbLDnt+GjlGA3Z541Kj1ifF4HOs0ANj5sIKp9uvH46owwEBUyhoc5GGGKI9YEoNbqzNg2B8hCYicsLtGts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJM5zP4G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BJM5zP4G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57AA61F000E9;
	Fri, 26 Jun 2026 08:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782462098;
	bh=OcfJataYZCIIYP70MrY9Og+F3eHYjF96zIois1cHY+M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=BJM5zP4GDATae9/zW4iR8aZvtylByM4rIKA7jgZg+y/9sRqYyzGZs08y0oIdoYlPN
	 PShzN3N+HxTOX6+SIIJmw115s8z3nZC66sBI//P9lakJTw4xt0FNP6KYT7PxX/VOLQ
	 0txPPdqzvOoxWmdhSnSlZ5tvaDAcOhUpRfKYXjTe49tJ/WDGrUH4H/X+NloN6tyteA
	 m0D7MD4OfvNqYnFvbwbuy8OSYy5rzdoxjOpLOnnnzDlW6C9vUVGyo7jT91qMLqjqNR
	 dx907T+7em6jm0UJQWZDoYTnU4hloDE3pYPx7DtxCXGjDtqvQHIrF9k4O5c+Fd3bfG
	 AygpfoSrMrQCQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9396539389E8;
	Fri, 26 Jun 2026 08:21:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1] dt-bindings: soc: microchip: document irqmux on
 pic64gx
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <178246208525.3816447.14558154449045550945.git-patchwork-notify@kernel.org>
Date: Fri, 26 Jun 2026 08:21:25 +0000
References: <20260407-headache-reward-ae93bacdba0e@spud>
In-Reply-To: <20260407-headache-reward-ae93bacdba0e@spud>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, conor.dooley@microchip.com,
 daire.mcnamara@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Conor Dooley <conor.dooley@microchip.com>:

On Tue,  7 Apr 2026 16:29:31 +0100 you wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Being practically identical to PolarFire SoC, pic64gx has a irqmux
> that's entirely compatible with that on mpfs.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> 
> [...]

Here is the summary with links:
  - [v1] dt-bindings: soc: microchip: document irqmux on pic64gx
    https://git.kernel.org/riscv/c/17d9064987ca

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


