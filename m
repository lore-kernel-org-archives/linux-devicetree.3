Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7087C444705
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789812; cv=none; b=XeTC3sbGWKB9fkFEZKol2y5w4xIBuKTtgegUB3z6jkuBnZqQbYcI+PKs6FhtCUW5TGsVFU+fZj//T/+9ujz0L7PVN66PUcRy45fpv41pMzRzm4sdl7OThWwHZnBf3KZ6lQpaBRc3dr1r6vMw/xMXIL9kJ0RWhEXCa3EeXgYHkb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789812; c=relaxed/simple;
	bh=DcvFcGV/3JaFCs4OBqUsVk6AV6BrnTuD7duM/24Np24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nI3GecQ6DiTA6uEG8S7bgkG3EqnFYU7CWHKLqYmXpchOCsEK5MAnKPA7SYTvBclD6jpHr3K6rZUVS6O3/4+rQErdV6GJbwnx6hskrJ8i0IYlfZBgVvOxR8xIq7dgNW9LEF5P5GfAOLL+tvJT/P3sFGaEj8Fa4Kk2LbuL2V90jdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GVOwJn+r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hnJYjNIC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GVOwJn+r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hnJYjNIC"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55p0k302994
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:23:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xItEDcgU6Hazp4g6PGqe8cnvisbwpOTtZpc7TG93B1g=; b=GVOwJn+r87iC4Gxi
	hZ0F1Ng6N/gSn0d/l7996zg9jKBSHwdhIxC9Xu9MVgmpQaYiKVLkdz9JQp4mCS6+
	YsSVIMc6LphX5uDq2di8GRQeTfBkGKGhQd+Prx+lCpv+ObsZ/04okBEy664fS27z
	cqgzZ/AKTzwN/ox+qzDufw1NhFgoS2lWwfxg+Ewqa0R59B/M3SCwd9f7k1GGfHHt
	SXGYilNFw9wWSSiP8zG2djMv0YGxs9D2DrDkIbkpK1hxOUqynsN8VXsJoQ/UDiL4
	sCTDS2vZcNbOnYXU4/xm04uywxubtU4goRvAcYxE+cG9CZNZnI4FnsjzN5P3iN6l
	HVGRQw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j6dhhut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:23:30 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35ac5255f1dso2264067eec.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 00:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791789809; x=1792394609; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xItEDcgU6Hazp4g6PGqe8cnvisbwpOTtZpc7TG93B1g=;
        b=hnJYjNICxrF5jjEYCNYajWrGz5pSqv8iJ6nK9CR/+l4czKcWUoUVO0T4Imr4hGZyW2
         md5C/+qT9oXKv/zmqqrk6mjof0xrKk5tc24CSL25ND67Ok9ffNMu6mUtv5IHuy00/wIa
         ijNbOjKVrpM3utOOUm+m3DFjiOTz5sXDO4fZ+C0kkXUZaekD4smKPfAv3NnP2oWf9AEA
         IyI7g0NWx3cOoC16fZvRXcwdWdsR0axeN6G2t/jOjh9sq4ae/5YoIImBDVgyvv6AIsd+
         aoabEl6yg22mcMQBBXSO67R5v9Ygqf9CCMWv9RHRHyo3mbJ7aoQdPbJnTtcUz5+B5tw4
         QflQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789809; x=1792394609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xItEDcgU6Hazp4g6PGqe8cnvisbwpOTtZpc7TG93B1g=;
        b=IkNpjW9vYhi+nYZHPQQSOCd5TVr6cvNMXhcBlw1ng4gvmH8KTMvdVNMS+vGB3Sy89A
         nmFlZ/EvNLfeGfl5FMcHCbR2Lc8II0QJA/eM94I47iL5Vo17SafNhNHtCibNH9tl1Goa
         5X8hS78y1680dd2JIje8H6VBEYIQl9v5HjDEQrxdrgsiertP+2MyMSuLUd/oXlrk76LB
         qOEoMubB9cOlka9HrIUNnnBm6dusRHKQmjdN8sE06a6HZyk/B5U4Zc0mDFvxKNbwHoN5
         gXtOBSiqUlNKcwdtOZeHP1+xG1FJzIspxVRi+4FRu1swTD79FpRh3k2/34PSI8GgAq1f
         485w==
X-Forwarded-Encrypted: i=1; AKwUvBwUgAroHiUdHXQdMadMqTkhMz8FeoiBh59hvWrkqYDezITVyk7Wi50JLFOQ/r+K5DjBWleFyc1Rtck3@vger.kernel.org
X-Gm-Message-State: AFq9FYLUN4gaM2xhJweHp7Rjqd/LAgp0niVoKZAAqQg0IIuaCBN4n8Xp
	eqUxYsBEDjCLLQdEOdsBK1H34jIARcl+dMwZ/2Lp5KmC7atzUV3GTv8z7QztE0zuHz2+5iV4AUM
	UfEwDkyQwnGTvhBXXDLVCYWh3y+X2x5aLE8dqKYdPkospG3/KA2w2ys5gVlzE2yhu
