Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915163C1D7A
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786362168; cv=none; b=rGDPozk+rOz6RGU5WPZ+FsUPYguX+yuj7tvwIRiuoHmVTjpPEnMyjTjjjYmVe2hV04cUP86sIYwofmq0Uh4kN9x/rjo9DdV7sI+FkMIcK7BssFSRCXWuGrOsz2akL3zzThg6HLsrNgy/kFICXetz5JAHRn9i0fFCz5R7U1YIXnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786362168; c=relaxed/simple;
	bh=XlBDQwSAvxsyZibxTb7GVapBUaLLsh+xxc84Mnw4H68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ngd2GY23xEdP0/Q/2tz19cSKYb/NAfXbMzW/63BocwuWnlBEcYn/uo/wCUZz7SOfRnl93UYT1PFJw1ohrnd6i4rbEmeErRaDm+eh78JKuY0S+Ruu8n0TGRjKspW5dDb5WTvlQ2Z5Pdx0+grxQBTXBEfnP8J7KSXKaXDcr0D9Iug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lsKZrXYz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BHfLGRWc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lsKZrXYz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BHfLGRWc"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9S3hc1189557
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WUTZRW8mXSr8nhQ2D0MN1c8mjSxKCPOnQ0iljovnOU8=; b=lsKZrXYzatNB+Gqq
	X9LXTRe9aDno10CTyhSYeHfQVTsukGhJw3eU09yoQmTlkM6AAWs+pRxFsQAYtOTw
	bZRF8/UdKzggeS2lGNTmIx5kgq5nkg8Ug2WrJAv6t++TuRjyoRiw7XhPMgTipL0N
	Y2hPzeP+1238j72o4862/FRCKF03ax73e7K5E3BVzJTUdM+5UWMKMZaRr7I5CtSd
	8JEfGzEcCSXBCpeGdzMo+a7wYVem/VHPfF2nTr0C1geDz4qXfWlzNqACqumuvqLQ
	bFw0rGyN3ankr0gB0TuMrAa5jyVuJ5lmusAGXwLj8XQ0XIqPWgPHBU4pONlaN6pZ
	2elLPg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v29cmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:42:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0199faafso21319881cf.3
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 04:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786362160; x=1786966960; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WUTZRW8mXSr8nhQ2D0MN1c8mjSxKCPOnQ0iljovnOU8=;
        b=BHfLGRWcnQ6RubyhMCp8uU0NgnQqKf7YtoMpzXdYCKEL7nmMQn6tAgSYIMrygJzyc3
         TUtaSfVEXMUi10+Do1umlG6+KAecogg1FgUATr/j1EjaLKQ2capAD2CtM0xPURNXljmx
         flv4aPxMMfOCf+4T0AVtirJjTWbh1DDptKbhVXJqnYXsAHExlM7XAgjNz/5Jak/L26Ou
         jALMQ4I7HT2zZV0WvsmERXN68PhE4Mk4TUy6a4S6NvC9Wm1j1JIoVcVyL6NNEu0CrEGL
         mjgMsQGFUI4ziDFL5i4t+BxN0MhC39+2tIwdsWZZZxI8BnevF0CY0Vog8BFUw+DrYzNK
         Pf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786362160; x=1786966960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WUTZRW8mXSr8nhQ2D0MN1c8mjSxKCPOnQ0iljovnOU8=;
        b=sUS7hSPSEMQpIGwtY+p3H14/4OG0DSS+QiM/e+USBeTTXKr+fgzrMVRU1FOSdfjrtM
         Bqmpou3+XlzEqhemjJv/48LtAS8BTQJ+VovFMgfX9IWVjBXRBtD+XCy40CyK7otJmtZe
         mHUew/De0X8B8Im+UOcJJf2rHAHMgrdnt5vnRo841SBUZFhJWTLnvxcNDJnByXNP0G7q
         7X6MusvJ+h7vQ+vGJkU0Zx462nuVWR7ngqzNFIRixccghjcdum1XaRp8VYnSyqLDIt6l
         CZxKdmdtBzOkdKVvEPrU9yPoIbo2G70Xx0BZXg5u0Gjsea9mV3pxN94Ft1iWcJoje87P
         obPw==
X-Forwarded-Encrypted: i=1; AHgh+RqrvWxDhC9ZWOWmWPm0SM5Mx+O+tW0YMRuXjVckbhrbGT2UwCCCeyUlgSV0LLatIu8TMYqKQ6AbtLoB@vger.kernel.org
X-Gm-Message-State: AOJu0YybKnrEGtjLpnLxyY3crY21H5ysY4AZZ/nwfis//ON07sLRfWSZ
	WmN1qTurHWjelzMi2XVVVYbMmdQ3FjqVRbqh5dJBTp6XGpQv69fmM7t/nfcqCZ8z+mgfcgVxx6F
	UjT0fzXVCUM2/JmDaS2wXZuJ5pU6ICQlq3ODPBxjEAdHrtFPJtJS60iHZaCCD1OgsLSGSitDp
