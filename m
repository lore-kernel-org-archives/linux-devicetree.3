Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22E85476DD
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 17:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789061508; cv=none; b=YwfnBS82g6P/8C6sAJo+NtKcnIt0gn8eF+M78ZK6vjPM5pgSuAJSs4Sk14ckjeMPSQBqXdF5BkAczIskeD+0rRcj/sBLJizBottHLWnhuQjq0Wo9QPDKKdlQMF6+8OpruYP+oQjcM+w2qAl5dubmokocqbqoSag5ITS6N3spswc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789061508; c=relaxed/simple;
	bh=FaOtqEh6wh7tg7MPwGkf6jxV1YDlvx6j/xiG8sQa+ZA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jj/DLHG/l/gUt2KVFsLn4Pjl+hMrAu4fnIYppw4jqOREYj6P5sepUJi8bZL5txnzVo/KoKWyH6PwI2Uxs0DDa58Q0BOMUBa075i70q5T42o9s5nJJqcsPx+4n6A/U9LcCOJ/afmvkUFu29+6C0Cimrjr2UO1xarwb9vnrS6cvBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CKV4qRfN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CKV4qRfN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1F6B1F00898;
	Thu, 10 Sep 2026 17:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789061503;
	bh=X1bdxRtMFJilQOhgSL1BF0H51WjWTYWFmIK9ZYcByng=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CKV4qRfNZEtMlzXmpDtGRRRkGwDpnV/0/7kiLdTCEjLVtyQ+8sDGQLY60uAJM9iUR
	 M0pYN2Z4kkCFCxZAUXrCJcXMnIpkoL9YC2sGqX9xXltB97iuwt3RbM4fsUCidg8lr2
	 jKvRVuyvJZkPI5ANOkXghgmOOJplCU+VVEm5yADJXXl2RB1sqsiVzotmTl6K64DNs0
	 1a98VtmZWHA4Hy7F89vrrOJZDPUtlKp9kuFZwCUVrtRLU+RD5ar5rnQd28fvBDVlCt
	 FHfuuOrmGWjotosvd7tvGxJ7VbWr+vffySGrHHST+rw1MbYREaTX7+DkShbRLVyi5i
	 /9mTW/3uxCHuw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 09/10] dt-bindings: net: renesas,etheravb:
 Add optional gPTP phandle for Gen4
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund+renesas@ragnatech.se>
Cc: robh@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260909173027.2201560-10-niklas.soderlund+renesas@ragnatech.se>
References: <20260909173027.2201560-1-niklas.soderlund+renesas@ragnatech.se>
 <20260909173027.2201560-10-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 17:31:42 +0000
Message-Id: <20260910173142.C1F6B1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Fatal error propagation from ptp_clock_register() breaks Ethernet =
TX timeout recovery and ring parameter updates.
--

commit c3fb74adfa830cee3ff5a146680ac62339b2b230
Author: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>

dt-bindings: net: renesas,etheravb: Add optional gPTP phandle for Gen4

This commit adds an optional ptp-timer property for the RAVB module on Gen4,
allowing the driver to find and use an external system-wide gPTP clock.
The clock is shared with RTSN on V4H and RSWITCH on S4. The module can
function without it, but will not provide PTP functionality in such cases.

> diff --git a/Documentation/devicetree/bindings/net/renesas,etheravb.yaml =
b/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
> index 1e00ef5b3acda..fad002492421a 100644
> --- a/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
> +++ b/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
> @@ -97,6 +97,8 @@ properties:
> =20
>    phy-handle: true
> =20
> +  ptp-timer: true
> +

[Severity: High]
If this PTP timer is optional, could this introduce a regression where its
absence causes the driver to fail during initialization or timeout recovery?

Looking at ravb_ptp_init() in drivers/net/ethernet/renesas/ravb_ptp.c,
it propagates a fatal error if PTP registration fails:

drivers/net/ethernet/renesas/ravb_ptp.c:ravb_ptp_init() {
    priv->ptp.clock =3D ptp_clock_register(&priv->ptp.info, &priv->pdev->de=
v);
    if (IS_ERR(priv->ptp.clock)) {
        ret =3D PTR_ERR(priv->ptp.clock);
        priv->ptp.clock =3D NULL;
        ravb_ptp_stop(ndev);
    }
    return ret;
}

This error returns up the call chain through ravb_dmac_init() to
ravb_tx_timeout_work() in drivers/net/ethernet/renesas/ravb_main.c:

drivers/net/ethernet/renesas/ravb_main.c:ravb_tx_timeout_work() {
    error =3D ravb_dmac_init(ndev);
    if (error) {
        netdev_err(ndev, "%s: ravb_dmac_init() failed, error %d\n",
                   __func__, error);
        goto out_unlock;
    }
}

Could this cause the main Ethernet interface to become permanently disabled
on a TX timeout if the optional PTP clock fails to register?

Similarly, in ravb_set_ringparam(), an error from ravb_dmac_init() interrup=
ts
the ring parameter update:

drivers/net/ethernet/renesas/ravb_main.c:ravb_set_ringparam() {
    error =3D ravb_dmac_init(ndev);
    if (error) {
        netdev_err(ndev,
                   "%s: ravb_dmac_init() failed, error %d\n",
                   __func__, error);
        return error;
    }
}

Would this leave the network device detached when applying ring parameters
if the PTP clock is absent?

>    '#address-cells':
>      description: Number of address cells for the MDIO bus.
>      const: 1

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909173027.2201=
560-1-niklas.soderlund+renesas@ragnatech.se?part=3D9
