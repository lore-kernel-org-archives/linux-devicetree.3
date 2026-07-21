Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9988430FC21;
	Tue, 21 Jul 2026 13:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784639849; cv=none; b=PhUDhlBbjaAKtMzoFEuM87tbctjoIRCkOfYeNEAcPfk9RbsiJWcMXlJjKMitcCO6I+llIoFxxiGJCnLMVsC/HUtyPjDG/ZgGrRjdv8qz4xv3ZDtjA/Mv+15oOQvbooL+qzhPaE/95wlj51SWWA89HODpx90xc+ETEkPjtdtdZOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784639849; c=relaxed/simple;
	bh=yp3M1gHt3TXHTEHMMHAEKyTfvSrpHVNKd7x50BdY3rk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eODn8wv5Nv/udgO3xz2OnqQIf0vhSZLptFEb2UDUJ6N4YdsFWSoMON/uo+B5BwDro0G2tzMMbC/+SCptHY4tZp+LkTlJWvdbkyLtiumpphdc61JRW+z/JwJEpJN3FQ90IyX2dvU3PHk1qP2L3ekBuzh8aZG/RXUG0t+JnL8oA8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JUCMIfT6; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JUCMIfT6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784639846;
	bh=yp3M1gHt3TXHTEHMMHAEKyTfvSrpHVNKd7x50BdY3rk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JUCMIfT6jo2EwwguVRvnzjZrX906A1e9E0WM/Wa18e7fj7F6ZE4kQOYJnj8YJiWg+
	 Qn78jg84qkqn/i2KqsUlPQhHFE8mhN9UiEq5xmzJoAqh6AifkBGShwwYUQguC0+4rY
	 lC0dOaRoDyuX/Fa5YzUeiOIUZveF8ZFz8h6Ut/OqZ9OnlaOVSIjNDFqKnVRR0i4KC3
	 m0AwHElNIHm7la9dMa5xRgkGn18bCqWun0i2p45Yve8+RXXcp/wIs763gUSObioDC3
	 5k2JgS7jpRe82Rgq9dXKzRMD6SBMZbj+z3CRSP44hUYlFQAb9KLE3Wg7Oahu7pGCHd
	 bWtF+2L5X3giw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8640617E0912;
	Tue, 21 Jul 2026 15:17:26 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20260701-mediatek-genio-mt6365-cleanup-v2-1-78e3d63b8c05@collabora.com>
References: <20260701-mediatek-genio-mt6365-cleanup-v2-1-78e3d63b8c05@collabora.com>
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt6359: use proper compatible
 for rtc
Message-Id: <178463984650.189936.3448118682583676840.b4-ty@b4>
Date: Tue, 21 Jul 2026 15:17:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Wed, 01 Jul 2026 10:38:21 +0200, Louis-Alexis Eyraud wrote:
> The MT6359 PMIC include file uses directly "mediatek,mt6358-rtc"
> compatible string for the rtc subnode, but not its own compatible
> string.
> Now that the "mediatek,mt6359-rtc" compatible is properly declared in
> the dt-bindings, use it with "mediatek,mt6358-rtc" as fallback.
> 
> 
> [...]

Applied to v7.2-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt6359: use proper compatible for rtc
      commit: 3dc552c1bab6e83bb45af0a49f3a900845a24495

Cheers,
Angelo


