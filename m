Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491C63EB0FB
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 10:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781779231; cv=none; b=rniOfyrhq63fG2rxXVCNNK/1/Dc0HcGRkYR0u6RHGB14Wo8dpN10el+JIh0iuK2LsvZwNP8yLJY0BAi8b8Y5gGL3BvpFBeQkDJZRjGFKTEqFMSEJ8KYrIiSHkKO4mHMWzp8TGUYMfTqWlNfmbXMAd5/nP5RW1gZkGIiHTWX0SPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781779231; c=relaxed/simple;
	bh=bvJsSHJn1wMIY2sMhHsk9OqRNB88NkxzAhcUkRGHK2M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sHRlo/3r1jjLoNG5fi4LBusXGakCkDgikPdBB1vj6L2FQ0K3jHt6GEKeqy/oHiSaP9xAG3sXQayFnXsKkfclv9Ksxz6gHsAoNgZaH5QiuA0DCkPTtjmxgIhv2f9WaoeuE7utLGyX3mah2vMiBVMTjXW/io9oFc/vjq4G3M8hmRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Twmne1MZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=di3TCsG9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Twmne1MZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="di3TCsG9"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8Dg2B692877
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 10:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+wmvz3/hhyQfymHRBOe6Vev9M+V/PwrFjFJeB4f2ZXM=; b=Twmne1MZNzuJGeFf
	3B3UrzUItdxZ/zG4NvOjMZbu80p/s31EiqiQtTJRqsTWfkmu2/6f1id3sjhNHYuv
	KEHo/Mbna55pl9m1nShgTsh3GmKcly61YKMvLaRE3+pAkpxS8+eUB690aABPIqjS
	mSvN7ttWr1pKhATWIgB8q9Gvd+RfU5YJvRV7m0XrTyNGooMWCx/nmVxnBJUPnvVD
	EGprhom7G3x+O0WY+x5XD1n72i8KmxCYm6qAPHVZ2GaS/ItlIEOShIBAGpjEjEn8
	bZNOjnz6difGSuCY2gbqC2yAzj162jU62eCV2D0oMRE68br8YFZbvq0rZOuTjN7M
	0irKAQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eux2cc4xa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 10:40:29 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84540760dc9so878284b3a.0
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 03:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781779229; x=1782384029; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+wmvz3/hhyQfymHRBOe6Vev9M+V/PwrFjFJeB4f2ZXM=;
        b=di3TCsG9PU2s2NkCHy2pJsAB0VDQEH8MCPlhf7jIvdVW4qmBJUKlYEYmsIUI+L+nFI
         06+zCiGdkzHSHIctwseygPcDQkthdasJXN/fp5+qQxCndgeD9rHBSnaH2+OGGVr31kSR
         k7g0YOKEmd1EeAPMqX20jkr6ka4VGcA/CRcbV8VT6lTgnJ4YctWIc/MC0fsIKFrcMIaR
         eeZqF/whuHygA+5z7DJ3X76HdCjQL0vubLKbzcRlqrQ/SjreEQZa4qkgVEThW+JejsoO
         /K48qNVq7Z0LhJ0BSt76UwhGKeSxtZmlbcgsHNjYXbmjqwUAtSD1+O7I8CGuMQ7w/as8
         YjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781779229; x=1782384029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+wmvz3/hhyQfymHRBOe6Vev9M+V/PwrFjFJeB4f2ZXM=;
        b=WApTtp8f+VKtuE50Y0uu7vI34lE7GPHBDHuXJmalZamF84SSSpaXtxiLDRig9uAtCn
         n/ZUoczWUHqr2QzNBOXQ8wrCV2lUtqfFjr5KaTWTxGWHts9S/0Ew5+6s5eba59Ae/SQB
         hKxexcB7hzhiEMFcX54DHS7lC94q5q4TkFDUHMELfoZDRWN7nXGuQz97UUxMBFpzUUHy
         OWRtyHhYtAQZHQanDsuwKDVIjt8XcwIeBd7oYyJa9dphZ3HdRBAqyDpAbO1icDVhzWuS
         +fMbA2oSanUHxkntNgVdYWfMI7rmYcxUVljd7o3ixxifCeM9H8ImEJ1ixtThSLGPCAKj
         pIaQ==
X-Forwarded-Encrypted: i=1; AFNElJ9rOIwszfJ98w3JVLhA1d3k2HOFfIfXJgRXq1xdg+ujTAWLoyWy8FI2xfjLI2R7VmXIfeJhOTg3xe4v@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8hqi2CDmKjEwGMen6JuvK6shXivLv24l0mC478s06t21EmE39
	59TndoDudMRf1kn4eJe5fp7J5ClLhiWfeJ3sqv2qhsJiijrh1AzHe8cADVjoYxU+A/gAu8B3OVx
	BaqN4X71H7o2PQXzJNVOrVx3z9ft3A7UDRF3NV8GFEzqeUqdr6phbxu0IKs9YsiEY
X-Gm-Gg: AfdE7ckexfzNKeAOPVFLMoh6iN+E/bi8eR/hW6IuyzYO8Z7h7A4mxlg4gf6R2repNT1
	scGOJuu0YvRlxywC/u9qN7bVffPwSutcQ6imGUx9mNcSqciQ0gVxxiLgxqFVG0Mtht39g33hTWc
	VYAxUwb4bH2iuhLYtWnZgfOE2MrGaSg+pCj70ka6og7n+i3NNe2OymRdF3WEWb18VEf+Z0XDiog
	il9/uT8JXGKIJhcBmqtyPpKXbAjTmYlGkxmElz4rLFd63V6yylAWrOh4cxzySe+tQysABVk68Am
	ahgfeaiDHLkUpQwg9VZ0rtcUGX7/KenKEDEv1pZWpoS3gz5SvKf+XAV6XUVl7VlwF3zyjxZTA2K
	UX4JdVrGKd/JWlOrl9AnNgDVh7GM2v/zOEbpbCKRRgSY8sg==
