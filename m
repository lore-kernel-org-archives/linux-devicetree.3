Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A462378D71;
	Wed, 19 Aug 2026 18:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787164873; cv=none; b=OPTdu4rnX+mRYAH84lpopzgCiJKguNH2xXQ+crv4l5sADyLkipIleukPiw9uS5bX/epM97fQGwdcMVxjb3fNWkDkC3s2ok9har+Mu800v0fpF84TmPIFavoZg0WL97gblFF9fbgZ5F3RmvIMo/WJo4s5Vz5xRXzT/13dfQ/DRMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787164873; c=relaxed/simple;
	bh=YrP833I6IMeoJOIv8bZNvh/hczHVhMOALks7A8Eu7kY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=NLx3WoEKz5H1m0vxgmJ3J1WQus07CdylOaPpSPDuw2ElpS+IArY9Ba36UvTfe5G4c0n9XEwwP0Kl+7BTTqQzn4yGhr8qTwFU4MzYjzCfuYslU426aE9UiRKnrWHq12a/AOJOxkjOLxJZrBy8w1SEJEQJrkRxRUwtt0vemJ2ASko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SSyFG0G5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SSyFG0G5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71C961F000E9;
	Wed, 19 Aug 2026 18:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787164872;
	bh=aBumycG5mbYXlVw3hGOcz20w4MzBEXWTiPt+nxwS74A=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=SSyFG0G5bEZcZTDByA/EZj3TAOTNAcZhFIlVoEJFM81xFazQznr2NxXpKlyL5TTCn
	 T273GC9tw0m7oVuw5T/iKnAHblMtG5sHIxP952z5szpnaoawbgnOcg/13ZeCFTJuCp
	 TLqMU5LmyJlMwOW1zgLOiZPfWp7HHzQf+oEh8CsL5p4t1dMI6a58jfn+HE63ZBlOmt
	 aZcR6f6CS2C3bHZeELxPp0wbtXa33Bo+o5XTXYVJ2eeHEiucuG7pHik//BE2RgHAVv
	 oMnwqQpPFWgjbfu6pddis51fL48TQs57hPUoNKUkZAnMnfofG3C+sZqt/0LKGAQ15G
	 nGsHEbAioDzow==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93AF438119FF;
	Wed, 19 Aug 2026 18:40:24 +0000 (UTC)
Subject: Re: [GIT PULL] Devicetree updates for v7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260817225130.GA2508968-robh@kernel.org>
References: <20260817225130.GA2508968-robh@kernel.org>
X-PR-Tracked-List-Id: <devicetree.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260817225130.GA2508968-robh@kernel.org>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/robh/linux.git tags/devicetree-for-7.3
X-PR-Tracked-Commit-Id: e1c13aed4a1641550e8c9518c96f016e1d52d09b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c6cf4441a3a05bb7273ed022f3e56c4fc591da08
Message-Id: <178716482315.3644485.1426462805615988504.pr-tracker-bot@kernel.org>
Date: Wed, 19 Aug 2026 18:40:23 +0000
To: Rob Herring <robh@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Saravana Kannan <saravanak@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 17 Aug 2026 17:51:30 -0500:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/robh/linux.git tags/devicetree-for-7.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c6cf4441a3a05bb7273ed022f3e56c4fc591da08

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
