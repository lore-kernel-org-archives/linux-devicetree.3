Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969013BCD23
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 10:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780914842; cv=none; b=aNC+jITaaZNERl2UMkrVT8yam3LjpyrhI6FoIvHz9jFUgFmidpy+IHm/ECYMATmCEg4VHnf5R3zPEBFbpnc14GFUxk79iNFS2+yEY90ITN6vv1laKwmzOfZ6ablOp0jgOkNbThU75mHc/1aqaBo7is8a/SaxiyWVfck+yWbzg2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780914842; c=relaxed/simple;
	bh=xfmMWsDouZv6OXeWAc4X0/D53NHs5zWdAq9X9Mc1eIA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d/6jSwo3LACnBlWzBh2qmTK2xRX2BNJpM7xXiLO4EltYEQlGjMjj4v3Sko8IKrQHnNC6LbAt1ETOjFmxQhYPBkgScD3H8ip6s7pcA9samfV8J0AahmAvcJdg89MZZklsfcWsJ51FpCNl8v2KJAHqCkMOCtDCXA6dt5WxxoRbabI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ULKQ0cWN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kKISp78X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ULKQ0cWN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kKISp78X"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Odu02385840
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 10:34:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pzJyfsYOmcL
	jIQqyBfcVMuHq0RGrLlrmlr/KgSBSmDs=; b=ULKQ0cWN9grF5IatkvqlbABUwG5
	VjgMWChm6i4G7c5OdHP9vfzHhwDRCirsPhcYwrgjyNArE77Qq0OC1gI8IP5s1X6e
	/T7BlqKOl8tSz6sqE/Ux4sv4Jt25iDcx+q7CzXb7PORyVixAyfFwM9f1HHqUOTB/
	NX9NfLdSw/IurshDZ+p9b2HGg9MmtIOxIQjrE/0rl4m3J45ne91bTGKtcHNwR3TB
	XfdzcHmSrB+I65Pb2f14HlgBIMuLHtTGEQVvgVgHY+XWoFADtmyzMIbtSO0OzuLt
	4JlovDUvKTNaQPQAW5QFqie7xcDBVF0PzkJ1RINAxY1sUodKts+Da/Gi/EQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcu8y6r0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 10:34:00 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8423f24dcedso5269341b3a.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 03:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780914840; x=1781519640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pzJyfsYOmcLjIQqyBfcVMuHq0RGrLlrmlr/KgSBSmDs=;
        b=kKISp78XXETIpEcI2DYdgCucjqdPKFSJF4O5CFKiAKmlssiRSKtImG1Iu+zMFVyJ0l
         3gCrBWUicZ4LvyVjWIGoX7bMJUP2T/JgvILJLXNL6sWo2x7Ut4/XKdl6eZjviGHFG5cQ
         wv/nq55WD78lZM2KnTfW1/Ho9Q+39qg+Z7RpMunZ1vj4BmUjZ1BDC+YeywUheMwKEN0d
         0+N72tro2y9OKOFg9zPQ1AK4mYbg6iYaVpZpKbe9gPc73pvo6pH91P+CelHKBLRcbniE
         8Nqt2hePPVvVRawLSMy/AGrJ9GM0nzEh6rjSg3ePmhJsaJ6qoFL7DOXxzHCyR6/+Ak6f
         uRjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780914840; x=1781519640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pzJyfsYOmcLjIQqyBfcVMuHq0RGrLlrmlr/KgSBSmDs=;
        b=dvSZGCUZmecdwpZl2Bh2MySmifZzNqKGTfe1nWnxRYdsCjzE/aA2LInQXlypkOkxjz
         +jKG4fZStRzV8brLGPv4WRTtpQvIr26OCHNdvjhGI0vt/Hi8bgL1JZ3OyKG/nZVWzPMh
         IGeVxJ+NyoOD1ATQKK/d+ROpPJdFJ4rr5yQ6q8dFx8yjzIfezTz/6tr3tKDe0yXQ+NkQ
         kNKlxuxScNFcuj02RkmSu/QPYmcxXswAvM0o5P7Kg1xTDvlhbBzn8qQpGjoAcppGDWCM
         lC41YNcVDsYZBnpdkjJfX+5P7qO2L8q85Vw+4T6FcWe9XvJq11vUo3Z9LP0ymlUQxva+
         Vhzw==
