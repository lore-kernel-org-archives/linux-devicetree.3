Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793087505;
	b=2Hf2Ji5MXCdj/kLr9XvlwPEQfzi/ibFvFaNs3hM9Hey8uoE8Y3Ng37rykka2ItQKNfVa
	 yVs0bBVC+GiWU2XWSS0pvlERjz8KxQ8rkLrCESviLBnOXnOApx7DNbTUKcc4SrqKjf8rb
	 phslrqbJhP6UHz+xSgMnMvT0ngn2RLaHmVBOSzihpR7PfgeMMq4+ENEsaSCZxI4Ro8HV/
	 f2jHuvKxfVjlShyDU8KYT4hH2xU7jlKLXfaJDUT/6xJm8TaAcNYcW67VZGiV5tgN8eoLJ
	 kdObBzeRIJiQHAEn3WHaSBTKdBi33GRDAXuP/Yvw93tEjp1JuazmzFcpSEgRNBeuR8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793087505;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=acnStiLnhMHoFtH9MxN6320P5itUUR4d4HGEJJqetkY=;
	b=0qE7toxPGdxFb4mcR/9aLs/tgN8NhsNj9EsfmBLnUpDKy+qdyHqq+jRmZTuHhDRWMxKw
	 OYj7rdXlAJ+3LGtzyzsGyJ8cCh5+GhfyuyvHihad9LwA/9bIdFx26PT0rZqrwfaR2Ze3M
	 TJSpDWcVwGDOf4LaEc4ZDkaTi0ywxKfz7MvdlCjXngbhLdW0eDO/dtUUyxzTObfy0W6Pq
	 LMEN6VC7rQBmFDdikoOdw110A1Eb88JUVLRd9cb0UkiE3XXWS3V125vO23nY1PosFtZ5I
	 D2AXxL59oiL3Wi1orN+Qjn5v4cgekV9rnql6e3WKKt2lKlmvmwesOORrnVIwmfZ6o9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EsuF8IBF;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26281606A31B
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 07:51:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26281606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EsuF8IBF
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so2058330a91.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 00:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793087503; x=1793692303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=acnStiLnhMHoFtH9MxN6320P5itUUR4d4HGEJJqetkY=;
        b=EsuF8IBFEyWcx92BGt0MefrirPegPiY5VvVfx0NRbT1NBCbqvuXxVtodUpzbjZ/OK8
         CKVrL2M/UxNsGf9+j3FBShQCCgKymDyDn2TrlM4ZBGsvtLBmPKPlA5z2lr7xH5QHXYBi
         FZEyuspH0U7Jph7qDwuf+M8lxutNE3bF7zqA7rJWOSoWerCgxAmdatquMPmsit+2A5U9
         gIdnxXhwfjEG5KCSbiImFm+bpQk9zCld3WhSjM/WEdxzAL23vvz2InTpPRYXUmRLyN3B
         Lr4T1wfVdvOnTcovr0hU8Lt2UeYWgfcKW2ZQx+TrA3lvwKF0AMzPPan8H4YCiglETX/A
         4ZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793087503; x=1793692303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=acnStiLnhMHoFtH9MxN6320P5itUUR4d4HGEJJqetkY=;
        b=OiOeFzmlkscKIJGPZDK1zXHlCd3DTnaUHSwtAfYucYobc1oKb89HfbzPfPDc7M9WIe
         iyWfk5JDbiieyQrPDTLtKStSjXwEVSyaI+g+nBOk7d54p/1WA1/WAH+wet3HMMvOXdCB
         N4cc/cvg62muqbcuq4f7Wb7y67KMpCxckI4ndn0MnwmkpxKPh495/H/mNJr43dvmOxiV
         8wT7HSsqiadzrSOW7w4aeoX+FzPZy025gC0OLE1OK3AVFp5fHUvFkOyJqtDdecWPmBFs
         TxLiKKbceiuqZQrYr5GPIlilDcG5wnc54giLKhSLmBcgcC55nbwCkdjJsJaDqYSBoKlu
         +Ihw==
