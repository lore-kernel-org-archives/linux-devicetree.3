Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728DC339B3D;
	Mon, 11 May 2026 09:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778492870; cv=none; b=ZlQ9qYjQ6LxfK7yvsjP7TwQreBLYcN0g0jz2KeSYTZEe/hCVFtw7EhUwlpXgXyCvlO2760qucg9LY0El0R8bQkmijV8A1INM1DfK1zdsF0dSSiQxqonFg/WptkFyhIzfDZgrOb0ebiOpLcylAvuqUJ46N9lYPtQm5RoSJI+rph4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778492870; c=relaxed/simple;
	bh=KAacyabt/cyiwQDZ9EaRG+E1w1FvHnkbqvn0xq5Avbo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=at2SwXl0dSz8yorGoUh6v4Pu4yy+VCNoX4Q41x0n0X04ACOG1HoKxlymR4LFnRrmQp+0iPVGfxZIReAxG+Z0nN1OVekjqRfn/iEO4lYx1XnIlTkJPr70XPvz8rwoZVQzYOVxQHF1z7p+QF1g95Ty+O1nvv1C2J8MeWYHSP+InY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kFumTGzQ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kFumTGzQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778492867;
	bh=KAacyabt/cyiwQDZ9EaRG+E1w1FvHnkbqvn0xq5Avbo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kFumTGzQRWkaBQrsyuRDrLwqTfv0wZzZ1C8sGz/xu1JGz/O1Hf1teietlC8U2ZdBM
	 JntsDi1edyLi1IpK4q+cl8ojALmPvrReheW6N5BOIXMdrazt3AEdV3qnh25UqzkZJw
	 37I1+gnIfb4DbrlwbsLi7JPkFlw7dSko501OF0PutsuCmhkzBVlHglkxqel/GltCvd
	 UtjPcZNN2LB0iBpWY/VicNhFUTndpvcIphNc1Lv8u8rySGVpPa/bRlAbN2FNTQKfZP
	 iw+Py3usi+igfOX98gmaMWJUhD4S2HGmqVZGuFuhff/mA4lwSP97pcw34K/YVSJAdx
	 xuQQ12eNhdjiw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4EF7D17E12E5;
	Mon, 11 May 2026 11:47:47 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20260325144500.667385-1-akkun11.open@gmail.com>
References: <20260325144500.667385-1-akkun11.open@gmail.com>
Subject: Re: [PATCH] arm: dts: mediatek: mt6589: Add Arm Generic Timer node
Message-Id: <177849286725.117937.1598232312363149560.b4-ty@collabora.com>
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

On Wed, 25 Mar 2026 23:45:00 +0900, Akari Tsuyukusa wrote:
> Add the Arm Generic Timer node to the MT6589 SoC.
> "arm,cpu-registers-not-fw-configured;" is required
> because the bootloader does not initialize the Arm Generic Timer.
> 
> 

Applied to v7.1-next/dts32, thanks!

[1/1] arm: dts: mediatek: mt6589: Add Arm Generic Timer node
      commit: 2a5d54507c68c2a8de9d6f6746f23771d38f4dbc

Cheers,
Angelo


