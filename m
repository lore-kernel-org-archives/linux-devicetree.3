Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BBC3F7AB2;
	Fri, 26 Jun 2026 16:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782490323; cv=none; b=HFWL/Wrefp6dSrPc8lGvFwrMoIQeEqcOK1sR1CMxJAsNxaCUTcMyYKess/rLPTtC3T64nie6Msm+1LoDuhJvsfi8/d648PHRb5nuNIqYRRFpot5KMfzHtmgwtyVeHilzDgWxYg231GOxtB0jnrMyEDHHbKfs1GLHFhkQ//JZrvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782490323; c=relaxed/simple;
	bh=5YRniym/2tbxtuJ/K7G4NyD6iKvP4Rntx9BGCG6QVCc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=iHzoNQCzIZyc1iImBx2a9tQmPwxybIOeL+4nAAK3g0AvD8GzPOQuBM6vv873cB+FrceC/I2xHTbI5C4zk5rqh/hZm7J2JsC8YQ3NIHbBJB9JN8Sp3YFOBcZukN++pdX+Uds1Qayalj16S9mrg+RXwXQAmVQbprUsNtOKBpuupTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=C/NUSohY; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="C/NUSohY"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2F3E6C5CD68;
	Fri, 26 Jun 2026 16:12:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 465EB60232;
	Fri, 26 Jun 2026 16:11:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1D56E104C98AB;
	Fri, 26 Jun 2026 18:11:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782490314; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2aMpjqPpJ3jB+9a9ya7QqmAO5GA2YL86oNP/6GMR7AA=;
	b=C/NUSohY5vtGaRJld8ZdfDxYs5JmRhsZfHf2sMEvr+zI2ISREqyOFDdPUzfAlNDNSkmwjv
	m4MDWVI6r3d8tyl53THMcnLJBvOgU4C46LVuZAh5GvlJ++5QTILp9oIzONPtQBdVUeKdX5
	8iyisAOJwjmUNtOX9ubsQ/aiTmiZUkrBrwhxwzbsHFvTK5UI9J/s1ITN+vayybv0HyFW/l
	9zK2ebMFYtf7OWlPohfx2BGrQAdkK5Th7Y+LhdsUDTatQpo9D/rQFfgHkxJgAmTAql6iFM
	sPuvdkbNEz8O2TklPCFL7VZQhhTaBdkIqo2cUDzyP2p6a2jDXW4AkDMmsXGrYg==
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Jun 2026 18:11:46 +0200
Message-Id: <DJJ42UCJ1Y6X.TBR370GE9U1Q@bootlin.com>
Subject: Re: [PATCH 3/4] drm-bridge: lontium lt9611c: fixes and improvements
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Vinod Koul" <vkoul@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <boss@oss.qualcomm.com>,
 <qc-display-maintainer@oss.qualcomm.com>
To: "Mohit Dsor" <mohit.dsor@oss.qualcomm.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.21.0
References: <20260611-lt9611-b4-send-v1-0-42abbcd3bb1e@oss.qualcomm.com>
 <20260611-lt9611-b4-send-v1-3-42abbcd3bb1e@oss.qualcomm.com>
 <DJ6YOZ4G73A3.37QF618MHAR4F@bootlin.com>
 <ajkl2kl5oFh5tNG6@hu-mdsor-hyd.qualcomm.com>
In-Reply-To: <ajkl2kl5oFh5tNG6@hu-mdsor-hyd.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Mohit,

On Mon Jun 22, 2026 at 2:08 PM CEST, Mohit Dsor wrote:
> On Fri, Jun 12, 2026 at 11:26:34AM +0200, Luca Ceresoli wrote:
>> On Wed Jun 10, 2026 at 11:14 PM CEST, Mohit Dsor wrote:
>> > Remove two redundant lt9611c_reset() calls:
>> >
>> > 1. In lt9611c_bridge_atomic_pre_enable(): a reset is already performed
>> >    during probe and resume; calling it again on every display enable
>> >    adds ~440ms of unnecessary latency.
>> >
>> > 2. At the end of lt9611c_probe(): a reset was already performed earlie=
r
>> >    in probe before lt9611c_lock(). The second reset is redundant.
>> >
>> > Also, the DRM HDMI bridge framework requires hdmi_write_hdmi_infoframe=
 and
>> > hdmi_clear_hdmi_infoframe callbacks for HDMI vendor-specific infoframe
>> > (VSI) support, used for features such as HDR metadata signalling.
>> >
>> > This patch add stub implementations that return success. Wire them int=
o the bridge
>> > function table.
>> >
>> > Also, Store the chip variant enum value in the of_match_table .data fi=
eld and
>> > retrieve it via of_device_get_match_data() when probing from a DT node=
.
>> > Fall back to i2c_device_id.driver_data for non-DT (e.g. ACPI) probe
>> > paths.
>> >
>> > This is the standard kernel pattern for passing per-compatible data
>> > through the OF match table, and avoids relying solely on the I2C devic=
e
>> > ID table for chip type detection when DT is available.
>> >
>> > Populate bridge.vendor and bridge.product so the DRM HDMI framework ca=
n
>> > report the correct manufacturer and product name in the HDMI connector
>> > properties (visible via xrandr --prop and related sysfs entries).
>> >
>> > Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
>>
>> These are several unrelated changes and should be separate commits.
>>
>> Luca
>>
>> --
>> Luca Ceresoli, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>
> Hi Luca,
> Thanks for the review.
> I see your point about separation, but in this case I intended this as a =
single cohesive update to the driver rather than unrelated changes.
>
> The redundant lt9611c_reset() removals are cleanup to avoid unnecessary l=
atency during enable/probe.
> The HDMI VSI infoframe callbacks are required to align with the DRM HDMI =
bridge framework expectations.
> The OF match data change ensures correct chip variant detection when prob=
ing via DT.
> The bridge vendor/product population improves user-visible HDMI connector=
 reporting.

This a list of 4 things your patch does, and they seem fairly independent
from each other. That's a hint that they should probably be 4 patches.

If each is small, no problem.

An additional, pragmatic reason to split: if there's a bug in one of your
patches, it can be easily bisected and the problematic patch be reverted
without removing the other 3 patches.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
