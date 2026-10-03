Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D4249E154
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 17:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050228; cv=none; b=geGA9qUDUCYgX66hZMY1lGlFxEhwbwKbH5+JAzGdaFTmdYFsYKdtAoRMxbc3J+j/gIeJ8T3AF5i11uTkbgxvd21PKDEe40Nz9eDNOtQp6P3G+K0yRemvtmPIWvUm+UodeQHRvhsfDvhF55YXDeRsOBDhe7KXyoS1LmcUmbtJmJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050228; c=relaxed/simple;
	bh=szPuGGTtfUj84/35ZxpkmuH0DFT+TU6Kk8qqWgkV31w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O5kMMMZO2ZFk7GeynBprc6vHYQNf+5P2alcBh3VayWyNs1iUdFbYUsfdWb8RUwDdOnnTVz1UKzMIyv8JClKUMgEwHlkQOO6IKa5+edLOh3B2hHtvLSh1SpuVpDpPwr1oFpxRji6y1fMQjyt6vF/l5u7G08LU1nLecw2R4gjbCj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=McQ5dTlF; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="McQ5dTlF"
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-53315c1a1d3so5640541cf.0
        for <devicetree@vger.kernel.org>; Sat, 03 Oct 2026 10:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791050226; x=1791655026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wfFIZHmAXUfUmZxw3uiwbv0WXisyRuRAzyViuEdezC8=;
        b=McQ5dTlF/jo7QBq369fX4mVlvuzNdQmwhcNH375qu5Qz196zGNfMBvYNVJ9KSFnfWW
         n1TzjupnRUu4lxb4gQqigEVR/9DHM6HJMkR0ogU+EX31kw1IS98LLOOqSPSkcww44SHB
         lg6OiuIpB+QX/zxumUGrTwSjcSCCcx0Z6hpRGtlQYo3kQE132A03T4hDZNKJ9eP37q/o
         FViVfwVVUVJeb58JKtlqyFZ0w+tqA584mlRkjB5c7NFL7FRNjnkakHmsZ49LEFgoBoa6
         Slu6uJAv+xBiL4hlFcW+hBjFIJ31rApUnpA2Pvn/IvG0gGIm5A6uOJdKWwkb0hcTcBU4
         0XNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791050226; x=1791655026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wfFIZHmAXUfUmZxw3uiwbv0WXisyRuRAzyViuEdezC8=;
        b=tKj/Y/jCU8fHVCrMIWOf+y7YOvOyT1yLDtQGPgFxd1osnufpYf/RnuEVtOCoe72Gj2
         fQkFa2aJzdv4XUNDRLoSEDXsQg7Ob+yr0l3f+I512LPeu20XLI+7S65SWRAtkuJ8gyZ0
         GeUCqSAKyrheMn/50PUgx/BzcvWTS7mMsgFzbmXJEMv8NQppN1rgliF6Jk9+fKlXvbL3
         F+OOpuFYmj+Y3D4R6/+naVmYIdkDgE+O+kxGV8auCvD+I1HEce71PICnKFJ84Bq5Jheq
         G2eh0Lyfz7NMVg7hjE3LJ8ejyGQdr99qCvgCGhFOa/gZZi8omASePWwDnpcDpiqqCZf1
         HEYA==
X-Forwarded-Encrypted: i=1; AKwUvBw0n/0vcXacAS3+bvB2vCSajOXyconsrd/D3PBaqi3Z5OxyHYqT0nsBt4+hhnsFuBRBcCJYsirPZQFR@vger.kernel.org
X-Gm-Message-State: AFuF++kOfng/r6u0IR8c8KEGml9qV2gMGUSDRmm03nVQON8qn4Cb0WjH
	ZBXWUK2A3hMaRy3Xp4MRrSDWKsMdMIwK1bt2TGnK+NWFRiPUGiE8bfe/
X-Gm-Gg: AYBFou2AjtoqLE5VTLqaRFhpkKnctGaSKOhfry3/EsD0fENLrdifMQJ6o1A+9D+ldUl
	/2N59QizQ7K/G+p2A/Q952/WoTGf+gDbKM42BGKhwdSZYbh70ymKud5g6o/1E4179eChYzLN++E
	CA4PRTLUBq84DH6iThP1zahMz8T1Ag5q0yTXg2vwFRS8CWT6wcLRRFgpQcxNv8/g1pmD5b1lhq5
	V+8bIzuG68xKwNFUFg5T9oZ3+xa+x5KjFdE+Pq1t+zaGVG0SqVoeHCTqYYvScGsxnSB3z8dX/tx
	UjGhFSctD+ggqG/Lqbs17r8d4BylEJHC1c7GwVGjwSdKp+7fUWs9OOLV1YukO2vrsxfUJkrNUYO
	te6Qu5xApT9f0gd3kZp5qdzgL/d/j07dM4bBAQgVZ0M/AoetXq37px1ODA5IfwAg78aNLZcik+O
	MMa5mHu32cTIcSPUZ7VREwSF9vW4O2LO7Whc2mtGxeLqgPOo080h2aIy3u1/8Sc+9yCy8lBd2N/
	nU=
X-Received: by 2002:a05:622a:4016:b0:535:15a9:2516 with SMTP id d75a77b69052e-53515a929f7mr42274571cf.53.1791050225789;
        Sat, 03 Oct 2026 10:57:05 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917e0b685basm49294306d6.22.2026.10.03.10.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:57:05 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 02/11] dt-bindings: mailbox: qcom: Add SDM670 APCS compatible
Date: Sat,  3 Oct 2026 13:56:50 -0400
Message-ID: <20261003175659.23536-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261003175659.23536-1-mailingradian@gmail.com>
References: <20261003175659.23536-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible for the APCS in the SDM670 SoC.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 39bc374300c3..74f24e07abc3 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -50,6 +50,7 @@ properties:
               - qcom,qcs615-apss-shared
               - qcom,sc7180-apss-shared
               - qcom,sc8180x-apss-shared
+              - qcom,sdm670-apss-shared
               - qcom,shikra-apss-shared
               - qcom,sm7150-apss-shared
               - qcom,sm8150-apss-shared
-- 
2.56.0

