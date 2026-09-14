Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE46E38F255
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369236; cv=none; b=WdAZ0GD4JXdUZxVfOj3j0E9Ds5itsgBG38NYjNIa/aagaEWqlmFJxs0F1DmD7xl8fP+yVdcPBX2t1N8PZdBd5WFSzJPAo8oVfoRHlSW5CR956AwumXAyXLRzEdSMtLX9RA8KWHaM5FGcCaRy0qGU6Mq7t7BfD7IxPobx4HmWxSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369236; c=relaxed/simple;
	bh=aRET539dL0rqYcGNqpnzg4yTxyOWRk1aKJYTXaJZOIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mYZ3qCo3nLo5FodHrJG8Ag+aw4Lop8HaB8gPmGQkpUKuhtmQRsv4M/TR/6St0/paP6AybQq3rSAwZAXQAmnuiIY/U1RcGHnpNzb+xnTh3lqiZNxZdJAGEVa+KVWUVak61y9Vm4Bvy3QA8aq/JzuR4DWyGjV51JzLC4+fLEV/6Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SOJAJfwI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UHYY8QzQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SOJAJfwI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UHYY8QzQ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ipjg3196567
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iKn9y5yQRMX5a5ivFo2PteBO5Kh8IjK8KqnTKWZ9lSU=; b=SOJAJfwIqF1liTOh
	QcrLc8dDTCnHrG6jnWIQ3FbP8+VoDB6Jlg9ETnzGwXD4gGytD6HPlg0XIXlrkTde
	3wSerAv9Q6RLfDr+FAKcVme/o/+U7DXxLPBubmTk2/AGYD7ZcNDTZmLKFeRTu9jM
	ThCjaKpWsvTUG2r0YfdpP4CLFSe6OX1uoxZ+JNFK+fV45SLtcpR2fmpi+9N/Rzbi
	8eGWSiZyQYNaiLNCbWJ65F8wOxn+ucjtniKNpKijUIswJUTYc7gTMboz5J6qvQii
	SFFzOAymJwDDn79ImpytZlnTkvZY4+anViWsgYftbp509eLTq0gUigUaQYQpaVDj
	DfYzQw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cdd95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:00:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0fso4320173a91.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369221; x=1789974021; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iKn9y5yQRMX5a5ivFo2PteBO5Kh8IjK8KqnTKWZ9lSU=;
        b=UHYY8QzQVEA6NnBqMuH1SmRJq+kUbewhIrPZGU2dkqdRzcym1PDL74mDeVNFiNCZ59
         oVel/Yi0Vn4tNnKXyE6ukhaRqj4D/6DXJMrmk+6uJAfp/w6Q5SqkM1+y2+3fY53Mz4ex
         nQjMeZ7dGRAMQBvfhKSUGMTNAyvgh4a+j1FEwSmDHEZB0mNpp2tnw926SAWhvZo/Qf0Z
         Uo1JUp7aMYbRlXdvO2Xg7xAlDiYsSu+GyEk60qAFOaKFjn27qjljKmxQRj7BarpVcQWh
         AiAHGevtfyURhnrACFY6ecM0yR9TVG1Pa4OS2a/0rLi0AEWbp825fIh/NMV1hs36FM6B
         e9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369221; x=1789974021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iKn9y5yQRMX5a5ivFo2PteBO5Kh8IjK8KqnTKWZ9lSU=;
        b=slcIvW1nmui/TFswtsMBa3bpudyaldHHgtAPksjdxcW6hLiUzP8dQggmUQVHUhRaF5
         VHsViq/L6b4t+T83cGu3ExyEFPTiDNcqhOAy4uGZ8qye6lfDk2z2fX3su/vp8HY8IsBU
         G1fpML3G+O4BjSRkr3JEvDw0Nd9bSQHBEVgHIv6q/yC+uJQs11JAGTOL+eidaqi/gdz9
         sEpE8i4gZd1tprxMddz/W8dxrTCGZ7uAHhVNVUVj7j/d6I2pXNcaGHndNaGxpapcBfqu
         t7ktZ2LcUpl2K/XwvjlYpKVby03TIAbUAXwnGVXf0Jza6F3PfCK+FDgpoe7WoCLwv67Z
         b0Dg==
X-Forwarded-Encrypted: i=1; AKwUvBxxxsGlW22lBKNBMMwnAkj5Lqk2tK7nfAoxce9oCJBeyGz3OsSonUVk7M5dzwKW2A7taZKRiPwLPxTE@vger.kernel.org
X-Gm-Message-State: AFuF++kDOntAhGKdTsSJrJiTJ8HX8fM+nTdWv7/cpzPiTSTfr5BWxv6O
	vfJU7jvIs1Y001eNsRA3PK6rUp6li1BcvHQQeMVAgFCpW/52Za0Fvw+60XQf1xs6VWKrSsn6h9i
	14mN6s6jPg8n0odqG3+lrFC3N05xs7Mzq/dme7o/QiagNvubVxopXl7aqSvwmm4+9
