Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CF43630AC
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 10:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789381564; cv=none; b=SHD2qUeDzKDU3efrGsnY/5Z3UunsCa+gLeRbsenNbRg6Rtr6ypAwAp2sIT1Y42cp1WwTuh5/wUtuchiE2cPHNXQAIepsZCCACV2arBRR7n6frQ1FuJPMF+brA71RIOHtq8i0JLK46HNFmpv9Z1SotEUjqPEPxVwoFqC0S9+G9EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789381564; c=relaxed/simple;
	bh=TcCIy/7CyJJpZHvY5IovrQcJtgJgnbqRgCz4YVaiWDU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RcIKX+DrM+BcBNYWSwFrsIym4Jo4Da3BFaAy/HthLn/SLtcK78O0tlcfykh2q7vV1IQaz6P1TKAKFJcP0qqjWNHf335I2FAbPZSwVDQ2KyMO1YyM/CLEGf+2OfmN6WEHXJupD1h+0ych5fzCThF8dhM8cYAPMzwNN1iKFRucxSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=LDbFzg8w; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="LDbFzg8w"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2940d16190so432285866b.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 03:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789381559; x=1789986359; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Gix3Yx1tgqTqgkG4rwDJcFZVO72gXLG1pAxTefP2DJk=;
        b=LDbFzg8w7B5kl3HcET9HwEshm6KTXwBEvTEumtASEs/BREq9MyK5obn+IwKGNhy7Aq
         R84P5ZCgVQ4C3dN43rbMfaZK3yHHRfJTShJJ/ZvL3A/s7Zs9AUFd7FiDJBTL3/bX/2A7
         FlMtZ8LgIgsb137MSof3H85tsoig1cZor1GQJyL5gCZpxQ0RnZRdd8ijRMnGXqc7ldVj
         5sNdzfj4xD7lPTSmHQJPrCSRpftTwh7+yPZU+U0lzAb1x+htbxmSlvXbBypKg3wr8g26
         Ajn8gO5E732zIjR9ety9U6PHDhoRov2TQDGskx24lPB0jYKUVhpkiYWGaWPFDRCJJdDS
         1/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789381559; x=1789986359;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Gix3Yx1tgqTqgkG4rwDJcFZVO72gXLG1pAxTefP2DJk=;
        b=rG8E3oVjeFgLMny1NOYv6nISWxF2x/gkh1u8yPZRalsjtSAKxcJUJdfnQKyxVlp7T/
         cM3VCe4nm1cCsoYTNPfaU5hULfCLSErDuwB6oeV731aiZ7Swkna10+hEcDbli5S0KTwQ
         RBGpGGOAmLlqptyMa7Gq6s/XLwyl4hFNH2rTgA/cRoNsNNsOXhFRiH36TYq+f5Jwvvdr
         XfxTIliP+Mg20lib9m57OxWp1K0btb2ngCHM2f+vfyqxeMMn/HX2PCEUmE7zog+mIDIO
         v/5JRZHRrY8iCSuHFBFp98zgMLSKbvbAokrRaOyYTePhBOddQkkZ2UF81Xz5I3DJ0Pen
         8OqQ==
X-Forwarded-Encrypted: i=1; AKwUvBygmrQAwMS1TDtKCbiS0bbgxoMKSpadtlqHfSZQGrOf8dI+LaQByOO1Rqbl42vO7pbZRwsCtmToWezg@vger.kernel.org
X-Gm-Message-State: AFuF++k9g/EFSniD+/rQxbLkSgkN0haza6I8uextSDbe2kyYx2ivX5h9
	0Hksgse35kr7VeAYJ/9PxNQR7crJuVTJnpf6AKSGVgtgfXZ/bJQ3sU6DcXjkknaRpTo=
