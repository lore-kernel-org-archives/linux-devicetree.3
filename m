Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A67E406269
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 18:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789325498; cv=none; b=RyP64K/0KEEkR3C2rvU8YZ6nqvJhvxMYxPgb137EbakKZHDVhLo2LCakPRsag9PIKxqTAA7/X4XRqPiQ/CxS3RSOLRSUW5BLniayJe/1e93DfsR2TlQU70uNi40JqIC6N/9onfuNCSjwbHcGMJr1ucjiRIXP10aP2t8RNK8Uhgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789325498; c=relaxed/simple;
	bh=gYrrWAAu3UM4XmJOH+Y9uqQA/KhAPozl/f9r3EEBGVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SiQbFN91hHSwqtR+7Y1h6McmPaJZYJ4eS/fFFJb+LcRNm2Btz0hjmc/GMlnlDhPrfiosKRhaN0ZE0wRaGQiBDJb3GlE8Joxfhk64ahVEDNBeMRckA4WWll+DbzHZguz6KkEOM0Ajd95i7cfl0GNNxO3vuNBjMQJrbUVEj6LVUfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TAsOj25G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=buKVnLmK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TAsOj25G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="buKVnLmK"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DI37kx2980701
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 18:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lCZiOT9vk+oD3cSiqrNWNn+aGN0ogRGv3H9bL1TqTw0=; b=TAsOj25GPSVtV4cZ
	/HOAuRYeNMie3g7dc3xikFe5ZDW2CAiyHAw4p0icaxSyabynTTk33tA6b663XjV1
	e03lpPhk0qEHYGfRKcVYOZ2NyfqK/6OMbqQh48vZ9USwls4ASZl8rZ6l55ug3GDv
	O9KOGR8iUibadvxRxA5pmHjsap/iNDLppaGaXQgVj43OnVmrv21R4b9NzDsCzkCn
	VT9n2siWRZI6CmeSbOn97Aic+LrVpdD7XeWv/PFZlBOXDHXsYQf7uH3gVIY4E0QS
	qxaAKN/dfh1syEopLDv1eEt/sEIMOfRvfdoGVzA4fghCkeKLfqK8SCWqKTUaFx6o
	Td0P0g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dkxh1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 18:51:30 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1a439db36so2108695a12.2
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 11:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789325489; x=1789930289; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lCZiOT9vk+oD3cSiqrNWNn+aGN0ogRGv3H9bL1TqTw0=;
        b=buKVnLmK1g1UD7Q7mdUt5S2dCc8WivfxA7Y61Km1UDtn1bgNN5WxoHPdpSGPiUBVMu
         ZFleQdDWsAEPfvYvbvd8UAnWwEWNKFL6dCnll+wQGLXpO1A3minue0pfjNG2T3x6TlV0
         HgfUkUtx6IBCUjMY/vx2mpGBTEb8y/5S9A2kJuFbVLsPEbBNv+cHAuqRUmzQwHw3b+9J
         g4AgxTOXB/Fxb7mLu4r9TyhTKXMoe0suovegSjaCSYA3zemMGgz4FLOfR28JLzuHGOpi
         RDnWotQWyayDQhDk35CMOuG4EjzLtCJCGErApQHp4Zz1IICmpvRa8sp0fsAZcLi2xWeg
         bxyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789325489; x=1789930289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lCZiOT9vk+oD3cSiqrNWNn+aGN0ogRGv3H9bL1TqTw0=;
        b=m0VkqvWb+BPA4hrQ4bNf+7FcqHlnngi0v4rczATIhT7DsmXupwhN61FRn6ko/TkN8w
         +ZqiZ21kT03Oc5BGAOvefMLaY0PZjk7yfOrHCZxFxOaiT9NGeUuf77FAIucPj7ck7xkx
         lYCGt7bo9KbSvtgeT3/jozqfZeNiye8fQnyZMfRMJ2JT6PLZbvT3OpSEx1nAINQ6nyaK
         6sf0skKxaKrQO6e1hesVgeRtFagAHwyE3s/Ha4fzcolV3EJb9Y9Sj1Piuq0aOabHFhhu
         uxsWOH8BcYmimQ+NsflcddJ6iqRBrjv9F00JKAwpMcCAA2SIkrQO8VfgK4WDOWSLK48V
         9fjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFm13PoHN6nIWgyIinGag+hM9erPlHl2/4BvvcrnhlHtBdWscgPVri8ivzZsQ07sl7dYuTTDv+TcbA@vger.kernel.org
X-Gm-Message-State: AFuF++kCFq7qNePALYYCoRZ2rbVsEfAGb558+BoMiYiLsGIVUxH92Op4
	xd167t4+UczQYcuSCoGVWFnyTM5MSpLine9dVIBiYsDfOlf7wPRkXPK9Vo5Uc8yDcss0sKixDyV
	zwUb6b7TcQxqIa8cjkrOeUyzmF54BADXdhLxxV4JMkGiohCAZPpf3Zp+cJOazZPLLoBmotKoZ
