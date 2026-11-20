Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173123;
	b=PB/BkH+1v2QjYiEgz2LnLidncspJWuWByX4znV783TfpjqZMYtkyP+cEXEJthU1vlxIJ
	 QOZgmauc6pKMn24eabY79Fj2n/FBe/mWTPOKHApzwYH5epGT4BqWTu6uV4XpF3fSLmVhJ
	 m/YrRmzgyM4cHd6Y/dQiSOHfwlhzHlEos/HbuSM3OLdBatuETSrSHIjg1Dv9zHvyA3dXZ
	 Ng4o1WaaHLXZcvZ12kZL5senQqVyj4Q45D/74ZJMfs0fps/2Z8b7ASQlhBt7hCv8lYqy9
	 6Bi3NjPTn2+oJOtR68/jJBNCDwt3otspX4hUAx2GvIIjPqNV2eBD2ecB+NCW1wsaVrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173123;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lE5xj15jcc5cyCI7YZbR77iVofNOa0iPpb7G6xuz40w=;
	b=M/nsUtjz1Baua7I78B2GVT0UXWS6Hxn2tI6CfOc+XG069gz2RE+XbciXTBxpMEX/Og0T
	 rRmYunqoNKCL+TZdjivT8bgYtuTdlEBb6VW5cK89pEugAeGiyR/uFxqesTQRf1XHzV6+8
	 2BL+PFMaC/Yf9pPThiaIX1kqfQCnhxs2/bwBTlqEb7KPhLWSs3skRuPj4E5+Ipg64yZEo
	 39KhjoMsv1ZmPxvW1wiQiOXS/AVZqgIATUBkWr3VBUE1zucuBM18e+EKOiWlgcyljlFAj
	 aumyEVW2ICjuHUAFESDqDvhYFVwHce+OX9GlKpIE3XusHWNKaMdRWqPJ2Tl+mymComg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hG8h5jf7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fLt3ak1F;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8028E606A33E
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:12:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8028E606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hG8h5jf7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fLt3ak1F
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk1sY2433128
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:12:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lE5xj15jcc5cyCI7YZbR77iVofNOa0iPpb7G6xuz40w=; b=hG8h5jf7wZlF/Rcc
	CDBwFO+PgpNGqKlBcHeYh28kDAO2x1JlT4ISO4G15PL/05NIPgqsr3az7CBHB8zH
	ljGzAj54E8s/9U4uR7NCyVWfOIt24EdMNgCb/yFTJkAZ13WHI1UvhRKbFc/40GWA
	5NVP04SaZSg7dZ21FFFyFHDyhm/tX7wHzG39OtnF8PAKOrL5a+8oDcr9tSgqK7BO
	DU3NFPwxKmgLrW2jIrVy31CGu5UEiMIZz4skrYVFqmWxCw6zWdhZJ4+pJZIi6fK+
	OUuMZsguYkfXx4Tvfvku/AA8u3/o1StBeupLivRvjTYUDoW4UcQnr/UIvZSLR5bn
	oH2S0Q==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjj9fhx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:12:02 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b3a348a6dbso1472197c88.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795173122; x=1795777922; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lE5xj15jcc5cyCI7YZbR77iVofNOa0iPpb7G6xuz40w=;
        b=fLt3ak1Flz3yMsy2R7f3RuB8SKmvp5YqVeon8wsQZnhdQRZ9azwWhW63O7crkpR3Su
         acwHtW+cdzu+vzimIbqFu5Rjr1xLpagseTs4kqKfLOr8TQyrB3bvYYJvEconk81ug4Vg
         5YGWm17HSMrR/pRxBUdf/joI+8IF9TX2NdL0tI0rg702I6MhmKM3LTKYz8oCwQJvF+Iw
         NxJVBACYnIQTKSAhrcnvO9artMpsBVmkEDLGzZOSy6CPqtaIgAhulAQZTQdtVfPyEnCP
         /8Tju1aHaDlNQWpy2qNToLSKSkeHu1RRBTSPCvieJtp6fzP/jp3M38GMV1by+4u+XBqS
         e71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173122; x=1795777922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lE5xj15jcc5cyCI7YZbR77iVofNOa0iPpb7G6xuz40w=;
        b=0xVqdoSgIQVFFgLradqVwtCKMG1N62x4yxHQcihXR/CoVae+w7rwjTFzFFNC99IiQY
         SacAZulkjg/RilvYkRH4PNodmYIhcRi/f1RuHUul4FSV0bv5/y/zlC9Js+rP1FCI9sXc
         tmsWTODbqqc/HPsuFD3HMnrYmGPJZljC7d7aDWyt3EfroQWf4RI8x8gVBkP1gW7IEXL9
         4jelGfi/s4oEiWxkqcCVaNnk4ejvksuYHBBWnCmNNMVpqlITh842c7juFOEA4egjxxki
         9AZqQ8KJClbdctB167RRn6RYLnmM0jpm4c+3M4bIChQ3woTtRLcaJEf4Gu63pRO7n2yK
         OYDA==
X-Forwarded-Encrypted: i=1; AL+hErFknI9xsaTfMqK+VZME7SlKvAcwpUqqfT7aorxIe3kZHfBBvugBqGH8AHNsYaMFNi4ip0cZacYzP59N@vger.kernel.org
X-Gm-Message-State: APuU4Z+xTN8UL97Gm7WAKtp/kcI3dpQTv2Vmxnb5MywLsdnSc0Owpo3u
	LseHKOcQp708flly9lFd6v8UJqpPXTDQxt0xSV0SSKAaNUeUCCY4ZM3GxMuL5FKamp67ut9atEO
	KSBFfkqB+FNdh2NeXf27KbYphF6+OdI3+i4J8Sz4yeCBB8QGeACMgGSmfWsFi1eTv
