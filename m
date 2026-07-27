Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3FE1DF72C
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 02:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785118270; cv=none; b=rPyksREVZbIoJHG9EAPkv/36mgjwjXPU7MVmLv9Ii2Q+rJ+FWWdwQymPQK8MDI96SRx34agRvk8HeJi1+PIw/ZrrSPvUgD5FhjeH+9r01H008UGg1A1PPrlythCn1bozjNdLpk6gMibVJ6wc0FGCiLYpyiIG9WGOdV4h//SiMFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785118270; c=relaxed/simple;
	bh=Ii/069Z7IujjEv3Xqb+T/fhj0L+H5z7bqE6/KT1hjto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kF+zsrKpupUJNkBPW1e+kos7mA4R3T4DhXvw+4unPcoZ7fSwwy/NOLbQPrSx9DN9shaGD5HaVjkrxYwjr58dntvhdLOfHn/Twz1VgBIue7MO6RrbdjKSoX1bus/4Er+JIJEsqbUc1wgt/LyS54G/7V+KW6Y3qS/xpnUxd9cJLBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HpiyFOw0; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HpiyFOw0"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8453427d3f4so2260397b3a.3
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 19:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785118268; x=1785723068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bdXlW+/ogTDXuEYnIcppIc28hzmU6+dYC2I3iGVVVgs=;
        b=HpiyFOw04ZIeFT8CuhRSIX5DWnmX1ipWQhpMysUWyRZMOVYXlwoa6htI1w1nn9qMpy
         hfg8GchdgqhMj9laeZf1OIPKUmEtDXjcEWCcYA7aLTpiRmcueazoqy9qiMpXBngKMTaS
         mv+aiaYRBvRKyp1vbayPIlya5WIPPz2q7SsiNp+nvokWjiIacaJKjx2SXhuTDG+gsjSj
         mB3bYSaMTg4sjvvKUTx29Ddvi+cx7Js2dbJp/53wPqE2zXSBu00zcy3ZR4bzP0kce26D
         1fRf444qtc/sZ0IvUPQqnZ1TqJPl3uLda79Sn9dijVBcCExM0XomX+3MnAA+whis1aEy
         PqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785118268; x=1785723068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bdXlW+/ogTDXuEYnIcppIc28hzmU6+dYC2I3iGVVVgs=;
        b=iKNSKiCCbCjOXcmEdtCnbfTnj126oe12TxqOTkoWMuHjhaBQwe9Jg/xvZtpGjx9XxF
         XaBj6Mab0nRMzBVdm8GSeE8OhlwY4Pku2fNQkFzMP7lcLudKN45OIQ8GziV/Eil9zEbq
         iRyAVVFEIqr9erHRqAp32p9655nEUDZ4h+4IDeBdyS1Ule1SGRMibo3LhxnINpPqiE+i
         6knVxpJNZEzMSOfbgnfBYlU1cIdIMZQI9XXVRw9IIfJR2x3R7jybdkHtHE6Oe3CbNx/Q
         7v7T5CNU9+g7v+dKd/f34APZvIWKQiyjFuoj8/sS8CWx5woYKpuj4/+AuI2rfy+UF39Y
         IKrA==
X-Forwarded-Encrypted: i=1; AHgh+RpuJP3pIfbGeVe3lFNDiTgF+Jxc2bcNXz+yf8X6dM6Ig+ZEws8EHlKSEwwx+flUKp9XZFft+b4s47th@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2EuVqxV79ldaQBJrWFx/mAHdjeia0qZqwW8ANsffDstUqVxKN
	J3PjJQXdcKKVHqFIH4Onapn0M+xIJL0SbR5cILC/FPD0r8v5tC6sufzn
X-Gm-Gg: AR+sD12HIyo3440ZMGu0Isa0Vm747e+OyQRZ+XJIX3YvLAYiVk8mTNzwTnBdxz6HQ/j
	DreoBAJuoAp2RUFmOywQBbj8g+HkNk9OkMP/z0tXkDqAu0JdaS01M4ckjQRQUbgG4sFvv1qqRe3
	iarygmkwEfmyhnZOkyOF0K+KAeJi1pZvmg99xukXTpCYlrgx3AtXoWxFLx2/uPSqJk4ZY17HcHi
	Hr6efV3FJMCu/kYrPSKrLwdBXN+v0XIjlwV15nPrgkIQdY3qw13BM43mZwg1OVC+pH4nUyz3vYC
	nbOYATnuP/rANuAsJ6ZNO4pRbs1LLKWG6M2s9rmrn4xQMOEsQDtcIB85fpoV6m5OIkYRIRKh/RF
	J8qfAaYCj+MbXwaodoZj1etEThYitEwBJOjiZSfcLTU4brCUSN/zYvucyqbnc7dhE8VYu8slNDb
	sos8FX6vTiw+5BgGaNEKkKBLE=
X-Received: by 2002:a05:6300:85:b0:3bf:983d:e9b4 with SMTP id adf61e73a8af0-3c67ddc3cabmr6375253637.33.1785118268171;
        Sun, 26 Jul 2026 19:11:08 -0700 (PDT)
Received: from attina.synaptics-inc.local ([199.33.119.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e53094d65sm19162200c88.13.2026.07.26.19.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 19:11:07 -0700 (PDT)
From: Gavin Gao <attinagaoxu@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	richardcochran@gmail.com,
	nicolas.frattaroli@collabora.com,
	sebastian.reichel@collabora.com,
	sashal@kernel.org,
	alchark@gmail.com,
	chaoyi.chen@rock-chips.com,
	attinagaoxu@gmail.com,
	amadeus@jmu.edu.cn,
	rmk+kernel@armlinux.org.uk,
	horms@kernel.org,
	alok.a.tiwari@oracle.com,
	david.wu@rock-chips.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH net-next 1/3] dt-bindings: net: rockchip-dwmac: Add 25M refout clock
Date: Mon, 27 Jul 2026 10:10:45 +0800
Message-ID: <20260727021048.3375444-2-attinagaoxu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260727021048.3375444-1-attinagaoxu@gmail.com>
References: <20260727021048.3375444-1-attinagaoxu@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some Rockchip GMAC instances can provide a 25 MHz reference clock output
for an external RGMII PHY.

Add a clock name for this 25 MHz reference output so SoC dtsi files can
describe it separately from the existing MAC reference clocks.

Signed-off-by: Gavin Gao <attinagaoxu@gmail.com>
---
 Documentation/devicetree/bindings/net/rockchip-dwmac.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
index 0ac7c4b47d6b..074ac274f2e0 100644
--- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
@@ -81,6 +81,7 @@ properties:
         - pclk_mac
         - clk_mac_ref
         - clk_mac_refout
+        - clk_mac_25m_refout
         - clk_mac_speed
 
   clock_in_out:
-- 
2.55.0
