Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616149;
	b=mNE7qIeaVxPraQhozzkb6OeA8aSg16huCEI7qdQTYSVwebOII822wvRc/QAGoFv+Xzes
	 GZ1CRKYcSX7CbMeU6kfaOi1TqOjntjEnfadoCfWoJvwTHw+PJ7oObaHp1Gsk4bFg5Jc0U
	 ILN0nBE506RMTWAbVDGyMGbWgWOHsWSPBl09sPD5VaBd2rK4v42eubX9dXpCj3fHymoeQ
	 y6cU3j95N2wCnmzR92sMBWhaX0YR1RiNh6a+ny+IbBBOguyJgpCd4kTJVfbUjQRUhg6hV
	 AAGlc5vlPQVWVhBtoPqnri6uW77oNoJwxx7uHLEY4fFYscJVtps6F+02IklGTgzsSSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616149;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cn4iBg+xzn7OmHstqqp/y2jUxX7t+xPFAar8TrRHGe4=;
	b=ywhXsaVq7Q8E+7yRLBZk5KbGxiMai8kqlhQ9rSl7OEUA2CTi/4x5pnUtL2B2Smzaxn5N
	 ika3O2fLcGij4UNvNj81cc6nvC3nN631nbrO5RBalkOeD+sY8tHWZfKlLjX/1konyF2by
	 ItISgeYwxQ7rTDyd8sbfjYhl/VsW895WaSkffOGjAS+17qdFmkjQnDEQDWfdsLgEpHjkC
	 7V0JXrJk2JppRM7y7qjevDsmT9kHxeS8govWA1mv0HBfw0sh6fGfx1uGgiamBatzE3fqh
	 K6+lmwmdIpyLvUbTUKq+r246AtWtIrThZBA7ccjDqwMbloW+m75lLiB6qQ8lS8GUMQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hajDjFh+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AoAh2HWD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A9E60A263D
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 10:42:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07A9E60A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hajDjFh+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AoAh2HWD
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AOnh3086539
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 10:42:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cn4iBg+xzn7OmHstqqp/y2jUxX7t+xPFAar8TrRHGe4=; b=hajDjFh+a6njRLz0
	C3Zysr07Qx2tEj0CisP5zj6Jd2wFWaxzhPznuq9KPkimqNjKG9gEwx/agGeFPxyV
	3FjOcG5pDlgqWFBwzPhWc+MeQDAirT6VqPIIIgEaHhDW9NyXzG3tc1xw55vLQMiO
	Tu2yp0P61bGT4MHsUwdeonWAaoobISCBaM1gKPl2hJO5blzBHnpn/WT5mFN0Pz3Y
	+NWtdmTBFQUMdK40nOnF+u5OK0fk0CMtvvxGE2Tv5oJGE5GmvH4ho1GAX7LKCvaI
	kbLb5j6jL+t1Op8hrxQhyUHCQ97KUNtwNJEiZfnBWgVYzCJj7Kcx7EzMDvVq8cWl
	UvLr9A==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka61d1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 10:42:26 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-8437834ad7eso4036250a34.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 02:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616146; x=1794220946; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cn4iBg+xzn7OmHstqqp/y2jUxX7t+xPFAar8TrRHGe4=;
        b=AoAh2HWD7+zJMppFU+fGTgICuUNWBp0yuHV6RWEXtzcicNZQY6/KbxahYh245HK4SA
         30P+6Xx1Woxln7RBSJ2MA9psX+vOF7WZlHfD+J96wZ+OIJ0Pjzg/9Hv/iw0TeNqlCYc3
         BMW4H7J+f5sMBdO4rdni1vkhwDS5rq8LBSmcaIrpoq7G44edJVFTZakNRmwlJ97xJDRy
         UcPMGJPoWSEPXBc4eXnTfWeGvSLnAZhgpdmjyTyjnuPn47JSIt2oTevEZYnBiojME9qU
         3QY328HSGuGisyPVfxDCRYzGT1pp0F8QeT5ufS7W+WmeB+hFFeP7Nj1gHGm+POvw+lMN
         JFzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616146; x=1794220946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cn4iBg+xzn7OmHstqqp/y2jUxX7t+xPFAar8TrRHGe4=;
        b=XcD1Isnuxk0zsstPIscbMImM74UafZQD5tKIZYhfXm5S28hAIPfiKujAXYDfqQs1G1
         NH2BhOJIiqMhpuYfH3RhgZMTAzgDBaTvB9atc78fp9XCGjzlunPBdmXuDyOIV1cDZHvq
         4dL7MceR27KLMuGsSYJvlOasVlYmwbmfSjdGGhDL76nnXhZuu8SAOVUveTTjNPmVjqBx
         7ITf40CHt4NIxJVPvaV0j7guevVqrCDEFw4OCgxGtFkeU0fBDHm3mUXd+Za8/0wId8Q3
         zbbKaBa+shO4oG2YST4bv2e9uLJT+Rk1ze/z/8ROVacySS/IFO/Nq3SUYMLOGf9PBH+z
         LiQw==
