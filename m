Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172817;
	b=FsTPXZ1RXtnaFpyvBESr8N0GNUsz4ssw6qHDEXMfDCzGx7is9ISeSqnLiLj/rOFTfev5
	 mgJ18d27ELcB/l8exUkVk/KZopyvOQaUrCyzEa91wt9TVmwQXlBqWXg965Xf41FCahMuz
	 uJwXygqP0jtpSzOP72xwH4nnOtge1vxrUIG4LggDHxBBksgnDopXI1RB8hNpOSOfO41bm
	 QGs5gNVfoGjc5brT4+x6UsD1y8nB2uAoALss/psb5sKE+XNDjDazjT1eLY31IOoIxdzue
	 bIAJ++rRAPfSUNWYybrNjZ+MzWXd+GBmUGLvqS++vnrhQlJg72blqYYrtvjk3kNLxSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172817;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hz2XdZj1N82zwwGf5rQXwFrF2Tz/A+hhelwd2ljU2qQ=;
	b=MmgkmYD74s6buIB5uPdPTBEMGF53ESaaplfrQz3rhP7HTPinvi4Nbe+iJ87+5UXY588L
	 gULGNUeylJ9tvjVDQ3ywGNsJdMmnjKUO3TahQgpqm5IfKi+GpCzK5jyDQQNGX3oy3L9SH
	 SG18AcIcl5KFCZO2u14sFbPsKfu0AwFCeG9kYLDcO1Rfe5btv1E00Hi0kH+Pq1xrlwH94
	 brx2ELT3jfYw2jHfTCYQSVrdfBjKyeol4SnX+B8SZMn6d1L8l6T1x3WW+Ucj1CxkGfzNf
	 zJLBffNbijEjsEd8tz3CCI1VZi4Zyf5OFb79nzybKsnFmuy4AIl7lomY7TfTNmoBx2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="OLE/ah2/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="WRsGW+/I";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2045660A261F
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2045660A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OLE/ah2/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WRsGW+/I
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjslW3731129
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:06:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hz2XdZj1N82zwwGf5rQXwFrF2Tz/A+hhelwd2ljU2qQ=; b=OLE/ah2/EA/YApVL
	YDox7iNZKWVUiawjm/9KI34WLgg5QEIn0CJ5Xtj/tGcSNsBpjo8yuF5sLbGg4Ajr
	vhabz062Akceh+Xwm0SzRkpldVZOEMWeXCpGVBq7IK/fzgNzezHFiuA+w3qH18Tm
	dp3QWFIgoP7yJikeVctlZQO2suD3mHboa0Pd2LdktHuy2prEU1gfUVQBMxMCL2x0
	BmuWYWLFW+mgFvMqWEKREvnhOu6VK+V+XWJiI5/dkEnPlZ609NfHX/zX3JJCnS+c
	Z1CZU3tjMwmLdCpAEkXRy+5bhMWsAPVO9gOxL0RHxyBTQYaa5Cn8/rMUvEg+0WkY
	djwa8w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2mm4g3rn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:06:55 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3724667bc16so591511eec.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172815; x=1795777615; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hz2XdZj1N82zwwGf5rQXwFrF2Tz/A+hhelwd2ljU2qQ=;
        b=WRsGW+/IlvIGZRj7xUeVO6UYyZvKz40bPU7qWE+Nh7Qhq+9GJkQsR+NnjYWWpmbsRB
         NIqLU9xfJW/s4ckYPd3ptSo3l5Y2rPfcZ1/RTcbFJkDDZTap45S76M8PVarteLzlsn7g
         QEwxrai6kAQQ7bmBa3fNbRnsasmWnfpi02tz7+LoU+fJCsumUAMw/3BqOVgUTlBSdIco
         TFU1HYpILmW2zEMuESzRDU0pAw/SRHN2Sftgvr/2vwJ5hmLyyxg13tor5un+qK2qjMWu
         L3b/8UkWpkMGjdGEBUHoaH5X4R+TCi5Xtp7yud69BiwPrv1/xdFio/WCPq7szfvMypYF
         GFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172815; x=1795777615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hz2XdZj1N82zwwGf5rQXwFrF2Tz/A+hhelwd2ljU2qQ=;
        b=nOGpXCZwEzsjkpimuPA63wPFBOp7wvv3M98o9fe52kBQcAj8MctJqkB5Y66iS6YWeN
         QNxOcMoZdM4EAYOKu1Nq81k8Gels3C/jWvs8KeSbbyjdU5Klso7u454pkHyWNJyM07iZ
         MMhuidEoZdRBq+5plFSK3dfktRGRTJ+VKaKAiaCrwU0p0FwpwNHxSGtZAcKjEAu/aDwQ
         ndfwZPwX2QfeJshWA8QqN2cMk9rcSoAcEkpZxaTuiRbA5NKZdR4xiFY2oNE1HKWChw2c
         fkworMWmtC5jtB3libMKYLIsvGWPAn1K2/a/v5VsxSmTQdsXONAZdUkdWyKknucU+iU8
         lKdQ==
