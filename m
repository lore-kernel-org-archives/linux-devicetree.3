Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2319B39B4AF
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 15:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785596857; cv=none; b=gN4MHZ786TT/uN7w8o7vdb5zjvyo+f2DDHAKbyA9V4SEgKIyTLPKntlTJBofNAHZB97gGEt13m8uRprPttHLV2r9Ba20mPUC0Frh1Sk56hM3OEZ/OwDI7Ex7WCVILqdk9zYqz9zlOm5Kk0Knhs5q422nuPD7o1rn37ufs5yP0ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785596857; c=relaxed/simple;
	bh=nA+TsS76rvMFwxdslTBosaCPkOYHLf2P5c+EcUT68bI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RSn+3ZF5UFIz/rL1EmoMVUlXm/m83yL2/SJ43ryGh4/BW7npdYgIZ2W2rJSX+iSL6V8aNW2V7lNLd9emJ4VERp777SNCl8rW0+3NZunAdv0D5/G+YQ9vKIZ3LtsOhtNCy3d/cwC23Gb84Adtp36ke3k8wt0RJN2REmi9pbePR68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IRIvkMxQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ePj7LWKN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IRIvkMxQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ePj7LWKN"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671CafiU2815414
	for <devicetree@vger.kernel.org>; Sat, 1 Aug 2026 15:07:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5ZleIZseaEMrn9Tec7tNkxF2u593mBiXUepyhIAGnP4=; b=IRIvkMxQ3OM5r1xQ
	yVEUK8lADaHv+v1O/sr8QI2JNyzmQTCFDPd2X/ZA3jVbgfDJnpEYwwinR5++wXE1
	rIUsSLhJffHI6Z7BVHnwEoDNTtejNhwOkpvjhW82WN72TYtf+F1c7/5PsL9Thf10
	bNtBsWG1RD0bBSiqwo3IAKtSB1Tg4vc4OIjjACSLWh8XUllaJ7E/NH9JfYBY1lwI
	PLx0tZ8Z7Kj1HHBLcJTLyaaAAokR3OI5S/5pxbzGk8caQwvRexvF7Jpkc57AJp2I
	4Imk/1/xZoPhFQuo5lCDJJcqFIgyqW0qmGFym/7wile+ue1UIrmJF3gQWAZPIU51
	HU+6Gg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9jfs0hw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 15:07:31 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0e702df8so20406561cf.2
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 08:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785596850; x=1786201650; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ZleIZseaEMrn9Tec7tNkxF2u593mBiXUepyhIAGnP4=;
        b=ePj7LWKNkhX+arOCgYxCfr4aq5TJydmztgh5UE/PhU7GQ9Egop6H5lokW5s1MljKBm
         9TptmZib3jweLQaBNFIybWoHLwiL09hl7uAf/Lt/f/DE8ZaTYB4ZvZS8ZRdisVWdSQFb
         73iBMd/EWX/8DDXH0Ij71pllIsC9wajDX6WiacqJ4/reC2mFRgfu3mKbdOukjrM7zFDy
         EK9YvmLjja0QvJTJewC0lG4s1BU4Lk6XydIbYSnlCoUIQs18JQ+kArnE0YXgYgJO3ZTl
         tKVW49knfPpV/D15A0MgxZeEKenFhxlXVab55hjtpXjv5Xd8ic2JWrEWpstvCezPpFBp
         v1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785596850; x=1786201650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ZleIZseaEMrn9Tec7tNkxF2u593mBiXUepyhIAGnP4=;
        b=qICm8kFVZNNk1snSeqh2VGiCVUU12sFrUKVEv5S49eWLVCfcQ7+SVVevLH/BIHJjZD
         0eMR+1Vt+/7l1Y9ilNvHpurLHNmvO6rFoEmvZpCsrfK8MQROdJkyXEWVhUJSEWOMZ6BI
         ZnL150yPoVeyioKuPdcBH5nSNwnykpvU6FiOYRVH7oBmu+Vq/q2/NC3t6GvQdPLV+Goy
         CENLwW1wlVGy14R2VeocrqSh+4Ui7ZC0ex8FeO2OEenSpmsxLfjnXabdf4aSTa0U4qE6
         0cbJRsqhUs3uh/INuWgMO7mY/X+j9q+fBnamCo4h+KMhGC4IH4gYgk52GNaViOGTUMHL
         TyIw==
