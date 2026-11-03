Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720545;
	b=olwaKa9w9TTkoLYRusboErGoJhto7k96Zo9eRn2RaYHZA8pBYJqZGb/rA6ajzjvKSrT0
	 L4m4D5mP1XUo7d5SnpVzRp8+XaR+84sdo/RgrNgrU/DlSO0Gzz8yL8esTUc1HL4dGX3u5
	 BYjC2q0bfLFrgA4FYLE1sPsbxAWHS0dNA9wGJM4dacN4ppy2euNP5UqF9dB8LlqjdVXrT
	 Sjz5UNOAEXIr8LTZlzegvrdX9IFjaZ6h6u4gL1Q08v+wJMJcHauKMdLfjXQpvHVLzZK9p
	 eZh9+397VC1ws1xnrjGNBcC2bIx5WGc4yjG7mZ/QZw67lsAcF/TJ4R8dGI3L/U0DatA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720545;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LYpvh5ABJXC35dVqO+qvN69PN3JpK9KG3nds++Rp5lw=;
	b=cB7IzD6xabDt1SGoCe4wNWnvxRxZMEGu0pdTT3Gn8Wc8uzNfvZPWBePbbDEskCELoqSE
	 kGhH271Qy1eUSgiJAuRiByQRrO9DlPmmzxlsgRrstuT9etw7jl0C5TT4MREhZetyCsYD0
	 sNMi1BevScsRmfDaBziXiT/Use27vB/OdKB3EA4oL9Xm1pmj5/5WZlcVnCb9k9JzNkB0s
	 TfwLvDeZUFbM8H6sPusHRjR4IM7B2n2EGgVOFmhKVUB+I9m6ZD16ZyFXYnOFri+q5ZIeV
	 vysEqMkY9U1WQv/otBrtFhBsnfP7YXmiaNZD04KVWc5/Q6TaiYyQHIB/mwbLsruEhjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hl9ktrlQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gl+Fb5MA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA72606D81A
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 15:42:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABA72606D81A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hl9ktrlQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gl+Fb5MA
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3E9s5Y4049710
	for <devicetree@vger.kernel.org>; Tue, 3 Nov 2026 15:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LYpvh5ABJXC35dVqO+qvN69PN3JpK9KG3nds++Rp5lw=; b=hl9ktrlQhclOT/P9
	TydcD+xgfIcw1EmQTPkrj5MKsewytIU+HB2aQnVvyTKo5wri2v4kc4z+9GfEgQWu
	aVu/9g/+zo+Ht0ED5FCpRlcIWMzbcKMzRZnDrGwd+ephat3VUk5vBsiw7PJceBFv
	db/cxgouH0QJYHeKSxmtyS6nUObLRsnVKVtZV70NzVgFY2W6hPgD20rXG/DlkxWE
	4Wy4KNFewqLj6tMyW9puzFe89lUEH3bQojcwa1P4K4CXxfUc0qaC1m4h5jDHmE1b
	V1xU8VE6veH7n2fbat38CUiiiz7oKunIa6kf3wsivWp+ve+5PHhkmx1AmAcS3PhJ
	Sfozvw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq3uy3mcp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 15:42:23 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1aa0fb7f157so6601975c88.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 07:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793720543; x=1794325343; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LYpvh5ABJXC35dVqO+qvN69PN3JpK9KG3nds++Rp5lw=;
        b=gl+Fb5MAcoK09QwqafIvifmXuQLFH/4+lRtD3mRLkZsfQhCk9IrGHiQeXC4PTzERNq
         dxZaXtymYKkX7sGtC/2pFE8V0iWXMndgl4Lx1iOFJqKyxlpIGJMK9V6aea7W62JmhAoP
         fsBfqaOfrm8uz0Nks1AMufUwQEqgg963SiohWkdCEArW9YKCJL97+uho0nT9pEeW2Ggq
         1qmhc39Uy6WysVOZYuXMEQM+p5WuWeIr8UU93MdeJekFVc53bJBmc3odx6oXcy3ruiT9
         MkwOUINGANrvSKOhsTajWQLVq0kWCF+CclhH2BuDVcCqykcFCkgimSWg1eQFANZfQKuJ
         hVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793720543; x=1794325343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LYpvh5ABJXC35dVqO+qvN69PN3JpK9KG3nds++Rp5lw=;
        b=fVmyORt/4vs5kbfwUlQw8LMf2al2lkn6soC/VunY+MRT557MsijARtTLPOPqmJyjhu
         VqBu5PxN0Uhiz3cMonwnq2qJPFbRNpSj9SrTG23vExAQC/2T5Ge8xbFI33eBR1AsqKkL
         Fxx4+4+Gau4xOaURhW7bQ2N+7mq5ilbbU3cRpC6H/sd5AX28L1AyaCVHAQ787G4dLrTi
         8yaXEvVxR4CZWkK3ZOsW5ic/HRkD32RWIj1XtffrEYm9YH0T3/pCJASHv6+lkNselWcq
         xuDmIIvSyamVK9MjImQMcF4neTyE0OiiY8Y03owpsWUHiiJnXJRLjf+3adS+UrUnv6jG
         Zyow==
