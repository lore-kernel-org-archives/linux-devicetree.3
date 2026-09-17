Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDE63BD25E
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 04:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789619882; cv=none; b=kM3EIEn619m+TH0yY3hmzD04lDnG6VPb1FoWINLCVe4/03VnjXYErEBeNiDYapN88fE7sK5Mm05SB/PkjMRGrLPYJ0fPcLhPTfN58ItWT3ACroE1/Trt/3KMfMR4QvBxe1NNOH9d3uvonuRy6phUn3SIj+AVjoW74RDws0ZAQ3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789619882; c=relaxed/simple;
	bh=Tk08geCKF7VtsNMNSSkHEJwE8HUGWbsjpMIXHsbhvt8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oXlyJEFEoDfCStQ/liBP+rD8oQYk2pceThLpQz7z9Y7sHlxtnzLc4hHxGtEUdtAwkFfh8s+Z0+MnDbkJV25IqGSeifwh+jVj/XDGlYWT1njkHUbQjLPnnHIpQSvTEwJ02OLMsMbeHoHTq0uoqo0SFI0KIv4FwAadifrrJXxqYRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SSADTz9H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fzGcrGT0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SSADTz9H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fzGcrGT0"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H01VIl2470131
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 04:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ALT7CNkpZtIh8XikU7Yr2dzW/OXhytoqSnuSKzbWDr0=; b=SSADTz9HFgznN2hK
	2viHJc/rexSB4V1xKTos4Mze2ffYWLmZ+EM8Og0GlJ8dMD8XA74aMr+AqTwwPcG0
	9Vx6D4X876sju6+tj8HiqoXrZLINhPkaCCgv+lViDt9W7LMWv1kjyGgnxVXXG2TR
	/fHpJhSZqq182xtuLzzsTY2vNt+CLfOS+Vhv7jo/pafFL9deqTGZSEEaXRCMcY+t
	1sjXGbb5HFGdRxWLHyTy+JgviI7D6aEqRX5h/oBMpviTr2tbd7GDjxWlGundHMoW
	y85VpOWeWlTDtzbUQVsfCE6J9tPvwqog2fudxapEuo6VY/tOLl8wjPwLgxvPCs2N
	TCIFhQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqtn53rs5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 04:37:59 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-86a6f4ba619so515203b3a.1
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 21:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789619878; x=1790224678; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ALT7CNkpZtIh8XikU7Yr2dzW/OXhytoqSnuSKzbWDr0=;
        b=fzGcrGT08O+BQXhXUunQe9kICwGsZYrjUVCaWOl7AYio89H7yfDZnECIpfZzXSWebH
         QdEMqeFpbV2BdrvVVUOM1svUEDWgHEeAh3zLG3P/V1NlXPQ7dyhn53UDRZDy5KAQJymv
         DuNR5dnEBKK5yWrvTQgA11XCP76PzLCDHSVhHrI66XmWJnOM5nwiB1slAID/+x0WBZVz
         i/T6iOZP5ILPpySj2G0Vh/tYzAETmh3SXSC3q3IqrNXuK6f35wwvHPl888vYZIL/YihX
         8a0pbTUOXG05VrTW4uwqREmenMVD+kczkuIIsFE09QDKj4mDknrhtlthZtkHwWKuR17L
         NIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789619878; x=1790224678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ALT7CNkpZtIh8XikU7Yr2dzW/OXhytoqSnuSKzbWDr0=;
        b=r4SB9IfYQ7laazfzbfCEowhZd6NdrVk+1g0mj6/nJkbL8RnIJxCzu/dFuiCj2AOnmn
         HCYX5+IklUxSZQQsw3EHOSSVC4931IRpleBsKC3RX6NIK/QVol98ohJ5YoQSHGVtnRKg
         OTah5i9FmstejC+fQ3VJFANOpaC9Q/r0A/JlrxcRBfA0ReqMrxxgMeJVefMp0c6RT5BA
         HlMRObaWGwRiKGr99DAumy2EpBOWuDSGCMPf9zcVWZOph6+BB5rRzVom328f+FpKaBUs
         NEE3/Q1Q1Z/upG/B11olXdDCJJI0M4tiP/nrzuD5+lDrufGKb/PkWG7dmnctos0n27+H
         MaxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwSAvaSP8VJJeQhD8Z3JMsPTiubQEZiSQkp/7vv55ax6PzSQvwPORdq6Pi3nTj9WjB1I9PqXuGGp/T/@vger.kernel.org
X-Gm-Message-State: AFuF++kkYQhQqpjHGsDne89YBfi7GcZ6LFlDKQS22YkfA4U1fOaVSegF
	R3RYtf4WryHZhbHtsdoR4n1E2ICkXuKtT/5qVj0eKMDDTGXF+z6Fhaw3R2EfYockkC/uRaOaQFK
	Kg7hBdKoK97QIk1SiKKUknzwzRWvIdcKrTq/KssUgZlCbGhvYOcd0G07RiCXK1Ano
