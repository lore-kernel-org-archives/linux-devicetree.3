Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D8B321457
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 13:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787576828; cv=none; b=t3KLFWCcynOf3yjKLpzQVmrzZ/MbfkZEmhg+qRmKNdRl3Dqndr8sWVXml/Rvz2rqQHFkFbzn1IiS8j+qJhCIeF9YCEb1KW4Z6mjzBkjRpEJUHGpoZ/+PYYWMdlaXTstZIryk8U/xADKjKJmMMPXa+YBlM5dOe72OZsUJf76jIZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787576828; c=relaxed/simple;
	bh=4RIma+Y+HLa539L6LCBdujL9cmImh2ch5UAVuCX8GcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qGS1G3IOGCZj3Bg/fzgvMipRfgP6ZaxWhd1AbrZuC+zNpX4T7QHKGEixGvua2SayX8DrdpGBN274lckk1N9SmP+5rlBskKqX1bChFydvn9IS/+6xJFOOVGwXaUWcSXU4Zr90a9K6RqDuV9aF5jzi7Ci/pB31b2kGtLYeIah3NI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bffr6PrZ; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bffr6PrZ"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-44cf70de986so2302090fac.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787576826; x=1788181626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FyimhIuXwBU1D0482FUuZm2aPAmZo3McPam/rouEA1c=;
        b=Bffr6PrZnY9Goe/SQao/FHiRWG23Y7ymKvkiMomxRf20s06ddC0HX4RiTVkKPrxcJI
         rH2FyPbTO58JNxMsaiKlMYQ7xtdauRm8nekzbPqZjtOzNouCIzMrHWQ+BI7t0NknzZiy
         1zR7XXU1N8yZI+LvWHwgmw8MpadIpc/TQAiIO/MHdRdvbRbImT69AU2oU+oek9nlvHZm
         KeV8qe17+hVBq1W+TqqNATU6ZrHCiyJoY8A6yShG0O5kjFaaR3cWBBuizCPlzbK/Mins
         Gi/3Ch3p4rlJ0PNW19pYCsEpZ7Bx27v0LhpFefMnuyaFepO7X0u7Fmh81Q0hSw4r4FQL
         9qSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576826; x=1788181626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FyimhIuXwBU1D0482FUuZm2aPAmZo3McPam/rouEA1c=;
        b=U3Kr3QlsT4RaweVE1xOmMCVbkew9BiwxVmDjiCKNy1RWHdLCCPK5mFCgFxrKToG63y
         aarnszMp99O14eZvF8EsxdbG4NCG4U6tXRPOVdZPodAaOUmA6lvCDvSZHklyNN3Dke/n
         XLtLPmkyhoQxA6eWpYi5eo+cwuKBk11xUidsOPUDBeWA+mZQMJGMmJ34iiy0CdsV905K
         7+SuREAq7KKcy6XHg3pkMvVMWqiPtL+3nizw+YOjOa11/LUq4/rDi3rKls7paLo3bfHR
         u8QO9ooLikPxEwfi6qCD4JI5jKHc7jxBuWqp4EZN4Sb68YqjN20bcB7wtyeShwLB3QHz
         PGRQ==
X-Forwarded-Encrypted: i=1; AHgh+RqgBUgl8ty/nqUQrAR7Sgvg1WGVSbtFjHAk3beICPCMWwvRQSSWSu6E+ObrVeGe6pdCknvL9jdlEmX4@vger.kernel.org
X-Gm-Message-State: AFuF++lg1SuLJ6XINLne52rz7H7mNQ5kC1XEKhTIQ3wfqHvxGXjbKXJL
	Y2lB01vDwx4APM1jnjj1xfvnLQUUNsQjh86Hl5vf76xXO1aLsIhXdqyi
X-Gm-Gg: AR+sD11e+m02FhZ4I11JWRMg4nXG0TgFhm9DH1K6yqtansWMYrJRz2vimjuV6T+ugHt
	m4Ax/hEzdrYi2iwsez8VgVnO2Gm2Z3NCPt4dSn85fpKxZ1zcotQXJ3ehSkEYbWLYKbdbANm8Dud
	W5eGVNM3YwZGqQZBoBe+h8LRybXjbb6LHPDuLtDyNSn31isDfq4KCexLSNn2Cy8R55+cCjQSHRK
	Csc7Hm/Q9w6KjpdcJOUvRe1BpdpFadXDKLRtmY8jJ8oVbB0+RNLsvg60+eRqRENQM+i9V4Cw40f
	xiEHiuKvih9GDcfmc+8EQBHV7JdKeJe8FNBNiEbNM6tjQoCFT9v+em+gCGgd+YpltQyCaSySAVF
	0A+BjLbBYGhL0cxA47r0zc1TgHYiYpbASr6lX3+i1WZqaLFtcct1cZw6ovJZ1HLFEcpE6StfQgf
	bccUhHjZPdTjmJi/m9/mX+qLcUX47OZ+ZK8IxMhBxgbrewOc/g1C4SOn5SUYZuG6K8/OPYr4HdB
	FP42E70m/7OS9ktozD+PVQ=
X-Received: by 2002:a05:6820:4089:b0:6b1:37e6:92ca with SMTP id 006d021491bc7-6b16b1f9ea8mr14908866eaf.3.1787576825665;
        Mon, 24 Aug 2026 06:07:05 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f92359c9sm26409711eec.27.2026.08.24.06.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:07:05 -0700 (PDT)
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
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v5 12/13] dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
Date: Mon, 24 Aug 2026 13:04:36 +0000
Message-ID: <20260824130437.2771-13-sreeshankar0910@gmail.com>
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

Document the cpufreq hardware on the SM7250 SoC.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index 98eb36bff..2dc2c265c 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -29,6 +29,7 @@ properties:
               - qcom,sdm845-cpufreq-hw
               - qcom,sm6115-cpufreq-hw
               - qcom,sm6350-cpufreq-hw
+              - qcom,sm7250-cpufreq-hw
               - qcom,sm8150-cpufreq-hw
           - const: qcom,cpufreq-hw
 
-- 
2.43.0

