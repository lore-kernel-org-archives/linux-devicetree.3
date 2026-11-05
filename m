Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884087;
	b=gyAWGozGbviFUXU1U8vyoPKWPvWnZwas5K9FTKpiC/6FKBeigCrx5I01cjGwWxBudDSu
	 C2xdjsK3WVixE2wy2GyNUhXkaq4gbCLSuL1qxfCFKd27S2m1cELU6UfAMZJoV2V60bf3N
	 xNkBMhNhPh2fKCFvwafZMZl92SYAcJcWA7kd532DOcLNFxZQiNJf2QylyZLDVVbobj0vq
	 HqYluhNnHo5f1g//5mbhpo2YottMnBLr1IhlOni3LJV4uffXMMHdYJUWuHOAKg28QESdV
	 TYTzvUQVZ1j6u7CNGwMhTE6KUE6NKfiro/Hh/B08ub+6kiRn6WeBYTaHHvqrBJE9F4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884087;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HEpBBwY4m5scDgU0RA4B2noBF/zAsH0ctz5E1VEmcHc=;
	b=y2kFnIUfHv7egMIquysN17GHKixUMFGR9kuP5Y/VLFj7v3/u0uTjkdSpF8egI4htSY63
	 XYvJAKrwZHeI/5Daah0UBqH4gJmdNU6kBmyOTkZhQf45oVHHWn5qicZXpO+8JW5+qX0oB
	 SCOoxsAzu9pgDGKUO6Zw5xTmKQcM26kX+q0hZyE834HCE4fZR5jjeVEWUtwrX7Q8hNyYi
	 mxU9oxAo/iU5OGzBu86wo3on9in9FWZhyCQVYBAB2VE2HiUjyPrg1uaJbQfaYvlQYwbhG
	 RMjVmJTIzYhGWLm3KnoigCuJl4KdyPte9mFXMGtzDvRVTmjAuJUbnPlA3z7K4E84d3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Of5qfoBT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JVnLdgok;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34F7606EE98
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 13:08:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D34F7606EE98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Of5qfoBT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JVnLdgok
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59thKF3532088
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 13:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HEpBBwY4m5scDgU0RA4B2noBF/zAsH0ctz5E1VEmcHc=; b=Of5qfoBT2tN7w9SS
	eTfmrVcEdQLOeJ91QDApW8Q9Q4pmu3QFKUx3TLEJMqG3ONm5Yy57CYpyoFrobkJ8
	WtAWOsYmjaf/la3Zb7FvCsf4hcgqFv3zc6krJ+B1FlKFUNSzdRXWUkIlhhJstMKX
	JgPQoaf1ghM0u5rJX/6nx2LBSeY4+HnbiEj/HPSHHXGnrbT/N1VqBHcHnRiFtkGI
	+q4I6AmA79Lo50xLbVWEqTa7pGGOrq3uoxT+Z+uxXUgGBq+z5XIPxisa1r4NHd5B
	yTP6sCLSh5MuVT3lUBwe/x9CSG4t3g8UxETuoILb7cfw7G15prvoNHD1aCQbwnNY
	dW6aKA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrksq9s04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 13:08:05 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b30ffeb2f5so28304677b3.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 05:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793884085; x=1794488885; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HEpBBwY4m5scDgU0RA4B2noBF/zAsH0ctz5E1VEmcHc=;
        b=JVnLdgok5agBSKZUB8toVIcyAUIyoPGRkwTKUzo/zynSPCs57SRvRc1QXMB0/rvgnB
         fLYq7g0f1WllPtPCKQHPYti6wv9Ijcky9mCj0qvatvuJX9pd5BQTNhcaT1Lwll4qPqsC
         L3azSHHHaumB6WBI+XcpeNXGvd0q1udenIuG8dgA4F0Ok3+rDYJiwtMM99u3AeE9SmEL
         5Lz4i0Lr6zAnyYCT+zjA2LVJx9MlCcxkvuKOqLmiuXmoAsw/o2PY3FTHwIFgZvl9BGlV
         ntat4z1wwuUyFx86Yq0NLRr3DTgx71QUmA1XL3hNHlyTdCN1x/AebzGB9Aecj9Fm4TGH
         w3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793884085; x=1794488885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HEpBBwY4m5scDgU0RA4B2noBF/zAsH0ctz5E1VEmcHc=;
        b=09OcIE1f73FSTBouGL8mO6sd3LhXT4AYX+slwa08vATTnWfhcMHeUlPKnKXWeNI7Wn
         XRDDWhKcgsAAfUiBokun0jhD+Fm+hI/8/1etRyihqytPbuy8JzFR5ymITwZreiH831v8
         I7MGHu+5oxYhYsS/PJXN9zOxXkQQu239vx9fzH/rjZLDxkiPv4BgyZCoYGnWXJnimcSh
         soAZX1fSE1rJu2WvHLmirvF/Sb8STyMU/f9dYjiNuH54SVHYz6MtxWCHzhZAnZwlWMie
         I0Ny5+dwl4+BfX8yzm+hRX5Npn62Z4OfVYg+AWCPvqZy4J8Jpnq9GeCZajO+ZNq6fYoY
         3BtA==