X-Forwarded-Encrypted: i=1; AL+hErFSaUKr9J2qtfGeC7/VoKc9B+XGHvzUUn4uaVYIU/qEsktIqA9jzAJajNnK3ya8l+3AGsnG1x/pniDL@vger.kernel.org
X-Gm-Message-State: APuU4Z/muXO7aKEjyNTmDpgcV8qslGEO+Ucj7sAdiKYrs0dL8juD9rbR
	oYhuRfFFFHDsfrNiMh/DaNFemlZnmS/rNg6IzPyzd23iSyR2q2FOwXwMkQ+Yq5ChBlhMJ3xjDCB
	68/4Xyp/LpnD4ymkD0+b5BtDiPy9ef9xi0yTpu3KZECnsLUKdUsVYPZaGwi7lygfZ
X-Gm-Gg: AZFdTZc6tIgI3BcH4rDoCouGInA/OiarNShD+OVcRrwu7eUfO5G4cnECA9KyqDVHtsp
	lnt4HgtyrpE+h5757aqHyjQsoH3E3TVg9O64yhjbZylml23pVbXcViJFsPEbe2u1itrqzLnr7oh
	hc4eIdwZkh7PpqJ+W4bBI74Vou9bhNvLkYciIqAP1K0FflFNulRU0Pp+IV10RsBcVtkpOMg8lhB
	zzAEXxdPRoOlW25R8Fgpxmqo80yNCXRvooNU19ffBXYCrikZRHlsPkt68ffRWYOaSTycicVSCM3
	2rxdQaKDvNtz/81fRiImJk+oWN1JH/yo8u96UTKl4rZaG6WH7FJT37knjLwjDDRt5ojsEz8JrGX
	WLbTgabGW12Y67SKMhsN3DMERVVnwvIoGsLQrutqU8uuWVBgBInMMXpeRyZX1I9PlulhLkYO83U
	yzZ0Gv
X-Received: by 2002:a05:693c:41cb:20b0:384:4fb:510 with SMTP id 5a478bee46e88-384b4e7510dmr3920919eec.27.1795172814801;
        Fri, 20 Nov 2026 03:06:54 -0800 (PST)
X-Received: by 2002:a05:693c:41cb:20b0:384:4fb:510 with SMTP id 5a478bee46e88-384b4e7510dmr3920883eec.27.1795172814150;
        Fri, 20 Nov 2026 03:06:54 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:06:53 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:42 +0530
