Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793340128;
	b=uFVmr/ePnFL1/hkJabBfdPDHKWdKjRmfTwtxubskdF9hk+tHMJwTViMIwEVhqFU0UNG6
	 TcffFzfrkIysGiMMs2703mwFjBLzH0H489nN8EaOwBzCzFVUQ5R7deWnTSH30JA5lURHD
	 cN0zZwCwzNzi5VGRMy7ml5bhQtEbGnDW4CXhVWS7qv9x+pa1hc4g+NjtJXPGQVAfHJ5iz
	 LPfUr4BbtAEvXXzg+3KUTY1K6e2yu+Zzcww5Y7n0LRQp7IgAZFZtfp02PmkTRTvG4a/OK
	 LdMFh950BUH84pTz2Hv3PTQ8ClsuNwXHh7apdxf/p0oeEig38VuIqxgCV6LmJcuuIug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793340128;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
	b=dY0q7b/5iO20y+OuTNYboBO0OzSiMDRtvyWWDNTFzzNCLRYwBuXT19BEDdoV65HixGXn
	 6Wp6JNkJ54Zhnt0rYFnKZC+jkkQTuzJYXSQ3Zs7s8mo2ajgV7tXl83Y44VW23Yon1jNQO
	 JFbpblhJmsLBCdwINnCC1Prny1wa8r4nU7gAmkQotXDOMEdg97FeG5mEMWU5Jj1b2Q85Y
	 RF1EAweygsk6JZINQ6VvmHPwYeYCXQBJb6Op7fUv4hI4im0FrxnqXz11mm2eE9ZQXCMdz
	 4d5yRyBwEzyVxqbMDUlkcjl4400a9xw6Rz3BoclekxWmtg3pyqU9bkngPwGjmaWtu3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D4oO5zfB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bcJ24Dpu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E167F60A2607
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:02:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E167F60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D4oO5zfB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bcJ24Dpu
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F9xY2913267
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:02:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=; b=D4oO5zfB0ukpVjYw
	cTk8tCKl+AE3jcORtYJHG7tWO9ZGjdcduXPIbCVfA+fK4HR4hE0pqpFfVfAdKfGd
	NkI0N1tiqC8IapTi5YOGJcd9F8OJYLMWSdpg2uNY5fX52Jv4Tl7LRYV1jXJJP/a9
	OchfynMmeE3qJmKvCDiCHKxi4iQQY6iq5r4NQet6TJvaGm317DgJVUvOzdSo77J8
	JhKs7vP70ldaeOC5d370wQH7GdyJJAony4kk04FIW1oyHjsrgIeDGTKgOz3WZQiK
	W1VWuCIxKTkMTpaqyV0p+CAE1XmCMOeNJpnoW5/NRoHzdh1CgJwrpx3RdOftMIBx
	VwV4rA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qseqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:02:06 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdb061cc4dbso330670a12.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 23:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793340125; x=1793944925; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
        b=bcJ24Dpu3VB3UBuyZC2Ff2rkcbhr+Uf1bAZtfXiHaEN+R4947K/4GZUNNzjRVlR0bF
         k5S7KaO0O7qQ5XuapExgzzlrCW5Rk5qvfsh64c1qGRvyolRs34bnlDq41mE5i9qVQZla
         fy3gCQestuJeTexIeXNErii47PxFx0wWLrTWvNgRBT3M/8r1H35gzZ3Xwljg1SIcq+Xk
         6O7jUvJ7FXbhSmmNnDmL5o3GMQQQWK+PDS10f8YqFYsT+IMzomfLJ7DmjJzUgulxqyl+
         t6G3km+fKL1T9pFnyf2m7LNtch3cU/HJVEmm03TNnfH3OrdnM79w1MVE+QMK5C6m3lgz
         olXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793340125; x=1793944925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
        b=C1Mb/9Y/HqkrDQL9IqoxRGJBc5c6wLwg5MSgH5dLKOEIoHHi21NWUGPgYzrIqls+Q7
         n07ptHNd+Y6nYhoNrgXxh8ohZkO2dRf4v0stOmGg2eEhX3muQUGVv49SVZG9SDDpE/Cm
         yean1/p6EMbUPfyrZ1rbJSJQWst++YDKFG5CgUCEwttc4PB+P/c9RG6Zp1MSvhBH9BgR
         2GhF4rwReaC2NL5e2EqaUn+AMGJUZ+ot5T5yCcXSNyTI9qZgghDrTH5eOQ0isp5uycEq
         uWc9L+9GBEKidPrRzERDhrW19lyJg5/ztven1C6YNPNH4A0KmPIGeeV+punq1GLVgTgJ
         iQRQ==
X-Forwarded-Encrypted: i=1; AKwUvBzaOBRBisDC+R+nkVbZfVYrOHrFt9RuYRoq8azlaft5F0wQQpBFsBcO+FdEQHgxsgm6us/6Hv4OJjrG@vger.kernel.org
X-Gm-Message-State: AFq9FYJjwqg63Kl3+thvuzPQLenOeRkuy3nSxJIpG0Z1adDjzK8b/2nz
	8hLn7KbQ4ILU+oCltW3Ncd7KYYpKItVfBqO1Ffr8NdJFLiXQtaZN2umULGu9AWWojSdJRufLfE1
	Uh+Rvlvb8G15RtOIAr76SaWLj98uy/zhkei769pmMGrolHX+r+5R6VMaa/ypyjznQ
