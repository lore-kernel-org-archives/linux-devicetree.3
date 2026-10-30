Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793336062;
	b=RnRkYiySL0Y4MGur0uD0JZmWwDm1I0CgnsaoRWyzvNfTRAVuuiH1lDCMWdzxN0VGVEu2
	 D7mNnR4gstSOIGC7MmWmBlqrjHj8IFqWoHtgVDCvpT6wG7ifdCis/rIsWvFGDTudsoLPG
	 vsi0DdN1UsIbZi2EGoPDGW2CXaCGuTYtYpWbNgqTcOHy+S1sjYMYwfY8jU5lPrMq7i38v
	 Y2M1rG8KUX9VSCGmR3boOvUzVZGa+ualLo/yEWZUHY8SV/YZQCpthnThIWV2sJZReos1f
	 HskeuMG3qrxCeXB+TKlg7nFjwjEPa69o7ycmvaeYTPXlQC7zlTDP9VQzNvnlQ/fDNfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793336062;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=eUayOPMshW1YPDJGtBg5r0OYLRUdcn8e6zkn1CelX2w=;
	b=PYPBfXBnX0AAUCkEJhiI1EETY/Tz4vrEeHekmz2B8WoHWrZhE8dP8c5RB0AcqWJQx8o2
	 vIPYHTuHl8kgFMQcum2q99XXDUQzy/Shux8RDgCjMtxM6yiI3m2UJbMgZo9KBgSb62PJt
	 azthQ1jt+BgQipwLDovyq1tbnjyHNNNEqlqTQMOeSJuxSPJY/3YCJTCR4r/FWu+G16RJr
	 lGxT3U0uoMlKuXwUi951MAGTz1kFV45yhCPAX9S0QG8jsziBeUOOz0tZcwrmKCYS4PYwl
	 /hoiyRvs5NaQ8kfLOCbXBCxuzB1GQ+ZRW1JhQI9UHmx1e38IdiR3EmN2V4GvISd41Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eSO2taiS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B1A606A325
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 04:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eSO2taiS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71EBC1F00A16;
	Fri, 30 Oct 2026 04:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793336061;
	bh=eUayOPMshW1YPDJGtBg5r0OYLRUdcn8e6zkn1CelX2w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eSO2taiSnvbttMVruWboviRW9rA3Dnq5m9YM6dl5u4qJ22RJ6/tMA2xO8vcEen5FH
	 fxXwBp5pVBF3fSVUp/F45qOZ8LHy+DYvVOeHDMJLnzGY3N8ZdO2P2Aquj+VkzJbHQH
	 t+1XXTNhH1ue075rpBMPJLhqpI78mYDpBdNZbIwuHDzmOourdCmDPM6Tse8vHUTO20
	 s/0esvaUKJ0RpRWHB2Clw1ToO3Jo2E7tHoc+5/TKPJCuxTRn0XX26CWb3pP4RQcfic
	 Zj8wDUMzauIJprd5R+aQre81TUhdv4xFnwsnXUDyNIBJcsBpprdaGNz5+SRzDejhRJ
	 J/9+pQHPEMHJg==
Message-ID: <sashiko-outbox-190435@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 04/12] net: airoha: Move airoha_qdma pointer
 in airoha_gdm_dev struct
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lorenzo Bianconi" <lorenzo@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260511-airoha-eth-multi-serdes-v6-4-c899462c4f75@kernel.org>
References: <20260511-airoha-eth-multi-serdes-v6-4-c899462c4f75@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 04:54:21 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] `airoha_update_hw_stats` uses `spin_lock` instead of `spin_lock_bh=
`, risking a deadlock.
--

commit 15d9ae36a0700634235a620ca1a28c53959a5c30
Author: Lorenzo Bianconi <lorenzo@kernel.org>

net: airoha: Move airoha_qdma pointer in airoha_gdm_dev struct

This commit moves the airoha_qdma pointer from the airoha_gdm_port struct
to the airoha_gdm_dev struct. This is a preliminary change to support
multiple net_devices connected to the same port via an external hardware
arbiter.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 18a89de4d58ab..e0cd401bbf672 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
[ ... ]
> @@ -1562,9 +1566,10 @@ static void airoha_qdma_stop_napi(struct airoha_qd=
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

This isn't a regression introduced by this patch, but is it safe to use
spin_lock() here instead of spin_lock_bh()?

Since airoha_update_hw_stats() is called from ndo_get_stats64() which can be
invoked from softirq context (e.g., via tc actions or bpf), and also from
process context (e.g., via ethtool operations), could a process thread hold=
ing
this lock without disabling bottom halves be preempted by a softirq on the
same CPU that also attempts to call ndo_get_stats64(), leading to a deadloc=
k?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-airoha-eth=
-multi-serdes-v6-0-c899462c4f75@kernel.org?part=3D4
