Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8180B494826
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 11:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789991258; cv=none; b=uwekJipzulSVViD1ZDqjvREBEtbDjh4rrWgrrKusiWE0NltCX1gKxPhyJqLb5ZORaKGyD2eojNFh/7fKB2P2TXX1G1FYPadMbfJplrRbemY2J26Zwt2u37fjdbRogaesVO6rn5kUKC125Z9NcgDNXzGHTO3fsTl3SrLleiW5cNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789991258; c=relaxed/simple;
	bh=+RxU989r9Dq8S90POIQ9gQkbD9kCETs1BvNYgmVIDyM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JEimkXaNJ4m4ympPAKQXtC3PL75wzkP/+QuvXAyQYwXyd3bVmRkCkrjSTg4ZP/gCyCOQCz7VuWHJF/Mqybk7Cf8v6fl+Hpqn8DFgN6LF9AHPtfApEFWi//+SiX0HjC+8wVnQrMNBJLDmE/bl51R2FGESfXIoAH1UwivTWTJ50g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ajrgUT/f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=frAxrjn4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ajrgUT/f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="frAxrjn4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAeCSF419390
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 11:47:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ROMdPhV8eh7d+C9BoO4iWu0ECUiQI1dnpLtY/Sz9jRs=; b=ajrgUT/fyUixG+p8
	l9oahI/XFpSnmHG/vfZ3CCbD3yOZ/NL7u2WRXOObZGX48SCi1cB4dMcC/ID906SG
	IUvHA7QECeI+D+kgGq+PTCEsXJd636WiWcDDXGi/4SKMlNgQ19lI1BK40NnC53gJ
	E0aHRiPJe2yb0wmV1zHujYH74gFiuOmJd/eQ/uD0O37xntWm0dp7XZpnegxOIjVS
	ABvdBCqfriChS9+4C1bGS1mEShpJO8ObJ+/dLNoUP1DgbBkYT6zslkxedNu/Kyn+
	ecM4Q1Z8sJlLaAF6dkpvkrttBtpAewt+Rdv0mXWOe/4Kj6kDR+tyNj90h7dsiTAj
	jCigcQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtyxq92v6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 11:47:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93be6ed214eso434629185a.2
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 04:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789991254; x=1790596054; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ROMdPhV8eh7d+C9BoO4iWu0ECUiQI1dnpLtY/Sz9jRs=;
        b=frAxrjn4ac/ScduZci/6bCcry/yEl9uDFNtLMu9/gSAGzzF6dPReL4kOxuqIm7O77V
         w4f0asRsLa4iC0vSLSok0GYrXXGn+tBSDw5qu220TzKBg5OEp6V7NHbRTcsvD1mL4TXd
         mHFQVkKY56RtkRK5O8dU3Y1MHf1x5lO8YcMACn8unHh+IllxrFJVHU53dSEkGaY6M1t0
         yrIbFrIWl9oWI4ZXLDJ4uXTAyfiFD45RjWGxIvPSi4T9Oa785xQE3UWoOn1oDoWeGvb5
         qx6iF8zMfVffjVoHQYdimF78KIavdy3+4zYCe/F52DQweqyJHEOKYtUqSqnjThM/xDTg
         x7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789991254; x=1790596054;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ROMdPhV8eh7d+C9BoO4iWu0ECUiQI1dnpLtY/Sz9jRs=;
        b=bEavIGtIAI1d86DVjoIVoQkGuw4TggSusyKg1D+FZDZogfQFBmg5XMp9ToN0vkDKhU
         5jRhiIBRrIaRhhyXN9IpMm0Mvwn0zWadAZMy4uUJS12ei/9oaSuf4X0s9pHAVBFhQhr3
         aSTKxOlh3F0LyLipPBrW/ECpiNFCXGzqOPU8W4BaHAkIqMj1mm8+DmykC1XE3BDPWfte
         6ozavUuaNhetfkkomOuL+eZ/+/Y+hIPskTaTLs03rce8uP6AyrQhirsiTMcvmlNe80rh
         ultKgUoTYBnVgRERKDujlA0deRwbjkjq/OtcGID5+sAIpFxuSWcJg6qLBMrqE7VMmGjE
         uqpg==
