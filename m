Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009D14195DD
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 11:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787223857; cv=none; b=tYSQkHRTeFnIuayxWa1eBn4Ucd7OstE2IzpGPAj8AxFjZfzJPv8AlLCxHN8msGFEhvKX/RbYfD3CZsUSExIhgK/kyXw0r2viwDFQpoDGJgDyiY1QUG+9Vp8Mrn8yqt+/Tc73lTlq0JxkjBqbzKG8kNNRMK8LY+aCQKDTj0sx/hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787223857; c=relaxed/simple;
	bh=N28ryJa3YVWA1Cgupj5pKOjeNOpo+ptWos/yBchcvfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BToFNSVN/Gz2HDd+mg5V1hoNCHUIXVvqyGIiXlqPi5YB9TQOfqMGI7U8sy7qdOsdh4UI5mawS8qCD/UlKljeGPGiIdpstLlFyLTRPa0ok8uBYWbiTegT4Wx8azTE0KerT/Ph14qSCyhN42B0o4ikuqNpgpKBRvTrxc3LmmYhgqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dam4yxxJ; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dam4yxxJ"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c999f162c9aso1292446a12.3
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 04:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787223850; x=1787828650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QVAB6pL6BfDoa5OsrighnSVQ76D8cSms3sDyrNBqKNk=;
        b=dam4yxxJst81dgGeaEWMwKBUyxEunncqVwHY6TnKvEu+CBSJEU7YDo1KEY1k8w/Q4N
         dc8+HPWlWe6Zwk3WTPXDsm5F15VnZOZNi+SlV2nyMSuXI20H8FN/+LMcb5WZQdZKysPr
         BeK6z6PDRAJ88Iv8U9vJ6xXjjCAAGv6ogW4hvg6Rvgsa2vHusxbnwI/iyiCyFo4wK4OI
         Ac8dJV3uDo/Irvf+gLWEL/E9KSIYwfG+KaTHD+2Qh9i7YyKU1QIUFqqvSGfb9XpBZcUe
         CFs9BEalBBOueGLW4+nIwqgBAnw/OMLwLT0eSqjGorhHD3QlUJzV0ePJJ0xH7LDCP4j/
         auEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787223850; x=1787828650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QVAB6pL6BfDoa5OsrighnSVQ76D8cSms3sDyrNBqKNk=;
        b=j47SOlZVmik/NJ9VvXuimqp9pNYPN3DZkU+yt0Hn7vyuqqYf8Z2pllLGd0ASGlDRKH
         rJINb6pG9SR9DtWsMS3OaX6CkSHjp1vpdOHkiebtkLNXj9xoFm98Ea7u8Ln8sPJew1Zj
         0GAyc4lt+S5wR0PEnZmQew0903TgXkvkLSKqxeLbYcJ0RGNn5sKlror16WpsEmvNonx+
         KK1st4qu8EJ39Ut5zjag1PJUCwaLakwZvDiXqNFr8fUuSR44sfzcsbpWdXrukh1FhveI
         sGKieuw+QK5s6ROAUp8y09CyRKeOjL+JvsLPw2Ifm47AcfZe3avTCsPBRn7hur1rU41A
         AIMg==
X-Forwarded-Encrypted: i=1; AHgh+Ro+PF+5s8vdCVXmtM+3Mo+pF0UDbrZzY6Qn68H2FJNJhrEHZQ/QnWiprzllS4lduA5WykKVMLJNhrw7@vger.kernel.org
X-Gm-Message-State: AFuF++nMfg1f1y2e+xomC25CZGUV39rHUW3LsDMF6iFX9IvuxHUANOEZ
	YUDHOqzfPgyVHL/XrljOnpcUENjEzJRn2bL8YzKCXia/9ASAaLZYOWBI
X-Gm-Gg: AR+sD11ArjAs9tIlBKXMGB8m/J6IEQOXaKfRzGBPsoKeWMfOtmxNJbxS6rY4W4sZomV
	cf8P5jjz1n6UvXrsOrOgl+WqXh/3pnfnLnIRyNr/osScLlJOmHbbYO1+YzqfNIHemYLgV9SX/4k
	uxlDoZEzfF4BF3Z8OMHEsz94JlMVgrv8ve7iT6cG6Ysl1NdyQZ6+7f1zOGDPC6gPXPQjRBPNZbs
	4Jf3sQ25DsGOXUlXpu2AHJItCwXFIgAjsVNz16Y4PgDwBHVh6R0HYH/Hd1ERPOTSpyKuGSMPiEj
	Pc7JaDrvBipPWxIgiTfSr80JItb6fVLvgUrF6hy1RFumPsNVM+DhmAy4kGXkDGcFUzAEMARN8p1
	nUK2vhSZSHY+MY9X1TvGTlVweYthv1ah6maC9VyD5qVAntGaJOtDu5crx4ua31sz67Ksyjnzs3/
	5OxZxGwNDARdjC56TiJMnTD8l7aFl/q1k5ddGbgT2eMwZEeXEp6sE=
X-Received: by 2002:a17:90b:4cc5:b0:37c:6130:7a5b with SMTP id 98e67ed59e1d1-39580ed0a57mr23327925a91.8.1787223850387;
        Thu, 20 Aug 2026 04:04:10 -0700 (PDT)
Received: from thefoxflat ([2404:c0:7015:a156:d857:47e6:8c8a:886f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb12145sm6200668a91.4.2026.08.20.04.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 04:04:09 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Reza Kurniawan <imkyufie@gmail.com>
Subject: [PATCH v4 2/3] arm64: dts: qcom: msm8917-xiaomi-riva: Add GPIO haptic vibrator
Date: Thu, 20 Aug 2026 18:03:46 +0700
Message-ID: <20260820110347.98068-3-imkyufie@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260820110347.98068-1-imkyufie@gmail.com>
References: <20260820110347.98068-1-imkyufie@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The haptic vibrator in Xiaomi Redmi 5A is controlled through TLMM GPIO
97 and is directly powered vph_pwr.

Define the vibrator node using the "gpio-vibrator" driver.

Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
v4:
- Simplify commit title
- Add commit description

v3:
- Add vcc-supply for vibrator

 arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
index abfaae502..a066d9d7a 100644
--- a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
+++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
@@ -27,6 +27,12 @@ battery: battery {
 		charge-term-current-microamp = <60000>;
 		voltage-min-design-microvolt = <3400000>;
 	};
+
+	vibrator {
+		compatible = "gpio-vibrator";
+		enable-gpios = <&tlmm 97 GPIO_ACTIVE_HIGH>;
+		vcc-supply = <&vph_pwr>;
+	};
 };
 
 &blsp1_uart2 {
-- 
2.55.0

