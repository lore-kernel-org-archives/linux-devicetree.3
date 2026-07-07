Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389E0367B85
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 14:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435906; cv=none; b=AvjqYmyrb40injYvgf7sJLIkzky6/LEQu/7i/CMnxpELd84dCjVHPFHNyZpOEB/xYo2w/PeHKfdOUKi+2RwWAG06i+56SkseQMsdWsbUTk14XrGcMRRZB7EalquDMBM7yhEaAzXgMv+/wL+bbZzV2IW21xzWRVS/m3ha/IrD8sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435906; c=relaxed/simple;
	bh=3482tVTc1e/6rqsx/Zre4BaqdTWNwLcSRHDPFed4KEI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ta078yiglv5Mmgk+KIgxc60SHF/25F5eLy/W3AW3/wgSXAkwEkvxAqVO8lJa9Mp3NTsuDNN6aDrMT5FkyB/naykVaoU0arymwanKICRj3WI/DHsdw1p2DsAZVkcW/EePeWg7j+LL3JjUWNNj3r7XakSpc0/0YDpDARhI1rFnng4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WJyyq1mf; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WJyyq1mf"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493ce08a75bso18630215e9.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 07:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783435901; x=1784040701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6O0NrUAeAovRNiUS9LYfXTT4948XDdYJQrdiKXv1/xQ=;
        b=WJyyq1mfKMVGSkuH/Fg0/44SMNkWl2Ow01askLj+qvpIBqq2MCmjJHOQlec9mJMNOK
         j0YOmp/aVLWwVKX8LpXzHFmbojNq+W/hb0PGCoAH0A8PlQRiFFTlQgtolE+qKvP3CCni
         FdQB60ulAV3mFX/1NzeLG8Sq/1r/0TaENjXBaFOyFXoQa3Xc0OFceHhWsXY08V3C+yfa
         s3ElZ+XyrKL38K40yu4CfQvlpyXiOTUNzQ8cx6VBVbvLttet7eo8vHhg7shBLXLMASGk
         K7S164D3w8l2FMT5EVys7S7idri52xFkaUzqJO2SzFD9YUypzkG6ucusk7VBW+lfloDJ
         +Seg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435901; x=1784040701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6O0NrUAeAovRNiUS9LYfXTT4948XDdYJQrdiKXv1/xQ=;
        b=oZ6q/Bhs2Wo7uz9UbslO/I6pFOr3svAEDizTfCzjT0lqPITx2x/Q+BjlQOjfTKq6WO
         AJhq64FQICyxm0e3NUVaPzu5OhwUKsftFHI14M1GEZFRs+rXlJCbvzFZharl1F5Fnhcv
         kWEf+2nqufMD5Nf9tc7cR/Pf5WmjaA9BN5MfVNe/61+VgL0mzq7Jo6+QujYMqmHnnfNp
         +oR0LjbkryRotdwfqqxYc8W0sYt1Q1CQFV8fIcKqv/eCs7qcgutSRq7GN2KY9mH3xpZe
         BclsbsNsAvdAORVk9C4cosQGCfg6r+VzHFNUVzNyvXmkPvYc8ojiuE4ZsJqDMyBKNu5D
         XaNw==
X-Forwarded-Encrypted: i=1; AHgh+RoR47huzt3f2fnnJOYZpI3B992KuV3Kr6b9r6fmRvRxmyRue+mZF815d8zS+Zy1/p6GVNoeSZgfWClm@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo9DQScr0nxnn8BEEWJuVlMF8o2jYkDK2TUjnxtv/PTieSQdSc
	syVSvAaaLlXOw1D1Bq5oGBUQSQkn7SV5bj25hHeMM1s0ckgMX6K9ThWb
X-Gm-Gg: AfdE7cn0992fDhTFd/nvmg2aPBHyKUOGeqb/rJ7x6bkop0u1tNwDSNNw7ZdXuvzt79D
	si6TqhBCTUEJIBZV4KN5W/dEn5+gJbSnCNAo+IC6h+rM8EUH9kU4r82qM5zlzmXmlrm5DnASgj7
	2Vajak1P2/WX+/IMbO5Bq7JCSBXr1gZkarEFRUPHc/RFV186POTayzWUP0uKTkbJJ7rJajNO2p3
	PJoF+a1B0GaC7DRUt6AQSRKRoa+kGU9kDrTjZBN4wSDIw52nj09DIt4tdb1rMDejXfF4naHgTOI
	RxqDK7FVjUCvnXWOco5b6Ion67fUAt0HzMl50VKhHdRcwE7h8bpgI0CL3cSrLGs6ls53qWw96QG
	3cbLuqA7RC5lt2VU4W76TQy0G1bVSIEjyr3U/CWu6Rl8uT+jGdXBP/yEAFl13x7abCzpMzFlRm2
	Pz/bvQW+J6mFWI3jrF6g666K+ig/jU232JlkdHOw==
X-Received: by 2002:a05:600c:8119:b0:493:d2b1:48d2 with SMTP id 5b1f17b1804b1-493df062c54mr66322825e9.2.1783435898312;
        Tue, 07 Jul 2026 07:51:38 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:a4ac:4e7f:194a:852e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0ec6e64sm105192695e9.0.2026.07.07.07.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:51:38 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/3] Add RZ/G3L USB2.0 function support
Date: Tue,  7 Jul 2026 15:51:29 +0100
Message-ID: <20260707145135.247565-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Hi All,
 
This patch series aims to add RZ/G3L USB2.0 function support on RZ/G3L
SMARC EVK. RZ/G3L USB2.0 function IP is almost similar to the IP found the
RZ/G3S.

This dtsi patches is depend upon [1]
[1] https://lore.kernel.org/all/20260707143646.245177-1-biju.das.jz@bp.renesas.com/

Biju Das (3):
  dt-bindings: usb: renesas,usbhs: Document RZ/G3L SoC
  arm64: dts: renesas: r9a08g046: Add USB2.0 function device nodes
  arm64: dts: renesas: r9a08g046l48-smarc: Enable USB2.0 function
    support

 .../bindings/usb/renesas,usbhs.yaml           |  1 +
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 38 +++++++++++++++++++
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   |  5 +++
 3 files changed, 44 insertions(+)

-- 
2.43.0

