Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A17A24E4AF
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 07:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786952308; cv=none; b=HT5tUDnkbKt2/pZLOKNSMTTCDVJS8A9r+dvuFzIFCNBIDdwUGNLgTAPDE2CGUUApnHOHqhududo1dJjK8RKxXwxaSlj4wZ+qTE/BUBboQSEV72YtomqGxU1rOrjkUW6ccYJzJesQe8ec7TmaQ+ysXdy7ExDrxM9oRd53oMdbr2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786952308; c=relaxed/simple;
	bh=St8ucU3ojSXInIoaRiplnocZp7Q2Y7UGXGTdomltuLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SROeE08hB8+eafHPcSWOSHczZIaus/05HJQtrYk7Rvv48Xh2LCP2KNB/bzajDqfcvG2h6nt35lRGwF/7JIKo8Ev4kaboJOCIWtxLfJeHrgIrLF5ovooNlgBukQ+kN7IV603ohp/gXrHImS2DMn9TleZ//Rgy3ILYDxsnwqVtPpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTlKXa3l; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTlKXa3l"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38759bcd877so3504987a91.2
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 00:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786952306; x=1787557106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S/HU2YPUNtFosepQ51+dsKsorbBYkh3zE8nDrxs9nac=;
        b=CTlKXa3lJQy1gm6+RhkNYGze136244NSFzlyESYgqj/F8mdyRmSkVB9K/Ruc0oYAPF
         Iq6pSrc71cfgHVFP2KfT3z5cybQg9j8pbTKdq+qYOtaYA6THS/E22rfIGzGR8IK8+L/f
         qEpuu90itRVRjYJOuLFDlV3duSlPvrHWteNVJyvLaG1H1LdVIL7DI0Z/5kKGMRBQPNS3
         GSxCQrzSgovRh0vWXxca+TrRAZkN/rIlgUEVVArbOX6siI0y6H8W27F2mKSf9/PJgOed
         6Kk3EE/XWQs+BUi7DE1PiVrkJZ0f/+ehYyrwd6lMKeE+WWNanK7OYIvJBu/dIJrJmQ5t
         RBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786952306; x=1787557106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S/HU2YPUNtFosepQ51+dsKsorbBYkh3zE8nDrxs9nac=;
        b=F0G+6toBsNozU4f/nwO/qYGth56C7NqXg9aEbfaKpecwBHp2dzX24RwWttjbsg0p1o
         CJmNYrKGAyFtQ7nlL2oKVrnCQzeItALyU8noc845InRkyvL8HRYQplpg3dAJH9GCiZWx
         mLYZqNqRy6nxnSLPaYUN9MedV+6aavrot7pFTNU8tp7S8j+vMBFHkW9wJ/nekVTjXrbt
         TCwanEm6hGzWVWN0qFvDvM8Ac/o8hBQSRLFQ12imkbMrYr2ZMDm8MqmW+4ef154S5UDr
         BYKl1p8PGT/MkgIFVaavQBCL65bw5Do1t/JLdYJ42McmbruGiGjUStLoEIEvMxUizs+U
         E/fw==
X-Forwarded-Encrypted: i=1; AHgh+RrhUQrH2xb+Ngz4fPyxAk9Df769iIQML287JpQ5O9X2LGb37KDeOT52W4AOEtFX4eKi2ordZZWOJWmI@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg0eGE8j1r++I/H5Zlz0RLOgkilOJYB5+sPrZ2/+VyYEFBZruR
	nA15edYLEWqcE5LIazFZyUgmWj/JA2n8T0dnVtdlbWjCrAWQWdM7m1n7
X-Gm-Gg: AR+sD12a1ufW7CS0YAsDDFJyVU6G8rao2KphT1dgwvMx+I/UwPZrrumXVss+nV0RoHs
	Rav7+SUANwG0BMk5CdSzCZoTQ8TGV2GBMkMOITvZea7fMNecShakLBjnzufRSQdXgXS4G8dqX/y
	FuxqvBM3zVu/zy4+L+0cF28Cg2YYm18+Npynmy8t6pwEM6LvonrsMLBL5AwgXikRyiKWWbtCSx7
	NSvMq3m3ZetPvR97YDBMZvRfXb3RxdGD+RVqR70AMsqoEBxqY4rXRHqH4toUiAU9IprCwtP2Yid
	8W5+MUBnTEys1G5XRV8olfTO3DJ2vOl3BMMdlr/3SxRvt2wL63R6bnl+OEeSdaLphBxn1CtGVwm
	beYDah8V2sQknvLS+hw3mi7E+ZbwHKKqagzJcQhrUh7JQsarDRSMVZm3D/4SVjoIhCUeP87UW+3
	rNrGuWUyU+1K65/wkgcHOwLEKBP64y8pL2JtYq6RIvCqQsQcVf6sYvh+T/Xzh9zJOsWZbIvTpVz
	N5NAgj2ozTF
X-Received: by 2002:a05:6a21:1f88:b0:3bb:2883:a723 with SMTP id adf61e73a8af0-3cc720a1c87mr24876321637.35.1786952306331;
        Mon, 17 Aug 2026 00:38:26 -0700 (PDT)
Received: from localhost.localdomain ([157.51.221.167])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267cc91278sm3359088eec.31.2026.08.17.00.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 00:38:25 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v2 2/2] soc: qcom: socinfo: Add SM7250 SoC ID
Date: Mon, 17 Aug 2026 07:37:55 +0000
Message-ID: <20260817073755.2087-3-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817073755.2087-1-sreeshankar0910@gmail.com>
References: <20260817073755.2087-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SoC ID for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index af418adad..54b1f8e1b 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -449,6 +449,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(IPQ8172) },
 	{ qcom_board_id(IPQ8173) },
 	{ qcom_board_id(IPQ8174) },
+	{ qcom_board_id(SM7250) },
 	{ qcom_board_id(IPQ6018) },
 	{ qcom_board_id(IPQ6028) },
 	{ qcom_board_id(SDM429W) },
-- 
2.43.0

