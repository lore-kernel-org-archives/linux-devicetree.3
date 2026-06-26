Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FD32D8767;
	Fri, 26 Jun 2026 20:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782504081; cv=none; b=qCjO4AykG9HcV8cXZ5Fu5JZ3SmbsIHj1KRL2t/XsKbmDymf26EbFdcxXxvugJzz4FA/z8rHx+LOyDo+WScokwQGYvRBns9mD0I4w+u5+Vi4Zt2HA6hYm4C2/rPSc8ubIG+WPCVILukR/ATEs6fLuzoz8HYUfEIpHSAMAXCL4Ff0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782504081; c=relaxed/simple;
	bh=YfV+4JEHQut0Tj4bSHZ39cY262mqNHYmFIuAYutra9Q=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ZV8QWaOKb9auZl08NniBAEDcu71nrFXu2HENXG75wWwSFVIRv0O/g5DD9E1TwW3qDLmJobADOaFRd0iEkiBJpRI8roQ3EsS8OF4N5JxHF2lyNajeYPYLw8Z5jmex7ivSV3fN0Igae9UQ11l/4uMorAaP87se6wQ91VRA9XT+YxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UOwZ1/tG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UOwZ1/tG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F621F000E9;
	Fri, 26 Jun 2026 20:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782504080;
	bh=N+gCNHdf9GvZp/8h1OmtunGbBXZTCcFwdChn8s6KM8s=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=UOwZ1/tGgUONkUX5MasgjzqolKK2y2K+ukmtSSDgJvx1fsgwsGBoa8Z9juj+u/CjZ
	 EGDymylWcSHA0l8YM60N1vet3O4H4NvmQeQLvTZQ+dVW3eaHBoKemzFjuduUC30vrT
	 g9JEpKTUVJTf0teL25zvdr5q/66oBxRySq/IGJlE6ykCaecV8kdBeK96D6qKu7g4K+
	 xc5wK1dMVNMtJpmhKU6Xe6A95ewUZNX70SHB+467TbvfhGw9mJ8Z5eI3ur3RoibgFq
	 Nuf5pyIkBi6DIDOdfGE07ykUrIe3SOhuY8QUfoaWgzjKMAnkZKtY35UE2aVIOEmUMQ
	 X5/L2itDqWeIQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 199193938C5D;
	Fri, 26 Jun 2026 20:01:08 +0000 (UTC)
Subject: Re: [GIT PULL] Devicetree fixes for v7.2, part 1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260626133834.GA2142045-robh@kernel.org>
References: <20260626133834.GA2142045-robh@kernel.org>
X-PR-Tracked-List-Id: <devicetree.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260626133834.GA2142045-robh@kernel.org>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/robh/linux.git tags/devicetree-fixes-for-7.2-1
X-PR-Tracked-Commit-Id: b39a6b2e9d5bd6a3153aed4c7440172b8f6a739e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fc91b7d77d78c6381b437b7c96aca6b03f7bbfed
Message-Id: <178250406667.1075722.584363152520973322.pr-tracker-bot@kernel.org>
Date: Fri, 26 Jun 2026 20:01:06 +0000
To: Rob Herring <robh@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Saravana Kannan <saravanak@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 26 Jun 2026 08:38:34 -0500:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/robh/linux.git tags/devicetree-fixes-for-7.2-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fc91b7d77d78c6381b437b7c96aca6b03f7bbfed

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
