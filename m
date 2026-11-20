Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173077;
	b=VbeJLCp9eG0JfWS19v8Ee2R/Gx3rsi3b1M5Ut0aTpkuiiinIkvw6e+rnpB2MWkcanAsR
	 3XEGNhNRlGRGa/56Rg812dh/K/mnNsdmryoaN3TNJ4sH6hKHnnGcAgzG70KciVdfTuAls
	 HHZp/2nqJFWDzKooo+dHfuEmVgqiGR4AwiNJwTNjmz2D7uYa2gYBzzU54JNHVyXuzRXna
	 Qoh+tB+Bf5ruvd76tqsrmFikY54FoIbQbQAmDMGGDACGj7trE4qrPC3+XObFG6S8tPI64
	 RbUm/4SyfYQ0ZQWQcdavIvE62lFiq5kBsT70eF/EPMTABzaVzEcGVsu9ZaejxRGjMDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173077;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cn7g+ecg+pr4fRw8wEKdLdBlRPbJsgFxcvU1mUPI6CQ=;
	b=5da+GjvOhYRz+MZXJ2j4LkcgHiTwiKiH+peTyEyinIW3SdYEi4DTYnoQGUBJfSQgfA3a
	 f+tY9MtnQ8VtLz6Nb0+5P5n6M80YbjqBemsoa+EgInq74zt3Ptrt5EtuWojVEGMxOucJo
	 sgBV3bWPxeaV5dgQQL52CeEIRXT6mK9AwDsSzdABpJxN7rORk/wtrmy1CpF7QYZZit1Kj
	 7UcBoiE4rHWgdL9OliLJ2+JNLJy1UN2NcAQS+7oTWcSA7A2sdHQH3oML0l/FI1x0J9ALz
	 d6ARPJvgWlLvX+dXKGnEmKKxdxDtNW2k+HJSPOPBQ3QEKVRxVJaMvJqreKk4D/j99Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X1oYaXsk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CUrQ50kS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF15760A3801
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF15760A3801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X1oYaXsk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CUrQ50kS
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkiar3107703
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cn7g+ecg+pr4fRw8wEKdLdBlRPbJsgFxcvU1mUPI6CQ=; b=X1oYaXskRqLrHtKS
	jZFVxJ5WvyU4KXJ+1gjhmAknfTU+k5PyevW8wn8wOaPl7iag3PK/xVsH87A4/7iE
	65U9JRvP5cW4UhbgXHYcMS0+YbT99DENl0eCQMtTZebInC7tJvto1V5+i9uPpBmy
	/AMwV6sGcf9XkmRfKqBvL38DTUmTmMau3v7icRyyI4p+YXbP/9V/1yGf3QBSrxur
	XT3NuFXwXKHel+gWLwpIKiFVzBO8ghO9u57ApNXUrnVtrErBVO5ShkNBMuXGSOFh
	42ooTx/Pq/NgGXiWWwz7mqMgF5awSKOrSLsF9pjm2gs9PhhIOJO6Fm04g0bVFRKN
	nGBa4w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27au3ceq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:11:15 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso968177eec.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795173074; x=1795777874; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cn7g+ecg+pr4fRw8wEKdLdBlRPbJsgFxcvU1mUPI6CQ=;
        b=CUrQ50kSXVHY1FKiVRFqRW00l1elDTtdGr3SboGwSkNsFZEPSkgiij8LXV31mvdusm
         s5zTyv3YNb4VwlTTl/vCfRMcdJUeOzJECvdJ1M7VK3dsZVrx6EHT0fXu+TvlZuDJRcSN
         7j8DN4ZASRCYJGZ829U/tI61TYI3rovypvhgUX44618Aj8qLovMFmKZoiZ/7KoD+Vp0B
         4lAXebQnfztMUwUhahk4RBcuqDaucTOJo/1jjEVgz9qfKzfmdq+bYUX1ALJM7ZAjWkre
         mjazjqKjbVmln42YfOZpUccr5IerpOUjkFmhMpCpozMJNHugGXGsB+k/WzinXGAfTXCN
         8t+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173074; x=1795777874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cn7g+ecg+pr4fRw8wEKdLdBlRPbJsgFxcvU1mUPI6CQ=;
        b=XDAdvqPm95TYTfEgBQIlqMOq5TJjQO5ZCkSA0QrF1QLtKm2zlXjHtWDC2G3EqLAGjy
         stEoY6iBeAk5WpAFwJmK4Rfa4Dmvze6J9NX0gVUSLBfqubTt1Ep3Upvb5MuQkuUNQQUi
         bP91sr+3NzK6iWHTdoIDru8Iqal+3sS19mGVkWmdZp5ChCHqCqMY8bKjPFxLX1Q80EsH
         hUNLlfeLF6MjSvQmeLvK+jKrFHrnK7eQaFfWtKxt+kWNsEucVsAs6bjhHi8smyErMASi
         9wizVK/LX3rBi/8u7RZY3W4VZ26e91HxYTpL76C6nND1ZQFPcXbdTz+wqwj4x8NUEeMk
         8F2A==
