Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC043A1A4C;
	Tue, 24 Mar 2026 19:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774382058; cv=none; b=uCk/GFLD0ncXpftH5ZC2G+cTX2UZMA3AV80Pav3iXYsKdYa7+0UPwr2gvNBgWF3FdQj+iJSZJhJUvaBLNNgGainw4jgYiiMfF7wDKALiM9AuxD6Ip5AlNpuYlox6sYIc/byT3x342LK6a9MtSOr5rqUxoWFhxg0zmh5kYYBai4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774382058; c=relaxed/simple;
	bh=QIolkDMwIH67tCubVxP6QCWIwq4iK0JiIoRNXPhbyDg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SPpSPSu7gFgmug4qPDVAHm0uKWjqip5wvP5sEUQgOPmUtk3in/cmzk5oaRb/CSfQ10ZaR0KBmmWpzfG5orLZN9RJsF/MzwiaJGAQ7E+GknqAwZqhTyLdugjRM4uvyG9BX1kr3zRDfSUX//C8j93PmA3xPS+Fc7xudhbP+f430jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=oDgTko9h; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="oDgTko9h"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=MzOhvl+u7DFc28TQuo+xxqZEb1HSo2b+8jMDFMvc10M=; b=oDgTko9hw7llb4xFgm4VdKDqBw
	nQRbLMnIQkfGp2MKjzSRe61dXTzAsJh0CswTw36Kxe7TtqhGu2JRCZfspI4iUaUs2DK4M88leU5TS
	Zi3vkkhklzo1M2C0Uy7yxx+wxp0mjYZJTlFR9kNPyNYG1FsmOK3vpwH8MI71TY7wRKg3/CV3dwzn6
	kFFL0DhuENS/r+ivAUAdLINzYOVC4iPb65KLCnuZnswM/qRrlmAbYj7vpo8S28iTht+bvJKemy/+Z
	Gxqf7rQbXIwbtS/0IVWs+TpI2lWLJe8y5RZ0mkC/XsBAIiSg+pkbOKRLGuC3RxYSJDyXVjYy7cL5m
	LBKu0V9g==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Wunderlich <frank-w@public-files.de>,
	David Heidelberg <david@ixit.cz>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Martin Filla <freebsd@sysctl.cz>,
	Charalampos Mitrodimas <charmitro@posteo.net>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v4 0/4] Rework BPI-R2-Pro PCIe clock topology
Date: Tue, 24 Mar 2026 20:53:51 +0100
Message-ID: <177438200695.818857.2696783721404989897.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260304-rk3568-bri-r2-pro-fix-pcie-v4-0-37abd7ba29d0@ixit.cz>
References: <20260304-rk3568-bri-r2-pro-fix-pcie-v4-0-37abd7ba29d0@ixit.cz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 04 Mar 2026 12:05:26 +0100, David Heidelberg wrote:
> 


Applied, thanks!

[1/4] arm64: dts: rockchip: assign pipe clock to rk356x PCIe lanes
      commit: 27472814ac0bb465da1981788aad2463bc862848

The clock generator itself can use some rework, as suggested
in the review.


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
