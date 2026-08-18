Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0464F3A7F55
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 02:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787018651; cv=none; b=sGhwZ3MHxfFJ0S/kWuSIIja7FYZxhJ/cE0saHOft5DbikiLuEN5F77qPUcGGRUMEOTr9S1JxpNegMTM39kHb51FXBwR3JvM6o6VfDIp2tIJhmOUqPi1YawWz+ny37r78Svy+JAVfOtuySE4ydLmtcQUvtaTd2BDPB76tue41D88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787018651; c=relaxed/simple;
	bh=8HWpWGJ2h0r8aUIo5d9d5TCXrhWMqHaiE2z1pm118pU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lXeRAzY2nmgrqBnow1ykcakFITPM46g198wB2+UPK0HRjcN5LBCyZxE7nBGLr03mqHbtssJzTzLExTtnyTa6aQAB+5tFhiKG3gLoaa/ehT3x3Y+p7vq5NAWJFGV6VOmDo/AO0uQZwW534BV9F2weRdrzXpsCu2+Yc5Lb+jzFw3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lQIJUGOT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lQIJUGOT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 293551F000E9;
	Tue, 18 Aug 2026 02:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787018647;
	bh=RZZTtTNViCdLTTfwCYIn0hFs3LkTdzTVEw+Ih4XoV+0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lQIJUGOTtFrjFHmkrZ4khaqseSekWt/2dv85+I+B75IUOqmumY7arEcCp0AxNbCC6
	 Agdwy1ZL58c4fBwOrzj76rz3OElUF+YulJQ3jgLlzMjwJEJZkI/n+c+nF2BAiN2Bgr
	 wKaRRGxblf6FKZtMNLIcW0hdIDEtYrDcbDfghxQTV+e+/w1ZFfeFAoboKGLvKMVGbc
	 vrnyT/mT+bjmB86UZGJvA/7xVx1Yzro+fDu1hck54olOVRuknpRRe6p1hy3jFJpFwQ
	 Gifo3dQKjMmHW9Q941HsMQOSq0D7XyIWYfMsQOK3MpF0wmEQKN1P+pm+lfzUym3V54
	 eSm/0Qp5TzoHA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: net: bluetooth: add BCM4384
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kaihsin Chung" <kaihsin.chung@synaptics.corp-partner.google.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260818014948.996739-2-kaihsin.chung@synaptics.com>
References: <20260818014948.996739-1-kaihsin.chung@synaptics.com>
 <20260818014948.996739-2-kaihsin.chung@synaptics.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 02:04:06 +0000
Message-Id: <20260818020407.293551F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit adds the `brcm,bcm4384-bt` compatible string to the d=
evice tree binding schema without adding it to the driver's OF match table,=
 preventing the driver from probing the device.
--

--- Patch [1]: [PATCH v2 1/2] dt-bindings: net: bluetooth: add BCM4384 ---
commit c161423542c63c738bdc3a02df26a06ea20b52f5
Author: Kaihsin Chung <kaihsin.chung@synaptics.corp-partner.google.com>

dt-bindings: net: bluetooth: add BCM4384

Add the brcm,bcm4384-bt compatible string to support the Synaptics BCM4384
Bluetooth controller.

> diff --git a/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetoo=
th.yaml b/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.ya=
ml
> index 95501e858e6f8..612d21123aaad 100644
> --- a/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml
> +++ b/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml
> @@ -31,6 +31,7 @@ properties:
>            - brcm,bcm43540-bt
>            - brcm,bcm4335a0
>            - brcm,bcm4349-bt
> +          - brcm,bcm4384-bt

[Severity: Medium]
Will the driver fail to probe the device using this compatible string?

The commit message mentions adding support for the Synaptics BCM4384, but t=
his
new compatible string is not added to the of_device_id match table in the
driver itself.

Looking at drivers/bluetooth/hci_bcm.c:

static const struct of_device_id bcm_bluetooth_of_match[] =3D {
        { .compatible =3D "brcm,bcm20702a1" },
        ...
};

Without an entry in bcm_bluetooth_of_match, the hci_bcm driver will not bind
to the device at boot. Should the driver match table be updated alongside
the binding to ensure the hardware is actually supported?

>            - cypress,cyw4373a0-bt
>            - infineon,cyw55572-bt

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818014948.9967=
39-1-kaihsin.chung@synaptics.com?part=3D1
