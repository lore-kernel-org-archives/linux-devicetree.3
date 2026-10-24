Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792817296;
	b=j8HZIax/0uwS/ZCDoEF0WwkiEG/MyIxTEu5cw2ddYZdlPdZYeHvhw4DsGwuGTBZnBBnB
	 fd7xjKgu+z6RbLdBXmP25g9BzXoo9RGqqC2gQgulB6T/5ezoLeZGvHL01Mr+bbPGiUhLZ
	 NxUBMlsIpWAP5A5pP8oWbIjMyZZCvfJcq5QP4Vq8gYFCRxrqsyRnfFQpONnyxZoL0KRvJ
	 MTFfosbe/zM39qfXKTq9H6mgWfxiINRyrcyw+l0ov8UDPxBdKHd2LblJzIzyI0ofalpAR
	 9lyOfhGEytEqTRBzimZ03/n99kh4ZdwA1qhYRzvnXqINZdX4L8d+VN31apy/7TdVCng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792817296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hLEsygWM6+4H/+RqRuEHadaGd+pRQ2KkZeoK/YR9z1Q=;
	b=QGzIea+8v0SG2k6/Ix+ZDBpez60YvK82S9x8BzC892NOldjAjOunRXlQLmAZOJW7mmxl
	 miOfsNp8BU3jgX0G/VtBryyntglv2+AJOwBy0XhzjBiomFoXohCswhhuj780pt0FUx8vz
	 vgNEH2u04SuZTTVjHdzF1yNWwMxepbRpNpuA/evcLemgNuGIH5ZD0pG3THCqP1Pn45TsB
	 YNx/CPu3CDdQMQapaSwpmBq9jRu4X+tFDk3A76zMHPTK0HJB2oEBSe5ZBxuP8z5xDjtFI
	 7cxJJhf8i9M4UrpKLzuLs7ttULSwCXBTTDVtJbM/uRfcJ+lJd95vGNirE1qypg8DZGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bn5HdHFo;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7AB606A31A
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 04:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE7AB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bn5HdHFo
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-847ac7ccd85so941989a34.3
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 21:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792817295; x=1793422095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hLEsygWM6+4H/+RqRuEHadaGd+pRQ2KkZeoK/YR9z1Q=;
        b=bn5HdHFoht3tPfTohGv771TsC0f2WPm59gfEoeVqoK9EN+61yvh9pXgdDwhlmUAYKy
         ku3Hepd2tRo1Fq5Q7oiTAzmTEMfsid3EOBABukgTAr16DlRlj/ui1VTKVFQMfc9IFMjP
         xrCT0Ek9YwWW9xXLlfjm6hJfrFtsybjhi57keSrGMNV6Ejin6ivL9ffnip0ajxivBs0C
         pccD41tB66oSuQo/dJlEqJ6BiAQkmoqdQ+b9FJGjUCBXEnRSvBQqN9eIWH6NcE6tTbfR
         znT26lvkKnAFYRh4NsKe0xjJ2iWkrzltczFAmtcLjzsE9cP/VoeGtVRbW9lvfjJQcWTz
         hMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792817295; x=1793422095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hLEsygWM6+4H/+RqRuEHadaGd+pRQ2KkZeoK/YR9z1Q=;
        b=dYOPozszHLqgYHX5FuK6H2R9qg2Jr8Q3lq6mvkIC5IuyYopxGahzpbk/RaXWl6JePs
         2jYX8unnGPrW7Th6wlC/dbKSVC6evk5kP7C1FzQy3xEdURFHBNURBHmdFPXk7cZDZUid
         yzuh7StmcEvRkrLWHyavCKgkRojuA03vglfGz9+UuiENUfYnT8uOKrTlAsH+zNyaw3IY
         CIpnIORQVrRoSZqUktzE5KLgbgWX3ljPOvvg7w/Nrg3doGf59YgIqFUC904GKogUH1my
         9Fz8dQSvogCp6bK5XgroFC8Cao/aoBKEw4SFCNOOSH4yYTLHj8tbtwXPTNIRpM1yA+z0
         7Cbg==
