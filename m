Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAE135C6A7
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 06:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791182218; cv=none; b=bVMsa+gOrZvmGnX2w3IXHYB7UMx5seyrlCH1T/ehuBpzRvCNPDcRXUMLCnBhrUsMlvLfF27f9IFfPBZ/N6gomLvdRdADIkzxmXx51NkRYE4eD2HFrWj9yWhtZhHgPHhlEoKMKXcA6V/m/p2a0GZceKijMx0r1MrR1Pi86fsIyC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791182218; c=relaxed/simple;
	bh=NzsD4QcajZOVRH4NV4GO2obUNyWXJF0JtcZuLN8XyqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GZQO0SoRTs34kHp5D2zQ2ATl8Imx/CnIL4SpTJ4bf4Ene/QyRdfKupP0Jzv7GzhbRKYGGpXh3Q6UwqGl3AOUeDYAVqvdUMYzr76gCsQywm8H2fmcB6YkFfViWTBFWmQitDJdNk7ZLTwxjscHBxZAkMBJqgMnF0nEJK+UdTwnBr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W6+2YKub; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O2g8ahZu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W6+2YKub";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O2g8ahZu"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6950xwAi4060139
	for <devicetree@vger.kernel.org>; Mon, 5 Oct 2026 06:36:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yxOiia23GtlGiNnaYrLL6nmn5DZZAppKMl6jIYoOE4E=; b=W6+2YKub+dtcgsKC
	60NutTAwRP/Nb+CSNv8ouCZN+D8Fn1acPogtffbmu/BelSgz4J1sktd2EVrpT7+3
	A1MnZNeF/6waJNF1fHEloBtS0MKPHk1JSTWbyxChd96V4s4ql5G586ufXf7UbWEJ
	1z9GRzJ0anWJMVrXLIGwLJB+HkfI5PMhUoDVlngvinDELctt1mCck186vDBpAo/Q
	jTCTQMNaOYimapBq1eyjAcN1NwtgJ0yUpRG1SnTbJrqlf91N+c5wScJLkixkZL5D
	+BV70zSB90LsjAf7S6meQHK0ffwn0AQbYdlbZBkIFpsoOBNm7lVVYVj0+jzvVMtR
	sNYEvQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h41gn8pvc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 06:36:56 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-14a62326b51so965451c88.1
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 23:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791182216; x=1791787016; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yxOiia23GtlGiNnaYrLL6nmn5DZZAppKMl6jIYoOE4E=;
        b=O2g8ahZuM2Vi1Qogy/J8kJqGFzaH3KBDeXqbtb8E7CfxdlAM+AcQ64sIKG4Bby30As
         RIYcUd6qhAQBPsLXxneanL0m/2TWfrEmKrcHxPLFsopzGlITDAbz5qAY95U1bXq7nV1v
         jVXOMY+qCRhIZVW4IRX1kneyxsfddAXFNR+IZf7ObKhVABPs5s0XAL8GkM87gzl6/pUt
         3NW4cJuUsllHKA2ZBrEBiS/tWei6+nG5HM8HyCu7hkJbkCt5gLw5+esCIIWIAeIBlGzL
         FLOUErC7Wj4lK72I11+vAPXrETuGqhmWgQ1VkjdqgFSfPYQCuOf6nr/UTKM+023aHjlB
         NE3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791182216; x=1791787016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yxOiia23GtlGiNnaYrLL6nmn5DZZAppKMl6jIYoOE4E=;
        b=AA5MnpTkzJYtJNS3s9P5yxQUpv2CQnmyAE4GKIMtOP6W25GMDhdudx3o6AxiNYREHe
         xeEXMDVlW28ZSKZdVhLX4wouZK1xNRx56lGQ/nbtx1xU6IULhCSI0mrbQy8SSyWIVD8W
         pZEI82/HetDe8K71B6ORGLK4k9jl0SrxzkeOigKZcRTofGF1ePIc4h7Ed5b4xRbtWeA1
         gr3pSHFDAMEl2JaQDSlLjNx/Fbi60gnDtD7oXMuXn9BY/Wg44eB0Lsv7dVgcUAdg/lpI
         eHSX0X/6IRKNUcjj3Zhh5sMH8BPfShAopgNw+hdmg7IiH/95eNIQvcMo6rL1SrtojQKG
         jQ5g==
X-Forwarded-Encrypted: i=1; AKwUvByqTyB6pgbpANc3G3YULXlHSpdqgd2MWBeCL1ON7m2Y059qBx7rMls2tsRxP2yPNwvTnnxM15XsQJRs@vger.kernel.org
X-Gm-Message-State: AFuF++m/+y07JeAztREOBysCHYS3olXHkJhBX+4mvue5fAUyfg4iBvLe
	Oq7ZXfO6Obb4nGPwZ1iweJlCpMRE9CeKEQ4y71YqNdNUbS/YKbLFJnJmybCxHuqPCmINX3d0oLT
	JF2l0ni8QrBRXF8oK+A/jdhRQgJR6QCRKMQpzP4D/2dNmmuKAJrYWfzoCR7KRAd1E