Subject: [PATCH v4 01/20] dt-bindings: iommu: arm,smmu: Document
 interconnects property
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
Message-Id: <20261120-smmu_interconnect_addition-v4-1-cab8ee8be0b3@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=2417;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=L9ZDNV193MgcYYJuTHrN/Rk+LSdrA3XbSL8eIPKsLAM=;
 b=wdg5TvZTBzYicERdTGjHlneO8uNo7gn2OPeJEAerjHG3UyVz5Pfkn/6J0N4Bhc0D+p0HdagtQ
 2sciI9FlJ7GDWUDJ5zSVep6gADyCUDd2XYfiX8Wc3WXC3zK6xtK0mkb
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-ORIG-GUID: qiJcrVXrtYhDEoaplfvA7zPvA96sWRP7
X-Authority-Analysis: v=2.4 cv=RZYFmFtv c=1 sm=1 tr=0 ts=6b0029d0 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=LIGS1bie0qojq0S7pNEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX74iQmSpv2ueh
 o+euyLin0L9KU5O54GckksT9wTJosSah+GTCamGVrzlEiJd9H8U2ZhjQoMjcmzaWey19EUBVd3A
 avOoSw/8Jlg9HQjVaVMhdXMhQeAKavY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX6KQBGkKa87Nc
 1rJ+fdl28iTpmZHZ9Ot/IoAzi/GxJY/YD3WI/1o5/K/YCRNpjlX6ogltMxjhojoT9OYlvF8yrxS
 1StLLEeJP5LLI9Q1B4d7JjnwQljPnfzdbDSuOcRAciIPQWMskp4FnEUgpoE9DhbVd0ovUjginrp
 R7jqpJ4nvCRWdjhH+cD7MTPcsBpaWOhI2wtfmKcAGLt7b4c56xLhqJZZ+Unc5cdsx1S/bPpJ8Q1
 oxFp8mjMLsK4TGmlNBVlUH2CtC2BlpTXWy2DSb2g9CmLDleActFqCSw+s2Zjvez+gyN/RloCZgf
 ma1xqXqZuVIHY+YQJ6tEugjRQWuYbU0N4Yd6Ns3WDDBmYV5wjCtw51aMLD/EpyuXcXVhj6xdl63
 5veUXnuQk0O/24dFdw8femO21G9RtVyR0jU1QSpI+2j3PgwKqT7cCZSiUQYTq+xuUeM9YjDjG1a
 bkPEfFq8pnTKYwbiQ1g==
X-Proofpoint-GUID: qiJcrVXrtYhDEoaplfvA7zPvA96sWRP7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044

On Qualcomm platforms using the ARM MMU-500 (qcom,smmu-500) as the
adreno SMMU, starting from SM8150 (Snapdragon 855), an active
bandwidth vote is required on the interconnect path before the SMMU
register space is accessible.

On these platforms the GPU TCU is a separate hardware block with its
own AXI master port (alm_gpu_tcu) on GEM_NOC, independent of the GPU
rendering data ports. This means the TCU can be active during wakeup
while the GPU data path is idle, leaving GEM_NOC without any other
voter and causing intermittent SMMU register access failures.

On earlier platforms using QSMMU (SMMU-v2) the TCU is integrated
inside the SMMU block and shares the GPU data AXI port, so no
independent vote is required.

Add the optional 'interconnects' property and allow it for all
qcom,smmu-500 + qcom,adreno-smmu combinations.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 .../devicetree/bindings/iommu/arm,smmu.yaml        | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 6748351c7812..ec0fc5f7d4fd 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -252,6 +252,13 @@ properties:
     minItems: 1
     maxItems: 3
 
+  interconnects:
+    maxItems: 1
+    description:
+      Interconnect path to the SMMU register space. Required on SoCs
+      where the SMMU registers are only accessible after a bandwidth
+      vote has been placed on the interconnect fabric.
+
   nvidia,memory-controller:
     description: |
       A phandle to the memory controller on NVIDIA Tegra186 and later SoCs.
@@ -656,6 +663,24 @@ allOf:
         clock-names: false
         clocks: false
 
+  - if:
+      allOf:
+        - properties:
+            compatible:
+              contains:
+                const: qcom,smmu-500
+        - properties:
+            compatible:
+              contains:
+                const: qcom,adreno-smmu
+    then:
+      properties:
+        interconnects:
+          maxItems: 1
+    else:
+      properties:
+        interconnects: false
+
   - if:
       properties:
         compatible:

-- 
2.34.1

