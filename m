Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822CB493622
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792053582; cv=none; b=YVAtxns84wri6LNiYAzgD4+qDEpA6t3jlylAkjSAeBZJ9y0htvIWtzVan/GEnVrrWoGw1C2iKeB/2PW+UZTMNozzQRAcqqCGLAVtq/b73LE8KuXt0c29pUjlweTSgyZXq12M5ziUskpJb4azaxpy1bfCT+BdwZUSG36D8Xtk/e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792053582; c=relaxed/simple;
	bh=BF6415btVpAVudmuKDsPZH7SQiNfH+6JB5g0CaPUoN0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oLxR9Oqdh/dAi3WaA8sjzPiZ1cXemZAmm1dx+P8Kd2B5Iyfuowm3tKphelzg0XVLkRtl8lY0U+JSBeo1oYFVxMZbGBCEsxN0a27zgfKf+baW6XDAsx+nPKRC1cdbmRS0PQDoKj/dJ0kfbBjvYFZGzHCR9qXGib+bYxKEWIv0I8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a+e8eLWn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aWA8q8TG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a+e8eLWn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aWA8q8TG"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F69sAG500312
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cK9XIjoJkCr9hVq/5NleYDwc98kzEkgjzgNbxN/oBho=; b=a+e8eLWnUNrT4+2V
	QV74KKIVMR3Q52obrwt9sH0ki7L8tY1BaW3QSaTajSoS2cyiaVvyfq0f0vfZ0p7v
	a8cDGafIuf0R8adE/SIVGsXCsekZjtsqF6NDZIXaSAQvDTZSol6akUleizrqiygz
	/s9hOCh0KK3XK5JPSOtgPDLorokOzoAJPpGXTas+iWLCsStNw696RjuuKjZYJQwR
	1XUjv2HwfaFjnAdwCDW4/Q+tfcr3Qf+XCLd9q1Kd0UEMqdLEpkLf2ZCwseIudj58
	IyeWk4a8UEOpdBRLEJZrbVJfSOFehwkM0evvmve6hT9edE3d6ziHv2ttIRKn6TEM
	Ae6WBg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haagf43ae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:39:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ecdc701a2so169196585a.3
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 01:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792053580; x=1792658380; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cK9XIjoJkCr9hVq/5NleYDwc98kzEkgjzgNbxN/oBho=;
        b=aWA8q8TGwylrcd5ZvO6S3XPyuTByEaNNVh5egur8DUVDRXqdEu8CgJTlgTxLaYtWoF
         ZjXJ2Wk9iPaWtwZuck8S9wdZUZKeK+ZgMLc46FkT7welv1kgUhH6HkllCnmPjQ3GWAr1
         9kCrebRYGkKn1IGCIk//6Jc1EDjxsvvUddrZsXGyHDX/9hkWbYeXEsMo02iVEXh3ZxD/
         vE/I04+JqAqJTLLr1S3USor7rzfnA18hUOMcyoLwQ0tvloyv2PW7P0/YPAwqxywakKuK
         jFouDIgZ9DO2k5+gB2ES9tUgT+N6jNgpfvcT6zSfYcfrYBx4PCSRyTV/fNJ9CrihTkP/
         NixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792053580; x=1792658380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cK9XIjoJkCr9hVq/5NleYDwc98kzEkgjzgNbxN/oBho=;
        b=shagSj+iUMG4B8cPKumI0hpmH7lUt1lPeJ9ps1nCfeZvGxnEA4JkZlMy6/vLlUdmDV
         MVuZ8GkT1/Fz1SJ/TGMgbyBH8kpYqzwA0Aj9Er6J+3CQE6HNOzIrrLuF0Wm7pNutzIA5
         RrDz4d5xjYpDaZyhOFb4xJpx15YQeGPY2gvIMbp13kwN43B86wuYxrGbp9F3cxc1VeUO
         xyaIX01uI/owBt2872VUJnSQINVyChASNq7rbiVuobljJkunx+i20nJ/j1SiLZNWIGfg
         k/HAqWA9r50EocBXr46OfWRgrnECRtO3Sj8zLQXjvCQAbjW/9UOq1QD5DvIlPqj+cLs6
         wsEA==
X-Forwarded-Encrypted: i=1; AKwUvBxvLOIk8Hv+xOPLKQwtxWGmuzBgUHEE0ouXGHeACqjnZNdqt34UkmuwJpny3C3Yr/9nYfoWuJ7UKX66@vger.kernel.org
X-Gm-Message-State: AFq9FYKq2XE9YOexDmzGZzpN2aJdrSpgYlczPt875Z+gHvc9PnNEb949
	aPCuI8Cj88cK74Xq8X/tGTG2TCuffFDfVm2L7JLTZgdgOqfTu+sei7U2bjKfnxnIaTb+P4a+hZd
	z6ZNhrhL3BocbAi9BdXJWL76K6FNYPzXvSF2RBxJTEcVAt3RKXxYMX+q77MalMmLE
