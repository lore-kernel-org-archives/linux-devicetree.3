Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D3743D4EA
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784717762; cv=none; b=R3sFRnHR7IO0gHRviLohlOZdmhTTuY9DiO1srkOchju0Am2yB4TUQ60dmFq5OjTTHMG75nKw6SE7pFJaGFKW+8nFuAIgh5QDbhyz7plt7d2XUhgdyUs6wBEowbVyKo2l7pZf6/qwW3J2SxF+zR4U4z5Y1ebyAPLiLIQVIiS8HgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784717762; c=relaxed/simple;
	bh=7lAnEboM05pxKLJKuQkUK/+Xj0N55Uc3icMOdr2M+eM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eHgPjndOSa43L2aP8i0rFqNcC8UPdkUTZMQ+8BQA2I260OaVYac21zfJv//+MePvDIyuWV7gK/uYY3jyvjApVPm92eyK7cR/Gydz6CkZShiLlC7MJOZiZNdnejIDwjnJA/rZs+kydScIn6c46Ny7hYH9+cNVipvMCEfrZZwZRTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RzWGUdwH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E+X4zF4i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RzWGUdwH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E+X4zF4i"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8x72o383770
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:55:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BIETq0q+ZXab0uvSzqdPRZQrHX1hfSH66MKbozuc2X8=; b=RzWGUdwHqcKuvZ/r
	InkWr5Ui+x9yrHQGGn791tSZfXfQihsMuUh4GuKlMTi91tuncT5y93T0vlUZodQF
	nWu1Hzipb1RphmcbHELQY4L+8sDCTVG0jvbVKokyEdTeF6zXxbLgZ9PVHsdfpCVy
	8rQU6LVboMs+7XTEwqRorMte9I+E3uONBPoFT9SJzXzyGpxL4/SE6xYNLRpZCQ4l
	pY42+V50cXSzd7sCkAnzmGXOsZWiaK9TgXhOjiODLCTVeYlF51kJfo/Hxax64N/S
	g8LImcW/go0mmpJWMlnr9pIe3DhwbXY35jkiMQvn1YsO0/ayube3FdfE/9MuNszJ
	Wufnbw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjs928wr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:55:59 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so7822270a12.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 03:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784717759; x=1785322559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BIETq0q+ZXab0uvSzqdPRZQrHX1hfSH66MKbozuc2X8=;
        b=E+X4zF4iPp60spcRgDP2NNw6u5dK0ds6jbCjAAut7x1sHYSQgeaj2/aacWMiTsMjHo
         y6vzCXe7+IX74UDfY/7l6eSMk9F2GYjuwfe30SPO1qMF2i/5PWAZg+y9ReT/dPYVZxap
         hMZu4bwh3vSQVeH+TrkwHVM7hB6MZpdoNbuwyiFYQ7V+kWEdTZxHvTdMAeQYtuUc6yyK
         NAziin84AQ3HTUv4TO3mhKMXyoIo45TiQrRPCUP3JmDpn847INL8ABUNL//kBmqInY4W
         mL6PCNNHlzRifwRtDvonaQzsWkGLELyehKKvPwsVP3pTfJT7SLZW1TA0kWjZaJ7fe2pc
         GXdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784717759; x=1785322559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BIETq0q+ZXab0uvSzqdPRZQrHX1hfSH66MKbozuc2X8=;
        b=DYD9lwekRg6BhvyThnqx0IFUqV0qUKOsp6+5LiwDxsJbeKONjVpHleydZqEAulvbpG
         SRBJgnTxKsx6rdNENKho3AFMXtSVjwccZ49S9DKXxHHR+Z0eTVBF5cjmRxX+JCHMYv/6
         CmEkAJrJlFM8jvjxdOMKP/wh6txNL4Sznqc4sNqzTtyEQnPK+GxCbiZ91ELiHWyZBdmY
         Km8g+3srGchz8bG5CVCMKvoUL/s9Mf8ioDeSgeV1tbuuu4B5jCEDFyKrpBkbsJ027m/J
         px0NhN9ZUY+LOKCa7mvi7TVCxzqSvZcXtiHdZW3seXZc4cwGTREcfOhsewfNDI3AuDWR
         BAtw==
X-Forwarded-Encrypted: i=1; AHgh+Ro1x2b+i3c9QylKLUlxt8uHRLgJpGFPKhvm2kNMBeRNUdrOHBk8rc0Dy8bc4JLWiYo0cU5E9P1wudfJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw//g5+mqTFin8T+YmsxpwVUdoqIy3sp04P3BpoFjhyQsmiKzcn
	0dfJJgHb9k9s1YV4YqRx96LES40SBv5KgtBPE+PIeX1xs/JYUtbQItmIgkOCKOvJOo5okho89Xu
	EKJtgjeSOaM5EiP9kB4du9ClqG51CKWKFfwYfuMqyiS8qghV5U34mHb/8sn/qe7+o
