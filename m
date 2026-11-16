Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794807278;
	b=4ISPpIk2WnYHkVgcjeY4fu3Bm7Qf7M5M7AywHD+qGRTkUC8x03SWnaV1fhqDoc0W/mLg
	 MSlmhHZFBoGo/prLcpU1BBFirUfsCju4QcM8b3Oz/eKl309jhyAqK8l0wkLoe1gJXDZXH
	 uquc05RRLAhZc5wRpKia+lxK58xzuhOf6MwpD55HAXd8Rr+o7rPw4WR0Cgl91RZfNz/NS
	 p72U4VSpbS7BBJbxn0ZgYexfS0oGF0/bAdivAzTGCOOhed8LLvifWSHyv3xexjeDZgQ+7
	 KvM9jTyS2jtsVJ7p7Alk3IEHb1A5krxhFG9ppNREcvqZka4PNrPWo14grLmhpodQ5Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794807278;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=AZbalvr0RZKV2CHqgY8md5UEm/BcGTfETxormN4SzfQ=;
	b=wL5iXEqirjwusJTD6qdRDnDYZbI3xoqae+9QNBPX29XH948iDxNV9eRYK/ss0fFyQ56U
	 moPMXCsRpL2uoqGzZktNW7/lYNmMKNM2waxz7ELHq3dzAspxqb0UeM6NSSZ2NWmmgm0TM
	 V+KYFnZi6AyIr686pQ7JzAq+yedTClmJRIyEMzXXN9ZrC8MS7e+GN0IoSwFSoISA4ttjq
	 6FUZwNiIw/VLc1UIC2TAf6Ipt+SuxEHFF1ukjEdWrWlVivG1WzYUJERR/sHA13SR6+w9m
	 RRe6iafIkdK1SYxmo2zJHYL8G1ny+nnUDlmy+jqo50UCAl5edyCOiyc/likYxdEptXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A9kf1Z+x;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE8D606A329
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 05:34:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DE8D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A9kf1Z+x
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1aefd1bf74aso2270601c88.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 21:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794807277; x=1795412077; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AZbalvr0RZKV2CHqgY8md5UEm/BcGTfETxormN4SzfQ=;
        b=A9kf1Z+xZAI+O4NImLVZ1du3+v+O27Jx4WofylUUmF9RFtoG1LQXRwitighsJgZfqi
         bDR74J4ta2cYOj1P2ia7fjprfYCcH0n1C2DO2PrNddBsf7xBT0cgB9dK2w3zZzUoM0Ui
         E/9AaBdwIG6dyB6jPetrfXbxH5tuhm2jMySWBXeq31wwhMcVnWTGXqcUEh3VQ92gZT1E
         uUvQAD7M0or+QQwUMFB5UcDyDCDYh1tUKryBkM+GVGjD8XLlEgkLdp4Z+WqAuRoD8e3J
         uOQL7Rh+OzGltnWJp+mA166rBe2WF+QZiMCx9T8a9xYT3dOiOAcJwskNuwwlQG3WySsX
         e4xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794807277; x=1795412077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AZbalvr0RZKV2CHqgY8md5UEm/BcGTfETxormN4SzfQ=;
        b=ddK7HR8Ylc6UdIN8OxpgI/r61PHgy1FwEoo4Cb3xgedeHVtzzMKTkp517eB4pJBori
         xLMlywlZ0HncMalZR3GJXu5OHrG1qKHnzEdCKT5UdVRNEWF0oruTbc2hCH6eyBej/9cp
         z/5r8SLxOBsbK0a6t23bWK6qbYZHndJBK9y2E6L196r+MERAfZyBG5fqmPx4Xq7O/R9N
         lOCxJbDK+0/s1AxJcscFfUqWRWwyM8ImAdBn4x38oPRGGhnlAWaAps2AouLbkFc9mX2I
         ykjJBwIvsWXgdHlVcR3bzwrprxW4rPIl8ALFTHcWQGD9WCAHAdl9cbn7aVHBYTVwcgXG
         YIlg==
