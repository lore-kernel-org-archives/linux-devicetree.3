Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5E64014B6
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 11:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777550002; cv=none; b=cgR62QTCXxdmA746/ldFKZayeFd2GvO3SLMU4VPczIk7wvu5sFuCCjq5M9VWCEXKtAbJ6pZtraUYGmEgVejq/Uv/twd/Jk1NlwNHIGylNEFMcJE7CjSNareS35BUzsZ+gkiqm9uk7EsN6+AUoOWTVIx/QUMD3zdzU0xMmGJNMRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777550002; c=relaxed/simple;
	bh=QxPMMGXUXD0goR22AbWNuT7RO7qnAyoersKff1sz5dY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GVuIsAFHkMJxdoZxd9ubC07JHvG8HZFKZ1PcG+905mx5ZkhgvQyH5jR1RIxptzxNFhLDzglAI2goOg9GLATRNr1Tq9xj0F/S19jTRlwMAP979aVYoAW06Sxxm2poJa1bPgNswrHcn3+I5eRX/UE1jV/NyeIHzBaeqv68ZECnhik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U0At4fTd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CCk+8HFJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U0At4fTd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CCk+8HFJ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UBLkoh256087
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 11:53:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VvMdomiGHeP87qTT+uqosOoO7iddjbAchHskXLUFUTA=; b=U0At4fTdrfl8QdP9
	JQsKIphtRxGzsjY27YXJu5B9VF4ru5zEPv8S5HvjrN5TjZs0G3L17HcKX3DBzseH
	vSHF9/N/T7lFiASwUOJSOs6QfrG3L0nwheGTMw2uzmKw2BOlPnmX4X9Viw8fTYQE
	cRhzhPYWB4OYo672bQKUcr1oIXNkRsfctKpBrkftKQUOdq0sf3ls3WS95OvBHiCo
	mgf+kpNzS6rkJH8cQJt3L0WLu/vQSuv60BPrsPzJdpvCV+t5CfH7ZQ7PmsHbNpax
	+axDM3qdYPJ5iwS7ufLyRmJguhR1b2mNXiLTE8PXJRn3dsdLV7XSNl1fiUwpNusI
	TP9/Xw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dun71m2fe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 11:53:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a90510a6d1so7262905ad.0
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 04:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777549998; x=1778154798; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VvMdomiGHeP87qTT+uqosOoO7iddjbAchHskXLUFUTA=;
        b=CCk+8HFJCwEs1Iw0VsLwuKUaMKe4sGGl9RF1+ba+HbjGAkGc5ZUkKGBJqZ+wy23ysG
         beLWPt3mgiko8VuNesIyb9mwiyp9mupkUK3YUYtlNBgMzJqjsQxGwVT2EQXUQ+MkZu/R
         T9CmgziN3YaebIAXm16BTvxZX0Bpqmt+IqogG1kU6KIPqsoKe7l8GwpneLjWwyWkTyGB
         2xumrXf1HqANo6v8KWpNHLzxv7LettNRO7j5aDafkI2NdLilp5FqVEWgprQ8bSZl3sEL
         k1viFKuX9NQnub/Xf6pEiKnD8AYRzVOTM+nh+wk8fp2ybKdpDSN0m806/gbWXPKN9Q9I
         c9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777549998; x=1778154798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VvMdomiGHeP87qTT+uqosOoO7iddjbAchHskXLUFUTA=;
        b=MD4IaHKbZGI+5sXJqdMoafOuP5XU/yMpRR7fGUO/PRypgvWlnRNFyHYtIbh39e07XY
         B9B4cQKzIPvulsNGVQSPKkU+g9oXUa8NKPPHIU4NmxvnFs2iy1i6tNgZKQJuB9UI1Gja
         EMnqsj4eOBML1yVe1E2UysFZ29mHi6YZXc4xZ8DplKaDyVdnLtx8F9zn//AVR8G17hkQ
         OepM3Vmd+o95bXOPg9Cg1lSzohuiMYyz3yqZWfiKI2On2toJbxxdMBc3lfaX4EcQasfq
         Qeuyw0r66OpKuDT4MfhhBGKJQXk4eXzFrSdUDXXI0d6siICldvhGyGkPCLWVpNmemHbG
         NStA==
X-Forwarded-Encrypted: i=1; AFNElJ93XuYs9S+Br1fP58cPIutCuZOa/E7EhVGTNMYp+hzrzaR1HVW5i+CjdIJ1Iwaq82L0HUhaomgh18BR@vger.kernel.org
X-Gm-Message-State: AOJu0YxfSLmQAA8e38/NNooZAhFMnCZnN7UvRA8sJLI7twKmZ+TxosOn
	e+ogemnoLZ3JHC1ry8DCemEUvkRm3CQpskDFPNgic5LSwTO9LtVbgvGSVOT4yPOgZmrmsLiTDwl
	aPelFOlVRjPtYqe5EQ9eu0EeUMX9Rr38BFgeCZr7tx8CbKa0RNCQRIWCZVhxFE7mA
