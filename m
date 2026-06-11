Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61F6364929
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 19:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781207424; cv=none; b=WF3l3BnQpEIYFN9RM17jbAs0gFe9HH2Okt0Ek7hsI7AP1bElSa+v7GDhoGjnLwDtqG55w1uuSkr475buBvigypLNz5QDvhNHyN2XNi+9Bpc1DXWENbtKlu7imkVtZ+zi9ocTLXE7n7HbvSchgOKVEDEELJo7FZs4llxcqKimUjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781207424; c=relaxed/simple;
	bh=as0sNBNm6me0DlHIcQsWjM1ap1XelPu7sW9swI/nY1A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d/DHzN3YuE7gsmXP4OGEQLt6Ycj4TEgFrcWSH1qJpuiX6kSsuup2XUJ87Zrd2GuQWXo2IR6EDm4JVOMzWaWN8YlFaD3ScnRzdH47tHY9tlLwBiZqD4KudMmBPDzwlPo4LIjncEY54uprKk58dG2NdL5NSycjmB6CqotkHkcGuis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FwcXw3FL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JRVX/dZc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FwcXw3FL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JRVX/dZc"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BJ3J6A1482209
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 19:50:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TvxXV7ZjPo2q3O6Cjs1eCezvf9qSl+w31CkK6I4ZraU=; b=FwcXw3FLwyRhYs8r
	La28tOJiEgZAx6VPkCEJDLhvgOL+9OqrM6+zb3od2H7ZFEhYeRd0fWbhQ0mYVluE
	lgvrO9IBYkTaZoulUOI+qzqdJbOWst+3tNUC60gu1ttDpzKVdHgHJTd5sCmlcR39
	3aTmOEI+dlWtjbZBdTzWZBmWI7e62widiUChJ1rNk+uQ+5Gx3o24AUYDc0Rv7Q/t
	jqFmwWbhgI+xyAJ01i9BRaO4/MHgkFBzeRMjpj/ahdRNzxffroGJMMMP6dxE8bRd
	2+aDh38h6+DqTxvKSAaFCGA5A08e6MnQxqyYsnG81UYeqPFTVZ7Sf9A3iFHu8bJU
	aY+y9g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er0xd0svh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 19:50:21 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8422b1354edso282248b3a.2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 12:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781207420; x=1781812220; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TvxXV7ZjPo2q3O6Cjs1eCezvf9qSl+w31CkK6I4ZraU=;
        b=JRVX/dZc7RULyYv3m/Sv0pJjQB75pS1NSKwGe46urU9TBJkztH0blaD/qOkgNkX8kN
         xuTPmr0EnTAydHn+Tm7kL5zy7Jcrzd4MRJOQ0wpD7mbYEyw1YnQY9vgREwv37rFwSnig
         NdOLZ8OfQDJM5ZiuVgyY3st2joONo18JsLzwr3D9xX9tO7QSiwa5GUSKo1FmYT4pPMja
         /lY3HJVRcUu/34SX6AFYJ3Ria1FTzNatzdXe8NsovoQOqpp5rdxaNbsfC8Vocnzli8LM
         jc007UfDUwiEc7t80OLAODYKicKrpx8jjrhEVeYvy0l4Pjts+nO1yrJIjC9y9xvbN6De
         6edw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781207420; x=1781812220;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TvxXV7ZjPo2q3O6Cjs1eCezvf9qSl+w31CkK6I4ZraU=;
        b=oY22G5Ckhr8aeAab+YXnRQhfNwigf7OctRv0Qx7dQrnvho9iL5TlZ+J00uEaF0xo3D
         xAsm+RVReUTFHClHRh7sW12iSFU8XDqPAgOp9NCiXBZqEv40IwJdlrZbi+Yt/pri7zcN
         FTQGIWiMEIy66ugXIC7S8FLJePTGz32RVdokD5h16iQnJ/uX5e157XkMBAZ5NJZGVa7y
         dT7gD9kst1qgbDalMtYs4ChKWdYOYw8StasPOCgSTz8XzO/ydoFOlFoNTcHUH+le4MjV
         mIG+mFcrPkmUtV04VFNjJOj1mjQsQ0Y+EWIvN25eVuXXvH8QFFHYeGIRmjtfKuti2Z8f
         26/A==
X-Forwarded-Encrypted: i=1; AFNElJ+nYhmyhZiVVmtpXf/HYbDAoDcFY3N7f5l7Opg1fPnMk1/PYfN8VFYscfaV5JR/0GhVn6rZNvyYLa6u@vger.kernel.org
X-Gm-Message-State: AOJu0Yxao2bA1ay86L/NQgtvE04AXIjQxDciE9zz1vyyjr2Oymg6Lgnt
	xThMUtpnQPKFCWVzMsLaybkzZA1eQhIz7RwbPjvbqckTB33tysjxNfIS3IMopiZycOmAHzO276J
	SN2eRazo8UVl3PC0imNcJ8PgkwjHReBCyRzpFYE1KSgOgwlOYFWOI0PwsdWGUr+Qc
