Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795385038;
	b=0VKc5PfE24nxYLThUptPxFc7EsvCpSjj+1o+o9hbNOUwFweDRQX4yW8JbmsuoWMv7hWR
	 X9qIozvBMpjGUnbkIpoY/BjqwcHjLQVOH+rnn2EHkRfxCwI0lma5e2okCONI8RZFT8mpR
	 42jmBL1HVqo//D8+THTKFlwTPPShWXdvE2n8TiBW48QWPa2VSUrmserYw77jvHck0QzQX
	 1IP7vq0b73rhMysmV2woK7hi7Ko3mxkYYFbAdStABj3H32VcaDXwKtp8Gm50Nlx8oBNkL
	 k0EFmJTDC9sVnUVXyhf47VWCnpMF8rN2ajt6U/FDfsYLTz50WjT5DL4xzw4htyH1KKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795385038;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=wx3P+dKo4GM43A7D066wIsRvaq0/Fqq2FMKb809nRkY=;
	b=YafFwZUXdXwUqiJRuGraXRYunRSpWk5AJpZBNcyRsRuhSjNuon8EsgbnW+Fo47ZUTlbh
	 4Up82ccB0VRydHA1ALg4aLtrLQeZCX5erkPzaJrUrmppMBX7t2s6iCU0hjzQ1nt0QN4y+
	 ZcRicYmtbukRFMjbzV3tCHiCKYCnglqKjXM/iXW8xyjX0obfIVNwWX/M1+oylTt3vYBhE
	 93UlyGBUfsccQK0nqOsq4p41udKezk9vo5bMCQX4c+/2+sPX6zh5Xnb1Ptz03iWNCRo9X
	 sX3A9gz9qVN36X8atfkByRFw7kIxLCwAr+uXSzJ2cVAmZ4JT6gCmOu28lApRVTbBpmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=o8Aspt50;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E50606A31A;
	Sun, 22 Nov 2026 22:03:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49E50606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=o8Aspt50
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=wx3P+dKo4GM43A7D066wIsRvaq0/Fqq2FMKb809nRkY=; b=o8Aspt50Btrcq59EN1EuJxGvAC
	7/DZqL56mUJ8ZIML79qYWp+JQz1VwTTmWVUNzScFzs1lypU/JdXJbBPHxE4Lb7kidXyAYr1tiDlKv
	VMZdeicvXQoQR8mVKYLdj2n1+rVF8mJkLh2+FmU4Ru70NyZC4ugsbA12XwPZYRziHSLpxYIW0HQKv
	JJO4TIa1sBvgh9tEyOeXglZPCS4JZ8TiY8Kn7lycMfx3pHfc/eso/lvOMYmzcqj0X83wSijRqcTpg
	/4xsHY46QzkbAqt58b2CDkln0RCTbsicY3RyIFxTbc8xJQJDUwSo9qHGzkvqBqgq4Fw1bd8OTYoz4
	yL3WG0uA==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andyshrk@163.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andy Yan <andy.yan@rock-chip.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] dt-bindings: display: rockchip: Allow single 'port' node for DP
 input port
Date: Sun, 22 Nov 2026 23:03:35 +0100
Message-ID: <GHrf8KahSYaDLPGqb0rYhw@sntech.de>
In-Reply-To: <20261109184759.467215-1-robh@kernel.org>
References: <20261109184759.467215-1-robh@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Montag, 9. November 2026, 19:47:58 Mitteleurop=C3=A4ische Normalzeit sch=
rieb Rob Herring (Arm):
> Existing RK3399 users have only a single 'port' node. This was common bef=
ore
> connector nodes were defined. Allow for this since there are already stab=
le
> users.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


