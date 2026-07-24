Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA5B43A7F9
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 14:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784902651; cv=none; b=p1z4YBlpd403PiuD6zMG9o5FZ1RXF0qEHQkL28x1rvMn95acbSHlmO4NFHFtc0wPpWGd1gFUuHhuyD1bRoeUljIQz/azJqpMqPqRxlY9QcARfQmuMqwUYsg7whs3wbYKB/noE3wWsvdHTDAH0hlWP4r6cqL2zS+hkbyhNaCpykw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784902651; c=relaxed/simple;
	bh=vJ6WrudtDthw2hdEGKP7zA+5fjeojgzWQqHkW0APVg4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qKQ9B86ewPMBPoPILu2xUWxzxboLn0/wpNaSl4dgu+9t8ey4gfOl75OTa//8yrX5sqlHMtU7/t06JspG40FliHuUodjAXnHb74NctSwiAI52fkNp61DKUhfdmC3Eu6BPzEZ7sxQ6Afprdp+TvfKic/xDmG+6b3bjhI+i3GXQK+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HcI/Lrtv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HcI/Lrtv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 288A11F00A3D;
	Fri, 24 Jul 2026 14:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784902648;
	bh=w+Gk7hSyNCa+ejeWTJQ63WapP1CVvnA7HCoQaK9pkt8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HcI/LrtvIqIY5JZp/F1pXvQ1kylyPyGWni/LS8cSxTOzgB/Xz3OrrUWJkRKb6rSO/
	 IFSsBmW2lVUIwbQ3SeeGjF/NNXKjWYfnyA2aPttQmxrxk54oV6pMCN/RNqc7+CTNiT
	 msNHeWstF54i7eeJqmuOu2ZNcDKX8CRuiWoVZYV2qxBqAuHjh7rJUOIfMVXYcdhefO
	 HMrZb5ltjkH3Xu4vUdQlk6hWd8XdazC9kQTCHu79006DzWbUVhvDinE88NQ4ibuNiu
	 oPGykN90TzODpMRZNNRJJdcJTcNa+3dls8dYWZqSgko/n3n/SuSRHH6d5/Mm2R/qaV
	 TULRdU8DWZqZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 4/7] net: xilinx: axienet: Add 10G/25G (XXV)
 ethernet support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Suraj Gupta" <suraj.gupta2@amd.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260723123838.125145-5-suraj.gupta2@amd.com>
References: <20260723123838.125145-1-suraj.gupta2@amd.com>
 <20260723123838.125145-5-suraj.gupta2@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 14:17:27 +0000
Message-Id: <20260724141728.288A11F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Premature successful exit from `readl_poll_timeout` when polling a=
 multi-bit mask for GT Wizard Reset Done.
--

--- Patch [4]: [PATCH net-next 4/7] net: xilinx: axienet: Add 10G/25G (XXV)=
 ethernet support ---
commit 5988b03ccef0c2a2d43d3fb883b49b324011c734
Author: Suraj Gupta <suraj.gupta2@amd.com>

net: xilinx: axienet: Add 10G/25G (XXV) ethernet support

This commit adds support for the Xilinx XXV Ethernet IP, implementing a
10G/25G Ethernet MAC. It introduces the XXV-specific logic in new files
and sets up the MAC configuration through an axienet_10g25g_config object.

Link: https://docs.amd.com/r/en-US/pg210-25g-ethernet

> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_xxv.c b/drivers/n=
et/ethernet/xilinx/xilinx_axienet_xxv.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_xxv.c

[ ... ]

> +static int axienet_xxv_poll_link_ready(struct net_device *ndev)
> +{
> +	struct axienet_local *lp =3D netdev_priv(ndev);
> +	u32 val;
> +	int ret;
> +
> +	/* Confirm XXV Ethernet is up: on IP v3.2+, wait for GT
> +	 * reset-done before further register access, then poll until
> +	 * RX PCS block lock is asserted.
> +	 */
> +	if (axienet_xxv_ip_has_gtwiz_status(lp->xxv_ip_version)) {
> +		ret =3D readl_poll_timeout(lp->regs + XXV_STAT_GTWIZ_OFFSET,
> +					 val, (val & XXV_GTWIZ_RESET_DONE),

[Severity: High]
XXV_GTWIZ_RESET_DONE is defined as (BIT(0) | BIT(1)). Since the condition
(val & XXV_GTWIZ_RESET_DONE) evaluates to true if either bit is set, could
this exit the polling loop prematurely before both TX and RX resets are
fully complete?

Would it be safer to use ((val & XXV_GTWIZ_RESET_DONE) =3D=3D=20
XXV_GTWIZ_RESET_DONE) to guarantee the hardware is fully reset before
proceeding with MAC initialization?

> +					 XXV_LINK_POLL_INTERVAL_US,
> +					 DELAY_OF_ONE_MILLISEC);
> +		if (ret) {
> +			netdev_err(ndev, "XXV MAC GT reset not complete! Cross-check the MAC =
ref clock configuration\n");
> +			return ret;
> +		}
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723123838.1251=
45-1-suraj.gupta2@amd.com?part=3D4
