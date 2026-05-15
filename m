Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B79478851
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842086; cv=none; b=tLNSmmvHNK3zUFpP92qAQcSWXRfNLvyfa4k4gEJMrZess6WhDWfvX1zmpum+T2wD8D1GE/gZZuswZXp1sdZY+VBCI55ABvcmiEieDyoPwtJxaGy/9oqB05JptZexLC5V3CxNoAbooFCRtJV15RX7U0t7xu8jzwv0Ns9SgNvKLXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842086; c=relaxed/simple;
	bh=+XnnaCjx3RG6qRrENjsVEcqRroWYclHZQYSm4z4YbGc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k+Qh0zqQT4uNCJRBM4fWylYGJw+qjUsDmkAK4onPtiJdyUDL9G3Xri/zJqcz62pA8z/EDH3Hj0nZ4X5gYYhPmFZQwCc6EqgCpCThgvJxVwOBrIsKfQJUfwYGzY2tvop/G8n0f/pBlTWZ8B8VkLT9HHikm3iiHvgYiMNsFLWyRps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nuWfEiHN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ihPW5uO8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nuWfEiHN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ihPW5uO8"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5HqwU4020904
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:48:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RqmADDkqt5KHGaRm/cbB0jzfZAp0+Ju/seDw/FuUue8=; b=nuWfEiHN9t1HIMzE
	Psj3+VuTIp+gwIku0JfF21Nih3+fXQGYx55Mvfh2QcD4GQ4ye7jQPowZ0QltrWYE
	DhRNqOJqy3unjAfgUVwArjphV0hhOC8GzZaLIZqlox2KNDk56zwwlaLZbPLD2FJp
	lWo/WLF+Zkrmwd8lG+ranrSewEG7Ol+SqxHzkLl3v+SDn2WgLjacxNzsJixGEVtb
	/GD/OVgK0Geg79u5j9sFUrB1KgNQpaXsGMJVupt2HmGJylpS5pjYUJIofFbPPZ3/
	030Df6Tqxylqilb9aHuzCp42++A7oVXDWDGxgU2QOb7Q6TiOfi1wIoJdFKMTv+He
	+1RmXg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1rtwsr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:48:04 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c82726f7b0bso3868301a12.3
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 03:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842084; x=1779446884; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RqmADDkqt5KHGaRm/cbB0jzfZAp0+Ju/seDw/FuUue8=;
        b=ihPW5uO8fJr1oiODknlAnohN6YyRML2heuWl+IQU+ZHIUr+7ijUZK5CGn3XDEFM4M4
         HvD7Sb+RLlNrqN52fzlyWgmnt38LPzuCQpoO4F30O9PIsoGyeTvRFG/VtjtD9ZwBs6au
         CIm1qwR1EPUqUSXp9+OOFHw+zrLdnPhC0pAFoKez4UMeSyf7kIt5UvNi9yf6/xTXC20M
         ii22qmTb6njtgrBhXnMomEqfa4ReZxv3278AqGXGlKKyJBsdUkg+0G8LvoihasVRApt/
         wzRQTDdl8AW8pYgwcH+p3cp0uSrAPLjljQ72DlH/h1sIttngxmGkbis5fb+Su9jsk3pP
         HLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842084; x=1779446884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RqmADDkqt5KHGaRm/cbB0jzfZAp0+Ju/seDw/FuUue8=;
        b=fL42Ojpchb/r7fcyBSR5woeoBq8ctxL995H831r9UUeSb1ilARjTbfdiRRBCsQVg+P
         z71sVXb+j/mLB8s4TUiCM6APSM/xHS42wgWHhM+rrxpq9ij21CGAEPwsf3XogXI6zbVL
         ivps2jPd3fbi3nSbvaVLZkwwAeDo8GVb3G4MlBt9mwpsi4RFmeAA/E4RsY4FQRhhbR6W
         4PQmJqM1KAl+3ZaZ2ithEqmlVxmi7DMp5svEx61qw94/To+waLoEmUgZ0NGbq9FjysyX
         nncRANkoXIHBrZo46CbxzG0ibbKq5ohkUNzzW2Xl9+eKx5EITH4GSlGd4XRq2MpEAFAb
         9gXA==
X-Forwarded-Encrypted: i=1; AFNElJ9/eYatjgk3beFpJOb06zT2Xyo+0UEMuFdeYL0VpgHIBfRdTutdlHwcO49OAPUsOGncuOOFMp2c/XB6@vger.kernel.org
X-Gm-Message-State: AOJu0YyfaFRSq6Wd47tWtaW6yVVc4yxAmQibaycvq49eCLzXlOzHWmkL
	Kw8oQbzv04XB1cvdwHRcD3QFIV7Y3zCKGesIaxpvQEMevGqxQMDgqpWCjtbZqAX/hZR3hDHoAf/
	XpBU4UKF+YBDdbEZDLkBEQx/k5neW+HTB02mPKD3YKA+eQcHdP1GEd1nGMiG5rl/s
