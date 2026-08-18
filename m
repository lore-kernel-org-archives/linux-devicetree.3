Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DDA41D221
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 08:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787040602; cv=none; b=JbiSLwObWGh0+sAJhBdOzxzi7idoRElkWO+3blWQHioykPGvtA1w5UUvphOBa9eRp5YB9wAKykcK46Tw6BfOCxbksI2sg5IYumUDjtMaoRyjHx+FaFSDS37QprXQ5CqR9hfLgyQgl+HoHavVTax9l3XP9ckO8TN/5HQn7FEeacI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787040602; c=relaxed/simple;
	bh=S4gVIUWwuoALYuzwzRm82WuAYzYN5KLWtNbqZ/oM/+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PWdhxjeBqdampWnHCvGapP3VyIuQaARj7FrJb4z3iLZ8U5/w3ccRYHWEPx7JL+rrdAd7oCLJR5vYDuISBCEtGtzRPSdqqYTdmKxjKhqrB5g1WVQjA3C0+RgXao4yfQF0Ua8wkC1rzN+JUbj/1giMzl4vCgSfzVhsVv6Al5U012g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZutLx8fV; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZutLx8fV"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cbee3777e1cso2448180a12.3
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 01:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787040601; x=1787645401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g3FdfDbvToHSgtTrj8YFlW83QqqTfihaw6vnLz7PZc8=;
        b=ZutLx8fVQsNjJW+UYFKcn+/9BS700/+Jxm2OVUn1IjzYxKEVD5al5vpJsPYo/nKsB5
         4IG/C814SQn+hNonVomBldnUlMeHzEGC+fddLhup4ze34KiVZTc6l9Le1S6pVa2RMWf/
         /36P0cxuIAEg2lt/ib5v+tu1C3dvI4PWcwuGGnIvEDdL71BTmnlJSWNllsrf9C7/xY3B
         FOI7eaT4/k/P69U3LmZ4B5a9FsXe1YX/zIfR1sveeycFPUjahPt/QswvWYYaYPLlteYt
         KpnYusEmyCRsxaiB5q/NjeOK2g+k3n6bUp2Pc4amf30ry4258uWaG8daInERp/qZds7Y
         33Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787040601; x=1787645401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g3FdfDbvToHSgtTrj8YFlW83QqqTfihaw6vnLz7PZc8=;
        b=KL1hpcjnN7vrTQDclyjcBHq0r0Py6ha+HmvmiDFh7xdHuEH6psMfqzatIyzsHxsPl3
         jAy3WAr5ZX1PQqk0BKGm45m8HShoNrG0q5r+cgArRQY5Dvu3jXv58IYDkb2nTa1AMg9m
         D5S9Ghz7vUVQCoPSvqt0KyhQ/xqnQpx7HPRqAGwty1KG0M9U/Scjdu1W7hFkoNquYMV+
         38vjw2YZh4kB3PZdL7MEBwjLbnNp9dUr6kT6KgF2WVoLOcM6s33opR1K8SOA0YVkUEz6
         p2jXHv692WBIevo8kiL48zPdBnitWCwmJf68NO/0LpWV6HHUwjqFpcdrqhLRSIaMGuhy
         wfcQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro3mmqMZIawBaYc6vpkOnaB6xAJlHfBmsJUFFvlNu4jVLNEI0cabp7qWzvkaTG/rsuWceYDL22x2iQ1@vger.kernel.org
X-Gm-Message-State: AOJu0YyXtjE5hBGln268DQWBlBzNM3xSwANWQuiLc7UpQwjauCDBvn6Q
	N1/4pOtP+1/mmA9m6Xw+Uo3m95jCEtR8XdefSTL9ROuP7cdX3/vlzsXi
X-Gm-Gg: AR+sD11i1HBAaOAPE+Wo0stYs89OAuplopGCVy+XroNYiGNCf3K79rLP5kD5lfRVFhy
	ereaBgkIVcAhbrdgh7cqgKBj8A22TOlH0Mfg1Y17+xFbYh+rsQJZhtRossk47pXm9UZEwK9ERIi
	QohSJQ0OiCZpKwMd7SLgXRGSdiPcYyaHfZWrIVQxq+aQGGPA6nDGQ84VvX4h38nJfSeVDrbUrqO
	U0MWuxEA1hNbXzbyP1QK1bSJrUcHGJrsktJ4oWtRUTox+xTj4h+cPLa4j/ZCgBoyutBvuKn754L
	PP7hz8n22jkd/j26Nchew/t8d6pq+z9Okhl3f069UsvOm3/yyKOGKWX86H2XzoKtvSJ8fMgpDrX
	wupkFDUDEZXa7nF5w5D3EZpRoX5eOk/iX5rH80fdcqhre8HMHnefbSc+E5nqUO/H173xAAEXKUJ
	cmBgq0APbdAlHxyV81Aom9p3B86aO7TSs/mlv7Eygbh2LEwGcuRJEI789d2fMRB0tZ4qMC+PMVP
	UbdEY00F34=
X-Received: by 2002:a05:6a21:3b4a:b0:3cc:b26a:7686 with SMTP id adf61e73a8af0-3ccb26a7a6bmr16133613637.6.1787040600556;
        Tue, 18 Aug 2026 01:10:00 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32678dd08d6sm22606290eec.4.2026.08.18.01.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:09:59 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	lpieralisi@kernel.org,
	quic_tdas@quicinc.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 11/12] dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC
Date: Tue, 18 Aug 2026 08:07:53 +0000
Message-ID: <20260818080754.4362-12-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818080754.4362-1-sreeshankar0910@gmail.com>
References: <20260818080754.4362-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the PDC block on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8162a49d4..c30b88589 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -50,6 +50,7 @@ properties:
           - qcom,sdx75-pdc
           - qcom,sm4450-pdc
           - qcom,sm6350-pdc
+          - qcom,sm7250-pdc
           - qcom,sm8150-pdc
           - qcom,sm8250-pdc
           - qcom,sm8350-pdc
-- 
2.43.0

