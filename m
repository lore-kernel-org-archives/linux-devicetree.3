Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E62D40F8C4
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 13:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948130; cv=none; b=kzFnNqkTn0V28MQyd/p9vEBv1E+1kLpIjGKi0COor9+u7JOH/GaLMJcXLRL05K7UvN0pgHtykIvI6px9Jptn9U2qV5kGrAaaRRwvBWY5liaXIAew9bdsruqJ6aJnfbfyFp425Hotj+Wz7/FFa+37el5nQKHYfDApXj2U2uo+rSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948130; c=relaxed/simple;
	bh=UOsIgF6my05LXHOCsgMOLRl0/ijOlWoiUY23cNh3Noo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uIovi+FBwWatgnlDiN5grPkhSjr1Fk62NtoDZjmwwuEsueWa348NJ8nXWLbZVusvuzx8TRBBbrGDqeDrJRHuDE1L8YtG/8JIFzefh6P0Rn6Qw31sRwApZ+/84CuzCE/KasmIMOOrW0MRdRXzbK38+SIeSuLJw1eKM614SdnXl3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bl0Ga2+v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UdfpuhII; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bl0Ga2+v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UdfpuhII"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDb2V1299339
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 13:08:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	URgzAqKEdxN6silXFEDVaD53BHQnlc9kI+2F4MNt3X4=; b=bl0Ga2+vu8Rx59Mm
	XMNKBXLpF5hY+Syr2pTQ65ieqS/vPN0wgIXStqYxGpx5SNAZGxPwXP78t1ViNOfQ
	HsLg8otIKf9Sq7PRxvn/XLFgqUttYWeRkt6Pkbhx7gQrJPwaIfqmL4snW9VveEH9
	Y6AENQnGChpeTioHkcMQnAXidfICqbAo/soHIZBWSEYLdl5EhO5FjUsSssn8vMJp
	ibjSBVBddtoKNlG3trXqnY9hJEG7sJIbi/jGLwM1VGPdCEFLVbGmnUe60+NJSWfm
	1f7bcvlCmUzYJpB5n0cUFBQP8jQCbYV4R+EAfm5cageW1YF9RvDGKfGoqLiM1Nyo
	8rs/fg==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk3gr5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 13:08:48 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6a1791a6281so4494571eaf.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 06:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783948128; x=1784552928; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=URgzAqKEdxN6silXFEDVaD53BHQnlc9kI+2F4MNt3X4=;
        b=UdfpuhIIItaih3KEQS/Yl8BUs8IlchEz4DXNckQc3yk1XO1lRGuPZMv3CZpnlOkLRv
         gRdcq5kdBwvRiv79JLVyfNZbLT7wHwaArSMjNvbx/2dV7GksyCWljSApAPTjCpEllKod
         lcIlejcdsleYYv45ipO9JZ/OJpoMvojJOkfUAD2yIjTFZauEJyljYmiPac1t31qfdDnq
         WuKHcUfsUI3gj8SYciY790nq9q5PSdKfeiorZmS5IUhWPQ5uvB/VfBEv5D0XYL3oZbJz
         wllI+wf/uXwfX8kg8KkCo69/kzLI9P2fJDwkQ1kAsgf/8o0fugKldASIxU29bhmnYF9w
         +fkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783948128; x=1784552928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=URgzAqKEdxN6silXFEDVaD53BHQnlc9kI+2F4MNt3X4=;
        b=lpkCZ+E2tD9bwcpsXPwBLPbQBa9eJWORuppY+fzf58wgEwFlyGWVwudKyg8BpzZq8f
         lXLKB/QhZg0Eep/NqypC48chc+LNKhR0TLTce7FOOtUmgNrkPAnYU4xUmAkXW1Yfxuje
         VukVNAs6VecF7kalb864BShrnlaobdGZhxqBEJ8JYUjMrnJuR2G6YgDKasWML4PjPQaZ
         t8GtjRiTp1MWeeqGr3oGyN6mr62FpeXhbOCGvibsNatNqVds8W336cI2ea5IJc0J8YDs
         htzfqHzMESx1QHu+cZ1/vd1BhB+SiJkKfqtlBeocTSv2StDfT/oOYavDu/EMndz1cvnq
         sgzA==
X-Forwarded-Encrypted: i=1; AFNElJ8bICVe+nbUCPPXPoiejTo9A7MlzTc52o/LFoE1tXSlQsTycVgmpaXCASR9fo811rLAYdqLY+qzkobU@vger.kernel.org
X-Gm-Message-State: AOJu0YxzOWiAdnb4JpsQD+PI8zsBVSfQydqF/MYOYrCqb7rKWPp+W0sB
	ZjH6ea6ODjq/D0paCpVeOpfGMZUxrdiE0eaT5kRGnXiIx28d1RiHsbVRlfK3esa5FWPQTctDFPV
	6+xymqJ1SxYBtw6IFHCmeCcp2Avcou/Betp4FMj8Wqay9mcokOGG9DmB12LCE3tuC
