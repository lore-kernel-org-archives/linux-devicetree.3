Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C06C3AE6F3
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 21:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780955334; cv=none; b=BKCjnCS+7UdWOhNCnXA3u/ZAvSuVdgbBYbNydbFOzfEu7HAPVWAojibNqjMl4qJsAl/oEG1bF16ZSpkHgJRQe5NZ/peSQjrIYuoEeowhTwHBGYcCxSJZ6uo8ZY2sqzwI8wBpWW0aCu/I8RzlI6Hzjrl3cDxdB5691iLcWe1VdrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780955334; c=relaxed/simple;
	bh=X0xXkFgpEGLjkiFblpwO+BnhWlu/bE8cwlCDJSPOaDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PxbYvjZtHlh7sQ2hYR7V87AwG6AQPNkLASFgoHaKBDEx2guZyaCYs5zUG8Ee3q7I6/B0t1bE1Qi4BiJ3NEKvgtz1oe4WuptWbVzz34NY7AtbhKILvfK1DUYiFfgtAYnl2Z86pd7ZD7k3V7LAMJgpNDaIH8DcMS/czpYkUKXi48g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E7/FA1PR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R+CObCAm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E7/FA1PR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R+CObCAm"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658IvCxc4020353
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 21:48:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ETNz+wmmpsdRAuqSqBnBouCW4jgWHavGgQFIoIN6PGw=; b=E7/FA1PRr9ArR/Xd
	a5vofxDWfYZSU6p/vXnqlOW5AXE6w/47OrJK1oXVB321HntvqUio3EkJoOAHgqJg
	aq8BKGzLMwZ74+vbR2xnh14c8HVL7PkK2gFTFJzjNBYU+gggOgh58WOTc9CVI370
	XssHIGkGzxOr93YmNFZsP046AiIs+/iYtVvuHNQ4G8rCfQRwWM8Hg+QZvl86JAd8
	XglC2w0jHxeZzmmgqcuzdbxI6sCf7KDVPylHApm8TeaEs624YP2Qc1QvOQM2tr5S
	2hKhVVOsufXKCkxXLTkb9lsy4VpFurBrBacXo9AwhJGF48A72XUQ9VsX6eIMorV+
	FUtJJA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entrkuc2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 21:48:52 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85c530ddebso2837242a12.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 14:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780955332; x=1781560132; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ETNz+wmmpsdRAuqSqBnBouCW4jgWHavGgQFIoIN6PGw=;
        b=R+CObCAmxaGD8y7YrZd0RePynvltlHQ9JlzpDk3nskfej0vdZt+tRjCaABYsP5whQd
         tLmzsgTn0kgMAgtJSnukzW4OlGaerFMFpeCeaQDidGowpudaENfane/3iAt9gCT+HdPl
         W7J8Wk8Z8xQPBf1IuFw4ZgyYJo786z2A6zax3SzgN31zZFAJKVJLGjiZc3sGywvkWizb
         LvJQBX/rwrkHPfMD3ek6m5PspmIEbEA2XZEheJXeaZDnEmG5ahXb1Th3kSh7pIa+OJlQ
         OCr3mZrU8klbZM53azDeLuOxdaEJl1vamD24slu8QwGpPZUTzCNtFVPNQ9YVZCjxt08j
         fkkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780955332; x=1781560132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ETNz+wmmpsdRAuqSqBnBouCW4jgWHavGgQFIoIN6PGw=;
        b=is0vYx16VUNLgNiQbVuAvZX4Chs3UufDUE0ep1JcwEYfTYjVX35rfMqmpVNaI5a22C
         DmD1fCIF+dxR9wQTBF4vGgXkNk5EDzDujVMkKLU76XPw4oPC1LdVRO1gL0PBifT5h7AE
         gNdOniGpNs0G6+RsniG/VkTKc6VtyKTzAc3j28Aqz2qh2QDcaQKwb3nwsdt2VqaBg5YG
         ROu+OrUgjVTDmCRN6ulQKsgxuCcQK2Vt84UC5dbihGCgoQWwuF/Rz+7MUGLXHacgyYDE
         diALGFYBqUQjbfvMMAP41jDhSMlXSgLCyNMd7Jf/QemLzar5hQq6WTt3zvzJcq1zyf/a
         1b6A==
