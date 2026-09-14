Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F409C3AB498
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369252; cv=none; b=goS2Z49q5o9EwoiyXEsln0xgrg0cmLnlP9sE5fIlIY0qdN1C7GsHHlZYhxBhWLhPhMTJR7gAW4xJA6cFNVzK5byIx+fwyWidgLPStHvWGRMwwnHheEJiPhyjlbM/N5LNElSME7H83i+Gq1EjyX2RTpUCrnXs155SU9emEKdEJ9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369252; c=relaxed/simple;
	bh=51p7nyGElmgActYmMrK60OEpvlyhQPR5CG3SvaR8tiY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GzONLr9LUat6ubFO5HIU6FUFaKs2UVq0A9d+qioR+fD0ZGu2v1azXaDelKlNJeisoRNh1EtB6p0wDHhXL5FPD0jyYRZS2cx092rkSJcLFe3P48tg6DnMKXhE102n8Y2NtRwYCgHvPe4Q3o65VOGgYCgBxSCwBmJ8XneSWIqc5qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lYvolpj8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O4UcDefc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lYvolpj8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O4UcDefc"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jU3t237694
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:00:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0VrjN16K6VeprRgLuXn5Re8HSbFUi3sOGJmdg2vwBNY=; b=lYvolpj8eXBMP3di
	fgC+c8ww6Vnb3WEJnTRfjYEwxBvHocAhnzpWdZks4gYqqTQZks2E12BcKOyVX3HD
	A9kz9Dyb83Kdpxhe+Hrb4LcOC9L2CwmJzPO+KRzC72/VAIfas3Jd1ZofFkCddf+R
	Q+3WgjfXdAVX8C9tCA9sYy0ICq/LgtgqaX8EtV/EhaXMoMqG0ne585sHqqkZqmp/
	xQMcCjBsrSJTnzEXUndb2dSoInwjzH2JO1A8dCbWgwfYAHQu8mal8BORm9yzsF7X
	EKbjBK71DZFZhr67EuvGEYfpwhFstNhewdykl1YDu+Ro/kCR8mcJYCMrx98izpnE
	7NTACg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dnen4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:00:48 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so5262636a91.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369248; x=1789974048; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0VrjN16K6VeprRgLuXn5Re8HSbFUi3sOGJmdg2vwBNY=;
        b=O4UcDefcVUxlmc4zuX2gli4eH/UO7k0lvgpokpbsiAp4l/w2ASoppZB9OxqhRG9D6y
         GmMKBDhW9uaLytjxpNI6bIT5UnmFb6PKoML741KOcKabRGHyqiZj2X9o/V/KVA3XJaen
         0ARZngIslqEGkPL8fESWxWnXo45iaUQsttUuSFSLWD3UmMFvx/kHtXaTUZhH9KerycL8
         21OIs74pkM9td8upRLz+OfGQz3ofURKqzuSNJCASaU9Hm/14xyaXAVix/1SA7FHUZfl8
         pM+TdGRZSQB1zlgyIWDknKwUUTTke79tsK1BMmPmtzgtvvjMImVR/O/wKuoR+ahk4Zxx
         FxqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369248; x=1789974048;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0VrjN16K6VeprRgLuXn5Re8HSbFUi3sOGJmdg2vwBNY=;
        b=AhHLi7FJYlRkm7aSJ9zmYqJeImNd3RgR/clt8MJVyDeKErVrxsbOhfaHd2rylTSqA7
         uvbS4DTyIEMkpp/Xk0dOOZp6iHzO1avuQp2QMQ3ddouMlODRb/p62rKRNHSs+Y3K3vFa
         eKY4KtpsuOGcXuqMUlXMXVxrabpHY2DitmSq1wN4b0wefRiGvPVWxkHor7ryDW17eoFW
         zVWF7gqzJgIuow+H6juywRTJrOiw8NpVN1EPsE1ufv1QlfnZxXs7/xaG/S8UEoUrEdjY
         ZsknMC+SnBprnQ/KeEIvlU7AkbdkLQ9sfkPpMrs7JFREXHMhLK9xQY7ziac+51esabOE
         jABw==
X-Forwarded-Encrypted: i=1; AKwUvBx9lH8svJXlgK9rSPWBg36maLuaOVVaoJ71AF3Lv97FkjQVjrsx6kkf9RmRHYrksEkRXjFlcBpYqGpL@vger.kernel.org
X-Gm-Message-State: AFuF++n5JS0kYxu8MKa2HZZD7zUCK+VdAvjQ2KB1CNP6Y/resXlgHufp
	OUlkS1DqIbMGXGFw3G3lSWqj6SW0YtYkT1GLOtEfQ5WX9tGWNANyH+8+55YObFm0MSpxb4cDXoS
	+2m3YebS5bpotGTsWPbm8Xzg+4K27bEH1iT2OO1vDstTLSHj9wmtJTr70VJXp4IPJ
