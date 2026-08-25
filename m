Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60CD3CA486
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 19:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787685227; cv=none; b=LToliQkwY1U98NjqFHy0uxUR5qHvKsS6B+umsjsB0Lm+2QGdAlYwhQW5lY8QfEoaXeqVqYcKQLA1iQZI3AOIiJd7OmbZvUsztKDl/Q7sPuP8ORdr0fsz4dBimuoLSMABILPc8uYGtCdiuWhT8EZXQ/V9t695ks41o6QTXxNrT0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787685227; c=relaxed/simple;
	bh=dbmx/W67JCVIALQIqb/RkHyLo6NQgtoo7SnJ/KM4xDI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O9VkCM1w245r2CUlb8Uhv0hFfm+Xmt1IRrnelfG3tVEeFy9suAPzmmokEnixM+l6znhJWY6qGY4EVPGyy6rqJuqUattVNphezuPeANicNfC7vL6p5eqPwMHSJggwRlxGO6anmZoOShSn5s0Fh+vhayMPJW2Cnjar3juiI/DBqJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OFz76rUp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cTZmzQlu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OFz76rUp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cTZmzQlu"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PHdN7A2446278
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 19:13:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wSG9jyQWZ/3aOSzM1SwMhKd6p1qQKUizzvvLAiAsy7E=; b=OFz76rUpjtH7dHlm
	Hd+oq+Rq4o+nrT0xGR97CPVICE6ml2zcIW0lNuLz9CSXGvykMLRcjsD3oM05aVxe
	yZXVlsY35xuKDpJ7oDKIN+vqXCL7UcBTwARsclcCZWXkcQ9o6jelyia4M/E/Ihoc
	rUl9fKGtMT9maIntzBTvdipdsqZ1U7SQ+Kr5t9poq2KD0SMMLcwZ9cW2jVm5cXCe
	0ZclK/IWd8WwR4oq3fKdsn+wesLisQRtqvdjqu2bohNGwj6gBRvW8LfoHb67sE3w
	0LBHFcEilFdGn278hYr8ft07midUdzV5MTkzuV4F1xtFwGQJwTwJicuTOZgQCnLA
	F2f0AA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fcerf55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 19:13:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d6c166bafcso3102735ad.2
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 12:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787685223; x=1788290023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wSG9jyQWZ/3aOSzM1SwMhKd6p1qQKUizzvvLAiAsy7E=;
        b=cTZmzQluyqG2m0tgez3FufkJV1UgWKoaDZ9dC8BrguP5awUSQTlCXmZuBHEOls8yi0
         YEEy77Lo09GIH5IEwJPhRfEdInFLlupnE883X6IAcQS5qkYtgTxbAMHRC6ow4Ebprh8a
         pYy8oVGoOiz8M5EWlVFWzeVze9t4K540x04cZoR0Y8sLLZuKEDhg6NV/cAvVQfZZ4vGX
         sH9xJxLoGbLPo5wIo9iLvCaS1tDteW5l72b99uTvAZFlJ1Nl4ZFkmxSYenoXDVxPRPqm
         3FnvGmHZ5+B4G+sG5bLnIpkXpMHRqu3RBDoqWGfJNnitv+CIvjoHkeWMMzIH5ZZvGzzH
         o/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787685223; x=1788290023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wSG9jyQWZ/3aOSzM1SwMhKd6p1qQKUizzvvLAiAsy7E=;
        b=FLwoOL0lEEyflVTqMqhpGE7HnY9vf/Ce+iWnD7cBhh88S8gMyaYyw8ZxF/+ecSXyDz
         A9YEiYDOPY84I7H80eJwT4esKE9+GtOFyxLIm7+LaPOMYshN0yLi4guFVJqz3L8/2cI2
         rT/wvsW8MMFFYbpzONsroudDEMNykwEXtbgxqsnndGJsT2pjM7hkjqlxZYsZPDESH1jy
         FlVdMJgQxLxZQvVlMPDIU/8m2djGEuLXrUZ6/CSMvtToGMVP1p+/CWY6rO972g02bVoh
         sfjeXIiOxH0V9H71qCBlFQOrpxPsPitNXEjlTJQrPp8Wyi/A9Gjgzp1y7peNKTAHWn+J
         dnIA==
X-Forwarded-Encrypted: i=1; AHgh+Rq/YF7NH4/Ti0AtuNwpuB1qQbcKekp/pysxtOudW52jMIlurCqC9zzh3DSpf0CydkSHz8s80RsFXETK@vger.kernel.org
X-Gm-Message-State: AFuF++kV8KUw7tf8Bvl4DGClb3kYfOGmDGTVdHCeQXjF2Sf23XEgvvgp
	fSKiEt3cqZ+pWAEJ+hJMITAODE4uD9UEvCU6/xhyFS5JJzuPlwYVJbnn4jy7D55OeRBCsbQUx4C
	ynKzwcNfaJEK9bniDXcBI7EatknUlp1YGvbWNVkA660gxelcLNAIZ8pZ0dhMq3Ddy
