Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720479;
	b=PO1i/YKFwd0QdmRNqvkBq6eZ79IHJKNHwsBd7fPVMrYeMoFpyfRbi21ru19z1U3/vzw2
	 McMjvrlTmzWhnJ8RqsSPg52pEm4L0vbVtJQKZ1YAbUDbGQUkW/Kg8R2y0T55YahKfUgwj
	 WSWFdb+xyMAgZW7m3kzHanptn5GBugvrAzwkA1SMORTEwdvlmHLhvXPJqklf7nP5GoC4W
	 yoyt9Ay6GmcwFhheCLMUVgcJquFcFaQYkmjHCx84dBNQoVHUuT4H1ojGMQauYIR27CSds
	 7amgavEdxKMl8kfwioPQkbu+zL8rNQygCDnYgqJblyHT8LBCzCsmzemPVacKOqKT4Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720479;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cn7g+ecg+pr4fRw8wEKdLdBlRPbJsgFxcvU1mUPI6CQ=;
	b=bzqc4bbvYfpnb1XWovry9UDq3PLxCqRx2HCET0rPxsFUrvX9lSGHm7+VDgesOWOs9kDA
	 42548AasAtfxa41JfwGv1ruOT5ZIAjNeiaIGPJVkxWqp7EeuXOhrl8pVxaiP4c0WU3PVk
	 c6Q88/gCLQXiPqOKX+l2frBZp8/O2rn9HmU49R9FeiwPegZGR814yWM9x0UywKV5hqTSK
	 48vNrBoqijyIqeOaW3XHMqJknybR2R4EyYlLvtCeezFq98HxjyOf/rrl2K03TnW6TFs82
	 de+410K69KSdEGIJRI102zOjQsIx5zFVd/EfpmFd9gCvCZkbylnL/+bsrMPkRb09y3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nt16aCb+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D7JJyh6d;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5E8606D80D
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 15:41:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B5E8606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nt16aCb+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D7JJyh6d
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3E9n3F4049218
	for <devicetree@vger.kernel.org>; Tue, 3 Nov 2026 15:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cn7g+ecg+pr4fRw8wEKdLdBlRPbJsgFxcvU1mUPI6CQ=; b=nt16aCb+ZhhBiaQn
	sy1tCG1K4A3vKg43O3NICLh4CMx6gBopwGBq+WuzbJWZDYfrKq3jL+ZExgOzM4jl
	LnWKnW4LWdbucZTGuVzO9iew7Q5yM5b0F1LuZNIq39PtPkmQkiNWI5wPItb2LMpN
	lIlPtcwJoozlUw9+6lvfZ/9Q04oOqE7TRQX2ZFZbW5QzCpr3aDMg2MnSNWyLEGNc
	ChozJZdxuaZaW4YkiyDuyXzPpIa0QZ75CIrubiSymwPLZbV/iIs4b0sIzL80qo1n
	GVzTIRyz1GmHO0bvAOFOxUq9Nv9PNm7YcMHJ7iBXhjrUnu2sbKm1dreYhrIyv6yP
	LOypEA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq3uy3m80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 15:41:17 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-351788121cfso2297605eec.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 07:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793720477; x=1794325277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cn7g+ecg+pr4fRw8wEKdLdBlRPbJsgFxcvU1mUPI6CQ=;
        b=D7JJyh6dN4KOp7w9MrzT9sYd7s+xHBWzwzYckrnhcdUlidZeCDX3YmCOmS9EdYcbN7
         I1bsWZAqKvETTcbiQpkM/xMm0G3RPCh9hR/vgbLYkcuadUQea6t9CVAWsCfvb34U3+Q/
         WpV1BktBsOUMwLeIG6I4guDcqK8e4pTNiUVM7Fm7hqso8vKEVXjW9jRByJM0OyNdMrvk
         tqQ3Pjokpn+0e9i9hzlnzUdLAyph873VgBAFJabijQcvROJyOPguM4E0CgKwRbADX7i6
         jFoKAKxxgZ5fFvKBOxpzVhxrCcQysOZxu+M+cL9fjMaqxAX1QdKHL8bX0G3dIneMtau2
         CXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793720477; x=1794325277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cn7g+ecg+pr4fRw8wEKdLdBlRPbJsgFxcvU1mUPI6CQ=;
        b=12CMVlV3HqhKD9C9QCVr5FbDrjt9dC2DzucD0zJUUwH5BRgpB8WJRaFfTaxEHErHTz
         Hse3YnS1GuuuCMNbatYB3jXhWuUk37KSAG+nC4GuUmnJ5rt9c8rA86m4GIaE6tTt5zOx
         QunQn+WOH6IqElzCCAgwzm/wcjeZkOanwniAWz8nYKBEtiiFX2tCYord0mrEwSTRTtgD
         +Ol0LAOsYh3ebbuP6OLPxiVex0ccmCxWYasv0nDz6+F6Zzsb6H1OXxHehLOvgBcel3Sl
         4Ks/NCWv3rYhyUY6W40COXFpmUByV/IdAmdIzZsAlLCzrWBR9e2gHyqSLTUHJwqGPOIT
         z75g==
