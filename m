Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4CD3EF67D
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 09:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783589518; cv=none; b=VBw+/2n/E0HeaVPlzJbHz4SEim3L6vSzSy1yDhNFw8+CqJ02JJwddkTIm/qjILavnnmVvlf1bzLx2aBcAQNIhhmxRS1hA2+kYTBhLpava7+s+kH9k1lHJKhfAsN5dexPSYcxB6hZIFD6td6Na43rkhWpnh7YXEWCN0YZm1gSEYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783589518; c=relaxed/simple;
	bh=l2s7z1DPjGpuvtq/vawBZj92/4kAb/HjxNAsZhtQ2Ok=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=V6KNEfsVT0Lgu21741mYBhhevCUx8DhOc4BdXX6dTNVd8cUYZ59Myr8tM6iSHU/8XA5vCicT7G0jlYBZx/wreh1Pg6aZdLMcOb+dpNKnK7cEmsse6iOboUF7wC26dtDW4eoZ/dM4ocxiUAiVzJfha7xtVnGnWRoM3qqKtAj9czU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KaZy2q9R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KaZy2q9R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 382441F000E9;
	Thu,  9 Jul 2026 09:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783589514;
	bh=Bw8WD2xOXXPBgVhhzfYlfoGl0V5j1mB4zuZPEC5w5xY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KaZy2q9RHfTNubAgHKhLf7biUW4i6cn+nhFAw2AOnLUj9PqbAHCj2iu/MEYGwBqdb
	 9gwLFJIL6jfHhE7BathEYxSxzctQwTLty8w4pkC3GKIqchPg7yf/F3Qy7bKmgpKxJL
	 rQw88+w/ySLkpOWnm131Fjohh3qbxXjMj8j0QMg42XW9cvE8hxXDmYFZ4BIEyktEJG
	 mkRwWIF8pidJTuLcYEAYSXehkabRY6FBj7RSRsQckwAV0lzdjpAUc1Ybchu5O7FrIt
	 az0jMRPs/N6wNSvDaHU8TgG5WyOaPKOsxdL1m7sxwIfPEj/W0SddUw3UxZSLTjlh6J
	 dEJGO7xFWzNGA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/6] Bluetooth: btqca: Add IPQ5018 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem" <george.moussalem@outlook.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260709-ipq5018-bluetooth-v5-2-e476c41f03b8@outlook.com>
References: <20260709-ipq5018-bluetooth-v5-0-e476c41f03b8@outlook.com>
 <20260709-ipq5018-bluetooth-v5-2-e476c41f03b8@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 09:31:53 +0000
Message-Id: <20260709093154.382441F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Incomplete implementation resulting in dead code: the QCA_IPQ5018 =
SoC type is not mapped in any device tree match table.
- [High] The implementation unconditionally skips downloading the required =
rampatch firmware `qca/bt_fw_patch.mbn`.
--

--- Patch [2]: [PATCH v5 2/6] Bluetooth: btqca: Add IPQ5018 support ---
commit 388a60ab03a30caa9b4a4e153c1ccb4a83f4283c
Author: George Moussalem <george.moussalem@outlook.com>

Bluetooth: btqca: Add IPQ5018 support

This commit adds the IPQ5018 SoC type and support for loading its firmware
for Bluetooth support.

> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> index 22b08ab05b829..f5ded8fb1e3ab 100644
> --- a/drivers/bluetooth/btqca.c
> +++ b/drivers/bluetooth/btqca.c
> @@ -775,6 +778,9 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baud=
rate,
>  	else
>  		rom_ver =3D ((soc_ver & 0x00000f00) >> 0x04) | (soc_ver & 0x0000000f);
> =20
> +	if (soc_type =3D=3D QCA_IPQ5018)
> +		goto download_nvm;
> +

[Severity: High]
The commit message explicitly states that qca/bt_fw_patch.mbn is needed,
but doesn't this goto statement unconditionally skip the entire rampatch
download block?

If a firmware-name is provided via the device tree, it appears it would
also be incorrectly loaded as the NVM configuration instead of the rampatch
due to this jump.

[ ... ]

> diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
> index 8f3c1b1c77b3d..343cd62d11371 100644
> --- a/drivers/bluetooth/btqca.h
> +++ b/drivers/bluetooth/btqca.h
> @@ -158,6 +160,7 @@ enum qca_btsoc_type {
>  	QCA_WCN6750,
>  	QCA_WCN6855,
>  	QCA_WCN7850,
> +	QCA_IPQ5018,
>  };

[Severity: High]
Is there a missing device tree match mapping for QCA_IPQ5018 in hci_qca.c?

Without adding an entry like qcom,ipq5018-bt to qca_bluetooth_of_match,
it seems the driver will never probe the device and soc_type will never
be set to QCA_IPQ5018. This would make the newly added firmware loading
logic completely unreachable.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-ipq5018-bl=
uetooth-v5-0-e476c41f03b8@outlook.com?part=3D2
