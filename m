Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C753435538
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784619345; cv=none; b=DBPxmrgd7ngOSWsPVjQ79fP5ae9qbsZEqaOkBdiMR+kFzwCM1LbwoQs7bOf+PWUxU1nB8QfHw465AgOeO9dcJ4nSzGDuxQHk7TXK4498ND2m49eyrhZrYRxpXFycu0FW0D8S2/yddwTYQ7CsFZ7HNKVM+RfoECf/zuGjYwEantc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784619345; c=relaxed/simple;
	bh=WozQChOwpT5XbSckiOczusoNxMbfOtWC/N7oYFDqB9k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m17a5QEsyVS3PvEvQm7f9Go7soF0vz3i396NlGGjx6Z6sLPiOe4oYaxXVJirmYorVLo/vD48Qadg96fSdxGS0FcjcRF5gBT739vhBaqWFRl0YGm0wcAsCEpNbA5oodmzVjSqN9zhTb1qw1A9j3uRuEHGPRWz9k1YUYWZuRz2uQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PQ4KXhoO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kc+zfNmY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PQ4KXhoO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kc+zfNmY"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L2T0We091331
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:35:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3VOD5T7OaKyQmxUkKOE7sENrGCh7MXhM26C+rHheFBY=; b=PQ4KXhoOcEHg0eai
	ePHgQ/jaKepkvWObyLXfVNu6Q1dLS8a+t5bHwFhhSWmnkJGpQ+FLqz7/GrhTBfMR
	x9zNRTcUf1RQJGW5oBL9WWopWJuYBqJ0jFUFDdvBsMZY+h2g/ysNsjT9f+QpRr4z
	ipvpH++wtfv+4etSwWh1RkJYxqhu0VMJwRo3D7TBANRVrcAYDo9lM5SPFyvKvPd7
	rLVnBa4LBVuPF93maQRm6u3CEp07sl4kLj63sdTGu+zaTumP3kE9QzxdFFxHfKTY
	ICaipnA1UEXP2EaBwi6/Bgv+f8BeALhVnXnEQW9OF98au/fYwU29+hQfn6CfDtbd
	lJjA1g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj01a94q6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:35:42 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c856470fe9fso6386040a12.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 00:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784619342; x=1785224142; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3VOD5T7OaKyQmxUkKOE7sENrGCh7MXhM26C+rHheFBY=;
        b=Kc+zfNmYLLmIfKKRAvPfo/9oERqu2r/aQGCsrfNISDqu0KQbxzHy+/xWBRUBiTupV7
         MhwNDc9k/7GOstWERaHER7jYj16SiEmdht9FAk6ALFoL5CD42XQX387uTB7VeBxp2b+k
         iqhyO3kDlAfy6fQnWQ7r8KUVDBrgMptbi06StGgo2IZMl0MQ86zZ0tGDRcCG+qHaRmEB
         BWzThkC22Wra5KTeMowXaAa87HtmOvmQWbep9xSr4lkkZFGn6iXMU7H7JAhwCpv6pyrY
         jCPrTJOAf5C+BgqwBTywETRBldjWqywuOF3Maw0NFHNG6W9Q6Bs3Ovcy6FXRmdwK0P0K
         FTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784619342; x=1785224142;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3VOD5T7OaKyQmxUkKOE7sENrGCh7MXhM26C+rHheFBY=;
        b=gQ5/e3NLQgLdpED/96ZNI8KQ3AzZkvAsFRY292IXJa67r/zu54Mx268FFywv1ZmQWH
         sXWPbxSNzC8xbTPHWfTvDOwx7g0brNxSrPPccd+JJJpyHIy6ynrbklOuxxnaQK0RXd2/
         y3aFdHm3V31GfWB8B+BzzCsDqTZtCrkn1EYdYhY4Y5bbYR9Uh8Sk+VQtdLy/+WccC9zi
         pQUtmyx2+uEMOS4iSajAUlYZNAP23xB6xHU0t+R2gie8L7hNb5WKPtfHSXijYf326oBg
         BQR+56MEj/2seOyJ2ZTCAKPoR+N1oLlb185KGMOTV8KnuQRQeBH9qiEkCVbKzXwZIQGZ
         yf4A==
X-Forwarded-Encrypted: i=1; AHgh+Rqp16UToaaYcDduUk0OJi13+UQsgJRGAxEFZ+N22CRho5tWxW/EHbbDa+19tfkDkP3vr2ZaQF8qegS1@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9jCMwQacRhqF/B8kAMLh0Vu82SDj6xZ+1dDb2rQQKZrzja5p2
	TzCkWDldw/rWgptTZPPme6UctQWPi3kc11XfE4Egymkg7Vi7Shj8ITVKpw0KA0aWnhVIi0e4L5C
	BZPYO+SByRX9j/3ya0MwvyUu/ETaKbpIK+5gsOqgSfTt7YexYuZjyX+4V5LoXM4FP
