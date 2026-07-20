Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BE341CB42;
	Mon, 20 Jul 2026 12:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784552284; cv=none; b=X5bdTFXnMweXp1RfQDzW1ttLUz7bLWZ1FDc4OgYh5sLyLMuaWZGPbSENWd9lB4B+9gPT2jtPRBLX0DQ2uAfVFiS7CwuJK5Fd4iP4+8pQrs6g9mgxGVUDrwrtlr1RpwtyPIob9ePAzVU9bX5s6Tp5ncWxYwUd/E+9AYHMXdGjPuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784552284; c=relaxed/simple;
	bh=pXwbG8g2ui3ZnNKrmpTi8SOGTs2VjdyKpZo2s1V1Tu4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kEATfCyCvOkcL8lUDYuN01/Q2ufcQIYs5flwjdR05+hS+Fn7Ofw6kIe/5ULFHOX3Uts9qkPcM2giyd0RnTUcaQaEvY+ekIP3KBRnOayw24bDbHpAT0sVBmKTvLFaqzFGFy5vh06E+bzCHCEsNDMdbonbqnlqG7mHEar7G4CS0Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kd/53mxy; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kd/53mxy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784552281;
	bh=pXwbG8g2ui3ZnNKrmpTi8SOGTs2VjdyKpZo2s1V1Tu4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kd/53mxygveWECGvoQk8w3hqEbj3MP4CoAy22jUj+vMtB6aLXXcZOvGSb91flcRQj
	 tx3QduIDWI97BVjk7+R6WptXYqTyJsLeMfbTteiEqiaTH40GcwKUgeIoTGbQKhOgLd
	 7LOi4LqV6sjwgqr7MOusvmSorHgetrKE5X1kBXBnPseujlKemKL1ho9dh+pLR2THz3
	 XGhuiq6PvnZ1DmcRbGPk9yT7s3l3HVFPST2sx+UNsE/KRS4BTuKYUjhBWiKp/6zaax
	 heL/QeLriNwO2tE6a1vna+8BiUPbLn1tVzlckNW8SAyIchyrR7Fl93JPyT357vC3mn
	 Lfg/UvycIH17Q==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C247F17E0CF1;
	Mon, 20 Jul 2026 14:58:00 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260720092759.1831105-1-wenst@chromium.org>
References: <20260720092759.1831105-1-wenst@chromium.org>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8192-asurada: Disable mmc1 on
 Spherion
Message-Id: <178455228074.74351.3461241181620580397.b4-ty@b4>
Date: Mon, 20 Jul 2026 14:58:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Mon, 20 Jul 2026 17:27:57 +0800, Chen-Yu Tsai wrote:
> Spherion does not have an micro SD card slot.
> 
> Disable mmc1.

Applied to v7.2-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8192-asurada: Disable mmc1 on Spherion
      commit: 934cccd2c6795a20d04bd470ec7eb3151950fbfc

Cheers,
Angelo


