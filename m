Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC46D4AA415
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 20:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788381839; cv=none; b=UFiasci+hVRTXWVIkDx+18TvZ+IZhwnzWVlJeOMLwEgjdAMRdaY+2w794U3R7bPR0i4guhgqgr/TaHtwAfJfdCcpO8Xj1IDk/5dShbgIwK9OEU/VQvyQXjMgBqsil5xdCiMWjq/p8P2UJkOXxJSbjnPtsMjdQBzzw+mbRpQ9BYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788381839; c=relaxed/simple;
	bh=S1OTlqKZWIb2bXyBhFfeNBeUssHFULWMwu4f5hK4JhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pnExSkueZrk8GRgRfil0LRrt5R1u0DYLwxfvtX3wgNJIWnVvy23c5QoZQ38hwPIeVZa/DxCxy5i1UuzTsRZ8aJtbBuYpqTkQTxrIeLg60vpj690lYnlBg8SyN0XfUUVeuJhs8vqnzGYkjWcxYuIek532UhONMuk5p/pUqjaiIEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WC6cnACO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B31/TRQg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WC6cnACO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B31/TRQg"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KH2sh3690749
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 20:43:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Vjkvx5+Dov7
	bk+0KCz7gsKQ0yLzwHYGcRcMlfcp0IIs=; b=WC6cnACOCxyc4rECMNdw0abjDy/
	sftzbPalHPL3ebSDMVskK2/TX8eWLrw9Q17SZ1J/sMj1pMfh6oOoTLj6PpfxlLYt
	ef6xfxMdbkbzE+XnK+jdnlBDFH/yyjWdwYgftbTusQcMJ+hQPANl32ELxaGvnnh0
	5nZbnLQvDdEsoOnxZelTDZOh/r11dzmV8vCOs5Y33cd7Pt8TCytZ/OPKRbo7eNID
	KKJz/hNDEqinl9GFGKcfSohGxVbEl3Fo+oc4JAf2X+ZqLOmNjkRW/0GEcNuEWm1v
	1+10dRQlsUJUgyXY/RPXVr4GF3QtZuL0WdPyJcRAl/a1zdyU+C+gJBoNdRw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrnhk56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 20:43:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398e1fafe17so2280373a91.0
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 13:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788381831; x=1788986631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vjkvx5+Dov7bk+0KCz7gsKQ0yLzwHYGcRcMlfcp0IIs=;
        b=B31/TRQgB6E4Jk4KMe8dYJO8w6B/IbQ6VJ4l4a0ijgOkgaEKB63OgCmUTGOIdvFOqU
         T5zwiRYqcrBUBs+GTkxuqP4wgDJRfP+BFdIiTCz2RrtSMrWYwJI84s5GO0R+W5QbGvss
         qEnJ7o6ugdz6lv5HcTMBdumcDCFv/GZ2PUJXcors1/7Ohnatnr4zhE9R7x6h/BjrYsJA
         kQDouQhLtJCRZmoorTIMIY7Ulrpr15pIB1VM0YzK3OYfCqEbLYmp0w0wamtxkkHCjgTM
         3HhAsX1bmZXiwByNpayTEkkp7cP3rE3eZ83f6RLRgHZ6eR84x+21IXtiDydhIJ7D8XGu
         cW5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788381831; x=1788986631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vjkvx5+Dov7bk+0KCz7gsKQ0yLzwHYGcRcMlfcp0IIs=;
        b=C/62f2TUMyNWTgCp3MtHa/j1IXT+QRWmYmChnZ3OLJD116PpK+sOJWkVatooZbTsql
         hQa7dQeIBhCFvERdvGJk7rJ4XIqfekkozxhJX3oeL8o75O/nwSoiR/DFIYrMNklwJVcW
         1aseoXmV9OPDjL2Kg4cTbDYZ9dah4/DxeG9skng5noJ3Fkz59kOKfJnobxGPLCNNb0mb
         nRcAmCzSdqh9OLvNqg6LcpSq2mMGDY0wDJE+Cpe59i/3eVPsh7HL8yc6mmSlhMaUG8qZ
         YEB2F3WF1IZ8Cdbiol/EopN69RMfN78S0rM7qumP0KzCWU03NlV4buklOtlcEAaRHih3
         5iCw==
X-Forwarded-Encrypted: i=1; AKwUvByrun2E9KTHOxpyipH1bQ95Rh71+QKEw6eSZ6JrArXpwBw5rXva+eDpaPFwvWArYHvY6674UP3GbnQ0@vger.kernel.org
X-Gm-Message-State: AFuF++kSF13S00sSzaO1d03E7r7PC3GNVAS+HfZ7WPAqm+xyY7Pj/SAi
	ArifHBkn3HY4C4ufsrWUNTcjC6Toz94NVuAAynzLTZKFHoGVrFy9C9A0UDsGDqeCeYUIJjzUY69
	DdjnAdf1j+6vUjQjA0gOWlxnZ5UpSkdmyie/Ji2Xa+oGffekEiWHDXF1Pabgsq+5t
