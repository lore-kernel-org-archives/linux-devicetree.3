Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB8E361975
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141035; cv=none; b=StpoAZa8hoCl8GHVvdS3tutDs2MnMB13Lk7Vny0HEa3r9INWulenhAB9HPGO1Rls3bflAS9/cs60arPUXgEWNxWxu2z/pedqHq4p6JrUlTGWb6khu3rMLHsYyQaHA6jzBENI8p5eBhXCfcPS5hRtW2a6COAOtDYXqMaRYC9iWY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141035; c=relaxed/simple;
	bh=/ZCWN7jaJIDf8ZoNDtqLZ5hsZviVoJaGvIJdWT84aoQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Isn9DiuVFt2FGUTrb0abBIleP0wk46wNgaXOx71BW/IrZ8hZDtfU9oFoQHzXPJ18Ch1FJriTpfVKQUGicT0NbVpARzTx8mVBob05MhvEGp5FmP1edPw9XXdRXgumS3H2Tn2v/xONYYDDT1FWD4QNmot/5Smb9yKrI7SVUC+8o3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kzixV0Ah; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aHowh7MQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kzixV0Ah";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aHowh7MQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEm8aa1090819
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+MBlKbsG25BxrzRCEnnBfFH5TzYzNSnlE4rjXRK1RBA=; b=kzixV0AhX+mqDzjS
	foSMA0MkL4iSWAe5cx4SOS9hje/AEsOEPwuJvVonLmBT8IZipOtRVrVvOsvU+FqF
	GJe1vKaUA+WnBUuYvs/h+7ziKu1qWK8CHu3LsZXVZ08jTQeZE6dH0MYdkVahS0Ky
	VQS8xllGhZPteDtR2xcKqpOufjYUdGYjWGmLWrzEWzWTQA4wdd4O7Gkp1Pzm2p+s
	IArgoIH8fQRx3B+NnNh3C7/jelYXAwWGMCgL5Nq3A0DX35uf1IW7XM2OfuzLnS38
	nekA//XJA+cW5UvH2HUEJM1abSSwqvM4Udr06h2S30Hf8INWvoxV4WdDhTejeZ5t
	KpswzA==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd3ajsr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:37:12 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-448d51840c4so908254fac.1
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 08:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141032; x=1789745832; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+MBlKbsG25BxrzRCEnnBfFH5TzYzNSnlE4rjXRK1RBA=;
        b=aHowh7MQAuIovNiUoHTCzJ4gfzFILiMaOyx6o/hkvC8XIIe+jGBIGaxpE9RpZcHYpb
         eBdQ7miOBHtqoSOgASgV80maTxbxb8MZl4ZcVu7Tqc2lf7/jl78ApjYguCx6bRIpN+Z/
         8BJx75ye/AXRFy2fChIsAekHx/8MVZLMb+O7hdZORv5olVZZRBivQNZzOIUqgGH9vHeJ
         jgdXTQ3qGyGD8LHcw9m6SvmUGufTnQBIAQ1AM51QYFxxypmVxqJdb50kW0lnhPuCYM1O
         zfo9ySHJszRtfdJqaEiFO9l1e9MBrMwqKlIaNrGWivbnCRoPzYdBV5Sh5zIUOlP+Pqvh
         N2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141032; x=1789745832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+MBlKbsG25BxrzRCEnnBfFH5TzYzNSnlE4rjXRK1RBA=;
        b=o6b8iywlbPkkWp2CyHpsavLDiPqoJBcJi1rkHzS0/71entTCa2RpqlqwxQ9LHRRb2r
         mloSlQ23iUiiKtsV3iqEYn+2YuZAK00nY8qsgfEAMqVl3AmNS/37P7ifGe0oSN9FygEu
         z1cgqzUExF22PbjVU83w+7IzY6HIEhl8GeYSACCeXJEBCjDiYMQmIoLI1GX2X7WYGg3x
         ULnSoN346hzRKSYSbDBXID1fypzjgcnXbZ4y+pZgyoNQkc7GXIEDSmfdliHxZKciU6mA
         PfLzbiUtXtQoxrqnsx8mC3pUtMh/UQgP8rEHGYZFFSMbjgjeZ5rkqpR/XGrSIoWEDUHO
         Un/A==
X-Forwarded-Encrypted: i=1; AKwUvBzJsab8FGvdoksbWPUcL8Uw65CtIZ81SUm7WGLzoj3NjfEIx/v5nyC7ELOXeT9y3C9o+AxM3T3JhVDX@vger.kernel.org
X-Gm-Message-State: AFuF++kKAnU8nj1X/GRgndSA+eTmIaoW2PcS/D2aZT++z6SYjjKXgQ5E
	YLr0tyAE2B9aKMuZLdFcR33QWTfaMxAomPTxnrF9q6YcrhSQa3Wqu/knnDqz2nRrx+vIUiE9S7R
	ZRGpru8mTyjtBJsukfsEWgkfNQghFILXxeoUBuCDuoNIE9XQk3N5LJTFKnJ5fnGpjrj2JEOGL
