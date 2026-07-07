Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB9426FA60;
	Tue,  7 Jul 2026 10:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419852; cv=none; b=LYPhUJ/h079drlaqgXcwHvI/ashbPr02AaTrPnmDM0SDg2whscRGT3vwVcYKUiMNUOg+/H3BTGmKTJ1jnTcpOu1YnvwdWHsvG3DDFx00hu3QDtxy6hLmu+ZDXsFKsNAInq+lrjpeZGph7gY0XeRoHYQ1jzZnkvWueN+OoD8I+wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419852; c=relaxed/simple;
	bh=1CBp1pcRQFqqiy5vo8h36IT7EY9pjXp86xQb7agC5iI=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=r+/qTc/M100FAmK+UaCXlqVzXfoJuvCOUpsYXZs6JBgfd4LlDvCxTMY5uC68/ElpPHJcm8CDroyiHnRuFUMXIXpIygfDhEnJc9Kj67OTsvshCQXTpZWmPh7CN+N106xpMcUl8RkSv+Jha7QuBU/TXqOhrm+oLD5azXIpZxfuOFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PVJvB9xQ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PVJvB9xQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783419849;
	bh=1CBp1pcRQFqqiy5vo8h36IT7EY9pjXp86xQb7agC5iI=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=PVJvB9xQtg9wUisbqYB6TMp9JRgPSqMhgNjDveyK4rW6On5DN3GPDZmZpEFcr2+z2
	 yf+kkFzB0GVRX+10OOPnKCU1WanvIjgYBvMOmoRmmZEXOMQzN89zvTaOxbDvAMYz6b
	 xGHgPkcbVyPDIgUDD1Pg7Ie0fmEAyK0925iOU2tiGKxoSs2jguKNay3MG+Yv6S5Zn3
	 ExbCM21zSPXCBCXl8M9PGXNGoT56dtm7/GVekX2xrvPA0Y/pwDUyn8uVrV6R9mNuEQ
	 5CKaC6MhWONMRMmVYeQBrH20o+nIpmQngawWZ/yXOIAWyuVfifcUL+EyLKuVHj8pWU
	 wtoJysc6QRZDg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 62B4717E0C88;
	Tue, 07 Jul 2026 12:24:09 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260706093515.274013-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706093515.274013-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: mediatek: Correct indentation and
 whitespace
Message-Id: <178341984935.173859.976823009521687721.b4-ty@b4>
Date: Tue, 07 Jul 2026 12:24:09 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Mon, 06 Jul 2026 11:35:16 +0200, Krzysztof Kozlowski wrote:
> Correct spaces or mix of tabs+spaces into proper tab-indented lines and
> remove other whitespace violations.  No functional impact (same DTB).

Applied to v7.2-next/dts64, thanks!

[1/1] arm64: dts: mediatek: Correct indentation and whitespace
      commit: 7f9fc91718bd7e69c3c82123f3c05748a3f2793d

Cheers,
Angelo


