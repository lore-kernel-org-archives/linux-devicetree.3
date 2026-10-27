Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793087511;
	b=3dBn8TCmZyc19wsfmDODDFQIE3khD0/38iDjpNrpuecEr0R1pH/aca8pb47JAz7bdopC
	 ylbFk0Y2P5+7BO+Vf+iwXFEjZ5W4okkVbkW1bIPv8MErOYCAirqLkAOnoZWF6rj7JeEGl
	 7CuXFPrp3SCEiwnrAkp8TtlwXIJlYFAzxT7pgwoytSgsl2bNmDItoVIqyxlBIB/VD6ipg
	 9VmcuLf/t+/JaFMLowsxmzvxNiXUsqXB7NXiDoRHVRoemq68uOk71E0N3U0gS0f5qTrEV
	 5Rlq2BKXORS3P4ZjpDHUQ9w8K6P0c2vjUFJ3VAlXsMLfPspNyL4Z1Wq35YTX5bulLnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793087511;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ypEzL1gFHlTg5t/NkvImMIT1oSedLsVHIjJyUl+/edo=;
	b=a3CFXITwu8eo+PPKVtcwk1yhkFNHaozea0YgNK5tSnTix1cjR1QwnHPFCJXgGMnz8Uz1
	 eb+eMk3srWG374rwXGB8oDVsNzOZiBh+ZXYqtBEWIAYcImMKCMsfiLYW3LEpUP5rU+FwH
	 pZYTRYMr+CcTe/M5HTGwfA7nVU/+aslrT8EHo1SetDqmLweK+QfzlG/EgXHC4U4EWh3vN
	 KhntyNklmvTxSGAF/RlrJ72OX/SZkmtzjbuKweELfcwOzGieTVvHr3DZ5Nl/U1Bac08AX
	 NvV+Xj6Ty7lIXnShu9uBcwofWi5O/5S4KTrOIEV1F2EbKRapAu1LvZedAvIjtJTLdoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Th5NzQaE;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7ABD606A326
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 07:51:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7ABD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Th5NzQaE
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ab98332238so2140558a91.3
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 00:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793087510; x=1793692310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ypEzL1gFHlTg5t/NkvImMIT1oSedLsVHIjJyUl+/edo=;
        b=Th5NzQaEUYOBrvxS+t97ujyJ6xOSEnTatgCKODt3mTYxgxQXhwzVuSyc10yg7JsvGl
         0KSn6LlWG+wu0eJmO76dVr3pid9UXbQMAPNYvi2RXhW95Gyu7xL1VDPrtYBOwZGuB757
         4W6PZeiP0hzZMNIvb9v7uLNgH8EbH9XOCXIjEqOpBMJ4/6Aku0habhJPpWeIi8K9fzcb
         wdbW7pKb+qmqea+6E2ZNOXzCqxaVeYMyDDTXjLdh3Uj8YwmL5zcb5ghSEOtcznibSOiw
         OM0sA9DFVlaaMZXUSGb0B2kAPSaD2HFuWMiTb7ZCwS31qdxVH8CWuyPw1Ci5moglEebd
         xw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793087510; x=1793692310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ypEzL1gFHlTg5t/NkvImMIT1oSedLsVHIjJyUl+/edo=;
        b=ZqMRdlTohLBieoRiR4vjnyfWI4vlKh72McWPrpL/OvJN2mwlaz/y1QEDBFfs9By6H5
         7vLadXSGtaF9FmmhlZ4ersQMMC121qLFnmTbeleQ1gx8ku03OY6gS4HbNg4fMTNUFV6e
         CkeDvj5rYgRe9yDws6hcUKG1wfG0xjYRGH6TJQy5s3jMp9F9whpjhLqpyVQ14UkfCx6l
         J9hGdoyvphV/PauSKNmrEDM8shsbS7ny0p495z/7DvIp6JzfgqVzjfgCBhsZzh1+kgHO
         FcXyvRGeJ26WRMsYI5jdzsyoQjhg8nMBeJleith5KRo4xgZKRnwgq30ORQrenEsD4sNR
         DiCQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9Zy4iOVHQeaSrbj/J8pfLwhWZlMRrHjz0rqwnOAoDBoHTOzruF+qWd6dJD+GBHlsLUsJERLW9j2vH@vger.kernel.org
X-Gm-Message-State: AFq9FYLSvSAeyGn3FSe++p2pckbu3kQQG4hN4exIJ1C2LmqDnp6C8Dr3
	gmVKA5afP13CKrQQmxlikVMr7gGCcciYw5yFgTHa+hXIY6bsPhEN69Gb
X-Gm-Gg: AYBFou2D6wUejduiSFu7l1+QV7/kwePrwrflXrbhPEJiUxJXaBVmmWnFJR9ZZ/nGtID
	0K+gm3xlVr4f0ElQ2Cgz4poSNBBQ0NRDIrwDtQtuJ4AE2+JWIGKtfKpv3zYg72227hXrhIPkHtc
	WJ1loPF7iCRyiJ+k8z1Oc78+r27FH86/1+y75OEtLc6xKfHf/CMkrz9AaCews4+rb8+EgXkpW4H
	5qxyzTemkxNBZHpMoZ42FjmLqrazdTj6xlDHgySO7ZDNH3+PFYLDeHEwsHnvPAYFS15uONfRYbF
	i+/rTEOHju2J2lewH/hv8R4Zoy06zo4vUZpcKdxJH7r4Ho1SLiVP1OinGymjX7+YUu3THh+eo8e
	RnoKuCOazyQnZ9YPyhUyYMZUYJqxJqwStN/MDGHF7YOIJdgAx5odz9r2jMkX7gsZHZvCJa810Jq
	U7uQAt4jLfvA6wW5dHC2SwYpXEu+L/RxkEHxbX0updHdBSfMYMEy1fctAR/R7lgiNB0NZ25DG7/
	A/9tPx8qZaRjvFDD9ndh+0uoZHN+0FkctEKBqwH57WR2Dr7K3WzBKrlJTE=
X-Received: by 2002:a17:90b:560d:b0:3ac:9ed8:f30d with SMTP id 98e67ed59e1d1-3adeafbb160mr7153902a91.39.1793087510014;
        Tue, 27 Oct 2026 00:51:50 -0700 (PDT)
Received: from debian.lan ([121.101.131.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40614d7dsm2542311a91.3.2026.10.27.00.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:51:49 -0700 (PDT)
From: Amir Hanip <killdeath104@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Amir Hanip <killdeath104@gmail.com>
Subject: [PATCH v1 1/2] dt-bindings: arm: qcom: Document Xiaomi Poco M3
Date: Tue, 27 Oct 2026 14:51:15 +0700
Message-ID: <20261027075116.41673-2-killdeath104@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027075116.41673-1-killdeath104@gmail.com>
References: <20261027075116.41673-1-killdeath104@gmail.com>
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

Add compatible for Xiaomi Poco M3 codename citrus, which is
based on Snapdragon 662 (SM6115) SoC.

Signed-off-by: Amir Hanip <killdeath104@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557c..8d2e4f0e3 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1068,6 +1068,7 @@ properties:
       - items:
           - enum:
               - fxtec,pro1x
+              - xiaomi,citrus
               - xiaomi,lemon
           - const: qcom,sm6115
 
-- 
2.47.3

