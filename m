Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787133;
	b=fJZ+OhQtpo7NGVRytb/SrNnJffK0OYIaWQ1p+XI3bQBhMdiYpKntqLZWGr4sEpT94DCg
	 CvU2UOfhpPBKTPVnYc8zTPlDe7AcQMJvpYplK5VTveqB5chKZ0q5jKKc0qElJp46Cupgm
	 GPaXFscKiAuM2rrIxM4UqV5x5Q9gXK7JVB/dq2GlNX2qMPjDXPMoGTcOAtNKHPRD42NMc
	 xDPTdDeEjK2E8AKjtaWKLhpG3+I+RIASYS7+MS6LMAmS20TiEAGmou3/qzfiVDJK8B0el
	 w67VyqIKuMFAq+5WqphMSKuIj8zEBmTqOwnFxljb8qMhHWPDRgrjiLO2TaYVvmmxomg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AxUlajAcSM1mDpKZdVSgSkZ4R4Jb2QJeUzNxitwZ2CA=;
	b=ZUM4xjUZQgSucuSKUFoHqhu03oq3P5wcN2FhZcbDxdbnNraEVxieMQzuSXlY1E1yyYES
	 8E+ZmQFDcrrWvJBnPWb6taKHbh/1Xr01mPdnIAq1RN+ftmwZKjTU9UegKjaFyG7ZstDDY
	 L1RqCdFXG98TNpxLF9Y1K1qiTveLuwwWKW1+4peqHa3yh8bn9cq9JIf+1R04W7qfO8jre
	 v68xahWUaehRJZSVwYDbs84m2W9XnDLb9RtNoqyAEnjWEixdOUwL7cUs5Lh/ZOjhIS2H8
	 dvXCxQkmCP4E0ftfaWBL2z77cC10UgvRgpIf4PzTJyBg3FCU1p3wbQV0jvh/fgIvNig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PivZWo8R;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7C9606A338
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 13:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B7C9606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PivZWo8R
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2f07a960666so57502445ad.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795787132; x=1796391932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AxUlajAcSM1mDpKZdVSgSkZ4R4Jb2QJeUzNxitwZ2CA=;
        b=PivZWo8Rof7K6W9Vheb0qp0zThUzh9oIVDgxc6i3q6xWx/3NrfyXUY9IA3TQRrg1KS
         87/9gnEPwQJghnt4GOIQu1d/7nHtLh7YyK3tzfpCIGi4kfTjK0xSJhvP3i5MjA9i34K5
         5+9amcagsLV30MUbkjRVZFuaQaWkFGwV7DXBKQt46IDPdNi1ADSQrkTLEJ8yad+fMHSA
         SHxNYXroc3W87etzrXbTif1r5krOcCxjXTn0SOc65Z68yE28tlLl615HRgWjQyEJtXzh
         mfcaRJp5cLzkTZ0Culgxn0PvYL58NGjpyjt/p3lhM3ImtleycWA/Q7jXXRplaRa2jbRj
         CPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787132; x=1796391932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AxUlajAcSM1mDpKZdVSgSkZ4R4Jb2QJeUzNxitwZ2CA=;
        b=UsU+fKMYRGJeDBI/Ng+rsr8AXpDYa38tHPcU+XAdr9zWMQsQyU56IXp6vqI4HiftMH
         Lu5JKGoFuL8U77brRtUNrzJ71CDChvUV36BqTCIyiPt6EyoBWyCbYmaOmmZjIXrIGD9D
         W58KBdSnLJ0nou3KYUIaxt6fwja5tqzsnhVIANZc0+4q3JjFQlHNXGPhpxnbw0AmeNGK
         j3wpiCZ4BgJbQ+zmUthTPzVwSrljZgB1vTS5feIBu7ABx1pB7TULiZJhOBUH9dQPpyXo
         iLdVDgwwuPSsmg8Hf0KoG4eqVpolD/LhrL4B4RzV0zny+y7mrW8R7NzfgCq3GPc/yvan
         kFoQ==
X-Forwarded-Encrypted: i=1; AL+hErHuwqfIiELcSm7TtpBAsJdo0W/pj1YuO/EFkdny0TUDS1oiXho/hxHitKIebfoBVJRLCDgVNxmY8hAf@vger.kernel.org
X-Gm-Message-State: APuU4Z8JIQ0n4riMyE/uxooYsBQ0aMT10t3uVpwUxEMtK+Y5TRngXTCu
	x9xfGou6xI4PrjPdzFIH8aEzdYHIYAyZrtCRcwfapismFUyL+ShUo07X
X-Gm-Gg: AZFdTZfUkIuVIU5Sp7IyUR13+GPFbxIYQ7iYF2p8bbhxcFVhiiQ886HB5/ECcmNC9Bx
	2SkQjVhcIA11BLowwb9gaV8feVc6TrvDCPq2xp02/n+8Go0N484zciu4sVZcSt2Erl4Q8GN8RGx
	Q0I7ZBPSq3UBqTPKNE3azVHfT7+clZHIrKvTcyxAfI7lMaohaXtXuJYHHhNwceeOQvQPRonheLQ
	futa+8QtBOCEaezuEUUtWynHbNBVFuTPsFoss1wecGQj/TTYudIxnuCsIEbISal+LR8q97sR+Hx
	x2U0NIfCNAEpx9G7DLu7KFOIE1CwCKYAMtl7OT93GJTMHQEZp4Wy9shBCaXy2sy23JDisNC+h9k
	k4sZHEN4g+qMRlaZTxlZDF2PWuZaXcJtFaltFk+IgPfrswLi3kgo3urzvayWfTn2n7X7bIdnUXO
	UNfgRjc5CuvVNqkPNhHhgPt6hgL3eMEJFyFBi8WecVw9eg2R3hbLngGbPSsbMt5WLBMKgmN8NKU
	4uKAb+Vsu+7YBC5iO6A0i2nWkdUfomniE4Sjp6udkDLeoFRWAJLg3mExO2SDb6Qg5FsQVmE+mT+
	GQDB17DdUi+6f7haOLDmgURBgrQgRUFMOa526hpY6TO+Og==
X-Received: by 2002:a17:902:ce0b:b0:2ed:acb:aa96 with SMTP id d9443c01a7336-2f03f11c934mr272576205ad.24.1795787131876;
        Fri, 27 Nov 2026 05:45:31 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1f2csm121741545ad.22.2026.11.27.05.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:45:31 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>
Subject: [PATCH v5 1/7] clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
Date: Fri, 27 Nov 2026 20:45:01 +0700
Message-ID: <20261127134507.125513-2-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127134507.125513-1-hikmahgumelar@gmail.com>
References: <20261127134507.125513-1-hikmahgumelar@gmail.com>
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