X-Gm-Gg: AYBFou0t6iUIIbECmulSXBmQCwQf0iQi44B8uDB74RcsMZJ5Pny57u3UgwSxJbKMAKV
	SkCT93rEuqjJs//EgCOLE/+ZYBxA8B4afTUc+7CsmBHAZ/ppGXQwI+a9PNf983jWcQud8FB7OS/
	NKjsvRwbUBZzXsa3Y+DV33oP/FeEDlsJWyAU6JAPTnvgD/9v3ud2EGGFiSFPp4jYfjaXp2p+9xj
	9ohH1ZuPMRcovpYiPEA5kyY1sIAIn8n0SkopegpBW8x0k7kqJ6R0EeMEOLrO49Sh/WdktfXyKKL
	fSofYBunQaRBu+pT7tkdDUfJEK2eqOJTOMxk/WPEybBVErhRAX3qoufH2zH9lLv9SKlC15MoJgJ
	Kb0SgtOBENBtkf58/tJkx8kazP+eY
X-Received: by 2002:a17:90a:d603:b0:396:7c01:553f with SMTP id 98e67ed59e1d1-39dd5665888mr6466085a91.21.1789369221425;
        Mon, 14 Sep 2026 00:00:21 -0700 (PDT)
X-Received: by 2002:a17:90a:d603:b0:396:7c01:553f with SMTP id 98e67ed59e1d1-39dd5665888mr6466001a91.21.1789369220525;
        Mon, 14 Sep 2026 00:00:20 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:00:20 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:39 +0530
Subject: [PATCH 07/31] arm64: dts: qcom: sc8180x: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-7-660c31187819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=1702;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=aRET539dL0rqYcGNqpnzg4yTxyOWRk1aKJYTXaJZOIk=;
 b=6Hq5HgVrykHDYtu6kyFVxi+R7Gm/imP9XY00D2BUv0d154Bf4k/hxduwO7s5/Jx6824WDakXN
 nvPk/90WtPMCPwz/RDuj4eH2tiRVpE7/w3Y6ePA6jQe6hhbxYUmXd28
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: -h0mE4-a4BdBeKVcd5Y-3-vXGbc5FEzm
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa79b86 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=8fg_tvuPYJi1a8Ph9hQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX3uM2XQHGvofz
 sL3aR/1AU6FkS0usPKbWpF1rXOXgNrskEIC0M9PIFLQTn/KWaZ5aw4CbAWfjyjPK5nxfilz+5RQ
 fSfxD03boBBykiGpIWJDwTYP1ZLn7lM=
X-Proofpoint-ORIG-GUID: -h0mE4-a4BdBeKVcd5Y-3-vXGbc5FEzm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfXytTCt8ztvK+z
 Iok/4B5Zh2DkMKCvdHnfqdZ0yfLpWeDMINWok9KobrSPnQ5JdA6jO5odHvpac7ZUDuq4ILflaEj
 lBn6MVO5rPm7mJhxUzGnc5+FBv4NfznvLfn2ukEtZH7dywF2LIUtT2EKCMZREJZbyiT1pRlzMnT
 c+9TlAFU8OoKikhBoNyr0B9DAWSeGbgAXNbW2Rr+q4palWPeoxmxyCL/gzO2soNJx1iA4p/Ibt/
 5rvGLh6QR+xOPYzdpPvSFMTsLmovMqbH+fZvPEUnzwcs3RkcXWQ6Md+wJ5zmAGwxS3qSntPtyxr
 42xxpGDDOmmZ9+agPwe9y6jXd22eQXnsiakmW1Ancabc6zX577GDfdPiw1z2ozJyrTZS+V3vWl3
 JAKqAMYpuaPLrALj3x5h17l2DTXbt/OaGw/VANcTmMEdPVVfRIKsrY0Lets0j5MSoA/YCRjRyUN
 rJquLkkQQtYV+tY770w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1011 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index de1b72b64d96..e7af7e36ea1b 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -284,6 +284,7 @@ idle-states {
 
 			little_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
+				idle-state-name = "silver-pll-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <355>;
 				exit-latency-us = <909>;
@@ -293,6 +294,7 @@ little_cpu_sleep_0: cpu-sleep-0-0 {
 
 			big_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
+				idle-state-name = "gold-rail-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <2411>;
 				exit-latency-us = <1461>;
@@ -304,6 +306,7 @@ big_cpu_sleep_0: cpu-sleep-1-0 {
 		domain-idle-states {
 			cluster_sleep_apss_off: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "l3-pc";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <3300>;
 				exit-latency-us = <3300>;
@@ -312,6 +315,7 @@ cluster_sleep_apss_off: cluster-sleep-0 {
 
 			cluster_sleep_aoss_sleep: cluster-sleep-1 {
 				compatible = "domain-idle-state";
+				idle-state-name = "llcc-off";
 				arm,psci-suspend-param = <0x4100a344>;
 				entry-latency-us = <3263>;
 				exit-latency-us = <6562>;

-- 
2.43.0

