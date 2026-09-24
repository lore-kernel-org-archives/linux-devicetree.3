Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3A043711B
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 07:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790235202; cv=none; b=KnuernYUKTfAB1OefQzAfTXmJ5qx1VV5oAI4QXwt21E+kWi5J5TGqPUXc5gVW1TAjSEkjQ8f1Dm5V9JqvB7ltW+kfsFLSc6/yClJQxWFwRYak3qHhQiwA8ms0/Ol7pHJ3uKnjFYgL8ZBjdjoB6SXI2DIp/Xkhwdpvm3la37yd2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790235202; c=relaxed/simple;
	bh=Sd8ko12lfwONlCcznYPvoJlYpUMAWNhjjnJIIEHRnFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VV9VGnb4mPRxbo5rPYVj4jf8GOZ7cF/jaBllTutxYaNSa03ArVs7Pv7TLHKea98Bj4q2Ba8fwCg8vHmTZGkcwuveN79CS3OWdtmriMu1Z4T+fK++QZAYtxj2SB7fwhXQGdrqo+j+KBkKj6OFTJ7dO0WJRwlHPLWDXWMiZRzy2UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YZT2aiFQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BxQeR1Fm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YZT2aiFQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BxQeR1Fm"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eMYp1278341
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 07:33:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OsN8WUHcJgQ
	l5YkVhfL9wmQjQE/E209DMgaGB2AxKKc=; b=YZT2aiFQ/STPyEvNamjsX9UjMLB
	zUvM1dROsRAAyI/o0a8Z7mR6nYD+gKO2+g11kkFQkav9qsylDWvKSBmtNl7VmnGT
	s/XFXy31dsluixCb5uuQ040n8vI5QUI1Iy5oLE0tJBoY/JCONYWyCN936TFy7IpW
	mjTsIOSD9sgmAmdUA9uyNpFs1I6565ht8WBFz18s2+KpHtoJkL/Mm2Q+4iDADNPH
	4QwP0xrhq3JDc8snNxj+6w6M2yWPy/QL89IELeql5E2HZGo6fdVAo+0g9zlczC5Q
	atRtpEKzBoGqusM0fYWI4UmQVfmaQuEzn8HBP03F5yOJQ4WsS84cdyItfMw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvhsb37bq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 07:33:19 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3284bbaa89dso1497711eec.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 00:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790235198; x=1790839998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OsN8WUHcJgQl5YkVhfL9wmQjQE/E209DMgaGB2AxKKc=;
        b=BxQeR1FmOcLT0hQkRi5x0Vw7HGdqiU6nv/RV8c2s2DG4dH8PDcr8Bz4lH4JKNdd6hn
         0ywJeOsF0QYrVJX41FTvtSpEFR9SIQE/NjgepfsdUgxB/Lpqg0/5pduFziFWZTq2yRsO
         ep++E5ST5r/3sqYzbbln3hQ2L+/3IBNyi+14PSROy5S4+a79yiK23EKuzrEhXRv745if
         hJ2rOrJycsRCyifz3JvuwCNY8DGFxYCye0rGeH/IKQcGpTRDQWKFvCRhE/KLJ9itVP3l
         jXz1B1rzJFVbpkUssWQoinbpTWTbr+LytIuC0deGuWtlT6czu6n9V8WaT55PKnb4njBm
         9Q0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790235198; x=1790839998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OsN8WUHcJgQl5YkVhfL9wmQjQE/E209DMgaGB2AxKKc=;
        b=tzKOOfOau0K7VkxCXXyVaxuvMpKPKudD391v+W0O4G8irWE7htcODSsHs9Ijedto3h
         46E+4jTVKqSuxhaSjjuEJnGU/oJcm/cNG79+WA2Ph4PsHaiV68q3a+1ARflEq4R79SVO
         1VfriIUC+VbAKbW2EbR8ISzOpar4oeBl6Gs6ZvTT1PGCkGnD/SdBABxN2oJllYWgeYPA
         EfCoq69h8AQ+5U265wJYFuB8oChanmhBPWWu72tJhXTnAc2kqztC1cqAJgCFW6EV993l
         N/9Kxqxql1s2InnLqGJhKmdsO5AQ8wAMYhPN5DsP8/kZiTG72j2gxQt1OiaJ0MMhF5/j
         FJxA==