X-Forwarded-Encrypted: i=1; AHgh+RqTx4E+MGtGmfaGXfW9JK3oGEItnsj6YFUvmIiTaSc2esaGZ0BjE/OfKjiH+DDMbPqYt85z8oZrghs5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4yst5Q4dJnfe0M8RsPhUvHocvrkMffM4pp1FxvpV3IqhsLvh3
	E5cSMeKeP5G//C4j0PBEUA9t9q7MaXysFPAaNTeLxiEJnmc26XBf4WB4QLDGojMvPWNhi2lpZ7t
	liAdkla+AjdXs+CZG4lMO6BfEJQuVNbrIesEz4hOTeAqrQ6JwO4B1ksGzxpCcoLmB
X-Gm-Gg: AR+sD11yw4ZSSBD6eitNReqg/0JspCHgxjqLx2vFSfB46QVSxAj8EeEmI4TA5VAtXQn
	LdZ6SJOjvLGXGmHM4vtcfymi0casDU6MqYcDVr5A53rCKM449a1o2bC3449ko+0Mn5Knz1Ys1wV
	xxhZsavDLsc43vfqCqvw8iZv120VpKMzctEQNjvkye/eT8UShivrCj7PMCsigLMLj+XUE+KbLjw
	erasPbXBGQnTwdWiTqKyFq+MQuYoWX7mGPQSQQka7x783pNGB8ujzc7F/fQYbOQgHPdMq3pPzxa
	Nh+PXIHimJukSF6rw7NcrZ10j174pxe5jGJNuKKz2FOLKW6BzeYS+8XsbVLDL1MDB3yEuq2cT2c
	K0ZlmW+pipoM2JfL5Hgf8Q+sb
X-Received: by 2002:a05:622a:4a88:b0:517:92a6:fcd5 with SMTP id d75a77b69052e-52b566b0331mr83950121cf.18.1785596850214;
        Sat, 01 Aug 2026 08:07:30 -0700 (PDT)
X-Received: by 2002:a05:622a:4a88:b0:517:92a6:fcd5 with SMTP id d75a77b69052e-52b566b0331mr83949291cf.18.1785596849754;
        Sat, 01 Aug 2026 08:07:29 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a1abfsm16005222f8f.37.2026.08.01.08.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 08:07:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 17:07:03 +0200
