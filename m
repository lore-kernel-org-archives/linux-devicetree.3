Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7AF3AE1A9
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 11:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777549999; cv=none; b=S9v0Y219wI5zKqSLONiJ1/E/AZv+bgaSn0RifseaThAajNyOWhXC4MhxJhLvFiX0YFaKD01P0CcB1WhckcWRXf4ovIlOYS1pHs/DAYd8EXNYYoBtBPOJOg4U1DDm4h2v8A37Jaw/EG0PTux7a0fh2DEIN8mEeYOJmhPvc7WGs+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777549999; c=relaxed/simple;
	bh=x4eVVNS846ZQHoUs7t/meAjByiBCXhn5YSzxZvcBxhk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mtQDk+BSwanvg7RhI+y1nBqTSiFdMIQzguXEyPmWff2cSYqCtZ2z+FjHeDcVW695mWCqjKfTGDfmPNPWpsveCl641Lg8s4zmBx28ukLHbE9upxCbzsuwZNJz9Mtlw35hwZKW8xjfEwN+dG21kRpJQRHugvs9qsDv7A/vOZ0vDcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CoA+SLq3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eEyDmLwK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CoA+SLq3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eEyDmLwK"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UADsOr007817
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 11:53:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X9V8PeHe2/mRLE1vPkwLpjp7J9AlNjCRzuuPJCoF5Ag=; b=CoA+SLq3XMpGblAf
	+E+Vdu4edKZLl3GX0w0lSI8hFwTAMt2yHMPOXqFMlUy/QH8vEgqAjqjSzPa3WgRd
	zVxbdmpg4dq0UV1CVFVPiWCIVvzN2U1RO3E9vfSmN9Xhb1C5HNHOkSwYKvAxf3oV
	KKTo0hPVazt+onvmS2X/p5D+fSyOfkMP+KX5MtJBfHGXusNGXlWd7neI8nyqgYV7
	lF7InDL+GOTAVSVBz2qjXjpj+b619jg/hA3z6draAA3NWiGjPEzBGUO3rx+i3EOG
	zldJBlfj15y5MYyf+ufqy5wxPZ9Cwb6dpVpkg2+pQk6QG141fbs+43/Q1RYwoMG5
	eYFA4Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv54w8ffa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 11:53:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2e6ee9444so8357075ad.1
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 04:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777549993; x=1778154793; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X9V8PeHe2/mRLE1vPkwLpjp7J9AlNjCRzuuPJCoF5Ag=;
        b=eEyDmLwKFfp9QGcghY0ykMDSzYkJJQD3L0Om75bmBoHcA1AIbpCpq61TlL3VrbW5X1
         VLCROkcrY2v7FgvL/0IWTRCR4VzZJZp38uZiIN5oAeC6GXiaIqTiFkB+oQq+XoEbWivZ
         TuDJWIZQBlpt0MC5UFuQSJrn/q5DqFBwHgPNV3D3g1P11AK6WMWfTri44zgClQBZ67fi
         3/Tcd8KStiwaChWIBL2r0xe1yJt8At3UFdCTxe1+ZdzUZY/RlOHFxVQUu9DUeBxVTWSF
         nC4qVnrRB/Xu/r0XruOWFfD4ALKMG3LYuCsP0cbSjMxNTVIfL3wznQzOCcj0F1GS41tp
         kK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777549993; x=1778154793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X9V8PeHe2/mRLE1vPkwLpjp7J9AlNjCRzuuPJCoF5Ag=;
        b=gHCRNDPnRHwB0qp+shx4VkhMQ+0/ZnfN6hrVn/4WyYqWUAcU4YcXwv49/8lYGi9Kdn
         eDwTacFgkHyRZqtztFQK3/uT3H/fGNqE/dNFqFQF3L8thgwmwqhgoctHFdHefCVPp25Q
         7kbxGPBg1lQU7qnMZBTgYO2t+V7YtiJszqCVqRweHnsx774lpFIbh6C5rpdctgHUUmMW
         deQidh7L7la9Ing7p+PI3pEKZtt+YyLJm6yj6GuWNxOwIz8MIYPDBwXhWPnMjf5VT64Q
         BW84JPK6xivmCBMkSF9nPv3hZ4hVheBOq63JgQ48rRWzBzDzm5FDb9RcvQoQeab9Vn/Y
         PyAQ==
X-Forwarded-Encrypted: i=1; AFNElJ+8dwnwvM8Hal+v78UXQLmPoJtDvrS2R0xiC/txIiY9Av6KDZxjQ94OGGnkDkAR6F8MdjJMvzW+xSQ3@vger.kernel.org
X-Gm-Message-State: AOJu0YyyB8kVL903voC7PIMzNghTL0ny6yMmNl8XRHXVUHJB2jsR+Zx2
	JK8Lqo9GMLo8rcD6QsK11aygWbXp5h/hnUnyvrj53qHwRrJZHgLC6ivTZ7k0rHB4oJk4lpIMubV
	GlAeZXHzeCVjRrxZQAPvs+k07QD8z5y0v7xFxAoXX9CvDu7qV7SMB8hCiEeIhGz54
