Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533BB3E0090
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 09:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783934936; cv=none; b=FjDQHVwJg60NCGPouL8UFkcKB4FWME8bOQPMMViuv9CQKticbAH7GaXu6T+VUC3BhxcFU+YVwTlTlQ1MXBCXhZX1DqwLs7oQbfd6fIiGoaE4LALWBHugXpts7yQ4DokdwiwPLljX88y5rl5DEwjI2LPFZwdaJ/b3LFOKbmwrF9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783934936; c=relaxed/simple;
	bh=yiYdgiJqd9IrcyVppfU6gBuaofPptGycHJJtR/oHevs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B5f7LWjW+cxevdoOEgdiVXljHYV14OBsT0Hu+XL4EDu3RJsP+kkasvtch1YJs9dVqpIt0mLyJCf8W1QcKDsNZsk9lkaA8uSLk/S41LWe13I80IDsU3f19kgZbohlaNpEuBvvAUGSCOYr+BsYgCiexMdGorS2qFga4fL15KqyXMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GIYxyBky; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U4Df+p1o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GIYxyBky";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U4Df+p1o"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9M3Ho1090512
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 09:28:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=; b=GIYxyBky5m8eupY3
	/FMWpds89QQ+q6BcylUebA41TWzsLJInO1OV4uQLUK+Iw09i4/MpKxJF7sQB2kQg
	UBhx9vwsdb9gWwC2Q0qG6/0GWNGkKIm0Pj91x84+ZAxFeoN76yv0L6PZEa4u3L3j
	z2BpAF6AmoUwyXQnxIl0ZV7pTEkBWU5Fq585FmzVXuek6zKwFW/XHPhyFhvRDnxL
	yYJdlAD2G6BipExsveIbR88kzyvWf+DwgYhVYZgnCMRd5tmicsltPKq3fXOhKhf1
	fNVnCiZ6V5qjHpK4nAA1gJIB25WIk7rBdI5aufxkmwnR9KK3qvzUlNJDsItx80T0
	zu0fhg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwavr0us-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 09:28:54 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8895156101so1736210a12.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 02:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783934934; x=1784539734; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=;
        b=U4Df+p1o70+vLqcWS438FcMycrvIwdmq/YRzQDTcKF39lPBXXpiacLbXn39EKj02ZC
         9G3bSL2wcbqE0x9A4siFG4Y3e/HwSDbyxZeBdpGa5cANFAev3wtF+FEBA9wc5yBN53uQ
         zj6nhD1k05clx9eHGv2/pCb//Hi7/R5bao5iq9w3iGZTR97Jg9Fk7wBvAgl/CC2DuWXC
         uXBVDotgW0Ah9fLCv9eP+wDOyCrGzYp2LwEOE4q7YORyJnSqkSTSRdNsYJlK5Ckv5jVS
         tVeulMu+oshmGyjMzEQa2IYhYkSuX1Dr/G8CNe0Fkfi1MSFNITJAMLQL3ysJFYywOfKd
         84MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783934934; x=1784539734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=;
        b=FCkJYE+OukDxjWkSOC5b8c8kVLsg40YyszwzE/Jpypg1+gFdLQc8BEc5o/pOkIkWEe
         30NDg3cTngjY7q6QLP9Ha8OMZ3rA7RV0WkUYH5DjPZswTUuVabQmwp77zuXSoZTZKgsG
         kxmdCzUMnjbedkhXywg3ojW2fg5dMB1TTRAJ6xDBNO7IWdlqUdHI8OI8bUeUQv6xwu9L
         TLA7+/b6UP5HnQxi09XXv+uokN4AlBWBAiWxt+NrPLt+qUYIpD47Z4f4sP/WCJD+QCOE
         8fvHccM82oE0UIwRHhS+EgAF7Kk4KN1GEvUB4ER3oG5Dp7BorjBFGePH4hm8on3lOr64
         zi2A==
X-Forwarded-Encrypted: i=1; AHgh+RrcX5vkJY2ejuRwsn8pBPLxGqw/WgaK98Xz7bmjYm+9hnAsYQnRqGrk+JaZDcmT8ugYYA+6jAll0D1+@vger.kernel.org
X-Gm-Message-State: AOJu0YyQifNbqCBibS9eI7XT3+HkJMI5rVIig5msLTV0VeNo1eWEhTAU
	rdu8hWHtDtPkjilh9umxbByJYlL7WmE1C1ma4qQ4+0SJocj8KqOnNBFGN+emC3DYiCJzkEBkuUv
	/0eha8OOsM7kHfcCO8eh+A10d8GcrVw7o1u/yTY2GBj5APi25GuiYkkn4TsQLY5++4uSBdbsD
