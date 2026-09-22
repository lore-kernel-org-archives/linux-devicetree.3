Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6715158B8
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790071528; cv=none; b=NhiDCbTEnUbLqkc4Lr/MCe0iu/l9Ze7tY+1Wo9BiaHjSbZ9+YlB4PCdEG3VfF9trN+q2uJDCWmELfaZ6Lu+cWcuH7Ha4N491Ax4xsSonnTXN6ZRFbXQJwFN4ESHaAPiEOUGq9qunxk3wmIScO1EdXfrGh6LVFm0fbTC6mv6xsC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790071528; c=relaxed/simple;
	bh=X446ITTdhXRNiM7YTNEvusfu90JyYJu+Hs/1GHYcdQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uCzmEWeznJj+LLK6XkE+f4VomLfzR9dbi+up8pHHA9cw33aT+pxth22Ram4YZak6o2dHqpsvk9nyep/bW/VA06X7cVfqO9KZTsD6mW7xMayQkeeTElEAvVx6oOec+rOuU2BjMl4HQvhlnml9XtWOkOuiCHiKXGHR7whm3UF/me4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JHn2B+wx; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JHn2B+wx"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396672b2569so422337a91.3
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 03:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790071526; x=1790676326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=arHmPU1bUxWfq8Vgi76eeXWsD0/kT35HZWCoWkjs938=;
        b=JHn2B+wxgCUCR+qNTT5taEtfwRMisoJcBUkxpVmNlf885MWu5rIrbewnnwfq9mfh1/
         FB5Ku6KP+F9Cqc0lz35a1ubepCchnX3Dl+m1JXAoYJ1bmI4YaD8gwcaG2LjnYqNOrEuA
         Yihem0CVAK+aVdDUzLUDu6Esi3+KdTzL6iM47tW3tD885VorNSTt/scVUAELDjM4mdLf
         C5i1k4leBNjF1zNH6nM65yI0/xcKxtPP/71YS49e5oLz1Ij3PK7haipQHYET5IFKr7IF
         Kd3PizW4crOR15HubzP1t/nd8ij0OhxM46G826vZL7bxMJyZjWqW5K34imqjwJ29beqc
         CxUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790071526; x=1790676326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=arHmPU1bUxWfq8Vgi76eeXWsD0/kT35HZWCoWkjs938=;
        b=ASklKzfreeLPhwRUIc41j18tPcGYsq2HDsC5+TpsOSATHvGvMfttlREQwuoRVvznQN
         tGZ1AR7IFpWnuBP7bM/HkatoIbewU+O6/8vIFjAMhsz5cfBjI7cqXvGf5vq5IK3zFTuE
         Z6GcyoM5lc1EEiZ+TQ+BylawUPglwvwY2UsLEPAcYdsCZofJINAQxUG9ieR5OwIqjakT
         0Q4BfS2aGteML9M+1RZggcjZ1NAtHAJYWOyS76ppEt5Fpdfim+DcD25EDClzT4PWVMB1
         uebC3Qj67kalWpMcfaZnrmiqFqoS2eDHNxQ8YLt2GHH00cTTT/WndDK1ADkYr7RQspEJ
         9hNA==
X-Forwarded-Encrypted: i=1; AKwUvBzln/8aEyCfu2XQ6JXcWxgZedS5hYI4xyHZEbnv35ks2ZM4F0rnWgvCwUUl9IpLiVAYWr4vbHKBLFsJ@vger.kernel.org
X-Gm-Message-State: AFuF++nSeNDKlPGo1HUiDQmILeWnMc05JRC7ShBwXmiVC8ir97vNcjx7
	TCZLn+3HIqUXpX2t3j8gSCO9Cni39fNGkjSNnRjmtcf7U4WpesUu7oZ1
X-Gm-Gg: AYBFou15E+kyzbT1ZvxGQFSdwadzZJ13YZfg8jIWIlURHZx2tL22S37KLBFIwJJyyKT
	WSokag/qenJaczrwUCCoXOo5rSoxH+JLccKtxzKENWMItzmxVyJLPShZqho13iY0wKTQDl8aB/i
	KJ5ZFibZmtNZrKp9B2b235ahxA+mnnvGRqNOr2Xn0jaUwsRFPPEWySH0rbPvQ+Mf8xlxNPWL5ym
	jN+SC+ztvOJQaArxedEIkEpO9FGUIHn7B1SN8xtkmCAe6GkaUdR986FD09YyR0HIyfjdDGImZNC
	pI0FX3I7gLsPbTb5QkftjqwqCOv7xO4QyJNrtnVDSFvAMDGbu2bEwV0Q09ZDGTPqgJ3c/MwVuwy
	ywXaRUqnwpwrHOHwxR0rAch9/uggMD9RrcHA1iFUBmiFrzER3Qk3hxwiXCZgUIazc7JpqvVP1B+
	l6GBaX3Vz1LTfOgLkmavwuLLAeasz2ihes5ZEj7IpuUCwruOfj6yB9MQ6kii8B3WaDG1xVTrlel
	fn90296AEdwEPv+M4E3nR/I
X-Received: by 2002:a17:90b:2f90:b0:3a0:242e:7397 with SMTP id 98e67ed59e1d1-3a0732c5224mr1150055a91.4.1790071526290;
        Tue, 22 Sep 2026 03:05:26 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a067021ca6sm3984718a91.2.2026.09.22.03.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 03:05:24 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: arm: qcom: Add Acer Swift SFA14-11
Date: Tue, 22 Sep 2026 18:04:35 +0800
Message-ID: <20260922100501.8888-2-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922100501.8888-1-liujianfeng1994@gmail.com>
References: <20260922100501.8888-1-liujianfeng1994@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the X1E78100-based Acer Swift SFA14-11.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---

 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 5c0414d4af9b9..85e62b2c7093f 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1203,6 +1203,7 @@ properties:
 
       - items:
           - enum:
+              - acer,sfa14-11
               - medion,sprchrgd14s1
               - tuxedo,elite14gen1
           - const: qcom,x1e78100
-- 
2.47.3

