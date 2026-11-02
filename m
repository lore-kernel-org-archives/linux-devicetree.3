Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.25.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793651472;
	b=aYSAVIHkMFchfybbfseHCiL4USH7xh2Mm9UcmNKhGNb44tnLLVfvQwSc7b1JY379eSot
	 HKurAyCPl7jzC5U64HSKX2DgoZQzpVDtjRFzV6vfw73nsQFWR+GaN34NJGfBCaQSzfHeR
	 AxFxxgxH3jxeKHF223ZrDqnwDl7pqlksClR0wsAEFyEifCL9S7ouyKT2VzlVb4ju4s1wL
	 nkKnIQhMhttxxkyz9gIYJ8bKcRw6EWHH7UGNqC0so228xUAZSSnqRcsn4M6rj0urVEsTH
	 LgdCOQmTMrMvqvITN53dMlhkcwxJJnkbS3IXOpHRFwQpiNqv+uZ0Ms60+HdocLB75Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793651472;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Infomaniak-Routing;
	bh=A3grsg9PFvVcz9pL89ShJ0xeD6pAEsARr5XSaT9G+aA=;
	b=N8fUxEad+7kCPW8DwT19QdXkM9iRBg2DEJzTyk+Nsn/ctw3qqZjvSalVbmgVsIxPr/FH
	 3ZanMlj2jVd63OSCo70JMyLl7LCqu91m/i09uYCMPiSB90b+KXMfLS2diDu3O4msoiLG3
	 3QhUQNmKttAF/fSNBMUewypURgTvBeCPkqtn7c8V9w4roqFOtKQ6PPqMZEeGyBL6Bmc9b
	 auc8NQw2qgm+Fvih49sc1ZlqdxND3vj6AwEtAFq+JMTvV/sMWbZN4tpcfSSjE9vulT35v
	 M2sI6HagsHyNdCNtS/p1+l9YqVUKc0mbqBTYYC9xZfGvAEuQuMWww/43Trz7rnhLJYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=0leil.net;
	spf=pass smtp.mailfrom=0leil.net;
	dkim=pass header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256 header.s=20231125 header.b=hydPq1D8;
	arc=none smtp.remote-ip=185.125.25.14