X-Forwarded-Encrypted: i=1; AKwUvBxIYTBnyjpfsHg1ksjQWTj55iseZ6ERbgky2pvNgyQLs0GORyRAcoI9MeR9NajjXijzhivCdQ7nCcdC@vger.kernel.org
X-Gm-Message-State: APuU4Z8zVq7q0PmhFdcFwUz+5LkVLH1lD7OaplP2rQO20xw39YNwKhhF
	ZDPAtjyiL9zuVtdxa9o6tq9PdePC3Nw+Tk9Xq1mwk+ggr4qyWzs35JvFJkmcTTrNSltcgSmOEmK
	okgEHY/hVxu34R6/er265KxJQNeKEuFYwUf7yECgFJEl0iAkSsmoykxv5V29TThLZ
X-Gm-Gg: AYBFou1l47qH5MpbM826qkYNK7EJ3DlAQHqx9rRLdpBtI+qxmJEEn6ynEqEH7dcdsMr
	SbGqfIheYLWvkQIN78hbB+llhsQhEN714qC+6rsOQyeIWX5DvSpMWMOanQodirkPZBZhlNAMju6
	+WOm+jfTaExGyRjInKwZUZy/ADRfP+gMBetSJjCT64qs+G6K0qRLuhFwPxR2MSMUlZqTi95Z6Xu
	lvhU7e0hgbzHH5Rldf2gO6PmfX8DQ+NcCEXdEqUzg6fa0qJ3sfTkWDwjCvuxPJUWzJCqN02j1BR
	HyoOGYSMRDfny9ItLj5WvE5ruIbk7AKkQjN7CBsala+NtCndLLTH8pC0B54shHMDjjx1ugc1ORO
	jMdBK5y6vqEqFpdC0Pp91f6GFXyv+ssdM/Hb6JY9TYUzU7LpFn+ZUQsJGF90RZdY4o5vjwmva1v
	CY0FAhVf8I
X-Received: by 2002:a05:7022:f517:b0:193:9aa3:4758 with SMTP id a92af1059eb24-1ac55968b07mr20095848c88.4.1793720476837;
        Tue, 03 Nov 2026 07:41:16 -0800 (PST)
X-Received: by 2002:a05:7022:f517:b0:193:9aa3:4758 with SMTP id a92af1059eb24-1ac55968b07mr20095804c88.4.1793720476236;
        Tue, 03 Nov 2026 07:41:16 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4b08bsm50072823c88.16.2026.11.03.07.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:41:15 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:10:32 +0530
Subject: [PATCH v6 01/12] dt-bindings: media: qcom,venus: Add context bank
 subnodes to common schema
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
Message-Id: <20261103-vpu_iommu_iova_handling-v6-1-e4b6ad864f8f@oss.qualcomm.com>
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793720462; l=6195;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=QubAncHhhvP95+8S4/Hf0daptJaGxx+rk0qFwJM9cSE=;
 b=UEnMGq9ltxZfe+efuJ0SQNZ3L91/jGT5P2IkwUdUo7Yh7x+uwMAi6sdgm4DEsP2zKOD8lmsHi
 XiYdL2X6NmRDAWIWCTL45SlDi0c5vWn1cKFeDq29Gw7dA6I3kfgaXKE
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-ORIG-GUID: 4CyptVVyk-59Rdy8zINk7dln4rf0gnjK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfX/7A1ecuqNxKn
 pNTdKOuc5wsDhKJVSCZ6gUQ8bpmhJzEdYBKskEHAk9lFruhWPYWX2suF0McrzMQHi/GXOBJQ7nk
 7WXL7+So+9n/IvU/wM+nmrI+WLr4Ro257+/ZNNuXsCU03184X78Wn+1/qCpQnUat5io2KE53hEn
 ptDSIWVn6KKhN1yszLxPGlZPgsD3cEJM+rAGAx9aylkzyONy6KWXOqYgRaXKPauuEkQuGwkBRCR
 TsTK0YyAoNheqoDzvls+gYXaqOumVnFEWOwDtuKmi+DEe+kVIQBJoxiC3KyKhcPbOWOie+xkbAW
 NjvZk6xe+EOoIG1cXzLea95O5WvXU958xP8qbUHbZC2disY6YJVNrG48wJeNKUdiBkgvCXi70lw
 IcYKz8A87Tze7uTLWh2rCjLIgdRRAefw69xtPlX3czgR+TFtYEY2+GtYi4sKUO51TwsK3kJ+baR
 ZH0MIwryG2BV7C+ZCqw==