X-Gm-Gg: AYBFou3zPjnonwkYEJC943/wLV355mzA/ihfah8ZFnxknnkZSvDjT9/lryJFIkqsi9V
	J4gVKxNR88F/XxvSZy4Lhg6CcAStsH7aUkG0Gt0/lGI5s2RxFF53GIrRYUoRUo+Cc3kTR9EAtcf
	TawKgiJCE4ywEQ1PTm2gowjcAEUHQeZR9cR6zJoeO5qOGvZ7bxHQu4w5+fqeACuxXj5rPsxZ0HM
	OY7IlUJgeZ3rYT7wiQHruGGQBriY4s40AZ3wJWwXPJsOrCMxnRPeaQ/jFRF3DFcl01wefVF9mjR
	35CxX9JAjPLtOlAKHvsnocGl7LtCiSiFuNew4PLwLK/2us41b2dCB1Clrk/tmD7cfZVzEhY4+XB
	JF09wk1iekwAauUakrhCqn5Iblyhll62SF+v7Xcgp5ieL9svs1shQHeRojOhE5V3+sIB1BnoE3u
	o8ny7up2N3BJFc9dhmomxS5mcip+vpOQ0FAzsO
X-Received: by 2002:a05:6a20:7d86:b0:3e2:78bf:63d6 with SMTP id adf61e73a8af0-3e913d6c56dmr3755869637.46.1793340125029;
        Thu, 29 Oct 2026 23:02:05 -0700 (PDT)
X-Received: by 2002:a05:6a20:7d86:b0:3e2:78bf:63d6 with SMTP id adf61e73a8af0-3e913d6c56dmr3755846637.46.1793340124566;
        Thu, 29 Oct 2026 23:02:04 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb09706f01sm252292a12.20.2026.10.29.23.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:02:03 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:00:31 +0800
Subject: [PATCH v20 7/7] arm64: dts: qcom: lemans: add interrupts to CTCU
 device
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
Message-Id: <20261030-enable-byte-cntr-for-ctcu-v20-7-bd5c3ac9f916@oss.qualcomm.com>
References: <20261030-enable-byte-cntr-for-ctcu-v20-0-bd5c3ac9f916@oss.qualcomm.com>
In-Reply-To: <20261030-enable-byte-cntr-for-ctcu-v20-0-bd5c3ac9f916@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793340078; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=5Dgum6JnAYvNy94FsJPuCnHsZTgptoysTqIYu+BN7gI=;
 b=JfkIeEFLPGzKUpG0HRMgkqeOptx9ErA+QuK8jh3YSakUhmfAPmYeCF6CMtBo/QwluH/Eyd0+O
 jXmEfKT2S3qBgkxPuXok1OqX4eD8wBAkcfh1cGtpxBMvv3/454koBsT
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: flo9cCIAWHGcgGMIdxpEpfjjWjmkm_n5
X-Proofpoint-ORIG-GUID: flo9cCIAWHGcgGMIdxpEpfjjWjmkm_n5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyMyBTYWx0ZWRfX5AUW9h7y30OY
 mIk9yL0klvc1nNbc+SQWC30R16pHQi5KBMzmPEw+5J9hbRWdzh1EPul2HWK5f2YW7Mu+ftXiRur
 IfIzyXpzAX5WJ3BBLpHzNGDSGoQsA/iZ/ulLj0TgZOezTFAo8i7un8U3t89mLn6DrdMnR5kqtzl
 vritrSRjuneGtKHshaDb9rmcgg6aLeEO3w8ynW5Ge7OVzLdO0O86hRixeLQYz3FzjMBIYV276SU
 Mav+/gnKDTO2HSRR9s0IqElIZfnNXvQeVCE8Aw53BOUl4krcoYsV4CGB3xWNJzzz+SzN3VOkh/f
 Ws7rahY7VZaadLk/MyUTN9bbVsE5JBGUTJYW0Zh/Uqp+6Vrfm6316+UiKIBPl9j/LmTtJFnin1C
 ZhWJc8ZlC2Wr5AKtQ6GeO6MupY9rA2hugAxzk78jAi4B3rAchPcPBaTqyh2Ang9mscNFj0NuejH
 lX0cdzZJkI9OQjVbrUA==
X-Authority-Analysis: v=2.4 cv=dPgzC+Zb c=1 sm=1 tr=0 ts=6ae432de cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyMyBTYWx0ZWRfXy8U1o8Ha2Ely
 hRF5qksrsnvD5+UzdRe35Owi+CouTesS2LhhwQrJ+3AYtKX16ul7YXizyWA8TnuuwJHRjqqSwwa
 8PT9kgEKV5BeJCsFA5lAzlWC/222xQA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300023

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1fdb72fa5518..852a1142100f 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3132,6 +3132,9 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1