Received: from smtp-190e.mail.infomaniak.ch (smtp-190e.mail.infomaniak.ch [185.125.25.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75C6606A324
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 20:31:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D75C6606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256 header.s=20231125 header.b=hydPq1D8
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jJNdT08fhz3Vn;
	Mon,  2 Nov 2026 21:31:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1793651468;
	bh=A3grsg9PFvVcz9pL89ShJ0xeD6pAEsARr5XSaT9G+aA=;
	h=From:Subject:Date:To:Cc:From;
	b=hydPq1D8DbuLmbGmRF8fhT9z+ziYQzpVIyXSrvJmNE8AbD6ryn26vpdGel80xushU
	 eboJqW55oFb9zvz7+oMpingejD1eb4LiOx7SuqSeErVBFq259/dFEy3+didaHgvvhd
	 3uM4sPnZQsIN1K7pu206PcHLCB/9S9IDbhx9IhloRXiXVZE7gd3P64n6tX3XfS9ZpA
	 Q/d7NrESQxQlbwt0PJII9zKvy1zNLNeBAhwS3CKSIlZ3VffLpJrmjYGmW2v9wO96Qf
	 f0OXjU+RL8J0DzOUT+tMgMkhVIzPY4twdzLyTaqoPNUjChsYE6hca9LEUG1q6IKTEF
	 OsQ7+Ij0GqW6w==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4jJNdR72jmz1bS;
	Mon,  2 Nov 2026 21:31:07 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Subject: [PATCH 0/2] arm64: dts: rockchip: enable OV9281 CAM0 and CAM1 on
 RK3588 Jaguar
Date: Mon, 02 Nov 2026 21:30:49 +0100
Message-Id: <20261102-jaguar-cam0-cam1-v1-0-c3aafcdab5dd@cherry.de>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2N2wqDMBBEf0X22UASMEJ/pfRhXVddodZuTCmI/
 268vAwcmDmzQmQVjvAoVlD+SZTPlMGVBdCAU89G2szgrQ/OusqM2CdUQ/i2RzjTElnfVaEOASH
 PZuVO/qfy+bo4pmZkWg7P3VD+pvy13LVt2wEWFiC1iQAAAA==
X-Change-ID: 20261015-jaguar-cam0-cam1-dcc02f56766a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.17-dev
X-Infomaniak-Routing: alpha

RK3588 Jaguar has two proprietary camera connectors, P14 and P15. This
adds support for the only camera module we currently have for this
connector.

The camera module has a 2-lane OV9281 camera sensor, an IMU, a
magnetometer and an EEPROM.

We have new camera modules based on an OV13850 that should be coming up
soon, hence why I made the support into their own separate DTSO instead
of directly integrating them in the main DTS.

Known issues:
- lis2mdl driver currently doesn't support being instantiated twice, so
  only one magnetometer will show up, if the two cameras modules are
  connected,
- OV9281 test patterns (no upstream support) returns broken patterns,
  see discussion on IRC
  https://libera.catirclogs.org/linux-rockchip/2026-11-02, the image I
  get without the test pattern *looks* okay to my non-expert eyes. In
  any case, it's unlikely to be an issue in the Device Tree,

Image capture test:
  #!/usr/bin/env bash

  set -o pipefail
  set -eux

  CAM=$1
  COLORFMT=$2
  SIZE=$3

  if [ "$COLORFMT" = "GREY" ] || [ "$COLORFMT" = "Y8" ]; then
  	MEDIACTLFMT="fmt:Y8_1X8/$SIZE field:none colorspace:raw xfer:none"
  	BITDEPTH=8
  else
  	MEDIACTLFMT="fmt:Y10_1X10/$SIZE field:none colorspace:raw xfer:none"
  	BITDEPTH=10
  fi

  if [ "$CAM" = "P14" ]; then
  	MEDIACTL_SENSOR="ov9281 2-0060"
  	MEDIACTL_RKCIF="rkcif-mipi2"
  	MEDIACTL_CSIRX="dw-mipi-csi2rx fdd30000.csi"
  else
  	MEDIACTL_SENSOR="ov9281 7-0060"
  	MEDIACTL_RKCIF="rkcif-mipi4"
  	MEDIACTL_CSIRX="dw-mipi-csi2rx fdd50000.csi"
  fi

  for dev in /sys/class/video4linux/video*/; do
  	if [ "$(cat "$dev/name")" != "$MEDIACTL_RKCIF-id0" ]; then
  		continue
  	fi
  
  	VIDEODEV=$(basename "$dev")
  	break
  done

  media-ctl -d 0 --set-v4l2 "'$MEDIACTL_SENSOR':0 [$MEDIACTLFMT]"
  media-ctl -d 0 --set-v4l2 "'$MEDIACTL_RKCIF':0 [$MEDIACTLFMT]"
  media-ctl -d 0 --set-v4l2 "'$MEDIACTL_CSIRX':0 [$MEDIACTLFMT]"
  # Name the file a format YUView can recognize automatically
  /root/yavta/build/yavta -f"$COLORFMT" -s$SIZE -c1 -n1 /dev/$VIDEODEV -Fframe-#_${SIZE}_${BITDEPTH}b_yuv400.yuv

With yavta[1] and checked with YUView[2] as gstreamer doesn't seem[3] to
have support for Y10.

Ran:
 - ./test-cam.sh P14 Y8 1280x800
 - ./test-cam.sh P15 Y8 1280x800
 - ./test-cam.sh P14 Y10 1280x800
 - ./test-cam.sh P15 Y10 1280x800

Pictures look decent to me.

Wrote random data to the EEPROMs and read it back identical.

Moved the cameras, accel and gyro raw sysfs values changed.

Magnetometers tested individually, with small magnet, raw values
changed.

I've not tested IIO buffers and/or the various interrupts.

[1] https://git.ideasonboard.com/camera/yavta
[2] https://github.com/IENT/YUView
[3] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/work_items/3738

Light dependency on
https://lore.kernel.org/linux-media/20261102-v4l-y8-y10-csi-vicap-v2-0-0a4149d96dae@cherry.de/
for it to actually work (no impact on binding or device tree).

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Quentin Schulz (2):
      arm64: dts: rockchip: enable OV9281 CAM0 P14 on RK3588 Jaguar
      arm64: dts: rockchip: enable OV9281 CAM1 P15 on RK3588 Jaguar

 arch/arm64/boot/dts/rockchip/Makefile              |   7 ++
 .../dts/rockchip/rk3588-jaguar-p14-ov9281.dtso     | 113 +++++++++++++++++++++
 .../dts/rockchip/rk3588-jaguar-p15-ov9281.dtso     | 112 ++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts     |  36 ++++++-
 4 files changed, 267 insertions(+), 1 deletion(-)
---
base-commit: 233ebf31c98e1d7185d12d1ff332f3354f4950f5
change-id: 20261015-jaguar-cam0-cam1-dcc02f56766a

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>

