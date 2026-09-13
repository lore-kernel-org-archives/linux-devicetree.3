Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8441F346E7A
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 18:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789325405; cv=none; b=gAox00inqqhw7epMzapSaLhut5WAzCRpelMGSuuY8YbXsTTyHrwKAWLY4e7ERvbGmbV//6+2UHjCn5zaruQemHnU+DX0mHkQDE75uBD28lwubj/qjlK8tV9GhNwdElwXWffSo+tpngY3t32Xqn9w10wAikWQ519g8vuHSwJ/ung=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789325405; c=relaxed/simple;
	bh=qp0eeFSkW9qr12mPAr9R15JuDe58PZTGuiwGGGcfu88=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QbU4xXJTvdh1j9MynUgR0UnjTYSlXXNPzmWEpcXjlGQ3Z0HBkTrxI7Ss01/oQfBzI51vUVKkjY8GCfrlM7QExzq5qVn/8T1Y92Kk8sRSHF9XERILYgYpGKhK1qN9aQLcBFgPp/SbupZAStfLClJcfXY+Y2HqAJEmjcFAuTk9lcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m2UDWIFh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LYu3bKP4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m2UDWIFh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LYu3bKP4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DI2lHI3538515
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 18:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	782d8vA5qKhzXjsmtq848zNPg/gGyTeOCElg/IKXtGs=; b=m2UDWIFhOjm+Id5+
	2aKWySIYLUdIGILBkxQu9OVYcryJbSWq2gLhzcCWIzgkFo7qz2OQxmg39wn/u4Xg
	V0gpbpSmC1ov/qeiM+Ih1g5Y+deCzCcw4TD+5dF8S9s8FUB2BnxkhCIU4vqnp/Rk
	Ife+WiOTstQFzn+yHv1W82kJuzejZvhqP/PvtMg6AsJxJ1ElA5Wjl98zlHiHGUJn
	YnDc4T4FNsZRbpGmZuvUQnb02QPVG6/MkuaO/tKA1Gos2S+sZj5qW4sXjeYwveuf
	+Kz53DzdBUvhQekUvPoMnh+iRje8zDhsq81bBCS4APoJTLEgH2VAECY2Ds1xC8wz
	5cbFiw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9ckx0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 18:50:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398d0010cfaso5173922a91.3
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 11:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789325402; x=1789930202; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=782d8vA5qKhzXjsmtq848zNPg/gGyTeOCElg/IKXtGs=;
        b=LYu3bKP4y++/pibnEF+TqGVojZG/AKKygb33KACLBgabiTzBbvlOiVAmQBIRQy/Ijy
         mWJG4pJmtk1m6PoAM2+UcQ41r7xr7HbF1jK1+NroyaQSz90m439xgdYzAVycYpHPl2nH
         PlQHE1CElBmXUltRUU6gX9XPf38kY+Kzrlqazm05Gp0EAaQ7cyjx4eg9KYt5YOhe5zYQ
         ut38xUAejq7eUHFthkr/7Pxm6ipri+YhzmZIlzJbKhgFZZ+hRsWqAU4NUuN8OEOWCFlv
         0KBxgqNK0rT70B/EdpYhiVy+htG+4A/WKv1fWT5Za3A5KiXr0NdnH7CrI/wgqsZk/nXK
         k9bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789325402; x=1789930202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=782d8vA5qKhzXjsmtq848zNPg/gGyTeOCElg/IKXtGs=;
        b=KGEORoKMVFLC7OXuvqbLmQfOD9SQRUlYEN4l2+rXeN8cCAz1xaUNcnjVMnLfVm9peY
         62mA3eXIVVvvZsGylvP44Zl5B6BH1T1Hos5KL8iMtrZOq3N4+4v+V+5BmonCjIQgkxGV
         k02dfl1y03eFcsWw85R0aY5SDM3YOBmHlLUxHkOZ9YmHFk3cehWV/uBwsJb8eegnsOwD
         GCU8ERonr3cxm4fZ4oXRGt59xYDEtgIRiyXTB93DQWRoLa34a7v6bn8aeFf4T3tdJ4NA
         yHlByig3e4QzCu1+Zfcru3z7yKwBQiHh0ZpbmxpQB7i7JQXzIodBw2pP7i2iaAs8bqVa
         Bfqw==
X-Forwarded-Encrypted: i=1; AKwUvBzmfvYiG9psjodCfxZ1DS9+STRieyVUh9xOU8aCZvesc+WSWJf8+Z8O1/S4EZB6F1ztgDF9HrF0IK0Q@vger.kernel.org
X-Gm-Message-State: AFuF++khqqqIelKnCy8UPw+3zBB3ZzNQX0qgJtk1J4thXwst4wOuThT/
	AzWOkTgNDF0VCWah//oc0QIrKsou392TOm1lyUW0xK9RN0nE59K5w+5cW8mzmsBkf0Upqhz2vCk
	7KkLLTx8Q4uQkVY/YyauDnmw0evVxxtSs6duS6KZXCVZl5PCWIP0f/L130WHZVW15pIpHjYz/
