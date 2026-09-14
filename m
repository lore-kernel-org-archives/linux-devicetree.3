Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818D138E8A3
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369242; cv=none; b=K9Oxu2J18q7mNfkctFkh9DRTxdomaHZ77AQ5sP2kCo2XQz51MqwUcuZOEifiots+Qk0+JkJXQioE4sZlQimMNgCc6Zb8tlH+IOdj6cDOTjl1S97mWzeww632CKbKgXSAIvAQUiUJJON18p+WJhccgt2lfdcPeKkpnMC3dnzic3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369242; c=relaxed/simple;
	bh=pOpkcJXJFl6Fh/+JLEA+pVmC+EXfTn+h51loP9+XOPA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ecczkQGqlDfdY2FwEOW6GxJ/wHXAwGGd42CtPchefFHfEsbQOCBr0vvVT/2QTIyYe9AQO7wlEO2oD7PCX2dWpj022flXms+6yc973hiiM6QQWfiHrbFdZrjxeJbhsj16KYJFHkR/yBJMikhhJRAWV0b0hE0LWY+/Eg5c1AMVt3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c2+qyDYL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gkjMUjV2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c2+qyDYL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gkjMUjV2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ikwv4057513
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vgqfN7e2K3Ed1VO+TXhWmlnFQbJnqDdFUTDcZJR7DVQ=; b=c2+qyDYL1A0bW6q3
	vkMrlxA4+k97TzBvq62TeAxkNgN479ete4cCp8PXaLtjoCu77y202cdBarXq+9cT
	jqRSZcNyCzw6U9pVemZm05fy5LodaHFVEOULSiWkWYnHCeliiAkhhuiqzsro6s8n
	R0onbmA/2NPt54b7gi8lTxHqu5W61FnUkHKCI4BuwbkaWcoH4o0HAxOVFZn3pBo0
	FQIjH5jIUbYPfH2kQ/Qo+S5wIKLJPpYVAWqZxruGCYfhOPRZ8qPuzP1oyvxL8c4x
	UmMJiYz5Jvt7HS9DtxDiXk/ShJRkHmCUKI4Px3d2Szm6wB2a1wJmkNnw9loxUY2I
	Tacd9g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hss7w8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:00:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39b90cc0d5cso3628066a91.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369231; x=1789974031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vgqfN7e2K3Ed1VO+TXhWmlnFQbJnqDdFUTDcZJR7DVQ=;
        b=gkjMUjV2qRlr0EDSps774aroKmQ5aSeOEG3wmVjm7+sMx/kJGaD94grWE68E1XV3wi
         oVfhLklmsvfEFRHjS6R82w/8+bTmiFx2fYwSVkm/07oz9NbCtD8+NPMO+NV7n34JTPzi
         uoqTktGR6X3wmYyFYnwVXe3sK1TmdWBzS1Zw10yU+kRcEKjqiC8sy4koT9D3y1/1qR7R
         47fYfNaeSUFab5+Pc3cAD56FIEC4FPzXXbFvQKyUbb6TqHMAgNEHfmmURReHzyLduTPm
         9zNqfSKHRoGHoTgi7QZPg6OSLh1zAZT4dACOx+3ZDCvE9DimgXMYmXr0ruI9OqAU4PS4
         1CZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369231; x=1789974031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vgqfN7e2K3Ed1VO+TXhWmlnFQbJnqDdFUTDcZJR7DVQ=;
        b=O7s/PkJs8jr3QxjQSwhpyYuo2Go28XEZ3CIoF9p5WozA75S+oDLGo+autJmt0S8kbo
         13Jap6BYSgOtFGq64XUQWeGrERpPMIQUx+2cwpRcQb1mldP0c6Z03VndnV9uuhjBO9x7
         +ZOcftI4FTWjcasI+/s9OaBdxSCV+ocyQLdHDzXjqrV6K132fQgKfTRtQe9Xgf3NI4tM
         pnqYilgQuKh0M2d73EeXDBHRdzdCvAlc7bFgnS95HRJ/7gJy9yKT2JzS0Sl06w2k4zNw
         Dj6SfYGFeftCv4BlS2QhIByEuEePyf/X9O5+KweUiqjvfz77cVZ6haEHUHt8tO346X3p
         /q0A==
X-Forwarded-Encrypted: i=1; AKwUvBw+zThfXly8VfYoaqs3miPN4Ut4ClFjshIPUhtkQC2DgTToNbIy5qY3PyLRXmVrtDFZklDHe8JfGcy6@vger.kernel.org
X-Gm-Message-State: AFuF++mA+Er+SUoan5xFZ53ktzBizWKNDGARkd/j+2SLFJLprI5u2fMN
	m/w2aeaZZp7Nxkd10jRq53kXXBz4AjJdgidvlujia0DQyLwtCEanysSY8W4lVtGrJi1hCfBMAJa
	CYB1yS7JaRkJ4m2U2ILyHgezReGHAsQUlVsr48KhkgmOF6qlva8YIBAqk3usZ2mpz