Subject: [PATCH v2 8/8] arm64: dts: fsd: Align continued properties and add
 missing blank lines
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260801-b4-dts-coding-style-strict-v2-8-f09a659ab80d@oss.qualcomm.com>
References: <20260801-b4-dts-coding-style-strict-v2-0-f09a659ab80d@oss.qualcomm.com>
In-Reply-To: <20260801-b4-dts-coding-style-strict-v2-0-f09a659ab80d@oss.qualcomm.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-fsd@tesla.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7745;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=nA+TsS76rvMFwxdslTBosaCPkOYHLf2P5c+EcUT68bI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbgucuPd9C+yrm+mGAyJSMxqZ7Wc1WBYAhBACF
 iJlNMoQk2mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam4LnAAKCRDBN2bmhouD
 1xulD/4sWCuG3VoFrsz2D+fV8x7gNLRWF5q/97dn8RdAqAdf7n2/7sF/j9TDSP1HAhf6Ok7vK/L
 BaXBAcjoysHqK39uN+p5YjUpU6BZE8Kuk4+8c2/IswQQHnu6k1U3wtePwuwLdbpkD1M2l0GB8SM
 ARgVWHN0fVF8/qgGTDLvXaj3tsPtIMmmPORb0ybd6ff8yy5SKPNBffmNJ+fQvkaVf4p6H9juUV4
 92+5POojLasZVn+91//aLXWtlWNVCJosutVqwJtpVPpAvS2gJc1RjYb0kzFyQP7ug6RX6PYVygI
 iNiHTzVhpTNHnjjg5UDkZPtYqtIfwoU/9V93OsI3I9Br6xfsbhQCfkqzyR0XLRPhSHbWm3NKpHq
 Hob7gK/ZN98A/PlPUOw2k+mMKcGoXVBpJ10b7imTyLnEqsQFDsUjMRsF/SCyMfMYlpMFCkWxGLK
 7LnyipEDERbKYLJGLWkQC1ehHcCHv/uS7ahLNryTJJWF1gBye9On51pjdab08v06RWRvMx6XbPE
 tBaHP7eHyizTcdGiU5+4/nvXWeBSHfcLDj5qjbGrlgj6qHO6oDdj/DAX9gd7Dty9tyXVzX9V0oW
 ez46uWH7LrQRG0wvFFQFZE98/9xk7JwHFFq9TlRyQaaGXWpcBrw78VM0RRCiMId4STkFOmh2dnF
 uPQKT8w3W5AiAUQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: iQ59-Jg-AI2y1Oc7Thc65ymG5xu1aoS_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDEyMiBTYWx0ZWRfX+uqGxPGLPv+/
 1DYKUvgMUcLVRImp4XY8+axGkNgA95aYZTlG6sRb375K3j/f+1nmA9oGdNKESYUczBeVeCEQhTY
 TLsCaLVv57plAcy8a0Of5VK669aKKJQSLvcRfW9RZtEJX5ua9dsWqjBVUE5XoPlfuYQnCf8i9n4
 K/qOQ1yfbXA++nFSwavlKxui0OFH9Dcn1ULwE4ySaX7oh0oqeuSocX9i3mmUG+Zs7YZjb3f7/hi
 zxzmAuCFMqa2umdUy8hufDttbdc82bko+KBM7IqdA6rN/oTbqJQg3utjEjePslH+zVp+Wlm1qn5
 ZNo/yXBOaPGY8DxXaQxm+OBrhMS5EmgeH5NuFHzy/9gDm+y5DvIa3mFfZri0P3cFFlK8OxzBrOG
 b4j2nIRuDY0uy5EXjXBeeYAw3pDfeBAi0SFBrhGZ9vveAPE398aZWNnUtTkVbVkgiFRDy7R3g1R
 Ma1fQ6nTw5GtFgP/AKg==
X-Authority-Analysis: v=2.4 cv=TYSmcxQh c=1 sm=1 tr=0 ts=6a6e0bb3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=dn6OTeshHBKSxJNNhkUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: iQ59-Jg-AI2y1Oc7Thc65ymG5xu1aoS_
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDEyMiBTYWx0ZWRfXz1EWHiDjunEf
 CGnE4RfFTTGyCtcai9YNauceUmL5BibTq7NaV/vFHWFUkQSRyV6FMKTjWkkjTK0tf53Ejt+TRGo
 t6LnYEdqsCY3pNK2wHbgoVLfhYxHO1c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010122

