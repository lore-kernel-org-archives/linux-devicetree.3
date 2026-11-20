Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172886;
	b=A2VUXN0mVLjqfuwfX1OeLLi2aH+6LGQl3tlUktcd0/JZ2klJB/OaNjGciEqVkJRy1MNq
	 UODWSQFe/raQOGG785pSUVLBFs/lFyFj3bcnhZp+NGNZibGk445Y+IBMItq3mW/R3u4cG
	 sEIwQLaGaM2kMn+i9K+jXyR/+zTo6R1UkACzOZtz4ficTOycgX6v/s/mmpyzNt7hUXVvY
	 gYW8RQKhjzlv4VJ0vVVMtGrRN5+DihB9rlZGr2BKAp7J4sb/Hn9IoW7JD9r7YPQE+llPP
	 a0hQk9ZOgEdG81mSwSTazcjbn2epnXlNJ8SRov8K8umdd1/BkVdVSavNBNdeqE1pm/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172886;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=drpSu4HheKaqlFGXfa2FVpmGxrRLS+U8hS+KH99KJHU=;
	b=pmsJY2cLyUFbczIJCb59KkZIDItxz/d7m5lJgcaZtQjGd7GV7qShh2T7ZbCIDtyeEuro
	 f0A2dgejTXEVDDBww8cgMWL1ye3LT3ZmSovpzew+K2nugGrW+xu0s7pE/bL4c1xsw1hHT
	 YPlq5rTRCJdVRVVlZz3lZimSDcXORTPZ5VGcBR/cB6JP5Hq+QuqjquPngqOhfFkhc+rEX
	 GDvZxtaS8Ip2tjiXA6ayaA4itZv1SaykLjik9ztuqxaTJYTcoDK8efUi8wdH3XqAXoNDO
	 40gvC87od02+Jim9G45oLKsGmqO13DbloLVnTPUwg2kCRr08t895KchOb6XKcLKWOLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ggyc8/hy";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DXYLEjsS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C88760A2618
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:08:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C88760A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ggyc8/hy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DXYLEjsS
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkgpJ3107621
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:08:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	drpSu4HheKaqlFGXfa2FVpmGxrRLS+U8hS+KH99KJHU=; b=ggyc8/hyxmlWS//p
	IvODsdges0NNEEIs43B2ATBJOjzvWfwHStiFyHfdclZtyYmrcTVan/UBSiHQPiBa
	pmXLOae1fWbk/32MeJlctcEPkuIMSxbMywnbCUSY+HmnoJjt3/kMtGJwmQg1GPi2
	LDFYYFBreFl3GDYzDzum3yJtPAEaRcU4u8COdKB7jjj/Wb5xGaAg2yX0CasB8QP4
	fDAxoXG+cC/xd75ozCAYeK/hIqrqHIggVHmH9iUqprcFZy1Pua9rTq9BloUsEvCi
	sMLxmlbxFsWJAUbIhPhe0fxgI1PXerT7PRRYYsLz/OxfZBcc3oR6yIJn6GYqAMEB
	5BtBBA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27au3c00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:08:04 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3854627c1c8so1079122eec.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172883; x=1795777683; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=drpSu4HheKaqlFGXfa2FVpmGxrRLS+U8hS+KH99KJHU=;
        b=DXYLEjsSr9wonQrekUy8TcpQ8VTQm7N9wCrXveLVTN2y8wlDSHhJKNJtvxCeV+1Scf
         xnT41CP5S7Speg2mznMIYp8iQoq7BCrxGzu6iVVNN2wfhXw1UAkP3kHfK85Y9WGYXv2+
         OZPWGfROA4yUBnUjVBHOoPja4mvk9mTuOYuVpKPqkFogT+hkaYLoJqbgU0qWwrwSnSGG
         HeqmOA+2i1XHwDkbfj1ubCvSdICGLH+Z4KHNF+RR1peGxd3EEqJupEWESZxKWSDja6O6
         MCOqYeOgiIRLbmzbwhNjNGU8ptsShEnFB/kEHo5lkFo7ROOGj4Hts3pTX4NcMCJJVOaM
         hIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172883; x=1795777683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=drpSu4HheKaqlFGXfa2FVpmGxrRLS+U8hS+KH99KJHU=;
        b=bfSBaDTs7tQaT9+e4sORrZ5YdwGxwIMV56gu3H2M+t+isjTphuwkgKu1vrUZIRAizt
         QRj/4mQCNj9JdB84IWmPIbh4UrpycKYq10ebgPKYLvhbjLTsRfM9852S2bvYjdILcKDQ
         W66G3fWyXNA9TqBrI+kD9af/SJXP+usEXcbNo3Dq8kWlpANwv6hNpsn3jA1SauA6E+Mq
         J1Ln4euSmSjiX1d1intVfR+IJIgQYAhUL77mQ10Sd/jOJ2vcoFWvGIy2F4Oubpb6FjXP
         Plh718ykugEZpYDPVIWB1eE8IF/AoKTeq8coJPSH/FP9MrLVmzYXqkUV6cMurSiQLOab
         qWdg==
