Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609960;
	b=PF50fUfFIqLj/NMwGrdWtpiOa1ZiDHhUXHTYZx/ypNi2axAWQZid2QImokduSsXsc3Rz
	 nCbXGQ/X+iMgpVUtbA7SSqi2lZ+f3/BC6OTip5CcUDq/rO0Cu5JPPEXWDzHuqA5Dz1xl9
	 hvjJcot1ms7d+fS+uSY4tvKTmeRRQmYBXtcaT6ZZWDL+Pi38T/kkvyQIVULOjIqkrRDyg
	 JmtZid2P3EkAnBv8kKHs6BSewyPRfVJZE3dHpbENawN29QLYK5DeNMERAqhZ76fVT36CP
	 3WbL1PcUqaggQm20DMns/LO/KWonq59SskiBiKUus2jzOXOfbIe5R5iGITg6RuMHMwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AxUlajAcSM1mDpKZdVSgSkZ4R4Jb2QJeUzNxitwZ2CA=;
	b=cgAPIpwVuHgy/do1GNh8bvDrxMR5VjbqbahJOq4hEKswzkX5UjHdmu4sXxeBE1wjZ1oY
	 FuC6Jh/kilp85KvraSl2v30ccJ2r4XckJyYkjTJtO26B7XcCqJX2wWK8KUWrU29ppnhdN
	 Ex3W9xW14UD0F6hKUdbMfusCcqTPnYgCIXh8pFNvy/LQYU2xFvJrZJGBX+hVLab7nvs7E
	 qnXEY45Qd6/M1fKRfAdqvf3XSQOJfDfktnBtstygUndVj6w5HZ8ufX1SclHnKUQ1A6sUB
	 WdOr9/G/tO/1aMUPFmj9qzub9h8A9RYcfSVorl4cHQr9Ga+vOGvS0vPKmyQGQwDGN/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jjf6U04c;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C443E606A326
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:32:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C443E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jjf6U04c
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso2300048a12.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 04:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795609959; x=1796214759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AxUlajAcSM1mDpKZdVSgSkZ4R4Jb2QJeUzNxitwZ2CA=;
        b=Jjf6U04cQWZ+NII3vRDrhW3MUWdwXMhKSfRtwwd4R59UmStgmNqb3pePkQ09dJ740D
         TUMwlPxIinVGwhEx8pJ8X+RA/1hyWgQDRpxDjxGw4Sr1zUpME9ezWVIkmfHwzJoOuML1
         FLZE9/m+gFmnXvzsCd3guNsf8vTsYWfT8C4PAPM8HUpa0emGH7QSieVXXqdCwWyPdkXy
         JcGGcvFlDvV31c/4jSf880N+bvOzvW64ZCO4EWUmBf0AmL/fMxzJQTptnZsJf7TESfg4
         tEKX28SXJHswIQCWJl6QTyV0qs22hIrsZdFtQiLj/zpKAGnpu7MlYGSMPWIq9HMLgYFI
         5ABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609959; x=1796214759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AxUlajAcSM1mDpKZdVSgSkZ4R4Jb2QJeUzNxitwZ2CA=;
        b=q8qfJE+PvQD2zDNrso7L71b7wwYLTZtcJ0mgEfO2CZ2Kvfh31EMTQbLwFeRthVMiPi
         A1TjiJLxNpmuGrLDLXeKb8gFfjq6i06MjDI4nrPGogV8iRgg8u6e2j6OXYVzsHVQfa4P
         jltHH+EEBiZbWX1a1ZhyGvl11Ezy85REvTTI98ncthavmxyqGRvZY2hTHTB8//i50rYe
         emrg92mUg0aHi7VPaTxpx6NXQIzNfFviN7cb27KB2QIv+2C97jmawLN1znhzOgeA57Jd
         2on8+yVdBWkbTaidugdAr71HaD5G3UuK5cFsHayOTZo/wZXb2+Giolaob4lvjvA7fmja
         hlxw==