X-Forwarded-Encrypted: i=1; AKwUvBxNWSB0s2LBWjiDl1uYGARlJt4NlzELk2pRjghUzyGsdtbogzDxPAUqjLysvWJgzhwXmy6UNx4XO4ah@vger.kernel.org
X-Gm-Message-State: AFuF++lgSfJtE3IcIGk3gcsUJKJWfvxOYhXs6Xp4efV4wkGdC5tID7nV
	CFsyOoy+GxMs95P4D2wWC7FXHlXrOwN8woEs6DcluO4V3F256mUWEG/GOCvuc2rtcazCMnWBDVe
	E4a8a+dTp/IrF4kdF/MG8Kozwx0IjaiiiugeGxBa1gnREzg+fNj3M/AcD2TKgAw0VJzOS4jw30l
	E=
X-Gm-Gg: AYBFou3mz7/YQKXl3gCMMb3oeEvmuDDDrKsqTpW9pQk+PObzlbwqHyaprXuKeHyazXJ
	5E/2ZMh4GgdHqpINC8UY3VNC/uKCPuIp5bQay5EI0t5mHZlzLXPuzA4oWE8eCtagmy9KaVbE72k
	mizbWN97yvSuxLjgfK2F71l7gaM5UjsugPEsweOhYfH3784HnUWp5GssQ/ijR1HRF/19FYoRkRP
	FrN2TWME1Lic1dnpbG5IU7RpDZV6by28Ea5jR6J+fcK04NAZJjt7ymZYtrrlqd2YuhYJdSmusqB
	kRI47bDqmsuLKk3l9TQZCXUH7RKIU1rYagKk2DDJY9pK2HzdwP4dQbUMqYhlkh85wtd5pT0E5S5
	CIxQjN5/zvSHZ1PzPReJzlLaPz40okY4VFlTF9zLXfqkL/G2FahqbIOyGu8s=
X-Received: by 2002:a05:693c:87d5:20b0:33b:bfb7:31cc with SMTP id 5a478bee46e88-34001f1961emr1461582eec.16.1790235198162;
        Thu, 24 Sep 2026 00:33:18 -0700 (PDT)
X-Received: by 2002:a05:693c:87d5:20b0:33b:bfb7:31cc with SMTP id 5a478bee46e88-34001f1961emr1461552eec.16.1790235197614;
        Thu, 24 Sep 2026 00:33:17 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fe502sm11052635eec.2.2026.09.24.00.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:33:17 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Pushpendra Singh <pussin@qti.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 2/2] arm64: dts: qcom: nord: Add bwmon node for Nord
Date: Thu, 24 Sep 2026 15:32:22 +0800
Message-ID: <20260924073222.1000666-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924073222.1000666-1-shengchao.guo@oss.qualcomm.com>
References: <20260924073222.1000666-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: EyAGR2Z-QZo3GL2h0zTg1UnezpQXTApx
X-Proofpoint-ORIG-GUID: EyAGR2Z-QZo3GL2h0zTg1UnezpQXTApx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzMSBTYWx0ZWRfXyEYue8pSj8cM
 RD7+8edJUjRVRWCIzzJtUI9zGIYACGLyBODiiYXHpeBKiLlIKZQsmcXjmbW/OTY8z2sBHR5jPFa
 /IlekVVl98mVwWfMWBGEWTw6H+vT8kJJMqdnpJqcIVQkRjEgtHalZhiW0/CQHm87VteUlmMD/ZL
 hF0Kz1kJI6Lnfe6bqYNWXh5A5xX/sMZ3s2eu7RaUriN4m7TIfYM48s59nn4Bcx1icOVPyCh9Oak
 Ov0KmrgKGUjKoKhuIxnXPBvd39vGIbo7Ug011uEsFjeXCa+5enHq7K8cGLUUfi688/ifrkg2Fu2
 yE6FDAS3Ktm3X9ga5gvALlbnOrqHnIcVuUPBBgzb1y3WtQQDDCPmgNOnLhP+uQk0rXIo1fyulcO
 pIH3NnQsgZLZX8SpHz5LnUZfmZ7GvyyBYy+n7R6SqiTFGTVfBlw5lLkuf5KVh86lIq0WNtAaPzt
 sRF7eGK+GLSdt/RmKTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzMSBTYWx0ZWRfX+urQf25iytqk
 QwHGClf45NYXisienGciv4/rEpXabzywWocnIsS7CyJDd61IhJ4R/W9tTenNbbg0+GlnEaOPujo
 nfjaeUSIKDy7qzCWDljsFUqpld7ya9U=