X-Forwarded-Encrypted: i=1; AKwUvBxXy41R/xb3zclRKJZ1eEYbXW2gDxj+sEhE8o3lh2P1Ql+CzR5c+uK7lktA6qemXnFlKirdWW3VHcmA@vger.kernel.org
X-Gm-Message-State: AFq9FYKr361WU6HkI5N+dbv5IJ8YTbCReVpqnLpYkWW3l3fFvAXaiUWk
	cgJVO8igS83KuT2+RCe8cPUnWNPToKxeYfr9eL4OrzW2LyRWHVGJvPyEqT/UiGie3Pw=
X-Gm-Gg: AYBFou00f2ujmiFT4orL6cT+894Efrcnm3Y71BHnjEGxcRmXakzMB6Pi5vpuGRcQQjF
	TDTcAVR76P5Nm+50QTPbvUEEaxsOWWIU7u+XMa8lvofojCX//bNE4hXJWFy1+pAd5IEouHVtHSL
	slnfD0rjQ2VqAXQkPDpBC08k0oVFR+iDphBQOanqbzqp7HxLio6m2b164rHrPVD5IA049Orp9Dw
	aHS2bpMp0Izj/1DBG6k2bJZxDrjqjSP8H7Z7/FRt6H2R1invSgtBtFdKKlZRJhD31j0g7BpXeYm
	G5NdjyqlsK1zdmW1I2pq1pL3xtgwKsk1DABiQr99NjMieQ0vvTiEjpDKeRaJi9YSqXVjspazRON
	XeEclT1ryqX5JaRnDyai0mvVhiJqIyPxOa7CP1nEvV0PaknxuLHp/bfWemisG0y3pjsCDA8G695
	12R68NqsBkrFXN7nQd9q8Mdu9rl7vzMTfw9RaCPG7vsIAzhX42IE/kKZhFlLTEqp84iGqfV4XrY
	+vCx0oiT1fIgdaUYxjqp/DmlTt0Vo7/JlqNK1QYso/ZNTjn2IqrYOUK3gBdSUrGoZozdlDOzMbZ
	2bih
X-Received: by 2002:a05:6830:4489:b0:7dc:dbe4:3f21 with SMTP id 46e09a7af769-850fb0769cfmr1141196a34.1.1792817294879;
        Fri, 23 Oct 2026 21:48:14 -0700 (PDT)
Received: from jeffmr (63-152-17-145.cdrr.qwest.net. [63.152.17.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb0749dcsm1331577a34.11.2026.10.23.21.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 21:48:14 -0700 (PDT)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: qcom: Add HP OmniBook X 16-cp1
Date: Fri, 23 Oct 2026 23:46:48 -0500
Message-ID: <20261024044650.9936-1-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
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

This adds a device tree for the HP OmniBook X 16-cp1 (board 8F46), a 16"
laptop with the 12-core Snapdragon X2 Elite (Mahua).

Tested with Ubuntu's 7.3-based linux-qcom-x1e kernel. Everything listed
in patch 2 works there, including suspend (s2idle).

Notes:
- DisplayPort at HBR2 needs "phy: qualcomm: qmp-combo: update DP PHY PLL
  programming on Glymur" v5 [1]. Without it the stream runs at half rate
  and the monitor shows no picture. With it, about 1 in 4 plug-ins still
  gives no picture; replugging fixes it.
- The GPU is disabled. It works with "drm/msm: Mahua GPU support" [2]
  applied; I'll send a follow-up to enable it once that lands.
- Audio needs a topology and UCM config for the "HP-OmniBook-X16" model,
  which are not upstream yet. The headphone jack (SDCA) is not described.
- I hit one hard lockup while plugging USB-C devices during testing and
  could not reproduce it in later plug/unplug cycles.

Earlier bring-up report: [3]

[1] https://lore.kernel.org/all/20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com/
[3] https://lore.kernel.org/all/CAAnD8Rb4ZZrHFWMJayabioB_8bOHh1mqZ5LCXZz0jTNGMA7UZQ@mail.gmail.com/

Jeff Roach (2):
  dt-bindings: arm: qcom: Add HP OmniBook X 16-cp1
  arm64: dts: qcom: Add HP OmniBook X 16-cp1

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/mahua-hp-omnibook-x16.dts   | 840 ++++++++++++++++++
 3 files changed, 842 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/mahua-hp-omnibook-x16.dts


base-commit: f5672a3dff0291d6a45eb0c258b9d2baeb4dc577
-- 
2.55.0

