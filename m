Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00123E49E0
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 07:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785223572; cv=none; b=j5JCHXWxYYID6heZLEmhpJ7wYCV8JKejKRfEdmH5lNJo7n9gaKFnJOYXrWxuQx+hKX6vNX5CNBp2owoojA5sjHJpdWGng/cV0bzXVkZLm/AIPgsvi0I978AkQZ5sO8sBJl0qqwFaz68ZfulaEey78pLyQABBd4mlTu0xGtqlPPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785223572; c=relaxed/simple;
	bh=Pm06IB3S3ZqIeBqgyvmudkbwk6bnZwwOq4nmv1Bp2tA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ORGZ0pwEBkRGw1d40Ui+QX0aCek/WSDboJKqqwvdfl/K9P/+VisPkKx9pnJpqAsCZV16edOMz89sRSnDf1woxYRqiM/7kswk7qe3grTYMmfoM1MJjBUu+SU3j1iMpvop+F83IZaP4QcgwUHwvqmlqiqsMaGk+lwWuUCpM8CNAoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dr9zs4Uo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZvkHqOoP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dr9zs4Uo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZvkHqOoP"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S7Jgog1973235
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 07:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+v62N7JBH1aDp0r/0uYnn05XtwD8U2L+HWTx3mhO7rc=; b=Dr9zs4UoDHBU76Hg
	4dRP7XyEQnyEkK8E0ue2LSOffVFoh5E33NPu40jD7O9iWksfYko7DVnl5d9AEwuo
	n7Xbm8ugBo604KmEy/uX+K+ZwIctYg9P54ASeBwlrZoPk3/Gian87SZxKc2DrTc0
	AJv8HXyJar0R/zxvxcaLMOvybGYPzu+8PXvFQ3hqAKEUrBm+lMqySI2GOZbLgl1S
	qFh/bwYpDoeUHgYihGOdJj2kL0zH/AD+RM+9nSHPKuxcfXrqGz6G2W4ga3nfadr9
	/d12wGU382NTugjbqZCMwRyt/Bo6dWNnMtfet3B0ALbcM8t4GOg5TQc9ofhKZ9ef
	Ab/gSw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpqxjg0sr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 07:26:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1eb52e1fso65780041cf.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 00:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785223569; x=1785828369; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+v62N7JBH1aDp0r/0uYnn05XtwD8U2L+HWTx3mhO7rc=;
        b=ZvkHqOoPgGjofXdDKlCQySTvvvJoCwqiZ2nLpFKozFg8X+Vc0MOspI9Ts9sJrayWdA
         tqPmUprzZ9eqVG5/YH6vydndzbbVT4SNc9+XrUvcoy8HzDahrqh1Tz6Ho1LRWDi/O3IT
         C3NcJ9Tsh7h4K6hf4NQUMx7K8qPRtS/5boIy3xifNnybkFz2P4OwNpFm7iwndrshl5Si
         HUrslLi7m9koCo8AvljLNrhY1PijmgIOjHtcFdfyeeltNU+zMKtCMDi8bB8XbIPIbWUA
         57wQFyZ9B5pLI+FwwhT4JQMX/PBTmzXfFCMay9JJI/qe78Ij1+ehIJ/vMfAkVDxyQ0aQ
         MYmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785223569; x=1785828369;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+v62N7JBH1aDp0r/0uYnn05XtwD8U2L+HWTx3mhO7rc=;
        b=FHS+RKx5zeaqS5MZmTAbNYOOOhq4/ibXq/9iEl/ZWNW7XFt4jYczRTkdtrUsi3c/+G
         SWZ6SfUO0Vg6zXaWaluEUEr3dmq3s70GsxZeOBx6h7yZLAg+uj1Iay1KkSCp9c9wMKTe
         5mUGDGDyRJetyeYRZdTVYliMeNS2m2BPfy6LuMyneonM51PfNKmyyt5MvqA0NZHM2Ypv
         LPAB/j1mj3z5mlXqr2V4K0Zzqy0xIPYz5jHJNsB/Ka6vAvxBh6D6/XCMcKnUry8OpAKh
         16lDQ6fX2thBfQELdvzszr9l9wWLYoI6Z6AYPaMwOGAyyVn0rtb5Et2C7oXRNEtZE36y
         o//Q==
