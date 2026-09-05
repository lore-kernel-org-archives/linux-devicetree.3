Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747AE37CD2F
	for <devicetree@vger.kernel.org>; Sat,  5 Sep 2026 12:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788611278; cv=none; b=VgRo6jzV4XdXYIjJk+rgYzLitSVdE+HdwSyODzAs/512KeqeezIvvCR3ICEZJK1w1p4O8nM0I8VqZirySLeQGBzCiLj2zdQgScqB9xXdCazA8G2rV8OYvdKfbfYv0c0bZk1L17JVW5f2V2z+T1dY8O9hWPJ+Fm3XQR5lmGxXaa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788611278; c=relaxed/simple;
	bh=YS2PFBtPYDs63eo930+d89nki8D8vcJ6NjzJW80Rf6o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EbNxTeF+5lTbnJh4VZ0DrQieBqAAqQlnss4wG3+SFi8Q1c4J2nslDfrpudz5bymTKQKkFR6mhdn/d4FXABeNqGHaUR2HDmyzweFKPtpDOwg6rKOJmLB1PElykYsM/Cmf/WVFoUp8n04o/64vzPCWVCrPECum0xvLa/LNJXxV6kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GgV/L0oc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kCxcMCOF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GgV/L0oc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kCxcMCOF"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 685BVQN73378170
	for <devicetree@vger.kernel.org>; Sat, 5 Sep 2026 12:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=64Dm8Bs0yNx20mXVjg9RzuzASblCKGVYMw5
	l2uvS4q4=; b=GgV/L0ocVxL6qJqSA/3LD13V7j9Fy0OHydNntpaw02/LE1+jK9a
	PzccGEskt8dAbAxmhelaKfF4BYu65iTCmRtyt8uaal6MAYagKkAXF7BkjFJx2nKv
	jIJbnZLD6K3lztzpS8SwIvg/d0XfPVEazwJz50/9eeSol/nuS8G60rs5rLnwShv8
	bHhh++6VjWMKQuE7f5k6nDoPDJGPfWyVy6WjvHCkeYL9U5FrXRkjv7Q/jEyMkLG6
	p6VN0IUYKMwMJVmsOe09yY5cgq8K6Q22JCUXHVcSB/RZ7mP5wHSNoi6e3/WKrGYi
	kDFO0YnEMWjkGiQYCtpzuvqx4BkgpvKardg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg8sd1cv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 05 Sep 2026 12:27:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93903622880so522195385a.0
        for <devicetree@vger.kernel.org>; Sat, 05 Sep 2026 05:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788611275; x=1789216075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=64Dm8Bs0yNx20mXVjg9RzuzASblCKGVYMw5l2uvS4q4=;
        b=kCxcMCOFWIImvRhmGG0yTqmpRtd17D4msDb647PYjax9uyHY3FHVr08N2xI5rsLdFV
         EsiSyQFCEFQJjGqeJRYyb65tJU08gZj+SN3104302IyN7XYLMcHgghU5SAh1ixdxbLXx
         d6sCWhpObcSIuuYdM1WV5yWytF8iuo+a/1TTijcLYqGM7UCjeVJq27Dhk9pZnf0GmVF6
         vTiCvrtCGFpMhh5rh8q9HuHuuNhDw951T9ecaw/OE0FShFpCKMFb1g4hNMhrN1mRhhlv
         LDNomwRYV7R9yoPeQ92g677KRGluTJNrVv5ZoHbENymZPtW8CiG3gTBALwCcPJtNb6c9
         Prmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788611275; x=1789216075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=64Dm8Bs0yNx20mXVjg9RzuzASblCKGVYMw5l2uvS4q4=;
        b=EranaHhHLo5n7ojyaVIzb+Jv0Wm6Ik6Frah8ska7cGaoL9imrXgZJFoKccBpSWBF+D
         QoQIbCdnB+b0BriEjURAJdCs7iwmUgO/at2vbwwma8ilqcFemDLxLAhRneCTx0B062wR
         W2HUvsVS8jhkhaBWPvSToXR4+nBa88cM8tlCiF8bWJ4Vw7uTdKElo+0zH+xLFTQS/9Tm
         46sw/qDN4A+0z6+yqfftAgJ0O84iAfJNHzTCtFh0exumaLdkCFj5cd1ur0jWx1B3fH4U
         io6TcSIZRr9x8JKSJoJpENiut5v8TqgmJ9yFEQWYRAlA7j4EFXwNtdrBTlmvmi6P5t5r
         /Nnw==
