Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6453A227BB9
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 22:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783464370; cv=none; b=BL89bL1lajWY3ZWfMGFYUow41P6DvXvrnJ/AhyCJ3LQXcQziytRcyQ6eebJwy6CBd6uHnI6+z+2FE8/uG/HFVstMNUGJZWTOVvPsTFWutZ5ueJO7CTLqLSgi8VAwX0yvqPdc2WEG5zFQe/WgIPYb7Qpfzo1AZIjS8sc9XKfMz6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783464370; c=relaxed/simple;
	bh=Ro6rv2x7e+yI2/2mnNDpuEbbqo2JTfJjhvmu9mEa2RQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XNfkmAJ+m6SFd9SYRbWQ7Glv+DZUvreRCgmV6k3YJbV9UGD2N/CEgyT4qTRm49/ldCrkq/UMXbri2EEU63Sa9q94f9aru0vkJw8HsBBvl/99L7/gwL5SgFYZ3wx3EuCfqJO8MYPzYygJfdtSAFpfxdbJCPmzL/rx2SvoM+7LJEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mm2e5aru; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mm2e5aru"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD8721F00A3A;
	Tue,  7 Jul 2026 22:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783464369;
	bh=KLx4oPTz5QZOHMf5c1DdMBSRvQUXkndYoejGN7NpbIM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mm2e5arucEo1GtRwSZa8Cf4e1zm/7tXrPnEbGR2O7ccG9Fz93jrYCjEYxDRBVv0TE
	 +Zr2yf5RiNP4uWrmpMVUAQDyqEIefUVoKp3LzJKKKCXWNtz8/tyqGGnyHgv8V5nOOm
	 aCAfUPUUy4pEBfvBIxUzqFhkGoFrHUW6MRp6FWdU5Un9P3Du8Gy0fKRPEus/LAP1xv
	 ypsBiMbii3UHnkBQd4nL9nNA+pl6wzVUnJc9+FPk/5LguNVelWt8jkn2tNVdIFVbRw
	 yTP0ZWnk9hsmGdOxJPzZR5jOnfbYKm4yj1yNZoYIY9zbpus7MVp2F1Wm+lp2fDcdUp
	 xYGKODCNWXO0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 09/18] media: iris: Add platform flag for
 instantaneous bandwidth voting
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260708-iris-ar50lt-v6-9-374f0a46c23b@oss.qualcomm.com>
References: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
 <20260708-iris-ar50lt-v6-9-374f0a46c23b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 22:46:08 +0000
Message-Id: <20260707224608.BD8721F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] State desynchronization on interconnect bandwidth update failure, =
leading to permanent bandwidth voting bypass.
- [High] The interconnect bandwidth vote for the 'cpu-cfg' path is permanen=
tly dropped to 0 after the first suspend cycle.
--

--- Patch [9]: [PATCH v6 09/18] media: iris: Add platform flag for instanta=
neous bandwidth voting ---
commit 626a7011b6fd7b2bb9e6fe29e1b8acf22f4ae173
Author: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

media: iris: Add platform flag for instantaneous bandwidth voting
   =20
AR50LT require explicit instantaneous bandwidth (IB) voting in addition
to average bandwidth (AB) when configuring interconnect QoS. This
requirement is due to QSB (Qualcomm System Bus) 128b to
QNS ( Qualcomm Network Switch) 256b conversion at video noc in AR50LT
which is not needed for other IRIS cores.

In preparation of adding support for AR50LT core, introduce
platform-configurable IB multiplier and enable IB voting for all SoCs.
Existing platforms default to IB =3D=3D AB, while AR50LT requires 2x peak
bandwidth.

[ ... ]

> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/=
media/platform/qcom/iris/iris_resources.c
> index 773f6548370a2..caeaf199cef74 100644
> --- a/drivers/media/platform/qcom/iris/iris_resources.c
> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
> @@ -18,6 +18,7 @@
> =20
>  int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw)
>  {
> +	u32 icc_ib_multiplier =3D core->iris_platform_data->icc_ib_multiplier;

[Severity: High]
This isn't a bug introduced by this patch, but does this function
permanently drop the interconnect bandwidth vote for the 'cpu-cfg' path
after the first suspend cycle?

During initialization, 'cpu-cfg' is set to bw_min_kbps. On suspend,
iris_unset_icc_bw() sets all interconnect paths (including 'cpu-cfg') to 0.

However, upon resume, iris_set_icc_bw() iterates through the paths but
only updates 'video-mem':

	for (i =3D 0; i < core->icc_count; i++) {
		if (!strcmp(core->icc_tbl[i].name, "video-mem")) {
			bw_kbps =3D icc_bw;
			...

When icc_bulk_set_bw() is called at the end of this function, 'cpu-cfg'
remains at 0. This could lead to a fatal system crash on Qualcomm SoCs
when register access to the VPU is attempted over the AHB bus without
this bandwidth.

>  	unsigned long bw_kbps =3D 0, bw_prev =3D 0;
>  	const struct icc_info *icc_tbl;
>  	int ret =3D 0, i;
> @@ -36,6 +37,7 @@ int iris_set_icc_bw(struct iris_core *core, unsigned lo=
ng icc_bw)
>  				return ret;
> =20
>  			core->icc_tbl[i].avg_bw =3D bw_kbps;
> +			core->icc_tbl[i].peak_bw =3D bw_kbps * icc_ib_multiplier;
> =20
>  			core->power.icc_bw =3D bw_kbps;
>  			break;

[Severity: High]
This is a pre-existing issue, but can updating core->power.icc_bw here
lead to state desynchronization if the actual hardware vote fails?

This updates the internal state before ensuring the vote succeeds:

			core->power.icc_bw =3D bw_kbps;
			break;
		}
	}

	return icc_bulk_set_bw(core->icc_count, core->icc_tbl);

If icc_bulk_set_bw() returns an error, the operation is aborted but the
software state remains updated. On the next call to iris_set_icc_bw()
with a similar bandwidth, the check abs(bw_kbps - bw_prev) < BW_THRESHOLD
will succeed. This causes it to return early and bypass the interconnect
update, leaving the hardware operating with insufficient or no interconnect
bandwidth.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-iris-ar50l=
t-v6-0-374f0a46c23b@oss.qualcomm.com?part=3D9
