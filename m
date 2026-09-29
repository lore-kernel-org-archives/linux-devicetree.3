Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFF8471277
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 23:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790722838; cv=none; b=EtRh6gtaSnnv3dcWWLmOxc0ZnefuN+MfeEl5Odxy86FUYD/v7AMUjzyCb4sxRCzSIgaRyLTlCFHTRohFPnkSolKNu03GCPPG+ppqmSOrNmd4QE9fCLJOWZvnNiyRh5XjqHTC24ofk60xIE+j3DPvzXCe5A7ftYntGTZbpOXrIVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790722838; c=relaxed/simple;
	bh=ifNuWbNaC2cxMjb4RMUC91cbtCmbVutJfSwpkALc9Dc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=liebiTzUp3y8Sv8MIVAo9itwE91ZzBsOlU65ZSfC6tnKIvbWkXF4UXSUTsvnjKcTnEFqxRXW3aOpIeYUBmb/JZ00mfcweIhzbS8cxDnSTcNWzfHtzzZJIdmMOwUuTnGffJ0yzPoR8HaBLnDEe+88qKfGs/UoabdyxErsA1sv8+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nbVjCanB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nbVjCanB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED61C1F000FF;
	Tue, 29 Sep 2026 23:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790722835;
	bh=0eTTzY6t7AFwWvLGbxdPryzBhX+av+qDyZW6bAJmJh4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nbVjCanBfV/X4FwUvAwEIp1syOC7PAPOx15eY8wS1GnxkjYkpQDw0bhW04B4iuv2t
	 XEpHD2kTv2Kf9PT+mENztdnvgeZsZBsOPsQ8BN94sjGfttZ3hhGQ/RKN2Zp0jKwGz4
	 X/PbSK2yoZA0emlXqL8P5+YwCVCeCwppRH1eI3+g5OJjVWfKdWJCYBwmDV0ta2dJ69
	 JDRAbd4CZIu8ifWr0iCUdiVTh+n+1SRlrmpXqPXIjoiENqQpQ0vn0uHSuG0JBm1BNz
	 4Dj1fGyvQoRNPJd/w/kxfufHcqQyciGAQvw/bDL9Bo5pMvVrJOU8QxDTTphPtD19FL
	 wOjCkhE/jPBjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 23/23] media: i2c: maxim-serdes: add MAX9296A driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, robh@kernel.org
In-Reply-To: <20260930-gmsl2-3_serdes-v18-23-43117818f499@analog.com>
References: <20260930-gmsl2-3_serdes-v18-0-43117818f499@analog.com>
 <20260930-gmsl2-3_serdes-v18-23-43117818f499@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 23:00:34 +0000
Message-Id: <20260929230034.ED61C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] media: max9296a: undefined behavior from bit shift underflow whe=
n data-lane is 0
--

commit 6e4f4e297665312f959a24abeb56d6ec1fb1275e
Author: Cosmin Tanislav <demonsingur@gmail.com>

    media: i2c: maxim-serdes: add MAX9296A driver
   =20
    Add a new MAX9296A driver that also supports MAX96714, MAX96714F,
    MAX96714R, MAX96716A and MAX96792A.

> diff --git a/drivers/media/i2c/maxim-serdes/max9296a.c b/drivers/media/i2=
c/maxim-serdes/max9296a.c
> new file mode 100644
> index 0000000000000..7b25b54e63deb
> --- /dev/null
> +++ b/drivers/media/i2c/maxim-serdes/max9296a.c
> @@ -0,0 +1,1461 @@
[ ... ]
> +static int max9296a_init_phy(struct max_des *des, struct max_des_phy *ph=
y)
> +{
[ ... ]
> +	for (i =3D 0; i < num_hw_data_lanes ; i++) {
> +		unsigned int map;
> +
> +		if (i < num_data_lanes)
> +			map =3D phy->mipi.data_lanes[i] - 1;
> +		else
> +			map =3D ffz(used_data_lanes);
> +
> +		val |=3D map << (i * 2);
> +		used_data_lanes |=3D BIT(map);
> +	}

[Severity: Medium]
If the device tree configures a data lane with index 0, could this underflo=
w?

The V4L2 core parses the data-lanes property from the device tree, which can
contain a 0 index depending on the DT configuration. The driver's endpoint
parsing helper max_des_parse_src_dt_endpoint() verifies that lane indices a=
re
<=3D num_data_lanes, but doesn't appear to explicitly check if the index is=
 0.

Since map is unsigned, phy->mipi.data_lanes[i] - 1 would underflow to
UINT_MAX when the index is 0. This could result in unpredictable state
corruption or a kernel panic via UBSAN when performing the bitwise shifts.

[ ... ]
> +	for (i =3D 0, val =3D 0; i < num_data_lanes; i++) {
> +		unsigned int map;
> +
> +		if (!phy->mipi.lane_polarities[i + 1])
> +			continue;
> +
> +		/*
> +		 * The numbers inside the data_lanes array specify the hardware
> +		 * lane each logical lane maps to.
> +		 * If polarity is set for the physical lanes, retrieve the
> +		 * physical lane matching the logical lane from data_lanes.
> +		 * Otherwise, when polarity is set for the logical lanes
> +		 * the index of the polarity can be used.
> +		 */
> +
> +		if (priv->info->polarity_on_physical_lanes)
> +			map =3D phy->mipi.data_lanes[i] - 1;
> +		else
> +			map =3D i;
> +
> +		val |=3D BIT(map);
> +	}

[Severity: Medium]
Similarly, does this code also trigger an invalid shift when evaluating
polarities if the data-lane index is 0?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-gmsl2-3_se=
rdes-v18-0-43117818f499@analog.com?part=3D23