X-Forwarded-Encrypted: i=1; AHgh+RolqSwcsw9jQ9eq2uNucYk3dPLQLl4R2/kPph62ZsfDuTJFR5q2fDtSjxgei6LPQ3wdKIoZcsw3p2YM@vger.kernel.org
X-Gm-Message-State: AOJu0YymHi1o/DdHYgd6gLQmpBd+NwhO4JO5IGYz5Ppop4jGX2OgxeBq
	xElMvOJsWnF0UEq/V79lywoAJNxcknkW9hWXzEvsaT0uNExhsp8x1gbdVW05NqArWM3W2YhIyu+
	ywAvupspbArmQP0cgy20Jg7ytwz/jNwxszABbJwI9Yq8KAODcurFWzstMJuV8IBTN
X-Gm-Gg: AR+sD10Ze3OTi+Y63FUaBYgyrcqvtaypJ3JhqcgTwBDOvRVJoYeWNQp8YFgy8bTOiGz
	eFjyNxDRBpm8ElMRyzUuqsNANWCVdGlZelZSrwQYYA+yHv5zQfON4hvqhV550DxjYa0RpTqIiIB
	W4x3/jwjoPKMjNdhxYEkuvFYiglhyJFnTcEiWGkJkdsq8u/XTkwHqTJqYgSsIzEJVFocyNbJuHw
	rbjbUJ3PFrKrKJutWOpbUOVT/RaCwpq1er/xaAq0NSr5RfMxXNrp2dUzRjdYwsgP8OF01XQkb0X
	hLF7mbAp+u/8xnuaVxQ+2YHQwk5BZvlt8ACQgT/2thqNo7q8bUM+zX4G1+h6uspvapgD4+FODiW
	53AsJH6wBMs+//q4JJsaTuIQI
X-Received: by 2002:a05:622a:1f0c:b0:51c:7b12:5fd5 with SMTP id d75a77b69052e-529d719049emr10753381cf.81.1785223569105;
        Tue, 28 Jul 2026 00:26:09 -0700 (PDT)
X-Received: by 2002:a05:622a:1f0c:b0:51c:7b12:5fd5 with SMTP id d75a77b69052e-529d719049emr10753221cf.81.1785223568664;
        Tue, 28 Jul 2026 00:26:08 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c4443396sm61340805e9.0.2026.07.28.00.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 00:26:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 09:25:54 +0200
Subject: [PATCH v4 2/4] dt-bindings: arm: qcom-soc: Document more of
 existing legacy style compatibles
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-dt-bindings-qcom-soc-naming-v4-2-39ff32071641@oss.qualcomm.com>
References: <20260728-dt-bindings-qcom-soc-naming-v4-0-39ff32071641@oss.qualcomm.com>
In-Reply-To: <20260728-dt-bindings-qcom-soc-naming-v4-0-39ff32071641@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3304;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Pm06IB3S3ZqIeBqgyvmudkbwk6bnZwwOq4nmv1Bp2tA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqaFmHliQ5NSC7/+QuwAspfqrG0Is0XVKM0nhnt
 6YPNIApXfaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamhZhwAKCRDBN2bmhouD
 12EnD/9WjZ8WhyP3jXQzGp36Znm/Nl5THE1pCFsN/ctWvjExy+NSMRPBymr8vv/A6r4vqL835LF
 P2ZnIjLdVyU27btvA5LHc22XDphN+6EWLriD0joFQg8KV04PqJHJMldSYEiSQJUaQ9d7XDonStN
 3zIO3TVP17hA/meGuKkzreKgaWbAsK87bm+6XC77uzMToBgxgs8yBIYzGlIJt88KiXbXAYkqfu5
 UnCfPqeOcJfp46UwGcQ3JDcCcjQ65uojvwvGGDep+MzrimzzkfHHv/LzLb9QjmfF8SP1DzKrkAr
 D8fGkZF77osIeptti6iFrHxlWq+2C9cEy47NzX82zVWE/z6whrNAmClORWDodZWuXaHW2turNYy
 qHqABYZKo2vwd9sXm33QPVjVPi0sVX9uDyUK/hixIMj27Ub6JSpraHONnC2WZPjBtKAo8QS9T4u
 +b0CKedDytMN8e31t9h8UomFMQwSE13NzoMlHSEB/Fr9pk56YHPMoTTzLMbsqjHSMXtGhriODjn
 WLBGm1NKqcWcFtj0Ahwp3JFI6n8/dXXeobQnlnANqaiixY0/+ncLRxgo05B6NUN3Y0Nwz3N6Mzw
 Nb1oKc3MWgVw+ZDPeEhzKJ2g4+xgOWPqW/3y85czPl4BC+3GBimMCNE4bzde8qgzeUWpsb/+Vv9
 aWzruOlJPgCwWCA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: ZV99AQ8k_CHRerJ88lyWxwhlWFHsGVAH
