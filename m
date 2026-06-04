Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7103BFAE7
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 06:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780552886; cv=none; b=GrS8mXiDXqZktV5bltCXcuvIrT9ytVS0uKghyJQPLisovgRnbI/x4J3StADcMhzryhNRfFET56Iuq1sA7Kg7s/clfYUEqFoxiSuMYMex2K8E0n/uatnpaAefZql7lN9GRZIeyNgWtGrZbfIdPGT6uRLI+2Rj80TD8OgXcYVwCqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780552886; c=relaxed/simple;
	bh=qPheofKixSze/Y0mOV6JporlRTlqKhJXcmprfr6C63k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ig/PjZw4RsuGCHagMYZa0FPQQqhbg5UrjqA9TU/CNlG6DdS5V4nt/0pjMYY9ceaknaxz05OGsV+WNI4xhYMwiNF9RolWXidZ9hAhs4uWPRn5G07JB+LlncA+vNqFkqRaQIC919dIzIhjXshH7jl6t6UE3cSBpTMp/PoUmTOxGFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H2q79PpH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H2q79PpH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACAD11F00893;
	Thu,  4 Jun 2026 06:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780552884;
	bh=yCg1xI6zGA/m0FPAvLZV/At+1tbXAGnTcZSD7P2FA9c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H2q79PpHAUNQ0JAJVC53AZaPTgCyHRugHrUbyLNkjNnHxOgiwSdjY7xjTmFxPP28n
	 24Ep2rYC2Hup27NIy+uX1nvR++dKo/zP5ICM0vlcptNiqvMnoV4JrpVBn64urOjyP6
	 1Ts1yLLmHm8AxwVXqNQV0He3VEU/zvHChosptHI4P1iBCBOGE7z5fmdrAp9l0JHePd
	 2mGxynyc5P/hebbqbS4BgC4uP6BtJY4188gjsshTXAxU+hGFK3Vx12NESGnj1koXPc
	 4nP0u95BcFuHYiFDficL+xkCyMXgHjTQ6/NErJ8KRbe+63RmtXlF46uXGiM7FfnMbv
	 cqTqrzh1HdU4g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v9 2/6] net: airoha: Remove private net_device
 pointer in airoha_gdm_dev struct
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lorenzo Bianconi" <lorenzo@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260603-airoha-eth-multi-serdes-v9-2-5d476bc2f426@kernel.org>
References: <20260603-airoha-eth-multi-serdes-v9-2-5d476bc2f426@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 06:01:24 +0000
Message-Id: <20260604060124.ACAD11F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Potential deadlock in airoha_update_hw_stats() due to use of spin_=
lock() instead of spin_lock_bh().
--

commit d33fdec52e6f77bf6de4ab248729e1a868e78dc6
Author: Lorenzo Bianconi <lorenzo@kernel.org>

net: airoha: Remove private net_device pointer in airoha_gdm_dev struct

This commit removes the redundant net_device pointer from the
airoha_gdm_dev struct. The code now relies on the netdev_from_priv()
routine to retrieve the net_device pointer. This is a refactoring change
with no logical modifications.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 6574901ebd19b..57a16de0a2ec7 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but I noticed a potential
deadlock in airoha_update_hw_stats():

drivers/net/ethernet/airoha/airoha_eth.c:airoha_update_hw_stats() {
	...
	spin_lock(&port->stats.lock);
	...
}

Does this code risk a deadlock? The ndo_get_stats64 callback
(airoha_dev_get_stats64) can be executed in softirq context, while this
lock is also acquired from process context (e.g., via ethtool) without
disabling softirqs.

If a softirq interrupts the process context reader holding the lock on the
same CPU, wouldn't it spin forever trying to acquire the same lock? Should
spin_lock_bh() be used here instead to prevent this?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-airoha-eth=
-multi-serdes-v9-0-5d476bc2f426@kernel.org?part=3D2
