Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795083606;
	b=l6DuhcQU/BckxBAc+JhAUNznUfCOwB3yfmzlYYhT+bXb6mobgrGdA8jBVxNl9xU6YaJ6
	 Ze4LRaA2uUOgCXZHydJTQv11Id1ijcGNyQqrxWpc10JW4IRWSlj/JccLy+z1cGP5dZiKf
	 8c6SFJJiMPKNi4Gke6xlZLcnXb4xosaFglzZ7eOYCiioirMqJys67Y5wbnTJis4mXnFMK
	 tUA9czAh6p2otbrB6wr43scNIjrxjVoO67vX+n0cRri1OdbO+eksE7nBXtDkSJkBkQYZa
	 pdYI83yaiBXz9hjQIb2vPX1roiGr0Bju3c35czTxAD/Cg2zojTte/pBsQmL/8qhrB9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795083606;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=ARp8y0YRU3ej2yIzpOoEEAioGb8LlMiVU57DajBVeXA=;
	b=Cs8keNRG+i1GPCam7Bpqo9743NS5hOg4JO2R5Bpr3eBKJLvcn31HPxKOukZ3H6epZB8l
	 Bg+mjeqh/Bdmx0ZtMXOJrIv84Og4mWqKeDEhMRWtC5TUN0w8Ar8IlK6hlTp0XwQFVbqKk
	 N9m2J1MW+wu+ooTEVXVCwcnYmKSEWsVeK7Q/hpXgtE1E08wwc1j5BGCL2Lh30L1ALuTAJ
	 +JOrUP3gmt5LutmPsr7jHYZEJww3M75meErDil5t0J8fvqJcAjC4x9DyJfSIoj/S/RiE7
	 1fGrIyQSSyrx4dCpuzTuyPa2SNM9G2hg7d5WxQphcwedn3fL4dUVg6IxOPsUaNFjA1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FCRGCIqP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DF0606A32C;
	Thu, 19 Nov 2026 10:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FCRGCIqP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 817501F000C5;
	Thu, 19 Nov 2026 10:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795083606;
	bh=ARp8y0YRU3ej2yIzpOoEEAioGb8LlMiVU57DajBVeXA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=FCRGCIqPryc0b4d2DAzLKXBePu7S3vfvvYPmc280yHnSwDaC0hrpAPe/82N6cCClf
	 QVEwbMOUaleo1o3lGl6vSd+2u/mEb5908uYONFsvcqCIKdekBwkD58xo45zRzlvpXT
	 tfQ0O0m6PlogihewXi1nzYTKnXWh6wIT+2gvSYZMyaiism6huBGhzf/CMyA57+TXkF
	 Jo/OxRh+YLE5z/re99NMRRMtbUTbm+RtEZkRyt1awSZJtUHvHpwTYmhVNpm/E/RZq7
	 TSgMEFSGD7F5Lno/zWcwpBHrCj4XSOrBsn0crVchfcTXKGLROHvpEMNs5AZpikf+Yo
	 u2ZuR0HtynEAw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 773893808210;
	Thu, 19 Nov 2026 10:20:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v6 0/2] net: wwan: qcom_bam_dmux: Add restricted
 DMA pool support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179508360528.2997070.12306679425844705945.git-patchwork-notify@kernel.org>
Date: Thu, 19 Nov 2026 10:20:05 +0000
References: 
 <20261112-qcom-bam-dmux-vmid-ext-v6-0-7a16bd3dff18@oss.qualcomm.com>
In-Reply-To: 
 <20261112-qcom-bam-dmux-vmid-ext-v6-0-7a16bd3dff18@oss.qualcomm.com>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: stephan@gerhold.net, andrew+netdev@lunn.ch, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, loic.poulain@oss.qualcomm.com, ryazanov.s.a@gmail.com,
 johannes@sipsolutions.net, edumazet@kernel.org,
 linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 deepak.singh@oss.qualcomm.com, krzysztof.kozlowski@oss.qualcomm.com

Hello:

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu, 12 Nov 2026 14:43:30 +0530 you wrote:
> Some Qualcomm SoCs, such as Shikra, run the modem in a separate security
> domain with restricted access to system memory. BAM-DMUX DMA mappings
> and BAM descriptor FIFOs must therefore be constrained to a designated
> memory region that can be shared with the modem. Accesses outside that
> region can trigger an XPU violation.
> 
> Add memory-region and qcom,vmid properties to the BAM-DMUX binding, and
> a qcom,shikra-bam-dmux compatible that requires them. When qcom,vmid is
> present, the driver SCM-assigns the entire restricted DMA pool to the
> local and remote execution environments before requesting the DMA
> channels.
> 
> [...]

Here is the summary with links:
  - [net-next,v6,1/2] dt-bindings: net: qcom,bam-dmux: Add memory-region and qcom,vmid properties
    https://git.kernel.org/netdev/net-next/c/ed5087bd84ec
  - [net-next,v6,2/2] net: wwan: qcom_bam_dmux: Assign restricted DMA pool to remote processor
    https://git.kernel.org/netdev/net-next/c/a5ce83fc0b37

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