X-Gm-Gg: AYBFou0bag2HfdEFyZzo7unyChJV7VslWp1dIAo2ZIeXi3zQPScGqh7jfqzwA/F3wfI
	PVB171vnMyjiNGU+M5ymN1c9mIuFbQktR0KDXrDbzkDds5/M4N20DzjXFYyUtw97Q9fT8CIWY1K
	As2pSQpo+pQ3GNr9H13aP/f6kv0yh1wjPzA1DaZy7rpGtidAbXG49HHsKAKu1KW8sEHtaChKFPR
	DPBEnL4Gs6T6EgE/sYiL0Pw55U7zZTemcyjmLd1fGXrqLJkXXJ6G9Rh+hyL0kvR11h8hSOyQbjm
	Wt430wBFWKms3m3SO8nUB/ZDBYvFZHTnnDH08g3OsMXWJx1C/3QOlXHTu3cgrdqFJ0nWytoYVqG
	En6wvU09QmeXV8m0Bpl0p4qaTS7GAzjHe9jQ=
X-Received: by 2002:a17:90b:57e8:b0:398:dcfe:968e with SMTP id 98e67ed59e1d1-39d9c22762emr29007930a91.20.1789325401473;
        Sun, 13 Sep 2026 11:50:01 -0700 (PDT)
X-Received: by 2002:a17:90b:57e8:b0:398:dcfe:968e with SMTP id 98e67ed59e1d1-39d9c22762emr29007860a91.20.1789325401043;
        Sun, 13 Sep 2026 11:50:01 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm22473130eec.24.2026.09.13.11.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 11:50:00 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 00:19:19 +0530
Subject: [PATCH v4 02/13] dt-bindings: media: qcom,sm8550-iris: Add context
 bank subnodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-vpu_iommu_iova_handling-v4-2-9b9074a73c41@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789325376; l=3706;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=qp0eeFSkW9qr12mPAr9R15JuDe58PZTGuiwGGGcfu88=;
 b=e3q/gARLkobKSIVL8IEYb1/H4SLP6nioe3uupeM+r9vAHJmujI9Vmw1i4Pn5seRY2EcbvlGKO
 0wrG7qrDmuoCw/T0vRWi1Szt39vWGCTfHJi+9qp4upYz8V7+goTvEiN
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI2NyBTYWx0ZWRfXyVJWh9SIvq8F
 u2W24y+mcnOiH4QFdyhYjektLiLCF7CJP8WKY+I4jD9PbRSdNzrWvdRkKUA9ptiKu03tld3fAdy
 LoBGuhl0vWO2UdS9q5gr4pmfUdU/lcnkCs+qXVfvBXcfIrSf9+ctuR4wABv+RmUsfM4lSnt7IRk
 ciO9nnAx4gSaJqKyvWd3gnk6JkeEti39qmRnVro1jXjlh02cZ4Um8ns/5/yEuoj2XcJs9JQYpcl
 FbIV4N1IkBugWZ2HAiYKCl+kuu8JN9Iez1zmA33fjhFsNY/uwGY8R2BAhyrFdIAJwfyLrb0rFhR
 M+8r5EJlBs1glKS76mqeYdPyHl8w/dkNrdRsPStO83NE0/PorgDVfvuoaEzPW1dl9bcm04eJYb9
 8b+hwd72kvVyOnSs9qSUpcpydTLaZsPKV/LuW/21gEDr+/8t9M8Pyv2/3YcfF0aEVSo791jURkz
 MUEBzwCRw4POGWicNOw==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa6f05a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI2NyBTYWx0ZWRfX1OyZvA8+1/Ad
 W5ufjXjSfwOSqugxQNsCnLIKKHV8KzcTLGn/fzvpiMrS2TG4T+nQnibzsqwpxAr+eGKDwbC3kzH
 MWBNbBovqemM/dublu+goIuyR/IGHcI=
X-Proofpoint-GUID: rrfgVqlRlYic-1JGNyLD3_jVVR4IkP3G
X-Proofpoint-ORIG-GUID: rrfgVqlRlYic-1JGNyLD3_jVVR4IkP3G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130267

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
associated with its respective addressable range. The design was
discussed and agreed by mainatiners here
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org

In the past, this limitation was addressed with an iommu-map approach,
with the iris driver dynamically creating the devices. That approach was
later concluded to be a hack to avoid having subnodes, and was NAKed by
the iommu maintainers. It was discussed in detail here:
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/

Update example to the subnode form. Doing so, it picks up the supporting
properties needed on the video-codec node, address-cells, size-cells and
dma-ranges to declare 1:1 DMA translation into the parent.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,sm8550-iris.yaml     | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index 0400ca1bff05dcef6b742c3fbf77e38adca9f280..6ee9d23554cffb30c92017ef99de15c2493455ac 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -98,10 +98,10 @@ required:
   - interconnect-names
   - resets
   - reset-names
-  - iommus
   - dma-coherent
 
 allOf:
+  - $ref: qcom,venus-common.yaml#
   - if:
       properties:
         compatible:
@@ -177,12 +177,23 @@ examples:
         resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
         reset-names = "bus";
 
-        iommus = <&apps_smmu 0x1940 0x0000>,
-                 <&apps_smmu 0x1947 0x0000>;
         dma-coherent;
 
         operating-points-v2 = <&iris_opp_table>;
 
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

