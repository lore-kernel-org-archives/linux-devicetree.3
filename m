Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B51D3AF676
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 21:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778707070; cv=none; b=l8DE9pvItnKkZqp4LN2Hqrc8pN5xlVq+o0ayyXyN9SxWge6H/7yH5ECzgUmuHB45rrp1L+MJ650eaOE8kIad7XeDXjeEcWrjBz6jB3mU96dTtEAcSJEwCyVeWeczZ+TWkHez0E5gM1oWcednEusLse+Hg0RGb/XT6aliT613RG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778707070; c=relaxed/simple;
	bh=dg5iZbRjNzxSG0sVnUqN1u0olhHELHMC/iUtnEhkkQs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mFGNhQ8bLzRhuQCm/ng46vjUt8pf0uhyUMWxJxlwX1DWlEMpi6W9G27ZmhjmZgMhkwAa+8zqnpPRDoCjWdmchXfQhxUeTQJ5+SmceuxMOh2SokBs37gkhhGkRvPkDI+vCkTFw2vX0Ima2J1tXPVBw+IjhU1TFFIsrKmcFEvRP6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=py49kr8g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="py49kr8g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 690A2C19425;
	Wed, 13 May 2026 21:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778707069;
	bh=dg5iZbRjNzxSG0sVnUqN1u0olhHELHMC/iUtnEhkkQs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=py49kr8gn79GE+eauH3SUwLNexKjeq4/gUyk+DwCXc26g0IYJSqrbTZ4PqzXJWUki
	 OiSqrkYLRAErevsnh8VrixKjhHrY0BniE8ZO5VK5vUZiJ+f1M3/tKsvVnNgvxeYqXI
	 PJcFfM249A+pR/q1hPf59VvvgY+rZOyTIBtSlIDzE/hferX2VYmLT++d+fxvdIJ1G+
	 MOyj+an6ard56PLfk5wa4y5opDdjHCN6xWXY2W4Bw1MWn9o4lyVIIR2/ObDNBTndn7
	 jILP6qjPLwF84ALomPm2tLtu6H5eC+Mm5J9ZyWzcDdHtrQMEbH5/U1DqbRFafKqc6G
	 fygZA+zCWxBNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] interconnect: qcom: eliza: Add SDCC1 slave node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-2-b1edf81bac3b@oss.qualcomm.com>
References: <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-2-b1edf81bac3b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 21:17:48 +0000
Message-Id: <20260513211749.690A2C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The newly added `qhs_sdc1` node is missing from the `bcm_cn0` Bus =
Clock Manager (BCM) configuration.
--

commit d28b10055037729ce3f753377d62887c5022c5c1
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

interconnect: qcom: eliza: Add SDCC1 slave node

The Eliza interconnect provider is missing the SDCC1 CNOC CFG slave
node. Add qhs_sdc1 to the provider node table and qsm_cfg links so
SDCC1 interconnect paths can resolve to a provider node.

> diff --git a/drivers/interconnect/qcom/eliza.c b/drivers/interconnect/qco=
m/eliza.c
> index a4f7903f0524d..6d12a1c3c034f 100644
> --- a/drivers/interconnect/qcom/eliza.c
> +++ b/drivers/interconnect/qcom/eliza.c
[ ... ]
> @@ -392,7 +398,7 @@ static struct qcom_icc_node qsm_cfg =3D {
>  			&qhs_mss_cfg, &qhs_pcie_0_cfg,
>  			&qhs_prng, &qhs_qdss_cfg,
>  			&qhs_qspi, &qhs_qup1,
> -			&qhs_qup2, &qhs_sdc2,
> +			&qhs_qup2, &qhs_sdc1, &qhs_sdc2,

Should the newly added qhs_sdc1 node also be added to the bcm_cn0 Bus Clock
Manager configuration?

Currently bcm_cn0 contains qhs_sdc2, but qhs_sdc1 is missing:

static struct qcom_icc_bcm bcm_cn0 =3D {
        .name =3D "CN0",
        .enable_mask =3D BIT(0),
        .keepalive =3D true,
        .num_nodes =3D 43,
        .nodes =3D { &qsm_cfg, &qhs_ahb2phy0,
...
                   &qhs_qspi, &qhs_sdc2,
...
};

Without being added to the nodes array and incrementing num_nodes, it appea=
rs
any bandwidth requested by interconnect paths targeting SDCC1 will be ignor=
ed.

Will this cause a regression where the SDCC1 config path is prevented from
scaling the CN0 bus clocks?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-eliza-inte=
rconnect-add-missing-sdcc1-slave-node-v1-0-b1edf81bac3b@oss.qualcomm.com?pa=
rt=3D2