X-Authority-Analysis: v=2.4 cv=f7vdl+yM c=1 sm=1 tr=0 ts=6ab4d23f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=q7pI7CVp5Wuu0xCWJPQA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240031

From: Pushpendra Singh <pussin@qti.qualcomm.com>

Add BWMON nodes and associated OPP tables to enable dynamic DDR/LLCC
frequency scaling.

The compatible is added in nord-embedded.dtsi rather than nord.dtsi,
because Embedded variant specific 'interconnects' is required by
the compatible.

Co-developed-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Signed-off-by: Pushpendra Singh <pussin@qti.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 21 +++++++
 arch/arm64/boot/dts/qcom/nord.dtsi          | 67 +++++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 568fe68cd185..c27d01a82214 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -30,6 +30,27 @@ mc_virt: interconnect-mc-virt {
 	};
 };
 
+&bwmon_cluster0 {
+	compatible = "qcom,nord-cpu-bwmon",
+		     "qcom,sdm845-bwmon";
+	interconnects = <&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+};
+
+&bwmon_cluster1 {
+	compatible = "qcom,nord-cpu-bwmon",
+		     "qcom,sdm845-bwmon";
+	interconnects = <&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+};
+
+&bwmon_cluster2 {
+	compatible = "qcom,nord-cpu-bwmon",
+		     "qcom,sdm845-bwmon";
+	interconnects = <&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+};
+
 &crypto {
 	interconnects = <&aggre1_noc_tile MASTER_CRYPTO_CORE0 QCOM_ICC_TAG_ALWAYS
 			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index e0496fd40c30..4c3504b2a233 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1460,6 +1460,73 @@ uart13: serial@a98000 {
 			};
 		};
 
+		bwmon_cluster2: pmu@1014400 {
+			reg = <0x0 0x01014400 0x0 0x500>;
+			interrupts = <GIC_SPI 739 IRQ_TYPE_LEVEL_HIGH>;
+			operating-points-v2 = <&bwmon_cluster_opp_table>;
+		};
+
+		bwmon_cluster1: pmu@1015400 {
+			reg = <0x0 0x01015400 0x0 0x500>;
+			interrupts = <GIC_SPI 812 IRQ_TYPE_LEVEL_HIGH>;
+			operating-points-v2 = <&bwmon_cluster_opp_table>;
+		};
+
+		bwmon_cluster0: pmu@1016400 {
+			reg = <0x0 0x01016400 0x0 0x500>;
+			interrupts = <GIC_SPI 813 IRQ_TYPE_LEVEL_HIGH>;
+
+			operating-points-v2 = <&bwmon_cluster_opp_table>;
+
+			bwmon_cluster_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-0 {
+					opp-peak-kBps = <800000>;
+				};
+
+				opp-1 {
+					opp-peak-kBps = <2188800>;
+				};
+
+				opp-2 {
+					opp-peak-kBps = <5414400>;
+				};
+
+				opp-3 {
+					opp-peak-kBps = <6220800>;
+				};
+
+				opp-4 {
+					opp-peak-kBps = <6835200>;
+				};
+
+				opp-5 {
+					opp-peak-kBps = <7603200>;
+				};
+
+				opp-6 {
+					opp-peak-kBps = <8371200>;
+				};
+
+				opp-7 {
+					opp-peak-kBps = <9657600>;
+				};
+
+				opp-8 {
+					opp-peak-kBps = <10944000>;
+				};
+
+				opp-9 {
+					opp-peak-kBps = <12748800>;
+				};
+
+				opp-10 {
+					opp-peak-kBps = <14745600>;
+				};
+			};
+		};
+
 		rng: rng@10c3000 {
 			compatible = "qcom,nord-trng",
 				     "qcom,trng";
-- 
2.43.0

