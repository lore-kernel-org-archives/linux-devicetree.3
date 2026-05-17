Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB042E414
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 05:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778997491; cv=none; b=q6HUBiKQKxG/jVKDMDT5hEeDfj+9uOfLTV1QfcNPxSa5oS+gKDE16YNrAFFen4LzkZf4hLRWIn6czChJ090LDJcLRDh5zdGyg8eZiMqHNaazAITOrS/lyFBzgaehBZs2fbU5kqxNuPAacVDgp3UlUbK3lcpZ1EgiKZUCHJo2zzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778997491; c=relaxed/simple;
	bh=fKGg1EV5bJIdqUE1p3XwA+NOgYu6dbAE0kxTS19j2rU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VmLhFSEyugUiAGdUvq9MivGzSyu8xnAnPvOcuzjBIXOLCYZ/ji0EdVfFCriCcqQ5wRh7P16jZ9JIuyHKi76tsUc1zTulVn7SONchlK4xyHKAf6IwgW4WN7wcGCg3BGNh62lXxDfzMMopjxUaAkRmhlpZA1Py9rYa6ShsomWGPXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NQiOwVUt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NQiOwVUt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39179C2BCB0;
	Sun, 17 May 2026 05:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778997491;
	bh=fKGg1EV5bJIdqUE1p3XwA+NOgYu6dbAE0kxTS19j2rU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=NQiOwVUtliAjyZb4ESgxYprWkvMOduTeEjjiqmta/1Fu8RVsc8/yVr2Kav2gEtZpk
	 txnA2eWWDK4JqacAbNhSxEf8VxOoxEwHoi3wOiO3JJLW9jvoW/aFHwMnqZk4eEJcNw
	 hFMJsRKUqpygJNI+ksi/xtzftI/UlROlXrbOfwDlcjNk6P1UGZXqIgNESFqFlEpN6r
	 e/QJ5Q6PsdiI+Bf4AydQ4v2qeIvpWE/+F7vqptTXXK7uQ87zhZ33ozdalCMrdRJESf
	 l+ZjjMcRwi7zHsgg6yUHcqwwJUUcKsvohXUs9SoqAHIyHS7/2Qg1AzkIySIRhc9yrq
	 5uVaq1qh+afdQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 03/10] net: airoha: Move airoha_qdma pointer
 in airoha_gdm_dev struct
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lorenzo Bianconi" <lorenzo@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260516-airoha-eth-multi-serdes-v7-3-99e0093303e2@kernel.org>
References: <20260516-airoha-eth-multi-serdes-v7-3-99e0093303e2@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 May 2026 05:58:10 +0000
Message-Id: <20260517055811.39179C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Deadlock risk due to using `spin_lock` instead of `spin_lock_bh` i=
n `airoha_update_hw_stats`.
--

commit af5b93ea60b28ce8a1ab1016b0911418480e766a
Author: Lorenzo Bianconi <lorenzo@kernel.org>

net: airoha: Move airoha_qdma pointer in airoha_gdm_dev struct

This commit moves the airoha_qdma pointer from the airoha_gdm_port
struct to airoha_gdm_dev, since the QDMA block depends on the net_device
configuration. This is a preliminary patch to support multiple
net_devices connected to the same port via an external hardware arbiter.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 3ca0dbd19275a..6c9f4b289dba7 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
[ ... ]
> @@ -1560,9 +1564,10 @@ static void airoha_qdma_stop_napi(struct airoha_qd=
ma *qdma)
>  	}
>  }
> =20
> -static void airoha_update_hw_stats(struct airoha_gdm_port *port)
> +static void airoha_update_hw_stats(struct airoha_gdm_dev *dev)
>  {
> -	struct airoha_eth *eth =3D port->qdma->eth;
> +	struct airoha_gdm_port *port =3D dev->port;
> +	struct airoha_eth *eth =3D dev->eth;
>  	u32 val, i =3D 0;
> =20
>  	spin_lock(&port->stats.lock);

This isn't a regression introduced by this patch, but does this spin_lock()
need to use the _bh variant to prevent a deadlock?

This function is called from ethtool paths like airoha_ethtool_get_mac_stat=
s()
and airoha_ethtool_get_rmon_stats(), which run in process context. It is al=
so
called from airoha_dev_get_stats64() via ndo_get_stats64, which can be invo=
ked
from softirq context when queried by a bridging or bonding master or qdisc =
in
the TX/RX paths.

If a process-context ethtool operation is preempted by a softirq on the same
CPU that then invokes dev_get_stats(), could the softirq attempt to acquire
the already-held port->stats.lock and cause a deadlock?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516-airoha-eth=
-multi-serdes-v7-0-99e0093303e2@kernel.org?part=3D3
