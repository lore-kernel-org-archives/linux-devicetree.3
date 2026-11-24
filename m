Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522585;
	b=aQP+1mZ83syIyz2uoIpvrK2tfq4dzPVrYgJZazPa8usiziCWGjrHhqHabG1HYf12Tyz4
	 2vK58bZtENpLeKVa3uzE1/9/2hR+MNMjfknGlUgOsiLHXl58D6S4ZQfNovPItS7RaGLrU
	 A3DxYD9lbq0xAubRVWNIPjN3fdn0pgYcpYbZHz2QOcAsamowAnwoVgpyPkk56ovEfvAYY
	 VKVwDXaGD5rgOqUGl7Z1dcN/FNUgGL9fcsCdRHP1TBDyIFhp4wrZJqs4BytALcLpe9jVS
	 RyFTie4jGC/Gg02bRKD9kuayEbEFZDkD0PQnFbXHxKQ9hCR/4Vaakp1jw8RD0+ycdMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522585;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6MRwCGY3EIkm2Sb+ci3Y/6bF7HgSt7oRZHgHfupwS00=;
	b=IK3GSKIKlxAhqXisAlq9xbWHE2rwmh0ZU5bu+m9aRxkNZpDy1SmieAc4av4I468U6t7b
	 QRYcLMJoxMcyZTUXhfoVKKz4yhN1cZmVZNwq3r9JuYSWj4D+MYXesljxAyryZEgIDiXoW
	 W3rvmJbWQ27/dbqfejaLD+NWmV6UQoo3OaDxQWRSOU7P2azmRA2iT25YSnRDbSzftDyEs
	 bcnao6Lc9/MF2KnwlQezF69tNFKdfMy1yuKvSKC1XQaPoeBUKORHozahBz0KwQjkZW5YR
	 zM4pF40OYsOiTJfb2GMzvlPF4zZyaPWHrtCBC3qVTPvWrOCxYO8pV3F527Jo3OXJmog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lPhv7E3Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ijeEuiq7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19AB606A321
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 12:16:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D19AB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lPhv7E3Y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ijeEuiq7
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAubUS1025311
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 12:16:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6MRwCGY3EIkm2Sb+ci3Y/6bF7HgSt7oRZHgHfupwS00=; b=lPhv7E3YmnPEk8qa
	4smohmy9wBKRAbB/cU7qwdF+X8P3rc1IpypwQb5GcjmXC8fKu1pfAgTKTP83T59H
	exAfVmLqi9cQuHeO97KcUoO8FDpAhWcc8aLj5BQMeA61DPwbDWdyeL9kDtSTDV7C
	yjBwrY774PC559i8tUM2JiSrBWpMTp7+xat+tO06EGVatTfpZwkTHsxdiPkXqqI9
	1ZrZQIP7K7coRt/N7PwIYg9tuthEOB+RcpMQYDCQRL5+Jvtx2G+RmAvENioEOkEL
	QasJoTCmpJfLJCIU7cOUAwh6ofd+kai46p6U36zMnmKlNEAqVuYQaGSDWJ2cCVe2
	qgrdUg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yyt2mpa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 12:16:24 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-89fb6a45c48so3414631b3a.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 04:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795522583; x=1796127383; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6MRwCGY3EIkm2Sb+ci3Y/6bF7HgSt7oRZHgHfupwS00=;
        b=ijeEuiq7jbW3AojaiCBI7WVrxVWCC7Xyz+2V61JvkvolM3at5yfTgQMCW8bPfmsnLt
         ZEhhbLDlzpW44Xihe5whkqT9nnCDWH4wzaKEAf562ropQtdKBba5DVWoBBA8YycAciBk
         S6gI5Hm/ENHXVl7jT4Y9HSVF8OtQ7wWPPQme+cBZ8y+u2XhdQYmSJ1+J6d6VT8eRpgyh
         dcoFVSCiw5nwCnabxVFhdaY2vFlDA/KYeGAMYUVpJteqCKzRSX78r+lj1xu8zhWDyx2J
         KYVVxtiMygwwW6SjxGWpwR0hJ8iX8CdPHNBYFOxi6sJIdL3lSXOuCK0eZ3sxxoVAP7Np
         oh2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795522583; x=1796127383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6MRwCGY3EIkm2Sb+ci3Y/6bF7HgSt7oRZHgHfupwS00=;
        b=dtAqdZDHRevQnqV56bfQ/FGr/4XO69NnYq90hh9YIbfMm0I4b7vF6dRqcqaemCcEXG
         XU55EgJcbHzcb97L+byIb9aAybLBIUQmHI0vY9Hqj6qXKGmpHqJHgZKR2zxYzaFerwH0
         WB++Ei+2F9m1yOvnIgU3konrPEVyfu8BpYaPZHRtAGadHbSnKDc0ssvJRoqLxARGzHJ2
         4x3OBPdfelUnUQtwMo+TpEmfxD6fcoIMHXBhwmKBeo7mX9yPuFxeAvLaSZATXAPJe4hs
         q13LREnmQdZ/kB904WWnmylZyiTsTLii2qE634s35jSpBeAESa3Bg2V9Bd1FaOhEQncW
         HTXg==