X-Gm-Gg: AYBFou2Ez46AonNdGmKQy6bzdrIUSwzr82LZyDIxuukYNjJiS3dXd4qaskdHyNFcnqy
	DqCvxsjHM0yJNnwhwRqP4nBH0luYHVAwEcNfB9/Y6tml0RDLcTuCzp70+oYmOpvdoEOAZn+J3F1
	ZRBk2zs0mHrcj4SND/vhh75r773Ifkmw2w/iWm/uw0W/AA1s9+tBPSjL6aATyJ+VVGLBY+aawTu
	0wqD8duS5It68G5DeAbal6oNqANY1KYWmnX50FpjEg6F2U4PBzXnPqtmeUk8cRLuGfP1QbDz0tq
	L/xrMRC9WRqrfIlzQPfYkfvA91ImvMbs72MfTE75lcpYy79tn/GCYsZ9ccOq1E6VB7H8YC08OvH
	s3tPFMKTznkPOc9F9HBdEuiSEZsS2
X-Received: by 2002:a17:90a:1041:b0:39d:eca3:e296 with SMTP id 98e67ed59e1d1-39deca3e8e5mr1805236a91.17.1789369247773;
        Mon, 14 Sep 2026 00:00:47 -0700 (PDT)
X-Received: by 2002:a17:90a:1041:b0:39d:eca3:e296 with SMTP id 98e67ed59e1d1-39deca3e8e5mr1805110a91.17.1789369246305;
        Mon, 14 Sep 2026 00:00:46 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:00:45 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:44 +0530
Subject: [PATCH 12/31] arm64: dts: qcom: sm8150: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-12-660c31187819@oss.qualcomm.com>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=1602;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=51p7nyGElmgActYmMrK60OEpvlyhQPR5CG3SvaR8tiY=;
 b=t8fMI3x0qjs6FcvP9qMYZsjqNmTWSLtPw9r2hXXjueoTdkNZhqq6fPq1InOqbpi9nfOMVkIyX
 eomUPj7jul0BbhDyr9RFO9tCDXR/WHNoWiLDuQtq+b9BRVBX71z/6WL
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: q6E7JEhpnmGbEoBa69tELVyv27VCocmp
X-Proofpoint-ORIG-GUID: q6E7JEhpnmGbEoBa69tELVyv27VCocmp
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa79ba0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=iQ26D1ncnj3ZTx_uDCoA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfXxE7RHnfhBJ4x
 AW6TniqP9xBSfT+B27UifKCm8CipJTvOKgGnAUYkIbeROaXfPWdmByldVurqSr81Z+nwZhqtf0A
 QiHxAZFOIwINaG4gMK3z0hFmn+QBZno=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX63OMDeaPBwV5
 tEgcOAZRZPvRIU2XHm8tTNnuEmeZuFX6w1vunhNwPfZzzd/1Y9YMZgcxRqZqrbURvCKYY3pztnk
 M5x/vOMhIaPYOnkR1vczWRwUIBx5+wxeYhc5KuVhUSYGt6mCF9ZSAP91cc6cWWNRykEGWScpaHm
 oBj4CYmBKcJnyfcINw3M2717XWvwcEpENH3tcaifdeKeGMLHT0m/WMS1Y7TsvAJ5mYzHpkl6OMN
 8t11zPA5KZtHE8IjcVqq6VPVMmAySsxYOqomBu2MmTUGVBAM79HkjcCnkxkealTpmorQ3Tq8y8e
 Th8XJTXCCQtymLorJ28HDOv2as4oU+lbF2tg4HJiVbicAay7wfR/jXcg/uSOgnHGfoktlCgnzmK
 95hVGSzSgE9SCdogqV0izpHWRHjxUYjHa/vJkYNhh1L0KwiTCDyjzV/RjmWmw2kI06yQAN7Ba5v
 /SOG6pgfI8xOzhinxug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

While at it, update CPU idle state names to match the low power modes
they describe.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 94a3b02cb289..1d708f56e05d 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -287,7 +287,7 @@ idle-states {
 
 			little_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "little-rail-power-collapse";
+				idle-state-name = "silver-pll-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <355>;
 				exit-latency-us = <909>;
@@ -297,7 +297,7 @@ little_cpu_sleep_0: cpu-sleep-0-0 {
 
 			big_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "big-rail-power-collapse";
+				idle-state-name = "gold-rail-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <241>;
 				exit-latency-us = <1461>;
@@ -309,6 +309,7 @@ big_cpu_sleep_0: cpu-sleep-1-0 {
 		domain-idle-states {
 			cluster_sleep_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "llcc-off";
 				arm,psci-suspend-param = <0x4100c244>;
 				entry-latency-us = <3263>;
 				exit-latency-us = <6562>;

-- 
2.43.0

