Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793294625;
	b=YactR5yEJ2Ija9kImbK1e8kSQLAQaUItayZq50e0UBzCHwf+XErSsUk0/Xb2SRNVXsLQ
	 2gbj0syKnUqDnoTG020QD4uGuM1HmgUR7FYqk0QHNydyypCJB7CWF5FbYUFYNyJ7mde6w
	 hb3TmXU0RakeIh4oUm0T4gMUGnwgJRaHJXnMPDO/zOH2yUG8GA1PW5wmiWd4/oRGmmKPc
	 9ZHpgRuBw3r6H7SllwpX4zfVU3tuDdwbMUcwyF1AsTdhskXAM9exR7X9id35FH7/0xe78
	 cPY0gPjDvKHLNLkqNqW+3AqrXPYjhkKg4tZ4t76MwAsr/YEF35UIVs7Tn/qeR5vbAKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793294625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sK+5+ySWu9IBFfxfFyEDRqwJRDyxGMa+VIc2I6+6GOM=;
	b=VSYnDqOj7rkaqc2/g2UjBaz59i2FjSPCF3cg+iJbjacGjcAQBsDolxadDHMi/ZmocRYQ
	 d/1gzJC4oAfm/CDP+cWs0O88Dnn2/dF5e1C0v+6gLRfXaWDNMrycs4inDbm2UMnDCHJ/U
	 uUQgp5552lekWUZp78Y4+fuCu1cE/eXKh1Ia+gOmp72j1NKOKNR3DhefXsDHh+Si0Cj1g
	 ItY550uGwehWWx08zAs8G01umD1cCt9MdkLBxytjWYQ+P1q3DaKLOq88TB7XczJylR3/D
	 Z6qpD5PlCU8MInbzBaxgUojIGL5zBSPktrXWZX3JD0IYpLDRJ+6ReccaHhccaB9li6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZaiUIQwa;
	arc=none smtp.remote-ip=209.85.222.43
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16472606A326
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 17:23:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16472606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZaiUIQwa
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-9906870a9baso1258781241.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 10:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793294624; x=1793899424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sK+5+ySWu9IBFfxfFyEDRqwJRDyxGMa+VIc2I6+6GOM=;
        b=ZaiUIQwarltYTodYgI0qTEB5hgigDjOSK8WLIYC/taLXiDlEE11DzLtpL/jUcs2qnM
         oBDihSKDp7c/c4AE1jtw+Qcl3bWYFhkkUbTdFOwKPrkGjYClExFmClPg/4VSv7l3HNP5
         VWUHpaEqLvBoDtTVjm221qkTO0ZNDQzLyR4xS5DtzPz9bPjXCLMBG4OEWNbES7Fq05V8
         5gukBT9TvSbc5mnvKCBJ+j/wWi3MJfKftx7wZP91bDwwesuyxkWi5o4/LCLDo34lJFQe
         S7r9bQgl/TffMj6WyPzgmfIMrW2c+Pp3vSNQfiRtj46Q5oBtPmw05Ndjz4OwF0whGAU6
         SzvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793294624; x=1793899424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sK+5+ySWu9IBFfxfFyEDRqwJRDyxGMa+VIc2I6+6GOM=;
        b=szTdn6g+/l9f6fXaRxUSimAGCF7oh4YJIkK2RYUCfCA3izYzXH/21sLxCvX21W09vU
         0cIbIzWFGwWgAsfbs8vsHFc28Ep6BXOoBJVm6AGHYNrf+kYEUJida6gz1snEpqskgw9F
         MePbtSLsyCr/sKGs/id/egjKCl0iDOCkZNJ74OX3TUfN765hH8D/bxD74M8wHMB1yCxA
         jzI/iqC5tQaFWpdcbJ8Z8z9Z0DhmqO3aOVk0iKBclT7KHZJo0dCznfTrRhpMyXBgZB/i
         MQlMAEM0U30Zm8EYEt0E2dzJx1Sj+d4n/eiV7elE6OK0Gwitf1KKW3O8yV0xc3hq1J2d
         7OCQ==
X-Forwarded-Encrypted: i=1; AKwUvBymCpSDDpsm3edbAqM4xnHn10swWcr13eEzUjRDt7rvnmZflUrfb547q66ziCZ9qVxf/oDIoUep+OA/@vger.kernel.org
X-Gm-Message-State: AFq9FYIh8B1BOJNComk6M+mYM5t2QLgFA5vwyBD3NDjZrU8chPrKfGJk
	n+rXkcLDSFPtMESwxVUJyJvBLLWfoUDYXx1iT8oLEjFw2HVyqqyvacTi