X-Gm-Gg: AYBFou2aZV1t9cD/84tZZ6gjhNMwBcqcimCJaWY/Fm0fTY9iBgroP7JLutuUQQuajwk
	s/n3k/33ZqwlXiUGsXBDmApKTesNvuqo+UvyONahCh02bR4ZqyKihDk7ATpFGdDYjuqiFhaAqzN
	pB775Q3VtznXgPjdTczZTzq6OE6SxpiC0t79s20Wyg6bZNM9lHt/YqBjcIdacLIHIZquy4vvYJ2
	ooGM2AjFqOVLXb+cZ2Kw7TQf4om1myzD/2oWi2q1rfED7r6pHAMwZfZ/QDjzvFHyvqhG2qS+BcU
	lfurdIUH/f9dC0qraeOMtxVv6GFo7LU4wfEUoMQun0wNVp5sNqqb38TPlrJcbvGhMtoUoPFJp+g
	uFiygiKOipBlQ8pArUcQkSmrbEQ8=
X-Received: by 2002:a05:6870:326a:b0:45e:f698:e310 with SMTP id 586e51a60fabf-47de79362bbmr3717050fac.11.1789141031971;
        Fri, 11 Sep 2026 08:37:11 -0700 (PDT)
X-Received: by 2002:a05:6870:326a:b0:45e:f698:e310 with SMTP id 586e51a60fabf-47de79362bbmr3717007fac.11.1789141031526;
        Fri, 11 Sep 2026 08:37:11 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df90ff148sm1882160fac.14.2026.09.11.08.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:37:11 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 21:06:32 +0530
Subject: [PATCH 01/17] dt-bindings: phy: qcom,edp-phy: Document Nord eDP
 PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-nord-drv-dt-v1-1-e25c073cf1b6@oss.qualcomm.com>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
In-Reply-To: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789141012; l=830;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=LG7yAm5EJ/K5hHiVQ9TOdhV/Qy+L/cR5svbIcTlXH+k=;
 b=HLVsBQTXbJClkf2ZEB8enXlHxfJqVSe1ahjDE+AFNK+5sflhib0OqP/ovtlGUgwOhusywMf00
 /9a3NVJqljGDjeLWuBGki1k0cXRknONchqtEa9u0DabP5wsZJWSi+4G
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=Bv8IUoX5 c=1 sm=1 tr=0 ts=6aa42028 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=lCWEfuFUYIIHy-HYLagA:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-GUID: 3DDIdatwo4jAow8vg3V3NcPXA6MgpG5I
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX1ZpNRYYfMeKT
 Gu/LvN98BLyg9DqONmBkIu8esmX5sxnp9tc+e5FeJaP4eNZqQEz0/evTAgVrxsyKvU1i59Zj2Wc
 Eg9J6c/NA+qRNHD/7i1tb+UA6t77FOA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX2yjXsg8gVbDi
 o26VxqzPcnL+kZ+Cocl+dUsgfqyLJulPIO28CCEaO2rJlVeOzwYrcG8iex/zo0ZlfKPuiL2VBbI
 RGnHEriAdF/rMtBJ+Q3kXHJ0QgaPWZlIW+FAbIEk7LcWeFqQOk4wZ4tvAEg2KGdTfsXPwu+1lIy
 FkSHiIqmMbzYu2r2LgX+5XqipX5z68oG3i7SB7x8cBnH0u97XqDlb7VvbE1SQipP1avh5kfoySv
 digJ0jwB77C++Euw7tqN52KuGtNzgMbkgdyR5FoOKCs6yelxRo8UZv/D9PpCXnUjinI+54joE3C
 0vwwPLZoSclfyJYZ5l+L8JEJyVdyUUuxKsH31UYh61kFxKECwgdjqLWsU+Phrt3ulQyWGqzDias
 P8LL3kbWeqooxY7GIHV7zOJeB9NVxr3dxCw6XLaJrou5DxOqq59RlhFBNyktnHFTkmxyVMeIhBu
 3aJuctcX4CPk8n3hNzA==
X-Proofpoint-ORIG-GUID: 3DDIdatwo4jAow8vg3V3NcPXA6MgpG5I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110218

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Add the compatible for the eDP PHY found on the Qualcomm Nord SoC.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
index 0bf8bf4f66ac..91d7a5c8e19a 100644
--- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
@@ -19,6 +19,7 @@ properties:
     oneOf:
       - enum:
           - qcom,glymur-dp-phy
+          - qcom,nord-dp-phy
           - qcom,sa8775p-edp-phy
           - qcom,sc7280-edp-phy
           - qcom,sc8180x-edp-phy

-- 
2.34.1

