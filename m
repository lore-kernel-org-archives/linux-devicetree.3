Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197044;
	b=I6HC43QGoXs8GXtTjZV7BehFfKCHAwP3j+LfbxJPLfr/GkU+Lfi4QDUbYYWH1Tg792+r
	 AB1JNb3m+OMdU9OYx4pAs8oe2dTleGJ/Ro0HEdfejAEQxCL4FHhvaSLsstf3gOs0f4MDG
	 CTLmqj1nczmXH3icnZweQ3bJPPlib+yVaYBPyZIoKA+FuTCPup0XsF665ov4xbcQZy1eq
	 BKPcJyCqzDftWQNnTjkUn4QKU38MPXuloMAF29xkItTGEzHouYbGK4KUcwctPkku+VpI6
	 WtZQRjTa4v8J/NKPmQk4CimPoRPSFIgdHAjoGS2tKSJbGhPMhQ9YMpcjGOKBDBJ5bGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197044;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hmWM5fppsSHiHGHFwZ1uLxSBn/TikX6J7OE7IaENfqw=;
	b=qvchjFSdWy1OD9wr6o66TiGmlxUa5KNpJ6yNoygy9HxdX4dtGUFh6j9dCHgYJ+w39HuC
	 PyYYCVUZeNJgBB2/txGr+Vwf69At7llFobforUR2kRc2DeRYO9Zz6Lxvr1e97hU43PP/l
	 dt7USK9iuQjQOelkf8Rk5N8VNkqnt36l/jnPoh6JCw+bvV/aMyxGdtRb1oerzX2rTkJQQ
	 dGsuYEDiecy634BpIqm8+d9dXTeMRWSsUX0hXEpZkP9zrH/XXUVwRgY8qa5S8TvyyavQ5
	 DT5vIVJKzB5UHDUpXwo3IM9nRRxIvSBdbXCxNTIQvRqVJ1i9IBJATF0SoN+wMlNDFmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="W+YPHLl/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RvZOYyO7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F15C606A31A
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:17:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F15C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W+YPHLl/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RvZOYyO7
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SDI8Ya718125
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:17:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hmWM5fppsSHiHGHFwZ1uLx
	SBn/TikX6J7OE7IaENfqw=; b=W+YPHLl/muJ3BCv6DK0hnAHAg0DwB6fW8Q4wf2
	PyGsNHLIlMON8/3r0J9Td3Jw5gErxlHnjt9aLKFquO6SbrWiisBEAJ9IJRqPjmxY
	0ei40YcAALd+MVAuQVRSfwqMkzTAWezL2kzL8yH0pwlwU8RVTrdc/wGc4RFJUfEu
	ElApk8umxbtmllxGZFV5bBQkQJlqn6HtT2bFBWWCzeOxh0C5y4k34ohQ3mCc0uI9
	Pai2dm2bvKFiWhAvNIBaBlNWhz2BRtANRwOwdcKrDWXtiEJmDElXx8yxpPG+7/0i
	ft8MGYG4iVDXZoEifdtLNGN3GCGS30erDnJPsXKGoqWkOg6g==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtjg7wj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:17:23 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-990885654b4so254923241.2
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 07:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793197042; x=1793801842; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hmWM5fppsSHiHGHFwZ1uLxSBn/TikX6J7OE7IaENfqw=;
        b=RvZOYyO7MW6X4B51RJXEWO5WEQj/TcXWJWNGRY7QLzlAYOlYptf7h08aNXVQk3qdLV
         Pkfmu/Zb7hnUEyzrkcmvnAeCWjxAGUtDQS5gxcors908WjXO7G3gOf1egelFMN6K8S/I
         qe4xQ4PAwJL2oZJU1QrloSDBLLhHKqssX7ppE20apNApx7kbCK1bzuHWtJxw0HiZP8LO
         YuzT8GbeCsynYZzYyMYbmIf7Gq4QAUzRm1MKs3PGMm4CweKBCcIsIYuKmmDl4DA1zo+U
         zyCZHegB3kay+0ZOSyrtwXk9uF88QFJyFY0KfqYX5miUXeUYPJQKv5aJfQceBkuU5NDe
         1Blg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197042; x=1793801842;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hmWM5fppsSHiHGHFwZ1uLxSBn/TikX6J7OE7IaENfqw=;
        b=QImlcnQ3Hs5KpIYMjiQf6V0TPfRLZmlIujXRVTug7fAOmCJUVZ0ZIB5TmefJs7ZxvF
         AgZUByeZvWc2R0Sl7JQGzubeJuZVk8NQA+Q0e47AR9zPlDeOPSToThOYNeXRn1Lt0jqo
         zJx7Rja/OfqL90m5h38N3XxXkPVcy0PTfxq+PUNh8rCNSuAmelQfbv6wMdjzegfnvlTs
         XkcKHDEnAgiUOCEWla8ukVdTL+U007yRXQMa9iNs47fJ0bfh+4xlxn89WUwFPx5Srd6d
         DPgZLul9qLuLH/Msmd0fqSQhYe9nfu0pFFrIOdZ3qrWZ/wad+58Kk/3Eq0KpBFiP0wn5
         ngrA==
