Received: from wp585.webpack.hosteurope.de (wp585.webpack.hosteurope.de [80.237.130.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45EE41C30E;
	Mon, 20 Jul 2026 12:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784552316; cv=none; b=symQb6tHA8K9g99gwsI0+RsnZoKIPCTy4j7buTprko/mXKblm2iWfBePi0fl31f0jai0HQWhcCndf6CdWfTwIMSHiW+4ACyK82WJx03g6Iw7djARPsIlqLsDMOobMkR3sDy0gQH0qN44ibgltd5X+Hgp9AZmjkSOnPGmTmyUkbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784552316; c=relaxed/simple;
	bh=ZT1jaqD1Iccb31fXdwSCF9w0Y9iQoL1OwEC509jWVdI=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=bKEwYvQ+yz8rqqylkU755hoiRUshCpK/TZt9jPohUoL2nm5Or9h8SvHGX4M65DLxESXT/o8/n3crsSuO77f9g2KJmpp0xWlhWoy+YUSEksBiDgaoWBrjpbkAwVTbRYqNonTZ7gkWnFu0kFJvR80isxEiLJlMvh/BCQBEkBHwgss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loe-web.de; spf=pass smtp.mailfrom=loe-web.de; dkim=pass (2048-bit key) header.d=loe-web.de header.i=@loe-web.de header.b=UAxESYci; arc=none smtp.client-ip=80.237.130.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loe-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loe-web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=loe-web.de header.i=@loe-web.de header.b="UAxESYci"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=loe-web.de;
	s=he168698; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:In-Reply-To:References:Cc:To:From:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=ZT1jaqD1Iccb31fXdwSCF9w0Y9iQoL1OwEC509jWVdI=; t=1784552315; x=1784984315; 
	b=UAxESYcibmxwD1J6Xi9RhQ+61X/5jZIv8DwP+Goo4wtUMQlPvQcEXAMGopBje82kpa51xdFcaKn
	UD/Fhie3h1bWTf0ti4twVQ4n9eFZl7XmxjspbgatepY8p9QRH/l/j6H/we1BCLobWGPoglsqrRGjH
	/7eSN4qEtq2WaMvrj2JkpCf2fUEsjS7r2FUen0+N/Rqu/PyMnLMYwJjr6Zg0BbfjIaHXsSt29tkht
	BpbFUzi8jZe+ZWO6KB0iSlbTWFZoZzihA5Aq9Hf3axEchL4p4uHwJ2OcYbguzEYrg1AlZd1+dH9Hr
	5MHiAbhIl55fpVNZ2dHZ1kjkgZtz6O2sqOjA==;
Received: from host-213-179-158-197.customer.m-online.net ([213.179.158.197] helo=84JJL23); authenticated
	by wp585.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.2:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	id 1wlmzI-004nlt-2U;
	Mon, 20 Jul 2026 14:20:48 +0200
From: "Jakob Loe" <jakob@loe-web.de>
To: "'Alibek Omarov'" <a1ba.omarov@gmail.com>,
	"'Rok Markovic'" <rok@kanardia.eu>
Cc: "'Heiko Stuebner'" <heiko@sntech.de>,
	"'Sandy Huang'" <hjc@rock-chips.com>,
	"'Andy Yan'" <andy.yan@rock-chips.com>,
	"'Maarten Lankhorst'" <maarten.lankhorst@linux.intel.com>,
	"'Maxime Ripard'" <mripard@kernel.org>,
	"'Thomas Zimmermann'" <tzimmermann@suse.de>,
	"'David Airlie'" <airlied@gmail.com>,
	"'Simona Vetter'" <simona@ffwll.ch>,
	"'Rob Herring'" <robh@kernel.org>,
	"'Krzysztof Kozlowski'" <krzk+dt@kernel.org>,
	"'Conor Dooley'" <conor+dt@kernel.org>,
	<dri-devel@lists.freedesktop.org>,
	<devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-rockchip@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260717120005.2087386-1-rok@kanardia.eu> <20260717120005.2087386-4-rok@kanardia.eu> <CAKyg=SV2-81VFgr+Tq=-Si5EO-86MA+ZFoQ+DX1fEYdnnLYJng@mail.gmail.com>
In-Reply-To: <CAKyg=SV2-81VFgr+Tq=-Si5EO-86MA+ZFoQ+DX1fEYdnnLYJng@mail.gmail.com>
Subject: AW: [PATCH 3/4] drm/rockchip: lvds: add RK3568 support
Date: Mon, 20 Jul 2026 14:20:48 +0200
Message-ID: <000c01dd1842$32a0a580$97e1f080$@loe-web.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFaHWtND3nIPg5aqhiCEj6HM4JNGQJz810+As1SicW3Uj7lQA==
Content-Language: de
X-bounce-key: webpack.hosteurope.de;jakob@loe-web.de;1784552315;68272804;
X-HE-SMSGID: 1wlmzI-004nlt-2U

Hello!=20

Nice to see this is still being used.
I can confirm that this actually works and outputs fine LVDS on a =
RK3566. Also reliably so far...
Any questions, I will see what I can help.

All the best
Jakob


-----Urspr=C3=BCngliche Nachricht-----
Von: Alibek Omarov <a1ba.omarov@gmail.com>=20
Gesendet: Montag, 20. Juli 2026 07:39
An: Rok Markovic <rok@kanardia.eu>
Cc: Heiko Stuebner <heiko@sntech.de>; Sandy Huang <hjc@rock-chips.com>; =
Andy Yan <andy.yan@rock-chips.com>; Maarten Lankhorst =
<maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>; =
Thomas Zimmermann <tzimmermann@suse.de>; David Airlie =
<airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; Rob Herring =
<robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor =
Dooley <conor+dt@kernel.org>; dri-devel@lists.freedesktop.org; =
devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; =
linux-rockchip@lists.infradead.org; linux-kernel@vger.kernel.org; Jakob =
Loeschke <jakob@loe-web.de>
Betreff: Re: [PATCH 3/4] drm/rockchip: lvds: add RK3568 support

> Based on Alibek Omarov's earlier posting [1], with the changes below.

Hi, I'm Alibek Omarov and thanks for picking up my patches. I didn't had =
time to finish them and these days I don't work on hardware that uses =
any of Rockchip SoCs. However, if I'm not wrong, it's still used in =
production and I had report from Jakob Loeschke (added in CC) who =
confirmed it worked in their setup as well.

Thanks.