X-Gm-Gg: AYBFou2B1zuigFN9LJ21+/3krAE/JEXHUzmK3XYmjxP/UwfovcGyro55bjvfu3gTdzX
	VU3IWfAgaWbNcbE+i977lzj27B0m2KptBnmy20BRatYMuw2+B4enGWap6quglPfEaqyROlP0bLK
	IZYzXwcIxJ/ijbLfHSIkWjYlu75QR3+la8/dGKwBjDVdNi6Huhjc5wFvLKu4y2cBBsJmb0I3pKl
	/w1OVi2KjK4+TPCd40iVDd8B5AfUtc0GMy1ETxz7PdhGbL2U4jMToItdYVF9VKMQJjW/yJ+J45l
	Qok4QfhcQfbb7TiZE/GpVc1Ha3aUd4Gx6fCOPF/cMIYshpE4TBhQE+AmOA3vCvv2rpNJF+c0/7f
	mwVGUqzh+9j1XMX+n2NMMZvKJYp2Z
X-Received: by 2002:a17:90b:164f:b0:39d:b1bd:b384 with SMTP id 98e67ed59e1d1-39dec0b6344mr2990950a91.17.1789369222670;
        Mon, 14 Sep 2026 00:00:22 -0700 (PDT)
X-Received: by 2002:a17:90b:164f:b0:39d:b1bd:b384 with SMTP id 98e67ed59e1d1-39dec0b6344mr2989763a91.17.1789369215574;
        Mon, 14 Sep 2026 00:00:15 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:00:14 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:38 +0530
Subject: [PATCH 06/31] arm64: dts: qcom: sdm845: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-6-660c31187819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=1618;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=pOpkcJXJFl6Fh/+JLEA+pVmC+EXfTn+h51loP9+XOPA=;
 b=l3rOe/mmoMDkkS10ViVeh6M6Z1ybGVclo+yj7g7zXFeL6+tvggJmajX24/u29RCdzVBw4QkFm
 AmBFG02gyM7CXAgwLsnxYSvkzq6YZ4K8vvSWFyHN2N4zaPgEoRRsZpT
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfXw2vbTssukH6B
 vtywaYulD6ightUbs+NUe8NtcZBc2wYh0YSDKiLzObBVyPZYSM9Yb8cyCu8bluOyx4TvnrO4b/7
 UoSv24EdDJCBUz4M38EAduRhdg8JJElSIH8nkXyXfhbvByBbVFRwKrTR1jH8SDrhe/wTueKkc8p
 uFi7pzuUMPV0PywzgVnovR/LwPw/VsnnKhiI2MELpBDeR/SgO9r0UnT3+UbUhQ/Dhh1zwxP8SgS
 it2q5fuCV2Izk8qCm8u7si0MtB7Xw1mswUZzV8+E7uWRn83NUTPukd9BBuyDOBexIC7Eo9DyDl2
 kTBThNcn6A8WovagyIqYAoDoyGlCaLy0tfBb/GdXySf+GHphiFYhoA6aXP4hY29AoHpxnz1Grsf
 u5j5LLDovZeNZ0NAC288yreqXbfHhq7gyfuqqifj3x+P26o8bovfnXGn49RsMUn6H1FMaq/p/Vg
 hU9Ub18Ko4+EUaU3N6w==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa79b8f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=N-3nubrmD5AHxcc_kpcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: QzKRxiVUPSpNODVT7v-Pl1Y3r6htskNF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfXwz8Bb9mHzEHj
 a2ohSuSYrDRUYJqyQz253fYpJiPbJ8EhhDKc/uYH2K+ONRUsgiT9vayZ7A1izUG/EALvIfMJinb
 DZUKIFngcL1lLBkYmnxszy4C8bnMSJw=
X-Proofpoint-ORIG-GUID: QzKRxiVUPSpNODVT7v-Pl1Y3r6htskNF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

While at it, update CPU idle state names to match the low power modes
they describe.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index b1f6782a3ad9..a5693bc72636 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -330,7 +330,7 @@ cpu_idle_states: idle-states {
 
 			little_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "little-rail-power-collapse";
+				idle-state-name = "silver-pll-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <350>;
 				exit-latency-us = <461>;
@@ -340,7 +340,7 @@ little_cpu_sleep_0: cpu-sleep-0-0 {
 
 			big_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "big-rail-power-collapse";
+				idle-state-name = "gold-rail-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <264>;
 				exit-latency-us = <621>;
@@ -352,6 +352,7 @@ big_cpu_sleep_0: cpu-sleep-1-0 {
 		domain-idle-states {
 			cluster_sleep_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "llcc-off";
 				arm,psci-suspend-param = <0x4100c244>;
 				entry-latency-us = <3263>;
 				exit-latency-us = <6562>;

-- 
2.43.0