X-Forwarded-Encrypted: i=1; AKwUvBzFYt7G616vAzEqWoINDBPhE4mrmYDnm1WtASioP23NVvq6xbN6V+XSOepk140V65DpWR4+72Wu9LWU@vger.kernel.org
X-Gm-Message-State: APuU4Z/PJe1JceFc8YgFMoah3CStZZLems+T/+RDEikfaN0aA75nf1J7
	O1RzAd0B0Urhbjr8ODuCoGh3FxIeMVbzOm5RM2oOHJfAh0+ZC5pkHdTBT8I9nBKwCTx9gpP6I/x
	kSLcUnFa3hiCfz9UOTTJeU7sI3Pf3dTpomSGEO4x6h9AhH5GnWZ6bYmKUXZb62vgq
X-Gm-Gg: AYBFou3axs1YEZX1ySqchw/ImvVO6A/ATTZnpp2ODu+1ogePy3ZyKl9x7txMM48IUww
	sSuUlfv2OMON3rSsD5BPV3dkNXrJxnUwhUcExpruonyGih1+05mk3JzBL4s6L4OaaYnfTVG5vLX
	IWvG6wfzFvweM8IqCnoa/A/OyNo4RWZBTNWCopHwC3dGVyJGDRJNWL60imnZ6j/FAvMzPujI3YG
	Fw17NkmBwaXN/4/WHr9QStg0M5qS9TiVO5nzZDZLtIaqHfM6/cMYytawYjZfNpZw1rrYVU4ITds
	b0m12m5INWxbZjlArPbBzSzXzPkbxLSKkoDoFzj84iDpHG1cJSkFnW/hucbOzNqa8yrxUOiHlbO
	4OUynm+MuJ9osZ9GAiDNQ5TL59LHbvmkGwuzSQ/gs/TiuBNa0bvn4je2/y54jdOGQSfVUvjpAw0
	SXI9ZbjTjI5HLL4kwS
X-Received: by 2002:a05:690c:4992:b0:8b0:e680:616a with SMTP id 00721157ae682-8b2b66f45dcmr147056447b3.24.1793884085053;
        Thu, 05 Nov 2026 05:08:05 -0800 (PST)
X-Received: by 2002:a05:690c:4992:b0:8b0:e680:616a with SMTP id 00721157ae682-8b2b66f45dcmr147056237b3.24.1793884084340;
        Thu, 05 Nov 2026 05:08:04 -0800 (PST)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b309bb4406sm38915937b3.40.2026.11.05.05.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:08:03 -0800 (PST)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 05:07:16 -0800
