Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510354334AA
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 07:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790236155; cv=none; b=SnoIoeLUGveAR63rgp5xO/OAxrT7+D9cSEEDUu/bq7y7ojnUbP5vuZGVnyjM47Hmf7S2lUDcTovxCD6+0cvTlluuDhzwN/38iNcleYAHSLn9skhlrAJRWFaELYiGGeVT2Frt4Ri/zx5KSQB5MWvoKFMifNE0v+IaGOeYxeFxJUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790236155; c=relaxed/simple;
	bh=XTLt0c5Dv59ALcqjp16DIRAjGHZtam6MfpOu+WlMqfM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Df5d3WlDMSPjPGfuVy2cr/TXUtWV+Xyz0kweVMoObo7XwCr3muytBvCcsHsC3fQapgmPOcEGopbUvyslcEKMFdpMhZRnMHD45pg1kuaZSt1fkA6YuAYXDVtI6GErpkYDjETJmYFTwG6UJHIoVEkrgQ8cj4fYCSI4tSV6FPGbPds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZIZmVThj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ciRWpOwS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZIZmVThj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ciRWpOwS"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eBgQ2277192
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 07:49:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=F04EeTWi1RxE9e3yAxNT6w
	8vWQZp5pUahO1E1kO+Chg=; b=ZIZmVThj+B8s2Yt1FRxfN6Kp2asx/zeI5/JU97
	IsLLEAtmQUthcxaEbR6sNGugqHGSk2Lgg+a7ZN/nxwMRoCjWXWap59zYOC8QASii
	gZ7kRiZ1ALu+622WBljFdZ7BjpJ0v23+4S+8IFGhjK5OAVDEd0oLeTPP+hgAIrSr
	0mYGdwal+NnBMYG+NEfWYr3ogVN3uUT7EcOos8xdbRByW4YAKBwRvbgaLMxSy7Ow
	zfCbQ5vntSRB5D0Ti9kEOuwY5U18mHmPreexwKFm94Y9/UThWgfkG/TcNbN3BkTA
	RuGOx1yMSnUcfxVP4c/ej52buU1h0NX7AQ+rXqRhUrXPRqFA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjxuy9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 07:49:12 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-14318be7d79so2092552c88.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 00:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790236151; x=1790840951; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F04EeTWi1RxE9e3yAxNT6w8vWQZp5pUahO1E1kO+Chg=;
        b=ciRWpOwSJPNYtPtH1USgRAnVWZRGPfYRO2h2am3SStuNHpQVtc2Y+5pTekeaosCT/d
         4YD98MD4UtiR5HvLRQG8QoSQS3LrO881DsVrMFcbBgOeqerLWy9JAjUAJ/yP3RRLRwwi
         YQGjw/76y4cikxRdljSXyE+DgEeH8/lfRPsWdLrW4bQ3L2oGL6DBEi3ez1ctfybNDyAu
         3Vh7tCQehrg+LFggzJKIJ1PgzQNTccwWV0L1qvpOilx5BPsWyoocND95sn7zNZ5qvrhe
         H9HKUS5+2hFWn2LKUX6r5oLjyUXpKTeP7Cj93RZVE2Adw7B4DBSCOAUxW382swZxwnZJ
         GIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790236151; x=1790840951;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=F04EeTWi1RxE9e3yAxNT6w8vWQZp5pUahO1E1kO+Chg=;
        b=D4PwHcBQ/XTfWKPMlauvCvGU4umdp9/PgTHJZuBLYGE8/V4a3Xa9w5/ZC0S6sP1e4/
         3XpGH5420NQOjaCKbD+rWYV3amySoITe8ebVOQTTcNtGQlYrz+vB4uvqM9EBJqLJKqEA
         TN43K1GDysxCN6nfEX8T/ZaM2tjH/aJ3NnpLzTCZzlhS+VmeXr1W+dqov6p6Ai5Ppq4r
         PxcoyXSi8mE3k2Me26E2MSbn5rR+Jk8+5321TxQqZeg4HGpewfyxSGw7keBEUvmsS8SB
         HGLlHbOABsp5Vctqfomcpx6FvJTCEh0vew39cBOgGCTSSVyYwaFInjcbg7gscsYdhPoq
         vAEw==
X-Forwarded-Encrypted: i=1; AKwUvByULHMOPVyX/mtH51ErVVVjM2sfdEsKRnOz9Mo+DUVVV0nrm+7wc+5CladBljZpXF76fHgS15WN8Dk6@vger.kernel.org
X-Gm-Message-State: AFuF++n8l7hGvUs/0GhDD7PpznNdGwKDPF/7VT4Q5nGJFG1Jn6YyosbK
	ZVvyO0q78HOt6xu9a/JZuqMS3Fu12C8tvHpHA4omUMrGmEYEkP7Cf4KyYzd2xqaMacFMdpxO0FR
	G1XYLbCOepXTZUa1iWr30+8XhClS+uUjY/povg4DuIZn6X+Bnbi9FKK3JDTVMAnGu
X-Gm-Gg: AYBFou3DeoESxrHai4JXCBBWPdLawSXYg4Wzoho16/k2LM0b590zRzaV2z8S6uiKI19
	yGXC02j1LfxlRpqXU2N5sf0BCn3sbWRXEPvswzINNV8uyTfW6jghNfQ3mNfXoZ+/YbUZ8EP3bfc
	0fWfVHLSycEf0pYX2DJydfKJpc8qAsXCnwnVKwRGPmicuuD1qQGK/Gb0vv9agZJvsk815N6zrgv
	vlM10YDk/zITKe5KV3Mt4ZmiTaqwf5Taf3mPFjlBMZAGs8UeO+lOk+EfxVYwGExxGK7AwGE1VSY
	IGsr+a7kyNJCGqHlWvXKCJ0eJedlmA1TskInJgZOR+vTb6yPcOEJw6DXwsPWQ8yEUIvzMwmovjy
	AOjjtYxz7Ix3Nsf9aZXBq8QkaOfIOURtwjQMbL41KgHDgeLAKz9qdboJx/WL1Si3oNGYQd1zI92
	/iOi5FSBp74UhMds8wxiv9C+EsKChD
