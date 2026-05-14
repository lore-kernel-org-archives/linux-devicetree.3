Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E803AC0D9
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 04:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778731997; cv=none; b=DN9gUxyI016WpTbiMDGoegLOgKYQ/xXYsONX7YLLPyyY/NmTjcDBizob1pI5qcz4psdtsfoaPTYnzQ21NvKK1awzkUMbirxD6a9aervEmxH7DydMtIinX+3ou3kvjtkp8xnmk6MOa3pklFg6lJM0KzFT0Tt+l8xtMIJcSDqtvP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778731997; c=relaxed/simple;
	bh=JwW41K8IdkdgFGE2IHpnYGuhMsXkm8hjOGtwlDbRcpM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YIqcTB6UTlHN9O7+V2o9K8cAFi4357x3nItsgccvKcTLUzF8+6aPFVl7ZsdbWVLv2Xp9ih5Kc6riR8rTQgqJ1lU3vMNKCYt6sxZEYpx145nxA8d18KkeHJN0xU5MAvtaytey4FIoYIXu8lZU3DGkSPtdoCx4d4O4OpKlu8VrWGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qxs3bZch; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LeMuY62y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qxs3bZch";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LeMuY62y"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E2xXiW1095250
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 04:13:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Drn7srxvV0vFK1yAhzD7aPenQzPVdFLlBpIYOLOBz4A=; b=Qxs3bZchewyCJxYh
	kqnp+jnlp3WTeHVJq3hIiuQkRYsZ1bsFMXkISbWRq9UivlByFhCYRP1jVdZcXidF
	zJ+pWWFrm2vABIsGELi1B5Sd7RbqtO4pxeXkawKuBSQcdLm7RKjFdmWrzezoFbgh
	np5AkAUyA0g6xKGLtQ5LfkcMzZr5FtS92p98PV/5ru1qeKLN6YTZPis/ozz7RBtR
	pZKjTHLlhPs4E02rr4mm9qwPvtMe0rq9MxBB4xMIcd59JJFsThq0oVB1GIzg29ad
	AaudpBZAJAcKIsgV5q1O0Oa0sl2Q7EEM8Uv22T+8HP5QV4AEK6ZQLDnRQjVl0XyJ
	xpkD6A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e563hg6qu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 04:13:14 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8353df9bc7eso7086251b3a.2
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 21:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778731994; x=1779336794; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Drn7srxvV0vFK1yAhzD7aPenQzPVdFLlBpIYOLOBz4A=;
        b=LeMuY62yfCol4oJe9gOSCg/zDkagssZ4sL87I9SKRByqgYAepiPHWT/Dv++pZyjXx9
         NTLFRHjzq6tthfCIskSgsDMrdvhOZi2jZt9UWhUQxpGP9MASwX5wchAnUF73tx/AsP+5
         YbM/pLpaRDLeAIy5smpGrKbkPQmpocZ4mzDLDkxdhGIDEzrRQYYTjsg95H8dqvIzLx4x
         gWuZw8b+/gTGgkuwk5bbRYJCPxe6kADrqrlgZMDv3+y39Wg99uQSMy147t/Gb63sm9S1
         yDKsgEP1SNbu4a9bYhQ8VCwsuTST8UdJZx0kAohZNWY5UGsCNbejXALYNlKQhUSujUFn
         YeuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778731994; x=1779336794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Drn7srxvV0vFK1yAhzD7aPenQzPVdFLlBpIYOLOBz4A=;
        b=pZv+5vKdeHQG4beRgxodOsA5fYGwJfW8D3rRvFCExym26VtbfZCAggfhHfgAdZSxIZ
         VKjV7Y609bI3ecamOmN9qFrFEN4rZ3GXgMKp5sv8gITRi+D/mGa9dFziM4mtH4tY4hqg
         tIrx9Ouunok43xJdZ2jgtofdIPK3F3EPKQXCceq1+HKDnd4yoOmj0baOrtiwSUU4XpF6
         rnkcuSKEurDutCQm7VWJVaaVW4C7baCWQ3rpaUH/bVO1lIqNzsb+oweZKzIVL7I5B6P6
         jNoV/MlA78mT1v2LID0NzQ7onQHDtY3HScJ3EdgSGR4njptBjEfKzfDtRKy86Wac9zaj
         +Bsw==
X-Forwarded-Encrypted: i=1; AFNElJ/j0akn8e0CoqGTJ50HC4+/8/q7tmKh3rLD6BOyEqKNRgK3G0e9JxvRVUbZPXIp/iWdLn93uOzs8YYc@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0vCeOWhEOOrPrjOdU2aVsEFeKGnFWNGyzYg4fHRmNy5uiPuoF
	ELtI2Pg4D0f/pmutHJk2Y+0gDfgfeQNESx1N3wpPgVh717JoCxMylY3gw+McPnq3sr1kX+mkL3P
	aF7t+WZuY/TYHCtgcPp+ZQ7Afh6goVx3z7XSMThOP/pxjc3UiBMlbCRO3GlCjdVAq
