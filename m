Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262AF2DC791
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 01:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784769865; cv=none; b=B+kdV9K6GO6TIRwwhgi+vfPpR2b1rrY25eSFoHEsnvenKNbhmrpHu48//gRdgFD6cBAlg2ZPs8gLRwGxG7NsXd7i4G6tMx4Cu6YDKgSQ0dZIu/tHhJzhisdDZVfzlPUegTSrGkoeuwAbaLHYkfp9iV97bmP2QhaoEDjWRYK5V+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784769865; c=relaxed/simple;
	bh=LnhLqCtXLycdS/7QOpLkbEiXHoC7lU00ZBptzqR4BvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VJ/ctpQlJIt8OGbXvvoCWMkes+PlSW52X37wXtUOTF32huVkZ9oQyDRbChicldE1SdSG9a+fFpJ1Rxy/O8o/nJ+9Q3pob/sIE6SvGgyIPs7+NOMwjW8HIuYxkVMnzlgcIMfiFHPhKuakQ/54aPDsc5rTax1lm9DFlyAwqYVR02M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OwSZyqed; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OwSZyqed"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6689402c7bfso52565d50.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 18:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784769862; x=1785374662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2b7MZm7+ICouxJH7SNvKRjGaatdEuN4EiW++/CDI8dM=;
        b=OwSZyqedpApg5deu1lXJmL3sIdM/KzKFEkddCLO+bk2Pb52cxEgemJjs260B3RaqF1
         pd/i9aym27uoSIhKbKcwBeyb8/TO2I5okL3IIbMWeIAO95JtDvUGpHIF9+do3S/kLCTb
         E2kPF8INYAEf5HplO6QWOHtcMeAL3vzEnAqX3ghorc9C9Pwto3+v7ZTCCQJfvmu8LWyU
         hsHniJ0LRSMg3vvyCeleZgxq0X66pgqVTkR0n8JWlrfdiaxNQ4rRuT/vWE7yl0s4aZor
         mfTY2HHuHBv2xOeoa59KOJZCwGksH7DuUySKEGJe/BEXmBr6wELB0KoPPRwYsPysNPv6
         2xZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784769862; x=1785374662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2b7MZm7+ICouxJH7SNvKRjGaatdEuN4EiW++/CDI8dM=;
        b=YLcV3oUh+jCLitlr4NABBr9RT6EvyWQ/j8GBjfKaS0kvmKEctW4lGl9LzUbYHMo0lU
         6PXnWT9ra2GIy47b0hLR1rlr7t7cUkvgRCS8LVNntHPQ1K9lqxpQFe3BImQC9vnwCeXc
         aeNrZkA/jINfzvIHvdhLtqwPCBLDUziMZIQ3QRQlWdv8XRMLWp1FFRJLjgHLen0zoONp
         TigQ2NCpUn1Tg29HB1xV3WGZM4JsDQ9Et1p1xjTAPq8b7ViEJbNWQPV5sY4AzsgS0/AT
         30jnLAbWotl/blQXW3K08p0BJiH+TWM93RLjSX501WQcryYZHPRlOY3b9fUtU+sHbryS
         Pv+w==
X-Forwarded-Encrypted: i=1; AHgh+Rqvz88ktkJ2s2ElHO+GgOAOvgB47W/clQFXkae8qDlRMCwnHIDB3yMNwhwNBXW8JnCKP0zmr6hf4/3c@vger.kernel.org
X-Gm-Message-State: AOJu0YwEwGesqZwV64Wa6ZAwA7/NoAE5R7zScDtomCsZcRqY+oQ6hUM5
	9T2ocIJEEz43orgsKKmSMZzvmpua5lSVhYxj0JHnOQ/iPTOegV7/gO1V
X-Gm-Gg: AR+sD10ytRHMrvhvzgShQCP9BI8FA1hzsPGHOF8ZTLgBpiqgtaJDxki+0tXa2MLMnN3
	cS+qWnOcwMYx4COoJD0Ibzd/GLSkdr4nLpzQw4oGoylig8YzhAGqP+/Z12a6euG4PDoVmHI6Dly
	qQlO3L0nhvbOU1UoRybHvqJTkbheyRDIk0hbVTSJqXnpZYxiF6+hzfeiaVQuZlcYEFRK5a8WZGx
	QhtUs+3sqNbv4sAeigJmITHEGb0g1gD28IYArdIv/ePu95pjTyJR/48SUHX73RoNxGj0ifZFTIV
	bfSsiI8eDbjNiM4hd1hZA0hLKls1xzoDY3tK/obwTlkPnrbEu5uR9768TLWo82fgsqsosxYMGp3
	yYgkEJ4r7Gm0N0MDgRYBiL3nSNGN+tgZAVTaasi5pcoKCF4mPrk14Dy+DAZNb/Cct2MbmGq0TpJ
	R0T8vxFOVYqgY1M6qRJM65SuxAYLcP
X-Received: by 2002:a05:690e:4381:b0:668:4cbc:9c99 with SMTP id 956f58d0204a3-668a4fa2ae7mr177580d50.86.1784769861965;
        Wed, 22 Jul 2026 18:24:21 -0700 (PDT)
Received: from karli.attlocal.net ([2600:1700:7270:4eb0::19])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6689056dfbasm2319684d50.9.2026.07.22.18.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 18:24:20 -0700 (PDT)
From: Aneesh Pradhan <aneeshpradhan2004@gmail.com>
X-Google-Original-From: Aneesh Pradhan <aneeshpradhan@acm.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Catherine Frederick <serenity@floorchan.org>,
	Aneesh Pradhan <aneeshpradhan@acm.org>
Subject: [PATCH 1/2] dt-bindings: clock: qcom,rpmcc: add MSM8920
Date: Wed, 22 Jul 2026 18:24:14 -0700
Message-ID: <20260723012415.48288-2-aneeshpradhan@acm.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260723012415.48288-1-aneeshpradhan@acm.org>
References: <20260723012415.48288-1-aneeshpradhan@acm.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Catherine Frederick (coolguy)" <serenity@floorchan.org>

Document the "qcom,rpmcc-msm8920" compatible for the RPM clock
controller found on MSM8920.

Signed-off-by: Catherine Frederick (coolguy) <serenity@floorchan.org>
[aneesh: split the binding into its own patch per submitting-patches;
rebased onto qcom/for-next oneOf compatible schema]
Signed-off-by: Aneesh Pradhan <aneeshpradhan@acm.org>
---
 Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
index af9fc5b14a81..49c00e219ada 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
@@ -33,6 +33,7 @@ properties:
               - qcom,rpmcc-msm8909
               - qcom,rpmcc-msm8916
               - qcom,rpmcc-msm8917
+              - qcom,rpmcc-msm8920
               - qcom,rpmcc-msm8936
               - qcom,rpmcc-msm8937
               - qcom,rpmcc-msm8940
@@ -118,6 +119,7 @@ allOf:
               - qcom,rpmcc-msm8226
               - qcom,rpmcc-msm8916
               - qcom,rpmcc-msm8917
+              - qcom,rpmcc-msm8920
               - qcom,rpmcc-msm8936
               - qcom,rpmcc-msm8937
               - qcom,rpmcc-msm8940
-- 
2.53.0