X-Forwarded-Encrypted: i=1; AL+hErHL35CP2RHl551/ukPWcnE8lhH/wg7oiZ5G8umY+iWtsdpf5+aHNoLu0M9GTl9KIyDCIevX3sEUCeoW@vger.kernel.org
X-Gm-Message-State: APuU4Z/GixE7muhkilu/oaIJFiVWYTUqmKtQPvW6YQfcr1FzCbrOdxe9
	nJHzMHvhkHg8ERhK4jLad999za73gqdFo6bEEi8VnOCWjCaDrPwlwQ1x
X-Gm-Gg: AYBFou2DmRFM8tKZroQ6KvhxrDOnMXwsfbgRvS7K16sXNNJj/YYQFYeM2k7dNBDFgVQ
	Y9jDtWj2EoV7Pi+fw8yF6WBLSj0YAISitmkWpcWJ3/draJ8NNqjDl823EERGlqD3uuWywO9bKo4
	yqEzdf6hbGO0fUR84MB8iuscRTvn9P40zVEmrr6752xv74aA0ti+97UMIS5VyfCz4/tPo+jCvBL
	NK9jy/TFHxuofQDG6RsAzHb/O/Og2E78nLngOkmOVgy+0DezOTiDhzQcxe+O41gR3ynuokGywPS
	W670Ij7TcGUnX9UAruEDj0IYWVfvvxtJFUG+iW0OLaa188ppVQWQ8A5P9MLWBY0qscRPBqOA4BX
	q3dsSxhT/hU2KQ+rNrZRjfaO1dUr2j9wFpNAqkTzLaWY66sYRpxtZfffOs5bdfDk63Yp7zOWEHS
	/AvnctaLLxxvjjm+Fkz3De9VSX4cIs3mp9rzsz9Z3kV8sVUM1abP79yMLO8JaoaKHxpGba3wrcz
	jaKdnBKqb08LeW5U5hQK7DzHJtLyJlA1zLqw9HcsWamqpw40n+vUvHDqHteQG5oHEusX40jYaV0
	IzHefypVLaGhV3DWO1zD34y6uTyGda/db0Ydnlu+w6Zq5fzvEuoFd84lo4nrHd5emhQPBkUhkFu
	fNzaU
X-Received: by 2002:a05:701a:844c:20b0:19d:233:989d with SMTP id a92af1059eb24-1b5030ad3bdmr8391819c88.14.1794807277352;
        Sun, 15 Nov 2026 21:34:37 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.206.8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm33463380c88.5.2026.11.15.21.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 21:34:36 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Mon, 16 Nov 2026 05:33:48 +0000
Subject: [PATCH v15 4/8] dt-bindings: thermal: lmh: Document SM7250 LMh
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-sm7250-v15-4-6acbb232fef8@gmail.com>
References: <20261116-sm7250-v15-0-6acbb232fef8@gmail.com>
In-Reply-To: <20261116-sm7250-v15-0-6acbb232fef8@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794807229; l=791;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=VBYR2sSJ7gPSfZ1zDIlxykyMXb9GohC2X09rRKZ3wIw=;
 b=GfWIYZ4Rdr47qL4uVzwmq3cHBxuZuZfauAK9SuR+lb6tJOGaW7G3JO5uex+TMga7n417jmp6t
 uDxoG1lyLysAGDzg6fS3Jl0jgyrf7wGrThcMpQTEmnFiL14C5GZ0vFS
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the LMh compatible for Qualcomm SM7250 SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/thermal/qcom-lmh.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
index ce72347e2..e1d5cb871 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
@@ -21,6 +21,7 @@ properties:
       - enum:
           - qcom,sc8180x-lmh
           - qcom,sdm845-lmh
+          - qcom,sm7250-lmh
           - qcom,sm8150-lmh
       - items:
           - const: qcom,sdm670-lmh

-- 
2.43.0

