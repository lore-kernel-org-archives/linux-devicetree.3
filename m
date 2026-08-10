Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB963BE17E
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 10:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786359234; cv=none; b=GpjVYVLvqoVlg3o/AFIO1jpc0gbD8JMQfur8qlSlw1SWk98mHKsrm/Wd1hnyELlVdGQZdph27aDfjZmz2MA7Ss8R/TeWLTm83WJ3C2l1A4yxIVIZ5TkVYDy4TaCUDyUR3jC/PeGkkpueAgnngLIQNFMDqwvVM25s5M/1rUCxzqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786359234; c=relaxed/simple;
	bh=RkuPU+szxSRPLV8KTuj8qDOUbDRUGKXjs8KU3FAuvSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MbaP8nQwU9qlf7zRPU9RwfTDkDcfXuIgCls8KquY5fyH7XfOuyEK9gm367CvR1mKxVCa3n84Uxjfw11CSaFhcJu3hf5s24gXxFhy8ATdYE3jgqOGy/JPS2iFOHT7UIuDB0suKABUympAokPAWuL3l3q8AQXtus7ZrgETIY1EihA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kpjxpqlo; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kpjxpqlo"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cea3004256so20874105ad.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 03:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786359232; x=1786964032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v/6jA0iwEsO1NI5+qHVdBrDXRWsEHwRKhdyQ9tPIjyM=;
        b=kpjxpqlo7I3SyUgiwsnXSlaa3DV9tANwR3zoyr4Ota+Z9mw+Sd/4I6XdJ88qSIYiH6
         sEPZQnFxrlFxgVpwJO9xVfxKHeVgnQT5MsJcRJDqeqndr1qzdDJsfLdHBLW7g2E+DOr9
         vAJ9m37agKevWFo8a0PG1ePFBXVWTSIVp1Z9RdrssbCFFe5BuxuxrtVLzq2+GMSma9ll
         Bxn2T4vplLpI2ZWPvRAe6jYeWF9ix9zOGkiYWcHZRdScgXaFATJwFH0gzziB4yywExUe
         qqHNRfOpKvw7JuEXeqWs7mWU1lquBCS63cDfBFsTuDq2qh8e9BzrTDRNdmwuXVKRKzkk
         CZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786359232; x=1786964032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v/6jA0iwEsO1NI5+qHVdBrDXRWsEHwRKhdyQ9tPIjyM=;
        b=cCjPJ5LJHpFMxvwA4oMzbyKlISUO7Y/fOQyZt9bVDKH/nUla+kSwTRgoBpXJrJt2dS
         +gxCnjvFz6rBjbSJTPmPcGqxBOWjRgNtCDjp4m2g3bWC2N/fQ7dRuaZJtvJ8ngAul1iM
         nt2yn4PdanxI+7YQ7W1rwSegm7lwkcKkbaFfFwonxESkcBSS9Qh4mFWwo++2FCBKycll
         VP2xE0gJ/YlUsYYiTCWbI6ezPrjdv4I5u+TmPt7jEovk6xLmcjd//xHArGuXMq8Up0gS
         acogk36DDJLlqFWsb0jM0UeibkjEmM7Gq/sHdMTZQkeeNH287gG2pjZmEm/wVQSpmAyA
         Cfgw==
X-Forwarded-Encrypted: i=1; AHgh+Rq76WhnNSwcygK9UjzMTPlgzx9vm8I6adtcM7GJn7znCya/ntE7IPF1XT0Oy13zok2iyMPHQsriwE+g@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv6830OutS8njoHIaxhWWmOXsik7B3dVuj/vAIG9wghhhhOqf5
	ABSZsI4FUl4SfAZckR5sPK4eIglgHj3OqTsaf2O39nELgudfWGYZbY3Y
X-Gm-Gg: AR+sD10j8+5lHSj8bS8BhMC0akIIUxjqASFu4dsclIIawuwDYfd8p2kZ49Pv9Vjnzio
	hdEOt5ljZ3QDjcQ1tSS4p2LmBZ1FqhPB54xf4FihbDYC5zL8t5PFMsp5n4U03hMiMIBPt2mTQ8A
	N9ZuuiT85bbfeMHsncDKc5xCCDkLxuuhYOUkR1Mnf0lOY1HxqLgrKK2TtH3u+2q12v6/diZTD6Y
	oqGvTjfbg1cPMtTYcfgFFluYpC9yw9AlLEZTMtHvg4atn8DhK8I+rG7RAt5MAQUWKXzs/Ah8YU5
	RlL1hCMR+RBov/CXdyGnzlqn2AoeDccYnWelurU3K325Q+/y2SqPKaH02c31dJQaVkyjffPo5Dv
	3+FBv/Bf2Vp4C/sT8iMv8QBK/iZjnCilU20UiWnc8Do16fMu9I3N/aZ9uscrBZOOLP7T1J6DvT9
	E8AljjKn2tPO1G/RjzppeQZ3oIS9IfRnGI4YC0WwV2mo2oc2EtLp4=
X-Received: by 2002:a17:903:943:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2d0ca770d5bmr492858775ad.13.1786359232472;
        Mon, 10 Aug 2026 03:53:52 -0700 (PDT)
Received: from thefoxflat ([2404:c0:7028:5cc2:57f2:a6e1:6be7:bb30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d15ebfcb2fsm32890075ad.55.2026.08.10.03.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 03:53:51 -0700 (PDT)
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
Subject: [PATCH v2 1/3] arm64: dts: qcom: Add UART support for Xiaomi Redmi 5A (riva)
Date: Mon, 10 Aug 2026 17:53:35 +0700
Message-ID: <20260810105337.855546-2-imkyufie@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260810105337.855546-1-imkyufie@gmail.com>
References: <20260810105337.855546-1-imkyufie@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
index 4ea4fbdb5..abfaae502 100644
--- a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
+++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
@@ -13,6 +13,10 @@ / {
 
 	qcom,board-id = <0x1000b 1>, <0x1000b 2>;
 
+	chosen {
+		stdout-path = &blsp1_uart2;
+	};
+
 	battery: battery {
 		compatible = "simple-battery";
 		charge-full-design-microamp-hours = <3000000>;
@@ -25,6 +29,10 @@ battery: battery {
 	};
 };
 
+&blsp1_uart2 {
+	status = "okay";
+};
+
 &blsp2_i2c1 {
 	status = "okay";
 
-- 
2.55.0