X-Forwarded-Encrypted: i=1; AKwUvBzCirtQOfguZS2yjfEQAplUtaPOWbmxknWFUgvAL/c3WKxg8qM6NCOzStHPuzQ8dlAAUzs5/OgAq0Z/@vger.kernel.org
X-Gm-Message-State: AFuF++m9cVfC72eCSqKcejjj48Lq6kgzprPcEsbJfELw43K5rdk9up44
	pPASU2E3IrH4NgqsMdpClDGouSmtBLVo9GANWrSiiqRW9pKkvKswm/tIDFmCZ9JdiDz4/KFVunB
	rE6WU1MOHJ4YbhOQ5PC99Mpq9ufsH9zpyZXcVQLYae5ErR9N4C8geSmew3vtDJgFW
X-Gm-Gg: AYBFou2X4BKE670H/Ds98BOjXYn2gDVD4/ub70/XCqAKNL2A8oXnlkBXdL7BusCTX8k
	ZhJfmPHSt7OnFYLrQu7//uEfTOCdLuTQ5hnbzPNLURltjOoZylhD1/osvlmcDhqEXpoRxGK6kxG
	gfdkZ+72qEpFBJJSui4+RFwk4W75aiL09diVYQ5DeEG3JhgMVeBXVKqzHSeuQ2JerrhWrmfMUQ1
	5xVrXhhkIAws5QLqXvyWw4Ve4aI5lx0pT6ot1NM3ZeULWeIVz2bS8dbvFupOS9Jumr28K5p1hdd
	bEOsNsY+N1HgCaldeA6rNHrLPYRkuNyrn+/ow60URumio9VtQEZaTu3Qr3613cYMNJQzOiMR0cW
	afWmDs8wre2HOQSsGQkgqfJw0JHw=
X-Received: by 2002:a05:620a:371d:b0:927:25f5:ee08 with SMTP id af79cd13be357-93c15ec5578mr15952885a.43.1789991253939;
        Mon, 21 Sep 2026 04:47:33 -0700 (PDT)
X-Received: by 2002:a05:620a:371d:b0:927:25f5:ee08 with SMTP id af79cd13be357-93c15ec5578mr15946285a.43.1789991253175;
        Mon, 21 Sep 2026 04:47:33 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd10273fsm227980625e9.7.2026.09.21.04.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:47:32 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 13:47:06 +0200
Subject: [PATCH v3 2/3] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Document the Nord QMP PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-nord-usb-phy-v3-2-68aa02b12b96@oss.qualcomm.com>
References: <20260921-nord-usb-phy-v3-0-68aa02b12b96@oss.qualcomm.com>
In-Reply-To: <20260921-nord-usb-phy-v3-0-68aa02b12b96@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1986;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+RxU989r9Dq8S90POIQ9gQkbD9kCETs1BvNYgmVIDyM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsRlL1uYaQvA0U7uANR208QSEW96HJqpJ3eMx8
 BGkEPSHYxSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarEZSwAKCRAFnS7L/zaE
 w6CVD/9sQ9yVu2iHNTeGaCaPVJDIYS+ReRapVbMtPCxddI2vlVwrtJuBV+eUmJOvdswWpYitmi1
 GKqBsldMRIyKO5JXogp6bvkjg2nUzujDmPMdNZSRsEx4kRAMa0FhSBuf0LwysFrdxqJyj3dLn21
 0EfLmxbNLwMeVXiSrbsS/xuI31eOWTAlNZbY1hzpR5tut5cKOtu1489TNt0tjZqK+2yHLbhrhig
 Il/XezioM/2w7IkSx/DYs0zBkRREq1J9un9fa75IrYdDvCrlQpGy6CoAb66T5HWhiNK5WsKtjwe
 5Ylu9gK0oOMkgmt36JNEOl3bdhBxkc+QjhUoHSBb78ikWn1ZGJ8CRrXqM8PBPy+oto7U4q0rIWQ
 fpLaC91D8y2dQKgn1pMY+OgBJv1xBciIhwT3uUwP/sJwCpIm7+Kxf8bCOJYmg5rtDkt/SuVuEOJ
 YVIkprxg5GB+VW5vEU6cfuhtPB+7DbItRlkPuY/vryvELQNAlSxQe3hxwtDEesXQ8xJ0/3Bb1AU
 DPyVOviySNiFeIHDDlHEFVDy4nc0xp22WxSmsRJHaRUOkwu1wTvgSRZbNT7E4ji0H847VJKsyj+
 W/8QZoLNnUaORm/I9TCOxQF6KfU85kcwyGr7ApmznJV9i40+y+udN8QCbWxfi6MA4rkZugATKo/
 DJMGvLEQnlQdu8A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 1fiBrho8uj5i3SKrUdqg-QXJP5dK_dJc
