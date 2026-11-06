Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969135;
	b=Jt79NpmHuGDerofjfAfarAv8PmM0Eyp8uZfUkbIKaNVOzdaLg00Ui2Isj67jlar+YUB1
	 Hp9cX2TyeMI9K83dR/nTXyucPNphPHx+aHuz7BRzsI/AXrZXDDp+lutJRD6100nnuKiqt
	 9gA+JJF8I9fVwXD57YXP0sejn+5L+6A+4F+GxxxUdebCIzzeztKrdCRoCZw9CJ6kkCJ9D
	 KWpWBtYx/9N8xbDA6HvsXU9uskzanaaUlJGrBXfGdYmc1R3BqHxdBb73s7TZ+5ApNCss2
	 E8e8I32PxvScW5WPTE1Ye253OKL2kFr717wDxUaj5fwWL4J4Hwnq4RVYX0UC+nh8Ciw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969135;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=5zLPmEptRl/1P2JchgpAI/5mmku3jv3mbAJMP+1s0jA=;
	b=VRVJpXP11Y338TiZGs56wjoIFPdFIZBvsHc/DEd6hcTQ6EprNKrRpXOa8Q5ANgmFo6zQ
	 2ecD/nGdbfWvaWKcOgWMuzkCVpY5jAPLvHvBbPYFFZpErFSs2k+doXdkI0x9x1XqMV2rZ
	 PfP6eolh1vXtlvfSZXuf+aooVcV5ybD3h1V8Gw7s3S/z5IiyVnSEMcrWrsy36cpT7Abtq
	 GGp417cnSJIMd9aKV5jKMd8uvAi3WJ7Bax0qz9Fn8nhaw0v49nxmmQEP1IBdCn9IM9ALq
	 6pbZ3kjH4lJy1WOgAhmQeY/p64I6/7rT9/ridHLrcpUtDtUCQExjL6PtxP5vGrPNI0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=BJd+3ffo;
	arc=none smtp.remote-ip=109.224.244.122
Received: from mail-244122.protonmail.ch (mail-244122.protonmail.ch [109.224.244.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82713606A326
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 12:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82713606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=BJd+3ffo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793969132; x=1794228332;
	bh=5zLPmEptRl/1P2JchgpAI/5mmku3jv3mbAJMP+1s0jA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=BJd+3ffovZGOVPuv6iu7obngajAyASsfmMZuQ7/Buwyu+TB9cRl1Jp3J4Eg0aHDSD
	 3UObwnyxIgOtS96U1RTddIMUJ+kpfkKfyyy5kbIa3eWIgp+PEEU8j84eKyVj97o+ec
	 yWLcWIF7DlO0mbKCchxGO7AM12tSNGrgORmC89UuNjDrdPpdaTXWVM8vL5jP34A/+5
	 /PWNoljHHpen19MqoY669wUVb/2YrW8xRgykTCteJbN0KWm5EKkYXDg+fc6ReTLiBq
	 A1PGJI6FOktDwSZ546wac3A+pDDeBBqoOg5PXy69BX9yk0tdRbxupMA++iMTKK6ibT
	 v0xl7xiH69Rfg==
Date: Fri, 06 Nov 2026 12:45:21 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Andre Gilerson <andre.gilerson@gmail.com>, Dan Scally <dan.scally@ideasonboard.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, German Pablo Lindo <germanpapulindez@gmail.com>, George Neacsu <geocausa@gmail.com>, sashiko-bot@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 0/3] Add support for the Sony IMX681 camera sensor
Message-ID: <20261106124505.71429-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 477b33abc04c393b491e300af5e84740e5f8d049
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

The Sony IMX681 is the user-facing camera on the Microsoft Surface Pro 11
for Business (Intel Lunar Lake, IPU7), ACPI device SONY0681. Without a
driver the camera does not appear at all.

  1/3  dt-bindings: media: Add Sony IMX681        (mine)
  2/3  media: i2c: Add Sony IMX681 sensor driver  (Andre's, co-developed)
  3/3  media: ipu-bridge: Add Sony IMX681         (mine)

The driver is Andre's, reverse-engineered from I2C traces taken under
Windows.

Changes in v10
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- 2/3: hold a runtime PM reference across probe. Setting the autosuspend
  delay with the usage count at 0 suspended the sensor in the middle of
  probe, and a later failure then powered it off a second time. Found by
  Sashiko on v9 2/3 and 3/3.
- All three: the Assisted-by tags are dropped; see the end of this letter.

1/3 and 3/3 are otherwise unchanged. The review and test tags are kept,
German's Tested-by on 2/3 too: the change is limited to probe's runtime
PM and its error path, both tested below.

While this sensor streams, IPU7's CSI-2 receiver logs "Received packet is
too long" once per frame, and the frames are complete. Andre sees the same
with his downstream driver, so it does not come from this series.

Tested with v10 on the Surface Pro 11 for Business, on v7.4-rc1 with [1],
[2] and [3] applied, KASAN and lockdep on:
- after probe the sensor stays active and suspends about 1 s later;
  v9 was already suspended when probe returned;
- probe forced to fail after the runtime PM setup and at registration,
  with a test-only parameter: no clock or regulator warning, where v9
  gives three per failure (clock already disabled and unprepared,
  unbalanced regulator disable);
- v4l2-compliance 46 of 46, no warnings;
- 3844x2640 at 30.01 fps;
- the four flip states give the four Bayer orders, and EBUSY while
  streaming;
- runtime suspend after streaming, and capture after unbind and bind and
  after five module reloads;
- no KASAN or lockdep report;
- W=3D1 and sparse clean on x86_64, on i386 and without CONFIG_PM;
  dt_binding_check clean.

Tool use, per Documentation/process/generated-content.rst (Assisted-by
tags in commits were dropped in 7.4-rc1):

* My contributions to this series were prepared with Claude Code
  (claude-opus-5-5); work by others in it is their own.
* This replaces any Assisted-by tags in earlier versions.

[1] https://lore.kernel.org/all/20261103103235.94397-1-lsa.uz@pm.me/
[2] https://lore.kernel.org/all/20251208035122.2147678-1-hao.yao@intel.com/
[3] https://lore.kernel.org/all/20261026082549.662885-2-dmanresa@gmail.com/
v9: https://lore.kernel.org/all/20261106041116.78937-1-lsa.uz@pm.me/

Andre Gilerson (1):
  media: i2c: Add Sony IMX681 sensor driver

Sergey Lebedev (2):
  dt-bindings: media: Add Sony IMX681
  media: ipu-bridge: Add Sony IMX681

 .../bindings/media/i2c/sony,imx681.yaml       |  108 ++
 MAINTAINERS                                   |    8 +
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/imx681.c                    | 1034 +++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c          |    2 +
 6 files changed, 1163 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx681=
.yaml
 create mode 100644 drivers/media/i2c/imx681.c


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
--=20
2.54.0


