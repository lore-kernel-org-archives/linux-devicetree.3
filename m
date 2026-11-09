Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794197115;
	b=k+8OnzdivBIYhL2/YCZeaky19OH2Quhobc7yEUKfyWoOLN2IwZ0DndQaBePBuFnmQpqr
	 x7bi9brRS6uwxLx6dgzYfc406O2frq3Ikdx8s+YN/LSRHGzYCDlGI2BfXuvKil+rSUdcY
	 zoX+HlSWoQc+pdJ3egFkEqKH9X5D/feP4qeR6N7Mb5gY+8AHDBv/oMRzp472h9edJ4WQN
	 ys+i8l2KftV+Pg/6rPHUualCpG+NRZPxKEynCkRZDIYmhBnqm3EHFyf/EmMDc7ksDO81O
	 3pOfAYlfj+lcymUNZPdNPpdPHRz0X5WN2Xh3BIsXjJvv53uvHcfslq8WSbUKiDxgmNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794197115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=65HrNvLn4XwWDPvHQ3wW36EvDAN7JOrAPcPbiqPvX1Q=;
	b=SP5LdOxdUXP9URsxik5Dwvv1kcX8NhVn8E/EPnPY5Ptib/zpoTWwKGrxo87iMrraYjV1
	 8hYVTmeQgisK1TEgdQSxOVvICRFjBP5gksWwM/urjjJ7dvlO4xKZzdTq3pXqMRZCME/x/
	 VL2yBy9l6ehWgw9VJTxlsEqw/6GJa//wEBFUwyHluESZlTNhyIX2ADj9ZAL4gV2Oh+uuj
	 SHucCaHv48MloshjMHX/IgsU6J6ZYb/ntCHWxZIiZMD2Edf2yXbGuHOFWk4QBm6p/UPFZ
	 B8EHzu77XuV32DLgRYcaXOStAH9GIeKnazsl+rixCtokpcXCOaO85873EvGAN6Y3jCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I9l0qa+b;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1F8606A323
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 04:05:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF1F8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I9l0qa+b
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso228755a91.0
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 20:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794197114; x=1794801914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=65HrNvLn4XwWDPvHQ3wW36EvDAN7JOrAPcPbiqPvX1Q=;
        b=I9l0qa+b9zPWr/JhhKeEAAKwqjuR+kYr7IAGO2ddJ05JnT9iVMmY6vOnAhTP5z2ebP
         gCIBOLyz4X4ksd81vXqG8oZmHVV/ESLDgyC+kIw3bYvWihaWClE0qRuawnmmCeEUkacT
         UFuBNut7NmyP1l5w08zLHHJTgOnaA9UtQien7YA+3vvJDQwJdSYaTPOx7ea9IL+CFMGP
         xuLPlh2Zm2RPZaCzdL4kFoT4dv3TT1tAIFgdVUN2NyL3DrdIiLMyOzPbM+g6PlefWAsZ
         mcs8mjT6cRzh00gHHZoBHw+vC0d44q/+5QkBF4UfrZedZmcg8hp6ePfOk46UGNZwS5lw
         53mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794197114; x=1794801914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=65HrNvLn4XwWDPvHQ3wW36EvDAN7JOrAPcPbiqPvX1Q=;
        b=R9nCkkr2xh/iK2BQV4mlFUY5fY+NkaBZhYXGc28JYhYEt4DeO4HeGopvOmmsmJ4dNV
         EaGLOGtRuKwDEBrXkDEt/jSYYQFsS3yyFTkwGbyI6tSGjmzAfpRBJAvdCIRU6TJJcuUz
         BVgvyGvOX+IwIxDawiTIU4KUclVEuB28AhLx5PVP7CVFytT+EeD9kG9sISLXti57M2Nn
         NpoAevxyUQ1UKVc0FC1yq4n6kbjP8LiZdN18CDYyPcO3TOVggMjrBsNesmrOCjpLapIe
         H2VnaijzYpHGjLnfvrxQDnyhYWgrwjW8X7nzff8zcSduRj0W9tcn9DZNNhB57WuUI3qC
         cy5Q==