X-Forwarded-Encrypted: i=1; AL+hErE46uExLVELQNHKt6S+mszzeM+EVnw7h83IsSml3qNU1rE6+DoAWMLaYlBKbRV64WIqni8LpmeJv5wT@vger.kernel.org
X-Gm-Message-State: APuU4Z/fScfeUGRyfa6A1Px/vour68nd9VhOKFs46ReITOZK5PiK/Lyh
	3SS3iGSk16AArFE8da4FLlSuFfmbrPqZ6u7QdgqPmFl/yh6/6L9NQx2586u3AKY8TJMWCzC3RUR
	v0EoKpM0BBRTS9ABu1lphvXwUistjQHQlcGSLLDTYpGBXB38Skt9DJZM/o7j/u9Lm
X-Gm-Gg: AYBFou23SXbAhDkG82khkhAVFN8c+Y7e2fjiI5rfWqWkag13FgMhQlXIBUK58TFl6x3
	bXhwGkZna4DDBqC6iz+tP9eA3mgXYDpIxnpwvDdAB9vR+G3IeyQci99sRv7Bwtn5DPH+YiAXfJ/
	ao24NiJz5ySrDg/wVJyB21XsbUmwoo1njvrqhew+p8KEtqJmVPac4ck2TzaFLncDCcU3E1IzQXt
	ywggaXeO26vfcs0k38A5BJFOxdo+a7mOIdZsG/dP/pdlCISEkPtII2qSG/G0jwLonhvWq8k57Y9
	xzc5xRVHAR2ucdH+ZACoiaWIvPh1BYyjBgK0DV5/qOZtg/5WHDGqBDaYYqz+5LuZcVjbSS4IF8/
	rVTvfcSFrNf/uiIBRJ1XZ4siztUxU3SA5F0TBhY+Rt/puKs7OFz+mCw9NWOsu81nwje+VvSxA41
	+xwdbq3onP
X-Received: by 2002:a05:7023:888:b0:1b3:ad63:b9c2 with SMTP id a92af1059eb24-1b5568ee910mr2747975c88.22.1795173074360;
        Fri, 20 Nov 2026 03:11:14 -0800 (PST)
X-Received: by 2002:a05:7023:888:b0:1b3:ad63:b9c2 with SMTP id a92af1059eb24-1b5568ee910mr2747925c88.22.1795173073491;
        Fri, 20 Nov 2026 03:11:13 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm7254229c88.13.2026.11.20.03.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:11:13 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:40:51 +0530
Subject: [PATCH v7 01/12] dt-bindings: media: qcom,venus: Add context bank
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
Message-Id: <20261120-vpu_iommu_iova_handling-v7-1-25a771235a7f@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795173061; l=6195;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=QubAncHhhvP95+8S4/Hf0daptJaGxx+rk0qFwJM9cSE=;
 b=GJLLVLvJZg3eRglS4gj6HNYf/ZtzmRLyhRLdgszhX5eCa0sG3R2ydlGO59TBrF5FWLgpPzopR
 Z40gp3lH4ovDs6X+3Sv0JmZKHzYk/KLjzY1qXaEdHofU6gLNa3fkDae
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX65wZWxnLQZuz
 ntHNQfYZgGKu45Lc6nE16RwsQ+nXCXTjfULEG1rHqNWU4y5bFvpR4PfOucLiUQjvIJzc7L4mke1
 NXBE5ZB4dKf1Kf5L/Yy4jPSZvmKRdhnLP43Xq08RASRMAgcD/MBRnUcc/zdl56r63oPUQS+z3Y2
 bLphEn9HQCGN3dOlMYBuk47x6OHjDG54WGNfdfXwrhxFa32pijefON+e6ZR0LiEGNbEYz99VjQA
 3k3wK0WAu7sU5x9B4K9LpGWL+6c0RvkxIo7JaL20kh87fjIAzbzrhKDAkgRZAqzm5wi5Xxo3zQd
 2+lKEc+huKmXvaGj03Go+No48OjsMlk2t8kKSZdydwoIed3GP7vCHRtskf0YOl9VRIDKTNZNpQ1
 wiNzI5FbCKBeyYQlUZsoJvgfpGwjwyFQhsbmEollRFmw9tXqCSwXZiZBfJPSrMxePONWS8dye7x
 4HfZrX++AlLpbkNBNvw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX21QMPjUUttUp
 UVgR2dxbaHXrdFWPTyHeGy9o9Z9DmZk+/xj5iG/EsY8EhSa7TWttWss83yLEjzgBcXLfYBkCgWU
 1nW15d4RM7KnC4wQkYT2PtlN8aePMjE=
X-Proofpoint-ORIG-GUID: wAKfN0Li52s96yl6V_xW-V9W2xhLZbMn
X-Proofpoint-GUID: wAKfN0Li52s96yl6V_xW-V9W2xhLZbMn
X-Authority-Analysis: v=2.4 cv=KuHYSmWN c=1 sm=1 tr=0 ts=6b002ad3 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=voxwdBqwZatJwGYNWigA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
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

