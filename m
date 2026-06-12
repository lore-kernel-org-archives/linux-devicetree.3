Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694763A6B66
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256407; cv=none; b=jcnqe6hph+URW/UDdu74sCcPWL1aLmNFpM0Dr+l6OYrI8RwSZn5zFv5cH+dsZxzA9yxAD0EyB0R79kaRSHiaN6nM/LIAMZICAkTNPNlykqe2/alZsZqBngKHqjBlfV6uXfRWjjqA4LaerhZuno/eFWWPOw3AGg3Imw9MuKi1OfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256407; c=relaxed/simple;
	bh=lVB453GqtxNOW/m9ttHbJ1KHp31i0++asr+XpLQywXQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=DaMeV2R2bHW703y4ZuTfH/eMyraIOhGih3gi5ZX2Uo6+nWoiuUklCRhKxg2YXq++AcZeMvRnmuFNhouSdG2Y8MGkW7KEbUfIFA0lCRiL76J9NEely+szqI7rL1oX8MvnP+CA3iw1KXUShPDX2vjuED4cBH/AepCdjRZ9BWfc/b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=w+TU6xwt; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="w+TU6xwt"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 206BD1A38E2;
	Fri, 12 Jun 2026 09:26:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E52FF60012;
	Fri, 12 Jun 2026 09:26:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C60A9106C859C;
	Fri, 12 Jun 2026 11:26:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781256402; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fL33FL+aMUdA5kyqvTOXYyFEl0LYSHOsvxw7TOmrhQw=;
	b=w+TU6xwtAK71NAhdf7a38P76w9cqKNMgO2Jlk3AlahPESi+cVCrfOF3ORQCqI5uCbkvqo4
	2vKRRjKuBRnj/X4wMOHAMU+FYitPhSlFPx39Q3T+6aoqNaXozZ+rHl1nDBj+0tPNXNp+aU
	xlzCy/j5HToPF8ZAAc9ytw5tKWcQw8sP4tG863iM8W6x82AGBlzf/kTdkdTNQpeFgdllMg
	MhVI5EdEd0rMw90A46TUXYWM/0c3WRV2lZaKMDPJrtdSEC+R4VbWadPJBZ3Hvz9aTH8Cyo
	isQnVbCxdD5nDVjyh/KYMTO4fmizkUufU3chAmg5Msv9d7WOIOBiD6AmRy1akw==
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Jun 2026 11:26:34 +0200
Message-Id: <DJ6YOZ4G73A3.37QF618MHAR4F@bootlin.com>
Subject: Re: [PATCH 3/4] drm-bridge: lontium lt9611c: fixes and improvements
Cc: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <boss@oss.qualcomm.com>,
 <qc-display-maintainer@oss.qualcomm.com>
To: "Mohit Dsor" <mohit.dsor@oss.qualcomm.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Vinod Koul" <vkoul@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.21.0
References: <20260611-lt9611-b4-send-v1-0-42abbcd3bb1e@oss.qualcomm.com>
 <20260611-lt9611-b4-send-v1-3-42abbcd3bb1e@oss.qualcomm.com>
In-Reply-To: <20260611-lt9611-b4-send-v1-3-42abbcd3bb1e@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Jun 10, 2026 at 11:14 PM CEST, Mohit Dsor wrote:
> Remove two redundant lt9611c_reset() calls:
>
> 1. In lt9611c_bridge_atomic_pre_enable(): a reset is already performed
>    during probe and resume; calling it again on every display enable
>    adds ~440ms of unnecessary latency.
>
> 2. At the end of lt9611c_probe(): a reset was already performed earlier
>    in probe before lt9611c_lock(). The second reset is redundant.
>
> Also, the DRM HDMI bridge framework requires hdmi_write_hdmi_infoframe an=
d
> hdmi_clear_hdmi_infoframe callbacks for HDMI vendor-specific infoframe
> (VSI) support, used for features such as HDR metadata signalling.
>
> This patch add stub implementations that return success. Wire them into t=
he bridge
> function table.
>
> Also, Store the chip variant enum value in the of_match_table .data field=
 and
> retrieve it via of_device_get_match_data() when probing from a DT node.
> Fall back to i2c_device_id.driver_data for non-DT (e.g. ACPI) probe
> paths.
>
> This is the standard kernel pattern for passing per-compatible data
> through the OF match table, and avoids relying solely on the I2C device
> ID table for chip type detection when DT is available.
>
> Populate bridge.vendor and bridge.product so the DRM HDMI framework can
> report the correct manufacturer and product name in the HDMI connector
> properties (visible via xrandr --prop and related sysfs entries).
>
> Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>

These are several unrelated changes and should be separate commits.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