X-Gm-Gg: Acq92OE2dC/X1KWyN1NTsGD5R3gHticPwg0Z2BPlbELVWrPlL5s4OgVfiRDYZIN8weF
	jqVO4FSToRSHUUQYBmgw7hSp4oZQOfGVAd837U2knu5WaJDEWQJQZkgzZTmHGqQH7oSXDaHbtQM
	0EH/6t4ryKT34aslw4VVcd31UIuLQ14ZWE641P6snUzM8rq6PK6Wwf737wcs4Z4BRAHIIdO431H
	4n8/09JCRPbgV6sFfb0IK7c96C0xPpaSG7ACG+RRhlZmKY26TvDIgbhYunCw2hFB17SNsdSvhqp
	Swm2lJy2eKGC/MXcQvqpwtOQz7DCAhlZjiPIHP4mTkS7jVBwv8s1rNMdpq+HPfzqpPGb+xGRmmS
	FguFvFaCA+iAhJeyIohdC5aduBVIeEzrpuAjZwCDZtIvfz2bgeLTnQX/M
X-Received: by 2002:a05:6a00:39a7:b0:842:55b6:f5a1 with SMTP id d2e1a72fcca58-843367ea854mr4997067b3a.6.1781207420500;
        Thu, 11 Jun 2026 12:50:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:39a7:b0:842:55b6:f5a1 with SMTP id d2e1a72fcca58-843367ea854mr4997048b3a.6.1781207420140;
        Thu, 11 Jun 2026 12:50:20 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-843380c93d1sm2711872b3a.36.2026.06.11.12.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 12:50:19 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 01:19:41 +0530
Subject: [PATCH v2 2/3] arm64: dts: qcom: shikra: Add Iris video codec node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-shikra_vpu-v2-2-bf8727370a1e@oss.qualcomm.com>
References: <20260612-shikra_vpu-v2-0-bf8727370a1e@oss.qualcomm.com>
In-Reply-To: <20260612-shikra_vpu-v2-0-bf8727370a1e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781207404; l=2862;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=as0sNBNm6me0DlHIcQsWjM1ap1XelPu7sW9swI/nY1A=;
 b=MAIMFOzEl5yCuvOvAfgQadMj7g9G4RFnLe+nMQzFITlYAtUzJuvyL7hVNYCXokr4kx62H/z55
 Uf6xZQJGdDWA7gM8B0GCTS1IBnLcNxByPsVSLzPTy3Z/i9REPyysolp
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-ORIG-GUID: K1YlEwy6Aacd2kVp6QvnJHWpDsPbx9H4
X-Proofpoint-GUID: K1YlEwy6Aacd2kVp6QvnJHWpDsPbx9H4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE5OSBTYWx0ZWRfX60UJIyvZd08U
 RHDYM4mozPkCsUZzLBeKOcG5dymCgnXfVFy6FqJVffKwAZF0bdpmjzoMoDvsFd7PU1f12yL2CyJ
 8ODGrc9A8Cokrqus7V21yWcuyzI3M43H/74Dc2paGGSouNNfvV8xn5UOG2e3VjgSpYUfojgwcFn
 PamdJh80hUIaz4aKvRPldHUckSRuIK66qf2Bn+K0viEE0BMit8/A3HAbrhJJqEseMQPr5ZpTIa3
 ck9jmSD8eOsO2uGTAAdldN/aLszShXIm5IPLalz/7pgmtGdEugE9zgTY+MibjElzwDRqHPu/JTr
 UTxZT/QvqhVT3aOoam3yKHqdaIdIzLPMgjps5c9VqBm6tyq+fxdxRfhpuhosWfDhN32UVSyiEa3
 v5ioLEXu3qtLgTrksOvAvzhBUo++0RHRVNTb9sUwfaMTF9hBbmz0op2qP2LaATy6sXPizPZ25S7
 U5G2U7Zrxvn3yFixYDg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE5OSBTYWx0ZWRfX6mvrhfWKtLr/
 wxSQiK/RhnXDHWaxBTkQFkW6qv8gxpEQGkNpYk6stH65/svERC/cYcyYM4p49UM/s4IUtcmEi2j
 zpTirwB0d81Y1elk9A7BzU38IU+z2bk=
X-Authority-Analysis: v=2.4 cv=O6UJeh9W c=1 sm=1 tr=0 ts=6a2b117d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=R7IlRtgiQXbz3SMwMBcA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110199

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
index 1ccb0f1419aaa34d32f3c3eaabdb8727a497b501..b77cc9d7d65a6876b4aa058c4e0de8c89cea81d0 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -655,6 +655,67 @@ gpucc: clock-controller@5990000 {
 			#power-domain-cells = <1>;
 		};
 
+		iris: video-codec@5a00000 {
+			compatible = "qcom,shikra-iris", "qcom,qcm2290-venus";
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

