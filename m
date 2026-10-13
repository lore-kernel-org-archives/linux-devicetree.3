Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D075349AA
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 18:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791917296; cv=none; b=l1tpH2ulrd9VWP7Afs4x1bavbbm4/uMCLHQvvtMXWUT2r3koti7sXMDPWkEt+Yn6vtjNyCNQMpjEU3hw1Qo6mjJ4x6FPfOZQ2YGj0XQDlMSO1d/wHzbV4EhzEUWDRFmrPEGn3uczyY2J2EaxCEtrT5Kxyc4q8QIO7YA1VSLyu58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791917296; c=relaxed/simple;
	bh=J+0QPYCcRwTh4UYvHGaLsdQFGbhW1sqFMApyfCXwqb4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PlysRCA6oYV2JSz2RvGgYzTN6W2YnGQ8OEfgrIYG4VIYi0oOMYHWSg2w1u1gLPw9VLs4cZlzkpab/6/YDa2GZlEN4fLVXOsH+G7zBMWkl0zszbAIMmRcKDw6GSs3e0dHOUR5M5dO/XccpAtsmhKa6L3EK9rzjcM/fMfpIpodzdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KhG8nsVp; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KhG8nsVp"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so26544295e9.1
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791917293; x=1792522093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vIqYrMuloEwPib2kZeX80Inb7mZQzxZxPFnf5xtNveM=;
        b=KhG8nsVpmWfUbigfLYbVm3vtmrMEEDbcV/DmCzu76zREtAG/lTDgPO1m6u/f8w39Zb
         UmNz5QGMon+aiCJ999d/jLSlARBnvqdspjCf9wvkNXKU4lHpfYmtd3Zhs3tT25L9F9F2
         O1Ul51QjdDk3yoEMUeUR6MZKWm3eTzvnSRt2VEfbhOb+WeBJks0LSJQUEGBsqWZEUAuF
         JJxlVdeByXEi/wimwyNmboD5bq+fz92x4FoD9iR0UWlS/qqzEdaiVbk/s23RvKbZBnsC
         iDj0hbK8Tq4jVxrXAl+3n5vI5zNoILvQrUgNUrxoApXoRBz+ou13ImT1vgTKzHGuRxIo
         sF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791917293; x=1792522093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vIqYrMuloEwPib2kZeX80Inb7mZQzxZxPFnf5xtNveM=;
        b=VssvDAg4wVAR7mpGFOYL0SfIoAhXtUBhHoY5YV5/I2BDivpnX10ZwhMPZriATuJBC9
         s6QQGPa2sqjwa681VLAf93/5KHBmtT9Tufhb6F/3LYgTTNjlCIRNe0boqbp/Rt8YoChI
         p4Wk1u3XEVB0J25fub1ggBJhF+p2E6bWTbaa7BmD8CiYeA5cAMrcPyGW5GPayFa0QRhR
         LCUZApgEBFBTIyJioRb9hGOqKI7ev5f/4kMSummf+LQuaVI+x3cZlK3tfMwx5KSllKOI
         ZoBb6idAqGJOfEYrxU9/jyrv5YsDwf+kUhGTj1q2urY8BSg5iFQcufxJkDQ4OFEM2jqK
         SyZg==
X-Forwarded-Encrypted: i=1; AKwUvBwJvBuLU7LoXB6XbFIXEFhMdRs51EuF+sKxKo09U0dtDj9xJpGO0Q29rV6Hjgs0ss0SJDQUZcTqMOBh@vger.kernel.org
X-Gm-Message-State: AFq9FYIClJfvsTeFai2tRLqExhinr3eJ/xt4uqZJaempqwWilr7vut3+
	YRwjvGMmjH9ePHf9HCa2xZHcJWDuyA/0mfK4nAFxx7vCD38yR5+OIiVU
X-Gm-Gg: AYBFou1jWKZ6wjeb1GQNLNTX8LL/51K8mitCoREOj10FDtSWJuIUtIX5sLw3CkmAvxV
	6mDiMxeAD5qoie0luf1pN/vrpM+ZRRidrU1Dy2+WLNa7vphArc/lHXV32iGKxt3tfH26th/1Z6w
	If9tcDwSObYm+tsKrwTgf0n4RGQgRC6tDTRD7QP3rH/YELqqb1+q6jrGY7aa938fhnEt60e9vgV
	/ssPkqOwcyi7MGcxdO2An/2Yutd+JKLQO3snB12voVFnYa6Tc0V/HsoToSf18yPGikIuy+PMx2i
	uV+JkEOU0lHXbyz7TkTjv1fsQoPZReS+VAfKBOKQS6i+RjbfdvKKtvkYhfCV2JOfM9QAsfZGKRe
	FoPTy0zMYVYUQihArui/Amf/fPXyzy+kF3RB1bghu0KGu1K0AXHlq7yiHDof7HhLF7c5lfcGR99
	YU/FrAToxx+F/6S53dkUpUZSAjAap9+8X5VRJYRUB8XUdxtMjZlk7DGifODSG2tFItXHdEKyAv6
	39TLiTU5kzoYW+74Nc=
X-Received: by 2002:a05:600c:1e0f:b0:4a0:1f51:ba2d with SMTP id 5b1f17b1804b1-4a18e4adcbamr256259815e9.22.1791917292758;
        Tue, 13 Oct 2026 11:48:12 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2343asm690557595e9.9.2026.10.13.11.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:48:12 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2 RESEND] ASoC: codecs: Add support for Fortemedia FM34NE DSP
Date: Tue, 13 Oct 2026 21:47:51 +0300
Message-ID: <20261013184755.530392-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Fortemedia FM34NE is digital sound processing chip used for
active noise suppression mainly on ASUS Transformers.

Resending since previous attempt seems to be malformed.

Svyatoslav Ryhel (2):
  ASoC: dt-bindings: Document FM34NE DSP
  ASoC: codecs: Add support for Fortemedia FM34NE DSP

 .../bindings/sound/asus,tf201-dsp.yaml        |   80 ++
 sound/soc/codecs/Kconfig                      |   12 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/fm34ne-dsp.c                 |  388 +++++++
 sound/soc/codecs/fm34ne-dsp.h                 | 1030 +++++++++++++++++
 5 files changed, 1512 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/asus,tf201-dsp.yaml
 create mode 100644 sound/soc/codecs/fm34ne-dsp.c
 create mode 100644 sound/soc/codecs/fm34ne-dsp.h

-- 
2.53.0

