Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9238B321457
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 13:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787576725; cv=none; b=YztQq/eSTp5ySoQU1N0q9y1xkHh77oN/9kFvl3BvXe5Ddo8AS2lTrUv3MTCMo/Dh/wpNPPWxNLb3QqMAnNXF7kmedD0/4R0meSJbcUZLH4q/Dc46tnN6BWcMtJGEUIhMpFtiLag1wUgKQg8FGHFcI45m0XNMtOva99XGuBrbtgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787576725; c=relaxed/simple;
	bh=0wB3huwwaG49ycl517NSgfQ5t7SptdZ6MYz/Al88uo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G74xY7FkeCHDPWACV0uY8CYZR5zZ1BBlhBycDCJUkut8Q79YuZKc47WWMRQbT2HCCT/CD6B5OSIb0THjCT1Fd6vP3JPcaupfYs+G7UeKs6YmotjuWntt7De+pEG+dRMjyVul3B5xG5nPiHykkhHHc0lX5aIPylKEAagZBW1h1Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TQ5hszws; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TQ5hszws"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7e9ecb1e13cso5457954a34.3
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787576721; x=1788181521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mvJP88qTTuZPBMVLY1eZgRPCHAr9o03VzsEiEHnDVHs=;
        b=TQ5hszwsadExAZ/HgzBagiaYn1wZ2NWrPaj8sBg36pMmNwsmhWLSS5qIBL3Ls3tMsf
         wVmBlq5gGEMy+CbP3tXZTb3J7uIpRxlW3aZ/moH1cVCDCS94RTMeyCGKoJ0OjYkC4G9l
         Gsv6c0RgCKM9bafNWC3FmcRL3vN8H3yhj7n+anve+JH8meFARlwsjt/7ptiPSxjorNXW
         OwiBvruGYrU/Bo7EACrx/NTejhIHFaO4gzaprT0QIb9Tfu/FzofwxDxiNnMQ9aS0Ue9k
         i2IGMQ4tMQeSz6J0UBJFVvM2VsAcpluiTbUlm5RMqsJKkRsdy322dsRySdFkPz0EGpCZ
         sADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576721; x=1788181521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mvJP88qTTuZPBMVLY1eZgRPCHAr9o03VzsEiEHnDVHs=;
        b=lyeQLXr/Vzn96VPYtxxlrGvmMDLV6hnFg8oP0DeIQqWdIl2pw5wBBJj/6oVK10jIMM
         GH3ON0Us+R7uV3+tNoA+mi2dq/auChF8eOVwLbimW5fk7P/RghJ3X6Zw4noDKNJLWlYk
         330sUs3IS214KYG1cPixcmp15ECOYf0xwk67Ov3UiyY+hhp4PbH8V0ik8qZ43kZ9vprw
         paJvYHVfEYRZfNt8H2u09nCEWkgWayI1b8otdoT1x0pomzFGgwX1fNlN789oEDmqWMqI
         QsRpv6yDHi3++hzW6ossPzgV5fOlV5hnVqTZF95TEcUZC0VvdixtF9bpx3AJI0UQ70zj
         yRLA==
X-Forwarded-Encrypted: i=1; AHgh+RqtqfNYH22fK4W8yTDOEv/iAUNw8kt/qyeejIz6Da4oFbdtVVZoFrLf+A1l3qYfgHsh4ABX3BnM9JA9@vger.kernel.org
X-Gm-Message-State: AFuF++lrtfR9acdMH24ZiZvb3MIhXGanTs7tz1ufIffEOrq/+URnKf+v
	mpWRpnqZPs1C8Cc0O9C+XMo1X82AyTqGsjLO71jSU8QmhgODEfdchcYM
X-Gm-Gg: AR+sD11cwKsmpTXCagDTpbFrNfeDpIbSugtYPG3e57NPkELXcODF7d7cOX9EG+X23SE
	CBxoFPYGhaLqPE3h+8lYVUiLJfvdeAK8ffqDbWqSjQQDW34Pefu1/hNGuVJug6M0Ve9su5jOrZu
	GKnE9VM2fye8eYeajLUW6v6dPgBAORqQ/emDNJIjD29+V1Vx30Nlr/HNwALHhX8oinkbvqHjEQQ
	aYSaEqwgeioGMtwCzWo52dJ2aj+Fs4QTChZytzJfaP5gs1WTVx7XVZc4BjGi0fy0BbkjGIMQXam
	+Baf6ArOXGI5bUYjrznBBDfb4LSxf/1Ov9BQg9Zv0o9/bRSJG8I3b+rlVuHOxR47HkRUB5DqnyS
	3AKygj4ceM1F4XztxUOVXszdDW+/IeubFAZ9Kyf83/HkbMkVbLZDSX2JfUIkr5fiHSdj19qrMkp
	DLvlYs44+9evia/A2vYeUxyFEbGZ6MFBogshSl5bzev7Yc/v0v2OA3BNFthWNnJRfv2t9D/s1B3
	M/wviqb2P9l
X-Received: by 2002:a05:6820:1629:b0:6b1:7ee2:6d42 with SMTP id 006d021491bc7-6b17ee28ef3mr6476143eaf.27.1787576721331;
        Mon, 24 Aug 2026 06:05:21 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f92359c9sm26409711eec.27.2026.08.24.06.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:05:20 -0700 (PDT)
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
Subject: [PATCH v5 02/13] soc: qcom: socinfo: Add SM7250 SoC ID
Date: Mon, 24 Aug 2026 13:04:26 +0000
Message-ID: <20260824130437.2771-3-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824130437.2771-1-sreeshankar0910@gmail.com>
References: <20260824130437.2771-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SoC ID for Qualcomm SM7250 SoC.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
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

