Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CBF435526
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 23:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786403105; cv=none; b=vEeDCJLtNQJn0HF4Bx+MdqXzJa2fNL55nvSFAsXISKfv3ZdOrBhsm9OWPjuzPbyx9wmFISDhhJnl00+9NbOmDx+n2W484CQGRUkF4TK6xvZqgyso6GuvFNbrfm5714Rsy56n+65EgjmA8q7L6A0V/sa5sa76Ea/+98DdqC9NRnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786403105; c=relaxed/simple;
	bh=ElXVboDVMx+RJeS8aZQkdIhlBQth0O9J4VsPqpHF6t0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bgmMj9Fjfi03zmh1hVMytQRsV4SsaXXwMpnKjplr+MPkKN3xJ2T9qhm0dTDNtEoXU0/lUnINfnjGWBE2yOwBnpu6UP1v4lNVW4mTDmVXQlsuzRmF7O7ZHQRc3uUfsmjQF42avHlMyZ1+T6r26COKhx6CP1IWl79865xNisJEOVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G8dooRDm; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G8dooRDm"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7ea9c6ea7deso181862a34.3
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 16:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786403102; x=1787007902; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nkXfL18wjL8DTexX95EbzIZJDQIzq4nnjKVqXhVM+tw=;
        b=G8dooRDmERN1kSZJUtzrL3lLY7L5Vg3Gd+AEwACpPy0R3PJin2ZH7UwH6mpyCQK/un
         Hu+AetxfGUgrRq2sZrw+P5elAKUv3DWfe58n3/njulncas+sWXLm8bqHGy5I6Bu56WXz
         Eqf9mBvNzxt4+hQdpvJx4uRm3ZrgUBTB/bygJHKgrsC467D6XScjnm1mIiyWZm+86jEm
         ztHwbVTcuNX6rujwAdswX9UtqWZAl+f56BqVM9ouUuvsbcDjSSnVfHi4OkM0NC+VHM4i
         lhPu5U4HCnSz3tSS4/AGFa7XVIDoN4thTTwtPDgKbLUA4ENeSRh10EVoH85LGpiVKcl2
         tn9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786403102; x=1787007902;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nkXfL18wjL8DTexX95EbzIZJDQIzq4nnjKVqXhVM+tw=;
        b=aUKi1GLIeIWE0me0ymz+roPWoKIy4KBKGCN/aw+Oz3urgwYpVk8EHRcqgp8utdJz9D
         QxhRHl0nYOzafQSNrOlpyZxtMQs8Fe4TZqu8k4JAfh0JOK9osOKBHfAksMY1nW4BVTbe
         eUPAxrvwRfELSDDOcevPS+o+i8Js4XdiOevdAGHcRF9mibGsmcPF8952aY34ja8kkLw7
         ZiTYdWwNmpIbbLhjaStT5I+Cu/h9oEM9eGm3zY5KpWXCFOCzTZEitEEYUWHl99uKankl
         MR/UugNhsq3Rs77QzhKt5mHf7gCCgtdkWkPt0a6U0Kl4pHKSSTdryVBjPDocVl7/8MXx
         mz+A==
X-Forwarded-Encrypted: i=1; AHgh+RoiWH3f4VeSVOjTXx0H5BOCNksbs1xApxzZQGgEXqLW/zEyIzAhSvHQ6aSpJFDx8xZpyLUFhF9diaaW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Kan/ke1lvLflQQSxf/GVhz8eqeZiv7TuHxbAOD4leSNLGqrp
	NbYcFxRoZPvM94q1la9dCPzmANPEUoG2MMQzM2G0/TC+5o5CXZkS9KNU
