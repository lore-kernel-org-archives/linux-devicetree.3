Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBC9399348
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 06:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790404547; cv=none; b=K1CMDEa8x4GB/osLzTq6ogtuKSRkJQo1WumZWIdFJ8UGQxprF6kvCcNe8tzLgL+K6fBZAnVQnYrxDSMxFoAaP4l+GEjs4I8/EeK5J2hNXDneSym5sLc64lQcGdnpJWiMK8evhuaTHLdaXRhqsplpk0mRjF39n6EKr6UL557qWmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790404547; c=relaxed/simple;
	bh=aMjd9aYFnA7xUvSYKyRihpubAtnTpKk18gq2dPNLq2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jGDRXs0kEFiRMbDFVgsdu55TG+TLc1iRYwro7aM+adv2ro2mFSFKCDauBZ6iNpnlY9TIRm140QA52UFPhnVOssYGydsgFmGfP5GgCWoqcElCOEq4HjJW+CPpLACUpf2jUgov2wp8pfS8RwsStc7A7xu0yMl8/Vo5z49sKNGpcUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mzuNVcMc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XsnchC/P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mzuNVcMc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XsnchC/P"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68Q6OgE33267714
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 06:35:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V+x7UtvEzgjdSrT4tt1OzVc4/3CO9RvMlBltyh/a/30=; b=mzuNVcMcwtQYq1/J
	24JOcipfQexlxPfqJnHv+9mKGsz/fEp0i2sqBpwbQlf3iepKzrd/3GcI1xPbJ/1n
	IeUpMlsbqch3GH/i0HloKK+tZCjYEWL+AxWwML1LAKGAjpvIHt1Qr/9VsRxvqeNY
	JGgl3/ylig7nD/mbvvP1aTIPZXXgXHuWlMOLdVPUXQZSVyxzhttx3UHLlLOiuZLn
	gS2pJTXe0sc47VF6kco/Cck8OaPrS8NDgDLFnS4i9wZ6w7vel13mVTm18DUsESGm
	+bL4Y6Ch43qqbU5lCXu/EdWYfOI2k1Cw7mSwtjlcYXNK3AfF1fx4nkH7CH1nYvYo
	D58LRQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx3dp0ndy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 06:35:40 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34316295d86so666958eec.0
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 23:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790404539; x=1791009339; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V+x7UtvEzgjdSrT4tt1OzVc4/3CO9RvMlBltyh/a/30=;
        b=XsnchC/PFP0E27vCGtxgKvWxszlPiknXtdMlRUiA+t4oaTKz39TNJhGd6kGPqIEHeR
         v882ixBfVCILjLasw/VAQcIQnbdWaOcfLt8Ur/OtrZ5su2Cv4mfCnr1lfH7H7+8yJOUG
         oueD1MYTt1B8Ok5cf4NwyAEvoaTP8UbmvCDFX1GHOpQAdyS18OFDJr/mvLP4YXodivMH
         KD+K1Ytu9/5NM78Cqjle0RCo+KcHvRkl/58UAdOxmi1YAno0k5MDgGpdhrHckaSATnTR
         rtkVQLDLAPCsHw5ogclEI5mw6GSrpzdZiquIGMkDN7d567lCCMNrt9JjS8KBPD0oKH5J
         aiew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790404539; x=1791009339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V+x7UtvEzgjdSrT4tt1OzVc4/3CO9RvMlBltyh/a/30=;
        b=GlEvwfbkfowYEqMVu6JzlPCkYFACebKz1OtVzhcj31IAuIrkwqSB2KKroPInxVBq7N
         GzZWQuaiYdkKAp6Ik1Ju5SP0MiJVZwmCdn/WtLu3l9yhLg+Q70EG5D/MkhJNtXa50ZcU
         8yvuDePoG/UzEPWizVhuE3eMmlHS1k7F+a80GTtz+3n98c8dsgVMHT3PA1Iz2pn9ZwHW
         EPv4TxZmXAGTKRvYCTZ4vU/sJBJ0m7Yj9/fU3Ho7GVe5KeEmImJ59ysPjqi5j1j0G/+l
         sridXL3VoyoKhA7W7ozeP+KoZUPdVMYSsQA/NruN2qf/P7H7gfhDNi5wTwtP69jTcP5l
         B9pA==
X-Forwarded-Encrypted: i=1; AKwUvByZvTtOJ+SKzOmbwLVN4b4mQ4l60eENJfndupZ54eHVdQledc0LbcK+/cJ0swEP272YNNcJCOcfocVr@vger.kernel.org
X-Gm-Message-State: AFuF++ni3ABZfiCnNP7FmBecrWKBLkj5XpaiprVeqFbSrd5/nLwosNWK
	0N74cce1bb1zHsVhCP53pebNjLBaKfz1W95oGlO1K2sKino1GgbzYXuQ9co/1D+BymyRr9NikVS
	D4/u4+G828DbZjqRYyQK4SbWrjo3q2AjOcJMwvt1Qczafyaom5Yp34X19+4fb+qDh
