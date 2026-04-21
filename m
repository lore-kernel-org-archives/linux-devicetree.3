Received: from mail-m3276.qiye.163.com (mail-m3276.qiye.163.com [220.197.32.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059262BDC0E;
	Tue, 21 Apr 2026 09:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776765460; cv=none; b=Kfc9v91/SYwdwYKxQtbpfuEV20H44csTti+AvEpo86Xm+ot0WfzvqqQkjfC9rN7dYVY9ViJQbsY1W+xfQ4lQri5CLfwnOURXOEkJDII5WMfbZJzMaR+bM3sCJtFzt6EQngyTwnxbQxTxSSVEqIrwHOkE8V3NinxHOqYnND2jwic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776765460; c=relaxed/simple;
	bh=fjkHPG/NH/CuPTcr5lYAI4TDwfTS5OXhRnmxUtSKiwk=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=e60G097xxKjmWo20m3ySS4rCxmz69zo77ACu7j4RqD4CctLJnLjiX2Am3SWweaneWISHPnmhwLrYZz4OPjbSLTie86bgyo0YVD9943V7Pyg9IcXQ9hM7rRTV4BiAjTofWrjd09zxgmUT01+oVghY5fNj90IMunKolBWFB0roq0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=InuH+hFw; arc=none smtp.client-ip=220.197.32.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="InuH+hFw"
Received: from [172.16.12.17] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3b8ce37ae;
	Tue, 21 Apr 2026 17:42:07 +0800 (GMT+08:00)
Message-ID: <3d6b70a7-c199-5986-5580-47467c4972d6@rock-chips.com>
Date: Tue, 21 Apr 2026 17:42:06 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Cc: shawn.lin@rock-chips.com, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add cap-aggressive-pm support
To: Ulf Hansson <ulfh@kernel.org>
References: <1776739609-122962-1-git-send-email-shawn.lin@rock-chips.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <1776739609-122962-1-git-send-email-shawn.lin@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9daf6b235e09cckunmfa81b8e510585f
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCHk5IVk4eTUIaSRhKQxkfQlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSktLVU
	pCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=InuH+hFwTDDBaUTCLz/u5DL4kN5e41aR0vDyjMWiZ9+he+7NBfZhbRE0U8PaF5Tm3AvaeDKBwo2yIr3zWYO2u/6i+wxrwkZUaU8a2BNsoSy7V2wHl2EBJ++YqKnPN6qS7rre7edEJ0Icvi94D74MRX65kHImQfAGJvjTgEFOjlc=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=tAnzLbris520gZDO0p5TB0LB7SInTEk9icdx/psxDXE=;
	h=date:mime-version:subject:message-id:from;

在 2026/04/21 星期二 10:46, Shawn Lin 写道:
> Aggressive power-management is now all-or-nothing set by host drivers.
> This should be board-specific, add a new dt property to support adding
> it via firmware;
> 

Nak myslef.  I forgot we could set it via debugfs now. Sorry for
the noise.

> 
> 
> Shawn Lin (2):
>    dt-bindings: mmc: Add cap-aggressive-pm property
>    mmc: core: Parse property for aggressive power management
> 
>   Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml | 5 +++++
>   drivers/mmc/core/host.c                                          | 2 ++
>   2 files changed, 7 insertions(+)
> 
