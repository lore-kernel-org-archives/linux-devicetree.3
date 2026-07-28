Received: from smtp-outgoing-1701.laposte.net (smtp-outgoing-1701.laposte.net [160.92.124.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED38342D76A
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.92.124.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785241712; cv=none; b=O1fnUw75lIEE+R5MyUzqIk1e4BYdv9W3OUDVRttLR4MZiTJPIYB+aGdWVPXvCbl36pm09NVJBt2qIc8MUlPM8MLhpdvWwGrrX2rWiyOisWHLyeI0linmuyEWpyItH6ePcdPIZb9Y20uhvZjgqtPsBxFq4Yl74F5UZpm3e088kbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785241712; c=relaxed/simple;
	bh=fuFuGjeSJ5R7IX0XoQ0bGlnKWPU2bT8b7T+6cu4eEzM=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=DQkkRX12w85qswftUGu7i3oMj2RX50uubw3ZlaoizrGLjWC8aW73BIQopc0e4BxoxPVId4ah0wTMh4dHlwMTvh8QNTU0DoBdCFxOSRE60+k0JBrRr9CDJBHpWQGzteVmxiEYPOSu2G+/YEFj3vjBFhFuhPkRICKKe1mOQ4Jiyss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=laposte.net; spf=pass smtp.mailfrom=laposte.net; dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net header.b=GYn8Lup9; arc=none smtp.client-ip=160.92.124.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=laposte.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=laposte.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net header.b="GYn8Lup9"
X-mail-filterd: {"version":"1.9.7","queueID":"4h8T9W1PR8zSgpL","contextId":
 "ab152995-0c31-475d-8f6c-4505b1b6d5ff"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
	by mlpnf0112.laposte.net (SMTP Server) with ESMTP id 4h8T9W1PR8zSgpL;
	Tue, 28 Jul 2026 10:27:43 +0200 (CEST)
X-mail-filterd: {"version":"1.9.7","queueID":"4h8T9V4ST7zSgp1","contextId":
 "bafc484e-eddf-447d-a6d3-e19b85c213d1"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 40
X-lpn-spamlevel: not-spam
Received: from [192.168.1.2] (unknown [82.67.82.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mlpnf0112.laposte.net (SMTP Server) with ESMTPSA id 4h8T9V4ST7zSgp1;
	Tue, 28 Jul 2026 10:27:42 +0200 (CEST)
Message-ID: <cc697c8d-8389-4d26-ac3e-4dc51a247dba@laposte.net>
Date: Tue, 28 Jul 2026 10:27:32 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: wenmeng.liu@oss.qualcomm.com
Cc: conor+dt@kernel.org, conor.dooley@microchip.com,
 devicetree@vger.kernel.org, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 mchehab@kernel.org, robh@kernel.org, sakari.ailus@linux.intel.com,
 vladimir.zapolskiy@linaro.org
References: <f12c1344-67ff-4242-9c39-59ac208e9b35@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/3] media: i2c: Add OmniVision OG0VA1B camera sensor
 driver - IPU and ACPI
Content-Language: fr
From: Alain Cousinie <alain.cousinie@laposte.net>
In-Reply-To: <f12c1344-67ff-4242-9c39-59ac208e9b35@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=laposte.net; s=lpn-wlmd; t=1785241707; bh=fuFuGjeSJ5R7IX0XoQ0bGlnKWPU2bT8b7T+6cu4eEzM=; h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:Content-Language:From:In-Reply-To:Content-Type:Content-Transfer-Encoding; b=GYn8Lup9MK7FGT8shm+V62xOdOF+MWVAkCc07fgNQIByLWfoUPufZ7Fm1cp2ZKVb/I3HK83WrNbfonfsE2vZV0cJw5LgBwCtD+j/DEIsL1D04SpaGLf9s3k9gTnk6UpZixk9f2v1K3rQQ3o6lah6U3W1KnmqG+EkgWgjAWcZPCTGrV6Gz6R8JZNmi3cRcFyBa7V/cGHFg4KyHDpLo7pEYM28pr+7yZn/rrjzv/JfPL2syl8KaVuyl4vaUpqEfNdBAcIEpYW7OZ27w7JXXlKv9pQWbCFBpRd6MquUMK4pMJs07li9aGmQwLYjD0BChvdwx0ibWHYBBLElCMu64Sv/TQ==;

Hello,
I am a novice when it comes to the Linux kernel.
The og0va1b sensor is also used in laptops (HP, Dell, etc.) with IPU6=20
and ACPI.
I tried this on my HP Spectre 14-eu0xxx laptop, and it seems to work=20
(though it isn't fully functional yet, as other elements are missing).
I would like to propose adding this configuration for this sensor.

So, I added the ACPI ID=E2=80=94OVTI00AB for og0va1b=E2=80=94to the IPU:

+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -73,6 +73,8 @@
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IPU_SENSOR_CONFIG("INT3537", 1, 437000000),
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Lontium lt6911uxe */
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IPU_SENSOR_CONFIG("INTC10C5", 0),
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Omnivision OG0VA1B */
+=C2=A0 =C2=A0 =C2=A0 =C2=A0IPU_SENSOR_CONFIG("OVTI00AB", 1, 480000000),
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Omnivision OV01A10 / OV01A1S */
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IPU_SENSOR_CONFIG("OVTI01A0", 1, 400000000),
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IPU_SENSOR_CONFIG("OVTI01AS", 1, 400000000),
---

Then, I added the ACPI declaration to `ov0ve1b.c`, following the patches=20
for og0va1b:

diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
--- a/drivers/media/i2c/og0ve1b.c
+++ b/drivers/media/i2c/og0ve1b.c
@@ -978,8 +978,11 @@

 =C2=A0 =C2=A0 =C2=A0 =C2=A0 og0ve1b->dev =3D &client->dev;
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 og0ve1b->data =3D i2c_get_match_data(client)=
;
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!og0ve1b->data)
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!og0ve1b->data) {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 og0ve1b->data =3D=
 device_get_match_data(&client->dev);
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!og0ve1b->da=
ta)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return -ENODEV;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }

 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v4l2_i2c_subdev_init(&og0ve1b->sd, client, &=
og0ve1b_subdev_ops);
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v4l2_i2c_subdev_set_name(&og0ve1b->sd, clien=
t,
@@ -1114,6 +1117,15 @@
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SET_RUNTIME_PM_OPS(og0ve1b_power_off, og0ve1=
b_power_on, NULL)
 =C2=A0};

+#ifdef CONFIG_ACPI
+static const struct acpi_device_id og0ve1b_acpi_ids[] =3D {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {"OVTI00AB", (uintptr_t)&og0va1b_data},
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 { /* sentinel */ }
+};
+
+MODULE_DEVICE_TABLE(acpi, og0ve1b_acpi_ids);
+#endif
+
 =C2=A0static const struct of_device_id og0ve1b_of_match[] =3D {
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { .compatible =3D "ovti,og0va1b", .data =3D =
&og0va1b_data },
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { .compatible =3D "ovti,og0ve1b", .data =3D =
&og0ve1b_data },
@@ -1126,6 +1138,7 @@
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D "og0ve=
1b",
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pm =3D &og0ve1b=
_pm_ops,
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .of_match_table =
=3D og0ve1b_of_match,
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .acpi_match_tabl=
e =3D ACPI_PTR(og0ve1b_acpi_ids),
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .probe =3D og0ve1b_probe,
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .remove =3D og0ve1b_remove,

---

Here is an example of my tests: `$ cam -c2 -C1 -Ftest.bin`
 =C2=A0 =C2=A0 Using camera \_SB_.PC00.LNK1 as cam0
 =C2=A0 =C2=A0 [3:02:57.280464484] [55404]=C2=A0 INFO Camera camera.cpp:1=
216=20
configuring streams: (0) 640x480-R10/sYCC
 =C2=A0 =C2=A0 cam0: Capture 1 frames
 =C2=A0 =C2=A0 10977.366149 (0.00 fps) cam0-stream0 seq: 000000 bytesused=
: 614400

This produces a raw image file that I can view using various tools, and=20
it appears to correspond to the sensor.

Best Regards,
Alain

> On 23/07/2026 =C3=A0 04:41, Wenmeng Liu wrote :
>>
>>
>> On 7/8/2026 10:33 PM, Wenmeng Liu wrote:
>>> Add OmniVision OG0VA1B driver support. The OmniVision OG0VA1B is a
>>> 1/10-inch monochrome CMOS VGA image sensor. It outputs 10-bit raw (Y1=
0)
>>> frames at up to 640x480 resolution over a single-lane MIPI CSI-2
>>> interface and is controlled via an I2C-compatible SCCB bus.
>>>
>>> This driver has been verified(include tpg) on the Purwa EVK.
>>>
>>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>> ---
>>> Changes in v3:
>>> - Generalise the binding title and description for both sensors. --=20
>>> Vladimir
>>> - Keep the cached pre_isp read so the OG0VE1B test pattern still work=
s,
>>> select it via a per-sensor callback. -- Bryan, Vladimir
>>> - Rename the "sensor" field to "data", drop bpp (derive from code) an=
d
>>> add og0ve1b_pixel_rate(). -- Vladimir
>>> - Sort defines, rename the shared CHIP_ID reg to OG0V_ and order
>>> og0va1b_data first. -- Vladimir
>>> - Expose all four OG0VA1B test patterns instead of one.
>>> - Link to v2:=20
>>> https://lore.kernel.org/r/20260702-og0va1b-v2-0-0071442caa2a@oss.qual=
comm.com
>>>
>>> Changes in v2:
>>> - Integrate OG0VA1B into the existing og0ve1b driver and binding
>>> instead. -- Vladimir
>>> - Link to v1:=20
>>> https://lore.kernel.org/r/20260618-og0va1b-v1-0-dda71bb83009@oss.qual=
comm.com
>>>
>>> ---
>>> Wenmeng Liu (3):
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dt-bindings: media: i2c: og0ve1b=
: Add OmniVision OG0VA1B=20
>>> camera sensor
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: i2c: og0ve1b: Introduce p=
er-sensor data structure
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: i2c: og0ve1b: Add support=
 for OmniVision OG0VA1B
>>>
>>> =C2=A0 .../bindings/media/i2c/ovti,og0ve1b.yaml=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 15 +-
>>> =C2=A0 drivers/media/i2c/og0ve1b.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 375=20
>>> ++++++++++++++++++---
>>> =C2=A0 2 files changed, 344 insertions(+), 46 deletions(-)
>>> ---
>>> base-commit: 5c73cd9f0819c1c44e373e3dabb68318b1de1a12
>>> change-id: 20260618-og0va1b-55bbf3cabb0e
>>>
>>> Best regards,
>>
>>
>> Gentle reminder to review this patchset.
>>
>> Thanks,
>> Wenmeng
>>