X-Authority-Analysis: v=2.4 cv=VoG2kO2n c=1 sm=1 tr=0 ts=6aea009d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=voxwdBqwZatJwGYNWigA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 4CyptVVyk-59Rdy8zINk7dln4rf0gnjK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfX3kZDwIzG5DmY
 pM2W5FbJvbl8AVueCqs5OHckTNgHQ0N81lAbj855dF+tZ8e85pic8yMWpZFdkf4uPctwTD8YMug
 Z79JKjk+qG4YFmYxtuFGRT+gvsK076I=
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
associated with its respective addressable range. The design was
discussed and agreed by mainatiners here
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org

In the past, this limitation was addressed with an iommu-map approach,
with the iris driver dynamically creating the devices. That approach was
later concluded to be a hack to avoid having subnodes, and was NAKed by
the iommu maintainers. It was discussed in detail here:
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/

"iommu-ranges" on the subnode describes the *allowed* IOVA range that
stream is allowed to use, so the IOVA is allocated from the specified
range only. Define all the possible subnodes so as to describe all the
VPU hardware iommu interfaces, both secure as well as non secure.

address-cells, size-cells and dma-ranges declares the 1:1 DMA
translation into the parent.

The parent "iommus" is kept as an alternative via "oneOf", so platforms
that have not been converted to subnodes still validate. New platforms
should use the subnode form.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../bindings/media/qcom,sc7180-venus.yaml          | 15 ----
 .../bindings/media/qcom,venus-common.yaml          | 97 ++++++++++++++++++++++
 2 files changed, 97 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
index b21bed314848480b82153e49602f0b19e08e7335..bfd8b1ad473128c974bce84639cb0aff59d8c2cc 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
@@ -91,21 +91,6 @@ properties:
     deprecated: true
     additionalProperties: false
 
-  video-firmware:
-    type: object
-    additionalProperties: false
-
-    description: |
-      Firmware subnode is needed when the platform does not
-      have TrustZone.
-
-    properties:
-      iommus:
-        maxItems: 1
-
-    required:
-      - iommus
-
 required:
   - compatible
   - power-domain-names
diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 0be2f9119e78233928d23af86836ac294aa769ee..6c205077bea4d729335d7a5690a57bc1bb43ed9f 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -50,6 +50,93 @@ properties:
     minItems: 1
     maxItems: 4
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+  dma-ranges:
+    maxItems: 1
+
+  non-pixel:
+    type: object
+    description:
+      Context bank for VPU non-pixel buffers, including compressed and internal buffers.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+      iommu-ranges:
+        maxItems: 1
+    required:
+      - iommus
+      - iommu-ranges
+
+  pixel:
+    type: object
+    description:
+      Context bank for VPU pixel buffers containing uncompressed video data.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+    required:
+      - iommus
+
+  video-firmware:
+    type: object
+    description:
+      Context bank for the VPU firmware processing domain.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+    required:
+      - iommus
+
+  secure-non-pixel:
+    type: object
+    description:
+      Context bank for VPU secure non-pixel buffers.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+      iommu-ranges:
+        maxItems: 1
+    required:
+      - iommus
+      - iommu-ranges
+
+  secure-pixel:
+    type: object
+    description:
+      Context bank for VPU secure pixel buffers containing uncompressed video data.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+    required:
+      - iommus
+
+  secure-bitstream:
+    type: object
+    description:
+      Context bank for VPU secure bitstream buffers containing compressed video data.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+    required:
+      - iommus
+
 required:
   - reg
   - clocks
@@ -58,4 +145,14 @@ required:
   - memory-region
   - power-domains
 
+oneOf:
+  - required:
+      - iommus
+  - required:
+      - '#address-cells'
+      - '#size-cells'
+      - dma-ranges
+      - non-pixel
+      - pixel
+
 additionalProperties: true

-- 
2.34.1

