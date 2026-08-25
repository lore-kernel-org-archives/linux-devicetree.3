Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5B4470117
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 13:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787666082; cv=none; b=BwpDr+sHAtJEYdhX4wK4Co/674jfNnwxrZm/FjYtuNzF02jODpM7CQYVET3kZVFkBGlRwx7y0TFEy1mSO9YjcjmMM4Wj9YqgaRS8V4pHngoF55HYgevockQWgLuQVHYmt777Adnswx8Bejdj4y/1fKJdYC4QfCCZWY30CPyJMXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787666082; c=relaxed/simple;
	bh=HeWcAvcHoVCngDKxWDwcs8lqQkIX1yBSlztDKTCfC4A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ThhGP7yF2iq2YkdZ5liVTUWRL71kAEiwlRh/3HM1axdRm5BIEg81+wVAkhjGlzj1+KWolB5e1Lkq9a8uXBga3a7y7a+uDf+FPkxwpzG/KWEZu69bNHF694F4bTwBASE4pH4c10spzEZehGpr4j7ZpfyyeF5hGkpcnuTq2tKAhbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=I8dlSs5e; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="I8dlSs5e"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c15e592da74so665452966b.1
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 06:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1787666079; x=1788270879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jv3tIOWEnK/99KAUgJnbIDJX1kKr30Yc7XPU554aBtU=;
        b=I8dlSs5eoufT+UgeE5PprGNT4tsU3l1O1jIMMaIQCPQxSJ/P7AAIc0/aC7juf9sQYn
         o6V1rUXY6uFrwuONYBpIIZ37Y018hIJrRLAeEQv9GSftd9Tf3xKQYtEObQllGvi077zy
         bWu5r5JHg3Adczoji67vXNMp4vzmheQcdEk0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787666079; x=1788270879;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jv3tIOWEnK/99KAUgJnbIDJX1kKr30Yc7XPU554aBtU=;
        b=nW1Gw0vWtDSxpF3PKIk4ttYjml3M6HlVktW+iaQi3cFOMDWu0+SeYNINS+6obIWSYp
         BLgbHjbZkH4Upc+Z+bPJZVOg996j4VQaj6+Msb+nIkVV1WmW3/Z/XP0MzdmCtDz/dGYP
         C5boRmbqf+fGJ/GnBHFNXRzRuxqqM8y0tUZbzi7i/s6QRjGGm9lumjs9h4opVzywXbuT
         y4DCvPM7xRilLGOD9dToMCYJI1juzOfd5Ai9PXTbwldyhu8HpuxMpS9n73XJZTLZxbp8
         Trrt6CFRTxnoIVn9ITwZuoSsweyCVxclol+x80noZRhD59Ft7obhuH8cgHgjNTrtspAA
         30xg==
X-Gm-Message-State: AFuF++mQU1i2TFzGzhtUQdg5R9hyOwOc68QeDC6Dpv/Y/xVrgW69pu+N
	Um6E3UnNpsl8M8TJsQa2PPQoB/65gSCwuKFuOWrypoChOrbyZ5W+bAQ4NlMbmcmQwSDJNf6av8d
	Iv4f1
X-Gm-Gg: AR+sD13zQXuxyzQEBCUZzd2uOjmeJxT4llUkYc66McXvLN4xPFTqLiebemyfU7QY8GV
	9xqbIV3o7XmWH1JauO0oKsvuNnqBE0325R0D0uLj1sq1PIeIrLnn4vnaMgoGova5VbMgo8KutIG
	PabPUq20KzQanVThyelzJ+fHD16S5sWDP8iAPc9+pP2AF0I/GcXkMH/wWnZQBcMqDaBBYjDaINC
	5OhLcPSyg/s8os5t27O3BTKr+oiiaUu/Dn/f8SHTeTginBzu2HtHVaBN5e6FTBVxRzg+8GC548D
	CF15n/ALGJ3smqZC4U5kk1qp7LKeyIODmu457DfTForwRhi0aMrtt5QTqMgaORFsWeeToxaHFKr
	v12Y3VE8KHbsFZVzfu8ooUasArTj39Y3GXH6szASn5Q1pdP1i2INRlvysgG7jP0sWzHnjvhjCAC
	EmDTwXyqRqtWMUGL8XMJb1/aTNUBD7Ca3Tp+xS21YmfYmBP3J8WANy04T75jil76/vt0rrWk7jz
	3gARQ==
X-Received: by 2002:a17:907:a089:b0:c21:450d:cd88 with SMTP id a640c23a62f3a-c24924b8000mr2955242766b.6.1787666079439;
        Tue, 25 Aug 2026 06:54:39 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24968a336fsm1819330866b.60.2026.08.25.06.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 06:54:38 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v1 0/1] ARM: dts: draeger: Add devicetrees for Draeger's M48 board.
Date: Tue, 25 Aug 2026 16:54:24 +0300
Message-ID: <20260825135426.3967333-1-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adding the device trees for “Dräger M48 on NXP i.MX6 (Q) and Intel/Altera
SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the same
carrier and they are cross-monitoring each other.

Petko Manolov (1):
  ARM: dts: draeger: Add devicetree files for M48 Intel/Altera SoCFPGA
    Cyclone

 arch/arm/boot/dts/intel/socfpga/Makefile      |   1 +
 .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 132 ++++++++++++++++++
 2 files changed, 133 insertions(+)
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts

-- 
2.47.3

