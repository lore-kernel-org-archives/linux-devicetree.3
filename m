Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD30C32E729
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 03:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788406484; cv=none; b=NPDVe5oUYWTwiQuxKS5M6hJawD8hu5bANNvO1wq2vjddrNqtIKkS9+NsR2KmStEMiBQ9cpmrCWTLw2sidURW14ZaPAdE2qrvpABswizcvVfy06V4rwlLKAQdmtk2MznbjD151XBtdM98sv+S/MjkDEFsYFTyscvhT66QI6D0XpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788406484; c=relaxed/simple;
	bh=aIoghjXx6AVRZdTStyBOvDyftPf8mmSjjyNh+gwUU94=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=leHuuEuFivI1q/m8+tTo3uximjM9+Zlo7qnX5oYHDkdHc5vl9/Qw2QgJO1B60Y2TMrDLk512dVg0bpMixgmjAn1cYwlw8voXnzb6PIapM8DBxmkRofQVWqUppMHYXA9AjstXtY7RH+3j7GBDDez437W4njYCRTweDWeLQw/PRQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S9jOPrTG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A2Edxnab; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S9jOPrTG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A2Edxnab"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6832xlJr2882169
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 03:34:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LpLw0Zeq9QHYUh5WFZl+iJsyGiCuxAh1isv86OZyLC8=; b=S9jOPrTG8btAAWgt
	dgvhIo01manQLgAHCuqvidawVFjNmUIgKmpkBfhxkcTq7yWdPUCxfMznsGnFP5VT
	Nrv1IGmfm72Pzz0j+iAs1Vjs00ft4YhZgsexmSZOUmCSW0pomtJNmDb+rkAQQc9N
	ZMxTwkayyV/QpGSoh6tr4gjNfkEeXcpRJ71RXj4RtZILMOjBVoNbHqny6OpM+4tZ
	SJGtMHwrHS0FjgSnCAi+AV8TAR5jyDHWyTzBR1cPLnGJWEPTsQItUnfKNmmlFxRg
	mr1VmEnqiYvGu02jbCcOUcpr9/n4vxq/T+rQVf9AE2etOKrgIEyz4PHzRD+PIagt
	HOrCcA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemcebg4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 03:34:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d91aa5196bso4099675ad.2
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 20:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788406479; x=1789011279; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LpLw0Zeq9QHYUh5WFZl+iJsyGiCuxAh1isv86OZyLC8=;
        b=A2Edxnabj1tbJMMbua2jPessrDopdtuGYEn/UT6fq2ASjOj5zsXbOboNgQaz7ZTzTS
         KmhoGQP1w5JT7xsUJiXASdBHfcSv2fjik3n+voJ7cRylXAN8KR4l7qhVirJyKfodcOKo
         bDx4XpXcyAyNuGFDqlhuI/U3U/Ebv/W1ddQ8Ci3M53UKqLuGnmHL+79Xa2KhF9UHmO5O
         RMiuXnFlNKk3ipLq0UHE/Kfj2TY1qmQ9+avWcILrh3VCDdQsAvHcalMM0B0xRcpdYT66
         hL0rnE/DE7bGRP5+5DiDmIlBRMz9hQTPLXsva2J0e0jcm1k3ERxYwrkioUcOE0jrlXZg
         Br8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788406479; x=1789011279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LpLw0Zeq9QHYUh5WFZl+iJsyGiCuxAh1isv86OZyLC8=;
        b=DcgWaiit0T/gijDjHZOZZvo8HHMiaer5x9SsWzB6B6/SPkFMYj8CTF7Dho/JcBQbxq
         lsBHOK4vYr3YepJ2mDT3BEF4MWgDrxSx+oCvuo8vjtxuLLhINj4Q7mfPgKix+JfQuaIV
         iWMbRQy71iwiWW4QXWrSR7eCK/RFseHRsh7K39JPNEQbsLZmiMRgh2AGYnzmhgX0l7Td
         hNjKyiawQbQT6x59izN4VcW3v44TQf4RngAtRRs14080pf2fi+KuJ7R2gB1E36UvSVjg
         19NMGZlKcre00diWC6vJqLdLkNLwwN6DL56LQt6cHKj98L8mi/X438+kc+2OPKfumVP6
         H7qw==
X-Forwarded-Encrypted: i=1; AKwUvBzTJHZPt8zhvuG3HWhVynUl25dEzsa+NMcbElr8EbSV3fOwxJFhmrWwmvB3BT8seefRBpUOTrs+PROR@vger.kernel.org
X-Gm-Message-State: AFuF++lIdxgZzqZnqKz7MndRJcaV7rddC6UVsKN2d1nXNXgV+YtG6pLU
	I8vn+TnP9+EicR/5vbQZS0iiX1mBBsCETiMsbzD1SPkCpRtxdia5L8QCOJQ8g71X8bFrEd5+/xH
	06nb1qraaMZOwSGtCJxjapH7MPkW3BHSw7tvZGdxh54lYvhSWs6fgx2YyrGX6ORF8