X-Forwarded-Encrypted: i=1; AFNElJ+BkIbs0TcSKWG5jVjKs6sGu57e4prGe2WgkBljhhAHwx0lUpao1RvF4TqeTjnejIsSp2NsVxOV+vpW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+HdbOhT71pskpW0VwytMHVUVkVIEqRX4YGqaJMQ4mRh2gHaOX
	Xmi5avQ8taHZ/Xn3DXiySLgnjM2su0THC1T8AagNB8/shYywf74aJiXHPmxokb5csnvC5hDDWjb
	guWiQfHYVV3F7cV1KpKhHjyQA6vPplZOgZRaM5CcxGqiCcnqyNpHDlgVglaGESAce
X-Gm-Gg: Acq92OHwgIP9ruxolBPsfxnmp7gCEjCdPMVmiAB6jKfLliwkVdQpSSwpb2Tq87QBBR0
	iioXNphWTnBHVjQZzP+OBPetGhsKCdVb3v/6S/Xh80FMy1RkxkxUEc48wLcGmYKpDhgoIaExzFe
	3prKWFb8K6F/t+wj/0ADiTtxg2fuTOJf+bRl8895sh1W7a08wQgVQ3n8la8MERMwcSbpPNe0m18
	qPpeHdKyxiIgIJy60moryu9Lw/3xRgPGgUQys4a0BBj3xp/j0NfaonTdHqAonF+FCfFE4ZB4M4G
	3eTJ9pNHY7OH9zIh20hhKmYOh1nlvPqhP7kGZf6qKQZv691fylBE5uHExM5/VIBxoPE5J/zHdo4
	tT3iDDeIrOnfUY7PdTuvjCUW/hDj/1nn2vMK1G7P69p17HsKz6GHmg4bykbCUqL8VK1CLaByYq5
	Qs+RgDYkGcytEHBYKy9S890ymuTAiPChcAqhOaHRghhQWxZRCJ0F9th923E2VuVw==
X-Received: by 2002:a05:6a00:a224:b0:842:670d:f6dc with SMTP id d2e1a72fcca58-842b0e3d2c7mr14941303b3a.27.1780914840365;
        Mon, 08 Jun 2026 03:34:00 -0700 (PDT)
X-Received: by 2002:a05:6a00:a224:b0:842:670d:f6dc with SMTP id d2e1a72fcca58-842b0e3d2c7mr14941268b3a.27.1780914839843;
        Mon, 08 Jun 2026 03:33:59 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842824a2600sm18571570b3a.27.2026.06.08.03.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:33:59 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v2 2/2] dt-bindings: phy: qcom,qmp-usb: Add ipq5210 USB3 PHY
Date: Mon,  8 Jun 2026 16:03:44 +0530
Message-Id: <20260608103344.2740174-3-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608103344.2740174-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260608103344.2740174-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wG-hNnJBg6h8wmjUjb1PXMv-j8cXGvLu
X-Authority-Analysis: v=2.4 cv=deGwG3Xe c=1 sm=1 tr=0 ts=6a269a98 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=WI5TtnT-L6ZHCY-PEAAA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5OSBTYWx0ZWRfXyvzzdUYR6pCq
 Og6b11KNSu/cTi/OcgYhBS8/yzvlY5K0HScrCuUcS8tK3XyNiLRiosk/A9Z2Zbcq+lurRz3muAH
 Hc6rNtBRBKlqLHOm7fnicwTF8NokWzsLfa+y2hSYSaCRBtsxAudvabYodUg1YsLCW/T5LcEai9X
 OX62UxvPLxl84dwA57zyVUZ1wPwbCbLdkOJgU81Cn7FOkSGQFU+xBTXFXOguBF4nprgtgZKw4+Y
 XnF8Q+Bv9Dil/yP98BL93ftC6GQa1hMsiTCn98soP6gqd039d12sIG6r4L8khrQ0vRsxucxrkWx
 BXn5aUu8H0SoeQchP9B0rZaoacJjJZNFpHYDEo3MGp728IzXR7q2iY69Q8okJ2I9brZ39RFLA5K
 J4tzw2CB4JG7M+nXtd1OXJI0SExM2mKOh5Fdk/YGIK5pmHPWYTd473pP2gjx9+zSNDdOhvsEhxz
 T3ZNKscMdq3NPvOWMfg==
