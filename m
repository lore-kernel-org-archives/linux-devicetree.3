Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7DA25771
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 16:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789144909; cv=none; b=Tu91pSKJ0OSN5quIHK/AS6b6eXbnEGoLscqffAeqKfo97+7j+uuZzd3jLwT2jnE0BX8fvfn2fCtAWHPuSVPNUuicRiIsUMKBvYNW9ensAXCsQR4hAiIP9siJEqKJvUIXyDLJEQWf783ZNicxLgu+fYfheYpfCeDJ7UdIibzs750=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789144909; c=relaxed/simple;
	bh=/DJHFjQX9E7YuVUkj+y3FsDcwplriep3EvTUWoqaWbs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=shRq0vkM/q2qK31y/I7JV58a4peEtIDUvQq+m//5ys8zwqLbpJ6HwwhvlIB1xOKytFj/a6WZqhDk6mcfz94hFyLLz7l3oJFJiHpFbZMfkd8UbNfVM3OnIiHExkut1H6chql3XLQ849mbL+EKbHHOHOzQjdBL4jPZUyypRwivgLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fmbOaPCD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FMvqcfYw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fmbOaPCD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FMvqcfYw"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEm08V1370329
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 16:41:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hJ/wgRkqUotp3CoWz8XocYAAOlaQBPuzP2rQrqZWNXo=; b=fmbOaPCDgaFwwrEe
	YIVcBl4z+htG/ehybcU1ys2n0LKPdZ2pAYoFfhI06gxr1l9+6oREU8XWyVjF7Kx2
	ZPuFZ9y0m2M8UUulRCPyfi5tsV6m+gkkm9Wgt8jW96DbyNuRrOFDpLfxzh91JGL3
	ioEax672Mio9phN8WmVk4s9aEU8g+w3yMAdMwhHtLdvj6mLGvEiTY4iEc2UC/hWr
	s3Xf+wSYN+A+p/kQ/xzADkCyOwS/Y8PToCZUmxmibsx9RmveZr6A42KEJAPeNh1T
	S5zliebF7JThqTVljdqLatvtUyhnJCAJMuJdd4FXs1qqQwr1E86aDTZYXs818qex
	5QQnZw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbf8jska-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 16:41:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so1446960a91.1
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 09:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789144894; x=1789749694; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hJ/wgRkqUotp3CoWz8XocYAAOlaQBPuzP2rQrqZWNXo=;
        b=FMvqcfYwa/xw6qTzsCTvMID0PsN0bGheyFOpREox/V0syoMU20+KiNslFHKcUPWYN8
         sdpvPVjMkfnjn+4n5RHa5/P6OsTnIHMEfPUWIjlBKPcIXT7o1CoqhHJ68+zuWNfkg9HK
         eKY6GHU1L42vkWBG9/6RIP+0eUK1+cGrtyYIuO0nrzeS2Skyi6ixmh0sKLSrBB7S1cnT
         xJqZPMc+kRnLH/NE9UYrgt+153tTqPsr08UTzI9uz8OE7pWjopccjAA0jfHF34O5gN0a
         YlICCaL4ZgMsbgBSbJ16vDXIIWf8mrolc1jhpo/wj/aRaIkuoerecCIrPmezhULZaiDw
         rrBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789144894; x=1789749694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hJ/wgRkqUotp3CoWz8XocYAAOlaQBPuzP2rQrqZWNXo=;
        b=Lar3FVs/vpLk0PCzARnJPDjG39iPgOf29r4hDsANC96cV54n8S1yc8zHbG8P+AQvfH
         wmJ/rFUvpzolurLdMU5y371NJ/WOtlv+O+wuTXCrJERGanGPa3Ua7chhVYxUOspSti+O
         NCsxV5rUp6SN0Y+J+VmOLuHbcij00EkHu8H4lPKnILba+4p8uH9g5aN7+W+hqUtH92Vn
         suSObpWln3s77MSEzdc7RFFOHbGsWs8Xlx++pqH7bnr1zhbRiG0K3A6wuf9HWBSeO38P
         FHaf74L3LeXqKGm2UADndfC9D3duPfhIbAWLX7zXbqn76Xvg0HBP06YaNfG/mF4lm5M+
         a46A==
X-Forwarded-Encrypted: i=1; AKwUvBzDqj4qKt7t7clAuDLEZ+R0///6WN3buxaHvvE7coQrHDJV0Xsohw/6v4YBIke7DmLJNt2ztjjn4GS/@vger.kernel.org
X-Gm-Message-State: AFuF++lQBJSmDuJInojg4KReEYqshwtkhZvxJQhZPkV0jL+dP0aauuMK
	bdvOFtNbzpn5j/LmjnwBXd27fRuVan1JBu46UkW9qIHzonqkMeE/zeVoSUZWTkKHnICjYNKvawF
	kS59Qi1Ir2Qa3jjfnFL2hE30CEdkGeL60U4N73VtcZnyWOE3rB9LWv8iifsACQEGt