X-Gm-Gg: AYBFou36XobFGLyRnB468NTuG2WKZJ5MAyn+ldZL0LyDufXFVuK3c0vBpU9WYb5F8MH
	x8Zj9jZ+JFaUBjiNwKJ42aF2XkL9rv2VTlR/jvYL1vbVddJYEb5XiINWdSG6Qvb50T8YfTo9Pl+
	qSrNN5t/PI8IFo9q6VNBeKck9XNyloNwnUNXWNsIDSNU79ShuHYCSvBLgQQ3JEwSUXbkUOL7UaT
	/3K9WwrdKivuSpLqF0HInb34jIV7R5ILe21pkumjjwF8kqvFckLiEEwhBcAYpTFuoAH77a7Sr2Q
	Z8qw0STqwO18TJR0UmdPSOlBkumTn1hdNwGBOviRulGy2CyfzCg46tSkY4/D4JYCLWmgoNf8QZx
	hMDuDqSU8ABTJdshbU0JeQC3CrysqxYXY8Ic8Njh4nf0WEk52NsoEIf9T9WQt5stCtP7wPVKL77
	5sjmuP7T0XiCS3D+3EEn24
X-Received: by 2002:a17:90b:4c05:b0:396:463e:2eeb with SMTP id 98e67ed59e1d1-39aedc2cf4fmr8675701a91.0.1788406478635;
        Wed, 02 Sep 2026 20:34:38 -0700 (PDT)
X-Received: by 2002:a17:90b:4c05:b0:396:463e:2eeb with SMTP id 98e67ed59e1d1-39aedc2cf4fmr8675656a91.0.1788406478217;
        Wed, 02 Sep 2026 20:34:38 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33253672941sm2375624eec.3.2026.09.02.20.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 20:34:37 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 09:04:17 +0530
Subject: [PATCH v4 1/2] dt-bindings: display: simple: Add boe,dv215fhm-r01
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-b4-lvds-panel-doc-v4-1-861738a0d5de@oss.qualcomm.com>
References: <20260903-b4-lvds-panel-doc-v4-0-861738a0d5de@oss.qualcomm.com>
In-Reply-To: <20260903-b4-lvds-panel-doc-v4-0-861738a0d5de@oss.qualcomm.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Liu Ying <victor.liu@nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788406464; l=1266;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=aIoghjXx6AVRZdTStyBOvDyftPf8mmSjjyNh+gwUU94=;
 b=GdA0yOy9sZkqisuLMxVOuPRs6wPmQZKY8asVdqr22N2zcboT7iHqBiojcfFNsdkg1N2SoeM1Y
 K82GwYW0ilfBBE9i9anGR8wj9A5GWHiIW2bDqH7H0cL28eH6M9pPU4c
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDAyNyBTYWx0ZWRfX54rK7LizX1fu
 IrH5gqUqoma9+nMU34OUostrk5RgT4vpa+gK0TSFthjJrwvNcy+ZEWoJwdkIhH7XPQlMWPqQ2Ch
 YOpN0+Jpy1G+RgBQMzhLPaGv2CUWmAZWKo+oW+STO8CxMQm2jJq+kByfwzDeK3bDSvvwT2u9j4k
 bUn4MKkTte4EPRqcq5oIOhikabTGqN0fSfeoYd+buMUIT4+cTjbrGWW+mZ81M5r1p/ogzDNmRp1
 b9ZjHsPYEf+jjFn+t0kfQCQ2cTf8MDndbAQ/gzFivRgVBNHg648vA0ujDOS4b0PFvUPrb0Sikxg
 8mUasTp8ZigBswQ4QA9D7rCa2t6lAacHMEHRP9qN4EcI3qOR33Ci3dikpFPXISeqFYetzQVpGhr
 96MDt7HVG+qWoy/8pwCKzoL3SJx3k8VBhEj47uR5YRRdbfIs2OVpTRSc2FNRbZ6bL4cs1gM+27q
 aovB2lPjehzX9tGHPpQ==
X-Proofpoint-ORIG-GUID: 7pwmAl_aMyEKlaBStgBlmVlTjGsNpdQ5
X-Authority-Analysis: v=2.4 cv=QfpWeMbv c=1 sm=1 tr=0 ts=6a98eacf cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=8AirrxEcAAAA:8 a=fMfOcokNL7symIEKlBMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: 7pwmAl_aMyEKlaBStgBlmVlTjGsNpdQ5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDAyNyBTYWx0ZWRfXzlmmhmDe6Oe7
 cckCtpGZAaLDc9NFa4+3krRs8h6nFFi9IU0gwg9HDKrCaG2kq5MwAMhOCgkY+eZxmLsHbI3A5q0
 ixJV+qs7fu35QmKchsCST/rT4XIQujA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_01,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030027

Add BOE DV215FHM-R01 21.5" FHD (1920x1080) dual-channel LVDS panel
compatible string to the panel-simple-lvds-dual-ports binding.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Acked-by: Liu Ying <victor.liu@nxp.com>
Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 .../devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
index 8a2f6feafd37..68beb476fb48 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
@@ -44,6 +44,8 @@ properties:
       - auo,t215hvn01
         # BOE AV123Z7M-N17 12.3" (1920x720) LVDS TFT LCD panel
       - boe,av123z7m-n17
+        # BOE DV215FHM-R01 21.5" FHD (1920x1080) dual-channel LVDS panel
+      - boe,dv215fhm-r01
         # InnoLux 15.6" FHD (1920x1080) TFT LCD panel
       - innolux,g156hce-l01
         # Kaohsiung Opto-Electronics Inc. 10.1" WUXGA (1920 x 1200) LVDS TFT LCD panel

-- 
2.34.1

