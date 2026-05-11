Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F225E1EB9F2;
	Mon, 11 May 2026 09:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778492200; cv=none; b=EysEm7AkWUAkHkSNhEt/0YXFtXi3hSgK0xt5o7XiSm4IDJm/1obDh4qJo0lkK6QJWXKRv8aUx4d4uZtrVl3OKfPXzEvyEU8UF0GtYiDaCqhkN6zscaH05Z0uonKCUZnvIWyTX8wrKva32QLhC157TmX6L07bUD2UFpyPnWmf3Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778492200; c=relaxed/simple;
	bh=5jGiJLidsSBB080XIP887x11ViSwlqcV9GjyoUO70lQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ffpiUYPdL1Dio0lM9lI9QewFVAAKtPmV5MvCGFin/Vw2Qg9TKWaHVzClJeOYFGpEHdpzTZtIwbD4R7TCMspO3AY+fm5BU859VNF5IPvvQ8bJLi8EzAjsr2C9vBzzcdZ4BJLIBhO+8oSzp2ZwgjO6/exzHGf0srpMf53OxGJ9TTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oliBWciV; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oliBWciV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778492197;
	bh=5jGiJLidsSBB080XIP887x11ViSwlqcV9GjyoUO70lQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oliBWciVS1A3g8/cdFc2H162/uUG9zbvTWQSxj+bk3twuhewNz5Ar6sIKtbHxfUfu
	 inpPHTeqG8+bwjEqjOn+R+JpkLGbh//PiSwRltPyVpSNkUgCDLKYbnelxh1rWa3xSV
	 COSXaMpVNsrc9FKHIOZVZ9fiHi72rGkew//4OpXhR/fBNAZG8I7XoTJjPjCobARrie
	 uI58icH1lm+tYvFk2pQ6Sl/C9kYk5Ebo/u2rcaWgk4hJvLC/2DfcCsORNb34w9evOr
	 HhNb2eBbg3fzNDqt9TJOzuj6PM6FTkxcrP/bR7JXyCkFOEYBk2tUFBX5MkuC1V9SsP
	 p4WGmeNMeY2Ug==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D106417E0CA9;
	Mon, 11 May 2026 11:36:36 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Wunderlich <linux@fw-web.de>
Cc: Frank Wunderlich <frank-w@public-files.de>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Daniel Golle <daniel@makrotopia.org>, 
 Andrew LaMarche <andrewjlamarche@gmail.com>
In-Reply-To: <20260412092333.6371-1-linux@fw-web.de>
References: <20260412092333.6371-1-linux@fw-web.de>
Subject: Re: [PATCH v2 0/4] some BPI-R4Pro dts updates
Message-Id: <177849219680.115964.494791829955697509.b4-ty@collabora.com>
Date: Mon, 11 May 2026 11:36:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

On Sun, 12 Apr 2026 11:23:28 +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> There are some parts of BPI-R4Pro DTS that need to be changed. Currently
> there should be not much users of the mainline-dts and we noticed some
> things while openwrt integration.
> 
> v2:
> - added mgmt port renaming as this patch is still outstanding to keep
>   all in one series
>   https://patchwork.kernel.org/project/linux-mediatek/patch/20260303202006.37515-1-linux@fw-web.de/
> - dropped default-state in gpio-leds patch as suggested by daniel
> 
> [...]

Applied to v7.1-next/dts64, thanks!

[1/4] arm64: dts: mediatek: mt7988a-bpi-r4pro: rename mgmt port to lan5
      commit: 3ee1389fb19691cddc437dd6ba9979100d691051
[2/4] arm64: dts: mediatek: mt7988a-bpi-r4pro: drop duplicate fan properties
      commit: f639e17553da08eff5957e8a2657253a26d47c12
[3/4] arm64: dts: mediatek: mt7988a-bpi-r4pro: update gpio-leds
      commit: 993d54a4f987959998cb47d9cf5f9bb1d35287df
[4/4] arm64: dts: mediatek: mt7988a-bpi-r4pro: rework pcie gpio-hog handling
      commit: 2df54c0b376c2691f6887a4f445d36935b9e8f87

Cheers,
Angelo