X-Gm-Gg: AYBFou16KPwQWnVg8a2PeqjzT8Rlb+JBXRs7apnbtkbIXuP75X8VLRQpRhDklKWCQBP
	ClvBM9sBD/iB2E5MbeLbtBlu0gq53LnO3bleFVgJ1e+rauks/LW/hnwNEx6h1KyPggoFyp4lUut
	ljRvl8bjESxvXjoobtanYJlNcM7vUn8eN8YMeprUGxQLWOiuCFLU/oX6CkbBFtH4T8B3F2KJMzb
	3lnC/0dzBaVXUZm3L5R7SQ6kU74JSkmtVRCvTpIdaBy/5aOpHO+FWSycxhCkBR8ipfG+QUGnPBi
	plTibQx07yAu+hacVoTPnKJ62Wlsmu2OMETwchdAGOYRcrvnFvhk2Z27jjyzsn3xZAPRKwplDwu
	PZEeC+XakZWYzVZ8gBnLe3UW6oYHJrNwYEpjl
X-Received: by 2002:a05:6a20:7484:b0:3c3:a20f:f729 with SMTP id adf61e73a8af0-3dd5f45e96dmr12907838637.7.1789619878380;
        Wed, 16 Sep 2026 21:37:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:7484:b0:3c3:a20f:f729 with SMTP id adf61e73a8af0-3dd5f45e96dmr12907782637.7.1789619877941;
        Wed, 16 Sep 2026 21:37:57 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a9fd38sm12357376eec.13.2026.09.16.21.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 21:37:57 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 10:07:30 +0530
Subject: [PATCH v3 1/8] ASoC: dt-bindings: qcom,apr: Add modem_apps GLINK
 channel for shikra
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-shikra_audio_dts-v3-1-9a49e1ca6370@oss.qualcomm.com>
References: <20260917-shikra_audio_dts-v3-0-9a49e1ca6370@oss.qualcomm.com>
In-Reply-To: <20260917-shikra_audio_dts-v3-0-9a49e1ca6370@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789619867; l=977;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=Tk08geCKF7VtsNMNSSkHEJwE8HUGWbsjpMIXHsbhvt8=;
 b=oNG8s0hbg7Oaxu8CBQisHLoqD6+rJnKGNIlACMBG6qHf2IZEwlQjURX9niMlMPY4GqY8ePbJK
 te5azw7D62HBounyvFdqT9+Vz3U9kX9V8adwjte1IpquowcEhcQk02d
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA1NiBTYWx0ZWRfX1obuI116bXCy
 /xNg/VqjL7bE93mZt2kyfrwB9louVe8igXhGijA0SvqSFZYXFPCsHQ1DssgUW2ArkZq08pVxSG7
 uwVpPyP9U7MjK2qdfS3mtex0MOPqDC1Uy7C9RAdgDqk1/QDJA4wzyOBZ2iPOfAquq8YWlkHe1NN
 2s+Ge5JcBfrFLacgnMOZRVAAAeabDMVrskrj6y9O0O94saNZEziq6joU1u1YYHbL6+2fsLNABWC
 W2Pv4KoXQk+rHygb4tBur63v8lSkUcQcIOBYiIrxZI9VdmpUw4/1dt5td97mCv01ShMeyhXBsXI
 5xn9j06aC3seE+b0jpOWyqD+cNjfQeo6DJ7OsClPfdzkV8riEZ4ohyE2+BRkWHaIRR1ObZ17JzG
 /ZwCdTb89Blhd4AvtgYpzkrhLC36pGxYuDYwxmxwlYggPfe/MQCKj0yllQdWYaiCp+aedeWcEEN
 jtTsrUvYytKPNRdKl2A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA1NiBTYWx0ZWRfX0Vx8w/jBnwJE
 6h9g5wk1kG5yHLXl5ftZ6HKp8CuNr4UmVDrdQJ7v5Dt6mZ8bU7BDlWw+n/XFX5mNF+sxYUR/ZR2
 7t9Up9WK3eyUJt6jKJzxXNRCe8t4CEE=
X-Proofpoint-ORIG-GUID: 9CdtBj5yVlgCVNSG0-6Y2jPbUEphw2jj
X-Authority-Analysis: v=2.4 cv=K7O3jCWI c=1 sm=1 tr=0 ts=6aab6ea7 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=HnBwLnbP2RCvDO8bWWEA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: 9CdtBj5yVlgCVNSG0-6Y2jPbUEphw2jj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170056

Add support for the modem_apps GLINK channel on Shikra, as audio
processing is handled through the modem DSP.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
index e51acdcaafaf..01250b556985 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
@@ -120,7 +120,9 @@ allOf:
       properties:
         qcom,glink-channels:
           items:
-            - const: adsp_apps
+            - enum:
+                - adsp_apps
+                - modem_apps
         power-domains: false
     else:
       properties:

-- 
2.34.1

