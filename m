Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B581476079
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 15:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787153195; cv=none; b=r506JFGOtt/hqtppICBKp2T1mCkdJS75pxmmRaM5EAH3kFIhDD07GEG/VgsdbJLnRYcSsQOv9ayN0/Vb9n76+VMSRIPiD2VvlSaCcFKlkyc77D1a2EdyNkgFqiIYYwM9YS/Vgtksa9xF3/SVdD5FpX9Jkt3K6DKhd/Q4YbJ/P1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787153195; c=relaxed/simple;
	bh=N+36xrUjkOa1sFBgSJgN+WTh7PZ3GhdlZultGg/uzmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oMpCwwFY2PzgrzpAgsncjK9y/bfPsHOUIgunE7/4nUs6YNLN4SWXxj9sFaOyiUSMnxo5ylwypv86BrYYfT7fVm7vfKZ3IHK4nMBNt5m3wfBgcqudkSYQYw0te+JhjasMAqzbkMuWGHOj8KsamBC71Gg3YQ3Q4mnG5KIFBOniwW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IbvHjkvn; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IbvHjkvn"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-382ef647e20so1250874a91.1
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 08:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787153193; x=1787757993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5FGrDocbe45FnzHVdI0AJ39xfusQIB2gkHqvovUs3S0=;
        b=IbvHjkvn7Jes6Hy8Y30bWuJBvBh+Ic0voURZ8J9Ptrq+o7Fo7ZPOiD+ERrnkeSpJ5C
         imNpKB7+1yiiWLHN1q8XG+kWOPmvISVwMVJWTAfKf9wcZHIie5DibOwpDERTz54xOhJt
         onDQRDOxDRtXYEkoXXzuKy8CFc/GX1uNftG4/Lq/z12PwFSGu7Wux82gFxK1Za7mf6aS
         Kd/spScH64RkBUH0aqF0bQlSFzpHLT7ITLCf0pfqRJmK/0qjhCi/cg7jMWDDoSTmCwL4
         4EKaG3H5PaZ8fnKZSIpR9emMD7Fm0bdyI4J7rShPC7fNdynl/708YayLUSLcawqjJK+u
         g5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787153193; x=1787757993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5FGrDocbe45FnzHVdI0AJ39xfusQIB2gkHqvovUs3S0=;
        b=GUaZeVtfIRnfElA++WWSU1YBUrZaPC5RIzQDU4b9cBVSMT71iXgm/e/KrLonZk6CRD
         aLOD3nNvnm8O8SybBj8/nwwqR3d7zPUsHknWdx+i5EcSG1+EaJGOmVtPoahGGSB9Uq/C
         XSV6QytHj7O+fYD7xSwUufrzno1/Otxdw/y0o7c9G9WvEfazwPZHgkbWMvxIGeqaNVmm
         CVq56nS48fJsBwoapqKCGaOYf7y/oWGGBYgLCT3T31ODtzwKSJzctX6+AtkbElJ4hXg2
         l2QrC/2/6jSmBepr+805bokWcuuifZovEhSh+tSb7mbXl2vYmYXVaFaTPqi8vH+ND6SR
         B2WA==
X-Forwarded-Encrypted: i=1; AHgh+RqIG/TD87jdNJ3btNTcfw+eo+xmQJDzKB/xcM7LEogXdKnR8CA5X7yxWvPYgs8eboifRfxjZA8nm3tZ@vger.kernel.org
X-Gm-Message-State: AFuF++nlBCJepTaIH/yEGFSDxKfWYGCg+EPHuofJPCWzpa1UUzW6IHn5
	nG1T1sOUv7bR76ux+XrRwN7HF9BVfZqziN4MBzwBdDE1yuKWAz2GxO2z
X-Gm-Gg: AR+sD11zq0EkqvFeLA1yb+batVXz4M0/eQ+QIL2eFKuPHtkfNSVhx1LBRJiPBuZf7aw
	zlHeFoRVoHTMbVoZ9RjfYT9NC95NcDxHsuLqbCNAzwx3rhKYqJ/MfVa3bdR+JgN/0YQAgpVF9po
	cTdzwu+r8v40QpoRrsDMPu7q2kcdsZ0y7wHXCxvuQhQsOYB9yZsdq4Vi10WJufNF6JnS1R1YyU5
	/7kf2L8vKYrq7JPovB8hvNQdG0YO1LvD0o4RuMHQRxCQp2DgpKbWREtX0NwDUprlzRdCI6z9zQO
	MZGvOaJxLoNhyKzfEMhSZL5KUhsJq7c1HbXibFLtb6+HmKISPB+b9K0zQOJdUdimtZfy9xW/csH
	BdfvytCAKrPNKnFEcV/GBQe1l6QzWQX0MbyIy0atnAEuTjxar85jqWusxz1+M4fl5zBX9ggQces
	/+xGiDA58z48lvPmSnKZExgZwl5Z2c4RAgcyGJkoZ/KW3DK94hl5l+wpwShdutOixwI2Grlyefc
	DHbEQX3XS8=
X-Received: by 2002:a17:90b:380e:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-39581212176mr9795535a91.9.1787153193270;
        Wed, 19 Aug 2026 08:26:33 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf14376asm8232838eec.24.2026.08.19.08.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:26:32 -0700 (PDT)
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
	quic_tdas@quicinc.com,
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
Subject: [PATCH v2 02/13] soc: qcom: socinfo: Add SM7250 SoC ID
Date: Wed, 19 Aug 2026 15:25:31 +0000
Message-ID: <20260819152545.3934-3-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819152545.3934-1-sreeshankar0910@gmail.com>
References: <20260819152545.3934-1-sreeshankar0910@gmail.com>
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

