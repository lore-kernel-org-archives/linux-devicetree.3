Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720493;
	b=nBnCQUaXC5T5GPw9LRI8KbstD9wNXugbuYhZDRUaj4tlbxuQWSrvc01o/jBXonx+Oont
	 TIRIujsqeWUeXUWLyvS5a12A9N6O24FbXHca1HdVvP3KqtGjvT8rSbb+quoe2KRSBDgQA
	 bYR19Rvj/DOTlhNgs7S9ssIvpLhBNdOj5xA9hrrq4QIflqOlav3HQryY72ee/RPdjFVd5
	 yYJjNFJtxv5A9h9WsYcLM0u6iK5EMPp3v8VBQDUHpeuIO+fKsJljWfR9NJ8InNtRTSiNe
	 R7a59wJWIl544carbInS/KHMG3wBCQNfbwwfFP4cGACIJT70tKYH/N/5VtHnvAk8yNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720493;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UFyVGKvWzfLCM7ZESFhQabAqKjSsfD9BF+7+SB0eaNc=;
	b=yGHdcYhtwzgp4ZpEviVamKpS5ozgs85TNQ3zHnphejl4DqDFgdOGqam8qbipgP3Zl+Ra
	 Xna259KqjdMrL5cGkp3hJj6ZYkGuq5hu1XOfbQHMIKn5Vm5rWQT0t5egTcx+dRR2sK/4O
	 Q8Tb2s5NYJQcTYpBoHw1ah8ySAxTl/UJ0uHM500YWGS+xpos5/jFHFwh/WGgZlOP6tcPC
	 hPR4S7QriVZqeF/MENhnbMZbkX9/f4YpmBojGJrXH2Ap6gLBpKGfS7o6DVhxEzBX/ILgZ
	 W5rR/d2sJVoVO+NrOxQm2hUtBZ5cWEfnKTvJNJodYhGeWZ2o+/IDvdlwlLOoIAzGrsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E0QmMA93;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g0xfZUYK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307F7606D836
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 15:41:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 307F7606D836
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E0QmMA93;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g0xfZUYK
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3E9wC92001346
	for <devicetree@vger.kernel.org>; Tue, 3 Nov 2026 15:41:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UFyVGKvWzfLCM7ZESFhQabAqKjSsfD9BF+7+SB0eaNc=; b=E0QmMA93XbWgAj8H
	M5dli9jfvjbTkXod85kVjEX0WJRO7cWlDCk6gLka262gl97U1BdDvgJpQ9Gsrbnb
	C0wX3AacR12co4u8yn5MHSQRv3TPRSoQcQgw5xA4W4o025HykMSqWY/7iyB4k6p2
	xbgvjXneDEs4rQWcJf6ODypeTwDbtas3D7TaKQg0g0T0ExNW+EE7mRmt8+aEUDFD
	Apm/7Xv6ETK+yj0+9s0Z1TGybiIZdLW8cBHcNGPRs/IoOmQBCUB7wMd7Rsy5obHn
	CLE1F4VpP9EZVjagNwB1kwcUQPPYAlFbKIdHoaZUBM79fJ4mnNp2Rw/Brh/alzK9
	n1eJiw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq8u5jhb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 15:41:31 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1aa0fb7f157so6600878c88.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 07:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793720490; x=1794325290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UFyVGKvWzfLCM7ZESFhQabAqKjSsfD9BF+7+SB0eaNc=;
        b=g0xfZUYKu6FSD5sGLpuMHFdkGFTqogjEOxNhb00n4YYvgnycyS4dGFw9tFvPS8yKeg
         q7r2qLNDmVBd0wqQiO3JKwDKKOrylwGg2ab/HuJNa5InxubjrxvYui+4Hb9JUUCe3IJ/
         /aVYkI5QJTnku0jJSXmAuL9mpx4HY0bwuPYbDRxZWGC2VKXXpylITmnOjfy5a148riXp
         FDV9rFiKDQ0I2PYL6ve6vAnVKnQKaI+Sn9L6I3DAiRPZaRODZp5LlIJjQ5EAHVVJnBsc
         TqvCb7/4ty0LBbLPXe3gUrMsWUvg2vfuOsADz2HejJWh8Lq6Giq5nIN9imfZfNlWmlTq
         USpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793720490; x=1794325290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UFyVGKvWzfLCM7ZESFhQabAqKjSsfD9BF+7+SB0eaNc=;
        b=LyiAY4RFgYNG3aRZSqDaDuZ0Ghk9103KUmEtB1fux2eWraBJP0ETCGBVklezcqT5Xi
         HBim9L8XOWH03logzXlxQDmg1iusQhQ6t+asr3zV5cWDM4y7lIlibou/wOzOVvpPsPZW
         BygcijSGBZ7G9Cj24LhMeimYKRYIuvAn8AKgCcU51gjKUL5ofodvsGLTg9tMLRM/yQWM
         7Oc7Te0e52Px2h5Dg4Mma8wnchfNyWMRbm2FkI5sGPQR4IAC0j1h3HX6H6ljYN5qzk9R
         B1NpMEkCUWhjIS5o45C8gPUtES72Dor/8LZWG4n1u3azz5RJ4wPPNPS1Cgli32Oxk5gq
         ozAQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6+C4RWa9sAJkxpUTwAM+upEesDY4rWpREZeleY6mN6LdAAxUBXfIXF50OLSGbWnoBVS6s9BbIr2lg@vger.kernel.org
