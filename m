Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7A017BA6;
	Mon, 29 Jun 2026 22:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782771162; cv=none; b=O9KWZKWf4VKbIF2rBhG4RuX0lROV8o2YsJAfl8wp+RomQYlSsQOPAU0GyCbG1IpId8hnJW+z6I7YQeBB873itsbBlK3KwjsyyTiprCJt8PXp83bbNTK143dg/LxwRgm3eJCpf+5XAsyAl5VQgBVNgKdUMxXK1fbWjDa0rQ1rOd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782771162; c=relaxed/simple;
	bh=iB2QUIH+jnpnz5OCEwFTlGlxMpaMurfUS2GYKwYpoDA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BIR0pcJL8iZr1OPw8lkPNWsNKJHj5bSqyUJtLU80yM4hlIenxqgJwEbsjJcHtg2fBlIVmT4fWkdJHykl2GAHZYk+rjtjTujq1K3rAVuQMllwfoqGtjoUPQ62ozTZEV8Jz48TndP/yNgmgj+657gV4I/KLZOv6AXTrqx8ot22O54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YG5oIrH+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YG5oIrH+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AFE51F000E9;
	Mon, 29 Jun 2026 22:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782771161;
	bh=8n9le3trkSyiCOdoQQ7qv7ONy8S8pzEvqIJjvhKl0SQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=YG5oIrH+7u+2vG5yyjLSoqJErG9KFnKVH8VxtcUsZw6iAnnRI1lsLV2YWVstIrVIX
	 ySje8nnRZz84eh2EfVzctjJdgk6957pIwY+vwDSNH69oiKLgW7JMjEIN4w75clLFZp
	 Sz0YAN6CSjUADJjX9iB6Vb6iSt0cdNe0vHMdaib/z/v7HOmxzn0avxC4/0DD1+K34a
	 28sjB7H0l+OYbTAUu6KrORpAhkcTJvLqKWaV0+gRiNRaT8PRCyLY98ZvS5NFgxNDav
	 iCtGAegWrTVR4Bdcq0qfPxTgWTQv0gYkjeKNXEOuzJCt7IfMZZf+UDicRORCKqTETo
	 P3u3jnm9xHJog==
Date: Mon, 29 Jun 2026 15:12:39 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Gokul Praveen <g-praveen@ti.com>
Cc: <vigneshr@ti.com>, <kristo@kernel.org>, <conor+dt@kernel.org>,
 <c-vankar@ti.com>, <s-vadapalli@ti.com>, <krzk+dt@kernel.org>,
 <davem@davemloft.net>, <andrew+netdev@lunn.ch>, <pabeni@redhat.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] net: ethernet: ti: am65-cpsw: Fix MAC
 configuration for SGMII mode
Message-ID: <20260629151239.67115e55@kernel.org>
In-Reply-To: <20260629102308.56616-3-g-praveen@ti.com>
References: <20260629102308.56616-1-g-praveen@ti.com>
	<20260629102308.56616-3-g-praveen@ti.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 29 Jun 2026 15:53:07 +0530 Gokul Praveen wrote:
>  drivers/net/ethernet/ti/am65-cpsw-nuss.c | 9 +++++----

you need to cc netdev@