X-Forwarded-Encrypted: i=1; AKwUvBybA6TW5M2uylX5qLT8SVP4s7fNRjCOxl8IpCecIz/qrTeBBPLO1H1cozp2WLGv8qV70jcFhOAwlWTG@vger.kernel.org
X-Gm-Message-State: AFq9FYLzXPecqkd/Xe2IxLCnCBpNGCQ/JZzhAame1EpliPHzQ3BC1CXY
	OTBSUVicYnwVQS6OUyv9sKsgPi3At4RHRJPE4644+0eXivGy5E8qXL61YyeJm7KJqPnCpcLzIVA
	wMME+YdtmIOFkV3v7wdSKrAHMj3XxelCsg7SLLQNd+/g9sTp8Ij9CH8ur85AQoggK
X-Gm-Gg: AYBFou0TqoUa8Ea0EgiPvteAkFLGglrkATeZawFgnZ8mEQM7+ewRpdWNUU7pnH/Z4wP
	nhSw6CLFGmQ1V2h4JoojMZRYbhmncyrG6wpn3KNMKL37DNqQ2OPoHEsc4gKxtmVSnqYXyTca5ME
	6cVXpwN3zH5mLssInbwzwpxHWOgb/Yy/zGZQwcNnqimnoeufokXFh00MJrKBWdq0gedvHaw0O6P
	0nrORAG+wqUCEWEg7IMf4HiAKAN3NW9JYf2oNNdfxZdXzADT5g1Tqyn0/eryFgf3udg/T7DwN1L
	b9XCUIMfVZ6rVs82NeZ3oqgqe4mPvkLawaKPaLcABUmrpHbmVSRivY6vbIe38q2pV3LLuVfe6Mm
	pTuQ8J9pOkr/nB102MqoIW+lnebBdzLTM8Tl6Fb+veFNaFgt4Ed9bv4Zv/jtDR9UrnBuTUs+UU2
	x6s76iTBwrbZMiLSkPnuK6c0OhdpmXga0wRweM5FD9Eyhdajibp7Or/NYNXfLMTvfC7gXJb5+oA
	vSkxC+yPyaTjqemEX9rSsLXkifi
X-Received: by 2002:a05:6122:1c03:b0:5ea:d14a:ef8f with SMTP id 71dfb90a1353d-5ec4cc14f21mr1095725e0c.4.1793197041895;
        Wed, 28 Oct 2026 07:17:21 -0700 (PDT)
X-Received: by 2002:a05:6122:1c03:b0:5ea:d14a:ef8f with SMTP id 71dfb90a1353d-5ec4cc14f21mr1095688e0c.4.1793197041412;
        Wed, 28 Oct 2026 07:17:21 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:9d77:8e43:b62f:d85d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8dcfsm28463589f8f.50.2026.10.28.07.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:17:20 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:17:18 +0100