X-Gm-Gg: AYBFou1oYgkDBQHCUaXtyRfZsHgr5zYUgmoUluDwwkILkGbSyEldpa11bqJm3SEBM2J
	UPUWYRK8lcy85NYDRw1zFsic6WrhDiNksYTm1TZAK9x/Faa25MIIQNcb4m0AsVZ/yqpPc7yUARk
	s4Lxpf/KLkXc0a7+7zNdxVZYi9SEQ3RI/Fz/SlWE3n8Ns08c3Ggxaw+FZH3qb9zM8MGIPzbnoIU
	8Y7O1iEBVUGt5wq/a2tC8GNB/ovAw/1jry5JSkf8HxTmk49YuDoL8xGf0KTj5lbopkAGl/sJiHu
	C1t6p6rEjsdva5mwZgM2vLYWzsdF0q8msczPpv6iCCYika8QdbcrYnlAySdsUNqn98dRA+yaraL
	J5WjS8Xl04rHIgqjP/O5vMSfToxeLZ9lussv6rdnpNQFy+Yvf51/bsAGCZlTxXAB1bJ94TrlUG5
	wh1pFRjX10m3kaSeejlt5A61Vqq9i0
X-Received: by 2002:a05:701b:230c:b0:14c:be8e:69fe with SMTP id a92af1059eb24-16a57922026mr12584382c88.5.1791789809284;
        Mon, 12 Oct 2026 00:23:29 -0700 (PDT)
X-Received: by 2002:a05:701b:230c:b0:14c:be8e:69fe with SMTP id a92af1059eb24-16a57922026mr12584355c88.5.1791789808711;
        Mon, 12 Oct 2026 00:23:28 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becf08sm29748733c88.5.2026.10.12.00.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:23:28 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 12:53:05 +0530
Subject: [PATCH v7 05/11] arm64: dts: qcom: ipq5210: Add C3 CPU idle state
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-08-dts-v7-5-77bd3d68d850@oss.qualcomm.com>
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
In-Reply-To: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX3dmV57EkfFI9
 2LzI+iOCHmD9M6SxmRXvSNkoTIqiRSasK7hEzXGijtAUkQzFboyVX1LTJ3MDosPKrnl2pqDLRIY
 5Z+vZcnS/lvxVhWaKNLo8o1XqwYzO6XOV4uA5TwWAdCKY8DhyDR9eWYhriKaw0kDGw+wrSKxbzr
 xsPiO5cKiJZx45JZALKH8mscwv8fz6r1HqCJ2eJemLv66g7TeJC8+RpoXD/BFAXsQlTPW/MMkFR
 TvkZ3YjkC2an6ymBmkYEQA/6F5aSNas6+Zh+l3n7Bxq4dp4IPW9qIb9WqyUN0iecS/c4sLpX9cK
 ylkifgmkBI0LlmG3JgU2sz3FTPwlNcjxjqXroCbJb08reQzb0G4IJCz4S9gsCkLfENeoSWy+sfx
 U/6xbFVKEIy9OmurJGIXcIedUzb/FCiL3FUp1bNvKwZp9hE/1LqU7g8E5tzRIR++KSBzbFRKpQE
 rl4O7rO0oktCvsEJcBQ==
X-Authority-Analysis: v=2.4 cv=aK5lOr9m c=1 sm=1 tr=0 ts=6acc8af2 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=LX2C00z4I0v6K8_64uwA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: z2WsXpBDCHyHpW_68r_9evgTS5syggbH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX+WfzU1HgR0Bp
 0hinz+aOc/sDEE6Rduud6KQKiEzT8kD+qPT4mcCEu1rO5mxuEPkT9o+NoR+2HhF2OXrYEwm8iil
 RCueX14LfYFwq74ac/dqYLuY38+Do14=
X-Proofpoint-ORIG-GUID: z2WsXpBDCHyHpW_68r_9evgTS5syggbH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120029

Add the PSCI-backed C3 idle state for the Cortex-A53 CPUs and wire it to
all CPU nodes.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 0c03295f61b0..d28d68a10958 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -36,6 +36,7 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0>;
 			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep_0>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
@@ -47,6 +48,7 @@ cpu1: cpu@1 {
 			compatible = "arm,cortex-a53";
 			reg = <0x1>;
 			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep_0>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
@@ -58,6 +60,7 @@ cpu2: cpu@2 {
 			compatible = "arm,cortex-a53";
 			reg = <0x2>;
 			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep_0>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
@@ -69,6 +72,7 @@ cpu3: cpu@3 {
 			compatible = "arm,cortex-a53";
 			reg = <0x3>;
 			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep_0>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
@@ -80,6 +84,20 @@ l2_0: l2-cache {
 			cache-level = <2>;
 			cache-unified;
 		};
+
+		idle-states {
+			entry-method = "psci";
+
+			cpu_sleep_0: cpu-sleep-c3 { /* C3 */
+				compatible = "arm,idle-state";
+				idle-state-name = "power-down";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <181>;
+				exit-latency-us = <149>;
+				min-residency-us = <703>;
+				local-timer-stop;
+			};
+		};
 	};
 
 	firmware {

-- 
2.34.1