X-Gm-Gg: AeBDies8FU/EuxXCVTPDRcxLgx9NVh4wJBPLEn8/uBdjX41WoVBIOErQGYLZvcuxC28
	A+YiglzXfDBmhdlJouu0QWjuYQP2wDHqQWyMVZL8apTSAk/l4ewDYRZqSJpzeJZ1TmnWGoXlh88
	zBSoH5tsI0WDlyOMnw0xAUnJYudsYq7OugyKbASxYP4UP0stoaSXgoqz0NhtPufpgbj4vJ5xoON
	hCO3jCKUjY1kq+muhoI05P40cYET6h62mQ2/UoB9gtx9ClEmqUVAygIxai5V9K0kOUl9TJqmjtf
	GUGkO6zN4lWuxCO82EOeCJgCaqOlP0ku1r+havQvXwOsFNeApcwqy6w8eGYlFtv7XAIDMn4qdkK
	bTeyq9mFhogs0MjDjWo9O5Uc4NfHxudGZJBg0MmBpTuJx5jI=
X-Received: by 2002:a17:903:3e25:b0:2b9:a6d7:8da1 with SMTP id d9443c01a7336-2b9a6d79d06mr13556965ad.19.1777549993142;
        Thu, 30 Apr 2026 04:53:13 -0700 (PDT)
X-Received: by 2002:a17:903:3e25:b0:2b9:a6d7:8da1 with SMTP id d9443c01a7336-2b9a6d79d06mr13556735ad.19.1777549992695;
        Thu, 30 Apr 2026 04:53:12 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988971138sm53834955ad.70.2026.04.30.04.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:53:12 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 17:20:26 +0530
Subject: [PATCH 1/5] dt-bindings: usb: qcom,snps-dwc3: Add Shikra
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-shikra-usb-v1-1-c9c108536fdc@oss.qualcomm.com>
References: <20260430-shikra-usb-v1-0-c9c108536fdc@oss.qualcomm.com>
In-Reply-To: <20260430-shikra-usb-v1-0-c9c108536fdc@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777549983; l=1275;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=tOSyAo4meh2wJat6NRjzhY3Pkc8uEyXIKCYEmOZPudI=;
 b=3CeDKdT4BBdhdAZ4vvdHoJ7wHxcu5W+RrQeXH9F8VuUOb3d5NlP/YiEO/+US8kJiIee9s8pov
 OPROWHukQNfA1DECuA06jqwntdAGRgH+xBOOcDo4Nx3UJjHRMSFeZqL
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: KYG5fTTYlze_K2TEK5kTEOXG7zditrye
X-Authority-Analysis: v=2.4 cv=Rrf16imK c=1 sm=1 tr=0 ts=69f342aa cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=mkQ1ARZptfdP9UuQ85IA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: KYG5fTTYlze_K2TEK5kTEOXG7zditrye
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDEyMCBTYWx0ZWRfXwhhLPyat6j+n
 h6D1FdEaPCT61ae0HrYhlEADvJAc1WhQ2zp9mz7d4WQYKt9kb7CjowDzHbKsj1B/Dah01Fi/g2I
 rXd5TtA60Ozl/vF35dMOnBIrT0yXseoMLLuZdEhGRZFO9lPmaj4DeaY7PRQ3ik18IEfifL293/Z
 HOV1vmj4FWA3Z8zs+3pUda6Nobp1xbiz5P/cJwCo8BGiqyDBn3mj1fFLwfpBnIheWG21UMDR8ep
 WVZrUvrTzNs7QooaNj2klgNa/p0OkwVX1ZXsW2Uix3UTkl8cP5/x3w7MccJBLwADN/cUGnDKBkO
 hOu0BJdDthnnwYdHLBPTBbU2pGRPLb0J438Ehy1dINtRi87DxUoox7BkajaqIdKmwn583JtR8XR
 OT09TkDkJzTMJzemSLX60S4pj8zvTlvproTjzxWn8mWhh04me2kvZmEXMNUAqt5BeOJywChfnLi
 J1JNL++vHtOVn7XCbJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300120

From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Introduce the compatible definition for Shikra QCOM SNPS DWC3.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 8201656b41ed..68d0491dc653 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -60,6 +60,7 @@ properties:
           - qcom,sdx55-dwc3
           - qcom,sdx65-dwc3
           - qcom,sdx75-dwc3
+          - qcom,shikra-dwc3
           - qcom,sm4250-dwc3
           - qcom,sm6115-dwc3
           - qcom,sm6125-dwc3
@@ -386,6 +387,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,shikra-dwc3
               - qcom,sm8350-dwc3
     then:
       properties:
@@ -456,6 +458,7 @@ allOf:
               - qcom,msm8996-dwc3
               - qcom,qcs404-dwc3
               - qcom,sdm660-dwc3
+              - qcom,shikra-dwc3
               - qcom,sm4250-dwc3
               - qcom,sm6115-dwc3
               - qcom,sm6125-dwc3

-- 
2.34.1