Subject: [PATCH 5/5] arm64: dts: qcom: ipq5210: Add NSS clock controller
 node
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
Message-Id: <20261105-qcom_ipq5210_nsscc-v1-5-d4fcb5c32b51@oss.qualcomm.com>
References: <20261105-qcom_ipq5210_nsscc-v1-0-d4fcb5c32b51@oss.qualcomm.com>
In-Reply-To: <20261105-qcom_ipq5210_nsscc-v1-0-d4fcb5c32b51@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, netdev@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793884066; l=2069;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=V7tk6aEtOPhfOk+VPI7cIHGev2spKigLOSXp8SeaGFM=;
 b=NQZ0VnXNNs5TVcS/GfGIp8OMqr4bqDVVREAqgfRdanu4y70VLhmGeYPMpHa85TCG6ztA5t6gu
 bw6K2g89zZUBmx9UG19aSrHFqkgmyhdbqNUcRDDR5s47APAPUsRdBd/
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MiBTYWx0ZWRfX0Jl2kJiEx4h2
 D4gDnQmRPsbaegItMem0idAj1HWWA3cqewGQGRTGOgKnAB4uT5cXnfHix/dPeQ8gwzEh7ERszu/
 C1qqQcWvFEwMJw85D5PFbG4igChUH4jzXTMuXK46+3azx9BLBjSK+efimUuPdWhlcL7k987GwOW
 DRceWrfogYVJb9jljlTKFBckV4LO+FXuD6A9z52aXXkMlecj+U/EEvbBN577lodTT4aMYwCBuMK
 EqXOLKIjUgeZt80wpWFIfZKm1P3veMl5+Z39xPE78k833hykFgP0VTyb0/yoM9LWIq6b/DR3JnK
 88KPKxafc/3i5kPXcDWllVa30M4Dm200MB66CHOIrQ8ayPwsFMsoaSnPERUBw5FPq28bxlc+mIj
 JeVbs4Eyn55da0gqQnpo2OskbrBOaBW1OR20awCIAnKwGkPl/jodO5be8FU30z12CQTHgcndmAx
 9jNubDuLSovor46Mpmw==
X-Proofpoint-ORIG-GUID: Npna1Ij9EKr2abawIZMAzO7zCW4koqrd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MiBTYWx0ZWRfX+Hifj86nbg8c
 89xzhuOchIOjtIhQEtTRR3dxwJjkyld9PR3nzqjRe9UumhhK8WLicH0JsgBsGsFGTeSdqiaSqsU
 Zcl8tWE0sQf/9aErdqXPPp6IoPhmgBM=
X-Authority-Analysis: v=2.4 cv=CIe/zhrD c=1 sm=1 tr=0 ts=6aec7fb5 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=6SnK136Pe_QpXSRpRBcA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: Npna1Ij9EKr2abawIZMAzO7zCW4koqrd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050052

NSS clock controller provides the clocks and resets to the networking
hardware blocks on the IPQ5210, such as PPE (Packet Process Engine) and
the integrated EPHY.

Note that the CMN PLL output clock names are reversed with respect to the
hardware block they actually feed: IPQ5210_PPE_CLK is wired to the NSS
hardware block, and IPQ5210_NSS_CLK is wired to the PPE hardware block.
Documentation is added in the DTS file to call this out and avoid
confusion.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 40 +++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 0c1ede0f73b2..11915f8eb156 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -331,6 +331,46 @@ frame@b128000 {
 				status = "disabled";
 			};
 		};
+
+		nsscc: clock-controller@39b00000 {
+			compatible = "qcom,ipq5210-nsscc";
+			reg = <0x0 0x39b00000 0x0 0x100000>;
+			/*
+			 * Note: CMN PLL output clock names below are reversed relative
+			 * to the hardware block they feed - IPQ5210_PPE_CLK is wired to
+			 * the NSS hardware block ("nss") and IPQ5210_NSS_CLK is wired
+			 * to the PPE hardware block ("ppe").
+			 */
+			clocks = <&xo_board>,
+				 <&cmn_pll IPQ5210_PPE_CLK>,
+				 <&cmn_pll IPQ5210_NSS_CLK>,
+				 <&gcc GPLL0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <&gcc GCC_NSSCC_CLK>,
+				 <&cmn_pll IPQ5210_EPHY_RAW_CLK>,
+				 <&cmn_pll IPQ5210_EPHY_RAW_CLK>;
+			clock-names = "xo",
+				      "nss",
+				      "ppe",
+				      "gpll0_out",
+				      "uniphy0_rx",
+				      "uniphy0_tx",
+				      "uniphy1_rx",
+				      "uniphy1_tx",
+				      "uniphy2_rx",
+				      "uniphy2_tx",
+				      "bus",
+				      "ephy_rx",
+				      "ephy_tx";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#interconnect-cells = <1>;
+		};
 	};
 
 	timer {

-- 
2.43.0