X-Received: by 2002:a05:701b:4205:10b0:144:f86c:e330 with SMTP id a92af1059eb24-145040374bamr1222724c88.3.1790236151333;
        Thu, 24 Sep 2026 00:49:11 -0700 (PDT)
X-Received: by 2002:a05:701b:4205:10b0:144:f86c:e330 with SMTP id a92af1059eb24-145040374bamr1222711c88.3.1790236150749;
        Thu, 24 Sep 2026 00:49:10 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f983c5a1sm19401376c88.7.2026.09.24.00.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:49:10 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:19:05 +0530
Subject: [PATCH v2] dt-bindings: usb: qcom,snps-dwc3: Add IPQ9650
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-ctrl-v2-1-fbedbe760375@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPDVtGoC/y2OSQ6DMAxFr4K8blBiBkFXvUfFgsEtkYCUOCAqx
 N0bQjeWvuX/nndgspoY7tEOllbN2kw+4C2Ctq+nNwnd+QwoMZcFStE6O4hcqoxUJpMGU/CnH0s
 vvQXMs7qypXnxNHctoamZRGvGUbt7NNHmRCCWmMBZ6DU7Y7/hjVWFxt+YXcZVCem1JSGWqlBp9
 zDM8bzUwwmN/YDqOI4fgbMfstAAAAA=
X-Change-ID: 20260820-ctrl-6015e1503b24
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: xy4mJXURJyOM3zWVaxXLv_mnfy6rNnhS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzMyBTYWx0ZWRfX8TT7basOYByY
 nCfVGKrs3K7S4aOFJE4KMhgwtwB1ZuaYiAqiJ8KzA7ZQw5MWNwrFFk57RAi2343BngzkEVTtgoK
 qZ7lnpQD+9FBmyKu93ltUJIwMSC/WEMlcSlRFoqgf9cuf9T/7ya66vpFcVqCnWWM7+MEXcjkrD8
 rwaOrP4vcepbQUEJojg9YEGPeuCsFszEq6HTxnWC5HGn8FEqJKMCooi+mBPDs89v9FI01TlcqaT
 Wawll6omZFNtO9900foLGZTcLBy3B6xPJv1RtklRUtl07KmWtYlEEYDTUg84kGoYoHjBC7q7z1y
 bW/VDPOsxYfFFEI9ggfuGY4kRVcTlhTtZPH4sLa0AYItGHV9brgCF9/Y23FudpuDPqaSqNUEFhf
 /3LqaJdkaUN1g9cvp5RZL6u2JuYMsfUmlSvDbLY9B4bC3gZCTe+18adi85AKuQeBMFwz/e7tfBS
 HZpGY1aZnkQ53GbZH0A==
X-Proofpoint-GUID: xy4mJXURJyOM3zWVaxXLv_mnfy6rNnhS
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ab4d5f8 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=10T2-SsU0MHo1Rfz7GwA:9
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzMyBTYWx0ZWRfX74G5OUR8x/uT
 8e6n5i8zHbJ95LWUE7DyOyKwxCpECFvm5B3vf5W/MHpmkVvUru09R+w0ReN4H3qR+dytXA8ll66
 fLS3SVFh861eebByZSjZNvIYG1+6530=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240033

Add the qcom,ipq9650-dwc3 compatible for the two DWC3 USB controllers found
on IPQ9650, using qcom,snps-dwc3 as the fallback compatible.

One controller is connected to a High-Speed PHY, while the other is
connected to both High-Speed and SuperSpeed PHYs.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Add bindings and dwc3-qcom glue driver changes for adding support to the
two USB controllers present in IPQ9650.
---
Changes in v2:
- Rebase to top of tree
- Drop 'usb: dwc3: qcom: Allow the glue layer to pass ref_clk to the core'.
  This will be taken care of the by https://lore.kernel.org/linux-arm-msm/20260906-ipq-flatten-usb-v3-2-13e4e0f63123@outlook.com/
- Add ipq9650 to existing clock constraints instead of new constraints
- Link to v1: https://lore.kernel.org/r/20260825-ctrl-v1-0-609e2291814d@oss.qualcomm.com
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 9f91c8711e02..a8fbf72c6375 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -36,6 +36,7 @@ properties:
           - qcom,ipq8064-dwc3
           - qcom,ipq8074-dwc3
           - qcom,ipq9574-dwc3
+          - qcom,ipq9650-dwc3
           - qcom,kaanapali-dwc3
           - qcom,maili-dwc3
           - qcom,milos-dwc3
@@ -210,6 +211,7 @@ allOf:
               - qcom,ipq5210-dwc3
               - qcom,ipq5424-dwc3
               - qcom,ipq9574-dwc3
+              - qcom,ipq9650-dwc3
               - qcom,kaanapali-dwc3
               - qcom,maili-dwc3
               - qcom,msm8953-dwc3
@@ -525,6 +527,7 @@ allOf:
               - qcom,ipq5210-dwc3
               - qcom,ipq5424-dwc3
               - qcom,ipq9574-dwc3
+              - qcom,ipq9650-dwc3
     then:
       properties:
         interrupts:

---
base-commit: 4d7e75152b01862a4ec598435d79a81c4b254dd6
change-id: 20260820-ctrl-6015e1503b24

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

