Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF5F3E9C2B
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369326; cv=none; b=ZOpSWd1JN4ZP0A/HuquZw7Lp87LdktDofJQNNLM2OYm5JZVexSNAy7+b98LyTSNeiHo3gUQ+BXG9WT8lTN34i6pxEZX9eHtN7+zDI388FH7OPRD891DBFBwJV3ECCxmdkdxclk6NlWDvbwLtKIKc23aHe9hAVvNJX7vKaJE+mYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369326; c=relaxed/simple;
	bh=7NIhEcx7ODWT/lfx4MtyRvEtHjxqBR7eV1TzixGc+4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eKn8Rdt+EoolrkcXRLShobeEWstsZO4gLYU55PapUqywrSXhLCuPzkzbxo76a8+25YDhnS7l7emiVrMJX1mhimA/VMnaCbWTgrxqhd4Me+HuvZnJuPvtFlDQLXHWm2xXxlD77uPvTASdYXML4XfB7DAFti0YDe8IxT0SxNJhM/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dIuRRwix; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ro/Svg0l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dIuRRwix";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ro/Svg0l"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jCv73128509
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dHbCaLAU+iQT7D9la1CQH9F2SIDHGPGtVRirtSFtv/o=; b=dIuRRwixVoE7UPV/
	v0RTVZbZJe5kXZuzGKQm2lOAgq13c5eKimNOUAMDOF8Xe+73MIN3L13cRbwHe5wv
	PZbPC9jiydc0QmnssWJDiVgzViQJOQQFqgqdqx3Kq4+T/QP0eqgJ/wlm2IU3L2Wo
	YohHVHWoCHDfbezGWEAIAIw7GBbNdx8bBfrpCMGmVwFZ0ewPE5d3dLxP0ksxBfHb
	AXQNNvf/gRyzylLDOryYTtBxlIt5YJAKE0SxsieKOF2cjwXRps+X17yuQi1G8sOs
	KwQim2e4MKpnQoa6L9CoUZMrZV/Ydd8YJbeQclAZlnU3+3UZ/HkIZzipMvUU+5yq
	e1VgnQ==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gn018n9gq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:02:04 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6c1b24c4d0bso2656140eaf.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369324; x=1789974124; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dHbCaLAU+iQT7D9la1CQH9F2SIDHGPGtVRirtSFtv/o=;
        b=Ro/Svg0lu1Nor+tWPYZod1ZlClbj4V5iPqd8UBANRN6W2yiqbRglNgoULanhxiqp34
         owhHItBc+KDyzdpzjhgvcdxaPj9hHPNJFjfNk1XhpSYGia+MFgFJFN2+ZvItTmZFCkGl
         4xGjvxDL73rKsR4zMr7ijjAMWNofTJYUm3qpObZ171Xz55lwAEb+7cBb/K96ZlqbkITM
         SE/zzynzqfw8uv4Ifs0iYGQT3au912dcvBGyiXy6hXzIlLFoV6h0Wofrw1+2yYaapGh6
         f36taPV1QhWw6CKhmZMS0rs1Bkc5djx9IK7uUUUlkpyC4maYRBYo3LdUDR6PFKnPnyPc
         gYdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369324; x=1789974124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dHbCaLAU+iQT7D9la1CQH9F2SIDHGPGtVRirtSFtv/o=;
        b=K9EoSCNx+lFroVzFzS143x6LWQIGgSpBQ4jmRBWYT0b9sXsKtixErMte4ZjjB8hBNo
         LG0tSkRXxwU6T2c1xyE7L20IF7rbaktyEiZuv16NC9PVTPI59cgl5nETTraMhLe0nKTg
         IC5zehVzE0Uj/BXTGuIDWM0oqGMi/IyujqsovNi5tMYkT5yOfcK9QFwV4jrEOMwZ6cXG
         mz30ru0oopEGZZYMbIHdGmqNGmq77K+jIA6m9FlA/VVDODSxCgwq1yrCRYvUHMV4Qg1E
         5VTn+xGR8ZNRVKL+811OZeqE0sFToa949d8C23QKDGIZWAXs2pQi+88F8LvJcs+LP6PN
         MXeQ==
X-Forwarded-Encrypted: i=1; AKwUvBwirSDQjFHc9CZXwJu4aD2tKESXMVZqBVY2M2VkOPM0dZXKBYKVSjHjlmpJhFbGrCbN4/vU/Z3mupZo@vger.kernel.org
X-Gm-Message-State: AFuF++l+B5lxWELAxm8AG0z+KuQC1dyv1fReq+O4gVmnUEwLX1e11vmj
	Q1LSMnMwhM2ig9iE6+Aj/pBXPP7aCk7LahCDspCNqbegbKNV0/nsUx2KbbG64jdmPD5SCyIhNV3
	apK0CBTGzdRezdALNgZeMSu4Ir59de/EkX1VgM33BJd7SNG99HlifAm5Woj2QbNPV