X-Gm-Gg: Acq92OGnQH148TIM8AVXiMK7csgy2j7moauW5c5HtaNENL/6vjkvkRIcMv1gRdse0n/
	cX6AduphwOG5yYqC1dIV2H0Iqhet5PIfmI9d//zFDJfjy9XJ9QdXmFSb+YSxr0FNcWXvVlyncdc
	eoaqnw46qG2mL9/Tbr2tDtHWcNCewGN0CVvN9vd0xq0MgvFOSLapCsZXWUorFbxP4itafSGV/K8
	zX6s5911yGmhjoi4BI7teHd28tR6NiFKYzTdelmieEM5GB4Tmg+jmNrtHF+xIk9TMLUApi1xXF/
	kV5fFnuIZx5PGutK/48ZjIZb6+EeegLRLwZqJQwoSioCi3nSbwCCeQ5ZoWcyuQQzl+g5U558xvD
	7PTpJ6devlbwWRsevVeqXybV70HhPBx7bnZmJlja+mKwa4Ng4K660ljrEmfdwXkBxfozlPLI38J
	Gn2rmGJLuI+P/ep3qi2HKGDyiT3nRzzgygjSo8ASx39xR8pxM0dLvXkOooFQm17Q==
X-Received: by 2002:a05:6a21:3298:b0:3aa:f9cb:d436 with SMTP id adf61e73a8af0-3b22e67bb98mr3744693637.3.1778842083579;
        Fri, 15 May 2026 03:48:03 -0700 (PDT)
X-Received: by 2002:a05:6a21:3298:b0:3aa:f9cb:d436 with SMTP id adf61e73a8af0-3b22e67bb98mr3744662637.3.1778842083082;
        Fri, 15 May 2026 03:48:03 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb1006fbsm4955221a12.21.2026.05.15.03.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:48:02 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 15 May 2026 16:17:44 +0530
Subject: [PATCH 3/5] dt-bindings: usb: qcom,dwc3: Add ipq5210 to USB DWC3
 bindings
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-usb2phy-v1-3-5f8338d466bf@oss.qualcomm.com>
References: <20260515-usb2phy-v1-0-5f8338d466bf@oss.qualcomm.com>
In-Reply-To: <20260515-usb2phy-v1-0-5f8338d466bf@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: LymiV03BMJeUg_VQkbXn5ohawPhhGMam
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwOSBTYWx0ZWRfX/poZbvantuza
 QNKfO77UvwZFxwIvfQp1m8YWcUMAgb1KP6MB+lGDrofKwfiQQb+KdXKImVligI24NuRj7MRN5Sc
 Re5cJUUmf0Y3W9eSdmw0LSRoP21mCm6STValX4Ti0juSH6WXBw2apNDoT2kT8oKdB3k3ZgpL5UE
 /XZmfQa55kOXnckdmQN2EGG1yIzZftRHY/XQr3cQxW79IS8Ap67kybccG4ZHSyVh0YnuT9xCSNf
 IqTfa+NmavxL2rz6hRcGjZuk/NOkZO7q7uXjcivosYAUsDi99Jl0fPHJmNCwTWAJv6eD3YcTScY
 hGI1EqpJ/PrWy4P0BZ5+J17xYXHZlkySGyDgiGuc5tbuWArKBauDpLCoFoCv/9t6UjErJzdGtgj
 YrMhGFg/6K945aGvAjFeAl3HaMKFzLYGfwArSh2PGTIkB0TViohDuxfQQ1S1dIt4vKuudaacPF4
 +D/ggUpZrr1OKXfHI8w==
X-Proofpoint-ORIG-GUID: LymiV03BMJeUg_VQkbXn5ohawPhhGMam
X-Authority-Analysis: v=2.4 cv=JPELdcKb c=1 sm=1 tr=0 ts=6a06f9e4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=EcSGSXt-TE7RrzoSa2cA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150109

Update dt-bindings to add ipq5210 to USB DWC3 controller list.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index a7f58114c02e..f8e0819be894 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -26,6 +26,7 @@ properties:
       - enum:
           - qcom,ipq4019-dwc3
           - qcom,ipq5018-dwc3
+          - qcom,ipq5210-dwc3
           - qcom,ipq5332-dwc3
           - qcom,ipq5424-dwc3
           - qcom,ipq6018-dwc3

-- 
2.34.1

