Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7429B34750F
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 10:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785925865; cv=none; b=qQEkIl+8O9rlxNTqta0yxKL2DrP3oLDy8MNVHmKBIRj+t+PbbC8K3v1ZuRidRzfOA3IHAPTb0cbxQQOGBJ/9e0ekAAmsxJOsagL5CJLjOgT/N29AHrCEZZpDAbDPF3zL/Xp3nuaSSsxlOjyVpukWGhE4NeENb2dYeh/flOc6hic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785925865; c=relaxed/simple;
	bh=5/jK8+6Y/KJQyp1HdxKaUrQHBnEwVDmOmlkOaPRXWHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mENddvFjB3fsTNjo5nbX59EBs5UxZJrK/G+uLnyYG8GC7x9X9Y9lqA66GQYz4DKSKAs8sj6Fv6QSZjDv+31haTX9267efOhWuatX5wsMw8xaB3mKpSna8UUhAZb2wsQoUURoYbj8SCYpxB51mxZLQgBT/PwfufghdtXNgQO6qVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q2vCyUm5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uh/GUZ2H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q2vCyUm5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uh/GUZ2H"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6758dJGk2129037
	for <devicetree@vger.kernel.org>; Wed, 5 Aug 2026 10:31:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vmGovCITzXUqx6mi6ytutH+obVjyf8rBjQG5D0izrtc=; b=Q2vCyUm5QEZRcWXm
	h8eVUvyxh0TzeQV4+o/sLS0ZLW22kDvNF/HLkMHlSwXKzgstovk0h4U3voxic5aL
	ic46T5gw6vzQnTK5Mtzd4b+eIwceN/zEGuBdUbukPxeLSWT0vbhcR1W3EeMc+tno
	NYmUzW+DfMt0TI/CJZQJgPx3FoQrGA6Y7aOiK7HyqteaQX+ft6NsRIkVG3qN6cNd
	WRL5SGR7T22Qn8yzP++Gq1I/ZaGuKZr4X7MFGh2r7P9/9TM9kipCfXrVqznyI6u6
	Wfz7OsYyOkzAazXDNdwf6NQ6My55AYs/eVLIkLzSNVLM+LxKzQxbbgF7BPdnLa5f
	azg6Vw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv1qg8gpg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 10:31:02 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f113592bf3so15966726d6.2
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 03:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785925861; x=1786530661; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vmGovCITzXUqx6mi6ytutH+obVjyf8rBjQG5D0izrtc=;
        b=Uh/GUZ2HoikpnugYeYm3TxRrOTU103YPZeOT5t/Jg648KfMfSj7sVVUV1O648zD1fC
         XScyqvHIVbWxflL5FTKxwSQqKEPraRu4RliZst2oNfPRLXhrc/Tf+NgaOrX52BNGqzgb
         cKq8sZpFNh2MctI4mpI0C0g7T0m/X7l4g+JgOIiKWXUTD1N/+5l96W1s6i6Ayv19L2fH
         cA0h8hRffTZZDd49Q6R9iDkg6Pg6pbhAlci19aLlJy5dIYB7YP3E0RP/lC8ZC2Pnq7wn
         hskjMsNPgnZMAl6oaQp+YAcvsE7/i4WYxt7IlQhSbQ4OXjnIW4Gfy8FhHKVmv8bgzBeJ
         v3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785925861; x=1786530661;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vmGovCITzXUqx6mi6ytutH+obVjyf8rBjQG5D0izrtc=;
        b=pO60N/H332TieLCnfdnQ5ChCcT+bfN+yuSlQ+OwtIvHkXPDTnhFYI7zagPe6RgTiuV
         HJw2xYMwhQuBzHVpzxATmjhpPaO9RRGIyDofeJpVee7x1csaYGU/kLVodWo9Cl213IEa
         BYD7H0EtnSombOkuB5dY/BdBEv3yoDwE8afHBgm7FU/U+8xUTX/r07vpWGC7TR2c5qOO
         m5TGKPH87TrXx84yYM0XfUknt0f4RvK6BZtUhR3t2H9mjr45HvBNO64DXEpkRBVL4Gln
         RjkSfrEO6HQlY/unb7MdZKTn92YS2b0LgvZtd657zd8UhvKPmbs/MjU9wjXHBnKBdP0z
         vQQg==
X-Forwarded-Encrypted: i=1; AHgh+RrG2GbUiqGw/1GQghmG0KrM8N1oFh9E+Iw4CCG1CZmjiwM7mlZJzI8Jz4pa8L2u8NGUIdiVm+qUYMiN@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe4NYXFNDWJ59PSCIzqNdbNdctMDmF/WTWOyYUayciAE72ctaA
	Y1CeAhcjo4QGdk3cv+6ZBqntaqfJArf+nLhekplWy4H+tcT+SQ+gcGK+9So808hzK0NVtr5I9Ju
	yxPspBMLF2xxgxTjwY6iVEhgzKlADfrYENDM8ZAzxquLICPAFKhJ8twuBIoVgfGj2
