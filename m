Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87943375F9E
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 10:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786186014; cv=none; b=qUKUtsC8UkfrVknU91BXYoyHCkrW3jOmT3CFqokr4cp0rPaMgz3EwJFR8TCdTUJ9bZAAohohvKjpL+shanRg4zfABoMiCBGWn060KnDPxweA9FeEVqVQ1laGCGTO4TQhqfryIR429Lau4/0PfZE0YtNdbjRZG7c/iQTXbwGR3mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786186014; c=relaxed/simple;
	bh=aFgVvAjfIXzp9U1Ofjg9PKI+c/K9EidRqx/VjpR7+S4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tc8bNkqlsEY7pkkzMhXtFGTYid8yQzFFx7LVi0zy+t/3rskWs3VuEFSdSruB+QZdFcbLk8u+4kxuSBUXL3Np5eO9I25GYp+Ytl754jR/vmxsirp5d08oXz8bGJr1uEe7x0B8IWZOky28pgi33m3asTtS9y8Jlf24KNKq+RIBwkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FarvTK8G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FarvTK8G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 382921F00A3A;
	Sat,  8 Aug 2026 10:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786186013;
	bh=SJdA1+yi/WE05WLzqh1tS9iyK+JEo4O1S8oOLNzULYY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FarvTK8GPXNZxVt5/ahrVle9V46Nd6xYmgjlAqpJl99BU308XbtisFnz5PJ1VYL7A
	 ac6127JVqxTfHmbdQScBZFKpaNSGEEjxikp1vJvlm3ozBIgt9L1Hkb91kxaKJ81f8M
	 TGL0ti4uJI41SBEKahusHR6afspxw3bREjAwvK/+QjrnDfU/3Lr21HL73ONMZ05fUq
	 OR15FxkmRwDhcPZOfOBeBDBK7j2Pxg9EtIhA09fhKShaABZdqfA7wxegHZygv/w4jH
	 /19BSzRDo6HIPBirWaqj3+8/gkXRYdznEuLeAwDyg9mK7QHFktfZicp2CQ+JTJGJ4e
	 J3XjZszDQI5eg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/20] net: xilinx: tsn: add endpoint MAC driver
 skeleton
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nagadheeraj Rottela" <nagadheeraj.rottela@amd.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260807104431.157230-4-nagadheeraj.rottela@amd.com>
References: <20260807104431.157230-1-nagadheeraj.rottela@amd.com>
 <20260807104431.157230-4-nagadheeraj.rottela@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 10:46:52 +0000
Message-Id: <20260808104653.382921F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Dropped packets are freed using `dev_kfree_skb()`, which aliases=
 to `consume_skb()` and incorrectly signals successful transmission to trac=
epoints.
--

--- Patch [3]: [PATCH 03/20] net: xilinx: tsn: add endpoint MAC driver skel=
eton ---
commit 3acdda66dd5bb6201672edaed64d428e5efb7890
Author: Srinivas Neeli <srinivas.neeli@amd.com>

net: xilinx: tsn: add endpoint MAC driver skeleton

This commit adds a platform driver skeleton for the TSN Endpoint MAC. It
registers the netdev, sets the MAC address, and provides minimal operations
for device bring-up, intentionally dropping frames on transmit since there
is no data path yet.

[ ... ]
> diff --git a/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c b/drivers/ne=
t/ethernet/xilinx/tsn/xilinx_tsn_ep.c
> new file mode 100644
> index 0000000000000..9b556edf54237
> --- /dev/null
> +++ b/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c
[ ... ]
> +static netdev_tx_t ep_start_xmit(struct sk_buff *skb, struct net_device =
*ndev)
> +{
> +	dev_kfree_skb(skb);
> +	DEV_STATS_INC(ndev, tx_dropped);
> +	return NETDEV_TX_OK;
> +}

[Severity: Medium]
Since ep_start_xmit() intentionally drops the packet, should it use
kfree_skb() or dev_kfree_skb_any() instead of dev_kfree_skb()?

dev_kfree_skb() aliases to consume_skb(), which triggers the 'consume'
tracepoints used for successfully transmitted packets. Calling it here
prevents network diagnostic tools (such as dropwatch) from properly
recording these packets as dropped.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807104431.1572=
30-1-nagadheeraj.rottela@amd.com?part=3D3
