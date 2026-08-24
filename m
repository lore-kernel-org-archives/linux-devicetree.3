Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA12367B71
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 15:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787583766; cv=none; b=VVAkIA/hI7ip37w8tmUK2ibncyFjHielcUxMMFeMYHHeucn+KvcGxDv24guVotLJzCzt2IuQUfoYD5gxDB08k83lLkhLEEt/EXUoVckVWb+bKVpKMzj9D1ZuNgIs9CMG1WW4RpNWxBqtEcl9eVsF4MiPAt6h48IYaXMvtfX5hWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787583766; c=relaxed/simple;
	bh=HpzD8eE93G0QF+A2LkG7W4+8iO6y5XPc4Rl8E5Fjv8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E7sEV4JvL441SIES2i/nT60yNv7QqVCrw7eyYRS9ocUPbFOx9QLdbGrqqGf/4ONyOI11FFOz4JfpBDqo+qMAWSY/NgtCYEzpMv5m9aQQ5TgT1expzbdOjuuftcQU/qq94P1cHB5f+VcELEvvHBg+xQnZaChDvdxVIoJuw9skWbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q+bh3Wgz; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q+bh3Wgz"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-44cf70de986so2430767fac.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787583763; x=1788188563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dCothkY1Rqth/F0B2N1+XSPKgmCrj36SkVxYCdKHFgQ=;
        b=q+bh3WgzTyTYrKZx8FVskPZ5hSB6vgMgsa8qaI2vc1PLIJrhXXW3E4ZbS0/SGrTzUw
         Ek72S14/jPC3uPZdgO5pXW1A80Q8rjNpNBFUVxuwysCYoDPb62mdC+a1I7Tmh0FtbSce
         RYVf4DrJh6vI2fkpf0FrYF3gNjH8+mNAh528tppZmAbWOZxRE5vMZrmCclT2fXrdiCRq
         cDQYHaQi5Vgbi2LY9PePBwzlYe0DMqeL1VFsxh03Fqz2/0VQlRwUxzEzD/hQE50Kvo6v
         5EVk89sUZcg+uRyHyTSm8TQ3LgU9zVWSMnzLHtNhart314S2m2laBm1RmeKQp1/nc2Y1
         SocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787583763; x=1788188563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dCothkY1Rqth/F0B2N1+XSPKgmCrj36SkVxYCdKHFgQ=;
        b=Ql6FbegxSOgkhsKV5kKW2UtKlJoGp/LMrdTSfyH6tL7ekvvAokKNtiaAGEBc6jKSmH
         QMqkY7SJIQrGLd0ybNzC+ojklX7FoyQWztSz2Bws1h+GIjNgmEpNekPgqNdhhlxP+Qtt
         P9RKsUvBB6wEKc9crTnnBnAoGVymrCDp1a2nsKgatKsAZTji36xvsRMKH0d+chRjPh6G
         1dSDS6I80GHhgpaQb7611AQpFhZe1Gn7ws+r5sVguBA4DNvspuUdHUVNEi+N3yAB5ir6
         UN9ywx3NpZ9EqswMrJVbgMFB4LoIUhT9NH4XTJdx3IwiQ3kNVWfb0WSz7DhuUw25JWWI
         xw4A==
X-Forwarded-Encrypted: i=1; AHgh+Roi6SjAmkFEbk7L2xYjd2U80Ms888pw9RQg45OUMQL6lexJj0dccfrveOAi8sSACQzRfw19MDDjZxCa@vger.kernel.org
X-Gm-Message-State: AFuF++lr8V7cDmIuSzmJlTnrQlI/8MHzAkOSFSW0CeApeE5J2KgLbCnV
	ckBn/GsbbBpVH7F+5oPJCzt8inqPzEAsz4Spv1bg8kHBLxH3WTWFmK9z
X-Gm-Gg: AR+sD13W+rFkIRUN7JPIvEL8A9eUiwtIa22srjSWVd+I2pFRymhJDYDFrBWloburvC3
	9Wc5wCfnpPOdh7kH/T3Wu85EJ3jSxO1OyWkFcRe6bGocMpGc4+rUWvmeqN9gMT8KLFdhktPaB25
	nW2iTVkhsw4vnPY884bs/zRbcC2yr4J0sFUcG5nnGxOwEz8T1yo1MJWYa0xaHZj7TOyNllH8HQE
	b9Kj9NvHO1tNThoAb2wLiDkfLhIJttfoxYL75JVrwxcu4JtIx3b+2X+Ik9yqRFnraUcABwdYXCx
	ZrJu7gfWfi3BXJOnuFjUCyjns0A9tLNtdml2WOTaigX49I8j/N9D/RE0RrVIfB80OgAdVn5VY2M
	X7ZcakCPhN0ptOoae3PwGixXlVfn6/IzOApHHnqPNfbOtWKycrxvpEwVT5RX0JtBavVYjtviHA4
	WaMX6eAm+aMKLhx8CdK1KrT5qy/B6v8OAbtz/i/4+k9hRPs8AHZgyhI+JFZ5M/YZ34Hf1zhBTT/
	8J3RY9iLjxz
X-Received: by 2002:a05:6820:2f04:b0:6b1:4147:4e16 with SMTP id 006d021491bc7-6b16b39a036mr12301671eaf.22.1787583763368;
        Mon, 24 Aug 2026 08:02:43 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d381csm30035247eec.19.2026.08.24.08.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:02:41 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	lpieralisi@kernel.org,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v6 02/13] soc: qcom: socinfo: Add SM7250 SoC ID
Date: Mon, 24 Aug 2026 15:01:45 +0000
Message-ID: <20260824150156.1310-3-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824150156.1310-1-sreeshankar0910@gmail.com>
References: <20260824150156.1310-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SoC ID for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 1836e226a..63ee5cd56 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -450,6 +450,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(IPQ8172) },
 	{ qcom_board_id(IPQ8173) },
 	{ qcom_board_id(IPQ8174) },
+	{ qcom_board_id(SM7250) },
 	{ qcom_board_id(IPQ6018) },
 	{ qcom_board_id(IPQ6028) },
 	{ qcom_board_id(SDM429W) },
-- 
2.43.0

