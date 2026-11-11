Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794382313;
	b=H2Svik5S4j++0RzwAuhbeUkUQfLHT1ZJj22AIvi5T4BU7gk4BUIy8AG0TfKtp7k4VuhH
	 JN7qUGY+KiRxKqBMDOpA/cPXTm/O8cTfMc/UFAISAZMkMIVmM5HZtrfNRI5gaofscCz5H
	 Oa5bt/Tmq3k8qZXCoRW58FJBtqiVZTGzPvaMZxmkdZGhOxXvMgLTymR3afMXcixJcJHIL
	 8qfluUyPa9UICckd6q81UGhlP6KaXhhT93d2JccuaSAD4fXG2l3QCIOTB6xq1y6dfYanB
	 UvWR5J3k3SMqGEnJZRA0GqJK4HyJLHbMPL+pRYKenRBEAKOrrv/MHXVUJusqZpP/hfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382313;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=whaNoV2zARA/Tl1+q9SOsPQlZziCwZUpaFnGneKJwq4=;
	b=Wk07mq6dfubvua/OLdBDS9rOqEHH+nXFSDkwzCjVedSsFr8IE1ns7VvZoU2hd4Z5mEQq
	 RWjYoTNz6LzUa7Sz2dzy0jNSv6nhUaI/BYl4+PpundnU7CnUEmqG/DrsJLB8sB0p5SifU
	 e81sglVQpmCTBSRavpaLEBy35AHVPtvkhDG7Xa5fVIf6dgh2RyyB9rALGXxtd5wmLuq+N
	 55Dw0XFJXZRmlQcDXgkRev8RoZSUrkRIv6+RUlip6IsCm9fM8cObn/ZX5cpb9SthUjsT8
	 wxaK011R8UanU/rT+aj+YwT6NakwN6IHyrN//V5+n55RDaNes3dz2wcPrA4Bi+0l50w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QSEQI1MV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HrqVv9zr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8475260A3811
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:31:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8475260A3811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QSEQI1MV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HrqVv9zr
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KN0k3958994
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=whaNoV2zARA
	/Tl1+q9SOsPQlZziCwZUpaFnGneKJwq4=; b=QSEQI1MVrTQlP0zUt+4EYMyS5vS
	PjLDejtKDC5EgRRvC8+zcxS14DTVg3bGlh+c64i2AWOSROzHqTl8kUtHv5b9IaR2
	ZWOzuCVGlpBKGMrAc230TFU2B6EfnR3VMoXwiexpppxaZ6Jms1t8mSdDlQOIF1ZK
	7pncxV0JbF19eJUsT0W6OmWiN6nfGIjqD3/ChnPm6/UrBpR95De8XTpqhC9KFrUw
	u3DIgPvuBAp7rwjgTxDW99D+74nqTtfHt/ztSOnczReKhv9YFmDXOstYXWoQA7ts
	UcrRxs9Pb80qckpjRS7pvZbFUHBXYq3q3ossHJCPUxdq1GNgzNjBYYMvjzA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv9b32eas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:31:51 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36f26e6abe9so4609297eec.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 23:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794382311; x=1794987111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=whaNoV2zARA/Tl1+q9SOsPQlZziCwZUpaFnGneKJwq4=;
        b=HrqVv9zrpRk23pX7cLtGVuRn9vwMv6+8Lv1y2c3+w23iMBqdSBDPpZuGwKR31XZYxI
         h0aN2rrYQ4jj3CYne5tZ6YO2fMPAVsi9QMaDMOyminoUyBkjG9z5I0rey190CVBIrrwE
         /SDkcoN9K/jNXoiSQz4apEvO29UxDT+OG5Pa7ExhCoGXxEMNmqZ7B5kYlj9SgCRq5uAz
         pBnUj8vhY1bq5Q6vbgyMCfDUtoWVWi6349vx1zYk9FmHg9UAut4hNKoiNEZJFUeKuclX
         QfBQfXSoP1y21/kiOJIqRP9oOkFEq6GB35TLYNVlmVJ26R5Wb6BfYop55knYqv8DEBLM
         P3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794382311; x=1794987111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=whaNoV2zARA/Tl1+q9SOsPQlZziCwZUpaFnGneKJwq4=;
        b=v15kdgUDow/NMKJq7WJ4ngqkhYpiK44QyePZOmZTVN+7O3Z/jILAgJe/J15TLsTPs1
         T+hPa974OC8TSlN0Cr1eJDHMTXuQXf4flxdFGhYFXLdUb/HimvUgKdKJjGEd0SY/SUJU
         AUKyo0r3vKyx1Iv4GYEojxeJCNOiuz5pAtRmdk+WCQ0jAiMefQg8F80HY+OnFXdrRh8v
         xbHDLkwF4EtvBMNrC2PMq7jlZw+N3Q2oZ9Td0tp743Rzg6xo976uIQ4BLWm8+ngsEpQp
         ZXdrMVECovWfYniWqlu8jpGCWo+nmKEusKBwlpDUoo7eCpUWmGGyU7bYogr5mGBzLogH
         CZog==