X-Gm-Message-State: APuU4Z/eBhbBzPLrLnCYrpaxwFkxWMHtdU/x8C/fCc2QN91nqV6kjVFc
	8mIPp2V2zUIUUdECil7Skqqma11lacGqUs70AiMTEjf8YfNJ8IYTGmoIFLCZuF3P5aOqjTkGHUn
	PqAUDoXvtYgsl/P2mQtiXAYfRkNBwj+Z9aUd5JKc27aEjttlIru2cgOIWVKwB0UW9
X-Gm-Gg: AYBFou1znH39U6t9uz+TS7boXNI8tlF1A5Nur4KPP8JIr0/Ypey7wdKmaZDjKsx/y/Z
	dZ9kRS0+rSnWIRmVrNtkZAQhuOAmwLmpOuXK+zyPBvIi8rTOMkXGCqAvsR4ushTabd69lsQQmpJ
	Hjvk29N9WtyQdh9KZsaQhQZgG8F/sufgnUV/2gCT9mCIU01kQcCRB9HQgPkEbeWHH94GUa1Ex+V
	9PF9ACvF15fzZJriXXXk3hDijeLkIR0OdWVisKndHnppvNoDgzTO+ypEC2xudpb2jRjMpXRrFJr
	k7rTkiPbx8aGelVQD1ompYTxSrJSyV06+OUVsner2hNk1byaIoYqYYx3KXJ6C37CjOu3vO88eGX
	Zg9FTDHOrzF5C8e8bV2+JHl6qZGSMvupoBvbjvyGcLyzllC28W9EirC/NqYcYG9mEWoaXD3imsc
	xA8YGBeMSF
X-Received: by 2002:a05:7022:285:20b0:1ab:f77:2977 with SMTP id a92af1059eb24-1ac5b027fa5mr19238919c88.14.1793720489983;
        Tue, 03 Nov 2026 07:41:29 -0800 (PST)
X-Received: by 2002:a05:7022:285:20b0:1ab:f77:2977 with SMTP id a92af1059eb24-1ac5b027fa5mr19238873c88.14.1793720489326;
        Tue, 03 Nov 2026 07:41:29 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4b08bsm50072823c88.16.2026.11.03.07.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:41:28 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:10:34 +0530
