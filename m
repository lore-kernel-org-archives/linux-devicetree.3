Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795640077;
	b=wnH28cWMWTQRgRx+HyDAI/5Gv1SqVwPXJhEb3uFQbPR9db5/wvBPe5ycyWZ08Xvcx7Ff
	 7JK8Bg7QBL7ZGr8f3zJln5TzQ3xx3jJWbN5FlIYS1z55Bc2hgSS4ivrkinRkdb1D+Isdm
	 KcVNJmf8lJGKORE+Abb164tX5MLQjMiNpR84yBU97JzBYuAA9q9tboexo+q5SPyJcqf/9
	 bkU0JDnF8i/JjXuW7cxpXtJgViHAzT77m+n+Ok9BkEHvr8yRmwdlyawELL5D2P4bseVUz
	 C0IoTAZ0teUie6J2KaikloQtVCw7j1l5X64GMcJYbgxI+NogJzXloby76etTX2tDiaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640077;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QufEL77KFv/8bAd7CFpTzBwtbJF17sNvAMP+Mxwo/G4=;
	b=kd0T6aC+1A4yluOvFeV9+5HmNvDAGNe0klGtN8KKc7P/Fat+ZEFVQZ2O9QXbENHEcCC+
	 mU19DZSUi8txaR3dIEdqcaqnUs+SLnOeIS8toTNLSsm6XKWeMYacjUaQgqa2P7lIOH4w9
	 ng+ugSNvh/hOM8104O73RLW+J9qNTVl3GXqj383E2KQIAw7f/cXiw1aMLRmKbhz5oxawE
	 uMaw6QLiK6hXeshdpBbzTUH/BW740XtBL+1xK4ayuwUSBiIdfGRf9f4umwCRahZAvIsY6
	 Ut5qio35PWV8Dzk0bpZhQCQF4UuODDYpMULy3IEwIUEjxmlUzcuQ9T7bswLf7fhyrjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UCWZumXN;
	arc=none smtp.remote-ip=209.85.208.172
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379F1606A32A
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 20:54:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 379F1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UCWZumXN
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3af959b569aso1667791fa.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795640074; x=1796244874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QufEL77KFv/8bAd7CFpTzBwtbJF17sNvAMP+Mxwo/G4=;
        b=UCWZumXNKB7VpKk1OEd6h86HAysZ3yO9N1YHh9rN/RWOjFzEKHU3RdQd9bpuGHpWOB
         MH3ZWC6SbRKqo/IiFV03pxOJYJt2iDPhmzSR1lq7IClpAxp5PodIJ3hG4NF0v8bKMF5g
         d/MtsTBs6dn8JAcP6w0BVM7Ws9eA3y5QjAAzNWD83WROs239zVht81+FBZHPr+Znfwzt
         g2qFFJDQcfGTdu5dEozMOVoHbD4+eeJXf/6UrX/qxS6XXL2yIjqEwTsqPg4ota8PUgbw
         wYX4CnGVGlagdHq+3LaIdd55pNqB3vw2ehY9wEO+LRqwRSHF2jgllbiyttSOOgEmC0J+
         QPdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795640074; x=1796244874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QufEL77KFv/8bAd7CFpTzBwtbJF17sNvAMP+Mxwo/G4=;
        b=Lt2uC4nJm9q+pFQ8dMgG+pTN1bbRrD8NOO92xnbA6RGMvhr3V1KTjef2djSp91HCco
         v7YvXMnIeY+CVV6/w8CE1cSMlHzccB7PU/1QT9nS1LgTmOk+jvAn0alY/N9RIlgJ052i
         RMysmvvynBqnNKjA7Ti4STgm741WOM2NFSQZKfdz/BgCNgLvnG1cZPsrLWodi0qNKGds
         6G0nPWKbgFSOxc1Llyin8GL68pOFFl1ukaGRjun9/JWTMmWczdGw7UzQBKWlVakIUYhh
         afkI2aheX/J14jjAyUFQBWOEP/AUTlc+2XH1v69jCFZW7lOVU0LQiHVv66JGiDqgMO2z
         CLSQ==