X-Gm-Gg: AYBFou1EJw1uIJ2iuoFUxneDtbJge0f6CqsK8gbra+roi1r6PVsJWZu9O7AWQLNdQTm
	z66NBl6IATg8z/x5Ne/sTnh7qECv0dE0z1IoFVqwp2wiEHw2pZpQIYYMOX36D+ITtPfbaTSx4Wt
	eyLWaieihVw+bpD28mbsUvKI4ew91J45y6EwgyjhsV4enRE9ZB4TzFAM+FPvxeKI5NQ3m3kNiNp
	zxI6GUrH6+MBcSv5lFTyIt8ayCbVCptSZXPQecaEPYMRzDKKa49Y5PQUUECKYSpVyrVZc6ASvu1
	SaQiv9cCoYDXAFYGqkDpWq69b5Am6UmQCstWsEs5RnWFlDUmLnSPkOBjNHpLjgfNMThGemfaT4+
	VM5Ij3HWVgIY3NK8bldgCYNrOz9QRs+lkRP1Bz1zmbCI8u7L6WMeiNc2Xl951v0t6XAb4zZpAKn
	8mAOFQSk9woMszU9AsfKLw14jpMvL7c/sZb/aQXiEyDH7acYGM2LJV7T0VndwfYyuvLeS1xozSK
	k6c3yZfa8UEx/6wU1LdNOg/uI2NfvL1BW9xRrA3wHkn4b32h4n559w94+E=
X-Received: by 2002:a17:907:1c8b:b0:c29:44b0:1428 with SMTP id a640c23a62f3a-c29b87811c1mr158140466b.42.1789381559047;
        Mon, 14 Sep 2026 03:25:59 -0700 (PDT)
Received: from [172.16.220.224] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660654f2sm399985666b.28.2026.09.14.03.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 03:25:58 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Subject: [PATCH v2 0/3] Dongwoon DW9800K update patchset
Date: Mon, 14 Sep 2026 12:25:55 +0200
Message-Id: <20260914-b4-dw9800k_cleanup-v2-0-6553273aaa33@fairphone.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALPLp2oC/yXMTQqDMBBA4avIrA1Mgq2NV5EiSRzttBIlqT8g3
 r2xLr/FeztECkwRqmyHQAtHHn2CyjNwL+N7Etwmg0J1Ry1R2EK0q34gfho3kPHzJNBqU5qbJFl
 oSOEUqOPtP62fl+Ns3+S+5wmO4wfkL/dAdgAAAA==
X-Change-ID: 20260910-b4-dw9800k_cleanup-0b9a7a51e149
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789381558; l=1390;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=TcCIy/7CyJJpZHvY5IovrQcJtgJgnbqRgCz4YVaiWDU=;
 b=4Ja/1fN4suSgrBSfC/l+OrnvrEX/m3ax4AUZq6cIgoK9fJGn7NYyeXGlkLAxelVawwUa+syJX
 YbOKZxAMVtrAVODzBnbF+amZimY0gg8J6p3C5qLMhmREtRtYPl5ypZG
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

This patchset edits the dw9800k driver and related files, to properly
match previously mismatched register writes, variables, and logic now
that we have the datasheet for the dongwoon dw98900k.

This is a breaking change, but is necessary to ensure proper bindings
and driver behavior. The previous naive approach did not ensure proper
functionality with different device tree properties.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
Changes in v2:
- Expanded commit messages to be more verbose with their changes.
- Link to v1: https://lore.kernel.org/all/20260910-b4-dw9800k_cleanup-v1-0-608255ea61ab@fairphone.com

---
Griffin Kroah-Hartman (3):
      dt-bindings: media: i2c: dw9800: Redocument DW9800K
      media: i2c: dw9719: Update DW9800K driver
      arm64: dts: qcom: qcm6490-fairphone-fp5: Fix DW9800K support

 .../bindings/media/i2c/dongwoon,dw9719.yaml        |  1 -
 .../bindings/media/i2c/dongwoon,dw9800k.yaml       | 91 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts |  5 +-
 drivers/media/i2c/dw9719.c                         | 71 ++++++++++++++---
 4 files changed, 156 insertions(+), 12 deletions(-)
---
base-commit: 6970ecbc1f96154fb68107b467e6294c43947447
change-id: 20260910-b4-dw9800k_cleanup-0b9a7a51e149

Best regards,
-- 
Griffin Kroah-Hartman <griffin.kroah@fairphone.com>