X-Forwarded-Encrypted: i=1; AKwUvByzuzhSLDGx75ppaSc/CJ7+QH/JinaGHSrjvCV2QBp/yOfx3W15qhkuP/s7HAql8zJUTaB9Ok48P9kL@vger.kernel.org
X-Gm-Message-State: AFq9FYK3NiT/uHUTWwHDUvHM1KyFMYokmA/hIDG/hyS/g/BrKGgXGYL1
	ocyOSN7dGUzCEt+w/WOZbyvaEXa4n8mkbZnVc0mQU7eZiPXVoAstobiJAQviXBSbDGYv63tyS9/
	o4VpU7xxjg3lBiO3R253B58cEY/a3VYHyk8kRZ0KXUOGuVSyKCMQ+jEtHtGVAET4T
X-Gm-Gg: AYBFou3kuh10JzXQwj7ROpgUoNjN3IJiIWIp7HQIeKdYOh3vXMC5kUj2mZCHkTrRXRy
	qhahwforAQC2bLIHIq4OM8+udaLCL7IwxZ5mPqWlCzwo2WwLIcSHFlrhBKRZRqV30jK586pgqy4
	qaLu2HCev5JzRCM/J+HQdXK4XH6Jv4pLVrDGrpLIcC2r2s6A6xOeh4yTmnDYmDzkNDa4XWxoYXw
	KJuC95GJWElTTfqjVZAAxrLhV2FYZfqqhSX7Zm0WMcWDB9RJSqe7jRzvWSwe1IMRvBZ2xDzcN3d
	DsmV0GyYPn4LdtXAz6kfd5wzfkOAaMXTExFOfmTc35B2Frszk7dJvM1XkW//6ymKs/T/XN69yYE
	UEweh/dhUPX+pzV2pGyJp/VVWUAFQZo6mzconMfPH7z3K5hz2XGn7D1MKQ51K0+CzTqgkiao9ON
	Ts3Gis3XmWF099KjKEFALgRBOfCNBr9jMG54RNH+VY8qzcZxvdX3npJCnWmfY=
X-Received: by 2002:a05:6808:670d:b0:4d6:90f3:74a4 with SMTP id 5614622812f47-5640def68demr6480957b6e.47.1793616146143;
        Mon, 02 Nov 2026 02:42:26 -0800 (PST)
X-Received: by 2002:a05:6808:670d:b0:4d6:90f3:74a4 with SMTP id 5614622812f47-5640def68demr6480934b6e.47.1793616145594;
        Mon, 02 Nov 2026 02:42:25 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe0fc77sm7447171b6e.12.2026.11.02.02.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:42:24 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 02:42:13 -0800