X-Forwarded-Encrypted: i=1; AL+hErG/hMxp6kMzUovdoBPn1YEk8RqJGqoP9kmoJRcJbtl9PmSXHA9sIlqOokDm0N0eWjuMABYoHW8esbyX@vger.kernel.org
X-Gm-Message-State: APuU4Z9xHq9XVbVerruZMT49AvAt6yf7JgXk+wBsHvSFXD/NxTFw4yd9
	vZw97XOtBHSwB/Kd3r9jawcCYoc4rM8bbXqCKqi3lVEjYpMS5wA6xVeC8Uxj53CBrSI/pw25NhH
	Fqr4U6Qu6eGObRYR4D+Sak+a4YeOtBmcsPZ4WRl7Dt9L+dgsq49vZ/8ri1HgOyhXF
X-Gm-Gg: AZFdTZddSQy5bWso8tTSYWkow/NWrThDshdxCWyKZ8/DBCkrGM9/T1wPzpGNM3z4dqb
	Ga8e3LTHC06DOEdNC5ROASqD9mlKlpAbN/fHCdE5BTHJjMky6x2USXIU6r8/kHEkkIOpV0UilkR
	VhtOcmMLGwXamUCS13OxicX5rYGRme+9EjhKxxSoI7ceOJ/UKvWbFLZ1xBIlor+W5MeLL+kIg15
	/+ACzrDX0EOYRilXDs3hq5dF93nnX8kuwBcsJGQxlpB5saRwa141P9M/LZUE5AqV9ZT39Ay+IKp
	MGhLlPl2YdhiiJbKzDAmUHu5hLr/d2rNPCiWxjt4w1xdks05yHt97rDb5VgAfhSkYCP2vRvzWsE
	c9XE7DxM3p9XggnzaYcuEvoc19mYskVNK93HyY9Fg/M5XWNWEWKVlWXoiCxlBdqVkgucmTFxkpq
	klHaAr
X-Received: by 2002:a05:7301:6182:20b0:381:fe77:7d31 with SMTP id 5a478bee46e88-3856f14707amr2344810eec.12.1795172883052;
        Fri, 20 Nov 2026 03:08:03 -0800 (PST)
X-Received: by 2002:a05:7301:6182:20b0:381:fe77:7d31 with SMTP id 5a478bee46e88-3856f14707amr2344752eec.12.1795172882285;
        Fri, 20 Nov 2026 03:08:02 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:08:01 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:55 +0530
Subject: [PATCH v4 14/20] arm64: dts: qcom: sm8650: Add GEM_NOC
 interconnect for adreno SMMU
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
Message-Id: <20261120-smmu_interconnect_addition-v4-14-cab8ee8be0b3@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1282;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=nRKWODwhqsti/JCMKzfpHOUMvXfhBSP+GT/cARrj/+0=;
 b=c5WtPJ0sQu94WJMaTQu9JE5PzvJ7kuyQVvPNmn3/oAka+ojdMg0UnobB5jSbCZWOdUIE7w8Oj
 i7g0V7lmEc9BM4/rk317+KDNiQCg0iQXHuwtIRhaaPXA8Cy9CozEvTO
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX18dUmxkxIG8k
 9sVKfiQhLvai7zj/QEAy71AOiWmSJknfe/140jje8XUsFi4uepoCfVFM/1+q1VCyGACDCQgsI3s
 S1r4A7Jj0/3y7pEyv+hOdrNsjdpduyDAwOIaDrVfQJgD2q0xQ67dzNpME8IfaF5KfJJqodRM2ty
 LmwuufyHAZ6WQuLGXYOghNxiVFDvNXKYQcVRdNV6rjSD0HVDtNnSb8uhxWvtUc+6t+eTDr+zpYr
 JzqFlkoyjlQlS8qaMdL32xR2M7tjNdePg7wtER9TelWqydxnyRIN3rXDSGyXGQounm9j4pnXcPu
 Ocih8yiQASYcRX7UEmpSBEcZ8XxJcXFyf30dVAhDLlLrVDeK3OWsqjBTp1R2WtC5Uh7JNBHGEoc
 wUii1sqLC/v486UeOhEX9UFztyKrsXkciXLhogTGaR7iXQGg8AXFFcRLG64VsGxJudTkO/bLXrY
 ET75ypGLB3Z9I1/1Tuw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX70DZrbNI/DvN
 YwDTmMMZ6NlA5wDHRVZME7Ybxddv2hiaRzYI4bI73IN1om9JNmmLN5hd9l1bNyZzzStFh1Uq/Cg
 hqR8coaK7TYpbtHA5CvejpUvUvr7Ko0=
X-Proofpoint-ORIG-GUID: YA2uAB70HXsQjBMWztzp5H6PaBqPPn3p
X-Proofpoint-GUID: YA2uAB70HXsQjBMWztzp5H6PaBqPPn3p
X-Authority-Analysis: v=2.4 cv=KuHYSmWN c=1 sm=1 tr=0 ts=6b002a14 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=UZQlob4mJqq41ALSq9YA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044

On SM8650 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 5a030f9646c8..86b3fa4cf05a 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4214,7 +4214,6 @@ gpu: gpu@3d00000 {
 
 			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-			interconnect-names = "gfx-mem";
 
 			status = "disabled";
 
@@ -4413,6 +4412,8 @@ adreno_smmu: iommu@3da0000 {
 				      "ahb";
 			power-domains = <&gpucc GPU_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		ipa: ipa@3f40000 {

-- 
2.34.1