X-Forwarded-Encrypted: i=1; AKwUvBzY2/RE/rIb0w0zdqU5BWM9Lj7uQ3fFxn0CT2DuWGPVssr4t/MZTnmfPTlg0zeF8RwxHzeBFkvKsX4Y@vger.kernel.org
X-Gm-Message-State: AFuF++n9Z/qMfh7JscFgHF9SM4O8k3n2hXaitZStNgw3WOQEaUQVc08Y
	p1XQlCOeSOrMQi3+q1z7gGUWUl1yE5gFliVa8YFnvhA2DwByqSsbSRbVODG8WdJANdSVpjFKV/e
	qM12RIxDJPP1bIjrNg4BGMxwq0ffMDEsmPTHz/R95IBI5SsY5JvH8fVI8dq1VDR4P
X-Gm-Gg: AYBFou1+lpMhgr4CxXZaNp+TFMwv9uP2oqGNPBc9OUw+p29/U1A1DBotBBCtXwpVW/x
	AkRQnqkhcHhN8wQYipF7HcJVnenxnefozggQPU3LlYhaF2ffleGJh8cOMSoI/JLXZXgActNAfoV
	FZOGF32O+XoNGLScMIQFFkHuIOw9OiDTphVH6+ZDGvLfoih1VL4CQK5dR/IORY6ekS5ZsJsJ+Hd
	lGi01KCt1U9KJ+Pi8meP8z4T9ol4KW3oCbqW4YxpwM5igeFRILIc0MZH71buUoaf2zW/vu/NWVd
	9svTVU//YGxa7YYNCDl55jsJvQQLOyWwJ/4kVTM3WF6NMmMGt7AEFMFo4628J8bG2fqdya1Ds6q
	0Y4wapoiR+imXBzE=
X-Received: by 2002:a05:620a:4857:b0:939:5d22:d1f0 with SMTP id af79cd13be357-9396dead4a3mr1206549085a.2.1788611274570;
        Sat, 05 Sep 2026 05:27:54 -0700 (PDT)
X-Received: by 2002:a05:620a:4857:b0:939:5d22:d1f0 with SMTP id af79cd13be357-9396dead4a3mr1206547685a.2.1788611274089;
        Sat, 05 Sep 2026 05:27:54 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5952560sm238334095e9.3.2026.09.05.05.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 05:27:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: monaco-ac-evk: Drop redundant whitespace
