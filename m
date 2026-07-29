Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356B23B05A5
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 15:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785340752; cv=none; b=qvIuPP+HBUNy9D7jTCqSx36kZLpPAJrXtSFpAnzTOfbB/MUuBl2j2zfuRgobBeq+JBPFK5+LRiFgQRtU4yusdkmqiDCajw7S/eYLFARcaJb1FWNI9fo/Uqc1nHLChmOFEoRSwbWtxrv3F4MAHGkKLkuxxooL0Vj28ND6iWESP3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785340752; c=relaxed/simple;
	bh=GDWti3om/Gt8NZW6L9Divby0vOhXhGKIkIKXD4e8u5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o0zAXO/G4a+9Gy4Ky1qAtnowhkVKFdk/JwHEE3ezPiX5Ktqw4RaSLN1R8WpXicl9B/JrnEoGnEdwW6BnAnhJ/Sa+01YMPANcqMMtjfMavHRqeoDRyPJgcoTZAlhDKZBLNXpq7BY0dBTU7qyA4iMOQt3iEibgpC5Cws698i9YMYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=vjjU9MFn; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="vjjU9MFn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=WAOkuKHh4i27fZlcKLTUTuoCivUIxiHgWWdSP/PcVS8=; b=vjjU9MFnB2GtzB3AMnY8AvVLUa
	RYLVe0Qp667C05LqdiimUIdH+rFI+UaLksm9aonb6Qgu5fzeMnKgoMPEXU4Sk4QG96ZVbO9zJf6lG
	66Jgv3cqdrevzCLE4f7gC5eNyFWyjGZLat1sNWnXwhH2PLg5CoaoC+nHXXvd25BVD4kT64smm21W7
	l5+rYPbRLiom4IkPZrZC2BXtBASBTmJ50lcYJs1aXbaoBYnqn/bxKrzqx6UeX/LCinQGorDsKn/Qg
	yjVwJW1PYyRylYgcISICcViBQMGhxhe7yZI9ObxGcU4+FGhsNd34qRKpdCqcCrUsJdObL8wGkxeSH
	D2P96hHw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: Add CSI-2 bus type to ROCK 5B+ camera overlays
Date: Wed, 29 Jul 2026 17:59:02 +0200
Message-ID: <178534073340.533990.8162754549907499267.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260727174007.2581714-1-festevam@gmail.com>
References: <20260727174007.2581714-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 27 Jul 2026 14:40:07 -0300, Fabio Estevam wrote:
> The Rockchip RK3568 MIPI CSI-2 receiver binding requires the bus-type
> property in its input endpoint.
> 
> Specify that the Radxa CAM4K modules connected to CSI2 and CSI4 use a
> MIPI CSI-2 D-PHY bus. This fixes the following dtbs_check warning:
> 
> endpoint: 'bus-type' is a required property
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Add CSI-2 bus type to ROCK 5B+ camera overlays
      commit: fe67191030089b2653837489328ee2d18acaa149

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