X-Gm-Gg: Acq92OGS4kAGWT1aK2Y5b8tLVOauas0aR6igeqze8ylD5po/bdu2mefFlfguOnrbUx8
	wtv9xRFIRJARo5qIBkncITVfQeR8H6EjOM5gi9odMF7GL2g0sJPOX1sA1lN/I4jVXtwHxemROaI
	AhRxyiXEdCN9RAdck8DzzfoInK93rIxZC5Co+9//3fhQ9UxgQ7iz5C2s97WgbP5OhojYZIkrYPr
	eXFTMVex/fQ+htEmQLhBVIiW0dAxKFuLwJWWdjDTsIXClJeYdV+0LGtO8Wgmu9wVDvnTKhv5e51
	UL6Ohwea+uTsMnyOVX/v1jfGXJgyZmntENUH7B2ukdCdySuXUH7EnPsRM7LqjLtW3qs6lp2k0cF
	OlmQZ5pvmpacrHCAEvwkPy8Hez+SDuU7rKe8wRwYIgGOwKpxJ49xhyM17ehoBbTa7x64A2oacEa
	FV9rnaEOyRRww1HP8PHYK8cxnLHLDZJwdhXvXdystZRP3irRw4ZuI=
X-Received: by 2002:a05:6a00:909f:b0:835:532a:3468 with SMTP id d2e1a72fcca58-83f0546e833mr6386244b3a.20.1778731993952;
        Wed, 13 May 2026 21:13:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:909f:b0:835:532a:3468 with SMTP id d2e1a72fcca58-83f0546e833mr6386211b3a.20.1778731993466;
        Wed, 13 May 2026 21:13:13 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5be71sm1075432b3a.39.2026.05.13.21.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 21:13:13 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 14 May 2026 09:43:01 +0530
Subject: [PATCH 1/2] dt-bindings: PCI: qcom,pcie-ipq9574: Document the
 ipq5210 pcie controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-pci-ipq5210-v1-1-a09436200b35@oss.qualcomm.com>
References: <20260514-pci-ipq5210-v1-0-a09436200b35@oss.qualcomm.com>
In-Reply-To: <20260514-pci-ipq5210-v1-0-a09436200b35@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: xlzQlhvqFfq7mmYZWM7rb2eIlTp-eWkV
X-Proofpoint-ORIG-GUID: xlzQlhvqFfq7mmYZWM7rb2eIlTp-eWkV
X-Authority-Analysis: v=2.4 cv=DewnbPtW c=1 sm=1 tr=0 ts=6a054bda cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=QcxusUPE0xsQWomV07wA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDAzOCBTYWx0ZWRfXzQ5wqK5bQgmy
 PQiQa2ryz93lljB19E3luIz+XPLhWdkLA9XBCHF50gNLyza+QDnJJ9Mj3Db9IGHFVVU74vdIVKi
 YQ12dzEni2Ikd/2cTvkxu8jSO+GxUmiQzcLKfWmr90SdCmIxh7K2smfHB9eNSqa+D+oRgkPNNg9
 q3Ickh9I45SSJ8hkohUf/1YL5OftPtbQJ7INLgyl/NeEIpHC0heDTCyqg+AWats///qcEgUnvZH
 DzeXY55gNS2rn/NsI1R00B39nOj7fUjqy4gsNW49lK9aA6IVgbEiLuurC2rj7Cc8OMrTiCo8pcI
 7AgcvBgy6IyOPV+0pOymutsViaAbLRrBZUBRQWWgFYxPioYXOenQh+XK9rmuOLDUYbtc/uVvO5x
 6Fv8GxV2K/vlrbtI34X0zVTJXZb+TDactz+KIlTKYWIQxAcfZb5a9SQsSfqgptCGdX4C0j0owAD
 dmH9c1e9Ku2AeJRfqYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140038

Document the ipq5210 PCIe controller using ipq9574 as fallback compatible.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-ipq9574.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ipq9574.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ipq9574.yaml
index 4be342cc04e1..a75ff554c283 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-ipq9574.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ipq9574.yaml
@@ -17,6 +17,7 @@ properties:
           - qcom,pcie-ipq9574
       - items:
           - enum:
+              - qcom,pcie-ipq5210
               - qcom,pcie-ipq5332
               - qcom,pcie-ipq5424
           - const: qcom,pcie-ipq9574

-- 
2.34.1

