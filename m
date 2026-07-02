Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F0D47884D;
	Thu,  2 Jul 2026 09:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984135; cv=none; b=cXTDPwlQ7jHzLuG54HW9+z6ucDb5hwdFMnmmK9wTwsyFh0+N6O2SVi2wYqcgnKEIloGFGmzGN12R36rvSJx9YW7mCqy+a1B9IeNPRePhlhqZ1EGpclyFf/EC4lrDm0fmAG1fd6god4dB3qHmMXPC0LheRX8HSZ8O62wIGgAyiXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984135; c=relaxed/simple;
	bh=j+kGXwr07dgMRRHsw8roEZSBkQ0X8Tn5IRk7GbSjOzU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NqZw5SMimv6HjGtxCzSYH+7AFZL31dPY8Pot47/2XSxsXUIYrePrbPN9kDOmYz5ZfFM5MF6hVXmqvElEobZFOsXzFk+r9jEXt2NQfuTHyz6wFlgLylUsKUD+Jjagc3rRf2HgF7CweXWeK+vouRKxB9575Bh+PWWjxS+gJxOBRxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZyI/RTO/; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZyI/RTO/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782984132;
	bh=j+kGXwr07dgMRRHsw8roEZSBkQ0X8Tn5IRk7GbSjOzU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZyI/RTO/qkKhB6xhzsW53CmYMPdIHmsArllNS9rt7abzbc0A0/ca6Y9Hsr5iySkfn
	 jivYZq53k2GGIAhHTiPRPkpL75kRJXpPYBUcbLGXwpHohqFkDOow7qyP0qX8z/BOac
	 78aztNovUSudeREQvZfwYrpfei7hUCNHni94D++kgNE9f10dccWe+nXbNrPX4G8NGt
	 pzMkO4OIl3cKgF0RizsdvekgYe1YfBnohgKx9LE1JOahlFNKoeSm4t1WfyroGihcqx
	 HTJi0UIAGgkdo+u3v4BlZUXXquN/DTu5YDVQjd9H0fer0LLzHeZRTc8wuURIQAtD7R
	 CrI1SH2rlvQaQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F209E17E0F68;
	Thu,  2 Jul 2026 11:22:11 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260702083800.578581-1-wenst@chromium.org>
References: <20260702083800.578581-1-wenst@chromium.org>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8188-geralt: Add supply for
 SPI NOR flash
Message-Id: <178298413194.12161.9131704032702690772.b4-ty@b4>
Date: Thu, 02 Jul 2026 11:22:11 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Thu, 02 Jul 2026 16:37:58 +0800, Chen-Yu Tsai wrote:
> The SPI NOR flash is powered the "always on" 1.8V LDO regulated power
> rail.
> 
> Add the supply for the SPI NOR flash.

Applied to v7.2-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8188-geralt: Add supply for SPI NOR flash
      commit: eb3e990db356964d64f5cc258d30776c0363f9e9

Cheers,
Angelo


