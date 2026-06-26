Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0643BFE31
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 21:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782509099; cv=none; b=kF/RXZriT5jJdV4is8Nc9rxyyggfu5Osrvf7NpppC00mCu2p8YDo7nXz9XmE7LQEFabIoXaGYjJPCiZamr4ZXeflFqlGXH6+7FBurdyRRRbWd/cBjzl5fdBsneh7BcHoxLcxoCy4JrC77N19tpKAIticsVRvSLJrr09b86jvcpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782509099; c=relaxed/simple;
	bh=JibaL76Notsgt6JBItUAKClV+ddJl3YmQuthZXCwaMs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SZuunAldOAXknI3ItsreyfBkiWsgRI6xlqNhZFN3u1LFIhpv3ivYh9RmLMXNcLNgNHW0XYD5m2YA+/T7V4tdcEFxBUHKW6haU2MwoWBa02cO1GzGQewtBnn0kaQDjT3giabPTgnNIONB9UTBzmHyCPYPeOHVzbxx2q7oj7qWws8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mlTuJfVR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mlTuJfVR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FE1C1F000E9;
	Fri, 26 Jun 2026 21:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782509097;
	bh=AP0PJssi/Tpup3ATo+7O0TDu0vvjiNMXY5NEmsuC6Lg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mlTuJfVRxrQC32ZZNxlMZpI4V5SyYYua6TfbPBooza+8d8Uv1Vmy1vko6UjcBQfib
	 rgprnWYRG1ArFrtPIzeVRjMSkY2lg3rhmYC63+kIDD9ajRR+7v3owk5wwGBAVGghIo
	 /sLjxnRyZ9GTfxT0bPnHALHMlt0B2Ypcm7wz6zDU7UCVPs191YH6rnvsrG9+/9bEEC
	 e5a6GNzN/ycYkTVv4hJp/qom66lKA1Q25/bUcBiHoUAQ5vjc9+sJUcRuHdwD5LTm5l
	 tsb1BArOriI/mD+/AD7REESFKSxDLqI5VzYhT/u2H/538aTAKDf3IXfRgjZlopR6Il
	 D1ckLbO9cuUng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 29/29] phy: rockchip: usbdp: Disable USB3 on probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org, robh@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, conor+dt@kernel.org
In-Reply-To: <20260626-rockchip-usbdp-cleanup-v8-29-47f682987895@collabora.com>
References: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
 <20260626-rockchip-usbdp-cleanup-v8-29-47f682987895@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 21:24:56 +0000
Message-Id: <20260626212456.8FE1C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but missing USB3 por=
t disable in the power-off path recreates the U-Boot failure state on subse=
quent initialization, which will now permanently fail due to the removal of=
 the -EPROBE_DEFER retry mechanism.
--

Note: The format of this report has been altered to use a free-form summary
due to strict anti-recitation policies preventing direct quoting of the pat=
ch diff.

commit 8c774704e1cc3fa0c1dd6e73117e4641a08efb29
Author: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: phy: rockchip: usbdp: Disable USB3 on probe

This commit disables USB3 support during probe to start with a clean state,
and removes the -EPROBE_DEFER retry mechanism for cmn ana lcpll lock timeou=
ts
since they should only happen on the first try if U-Boot had enabled USB.

[Severity: High]
This isn't a bug introduced by this patch, but removing the -EPROBE_DEFER
retry mechanism makes a pre-existing power-off issue permanently fatal.

In drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_power_off(), when the
PHY transitions to UDPHY_MODE_NONE, the code disables the PHY but does not
disable the USB3 port in the GRF:

rk_udphy_power_off()
    udphy->status &=3D ~mode;
    if (udphy->status =3D=3D UDPHY_MODE_NONE)
        rk_udphy_disable(udphy);

When the USB subsystem resumes from suspend or driver unbind/bind, it calls
rk_udphy_power_on(). Since udphy->status is UDPHY_MODE_NONE, it calls
rk_udphy_setup(), which executes the PLL lock:

rk_udphy_power_on()
    if (udphy->status =3D=3D UDPHY_MODE_NONE) {
        ret =3D rk_udphy_setup(udphy);

Because the USB3 port was never disabled in the GRF during power-off, this
recreates the exact unclean state that caused the U-Boot lock timeout. With=
out
the -EPROBE_DEFER retry mechanism removed by this patch, the PLL lock will
time out and result in a permanent failure to resume.

Should rk_udphy_power_off() also disable the USB3 port by calling
rk_udphy_u3_port_disable(udphy, true) when the status reaches UDPHY_MODE_NO=
NE,
so the next power-on starts with a clean state?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260626-rockchip-u=
sbdp-cleanup-v8-0-47f682987895@collabora.com?part=3D29