X-Gm-Gg: AYBFou1cAnzfvPO7WXha35JL6ffGKnLJH4iVyMN+BlW0gEcSrlxJY/LUdOJ/rNwqKsw
	YGGU0jo1L7G64DWWU+FAwzdObIiBuH1dDQVBy1UdwaWZmrIFZwueQ9ltWXT/dOExxkZwmnnfm+5
	vLZ8D0Ww+PsZ9PxPJ4M7am/lI3qg2GqpVkqa8m8tiqAXzARd0P+BdNpSBpxhL6PHiSoosHJx34D
	PxM2pZjZTFkGybjsa4v4kibzPD/O3UCA4Ade44x8tV38yf4wnG30UDc9LgdH4jUbAlbcr89G7+U
	7wcHjri2pfthvap3f2USSL9hkO4J84nWyAhebcwblcAzVxPnwX2Nec0jHlM7C2Uv9U/iATfn3Bw
	x2KwWUffQjC50XOkuhkcD0sJHprcUowDWrixCTffBp0B6gi3eABwmYmGctZBNytZEjkvF75/Tg/
	f1SVQ8aKyBJAZq
X-Received: by 2002:a05:620a:8082:b0:93b:d7a2:dd2e with SMTP id af79cd13be357-93ebd28c77dmr2879346585a.62.1792053579530;
        Thu, 15 Oct 2026 01:39:39 -0700 (PDT)
X-Received: by 2002:a05:620a:8082:b0:93b:d7a2:dd2e with SMTP id af79cd13be357-93ebd28c77dmr2879344385a.62.1792053578957;
        Thu, 15 Oct 2026 01:39:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d702a5sm1175500e87.15.2026.10.15.01.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:39:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:39:10 +0300
Subject: [PATCH v4 3/5] dt-bindings: arm: qcom: add Qualcomm SDM845 HDK
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-sdm845-hdk-v4-3-b532b9f4029c@oss.qualcomm.com>
References: <20261015-sdm845-hdk-v4-0-b532b9f4029c@oss.qualcomm.com>
In-Reply-To: <20261015-sdm845-hdk-v4-0-b532b9f4029c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abel Vesa <abelvesa@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=843;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BF6415btVpAVudmuKDsPZH7SQiNfH+6JB5g0CaPUoN0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq0JE+UE7YxD5k/Q4vJWHJoJXyEzJelSlS/4YLN
 XbzqSTj9eiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatCRPgAKCRCLPIo+Aiko
 1eV1B/4hKCj9iu/cD3weh9fVlRyrjQnZHnHtqQAuqn3ZDqCC6Td7Z6Hs0cpl7CC1Ro47a9/slbI
 nvIh52QHz+UX2j7qKjXnOfPS+x1nD32l7y57jRphcO17lIWx48x3SzNhCbBxTvBBBETGoEe/dfE
 Iu3lXPoO08mDAC8lgM6PvEQUUXSL3TZEMnXkEVpI6+gp9mlmLHu/nwt7nKCHD1AwJHA4hr08Jsp
 DK2TeowQOA/zZXMfAH4BCnhStOupCr3A2Ps3J89Nqa3yqqdHw5DzSbot+TAr9AZ52JfIJAii0MT
 XnwgqGnah0p4rwDtovARkKmY1eHH684LpYDbMOVOXhBJ/wkg
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNCBTYWx0ZWRfX2skuM5H/dL5g
 5cUOhddaOWDriNCRFzCpa5eMVvUoyEbJMKyPJnu1qhdeU8G2ZXdain05CRfVlZtCoO40+i5nGBP
 J2UCeHcZ/XUfwriwzkxL/CXE2CUxZf8l6HiLzueE7sbxuXzUaajpMw2VHdRgzV1gTiCMZ8dDipn
 fiw993XfOG72gabrWvDF60H/LM76EpX7IxhhPIfz9sQoXR2hYgqqJt9ei5wNee5JyeunLXuZzHI
 g5kQfs+7jQGqCboKnFk/4Gvbme6qKrwHhyRMHWhj/r0Kvz88Y1qo6HJInRuQlimnEr2IKhdwUg/
 rLBTGF7KMXZd8haeE9xQ7rqf4xcQFLaUG8w3SQ0mdhjFHuHWfM0NjS7HQUp3AWu0u18wn/9edkk
 F5iW80jIAud2JTUWmj/N3ImmflJ/5nY+QYfWW1CBmkL4eXOLhe4mJ1pyxoT7qkgc8M5t3FBL7ef
 G2l1yMIuUuxYjhevlHQ==
X-Proofpoint-GUID: -MrAuGwFCg7BBX9llDofmI_ga4gBh0rv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNCBTYWx0ZWRfX1gvAtWqsx9HU
 al7OMNEC+LH9y3vUE8g96vcHapTueKVSAQPDclG6rsk2LA01P3HmEZojHYjqA3fiZGgZCshpo21
 Eu2lBnmNhV0Jf3JEle7mMxnF77aw6UI=
X-Proofpoint-ORIG-GUID: -MrAuGwFCg7BBX9llDofmI_ga4gBh0rv
X-Authority-Analysis: v=2.4 cv=V/noQuni c=1 sm=1 tr=0 ts=6ad0914c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=9nMZPvWkDyzw5AdY2PIA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150034

Document the mobile HDK for the Qualcomm SDM845 platform.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..dec58f8818df 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1003,6 +1003,7 @@ properties:
               - lg,judyp
               - oneplus,enchilada
               - oneplus,fajita
+              - qcom,sdm845-hdk
               - qcom,sdm845-mtp
               - shift,axolotl
               - samsung,starqltechn

-- 
2.47.3

