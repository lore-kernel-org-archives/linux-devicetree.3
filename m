Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276E7367B9B
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 04:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790571183; cv=none; b=grNnR/KVZvIP41cZgS81nref5scJY7uvfzuDsC978mKfvQ7g1osx0xc5qqobFxibwkQ6OB6iax3xcUSwwtm46atENAhCvh4A64z5zyzzVYsOYpThQwXKZZGsjhyZvT18eU/+jLn+MV9/Bvenz63BDY/866vpnOLETbbIAueojGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790571183; c=relaxed/simple;
	bh=Lc9tusic0eWPAlp4i3c8qKmVmGudl6SOz2SktY2DbPE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tQYsGt09N4U4rpieiON4UnJR46zKEETTNq8uLUZpXcxrWPaOvVpDYSdm3kCoYIHSuDuwwW6hXxz02hjzDKUovaq0/z7H7gLN+MjIJiChXtueY+scrcIjw/iYqlW5yDih0ZeY9d8XFVJ/DmMMFNgSBpGFbTU7HHfNSEJiYebOCmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KPCHIebO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KPCHIebO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65DBF1F000FF;
	Mon, 28 Sep 2026 04:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790571180;
	bh=iBMh/5RY+JKSlpT6v03y01sSH8K0rlURGrlXhUwh5ro=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KPCHIebOPAPzWuMyE5G4+xu1ipQVSqI9+LCghm91gt3x1McYMfqWssd4GkjVPZLlJ
	 DM0FIndV1wYVqA0fGOWF57doV/umbiV8H6nBL2HL3lbDfgN4ktFv6tjhjmEcmfRaA8
	 asKbDDG37mF2PQyP/D/TVWJ111YWYnuNyvgVFYUnw6Xx1NXVor2hNgiEy304V41P4z
	 wUjoyHl3o85ptTEv4OCQXcNJ17KCTTzQZ3k3KO7i+WdTOdnOEUTDHIsvx5KfBiat2v
	 2PKyoUMQGlmuLF0ZZoaUoKeVRQmJ7dgGqgLnPXI6tiDqAiFAb5cXg5dRdJS4+78BnY
	 dmFK1focfqdGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/7] thermal/drivers/loongson2: Use bitfields and
 per-SoC thermal ops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Binbin Zhou" <zhoubinbin@loongson.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <16875dca6130410dbd885c7af347c161c9417511.1790561983.git.zhoubinbin@loongson.cn>
References: <cover.1790561983.git.zhoubinbin@loongson.cn>
 <16875dca6130410dbd885c7af347c161c9417511.1790561983.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 04:52:59 +0000
Message-Id: <20260928045300.65DBF1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] thermal: misspelled function name loognson2_thermal_set_trips()
--

commit 50b534520f37f80d31dade061303171856000e41
Author: Binbin Zhou <zhoubinbin@loongson.cn>

thermal/drivers/loongson2: Use bitfields and per-SoC thermal ops

This commit replaces open-coded masks and shifts with GENMASK() and FIELD_*
helpers, and defines named constants for the Loongson-2K2000. It also
splits the temperature read and thermal zone operations into SoC-specific
variants.

> diff --git a/drivers/thermal/loongson2_thermal.c b/drivers/thermal/loongs=
on2_thermal.c
> index 45fe6100134ee..0660a74fd9222 100644
> --- a/drivers/thermal/loongson2_thermal.c
> +++ b/drivers/thermal/loongson2_thermal.c
[ ... ]
> @@ -64,71 +77,101 @@ static void loongson2_thermal_set_trip_temp(struct l=
oongson2_thermal_data *data,
>  	data->chip_data->set_trips_regs(data, high, false, enable);
>  }
> =20
> -static int loongson2_thermal_set_trips(struct thermal_zone_device *tz, i=
nt low, int high)
> +static int loognson2_thermal_set_trips(struct thermal_zone_device *tz, i=
nt low, int high)

[Severity: Low]
This isn't a bug, but is there a typo in this function name? It looks like
"loongson2" was accidentally misspelled as "loognson2" here.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790561983.gi=
t.zhoubinbin@loongson.cn?part=3D4