X-Forwarded-Encrypted: i=1; AFNElJ/2Edz4xly6NQaNol4vnZAC+ccPXCzUVAGfpvNs3DPdyJvV+ombSwJw8nNlzRFIMaTORaSBqtIEKkoH@vger.kernel.org
X-Gm-Message-State: AOJu0YweYk0xcaBuON7qbcPdlYbwk1saWozZtqtWEIJxrV5QiPEUNfDT
	Ub9ujTKFARUiamj4cESsN+CJssi5Pb5w4OPrdBsElePQ6QavC3mv1xsAf8wd9WKY7pWM7fOhHGw
	nRIiwnF+CXKhTdAvDkCQZ7gFlvQa6Rx3EloAVCtsXMc2li66K7iuck2zjk4qxDuIJ
X-Gm-Gg: Acq92OE5xozc3FGeHr4dSw+nD/Rs0vc+cJhaowO98SGCzPkuyChJy49D8wwRJ5LGZxe
	mGCeuEZ7SKqJncn7jYWjzPNPrDM1tIjJUHlMwbcexTFZxc5j4X2AEeJIeNWv/B1sh3A+vrM/k2G
	QqZve3/ejNALWkgdHeoWAAqi4Px/Qhwlkr/+62C/OjHy2HWX7lqidij2s/npclVA0XHl69M9/hy
	UQR890tzbtMfxLMVK/jttfFFHTV7hOF/qujm7cX/AWiZfhxCkZRDGas5D6+bFjerMba1waq11T9
	O4q1RJHibYm7M7owpzkdefd+giPQB7lMpk8vF8+Bae196/Dw5bVwX/MfrHiZgcQDtWLgYpUhl3D
	9XDn912HVBSTlroEyuXXx0MHS6OHqU2nkKfb3Ri9ldP+IuwnKGPKDXz6Z+ZBaIgwqN5raxQ==
X-Received: by 2002:a05:6a00:a10:b0:835:3949:3c1f with SMTP id d2e1a72fcca58-842b0f52ec3mr17760881b3a.24.1780955331768;
        Mon, 08 Jun 2026 14:48:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:a10:b0:835:3949:3c1f with SMTP id d2e1a72fcca58-842b0f52ec3mr17760855b3a.24.1780955331329;
        Mon, 08 Jun 2026 14:48:51 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828cf783sm19607485b3a.40.2026.06.08.14.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 14:48:50 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 03:17:26 +0530
Subject: [PATCH v11 4/6] arm64: dts: qcom: kodiak: Add OPP-table for ICE
 UFS and ICE eMMC nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-enable-ice-clock-scaling-v11-4-1cebc8b3275b@oss.qualcomm.com>
References: <20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com>
In-Reply-To: <20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: IykvzKuKDLkVzoVscXQN-Xb-hmlm9-rD
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a2738c4 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=IFdraIdqUsMg42QbtkkA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: IykvzKuKDLkVzoVscXQN-Xb-hmlm9-rD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE5OSBTYWx0ZWRfXxE5AzoW7MIgo
 fWA0bF7pBhkUnvHybTIsiRkAheyo/TcoKGUin7m4lyV8Quxnu9GQezjqk7tqKG1oF0LCueZ2eZz
 PXl1hjaB29JlfZmUSv6zjwW+XOtAaOEUqNjo9F2+a7ZwnGpd+21eEb/0waJQUIQ/UfMMPYp6hrx
 e1tK0+jYe8odNtfMlcgCTmnw4X3lL2YSLRwCfDrDwxqBubbQsnETvG8IhXsLCSRLzwV86Rgq6w1
 BROG+szyF+/EKbWNW9uRCnzFyuekpMLvsHdz39ZQxQbfzWYoay3gFn6JZlwJ/6NlFX/si8BNCVY
 1ZF/VNVdv/5AmjKG6DYgKiqR7VoC3SCkVk0eDWpmN4O7W//e8G/JfCJjgHCA591JWabXA1KCgfw
 J112j4D+D1axJ1a4GThw5flWA3Eu2jHrj3lD+c2AJm1br+vuSx5Jxbc38/BK+uYQvizjaDFlpZ9
 zcZmfoRXXKKkvda8gQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_05,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080199

Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
an optional OPP-table.

Add OPP-table for ICE UFS and ICE eMMC device nodes for Kodiak
platform.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 42 ++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index ecf4790f3415c46781c8e790d7892a41300ee7a0..cd76da7e49d8c664df6a60b5c18418c4e97a3ba4 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -1087,6 +1087,27 @@ sdhc_ice: crypto@7c8000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&rpmhpd SC7280_CX>;
+
+			operating-points-v2 = <&ice_mmc_opp_table>;
+
+			ice_mmc_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+			};
 		};
 
 		gpi_dma0: dma-controller@900000 {
@@ -2597,6 +2618,27 @@ ice: crypto@1d88000 {
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
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
 		};
 
 		cryptobam: dma-controller@1dc4000 {

-- 
2.34.1

