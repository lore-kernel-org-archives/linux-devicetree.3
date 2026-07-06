Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5610B42F70B
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330806; cv=none; b=RfQameRY9BthWNcKV7rRU6291jsMOyg9T+tnskuRVxtnzAjwVdO3YzjUrwlcXfyBLZjG6d8xddJaLdXMC6KL6zoRavlfSs1ML09sk12mAeGhDjIT5Wx+CvStWKYj3QMME5lkkr66G3fd6oCGoWOS2P1ULBe5ubuUHsgqTy9fniM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330806; c=relaxed/simple;
	bh=4ZvYWEuU6Q6/l9s5Hx5u5DDikp8elqHiHSp+w1WZKkc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GoUsdKWS/xL2KXBHSeRagI3Ze65f+KGqKIuzH2SDqZ9uNIBL9GuoL4tGtyqaCmMjAsJuRfCxuw7yvhqFzLh12KuOtPQHb9K0zcu/Q1kYP1CvrbRSpLDegvl8ixZe1Bet+AcPrV+AD7akSeh9EgJjYWfrLcI3FQ0H43rUqKcQU0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BsIT2GuQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hMwgHxXz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BsIT2GuQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hMwgHxXz"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693mBL4172099
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 09:40:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XEK9gjwtChv5jazBqtF9ypD7rf/tLq/hPM0yu6oilwI=; b=BsIT2GuQG1ritM+/
	tmFl8KFLuHM3/dj9/2nKJTaLFgxEseRjk+rbBxvnarx/gzr8a+LOwAKl394mYJLV
	Nc5dgzRANHm/RX7+KPoo7+sBAuqH/fRHKFefr5Q9/9GslaVAouqvTEoLh/nVdkK3
	MHmI05X97L1eENILTWyCutwGvUKaMhRkNFj3xGFd6mXZUhboSb/kEKvDIej+Gjjk
	y8ak1WmWNDVAN9QFxrqnwfGh4ADQYvoRB4lz8ngEKunXP80gjziCQc0homnaeZ+x
	PjIbpGYC99Je6bbK36JZ7dUvNZ3xCKdN4ZgP5nhdDyvF+qmqpRnGvbYLOOsjv0BH
	COk6sQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t88a27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 09:40:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e63df032bso314033785a.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330800; x=1783935600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XEK9gjwtChv5jazBqtF9ypD7rf/tLq/hPM0yu6oilwI=;
        b=hMwgHxXzhKCb4Ih+0l4MgOyVSzVRpToMWm/UjoZqL2w90XRF1ehi94zSsYiNiZjjAD
         DvooS0nSD4TSvhnwff1FTsjepKIPf5RrcvN6s+rvTuL4OhBbTNimEZY4+tlwFPvZZL50
         mRQkdAjNeamJsS/eNRDLDCmjblFnf22V6i3iNs6EURIEy2GnBbnnsaJUsXwq9xfheLBT
         q77Xj/2YivsNdKxEzktuoVeV+QAzd3GCzlSX6ytCbGUifyejOqKbilQDx20V6j3zpzXy
         Ayrr48SUQoCLh3PXJ+S/7qpSxp8lPFbSbl7AtM9QNNgvk4BlunobQ+vESwIN+/x77lor
         uQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330800; x=1783935600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XEK9gjwtChv5jazBqtF9ypD7rf/tLq/hPM0yu6oilwI=;
        b=XJbwLDuw44SRq7kzA3noO1ox6a0WqbFoPtFkF+29dwCnEIIyhCTj+E421IH7/xz9FZ
         3HFMnnzVGgeyl6AqgpntLl6OxpQyu/wZnRQ8wm+OVHXnn47EPyE98RGipyt7X4vm6m38
         qZiJxqy4aHt11a21+f3Qdhz+lLzqy+RKC/H2foMyb6PY+AWr36AqrwVRuDjddoAz4hNo
         CaGxCPGiJ4StY5lZriGoza6PUH/3YMAx49v8Ixfdacx+Q4Omh8Q4FbzGED8H+zfYZdhx
         CGZm71wbsSWhx7gNVAhJQK1JmL3rsJ+u2Fysdjv2eYxbS8SUWphe8+ha3IokUeT66R6S
         M0Pw==