X-Gm-Gg: AR+sD12nFFcABvecIfpvJSX6KzXoRfqwUiEWlSpi+e0QO0SsxvqwUHMXdTLQUzxocDe
	2mwLwl237AzD/FWLBE+bExnAtWxl0Y+i16yOUclzT49q8QT/bZHah0sA8vmfqva/skvPAyfzuH4
	EfdSJ4hU5wZjqv/tW/yXxdlgs6FzBEw4Rlzqq29MT+tVF69Uk2MdHTBvLYqbnnVKyISZ4Fvew+7
	DHe9oNju7HPXsv4hGWG32I9pICHwxx800hIFFeJ/9sJ+zdkissMQK8hwBD4vVWxUTx5pFFuAh9T
	AqRpk0YquOHg+RCqxoJEJBho0nVYwulmilHAi8aEXUixSKhxTjv/Vbgn2cPGN1lBWKZwvsjohYJ
	Sq8PI62dECtrVmqT2m0PRV7X17cc3/mWcNOrlGCTRI0GRoWhQz1HL6axPRczbc+sK
X-Received: by 2002:a05:6a20:e292:b0:3bf:63af:859 with SMTP id adf61e73a8af0-3c3ad973443mr23554009637.45.1784717758758;
        Wed, 22 Jul 2026 03:55:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:e292:b0:3bf:63af:859 with SMTP id adf61e73a8af0-3c3ad973443mr23553980637.45.1784717758324;
        Wed, 22 Jul 2026 03:55:58 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d1302659fsm5809160c88.8.2026.07.22.03.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 03:55:57 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 03:55:32 -0700
Subject: [PATCH v2 1/5] dt-bindings: arm: qcom: Document Kalambo SoC and
 board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-b4-kalambo-crd-v2-1-32d4addc1ac9@oss.qualcomm.com>
References: <20260722-b4-kalambo-crd-v2-0-32d4addc1ac9@oss.qualcomm.com>
In-Reply-To: <20260722-b4-kalambo-crd-v2-0-32d4addc1ac9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784717756; l=1039;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=7lAnEboM05pxKLJKuQkUK/+Xj0N55Uc3icMOdr2M+eM=;
 b=moMSMC9lQ+mFCB5zRMLYsvw/XJySl2l3P7UeGhibDAkq3tLK+dvaZMaXdsRUFrU8okcf0Glfw
 0crWhsHESv8DSnsIAlpy+Xg5gg/n5IhcGZ8VhBuIfeju/0o3cKDs0HA
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwNSBTYWx0ZWRfX3fmNj67D2G1E
 Z3eZYmN/S/VyZDFyVXsppONHoOesHsUSiOYqJjC7Ep2KObzqSV4s/GKa5IvDBwullY5U+TM8OxQ
 8C5gMwil5an7w2Hob31bO1+PUOzCiJ8=
X-Proofpoint-ORIG-GUID: H6NjQ4GV8YI4GW9B7O62idGiFCjwF3k4
X-Proofpoint-GUID: H6NjQ4GV8YI4GW9B7O62idGiFCjwF3k4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwNSBTYWx0ZWRfX2IHAXUHebVRu
 lO/2cpdmHDjN9+L7QGQxQeXSgMfOltBHLAgKk7Dwb6oBAl7p4JJY5B7lfZEl2RyWM1X9V//HemR
 LNUF1jvPE/pgV5n34gmR+gA+GieFwTSFyJ83qUlygL0bPdh53dq9ZlR3AGzMCEk3xcwukql008x
 zmjzUFh1wzqBLAF9AMpdmtuUrNIB7scQoz1RrJ8cGXBl/93SnIydAgg7WY5xdttYOjAgus+rmy9
 lWcLuNy875tiAnWkFjBTmqKuQ/bXwF3EaebmgfB9DT6SSt2mTS8oavXxuezIVsSEPm3IKi/MMGb
 RH6/4mcSDSoZ2UysD9fzVnVMY7/N/bpo+BMs1qHdf9RIZ7ZZqgG7tq1FJFfBp61vR8/ODhLsTLx
 Q3jQtcxBQfR5Uav+GyPhvyTMmD6vJMgaPsa6DMWH3i/CBSHaCKFIL+dwkfVB6BwrcfPKpSkAhAa
 QGiX7/iv2E5rLz5uuug==
X-Authority-Analysis: v=2.4 cv=QahWeMbv c=1 sm=1 tr=0 ts=6a60a1bf cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=p3IoqaKxkAlDmzJvLqoA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220105

Qualcomm Kalambo is a derivative of the Mahua SoC with CPU cluster 0
removed, leaving it with just cluster 1. Document the compatible strings
for the Kalambo SoC and the Compute Reference Device (CRD) board based
on it.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index c7c9a9279684..b0c07a57bda6 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -174,6 +174,11 @@ properties:
               - qcom,kaanapali-qrd
           - const: qcom,kaanapali
 
+      - items:
+          - enum:
+              - qcom,kalambo-crd
+          - const: qcom,kalambo
+
       - items:
           - enum:
               - qcom,mahua-crd

-- 
2.34.1

