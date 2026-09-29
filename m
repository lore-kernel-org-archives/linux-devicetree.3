Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FC73B774F
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 09:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790675329; cv=none; b=i2zfjpo9RjebpYapZC0OMOAPkX5GMz0WwXfSsEsgp1eNlQ0EwqYPnSSmCmoa+HLhBdoONcUPVgYB/CBc1wjh2x8CB2Ko0nec4Qgg2fUvOicvMAoNEfJeKf5M7KTFby2IdM4RnLKGnxfvkQYcL9KZ6QAjedlS3ALMOnQtRPZWT1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790675329; c=relaxed/simple;
	bh=m6HIPF5r6TbYaTNfzS7HLPHkdxdQCddDgURTk8nWovs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J+7f2rERb4myeNgANQ9rnDW1YvhfELebWSvfpVIN4fUl+8KYUy/VFpnx/S0mrYqs0CWyMAAt4iDclIpVa/afaK1yUaB0mpnutBgTpYqhpeuA5tYuzXtZaLGKACi/BdKZsTABGouxtxlT2sQpKh/n86tMpRoY06g1fADT8P9AF70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=koOhRLNO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VaUY4s/Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="koOhRLNO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VaUY4s/Q"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7Tm6V4097703
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 09:48:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O7alf5yqesjOBC8gsAFdsEjxy9MwH5I9h4zXoZlLn/Y=; b=koOhRLNO5KQmXB+p
	wYSKWU0B/gIGJomYj76p2TtkZQ8slliYa4DcFyT+f0gLnU65SnPuNs09YipwysKa
	8dORQdwrhIwjTg4xCyr1feRjbgG5ofMdVpWPmISOXgiOHB/GjyF/faC5jMv8ayeN
	7qMDEQMw+qgrYEcLSyupEPeny7gzs40Zr9VN0VLUPxO7RSAMmvr0v3avs43y1eHt
	mL1kJ2r0xdEb+7sIoZ0yKblXM4PE+o6yAYHF9u7aFl+t+UWHrG7y+uOrIFenJp6L
	WvUuPZW2HYtDN86KaytSZr8GrM0FhVM6gjQ1udnYbyKIXvwNfLpepQcPLC8rIvL8
	g0Qd6A==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h03ew1tf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 09:48:45 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1438fef603cso8378307c88.0
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 02:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790675325; x=1791280125; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O7alf5yqesjOBC8gsAFdsEjxy9MwH5I9h4zXoZlLn/Y=;
        b=VaUY4s/Qgshqy2Jpc9sZ7kDXwHXGOX0eBykjbtViVLOV/ZRlxXXZvdF3C5dv4qdX/b
         QpHD6XQN5gH74grzHe0DIpkHxvWwVsub4xAgONa8cIFo/beYiygf5OkmB3Z1Mj9nlVXY
         rg7m3JwAAAwaLZmFWfv118oe406Dx0L7CENF4SjsliKCh1LP26fHAkt4Fn9sVBSOIY5z
         tVhTtTUpI4RGQTkicFcoBht4UQXJNJm3iP9m+RpAouev2ekCQPLlUKctqgWh5z0xwEad
         bYffJo9l/TCubUeiLUskaUwVhrUZFacxgzYUfATrBJfU84KPpyxDgY/s8j24oxJ3Fx3g
         fSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790675325; x=1791280125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O7alf5yqesjOBC8gsAFdsEjxy9MwH5I9h4zXoZlLn/Y=;
        b=uuMnZ5o/ewKcuvQfDCutKp+BLC1lRbSCwdZVMNEGL8doQl89QpMaGZ9mk2JLjTcUQg
         15ni03sPtomag56f4NCtoYsn5dnRkZjvFX3F1RGCXjh9x/5igdSM4X4nT61pQUEJbfKQ
         ecwmSCpXv5J66rDhigPpJYHdjAyadtPm0JNuTqkYTNswqDX03XLafrYpr+TjvpGOlIfH
         gYT1RUK4EhZ5PFz0icznw+RzI7WwPkya9YxIwhfQU0OTYwi64Vx/dEz4gb1Oq3uf1Buv
         Nso3oetQvixlf8OJqf03EG6hhj4EwncK8hIPvRjoPToSlIfWi8+pKxeX5TNB11T31F9v
         5t6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxIkMX+4PAHatVl7q7r7tYORt5NUq9TE2+iNydE1sC9SB78KtFJ5DFAu8KpykkGre3nunc7tGwFFlpk@vger.kernel.org
X-Gm-Message-State: AFuF++kQPnWK3FQGT8tBlJy6x/BIE5NPGIprKE+CE9QBv8YenxKsEKLC
	YBScB9y8nKgCmatpPvg6XbLDQ01B+eReFcWn9qz/64TwUgRatJ7HCMT9s7Osxl7EGmmUgczmjew
	07dcATGFfZ3wRVAwdBelVXxeixb3C6XLbeIIdudaFWZduuZoeP+7t11zXmL4rv65l