X-Forwarded-Encrypted: i=1; AHgh+Ro6F8tg8StRMdvRdKFvcFvICa6NwZRDWD4U2RqVhI18458yfhx0/2Psub77doYct0XyHaZh6z90hUoi@vger.kernel.org
X-Gm-Message-State: AOJu0YzBhhUl1yA7K7YkNzWGxAbFfyv8exDOFvNp0MY418cj+0itJ6Nw
	VKWtQjs5v0JeifwEZD0c324uI97z6WjGuG/Mx0EeQbXmEOjBvD9NL6HFXJ85NFqjMlipSt9Q/9L
	7SEfFY/57gwHWJ1CyRP5UTbTE09sX4AFEKU4idS5t46wQT9VBENa+2lcYpK463YKl
X-Gm-Gg: AfdE7cmqCYmZGN6PQeHCtcbmYAmBmBiy6OR0U4JBVEiCNP6SeiWTjNTkJ02AcNafDlK
	0SpKOHKVG+5Ah1nIkn9v945uQg7qvcPCa34aEuhfW1VuJkDtr0S3+BvUbI8qerVNmThBvviBx8z
	NVjfR4uJhxYXt8XZMeRVG3hV6ghG6yJYabV/Lz+u0HrjzwY6KQh0pr8MrZXDrLGFOU8m+qgJndm
	fQk9ZueXypOkO5KQeI7uljEx5vVFPcMKHPnpb6dKotqBiTCtifLnaPY0QK3MdTfwQLRHynpvwph
	YXemJM2AQdKJIVfKpjjduB78yXl7C+TfJrxvYpSbA2UIcvqLuonmKvWaFGBFvgX9+ToyAUS69l4
	EOLzYVsA2HV1EtTAU5s7XtxxoO2au4+eN290=
X-Received: by 2002:a05:620a:4054:b0:915:6ce1:3576 with SMTP id af79cd13be357-92e8b504b64mr1791973285a.20.1783330799956;
        Mon, 06 Jul 2026 02:39:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4054:b0:915:6ce1:3576 with SMTP id af79cd13be357-92e8b504b64mr1791971985a.20.1783330799475;
        Mon, 06 Jul 2026 02:39:59 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccdb566csm259144095e9.7.2026.07.06.02.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:39:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 11:39:46 +0200
Subject: [PATCH v2 3/4] arm64: dts: qcom: Use lowercase hex for unit
 addresses and values
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-dts-qcom-style-checker-v2-3-90c781ae0417@oss.qualcomm.com>
References: <20260706-dts-qcom-style-checker-v2-0-90c781ae0417@oss.qualcomm.com>
In-Reply-To: <20260706-dts-qcom-style-checker-v2-0-90c781ae0417@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2297;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4ZvYWEuU6Q6/l9s5Hx5u5DDikp8elqHiHSp+w1WZKkc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS3fm+RWYDKXl2AJyBoodiTt2U6QW660ti4fkt
 zvb67rtfrqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakt35gAKCRDBN2bmhouD
 1+UjD/0el+9thrcJ8LiU7LrsjRg46mjJpJMK05twxZaxX7X3p5G8Tqvg4H+mqbyHhIJ0rpqPKD+
 g5Nm17QMtD3okeR6gC2KSMrkKfwZTDgQ9LNxTFfbgMb/eA+RnFeDkN6XPS6jX4gcXZO3u+4N1Et
 DzbNAfqY1rMS1ILnzLfrKLX35PTat+CC3qRLw51wsSQSYKiyHvxYuyv1jefgUZshrhoF7XKp5/x
 ZzH8oOZZ0MP4U6ra7e0r0gdvOUZ6J6CycFzNbKWaMtDm4eBQPChpqkWgTBx0HAY5yhgyA43IUNQ
 fLxxBAUFWKcyP+REHbI2A1Zb+jkeBbkRydw8liWv1A4k+U+SjLfB4g/gmelRQgOrdLiFbszWu72
 yjgrOevWyKIUZ1c7XZz3B+wvJCdjSkJAogjOWcYc0I5FVYYQCH4amDtHjeWqA4ZKG8qhzt3m+Ik
 6wS7K6BA/ybiWZola9A6bVjGHjraKw3mPpEI5HMCNd7/t73qjCaVQXaB2WfYJ2jzS3l4TnHc89L
 H1KY3ZWdS50JIBvSwhRsqkmt4E+exaAZzO3IgnQfUVfkszmYYWCQxuyu+5hPJ9ha318uGe1iKNE
 VPqkNeHwVgdw/V5upOnowUdIhsJlJCXBLl16sS0rX5AoYVqCE1b5b+MEjZAam/Irj313PzK4G1K
 Mu7KKVsR7jdX2yg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NyBTYWx0ZWRfX5HfVcLdBkjvA
 ouPFkOXUvtcwgslnJ5Eu+91hGHwlf5zcXSpfpEwHDmsJm5CxX4ofFF8ccSz4107vgmYqSDcZo7a
 9tdGaXJg1613njvbJcZWLBHjzqWm4MI=
