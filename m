Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D9B468C30
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 15:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790697235; cv=none; b=RzvgWAq16gofE/H7vobF2z3yawiNnup87SOUN06bEwwjPB7bdiItUeCTrDT/fjya6xe1JZldRK6DPCEEmFIk/zYaFT4XSppql/OdOMIIVj0B9ETd56A8t1Yn50mpfVQMpuQ2ti55qa6xy5Bs8LuZoKCH1MdcnWPbhA15OM9Qq/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790697235; c=relaxed/simple;
	bh=V8T/HZqTx4GvU+WtHH+DR1239sZlCusGtl/R9hs7sYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SBUdt67Mf+kRHkjKNUQqHl1U3IoDx8p6AT7XGuD3bzoBqFYfcBtd2ZpaOpdyQByofFI9ydwvpviA1GkowXYh3YO7DUOqon4MWvN7ceH6aSuCYGavnxdiTNKrMHYnvoos0uEsrSoXQkh/FxipadV8OFTNtAss+lQArmBz66mcoMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NhnOKjgw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=My9fIeqB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NhnOKjgw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="My9fIeqB"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqh4g858077
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 15:53:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HF7WW0frYFZ
	jQ8r1xBiwm9g6hzgZdnYH69PyCuQ/4Ts=; b=NhnOKjgwM9iiJrt1XPAD9gT1VoQ
	kdl6da4qmkDk29xup/YCjxrpSSv07tNFgrX9lAdljA6xo1kJf2r3vwbkp8UTDXfl
	5QqikRyeR96raOCcoTyC5JOwjnpwr1YslAxalmUY3L/0ntWGKmKtc2J/IRU3q6lh
	DoErI1TgaNEpAQ6Lkqo2TKJwrqKMxnHYIPbSJtrPNDugwmom5Qb9GwTZsGFISWkp
	4axJmQQ5F0lbFEoESd95LfC9czjKEdCIQL3BXXeUe/3vIAyCjTaWzbb/W+bafzOn
	PLtVKNLE1E1FCUG6DlleJWy9vKl8fEth7+C40iHG+5KfDUc7E74Tqg1wyew==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h08e0jatt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 15:53:53 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34316295d86so7434747eec.0
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 08:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790697232; x=1791302032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HF7WW0frYFZjQ8r1xBiwm9g6hzgZdnYH69PyCuQ/4Ts=;
        b=My9fIeqBNZ1+L0XzJGyByzw6ijuSKWheXUigAqr1Uc6OKIwKi+TOp8Iaw4v2qBRFlu
         PUuedYUZbsqIA+rnJ/uTS5X/UM78Zs4iH5mqOjTHNrg4qeL4q68M+McYFCeRIZvm5M++
         np14fUQ6AdDejlQxyQNDFn0/xMQnMphanEOSY0fiZkrt36BwldFTutcAUnFVweZim4q7
         5/OjxAR0j+UgIzos3SgXeRl5o0XHJtpPIeQCsJMO4m140BAftwH8lJp1N6K5ZptZBTpl
         CRx7D9eOLEs2czgKYprwiXvRRcKtHAiOwaANgabcgD6NoJ23shzbZGpJ/TONnc6+ejQQ
         RXJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790697232; x=1791302032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HF7WW0frYFZjQ8r1xBiwm9g6hzgZdnYH69PyCuQ/4Ts=;
        b=GJcDnjUzeoaG7DvDKMByPDadxCA4E+yPCc/aq2SCrSf7IyhHwp5ZYbsJWquL/wphvF
         VitzZordobaWJFWxEgg1DAGzK6BRTrKcvb6UmXVX4i7uYpB8K4U+6ZHQxxaFlQCGOjyN
         ay9gfKlTyETOfTM8cbPvY1KM2hn8fXceJserYs65tZlhaDWCs2rzrzbnRqmCtOP3YR0i
         17aaO/ATahVh2Z45xce9jNYbvlFTBOJSdqWeOcmQgUBLQVgvIyB988H20n2J1QW2Ap/I
         QFPuMUCVUGyBrWdVzeYpA88xki6w8lWNmQwDVVgnhIE/XTKgDy9d1F0Jy1owNrcIjNTa
         gFyA==
X-Forwarded-Encrypted: i=1; AKwUvBxjrUfkDKVYHH6+pE5AREbjzSna3/7//2RWATbmI9a8maT7me3BeKaFwe7f5lI327nGNxTn8Rn6ZBxK@vger.kernel.org
X-Gm-Message-State: AFuF++moeqlOA8caFU3rhMdfMom5Ft64qCrJ6UjfaCHbFFdbdcdF0zVb
	+pBqgUjupzr/HqPpSeXpZz51AqNGhKrKrT292XKrECoaagMZ/YlomOdLGuZD3Q3kwklhCqFx1vX
	Tlo8Fr44sFIR3ixczOBktFzzaj8vi2A7CKfhb40yaIXnBPgqkBrLQPu8nFPwiJ0Qh
