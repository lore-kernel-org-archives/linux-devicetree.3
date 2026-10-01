Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F415172C6
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 13:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862574; cv=none; b=LUo0E2v44K0VHxse6ADnIKcTmvXSbOVlgWfHH0YRICJrK1XA6xH76MGUqlhbFBYsZQBfLmZmcIbfIOPeGodUqWduJWAqIMJo6rZ2MmErblTS1l3/Y3OhwZzNndsP/TN6gNT5+ndafMYHsKNXgyaLNvqxMqTaWgn/zfZi8yAFX/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862574; c=relaxed/simple;
	bh=jzLbBGVCMQNw9atKruX89CioZowzDy3zfpgXzSDgV9k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CJLCZjQidYc6EBTo5TRIx31WnNiIxU3uWiFybiplcBtlUicFl4+YjHPzfTGuRSHjXX249lHULp0jFNAF1NKOBl67Kd1fMiVELQfijqh61+LoDmBdbBLRnbAKZORp7itEYwBdc7EpT6ahGDydx7ANi55lb5WKkcTxfL3TlHtpD+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AYeydzLn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YPr3UEbs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AYeydzLn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YPr3UEbs"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691Dirm53228354
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 13:49:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=W4VCobRhLa/HlEd2PVZkof
	cVwcQj7/GsereQGC6YFic=; b=AYeydzLnXC+oTLkIGPGoLxpK6JpkGAiVuml8fT
	RfL0iOuEfEMrcquZUDvtfSAi3el33YtjiQN/ay7vvQX6YmxIJAcACmQYIgq6XoM9
	EfbAQ3EfykWW7yfxiAvbpPUS/5aMPgvJQ/VHOzG3qTgcyIzGa/l+pYkcFhQ+mJDz
	xjPKsKBbpV/9PoHHwE/y1pOVSxB2iqfVFM82Kumw25NdnO33bSeRGz07EE9DnLiM
	ziHpG2A31UQNKFHZWqT4WVLhzGg9aOR5D+MbOMMPWCFUSRbqtMQ6T5ipzo5azPKL
	Ln1y/vjjIuMpY42szfceaAcnXrwKwXBx3WNFPMGG+Bx6s4Sg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1quk88dy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 13:49:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e2e7d08ab7so14785365ad.1
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 06:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790862567; x=1791467367; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W4VCobRhLa/HlEd2PVZkofcVwcQj7/GsereQGC6YFic=;
        b=YPr3UEbsofbjOceo3tuO1P+BwG0NbFsAIeDBoaIGhltR552ofpse8D4AN3m34oMdvn
         OiTvXzkVVdueCpa+Ux3m1GuQCgMZmhhx7RmSxKxN2332Ld1Xy55L4GlfYTsUWEZU7JdM
         X9gpp6Tby0GmMNW5HEuUcXKMkrNd8+aOqmo/rL0MOzEyX7gterzeRHlhJ7AmVgiv+pKK
         Q8aRJQ9gaI5Xb4TIR3PBt7v2pg0r2Ej2kCZxuvlWeEAXMmX7h1ghehVO3n/YvwkgLbpd
         +rUD8BRLJ5Zt+9LZDuOQiuDGYxek7qhZMrKjMI+Vsd77TzTz2AXfyoUPJJ6DLXHGB5de
         cnXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790862567; x=1791467367;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=W4VCobRhLa/HlEd2PVZkofcVwcQj7/GsereQGC6YFic=;
        b=0KnVwhaVuvuXSn9gC2JwsW/dYCyWNpzHCBCGtqPbcab1lrtRuPdqfVuVB6hlbMyyF7
         TUxNhvteZAoXY6uTPFh3uW+XR+9cHLpSF17df2yWfuvTegY+JeNbTRqULv/+lZJ9sq3A
         LWvOnaiyC2WGcO6W6WvClb3w5LRhi+awH/KV0zhJ5WDBcKuYzh3UTrbjGQB004l0XZe5
         Z290/XOc+mr179BFXlzzLXCTIk5F9X8DyN1HrGeF7WYnzII7blgH+mwcueqHxzoRPiGI
         7FbbrpD4AJd48oPTeUc1kSxEFu8OMX0vyexznxFaCz5bgdr5gI7c44Hm2E2h/bGTUwkB
         5bkw==
X-Forwarded-Encrypted: i=1; AKwUvBx32osz1Qs56APjc9ChvUQrdoXXTKunJ0C4YAif56S3/cwXEPKHc/PAwsMqcP5YTjGTwqkI58tdZKp1@vger.kernel.org
X-Gm-Message-State: AFq9FYK96/6Y4bvwYxSRVujCtWN1ZdGLuI79AMW2SYDZq3XQ6UsL4f1p
	ii/Zhf4F0yH3mYjW8YjJEuS+blqiuerPHX8AcCZRAvZQytUBNegLmrJvniErVjYUi9q5YFZwrkp
	t6CA7uV8UfdMalNPztZ9fNZ3WIcY4f2gM8BT1p6n357hLz0jftTmj5hrFRzYDuQHx
X-Gm-Gg: AYBFou3+h19comKS+leHsHXhY1JOnOMrxXjKKm2QLQCw+TqJvPgdCxMCkuiJvH7OJjp
	7N4yV3RDCmN9P2CbsE9IyP2nLw31q98lbg0OmYv2i7Cdze0RzP+Qst126n0qRa4sEA8VeRWf0UQ
	YOXKdYJ1rqk1i5pDNa+RMVzRt79KkKFDbjh4EBtDkLlslgu4BQGJFtdHHOXXHZFeKrPa1Q9bJQa
	LO6OyjrM00cW3wL4sbvdHunPGVY9MCdOvhFzTQQpqqMqHBNFMJSMq0jBurAJQRUfEaUhTe74Z0M
	FSDmo7M6rguq71SK14EAeG/UWRSGKNB5U57GNwav/KsCWaI8cfga1U/GpTlo3pE5kyTXoYpEuGK
	9YuF3yhjYwQnwsQ==