X-Gm-Gg: AR+sD119Npw79fxWBwzi++5xJYuxKiyXAYjzhG0ENe0gWmMRc9SoGQbr1czSFsz9osb
	90nAIIAvX+nd2OpFsssARSQFQqVnjzvZyOOkVXg8JESiP73kG/a10Vr+Z5swosJGBwV1boZEZlq
	5Lj7Bk+7oUREKqugYW0LI74s8Ow6oTdgMmTURO82tkYOejV2bs5j7crYyH9oFJASB9QlxAATBBn
	MMyjFKxrIiWqySChCyTJMenhEW1pHUC/BMp4ECZpNwCp8BvjGWdOulT0a659xu02RbJwN4BUksW
	gGeReju2n1lwzb/pzoPDOZunHP+oTvKEzfM4GXCOSCVDuXtb0KXdtY0kjW+rjkK+riFpUQ7t/AF
	wu9V+r7g950U8jsvMi3uHVocvrOF7KxwFhfWKPgiRKXhu2XFBRkB0chJ5wVmQmtXpSBya1ZZ8Ea
	5VTodlaAOtCXr/AR/EHxPNQLMpO7nibhMq8jaFn4yJ42fcuMZXkt/LAIi99/5agNnp+JivaPDyS
	3WAgk3lI6BsOXpVS3NVw37LfSMZ7ZAuMDqME6LJu2/7mcbZadXImXwYMIoKCdQobTFXff+riq44
	WoxNso27NBtckh1jF1Jc1RZngOtjrAVFZ36OEgmlZFhaEOlrJrMCskjSLwtD31mNEbN4nEMVCcP
	JmWXjhtKUVsFYif8QMC2R/F45bvs/
X-Received: by 2002:a05:6830:3913:b0:7e6:d0ad:5254 with SMTP id 46e09a7af769-7f1e5d8da15mr33431338a34.8.1786403102060;
        Mon, 10 Aug 2026 16:05:02 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f35b5a7616sm8921584a34.8.2026.08.10.16.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 16:05:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH 0/3] mtd: rawnand: sunxi: support the Allwinner randomized
 OOB format
Date: Mon, 10 Aug 2026 17:04:48 -0600
Message-Id: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-0-463853a14ad9@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQrCMBCF4auUWTuQaUXUq4iLdDLqiE4kSUOl9
 O5GXT2+zf8WyJJUMhy7BZJUzRqtgTYd8M3bVVBDM/Su37k9OczT+NTSxmZF8xawioWYMMYRH/4
 dp4KVUAaibSDHfGBosVeSi86/o9P571a6C5dvHdb1A2a1yZmKAAAA
X-Change-ID: 20260810-submit-sunxi-nand-vendor-oob-layout-v1-e3114d10cc9c
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The sunxi NAND controller randomizes normal pages, including their OOB
data. The mainline driver compensates the bad block marker so that it
remains plain on flash. On H6 and H616 it also fills the OOB space left
after ECC with protected user data. These choices produce a different
physical OOB format from the one used by Allwinner NAND firmware.

Add allwinner,randomized-oob to select the Allwinner randomized OOB
format. The property enables page randomization unconditionally, keeps
the bad block marker in the randomizer data stream, and selects the
controller-specific protected user-data placement. H6 and H616 use four
protected bytes per 1 KiB ECC step, capped at 16 bytes, with the complete
protected region placed before the first ECC step. Older controllers
retain their existing fixed user-data placement.

When the property is absent, retain the existing mainline marker handling
and H6/H616 maximized OOB layout.

The series first documents the opt-in format, then implements randomized
marker handling for all supported controllers and finally selects the
packed H6/H616 protected user-data layout.

Tested on an H616 board with a Toshiba TC58NVG1S3H NAND using matching
Linux and U-Boot implementations. Linux initialized the NAND, SPL and
U-Boot cold-booted from it, U-Boot loaded the FIT from UBI, and Linux
attached the same UBI with 2004 good PEBs, two bad PEBs and no corrupted
PEBs. A target-timed 64 MiB raw-MTD read completed without ECC, timeout
or I/O errors.

Validation completed with strict checkpatch, dt_binding_check and an
arm64 W=1 object build.

Assisted-by: OpenAI Codex (gpt-5.6-sol, max)
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
James Hilliard (3):
      dt-bindings: mtd: sunxi: Add randomized OOB flag
      mtd: rawnand: sunxi: support randomized OOB formats
      mtd: rawnand: sunxi: select the packed H6/H616 OOB layout

 .../bindings/mtd/allwinner,sun4i-a10-nand.yaml     |  9 +++++
 drivers/mtd/nand/raw/sunxi_nand.c                  | 46 ++++++++++++++++++----
 2 files changed, 47 insertions(+), 8 deletions(-)
---
base-commit: 15a3cbce32994141252bb4ecfe3ff3a5d22d0b4f
change-id: 20260810-submit-sunxi-nand-vendor-oob-layout-v1-e3114d10cc9c

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

