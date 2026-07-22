Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE184D2EFC;
	Wed, 22 Jul 2026 15:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784735208; cv=none; b=XUg4lohNRgY8ArZiB2sU2YuVJkgiBlDbRoMp8DpJ9aMWtJjyolx/D5YyG3rQNGDo41z5A2VftdHc6hPHERyFWUClBzxMpWN03yss24YW3Tqis3TDWxn2WHPfBUHvaYhIBjX1Oj6F1aAUSFjw6XyPhojkXVURc7ZZOITdsZUo1Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784735208; c=relaxed/simple;
	bh=7IVIvVNxxldtQkJgHulmBHdhuZ5yHpSWmuw4D+pHs1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D/Z339cWVF9zAK2P10upUfj97dONj9p5LRS3betpTx0UeZReCbxp4d4PVZr2UhebfAg7OYszjevhlAZ/7omkbgx8aXCyZZgTEOIOATL7HDqZzVhATm+YjTELgwuQ4GyIthVeogcpLG/dxb+zk5nHdb4VppIxJzqWcUGjWOMTPfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MMd3LIqc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MMd3LIqc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A6441F000E9;
	Wed, 22 Jul 2026 15:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784735205;
	bh=9nrjiIeKKD8Gx6LukkoYpq5DLz0jKwg7ibNVwWPKONQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MMd3LIqcR9eZc08C538x3+vfewjPoQD2Qh9Ks9jWUsdIvoSkXiEcgeMbCrm/mLL6g
	 /y3tFXjyeKsvNh2+/M3r3v/npHcsMw9iPfoz+dCINnf7WMY+/vX8DvSybuwgsAMMdW
	 MiDTAb4BjGFMEhzWFt1Kcp5JIKiX6tK3fliwydFMNWnbIQzdbzf+e6gDyZNFa+FA1A
	 f/f3rbl+kC7LPbxlP4IYTL5jjZR0nVrY6C/W/lwkUSsQFL+3OsQ57+zh1Yvgypwn+Y
	 dbDsxYRO+GW7+iDKSbGMuB9OqEreq1tVARDyVOVhFrPO5H1FrIv+1cSES4tguFhBAk
	 DAiebRoRyc+Sg==
Date: Wed, 22 Jul 2026 10:46:43 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, simona@ffwll.ch, jason-jh.lin@mediatek.com,
	linux-arm-kernel@lists.infradead.org, airlied@gmail.com,
	kernel@collabora.com, p.zabel@pengutronix.de, krzk+dt@kernel.org,
	conor+dt@kernel.org, mripard@kernel.org,
	dri-devel@lists.freedesktop.org, matthias.bgg@gmail.com,
	linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
	justin.yeh@mediatek.com, tzimmermann@suse.de,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 12/46] dt-bindings: soc: mediatek: mutex: Allow
 #trigger-source-cells
Message-ID: <178473520265.995028.6530833938909188983.robh@kernel.org>
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
 <20260714114414.184512-13-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714114414.184512-13-angelogioacchino.delregno@collabora.com>


On Tue, 14 Jul 2026 13:43:40 +0200, AngeloGioacchino Del Regno wrote:
> This hardware controls trigger sources, and there's even a generic
> binding just for that: allow #trigger-source-cells in MuteX, so
> that this is allowed to provide triggers to external HW.
> 
> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/soc/mediatek/mediatek,mutex.yaml      | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

