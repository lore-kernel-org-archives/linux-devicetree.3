Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEAF525A9E
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 15:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904664; cv=none; b=oge2+QnfHqmvkjKnoJU2Sf6DUCWc7nXJSSKefpU0iRE4kAjRfcTo4ngXy5a3m8Fsu2n3hohkDCV1KHILAgabVoAOd+vSpCVUU2BD/JDzA0YB9CmXSIG2fO80a56gGMYYW3m3/0FHTkfmaPqeKbVXnbP3SNvM1KHvbe7Scy9aF1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904664; c=relaxed/simple;
	bh=J+AisZ3Sz6MrlsY1i2kbJokelTSfW+Ad0UKI2E/gXe4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=H2Mhxu9B88+hVhaDbBcoKviBr+Gkg796Tiw96aI0Pggtxd+ixq5e7cEv1aJAGdltdzROuEIFfoIzJisknAJmgaDyskX92JySQ0CFjtWuLCWLM76LnrSYhEtOEWogUPDT9m21bDMvjxb3UIAjWE7lF7dpIbBme6D0xS2P1knF5X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=TRrwaCYz; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="TRrwaCYz"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so2829486f8f.1
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 08:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1791904659; x=1792509459; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=En0suO18R4o3yz7vXZ+ZIS4o6qKTdbqbAzANkCBRAmo=;
        b=TRrwaCYzQyrNVfQ788VFlBF4gFPUiNybOeBrmxz/Fd7fMEOoI8Zq3WqVA/TZTfio5y
         R/YgQ8rNBKPOBVljgF826aMjWB1aAJhwnfVWr1dPqeJCoTZC4NMkcwba7z8Hqb4w/mef
         1jfxIAP37qUmgIrVixUz+IFb5P2Jn6YMmY40AOAE56HkaTY1ZL4ylH+z9xjVzjZmDvaz
         YN/Y5g8Y9wKvbnYYcec2Hr6l97j1M+ZydC9O3/y69qTxyorQBH5knUWthxdyYB72gZxp
         vLaDlJ07LExKtNXmFo30j8rvn9YuleGqmv8rQ/0aPLKBEBwJ/nbJ4CloKE1SkII/dl5s
         n0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904659; x=1792509459;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=En0suO18R4o3yz7vXZ+ZIS4o6qKTdbqbAzANkCBRAmo=;
        b=Dcdxi5Lk8OVRDwuk/VLnErNWpDog6DxrCdpO9ZeqsOgd1ywbU98okQXpRudXb85AoL
         MfRPfpzESwRyUuEK1nllsV2y1m+2Buh6tueWuj5E6CNYsf0S2ImIAVUxIeNXBXiFVoH5
         JG0xW7HgIV/fW+GrT/wqzFbmrTbo1wu1UypvD0ePl5tqumff0IuP2914ZpGQ4PEjMqlN
         XMUr/tHZQ/YyoRnECN/8+32JAxjT2qKMSsUOnR0WKzcBmPf/72YnLE+df4+sKivr83cs
         j+MIHrdxnaowH9rvBkOOuTPJPKxPBFznfiVr1BaXIgBVcol/Mhm3nTa6jZiRsiVLQ6ce
         04Ug==
X-Forwarded-Encrypted: i=1; AKwUvBxKSghQXx0TVf3l6EPDvXQ7+d/jGRgR6VN0aVoKtNTG3nn5+hb3ODQpKV/p2cAz3KetbVUMFdZutLTC@vger.kernel.org
X-Gm-Message-State: AFq9FYLD6rNywPCfx5VX2IFjeTOBIwdgPYpkqCvtJSI64wJVt1eZfccO
	LLLSi/slrQKiIkC2j1TS/LbCda51j+pxlOGHbYFXbdT+2e/wvv6+1a2gKJ1rdTwYu+Y=