X-Received: by 2002:a17:902:ecd2:b0:2d8:d4d0:792c with SMTP id d9443c01a7336-2e2e49fb7f9mr36367345ad.16.1790862566923;
        Thu, 01 Oct 2026 06:49:26 -0700 (PDT)
X-Received: by 2002:a17:902:ecd2:b0:2d8:d4d0:792c with SMTP id d9443c01a7336-2e2e49fb7f9mr36367065ad.16.1790862566431;
        Thu, 01 Oct 2026 06:49:26 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e300b6f9d3sm10714805ad.75.2026.10.01.06.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:49:25 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 19:19:19 +0530
Subject: [PATCH v3] arm64: dts: qcom: shikra-evk: Add GPIO expanders
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-shikra-gpio-expander-v3-1-d30c1e8067db@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAN5kvmoC/4XNwQ6CMAyA4VchOzvC6sDNk+9hPCyjQKMw3HTBE
 N7dwcmDxkuTv0m/ziygJwzsmM3MY6RAbkix32XMdmZokVOdmkEBVaFB8tDR1RvejuQ4TqMZavQ
 cyqaRBrRVUrF0OnpsaNrY8yV1R+Hh/Gv7EsW6/QNGwQU/CA1aaoVGypMLIb8/zc26vs/TYKsb4
 dPSPyxI1qqUqlBWmuqLtSzLG7UxEecLAQAA
X-Change-ID: 20260924-shikra-gpio-expander-25ff4a29c848
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790862562; l=1966;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=jzLbBGVCMQNw9atKruX89CioZowzDy3zfpgXzSDgV9k=;
 b=lGhVbOZ5syqCHUY/f27Ro3DsfRdLuGuSmvFXyHiNb4TpI9OUBVu9aAE+4AKQxAaYMehV4PvGo
 fUSr8MoncQgCIQzh8S2jOTWn6ATxj2qsl4+aClAumW7WsOvUa7rK1ed
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1NSBTYWx0ZWRfXxd+abTLGrkmD
 Nb8Z85Q9Bk+rul8QPMaflTfW14kckXRqHI/zFRlzjA1lxXspViUJgy18vyEnxht4Kja8Ma5OSpJ
 56GeTJ4Jcr/quD4InVAPpIqK4vD4oyY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1NSBTYWx0ZWRfX56t/rSZ2Dhj2
 AOIKy3ZpIIClX9Jp0TDtdYRkh/N6ZRKGv5M3MXlF0UmbOQrDyb1ZBo0zb6nb3ttf9oHQV0IU6LR
 oBScrNkPX7/+zFLKzT1wJSb0Evj0SezWdGEXBz2egdf0CpREReZ7qjPLNkem9Z4KeY5WqQhDfjK
 x20/0DHBBsUR0CS+skYtvPjKMOHi5rswaMcprxSItQ/Ed1HOeypbDrpZijpRfq7N06jqIhgCA27
 3s76aacFcUHKIfL097SiOe2qsbSHkHqYe0PO/+wYwaTQnGXVWASY8VTH/mKlqH2c8hvyePXz0kt
 i7brgLWSRVOddnaf5/4NYFQRGnMR229lYwGfeFxKHZt4tdYupsppw2WCMH6sPKB0qpwz6xRDH/6
 iK15GbXu2IX3hS+Qv21/Db+ALqKRabDJvIfxXPygIfiBL0Z6o+NixaPHk1TlVgenSbWxt9eNN8h
 Szp6GRnyj4sXudXSpCw==
X-Proofpoint-GUID: SLFqDGq5xKaot8jj2NKlvs1uVbPfrMhH
X-Authority-Analysis: v=2.4 cv=TdADJhQh c=1 sm=1 tr=0 ts=6abe64e7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ELGJhN323uyAj9mGEkYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: SLFqDGq5xKaot8jj2NKlvs1uVbPfrMhH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010055

Add the EVK GPIO expander definitions on the I2C3 bus. Describe the
TCA9538 and TCA9539 expanders used by EVK boards.

Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Changes in v3:
- Sorted the child nodes by their unit address (sashiko, Konrad)
- Change node name to gpio from pca953x (sashiko)
- Link to v2: https://lore.kernel.org/r/20260929-shikra-gpio-expander-v2-1-98ea5808c4a6@oss.qualcomm.com

Changes in v2:
- Moved GPIO expander nodes to i2c3 (sashiko)
- Link to v1: https://lore.kernel.org/r/20260924-shikra-gpio-expander-v1-1-71929498ea44@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
index 7fbd6d1de19a..1c49cb52ce12 100644
--- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -11,6 +11,38 @@ &gpu_zap_shader {
 	firmware-name = "qcom/shikra/a704_zap.mbn";
 };
 
+&i2c3 {
+	status = "okay";
+
+	expander0: gpio@20 {
+		compatible = "ti,tca9539";
+		reg = <0x20>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander1: gpio@21 {
+		compatible = "ti,tca9539";
+		reg = <0x21>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander2: gpio@38 {
+		compatible = "ti,tca9538";
+		reg = <0x38>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander3: gpio@3c {
+		compatible = "ti,tca9538";
+		reg = <0x3c>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/shikra/qupv3fw.elf";
 

---
base-commit: 6c2cb8b8b843d216ab549b678a0d8831c43153e0
change-id: 20260924-shikra-gpio-expander-25ff4a29c848

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