X-Gm-Gg: AfdE7ckHilXEshLlTDJNwO9X6F1qw+9WJQYqnwavJ1R4oJ5WjpNQYhb5nZPgV/r7MIR
	cLNCRYpKDQfn9mlxwcSxKMJoaSYenDdMS+oszLI1/VxLmEtrIftLmuMYCVdSNywIvMPyg4Q37xw
	yEs++9d+nDQCPdMcPGmwp2QpULCvj3m+73JHyn5tf9V0y/2D1bjNRUw3Vs60qKukdA34226uxfY
	dLs1mL1zdMMy3FqyxCHGLfw8IpjhzA3HHGuIz4eJ4p6R9zN8Umpl18Fw2pxSsC2Qi367h0ikeiZ
	4ZqWujGPxvqDG9ptPGNwHjp/fwscxfSWbK6BRKgIKAYddRCIKnx2CVnPPtiJL8n+aa05c3ZdY4s
	d1o1qjh5zqcH6/aLVpSIiF01OLijc7JhLEyQK3UynRTrv/QVmBnPgFE8i0VLahuW5SkMhXLp+SH
	JsC3UH
X-Received: by 2002:a05:6820:2d05:b0:6a3:8093:a171 with SMTP id 006d021491bc7-6a39a82f11amr5648111eaf.50.1783948127881;
        Mon, 13 Jul 2026 06:08:47 -0700 (PDT)
X-Received: by 2002:a05:6820:2d05:b0:6a3:8093:a171 with SMTP id 006d021491bc7-6a39a82f11amr5648092eaf.50.1783948127472;
        Mon, 13 Jul 2026 06:08:47 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a38e16c7d8sm6415913eaf.9.2026.07.13.06.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:08:47 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 18:38:29 +0530
Subject: [PATCH 2/2] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add
 Maili QMP Phy
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-maili-usb-phy-v1-2-3285da11f148@oss.qualcomm.com>
References: <20260713-maili-usb-phy-v1-0-3285da11f148@oss.qualcomm.com>
In-Reply-To: <20260713-maili-usb-phy-v1-0-3285da11f148@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783948113; l=1096;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=UOsIgF6my05LXHOCsgMOLRl0/ijOlWoiUY23cNh3Noo=;
 b=gLotHIuTQWD/8ME1hzzYrtw2qcDrZhzaTUhRFRsCnP5LAWHJIhK2furLgN2+F/K225spvZJCJ
 BVsc0pZrkqUC5WmQ8+JSioPJxYwovxG5auFs8jX0xZCq7820vp1T6bt
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: _iXCSdN8pULWMGx14FUAAMSZg9aNyidb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzNyBTYWx0ZWRfXx+4n9Rhujjwf
 xUZUTdVcs1vBLymyFZQvA1ZtPJel6+yOfxAK4Mw5n/jL2pvatOXCBlL/wnJtoQmOlEAr9BXKLwj
 5q8tODH/OlsprUWwJMDyz9jjj9/SqGE=
X-Authority-Analysis: v=2.4 cv=e6c2j6p/ c=1 sm=1 tr=0 ts=6a54e360 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=c48FE4Zzs7BoiMeBshYA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzNyBTYWx0ZWRfX1b3N4PZ7+GZj
 4P4KuYmjHUagCJb+FwU0OS50BsypnHcu0MIywlNIJLTWuNkfKM74jQYXtO4pJvl3DMQXyWItbBP
 x0a0GtrtFTlay0F7Qu+VcZbMRHvuWrjDJEUT2D2OeZtzf906nOAf2oU5N1Wylcd52AN1/5wYlFr
 nkhPgocnFuKRangn34tKjfU2avozTALc9+uaVuU8fIDRDrUXdfswbXlQuUFRdt3RgXFp84jmrVy
 6LqqQ6MzEi0rNlRXe8Ir6gB+dzEoqh1oGbwjne33zExyK0J/YA5a000ySMBhQ7130s1NMYGPvYn
 106b/n1dWjHYPJ66+kZBDVJ0P1KjkUZ/HNqzfGxI+OvrqNtfgMC1rZB9Pl2zdFrEi3fRwPzeYXG
 n4u/BmtX0qOfLePxYWLPCpsZnb3bdd4B0IXprGzSmmL35HtktU+ujVXDzyAbRWCGMQ9hI/CZRC+
 lUNXu5Ljpj5+tgjwIXg==
X-Proofpoint-GUID: _iXCSdN8pULWMGx14FUAAMSZg9aNyidb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130137

Document the QMP PHY for Maili which handles the USB3 path. Use fallback
to indicate the compatibility of the QMP PHY on Maili with that on Hawi.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index ea3f1699eee8..f1bad6b1739d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -24,6 +24,10 @@ properties:
           - enum:
               - qcom,kaanapali-qmp-usb3-dp-phy
           - const: qcom,sm8750-qmp-usb3-dp-phy
+      - items:
+          - enum:
+              - qcom,maili-qmp-usb3-dp-phy
+          - const: qcom,hawi-qmp-usb3-dp-phy
       - enum:
           - qcom,glymur-qmp-usb3-dp-phy
           - qcom,hawi-qmp-usb3-dp-phy

-- 
2.34.1

