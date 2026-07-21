Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F9830BF6D;
	Tue, 21 Jul 2026 13:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784639849; cv=none; b=i09B/Ul32FZyAvB+2Ow58BvewA+6pHxV7i4G4VyBK2f0EpHIx/9oPbjlvtX/oGAbzjzbef6UcUm2lMIbFbFFGFKzjsirZciLvhqNGABcHZtnRfXiGzusYHQhJtF25sfhY51gKEE2VHCJ0GiURVcCT9AeN4DuSpJoAqT3wZ6/sio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784639849; c=relaxed/simple;
	bh=R8nUNIgTuASw0mfyVytVdcuNkU/oD+Zh6pHVC1/b5gs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aU/gqBfD6Ael9LYpJp/AyHVuZgBOl024FC9YHDhd82kxK5nPl/TO0GRQSbKUWHHAzvKa7UwlIUy6Lq1v4UW0qlLf26AIE64es1cmq9qkro3AKUXUX2tO+lpd5D/3LKV3ttXC0QI/CCH2aZHJ04mQICCHG18skVn+YE/CtYHscRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qK7Pv3RB; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qK7Pv3RB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784639846;
	bh=R8nUNIgTuASw0mfyVytVdcuNkU/oD+Zh6pHVC1/b5gs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qK7Pv3RBLBhBo2vXcfS4EkPcVoUCSfA4JqVkzR/9Ib1xqM2AxDJoHQ15tq2wzHm11
	 ZHEtoLUhjleO+j8oT1eUc8eI99pA17FCnIOIK2YeKpvQXGkvs7A+iRBrbWO7kxXHDk
	 2levvTtJb3tPEuL+vwoolSyewp6C1ofupQdCh8HbPgRb9mXvRFt2GrtKlJA11qNep3
	 pFeMABjGE04bSdUlr2d2DZ63r64ulGe9mgfRululaRhOxWedlZQBIqgkniO8ZV3x/B
	 0g3wc8qJV+5usCHYbHQnLsN4xsxwvST1hm1QYahG4NviKlB/HBsyiQo1ESXRjZSBmI
	 F7k7l6CotV8wA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F23EE17E0910;
	Tue, 21 Jul 2026 15:17:25 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20260601-mtk-genio-mt6359-pmic-supplies-v1-0-05750080ba59@collabora.com>
References: <20260601-mtk-genio-mt6359-pmic-supplies-v1-0-05750080ba59@collabora.com>
Subject: Re: [PATCH 0/3] Mediatek Genio EVK: add MT6365 PMIC supplies
Message-Id: <178463984593.189936.14763316551159324622.b4-ty@b4>
Date: Tue, 21 Jul 2026 15:17:25 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Mon, 01 Jun 2026 16:15:44 +0200, Louis-Alexis Eyraud wrote:
> Several Mediatek and Radxa boards, based on MT8370, MT8390 or MT8395
> SoC, integrate the MT6365 PMIC, that is a MT6359P variant.
> 
> This PMIC dt-bindings for recently gained property definitions for the
> power inputs for its various buck and LDO regulators ([1]).
> 
> The goal of this series is to add the supplies for this PMIC regulators
> in the following board devicetrees:
> - MTK Genio 510-EVK
> - MTK Genio 700-EVK
> - MTK Genio 1200-EVK
> - Radxa NIO-12L
> 
> [...]

Applied to v7.2-next/dts64, thanks!

[1/3] arm64: dts: mediatek: mt8390-genio-common: Add MT6365 PMIC supplies
      commit: 917b5c98d768a47daff91f2d21a000bc3e24a7a4
[2/3] arm64: dts: mediatek: mt8395-genio-common: Add MT6365 PMIC supplies
      commit: cc90ec9b892061a3e4dbd4e944e18a81758da2ff
[3/3] arm64: dts: mediatek: mt8395-radxa-nio-12l: Add MT6365 PMIC supplies
      commit: 759e989b840b4c2ffdb74cf1e1da0cee66e89f4c

Cheers,
Angelo