X-Gm-Gg: AYBFou0VoOyxb27UDlb6+i4x7IiPaX5lTEqZ5TG8QGK75p5YiLRiNv41QkDcwPZE9gx
	4rL2ZSkrN44PSmNnK9ax/WuWBKy1oIBRKwhOfdiq6RZS+rMAyKvCJBw8V0r5j4zzl7W4NzP6Y8i
	TT5GrJqcZpOOjT26VYhL8zU9yqYo40YHB9sX+Klhmvy2UeJwmfuZ2XtyNX9ZcUSea+pc5WPdzpH
	k7KG+0k/uPFQQwtWVTknWLsoHTmMLVgDA22S15C98+ewwbQqtMpUpT8c92Y8hGDnbSAJwfXkWBr
	5WlX/GJUutDteCHLIXC42G8CvFGMpOOVF3bsqNNbvtsQ7mZ5ObaUoFPJM/HWoCFnqcen7eFu1Lv
	wsid6a7bH+Io4+VUDjAx9a7U3MFoQ
X-Received: by 2002:a05:6820:20a:b0:6bd:c88c:982d with SMTP id 006d021491bc7-6c53fe8437emr528793eaf.24.1789369324099;
        Mon, 14 Sep 2026 00:02:04 -0700 (PDT)
X-Received: by 2002:a05:6820:20a:b0:6bd:c88c:982d with SMTP id 006d021491bc7-6c53fe8437emr528751eaf.24.1789369323647;
        Mon, 14 Sep 2026 00:02:03 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:02:03 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:59 +0530
Subject: [PATCH 27/31] arm64: dts: qcom: sc8280xp: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-27-660c31187819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=1612;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=7NIhEcx7ODWT/lfx4MtyRvEtHjxqBR7eV1TzixGc+4M=;
 b=IagOhcj8ZK4TwxhisUO7iLSSMV0YTrXN9zVlNDHjHCtd+lpTYqLpNudxUFmMne3XmQzeefFMN
 eGB81eXhRHyBVR9/hep7CDwJKB/n87Wx03W+DHsLEWJiEeX5YIujG/v
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=c4g+0h9l c=1 sm=1 tr=0 ts=6aa79bec cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=4Z_S6MpAyjS2sx10nrcA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfXyHYZ1CvYT072
 je0kztxJfSKNYvIWIXQpe5t5izB20+g+pWR3yxP8ZMr/XWdgkB/3+G/Bs0BLHB/Tg0f/tuecWwB
 eWg7RW8E3fDaGaGm9xuicDUcbS+mNRY=
X-Proofpoint-GUID: Fa4Tpq9yhDcRXgFVk6mGXhUknPLQBd3H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX5+QNWDx2waeT
 cbFt/EgPgyRGv24YjUGMqadffNMAJx3U9PuvrCGaHYVLMJaSJEiGWzY+jKPJAzcqfkxtQzmL7tA
 eE3fMPFCzLV5ojBsnU0+y4eII7bjDT6Vzj7SqqzakQ0pFA8O6Pud2wzwOfniS6GWoWv5Qu8X++v
 VtmItPxxVaR3WHtRwzVl3/QrybGcHItPElDW1oMsyX2uB5IeGomW5lu7/IhrPd1NW7lZcDG448u
 d3VFtHx7qqkaMvYUWzLplesExxIGKz3W/jQloQgDLxt1vrJyhdIhlGE4jNAij2yiNYRrFNgEczP
 Wfa13Dsv6wMnYUHzGnz3JyQsvRdzAfIdm7titcnh70m2f+nRjOJEsSQk/4V4JP2lhWNgH/dHhyq
 2rjcZ5qTUE7LSFKPWp38uBd23/U9eYVdeR6YOj1gvLodbMH1E/hWNDNR+Vt8R8l3QQ8swlYq1qY
 aFeAD4eIfnupAvLW6YQ==
X-Proofpoint-ORIG-GUID: Fa4Tpq9yhDcRXgFVk6mGXhUknPLQBd3H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

While at it, update CPU idle state names to match the low power modes
they describe.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 874265f49d8d..b1e48b5ebe88 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -279,7 +279,7 @@ idle-states {
 
 			little_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "little-rail-power-collapse";
+				idle-state-name = "silver-pll-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <355>;
 				exit-latency-us = <909>;
@@ -289,7 +289,7 @@ little_cpu_sleep_0: cpu-sleep-0-0 {
 
 			big_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "big-rail-power-collapse";
+				idle-state-name = "gold-rail-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <241>;
 				exit-latency-us = <1461>;
@@ -301,6 +301,7 @@ big_cpu_sleep_0: cpu-sleep-1-0 {
 		domain-idle-states {
 			cluster_sleep_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "llcc-off";
 				arm,psci-suspend-param = <0x4100c344>;
 				entry-latency-us = <3263>;
 				exit-latency-us = <6562>;

-- 
2.43.0

