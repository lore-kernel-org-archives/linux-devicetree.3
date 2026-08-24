Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEE6420468
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 13:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787576777; cv=none; b=iYhhYofgIRIWT5IoxJHlq7OYg61Tna3dn6ZCM+TaCtUoe4zZnZ60F/J1vp/9xbydHEVbAYFYIvJ/FOU5f43rXp9LwAsWIDbRJfpdjLlglBCloiBiseMIjM8vI1yBI27/ik3TGYXLbjzb/3vil0Ljkx1CZ6cdip+34WxLv5xmWkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787576777; c=relaxed/simple;
	bh=jKh+XPUoJmr7fIpNbx8/2EaPd/67MsZW4ebNDZ/8MPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PkGPiT0foso8mnzd4lzQV696GcuDUH/tAKhb5EdjcEpbpyGz22U5fdDe8bixg7eRBp1jh/h0pG8nklT1MuHmG2+d1qSa65D288ArmoqdAh6LdFnv8z2XxTapvW4scwbDh4IrCilRrAWrBIGYXIZEX/nW6T5kvVAmy6GhrSN0D/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZUZvbRo; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZUZvbRo"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-395cf2535acso2964458a91.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787576775; x=1788181575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QQnqfdvjWzHpIFqKpmfnZN4AvVDc8IQ+C2JI25EK8GQ=;
        b=EZUZvbRou2Xr7NLyyOa9VczdO3YZSlEpiVXkPK6fzNAWVUvvpEoUZvFTezWV5v7ktJ
         jFoHb/9DORa8sTyg+yTNAoaXxgugfUDmdNCji3q8lMjHUjhR5C3Ky84112zZ9Sd0BSG2
         iaAwT6u6mXQVshuR2/o6QIpM8gRpoQThnOmtFQqnj5+0ztiSW36YggHoY1IFmsIZ2f3a
         RbnIC8qaw0p/pIi9loXDuIMKkLdVKIHqg06jXLEYg8+NsDI9TWDMxyPVTjGNJeLhL/si
         jxnyrtQkk+whJTMP3lnQ8/E0cB+fECCNSgKSA3y6hSXx8yFq+xEA01hu/Q6gGWYowr3v
         AiDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576775; x=1788181575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QQnqfdvjWzHpIFqKpmfnZN4AvVDc8IQ+C2JI25EK8GQ=;
        b=YcPwrYGPI4XgKstwA2Z5eN+hliisoezH8kXo0P0ZAKPaD9/ib63+XQzUSKiMLdianD
         OGVRR3/z7OgnjpjDen8/dLQN6GZ0ONF7LZyDHLfOjQvIeyO/YfwMOHSixom9hl8OtMIL
         wMt3qk1v+8Cu0L2wfBEJlHB65VGhQtdDiM+jp2iWkCeqCnHMLKnpll5Yn3eeI7QySo9G
         1kRF4R8+2oOWEFKEAUNJId8w/c2PUML9bml1uTs6t/6oq/ugflZcSi6SZ0h7m4L1GVg0
         eqYwyPg49jos2ZvizkAgQrHXnvsEg5om6gxsvSXayA1jET5/eW2xz6Q1+VrFg/6yjGTt
         EtUA==
X-Forwarded-Encrypted: i=1; AHgh+Rp6ZSNPv/5DrDpg3R1HBME9ejVkkLOnaDWJLfVX3Vse9UKdF8WITSV0z2zk2ZYC+C0TIfmMnTQ6S01H@vger.kernel.org
X-Gm-Message-State: AFuF++mVQFBsBpi9syTbtBhZGE//6stuAvqrORWR/ZeC+0N2AGd4ozdC
	/PV8UH+Q1zjYp0fSRYOvJJa5HLYmxgwuXOVUBAatiLDHGroIzV3XKGvX
X-Gm-Gg: AR+sD10EiXTaAdosJy+vNKVgudtM63AXmOUe0NXlfu/pbQ6md5KsZUzi6Gt517NQcgG
	VzgXz0mi0Vdt/m/avkQ3k9knnAGt/7i2sdu37cPE2UmpK8bHYvOUuu2bzLUmIoU1z989l0+4EoZ
	2UrJqyHHET7ECx3rIfxukXDBnPySO+WwKFt8Pc5ozKOPKRCAIIPsdNvyRUf3zJU6HaCBI8aC1KJ
	hMY46WMWHHQ+IZwHhhF93Brf5f04H2zTMI0a85Nu70h+J8igmBIXFJ7uqVoSwaZdnEjGCDyZECO
	esqdVgZM9ZBK6I34LdxkZTr0hAewOUnReU8Pg/NSxv/fV/tes2nYmFvQZHlSGo8YjHJBkCn9RzR
	aIlqXa92pnTrsp/LwyVHWjQmaPO41qO1Q3gh/t4su/ia7RzKkI8MKH/aD8jNKkX5s+bau2CfMuM
	eM5szOx745PNh940T0Dg8nEWkZYK2ZBVbiVIWo5bFFcZ+SQy5HrP5XXyOQyBZNI5s+V8pNFRLzH
	YPfUec+90Ec
X-Received: by 2002:a17:90b:524a:b0:380:86d8:8162 with SMTP id 98e67ed59e1d1-395a07022b9mr41041319a91.18.1787576774842;
        Mon, 24 Aug 2026 06:06:14 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f92359c9sm26409711eec.27.2026.08.24.06.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:06:14 -0700 (PDT)
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
Subject: [PATCH v5 07/13] dt-bindings: power: qcom,rpmhpd: Document RPMh power domain for SM7250
Date: Mon, 24 Aug 2026 13:04:31 +0000
Message-ID: <20260824130437.2771-8-sreeshankar0910@gmail.com>
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

Document the RPMh power domain for SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 0a45e1f55..e08441915 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -63,6 +63,7 @@ properties:
           - qcom,sm6350-rpmhpd
           - qcom,sm6375-rpmpd
           - qcom,sm7150-rpmhpd
+          - qcom,sm7250-rpmhpd
           - qcom,sm8150-rpmhpd
           - qcom,sm8250-rpmhpd
           - qcom,sm8350-rpmhpd
-- 
2.43.0