X-Gm-Gg: AYBFou0Vi31Tl/DnouOni9HztLQCuAxcCp5EsanfdPclqZUDrxV8BeyLfVnasyBBsuk
	keOSvruPFUW4+fcqgN+hUEc1909SX5jyWCZ8WTW4JmrY+HMLgh7t2i6VmdK7CgsOcsztkaVhdlj
	IN57V75Up5c/zHSRT21vdjxAJKfsCiiXHux0Xeayr8lOiyiMcGLzxVMMOdxdSSX0KwxPSbcaN49
	NuPFVh7hSQcWK/A2PsnG7nPourshWUsbkhjLqYwv31DkZhGdUYr3haAyFfHcX7dNRt+tMYzq/Yx
	ctDqYGWmKogw8eIKG6EH9IlZHmvFRHeuEQ1c1/Jzlq5Eg1Ko7SssM+uXA4xtlaAtWOu3UF3GQb5
	wt86GxYI9KP0gorKPHNLWiDYF65Y1NyfECnSnHAIYhVO/zHHERTYFmRnFCOk=
X-Received: by 2002:a05:701b:4284:20b0:13b:3132:6e99 with SMTP id a92af1059eb24-146ce6802c1mr14559358c88.20.1790697232089;
        Tue, 29 Sep 2026 08:53:52 -0700 (PDT)
X-Received: by 2002:a05:701b:4284:20b0:13b:3132:6e99 with SMTP id a92af1059eb24-146ce6802c1mr14559329c88.20.1790697231447;
        Tue, 29 Sep 2026 08:53:51 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14c64e7660asm200213c88.17.2026.09.29.08.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:53:51 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 3/7] arm64: dts: qcom: nord-rrd: Enable ADSP and CDSPs
Date: Tue, 29 Sep 2026 23:51:48 +0800
Message-ID: <20260929155152.1898666-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929155152.1898666-1-shengchao.guo@oss.qualcomm.com>
References: <20260929155152.1898666-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2MyBTYWx0ZWRfX2fvvPdDNBMOd
 AYV/lRc24YY29xqVIojxlF0dbcRDYyOGnaPJP4emkrBuCzIFenH/FgW4Gg4LM6tQbCuprfr1QOf
 /XYVE0G+1ymXRQwG/fkJ9njFBYdLwrY=
X-Proofpoint-ORIG-GUID: 1aRhNhXlOJmfdyDTXdbvQcuvROAdqIXM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2MyBTYWx0ZWRfX/BRIYlPnH+lj
 FHktXVCmryBrqFuMUGWD1kyMqFxbGtpt71vzaJs2xCZeG/wofB0fN3cmGl7IZoo1UeGpUZ+cQv/
 GggFXr4wvsMxqXNo/DJux3KkAWmZkbtNrGfscFBiOX/nn/rvVRzUPwIVo/1Btp+2pOwXfWrK+Hy
 dBD7dp3aUIDZ5iAD8k+AbD3Vhslg6BlhOd0ps68K5TefU6Rc+bpy+4LVkC9s7jU1azkL0DxBb2m
 JLbNFFLrG1Pv0ck9SeKi8TCu1aMabiKUNO+5fpasBGzjlt/sANIy8wkP4+94oMgkYkOJxdZ4W10
 FV3148Fjed0zgAx0Z2zaJGjAiy8qph3tfl7FakAwcMWmnA5tbKHazl5kplWG9DBCiB3eSQ+y/Si
 40f3mzrCmkz5hzP0NGA0apD3JsCPmIjDjbmSWEMEXkJwtO0OVy09XKxgFReiyz3WjtTIO+L//qS
 yUpyqN/BMZgXUxl9FFQ==
X-Authority-Analysis: v=2.4 cv=WJ7qzXsR c=1 sm=1 tr=0 ts=6abbdf11 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=QMtlPPnfQmPOGJbtzYwA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 1aRhNhXlOJmfdyDTXdbvQcuvROAdqIXM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290063

Enable ADSP (HPASS DSP) and CDSPs remoteproc on the Nord RRD board.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 35 +++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 3673003c8b21..0b0acd33a2e1 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -393,6 +393,41 @@ &qupv3_2 {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/nord/adsp.mbn",
+			"qcom/nord/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp0 {
+	firmware-name = "qcom/nord/cdsp.mbn",
+			"qcom/nord/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp1 {
+	firmware-name = "qcom/nord/cdsp.mbn",
+			"qcom/nord/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp2 {
+	firmware-name = "qcom/nord/cdsp.mbn",
+			"qcom/nord/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp3 {
+	firmware-name = "qcom/nord/cdsp.mbn",
+			"qcom/nord/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &spi16 {
 	status = "okay";
 };
-- 
2.43.0

