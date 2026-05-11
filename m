Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D6F3BFE20;
	Mon, 11 May 2026 09:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778492204; cv=none; b=jhEjOqDGbh2vSsFf3tEsoCSts1gVgy58b0C8vuBnLCkz/L2zLDPC2ZQ6Jh7R7/2knpbsQM9PBZm/D5yQdyX9zpetAWBw5bWVPdOp871/n08ug4Z+iZXpPAnX9zU/3W9XRIeO/jovFpRiKBS+UdnYxgzcGieQzWNCEOq7O6cSzL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778492204; c=relaxed/simple;
	bh=V1y7tjJRuCwDowtB2VyufXxqZxGF/rpZo3KydJpUpfg=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SSLtNVEjtzJ9U8YnEDJuGhOLireC7tNnW7RERg1LT50Hx2vsSArVhtqaEvnZZF08FrhkuK6j/TULw+Nei6hmC3MemoMDAP/3oqlxpd+eOUiScpFJjMJtZ7KcGtfUUxmi6Ql5WhOs51hMbh1OM4xf+ZMI6/tq8ZP+GlQpDGabZb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CGvvF2q2; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CGvvF2q2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778492199;
	bh=V1y7tjJRuCwDowtB2VyufXxqZxGF/rpZo3KydJpUpfg=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=CGvvF2q2URlG3ZF8o94swnNzy+vEJqrQkbHVMJrjnIWXknm2rj2ousoDavxeAaktu
	 y2sHOxvxa31EGzhWarHla+VYN6etpQusLtjBOyXQt8iJ8/eoP0BFmoQyip9UHcJ1KH
	 2vuoaZtQG1+kXHBnnpQPqYr5GEFxumh9/Ru7w5a/KL+R+il7Ra3nN6loC97CrDuK78
	 mvFxYPxAkqm2Rc8N7EocxU5C2rpNTrIsrZoWOj2HUUBjtxdcE06lEAu2oW0j2iLe+T
	 Zo6c7x3Dv4VBXrlAeFu+hzqTtG7FlEK19b10mn8kzsNKE+H2z/kRCcGf36P2nH6TJ1
	 zwWUEKzXU0g8g==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C33E617E13D3;
	Mon, 11 May 2026 11:36:38 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Aleksander Jan Bajkowski <olek2@wp.pl>
In-Reply-To: <20260428224755.336843-1-olek2@wp.pl>
References: <20260428224755.336843-1-olek2@wp.pl>
Subject: Re: [PATCH v3] arm64: dts: mediatek: add crypto offload support on
 MT7981
Message-Id: <177849219874.115964.16505736751256463138.b4-ty@collabora.com>
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

On Wed, 29 Apr 2026 00:47:43 +0200, Aleksander Jan Bajkowski wrote:
> The MT7981 as well as the MT7986 have a built-in EIP-97 rev 2.3p0 crypto
> accelerator. This commit adds the missing entry in the dts.
> 
> 

Applied to v7.1-next/dts64, thanks!

[1/1] arm64: dts: mediatek: add crypto offload support on MT7981
      commit: bd25a2e3b0768b1526a8120790453a5880f11ede

Cheers,
Angelo


