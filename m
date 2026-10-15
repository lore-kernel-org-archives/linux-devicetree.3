Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896053E5A2B
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 05:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792041653; cv=none; b=XVq+ocStOsO43vlM4JMiEqNcoSAAfBw0n5LXwsAhbD3ic6iKgsMDrS0hIq0qnqrvZquPRz+DKM5OvUJer5ZUiy4mvCR08Jdwk8kU8/GU39wxuUKwAROAmNrpgsfOSzSUwgMV2sBsDyIjIP72dV42W8bkj61KOLcyoycWD2ch3FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792041653; c=relaxed/simple;
	bh=6sYp6gwLdM8q2X0kWDCuDxQHrC8+z3UsdjNuoTgAQ4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o6gGGh66tdqDd1hmv9nWUKN6DzbwInUaOycsgfWt53ToTUZzb5XztLdPv5TV4PfJCU0+TfIHtnuwelkzxl87EkE1JgpXwlVfcjSk6/8Tjrvg1iCTNo6Y0uDnMUKcChp5Jt4jjpPW2rsS+V5Gwp1IXq6Hlauk9Ql2n5S9juk3BC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gTDZn2Mk; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gTDZn2Mk"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-353804b591eso8598794eec.0
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 22:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792041651; x=1792646451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jvcz145bWmmDM17NuFw1MIOBpRinQuOt1aSfmpsmn2w=;
        b=gTDZn2Mk/PS1sTuvi90n4mjXrrr2ikyhlmgrnzrZwnoZYcCVtBc7Q8gy+YzYHp7czJ
         gEEjmVsTjcC/Hccd7L0sIBTkahQcrRlb/Y2SvNN2/ka4U2GmKbpCbBGnyNHO28rRObwW
         E6/npQwf2X9LyWggYeQYSbcYND1k3JGwovcam5rOHvnctN/mpEemfuxu3T5ChrEXeUpm
         G8ZO8UVW6QCbGeSmr+i7E2tgl1iKK6xlrhvovZWeMVZ4FCV8ZmIDhZqqvgIoTOBuwvVO
         KmDtf+1CUdxS6cwN+Z05FMaDyb5TG2wBKTqXcV8Kh2HFYFyhTQMn+hA+MGLdVxR7NiXb
         mXKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792041651; x=1792646451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jvcz145bWmmDM17NuFw1MIOBpRinQuOt1aSfmpsmn2w=;
        b=d58e2d+fU7z9+a5AdBUK2fhU/IYBXLXFebKlcfYJAMzJ6MA6e7Esz1RHfJbe+oN3Fx
         zX4clg8WtKbu/hA4LKIdSP3T0+5QLLhd6F/0HcqPobtbu8s+taGtplIVm3oWZU6VcQ5p
         kOWZp/zDk7bqCAzzcee0qovrChjLXrrrpliS0dEiSFYQOqVIwnrQ5igmYaVGUELfBa+k
         pMnyvSrBHC26izUd/ABeX5XtxFbxwVScJnce8YPiABTr7o8UIJW6dgz/j6ipQmshFxeI
         3/1rU3I8ACvOY54TA9bWdHoo0bKxzKFrD1kZ9T6r+qb+yn/6hLSjqIpG9cPxI1DzHhW2
         MZJA==
X-Forwarded-Encrypted: i=1; AKwUvBxss+Z6kmoxLvQ2tPb0RTH11KRXrthIciy/x7znQ+e4xHOLRwM1en4MDSTZHN4f6oigg6LGYEgkUVmD@vger.kernel.org
X-Gm-Message-State: AFq9FYIEj/CFy83iRpBEYt94tJ6Lwruj6zetHdSaO0OHQI27UKPWoFOZ
	STfo9XBnmqNKDxhNdUBZKBsvl2W9sUdCQXToSpji/BMfL5kGertfL3hh
X-Gm-Gg: AYBFou1AZscaA1K8fZTuqO8yQaC50GHEznnEov159fgIxIRoujHtCP4etzCQryLFrEy
	+Gdl+spYvGvBeSH94JBwv+VNuiONHpxr0LnvjH6NJuW+8RTzB94aSziwJtb57kDZ6fwoofiTRlI
	i37mDo81vyTe2Blhli/vTyigXLH9xE7dhHxubrY/smVsxPzRCH+3Z4BqB6cJqa+bgtCt4crFZEU
	BxwmasdwpSVmW4tzV3XwyBU8ZYOgCLTIoCuiBjUx66YBcX7FjxJXu2i8OUFAPBwyB+LzUvndbbh
	CpIaiXSFLN4aGAmCwyeOyxVLvHuDK+pHIbEQNaS7mQBO1DwF+0hzvJdunj2WoF8nTEaQ1dxrKHf
	uPAKpjFNHW2+H5/54alrT7FDtzQV/D7SX2kQEp3y+KkajaFA1xSa5D1ZpZlQvkugl2tcYAzQ9WA
	q97ZXJYeWRMAyIXNMzoRDXbKMYEjFLbnp78+0TPkFN4oMzJH15KdAxz0+2mR9AzRsGEz3L72Z5s
	4kh2oAKmnGe9H/RNMPNq2XOP1H3bZoyADmGXD4P1fr46dkgtZEh+uE=
X-Received: by 2002:a05:7301:6e98:b0:33c:e74:4624 with SMTP id 5a478bee46e88-3537e112919mr25527157eec.27.1792041651470;
        Wed, 14 Oct 2026 22:20:51 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35de709d928sm12923112eec.25.2026.10.14.22.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:20:50 -0700 (PDT)
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
	tglx@kernel.org
Cc: radu@rendec.net,
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
Subject: [PATCH v10 4/6] dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC
Date: Thu, 15 Oct 2026 05:19:24 +0000
Message-ID: <20261015051926.13752-5-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015051926.13752-1-sreeshankar0910@gmail.com>
References: <20261015051926.13752-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the PDC block on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