X-Proofpoint-ORIG-GUID: 1fiBrho8uj5i3SKrUdqg-QXJP5dK_dJc
X-Authority-Analysis: v=2.4 cv=OtraWC/t c=1 sm=1 tr=0 ts=6ab11957 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=ukKPufHZZ26NhZEM1hcA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3MCBTYWx0ZWRfX4fd/sEYaZh+t
 Hj/cEYQ0f++HcD1B2KHakFbHUWC1cEc7FyjZlQPivio8+6SOHfmBLru8zFO13mX+DTSIefEWcdO
 jbEbeaHMvqSREHONfotVEgLjBCXRP/aMmveEQamYyvcxe9ibqsu7iOmHAFj/I5Pr2OcZe2D9uvC
 WMpbTnlEOnCx6rr+sy91GHosh7AveVEodpEP8TU5pS5QP5+hBCSV/IS3WRKnhgRLfO5Vq1/9jff
 gyD1ja/dN7Am6vTVTBiMHNOfllNsC/P2yM50+77XGYj8U/69CEV+XkS3Wy3aloABudbLdwyOVmU
 IYSGmMN7xgV0ec28NOzAgjTEaXcguXxtEMSnlnxNHja9IfrkGx9yoZUoNd4ja3TQ/g4GwNdsp+j
 loZpbnFhGlH+YVswRzOTKlYEHNvEGxFVwfd2cdh/3AZMqCIE4fEIuoB6DpQlZKGQUNXxpwfmjrY
 9G0PRmXUpOcBOFjkE2Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3MCBTYWx0ZWRfX227aRED/T99Y
 enCw3B1ligj/deNgjxTRQPI+CdIJuOvKPZuVvugBT+qk+xYamD5vVBr5BZCsdmR3UZpjtdlt+6j
 577hDCIZxUoaX/fe8pN59HJ29kC/V9o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210170

Add a compatible for the USB3+DP combo QMP PHY found on the Qualcomm Nord
SoC. The PHY sits behind a GDSC, so also allow (and require) power-domains
for it.

The block gets a standalone compatible rather than a fallback to an
existing one, because it is not register-compatible with any PHY already
described here. Its USB3 and DP initialisation sequences do match sm8550,
but Nord places the sub-blocks at different offsets within the PHY: it
exposes a dedicated USB3_PCS_AON region at 0x1e00, which sm8550 does not
have at all. Falling back to sm8550 - or to any other entry - would make
the driver program the wrong addresses.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Assisted-by: LLM
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 43e90995709f..13e64fe510b8 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -31,6 +31,7 @@ properties:
       - enum:
           - qcom,glymur-qmp-usb3-dp-phy
           - qcom,hawi-qmp-usb3-dp-phy
+          - qcom,nord-qmp-usb3-dp-phy
           - qcom,sar2130p-qmp-usb3-dp-phy
           - qcom,sc7180-qmp-usb3-dp-phy
           - qcom,sc7280-qmp-usb3-dp-phy
@@ -249,6 +250,7 @@ allOf:
             enum:
               - qcom,glymur-qmp-usb3-dp-phy
               - qcom,hawi-qmp-usb3-dp-phy
+              - qcom,nord-qmp-usb3-dp-phy
               - qcom,sar2130p-qmp-usb3-dp-phy
               - qcom,sc8280xp-qmp-usb43dp-phy
               - qcom,sm6350-qmp-usb3-dp-phy

-- 
2.47.3

