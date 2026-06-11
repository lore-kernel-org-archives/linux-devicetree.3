Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E281366DB5
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781153978; cv=none; b=l9LgTpwdWA1GWWlQH8ltULSWtHEbKws6qz14GJKRX4024VDHmddJx57o7DnuNNGgItfaJbY689RulOjq5XWbSWp1z/kLxRVyfuW4ffpolMzOTVgPH09qXgV038BUGsdZWHEnZQJic119h82NPNUkKdBqu0/2VEMVUCwMSZX+fWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781153978; c=relaxed/simple;
	bh=tXKQIHOcQOcv5dfQ4xmeHI9CPhMtp2fTEYmIOeOL4Ps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ffFufUKEKdBtYQKNB/0JxyF/Ei6J9qW/BbLzmJpSnUsLHiLSNnidBNRJOMOq+NjF1QCKn4OnBDcqNoT4563Cite39HXSsQ7IcqfmdddKkprnrnXnBaLDA7J86TLZ8RuwncwvnfYaDtZlwJ4GZyqcCxz1NgPl0DKurdS+/eIpU24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i84v6avV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oy4iFglj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i84v6avV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oy4iFglj"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0OHrV3181137
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:59:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ij76c9jqjldbAgxsdOIP1tQ8uMrj0btVvmuzEdPMK9M=; b=i84v6avVaEfMdH47
	LmGsKa7FN/IyHCR6HgmpIufou9YYkh1XMVsOSfWBTSP0VVlOa6mlIJI/B8n+aQ/r
	kt8/iwBo0D+Oe8oQYOcGhZlBO6JtyiJKUo+BIC7W4QK5BLZPFZxBUGEXn1FJG0PS
	kwOdnATE7TrEtl2aKh5FmEc4njb7S1cf2ZaeaqqozFGyb0hpZCJ6112bdVzBYXyX
	kcs97iIpwuhthawOVzaTWjEvg5xB/i7Os7A4sLuSOSKmyYKCc9+v+Ktvwbo8EphS
	Q1u3a9B33yjXnyf1hFtaALMg4h1s+zPoxQOSb9qkC8le4PRMHrX/FcMbR2WAhWKa
	AtBKzA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe71hs4q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:59:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c2da7fa311so6235355ad.3
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 21:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781153966; x=1781758766; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ij76c9jqjldbAgxsdOIP1tQ8uMrj0btVvmuzEdPMK9M=;
        b=Oy4iFgljk1JltogebzN1H9+D++VN2Pi0asHV/Amgn7XBvAjrO+xdICQAu6uZo+9bMu
         fqytccFP+L0lcC0wXzY1ZaW+uArj/HtuihwiL5TShgv4iVlqei/guxy8hfwV0hrW/b8i
         hz4GZdyHP6//LsPfHy6LKLjB2Le1oPrl2Uxdr784SIVCtq0haz5xlooztTpVcpCbeQk0
         bkmU7SIr2RIpGaxpjGy3zdwjMQFV+e3KpKBfRdgHS89jbUBJsRo2EqQxtQEspyHgx5p/
         Z9pqTxwqPryORqIYjcfikOvkk5MwdbHfdzTw8d4jWBP25rd+/Uu4YDuNfyk1tHP6oLmw
         HGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781153966; x=1781758766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ij76c9jqjldbAgxsdOIP1tQ8uMrj0btVvmuzEdPMK9M=;
        b=aohkvNRJ3vM0J7PdhToHMWK9dAr+8fXuQuTWHB3KbM+hVKPjNp/AHLdQDMLMWC2ptP
         Cdbrc/x1iQL6fcejzEVxWBlBogU08lnpnJRH256UFoRbYsSkfsGokxX8xIMuN9TDlJIY
         p/RzMIrISAjleh5V9kA4qq8KiR5uSYOkkJi94D5eChMZomOpVm4yFLlVYqm/b9lBXYQO
         ovNDjO9YyKe7xD7XzSISdbUjT12MuwdW5vnwD6C8bJ8e/P5LJ0F9GO7CyliQMGIj0BaS
         S7AlFPbUFFwBKAO/X4g0+nBp/J3CPyDN/dcCCpfr4URJ6oyVZdrRqdVbmhhK+cjCS7ow
         A1qA==
