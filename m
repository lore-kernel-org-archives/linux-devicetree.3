Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B26F388876
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781079260; cv=none; b=kigmY7iGt47n2HK6yFnmIwbLpJbK5YK8G9MoZ9vQ1P5EecWp22oQcxvE84oHprGEywfR/zspZYsfvZXrNwZtc7uYLUp9iHzUIaqO1ROQJ26hAuE+e1sgpLRMDObcp68c6SrEyEzCew6nH0bSUsm2vOrCScJQXzW3IlER6GM+Yuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781079260; c=relaxed/simple;
	bh=hzztyyB7xljixNXQx6zYvxVpMpF9bNMNdFnTEwzcNDs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SO4hlAY95X1KW5lfINy//IsIa4n8xR4aPaeyae5TKiWLCSXWatYoAc+NJGkhrew82cZkgHJUXGp0Bj3bZHMvcxq9XEn7i2nRq8tKyYnXJrfBgkSbz2o8MvWVASkKl+Fb5ZqrbZRlrdutdh6ylBmmQIeR6clhvOzUYD2ne0DQe34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=lZwr/DAw; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="lZwr/DAw"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1781079255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kjtDSKgAkBUwFT0hwE/2Ap75hxqeB45aM0UXggEveyI=;
	b=lZwr/DAwi5MuDj7EnY8KldX5dEhj6AHfLGfJpB9zMZP3cZMalnkQP23io4b6Y+8fbfJBTB
	+gdOawkXzTnycIYTuxU+Bxt/f/OWKmEbUASf0lB7YF3aUlg+1XhxWfjV9yBJhRUZktVHwx
	1c0bKc+wl8NDIBnyrou9mdrSOSQJzBIPK+aCioYqbNvL4XuF3nZFXap8XvAUOPxslXqNjC
	OGED8/G5ytjJOqDC/lKhJk3CZ6PC1IWjjvrVBDQKRXTyXWTKP5IEI5SawMJcrQqFSejsdf
	sh8HkRCBHCMyDtBDeQ80/Rq521X2bx8N+3vZk5fbfoM2gBLuHjiGOzrmemOb3g==
From: Diederik de Haas <diederik@cknow-tech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH 0/2] Cleanup and fix for NanoPC-T6 Plus
Date: Wed, 10 Jun 2026 10:04:04 +0200
Message-ID: <20260610081400.758687-1-diederik@cknow-tech.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Several nodes were enabled/configured when support for the NanoPC-T6 Plus was
added, but later those same nodes got enabled/configured in the dtsi file,
making those in the dts file superfluous, so remove them.

The MTT USB 2.0 Hub is connected to USB20 HOST1, so the phy-supply belongs to
u2phy3_host, not u2phy2_host as that is for USB20 HOST0.

Diederik de Haas (2):
  arm64: dts: rockchip: Drop duplicate USB nodes on NanoPC-T6 LTS
  arm64: dts: rockchip: Fix USB hub phy-supply config for NanoPC-T6 LTS

 .../dts/rockchip/rk3588-nanopc-t6-lts.dts     | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

-- 
2.53.0

