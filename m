Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0F6305057
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 02:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790477804; cv=none; b=sEJxkwoyC3HDGxrfQCMufb7QOAMkurUIccJK8T9GrImzL0Ff0fPMeOR9yOKCsbJo1cueineop3bP9asQt/d0MrZYyCcnzMdrS9ilckubH0f/l9uL799xdb9kx2BvSBKBCXrizMlEy2pOvM9P5g1MVsFh7srv/uCLQfzorCG7VlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790477804; c=relaxed/simple;
	bh=eMvIylI6UdB4voWaYZ2XSYSfydZcKpLaBkAqaZ9abjI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lUTtjN5NO+ifkBuiZzhPEDRSZD/CzWw1Yc3LQyrKUlwqWUNuVU9aZOPYwZShjBispLzRV+oNU5UUY/ykl/Gvq8xgP/TzQYl1DkEu5N2fSXhMl5kkRwXCTPzG3GBmm+LLE22Ya/FcihF9iu1htqrl8+wLa5Qg7TX2Zfi0MuEir2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog; spf=pass smtp.mailfrom=embeddedlinux.blog; dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b=gm8UKq5k; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b="gm8UKq5k"
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2df908f4bccso13673095ad.1
        for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 19:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1790477802; x=1791082602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qyMsLj0hkCZGFDmY3GbC7EId9UWnZfSNH3ILjJaXTeM=;
        b=gm8UKq5kGslTGA/oSdr1Tcgs/Xd/sqHIXTMtNWtGxjP/GEoYFG3Hb2MGN0JoGx2MYF
         2WIqt8m+XBzEXhqEtsc8ofJAC/zR6qmwn7QVlVC2x4nXIFLLMXgcAjahc4AsvkH14+iy
         XXbSRA/iM1Br7/3TRiyPol30diJXmXTEYGL9uiaajgQKPUKBCggXfGWt3+NJqz88Zcrz
         C9FvZtzNmXEwieZ4COLSgqBn2JVNqPHyyhhL6NLMZBz2DQkN4OT3wOA9n8nixwP607Hl
         I+TKm/jEMxyXzKs86VEKn854f5JqppgtoVQEUJhHXSDtYaFQXdJoLOhpZYJRKSpPVoQs
         cr+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790477802; x=1791082602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qyMsLj0hkCZGFDmY3GbC7EId9UWnZfSNH3ILjJaXTeM=;
        b=ThEdBs9pa3bQcXefjzy2vhC/dDFMCt7PGzjUz/ZIqqEPzYBUyzvg8qr5RWJHYnw+t1
         PQX+5Ey7Vlpk9HIC6hPgT/ZYLRhTvUKz1UXcxS6su2XOJOj2l31+FGELpDubisnUvtPG
         7sbM71mZaQpXjVP9no/UZRKtul/QPZIP5mbY7zBoGhyKDNZDqwXk6GePPxDet38STauZ
         Nkx3Td7Uf5YnXTca5XfGfrU61bykkC14kxUQNQ1dvclMVc2E8+UZPyZZbiWX/mkDm6VL
         dQ1nNxQ4Y5ru1/npuTy9tPKnou3zQJVI7VQEscvTIGiD4X+j7Jx508JahH8Fasx/o6zb
         qZ9g==
X-Forwarded-Encrypted: i=1; AKwUvBzWnB42b9wrmje+QeZEVbCWCSBQvtpiPWR3G8qzptMffFlKfz0976vu/8WzeXQKBHGcc0YruDrywcik@vger.kernel.org
X-Gm-Message-State: AFq9FYLSIHPES9e0pS52oSkbnE+5ryeIDqiuN4VZleVzjA8MxQHdPgPH
	lAtsEgvdGH3gPYH42BTizDKaPlf3DMRMqm1rOx1BmRvsGjUtUWHF0Ud0p4Uz67avjJ0v
X-Gm-Gg: AYBFou0ptEX/rPjg7aNlc+0Na7MYwk7dqVBJP9UAL2Vdto4pIz16xs3F4p3Rzpc3rGp
	FG12bpxTWoKbxnq7on4XbVw87Q9udpOvBffYunXD6EFsSFKvmDChCHrgDAIcZR7UrjFi/h+Sszk
	wkYPe1oKWwcixxxUidgEoJmjNQ2HNzjEwGpF9SVxES+0CsJhhuBwkNcuJeusIR1zURFdgH7nJnc
	Bq1Og6nN9Ye1B8SUM79gTDl+dX3Xuwzoh7PvTnF5DxEI9b918o0wBV+F565Lf+GElcB1+PBvidK
	0hRsahiqG///FOVzflkHdKyvcQ9nFKT75DuyGTcOMohZXCQsQoQ0kyF7OljyvOQrqhG1jr8qdMN
	xnuzceCfdh1gzONGbVB2QbQJVvbWtCblGq2FxQafPB1rQm5tr/o0aoUCR6MQ+WqO3NR46cMH0zC
	TAQdU4KTqdpMeA3GEvVSu2GHaIYDIiO7OS7Iqg+8nsSdDEZp2zRMy5yPBJ6GUO91oMCg==
X-Received: by 2002:a17:902:e94f:b0:2df:a4a0:6443 with SMTP id d9443c01a7336-2dfa4a06479mr31921045ad.13.1790477801815;
        Sat, 26 Sep 2026 19:56:41 -0700 (PDT)
Received: from ltu.. ([171.245.4.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142bfd4sm25512285ad.52.2026.09.26.19.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 19:56:40 -0700 (PDT)
From: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andre Przywara <andre.przywara@arm.com>,
	Bastian Germann <bage@debian.org>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tien.nguyenminh@embeddedlinux.blog
Subject: [PATCH 1/3] hwspinlock: sun6i: Get the clock and the reset without names
Date: Sun, 27 Sep 2026 09:56:24 +0700
Message-Id: <20260927025626.69614-2-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver looks up its clock and reset by the name "ahb", but the
binding doesn't define clock-names or reset-names, so a node that
follows the binding fails to probe:

  sun6i_hwspinlock 3005000.hwlock: unable to get AHB clock (-2)

There is only one of each, so get them without a name. That is what
was asked for when the names were added to an A64 node, and nodes that
do set "ahb" keep working. For the reset, call the explicit
devm_reset_control_get_exclusive(), which devm_reset_control_get()
only wraps.

Fixes: 3c881e05c814 ("hwspinlock: add sun6i hardware spinlock support")
Link: https://lore.kernel.org/f720eaf9-01d0-0e57-f6bf-9aade00aafb8@linaro.org
Signed-off-by: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
---
 drivers/hwspinlock/sun6i_hwspinlock.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwspinlock/sun6i_hwspinlock.c b/drivers/hwspinlock/sun6i_hwspinlock.c
index c2d3145880..e7cc121310 100644
--- a/drivers/hwspinlock/sun6i_hwspinlock.c
+++ b/drivers/hwspinlock/sun6i_hwspinlock.c
@@ -104,14 +104,14 @@ static int sun6i_hwspinlock_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	priv->ahb_clk = devm_clk_get(&pdev->dev, "ahb");
+	priv->ahb_clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(priv->ahb_clk)) {
 		err = PTR_ERR(priv->ahb_clk);
 		dev_err(&pdev->dev, "unable to get AHB clock (%d)\n", err);
 		return err;
 	}
 
-	priv->reset = devm_reset_control_get(&pdev->dev, "ahb");
+	priv->reset = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(priv->reset))
 		return dev_err_probe(&pdev->dev, PTR_ERR(priv->reset),
 				     "unable to get reset control\n");
-- 
2.34.1

