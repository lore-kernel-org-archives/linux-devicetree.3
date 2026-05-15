Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8B93EFFA6
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 17:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778867197; cv=none; b=NJBBr8CbCnk6BsCiYqvfLhR9h6rVH31XPLYAQVjZF5FBzTPv+RqTnc0c12SEzE1qMmuWViQpW/2ey/TaPkqsmfUPwqOQfIsRbnxUJ+8QB2K5dNd1Yie85O1OCYH69Eo9haGX/c6Ev1xNQg8+/cQP5h90BqfDUXVUBDMCFa/NdOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778867197; c=relaxed/simple;
	bh=mdRe6QuXA6oiJX8GbDhkCFUjeKZk89BXf0bia5Ra5dI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g73fVDavwfYsBQfbLzOTgpO+NblfuGAjDwZgukghd5cYbxeOeCU1/zfKRBFqhxNuR4/DKn48I3ikrCEn6eC5Ad+tyXJcOSxK47dNteiF6Xtu5A1wDVDCABQ0EadOhGSxx3eLB3//lfw2p4JAY/PFA70i3bMEvtW3EluNmKA4nl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b0gX6RD3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b0gX6RD3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D344C2BCB3;
	Fri, 15 May 2026 17:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778867197;
	bh=mdRe6QuXA6oiJX8GbDhkCFUjeKZk89BXf0bia5Ra5dI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=b0gX6RD3sn2gVDt+yI/kfyo6kP8uZ95DEle9SqLuwEmBEdq5vodu/9Chj3LF0cGrG
	 y/6GqCkJD0h5TXyWIxcjQs4ajWHnZhCXhuv4lXbnitP/MZF3U2/0eK1OalqfqOyTlI
	 ELaJUsvxfrbttYCU/QQJFjg9DnpTsCGtAhO45g9a05pFkahzXXjrJ7QI7R+n9XC7/b
	 n/KrpoaGN8MVpdrCy0H3KcYz8mhc+Qw2BKhm8UdrldtNwptT1ORxUH+zZlXITOILoB
	 FQu6pizS2ilfylwvANvz/cdRuaAU8DaEzdyuhIkP3WJ6zVWrr0lSctLGai6hSym+Wp
	 sJuNtGjKDu6Jg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] memory: tegra264: Add full set of MC clients
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sumit Gupta" <sumitg@nvidia.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260515171911.1929868-1-sumitg@nvidia.com>
References: <20260515171911.1929868-1-sumitg@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 17:46:36 +0000
Message-Id: <20260515174637.1D344C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Newly added BPMP-managed memory clients are missing their `.bpmp_i=
d` and `.type` initializations.
- [Medium] The `tegra264_mc_clients` array is not strictly sorted by client=
 ID, contradicting the commit message.
--

commit fefb4bd46910389b4d7cd1d39ffbe180883f7665
Author: Sumit Gupta <sumitg@nvidia.com>

memory: tegra264: Add full set of MC clients

This commit extends the Tegra264 MC dt-bindings header and
tegra264_mc_clients table to cover the full set of memory clients exposed by
the SoC.

> Extend the Tegra264 MC dt-bindings header and tegra264_mc_clients
> table to cover the full set of memory clients exposed by the SoC.
> Client name is used for MC fault reporting. Clients managed by the
> bandwidth manager in BPMP additionally carry their bpmp_id and type.

The commit message states that clients managed by the bandwidth manager in
BPMP carry their bpmp_id and type. Should these fields be initialized for t=
he
newly added clients like NVENC, NVJPG, ISP, PVA, XUSB, and TSEC?

> diff --git a/drivers/memory/tegra/tegra264.c b/drivers/memory/tegra/tegra=
264.c
> --- a/drivers/memory/tegra/tegra264.c
> +++ b/drivers/memory/tegra/tegra264.c
[ ... ]
> @@ -110,6 +208,12 @@ static const struct tegra_mc_client tegra264_mc_clie=
nts[] =3D {
>  		.name =3D "rcew",
>  		.bpmp_id =3D TEGRA264_BWMGR_RCE,
>  		.type =3D TEGRA_ICC_NISO,
> +	}, {
> +		.id =3D TEGRA264_MEMORY_CLIENT_NVENC1SRD2MC,
> +		.name =3D "nvenc1srd2mc",
> +	}, {
> +		.id =3D TEGRA264_MEMORY_CLIENT_NVENC1SWR2MC,
> +		.name =3D "nvenc1swr2mc",
>  	}, {
>  		.id =3D TEGRA264_MEMORY_CLIENT_PCIE0W,
>  		.name =3D "pcie0w",

If the bpmp_id and type fields are omitted here, they default to 0. Would
this cause drivers for these components to inadvertently pass 0 as the clie=
nt
ID to the BPMP firmware when attempting to configure interconnect bandwidth?

> Entries in tegra264_mc_clients[] are sorted in increasing order of
> their client IDs, which matches the order of the override and
> security register offsets used in previous SoCs.

This isn't a functional bug, but are these entries strictly sorted by their
client IDs as the commit message indicates?

[ ... ]
> @@ -185,6 +289,402 @@ static const struct tegra_mc_client tegra264_mc_cli=
ents[] =3D {
>  		.name =3D "nvdecswr2mc",
>  		.bpmp_id =3D TEGRA264_BWMGR_NVDEC,
>  		.type =3D TEGRA_ICC_NISO,
> +	}, {
> +		.id =3D TEGRA264_MEMORY_CLIENT_MIU5R,
> +		.name =3D "miu5r",
> +	}, {

Looking at the tegra264_mc_clients array, GPUR02MC (0xb6), GPUW02MC (0xb7),
NVDECSRD2MC (0x78), and NVDECSWR2MC (0x79) appear immediately after
PCIE5W (0xe3), and the newly added MIU5R (0xfc) is appended after them.

Could this mismatch between the array's actual order and the commit
message's claim cause confusion during future maintenance?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515171911.1929=
868-1-sumitg@nvidia.com?part=3D1
