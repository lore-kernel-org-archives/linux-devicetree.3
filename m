Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9201E3BCD36
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 10:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786359238; cv=none; b=R4BKZ+BRoTbxB8NzGHBvOk0k4/sQ+iNpiONTyWqos20PqFkru5UAKwTfMKxb/oZh1P4EZ6V8p6+2MvOlf2y2g7nlENeknC3JhIJpvS0bpALXNS0unYHZObshjv3SXy3WzXsQPWiobFJARS/TUqhqndsN/Glkc9gMn1PHHwoRKmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786359238; c=relaxed/simple;
	bh=G7eP5YCSI4SzGzvGz5kC/+b5PLqqfbdmE9HFSM6UyJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tvSTm6tLduH3pNeAKUNSxrmFR8SQVFojrkmOlSpRmUxtE7FTDXVfpOnnPhT9PwTcs8RYgEeSE5FtUFsq6giLIvKcZxJCapqlY/xuN6B5+rzvBUzJyzmdI5Ve/lgbS94fZYRE21FA9N4bxXuTPy5EiNpe024xaP9M4dEHOUXz7vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OjjzPiT6; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OjjzPiT6"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2caced6038eso17187915ad.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 03:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786359237; x=1786964037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GSJXjIpApji3JuT2njswM5BpludxNlNhNE9Knof+UR0=;
        b=OjjzPiT6ZBIb9JgJAsSrO0iNDlr+egk/fw6RJ+BAQuDnkXOIwe+f9OFW61TyF8FqIe
         rmFwXJOpgmoS212E1KizWk9dQwBcbDHAfxIhmXmNToyjhAqtA5YNTAA3/qsBCUU3nnj/
         cQstPij1d65Ue2eJf7EGh5dgk/G3+LW1bieYJWWQLsPNhBurwmw/JMMnP/qUxIdBUudp
         kfCrkJtiFc75WSQ658ji81KXWOYkuBzc7QHnrW8fibGyfzGqkR4KAME9c6poEZnVbPbj
         0X3cMhDedHt1r2rI+l88M7HOFR10Q+6ZTHWYKoajSVgkVoWgA9toKrdU8vMkZEHcQ07c
         AbiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786359237; x=1786964037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GSJXjIpApji3JuT2njswM5BpludxNlNhNE9Knof+UR0=;
        b=EWAJECZhVp3nw5+Ri1Ff9fWZgGDd10fZFuJLrqpsIL+ICb0V5nl6g0FSIsEDFMB7en
         Hu4hC/YlL04aczVxSG4yXf6Xdt2tKfmjX7HDxUlqkCwH2Gry1Z7rbjHrag1cQiDGkFHV
         hhzLBBj0M9mM9Z2Mv00AExBG44/rZMKhq/m5y65Ap30oclyOrawU4l7nNIgiN7ZhdyYF
         rFcpIKDzADxb0+I5gS488BDwn91tbNsEkeyiHAPMJhMC5az3Vxz9bHi2AV7FWGY4vf5K
         QKqGJKH55ua4WixeDXil8CWFBcIiR/A6y/cU9Mx3uEEHdq2kN6ICTnwmtcDUIdYoZudM
         SnZw==
X-Forwarded-Encrypted: i=1; AHgh+RqgujnneLBstrryvMDRv+yjbcVkmme0RA1qJLoEgsdf10e8UAvkj4KaGxlZbBtBqCTpMQ85ku8hGi+O@vger.kernel.org
X-Gm-Message-State: AOJu0YzksFNCRk9GRuEORjTgyVeOckkidsD42b9T8NZi2x/OpwMeKOZy
	s7hwLOzo3UJl9TV0LRBrzIlMQmfB+hnDW9yjYbA0FxpK2xNSCnvaiYc8
X-Gm-Gg: AR+sD13cBVCogfoVHq0KuHrUeh72DxaCTR2fFAWk7n0K4cMQQtNuzjHxUXoqt+2DkiD
	W4Re1KwsR7t7BONv3K67wgY8UReZ2hwCcHNFuPk7i6T6GxyFcXet24ocLcoZqBcgMdF3dv7FcRz
	5myOilUqXr+KzzwA9vpzf5+LnbacpU4B/Z9xtbNsDHcGyW+xGBpRPDyGiwxnV7rEnMNoHJfrYaY
	zcwMMGog+80E4B2QIUGAXWoRvVQlOfKOezys8zTNQY+oMu2PS1V+rZu+OW40YhSsXhLUY0oRY1W
	TntoBKZkH8LUEfqZh3PW5BQlcWn8ondq9E/49tW/vq5z1T3IZS1W+6j2cW7SNTdBT8GCjBz95pz
	xZveCHi9Hncv/tu/Y5gwLSVRGlcYgGv3Wdmt3xuET6lpfXcmWYXQ7zm5gZEzvYRq7jETcbDz/ZZ
	jCXmjZHXAZaboQ5G3lbH7ZV4LQQdQ6b3939rQTh0yLRjXGCYzTM/8=
X-Received: by 2002:a17:903:1a26:b0:2ce:a6a4:451b with SMTP id d9443c01a7336-2d2b2e5e230mr192870795ad.11.1786359236894;
        Mon, 10 Aug 2026 03:53:56 -0700 (PDT)
Received: from thefoxflat ([2404:c0:7028:5cc2:57f2:a6e1:6be7:bb30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d15ebfcb2fsm32890075ad.55.2026.08.10.03.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 03:53:56 -0700 (PDT)
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
Subject: [PATCH v2 2/3] arm64: dts: qcom: Add haptic vibrator support for Xiaomi Redmi 5A (riva)
Date: Mon, 10 Aug 2026 17:53:36 +0700
Message-ID: <20260810105337.855546-3-imkyufie@gmail.com>
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
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
index abfaae502..e6e708601 100644
--- a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
+++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
@@ -27,6 +27,11 @@ battery: battery {
 		charge-term-current-microamp = <60000>;
 		voltage-min-design-microvolt = <3400000>;
 	};
+
+	vibrator {
+		compatible = "gpio-vibrator";
+		enable-gpios = <&tlmm 97 GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &blsp1_uart2 {
-- 
2.55.0

