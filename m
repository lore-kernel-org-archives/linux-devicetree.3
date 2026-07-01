Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1853B32B13E
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 23:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782950058; cv=none; b=kAynK9ymVtuYWnXvX48yY1AI54Br0kWQWUtW6FNHDUGAHPI16PTftn8dv48j+Pt39RjR/dgECb94sKmw3s4GAfGCS6xAJUnmLz8lTTHscBIvii67SjskFAw/XRXRiZ8tOC8311fC6VotT1tD5J9ThQ0S5UkaSl9Le4MQzyQwqz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782950058; c=relaxed/simple;
	bh=BjNPVbSEkZtFTbiDHSbqpJmJa36fXcuEyq8WayNnJMs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BZ2fq51JFHbxZxVPHMhfSBAbeNmICA98s8QzZBHU7hSqje5kIzOYBvOZ0Le04OuQrroXLhval767lJgeHy/RnaI+chXWTOwX7aSlk87W/zp9uk6cjxYyit5zw0bc8HXTKNNoKZ2uPHDXDkmPMXr/yO+SbCFR508kqsXMJ5P3qHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WksoGx7e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WksoGx7e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72C081F000E9;
	Wed,  1 Jul 2026 23:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782950056;
	bh=BjNPVbSEkZtFTbiDHSbqpJmJa36fXcuEyq8WayNnJMs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WksoGx7elF+ncrsyurlh8djLJ+DfnxlegNy77qF1VtjmZ3d02Pz5iIRd0prAM58v5
	 C1Q9r3wwjV/kcO2pj29878ahsR92w6kAAZgWAcOWa70altTNU4/sQwXk2LoVtXsdl8
	 3C3varm9cUmExvFEpYbIQzkRFycBB8CWjD24cb3cUQrd4qYTdxtqD5HoiF/QX2UWhG
	 99X1vVMkNKNfzbJWTA7DROxxn7QOuH2XfBUYf2x1bCYlPwXFCfC/QVz5ABuRh0YNs2
	 zDSb5Oh9FOGpuusaMOoCQc05ri4EjQbHIz0ODA+2U8mqJ4T/ZxgEcbhv7LnfvfHf12
	 n07lGYZz28K3A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 01/38] dt-bindings: phy: rockchip-usbdp: add improved
 ports scheme
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20260702-rockchip-usbdp-cleanup-v9-1-e31efbb62d2e@collabora.com>
References: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
 <20260702-rockchip-usbdp-cleanup-v9-1-e31efbb62d2e@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 23:54:15 +0000
Message-Id: <20260701235416.72C081F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The schema introduces a new `ports` object to link to the USB-C con=
nector but fails to remove or properly restrict the legacy `port` property,=
 creating an ambiguous and conflicting configuration path.
--

Note: Due to recitation restrictions, the standard inline diff quoting form=
at
has been altered. The following is a free-form summary of the review findin=
gs.

commit 097123c73fce6d7ce6f4755a83ce1362c8caefeb
Author: Sebastian Reichel <sebastian.reichel@collabora.com>
dt-bindings: phy: rockchip-usbdp: add improved ports scheme

This commit introduces a proper port scheme for the Rockchip USBDP PHY,
following the Qualcomm QMP USB4-USB3-DP PHY controller binding. It adds an
additional port for the USB-C SBU port to support USB-C DP AltMode.

[Severity: Low]
The schema introduces a new ports object to link to the USB-C connector
but retains the legacy port property without marking it as deprecated.

Since both the legacy port and the new ports properties are present in
the schema properties, could a device tree define both simultaneously and
still pass validation?

Would it be appropriate to add a oneOf exclusion constraint to ensure these
mutually-exclusive graph paradigms cannot be defined at the same time?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702-rockchip-u=
sbdp-cleanup-v9-0-e31efbb62d2e@collabora.com?part=3D1
