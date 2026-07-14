Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2D546AF2A
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034313; cv=none; b=dePQliFJ1Xrsmmemz960ftu1/bPRFbX6L3rCXefQhWhqWmMnUaowVSm4AZSQRN9Xj9oKOb8NeSglMiWTVnHLctK6qsTBLOrCOG/6kKYqTyy2QBQpmdSmDN0yE/Q33MrUBq0cW6jl+zwXL2oU+uODkYEb+LMxtU+omYGeRb8xoh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034313; c=relaxed/simple;
	bh=236unSeVwnwnwtnjaBsb30cBdIDCZYuX+cT8wVq+Nds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KAnOiId6NosEg5MTK/OvroiRXQuqs4J1ccv77pBxal8aIJfGIrciSlS+L6y/t7FiZ7XdvMA/ODovXLNp656cY0Yt8W/zFlQNSn45XAYfTz9VCDkUKvvDDJH/20Py5dVi5uIuyrk1YOvnymHcZ8TerNOmGi2FsoMm1FPANo1stuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Efp+9Rb1; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Efp+9Rb1"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-475cb71a4ebso4093290f8f.0
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784034310; x=1784639110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3VsQ/KzpbmIPz/ijHmyGGKeW2JGVH1BkLtqfTcLEshA=;
        b=Efp+9Rb1qCcFdBUS6dI1xDjyCmHfN1Br8T8He+aHgHo/5XXK3YTcVeHsfJgtdsXTpE
         V5BUoKduBQca/qWIn7Tsz/PUQi180XgT6CsY4s3Nh1YQadqt0csXBPu1WylaL2pS+wBL
         0WTua4FFoPuxxahpgt24ljboaMvmgjeqq0MMdZ5nC/6NTzKGpc42GsnVfzvQcqxAukS0
         A73WS57hM/uW0NTqWHtLGbQHuiIukPo5tvmrkR1K1LTAN2w3hjwD4gUtxntXI6ru8kez
         qhd4p+R6TVc70jhgtdjOV8shhpEhP1iSpazdKsh8bOxDtiCCYyo55QG8Gk1BCy0tK9Zi
         Ywfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784034310; x=1784639110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3VsQ/KzpbmIPz/ijHmyGGKeW2JGVH1BkLtqfTcLEshA=;
        b=oytznwIHvNIwI3IaXJFGzA71EPnOmoqRlRiYXERX5OBp48xit5KE/T0ek2rv6PVWkF
         7DYVWiv1ee38RCrZcdMVqoLLiKBbzJtt+wSiJX5b8uz3VxA18Ts9jnCwWz9ZoLGa5ELT
         GZ5iw/zzHx6p9pY8mZnKWM48q0cAxU2Ug8LfaHCsv4MjRXNBNGvM/VfsFB6CG72DGzH+
         J+3hiZhxa0624iyYG0CIsAk8FzbVnRFpaGFzt3MRIM5VaEc1tS+4gomsYafqzbBE9k7v
         1dgJlJqgtxfz3zEC3NlCB5psoBEHNDzieOtgxgnKF/j84EVL1cr7D9mNevLIa8F4v/HT
         BFnw==
X-Forwarded-Encrypted: i=1; AHgh+RomqeRcsuzgi8++as6pPCqkOoKtIYfjtTYQehvTyPppx7Q5vZFxeoQQnf9LtvSLvSm/KPRriG2+4Lxa@vger.kernel.org
X-Gm-Message-State: AOJu0YwjvLqsRW1KcvzlC5uP28nCgVu5Zd8lUOiCu9QacB8Z0DpVdcM3
	bD4qaYH+tGRTy34OvbnToyI1wXvRiqikCZt45XIiI2RS5ryM00D5CWAO
X-Gm-Gg: AfdE7ck3kyp22i7umDlecHiYxdc+yR+ndyfPqSbgh5XSotVvHw9zs36FwFctdsBvCSl
	2IihfC+ZywgjVyJpW9jUYr0fcDP35b1KRSOd8o0piKBtF3Ec2pMHzAAmf4fcOg/bbcvHCii5gJ9
	tIkIN4fxQhkzcU0q/WIJy59XUu7GwqT1BTFrGdx5ea5qlQ7yRtExEJyZyY6tHZuF12uppaxKLFW
	czhcumgmDHrMjlmNsnk2B6ju5wYqJexQzDHeYxqxb2ZZN4doqKM3ukfLSZTswqCRbJ9OAX4a1U+
	lpdIXLJ61Aiq733sMUJFi8XS+SwmpML7emuYtPy5V0cbGBgyhWJqPMsCjrwNiow07yfqFd8zqRR
	YRSlaPXizUSx2uh/RL55V0ltdN/PNbiEbjNkbVxBQEIWZQirch7SuiAjsNVWuV6eneEraY6ylT6
	+5WV6rX99IEIPMrCCeUwV7DaXsWOPnvw==
X-Received: by 2002:a5d:59c9:0:b0:472:edc7:b4c9 with SMTP id ffacd0b85a97d-47f2dce91aemr14973551f8f.38.1784034310061;
        Tue, 14 Jul 2026 06:05:10 -0700 (PDT)
Received: from localhost.localdomain ([151.27.210.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c30a9sm7670107f8f.31.2026.07.14.06.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 06:05:09 -0700 (PDT)
From: Oleksii Onchul <oleksiionchul@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oleksii Onchul <oleksiionchul@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Add Xiaomi 11 Lite 5G NE
Date: Tue, 14 Jul 2026 14:58:05 +0200
Message-ID: <20260714125806.310708-2-oleksiionchul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260714125806.310708-1-oleksiionchul@gmail.com>
References: <20260714125806.310708-1-oleksiionchul@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible for the Xiaomi 11 Lite 5G NE, codenamed lisa,
which is based on the Qualcomm SM7325 SoC.

Signed-off-by: Oleksii Onchul <oleksiionchul@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 0b4c17419..494d1425d 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1080,6 +1080,7 @@ properties:
           - enum:
               - motorola,dubai
               - nothing,spacewar
+              - xiaomi,lisa
               - xiaomi,taoyao
           - const: qcom,sm7325
 
-- 
2.55.0

