Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794060968;
	b=Bke/NE0dBqumtq/LPrH8KIiO2MClixfjMLeJ01gRYY0aQdnV9oK5IWXUOUWdA4MhIevG
	 f6MlznStDNZMchowIg9FaAEu6eEf4HoO7eN/6705gA028U6s2pfPXf4V1/43PSAiP9WWU
	 WkV7cm4Ji7fTh/eYdN2xHmWD/tEwWOF5oNdrkqCIL+KunWppzXxOq1ONtYirJ/ieSXau7
	 yVr6qYinFW38tjmZIpmD3m/7qPUq6XnHkx1zxY0xNGazwa65m8xFdPhhQweEERE4T5sEN
	 MEf0r4HMCRbuQulNS+P2hGPs4w1JvKqJ1J4mKtIptnI8D19hRbug/cuIrRouDJlHiSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060968;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Oj4hys2FBjnmV+wzZLqdGQJybNqQMsqYbvklsOJc02g=;
	b=pJrm0w3FSliwNKjGyLMn3WPXXZ4T2gTcKyJuTjCyLAKVdgZ7y+wmEaK5X3T3ECHdyyjw
	 sRrxOrSC8igP9AqE3h1UsChQ4PDgJJH7nv0e0otxIl1917j7wIFJ7EfrZuHG/T3sPY+SK
	 ri3mZAc4TWIQlaGUvrSVloRnXozz77/5x2QkmaMEU8afNrZv1Wb02LvNhhzhR4A33y0yK
	 Vg6+tF3Nez0stri86ALPrtLMjnQPu8CkAEwNEAnKStRNXktk6jCgU6W5O0iUrAdjc4pty
	 DaLg176RGKhD5KHzheQ0HQ+Dr7gSupMGWC9Cdlg8XbD2ydNBRA1onllt9X9YoqQCSSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aQHSi2JL;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B655B606D82E
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 14:16:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B655B606D82E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aQHSi2JL
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b0a519049aso1091482a91.1
        for <devicetree@vger.kernel.org>; Sat, 07 Nov 2026 06:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794060967; x=1794665767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oj4hys2FBjnmV+wzZLqdGQJybNqQMsqYbvklsOJc02g=;
        b=aQHSi2JLbXZzRvHKmUV8NRbTN6TUdr2zNg+ceW1CK/ZlNcyZTXPvHYbYlqW2Ox/qJB
         ezcuSkzsniZZMwo63oZPOtqYWWfwZWecbejOrZSI6cq144s8w1aj7HExsylQIAzrl67J
         Wmh96XtIM5gPeusbRaeD6jFajJrVCs0xlT9Mzgd4KXmZv1JByFH3g80Dwkfl9FDbJNSO
         VRPaRJ9/ys5e0DGP04Wf5LL+aHOzlmYvxOwDnYc9cUPtkUQZuJCnRxP7X/q+BdgL5J4V
         s7ey9EDBpWJgczLcJqV/HVXZ4ZYBlGaC/8a0u2XpRLd//UuFjwG4MdiPzmhyG9fki47Q
         1kvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794060967; x=1794665767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oj4hys2FBjnmV+wzZLqdGQJybNqQMsqYbvklsOJc02g=;
        b=rChEf08ZqJLee9Zv3FsGkgEPwFsDZjDDzjcoeVmdTMxp7hU4Kh3szKQLdhJahhf6F9
         AAPGjaW7hfkBjbZp6VvmujpK4Ne/NNVr3YBJ8WfT5lu2K2pHlmnVXy8jmr+qrmEt+iwJ
         /uP+RwZTeW7bA1vRCPIRdaxBJnQDyRrojK/TdZ9fbLzbsUIcmznUSTZ0jiEY+qzsBhmb
         8h+nGFlbjy3ea76ufA2dDIIR+zCiOmfu2ZACIMfJm9MsHMqARIoY4IUKk78jy97/2OCE
         1pMlYZ/8uyqCsIib2TrI/vrtgYhKHKC2yZEsxRMLznepBQOLuNwRQZCu/fX+P4yy31SP
         tptQ==
X-Forwarded-Encrypted: i=1; AL+hErFGf3yZPxDHif07kt2kuyLi1ca5vfypla8VQC0GX5dry5GZdMSPHkZCsdiU9r605WbWcZV3or1XlCUk@vger.kernel.org
X-Gm-Message-State: APuU4Z+h94sH09CafXzWvfDiKJFf+4e0X9ijUJdWiyq7GdEZsSVOY2L/
	/VGCbNEmUun/qQHdvsRAmVQNh3dUYV9hQGnPB0rGtakOWZYFML5HYNbT
X-Gm-Gg: AYBFou0Df8gYXqt2gv0Y3B5/VmFf/N6Z1V6bSpYs5Q3eDj9CggVLRzJAWSJNMTgzh/B
	DN5adf9peuMhCykxcq5/jkPQz7W8wpeOv6mMF8G/Aa5lkZqfEUoaOh8rQ6hOWwCQHNbBi+JH9k1
	ra4jY/rUb9j+3/9Dlfl4s7BgPSIozvg2LDZYPtUr9/9ltIEz4lzEEyQc49Ggm1xaHg9KCvF3TkB
	CBI7PwXKl63k250QIGS8FrJCeKsLucHhjaThqi9AlmjEXF8LyLw9HoFay0XjgYb6WxYxVK+XfsU
	joSdoPHeLk4b0e/26ZJQWx8A0Qm5x3dTWFTXCaZ0EwkIH5rUgw7LhScD0ScmVn1pzwmOnfDXqbI
	t42a2nV8m3igEyeLVOfUE8aPqIMg88eUnUZfDQxITu6A7iKHhMqhTcE+hA8pw4bMqfSPsD7nJXc
	nU1q4VtS3HAwgWMYQshC5WEHp70YiAH2uRl+CNJCfhQ0stA3O8wxOVqj22uHDWMXwQy303ndW/L
	UTGKHFEa0rAB6UVuswyNufMwEFX5q2cKV+j/uyCmUPVgUKpzpjzOGDDFZtaXBNkBktdU9za9erO
	qplWIYy6mhiFM0ENuFEp9o+ImDTmM6Q=
