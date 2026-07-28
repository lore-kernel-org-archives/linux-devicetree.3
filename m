Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B2F472769;
	Tue, 28 Jul 2026 19:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785266214; cv=none; b=E5YHjuChqVtRSr+s5cVGiTvYVkohJmctGt+107FVd0UmygEhuH+DugYcE8ZMiE2ciVxaDeau7o5dDNLbRr1AQWpJgDbBdcZvhrpV4rFe90Wql8cikoygmozrhTcqlpdVFxTePQx4wOGKzICPU+G+3Y2CQlxv2MiHb7wzr/ioRSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785266214; c=relaxed/simple;
	bh=iLEMH8JV8rbOgEt2Gcn3QTRtsLzs4pLxbYp8mQsfPwE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tk7on6f61F7T7GC6G2i/eAdEEuP/07lFo1cZwvQvbGMdqLh+0W2jZb6HVvdpXuRmMG88MGzz19m1DqiwhQ+HPvEt2loXNSRIQkh9pn/TNuXTfZEdlgIgYs9lCqtK8rcRiGTeGlJEeuAyGLI2frT7WfyN+nOKsMRZcsuoTGLmjgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=dDAIIRH2; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="dDAIIRH2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=EEmBmwtUxYixgDDvolM4waYljKOFYZdLR/vUhPt1oKU=; b=dDAIIRH2zMqHKkENbt8s+Nxetl
	sUqR17+shS7adYNSlgpELENo5qYRTjmZ0O/2IMBrteZAeuLK7Q7IVwVxPesZLxwbBQLAinswt1mtr
	q41fP+9yiBeyS1yAc8rOIAPKraP49UMzBrpWeJEWEyFfLUw13S1+5zRMNgP6BFZyjPWruazGdj4cP
	kGCNf5YngBjZ419vjmhLiUINwnyNXSisYsgZglA6sY+yA9J5oKRNSrp3oQMK0WrkI8yZuu6OApKa7
	bZ2hWunRaQgnbuqwAP66nupA5xksbaLKY0CyOSqpf6zLIs+pKKETvqFIsQy1VoBDWUR8HV5Vhj8Sq
	mHzb/zJA==;
From: Heiko Stuebner <heiko@sntech.de>
To: linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Jensen Huang <jensenhuang@friendlyarm.com>,
	Vic B <linux@vicb.net>
Cc: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2] arm64: dts: rockchip: fix label of sys_led for nanopi-r4s
Date: Tue, 28 Jul 2026 21:16:34 +0200
Message-ID: <178526609481.300371.14540350960348344552.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <al0cKhqvPbBO_5q8@vicb.net>
References: <al0cKhqvPbBO_5q8@vicb.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 19 Jul 2026 20:49:14 +0200, Vic B wrote:
> This commit corrects the system LED configuration for the NanoPi R4S by
> replacing the deprecated label property with color and function.
> 
> This changes the resulting label of mislabeled sys_led from red:power
> to green:status, while the labels of the other two leds stay intact
> (green:lan for lan_led and green:wan for wan_led).
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: fix label of sys_led for nanopi-r4s
      commit: f4fb08d6d735ddd64ae507e0b32679df0135cd8e

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
