Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37FD41E6C5
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 13:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787576757; cv=none; b=uhqkN7WSW6qp0L6HcumRJP9CL2YOywjKAC6LWD/3ZjrTJheUjwN7mnkK7G8IaOm78rSTjloxRBYS9jRlNcDqHdYoGs0DZ9dXIRvgnvkke6ra0KWoXsd5KwrfpCexqAbBKAzH0hNBKOhulX8uADr1Ew8Rp1PZjJ+lhQPpMzdCt10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787576757; c=relaxed/simple;
	bh=nZLd8IMnK+qlnesykBsMlKugO6FZefT2Z+rNkHuVLQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MKxjiOy/CGafmtwde1szcc+v52wvKc7zaVuZ0x1vihTwlulIq0P45GB4jbGI77s7RqX/xFEpCxNsb/25xxNDG6LgGn8pHzL/scJGngRWInILk/bAdJFPbW3Tk60brRN2uJ2lNSZnh6aKVlCGH4ibdBvCx0h8iqhgucyrqgVe3Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g0eK4lrn; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g0eK4lrn"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-44ae14b4fd6so1657308fac.2
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787576755; x=1788181555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ckSz6fnME6Yn3dq6dpHlPLur72/KUgppRHgWdzen3s=;
        b=g0eK4lrnbTmgX0cFesKT00oS/Qd4bZWYYQDbTcTkFiuVgMrJWkg+EP1LF6vy9jm6fK
         WlniZLkTtHnrX+AltqnwsbGJ3kxtdkETHZjQIjckkru0ncVK+bnKUIt4pI5fUkmbGUwC
         vau/xUcSETA3LrDDkKYzGhpoYONLkaiwF6z4kp1bHUxr/gQ0Whgr8sDKWTvVbgmt0JJX
         BOClbS61zurkuYemuJIOqtGDh58j8dxl9XNLrqywu4L/kpytCWPlCthL+ocwmf5bWnLy
         xurJDp/KvE/gmAONkItd4+wibFKszjyvozzrlP8Y2SBwvhZEAfDvRiKCM6F5Qugly7ZD
         vQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576755; x=1788181555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3ckSz6fnME6Yn3dq6dpHlPLur72/KUgppRHgWdzen3s=;
        b=m1lQ7P8+VhXQ4g58eMX0ywmpy7oQRsAC6Sc6Eh0XQ0cJJqGi/xpqzvcDURfaTOlD+i
         JyVAEOG+pgKVUqBCqx3FfErhHlfXT+Hp2N6qsGkXO3NduATXJjGjMUIEI0BdBQR4DgUS
         30WTaWH4mtvA5JpwJqTwSV41KqxH+k8ATBSQw7S/+HKkzHqo+ZorsTZ8aEjXxJHO/SfP
         Pw0jU3vjGowqxLvhWQ89XrekMrrccpaP9IcsXZ3s/i84loOHh+rkEPPwkawxiaw/o+oE
         XSLojB1YVPH4t4L8N0M6zz3iiDJHtz6juAcJZ72lU5PYRrCM0xCPFrFz8CRZ9Cew4Wmx
         lWRw==
X-Forwarded-Encrypted: i=1; AHgh+RreBkCUQeaFY1yUTuDsu/HtHo69Uhnbd8e1tPCBrNuqG+r4hVdwbfDsvjLiFMbecw1ro/e0otvhNVy1@vger.kernel.org
X-Gm-Message-State: AFuF++nr0B33tywOw0CKd96B8X0332pMHdunIxwgzTHWPDEgCfGLp5zf
	ha8Mo4k8WDGQYQG/qzlgdsNU/Ot3K98wLEgNl1AZKBTVAO8eAWN0PHNx
X-Gm-Gg: AR+sD11+XBvv9mEKpN9+BjSRaVhWLIsOxs73GgFAfMOKLGO8RB1sEytNjU6kmdilOy5
	vpH13v1+mFhz/uNOuMckzRKDrkVIhDOAlbAhCTQs1DpYCO44w2dt71v1vdq6ZU+rRUuQq1RUTwi
	ALq/NUeu6sm59i+uy1aZOy6dah7e/rRlcsETXO5REx/btbWXMm6AF3kFn3GTgTVEHypU9zqNB28
	JM3f1Shz/p/e84UzYV1ygjHahEuDg2v9D+pjwWUZyBllmany+jEpv3OLqT2r6qwWWqZZ/PnTG7p
	uh97qW+roqWTlpeFFSSCSiZCpXzCrvYanQmPtVghXyrYFlhnsyatI45w03rGjaVDrcbgBXV99Cy
	CxIzMHUKpx63RQ3FCsr991gpzTQM2xvjc3dAYETZXNjoSoNhd8CstYSQU6z3cFot+etwZDDYwlP
	/8TbV2mSk2NC9AtGsuOB2a5IzJHX9P3Bkp3vArnm7NEIjFo2I8VJO0uTOnJWu63DibqTLQAvS70
	B4AcriRyxJN
X-Received: by 2002:a05:6820:60b:b0:6b1:430f:1bd3 with SMTP id 006d021491bc7-6b16b1bef04mr16104300eaf.7.1787576753647;
        Mon, 24 Aug 2026 06:05:53 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f92359c9sm26409711eec.27.2026.08.24.06.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:05:53 -0700 (PDT)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 05/13] dt-bindings: clock: qcom,rpmhcc: Document RPMHCC compatible for SM7250
Date: Mon, 24 Aug 2026 13:04:29 +0000
Message-ID: <20260824130437.2771-6-sreeshankar0910@gmail.com>
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

Document RPMHCC compatible for clock rpmh driver on Qualcomm SM7250 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index d344b3386..df9e37f90 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -38,6 +38,7 @@ properties:
       - qcom,sdx75-rpmh-clk
       - qcom,sm4450-rpmh-clk
       - qcom,sm6350-rpmh-clk
+      - qcom,sm7250-rpmh-clk
       - qcom,sm8150-rpmh-clk
       - qcom,sm8250-rpmh-clk
       - qcom,sm8350-rpmh-clk
-- 
2.43.0

