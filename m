Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581853;
	b=wcOp/eaV7zutsZPyQZ2mtf6RhuEKnSpx4pUejDyFhq09b8ScV9AUq3XdQLVlfwR11QoP
	 5EuH6A4Na/etirrorKYqKORTuqgfPF1NHfMAwvkQb8K7oys64U8VvZLBzhT3D60rujdmH
	 IZrxfTyaKBAd00jQJFxoipeM3UhfxuesTe3Mb8KAAOUO7Fx7ZP1Yttlo9ezDF6Eh+o8SS
	 XjKhlOzNuvtCTp09981XEU7Tql+MVhABLlRm7UfWTRFLbsxumVild/nCWgAQy5coRgu3P
	 gBdq3YJdq1oKtNdIz76Q/rp+WG1M04r81H/r6qivbpOooraG33lNbDQe7agGjVa0I+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=scsWxuEwzNIQ5N/PGO6xJlWHR6rWMshg3tU60+o1X18=;
	b=0umW4PrCDhIVXbdafofet2DSJZ1s2HN2E6GWIXautbj0Kq1iUEO7Cff6Uobwdb7GTB5a
	 0VE7xfODLQoB/cgMyMw3m1BOxGD+y2+fYWrz+UbP5X+BvStXpheYsHjcTtsjlnrzDpfzY
	 H8iM35/q9YO05E+ApaaXmPDOSaS00jInxFAuFxGwpbrtgx6AzoSD4wBQNZ5uY6Iv3+6BL
	 jfPsSAbD03Lx+vrxH1TaUXpbCJoVv3FyJyDfSTX+b7kfdW4rI1EWahzew5hA6JktovHvX
	 mEhsGjwXgVCO3e0dovRKWa09MGhN3edUIdvSl4xoX6PaP27cKSMbHePWT0kQzGb94ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=owO76DdV;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296FB606A88E
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 14:57:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 296FB606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=owO76DdV
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c50a2efbe1dso180437966b.3
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 06:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794581851; x=1795186651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=scsWxuEwzNIQ5N/PGO6xJlWHR6rWMshg3tU60+o1X18=;
        b=owO76DdV+intecB+gfvcaXp9qFLZHPv1oqwmheQeztT/p+qKx7StnlQPrf9T9xHAiO
         2RUEOCFi01EIq5y6j/nq2SR27fG86EGMwVX1h+hljVpRA4Ijj5eR9Z0bgRIRnBd/LOUe
         86eVB9DZnbqXjO7xcBGYT20LQmmYCZBNTieEV/sUaNTZ/SPKG5AoAppc3pfgQiYzgL9I
         /YjJJ1gUA0RUmFDJ9xnWDxuRnpSeaQaavc0gCMehJtUUU68q1Jz56JAXgfc8FJ1TzUeg
         aCkcOZGNWE9I4STm6ZaDOqZFmmsstugQ6ug7a+7umu9UU7RsN4kdEYAWOEY0zGEKhb8Z
         1utA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794581851; x=1795186651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=scsWxuEwzNIQ5N/PGO6xJlWHR6rWMshg3tU60+o1X18=;
        b=vK6puwpL6Y2adV4cdVjH+I15ZlBPRs2V7re8dw0LMAI+lduYJGXISmHizAJPsZXJTN
         2HW2CFdj4gVHaUWFIszUroCvcYLe1YMfhCjJPJ6o4YFu57kdjWFWmOZzlE4kqkKL3v4r
         XFFb1v2gjvDfAkCxqdlYsI8iVSTuEp3xfa9EIEgy2JKFhYq3cH2t/GytgmTwBR/hwk5w
         hVjyAh9fVyei9IEIT39AggHu74837g9fgttWb/fJ3Q5KoJYH07S68vZqKcJMuONlVhH0
         Iurcgz8u8f3GQK14JrRDetPGsLAvzjKKQjWyo0XOuwAvf/IOaTbej97BV4Meo1V9cna2
         6oNQ==
