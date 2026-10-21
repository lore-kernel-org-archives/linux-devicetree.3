Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792568243;
	b=wKusDQCeARI/ulujK5L55vlgzSgIdDwFJHcOPvSLldTtU1BtARGyXevJ0Kv7JYkKFoHT
	 Mqa/W3uY1SrH2p8dsaSFVIwh2f2zpvhc3hJkGvNI9IcRjJUg9ox1frestgT7ARNCvEPyM
	 xDsGXFxKTnP4/nJZkUxKfBsuqfI3h2AQr4ib0iBdKiFMrriJ6QmzgnpEcXmLGQekQuNJ2
	 oVtPRwFNrK6UIQztT0zVI0h7RHgyzkgxdmP6jiLdUNk48Teq2F6syxnG4ExzlZESzwyC5
	 QPCkHcmWAR7yXwtgJ5Hb4hKs3EptTfL6MIy+gkHvuGtHgd/Y2bA1+uthrbAvI8QCUlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792568243;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xFjlgVkkBc5JN5V4EJlSw5WFPM0IiobTdOr1Wh62s1Q=;
	b=tdXjmA8hChVot6Xhc2PYoDyXwaEjCHcKR88EocEZCA3+fTZuO/ryGlV6C3fLzSG+mp63
	 C3ovfFzTUPpI+mkkl/q0ByhV4TM2Cl1gqauAvBUzcjs/Yq+gejD46aPEsyXuLchGfCSq2
	 vHslHZH1Ds4hcDGF0w6nFtNg+UoKIIJYnYwLELArIkQGUI7dE61clfH/KWiKu0FvRbbKY
	 kl9IAsCxHCX1MDZEc/5KcIxthHvDbkDn69UBBqKrHAEVeJeFIgDBnPOWg0Eyh+oMdhKtu
	 UY4jg9u7IBQ6u2VY8UDM081N4MRZv1Gj2fD/xwUHTkUNDzdwExqFsbtwcuT/f8D1/4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EuL4TOi6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jedbhIVG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67A560A2609
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:37:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A67A560A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EuL4TOi6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jedbhIVG
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jCEk3711978
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:37:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xFjlgVkkBc5
	JN5V4EJlSw5WFPM0IiobTdOr1Wh62s1Q=; b=EuL4TOi6VdzJ6Lyn5azxY6S7176
	tyZj7tTeneP/jkP27UOzjQ5YylbTBveqHHe8i+r8U3a1mKzkRk5V+1lW9Z679yM+
	2aK0lZXV4Q04vOt988wMIHd2pPYTQb+e/F9Uyp5nNS3+X0FroUo6UqStTvccbNkU
	6LyUiZwd5Lel33xOoJas16+7TT1Uv6OUJ82mGEs5qdDDk/sQghOYTGrsCg8Xt+/a
	pHCR0QDScNXPkmcHoLcLJeYTqacWR3MePk8d+e6rrCSJ3xvKbxInEATx29h0/69L
	0Gz6NeCx5uTOiWTJbGWodIWOY8on2D/TTcUvP2y5N/sSmxrPcYU1oZZ6h9w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v2mgf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:37:21 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3425098ae4bso2390502eec.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 00:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792568240; x=1793173040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xFjlgVkkBc5JN5V4EJlSw5WFPM0IiobTdOr1Wh62s1Q=;
        b=jedbhIVGPXEJpKEkGhWb95ZWA0cuqjdmepNYvF6LtCpnLvYaFOv841RHOCTS7dcZNW
         6rWEHpcrk4AVKmF58JyJZ6myH1hfMmhMu77E5kDWiJxdamGuKWnZgxLllohiHBIn7VL7
         Ln+XsDIOZkXEw2i2vYPlV0B8D5iiis7KyPiJDDSQaVfFjoudZmk0wAjEqZB3MeMSx8tV
         LvCZPwpOkBkpAmjNejZFg/BYJlBcgZshZavpWNdy2/W3xnfi7F/8vT5cUuasKSl1sTsq
         7eDARGOuDxcK/jjiVH6l78KdiI6SlsbeRJq43N0mtFYBhS4y7UVc/anABiop5GZiXLO4
         oTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792568240; x=1793173040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xFjlgVkkBc5JN5V4EJlSw5WFPM0IiobTdOr1Wh62s1Q=;
        b=RNNcXReBVx13V+6qAQEowb4FBXTs1hNlIWPkQbP7m6tGTH7m5AkGlWF7fqWjav5HRK
         27xHI/VQz7W0e5wu6HQWQAHTrYyVDBplNXQUc4KH//Q+m7QGVj7xr0Xv7RHxDoQ4AyU/
         XzT34HqaCrbnEIvTrB7/wtk2zGKiyuwZ2Zscec5XCFikdjHb6Q1xVKJCpXqgxDcX2Omd
         l1sA7IgU10BDYkNmBAyMhp42sfJ9hMytal0iVUX0BioI6ZYz/YvXrGzu3YU2jht71cuo
         uLBX3gPMfiv0cywrUGcsJvDaPcjZdXHQ2/DBWCZJmIHT07+xlcwnQgNTHDK45Wj7+EEZ
         8+tw==
