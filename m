Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36A7357D1E;
	Fri, 31 Jul 2026 21:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785532705; cv=none; b=Pf6x0flaBaD4cWJaBdx1cRkSd6dLJPLmEXqUKvEf00SQW8UD+gKFQKxzDaMM3teajZ6fgTaX4BBF52o+9H2lwBUekLWZ8IAKcbZOXGdASeLempwSSKC7WRfRSicRG1kvDgQaSlnJcnOn7IZZa+U9M/QM3+EEHUcZlmw0X5K9Xfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785532705; c=relaxed/simple;
	bh=8/3eRwfhG/zYPFbm64pgbtx+Yp7iYplB/cpEXlNZRy4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=A8LdvN9s/HVgN7SUy2721qeGH89kjQw1I+1OUN3Z0fjkIAwCkvH25mOE7C1cgtrrdOG/IV/MSZPHQ0RRT6T1MbrscxhBc/lYYPTCtBdF58I+mWGSq4IdAWBZ8Y/hdKtZMb41sGQwdveRp0jpdGZgjeHHX5du/3OQySo/RQXUlT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=akHx+lwI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="akHx+lwI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 934721F00AC4;
	Fri, 31 Jul 2026 21:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785532703;
	bh=vdQj1XzECMahdsNpRnDHyOTkVPfswNQ00obKIbbqP9k=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=akHx+lwIDBYyZ+tKfoukJt4qWrQB47DRRaoBpaJF+yZSBKBbe/0T1rmDYhgWfkVWE
	 8lSIP4mpz8c5oktYErPgGtMZSLim2ardr0V5UQDekQjbBlae0gL2/1bvlUigX5dnrG
	 9tT0B/05hQrGJd5rV/rgu9gRM+C3PvULjzL4QJpo3MTBT151TT3S+1i7rk8EhAOpI6
	 iw4FHZnhET4fEsTHSwWdLTkRt1jsCcWXPTDk11IzkCCGT4C0qFfMOXg76aruuqJDVp
	 77Nx2HXzeWeWoZnyucm6IXkvAEuZixU2I5rMqW2pqwSzJzktc0qapcxFWp927zn5YK
	 Mvzr7Fbov35jA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9396C3926653;
	Fri, 31 Jul 2026 21:17:47 +0000 (UTC)
Subject: Re: [GIT PULL] Devicetree fixes for v7.2, part 1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260731204557.GA1777195-robh@kernel.org>
References: <20260731204557.GA1777195-robh@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260731204557.GA1777195-robh@kernel.org>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/robh/linux.git tags/devicetree-fixes-for-7.2
X-PR-Tracked-Commit-Id: bba13ad17b1a11b3f1ed9b3a5d556191d7755a59
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a2cf4ef33184df0ae9e1a2b05b550133dde1698c
Message-Id: <178553266615.908029.3937625269653580604.pr-tracker-bot@kernel.org>
Date: Fri, 31 Jul 2026 21:17:46 +0000
To: Rob Herring <robh@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Saravana Kannan <saravanak@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 31 Jul 2026 15:45:57 -0500:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/robh/linux.git tags/devicetree-fixes-for-7.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a2cf4ef33184df0ae9e1a2b05b550133dde1698c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