X-Gm-Gg: AfdE7cnTlHul5ty0owOsq5Hb5HNOLiQWFf7Z1XeiSrQI8xHVzXxYK6DmFNL+SEtrlFQ
	Xt2ydscEXI0QQYcD9Gy6t7Eh2pOB6tYuFOXOZ/6opXrtFnKY5YZBtOc4nd58R54T1OrYW0NS6X4
	smTVc1lYCZBmL+mLHyyLmquKn17Xm0G3UHFh7MMbIaPsLvxuHvD1j1eGRyreGLxU/msjf3e1Kx/
	xVA/5SKM5WjXXqwb29sm+UHYQ2O5RYOn+Sb+rV7ZxVTQM5nm08stLtOf54QgkAEV/DIX4bWTW3V
	tJFNUTOSArG/eA0XFuw41szUCpKA9lyzw0Wt3c+2gwptz7e955uEaYVR5YWZAj4mDkoKSKb9xTa
	JpIxuwhcSnyt3lcbMPTIo9CqGAuu6202yC+2V9TOjUebdA2O68stryDl1zOVfIeL5cg80VSoOAn
	Gj1zHP3l4iWW5lSN9yZFx2RBjkVBshtg==
X-Received: by 2002:a05:6a20:e292:b0:3c3:6cfb:4ed7 with SMTP id adf61e73a8af0-3c3ad7ec516mr18246090637.30.1784619342343;
        Tue, 21 Jul 2026 00:35:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:e292:b0:3c3:6cfb:4ed7 with SMTP id adf61e73a8af0-3c3ad7ec516mr18246062637.30.1784619341921;
        Tue, 21 Jul 2026 00:35:41 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a210571sm45224271eec.31.2026.07.21.00.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:35:41 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 13:05:26 +0530
Subject: [PATCH v5 1/2] dt-bindings: phy: qcom,ipq8074-qmp-pcie: Document
 the ipq5210 QMP PCIe PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-pcie-phy-v5-1-8d403ef7e780@oss.qualcomm.com>
References: <20260721-pcie-phy-v5-0-8d403ef7e780@oss.qualcomm.com>
In-Reply-To: <20260721-pcie-phy-v5-0-8d403ef7e780@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=BL6DalQG c=1 sm=1 tr=0 ts=6a5f214e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=EF49ANZLUTmcXe5zpi4A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA3OCBTYWx0ZWRfX4vm39QAmsE8Z
 RC/TpD3UUkbRBvHnn/ictbeO12nQYi1ILjCDUgUsTFNJg/GMRsyBc3ciGwcBnjF8vCe286Y9eK2
 z5N8cnhdd8HWmSxCLyxTMaDE57PPC7SzeXNxW9J4So/vvZiDmeSbiowi7YzscNeKlmK3FzP8RDc
 vpy4G7U+iJOXMNxGR+i0V3sIJGMnIsFDGKwKPBS5XBnCQ/Y+5WBN9I4jPIeTWLugM9QO+p4kPHa
 L+zvSHA98ATn3EKviskYiqXBMO2SrrVL2npKdbd3Z5BPCwhGI1vA/fZisEffP4XZx1LL9QHg24D
 y2pm7mIKSuujMVkRBwX/GsABAAvsD1IzQNvF6uaCCYWR7Yx8B9tOgFVzGHhhTCDAr4Ag6l0d/+2
 GpLOPti5oO1XJp5XnsvGP17hECP+Lb1CwYyCPrb5UmXEyin17qjePaWJBUcHFe8L8EAlk2eEql+
 mBIluBstfbtsaWuGBRg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA3OCBTYWx0ZWRfXytSTsTS803aO
 Gk1bv4BF8OC+ubg/tT2Z0WWqmnopISCq9/Hh3uRMIgYsyoto9VUcidDEGTbsKTKl9wKbEDArKMd
 s0DpVO78IBGNzOZ+OxsLWTBUrEdKHN4=
X-Proofpoint-ORIG-GUID: RcFVKc6qGLPy2yJPW6uaUAP49fTYwHC_
X-Proofpoint-GUID: RcFVKc6qGLPy2yJPW6uaUAP49fTYwHC_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210078

The ipq5210 has one dual lane and one single lane PCIe phy.

The dual lane phy is similar to the dual lane phy present in ipq9574. Hence
qcom,ipq5210-qmp-gen3x2-pcie-phy is documented with ipq9574's dual lane phy
as fallback compatible.

The single lane phy (qcom,ipq5210-qmp-gen3x1-pcie-phy) is documented as
specific compatible as it uses a combination of its own initialization
tables and some of the existing tables.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
index f60804687412..fc155ad5fa6d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,ipq5210-qmp-gen3x1-pcie-phy
           - qcom,ipq6018-qmp-pcie-phy
           - qcom,ipq8074-qmp-gen3-pcie-phy
           - qcom,ipq8074-qmp-pcie-phy
@@ -28,6 +29,7 @@ properties:
           - const: qcom,ipq9574-qmp-gen3x1-pcie-phy
       - items:
           - enum:
+              - qcom,ipq5210-qmp-gen3x2-pcie-phy
               - qcom,ipq5424-qmp-gen3x2-pcie-phy
           - const: qcom,ipq9574-qmp-gen3x2-pcie-phy
 

-- 
2.34.1