X-Gm-Gg: AYBFou0P4VdAjacracrXClGPqPp60itRELnwsS8/nFE1qYO1YEgmuIOCqDwlRWZLH/t
	y2TPnN2CxJG4wtgGQy1gkq+/fIxnCc/ZBuJ2DqhfYHmH2c25nMBGcY3Degsc+IUKs15YiiUeEB6
	8qvjv98AVEKf3dam/qyVu9M5vlyqbABGju44njKkhSGULSoiveHQ+Rs4TSzJEDJ6m9Sq2XqaiVm
	KnF7tOh7oQY+b4wx6OkckcJ6qJAHCzyqAusHRQP7ZO/SQTpUDLXcMWM+kQDBT5MSKKExaH1Eh0Z
	oqOBAod/2wbhDj1Lsdtt/MBjspBn0N0sn0VDK0P2er+2oPxz8mvkYEt4qX9TC1Mq5cwHYA3jEef
	iD3F2CL6tWl4R8t0+bM+/LmTmgjthDl+Mwh5GlfDeV0/DFrWA32u4fjfegZkd6zCpAGPzEjOnXK
	5u+bwpN4Oy
X-Received: by 2002:a05:701b:2313:b0:1ac:1343:fa54 with SMTP id a92af1059eb24-1b5568b4960mr2485758c88.14.1795173122159;
        Fri, 20 Nov 2026 03:12:02 -0800 (PST)
X-Received: by 2002:a05:701b:2313:b0:1ac:1343:fa54 with SMTP id a92af1059eb24-1b5568b4960mr2485735c88.14.1795173121667;
        Fri, 20 Nov 2026 03:12:01 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm7254229c88.13.2026.11.20.03.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:12:01 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:40:59 +0530
Subject: [PATCH v7 09/12] arm64: dts: qcom: lemans: Add Iris context bank
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
Message-Id: <20261120-vpu_iommu_iova_handling-v7-9-25a771235a7f@oss.qualcomm.com>
References: <20261120-vpu_iommu_iova_handling-v7-0-25a771235a7f@oss.qualcomm.com>
In-Reply-To: <20261120-vpu_iommu_iova_handling-v7-0-25a771235a7f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795173061; l=3241;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=56nqMJ7UtioVIbaYHGKCWesxnXtWYsw/x1i531cBKTU=;
 b=lRvZJjsmKhcuLMAi7DZJOHQ+WUurx0XOetzcQkrDSzXR3Jz0RD6hSGPXGG5ocIdAkXwyFb5Re
 dLX364Jpk7MD8HxJZeVFqQykfy/FvTMdT+DdOoDSXTEdjP8W0m4IhC4
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=FJaOVOos c=1 sm=1 tr=0 ts=6b002b02 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXxG9lOWgJpCSC
 x9SHclojtbbvHMH/DBQffTYGiyn+nmPiSwBsFv8mxuIrD27yI6Ll1CU9mhh0hLxDZOZWx4rKUlG
 V7WLSxkzO8ejvuVjV6AaSPXi1kWypP8=
X-Proofpoint-ORIG-GUID: prQGu_OHkuMIqBpQRmI5vKIbclJhZB3b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX2z08C3pBdQyh
 fbPRVGm9hglIvgINo0hr2g5Ch5yud3zX3priRpkwsV5QyYOyo+CibJNEVqWxMFBSERVYQMttXGp
 DquL42IXik1qs1Z1ckk3lXnAeFDxRcvItaNOwc0Lrk2BHYWDuyk8ucjdvwjENXSrv6uqMmAl9eB
 A0OZNG+Z7FeqCU7pq8NJoIpel0dUhk8ctLodMsEHgnr7Vn6ZjRAc3aOU/70uagDbhyjY5li1bwj
 0qA5tdLh6XxlwWgLz8XUuiQtjxTpvT8n8zhT+QNNx9gxCJ0fha2inoII7zfni1IvpeXhE5u072M
 Zquv9YlBaPwQxp8iAMYkBy3yYwfRgMB4bcjytr/7cs/PKl68y69CWrvpO+Gj3kM2GTN9RLydHZp
 CE0imdEnsXj22xCDe57ETfcRrRXbyQg1N8oKWMPfVvBLt5T2qeHLlRZhJAchfaI38APGsASsp64
 zWKE65K359ey9fYYL4A==
X-Proofpoint-GUID: prQGu_OHkuMIqBpQRmI5vKIbclJhZB3b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044

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
 arch/arm64/boot/dts/qcom/lemans.dtsi | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index e298747c06bc4519d10f3f0765d0d6a54aac19b3..26f5b292f4b7525dbc365800ce8aaefe0ce174e5 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3241,11 +3241,22 @@ iris: video-codec@aa00000 {
 
 			memory-region = <&pil_video_mem>;
 
-			iommus = <&apps_smmu 0x0880 0x0400>,
-				 <&apps_smmu 0x0887 0x0400>;
 			dma-coherent;
 
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
 			status = "disabled";
+
+			non-pixel {
+				iommus = <&apps_smmu 0x0880 0x0400>;
+				iommu-ranges = <0x25800000 0xba800000>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x0887 0x0400>;
+			};
 		};
 
 		cci0: cci@ac13000 {

-- 
2.34.1