X-Gm-Gg: AR+sD12ApsHluGOR8RFNl64LVtFI6QfI3xX7+X6cziX3kax7XTX5Mfhjneo0NikXiuN
	vL8gY9U/8m2YVX9YtlyWrn/rmFDMQEzlaA8Fc9KLkImHFYWnZgi3uDWQ3Xy6TdLIXqneswFZ1YA
	2/Xg6zDNpA0C1Uorq2a3vN9U9PRGZTSYskEkX6TDhPMy5B8fuaeo6qfqkh4If7FHJrwLyudrni/
	wWzw0d1JESj+zGihsTcMmS5jtxny24NpyvYFlhT5MyY/RSGBsIcdazaheXIyULEc6pc4NAotRCY
	3cXTTi3+13kBn+ObVzzbRJlnmTkPymL23UJadu1nNGR0NPXmj62YvhtwwCcvVWBmOvEWo50GRTQ
	B4JZk11YhKbw1RfOYcAFDgt9+hvz1KHam
X-Received: by 2002:a17:903:2c03:b0:2d6:ee6b:1b08 with SMTP id d9443c01a7336-2d707a2f363mr7602395ad.3.1787685223524;
        Tue, 25 Aug 2026 12:13:43 -0700 (PDT)
X-Received: by 2002:a17:903:2c03:b0:2d6:ee6b:1b08 with SMTP id d9443c01a7336-2d707a2f363mr7601725ad.3.1787685223041;
        Tue, 25 Aug 2026 12:13:43 -0700 (PDT)
Received: from hu-afaisal-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283da048d3sm930416eec.28.2026.08.25.12.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 12:13:42 -0700 (PDT)
From: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 00:43:22 +0530
Subject: [PATCH v4 2/2] arm64: dts: qcom: shikra: enable ST33 TPM
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-shikra-dtpm-v4-2-8476223184de@oss.qualcomm.com>
References: <20260826-shikra-dtpm-v4-0-8476223184de@oss.qualcomm.com>
In-Reply-To: <20260826-shikra-dtpm-v4-0-8476223184de@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787685212; l=750;
 i=khalid.ansari@oss.qualcomm.com; s=20251105; h=from:subject:message-id;
 bh=dbmx/W67JCVIALQIqb/RkHyLo6NQgtoo7SnJ/KM4xDI=;
 b=swjVKDYB9ZRIp1jGaRmYBI6oSxVJyyDLlcTr2c35v/vXTEfxFCVFgmNfzfa0EAJ+sayKI6zrZ
 wohcDeEVmzbC5JFCQyqBYzCIDg034vjewGd8dnmJOx4tggHJqloqGdT
X-Developer-Key: i=khalid.ansari@oss.qualcomm.com; a=ed25519;
 pk=eBXrIUgTWV0cgG+GsNeZPPgvj1Tm6g9L2sfcoxMGrKo=
X-Authority-Analysis: v=2.4 cv=a8AAM0SF c=1 sm=1 tr=0 ts=6a8de968 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=YSeSwzeZyu-nVJi06OQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDE2MyBTYWx0ZWRfX1rzozNeNIgZf
 zf/OQJBHb6YRXvTXMBOlg6QlTdBAhTf8sD7tKbuu5hhkWKnvxJH8AB8sV7var0x9Z2nhOP3lulg
 rPTejRElhEAWCcvUh7R0q+3dmIqx4AA=
X-Proofpoint-ORIG-GUID: KlbXWFzYmNkjsXWp9Ah4_YyC3nGJ5vyy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDE2MyBTYWx0ZWRfXwi69fBPNI4PY
 Rx0Xyaw1dAHo9U2Ij2pSMmLzYndMD5PQ+JszGINWq9HfcBFERCLf9dzZgSOezIStGZsNftDG31H
 ep92DzkxFbhkXSJxLWSBldDySsUQHxLFI5WhT8OBKtGMC1Tdk79z4qmDlwe+vz89I+us+OH4fit
 10J5TZfFWn25SctFDaJJXR9gnPQ9cto1IFrDtHlTSODxQVEX5E12/RJKFB2TsFYu4Eov6GoRKIO
 VTecSlYp4J004Ynj682iByt9YKfgDXSpYXueUtpqSImD4TURspC8D07yuCAfXqbsquouDqNcfYd
 HqDhoSjBJnYdaw8D3lIMzvP9tiI6lSHPAhgrVnJF+tslW//h2ecPU6ldfG9EkyDirLKmRy/MR5I
 a5yKCSh5BrmD2D3CIAebBc67isMf5ePECE3ziQnEdpO6f/q4YZ3PUzGWCKscOXDmZlXjJ/TwCK6
 9VIY+BjpcMELkzKXSzw==
X-Proofpoint-GUID: KlbXWFzYmNkjsXWp9Ah4_YyC3nGJ5vyy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_05,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250163

Enable ST33HTPM TPM over SPI5 on the Shikra IoT EVK by adding the
required SPI and TPM nodes.

Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
index 6eb4184f7642..9f3a880e95e6 100644
--- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -12,3 +12,13 @@ &qupv3_0 {
 &uart0 {
 	status = "okay";
 };
+
+&spi5 {
+	status = "okay";
+
+	tpm@0 {
+		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
+};

-- 
2.34.1