X-Forwarded-Encrypted: i=1; AKwUvBzJUSTXEVZvUZqJI1sZnMouYdT5BuRITaXwWIA0jrv5zj2zoJJ1veDDSPw2XZDME3yZdJXthtaEQNXN@vger.kernel.org
X-Gm-Message-State: APuU4Z9A3233VXOL4Zmee4CH5wrCjwTwBU9EHmQm9mOfIpjbtg7lTbTy
	Wd0/gIZ5NMKJD696A/nNxzHUssBvM181F6Db9oV4HcWdG0jbl7IJHIFJpixySm3k56t/LQ4Ca2y
	ONWQDY4anfCJmV9e88wUBcBuoSiiE5NbdKbB2BRlZgzEvInuPEc6lDexYxfyf0sLS
X-Gm-Gg: AYBFou1Kh7nD9M6GP43Y0et+N9sKGYYlqYU1q82FDvb80nxu0jZD6swqm9yelZOtR0l
	hwfG0dwoI7GvgmCkn7lZjpDY2WgXgSuiLbnNp0gY0J11j2lmP/5+IIrf3gD1gsiwmLdkXMCvDNu
	dHalwEY2HUZOhKX9/uMAj/1nNbgzG4X8rW+fpIlqXO8L6P0bnE11pc0CiRO8Cx+Y0i4sX6EaqIU
	GSGrtxAwUr4i3Pk6hJ5+kA1Grl1zur1bi8Tc4fA/aws4qztXCX/qTp73rcZai47ldctdwi31tpw
	4zYvKySffMcjqK89pyBjDh87PbfM96Eu/CRQVBpz2UfXJLdz2IL3LmVrA1WB9/enmqPWGW/bXWn
	NQvkJ/IJxhghGWyEjvhH/9lncbkj5gEKZPHf4GCaC0az2e0kNa2Z7AAY9VrsHw2yBpwqJpe+jcX
	aUpN7AFXdF
X-Received: by 2002:a05:7022:4b:b0:1a3:dbb2:478a with SMTP id a92af1059eb24-1ac5c92de5dmr25079860c88.27.1793720542995;
        Tue, 03 Nov 2026 07:42:22 -0800 (PST)
X-Received: by 2002:a05:7022:4b:b0:1a3:dbb2:478a with SMTP id a92af1059eb24-1ac5c92de5dmr25079820c88.27.1793720542303;
        Tue, 03 Nov 2026 07:42:22 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4b08bsm50072823c88.16.2026.11.03.07.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:42:21 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:10:42 +0530
Subject: [PATCH v6 11/12] arm64: dts: qcom: sm8650: Add Iris context bank
 subnodes
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
Message-Id: <20261103-vpu_iommu_iova_handling-v6-11-e4b6ad864f8f@oss.qualcomm.com>
References: <20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com>
In-Reply-To: <20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793720463; l=3502;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=xQdivyroVlCKjvnSmI5q2zXammwafIRBL4quFXiYAQs=;
 b=FxFJaPEgGhvTqmoqeTmYZdS09TShjFSV5TK2duN+1x3jIk4/U7k/4EXx1jGdpNs9mlK9Pb+Zh
 huiAKXeOXXLDF80JTWTAFYhT96z6JxNH5sMCC9OIIfGzvbWX7KELdoa
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-ORIG-GUID: P0yW6p6CM6u4wjfFeybp-v2HgPOwlpDp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfX+A377reHWwkc
 N7BQ0n3WU6wIc5ET6XdqC/PfCg7kv5pVo7fGZCENx5NqIJsL+8rwMuZvXNYHqj4AdgIpapnKWwR
 mewtuygLbGVWU3Plv36NspwWOL8cOHl4IcjcGRPdGKGN+CMJPxHjTg5OvPrVkEKQV/7BgOXY7Kg
 Co5NKcsFBZS89CgKqGr6k/dNV4nJ104jjIwrnVowtiMB/1ouDKltV+qtdFZ4dRAiUGT0ng80iyV
 bvEMOMd8Dtox3WKrfsH5Qukhj3LZw5ykNNpBSNPySzPf/xOx9Ep516BoRK9Oj0wGTTqIjL4c9XN
 x0+gnXCNS4Ghx8kzuGL5QSICZUXc4pTjPDYD5pNu4kIAb/Gpr44dhlZNK08cy/MmHIAfU18uv7j
 skokojmxFNY0uSL4AoU67kwPMBR4nkMF0txzaQCHkj6ghyqS1P7haDMg/yKcelLSAe1kEEJdRgP
 bOqBra6BPATDheJ/B3g==
X-Authority-Analysis: v=2.4 cv=VoG2kO2n c=1 sm=1 tr=0 ts=6aea00df cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: P0yW6p6CM6u4wjfFeybp-v2HgPOwlpDp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfXx1ukcItJaTfg
 0z11M+bqNJCy0cJqsK7E8h2zZe1msiRW1Si+KW+9WSKD4e3teCK5K0soAAUBTs60tV3Rx+mCO+S
 EvjyZJd82/s2GA3lNbauono011EQJa4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030062

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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 86fbb0fd6472de719f5b006ba309430c32397c1c..fd82b83c228ef7b41898ce676bfeffd12c4cfd01 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5274,11 +5274,12 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 				      "xo",
 				      "core";
 
-			iommus = <&apps_smmu 0x1940 0>,
-				 <&apps_smmu 0x1947 0>;
-
 			dma-coherent;
 
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
 			/*
 			 * IRIS firmware is signed by vendors, only
 			 * enable on boards where the proper signed firmware
@@ -5286,6 +5287,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
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

