Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B993264E2
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 16:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786897130; cv=none; b=mj6A3Kn5BcGFWlGXbotcZuMZ3d+HHmd70a9iPmARnDpOZB26XdZyRjH5WUjaFRofxHHu55/bNU1+EXPAersbjE9hI6VW2JlZAXWlPpgH/6NYFwx8Aii/Zh4h/HkEBLbe6iHmEb3PyETzSfsXPSQRKoHodVOxjGSDGxCLR+X1Yd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786897130; c=relaxed/simple;
	bh=R6Ql6qBhxv8nRfMWDl4ii2I8yaMmIwHS8a/lEb+KgZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RI6IQIQOZJUwuqKIFn2j09/VsjEfFtpKDVyVNbJTy1QTiMKW+/uttc+RIqqmh5SvdgPgfezldUfqjTZzwzGc5ljKqtxbVHKpojptRM5llKQ/FTVE5rMI8piLCaQkgDssPLGiDrNEkI7flvmQSFruTPIE32cG/6Yx+TywaxzO1t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KejpLKmy; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KejpLKmy"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c9eefcf9175so2476915a12.3
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 09:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786897127; x=1787501927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xro5hLO6XYdeO9sCaq310qk5ul0LDKCYcbgwbKMsfxo=;
        b=KejpLKmyKTq6UQ8SfT9GD/OMvcAz/8cNYCIzNiGI2DMg6QqxQcVkkMjC9V1x6Iqpyt
         TjqUW1sYYcUb9em5GXd5EH41Fsk81+xpZuiVKTYUoiYjgtFiQFnbbLnofp1Wu9QD9L87
         qQBbukkV9lfwZhyEd9oJruWXttBh/og9GZ+guRlRApM1ZARDHwMxKG0S4kx1ld/J0Jvj
         CwLcDwQG9fI4QrH7WT3qlMmWPpMSbvertN+ZdOORVNkTu/AvaRVwirCB2sW3u/C8FhK6
         oHysUVgD988vLxR5woWBBApsLNx8YxT6D93quQ7+qZPMJ4i2pkglzPeRG2Psoyi7bzzj
         QxCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786897127; x=1787501927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xro5hLO6XYdeO9sCaq310qk5ul0LDKCYcbgwbKMsfxo=;
        b=r9Jop3Mt7X8LWm0amhySlF87cxU3RsKVCJFZ8zeFtTcGEDhRurL7wHhtI6mBwpGZAc
         PQe3B8JahRdBKClSuMcXUfTDaW8UFd/Y6mcuJ0L/VHmC+KrjILEe7+UUC+Doa4U83ZxD
         T/Jb5my1EQHx+dJbGqpmjFo3kx1c8fazdqnkjiDIXSOdivOcv202ZDSetew3W5YCoYrU
         QTtfc2zOkyI2ZN9GG0UzFRwLz7N/mSDB9ZFYSPyTSeIGHZufgOtwhInxiUfDtz9vCzt0
         wB2R7t8Jw6NmqAfRmwBORuP3exkcg+0jV/S2QpoLhf5rl9kkUiLKnn1xqeOARO64YQFs
         C5Aw==
X-Forwarded-Encrypted: i=1; AHgh+Rom52ZRPdTY0mHFP9+EtInWQ65Bc6BWH/jpmeXYX9pW7PZ1eZZBE+RzIS5J4UC+79DTND+ONDE3LPhE@vger.kernel.org
X-Gm-Message-State: AOJu0YxiaQGfI5cCHdfxkKgrvbTHrPvmCZ7lsHkSmH5AN5Aak6GMag9s
	9o6XvQ+ln5TUaFRtGuN4SMTa+MDQwt+v0WOxX1sgfVB6FJGMKDYvpwHy
X-Gm-Gg: AR+sD11bEBBiUZMh0ZY8CCQ5WQYIRiMXxZYZ91g8ZMHcVXRASQKnG50rUOJC7zqFOqz
	dM5fmjmu7ZSvF9opeDBhzhlhPkdEpzsdPl9oy0mfguCekz27XUdhf7iZlbuAGXDWb4Dc3ClXXSK
	mrkLWXQbYhTY+gCx0MMj1Xfzhxrml11EdEJH+srsWf6i2+1yB1TCNlTQXeqPyqggQjPEvu6k+Np
	S+gImQyPpT66dKTinYZ7lOh/zr7kkyzK72ge4hGPd3cjaL7eYCR3TX+rGt+V/cZ4VL3yQ9aOv6G
	48PR99CM5jZHMLFLCdhg5IFXVPadxBjQkMz7pkohZKSECIUfA6WPTZYOqdJKP2B2XtH6LKH/rvG
	L+yUhz3W7+iliIatQCwXLZx5LcCFTyyxuugf04A3Q8vx+fJT0keGLbXzpWRpx2A2r+ZvpTdej5j
	SLOsYJ4L6r1w4DqbPF1grZmL9E6hQNPzUWF0uqaC/F/Bjv4bUtEbjLdpcRKrxLXAKwPhVQxM06V
	yWY69fEqmsf
X-Received: by 2002:a05:6300:4c:b0:3c3:89ce:b5bc with SMTP id adf61e73a8af0-3cc71ac4503mr23228160637.15.1786897127568;
        Sun, 16 Aug 2026 09:18:47 -0700 (PDT)
Received: from localhost.localdomain ([157.51.221.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d5bd9679sm28969988eec.3.2026.08.16.09.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 09:18:46 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	tglx@kernel.org
Cc: lpieralisi@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v2 4/5] dt-bindings: firmware: qcom,scm: Document SM7250 SCM
Date: Sun, 16 Aug 2026 16:18:07 +0000
Message-ID: <20260816161808.12419-5-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260816161808.12419-1-sreeshankar0910@gmail.com>
References: <20260816161808.12419-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the SCM compatible for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 25f62bacb..7446a54eb 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -72,6 +72,7 @@ properties:
           - qcom,scm-sm6350
           - qcom,scm-sm6375
           - qcom,scm-sm7150
+          - qcom,scm-sm7250
           - qcom,scm-sm8150
           - qcom,scm-sm8250
           - qcom,scm-sm8350
-- 
2.43.0