X-Received: by 2002:a17:90b:33cc:b0:3b0:9deb:d991 with SMTP id 98e67ed59e1d1-3b0db6d37famr5526170a91.35.1794060966901;
        Sat, 07 Nov 2026 06:16:06 -0800 (PST)
Received: from debian.lan ([103.189.116.206])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b105864390sm3503778a91.6.2026.11.07.06.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 06:16:05 -0800 (PST)
From: Amir Hanip <killdeath104@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: abelvesa@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	killdeath104@gmail.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	barnabas.czeman@mainlining.org,
	a39skl@gmail.com,
	konrad.dybcio@oss.qualcomm.com
Subject: [PATCH v3 0/3] arm64: dts: qcom: Add Xiaomi Poco M3 (citrus)
Date: Sat,  7 Nov 2026 21:14:29 +0700
Message-ID: <20261107141432.39099-1-killdeath104@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds initial support for the Xiaomi Poco M3 (codename
citrus), a smartphone based on the Qualcomm Snapdragon 662 (SM6115).
As suggested by Barnabas, the shared parts of lemon are moved into a
common dtsi, and citrus is added on top of it. The series is based on
v7.4-rc1.

Currently working on citrus:
- UFS and microSD
- USB host (OTG), limited to high-speed (SuperSpeed is untested)
- WiFi
- Bluetooth
- Remoteprocs (ADSP, CDSP and modem)

Not included yet: the display panel, touchscreen and the display
pipeline, which depend on drivers that are not upstream. The GPU and
its zap shader are enabled, but no DRM device is registered without
the display subsystem, so the GPU is not usable with this series
alone. Audio is not included either.

Firmware and userspace: WiFi, Bluetooth, the remoteprocs and the GPU
zap shader need device-specific firmware which is not part of this
series. WiFi additionally needs qrtr, tqftpserv and rmtfs running in
userspace, and the Bluetooth controller needs its BD address set from
userspace.

Testing: citrus was tested on a Poco M3 booted from microSD with a
v7.2-based kernel. I do not own a Redmi 9T, so lemon is untested on
hardware. Instead, I compared the lemon DTS before and after the
split, normalized with dtc (dtc -I dts -O dts -s). The only
difference is the numbering of auto-generated phandles.

Changes in v3:
- Split lemon into sm6115-xiaomi-lime-common.dtsi and add citrus on
  top of it (Barnabas). The IPA carve-outs are in the common dtsi.
- Fixed the unit addresses of the IPA and GPU reserved-memory nodes
  (Sashiko).
- Split the card detect pinctrl of the microSD slot into separate
  states, as lemon does. The pin configuration is unchanged.
- Kept the ADSP carve-out per variant. A larger range common to both
  works on citrus (tested), as Barnabas suggested, but wastes 4 MiB
  of RAM, as Konrad pointed out. I did not touch lemon's value
  because I cannot test it.
- Kept the deletion of cdsp_sec_mem and of the orientation-switch
  property of usb_qmpphy in citrus, as in v2, since that is the
  tested configuration. Barnabas suggested they may be leftovers from
  the reference design. I will test dropping them and follow up.
- Dropped Konrad's Reviewed-by on patch 3 because of the rework.
  Krzysztof's Acked-by on patch 1 is kept.
- Clarified in the commit message that the GPU is enabled but not
  usable without the display pipeline.

Open questions, mainly for Adam:
- lemon's GPU carve-out is 0xfa400000, citrus uses 0x55a15000 (right
  after pil_ipa_gsi_mem). Is the lemon value intentional?
- lemon's ADSP carve-out is 0x53400000/0x2600000. Barnabas reported
  that lemon's stock layout (from MIUI sysfs) starts at 0x53800000.
  If lemon also works with 0x53800000/0x2200000, the node could move
  to the common dtsi in a follow-up.
- lemon marks l5, l7 and l22 as always-on, citrus does not need it.
  Is it needed on lemon?

Link to v1:
https://lore.kernel.org/linux-arm-msm/20261027075116.41673-1-killdeath104@gmail.com/
Link to v2:
https://lore.kernel.org/linux-arm-msm/20261027205146.16384-1-killdeath104@gmail.com/

Amir Hanip (3):
  dt-bindings: arm: qcom: Document Xiaomi Poco M3
  arm64: dts: qcom: sm6115-xiaomi-lemon: Split out a common dtsi
  arm64: dts: qcom: Add Xiaomi Poco M3

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm6115-xiaomi-citrus.dts    | 237 +++++++++++++
 .../boot/dts/qcom/sm6115-xiaomi-lemon.dts     | 317 +----------------
 .../dts/qcom/sm6115-xiaomi-lime-common.dtsi   | 335 ++++++++++++++++++
 5 files changed, 575 insertions(+), 316 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sm6115-xiaomi-citrus.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm6115-xiaomi-lime-common.dtsi


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3