X-Forwarded-Encrypted: i=1; AFNElJ+HcLuEGdI0EreeZ5QYRy7Ht9w7jD/oOxHUj/fWHOiJxsPvzU1Z+eHDURkmYAPMLbhDXF2mg7BU9mo2@vger.kernel.org
X-Gm-Message-State: AOJu0YzO/mRgOnPpFqLF5ajAt0uhc+FamJQd9dS4avYg/DAI05Sjj3PY
	E6RL3oFI+DHU1BgU+JfQ/X2KLum5c19vbZyfZLB4VT6LhRdUhV96RRkuoxpRD5tvvU46z6p/0NY
	B2S2v733QuDKhuAKMc+H6mYaqLiGm5xTuhqYEROJGtFNOkdr2ctp7J1mFz8GGuRi/
X-Gm-Gg: Acq92OHjP/z7/stP84/OTgBYAt2IdOekG+x3rM67MlLPxwOSaPNNvF6u9DNsNbwQ6hr
	v20ECqwRU6VKvhDoJzgeQ8K+dm8usLeQR4xz6jsM89j+jpz7djE18bLKImY4Y0QIT6D8dT8kioq
	2S63gSe+4YGMdaIoUj+qz/fE7vqirblIZezG/d0xcbVsz7+YDxXHstFDAdk0C5jMePFEznckh8M
	7VrKnDue7wSH4OiKt09es0kDbbPhGmykSEIaC9W01fy27egApSnou8f1tDwm2d0AmiQ6ehz5Egr
	LR8YcLWGBRgpLotEYbcOaD9SowfR/ys+xhHOrcJeiob8PNlV6v+vcp9pSZtUn9T5+uHES8LdnZ9
	O2VYtMbdtacwLoKGmlbTSMUTXWHQYGYW5VhjPDJoKIwpMFuhpJCGtUuZjtZATs2LZGRs=
X-Received: by 2002:a17:903:1b66:b0:2c1:20fe:9d5a with SMTP id d9443c01a7336-2c2f373312amr13646545ad.35.1781153966206;
        Wed, 10 Jun 2026 21:59:26 -0700 (PDT)
X-Received: by 2002:a17:903:1b66:b0:2c1:20fe:9d5a with SMTP id d9443c01a7336-2c2f373312amr13646085ad.35.1781153965760;
        Wed, 10 Jun 2026 21:59:25 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.21.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 21:59:25 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:44 +0530
Subject: [PATCH v2 08/37] arm64: dts: qcom: sm8450: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-8-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=1321;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=tXKQIHOcQOcv5dfQ4xmeHI9CPhMtp2fTEYmIOeOL4Ps=;
 b=WSu/OaebYjbYRIL9y+CfZqSN1nIrfVUAkKlPtXO4P7RmicIkXOGVMzvv7ilb3AqG39WFsk+hO
 s8UuHk/5qv6BqJGZmrUn8oHTYl9svEbesYh8hHpYoxYlDtbSwR55vU1
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: 7c5yl_EdWLwqQj0ynYi48_xZxkuQbsTC
X-Proofpoint-GUID: 7c5yl_EdWLwqQj0ynYi48_xZxkuQbsTC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX7TizsV9IbI/i
 a7qK2HpFocN/YzDMuadaW2//UAf9mQGdRXhX0GL+wxP/88lzChcUgb1cSCphzqG7+pYcgagguZL
 FuYkuSKslQaWir1OySsFVsCL/7nnYxXSx0uL/WTXr8XXyrtWMc+qoTdSObs32nPEcvLrqFgVeS2
 zU4TONS/LmdtbNNa0jBRY569XFEC7ayon7bhGq+yAF/E0RJ+q0keCMtsPKeH8XyoZQW3Z2aQzn3
 nB4+tYTS/ThfdX0xC2noupbH0q84u1A8fMdTCPXkvAl4OxUAZ7/uznNs9Uww+29BMpSeKcJt8ts
 OV84U2U6Txfhfk570MBoZqO/6kvXvQYrYgUvVbiyqll0PD3C9KphehDrwg/zO595br3FucsUY67
 B2tycT0miYKGDbdIUwLZkTvCqWaZUXjGptNxUlChzEFXiSJ8igzH7198fjbG2lbWpjcmzJlgStW
 7l9wJXsMNyWjumLmDYQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX+32qJT3IHjWX
 rviZabfnVD18ByoFk7XOY1PTehesVsla8LTyD/pNoJk/9oXT6ZhuqGntOHFKE3MGhSnb6u8gEsI
 HQ/kZ78vbGuHPa7F/CbUXg9RK2NHHRA=
X-Authority-Analysis: v=2.4 cv=Lf0MLDfi c=1 sm=1 tr=0 ts=6a2a40af cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=TRJGHeO7bdl8qYu8Ap8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110046

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 03bf30b53f28..acb36aaaf20b 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2035,7 +2035,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie0_default_state>;
@@ -2200,7 +2200,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie1_default_state>;

-- 
2.34.1