X-Proofpoint-GUID: wG-hNnJBg6h8wmjUjb1PXMv-j8cXGvLu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080099

Add dt-bindings for the USB3 QMP PHY found on the Qualcomm IPQ5210 SoC. The
IPQ5210 PHY is compatible with the IPQ9574 PHY, so add it as a fallback-
compatible entry using a oneOf construct rather than a plain enum entry.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml   | 46 +++++++++++--------
 1 file changed, 26 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
index 623c2f8c7d22..01342823e57f 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
@@ -15,26 +15,32 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,glymur-qmp-usb3-uni-phy
-      - qcom,ipq5424-qmp-usb3-phy
-      - qcom,ipq6018-qmp-usb3-phy
-      - qcom,ipq8074-qmp-usb3-phy
-      - qcom,ipq9574-qmp-usb3-phy
-      - qcom,msm8996-qmp-usb3-phy
-      - qcom,qcs8300-qmp-usb3-uni-phy
-      - qcom,qdu1000-qmp-usb3-uni-phy
-      - qcom,sa8775p-qmp-usb3-uni-phy
-      - qcom,sc8180x-qmp-usb3-uni-phy
-      - qcom,sc8280xp-qmp-usb3-uni-phy
-      - qcom,sdm845-qmp-usb3-uni-phy
-      - qcom,sdx55-qmp-usb3-uni-phy
-      - qcom,sdx65-qmp-usb3-uni-phy
-      - qcom,sdx75-qmp-usb3-uni-phy
-      - qcom,sm8150-qmp-usb3-uni-phy
-      - qcom,sm8250-qmp-usb3-uni-phy
-      - qcom,sm8350-qmp-usb3-uni-phy
-      - qcom,x1e80100-qmp-usb3-uni-phy
+    oneOf:
+      - items:
+          - enum:
+              - qcom,glymur-qmp-usb3-uni-phy
+              - qcom,ipq5424-qmp-usb3-phy
+              - qcom,ipq6018-qmp-usb3-phy
+              - qcom,ipq8074-qmp-usb3-phy
+              - qcom,ipq9574-qmp-usb3-phy
+              - qcom,msm8996-qmp-usb3-phy
+              - qcom,qcs8300-qmp-usb3-uni-phy
+              - qcom,qdu1000-qmp-usb3-uni-phy
+              - qcom,sa8775p-qmp-usb3-uni-phy
+              - qcom,sc8180x-qmp-usb3-uni-phy
+              - qcom,sc8280xp-qmp-usb3-uni-phy
+              - qcom,sdm845-qmp-usb3-uni-phy
+              - qcom,sdx55-qmp-usb3-uni-phy
+              - qcom,sdx65-qmp-usb3-uni-phy
+              - qcom,sdx75-qmp-usb3-uni-phy
+              - qcom,sm8150-qmp-usb3-uni-phy
+              - qcom,sm8250-qmp-usb3-uni-phy
+              - qcom,sm8350-qmp-usb3-uni-phy
+              - qcom,x1e80100-qmp-usb3-uni-phy
+      - items:
+          - enum:
+              - qcom,ipq5210-qmp-usb3-phy
+          - const: qcom,ipq9574-qmp-usb3-phy
 
   reg:
     maxItems: 1
-- 
2.34.1