X-Forwarded-Encrypted: i=1; AL+hErHKXKiHkc4jYVz63ENK3Q0QpH7xY03BolIs0htoT7nZ05pyL2SQYO/nWPQjcQtLoQ8fvnyqIQXXFp/b@vger.kernel.org
X-Gm-Message-State: APuU4Z+ksatF8PvUfpHaYElX8QwXqhZnDdDn/JoEovUsUp7xSkkzj76X
	J8VqOttbZ+V9INt0GyA39zBn4CAkYGhMpFk8c1Fa9ljK1qEeD8Urbg/TwCEK6IZkyL9+vynUvJW
	jBfX+7ZDey47WTPrfs0wjiJfnL6Nfr5tuqinHMvjL9Sk6XcrnR3Vn30DHNgH24e6l
X-Gm-Gg: AYBFou3lEtduLYjO0jrOEs/qPhiFj0G4uTIRGXUe39QnZCmnv15PcZG3J7ZUBHvE8xx
	QSKWuzdmRoLPPY4N6dhT+Jy9fUNYxx5bXz1get9t4xrTAdCAWiDXku9uGYt8NYiKDD70mm8YV/a
	IpO39hr2AiTW/h90IXnlHofc3noiu44zoYROu/5maiEo++uDqStd/Nckq9OnPQKL5Lqu9B7e+tk
	U8s9xSFgzsq//uB9jeXqh+jmLFdXBCzuB9ZaFU1L5UWRS40TCcW+42Ix+EB5qHJwmKsxz82Eqbf
	egWG5ggo0Gbq8/zzXwVL1vkYn2Q8GCf0iem3Bm2Z+Vcp3Q4paGXfC5gAp2s60O2RFsU1Ut8ySqC
	Q6rshxCdSwPAGY3t4Enc8sTmQuuqyR1tql51fbW1VaDe9HBSMCPqfIZ3+eO+XUB5T31iHbSWiXQ
	48aV8n5IVjwawz8vVAw/orNd6+h1BE7Dd6
X-Received: by 2002:a05:7022:38b:b0:144:fb31:a597 with SMTP id a92af1059eb24-1b3c03b2be6mr1811627c88.47.1794382310799;
        Tue, 10 Nov 2026 23:31:50 -0800 (PST)
X-Received: by 2002:a05:7022:38b:b0:144:fb31:a597 with SMTP id a92af1059eb24-1b3c03b2be6mr1811593c88.47.1794382310144;
        Tue, 10 Nov 2026 23:31:50 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm27220027c88.10.2026.11.10.23.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:31:49 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 3/5] arm64: dts: qcom: nord-embedded: Raise i2c18 pad drive strength
