Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4164933CEBB
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 19:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625643; cv=none; b=aQ+szNCVr3xdQsUpgoKrtNPCRT1n+Pb90c8xbuH5jubYDj+B7h9+QdHyAqOtIBCIFi29P53TJj416F/VH44uPKiH/l6VU17SgTFpvIB2QXUACHkXcDzKfp80x65AfjT6LrNABUsg0orATJu+5WO5ztvWM5ZKunPv5w8A6Mhah1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625643; c=relaxed/simple;
	bh=ti3VrnCGXH3K7rpjzLtxQlr1+Qfs5Ju50/PqS3nSw7c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EL/xjTBHC77IzhrrJEWQUusOZqncKLp3eD0SOEs04iHtqcPnU1JfvMWWS4vvkRkcr92/0Zy3iC9RDjbEhMle8SFAO7ryL739tofjg/PM+P2MgY8VyUmhcqzGsjR3vKnQH0j4F5FHK3u6vv8Q/93hGguFfwjvCtmYwj/ouWthddA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f/qT1cSn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f/qT1cSn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B71A41F00A3D;
	Thu,  9 Jul 2026 19:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783625642;
	bh=ti3VrnCGXH3K7rpjzLtxQlr1+Qfs5Ju50/PqS3nSw7c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f/qT1cSnDNQLpnfAY9+sitGRMlzrazY/1A7Q71s/IpcEzsq+pipfOW4JQh/Wp8xWN
	 PmOHuVoxFpGzc+4Jm+1YROa+ydVcq+ZNphElYi7fSVw2CkLiTdsK8kVJmYv9hajPEj
	 QalFOhWD5xza4hTttxCSvXQw7mtXZ1HNvzJcQWwFjppijYcyoD+bln6o8PAT2+MlOx
	 hBrR+6cbXtyBsNmWxo2e5fc4rlJD1X1V+U+dZv5w7OszZ4z6NHzfuw6r3uE171XZSP
	 u/KCzMnCDmt8J3g/hL8fwJFoxQ7dtMAbIEN1NWNr/wFXJ//Hy5JqC4h8n1KhuN9wGm
	 Ck+mjW8VhAhGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 32/36] phy: rockchip: usbdp: Drop -EPROBE_DEFER hack
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org, olteanv@gmail.com
In-Reply-To: <20260709-rockchip-usbdp-cleanup-v11-32-a149ac60f76c@collabora.com>
References: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
 <20260709-rockchip-usbdp-cleanup-v11-32-a149ac60f76c@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 19:34:01 +0000
Message-Id: <20260709193401.B71A41F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing PHY_NOTIFY_POST_RESET notification on the rk_udphy_setup()=
 error path permanently leaks the PM runtime usage counter and leaves the U=
SB controller in soft reset.
--

--- Patch [32]: [PATCH v11 32/36] phy: rockchip: usbdp: Drop -EPROBE_DEFER =
hack ---
Note: The format of this review has been altered to a free-form summary due
to system recitation restrictions. Standard inline diff quoting has been
omitted.

commit 734b15714983185f791bb43091c9362d69abf8d8
Author: Sebastian Reichel <sebastian.reichel@collabora.com>
phy: rockchip: usbdp: Drop -EPROBE_DEFER hack

This commit removes the -EPROBE_DEFER return from rk_udphy_status_check()
when the LCPLL lock times out. It notes that the driver now performs a reset
during probe and handles re-initialization later, making the deferral
unnecessary.

[Severity: High]
In drivers/phy/rockchip/phy-rockchip-usbdp.c, specifically within
rk_udphy_power_on():

When transitioning from UDPHY_MODE_NONE, the driver sends a
PHY_NOTIFY_PRE_RESET notification. Immediately following this, it calls
rk_udphy_setup(). If rk_udphy_setup() fails (for example, due to the LCPLL
lock timeout propagating up from rk_udphy_status_check or a clock enable
failure), the function returns the error directly.

Does this error path permanently leak the PM runtime usage counter and leave
the USB controller in a soft reset state?

Since PHY_NOTIFY_POST_RESET is never sent on this early return error path,
consumer drivers like DWC3 that asserted a soft reset and incremented their
PM runtime usage counter on PRE_RESET will never receive the matching
POST_RESET to recover.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-rockchip-u=
sbdp-cleanup-v11-0-a149ac60f76c@collabora.com?part=3D32