X-Gm-Gg: AR+sD109gSy7/CWFxSYNlmTtDPk+3NeRbUyk9KKOFuXG2Q5OMeGcAP7UABDXTVp5NAd
	o2Q3U0S/X0ZabfTPtCrEV/HBoQ652H32N3CVZKjm5cjV58gkfxm5mcFtrY4f5Un0uUHJ+ovCMvS
	ymF7NICEMN01SsOu+cKpdOUKmYiwuwigqpL9gNgyocB7Wh5PFazX7e8AG3IyZCmoN2kQoTGq8MW
	7R+SN7ofCgOQSQAiKrzjFVsbgd+Z7xDAU0Brq5SP1nn0pNXCGXdDR0YlocZzGSp8v3wxJQARw0J
	ExiOBtk/ryQVW50IdBUAQ4O7Lodeu2iq/34Qk1ZZUGAew06K+HPVXqlf+lOMC4zTitVKHKB0/01
	Zx2f7q6cnrDj90Qq9o/Uwvx+C8QUiny5wIy0LrS2k4FjfLjyiNsDHcbHJWtI=
X-Received: by 2002:a05:6214:5505:b0:8f1:e1ba:cdfc with SMTP id 6a1803df08f44-9088125edaemr63921886d6.16.1785925861626;
        Wed, 05 Aug 2026 03:31:01 -0700 (PDT)
X-Received: by 2002:a05:6214:5505:b0:8f1:e1ba:cdfc with SMTP id 6a1803df08f44-9088125edaemr63921466d6.16.1785925861223;
        Wed, 05 Aug 2026 03:31:01 -0700 (PDT)
Received: from YUANJIEY2.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9087ff9d814sm22259706d6.10.2026.08.05.03.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 03:31:00 -0700 (PDT)
From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, yijie.yang@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, yuanjie.yang@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com
Subject: [PATCH v3 1/4] dt-bindings: arm: qcom: fix PURWA/HAMOA IOT SOM compatibles
Date: Wed,  5 Aug 2026 18:30:00 +0800
Message-ID: <20260805-hamoa-come-v3-v3-1-20463c43eae1@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805-hamoa-come-v3-v3-0-20463c43eae1@oss.qualcomm.com>
References: <20260805-hamoa-come-v3-v3-0-20463c43eae1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=I+hVgtgg c=1 sm=1 tr=0 ts=6a7310e6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=eje8EFBO8bwqvhVDLvsA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: eUo7fUpLS9-4JV8vder06NXz4tL9mxtr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA4MyBTYWx0ZWRfXw954vKXVNerr
 7z7w9OhIiHXqUKzw6NzkqOwPoe+do6WvbCQroQz7jOIijEDUUWBth49l4vUQamTkDN2WQXum+96
 zbOnofVIevD1nSHVPBtUG+nz/rwKY3GN9Xr6w+LfnsBzhh/rdeU+5K8Jqm+rRopQur4dZQP9Fjr
 3l5sTU04gZEQNMqsdtwGJuu6JgB8WsI+en8B1HtRxPCBxPyJqqUCo1Q2huH767M4pDS2HJFeEtY
 AdhOAReYpGdZMZbdDJY0dBNmECk7F+BFV6qi8P0t71XhcnSXj605u65sXLTPX5HImAWNbrCV2eX
 zDwfTTOI75eiXHSy2/yjQvLm+1EJGtBQkPLeMOifa3R2cHQFHOxyDY7jhds3UnuI/PcyXPCykAl
 j9tLHXbRWAE2QonlfXtT4M4YYFgWrTvttUXb/jfhIaD7ftkCwJw9mfpnPyi0JNV/iXb8+nt1CKP
 9hNlPw3GA1975xJrIFg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA4MyBTYWx0ZWRfX6ks5/X/IOTSa
 HpDfJ1Hprs3D3QilzTpaL4KQvKQtNZPitK6GjB9aE4mvVm13mEkTvTVHytmSdVni8TO9FlH5+Vw
 KGd/M6Y5klUjQn5mPg6xhXvrc8qZIfo=
X-Proofpoint-GUID: eUo7fUpLS9-4JV8vder06NXz4tL9mxtr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050083

The compatible strings for the Hamoa and Purwa IoT SOM platforms do not
match the naming used in the official hardware documentation.

The documentation identifies these SOMs using their IQ product names
rather than hamoa-iot-som or purwa-iot-som style names. In particular,
there are no SOM products documented with the names:

  - hamoa-iot-som
  - purwa-iot-som

Update the compatible strings to use the correct SOM names as described
in the hardware documentation:

  - hamoa-iot-som -> iq-x7181-evk-som
  - purwa-iot-som -> iq-x5121-evk-som

This aligns the DT compatible strings with the official product naming
and documentation.

Fixes: 06a4db5d8d0e ("dt-bindings: arm: qcom: Document PURWA-IOT-EVK board")
Fixes: 458bb855f274 ("dt-bindings: arm: qcom: Document HAMOA-IOT-EVK board")
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..f244f547d511 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1220,7 +1220,7 @@ properties:
       - items:
           - enum:
               - qcom,hamoa-iot-evk
-          - const: qcom,hamoa-iot-som
+          - const: qcom,iq-x7181-evk-som
           - const: qcom,x1e80100
 
       - items:
@@ -1235,7 +1235,7 @@ properties:
       - items:
           - enum:
               - qcom,purwa-iot-evk
-          - const: qcom,purwa-iot-som
+          - const: qcom,iq-x5121-evk-som
           - const: qcom,x1p42100
 
       - items:

-- 
2.43.0