X-Forwarded-Encrypted: i=1; AKwUvBzNzQDAnN9zhKhWjJqa9rkHD9BeNteTq5QK393WaEtQi7Tb59iRjJZghH7HQivEDrzxOjd02Tch/fRz@vger.kernel.org
X-Gm-Message-State: AFq9FYKAq7dwy9LcA6zmgUXeQKuaBnOiupS1xw49RIgEXmO22rrQFyD3
	fEywTFQvPFkqhbYThas6EunXXcELNiygUVRunN+Z5M6yLx88P+69IQFHcM963E0U6poFkTLkcXe
	n1rfL61asBZ+rlXhz7tHsxSJ2xyJ64PHks0u9InNU6WMoExIhJSzjm1moAM8MDBzL
X-Gm-Gg: AYBFou1xqfzWg04gU9HD3p3NVEeuizo2E7OU+yCJbIofF48JbJ01GcPqXVbCE3IIhTY
	FuTgS6w16YsrfG6qYqrLQ5Gg+Gr/A+1Gu0Mh0fHcmJpGa+iO5K2FodTPFzXXVDfKUVlFCdtoQt+
	Wz7dhh/0zIytBqD7dE1JzdzSJrf9DBtZpqlaSK+wpNzZEA4EnSwKh3YTthiy1NF++8SUj4gdzYd
	cRfK94m5fPE/NeXU4bP7XcisR937Acc1KDRg7IyuZbuB1ph3/z/PcyME1lOPwq2gxeie60I/LRl
	yAJ8Z5XSJNhgF57eMMhL00emudsH5FqsIOMnNrFL0d6EhSvF0TecGBe6X4kEGTl+UEn4Z+z88jK
	EfQcvNy/oe5qf6R0MduZuRaaCc9CxCytHCKQbDwpDC7i6F8Woh8f3QTxcCSk=
X-Received: by 2002:a05:7023:d07:b0:143:3769:c680 with SMTP id a92af1059eb24-18dc14ef3cemr6480200c88.25.1792568240420;
        Wed, 21 Oct 2026 00:37:20 -0700 (PDT)
X-Received: by 2002:a05:7023:d07:b0:143:3769:c680 with SMTP id a92af1059eb24-18dc14ef3cemr6480176c88.25.1792568239738;
        Wed, 21 Oct 2026 00:37:19 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d0a1sm4042471c88.14.2026.10.21.00.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 00:37:19 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v2 3/5] arm64: dts: qcom: nord-embedded: Raise i2c18 pad drive strength
Date: Wed, 21 Oct 2026 15:36:31 +0800
Message-ID: <20261021073633.2163128-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
References: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfXxF0e/r21MA32
 dcG4CRE4TtULMnFEIiGL28aTvOz+gEmRTXry1hpY9ULi/NZfyDsbX6oFjpNx8z/JiPb73u+Xfga
 cKJZGuhJyGl6h2lbaWyXjt/aZFb6glk=
X-Proofpoint-ORIG-GUID: Dnv5SvViZaRg_kUWGshQNrjviX4w2GOw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfX0tx6rBJBjQXZ
 PSoHXZs93TbrsdflBLUn7tGITKoTYkr+31Erp4MT1VnRGC8ylhH9LVH8eTC+Z+4VkhRLfiaNmJt
 1NmWj5UJThzAVdvIH5IeaNjdlT4QedjkG5V0iRL7J6rKhDgNS1KQcEzYZh8ek5x4AxIkP5OLSwD
 8S3McGO1IDDqdncJNAWm9a8BXLMWAVN5ehLFIoxLh2RD9kEGL/5b7va2Ft34hyjp5vaq+N0dPxY
 4tHOGEBnE3t8So+e4m9NZHhnNvgrQuHZw1SQz0F1OjgERa1vR9QEL8mlkhXTdJQlmiVjxKayUJj
 PGalDGUy/DJJKrayOAm+tdAKcnSrgbdUEtfKGBdaa9poy0Frpm6HSoEaD0yP9wcDgZl0yD8ax6o
 c/xjc9zd7FIKT4iWw00iw6SNKAS8JSwkufgaOqP1uRv3SKzpC8FGJ2uioP6PrTDWoTss4WVbgKc
 RBMjsNkVe8x4/JvLC0Q==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad86bb1 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=W6k6ulCq1w4nxQ-T7_IA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: Dnv5SvViZaRg_kUWGshQNrjviX4w2GOw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210030

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

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 6dc4c871f41e..1ead642254e0 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -1221,7 +1221,7 @@ qup_i2c17_default: qup-i2c17-default-state {
 	qup_i2c18_default: qup-i2c18-default-state {
 		pins = "gpio154", "gpio155";
 		function = "qup2_se4";
-		drive-strength = <2>;
+		drive-strength = <4>;
 		bias-pull-up;
 	};
 
-- 
2.43.0