Trivial white-space only changes to adjust to DTS coding style and fix
dt-check-style strict warnings like:

  [required-blank-lines] child node must be preceded by a blank line
  [continuation-alignment] continuation should align to column 39 (under < or ")

Reviewed-by: André Draszik <andre.draszik@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/tesla/fsd-evb.dts |  2 +
 arch/arm64/boot/dts/tesla/fsd.dtsi    | 97 +++++++++++++++++++----------------
 2 files changed, 55 insertions(+), 44 deletions(-)

diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts b/arch/arm64/boot/dts/tesla/fsd-evb.dts
index 73b6a25e0e4d..503abe52a81c 100644
--- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
+++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
@@ -53,9 +53,11 @@ simple-audio-card,dai-link@0 {
 			cpu-0 {
 				sound-dai = <&i2s_0 0>;
 			};
+
 			cpu-1 {
 				sound-dai = <&i2s_0 1>;
 			};
+
 			codec {
 				sound-dai = <&tlv320aic3x>;
 				system-clock-frequency = <33000000>;
diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tesla/fsd.dtsi
index 214d33ca7177..6766c78243a3 100644
--- a/arch/arm64/boot/dts/tesla/fsd.dtsi
+++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
@@ -43,12 +43,15 @@ cluster0 {
 				core0 {
 					cpu = <&cpucl0_0>;
 				};
+
 				core1 {
 					cpu = <&cpucl0_1>;
 				};
+
 				core2 {
 					cpu = <&cpucl0_2>;
 				};
+
 				core3 {
 					cpu = <&cpucl0_3>;
 				};
@@ -58,12 +61,15 @@ cluster1 {
 				core0 {
 					cpu = <&cpucl1_0>;
 				};
+
 				core1 {
 					cpu = <&cpucl1_1>;
 				};
+
 				core2 {
 					cpu = <&cpucl1_2>;
 				};
+
 				core3 {
 					cpu = <&cpucl1_3>;
 				};
@@ -73,12 +79,15 @@ cluster2 {
 				core0 {
 					cpu = <&cpucl2_0>;
 				};
+
 				core1 {
 					cpu = <&cpucl2_1>;
 				};
+
 				core2 {
 					cpu = <&cpucl2_2>;
 				};
+
 				core3 {
 					cpu = <&cpucl2_3>;
 				};
@@ -456,13 +465,13 @@ clock_imem: clock-controller@10010000 {
 			reg = <0x0 0x10010000 0x0 0x3000>;
 			#clock-cells = <1>;
 			clocks = <&fin_pll>,
-				<&clock_cmu DOUT_CMU_IMEM_TCUCLK>,
-				<&clock_cmu DOUT_CMU_IMEM_ACLK>,
-				<&clock_cmu DOUT_CMU_IMEM_DMACLK>;
+				 <&clock_cmu DOUT_CMU_IMEM_TCUCLK>,
+				 <&clock_cmu DOUT_CMU_IMEM_ACLK>,
+				 <&clock_cmu DOUT_CMU_IMEM_DMACLK>;
 			clock-names = "fin_pll",
-				"dout_cmu_imem_tcuclk",
-				"dout_cmu_imem_aclk",
-				"dout_cmu_imem_dmaclk";
+				      "dout_cmu_imem_tcuclk",
+				      "dout_cmu_imem_aclk",
+				      "dout_cmu_imem_dmaclk";
 		};
 
 		clock_cmu: clock-controller@11c10000 {
@@ -499,17 +508,17 @@ clock_peric: clock-controller@14010000 {
 			reg = <0x0 0x14010000 0x0 0x3000>;
 			#clock-cells = <1>;
 			clocks = <&fin_pll>,
-				<&clock_cmu DOUT_CMU_PLL_SHARED0_DIV4>,
-				<&clock_cmu DOUT_CMU_PERIC_SHARED1DIV36>,
-				<&clock_cmu DOUT_CMU_PERIC_SHARED0DIV3_TBUCLK>,
-				<&clock_cmu DOUT_CMU_PERIC_SHARED0DIV20>,
-				<&clock_cmu DOUT_CMU_PERIC_SHARED1DIV4_DMACLK>;
+				 <&clock_cmu DOUT_CMU_PLL_SHARED0_DIV4>,
+				 <&clock_cmu DOUT_CMU_PERIC_SHARED1DIV36>,
+				 <&clock_cmu DOUT_CMU_PERIC_SHARED0DIV3_TBUCLK>,
+				 <&clock_cmu DOUT_CMU_PERIC_SHARED0DIV20>,
+				 <&clock_cmu DOUT_CMU_PERIC_SHARED1DIV4_DMACLK>;
 			clock-names = "fin_pll",
-				"dout_cmu_pll_shared0_div4",
-				"dout_cmu_peric_shared1div36",
-				"dout_cmu_peric_shared0div3_tbuclk",
-				"dout_cmu_peric_shared0div20",
-				"dout_cmu_peric_shared1div4_dmaclk";
+				      "dout_cmu_pll_shared0_div4",
+				      "dout_cmu_peric_shared1div36",
+				      "dout_cmu_peric_shared0div3_tbuclk",
+				      "dout_cmu_peric_shared0div20",
+				      "dout_cmu_peric_shared1div4_dmaclk";
 		};
 
 		sysreg_peric: system-controller@14030000 {
@@ -522,13 +531,13 @@ clock_fsys0: clock-controller@15010000 {
 			reg = <0x0 0x15010000 0x0 0x3000>;
 			#clock-cells = <1>;
 			clocks = <&fin_pll>,
-				<&clock_cmu DOUT_CMU_PLL_SHARED0_DIV6>,
-				<&clock_cmu DOUT_CMU_FSYS0_SHARED1DIV4>,
-				<&clock_cmu DOUT_CMU_FSYS0_SHARED0DIV4>;
+				 <&clock_cmu DOUT_CMU_PLL_SHARED0_DIV6>,
+				 <&clock_cmu DOUT_CMU_FSYS0_SHARED1DIV4>,
+				 <&clock_cmu DOUT_CMU_FSYS0_SHARED0DIV4>;
 			clock-names = "fin_pll",
-				"dout_cmu_pll_shared0_div6",
-				"dout_cmu_fsys0_shared1div4",
-				"dout_cmu_fsys0_shared0div4";
+				      "dout_cmu_pll_shared0_div6",
+				      "dout_cmu_fsys0_shared1div4",
+				      "dout_cmu_fsys0_shared0div4";
 		};
 
 		sysreg_fsys0: system-controller@15030000 {
@@ -541,11 +550,11 @@ clock_fsys1: clock-controller@16810000 {
 			reg = <0x0 0x16810000 0x0 0x3000>;
 			#clock-cells = <1>;
 			clocks = <&fin_pll>,
-				<&clock_cmu DOUT_CMU_FSYS1_SHARED0DIV8>,
-				<&clock_cmu DOUT_CMU_FSYS1_SHARED0DIV4>;
+				 <&clock_cmu DOUT_CMU_FSYS1_SHARED0DIV8>,
+				 <&clock_cmu DOUT_CMU_FSYS1_SHARED0DIV4>;
 			clock-names = "fin_pll",
-				"dout_cmu_fsys1_shared0div8",
-				"dout_cmu_fsys1_shared0div4";
+				      "dout_cmu_fsys1_shared0div8",
+				      "dout_cmu_fsys1_shared0div4";
 		};
 
 		sysreg_fsys1: system-controller@16830000 {
@@ -921,7 +930,7 @@ spi_0: spi@14140000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			clocks = <&clock_peric PERIC_PCLK_SPI0>,
-				<&clock_peric PERIC_SCLK_SPI0>;
+				 <&clock_peric PERIC_SCLK_SPI0>;
 			clock-names = "spi", "spi_busclk0";
 			samsung,spi-src-clk = <0>;
 			pinctrl-names = "default";
@@ -940,7 +949,7 @@ spi_1: spi@14150000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			clocks = <&clock_peric PERIC_PCLK_SPI1>,
-				<&clock_peric PERIC_SCLK_SPI1>;
+				 <&clock_peric PERIC_SCLK_SPI1>;
 			clock-names = "spi", "spi_busclk0";
 			samsung,spi-src-clk = <0>;
 			pinctrl-names = "default";
@@ -959,7 +968,7 @@ spi_2: spi@14160000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			clocks = <&clock_peric PERIC_PCLK_SPI2>,
-				<&clock_peric PERIC_SCLK_SPI2>;
+				 <&clock_peric PERIC_SCLK_SPI2>;
 			clock-names = "spi", "spi_busclk0";
 			samsung,spi-src-clk = <0>;
 			pinctrl-names = "default";
@@ -973,21 +982,21 @@ timer@10040000 {
 			compatible = "tesla,fsd-mct", "samsung,exynos4210-mct";
 			reg = <0x0 0x10040000 0x0 0x800>;
 			interrupts = <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&fin_pll>, <&clock_imem IMEM_MCT_PCLK>;
 			clock-names = "fin_pll", "mct";
 		};

-- 
2.53.0