X-Gm-Gg: AYBFou361g/rs/PEoGMsRRy+cVr7PlZsXej9/qy2dec/o5B0VYrJPHwNyhWvDDXBQVg
	VWSAGOSReKl8QlmpPsJBox5P/7HINMMGaK+hgriI1c1BXfDWgdBxmWBCIITw1suzrlzfDNCPp0Z
	9PXpEVWxW5upYFIaw2CLrkmJJMrovUrd7YYT8oDIZvSSeUSud+yDWIVPGlwpWQgz4NmJE0ItBCg
	w8+tchv9lvKQeR8K8VxVppsUUfP+QCas/R0oVA9lXbU3pY1jmTPfTuPFCUy7EOb/tPm8T/r8GQt
	mmoLp1iAuVclUigWCX1bp8XDiLjcNFaFhOQanUouH9Wi/Jh/dkP6aAPSMNEEilFhaUwVZ2h93eO
	sCEr2IJ2L3mTeWqthPV0y1iw2DmkdOBI4MQ==
X-Received: by 2002:a05:7022:f515:b0:141:b2c3:d878 with SMTP id a92af1059eb24-146cdebd135mr2129840c88.7.1790404539128;
        Fri, 25 Sep 2026 23:35:39 -0700 (PDT)
X-Received: by 2002:a05:7022:f515:b0:141:b2c3:d878 with SMTP id a92af1059eb24-146cdebd135mr2129797c88.7.1790404538316;
        Fri, 25 Sep 2026 23:35:38 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc45f03sm9700691c88.7.2026.09.25.23.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 23:35:37 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 12:04:08 +0530
Subject: [PATCH v5 09/13] arm64: dts: qcom: sm8550: Add Iris context bank
 subnodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-vpu_iommu_iova_handling-v5-9-0322ca5dc10c@oss.qualcomm.com>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790404457; l=3295;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=aMjd9aYFnA7xUvSYKyRihpubAtnTpKk18gq2dPNLq2Q=;
 b=VQvWNv0T3/I01JEcmNNQiuzm889M2nZWBkO+kcBZXIlPlhrREBhiKxukdBGS1EUV5SbvQzK7w
 bD+1onMbM7XDs18PJBecS5Dtr7XXfBQzP28iuonhpHJ7TInL2lNA60t
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDAyNiBTYWx0ZWRfX0eY9XHg4xgRT
 zsCyAHCMuoRzQ/mPkfO30kN2Yx8iuvui2WMR40LF29lVo+WqwCcjFOyYkIdIn2GWaTeNT0oKiaR
 jD9RhRCzhACZfKzhm8vOALPOiMJCf3QjXczQq2WJR5kEAj+E9KJmfD8i4yXkFSvQPRtV0WvqRUV
 saz7+Ee5Ncb80lawKEOwtoSJfgGhPZRjbFj+bvjVGJf2HpIVJdDvRSUA/hLp4puCoObwjCY3UiO
 Lrpk2c+CzPwFcyf7oFszXADpp3VpSDWgadIZyqjg/Xzabd25X9C6MoavPezb0Qh//tE2mMolYbo
 VzW/2lFZmDKvKwAkNcZPqvf5KCvKeNALyxyGQnM+/kukotLdQ4M+oNlG78Br/lHODjMNNpe06qg
 6Jc0nzZHzDY1ddv0R8ncYPf/bUtInOd2ZWyGVcmWmTfGs9PGWcAuv/O0OP8n81Ipg20B7e8Y7Ve
 niTiFxF20IesASPjLbA==
X-Authority-Analysis: v=2.4 cv=QsXLTlyd c=1 sm=1 tr=0 ts=6ab767bc cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: fXjarSR2eVvGLikM3K-Wxt_XIBTE1wlh
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDAyNiBTYWx0ZWRfX1jLV/0kVlOqz
 XF4uRKeyh7BNiJx29nXZDjItNqfphiZG0HcaWeYMo0LZLxmNeR0UDS0VfNgYA5Km9/r2/Sv5Qyp
 26AF8Vp7dndUAFwo59kudiKpYQ3Tw0Y=
X-Proofpoint-ORIG-GUID: fXjarSR2eVvGLikM3K-Wxt_XIBTE1wlh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260026

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
cannot address the low 600MB of IOVA space, while the pixel stream can
address the full range:
    +-----------------------------------------------------------+
    | non-pixel stream addressable range (600 MB - 3.5 GB)      |
    | 0x25800000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
    | pixel stream addressable range (0 - 3.5 GB)               |
    | 0x00000000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
A single "iommus" property on the video-codec node puts every stream in
one IOMMU domain sharing one IOVA allocator, so nothing restricts a
non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
that boundary the hardware faults, which shows up as unhandled SMMU page
faults and spontaneous reboots:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Given that the address range restriction is for specific VPU stream, it
should be ideally be moved to that stream. To achieve the same, a subset
of streams is now represented as subnodes, so that each can be
associated with its respective addressable range. The design was discussed
and agreed by mainatiners here
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org

In the past, this limitation was addressed with an iommu-map approach,
with the iris driver dynamically creating the devices. That approach
was later concluded to be a hack to avoid having subnodes, and was NAKed
by the iommu maintainers. It was discussed in detail here:
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/

The video-codec node includes address-cells, size-cells and dma-ranges
to declare 1:1 mapping for DMA translation to the parent.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 23604436add303348867f890890f2f7af4f831af..60164b853ae0764cdd79c4680490e66a548b0613 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3690,8 +3690,6 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";
 
-			iommus = <&apps_smmu 0x1940 0>,
-				 <&apps_smmu 0x1947 0>;
 			dma-coherent;
 
 			/*
@@ -3701,6 +3699,19 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			 */
 			status = "disabled";
 
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
+			non-pixel {
+				iommus = <&apps_smmu 0x1940 0x0>;
+				iommu-ranges = <0x25800000 0xba800000>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x1947 0x0>;
+			};
+
 			iris_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.34.1