X-Gm-Gg: AYBFou1vxRiHAWPxwPId2U/XL4eTAucMqv+bGqglMf+Jg4wLJe2vye8PcE9d2Lwk3N8
	wkRMxmhIEbS6z/RlIhtr43mz9D+1HqZ1oyEIue/uVJnhejHDSA9UGHJZMBVuG6EL5o0qWgBNSqd
	byB/smeNOwM3uy9YwQav9IK4dHKQcA9Ori7wO/uaLvBF815izFJ1+/yVhfiuKC8VM4LrKwE9pq5
	ZTruwCm2plwoxEWK0lvlNhVaaGL1/Ap8MB04pXgQlTJ3Fa99MGaFbgp/G5fWjyKt8HkjwEdB174
	ZnMtosHBhrC8IKDfB0KThyZkIlFxPqXxQ4hTfdfsoxD/Gp11KKTc8vFGolU6xr6DusffetEYsmL
	PqwcKTICiSQg5coU9pHQ=
X-Received: by 2002:a17:90b:4a8b:b0:38f:240d:b857 with SMTP id 98e67ed59e1d1-39d9bbc81cfmr7901200a91.2.1789144893985;
        Fri, 11 Sep 2026 09:41:33 -0700 (PDT)
X-Received: by 2002:a17:90b:4a8b:b0:38f:240d:b857 with SMTP id 98e67ed59e1d1-39d9bbc81cfmr7901144a91.2.1789144893468;
        Fri, 11 Sep 2026 09:41:33 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9b2a8076sm1618171a91.1.2026.09.11.09.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 09:41:33 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 22:10:40 +0530
Subject: [PATCH v6 2/4] arm64: dts: qcom: pm8005: Add temp alarm node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-shikra_adc_support-v6-2-e4b2da5cd55c@oss.qualcomm.com>
References: <20260911-shikra_adc_support-v6-0-e4b2da5cd55c@oss.qualcomm.com>
In-Reply-To: <20260911-shikra_adc_support-v6-0-e4b2da5cd55c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789144881; l=1771;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=/DJHFjQX9E7YuVUkj+y3FsDcwplriep3EvTUWoqaWbs=;
 b=Qrxs91487o94JmLMMAyVYFbyGF4owhAvveBFVpmP8QjSXqbnrDvacg/vt23YbE+sNV2DLcB1c
 q5fvGQkY8wrAcycBo3v7VaAuBrpM8gLnxAsE36fasFKCPRPn8niJF/E
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: dL9pCN8NZhJsfmzp4kqmJtDpHi-idD7q
X-Proofpoint-ORIG-GUID: dL9pCN8NZhJsfmzp4kqmJtDpHi-idD7q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIzMyBTYWx0ZWRfX7bBODU6RDCBf
 WmfvaH+MDgc9reM1UiTNzlLaHAOgs+hb9bgrNzyCp1z/o6jLulSRwKtniWEGjqSGMz2XnkE9vJx
 +OXCC7hm7iX6/64BlebRcu1gZ2tL3R62YQpKQbZhEJYyYd7WtTKibSOPzGX8GlNmCtf1zfGEPGZ
 qnKAyw82zmL/26HV7ld54hSI77HUCVW973EEKzkh0EibDRtTuvOI4NGGoSr83zumhfExtcJaEWn
 EAcgMu+KsUApXwSYyMxjHF2EpJpTKnpdZVt5oPw1yCuh7AqXRi4Ek4I0b8S1QHa8D9tl3DxwClM
 DsTe9aokDTS1La4C8bz5KW4XHKKdFOY2n+hp66+DfaAVf2Jlxfv27cuDhTY4+h3+gVGeIbaILNO
 K7TM5jLK/KGMnLbNGjG3bfhJlh6kkD5KiNFsQJysZfKF8x5E5P+qihe/0WBvmsdpBH0p38HTCaN
 +EVbCmwzo4jU9MRFSgw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIzMyBTYWx0ZWRfX77K5xRKGVjaj
 kA/Fi/EyACxXdsowYBa3k8EDHxgD++nNqm94wdDgpA9BeDNpbk53MaWw9puIFsIHUq4vgbmnMNZ
 TxWVf0rwOUcmj9988m1yQF4M/JgRqvw=
X-Authority-Analysis: v=2.4 cv=UJFIjyfy c=1 sm=1 tr=0 ts=6aa42f3e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=1cSftZPrRki1B16PJQgA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110233

Add temperature alarm node along with thermal zone used
for PMIC thermal mitigation.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8005.dtsi | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8005.dtsi b/arch/arm64/boot/dts/qcom/pm8005.dtsi
index 0f0ab2da8305..ce31a8545020 100644
--- a/arch/arm64/boot/dts/qcom/pm8005.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8005.dtsi
@@ -4,6 +4,34 @@
 #include <dt-bindings/spmi/spmi.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
+/ {
+	thermal-zones {
+		pm8005-thermal {
+			thermal-sensors = <&pm8005_tz>;
+
+			trips {
+				pm8005_trip0: trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				pm8005_trip1: trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				pm8005_trip2: trip2 {
+					temperature = <145000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
 &spmi_bus {
 	pm8005_lsid0: pmic@4 {
 		compatible = "qcom,pm8005", "qcom,spmi-pmic";
@@ -11,6 +39,13 @@ pm8005_lsid0: pmic@4 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pm8005_tz: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0x4 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
 		pm8005_gpios: gpio@c000 {
 			compatible = "qcom,pm8005-gpio", "qcom,spmi-gpio";
 			reg = <0xc000>;

-- 
2.43.0