X-Proofpoint-GUID: Bz6Z6z7sVzjW7dd0ftLJafU2fbjkENeV
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4b77f0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=qNKHm867MdwR7kzYylkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Bz6Z6z7sVzjW7dd0ftLJafU2fbjkENeV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NyBTYWx0ZWRfX53zFl3PnFNBh
 s3V+Faf54q4+lwMFoFztlq9LfLW0aX8WZgfoW8x0SSBy0PDtWpiMF6akePvh6+pCbbDRn9lzwoc
 OLoiPzYt3Swbmb/rHkRUzmiwpUHniQ/NdVJzPU4fa79YCXOaac0BxJ9EaL17busCfOkcx/FIK/N
 PmnUunpH2Krq/D3xDjYYZjHM3BD3ARWUn91og9s0Vec0WiXV3n7CW9Kf6MdND08isJqJaDPD1eE
 FAS/XoCOt2R1FrZn47NPIyLz+IWEKIPqjBgIEreJKIeZkyzZEqlmQ87ksw8DL96dqDCgJMWVyVd
 imX+ey1sKvx2gOV7BhnnwEL/H2c1MYR379ZzYgk0R/z8kPx5tbazx4uT+OpRWL/aS0WFcPoi9qw
 fBs15mUp63gnCnwDOwFTzGlInd6eq2amR1d/biVuuzBTYqRLJb+8kFBOq7OFqdYkBn804w0y7gb
 nOwO9FyNa06aahhzc6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060097

DTS coding style prefers lowercase hex.  No functional change.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi           | 4 ++--
 arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi    | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 8 ++++----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
index adedcc6da1da..1a278503d340 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
@@ -591,7 +591,7 @@ saw1: power-manager@2099000 {
 
 		nss_common: syscon@3000000 {
 			compatible = "syscon";
-			reg = <0x03000000 0x0000FFFF>;
+			reg = <0x03000000 0x0000ffff>;
 		};
 
 		usb3_0: usb@100f8800 {
@@ -1241,7 +1241,7 @@ pcie@0 {
 
 		qsgmii_csr: syscon@1bb00000 {
 			compatible = "syscon";
-			reg = <0x1bb00000 0x000001FF>;
+			reg = <0x1bb00000 0x000001ff>;
 		};
 
 		lcc: clock-controller@28000000 {
diff --git a/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi b/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi
index 0dd52cac0e2e..7206a33da279 100644
--- a/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi
@@ -15,7 +15,7 @@ / {
 
 	memory@48000000 {
 		device_type = "memory";
-		reg = <0x48000000 0x7F00000>;
+		reg = <0x48000000 0x7f00000>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
index b2dc0327dff8..9368fd6b8751 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
@@ -66,8 +66,8 @@ venus_mem: venus@97800000 {
 			no-map;
 		};
 
-		cdsp_mem: cdsp-mem@97D00000 {
-			reg = <0 0x97D00000 0 0x800000>;
+		cdsp_mem: cdsp-mem@97d00000 {
+			reg = <0 0x97d00000 0 0x800000>;
 			no-map;
 		};
 
@@ -81,8 +81,8 @@ slpi_mem: slpi@98700000 {
 			no-map;
 		};
 
-		spss_mem: spss@99B00000 {
-			reg = <0 0x99B00000 0 0x100000>;
+		spss_mem: spss@99b00000 {
+			reg = <0 0x99b00000 0 0x100000>;
 			no-map;
 		};
 

-- 
2.53.0