Date: Wed, 11 Nov 2026 15:31:19 +0800
Message-ID: <20261111073121.3707030-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111073121.3707030-1-shengchao.guo@oss.qualcomm.com>
References: <20261111073121.3707030-1-shengchao.guo@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=GKGdgeNK c=1 sm=1 tr=0 ts=6af419e7 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=OVRx4QOUdiRTB1v6uAIA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAyOSBTYWx0ZWRfXz/GRRTj1AUUN
 BagS0X6AcI/Yp3lSoUPYko0+Q2CZXgE3KqK1OJBWJpk/0x8utLUM0VTe5OP2khSwekhuiYKuOeU
 1qveyCi5aSEFWbxA2w0MQeP85fUJajmEXQ/aU+ov9SclceVwyhJ7QnQKWlAH5v9l8vHttrMPMq2
 rVIWZXaAn/KSFAO+xw9Y4ncRbYobmO87jRH5BvzNjy+9VazLUlo58p3OwA3dTnarqP/PcNz2L+i
 IRTrTno+qszarVZ9BfcoF4xlkWNJf1ebZ9xM6DszcrH0sfLw5JnF7LBM06JuB4Ui/upl9HpVZta
 JSBFennLEg/1I67nk3dMxMtw1eyfTj7IQCDDFhQmURlZm/jGfiM8KBlYmOUl7eYekdKuM+m2U1n
 Lw/RcT8RMARKj0M05iRZ7l6bGsMCKQWsrVU+n8oKzy5xTsg7lrb7kaoQfhgGy5fXuuj2TEkPD4Y
 1twqU8hSdexC15TVD4Q==
X-Proofpoint-GUID: VFKH3kQIxXeiyZUAc7azFUuW-9SIiq9-
X-Proofpoint-ORIG-GUID: VFKH3kQIxXeiyZUAc7azFUuW-9SIiq9-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAyOSBTYWx0ZWRfXzEYf8mMQgQm2
 tRso9VPPSrxELATXOqYtRAoo8Md7vDfWrjdrWqxscxrGA8VbJl6Bplt2d/LISIkYjFdAU21IiIW
 4XMdo+71d+Paxlaqed1cnjkO255vZ+k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110029

The i2c18 pins (gpio154/155) are configured for 2 mA. That is not
enough on nord-ride-embedded, where i2c18 is the audio control bus
carrying the TCA6408 expander, ADAU1979 ADC and PCM1681 DAC behind
TXS0102 level shifters. Transfers intermittently fail with arbitration
loss and unexpected start/stop conditions:

  geni_i2c 890000.i2c: Bus arbitration lost, clock line undriveable
  geni_i2c 890000.i2c: Bus proto err, noisy/unexpected start/stop
  adau1977 0-0031: probe with driver adau1977 failed with error -11
  reg-fixed-voltage regulator-5p0-dac: setup of GPIO (default) failed: -11

The failure became much more frequent with commit 8cb5c17be3a2
("i2c: qcom-geni: Restore the source-clock selection policy"), which
moves the i2c18 serial engine clock from 32 MHz to 19.2 MHz. That
commit only changes how often the marginal signalling shows up:
reverting it, or lowering the bus to 100 kHz, still leaves occasional
failures in a codec unbind/bind loop. With 4 mA the loop passes
reliably at either source clock rate.

nord-rrd uses the same level shifters and has not shown the failure
at 2 mA, but that appears to be margin rather than a guarantee. Since
this audio I2C arrangement is the reference design that customer
boards will likely follow, raise the default in the shared dtsi
instead of overriding it per board.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 5a1520e436c6..003c5ba2771c 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -1255,7 +1255,7 @@ qup_i2c17_default: qup-i2c17-default-state {
 	qup_i2c18_default: qup-i2c18-default-state {
 		pins = "gpio154", "gpio155";
 		function = "qup2_se4";
-		drive-strength = <2>;
+		drive-strength = <4>;
 		bias-pull-up;
 	};
 
-- 
2.43.0