Subject: [PATCH v24 05/15] media: dt-bindings: Add CAMSS device for
 Kaanapali
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
Message-Id: <20261102-kaanapali-camss-v24-5-d6b8f3f6f66f@oss.qualcomm.com>
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
In-Reply-To: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-ORIG-GUID: xXuDvrlekx_3FMupRVytVmgv89Cq0rVm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX5jQlHKk6tauA
 9MW+YIbCWs9jgcX6RpWjw4a+fpegrXZU1j+Xw90+udBowW/fFq0QOlcSFLXCl1HDfp5+WLvjlPh
 T0nSAPf9A+KPw5yJZwCrfezxSMfhae8=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae86912 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=yzr0uxE_ijXmPgLYsrIA:9 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfXw/+xrQMnBEAw
 f5zwePcbu6rbE7Yotx0DQ70FzXXFU+798eljSysvM4wBCSPgvdWJ2wngsC8SYsq0AVSjWGOoLDt
 VlbjvrnnTqSX5+SDCFnst7peX+qb63jv2qD2ZxntZHqEQGZCtBX8GtujOGlJgZ3KlMI2ipGBdA9
 6dz1QvdKWZifOs6T3oiD9o4Jm74xZ8zSmwgIMIKe3DK0rualvU2Wu4uOGym/4Q9hteEMKXP7zQC
 dDLlpFEM0Qay2LXXSjNsAhK32sZEJOD78Gbpn1oBaWixmG88znnhpraVEDt4grxX6DcGzx4lQw4
 R+jb3J9MmierJrktwXLG4d+tiyX39Pyi5vi2hHBoAFyEb5o/7uj6M54AdrIYDUlj2rtsweduYG3
 1Jb9i02Q1NLheX7A+YDXJwBRk/qbgaBp+Isl7rV2i9PPZ0vk2ZPNFnJ0qZySAy3wUHJo5gbbJ4V
 dZafPFN6vZAgyZU9DqQ==
X-Proofpoint-GUID: xXuDvrlekx_3FMupRVytVmgv89Cq0rVm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020042

Add bindings for Camera Subsystem (CAMSS) on the Qualcomm Kaanapali
platform.

The Kaanapali platform provides:
- 6 x CSIPHY (CSI Physical Layer)
- 3 x TPG (Test Pattern Generator)
- 3 x CSID (CSI Decoder)
- 2 x CSID Lite
- 3 x VFE (Video Front End), 5 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE Lite

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 .../bindings/media/qcom,kaanapali-camss.yaml       | 303 +++++++++++++++++++++
 1 file changed, 303 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