Subject: [PATCH] arm64: dts: qcom: monaco-monza-som: Add ADC thermal
 channels
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-monza-therm-v1-1-dfe4759c15bd@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAO0D4moC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAyML3dz8vKpE3ZKM1KJcXROTtKTUNBOjNAvLJCWgjoKi1LTMCrBp0bG
 1tQDPM7VuXQAAAA==
X-Change-ID: 20261028-monza-therm-44fbef42f89b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1NiBTYWx0ZWRfXxZ7lIO1f5swH
 JXYUEsj7ALArfyLdSct2fmanj6g39NSgefSv3PAxTBTH3myE4NutSPM1Ui93Q+5csqtJSMHcWzj
 lLlACS0zqW7jyaBJy8AmO+iF/VU2f0jYqm6/xY4+iTqdReR8OBC4fZCPJnNvf4Ubhy/G/BkFyer
 +12f8//mbZ+llYvi8/aONeTf4N3kmuClUtxqn1e1zscGoEkbM1MTMtDPsjeK+UAw1Xc6F8Uga4f
 ID/maNXAV/mlMQPLAlpiptumCRBEzkOBNn5ecw0GMmypGUrdeSLZmkRPNW6plUyI3N9SSy1Vlql
 +U+cPRh0VYB2xs/zax+cOBrQJtKbePXu5QJuf7r7J/42QTYDZau2TIlBq6DuXYf0AXXnGwA3nc6
 IOX8R21C0bw4Vcn9ZtRgWkWB430bw88nTwrAd7vtR9br9iPsfdzdDLsAYxqp8OWEA0oMu8RiOj4
 SrbstMrVuGGLqry+Oug==
X-Proofpoint-GUID: I9miJuMYX-9d-xGsQzYYGSGWI9riveoR
X-Proofpoint-ORIG-GUID: I9miJuMYX-9d-xGsQzYYGSGWI9riveoR
X-Authority-Analysis: v=2.4 cv=LdipeTfi c=1 sm=1 tr=0 ts=6ae203f3 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=gjCkitBQ8UzLeNF7HDgA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1NiBTYWx0ZWRfXzEebZaTdDkqD
 nG9DEO8VHAmJMaSV65QRP8FDTn6L7v2ZUSEzVE2ikfkcfMv1a/n1uW+CCxsTRZehZWretE3XftF
 VpdqM/qUJUAwo0WvwZvSLiZs6Nyyz8E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280056

Add ADC5 GEN3 thermistor channels to pmm8620au_0 and pmm8650au_1 ADC
nodes for thermal monitoring on the Monaco Monza SoM:

- pmm8620au_0: XO, UFS/eMMC, and SoC thermistors (AMUX1, AMUX5, AMUX6)
- pmm8650au_1: SDRAM thermistor (AMUX6)

All channels use 100K pull-up.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi | 40 ++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
index 36af1ad2105d5b3e5674fa59f5648c77ccfe7d11..dc2ef7e5b061354eca4e4fee90906e205ccac1a4 100644
--- a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
@@ -227,6 +227,46 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&pmm8620au_0_adc {
+	channel@44 {
+		reg = <ADC5_GEN3_AMUX1_THM_100K_PU(0)>;
+		label = "pmm8620au_0_xo_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+
+	channel@48 {
+		reg = <ADC5_GEN3_AMUX5_THM_100K_PU(0)>;
+		label = "pmm8620au_0_ufs_emmc_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+
+	channel@49 {
+		reg = <ADC5_GEN3_AMUX6_THM_100K_PU(0)>;
+		label = "pmm8620au_0_soc_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+};
+
+&pmm8650au_1_adc {
+	channel@249 {
+		reg = <ADC5_GEN3_AMUX6_THM_100K_PU(2)>;
+		label = "pmm8620au_1_sdram_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+};
+
 &qupv3_id_0 {
 	firmware-name = "qcom/qcs8300/qupv3fw.elf";
 

---
base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
change-id: 20261028-monza-therm-44fbef42f89b

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