X-Forwarded-Encrypted: i=1; AL+hErGPxe9YYoVFPUeLHLJwSWMY1sdffAwCpcgFD7qW3mKle9MeJLTeAy++JhIq0v2v7vCLrOkTzwli9Q4u@vger.kernel.org
X-Gm-Message-State: APuU4Z8drQZ41cZrdUFxLBk+S8eL3IqQzeoJrc6LfwoNIm3tNWunjUSa
	fITxWctrxjdPiuaEFL4UyzciTWMMmhadkNf4l8nrrOonUCBg184pHTwG
X-Gm-Gg: AZFdTZc0bPQLRuCVu7Vw+UbrnTHMF3+8Kq3sEv2aT9PLZvgmhgE8Cyh803QZoVMvtqJ
	UgtLURKRykf0z4Ra/8ewdJzSBZ9GhTSdudLyVchrPSRHPrdAiiOOco8fi6mp/pa6vgNhVqYqaRs
	H+gGuVv3+JCtV1TCkyuhoHvwQmLjLf1PLPQTkEybWK0OU3VREQKqwLBphR2im+mTMjnOM7xj/Wn
	FeWhBCOOLwlVRhZopiNueY5v+rIYLkXRS31ZzSejkzIz+s0qJzYsk7ddAabEkyp8aRQ0zK8ZS1W
	+ou9dnwqfHc2gwrjbk8j/vMj4qrCoypc8kv9ZNHGsPAC9sF1jNXL54dBqcTKpQ0RERoEcV26HR1
	fXDeper1Zce84TBhp1wpp6UlZeEIHiS4qrgVwDcT74p7qJXI1dHLHP7iEVrjdMSoHcAJ4Sluvui
	nFydEa6I4yxhKOaEiPZD7Iz2mSkRLnOo+5esdX/kHfBPDDfpNxktqIp/xU1GxCE0mVMLVl5ZJ7G
	RuDN4pPal1tVRJyssvc9BPcd0QmvXVICMyqHkmtK6VTImXkJq9e0bxsTpBDr2qGmOPww3aYJ7ts
	u2G1A5ytuXw6dx+wrfEyx+8UgyWEjLU0bWP0cNDmiegY8zRX
X-Received: by 2002:a17:90b:1641:b0:3b4:fcba:8c57 with SMTP id 98e67ed59e1d1-3b4fcba964fmr1130708a91.20.1795609959126;
        Wed, 25 Nov 2026 04:32:39 -0800 (PST)
Received: from localhost.localdomain ([103.118.130.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b792474sm12698366a91.3.2026.11.25.04.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:32:38 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	u.kleine-koenig@baylibre.com,
	Hikmah Gumelar <hikmahgumelar@gmail.com>
Subject: [PATCH v4 1/7] clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
Date: Wed, 25 Nov 2026 19:31:40 +0700
Message-ID: <20261125123146.379057-2-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125123146.379057-1-hikmahgumelar@gmail.com>
References: <20261125123146.379057-1-hikmahgumelar@gmail.com>
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

The 100 MHz entry in ftbl_csi_phytimer_clk_src selects P_GPLL0_DIV2

with a divider of 4, leaving gcc_camss_csi0phytimer_clk stuck off on

MSM8953 platforms such as Xiaomi Mi A1 (tissot).

Switch the 100 MHz parent to P_GPLL0 with a divider of 8.

Fixes: 9bb6cfc3c77e ("clk: qcom: Add Global Clock Controller driver for MSM8953")
Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 drivers/clk/qcom/gcc-msm8953.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-msm8953.c b/drivers/clk/qcom/gcc-msm8953.c
index 8fe1d3e42144..8aec5600e837 100644
--- a/drivers/clk/qcom/gcc-msm8953.c
+++ b/drivers/clk/qcom/gcc-msm8953.c
@@ -964,7 +964,7 @@ static struct clk_rcg2 csi2p_clk_src = {
 };
 
 static const struct freq_tbl ftbl_csi_phytimer_clk_src[] = {
-	F(100000000, P_GPLL0_DIV2, 4, 0, 0),
+	F(100000000, P_GPLL0, 8, 0, 0),
 	F(200000000, P_GPLL0, 4, 0, 0),
 	F(266670000, P_GPLL0, 3, 0, 0),
 	{ }
-- 
2.47.3