X-Gm-Gg: AYBFou0yYTcownJs/LQB/4kmGyzZDPuykrGW72AIJWhCD8VhVbr0vFlSK8D5GVMIx/H
	aO3PIuEKF4EJ1gsuoi6/IJ7ZIJnmz4HfuMhTiJ/YNl92p2HbIiV6PbvC84+q/Rz6Aca55GTdCIL
	lL9nLbtSDGIQOKLZE2foju6xGw+2TTS3SdnH7c0hx5bVe5AKiTtXqogKUSxynevTOhBHpG6oIp+
	ZGA9fg6JTa581ljxczYlgiB6eba3zGiS/8V6KYOHxgUzMtge2Hr13aVgpFzilxMpn3u4z+7HUN1
	j90pQXi1zBjgcPZAf6gOTGLr7cp3EOYcWlIFrx9gecauagSAz8k/6HPPZhaMekVxHUwPHi6kxjQ
	7dHHeKioB8Kmf5np7Rc538cENIZH1h+e3zyb98W4MFB/4yfXWPcZgl/Ti0tA32cK4wIe8bkKWv4
	cb9v9LnI8ZCI+zBG0ywbRi6Tk=
X-Received: by 2002:a05:7022:6881:b0:139:b575:d42f with SMTP id a92af1059eb24-146ce39a169mr20414858c88.17.1790675324952;
        Tue, 29 Sep 2026 02:48:44 -0700 (PDT)
X-Received: by 2002:a05:7022:6881:b0:139:b575:d42f with SMTP id a92af1059eb24-146ce39a169mr20414819c88.17.1790675324308;
        Tue, 29 Sep 2026 02:48:44 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14bfaaa296dsm1056163c88.9.2026.09.29.02.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:48:43 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 15:18:06 +0530
Subject: [PATCH v7 1/2] dt-bindings: soc: qcom,geni-se: Allow 1 or 2
 address and size cells
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-kuno-soc-support-v7-1-530f62dc4020@oss.qualcomm.com>
References: <20260929-kuno-soc-support-v7-0-530f62dc4020@oss.qualcomm.com>
In-Reply-To: <20260929-kuno-soc-support-v7-0-530f62dc4020@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790675315; l=1170;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=m6HIPF5r6TbYaTNfzS7HLPHkdxdQCddDgURTk8nWovs=;
 b=BNaL8nY6BMt6oeiq+dbAuQA8H163cAxwKxfyPg+qkJml6TLk2y4CdmQebdyvtkeJfQfH2YXP5
 PSQFEfxd4xDCPWndJQ7CRB7xxA6Qmk3wQ9Wo9bcADe0CHtZunb2PwT0
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzOCBTYWx0ZWRfXzNkcfYeFeMMS
 p2yMzC6JceZkMmyUDRv0lKkOvO4Pqe8yGc//sFwWBbz5Tq+J0cRhJnW4VNAISbipWb9xp7tb7cY
 yJgGJz2T4qSuK9jM8/qmq7VxgoBk6vE=
X-Authority-Analysis: v=2.4 cv=IIOXmQvG c=1 sm=1 tr=0 ts=6abb897e cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=p3y7badNstDnMIU1-wkA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzOCBTYWx0ZWRfX+ToWbYXpqjwa
 ad3oSvt8GEPYHKMyrQPzwjs+1JDwikNvGVhOutWSb82wrMg35DO5MIZJfvuud80StGlRlM7hJ0o
 OCTp/sbl9Bs1ezWb1rvSi4OdqcqSoN2B1bwI22CwatfJeS4jA1u3aL5v3MYnuZzwSubAYHW3Bi/
 p+gt3vNbYCDWjMkMz/60+Yyp+fbaMsusn1MwfztYi4IfEnKgqKNr22Rpt/ZVe75+uFvYIOV1P6k
 vQ7oMfJLjRFBageQA679vOsyw35x8NyUKVMAKv8OtHnWBtFDucf11Q/QHOpZs7hit10zL+yTOkS
 VAskiELx8heeRCuxj65SrLC8SmZBaK2aFHxQ9un2V22s8X0bVFj4LK3jqtjun0Uu/HvKkqK2uXr
 7g6aaK+UbMjcgXkHktz9tZFzltMexQablwTAq1WTP6qDV9dWyBTWryvRn7pV+8paGlTvzLksua5
 un1e4sgOioJytV2ANNw==
X-Proofpoint-GUID: NGS3-lX4QQbAlLy7mLuQ4ROcbezCSyTk
X-Proofpoint-ORIG-GUID: NGS3-lX4QQbAlLy7mLuQ4ROcbezCSyTk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290038

The QUP wrapper maps its serial engines 1:1 into the parent bus. On
64-bit Qualcomm SoCs that bus uses two address and size cells, but on
32-bit SoCs such as Kuno the soc node uses one. Requiring two cells
forces those SoCs to spell out an explicit ranges property instead of
the plain empty "ranges;" which dtc only accepts when the child and
parent cell counts match.

Allow either one or two cells so the wrapper can follow its parent bus.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
index 54cd585f19e3..c01ad421a122 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
@@ -36,10 +36,10 @@ properties:
     maxItems: 2
 
   "#address-cells":
-    const: 2
+    enum: [ 1, 2 ]
 
   "#size-cells":
-    const: 2
+    enum: [ 1, 2 ]
 
   ranges: true
 

-- 
2.43.0

