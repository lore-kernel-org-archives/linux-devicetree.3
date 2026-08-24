Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A14422523
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 13:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787576817; cv=none; b=VaHTolwJcl8eTnoaF1qGhwuyt8x4HHEawvRrOsSy2e5rBF/t6kn5AQjrMLIYFRJ5IkowmEEtz0f9Czm0mKEpDO9tZR2gqr6kidLmS1TYozXXlDcWr95H6Gr9lQmjdLtqm72QdQh9oqC/SPQ0/QDpip/m0F9OvDOgCzd0BYR68xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787576817; c=relaxed/simple;
	bh=S4gVIUWwuoALYuzwzRm82WuAYzYN5KLWtNbqZ/oM/+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D/lKh3kDyuTvaxuOhbQTXU0TIHxKD6znFjpxpKJieYrkhVl6m3JEEu60/HANdPMSxIWBZjlqGYRJwjB6eG8Z3pNio0ZxsVVyKts6DIAY0TyFTmt2gB9dTbGlmxwPragi4h/alfYJkqT4I7wRHMHct6V4J/v+eq4r0mZDH28tYPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FR4ldn4+; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FR4ldn4+"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so2678686a91.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787576815; x=1788181615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g3FdfDbvToHSgtTrj8YFlW83QqqTfihaw6vnLz7PZc8=;
        b=FR4ldn4+0piraMrYiGpAT5yAvUsgGTNMIaDUDHRkGNjLabNaCiuNYz+yhgFO+uZ7KD
         ljgQklwBfFcEK9uisZYjF80BfeHVWFKfXJoXSt6Ef6aBfse63Dr+Q6gTeSG1lsiq8E1e
         A9FpuflxRcLf7WghoNBUAPW7OHg3kBuNn9/aFfdK16tJ7fSk0mLlCa0neGIue8pTbTMU
         RMr70B8unMIaTnTJSItezUK6+a6Z5pCivH/SSckiq7MTNphl9eMhDdRbxpX+8ebZfWTa
         BXPhobbTkcMwI59YLzliwRJ/mF6u/+197G/jYZN04v6fIDqX13LinD2N7HtSLEy/sYGj
         WEKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576815; x=1788181615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g3FdfDbvToHSgtTrj8YFlW83QqqTfihaw6vnLz7PZc8=;
        b=XTM+LnrhIdyz9FnpTt91Sp0jdoTRhUoal7b3hL4Su85vxVPVK7ihOUpOUgdU17jYKL
         jBq+Z0EWAdViG1+vBq4Znqiw5GZzg43jXvdD8VwphJFdFciAXnhDVqYfaC675wHmHwD8
         /l5yRayusW3xPBkL97dKKgueX/+rW51hr5LXv3240pWcb68XBv6uZ8IH8wWwkZpjojX8
         HQdX+ORJXss7mXEWLppQZH8I+1C7e7n+VJ3O3tLAeM0cKlyPEWbYSgOWAglkZRX8/VHE
         o7+RpPWhhhkSkHDFf4fNAr01q02Hhv37h/nWj3MNwaErO6Pg+LflaGyE24Dc8LbRjBIK
         VgBA==
X-Forwarded-Encrypted: i=1; AHgh+Rr0HjXRW38J6iZuzWe8MEDB+J7/3Slpd8XSdltHWsgLM5w1DzmPAPRqhOVAwPJv1AupGtvCxXXA/PLj@vger.kernel.org
X-Gm-Message-State: AFuF++mRNYmjTJ5+/iIAx1EQcXHY4sQuyHSaxmA2OeEKPT8f1pX09i26
	FhDoe2w5hUC0bch/TVlWsC6KB+9lsvd/FF62Hdj82iEdd+JrYrwc2UYx
X-Gm-Gg: AR+sD13qGJqcdOJjGGmqsGKNYSKnQ96felyxnjhwkYugupQFrFi93IRIydJG/Ys77wb
	hx9JJoa11IDKpTGg0xSPSAxiAv7TxhEA43LHIA3KaA9OJJMaMamSnVGZxwnBJYPxYWWt5XohmcE
	uY0M0do5+O4fST2Ex6pOgYu/q9dxTB1U8X9luJ72gafUGmO89tYLbdJHYJUF2zi5/bQcWsybIyJ
	S/G752F39Re8rT4HgtY15AyC29cuJZA+06CT6EGPWCyayFwlATckf9urxD2FZdIupcfH3PCogtn
	Vg8ERUjzZ1T0+rmOplfUATvHWVSBQthoLBSEpibPX2aJTTVvixcdXnaDJu11fzYs8o2p7ObXDKF
	YgLa+rOvKpNG27AAlFrWUr28vemzWne0kKZ6t3f97DDOynedlB4toa4l2X6MKKqwpdUkDCqu38A
	OIts3fjPV9pbk1/mGf8gYL+6WOAHEzWtfr6CCe7zp5XjIXhihW6/R+If7+XCVf9zXNxlGgj2fii
	zwcrX+CaN4ta3CQhssozPxR
X-Received: by 2002:a17:90b:33c2:b0:38e:c232:9d3f with SMTP id 98e67ed59e1d1-395c3597c56mr43924218a91.5.1787576815440;
        Mon, 24 Aug 2026 06:06:55 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f92359c9sm26409711eec.27.2026.08.24.06.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:06:55 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	lpieralisi@kernel.org,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v5 11/13] dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC
Date: Mon, 24 Aug 2026 13:04:35 +0000
Message-ID: <20260824130437.2771-12-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824130437.2771-1-sreeshankar0910@gmail.com>
References: <20260824130437.2771-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the PDC block on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8162a49d4..c30b88589 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -50,6 +50,7 @@ properties:
           - qcom,sdx75-pdc
           - qcom,sm4450-pdc
           - qcom,sm6350-pdc
+          - qcom,sm7250-pdc
           - qcom,sm8150-pdc
           - qcom,sm8250-pdc
           - qcom,sm8350-pdc
-- 
2.43.0

