Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793456729;
	b=to5BocFruiIEZyDuVNTCPh+GwLP0EFwpcomrfSnaZU6kdeg1P4FWcomlCkIFMCs8WF8g
	 t8QXfx1Tf8SeI/6t8dIoQkPdwh9yz3aB+ZhH3uwt7CXM2M7ZocPix9KEm9BgRLI2AW/2f
	 nxpbCoE4k6JqtiBnG0iimlxiGkXdrStUfWDRMFu6fbqZ4+ryqYwLmywoH/dOhyuByz0gl
	 +U9wmFZg0s1AjeGzs0GyIy6X5F62rXQe5lhQvLpCdsuzcQ2myUBuuGXXZXTbqgPTSOcFc
	 1hxKLiWK35SeOx9DX5ceLP7Lov9UNbt2EpgNKZstqNoulHzFONpCQ6vutLpP+oOjIeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793456729;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5uJBzesEdn8JWNtnL1mhsTmx0/t5Wkhbj05DbKxlros=;
	b=Z799xeGSfeorD3CxMQ2d+kTcKz3iTUPwE9oznILDkjNELRN3SxdcTWWsLPmgBwAQpjVC
	 dFqfmQOm0ICVgGy6K2II+Rz16DBUg8HDLU50VICU3aKWGecEHqf35Y9xARYXNfkKs1Wl4
	 i8yvjNDeRGc9ceSU0xu1KC+4YPwir/529xFTn2+uVaX1zvTzNj5VF6Qm19aVkkJimprmz
	 vfsWNIwqVQGmvHp0yfs5TvGnxRsJJ19cEL3UNOGFj/rHGc4z11gL/CmEzuXPMAJT6Bzjy
	 fd8wBYxkCmwa96FLc+N91inLnJwLAl9RugWMelEM9dCoDFOV3GoUOkNlSpEJZTfVdVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LiQeguRt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="f+bvQHK/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B196C606A322
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 14:25:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B196C606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LiQeguRt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f+bvQHK/
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD0DUg1849141
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 14:25:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5uJBzesEdn8
	JWNtnL1mhsTmx0/t5Wkhbj05DbKxlros=; b=LiQeguRtraozvTWcJG2Lfi4vsn5
	Uzsyy72XxzJUSNOdDh0auoKDMqtlAWcwaJYmwoF8umt1t2+CrCKBCh6rh5SuVJh1
	8I2EJ1WR4M7fQ+7v0/DkAFv1iGTb13vWaMQ5QXHhNAhmmug/S68djh0jhCGo49IB
	k/kkH3tPBiDgPTp3eYGxIhf1HM5CPcvlX0vE2xrJ3KEuOmPgR2gImnHmeoCyunyT
	+Az8YaKG1qAP/flAc9cQ4Hf2PCuN7EvpDnI+KXqzijY1IV/WCdIerki3OW9xDz/f
	DYQE+thPlG0Z6U/txpO3fQoKdEBY7V+QB94SuvFWwGYdT8Xe7pweG5wEZQg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7nfsbyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 14:25:27 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a3451ea93so2608937eec.1
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 07:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793456726; x=1794061526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5uJBzesEdn8JWNtnL1mhsTmx0/t5Wkhbj05DbKxlros=;
        b=f+bvQHK/P/cJsC57jufuCGZJhv9u4dsQGXW1vrnTCD6fPVkbpdbTQoQwhb0sWzbzWC
         ZgsDLRHZFKgeqftSpAIpp46pMBNJ3FOaMnDJJA4QJpbYCcHUy1pnn6Sfpts68KpQNjhD
         3n/uaG8u3FWTBHvEKYiSFtpj7cg3Oe+byhLGKvwZDOhYF/xE9i5f7bWm7hHwRsHo+vC4
         f3wlR03pIe4AQ3WeokGAwvax9mrrjxveMUARsw6oZm+t6nVp4LLwicnOSo2JRJgDEtN+
         WaH6bmVOrpWL6TD4f+s02zcdV4my630bbNv/bjFojoE1xweXiNUYLezU2IWcyHITwnYc
         yDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793456726; x=1794061526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5uJBzesEdn8JWNtnL1mhsTmx0/t5Wkhbj05DbKxlros=;
        b=hepf9/1J1qFdSjPBb5PQuXxrt9pULZb9F6ifMTkJW54neSv+KBc7zpWZ2eP7GXYXHB
         t6HBp2xYxfcc+O4ZBH8hxcUNymZDJ+Ud86cr87qlxgO/6ZSyAQwsBKUFG0BicISRd1xS
         Sla0dw9MvSL3tOJy3DLri5vF6OrRxw2Gq6MTncgfVcCZFuFLYjpc2EXBPDiiDcKFxTNZ
         WG1eT9URfyA4iAsSongowpEfU3qGJKYhsX0NddebxSj9EPRx2ikQ1BYFguzdrw1vYP8i
         NmY1fHe5DT25GGbHSiJVmMUODzoWz9SS+FvopI5r+EmKPk0AZ2Prv8wBv9kWPrEDSgW2
         mbew==
X-Forwarded-Encrypted: i=1; AKwUvBx8kSePOibZ7x+XK0+G0Hh7cFLqz3FAwD+p4NCrJ5dqv6Mvot4X+OQVE3zwi4REDuy04BSYz6+QfV14@vger.kernel.org
X-Gm-Message-State: AFq9FYJPni4tyImnQBwPYawuRMQQaNv0tfJ6zJjhGrUuDxIWdXkwhUTC
	I1s0bUs2Rrl9x9sCyLaIUpR4Y4pE0Xxap84cqc/V6FvdtIEDiknAGUYP9jbNs3+BhK/T0JLLYaj
	4tEBHdTxBjgdN+0vHJfE62r42LT7bK5t8kHn4IsnUcIwRCQPfVqGTWwxT1fg3nKpL
