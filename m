Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794523186;
	b=A5KuuQZZj3F3l6T1ez4aE9nf87tl294c086vhMDlCmqnoVFFyZ/GToW6Qclvt84jSQu8
	 SpHJNRuBiuoljM3Z7ClDV+ARdESkxN18F40l5S9VnthPjXy1EYt+7CCgmrjfIIohwjo2d
	 //SP4vEd+UGBWmXf11EwR/IlQ39zOYicTNGo0F866pnBU7lSIbhs9zefUtt9z0Sh8f0Ef
	 JjmJHDnHpuBFt0VV0KhZPye11CaA4d72JZmEYiQdRu7DCmH8isUr46gJflc++/Q6SLkO/
	 uN7k0pu5sptw0Dhv2wqE+lD0s/q5gLH4RID+cNMfbrIW5qxfrh5uuO7kZ3YmwgU8NlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794523186;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=L2FQwINb04s7mJ3OBtOg2oqHSpYWCSQGkL/MPOtCiMo=;
	b=2yfF8pijINXk7Lfz2BUjtTFe2BwFoGfCmpDofN38j9ZVUU3HtPkVkpa2IUA1PELe3sok
	 ngPXkSemKR8mNbvejNZtvAmy3KzrE4JHmwzwe73mjszb571tfN/DiJVeyConuZCKR/RT2
	 0J6z/N0mXFgllkqFzvCrcDVdT/LjDwIlPbOYqNYiGZ6BHollLt5KdBBFz8XwJgnlkejV8
	 6IH1Oucdv+RmbGSMlrIrU/K7iSaDuvT2f2T0BzRwC7ynURAgfNrKLTa7Yvk2W1jF55/oS
	 3DyfxohNTKh5uF/JN+UsUq+5cl8c79PstFv0UhL+nKJDgl8GXGwSd8fs61he5ABF2cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q3xZNhkB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dwzFUtuJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0FC606A896
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 22:39:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC0FC606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q3xZNhkB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dwzFUtuJ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACJZKo32118164
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 22:39:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L2FQwINb04s7mJ3OBtOg2oqHSpYWCSQGkL/MPOtCiMo=; b=Q3xZNhkBWFe1lWE4
	AeuH8BITv502qgQA/TRAo211X9vwsHk+KQQlAR14tBWzdyvAQPKufqKCH90hoe/S
	b/wTZ01ZFma0DSVxlG7EFUhW2NCf6x2I+IL8c1N4leJhK9YWc6opA2O53L/+nDtD
	zX5XHeB1lhiF7COt3FtfX4JJZO1EudxCiIQDj0aBz/TcJUxmqXkPS/G3Aavvy5vO
	/u552aoPrquOBEAIYJ6a4rKMDpvq67mYgVxTPuJOOkj5mn5+VK23ULSU6njl/ZZH
	0GSuQj6pjXgjDBjMWdXnHo2rrkA56S2hkvCjhCANCACcX4l3Gl7mIpCLT2PofdFu
	C0m9tQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkfdgkkq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 22:39:45 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-370230d93efso1400156eec.1
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 14:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794523185; x=1795127985; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2FQwINb04s7mJ3OBtOg2oqHSpYWCSQGkL/MPOtCiMo=;
        b=dwzFUtuJ7ekdHlCB0W6m4FY+Tv/N3J/oXG1qgwuVTWz72d7htWNEnPF/UU0HqI/KNt
         enO0kjufy1EFhnVarx1pOl46rHvcJJkiMlLyAWF33O2oEWoHZddiXIcfIO0fizVBzPkZ
         HOAHB076y8it1Td+OsGscVrarLk4l8yyMMDPuLgR3SE3u+ov0qmvLElgrixDBjQMZjiU
         EE05vYEVeFFB89vEuRxcZo3Yh9Xo9QgC8eeLEb8NS+UPOW5fmosNOsWhEsNmuE/+/rJE
         G+jVJ2lvqkTq70CkpdJazFS6X7PpmViHMDj0wkSKV/kBr/tQNPDeS2C6SdlN8sW/Df+n
         uydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794523185; x=1795127985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L2FQwINb04s7mJ3OBtOg2oqHSpYWCSQGkL/MPOtCiMo=;
        b=KPH8+vReOpuvthqQlw8u03ViwSzVf5Tygv7zNA9yTLc7sIt3sXVTCbS3h/9gwchlnC
         KX1KurHST2SEbu2+US4aVAIaRPW9yxXjIgkpvQ1b+mJElOaBd7CmB2wphJkO5DdC8fsq
         XveO/XqV2j72NkqylEmfzxl7eXxQv8Tr7f02Nitp6BLwegdklzfzftQo860YXy6INbDp
         H2Tz5JUzRrFel+iM0L7A1I7b2mdvHDJ78zW4SjAWVRkPEOQnv9ImVXda4y8inwJKoTeV
         EQ+I2ywAwaAy08G3/7pASl6PE/6WKvHd5UiVNHS9S01IxIk+OdrQdm3pcUb/3axis+/0
         yujQ==
X-Forwarded-Encrypted: i=1; AL+hErGIa+B5qdBXo/sEvDU4gkMH5sV2EUFr3iN5eFF87q1dRNEbDRGMeztm2hl5BpNe8E32pNml8cmRvEKA@vger.kernel.org
X-Gm-Message-State: APuU4Z90Kt8PCctPYZN+DJK6vqtEUcmlrjsYeEs8nPh9/+A7OBQxKCb6
	FmWZTp0ITzFIIip85izvOqAHIuzJfUluPfCOtcyijGLymeHYMVXSJGei/CoKY/WoFfxjAFT063E
	ZhaLmojLB6lPF2waWoko5L99oJHBXqavf0gxjDsMMG4GQHcBOKMPQiY/YqpuRS3h7