X-Gm-Gg: AYBFou0FEVVDxgtt2rYbVPlWY4OrjYjzyNByyY8QMNwwkE/dg/PBAVDsebuwNEEg901
	jWGvias6sN/dLlsTR26EoVOujw9IDDcx+kA5qsHY7dgDijtJNocLLEcstTTKWE4GfntYH+wsuZN
	+17BrP2ANwLfyBhCJrvujmJnkDO7e/gn2PVgT2HabCfGQ4AxoBDcTSY4RF93Int1/O55WYYNkn7
	eXHUDogXf2UnvTLbbZbMBwf/AfFvlBT13E6u4aYN+TqHF/cjawnc2GWCRp48KQYQapd2Z2ijebm
	c2P1535oCky06Uh46Ht5VEUmiZzNWcSCzqZdHFsL3lGSeJhRB0DU2gdEZxUx+C+uuI5pt+H0FHI
	w47EWYAsiIBiLyPxsAFy6OAhG7VWctUyvtN4=
X-Received: by 2002:a05:6a21:7e0b:b0:3da:f32e:b3bf with SMTP id adf61e73a8af0-3daf32eb452mr21465250637.17.1789325489129;
        Sun, 13 Sep 2026 11:51:29 -0700 (PDT)
X-Received: by 2002:a05:6a21:7e0b:b0:3da:f32e:b3bf with SMTP id adf61e73a8af0-3daf32eb452mr21465215637.17.1789325488682;
        Sun, 13 Sep 2026 11:51:28 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm22473130eec.24.2026.09.13.11.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 11:51:28 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 00:19:30 +0530
Subject: [PATCH v4 13/13] arm64: dts: qcom: sm8750: Add Iris context bank
 subnodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-vpu_iommu_iova_handling-v4-13-9b9074a73c41@oss.qualcomm.com>
References: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
In-Reply-To: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789325376; l=3606;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=gYrrWAAu3UM4XmJOH+Y9uqQA/KhAPozl/f9r3EEBGVc=;
 b=Y4eeAu0k6A/PwtRusPc6pQKOgvqS3Nq4tR3EDHA8bebt+tl9fO5k0LCZEe/M4OlMMlya8km8d
 rDFwu/fzA7bA9mLcVEPilGt8+xCC5/GeMbmbLGH7nxkzQP7G9Vb/84k
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: 4uqls7vgqyP-rF2gRxOfUgdxo2n5C64M
X-Proofpoint-ORIG-GUID: 4uqls7vgqyP-rF2gRxOfUgdxo2n5C64M
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa6f0b2 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI2NyBTYWx0ZWRfX0KmoxV52UaM7
 Wvck568gQUef31gYtDXTzzsvTkUXa4DkbipVC0JVv7DqvxrY2tKGyO1ILhjnIYWskiYJSTYtu29
 7cWcw4+EdvDn+qqHaeMyczyRqQ/jfVk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI2NyBTYWx0ZWRfX/DqarxCz6ta0
 XC5bQChyNT5HTcA3EzTkTawCkxHczK/pd863lThQH539yze/fiXd6z2GG/JiXd4zQXXWsg9IB9z
 z50RBzTisujcHqfX4K846w42/BwNNxlobNLwy1zxFl7+rpAqABBpfISoAJKzJ95csMGlHeDdZ3A
 Ap657cOid9JuKbAqezwyCwo0yizKsyfyYYo6/mVjNzylXqKagOhvQNTa6AGEgvtajWWrf3fZN88
 V69/CVG4Ov9keJVFxmfoYal/qcrNloAqJWgBai7aRATvli9YKJI3fpdv4yGt/nuAfYXk0fzl4zJ
 x4OWtmGX8WSi/rK6KGSJJSNHSbufyQiSzmO9GbxsW5OyvQq/CVaq2ktR4OzsyheoYqe3J3Fyy/t
 hjSIcv/jGYhGvsFdTRHYkvfG/k/fWn7MHpF/7q5qg1A8Tv8xQfd537Q8G51IXNTKA7hwHrA25cf
 m86oRtP4M+yAUjHDO4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130267

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
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 28cf22da854d01413b8e86be3f6330354aad05f2..2e1e07eb5b6aa49850a7a5572ef9e755e298b799 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3025,8 +3025,6 @@ iris: video-codec@aa00000 {
 				      "vcodec0_core_freerun";
 
 			dma-coherent;
-			iommus = <&apps_smmu 0x1940 0>,
-				 <&apps_smmu 0x1947 0>;
 
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
@@ -3059,6 +3057,10 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 				      "core",
 				      "vcodec0_core";
 
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
 			/*
 			 * IRIS firmware is signed by vendors, only
 			 * enable in boards where the proper signed firmware
@@ -3066,6 +3068,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			 */
 			status = "disabled";
 
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