X-Forwarded-Encrypted: i=1; AL+hErFa4hiEH9zhDt2yZWOeKehvLbLDRJlZtAHhf0zIoDgreJe7fn1rR+7dwtoYFH/9Xnz3efvyiO4rFaNB@vger.kernel.org
X-Gm-Message-State: APuU4Z8zbjLDGZBLLajsCC1wjPBAChUIbwE3E3H4tld4onWLm8Jkmtzj
	kEL5+QqpmvAzjKzOHUDgFgk9x4ESyVQ8nK4C+0eG/1zb0foR49kJLSPLzxT2HP3GMc24U02RfB/
	LKF/6WdjUelgQq7GL6QmRZ3JdPKM/ofKAiLfYpUDDrgdXMzLCQ2LNpLqol8fBsXBK
X-Gm-Gg: AZFdTZdFcv5GGwWuT1KPJGNAgBInYtwzba81235BSrbTotLVafbO9DTmW2VbRIu84x2
	f2kIJUxgUg8vBLhjnvmUHYIeiayYTMXIkCqgIKZINgwzk1A8VB1/cl8a7s0v6TlaoLKi4NDDUs+
	Dfj3h48oX2aEcPlGZ7VuXYVBC2g8wdoduE6tEfLg/7/BR9fThUGcNpCQOwd9mb+tifcD+EvnyYC
	bRLi/ZhcwFCwZugcvKEkLkp1uxt6/IudPhgqP9lfq6kBv4RX1KYOoo6xOy3pndPPYP7LzV8fvpY
	0m2RllMY8iZ6ht0V0+0oPFooiwcgpTEfcPHL06WTRM/fWdRl/IEoMaP7iQ79CcJRqIxGoiXkuJw
	tMJL2DkwsqLaj9Ir3Fb4P45CaYtPdgfb6F1D/tkwuzxCWeONt5ruV/noz0DN1ZLU2DJZ02loaWI
	4FHNwhL7TM
X-Received: by 2002:a05:6300:8095:b0:3f9:a6b6:e173 with SMTP id adf61e73a8af0-4014d14a577mr12497088637.26.1795522583445;
        Tue, 24 Nov 2026 04:16:23 -0800 (PST)
X-Received: by 2002:a05:6300:8095:b0:3f9:a6b6:e173 with SMTP id adf61e73a8af0-4014d14a577mr12497059637.26.1795522582966;
        Tue, 24 Nov 2026 04:16:22 -0800 (PST)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c8706844a0sm7245572b3a.1.2026.11.24.04.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:16:22 -0800 (PST)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 17:45:24 +0530