X-Forwarded-Encrypted: i=1; AL+hErF8cUFLnz/OQM79vtC0HVCu0Z/nCP9L7vi2CQeVBKVFCpsiCK5hU1qIpz3/TkC6xJYJ5S3ffmOyOnp1@vger.kernel.org
X-Gm-Message-State: APuU4Z8d2flIPa89LUDi/VoKxvZ4gSJBKiYkom5tfDpsobKvn5TsyxGc
	tlMzkcOFN7tW7oknbZDPtItMhaoNBFKV532ZGF1Fo04vNPwABQum2PtM
X-Gm-Gg: AYBFou30hIn/4+sl4ePs5XI4F4bWqFE67RTZMTOt1fnZ1mYpNzR6c9la++Maj8uENPK
	5Oqp5fxzIswuDCKf+DSIBp2+CowKQjnYTxV5Zf3twd9/i7pUKZtWyY1kuUTO/tsl5ybaJVRHv2S
	4p54k6KP0nCd31l0ykXdchft/NImjNRs+eIQnrjT3PiY0RV+T4Oh13Kv69Fft4TMIWnw6xXbDYL
	G4x3/aeL81vp95IBKRVvNI1ZGIdZ1TDa08IWgODNe+wzswRhLDJpJtbDIeyz89iTw/C9ycsaAUc
	sVHM8KhIQxJujXBmdRfB8bp9MSozOzk8kVuHebdWpnQpUB24qJx2oYPkBZSgw0Wv1ZKTLtUQV6t
	xCyNoLYpChWVAQ2CnOTAy8oerHNpYAhp/vJKTP9qPx0oz9kR65ZcSDSVsm6KYqrxU1dpt7ILUC9
	wAn4z9YZ53eXHIQrtmohNI5u8Yf4jMKpXNhLAMMOO/svXbXyZb+AZjJDgfIne5LpMaXLQ5gcJ7W
	gLml5+1bbgMaDeCMymv9N9cTwAsnqid2G2ZZG7i/MpRRj0pnZkM8azoejpMCMJjvdaygkUdEzCQ
	quoAYEf0x8nIeNLycZgjl5XtkouuXEFtiyRMW4R11scjz2A7u9NuKz+wyxT6t+qwzo6Qirt3MxF
	Dj9g1EqGc6+LtAbsS44csqN2Aca4nK6/r1xOlz9V8oEQleVIPjK+nRX3etmDG5DAduCskW31N9q
	JQvA==
X-Received: by 2002:a17:90b:3b50:b0:3b0:9fbf:8951 with SMTP id 98e67ed59e1d1-3b12d0dee33mr2874760a91.5.1794197113782;
        Sun, 08 Nov 2026 20:05:13 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b127891fa4sm5116170a91.4.2026.11.08.20.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 20:05:13 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Alban Bedel <albeu@free.fr>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 0/2] phy: ath79-usb: support the AR934x+ analog reset
Date: Sun,  8 Nov 2026 20:04:49 -0800
Message-ID: <20261109040451.114135-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
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

From AR934x on, the analog part of the ath79 USB PHY has its own reset,
which the old platform code handled outside the PHY driver. Patch 1
adds the optional third "phy-analog" reset to the binding, along with
AR9340 and QCA9550 compatibles that require it. Patch 2 makes the
driver take and sequence that reset.

Changes in v2:
- Send the binding and driver changes together as one series. v1 sent
  the driver patch alone, so it used a "phy-analog" reset name that the
  binding on the list did not yet document.
- No code changes.

Claude Code (Claude Opus 5.5) was used while preparing this series.
I reviewed and tested every change and take responsibility for it.

Rosen Penev (2):
  dt-bindings: phy: qca,ar7100-usb-phy: add AR9340, QCA9550 and the
    analog reset
  phy: ath79-usb: support the analog reset

 .../bindings/phy/qca,ar7100-usb-phy.yaml      | 38 ++++++++++++++++++-
 drivers/phy/qualcomm/phy-ath79-usb.c          | 33 ++++++++++++++--
 2 files changed, 67 insertions(+), 4 deletions(-)

-- 
2.56.0