X-Forwarded-Encrypted: i=1; AKwUvBxyc1CbWTDz2DMFMs8ku9lwAMcMI9dTBYvb5ECsefeQeIDUmVeLupSvfkKLdMT0Ls8xdEnq3hZ/xc/h@vger.kernel.org
X-Gm-Message-State: AFq9FYLdIuptHy3dkorsgMLRB1eeXIqc7hMnKJXTI+b2FHYvLOPhqB1z
	tmeNHRS0t9/svvsQzpd6ZwzyY8SkWi2kTFIp0ultZmTxWdr3CNyMc2Ir
X-Gm-Gg: AYBFou2sQthzUupazO4SadtWijfSs0m02USuVv2FrJfnG18Nv33tYkazb9GSS6P2oIj
	5bKv7PUt3RUZpEsYR1Zh0kLnDEl52bqw7rqQJcW/I+iQrqg/KO4NFPGzz5sKYoh0CkpFN9M7bIF
	cQsj2XrUaGgHKcGzedb4iNii5f/Oz7jFSmVIoEHgehaJIHZV7EdF5gNnkGc9j+yWHu34y2IevEC
	tlndT7Wk3AYV8hmU45a/yf1rPD0+yJ0xQFTcdhlSh6g4tR3KJ4fSvP8shM9klylY7t9JGq74yR0
	2AaizcGg2O+wEWBFiADvOLgd270ryML1tXEL5gxuTHZXahwbZdVOFn1V2shLK5jjbmxeuvyC3h4
	pkl67u4N5q+ZlIJCoiU+q2IBTXZjLXZjpzzwF7xitAy3G18r3qet9Tbz4eAUZqf7SwycGx/cquA
	zDetFjuFIdUeWqIFbf4zzV8WiEfhDIugmSDD8Crtj/zW7MHbzFSTZF8O0HnpO/yTtvu+B17W4wT
	bQEtj3eEH9qaztgcA01p2vVIjHzDWBr/FRcCNbGAzkKovjU/YuTyBTLEaflDCFXQXfmKgfy3JPN
	6SfH
X-Received: by 2002:a17:90b:52c4:b0:3a4:8c41:fab6 with SMTP id 98e67ed59e1d1-3adead50adamr7301154a91.46.1793087503455;
        Tue, 27 Oct 2026 00:51:43 -0700 (PDT)
Received: from debian.lan ([121.101.131.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40614d7dsm2542311a91.3.2026.10.27.00.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:51:43 -0700 (PDT)
From: Amir Hanip <killdeath104@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Amir Hanip <killdeath104@gmail.com>
Subject: [PATCH v1 0/2] arm64: dts: qcom: Add Xiaomi Poco M3 (citrus)
Date: Tue, 27 Oct 2026 14:51:14 +0700
Message-ID: <20261027075116.41673-1-killdeath104@gmail.com>
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

Currently working:
- UFS and microSD
- USB host (OTG), limited to high-speed (SuperSpeed is untested)
- WiFi
- Bluetooth
- Remoteprocs (ADSP, CDSP and modem)

The memory map for the ADSP, CDSP, IPA and GPU regions differs from
the SM6115 defaults and follows the layout of the stock firmware.

Not included yet: the display panel, touchscreen and the GPU display
pipeline, which depend on drivers that are not upstream. Until then
the display is only available through simple-framebuffer. Audio is
not included either.

Firmware and userspace: WiFi, Bluetooth and the remoteprocs need
device-specific firmware which is not part of this series. WiFi
additionally needs qrtr, tqftpserv and rmtfs running in userspace,
and the Bluetooth controller needs its BD address set from userspace.

Tested on a Poco M3 booted from microSD with a v7.2-based kernel.
The series is based on qcom/for-next and passes W=1 and
CHECK_DTBS=y for qcom/sm6115-xiaomi-citrus.dtb.

Amir Hanip (2):
  dt-bindings: arm: qcom: Document Xiaomi Poco M3
  arm64: dts: qcom: Add Xiaomi Poco M3

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm6115-xiaomi-citrus.dts    | 516 ++++++++++++++++++
 3 files changed, 518 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm6115-xiaomi-citrus.dts


base-commit: f5672a3dff0291d6a45eb0c258b9d2baeb4dc577
-- 
2.47.3

