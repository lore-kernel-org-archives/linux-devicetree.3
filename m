Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356162BEC43
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 15:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785340752; cv=none; b=jzlY2Z6DaqWIAm+LDIF6K4qX5P1m06gCYHQJ3Drv4Wq1PjFVSccJPskvzBTZuKE/oQPj9WOuVN+vHIkXUA+t27IuZVsE78eRfu5q2pvyUJUbP8EJLBQ79WitJGv4RIUnQUGWtws2ZzAvZSmQkSMBEijj3flWeO5rVDM00Iz4AfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785340752; c=relaxed/simple;
	bh=ltYHo1ciVcGyEaWXxnu3XMnXWuJo6sT3aL+lSUxpXWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LmHtZJ013zDcrONeFbdTVRmMfrmMq9laXdlbRefFspKGD1+9BuDUstnc9xOPfD7MUpecyAAfu3Wbdj2U6yogb2uc2YllfLU7h7lij2JZXmMsFNXN8rRYnDi9U88/HDEP0CDP7wAmcLsgg2zIhCau8rQRMbwhtIPfKvyx4cLYZOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Bfr8GTt3; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Bfr8GTt3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=tViOkyA/B0HUKG8BRi0qjbMNTIz9tdb3LL+LdxZCQMQ=; b=Bfr8GTt3+HDBETbuAuSZ/Dj4ed
	hhwoJkGHWto0zNltFAYR9JloFvdB1B7KomjGs6/BhiwWC+pUoFgQ0QfxIjv+GGpp9/+qX4HCjaVkn
	6/sooYs4dsZvi1wY38x7Hqfv0egbzVv32xnRWc+YuqZF3FiHZhALiIB/0dLDpb+mt6i+Z8AVbBKW4
	mat3+DBP+GwjJU5DD8w6yflhovGcSqVb/ZawSn8ln83IvRO9rPwmCPDGuwBrib0/z1fIgvAvQr5v4
	MC3FqE17sJMToZ/UO3Az6LFMllobIcCSzvC5kuFQuycNmCh26e3g3G/y9WPP40W7XO0KjQDpN4W9I
	GZlWjCzQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: Drop data-mapping from Engicam PX30 Core
Date: Wed, 29 Jul 2026 17:59:03 +0200
Message-ID: <178534073340.533990.10934043869584032991.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260727175502.2585290-1-festevam@gmail.com>
References: <20260727175502.2585290-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 27 Jul 2026 14:55:02 -0300, Fabio Estevam wrote:
> The panel-simple schema only allows data-mapping overrides for panels
> whose mapping is not fixed by their compatible. Consequently, the property
> on the Ampire AM-1280800N3TZQW-T00H panel fails validation:
> 
> (ampire,am-1280800n3tzqw-t00h): False schema does not allow ['vesa-24']
> 
> The panel descriptor already selects 8 bits per color and
> MEDIA_BUS_FMT_RGB888_1X7X4_SPWG. The DRM OF helpers translate
> "vesa-24" to that exact bus format, and panel-simple falls back to the
> descriptor's format when the property is absent. Removing the property
> therefore has no functional effect.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Drop data-mapping from Engicam PX30 Core
      commit: 9f23009c60a3787c9bdb1eedf725a691537dfd5c

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
