Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445197;
	b=UI8DEnKCGgMJGAwO+PXqALtCamHZmZiDUOajbdxAgWaiK37rRYQ0zo+KC27LLWuuLtW/
	 KF+HRF6IZJPAQYLm3ap9VI69/AMz41N+Qsn/OVFkTsQicgISuR86g6S0Zq0ilZAYn6IeJ
	 tweMOzWiF/1RATpBh1fxJITCjx3/ufP00eYzGCDqhO8NIBii5vOl+FQF7kk2/P/P9X4Qu
	 YcRafZpoC1qu41UrCnxitFx8C3lwuL5CkCJ7FzqisQZ8nRbpClQ3pGIkQ66yCKRBFzlZ/
	 MEl1+O9IDImJBy5wGr5oEnAoJldS6/cQGHllvhGIvR033HFKAT/mm+N+UGZRJ0Q1Clw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=0ja6aeSTc/PgeoaI28A90Kc8rq1aEZM4hyzn2AyMUoM=;
	b=fO+CPSehrUeqaFGm2/Q6Zl6amMezR++c03Jwt9zZk5kOVcXdH/ugNurJkqcWdFMGG067
	 GAHOtAmEnJ+OtqYcW5ncupp8vcSYxvGtNVh7Gvq1a/wPPMixYDJJD/tWgV8+FJ9G5Tzj1
	 T/2XWk5KPhygFb2xiDA2Fd3+6AI1uO9+tOCrVX5qJTlzlaHdTM35zXzDSjizkhAcPpYnK
	 0fI0uJ8eXAW7Phy36kaKKMJA4e+n2N15rfNeWOmdVUdsNtxxsBFVSh7airRQUG5IV1GjW
	 5nKhNJaWO7InCAD9SmCxX4MP5cgjZWMRbfXUxAWCmq2UFLpjpgKbSGs1URrzxUlYzXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=1Iqqepd8;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C537606A327
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C537606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=1Iqqepd8
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4d427836e9so468060466b.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1795445195; x=1796049995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ja6aeSTc/PgeoaI28A90Kc8rq1aEZM4hyzn2AyMUoM=;
        b=1Iqqepd8tSa+TTje+A5rSo9oFKO5k/gnBcsj3RQLV3KKa1GJjhsUK/NeLB+7S6xB2S
         Z7Kg5Py5S5e92Yg0UQgiJidPRSx6NwDmuVpkJExcc02rd/R7n1tjfvNjZn5VOqegz4tD
         EOPcHMhYf5gDxtEJ0OhCh/LBT4l3W5Yb8dl/GmaGk4zgu5U6qlBO4Fk+fxilKt8moUIL
         W1WpTyjeNkcws2DV00/CsGMEHAFF5yA075pq5y4hnXWKotT+pQO66xSjM63pNyyqHxIc
         Yrh+HJlFfzaO3djEnVYfiXsLZnw1J9l2sO9F/GgKrNR/G7YjTfS0rTujq7/+je5pWz8H
         5fBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445195; x=1796049995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ja6aeSTc/PgeoaI28A90Kc8rq1aEZM4hyzn2AyMUoM=;
        b=YbDmfOEPR8TaswpVxQ4CGZepBFm8pZIBsh0T563MnrlYPa7jVT+POrqwyWFVE+b1Pk
         Osi4cgmpwlUa3ZDsSdO92dEYqfDjGUUZTzXvkGoaY+ijijHbbv2Ln53H8cb4MU/uSRur
         O9jlpinPBDwoFtw82aN9gtkooCbe2Ky5hKifoMC5HzAM2Pcu4tQBFPy46w6epVfLCkgi
         wW9BWT+yLPyCfG/+qzDc0DeMXRcaWteSIxcUpAvMT4eM9vjk7Qu2jxGb6MYv4C5yr5X6
         PPUMMS4Jr0TZiExtn7qjPEGCZSfPAsVoR7T5nfzPRFVeepEUxzruMvfljfUJ3tT44w3w
         okaQ==
