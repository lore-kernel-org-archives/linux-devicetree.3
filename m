Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D8B416CFA
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 07:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246507; cv=none; b=chpDJ1+TvB85YiyDDyMbWlm1am03U9erZ6hneUY2p6kDytqS7Sg2AlQM2dzlfSfnthkfhL2fZsjjq+ObITsysen+UyZPw7Gs3PAKqXIhAEZmsFUpbV0KZ9QRlqizwnk1ZbVSASXbBNHEdpYKHLbANRSm2b0h0XYpef6xC3VMX9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246507; c=relaxed/simple;
	bh=ifqmFvQHebUZje8XaAAuBMN9RaGf9xFULb+csDNh1fU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZweYdUIlyOwMgRKeAf7cWIflVaaffDUYtqbG9Tq2JvPnCCfYzWaznMwALeLqQjj0mGVwDq5ryuAbc19skLbWbqVDcbTJbNeKAQRf/gcmcYsyBcF/n0U7dbFHF0NL8qb26fy3EYUFJivIu1XMLBrg8gjKvBjxKCJBUphEfIKbM4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0ViJIEW; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0ViJIEW"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d72ae08fa1so37084145ad.2
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 00:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788246503; x=1788851303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5HJ3g3vUMid02qe6Hj9lnKY1TCRNcUH2lx/tar8eb9o=;
        b=U0ViJIEWb7M2VDGUGVNM2fvVDwg3cRWWP99I8Ms/4cI0FcZncO451oAiVevtR7hKLX
         5BbNOk/iNYBPmbm/lsAC/sl+uGE2YHkhV/fzsWTnYEpc/pa4UXKdPNRfdAI+nUjTvq6X
         /WTre/0uC5zyhDCyqJ4wuRYofsZwAw1dNf9bPNynTrg6a1c1d7sr92XkxrcOuwjFizzG
         ricfPMp9tPaDFEZT5anvYfNDQxrU9uhXr1xdjLqVVJhLhhgnfh1shs8dnozi22svS92a
         bGuQyE7UDrWf2zEal4X8sZxhr2kLrU+wr8ug5Vaf9aEyfW/si6LhLhM7pAceg/vtWfzK
         V6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788246503; x=1788851303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5HJ3g3vUMid02qe6Hj9lnKY1TCRNcUH2lx/tar8eb9o=;
        b=mzNo+QeOJsozY6WOs4bSdyu1YTVPkIrrICWnITO/H3oae20tbwy7McwSygHGxMVLq1
         C7p3LuUvWvlzL25I5WYGTdNQcn78oNsMPUpAGfbSb3aoSrMGB4hPdGjiqiAG+Vd34aJa
         NZ8mtmriRbkq5eyy/x7RiZazhwtndeUax+xe93o8LI/RCVmpB/+/ywfZ5scp/yNdzl/u
         9ii1wYCyFGz4+SAurp+tnvzcAs5e3JdM/z6hWQOcXm8zX+3zr7CPMCvsrBrkcu1GyLLk
         vEEbC+MjXEhGLw9ZJ/95gOy3Nsivkv5Cqb4BWgYAh6RMsYwJUZnAcfttYQvs6aqb6MK4
         jaQg==
X-Forwarded-Encrypted: i=1; AHgh+RoooxA51mH8fcRfgU5dD5zAvoRw9PsD4dEIyKqweG9ynWDdkFuuU3FlBbLCudN42wl1bt2c0xNReaRQ@vger.kernel.org
X-Gm-Message-State: AFuF++kXdi0UH1DtIGuRzezvdFt45O2kfcZSmtZHW8ALwfRziabA4lRs
	UfftFPniEoQ0k1IJ7AlEzXeHXM5ozaz9TyjhY+n0PxwNepi+LdWF+LT8
X-Gm-Gg: AR+sD13hLuM6lFoPHe7btINSBgwAOTmgv7i/OzNiv2i4sut/gEI9K38dBLsrRT4nuuo
	D9XFKbuvOmWkOgTXAeEZJFSU7VU/zcbOevLtNRvDiGV/USwlFYSaM0cvMHwz46YRmu393GDG12/
	3MUbcphBQEuEFw8Ydmd2nT2iugnbtwv8SCBOt5eaB2oFFCYM5TQ5yfvEvCuaRiP0nH31tIi+G5M
	k4XgzJt/853lzHsrp8gBfA8X9vdhGHpTvfhEDpu+KtIY7xo4PDdxqnIjgfx3fM8pxHTr20gKPMQ
	acw99fecMyKciaFxWokrrbNci2E1vdOlFkH4yqJACJVAQ17A3vp+U4cRtuUJ7PZ7H7wkvMRaaUt
	X2H79pYSnrEPX5cAkRFIwJDGebkm0pE7SE5/DNJioamzhCYzqiSoUqI1WXsMynSecmWUOZ1xktj
	1bBPnSsyYqkevNBDH3LBMSVmMjfQWzXLsQlhYRaJ6dOIhOeP0EE640lKHd0hnhrDUyJhRe1xZzH
	KE+O9TlBamf
X-Received: by 2002:a17:903:40c6:b0:2d6:3c22:99bf with SMTP id d9443c01a7336-2d94a76c15cmr81011965ad.9.1788246502985;
        Tue, 01 Sep 2026 00:08:22 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm18274680eec.1.2026.09.01.00.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:08:22 -0700 (PDT)
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
Subject: [PATCH v8 05/12] dt-bindings: clock: qcom,rpmhcc: Document RPMHCC compatible for SM7250
Date: Tue,  1 Sep 2026 07:07:10 +0000
Message-ID: <20260901070717.20513-6-sreeshankar0910@gmail.com>
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

Document RPMHCC compatible for clock rpmh driver on Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 2b446aca5..45d3cc861 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -39,6 +39,7 @@ properties:
           - qcom,sdx75-rpmh-clk
           - qcom,sm4450-rpmh-clk
           - qcom,sm6350-rpmh-clk
+          - qcom,sm7250-rpmh-clk
           - qcom,sm8150-rpmh-clk
           - qcom,sm8250-rpmh-clk
           - qcom,sm8350-rpmh-clk
-- 
2.43.0

