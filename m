Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173083;
	b=BqLq1HgyHTQYy61VlwTJjN0hJIRTDOSR4bnVi1DPqvQG0mFlIDj9rgvVzirdpujRPRtO
	 uXH78DxvFqysT7cHIYefvsgZeonHOVH6IdfRPpJ9b6qAtiAQb58IvVLbSEquh1M2Qej3+
	 RjVYUXl8uK9Syg6BM8LxqZ24S2Xzj1xqrHUkL6XVhroE6lRScqDnY55OC2XvbxXefpF9S
	 BF2ITcggCw+vZ1Jtnv7PSNe6n60ohyQY3ft7G+H+8dgck6SVQzAtuBjWwFY35kNYJTcZm
	 TRPz0iPwh3t7sjQIxvkpwqtOad0fiS7IYiocB1FWHiSDEVG9YWFnRJXwvxeTHaWxcNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173083;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HXm4k1DgFKVbkmW4Q/hr4ib09JC8zzKQS2UORh+nT1g=;
	b=5sQM/ltyQGX5DrYDepS/WcCvbw5OMRqO9AgsTy/lB7t75sObiXKKHzXDmLjn8shDsphE
	 n/fpFbmEXRlsIiaA46kvCbuN48YfZhZF8ZUMBHdmVmVUtKGZ489FPXizVF+g3/VqEX99R
	 moIgEoKZkpRzp95lV7J/GeDX3GeWautQAxkisn2GsZrG150epzBXvq7pQVc25dP++Yzap
	 8rTXaUj8dMO4Km5xFgCPwyRK6+2wNqLNWGgM6+3E+LwjZxwL7i5dp4hhUZUsfVMCrmXds
	 C0B9d98HrAcxhkuuUeHei2YcNxZLTZ+9vzBeNBVJG/mnPC4HqNPXh8dPY3CvxsjbOkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IYJMzjAX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XdjApw6e;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6518760A2633
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6518760A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IYJMzjAX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XdjApw6e
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk1Ip2155269
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HXm4k1DgFKVbkmW4Q/hr4ib09JC8zzKQS2UORh+nT1g=; b=IYJMzjAXjQDdXhMo
	JFNnYNr6qoT847WlEzi9l6jA6SZ6KA5IBonxTjmGrbIvWObGXDfpRVtnAhY5anIZ
	0N7f+07R47Vd8HqyQo/7Vtr876y1dPWuVp8vuCf+DDWppbQazuimGcDPr4nyb+P9
	t3WPIBwjbsxhqTlZLWhltG1gb/5VZypuuKQ7A9NkR4W36UKnXgR+CG2ifoybZd+1
	pLK0hQ5NVdbpGXX26z7T8vwh5ga0VUNokWl4UwVrgufSYfUfBxiiT+rcjxdzypey
	Zu2t1Vdks4YiaVXBYsR3mnn7AmGoKzGl44uEt2JWDLWedjze1eyM0nL7xkRqNEq0
	OD/K8w==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2f4yhkkw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:11:21 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-139b62317d0so2157765c88.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795173080; x=1795777880; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HXm4k1DgFKVbkmW4Q/hr4ib09JC8zzKQS2UORh+nT1g=;
        b=XdjApw6e84jBfjJV/F+vNQ2h2jnYG9OOJzdxhcv3vl6X38cu2bdpZ/CASvRQz0aRKd
         Z/bwCwpmyKXwFITMmPXz17osQYKTNcBAnhJvwrZnW3wn8Qgja9JY7ZalYJ7F537BkIyo
         EVCUNkv9JsKwivbEYnGzQUx3JCKfW5Hy7KhAhBr5NfuKC4cUU4AymByjzjCWisiduJdD
         T0rhexJjhXlExz2GVTmx0fiePAoaIQjo21tyGeYpb94gSXtHqiD/N6aKz6PcHxVhOop4
         Ho/9x73O+cuzH65m5JxvtAQEQGpk3ve6QmXAtEQv1B4/Xpls4/PFvXMx4F8ke9gEab3L
         Tmsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173080; x=1795777880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HXm4k1DgFKVbkmW4Q/hr4ib09JC8zzKQS2UORh+nT1g=;
        b=yHC91bbB8YdstDN6GQzJsR6ErqWPyk8lNoAhm4jGa0jxpjXNEcAuntZg4RLLEY1CsY
         SVLjCCdx29YsEMwQl/kvUOa2fCu0RVI+W252uKEaC0hAXklbgStWZfuBxl89QMY8wB/Z
         A4t8GDAOuRhA9xKWprY2RDjzGvwKF77CUdV47KH4obEuRifpqRw7czM06tRxY6AITkZM
         VrqJ5URpYkB1CTZAQ+rrMwCRP3VjhtqXuKdd2ksu5C29Da6EJw8TaFCySWVvn2T62Llx
         5Utbx51lUfNNhWnDqpGthfaSi2gibBCiGtayNxjAtsF7Qa6Tw/iGyTYZVJSniI0q1QTj
         QBAQ==