X-Forwarded-Encrypted: i=1; AL+hErE29JeZmr1hlsFxzW11Qxhh+D7nJtH++//nTfmRAAbup9RR4W7edjhx+Ffusdbqj1QPCeXXZK/ycT+A@vger.kernel.org
X-Gm-Message-State: APuU4Z9donsZ9Hyr8QoREtamNqndOfseohIEZboF22h4btosVj6dqwnF
	jcbNc0dlIWqCUkgydZzglNpbqsrIgQxddUWG1GQEOo/5gjY2KU72b2RDi8jggMWG12ZZ3Ndq8Wd
	N2o5XnQY=
X-Gm-Gg: AZFdTZeDt1dnQetdOUozxEToqeZ1T5lx1uzv9McSG6A5pLSH6im5foKI/iAnnMakUYI
	QOSf8Ep6TDtoSQ/omCx5R9BY7w6XnsxWfRy5zTb2feYlXn99t79Ix/wl+YY6jT5cNAF62jgZozm
	m6IFMhu6grnGVElu0HzP2BjiiHI4xj0p1c5iNSs0lARxIaz0kIFODet4WwUfLA01iqUId37oq48
	G8vQk2QA0Go9Gh1bgDb7NFKj8VcfqxQWdRCLD1CWGDT8ufRyZJ5YXhcc/Bl/1cqUu+/4MRakZBe
	mms8gAO/0KMjhCtxz0GXpHAeMNczcEg4tkvDMb80tv6BSMQPpcYeSu5R6qIjnlU5vShhv/jQ/rb
	J5QvNrl7Lbsj8kF4ux1HHWRofKDMpM0zLcJiTK1SrO2vXTShC+sWVa+uQ6O1hDp5KcC0A/uG0wm
	7OlNq/hjbpi8BlaS6ESTbwnNiZxwPviReb66cSFCUdbptx3FJgvsSfCSWj+FNEj3vOQD5Q2ClWo
	f67BN4GRTPp9/emrtNlmj3LUe8cxi5EA2Eyv173K34JR7+VwBGlcMHv84sO5Fwsu687fjXFheEd
	g8VVwaztyxmA9KULDRu24+hlGnkKV4Y7qz3CcyCclYfZo5VxcdK5xcS+n2xs9HVcvUWSEkObcoc
	ZB/XUa44=
X-Received: by 2002:a17:906:3b04:b0:c29:3c97:c994 with SMTP id a640c23a62f3a-c513ab47f35mr751490266b.35.1795445195575;
        Mon, 23 Nov 2026 06:46:35 -0800 (PST)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea3701sm433004766b.48.2026.11.23.06.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:46:35 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 23 Nov 2026 15:46:34 +0100
Subject: [PATCH 2/2] arm64: dts: qcom: sm7225-fairphone-fp4: Use
 QCOM_ID_SM7225 from qcom,ids,h
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
Message-Id: <20261123-sm6350-msm-id-v1-2-99482c9ecc48@fairphone.com>
References: <20261123-sm6350-msm-id-v1-0-99482c9ecc48@fairphone.com>
In-Reply-To: <20261123-sm6350-msm-id-v1-0-99482c9ecc48@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795445193; l=1110;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=4K191NsERnP8+lkYFGjVBIqfhrhPmFZIhdoETVgrVQk=;
 b=xeGceB1kyGr6UXT9qc1Sy1z7PQr6yh9WVgT1ifAzyYK0Iln8NTvdjrBAtso7Sjemg4Ny7vyha
 j4Bwu0S5ZmRA6a67CMSkzzr5Bjma5X0UdpOlwK+p9lghxXZBW3rKNXg
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

459 is just the value behind QCOM_ID_SM7225, so use the define to make
the meaning of the qcom,msm-id property clearer.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 773304b4759e..bbfa5f76bc75 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -12,6 +12,7 @@
 /* PMK8350 (in reality a PMK8003) is configured to use SID6 instead of 0 */
 #define PMK8350_SID 6
 
+#include <dt-bindings/arm/qcom,ids.h>
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
@@ -33,7 +34,7 @@ / {
 	chassis-type = "handset";
 
 	/* required for bootloader to select correct board */
-	qcom,msm-id = <459 0x10000>;
+	qcom,msm-id = <QCOM_ID_SM7225 0x10000>;
 	qcom,board-id = <8 32>;
 
 	aliases {

-- 
2.56.1

