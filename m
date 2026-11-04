Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810865;
	b=YbFmobwx7wug7dyvwgkW/g7Ts+GHb5Wv0Jp0eBbbOo12OlZ64sgsauglIr7LOWVqym1q
	 OoPz9NCEbxl/A18nxKB4zGw1/jjhe9ZOo3oEiVe5XsWNt0h/d6iEgEDJQfzrhqk4C6zWj
	 MPE6Q/mWEQCwecQ8rAVzNJKt53IzBxCQHt3iYnV/niQt0fcXc1oN47FZWzTdmLeADZxnC
	 hwmQxW2RSD7eT98z0UuQVV+gSHxcbdaUj4BSeYwz76K1iFh8PENQ3RYoHwur8HWyvSiaI
	 z8ndE9TfK46Z/LZV9gdDoO30TeOIqmPbXoAe0bJPfsx/tPxqzlIp3cFpXrHRlcgUq1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=U4fFdtJNvcZ6y6D1x1v24LO+4CMQIoUBaMtD1ZPuCLk=;
	b=GOnkUxuvpgOD3UmOcZ5X5kbQp2nonMtDwN5Am7g761rpo9U2cyiKie2WvLhlHZuo1J61
	 3rp5zSXSqF0JlyJ01ZmZtquvw03+sQuXDBR8P1fwRO8x5V4eIjOII6CbmF/oMOwfgcrfE
	 oGlaBMoZRlr64ZK+Nqa08L29j2gU7laazdZXoBZewr3jv2CS1cadzxQhm+JG5PzdXyNnn
	 fMRyvL1ixMVWBV9JNW4fzi0lxsRLgtcu5KsCC88xdUiIUTh9I1isvanGgRaGQaFDNSz6K
	 APN5w1+r8fNtU/PijVj3uIzKsN9JPVbjW3oUX2ZZcgx8XQaDl0l2MFX7CQswwixZmLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oDKTeHu9;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B53606EE9F
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 16:47:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24B53606EE9F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oDKTeHu9
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15943c9c005so2295100c88.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 08:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793810864; x=1794415664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U4fFdtJNvcZ6y6D1x1v24LO+4CMQIoUBaMtD1ZPuCLk=;
        b=oDKTeHu9/D7LEgoLtX2Id9RcRVT+1ag0PVlRkJn6LRUJ+tPK8qy9UNhH2k58LkNP7E
         qwgy6EaLkLHJ5BwA5IvnkC7NrLSYc+VeBrciVkYShA1mSofVv9xqO2P4ZLrlUdVgesFb
         U4oV45ybr0Ly2k8X2vFleAjnX6CyM7N/Xgxg+9o+QTkozkOGqbyFkhZTJC0C66h8lVn3
         Ngdhe2KDalL8T+jNBgDzqtZqBlnUPLVnkYXrCHkELW7VjmOHykwjTSDbPWfceaQ8znz9
         Hm8qjdk7tKhA0eI3M5t6XXN9tlH8Ir7rgJs6gdNaxOal2rgWZbfX415OgUxvpsc1Yu39
         sfJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810864; x=1794415664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U4fFdtJNvcZ6y6D1x1v24LO+4CMQIoUBaMtD1ZPuCLk=;
        b=cht2YFLduZU/jLZip4kKg1d/+S4nnOY6k8jUNkHTnQANLV3ye0Uz7c+06WawS1cXgO
         6X8y6UxLPVSxP+zOQkW4smJRc/VkdbP47ntQuyJpLAYLo9MY3NxE9wtyg2QA0f8hY28b
         AMlO/EWLVP+tLgg2oquffXlZonAVfLZp7T4FXtSJUbEKRxihL5ReS/khpm4yA+zaLGpr
         hJnZTPGXQp5/MgmnRk1poxxCWDeF3CepkoOQBcm9qm8XfnAeil06RVegFyG3wEYQNNLV
         f/m3tDSi1KL5EmzIcl1RAGuy5B9GaneNP0nrvToNfFWPRmSQFbMcRF/Yynz2RFUm+xvI
         MQKw==