X-Gm-Gg: AYBFou1mcwpb//2aXDDo0zmT7N5/tKHXogZxqPc7TLe3gA5U/39VteRbOXjOX7vXodE
	/afhOndPURxoaabAdpmrtt8IIFPwxUp9biqOCTjDUd4WvPAfhsJjOVD3YmAlSqimBQbZavf84co
	pnJpuLvUwGLcuMBd8xGuCA5sEeguKZFmRCbpXSblbaX9sRcjmofWmoxF6TONBWQEgQxqRvBXzZp
	0W9jMxOKxrnzYsvipe/ZFMYG++17FTBoeV284snqjNXrVhhLDltwZEqU2TMoggeeyOt0Tdo/Hxi
	8r8O1kAzf+67L7NJ2NRYDvC6TaTA3hqStxK8wwinOF+XO8jUY3WjTF2jwo5qAW77ycr2c+mgsBC
	stlXOLcJ+HIz1DiyFZmjniOnvXwH1eGzb1wqk9o5JbWeSfS2X2pJpwCfxIXbeZC1jwoHrCkON+0
	bTnHGSYp+ueg/+kPsZ255Q2YtBwM99zrf9fHNnAl8WFhHBTYohZ6qryG/AZO+1UUKCjqu6OdSIX
	PRI+QybNFrF6rbt60QjP1JAfkg9LWM7ciCqQBG0jYet98GAimlDjPt5T/nW37rRJygk2b3cHmsP
	kuIyNp2th/LpAF/7gCskyNlsjxF2OyLCpV+5ib8IxsSieCBs6jN6zUQuwmlkO8YiyiSIu3J/QT/
	aQ/pe5sk1GeL8byCmj3w7c3CqJodmosby9vjiUJ8TAIF0omAb0UpqfGCU7w==
X-Received: by 2002:a05:6102:4b13:b0:7af:fef2:8ecf with SMTP id ada2fe7eead31-7d03a434b91mr3505471137.8.1793294623916;
        Thu, 29 Oct 2026 10:23:43 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cea3d32a48sm9907357137.9.2026.10.29.10.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 10:23:43 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Xu Rao <raoxu@uniontech.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] phy: sun4i-usb: add the Allwinner A733 USB PHY
Date: Thu, 29 Oct 2026 14:23:23 -0300
Message-ID: <20261029172325.3425046-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
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

This adds the A733 to the sun4i-usb PHY driver. It works with the D1
settings, except that the A733 gets SIDDQ cleared before the PHY reset
is released (patch 2). That made an intermittent USB1 enumeration
failure go away on my board.

I only have one Cubie A7Z, running a local DT, since there's no A733
dtsi upstream yet. Only USB1 is enabled in it, so PHY0 (the OTG port)
never went through the new order. The boots ran the same reorder on
top of 7.3-rc6, before I turned it into a per-SoC flag.

The numbers are in patch 2. The comparison inside the last run alone
(1/31 vs 0/60) isn't statistically significant, so it leans on the
earlier 3/40 too.

This goes on top of Xu Rao's v2 "phy: allwinner: sun4i-usb: disable the
PHY2 PMU clock after SIDDQ setup", which touches the lines just above:
https://lore.kernel.org/all/CE85F490F5646A2C+20260813130542.2425068-1-raoxu@uniontech.com/

One question. The vendor BSP uses this order in common code, for every
SoC. I kept it per SoC because I can't test the others and the manual
says nothing about the order. Would you prefer it for all the SoCs that
clear PHY_CTL_SIDDQ (D1, H616, and A100/A523 through the D1 fallback),
or is a per-SoC flag fine?

Vinicius

Vinicius Pedrosa (2):
  dt-bindings: phy: document Allwinner A733 USB-2.0 PHY
  phy: sun4i-usb: clear SIDDQ before the PHY reset on A733

 .../phy/allwinner,sun50i-a64-usb-phy.yaml     |  1 +
 drivers/phy/allwinner/phy-sun4i-usb.c         | 35 ++++++++++++++++---
 2 files changed, 31 insertions(+), 5 deletions(-)


base-commit: 8f56fdf3d8cb9f1dbdc93bf9ac816698aa6f70b7
prerequisite-patch-id: 77e92419764dd34a945f7d546d4cb1dccb6da112
-- 
2.43.0

