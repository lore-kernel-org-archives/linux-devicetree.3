Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638086;
	b=WfxwaPIFcSk5tRs7x/4TGubqFwCEShacMQcduJtzP8+nLKG+DgRslAN2W6EMRAl6z1A1
	 M5xj+q0duCS7/k1qdIH730qoELQMroYRiq5M858eQBr51w4eRi961wV43HWE5xjVE/T9j
	 vPmcnOucPRynmE3ry829eXwvX+ljESQ+oQHVPGn2vWk4xywuRc+4i+LYSnKzsrLqYv+ad
	 fWqrRgSBfnyKgKNx+irs2PuMnIYMQuzcSZq+yIQK0t/Prk12BCVeFOp4mTbAVRlNujTL7
	 yaoynCbaukTP4ulDNVYod+PJJrivfqM06YftDiI9LpvZHsNGEqibrhfKRt9hVluYuUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638086;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=dBmEgqDmxD1KTn7nbXuA9Y+pDG5ac5f75ATQlxxblHI=;
	b=M+/FClFHeHXBm5QVlwPCdtd3pzihYClYQdq/txApNL4C+y2S9DHDAmKjj1ikcI+wVo0N
	 AlcF2hxP8UtcFAhRy5dly/5GwXJ35tnHHvOtptN5rNw+ydQLPRpFDAe+eJ4QSFDBii9fv
	 BPWhDwtHFNx+EdcAE/0DNIBKtHN200sLMOt7mhoGM4G3sumuJn2CETvMVklrJkd+OoLjy
	 VVzLv7y1rpigSipRbEwUE5BW+Szyl30JNgovfRM1bCFdbImg2f9/N8fOgl0gtnlEVj1FB
	 UeJFIkD5OzGoZQNuzT312HaLstjJp8OmYe/921iyj+F3aEHeKrbWC2SVU7WDN8e/U2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b="Kq/QCk8I";
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C01A606A32A
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 20:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C01A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=Kq/QCk8I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=dBmEgqDmxD1KTn7nbXuA9Y+pDG5ac5f75ATQlxxblHI=; b=Kq/QCk8INV05JtArIWAcnVVpRa
	VCdLMsEgXi1BL0NV52SYPuqfTxTz4VU1qaiiAkBp0CcYsXDBvtsta/pqChraLfc+V/P5Fq9HynJSn
	cpKBpXjpW47d1QhZvQIFnS772m8GH24qUgWJ41avd8n9ves0M3bOkf+3IPvdkhzSFaYyHFiJ+m6je
	GthpazrAHYeT+/JLOJmEa6okY0YsnQmJ/k/8e4CrDd92UWbiL8Or81EOSUl0uI5rsnbXxABj7w+Gi
	QB8fI7gHtZ7ENMOk+d6rdDCF1LBnN8yXREPd9yicVUhDRW6R/yWp6ZqN1H2fPj93jOrsS0w/CiWtU
	zKRQI8RA==;
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	Chris Morgan <macroalpha82@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	shawn.lin@rock-chips.com,
	cristian.ciocaltea@collabora.com,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: describe PCIe RTL8111 ethernet on Indiedroid Nova
Date: Wed, 25 Nov 2026 21:21:01 +0100
Message-ID: <179563805235.3885553.11834553128467400776.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119152847.312239-1-macroalpha82@gmail.com>
References: <20261119152847.312239-1-macroalpha82@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 19 Nov 2026 09:28:47 -0600, Chris Morgan wrote:
> The Indiedroid Nova carries an on-board Realtek RTL8111 NIC behind the
> pcie2x1l2 port.
> 
> Describe the PCI function nodes and attach ethernet0 aliases, so that
> U-Boot's fdt_fixup_ethernet() can fill in the MAC address from its
> ethaddr/eth1addr environment.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: describe PCIe RTL8111 ethernet on Indiedroid Nova
      commit: ba7fefa6fcf47338319f70d161968355d0f04a4f

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