X-Gm-Gg: AYBFou3GUeorqYX//UCIhQYJre3g/F4gfhwX5fpGAbU56Y2zYnpWs8dljPt/gAIiQpq
	d0npM1iv/4XxjqLQ9hF2IW91n2jQjd2hxjMVcv8BEdNLMl1cg+4vAhUCr5y3/5RZ1MBTiBbtGaS
	2n90NTo3n33u//bPaEHYMhvvO+NVbsPOigWCDuIAifsn7FP66NRDWWxV5a0TpBvTtn6WQThBfu5
	+nKG4CLPHCXBbdQlTrNcI7QFIoq42TxAl+mSBOtB/gzD2KiASkyNJNnM5tm1O0J+fnxpLwXTxhj
	3iu+jrcaU82wFbQuIWe5K8axUeTC7VhUIo5u/i7zkFKlXBDoi0v5weQY2vDJ1JUi4EjwpZVnqD8
	gaUTMKGryxKZIEut/7ksndpHJ5To=
X-Received: by 2002:a17:90b:5828:b0:38e:2e86:ed02 with SMTP id 98e67ed59e1d1-39aee0850bcmr11376832a91.14.1788381831522;
        Wed, 02 Sep 2026 13:43:51 -0700 (PDT)
X-Received: by 2002:a17:90b:5828:b0:38e:2e86:ed02 with SMTP id 98e67ed59e1d1-39aee0850bcmr11376772a91.14.1788381831013;
        Wed, 02 Sep 2026 13:43:51 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255d39d21sm613338eec.16.2026.09.02.13.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:43:50 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 2/3] dt-bindings: remoteproc: qcom,sm8550-pas: make qcom,hawi-cdsp-pas standalone
Date: Thu,  3 Sep 2026 02:13:33 +0530
Message-ID: <20260902204334.2061226-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902204334.2061226-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902204334.2061226-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: mx6ayq6sZ4qQ7UHl6QMj7w6mJxxY8fEo
X-Proofpoint-ORIG-GUID: mx6ayq6sZ4qQ7UHl6QMj7w6mJxxY8fEo
X-Authority-Analysis: v=2.4 cv=YKuvDxGx c=1 sm=1 tr=0 ts=6a988a88 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=kGc2aUUJYeWwMdlnZD0A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE4MyBTYWx0ZWRfXxW4c+W8M+Wz/
 ALUAJca7WgsOfZ1t6VCZQCHJj8ygcmZAmDLP8KDgg7oyiqVGGLNQhp20Eg/XRD6w0zEmh237f/U
 8lcbqVjGwGYljkrGOx0wSPKNhkU5ZgjUFXp2LXukLr+El0+9AeK4ZqzAtvGmx/2IB4W/97lgMgg
 Ugv4rXxodLnU217mNDV3nphvuB6AWafMq3fTjUP0xu3R0hXImPT+vensKKqMYgBmYCb2wpc94+p
 MkMJd8A5pWPKfTDuU7Ml4gz8ws5kkjNl7stQyQM4XxQowqjD5/mjx8rjgxTbMGn3Nl2EYXiVJ1f
 +l0+2ksrrq5vKJc25cXjTosMTG4l0g7g++VqqqZTgWtW09+qAXF2gc2g34Gvvjea+7qyD2q1WKo
 SSIliTM9EnuYleGXKJFUvo6/mWpNI/4cEB14q71WaPLVU25HzFsDBjl8jgSMi4tm4RI8YQxwK/6
 IJtE+z0niVEJSQhTZog==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE4MyBTYWx0ZWRfX8LRWL4ipJKP1
 XgKCi2+yfcbj+Ic2cWKSOymPWKAqTyr2OPUFn449BsuPlpRoSUWatS59/0FYmZSmpJqxSJPYBfa
 eJGftafzM0t54BnS9CNjMIhJjnk19ew=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020183

qcom,hawi-cdsp-pas was initially grouped as a fallback to
qcom,sm8550-cdsp-pas on the assumption of hardware-level compatibility.
Bringup revealed that the NSP proxy power domain on Hawi requires a
specific RPMH performance level that the sm8550 driver data does not
provide, breaking the compatibility contract the fallback string implies.

Remove qcom,hawi-cdsp-pas from the sm8550-cdsp-pas fallback items block,
add it to the standalone compatible enum, and extend the existing
cx/mxc/nsp power-domain constraint to cover it explicitly.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml        | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index c58e8a6c7fe1..cf57095cd49d 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -18,6 +18,7 @@ properties:
     oneOf:
       - enum:
           - qcom,eliza-cdsp-pas
+          - qcom,hawi-cdsp-pas
           - qcom,sdx75-mpss-pas
           - qcom,sm8550-adsp-pas
           - qcom,sm8550-cdsp-pas
@@ -40,7 +41,6 @@ properties:
       - items:
           - enum:
               - qcom,glymur-cdsp-pas
-              - qcom,hawi-cdsp-pas
               - qcom,kaanapali-cdsp-pas
               - qcom,maili-cdsp-pas
           - const: qcom,sm8550-cdsp-pas
@@ -273,6 +273,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,hawi-cdsp-pas
               - qcom,sm8550-cdsp-pas
               - qcom,sm8650-cdsp-pas
               - qcom,x1e80100-cdsp-pas
-- 
2.55.0

