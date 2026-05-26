Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39772401A32
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 17:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779815586; cv=none; b=Nhj/voAYY9RAvsldC5LEUuHp+BjqCyax2FEn3WmOnH9/swhSjmORN8z74Dbbyx6/TZ774UqFlZmsBEgnS92aLxQ8aIP54+SoBSlRFzeBJkNFj+zMmfZE2tQIaEBx5wUH51V9o3aPyAFE4DwgzxDpQGe25hnfPNab5oiBQzI9BvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779815586; c=relaxed/simple;
	bh=dcopeyyySnOd9fL3v2swYiTB5ACAPgg1PSgm14bzBCc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XS37TiHLQiNW1sfZSpXWms+25wQslp9NyksJMqSWnJoz484P/7y/sLanNBZVDRy5DDUM7Gg05JkBU1ltOZ2OY2FCT9pnmQRiCip3CJRBJZ3rGcFBOLBbwAM9f0rgu3oxhS29gxD8HXqJ/kJFSuaCJl4Hzr4DQVcgnABJBeDPjPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JPII2p9y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eg7Z6HOL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JPII2p9y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eg7Z6HOL"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH0usc2022382
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 17:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6gMLM31lPewnCBaPI066p1pgy4In0RFum6QqFLaJ934=; b=JPII2p9yDr0AgFhE
	gBA7YeCXlr5AHJCIhlRaxmhzdJnXkug+hm7a7F9h/Tf+lgA8VF/w3obLVxis9HGY
	0P4pbPDPFA/Tx8G6yojWiFBpoKeGvduw/2WyjQw1/NMjq9dQGReyssObJwHfpcyE
	a1CxhObFWf9SYjmpKamTyOaKdCSzz5a5XjHDz4Oiz7ftccM+SuKrVWOHRMpPJMNt
	iIkO9Mi9KVhGOlMPjsWnL0R9ByMb9m6zSJ7gRM3Wrt/RfIBReADm4HnKQdrnwq5B
	lMmxAc8hPgh0PXlJtN2I0OsrpQuQ0W0knSD5VbJ6Huw357w0GaGAUpLMd2KKUauO
	N6yvRA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edefugf1p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 17:13:04 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8354503d9acso12812737b3a.1
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 10:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779815584; x=1780420384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6gMLM31lPewnCBaPI066p1pgy4In0RFum6QqFLaJ934=;
        b=eg7Z6HOL/ZnsnLocQDsUOwFDxh6IoYGNWBcOnOq3piu6jPnrmvXoabamfyL4olXagi
         7sEXIqObYpbFujC/UWpXRexFbG6GscHNk6t+ZjtrdSIgDg6MZTQfsl4NJ/YLE13IG9Ry
         HtfvrOsRXGyrosOxhJJqV8Hl0F0irr8QFAvQGBAsRkS2nqimzmCDiP9PRTsy/2upbnjn
         m3o1sjx5d5mU+ibwkf801p+6o+vl3olDu4rS2kHl2FTMx4z2kcDnfkVbZrur9C+H7e4/
         Vk70sVlLUNaWWpnaW88GPsgFH8aS+in7Fy3balf757PzaYzB+gAuhiPfNIyqEpNHsZ4U
         J+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779815584; x=1780420384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6gMLM31lPewnCBaPI066p1pgy4In0RFum6QqFLaJ934=;
        b=Xf2PIq9JcDTOwCdkZrz4ZGLhavqgH5RD5KrkaLFKsP/cMj8x4vk70ql2ixcoZX8GQD
         I9CzcvIqViavLK/tZyu4I6ml8FpAUV4XORGXKUTgep0631LrLbankiIBc5dpOKgggsRM
         tQYUAwfqMeGNFUvBTNVpDtWDrSrT8cOq9BN/5oB4BaYH82Wn1H655j7vuBbHl3e4CMJN
         Vx714ATEyzOBOpGvcqtalgBbyKOAPf1p1HJ3W4YgF0qlWRlqUR0y814n1kP9YHJ67Rdc
         A072nLJaPIgcBGnAY4whDn3fDf/EoOcT4SgGkmmXFONvDv2VpUro0VCfNjhkQXx/ZV/2
         MI/Q==
X-Forwarded-Encrypted: i=1; AFNElJ/2OqNjW9vpXzEsmIrr7CDR3OaV4J1SCzdHJfe9Q/ymEV9nfeM9bpsOnw5WQ/eOANhUjTKT6CD86fq6@vger.kernel.org
X-Gm-Message-State: AOJu0YxITmCaOQL8zjprkUjW4api05TkoQwH7AU1j62421NSA9gIDsfq
	mFzqeJ1YZu1LdGnyQd3bjw3eED5hsbqrJlVXNijDgoNdp/rFtTDZC3307qyu5dl0ftOg88421pv
	1LuvByI5KRx3w1M4Qb9RJstmQz0CMaVBmS5P0jhRW7Iprk6INktM6UfmMtzOmEVDN