X-Authority-Analysis: v=2.4 cv=MORQXsZl c=1 sm=1 tr=0 ts=6a685992 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zJ_s7DmfhzOieU7mWMIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2MiBTYWx0ZWRfX4Ag8X1j/C9JW
 jAKXq+GZIq+eC4wRjRVvTR/iHvKllPbHvQUy4vVqjLQVYDeEfilUeSIY/D6B8bJ7QSC/GxfWH8Y
 bt/AMxl/KT40Us8Ac1/28S93RkoOFzs=
X-Proofpoint-ORIG-GUID: ZV99AQ8k_CHRerJ88lyWxwhlWFHsGVAH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2MiBTYWx0ZWRfX25sSc7E01Q0f
 MhVZryjew3bHnlGAuILWwLefy1PeBE1aEuEPZE/En2F1wBeMnK/4tVrxLejHi8GK6HYY+BxGsOv
 s+nJpeRRLnCeZxg5vj7A3IJ7l7dfRkcietlXJUB11xdYeIne8mXw/ObbItgWJnxgzL2fIg9IhSQ
 uyFtGDsM6rocOZjkkLzdeR/emurcYR78KY9AgGcfooi2vWTGyQGAU9OpZSmy99TwRiCVG+z8cAZ
 HhdBA4MiPeJ12BTXQd+wQ/MZ/M137zPOK5EyTRUhZ+7Eyfkn/YaqmQqCQ5rnk1C7xOYGH0cYzts
 tEywUZbSggdq3ahpkO9U36dbmhK62gNSxxsdVXfrrm/ZXBjUZxeWn55de7Yki5mdSfW2ha+/b3a
 pEE+cADdVcgLlDyFOX3NH5LDtzXkYotOhLLJCn9DJG0muXFulHGr9yl1/E2tPCrSRKOOTIaIrCX
 cclC2wWMQr33GrELK1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280062

The schema misses several old style compatibles with SoC component
trailing in the compatible (qcom,IP-SoC):
 - qcom,apss-wdt-x1e80100
 - qcom,apss-wdt-xxx, qcom,rpm-xxx and qcom,scm-xxx for SoC with code
   names (like qcom,rpm-shikra)
 - qcom,kpss-gcc-xxx
 - qcom,rpmcc-xxx
 - qcom,tcsr-xxx
 - qcom,usb-hs-phy-xxx

It also missed qcom,ipq806x-ahci.

None of these were flagged by schema, because they were used with
fallbacks and the schema checks only for single compatibles.
Nevertheless document them for complete picture and for future change,
which will apply the schema to fallbacks as well.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index 1f9e52d9968d..0e921633dca5 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -40,12 +40,19 @@ properties:
 
       # Legacy namings - variations of existing patterns/compatibles are OK,
       # but do not add completely new entries to these:
-      - pattern: "^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
+      - pattern: "^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+      - pattern: "^qcom,apss-wdt-[a-z]+$" # Codenames variant
+      - pattern: "^qcom,kpss-gcc-(apq|ipq|mdm|msm)[0-9]+.*$"
       - pattern: "^qcom,gcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
       - pattern: "^qcom,mmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
       - pattern: "^qcom,pcie-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
       - pattern: "^qcom,rpm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
-      - pattern: "^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+      - pattern: "^qcom,rpmcc-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
+      - pattern: "^qcom,rpm(cc)?-[a-z]+$" # Codenames variant
+      - pattern: "^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sar?|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
+      - pattern: "^qcom,scm-[a-z]+$" # Codenames variant
+      - pattern: "^qcom,tcsr-(apq|ipq|mdm|msm)[0-9]+.*$"
+      - pattern: "^qcom,usb-hs-phy-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
       - enum:
           - qcom,dsi-ctrl-6g-qcm2290
           - qcom,gpucc-sdm630
@@ -55,12 +62,15 @@ properties:
           - qcom,lcc-mdm9615
           - qcom,lcc-msm8960
           - qcom,lpass-cpu-apq8016
-          - qcom,usb-ss-ipq4019-phy
           - qcom,usb-hs-ipq4019-phy
+          - qcom,usb-hsic-phy-mdm9615
+          - qcom,usb-hsic-phy-msm8974
+          - qcom,usb-ss-ipq4019-phy
           - qcom,vqmmc-ipq4019-regulator
 
       # Legacy compatibles with wild-cards - list cannot grow with new bindings:
       - enum:
+          - qcom,ipq806x-ahci
           - qcom,ipq806x-gmac
           - qcom,ipq806x-nand
           - qcom,ipq806x-sata-phy

-- 
2.53.0

