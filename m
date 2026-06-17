Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9112F7F1B;
	Wed, 17 Jun 2026 19:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781723698; cv=none; b=j8DuZn4lVg/S1g/6i8Gu24wZ+rn74Ii56vilktYqe+66dR83hb6b8fSOUNRN7uCxnPSc8GW0jVHPdXW17Hfuwiid2n/Zhc4KsTr58gjbX6tXpBQo7Eqeg3FCWKRK68IukK1kj7Z+IXGKTrzKpPXK4AJbOTM1BU9Fu1P4PoEJZKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781723698; c=relaxed/simple;
	bh=N7EPML084paJRIMPQcht2aY6uT0VvA0oPhbr6DKpoy4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ZUwjWx1z4OO0Bqx/Ln7KO6CEngXWmQMsaYx0fJ1jexwalHV2yNVO1+Pk2ImvqdsqHRQ9OUfDxJoTbEKLyDjeDQoDMEBEBWb7W1wMG+c63io1pUbhVb5NZXfntkIVJ2KLnlduNQ8a000IfLOG04K0eVKLuXk0deyVU+FCBtz/0H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oHPajXFn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oHPajXFn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A03851F00A3A;
	Wed, 17 Jun 2026 19:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781723697;
	bh=ZB0yC7hAZwWZdIXpJcp940sQc/uHmAjc8qxnoMEDgbs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=oHPajXFnO/gLmWI7bNAM4WbwfGNmpi9E2wwDYuWB+OmY7tzXZfwiqalBIn9dwIWjA
	 6Emu7ZqqmICCtOzabHnIAyNQ3ZfqGxCKZcV2HlwYBgqobEE9G0yY/7f4bMWp+yd3+t
	 tu+7Gu3qyy6KJNg7O3teWC3jcnyDfhisTop7eTz+0EqsEJRfDzv3PyUjNVQwluJJSV
	 PDG7E2ZxgflIYYfNQEJO65e9HDL5syuTftIV+3oUDPdDRuK8Zak6C1it51blSsxW+D
	 QjhRz2NJsJ5e/G+1lyOP+Yi0sOUTNyDuqquTYESgczj2QaHuQaaakGI3EC7/jQsU/Z
	 vEH9y5zxnBlZQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0B0A3931008;
	Wed, 17 Jun 2026 19:14:52 +0000 (UTC)
Subject: Re: [GIT PULL] Devicetree updates for v7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260616213229.GA2761475-robh@kernel.org>
References: <20260616213229.GA2761475-robh@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260616213229.GA2761475-robh@kernel.org>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/robh/linux.git tags/devicetree-for-7.2
X-PR-Tracked-Commit-Id: faa25db0892135c97a0bfd48d79173db0dd25ab2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 09fb6892f34abdb6d9b50ae7337b7b7b56dc82d6
Message-Id: <178172369131.1775335.6171220068102784828.pr-tracker-bot@kernel.org>
Date: Wed, 17 Jun 2026 19:14:51 +0000
To: Rob Herring <robh@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Saravana Kannan <saravanak@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 16 Jun 2026 16:32:29 -0500:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/robh/linux.git tags/devicetree-for-7.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/09fb6892f34abdb6d9b50ae7337b7b7b56dc82d6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