X-Gm-Gg: AeBDieu4iueNTRIccV08ygJF+ExiRzlGYGUL/Z4RAEuc4X7LblJxQ60zEfSqziErzA6
	gBvyImA9m2sDqu04dlg6jv61YP2r3WoauO4NIkDkp+Tl7P4c486sAAh4SF+t6UCeIleGN9tOjtR
	c/9mD7XV2f+0lYBWKgZ8VkIblxzL85Ub2G/NlDLFU/Oi9dx7ucqeJYoODxETtn4/1W93W+1JcBF
	p/1t0C8E/23ELrxW9BRzm1HGQRnjtDYrrQ/hrQmbwchUxCb0TMBU2JdQbKomaZZrEFesy0QH/BU
	uPcrSt4TQA5MkCdxrqzOcxVxolAp/IKSOQ6+FFm9wB1vo2r2plfyYyj6Ir9bgMoyq2sz0sjcPmG
	Pe6vb2VUUQdR6II4LAZ92HsEccro3y4WN3L13a3IoJILJh8o=
X-Received: by 2002:a17:903:7d0:b0:2ae:cd8c:bd04 with SMTP id d9443c01a7336-2b9a43103ecmr13838045ad.10.1777549997908;
        Thu, 30 Apr 2026 04:53:17 -0700 (PDT)
X-Received: by 2002:a17:903:7d0:b0:2ae:cd8c:bd04 with SMTP id d9443c01a7336-2b9a43103ecmr13837835ad.10.1777549997476;
        Thu, 30 Apr 2026 04:53:17 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988971138sm53834955ad.70.2026.04.30.04.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:53:16 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 17:20:27 +0530
Subject: [PATCH 2/5] dt-bindings: phy: qcom,qusb2: Document QUSB2 Phy for
 Shikra
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-shikra-usb-v1-2-c9c108536fdc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777549983; l=837;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=jPWQHE6KxD1TKLInNu/I4iHlxuYT8OtLcKrqMYmEjfk=;
 b=ovx88w9T+mcFNC7WEAoQn6UBWfH20QIo458COMnNSXaqu+iBLyiJBQHt5LLUDfEzb2MVWXzVW
 Xb0LKnj8h0dCcpEu0CkyF0hf8oXDBgKjNdD2FPA1scb5SmsFZPjM4Gp
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: yGEmUdKdd5CkO5UyhWmvY871gyUQ1kQ7
X-Proofpoint-ORIG-GUID: yGEmUdKdd5CkO5UyhWmvY871gyUQ1kQ7
X-Authority-Analysis: v=2.4 cv=TvHWQjXh c=1 sm=1 tr=0 ts=69f342ae cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=bYrxjfJhQvMAygBm0bIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDEyMCBTYWx0ZWRfXyJLWRBE2Y+tC
 MFN1VuKbdaHnK01s0KSXDe677lTmFKlMmJWRRclgSsDmPXVLELzvGPIZhHixNF6CRCIrUyBWJ68
 TNbkdN3mkEAn+dr723hqMN5fd7TrgyxGwAiEsqPugtCYtfdSBh9XMKwiBKL2PnM985WQxBWDZPq
 W0xGFUqu5A/miGfbnMXy91PywxuFBjXrl0QC/48HrMOkuPOj/sr6ILOEABw8O0hro7Z2OCTLZbs
 U5dcK/MpMozX5UyAEAfRmgIszFSUciEtPekw3BD0WOGE9E3Ca/LR6H2XhZ64T9TLExmVYy+dmjU
 tfwS8ad+jHku7BogC4wJb70Bkng3iO+U2caQDHmjqzTrypH8koAZGNLnKWfsWkvLa8yv5do6lmS
 In7jJoGSrOgEnbsaZLb//GlvCOJo82tbM+jDas+abq4p/M9RzjsTVj+Juo/Hlh8FyAGowbtmkuu
 s4XA23Vg8DwNpQAWqlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300120

From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Update dt-bindings to add Shikra to QUSB2 Phy list.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
index 39851ba9de43..ddbddeec6fb1 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,qcm2290-qusb2-phy
               - qcom,qcs615-qusb2-phy
               - qcom,sdm660-qusb2-phy
+              - qcom,shikra-qusb2-phy
               - qcom,sm4250-qusb2-phy
               - qcom,sm6115-qusb2-phy
       - items:

-- 
2.34.1