X-Gm-Gg: AYBFou22l9O6BdsxSeku+fz+g+sB4/G+m4jgcjPdvfrMBbQQBYUoqcY6YNVuy/NAowP
	3/R95QxbAXIMDPU0pcKsNjIjHC2V8vg73NwGpsKpLaqWDfXXoPKGXA4W7PcJB9f0f1UWECGZMiE
	5fUnBGo91U4omZBAAv1tRBvNuwrUlC51GMmQYCw7wSvlGnkR49WmghdYvLO6LEiB/V/BHTWPaZP
	7e/SRWaacTJ7VF6up8SmM3ASvov0672hElTZMa1rwgBspmMbt+OcCoz2OVDvLqO9IpVYhScv7NI
	vI2JlS1wED3LUAv47ViKgdyBcmRf3SKUKFP9mqMtiVWIat3rofVbacKETfpZVmit/m11xEdv9nl
	vTiN9Ly/2jyVU5j35JDsEm4tnNFTxnFGBzR+m2OjNoMwIhbeXJD33e3qRAUqmDPRdz2WjxvJBFt
	5Jn+9tDH6vrsHKVqw0FpgCYgcjU8Iv
X-Received: by 2002:a05:7022:7e0c:b0:14a:51c8:ea06 with SMTP id a92af1059eb24-14f5bff5f14mr13474735c88.29.1791182215620;
        Sun, 04 Oct 2026 23:36:55 -0700 (PDT)
X-Received: by 2002:a05:7022:7e0c:b0:14a:51c8:ea06 with SMTP id a92af1059eb24-14f5bff5f14mr13474707c88.29.1791182215094;
        Sun, 04 Oct 2026 23:36:55 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3512718d9edsm11185821eec.19.2026.10.04.23.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 23:36:54 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 12:06:26 +0530
Subject: [PATCH v4 1/6] dt-bindings: phy: qcom,qmp-usb: Add IPQ9650 USB3
 PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-phy-v4-1-b04c4123ecb3@oss.qualcomm.com>
References: <20261005-phy-v4-0-b04c4123ecb3@oss.qualcomm.com>
In-Reply-To: <20261005-phy-v4-0-b04c4123ecb3@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: Z4TIKHbozWgbKVWBtsYK3nsGUsHkYPxr
X-Proofpoint-GUID: Z4TIKHbozWgbKVWBtsYK3nsGUsHkYPxr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyNiBTYWx0ZWRfX6xTBLKuV5fMC
 4QP/xC/ZKVVlFYr734iW9dZE70b3aSrbosOZZqAQGt2YSXUaE50zioGUl6ltg1fQBlGLAwlnnxW
 MJgO93ZGmBLaDfwYqgN/JyQdjmKo4//xQ8dls8YF3MsZzE0Xfo60CSpdi7jnHdrr7NuXfAYFlr2
 oROgRVeJbmqS9In39LvUNbV/u/c7j9FmXPgONcQmEkO7vSMiCuDomFya+EA6d/TTk9Nn7RCF+p1
 DLrodCDlQC0QEQJMp1F40xwLN1vnPP/spW2AmGFpx3hBIsokF5SoXwAl2JCy72j2V3GvH9G/8VA
 WKXnTBF7AWIDFrWni7PLuL6PrBaBRxNhLHekIy08b3vekcqTo6m3Oe4zvyS9+VpUt59QtZ7cC/d
 OVUt8gm88fOoWvM8FrLaJgg0lfX+xa8fqpvAslZauOPvHgsmkw+eDqR4HC9JbbgPCjBwJaTd269
 lrCZrxvgtTiJeCN8oTw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyNiBTYWx0ZWRfX0M3QDZCY4Hds
 XSMpRmQ1IOk90t2Pxxi0GNW31btxWNjjAKzFIQBnlh/PqqM7ZVKq6REiYi5B0g781StBnlO/gnM
 XFP8hvB0relYUgmHtYXLjlfNI+VWPk8=
X-Authority-Analysis: v=2.4 cv=P9WvFSAu c=1 sm=1 tr=0 ts=6ac34588 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=CyeWGLuohibXKJY0YOUA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050026

Document the Qualcomm IPQ9650 USB3 QMP PHY compatible.

Use a standalone compatible because the IPQ9650 PHY has register
configuration data that differs from the currently supported SoCs and
should not fall back to an existing definition.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
index 01342823e57f..746c5a331f48 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
@@ -23,6 +23,7 @@ properties:
               - qcom,ipq6018-qmp-usb3-phy
               - qcom,ipq8074-qmp-usb3-phy
               - qcom,ipq9574-qmp-usb3-phy
+              - qcom,ipq9650-qmp-usb3-phy
               - qcom,msm8996-qmp-usb3-phy
               - qcom,qcs8300-qmp-usb3-uni-phy
               - qcom,qdu1000-qmp-usb3-uni-phy
@@ -102,6 +103,7 @@ allOf:
               - qcom,ipq6018-qmp-usb3-phy
               - qcom,ipq8074-qmp-usb3-phy
               - qcom,ipq9574-qmp-usb3-phy
+              - qcom,ipq9650-qmp-usb3-phy
               - qcom,msm8996-qmp-usb3-phy
               - qcom,sdx55-qmp-usb3-uni-phy
               - qcom,sdx65-qmp-usb3-uni-phy

-- 
2.34.1