X-Gm-Gg: AYBFou3EZBPzjb3QsVl8mdC1DMaAW5Mj06PNzillAOpwdRRO7htb3sVA87U3ECFPkXV
	NarHP+2BgoKt8nlpV/No1fp+CsdaoWrp+vMixwohtlScw+lR7NAMGODYz+4whyyMiYW1g6zdCru
	tLV9piCiTDWm7ahdQc1bDOpVetYw7YsjIfkP82mmWA0XTIB2GqXKKSRsEW3OKdgGpdoKX5S879q
	Y96Yxq5zCXEJMJuRBzHbRUuyfon6zAordTwnelhpi0h4D1QOD7DTqZgNKToIPwHUzQuAXNVZovt
	Ac8sJXwMiPPDwh+DCaTsiWDLUCrTK/SxxzN9/UPnw68ngvrYnlOP1kujyJfWXxny+OvKW6eoieF
	ZMtXbio7lc/H5Zaeo/BCsN5uSjOjF1MBRXjBQ98mHuuinRCcz1fmLrSiH2Px4HJgXrhQNwGYCc1
	MTXoJmNvWMow==
X-Received: by 2002:a05:7022:f503:b0:166:b307:5855 with SMTP id a92af1059eb24-1b502fe3953mr895771c88.0.1794523184512;
        Thu, 12 Nov 2026 14:39:44 -0800 (PST)
X-Received: by 2002:a05:7022:f503:b0:166:b307:5855 with SMTP id a92af1059eb24-1b502fe3953mr895736c88.0.1794523183996;
        Thu, 12 Nov 2026 14:39:43 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm2333496c88.5.2026.11.12.14.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 14:39:43 -0800 (PST)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 04:08:31 +0530
Subject: [PATCH v13 5/6] arm64: dts: qcom: monaco: Add OPP-table for ICE
 UFS and ICE SDHC nodes
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
Message-Id: <20261113-enable-ice-clock-scaling-v13-5-258dc817bd63@oss.qualcomm.com>
References: <20261113-enable-ice-clock-scaling-v13-0-258dc817bd63@oss.qualcomm.com>
In-Reply-To: <20261113-enable-ice-clock-scaling-v13-0-258dc817bd63@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <mkp@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA5MCBTYWx0ZWRfX/Ez3k+teKiol
 m4HeyoSXpz8ZW+csZd3rk5vHYcEoi+VsREYWYOXFvoypukFcFVia9UXHLe+n5xLS4E8SKoRqp+Z
 TYoDD9VuCQUGgKLIHqBk9fzewm80iig=
X-Proofpoint-ORIG-GUID: UlmYGp-JdXSenbDjGp0RiQC4-X58ZcKl
X-Authority-Analysis: v=2.4 cv=DoTDa2/+ c=1 sm=1 tr=0 ts=6af64031 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=IFdraIdqUsMg42QbtkkA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA5MCBTYWx0ZWRfXz0q6Do/UleaI
 2Dp0B+mJnf3t8kPtSr4iYWMs8sHJjkJTE7r30xsS88fwOn9t0k1GnXeIeqT9GZBIIUxwMX5XiPC
 AwsLqGABGw1HEi5EGDA3YV/KVCvWWp0JOdugLPQ7vxbI+rdsDf00/6szfZQUcB0HQ1W8DRP7QH+
 AYgt8Bs8u2q+YgXLREgM0jOBfWL/ujTLuCR0T6NutqaCKjO1hP2O2qhFfyTVSamJz2MTVTVSm7f
 z0C92tYR1+iONLeqTa5lr4TAhvPw8lJeW8+wzx0+gX+ryf3ftkF9N+SaBixubjcPrpKmA6EI/NV
 t23Z7hYUyR6NLdr9kNs0AMLOLQdBLcRx0dNs9XXZ4AyJHGeLMfVKBq/Nz4rCt9C6Vj5KJ/IuFrL
 0rgyZ7odPCT1rywE5liB3fhNSYek+nfSI/rYfG/WAlFhGgn7YgRUhIMbOBtgDhg6rpHmdOmj39j
 pCoRrXrTTfV4bb2sjrw==
X-Proofpoint-GUID: UlmYGp-JdXSenbDjGp0RiQC4-X58ZcKl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120090

Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
an optional OPP-table.

Add OPP-table for ICE UFS and ICE SDHC device nodes for Monaco
platform.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 37 ++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 3541313a79bf47fe27499f6dc370cb778d780a08..d7e2038854b0bdcc91d65d5712290c690e772258 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2725,6 +2725,27 @@ ice: crypto@1d88000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
+
+			operating-points-v2 = <&ice_opp_table>;
+
+			ice_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-75000000 {
+					opp-hz = /bits/ 64 <75000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-201600000 {
+					opp-hz = /bits/ 64 <201600000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-403200000 {
+					opp-hz = /bits/ 64 <403200000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
 		};
 
 		crypto: crypto@1dfa000 {
@@ -4890,6 +4911,22 @@ sdhc_ice: crypto@87c8000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&rpmhpd RPMHPD_CX>;
+
+			operating-points-v2 = <&sdhc_ice_opp_table>;
+
+			sdhc_ice_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
 		};
 
 		usb_1_hsphy: phy@8904000 {

-- 
2.34.1