X-Forwarded-Encrypted: i=1; AL+hErHjLj5Gd5b6b0ZQZvlrAE02BkWdRrgXr51vuYeq9P51NcYxjLjNzI5G4bRnS5BTbFYHZPVmQNouipBp@vger.kernel.org
X-Gm-Message-State: APuU4Z/kI9mG01ZUP+XKMi6PVk54c8AcrNsEeS/EumNTGIn/ztZr0HlV
	3PsvKZTiw2kJ+j6dTT5DQKKzsLEqPk4A0CdvemTmgvajh1OV4xzx0G+H738nUvdqPzQ=
X-Gm-Gg: AZFdTZdWWOxkbxLGf6+OYxoXOHWR3sV/4vi9Mm4xnRwfF3M6FC9Lyc7Li6PpQiSqfnd
	xH5ytUfnI8aINIDCLNQQBH/+RgmZenImP6KE6oThGER4arZ1YJXcXqF8EzO2v9vT63ZSbGMU2KC
	ia3WvB13jhrB516mH6Th1ALKrrtqna1p/eriXUwpOJR1f8V0ItSJa1HE4Bt/60Z7k2/LtfuNMaJ
	LIN/heHyiDE1TPCfe9ZJaUCAfpuRAcnpxuhEOZz7OPSF3wtoBQN0uWYEn1uYS9lUekvbqgz7oNJ
	6ePPNfOztQbj986Dx9FtOMA4Ixw+x8oRPGKbo7kFjybZ3L3MhkSJSgcPCZ65SFa6YPdfkHbGAIq
	VNw7320YPb+i1DGsKyO98oj2T7i9RoJ1xVc0ACjEEMeNIOnKMxB06zqIZhDuYkWU7tjpt7Rtwtl
	aom4JtD3KgsLYkx3tFlDPzVSEt5PUX4x+dDO9pjcT7l29gKsXkNvwLRWdI0jAPizho12Nw07KP6
	VBJenxFNuiFXawKJ5s6zD9zCtixqPRXdiAEpeLy5Hp4+TwD+Diin5r3Mi7sJ7rq3OSG5iQav3Om
	NlSQDSGzU6BJKqP1nwyeRGCozb10rzOEnBh8rrS2ivjLT3nYuxvOPkpogl2M21eNhgZ33A==
X-Received: by 2002:a05:651c:e0cf:10b0:3ae:11a4:22e8 with SMTP id 38308e7fff4ca-3ae7f9b4af3mr40150491fa.1.1795640074317;
        Wed, 25 Nov 2026 12:54:34 -0800 (PST)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae805751f4sm50871441fa.40.2026.11.25.12.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:54:34 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clock: qcom,sm8450-camcc: Require required-opps on SM8650
Date: Wed, 25 Nov 2026 22:54:16 +0200
Message-ID: <20261125205417.1437355-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125205417.1437355-1-vladimir.zapolskiy@linaro.org>
References: <20261125205417.1437355-1-vladimir.zapolskiy@linaro.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SM8650 camera clock controller PLLs are powered by MXC rail, CAM_CC_PLL0
runs at 1200MHz and it requires SVS_L1 level of MXC rail. Without
required-opps property the MXC rail is voted at its lowest level only.

Commit db30c1160ca5 ("dt-bindings: clock: qcom: Drop required-opps in
required on SM8650 camcc") dropped the requirement, because the lowest
MMCX level is sufficient, and at that time the MXC power domain was not
described. Require required-opps property on SM8650 again.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../devicetree/bindings/clock/qcom,sm8450-camcc.yaml          | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index 64f5002931f2..666d2addfc85 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -87,9 +87,7 @@ allOf:
         compatible:
           not:
             contains:
-              enum:
-                - qcom,sm8475-camcc
-                - qcom,sm8650-camcc
+              const: qcom,sm8475-camcc
     then:
       required:
         - required-opps
-- 
2.53.0

