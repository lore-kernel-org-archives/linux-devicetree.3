Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCA43BED37;
	Mon, 11 May 2026 09:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778492202; cv=none; b=DOx6dUNepT+iTv1WyAXmi9bGblnjATtwtuGupbxRazITA1ClpPGvHIIbdJQQd+5MxXAgfVFQausOJkr7rQzbuTRzdAhFPWQLY2cumrzgUwj9yV4QllrknUOra6xwQg6wSGv/kxKxRNTnu5zlLgAMQeg8kthOPmR1zjGXMlLRjGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778492202; c=relaxed/simple;
	bh=nJVhaxXXmDzSLSMXB0xDuXEWi+DbP7+9iPgK6noFTxE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jnLyy4QzOaDh1FgdEl/i2VjEkxULIQlfjnzgf6hTAr6brNEMpbN79wXd1YSXgQ9TCdgSgkhLfUDq74/fT3eIG7e/MGIcBfMzT2fKHHPS3DDL/7NdcXv4LYFHGy8SSkgSTdmS23MZ+ydM8jB4o1/OyW6WwmDpqEebfCO65i9Fh0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BMQtbLmt; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BMQtbLmt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778492198;
	bh=nJVhaxXXmDzSLSMXB0xDuXEWi+DbP7+9iPgK6noFTxE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BMQtbLmtYmzRVJQj0ueFEwb9UqXJwYhbuP8LgxRTDoc3mLRVdxPPzO5mPXcDPCgb4
	 juEZHmA5wZnRq1K+EWjF5DYmIRYq/WeCO91Rx1dyIeh2X3AGC89xWx06f8oPk7R6eF
	 YJXpCcfGKaMV++I8VjUu8M0HL18amlSXpHx1cftNojRa/ehk3SdB0nlLzaWTaTyH6n
	 BgR5d/1AF2Kpv1BSQklkArpOOR6RS+ZswH7mkrDUOtCHBLuB0VLbdtCS802JQHoZuo
	 A7BRO7PWms7rc/cMugvhtHfbn3D9OsnBKcX5LtMJ0+KrPWg7jOwsTxoVWpMKKPSW2x
	 DcLC+2GZiAS0g==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 18B2E17E139E;
	Mon, 11 May 2026 11:36:38 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Gene Chen <gene_chen@richtek.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20260414-mtk-g1200-pmic-cleanup-v1-0-2a7193ed4e93@collabora.com>
References: <20260414-mtk-g1200-pmic-cleanup-v1-0-2a7193ed4e93@collabora.com>
Subject: Re: (subset) [PATCH 0/3] Mediatek Genio 1200-EVK: MT6315/MT6360
 PMIC regulator supply cleanup
Message-Id: <177849219804.115964.16914242540907037927.b4-ty@collabora.com>
Date: Mon, 11 May 2026 11:36:38 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

On Tue, 14 Apr 2026 13:44:09 +0200, Louis-Alexis Eyraud wrote:
> This series goal is to cleanup the power supplies of MT6315 and MT6360
> PMIC regulators, that are either missing or incorrect in the Mediatek
> Genio 1200-EVK board devicetree.
> 
> Patch 1 completes the MT6360 dt-bindings by adding the missing power
> supply descriptions for its buck regulators, that already handled by
> the mt6360 regulator driver.
> Patch 2 adds for the board the MT6315 regulator supply properties, that
> were added in the dt-bindings by [1].
> Patch 3 adds for the board the MT6360 regulator supply properties and
> fixes the existing one.
> 
> [...]

Applied to v7.1-next/dts64, thanks!

[2/3] arm64: dts: mediatek: mt8395-genio-common: add MT6315 PMIC supplies
      commit: 96d997e13892479b5bb852e42ac65bbaef86ba9a
[3/3] arm64: dts: mediatek: mt8395-genio-common: add MT6360 PMIC supplies
      commit: 2585bab2cdf4331068c5bf626f6625c38c8d299e

Cheers,
Angelo