X-Gm-Gg: AR+sD13E1VEFGhvQQbt+aN4s3bUAaBIQhsIcaPGDuTvef6mTpqiKJy4lFs/ORgqmfLm
	YwDsbARoSqPw/D7sA4ClL9uAc4YAZXOIq/8vdhMe5gx59V1wHkisylh+MasvwTyMsGfk+Jb0eDK
	/qpyQGtFkxP1hecA1tvOXT376pLLYGKSOBfS+ppqhW/UJErmr3suSeVO7TNZISm0QC4kbUhWUS4
	4EdZ7e+w0blSVTMqDtDS7vOjO8hRH0ViDRJqfxeUbDKFtD2EGteHsPZ/7pKgGD2HKYBwpH04TsV
	zIZ2CQ/sa+h2DpONTaxJQu/pqyq62OODqyWMxU1e0AOAUlFTtMhoqHp4XViVitLd1FinOSa9+Sg
	O5zH9MoS2ihEwxC6Kzv9nVLDjZ8w/zexGTd7r4SbC1hEPjwE8P3EX03JfrMD5HQdr15RC05dmL3
	m9iKLJUlgpX2hzug==
X-Received: by 2002:a05:622a:138e:b0:515:189c:e0f8 with SMTP id d75a77b69052e-52ce5fc17b5mr396944771cf.17.1786362160078;
        Mon, 10 Aug 2026 04:42:40 -0700 (PDT)
X-Received: by 2002:a05:622a:138e:b0:515:189c:e0f8 with SMTP id d75a77b69052e-52ce5fc17b5mr396944321cf.17.1786362159555;
        Mon, 10 Aug 2026 04:42:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fddd67ea8sm21201671fa.28.2026.08.10.04.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 04:42:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 14:42:32 +0300
Subject: [PATCH 02/10] dt-bindings: phy: qcom,ipq806x-usb-phy-hs: document
 the MSM8974 HS PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-usb3-v1-2-1a47e1185524@oss.qualcomm.com>
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross <agross@codeaurora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1433;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=XlBDQwSAvxsyZibxTb7GVapBUaLLsh+xxc84Mnw4H68=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqebkoHJUasBZkSEQyK8qt7Sa0CbTM1HkKPQd36
 hMtY9nvcoiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanm5KAAKCRCLPIo+Aiko
 1XOPB/9iP+0cBpsURaaS2Nk5a31W2huWOTDf6btKzykDGqqn3mcp3DU9H5VLFMaq4MGjOuyF4WY
 nkWzPdUmUN51RIs2HuSzJNfcrJMj2rTLNTpv3ezNv7SEuucpSmjPy8yY/GMwFMGw0dNH0LrfkIV
 0NNSc6qQjEVEqSld9D2Y21LYYJeX2jsaS45feXcQaZ1LLXq4gEbc5xEC8koGjPSkEVUuVAnPLKk
 8bERkIyLr7tfRqwwYzXa/M23qNvqldkuqdmnIkKrmWZAj9BhXZ6bys+DA8I/yBghagcbJpi0s3T
 XmrOCgvsVnP3ucQPzs2W0rWFZ5akGHFaw+TtT3keCb8IPFYd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=S9PpBosP c=1 sm=1 tr=0 ts=6a79b931 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=l4NzwngxL-zSgT35z_IA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: rBNi0ebF0cOQtoNlKoGLzjYcdw-hwr91
X-Proofpoint-GUID: rBNi0ebF0cOQtoNlKoGLzjYcdw-hwr91
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfX8GSfQGUkMVTk
 7r+ZAYh3rw3hAY0KX702L7J3gJgdo1VrQpcjoEW0DM0vDG2vnW1N4MY5rbBFVOi02upiByWWKR5
 PlOdZoUXqtp818CdJoYZGH5jwexuc4Qd0CMfRURh0KIncIJXVWpVwmV4uzHybVvXMDSCvPZSjyu
 FCvRyYllS0U3WucPc1AmbrTUA43ExL2fq+ewpqXl8KFZwJlEk+SxuMs6/UCMnRG3SkPVD6NzdUH
 uDp2efammVFrxcNT1g8hbttR8x234viEezHsAV0gD/oVht+EJNrqT90Clxznja3Fkv1oFhQeciI
 cg0E86Wbi7/WEVQjH1/vJW5CKG53p+aA4FDL0uxmkKNst4/8SKc9+0Fn8CLYcfWfh86acdvRm+f
 5Z5WXNcVkGbXKPma6Wx04bVNF1603i8pFnhTTCWxkFkp7NnlAFbtRnxj3aGZfgCcTMVk4bR6ul3
 Ux06DKzd6aiMV1UZPbw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfX8mCWYO4m9MXI
 KZsjFTzi+XKtQyOOEG0HHyoik7+G4MqKx4A8BVYZglmelbnWqDLCwgJZ/N1dK7Jkg0lOh5yVDUJ
 OHwYY6lTuePZhRQDvle4+HHwp9ay3PA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100102

The MSM8974 DWC3 wrapper contains the same generation of Synopsys 28nm
HS PHY as IPQ806x, controlled through the QSCRATCH registers, but the
binding only covers IPQ806x, leaving the MSM8974 controller to run on
bootloader-configured PHY state.

Add the qcom,msm8974-usb-phy-hs compatible.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-hs.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-hs.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-hs.yaml
index 35296c588e78..de6f94997d5e 100644
--- a/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-hs.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-hs.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/phy/qcom,ipq806x-usb-phy-hs.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm ipq806x usb DWC3 HS PHY CONTROLLER
+title: Qualcomm ipq806x/msm8974 usb DWC3 HS PHY CONTROLLER
 
 maintainers:
   - Ansuel Smith <ansuelsmth@gmail.com>
@@ -16,7 +16,9 @@ description:
 
 properties:
   compatible:
-    const: qcom,ipq806x-usb-phy-hs
+    enum:
+      - qcom,ipq806x-usb-phy-hs
+      - qcom,msm8974-usb-phy-hs
 
   "#phy-cells":
     const: 0

-- 
2.47.3