new file mode 100644
index 000000000000..f64eb925b641
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
@@ -0,0 +1,303 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,kaanapali-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Kaanapali Camera Subsystem (CAMSS)
+
+maintainers:
+  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    const: qcom,kaanapali-camss
+
+  reg:
+    maxItems: 14
+
+  reg-names:
+    items:
+      - const: top
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: tpg0
+      - const: tpg1
+      - const: tpg2
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  clocks:
+    maxItems: 22
+
+  clock-names:
+    items:
+      - const: camnoc_nrt_axi
+      - const: camnoc_rt_axi
+      - const: cpas_ahb
+      - const: cpas_fast_ahb
+      - const: cpas_vfe0
+      - const: cpas_vfe1
+      - const: cpas_vfe2
+      - const: cpas_vfe_lite
+      - const: csid
+      - const: csiphy_rx
+      - const: gcc_axi_hf
+      - const: vfe0
+      - const: vfe0_fast_ahb
+      - const: vfe1
+      - const: vfe1_fast_ahb
+      - const: vfe2
+      - const: vfe2_fast_ahb
+      - const: vfe_lite
+      - const: vfe_lite_ahb
+      - const: vfe_lite_cphy_rx
+      - const: vfe_lite_csid
+      - const: qdss_debug_xo
+
+  interrupts:
+    maxItems: 10
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: ahb
+      - const: hf_mnoc
+
+  iommus:
+    items:
+      - description: S1 HLOS IFE non-protected stream
+
+  power-domains:
+    items:
+      - description: IFE0 GDSC - Global Distributed Switch Controller for IFE0.
+      - description: IFE1 GDSC - Global Distributed Switch Controller for IFE1.
+      - description: IFE2 GDSC - Global Distributed Switch Controller for IFE2.
+      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
+
+  power-domain-names:
+    items:
+      - const: ife0
+      - const: ife1
+      - const: ife2
+      - const: top
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    description:
+      CSI input ports. Each port receives the CSI data
+      decoded by the matching CSIPHY.
+
+    patternProperties:
+      "^port@[0-5]$":
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data from CSIPHY 0-5.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+              bus-type:
+                enum:
+                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
+                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+
+            required:
+              - data-lanes
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+  - power-domain-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,kaanapali-gcc.h>
+    #include <dt-bindings/clock/qcom,kaanapali-camcc.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        isp@900b000 {
+            compatible = "qcom,kaanapali-camss";
+
+            reg = <0x0 0x0900b000 0x0 0x1000>,
+                  <0x0 0x09253000 0x0 0x5e80>,
+                  <0x0 0x09263000 0x0 0x5e80>,
+                  <0x0 0x09273000 0x0 0x5e80>,
+                  <0x0 0x092d3000 0x0 0x3880>,
+                  <0x0 0x092e7000 0x0 0x3880>,
+                  <0x0 0x093fd000 0x0 0x400>,
+                  <0x0 0x093fe000 0x0 0x400>,
+                  <0x0 0x093ff000 0x0 0x400>,
+                  <0x0 0x09151000 0x0 0x20000>,
+                  <0x0 0x09171000 0x0 0x20000>,
+                  <0x0 0x09191000 0x0 0x20000>,
+                  <0x0 0x092dc000 0x0 0x1300>,
+                  <0x0 0x092f0000 0x0 0x1300>;
+
+            reg-names = "top",
+                        "csid0",
+                        "csid1",
+                        "csid2",
+                        "csid_lite0",
+                        "csid_lite1",
+                        "tpg0",
+                        "tpg1",
+                        "tpg2",
+                        "vfe0",
+                        "vfe1",
+                        "vfe2",
+                        "vfe_lite0",
+                        "vfe_lite1";
+
+            clocks = <&camcc CAM_CC_CAMNOC_NRT_AXI_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_AXI_CLK>,
+                     <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+                     <&camcc CAM_CC_CAM_TOP_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_CSID_CLK>,
+                     <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                     <&camcc CAM_CC_TFE_0_MAIN_CLK>,
+                     <&camcc CAM_CC_TFE_0_MAIN_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_TFE_1_MAIN_CLK>,
+                     <&camcc CAM_CC_TFE_1_MAIN_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_TFE_2_MAIN_CLK>,
+                     <&camcc CAM_CC_TFE_2_MAIN_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+                     <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>;
+
+            clock-names = "camnoc_nrt_axi",
+                          "camnoc_rt_axi",
+                          "cpas_ahb",
+                          "cpas_fast_ahb",
+                          "cpas_vfe0",
+                          "cpas_vfe1",
+                          "cpas_vfe2",
+                          "cpas_vfe_lite",
+                          "csid",
+                          "csiphy_rx",
+                          "gcc_axi_hf",
+                          "vfe0",
+                          "vfe0_fast_ahb",
+                          "vfe1",
+                          "vfe1_fast_ahb",
+                          "vfe2",
+                          "vfe2_fast_ahb",
+                          "vfe_lite",
+                          "vfe_lite_ahb",
+                          "vfe_lite_cphy_rx",
+                          "vfe_lite_csid",
+                          "qdss_debug_xo";
+
+            interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 457 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>;
+
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csid2",
+                              "csid_lite0",
+                              "csid_lite1",
+                              "vfe0",
+                              "vfe1",
+                              "vfe2",
+                              "vfe_lite0",
+                              "vfe_lite1";
+
+            interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+            interconnect-names = "ahb",
+                                 "hf_mnoc";
+
+            iommus = <&apps_smmu 0x1c00 0x00>;
+
+            power-domains = <&camcc CAM_CC_TFE_0_GDSC>,
+                            <&camcc CAM_CC_TFE_1_GDSC>,
+                            <&camcc CAM_CC_TFE_2_GDSC>,
+                            <&camcc CAM_CC_TITAN_TOP_GDSC>;
+            power-domain-names = "ife0",
+                                 "ife1",
+                                 "ife2",
+                                 "top";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    camss_csiphy0_ep: endpoint {
+                        data-lanes = <1 2 3 4>;
+                        remote-endpoint = <&csiphy0_out>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.34.1