X-Gm-Gg: AfdE7ckdS7UGYPrtkNIMsvq3kifbogm+nu9dxnBrVI075V64dhtN+/NeFrcJxKPIBIh
	jGHtFr/EdQUyAdMp+cUQuisPcpESjKk42LENaJKjfgC6TEQT6kxrh1WOlcrhNzqiLmRZA/Vukrg
	v9ZFXnt7gUdaouAsNbAYZs22zrebpGeghTLb2qGC/e/14H9opewxZJOf8Zi12fAcqqGxsgJ5OuW
	9gGagTeM9MiG1hxSChIkkiv9KDziS3YJHnfN98NK6vPRUyAR8SDibQIRdId3qoYE6Kq+KetDMzI
	BSHHTixXpC0iHYqCTRSWfMUMcJCnhO2IEOFW7DDHFdvq9VuQW3ELYFB+GmA7QxnndXUlWyUo7JO
	f1KDquVr605IcfCzVnybpNuVxt/rhgoY6reWn4vhqhg==
X-Received: by 2002:a17:90b:3d84:b0:38d:dc13:6f94 with SMTP id 98e67ed59e1d1-38ddc137054mr5567332a91.37.1783934933941;
        Mon, 13 Jul 2026 02:28:53 -0700 (PDT)
X-Received: by 2002:a17:90b:3d84:b0:38d:dc13:6f94 with SMTP id 98e67ed59e1d1-38ddc137054mr5567306a91.37.1783934933515;
        Mon, 13 Jul 2026 02:28:53 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311935fd091sm47495569eec.24.2026.07.13.02.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:28:53 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:58:32 +0530
Subject: [PATCH v5 1/6] dt-bindings: media: qcom: Add Shikra CAMSS
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-shikra-camss-review-v5-1-db53be15dc4f@oss.qualcomm.com>
References: <20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com>
In-Reply-To: <20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com>
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
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783934917; l=1799;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=yiYdgiJqd9IrcyVppfU6gBuaofPptGycHJJtR/oHevs=;
 b=+t8Y8RcdzA2kLv4JripQYvKr9E0fZ7/IV7iHkNwE7x1Q81Z3ydtjnu0AhACBMTPXnbayPkTm9
 ZDCRrTDZrY/AXCpFjUng8Y6HC6anxDMgvAUrsXPlzZIGB4EelIZRIOf
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: oNl21QodMdlcRtneI4eGd6Cn-pCLPDQp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfXwRFJEoNw4adx
 5efUIg15E82PrIn2d6x5VgKM7TbI1OBNo6snbAVWiyAHKDIXwycY/Wc7gSHbbiAr6CM3w1bnQMx
 nkC/Ks4ahvCo55KDPUNv20SahwdLqLrbLIzBI0tyEFjKaXZSZx2FDhi8yQK80fiWcUpub06nCZD
 qi0BG9lNRzFESUoDMbhoZ/oL+aVob/vt/9ICVgRRBxfD9HTGFpzsh0wDfsADivOtHnAyJB+WlQ8
 s1IW0ABmh4foqczOcQcxYKCv+u4+Kv1mVT/ukizXP73st5fuP6Ky2oVXY5ADKP1993kTfXgQuKH
 xdkgNcUENA0FEoakOT3R0VesQCZloj5zS+7UTmhXJ8zKzzybvltfjdlLmorJgeODpg0Ltf2EUDQ
 jSsxml++hN3yK4G5dAKF9OV6baCpyIqqIYNGQ0R6V3P+rJncnPjdgycXwQUPYha3pNdqi2+bCXY
 sW6VmShbUnPlIcenh2g==
X-Proofpoint-ORIG-GUID: oNl21QodMdlcRtneI4eGd6Cn-pCLPDQp
X-Authority-Analysis: v=2.4 cv=dZSwG3Xe c=1 sm=1 tr=0 ts=6a54afd6 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=butnsgrUGOw-u3YEFNkA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfX0vKmNfLXWzhg
 jSuz9MsOOCuwe615YPSA2Hah+Cl9wlQ7gxcUFTIydj4W7s/sUyEUfMhxMeaVLqrIrnOwWNrOvIN
 Ta5dPVVGeg0+UADLBg2jDCRNgZxSbTo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130098

Shikra contains the same Camera Subsystem IP as QCM2290. Document the
platform-specific compatible string, using qcom,qcm2290-camss as
fallback.

Unlike QCM2290, Shikra omits the CDM and OPE blocks, requiring only a
single IOMMU context bank instead of four.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,qcm2290-camss.yaml     | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
index 391d0f6f67ef5fdfea31dd3683477561516b1556..490a7f3a8c5ff9c624f46150ee651793811823de 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
@@ -14,7 +14,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss
+    oneOf:
+      - items:
+          - const: qcom,shikra-camss
+          - const: qcom,qcm2290-camss
+      - const: qcom,qcm2290-camss
 
   reg:
     maxItems: 9
@@ -76,7 +80,14 @@ properties:
       - const: sf_mnoc
 
   iommus:
-    maxItems: 4
+    oneOf:
+      - items:
+          - description: S1 HLOS VFE non-protected (VFE only)
+      - items:
+          - description: S1 HLOS VFE non-protected
+          - description: S1 HLOS CDM non-protected
+          - description: S1 HLOS OPE read non-protected
+          - description: S1 HLOS OPE write non-protected
 
   power-domains:
     items:

-- 
2.34.1

