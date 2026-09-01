Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA14943DA53
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 07:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246571; cv=none; b=ALkM/E5glX6iywBKAEE7hPZG06m1XaVCf4KnCi1ieG8gVOExR2IXIXPUiWiiQiu8abDJPqIVG/Nif+OH+hIWqLtX+QRaywvFEswfy+dtwLAtUe9mb13khperPZCkZ41ra4BnMfVysugQSgZa9wNc1zzG6MJzNBtNJbvZYpoKVQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246571; c=relaxed/simple;
	bh=0S9ZiRaNeD0ONuhBWck3LZ15qfVQqVd9GHb68v++sEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M3xf+iWO4tYNN29JIcPCPJPuVhoJ4/yCH4WPNEUGkv9jQtIbnhu6+qwFfdGZu3VTwWPkCLzvX7yg+aSgMs1w0DnDM4c473VtaC8ValiWpSp5vUqF3cjbUngqLfofpQQhd3xB8RNy8ydu7O9s2SJict+gimmA6R9HVlP/EtyIeTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rPkjIEQK; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rPkjIEQK"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d8fd3b729dso23818635ad.1
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 00:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788246563; x=1788851363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=soaPR79MMoowv6/4e0ZCsyZJkdHPPam+XR34R/7HHt4=;
        b=rPkjIEQKdxLZ/sXl1sfckXlub5hLeRHLy5Vf7DydP0RRWgPmVtiTv/Bs5OF1SHHaBe
         +GXv5zKI6kNnmpMTKhFLFuPmVZhPsAIXJ5NJdeSXvRP2wZqh3mQPp1Uw9kb7Kvwrk+jF
         QlSSicUyzhoD5f1DKA0uT95cHi819y4UQOnh5Dm60fE9SM4K4LyNYJYkU1VfOufhSnZh
         U7gWpE4+g/UGi+s7G4sueh6/dTdiP8jQmc1GTZmV3XUr9/ENTel1GdJ/BMRjnyTxrD3b
         iHRG5tMayKi17hOB8HhCiIjuhCokVNVKlKjxNSruGE/mqBaQm8f0ukqVhsNzuMGc1ABu
         sm6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788246563; x=1788851363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=soaPR79MMoowv6/4e0ZCsyZJkdHPPam+XR34R/7HHt4=;
        b=nXTafkbAzBUHx5+R7tUg+oCZFfFm7d0F+c/b9ptYZ1N4QcfJpbJj/ZZeiz9BCF80hn
         Kn3CMnZkEe6xVYC97FiMzxIiaSyyGSKy8F2tEjoqymTLd/IuCbN/NwvnEZEMqqzIM1fJ
         ErICJHld7i5r4IHt2u5cWrj03bTv9ye72oVuiA3O/vYrIv7nwRqpafvrmHavX4VJxyX/
         aRIBhysZPhDPPTZT4c1rJcup/EBE5HfB1gVAxzV/4TcmKWuEpnr04zXjzXFmLb4uF02k
         4iIyXHA7JyMZtyLYWOvVgCZ4L03blBIftgstipucJXut8aBtnfN2rSYvcD0Q9+s6vM7M
         Ei4g==
X-Forwarded-Encrypted: i=1; AHgh+RqeyhEmfnTG5qEKMVeNy1hPJPllb32CJ1BiSw2uyEf9R/vpKY2Lj05VBg7bqKYt3S5t77q9z8S9Rodt@vger.kernel.org
X-Gm-Message-State: AFuF++nZzaFtlFi/X4b9sROm/SVFeoVfoUZASEG+eoJSSFh5eiegvRVR
	1JGI09rJvVvqVhwAt+MJKQV7dlBRrpmDzwUr9YCmo2Yj/BzrZGnW/N2O
X-Gm-Gg: AR+sD12c+DTvx55ZZdFoPt3voGJ7VSnZHXw7fpn8qzauYuXQpCa4zHrnbicSFLj5DV/
	X9dODxxqUFNqsh+A2d3hV1AXYd4GGCo+CRDJMtS67ij0Wyx44IxxFUuyQ8NLFLFNQk7sh5dAbuw
	fxHUtfmBcJBrmW1/jkXQpkgmy5skHamSpS1+vKiFmuWImmiYZhE1eLyvOAuc9AzO8+Pk5FNPzpE
	fR4WI/OvM7HgyXqRVdlT+tCA5P6SLm6z2RrcsHr9LlpoRQsZBiZatxUAWmgSHLCF8FDDFOHWjHU
	L5hxcRKmoT31VWhd5CNCW/MFHof0DX3OfDJRydmi0RCm7/Ta6KZTVhBHjn6YfRQzbi4Ppb9khDz
	uPbmhKZsHz+X4cQdvEYb+hE81KsQuFTVp917LAWsIlUJ83wfqWoTHqXfpwrcimwGE/QdWhztfoq
	gQd1WcYIvQnHiLuRyMMGbaFycBHjJMfBOGwe4ICE7+kdPl8qarwHQ5w2iANk5DjuqpBiLguIRbh
	kaA3WjWUgGU
X-Received: by 2002:a17:902:d48b:b0:2d6:e401:9676 with SMTP id d9443c01a7336-2d94a713d37mr81458035ad.1.1788246562799;
        Tue, 01 Sep 2026 00:09:22 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm18274680eec.1.2026.09.01.00.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:09:21 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v8 11/12] dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
Date: Tue,  1 Sep 2026 07:07:16 +0000
Message-ID: <20260901070717.20513-12-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901070717.20513-1-sreeshankar0910@gmail.com>
References: <20260901070717.20513-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the cpufreq hardware on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

