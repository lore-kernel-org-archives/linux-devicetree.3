Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794340544;
	b=oe0Gp/Mxr6c0/5TMZGDWdDmKma8OIcYG9a4Kl/MKCkMjYKRPxAgFJikZg184/IX2EC7C
	 Vv5B8gI0CdCkN0X6DUVHRrTK1Ysy6UCXkZx5x+yL5NmjwjVEJWel1/kvzEcZb7cbPnrya
	 5N3xbvdK5HtVdAWkE8ESX7CcyhUSciF8jOyDHPzqyuP7HcxjgGci7CgtLasYQghW+8f8E
	 T8y9euyjEuwxo9YRBxkBhUDKlwKzYDBS0UwPPn0WqQUMmaxorZkmy49vtKy6jIfdgS7Za
	 5VKlmFGRX1a7HPk1tCClu/z92B1HylcG5kw4z3uBWZRkcm8dcO0uVZZXd6Xd2fp0Zwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794340544;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=OSPH1DjCz3ytXCkSpwALhsI+V4Nz7XdAxrkt0DEPaM8=;
	b=X0RlLGXshcxXcBo9gsXeV+9+tsftpAZrAReHvs5djZkMeoTXSB8heIi6Qke87JKb4J60
	 OXq8iss6gyTui2V5mKlGpjJraQk1g8yxrpRxLuI8KulfGrr2men5UKheHtOEwzmpF69Z8
	 bN+zEYWO1LXQvB/N2y0cwxuZ8oUFvSCDosWfAlbR7KyyuxltxZVl+sqTJ9gFmElOmfEya
	 Pb6DVE+ed2n7NlHbYODT+NYcNEsAH59X/EhK4iLADPbcxvFm7P6uqYdve4N0CeoFSjC4i
	 KXhVcoJ5mEqYSRCy28heoB/XZ8XqDU8FoDgON6QI0rWXBJMwHmjR0onJUF+wmxMweyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=UkT6q4kg;
	arc=none smtp.remote-ip=109.224.244.16
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A2A606A320
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 19:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11A2A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=UkT6q4kg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794340541; x=1794599741;
	bh=OSPH1DjCz3ytXCkSpwALhsI+V4Nz7XdAxrkt0DEPaM8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=UkT6q4kgWgYrvFqdEYgK44pa+CUa36ijN1sqrmsmnIFwTgsc0ika+/UcAs83VYrQh
	 f6oFZ5SPkNa2482tlPjji++LzVkO064uoW+YlKEIcn6FMJhuJ6vrk1CYV9Bgc9mJ5c
	 dv4yUcsFOXIWFUmXLMzGhtbmWaKBZEHvvGc4O9mUvZMfR0uF1u8niFX8eMR498IqVq
	 /Txb7pKRQ/NuyxsI5YvBDvxpAVuy+UT72tIZXZijcW67nYPp2Qa3qhi5NDtG1EtB/y
	 alHyNERYOmGuY84DyoANmCKtu+9CaIOc/9p+jWl0SjmAo0ibjyHHeswKp7lStVTT6r
	 S8ijCZ26ExMLw==
Date: Tue, 10 Nov 2026 19:55:36 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>, George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>, Fernando Rimoli <fernandorimoli11@gmail.com>, "D. Manresa" <dmanresa@gmail.com>, Jizhou Tong <fqwqf@fqwqf.xyz>, linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/6] media: ipu-bridge: Index the sensor device properties as the endpoint ones
Message-ID: <20261110195454.48176-6-lsa.uz@pm.me>
In-Reply-To: <20261110195454.48176-1-lsa.uz@pm.me>
References: <20261110195454.48176-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: e6d6dc47be8f214a639f15f9092d287ed3482731
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Fill dev_properties through an enum and IPU_BRIDGE_NEXT_PROPERTY(), as
ep_properties already is, so that an entry can be added without
counting slots by hand. No functional change.

Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
---
New in v4 (Sakari). The series that keeps what the software nodes point
to out of the module image is probably D. Manresa's, recalled on v3; it
changes the same lens-focus line, so whichever lands second needs a
trivial rebase:
https://lore.kernel.org/all/20261026082549.662885-1-dmanresa@gmail.com/

 drivers/media/pci/intel/ipu-bridge.c | 19 ++++++++-----------
 include/media/ipu-bridge.h           | 11 ++++++++++-
 2 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel=