X-Forwarded-Encrypted: i=1; AL+hErGPCF4PxNaj2T1j0U1P57XS84alOhXXWWu8p6i+Fa29/X08jc3tc0waEvCg4zgFD5oAZeoWMCH3Shot@vger.kernel.org
X-Gm-Message-State: APuU4Z8X7euSZ99b8Gu+yTqD4LHCeSMV53/qpLh8CCe62FjfID5e7h6Z
	gAKUjjkmvqw3SxqHKxsWkTYHrBqnIFuW9dhJ7sfkn+VVbXfINEiMYxbr
X-Gm-Gg: AYBFou0ELRkYA0Z3UD1QzpQkR++3ZPnwfWyT03/MtqnRbFS3RVCy8L8S+cAN7BKMWj2
	pcVcyTqYljrhEt2W4TlnrvL1ZDyrvFcRwY8dreWC/WqSnmGh1yKxsqJPWEsZMDIgwTUS8PalUzV
	WTP1vpDoWF5AI2behF6v+VTfvs2Tl9HvbLeJ8VbFHHCYKoYOqXGEQjaPvyolhTCMg1184abKo8Q
	OLPB9s/IudSjq3pyulFTdGsxtvso7b4TwONvtmzMBgp4/R04IeyZGgK+q5JVxXFpp42sfhVBHG+
	TUf+s+Y5a/vF0MlDsWA3dudBjG6VmJrA6/q0EXGvI7138AaP0Nmyro+gocACasQzhiCd3DDkzEm
	35PvBSZ/UubClclm6mTsO1FAJhL1p1EP+W9Pf1izLoPVHRw09Yt3FnpW8owKYsz7RYrK7Re55s+
	9sWNhKkpeIG9ul/1VcPAkynwfE6u6CVomD8Ic3U8EHKm35lWNcIoxJt3FFMC65rF5IVo9wyo/7V
	5cKN780myAw4LcqpXjyvr8mASxI7lDS8qiYo90zlBox/0KJkREHBAJr0yoVlZcye3G1gnTnJUEl
	oxYtQaT2kYtb1+pbof/fqm8dEZY73wkNP42k9h8/22WhepI86Q+xwUGSptT2lawWUv3gPhVh1+j
	YQaFbCpcrvg==
X-Received: by 2002:a17:907:a088:b0:c50:52b4:eb04 with SMTP id a640c23a62f3a-c50962ee311mr275471466b.16.1794581851329;
        Fri, 13 Nov 2026 06:57:31 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b2369asm109937066b.25.2026.11.13.06.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:57:30 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 2/2] clk: tegra114: Add CSI pad clock gates
Date: Fri, 13 Nov 2026 16:57:08 +0200
Message-ID: <20261113145708.261530-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113145708.261530-1-clamor95@gmail.com>
References: <20261113145708.261530-1-clamor95@gmail.com>
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

Tegra114 has CSI pad bits in both PLLD and PLLD2 clocks that are required
for the correct work of the CSI block. Add CSI pad A and pad B clock gates
with PLLD/PLLD2 parents, respectively.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/clk/tegra/clk-tegra114.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index 80b7f64125d92..e3d8ab76db649 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -1041,6 +1041,16 @@ static __init void tegra114_periph_clk_init(void __iomem *clk_base,
 					     0, 82, periph_clk_enb_refcnt);
 	clks[TEGRA114_CLK_DSIB] = clk;
 
+	/* csia_pad */
+	clk = clk_register_gate(NULL, "csia_pad", "pll_d", CLK_SET_RATE_PARENT,
+				clk_base + PLLD_BASE, 26, 0, &pll_d_lock);
+	clks[TEGRA114_CLK_CSIA_PAD] = clk;
+
+	/* csib_pad */
+	clk = clk_register_gate(NULL, "csib_pad", "pll_d2", CLK_SET_RATE_PARENT,
+				clk_base + PLLD2_BASE, 26, 0, &pll_d2_lock);
+	clks[TEGRA114_CLK_CSIB_PAD] = clk;
+
 	/* csus */
 	clk = tegra_clk_register_periph_gate("csus", "vi_sensor", 0,
 					     clk_base, 0, TEGRA114_CLK_CSUS,
-- 
2.53.0