Subject: [PATCH v2 3/6] dt-bindings: spi: qcom,spi-geni-qcom: Document QSPI
 support
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
Message-Id: <20261124-qspi_qup_upstream-v2-3-cd69894107c8@oss.qualcomm.com>
References: <20261124-qspi_qup_upstream-v2-0-cd69894107c8@oss.qualcomm.com>
In-Reply-To: <20261124-qspi_qup_upstream-v2-0-cd69894107c8@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795522563; l=1598;
 i=jyothi.seerapu@oss.qualcomm.com; h=from:subject:message-id;
 bh=wquPpfro8iDyDqLV7D69xsSCzyvDGmM++tbpNclpPwQ=;
 b=N3l5nqiq+539iw0mq033y0lWszIasIovNOKFVkYaPOZOh6w9Q3p13NNJ3jevhXXmkWjRhaMgq
 J0gD/S2lXt4Ct372gS3D8np8RqR+QN+4Ajgjx2cNhkp2CubyWGRZevz
X-Developer-Key: i=jyothi.seerapu@oss.qualcomm.com; a=ed25519;
 pk=9vafyYsia0OnBKWSEwhmWe3hPVQfI2T1xOs5dPaFvEo=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0NyBTYWx0ZWRfX6IUhureJ2mLk
 kWBKUahwMYsDw6q/twQDkS/PdIz+c9j7fEiuZCYoEn3is2HRxoBXMxXQOwKQtbz1NZnTCJ5fYzK
 hKMwS/5P28lG4xXH+wEKk7sehrpF70g=
X-Proofpoint-GUID: WghiF4PSDqXUdFy7MPxhbZQSNXASMQj1
X-Proofpoint-ORIG-GUID: WghiF4PSDqXUdFy7MPxhbZQSNXASMQj1
X-Authority-Analysis: v=2.4 cv=W9OtxhWk c=1 sm=1 tr=0 ts=6b058018 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=yrtxUKLFhIMtdVcRTsUA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0NyBTYWx0ZWRfXzm2UpNM3hdyP
 jUGW33/UjfQ7AU8za4MT2dTixTtrROqHoACUJEkzAqP27YKSEU8ofUxsFJfxtStAKtpuToRB3GU
 as8npzFc6L14h7td67p9zRAxyW0AKtvN3s3rN4/X8XWRV0prVlf2SZFngK2XhTYHMsJrPP0nPD7
 3b2y+fXc9LX+6wcDFqM1GY8FpMxwCO5y1UBZyyR1gz6qENnphYzxWzfOdsdA1thrv/6TOhIzEHQ
 oRtLn4eAU/+6IuWbI4RpCs7U2xxhW7fOXix/ziF2ZsU3k0MU7VGA0ddc4P58tTq0wVgJoHFT8ND
 Y6gssChCgXE4ZyiajvZnxaCu50/CksXKtPr0G17hDLMqMSEZE0QKOmMjFbPsttGgPpM3l7WqnQW
 7JJZ+wTcgjLt2zQhWBqr7AhC9m6qW33zGCG0J8Q95chUxs3LcDfk0GUNnm1KNjtC2xxlkzHvOaH
 8P5q1xbE+D9ciFwu4qg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240047

The GENI serial engine supports QSPI transfers using up to four data
lines.

Add the qcom,geni-qspi compatible to identify serial engines configured
for QSPI operation.

Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
index 8d1c78701657..eb44f1fa96e2 100644
--- a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
+++ b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
@@ -19,6 +19,10 @@ description:
   SPI in master mode supports up to 50MHz, up to four chip selects,
   programmable data path from 4 bits to 32 bits and numerous protocol variants.
 
+  The "qcom,geni-qspi" compatible string identifies GENI serial engine
+  instances configured for QSPI operation. QSPI supports transfers over
+  multiple data lines for higher throughput than standard SPI.
+
   SPI Controller nodes must be child of GENI based Qualcomm Universal
   Peripharal. Please refer GENI based QUP wrapper controller node bindings
   described in Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml.
@@ -29,7 +33,9 @@ allOf:
 
 properties:
   compatible:
-    const: qcom,geni-spi
+    enum:
+      - qcom,geni-spi
+      - qcom,geni-qspi
 
   clocks:
     maxItems: 1

-- 
2.34.1