X-Gm-Gg: Acq92OG6MIbKCuHg/uDWyck1BOnpegibe95Czv6LLOX5W+iZnfUyhCOEhmC9si0kI27
	HQGDhYFElEqpmXvVVDwtbDkc1IaymLb5w8LCMcRx4+D2VqNb6NT3oGq4JnaxBcPiv2n9+M5YILG
	JBEEylncd5MsoyufHCHxnyT3t7obQuS6s4d9gK9jql7wKYK6KRapQjHgJPAhRiGMqpSU1Oiu0lt
	uI/LnESUiDr7TXg6GAvvusWinZi2W5VyOA5+QhyAMyjds0fPI5wXWlNXdOxMJAdi7eRUCEw0T3z
	8/2+Ojmd3wjAT9S9i4jRiLPiyzqmjEx2ehJRl5PuvnQTxc820yPs1sZGeTc9gdXenw+cbOsrrdw
	JgK5khONPi/RHwrE6nkoRsIwZdM2WZT7clVBddDKn/grUtXgxaNoK
X-Received: by 2002:a05:6a00:3010:b0:82f:355a:857e with SMTP id d2e1a72fcca58-8415f68c23bmr19307743b3a.47.1779815583684;
        Tue, 26 May 2026 10:13:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:3010:b0:82f:355a:857e with SMTP id d2e1a72fcca58-8415f68c23bmr19307714b3a.47.1779815583182;
        Tue, 26 May 2026 10:13:03 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84165009761sm15736235b3a.60.2026.05.26.10.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:13:02 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Tue, 26 May 2026 22:42:45 +0530
Subject: [PATCH 1/8] dt-bindings: media: qcom: Add Shikra CAMSS compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-shikra-camss-review-v1-1-645d2c8c75a7@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
In-Reply-To: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0OSBTYWx0ZWRfX+9xO7mnWaWd/
 kFQCBoRwI/jUJstO0BxHEZMpOTX/yXyOoovHDCO8jf/gbii6WjQogvEnXxjNencX2+elSUwcu/U
 MMAemVqKCm3Nk14J/0VAp/yO9849LhYJfyGMSzgT2bW9KJTPlIbpKklwmXzUH9DL0yd/ZaAfyuK
 nmnDoZnYSKmqUwz0TIwGe/TOfh26YXcJgTVSWxAmmewU63m+BVtmHfICrMBsSf15n4Usog0/AfO
 F7qAFyOx+ydUaYWWwAE0E30llDnSTKhWYt487v3Bf/m4kkByQmGFf+ibrgfZsuZ64QpEguI/VDV
 BmwMzPizmY8CYG53eSqihSlC8+h1ElG909bLd3R0gBSJHWyqVO3KI2L57ZpJAGK++AzA6emknjm
 swJaH4y2CKaxY+trj3vxC9W/H4mPV/Rh8b6r7nQSzHaYCZDiE9N483LLxw00tc3qojPgECtAxeq
 PSv5KcsUdPVbgO7GjhA==
X-Proofpoint-GUID: LAxfmpN8DfjKnsdkkBqIWxwe7YGWeU24
X-Proofpoint-ORIG-GUID: LAxfmpN8DfjKnsdkkBqIWxwe7YGWeU24
X-Authority-Analysis: v=2.4 cv=cPnQdFeN c=1 sm=1 tr=0 ts=6a15d4a0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=TW5Qit177qQvJ9gbTQAA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1011 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260149

Shikra uses the same CAMSS IP as QCM2290. Extend the existing
qcom,qcm2290-camss binding to add the qcom,shikra-camss compatible
string.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
index 391d0f6f67ef5fdfea31dd3683477561516b1556..7b1469d6a1601413a1a32dc452d7d1fc85aa9eb8 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
@@ -8,13 +8,16 @@ title: Qualcomm QCM2290 Camera Subsystem (CAMSS)
 
 maintainers:
   - Loic Poulain <loic.poulain@oss.qualcomm.com>
+  - Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
 
 description:
   The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss
+    enum:
+      - qcom,qcm2290-camss
+      - qcom,shikra-camss
 
   reg:
     maxItems: 9
@@ -76,6 +79,7 @@ properties:
       - const: sf_mnoc
 
   iommus:
+    minItems: 1
     maxItems: 4
 
   power-domains:

-- 
2.34.1