X-Received: by 2002:a05:6a00:2d17:b0:839:44c5:c321 with SMTP id d2e1a72fcca58-845247b623fmr7831517b3a.44.1781779229015;
        Thu, 18 Jun 2026 03:40:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d17:b0:839:44c5:c321 with SMTP id d2e1a72fcca58-845247b623fmr7831482b3a.44.1781779228560;
        Thu, 18 Jun 2026 03:40:28 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b0112edsm17254731b3a.45.2026.06.18.03.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 03:40:28 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 16:09:55 +0530
Subject: [PATCH v3 2/3] arm64: dts: qcom: shikra: Add Iris video codec node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-shikra_vpu-v3-2-1a32e26a35a1@oss.qualcomm.com>
References: <20260618-shikra_vpu-v3-0-1a32e26a35a1@oss.qualcomm.com>
In-Reply-To: <20260618-shikra_vpu-v3-0-1a32e26a35a1@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781779212; l=2863;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=bvJsSHJn1wMIY2sMhHsk9OqRNB88NkxzAhcUkRGHK2M=;
 b=8HvYdksS9yPrZlLZNGFVEEz26pDMCA5lCv+cWsroIYFY28xZNoDG7uPuW7V0cionndvNgj3Mp
 Tc2ylHH3ANfD9MgmnGu/17z/22QrnBN9fDaaFiaAYCkU+pA3KRl0e6+
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA5OSBTYWx0ZWRfX6Ow7RpfxQwEI
 vLfsdESEZH6J/EbrhkrHUYBxKcs+gNjYCUHKX8HjvJ4qCmw6c1BffQMnBVreHKQIkuRBpp2b7Kp
 Dj3e0vW1XuLExtx4EiVyqu4fnDugGFjNIELObzfoBMoucE/Hxj5QqfHduMV7e9/lCvv8iI10ujT
 XBiTZYqK209R1Cu0AChefP83FwPJNN+ccyCkDWG6OV/fMAD1MSmDaPvRt1/jXAtBHyyd0gnmNp4
 4qs42RAj7pR4nfjKurd944voxGE1At6I3FO+p8oMiGgyRaBPis/HAcp4646/6oEWCQL5PBrUovF
 qx2l/yJa/8rFhW4gzfBw5xKN96bfNG1967LL5mGHb1eAzCKymh9L7cMvEWOUljdvQso5eSBYEcs
 OoEd7PPrChHyulrHTmAoDd+IYTQvAcbKCROnP6MF4VkAdq7NeSt36spuU8iMc0gn8S0DV3rs0ak
 xhgI8I+Jh6fpMn2SjlA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA5OSBTYWx0ZWRfX+cUIYnpBbSyH
 65ZRJbxow7m/2dbpBUR3zl1ZRDOyX//eidoMDZDw+Jr0UGIfzzQ8lT9Qk0nfw5hVk6RCSEmuK5N
 lePQHg4oAbzNvbrVZFE1nQsR9ok10fs=
X-Proofpoint-GUID: vb4HqPwyMJOlZBj7erXVzLNZuhT5Eb_8
X-Proofpoint-ORIG-GUID: vb4HqPwyMJOlZBj7erXVzLNZuhT5Eb_8
X-Authority-Analysis: v=2.4 cv=WN1PmHsR c=1 sm=1 tr=0 ts=6a33cb1d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=R7IlRtgiQXbz3SMwMBcA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180099

Add the Iris video codec device tree node for the Shikra platform.

Shikra reuses the QCM2290-class video hardware and programming model.
The video node is added to describe the Iris based video decoder
encoder block, allowing the media driver to probe and initialize
the hardware.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 61 ++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 1ccb0f1419aaa34d32f3c3eaabdb8727a497b501..d8edd14d1f81a49e352f6939d27ea9cf8bb0f019 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -655,6 +655,67 @@ gpucc: clock-controller@5990000 {
 			#power-domain-cells = <1>;
 		};
 
+		iris: video-codec@5a00000 {
+			compatible = "qcom,shikra-venus", "qcom,qcm2290-venus";
+			reg = <0x0 0x5a00000 0x0 0x200000>;
+			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			power-domains = <&gcc GCC_VENUS_GDSC>,
+					<&gcc GCC_VCODEC0_GDSC>,
+					<&rpmpd QCM2290_VDDCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "cx";
+			operating-points-v2 = <&venus_opp_table>;
+
+			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
+				 <&gcc GCC_VIDEO_AHB_CLK>,
+				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
+				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
+				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
+				 <&gcc GCC_VCODEC0_AXI_CLK>;
+			clock-names = "core",
+				      "iface",
+				      "bus",
+				      "throttle",
+				      "vcodec0_core",
+				      "vcodec0_bus";
+
+			memory-region = <&video_mem>;
+			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
+			interconnect-names = "video-mem",
+					     "cpu-cfg";
+
+			iommus = <&apps_smmu 0x780 0x0020>;
+
+			venus_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-133333333 {
+					opp-hz = /bits/ 64 <133333333>;
+					required-opps = <&rpmpd_opp_low_svs>;
+				};
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+
+				opp-384000000 {
+					opp-hz = /bits/ 64 <384000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+			};
+		};
+
 		dispcc: clock-controller@5f00000 {
 			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
 			reg = <0x0 0x05f00000 0x0 0x20000>;

-- 
2.34.1