X-Forwarded-Encrypted: i=1; AL+hErEVPviJtCqAlDBoDbsJWzD326zebQ92oKRZvYJkfIU0gT7nk8MWL/FvJHFCYRWF/gjKO4Ld1J0uGoCn@vger.kernel.org
X-Gm-Message-State: APuU4Z/DTbeewbCs3ySPUwesdd9jCatw/EcrtdCP119pztx0zJFE6lyH
	xAvqcD9NvY5J/KfS1SvtcJhCPEON1/N5bH+DOEzHIXq8LOe6iecQcJR5oZyUlYwlafSi9N0kOwn
	TjXalGIvzaeCVPGeXu/vxKSzuHCGRuVWhC//+iuhjopLFlsPng6K2hnxmCIDjpJiq
X-Gm-Gg: AYBFou06mdHT4uYV1D5EaaW0IU1umnbfzaPaACNaYsbapUEE8YmOzM0gGwm6APmYX4H
	pK0CNAo+bCUeqdZ6b7XI4yeN9VGoBEy4DB6yvumnM6IcMe9VssTzBckEhlq/XxJ1bCJ3bbDHlfv
	X9sGt9LcmYte5yIZixbCQd83xcxwN8hIh6GOnqb0S65Gw2jmx0FJRUG0sLsa62o157YrtBvkPtw
	FWy4MfrWbro44WA8BPzfgjAXVWDQlfBtp1EnsqBzujCs0mUPehsJqxPHfDR855SggzOzQ7ScR/Y
	Vy26rrF4gW8889uKVABMP+/EkfrTaT1hlg85SIrwFTBuHJp3gcbzz9XZV77oKqk+GzexBvsLLjE
	IIPNqfnTUyoQectMuGgYsSnufRjFAedCT1AuDnRRLBhlKf1wUWe22afV4bov1E8tiJ467n2DvUI
	xfi6h2UfFW
X-Received: by 2002:a05:7022:b044:10b0:19b:39f4:88c9 with SMTP id a92af1059eb24-1b5568a12e7mr2761788c88.10.1795173080170;
        Fri, 20 Nov 2026 03:11:20 -0800 (PST)
X-Received: by 2002:a05:7022:b044:10b0:19b:39f4:88c9 with SMTP id a92af1059eb24-1b5568a12e7mr2761762c88.10.1795173079649;
        Fri, 20 Nov 2026 03:11:19 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm7254229c88.13.2026.11.20.03.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:11:19 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:40:52 +0530
Subject: [PATCH v7 02/12] dt-bindings: media: qcom,sm8550-iris: Add context
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
Message-Id: <20261120-vpu_iommu_iova_handling-v7-2-25a771235a7f@oss.qualcomm.com>
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795173061; l=3839;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=GV25gcoT1/60Yt0829YKr8Shzic4HV1Zb1QglfVRCeA=;
 b=1u5RGNteMTKbZ/UU6Vn/pdRAMK66SmM8h2jU2dbxio/X6GEBfclR5+JlVnhaHg3mNY4u8AZiI
 k4NhbpMgcC9CcLp0IxUHtTrszlCPjDsWJY5XC8ZFoHTy8QlRIWoG3hO
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=Zs54uN7G c=1 sm=1 tr=0 ts=6b002ad9 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=w7pRem5UOBajBC5HA0sA:9 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX5ejqdIOJ31Tp
 VGrGnsBJnBnRaBv3bxyIZnYtnYG6XaaG147GeK6b1wRxS0Prq5hgEo2Wvo39dAGPh/nBKPsan48
 3rJZ8VXq9PPQzzYd5pgwabo0yVYUq4KbU2dywhbyPu0ZloHY9z/Y/+U2O+S1V4iLFcq54v62Uc9
 BBIh4XYMp0l63Ca/KezdMpx2bl5G7e048k5UouHPK4s71AvzxGwNOjUPIU0j4py5XIkafpWruxj
 htDZIxF2UcNHnxQFwYbkDdmDXGnluS3Lq/ROjT1DSm+0u495IEOaCxesFrruTun0tobp5l/rWPu
 P5cOoW65KyQlsqsS04NuuCcxYaFMmfVqYIDCtpZraHfbgQ7BllCpIgcw7KnY6gMDx3CS1ZLroR8
 f1id74WI0OHWkfjoEQIKVrqIJ9S4c1CPm5Ac9W9lALUQUeNniNQMcpAVpQMn3oZYeMxvYxoWTSX
 tPXB/H+kt54T0dGolFg==
X-Proofpoint-GUID: i3vB9ZE7CxSWIFbNjbTXUYxpyVmf512a
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXyXceA4NP8Y8t
 mwdlNuLHRgH6uobKbY9apQNr1Nxyj5SBWPZ3zhFDbODEECbXCSn2ZsATDiz+6cf40gn0G6e1Cdd
 GEvhYYNnOF68x8xgGqamNhXqx/jy7Ic=
X-Proofpoint-ORIG-GUID: i3vB9ZE7CxSWIFbNjbTXUYxpyVmf512a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044

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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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

