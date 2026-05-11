Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB62833B6F8;
	Mon, 11 May 2026 09:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778492871; cv=none; b=dteC/CbnEduqjVqtWLI3lyedFvZMUfTEypw6n8k8Regz4+H9+i28A/1MaTLI7vgOVr6QOtQ2wKVOfOoEA/9VC4IkVfIaTASN73NtW5Fch0Dp4BjAfGp9m4mEqo/YhK/aQTZmEcRzsIxRYe+V7e/6v4QrBRFB58v3F4abR0UXtfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778492871; c=relaxed/simple;
	bh=S9RiWN9NgxPJbRPcZDB0Q7SHNr9me0DBWxbBSKteiHM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gWzu3WSi7SbmZmklBDwOJSa5uc5fDuy6hdqxuntFukb4bbM7jac88PgUGDjwFVBiE3VRaq28Z6lpovKgJf+dsNcqTz+iJ/eWcTQGhoRfKcm4hT2ZIT2vgUbP02aqlqWz32qwCi34XAh1UW7vY/5XbI3y9o6m4AMWzV+oxDvNHG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FGBzNP14; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FGBzNP14"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778492868;
	bh=S9RiWN9NgxPJbRPcZDB0Q7SHNr9me0DBWxbBSKteiHM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FGBzNP1414puPCP2spGk7cPLW3m1YCAMiMjUXPTCHcUn4ZnH6GXTHArAvV4mXf+Fs
	 2VXPWUbvWkbZXqkMhrhyzHWskuBcNIA4/xbkFacj/X1y7Q7yqY+QYI+oPYplsv/ewW
	 1Gp8fW3I59qyEsfZMOZzzXZ9y0EgFX2mB4xTVOoMvLhGb73Q+UCijkUUNediBYJ32T
	 G8bRG4AuaAvNunaFSjSUioMqadblh7t6fufvLH2o7oU7gUhkRdpOgKos9S7DMFhxv0
	 JHBxgMokwcWfSWQHjF4PrRIZ3ml97R0e5eeIeGXnOA94q/+wEka+LA21dgFeXJ9mmc
	 baiLw9vdv939A==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D9D4517E13B2;
	Mon, 11 May 2026 11:47:47 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 David Lechner <dlechner@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20260305-mtk-fix-mt7623-pinctl-name-v2-0-a68854a51065@baylibre.com>
References: <20260305-mtk-fix-mt7623-pinctl-name-v2-0-a68854a51065@baylibre.com>
Subject: Re: [PATCH v2 0/3] arm: dts: mediatek: fix pinctl node names
Message-Id: <177849286783.117937.17925857758688096977.b4-ty@collabora.com>
Date: Mon, 11 May 2026 11:47:47 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

On Thu, 05 Mar 2026 15:03:15 -0600, David Lechner wrote:
> While passing by, I noticed that the pinctrl nodes in a couple of dtsi
> files did not match the addresses in their reg properties. Here are some
> patches to fix that.
> 
> 

Applied to v7.1-next/dts32, thanks!

[1/3] arm: dts: mediatek: mt7623: fix pinctrl child node names
      commit: 23d304b97e8e20b8d786b82b4d56257dde95139c
[2/3] arm: dts: mediatek: mt7623: fix pinctrl controller node name
      commit: 85fdc6458535d234e54d0968cc816dec9003d341
[3/3] arm: dts: mediatek: mt8135: fix pinctrl node name
      commit: ba6afff1d9b70028a5fc3df2d3acbee501c20a53

Cheers,
Angelo


