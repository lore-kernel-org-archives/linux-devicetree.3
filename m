Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835F437F75E
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 01:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790042291; cv=none; b=b3XerHReOs2IEWuKiIRk4v/KhEZCYOuLvEOaNCIwpq37gHMrEuBua/5nzAbDlk50s7rB/wAWQZyIq+1lAAmbmIBQZntk7Tb+bl8VV7NTL2rAS6Xy3oPDaqlr5ZJwzLEEPdBKLVZd82BN6w+S20/23jxTtJIALosb3qmbpzAVphM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790042291; c=relaxed/simple;
	bh=ulCX9DivHgpW5BC5fyfBvUAv6CGYle6DP695F8lkfbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HRw4qUHXFOEQu+9ZmkcjWU32a/hplCHVPn79RsXWuZ8kMlzLY0IndZQ2BkQp1uwRWUKyo50M289ewMT3Vg/GPUM8FwJp2QItRA300lUVTcv55/uGZqtFwqsMXgUkDOSF64eFFqQ7ONp1s8jMCByiF379CrxHOvwcsnDAYveuxt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VoVu9IoO; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VoVu9IoO"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-9123599f5e3so35089446d6.0
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 18:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790042289; x=1790647089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=90RAgwzAcvrx5dM1biB0Wk1pQcr+1Q3GdANhKbJFQMw=;
        b=VoVu9IoO62zh/PSeLgAr0dFtqqFjfr86F7hC26GYXojElkxxTIGiWZlclkG3Kpx34c
         56VtTueRpQnHUR0J5tNlpxxCh/VM1iU/dYNd5im0ZFX8qfEAydFPSM8z7mNxH/lQ4Oo5
         wVhuIQqvmZ0DHpErmEPyfZber6afrllA8DeU3ULq8R9dTTYP+K8/K3YhXxWEoJt+veP3
         wLdJF/rXyAZfRfxpFlUGGk0a+I4sKm3SMvo18tf2xPjbqby7paDMDsKVJ6DhXlSntSd8
         /jwiJdUO8ezaugXlAZMXG5UIV3oCCM9PbNA5sssCcdyZSjYh5Pd6lHZqNeEPYtu/9lRF
         fy9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790042289; x=1790647089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=90RAgwzAcvrx5dM1biB0Wk1pQcr+1Q3GdANhKbJFQMw=;
        b=b5yXnvXAAY4moX/ZOor2/h75nICtz87cM80SBubsALG99YR0794z+n0eiv8T3djBrG
         +pwEbYkfySU1xM7i8kMTd6CbZiGsoF1wegSICRsvt0rnnRhgYqFRctWu5PUtdYqkmVkp
         jqwOuOacz/p8xR1dR9d5S6K8kKvdYDopZdGu0kSgx2JxoSb8/3j88MjJALZGyDQQhwdL
         pdinpPgGq27SuwKYT9EnO2eupfhCm+FIjmtbTXXn0DK+Zpd+7t5OrqAmIhPPJH3B0LjI
         c5N/9PIkbZ55sH8ucLr01X11kv9giNINSU84FxbxnONJogxVh4lQ8J5zvD6beywCP8gI
         6f0Q==
X-Forwarded-Encrypted: i=1; AKwUvByWtLSqtO+YtdL405Ezmtd3PbzudGFsB9JFf/pjsQGwRDKs7CKLixsGyC+hxn1ZAGM0Euzhe3dAQW6J@vger.kernel.org
X-Gm-Message-State: AFuF++ncjTyytHzPagcTlfRMt5hbrXcofO9r4ZzLgcit4VQHTggnkG0e
	0s+7542PYSM+ilNm89vbUG2Q5hksFH6iCblYu0oD9MRnBbwQpFRe/i5L
X-Gm-Gg: AYBFou0pdg/5NpvaxPpQxn5fW0nswf1R1tuCzKolGpKCWL4Lipi09N5YzCatoRP62gF
	WbiZjIVA8Z2V+QNjG3Xv4x9rAMT4kfmdOHaBwK4+ny3IjtIek4KlPxOXTtvA4bFdzQBCKU9kbC/
	lso0cfpwcNdwUh5LNPicPLH7U07xDssAvxoUUBOWUyPYAeOrWdNST2Ew0i/9br5xEnt3bwqhq8X
	KMD7xiOnCYenWwsDFlaLBfAkXv4ZyonPbzygYnUFYTymqv5bnAipVK2TmxRutAOYcskzJGGCFoh
	lMfrpZ/x07XuFIquNTpP3EqAMVEV4iWs6LtEjzI5BSAQu22xC9ymqtqbRgorg2joMtI1dOO6dS3
	bPf454TESia/nwCu8HCbaaxbMr37K6+4im7fVqefvZnMM5x6b3X8q/wRW5oKCPXmdTqTzCbuml3
	zxvt5FezOfBsELTP4vLJz6vTFHWTyHSEbk+OkT5qzYns8EMAB4ny6RVjcaAM5BAbmiaaD0OlL8Q
	g==
X-Received: by 2002:ad4:5dea:0:b0:912:5b4e:3df8 with SMTP id 6a1803df08f44-913fc98e3f1mr33972316d6.50.1790042289461;
        Mon, 21 Sep 2026 18:58:09 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9140250b82asm4010116d6.39.2026.09.21.18.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 18:58:08 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 03/11] dt-bindings: soc: qcom: aoss: Add compatible for SDM670
Date: Mon, 21 Sep 2026 21:57:53 -0400
Message-ID: <20260922015801.32373-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922015801.32373-1-mailingradian@gmail.com>
References: <20260922015801.32373-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible for SDM670.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index d2ae2ae87a95..6672f441c20a 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -43,6 +43,7 @@ properties:
           - qcom,sc8180x-aoss-qmp
           - qcom,sc8280xp-aoss-qmp
           - qcom,sdx75-aoss-qmp
+          - qcom,sdm670-aoss-qmp
           - qcom,sdm845-aoss-qmp
           - qcom,sm6350-aoss-qmp
           - qcom,sm7150-aoss-qmp
-- 
2.55.0