X-Forwarded-Encrypted: i=1; AKwUvBy4AD3VfEcbwiz3qJ/SnV8k90T5mzWS/pgscJPbHgBrM6Y9Y6ZUx3tIevWlFf6g3bKFKDghmlJRWDi7@vger.kernel.org
X-Gm-Message-State: APuU4Z/uMZ+z00uuVgkY38j/Ru4+z4L18fZTc7c0GBfAxOsMYb3UI/C9
	iLG2cHV7fuM0AG4FSXc+wderVTEBHQ4ycuRLaYpRb/A5yUh8QUm2QOxJ
X-Gm-Gg: AYBFou2rxGy2rgpI1SCgWozV+LDz3W38l7hIA07nEgwZyHDhekjLwgO/6kxaRA+WkCu
	dlSGhPXDop9xcAwY+VBZhKRz1hqN+GJd+C9TIFiewdklqHRfIRkJcOLVUvXfhik0Agn3Sh6jQGL
	IF6FLnhEw7BlUIQaCPyoANh5iJ0nl4Mh5ASGZvQURXe0EFajKpvxSRcPfEkLjCh9Y8FQA+eaSLy
	uqyhZYmg0e79RA8eljGkN2W/NCVF3BhuR/mblAYGlDjZMZTDq6YFu2KuE7TQEjdH/D8MCzbEwsa
	hfnvYBOR5FCcLz5ZpNdRF1n99ZEo5Y6fL6a+ZA0OA5Lhwc1ELlOKn/Yv7Xvj6HXB42LKCHXyjc1
	QUAKIOkSAMis24ME6bYY3Hkg9yhFlP5uHYYyiLkzlyH01NQ93jJDPyDjq0fl5+EIYzG5DcW9Q3v
	ohSnGt6/E2qWNfXphj5/qPGG17M9OVcqgihajfTFssuN+zbQlNFtaUNky/c/OMbgLUugeZYnTRK
	a1/WGEJxyelJPVBkg34GDQ8DhOdmTn2T6UxGSK3KB3nrQGElDocigYxWeNsu3hpKnuzqyfAUNgZ
	hvTW+sx6nbipcexz94DuCXDVloPmOZ820G0gmnTSavS3Ol3t1zWL8oxzxQr1IJQ0zRmQ5Gifq5i
	PIjV3Edw=
X-Received: by 2002:a05:7022:418a:b0:195:e4b9:d326 with SMTP id a92af1059eb24-1ac5b9cb638mr35445301c88.12.1793810863974;
        Wed, 04 Nov 2026 08:47:43 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.207.207])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c57430sm10839666c88.18.2026.11.04.08.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:47:43 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Wed, 04 Nov 2026 16:46:38 +0000
Subject: [PATCH v13 6/8] dt-bindings: firmware: qcom,scm: Document SM7250
 SCM
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
Message-Id: <20261104-master-v13-6-355b65c6f764@gmail.com>
References: <20261104-master-v13-0-355b65c6f764@gmail.com>
In-Reply-To: <20261104-master-v13-0-355b65c6f764@gmail.com>
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
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793810796; l=838;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=n/5l0LzNHQkrbMmziTZYOIF2FEcc8PMKPnj4oscjta0=;
 b=Sm+u4EHvzCpGgwZKZFX1DxrtxcvbrxK0wHlNVW12r/ijgENS8oSQFaV6rQsbmumD7aCwcC/gt
 fIcKsAunm2yBJViY0+UhK+wTGor9I9Ro18x6cbo/n9EqUuUrNeNrdiu
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the SCM compatible for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 40a267c54..ee02a9c20 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -76,6 +76,7 @@ properties:
           - qcom,scm-sm6350
           - qcom,scm-sm6375
           - qcom,scm-sm7150
+          - qcom,scm-sm7250
           - qcom,scm-sm8150
           - qcom,scm-sm8250
           - qcom,scm-sm8350

-- 
2.43.0