X-Gm-Gg: AYBFou1aJnvOHHiadVRgDJNXlLolR0JR088kyi3LzlCoAySKambiyf2OSTrmYhFT4Lb
	xcNzG17Ld/t8oCqISF7q7Z4wiLXnULeM5BehP6/6dWg47YAxJpiHq/oN74+fX6qz4JwpbjU3NYi
	adbou2fwAsvpXvJV9OsF4SottONsBbS8LplQzC5wIgH4TwLDuKbwdySNEozpm0JSpRVTxQyNAIA
	PnSjhHiIzkYhhqIJxfmY/c7sgfYyL21ij+eqEgz+hT/m30y3cB7Fnts1htsVallEdxCIoC0pW02
	fb6qmsxrTulsOIZtExo7h5dDTNdhJ/beKkb5w3iSFlmFVWnaGEVkN3pO7U0y42XmRjlk6dYJ2+e
	z3Q/1fJpQXn58KucBJA709X2werePtorNWZX8VsuonpZBsKYo4Y3kvKV4aa0RIj3JmsrRp/vpLB
	Ipb0P0dzGlp/yr5ymB3L2gDjGRJEjwU7yQ
X-Received: by 2002:a05:7301:6194:10b0:369:f937:9a7a with SMTP id 5a478bee46e88-36a42437876mr7966028eec.34.1793456726064;
        Sat, 31 Oct 2026 07:25:26 -0700 (PDT)
X-Received: by 2002:a05:7301:6194:10b0:369:f937:9a7a with SMTP id 5a478bee46e88-36a42437876mr7965970eec.34.1793456725286;
        Sat, 31 Oct 2026 07:25:25 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm24968586eec.16.2026.10.31.07.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 07:25:25 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v4 7/7] arm64: dts: qcom: nord-rrd: Add WCN7850 Bluetooth support
Date: Sat, 31 Oct 2026 22:24:33 +0800
Message-ID: <20261031142433.1212809-8-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261031142433.1212809-1-shengchao.guo@oss.qualcomm.com>
References: <20261031142433.1212809-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1NyBTYWx0ZWRfX0/Ts5Odf0u6n
 o6m0yObBwe0DRmQuyYF/If0EcBH2RvDktRZLHjmfXq4JJq25AVenH6dBSR40vgEs0J/yeMBb1g+
 rQuwwBJptrDgn3GbHikTBvfizECfR2w=
X-Proofpoint-GUID: nn_5Zgikjt5QD2fPhGCg8PEmmNS-Tzhx
X-Authority-Analysis: v=2.4 cv=FJ2OVOos c=1 sm=1 tr=0 ts=6ae5fa57 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=grFeI82b2oVWyHTUkKAA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: nn_5Zgikjt5QD2fPhGCg8PEmmNS-Tzhx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1NyBTYWx0ZWRfX1tcJRQdEtAHd
 pu7baLOYqIquXW16xw+PETEgOj7u8GxpXTdYvMSQy0nzX76tiyzfDq/3kblBy4VaEfpxNezKZED
 pFuuGLgAFJXXtwDxoeo86vMN+sUSbf3jI8KZTeU5FccfzAw+A1dACHzP5ElSuekSGQO310LHRR0
 LwxVSQRK0dpDHUDe3hcO7Z3+s+jEcWyoW+nPjdVYgXYjTLzEvk57WTp2uMfG/tw2shn8gy/rqZw
 8JyO1d5d57psBoZsKKG8ciNAvVvzsjTDlKD+h+iulyQdomWW9uHl5mTVAZd+9Np0G0Dg5qgx6wA
 OdAD+lu+r0HYHBgo32n6W75O0Bb6iUZcKfmo9P0Lo+eJxE0u/HJmTpoVs/ADGfXPsTGr9kTT6R5
 AQC5LkwBRygZGjBq+HVkzDf4T5dBR1OY+uJ08oDQNl3zUPvwZQgFJGYP2O88Q3y6CgTN1Tkm+ax
 Y6PCS8h1k+7lsi612VA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310057

From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>

Enable Bluetooth for the WCN7850 module on the Nord RRD: route the
BT UART (uart17) as serial1, add the bt-enable GPIO (pmau0102_e GPIO9)
to the WCN7850 PMU and describe the bluetooth node with its supplies.

Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index b23c1a81a376..827d3ba3a238 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -18,6 +18,7 @@ / {
 
 	aliases {
 		serial0 = &uart15;
+		serial1 = &uart17;
 	};
 
 	chosen {
@@ -102,6 +103,7 @@ vreg_wcn_core_vh_1p95: regulator-wcn-core-vh-1p95 {
 	wcn7850-pmu {
 		compatible = "qcom,wcn7850-pmu";
 
+		bt-enable-gpios = <&pmau0102_e_gpios 9 GPIO_ACTIVE_HIGH>;
 		wlan-enable-gpios = <&pmau0102_e_gpios 10 GPIO_ACTIVE_HIGH>;
 
 		vdd-supply = <&vreg_wcn_3p3>;
@@ -602,6 +604,23 @@ &uart15 {
 	status = "okay";
 };
 
+&uart17 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn7850-bt";
+		max-speed = <3200000>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+	};
+};
+
 &ufs_mem_hc {
 	reset-gpios = <&tlmm 181 GPIO_ACTIVE_LOW>;
 
-- 
2.43.0