Date: Sat,  5 Sep 2026 14:27:47 +0200
Message-ID: <20260905122746.72952-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=815; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=YS2PFBtPYDs63eo930+d89nki8D8vcJ6NjzJW80Rf6o=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqnArCJQEz25Tbvuxh3RdG3ykTADbGRSspiPX33
 wbHJ3MJlvGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapwKwgAKCRDBN2bmhouD
 1yJtD/0aSZniX4+o1wi+yeun/hPE5ciMO2Iekx0JWN+4ROYuL6K1yESzjC/JyCVg2uWbPBvisKM
 NJAzWmlv91FlHQxWOLnqSEUrMvu0pjFppjr+omE1mGC6bIsg7S26fHxaj015tYkk6fdftkmNjq9
 WvDz0RnOzz1jiqacLCdYLlf3IZmCRb+b+6lIGF0+ek3EWDZJrQCmT6hENPwE0HeWDK4WligL92A
 pHh5gh9e+aR8rTT2DMP8P2RL7swnlD4oVFrA6xZeZ8fFAEcaiowq5OQVMZE+bol0yaPySPvctaF
 cCuG0MTnMb1JTLgPG4N/x26PbM/Pw0SvvIPuK9A6LOxLz32cWArIq7PUfkIaBAyFu1HejnLJXbo
 mvV50XJ+DP2C7dhE1ElpBLrfbY5RVEvM1XW0QLOVh1DGdNpUXtVzWIXRtaB2iCJrKB3ny6TlnMC
 rLfkBMHCHkJIE8rgLasJQqGCNbYseycQ9kNvKMxDsosKJIwD3f7ELaTkz50qmvmmwEE62dxpbQD
 6v80TwbdEE1DY2P6bklMEl8CIaaWcNwInGqUwEdLh02I8JAxgC15wzuKsTVKPuzB0rLAE1DmwOk
 nbAbQs7dVyOKmriDmWyISHswpJVgFrP+wgpbZOihaV2F3dvRU7j1Cc+MUGWrzfrSNRXRZcWWetH Z7W8Lz/P60vlZrA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 20_9PNwoNHLXG7x_ImRgfEDakhrrw35B
X-Proofpoint-ORIG-GUID: 20_9PNwoNHLXG7x_ImRgfEDakhrrw35B
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDEzNiBTYWx0ZWRfX9ZK5m5LQ7fKW
 2dEhjbm7x5WVvTDfXqqE6CnTparoWYRg1ut4uylDkNAyQ/mTnCEpTigzGSrVkb24g6gsY5ZilTa
 whLAu4nnVh2bPq8zFHPDyePwm90by/o=
X-Authority-Analysis: v=2.4 cv=dfmwG3Xe c=1 sm=1 tr=0 ts=6a9c0acb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=iQ17RmGla2tzZZFXTgAA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDEzNiBTYWx0ZWRfX5VJy3XeL9eQe
 MO86zpI9JeqOYpg6T/W6BjHava8lf+V7PrUjtsqnHm6SXXFRpJ+PnLPKuwZJT2+fk/R4ghW+VYP
 7oALse8KMPj3u/mctKy68S0Pu/loo8Br6klv09aQwLzWwwHl1zJkMF9ngAP1hHibxH2hQbrqSKp
 wbg7S4icAkFX3YDbnF//zCLsE1o9wVXZ3PL+tu5d8oCUt6gZI4X1lZb9gAescMGOe3uNWkOHcVq
 5YEKHg3w9af1hQZoNH5RvbD31Kya0SVo3H5HEdmD+b4DxsFmZeQ+YSzsmt46avnyfzkZ64UACc6
 c200H3KKDSFZYuV6i2Fe2IHLclQqkLeHyBEHZ6uFNt7naGRhmDg8HGIgN3ZZr61kUdndXDPkF2D
 l4cDCEnBnq068XDeCWy46YhSWa8NAh2zvEozdC9bQUX8zfcAiO4shWgZC5CZqWglieUdLSBbmk3
 QUQrEottWldmo2VWNDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609050136

Drop duplicated whitespace after ':', as pointed out by dt-style-check:
  monaco-ac-evk.dts:825: [redundant-whitespace] extra whitespace after :

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-ac-evk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-ac-evk.dts b/arch/arm64/boot/dts/qcom/monaco-ac-evk.dts
index 6f3c3ffefe34..f3d41f738440 100644
--- a/arch/arm64/boot/dts/qcom/monaco-ac-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-ac-evk.dts
@@ -822,7 +822,7 @@ expander3_int: expander3-int-state {
 		bias-pull-up;
 	};
 
-	expander6_int:  expander6-int-state {
+	expander6_int: expander6-int-state {
 		pins = "gpio52";
 		function = "gpio";
 		bias-pull-up;
-- 
2.53.0