Subject: [PATCH v6 03/12] dt-bindings: media: qcom,sm8750-iris: Add context
 bank subnodes
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
Message-Id: <20261103-vpu_iommu_iova_handling-v6-3-e4b6ad864f8f@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793720462; l=3890;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=PnAbHBLCBhwxjoECu5HtUTAmt7Aan6lX4I7y/GynILA=;
 b=cYUCVRBesPsL4x1JYsT2fpY6QgruOLo2lbnS6EIip0eWMHJSxaplVYn+7IkE7PB5HCZsjqcsA
 84jX5FmEwNXDjLTnodiGW1bp59se2rIJhrrMY8u96v0uqSxQcw6737y
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: 41GCZcSGtklaUOtNSyxABUYwzsH8DbaK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfX1Q/Pr2yErO5O
 EF7slIGVL+x7CYm0uw/LolvsteH2w3F26HpJUpOCynXiRqJAulaQtBdXPYiUWM77ncWh1IXcS4i
 E05xLYr+0zbajrN5kEOGZicrm1ihny0=
X-Authority-Analysis: v=2.4 cv=RZ0FmFtv c=1 sm=1 tr=0 ts=6aea00ab cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 41GCZcSGtklaUOtNSyxABUYwzsH8DbaK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfX0TvV0ZuBH+0W
 +ZvKNezCidd0simOPAlYYR00pIsXHDxx4lw9B0Lmck0G3YgK8rcWE0il4Qv3yzomwOsHS8QV74H
 bZ5mBKHC+2Qt4f0g5/ymty5dbFXADtKWPixHNCLd8EXu/8Cztvl8+eFD7mYMHcF+oSzK1bg3ERu
 AF4XNU96+S7bLjEyH5xSH/SkapfrZB6+5QnpcXm/W9iryQlYDJJ+Sj1Rowi//o+Lu3oYSYOcnKf
 iyhnpPSgWgy8m+5VScwFQaHwzN02Sx0bTv0VUJxt3vlTdtN7L+sCuzCY+4KGOstpLQrfC+4vfmr
 mwXNTsmEV1oXt5M748zQcpyHaV8tkR3Neqs/YF1LUYdy6mhSgCD/B83wXh05qlzB3kcrt4RQGZd
 kqmo/iWSIpznGBgIK+7xIEBQvETHJQbKDvyMNnJfjsMqqUadtKVEQW7RI/9wQO+WefBl8XzDJbZ
 ZgBdNqNvIVN+cDPC8TQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030062

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

Update example to the subnode form. Doing so, it picks up the supporting
properties needed on the video-codec node, address-cells, size-cells and
dma-ranges to declare 1:1 DMA translation into the parent.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,sm8750-iris.yaml      | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml
index c42d3470bdac796cc878090e65becf6b62bd80ca..b6d5ded1aae6a1a6836c2c24b1dae548cdc6f9d2 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml
@@ -72,7 +72,6 @@ required:
   - dma-coherent
   - interconnects
   - interconnect-names
-  - iommus
   - power-domain-names
   - resets
   - reset-names
@@ -110,8 +109,6 @@ examples:
                       "vcodec0_core_freerun";
 
         dma-coherent;
-        iommus = <&apps_smmu 0x1940 0>,
-                 <&apps_smmu 0x1947 0>;
 
         interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
                          &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
@@ -144,6 +141,19 @@ examples:
                       "core",
                       "vcodec0_core";
 
+        #address-cells = <1>;
+        #size-cells = <1>;
+        dma-ranges = <0x0 0x0 0xe0000000>;
+
+        non-pixel {
+            iommus = <&apps_smmu 0x1940 0x0>;
+            iommu-ranges = <0x25800000 0xba800000>;
+        };
+
+        pixel {
+            iommus = <&apps_smmu 0x1947 0x0>;
+        };
+
         iris_opp_table: opp-table {
             compatible = "operating-points-v2";
 

-- 
2.34.1

