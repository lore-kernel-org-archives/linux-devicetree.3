Received: from mail-106118.protonmail.ch (mail-106118.protonmail.ch [79.135.106.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B709B42882B
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 07:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789976087; cv=none; b=LHNXpW6DCU3Rj+kv3rOVtqBMqIHS4D4fHnbA/hCzzcfJ7YjPDKRhtSZr6zIfB0bK5nkDClBkUyb9tTWxmAQKglRzkoevOsKBwM9xtlr8O+Kob1rlwDYEvF9l7e62SbRmUlv1BxiXYqwECQRPyEKMgcz+hdPRX8QXtNRTobG06Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789976087; c=relaxed/simple;
	bh=h9Trgpq+IKaW7jFGrhNGqF9VOhmwiuANsQLufQFcwWA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G4iSlE5yn66ME1TE88eENYoZdvFVTUtI1h0uyPdUzm29w/ebcdu28AQwvMxAyXFeGrfZt4qekQDDdat/4stzI4vGY4qezDkacCupVRRFXoaLhF9JnYujUTg5cAhiNuGu0KHmTWdFn1hg0XpPIARKcbyt3kc+k1IzHjMjJ2aFoSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=QKR05Mll; arc=none smtp.client-ip=79.135.106.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="QKR05Mll"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1789976078; x=1790235278;
	bh=h9Trgpq+IKaW7jFGrhNGqF9VOhmwiuANsQLufQFcwWA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=QKR05Mllvud6urhTcdiEkS8eHj2WyLv8/qQktl58DYQ9RU0AJB5uYPQuoiWHtfzaD
	 CkKbp6EmcfkvxzFqwg1zw0+Tvg75KTfbxHmKfXl9tR8AL0XcbOmb+2DrPUvb/rHWsR
	 MORAeAf+Qj2GAbKrEhD+NRIbaDaRlUZ3W5+nczs/HMtwUQ4RTyEF8galiEg/8hnioN
	 83J/IkO6hcvUecaSSDPY68ZKQjRIHn+YFvztpO30nPJDjPyhwpI3VimjK2RbVuTjX7
	 y11NJPLo/Ur6sbrQkAhrGZvdo28FcyIJC+J2yusBbGhATafoAmHWlJEIamLbA5M2r1
	 92Rt91FI9uGtg==
Date: Mon, 21 Sep 2026 07:34:32 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Andre Gilerson <andre.gilerson@gmail.com>, Dan Scally <dan.scally@ideasonboard.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, German Pablo Lindo <germanpapulindez@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] media: ipu-bridge: Add Sony IMX681
Message-ID: <20260921073352.86357-4-lsa.uz@pm.me>
In-Reply-To: <20260921073352.86357-1-lsa.uz@pm.me>
References: <20260921073352.86357-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 403f4117b07099c1e132ec4cbb89ad30c3e0ffbc
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The Microsoft Surface Pro 11 for Business (Intel Lunar Lake, IPU7) carries
a Sony IMX681 as its user-facing sensor, enumerated as ACPI device
SONY0681. Add it so ipu_bridge_connect_sensors() builds its half of the
graph; without the entry the sensor is never connected, whatever driver is
present.

One link frequency, 969.6 MHz, on two CSI-2 lanes.

Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel=
/ipu-bridge.c
index 77257311d1..a1a4023f81 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -116,6 +116,8 @@ static const struct ipu_sensor_config ipu_supported_sen=
sors[] =3D {
 =09IPU_SENSOR_CONFIG("OVTI5693", 1, 419200000),
 =09/* Omnivision OV8856 */
 =09IPU_SENSOR_CONFIG("OVTI8856", 3, 180000000, 360000000, 720000000),
+=09/* Sony IMX681 */
+=09IPU_SENSOR_CONFIG("SONY0681", 1, 969600000),
 =09/* Sony IMX471 */
 =09IPU_SENSOR_CONFIG("SONY471A", 1, 200000000),
 =09/* Sony IMX471 (found on Lenovo X1 Carbon G14) */
--=20
2.54.0 (Apple Git-157)