X-Gm-Gg: AYBFou0IuhPtK4dbyrIvymsgLSiqrFLw+/ckJOfgeYSGxx1KSSs3jhDLdtnz8GgHn9E
	5Z2XSL13hBFMN3xiXZyUP0Skgv+a9lg7zSNGP4N4dWHptu/rb6qj3fju2flniMfJJPSYYmd/0cJ
	G+L8gppREPLITiwdXeIsaiJG/8pJ5c4GBY161iT5Ft3q0Jw5ywFq+jSCRBpdTEb90Ux4P87jeXa
	wAn3FA4pbIo920SkfKtb8YKhtBStkrsSDAGAXtQOhs+efwJ2yMA7cFfVcUY2F0ZfrxJGuthC6dP
	5mzH7J3XXq75u2gb3sNmp+0Jk74rslr9q9Z+jXBXFxcG25bcyfITVGdHZY4xK7IQXlAC5tlyBpP
	zJnPw8d+GS8HFPpxqtk3XRbBBt5IvegZszMC2iv+FbbTd99fQByG69dv7WiiI6fIarMWx5gONo7
	Rw7nrTVI3iy0F47wPTjgTkchhN4zQu10h1FON/MMtSKa+lxSe+nVhcVE06+XGPgl+9FijvLTAdM
	V2bdKI3rU31e+GiGFza0fB106/ZsRBzMw/4GDLLndwBjd94VQ==
X-Received: by 2002:a05:6000:2685:b0:48c:6724:b67d with SMTP id ffacd0b85a97d-48dbacddb35mr24003904f8f.38.1791904658905;
        Tue, 13 Oct 2026 08:17:38 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaabb8sm6529743f8f.15.2026.10.13.08.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:17:37 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 00/13] Update imx678 to act as a common Sony Starvis 2
 driver.
Date: Tue, 13 Oct 2026 16:16:59 +0100
Message-Id: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGtLzmoC/12MQQrCMBBFr1JmbSQJk1pdeQ9xkaSjnUWbMimBU
 nJ3g+DG1efBf++ATMKU4dYdIFQ4c1oa2FMHcfLLmxSPjcFq2+tBo5ppZK/y5qWdreqddyGiduG
 C0KSJ85Zk//aKafP4qe5fLUZpdTU0EJInxNddfF4Diewrn2Oa4Vlr/QCB4rpLogAAAA==
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

The IMX678 (8MPix) driver has already been accepted into the
kernel.

Whilst preparing a patchset for IMX662 (1080p), I observed such
commonality between the two that it seemed sensible to attempt
a common driver rather than submitting a separate IMX662 series
again.

On checking my box of sensors, I found I had an IMX675 (5MPix) as
well, so that has been incorporated. Subsequently I was able to
add IMX585 (8MPix) and IMX832 (1080p).

The Sony datasheets are rather lacking on the limits for HMAX.
They list HMAX (and VMAX) values for nice round framerates at
a number of the supported link frequencies.
These limits have been adopted for IMX662 and IMX832, but for
IMX675 and IMX585 they have been determined empirically by
observing values of HMAX that start to introduce image issues.

Now cleaned up over the RFC V1.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
Changes in v2:
- Switched from an RFC to a patch set.
- Add the dtbinding changes.
- Added IMX832 and IMX585. Tested and fully working on all 5 modules.
- Updated 2 lane handling so that the higher link frequencies achieve
  the maximum frame rates.
- Adds a patch that corrects the minimum exposure time.
- Allow userspace selection of all link frequencies specified via DT
  (makes testing all the link frequency options far easier).
- Link to v1: https://lore.kernel.org/r/20260805-media-starvis2-v1-0-91e8e4eae44f@raspberrypi.com

---
Dave Stevenson (13):
      media: imx678: Rework into generic Starvis 2 sensor driver.
      media: sony-starvis2: Reorder link frequencies to remove lookup
      media: sony-starvis2: Always program the sensor in window mode
      media: sony-starvis2: Parameterise the configuration to allow for other models
      media: sony-starvis2: Rework 2 lane support for higher link freqs
      media: sony-starvis2: Allow runtime control of link frequency
      media: sony-starvis2: Correct the minimum exposure
      media: dt-bindings: sony,imx678: Add other Starvis 2 family members
      media: sony-starvis2: Add support for IMX662
      media: sony-starvis2: Add support for IMX675
      media: sony-starvis2: Add support for IMX832
      media: sony-starvis2: Only update bits for window mode
      media: sony-starvis2: Add support for IMX585

 .../devicetree/bindings/media/i2c/sony,imx678.yaml |   38 +-
 MAINTAINERS                                        |   14 +-
 drivers/media/i2c/Kconfig                          |   20 +-
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/imx678.c                         | 1447 ------------
 drivers/media/i2c/sony-starvis2.c                  | 2314 ++++++++++++++++++++
 6 files changed, 2368 insertions(+), 1466 deletions(-)
---
base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
change-id: 20260804-media-starvis2-65a5bc405b74

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>