/ipu-bridge.c
index c99c85b7e6f..2399a3d52b6 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -570,7 +570,7 @@ static void ipu_bridge_create_fwnode_properties(
 {
 =09struct ipu_property_names *names =3D &sensor->prop_names;
 =09struct software_node *nodes =3D sensor->swnodes;
-=09unsigned int i =3D 0;
+=09unsigned int i =3D 0, d =3D 0;
=20
 =09sensor->prop_names =3D prop_names;
=20
@@ -612,19 +612,16 @@ static void ipu_bridge_create_fwnode_properties(
 =09=09=09SOFTWARE_NODE_REFERENCE(&nodes[SWNODE_SENSOR_ENDPOINT]);
 =09}
=20
-=09sensor->dev_properties[0] =3D PROPERTY_ENTRY_U32(
-=09=09=09=09=09sensor->prop_names.clock_frequency,
-=09=09=09=09=09sensor->mclkspeed);
-=09sensor->dev_properties[1] =3D PROPERTY_ENTRY_U32(
-=09=09=09=09=09sensor->prop_names.rotation,
-=09=09=09=09=09sensor->rotation);
-=09sensor->dev_properties[2] =3D PROPERTY_ENTRY_U32(
-=09=09=09=09=09sensor->prop_names.orientation,
-=09=09=09=09=09sensor->orientation);
+=09sensor->dev_properties[IPU_BRIDGE_NEXT_PROPERTY(d, DEV_CLOCK_FREQUENCY)=
] =3D
+=09=09PROPERTY_ENTRY_U32(names->clock_frequency, sensor->mclkspeed);
+=09sensor->dev_properties[IPU_BRIDGE_NEXT_PROPERTY(d, DEV_ROTATION)] =3D
+=09=09PROPERTY_ENTRY_U32(names->rotation, sensor->rotation);
+=09sensor->dev_properties[IPU_BRIDGE_NEXT_PROPERTY(d, DEV_ORIENTATION)] =
=3D
+=09=09PROPERTY_ENTRY_U32(names->orientation, sensor->orientation);
 =09if (sensor->vcm_type) {
 =09=09sensor->vcm_ref[0] =3D
 =09=09=09SOFTWARE_NODE_REFERENCE(&sensor->swnodes[SWNODE_VCM]);
-=09=09sensor->dev_properties[3] =3D
+=09=09sensor->dev_properties[IPU_BRIDGE_NEXT_PROPERTY(d, DEV_LENS_FOCUS)] =
=3D
 =09=09=09PROPERTY_ENTRY_REF_ARRAY("lens-focus", sensor->vcm_ref);
 =09}
=20
diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
index 3ef94c2b767..284e0d6cc93 100644
--- a/include/media/ipu-bridge.h
+++ b/include/media/ipu-bridge.h
@@ -89,6 +89,15 @@ enum ipu_bridge_ep_props {
 =09IPU_BRIDGE_EP_NUM_ENTRIES
 };
=20
+enum ipu_bridge_dev_props {
+=09IPU_BRIDGE_DEV_CLOCK_FREQUENCY,
+=09IPU_BRIDGE_DEV_ROTATION,
+=09IPU_BRIDGE_DEV_ORIENTATION,
+=09IPU_BRIDGE_DEV_LENS_FOCUS,
+=09IPU_BRIDGE_DEV_NUM_OF,
+=09IPU_BRIDGE_DEV_NUM_ENTRIES
+};
+
 /*
  * Get the index of the next property in a property array, with a given ma=
ximum
  * value.
@@ -179,7 +188,7 @@ struct ipu_sensor {
=20
 =09struct ipu_property_names prop_names;
 =09struct property_entry ep_properties[IPU_BRIDGE_EP_NUM_ENTRIES];
-=09struct property_entry dev_properties[5];
+=09struct property_entry dev_properties[IPU_BRIDGE_DEV_NUM_ENTRIES];
 =09struct property_entry ipu_properties[3];
 =09struct property_entry ivsc_properties[1];
 =09struct property_entry ivsc_sensor_ep_properties[4];
--=20
2.54.0


