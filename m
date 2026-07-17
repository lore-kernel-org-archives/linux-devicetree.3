Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C950C331237
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784288736; cv=none; b=Cx9Lql9P8dVug0Wf2ZG7t0RkxMJHn08nqfwYI26r0SvSwQadXtMZkzugr4nLhvPTgMhKzFfdWJiR1TfXUvCXsv0fVq71kRHkbN9BmT9OhZk3nOITu8VmIhzdyCHgEkfxuXVIDX/kVGzh/GqtOwsKA3C+eHJZt8UbcXPYrH9YNkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784288736; c=relaxed/simple;
	bh=Gp9rEZnBlCdYZ83KomJ1Rix6qPb0mAp0og56IEFZHZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oKu0WrgHccrgu3JTf2iT8PxcAVgol6yuOT3POAmSST8zn44YU3BLD1My7zu5TfJ572/jl1nGm0p16Ov05ivRqMSSQtqcPneIkL8TTnlSbEWmThPBc35JkYCwyebug7kQbUijt6z1sTSaqf2mSznwsC92r1Iio1K+hO/hDhmds78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=wW8YZIku; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="wW8YZIku"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so33073155e9.2
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 04:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1784288729; x=1784893529; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/4pJ9iuKTUV6iyRj89cg8Mv/REeAs+Q/BrxX8LSxG30=;
        b=wW8YZIku8uWaR2+cXIHwGaf6buawK7buWuIoJGTv41YmztDBiTJnfbIs/h5e+Yfuj9
         N1OlwaWfP/a534pEIVhiD1hqUAkyRu9GRYZ1Vbq9tA3MCkbgAOXya7ONAwsYq0R9tisx
         00d4VhfAK7VY9JyQmmygsMgV3pmR7Qy8DMiLqKbKhmagSwFnQtHmFbxPU5Rp1q+OSZH0
         4CaacT8rZu5VZUyE6gpkCF9tLJnuDoOyBLrcC6xk/EexErt7upaYMYXwhbPpnZwlg0X+
         9LXlSZPAHM6A3JAk58+3gti9Jz0zmj/wg17vgUe3w1hS6rGztq6KwEsGgEjYeZwYwMXa
         3LAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784288729; x=1784893529;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/4pJ9iuKTUV6iyRj89cg8Mv/REeAs+Q/BrxX8LSxG30=;
        b=Jlj5u1wVtu9twA4Y9HgJwJBN9C9QtjL4cNAne9VUfSV9qZygrBw1YJK6d3hQNnH/36
         9am+LryycdZGDoQPIRt5j18+xT9h5ckJdZg98HMTRyGgxDpm56sSCMo89gqmAT4Mdss4
         ILaEXwydDfNZR+3bWjWlayTL6XD2hoMA8wy2pU1p1Ab/29KA7KolokgIAYu/+Wu9HBWT
         QUOLOFo7kASvjmTWihjmgzIgkEg3YEOqrxz6KmoNw2W0mWikaPyCNnWMtLZySJQRqo5M
         JENAwZ4R/322WIe2fojeVBwwhrqmnP21Xtz5hSYGilPEOGdO4SLJNN0M0b9A3LHLo527
         I6PQ==
X-Forwarded-Encrypted: i=1; AHgh+RpDnvTHcMSGvIM5mFP2qiL9hF8LtEUgsX+t0vaVMTMJoQxS8jpFiJ+8Uwa2NekJM4HuDKotS0zQ4cfH@vger.kernel.org
X-Gm-Message-State: AOJu0YxrpkWBcvc5b2/KAdO95AjjqBLU203IoTEjjbgjZqkL2Jdh2hDA
	yEOQgJuEG1b2TOkNzgukOjXj/cTpf6t+LeDKhimM41y1eQxJsqsDJ4mYqvQocPaiM8o=
X-Gm-Gg: AfdE7cksJHV3EWH6/bpe1VoIAcgFz0V6JjEAXEwO7GXhD/pcGhH6hLtczHaACazIEFv
	9ywgQCJLMg6knAd/YWHvmBcjntGVRM97AAnaRH1sjdCoFF3PhLadjs0V4FgbN15M4Pm9Y1F25B0
	XRo7qTRB+r5IYPLww1cdI77z3TxBkzrV6456P8V+tya8z9f4acCDFKPKhNrrKr/xKeLXEoPUlkC
	0/yckPykejrjmUv9wo/4JsQIpDxoRx13m2M+xSxPdJY4G1oCnM4JdkJG1YSfk33n0n5Diu6/hjM
	H5eQXOptOvJzivY3QQ7WHLx0mrRLENo9+yHcDjMxTcWVpxFTopgvTngl3uc/cIa2r2xI+AI2rwA
	vgobfE/H2yXRnZLc9WBugSGEI+9LcCONMEM9nxR3VwVK/Zm0rWPDxU1IiJf5P8nHWo0hb8rHC/X
	x8
X-Received: by 2002:a05:600c:1c0b:b0:495:46dd:e238 with SMTP id 5b1f17b1804b1-4954a50ea30mr28928275e9.30.1784288729096;
        Fri, 17 Jul 2026 04:45:29 -0700 (PDT)
Received: from [172.18.170.139] ([185.104.138.147])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499f3f99sm41353855e9.0.2026.07.17.04.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 04:45:28 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 17 Jul 2026 13:45:02 +0200
Subject: [PATCH 1/2] dt-bindings: interconnect: qcom-bwmon: Add Milos
 cpu-bwmon compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-milos-cpu-bwmon-v1-1-dfe0bac9898c@fairphone.com>
References: <20260717-milos-cpu-bwmon-v1-0-dfe0bac9898c@fairphone.com>
In-Reply-To: <20260717-milos-cpu-bwmon-v1-0-dfe0bac9898c@fairphone.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784288726; l=940;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Gp9rEZnBlCdYZ83KomJ1Rix6qPb0mAp0og56IEFZHZg=;
 b=x5sMB4LhOoiMg6caeXJmg8aAp9bmLEHqIa7MZpv9P6PG9JcZmMQrCEpDiXG9fnuO9V391JC1i
 oULEO+qXM+lA9p1wYt8fOGCB8jyNQNP9+iHRbNR00Lyw9izp5e1ACE3
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the compatible string for the CPU-to-DDR bandwidth monitor on the
Milos SoC, which is BWMONv5.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
index c0a5e925ff95..4e33c75d9243 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
@@ -49,6 +49,7 @@ properties:
           - enum:
               - qcom,eliza-llcc-bwmon
               - qcom,hawi-llcc-bwmon
+              - qcom,milos-cpu-bwmon
               - qcom,qcs615-llcc-bwmon
               - qcom,qcs8300-llcc-bwmon
               - qcom,sa8775p-llcc-bwmon

-- 
2.55.0

