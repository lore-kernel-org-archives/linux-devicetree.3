Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182201;
	b=B+82fG5b/+d7yLZE1KoPRh+dbuw50+onrBo7CjBDUgcaUNgZTEb5Bga80tf3aKO2EqHO
	 L5YvZ1FY405+YQOCJNn4opXp1fyACj/Ab6TJa7SfoAiz4xqhOMxmhRjfF3x/s/FiUbm60
	 8bqnuUPcFB8sGBvjWnOGYeODWgJzp1/V2HW1g6vFEWcQCmlzuolBa/lFnwZV2Kt74e07Q
	 qf5+wsmLzQOFkoyt/Sz3XtdtmfQvx/V1nOKViSPtGsVv+q6vBOWn8EyLm7yHeULbs4NC0
	 YyI8hHqx6mH9euU4LrYKIkOKFOrAYkcspz45d3eT6jBe2UZGRjq70AeUeuonkxeOOIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182201;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/c/KG/bwxMNjDAMEpOfesqcMkfEXvpGwewsDe4qI9VU=;
	b=3fQfv703q0PuJpxSvM5DeVaB0wvctYXoMQqbu21JnWnGv1th5Pg4SpWBLPCK7hu39HE0
	 NhWbkiXJ+7ariAn5kEo9ApzotEvD4A8gEvtDl436iNmhBU5F0EkYg7jGFMZneLGVnCC99
	 a4i5mVpZnV9olgtQzmioA9npxY4MHxILTVKahzyolaq+wIzfjIN76bTBfw18yPdTbxx+R
	 MahhWMAnF/YknWgieNB6kTBDf+Qg90x+JY4QGjH2I3WKrzSuTjAHpl+YCS6Hidsj5KoRz
	 ZNhu1YM0uu4DN3iK0WLfOMQbTM575/d+GCZttlz5E0MotJM+Eu+3ef1HaXRVPMy+qFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=foY1MxOt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XS1Aegec;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2FF606A33A
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D2FF606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=foY1MxOt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XS1Aegec
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjoet1462889
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:43:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/c/KG/bwxMNjDAMEpOfesqcMkfEXvpGwewsDe4qI9VU=; b=foY1MxOtGLeNTRxf
	Wpqzp1LgBB1omD+/4FjpAXV6k6mvbWzzlYh82qiTcZUF+SfmZIbBdpu8INIvIzKd
	/ErMKdgAAa9H/6RDBGfP1moSSYgYUFgoBDih9PSjAcsUoShwF+8I7zfBff5+V+xn
	eEtHGtjVmYJt1+xIIFfXp/duW8GP8arigTaRyHTptHzPzsGDPCHlVJg5ZaR071Xb
	ixou/MSXqbT47om0AaP+eC36HrpmqvyfNiXUNNwznEuvDJvDxn5fph+STgwwl651
	knBJim8tMzreuEwNcV4gyfWtveBXOskzSHVIFGdvDPC3Y1rzwK2fkaQExyMAXF4I
	yTvNCw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guahrn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:43:20 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-383ec96a7deso1015058eec.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 05:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182200; x=1795787000; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/c/KG/bwxMNjDAMEpOfesqcMkfEXvpGwewsDe4qI9VU=;
        b=XS1AegecV9743TXzPJF74d+hX0NoXcV+hnfuRAvUe+co0Ta2upD5E1AJGc+gXYWG66
         NBHEfwAWTCGCecF9bhaHCVxChSW/gFRU3Rrs+g4+/zIPpbb2L2KhYCPcbGKd/jLfZ/2y
         EBb5QrJpg5WE6a69gQZ7IEbJHRaTSWSvNJh4F2PEJiI13PIf36Ux9JN2+yo8fJXsotDg
         i4H9MkpCC+vhnAwUYwwZe0whBSYKy97EwFkSF/8OxUTi6j+QeROKLpro+uFXrgVUrvpb
         XlNaZxOMFKXT/Ir082ixdFt3c5QGlWzDT2PXoelWBA/AqOdQrFzDp4Q1VmdnM+kiQgWl
         PgWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182200; x=1795787000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/c/KG/bwxMNjDAMEpOfesqcMkfEXvpGwewsDe4qI9VU=;
        b=2mpv5j4DKVfQHCp2F2m4PDZutgBI+lxdT2AIUeHn6eQ1KIXOFdbClVIzSBRNRHuNMO
         XadwJRZ5iZif91lREWXbPf49rTACwlhnGxecWiemDQM9y3aULhKTNOlpIRrUAjtSFxbL
         VEWKbCXdHY99S4YfNBtD7zRljrsuNVA4ZUnZgus1lyQbPlXXLmVBu4MCnsZqxblnQvfq
         TI1XyfgAndDwVdE/iocIJ1neHvzR11338fVfE9hmuGjd0ikMpW3m9XkW/21Nmqjs/2Q/
         vvt114oNCwSabrwVZGGotDJSDtCMYYuSGBM223aN7agUVRqSc45A4W134JpNGjEt0rE2
         jkSw==
X-Forwarded-Encrypted: i=1; AL+hErEP+HlttJuUiWC3qBlOdfwgLPEKop19wYBJMAvW91D0oXwTAGZWS/J7tY5O3jAfRzEElyFi30MrZ/Yj@vger.kernel.org
X-Gm-Message-State: APuU4Z8JGwJunrAHCq4KPN8Coy4sSDgHKVMlJAlnJUYX44he+6Vz+WC4
	nMSugfWMGZJM2isckEXvN9Ph1vzoQ5W7uTezanRmofzHus3nRPuI8oIdnxQQ9dzeoSx9ZintcQ+
	+arFGLC7IumBgqGWm3hN6pewzaEz7ivdsiT/EKDKZ4KppDtsKcs5G2+/A8HNYmLJ1
X-Gm-Gg: AYBFou0a9aGYyXv4B5CngjdK/+wmIWS9wxVScuZQDIUJAp/bR4+n3JDwK8yqf3ne++P
	skP1hYL2ENWQWfWLQG2OD4oAkwWdM1wN/2+072s4IVD8YV87CJxHF7GSHjZ4uYTC5w0joH8t4xc
	YdIuLkLRPJlBf1V9DZx+n25mfE9LWtf+S792O7VPk/p2zmMYp0Ka7K54rPMY0q4l5K7zV6xe0Tg
	5YkIK/IPiC7bsc0wFUE7EZiRtOFntz3up8gqLlBXqf2QLEcqqF9KQwm3al7JpWLBvbZYuLp+QVa
	M1GrnrARbQiUfpvrrldX3q5H7Y/DVRidXGLeNDH/EYiAS2AmvFsN1r0Iqr6Q0iyXbUwH7sXH7xF
	XBALTxAGP3DNlP4UGb0GVfIjobXrz4aQx57XJxEsZAaQJRtK2PwswJ/Cq+dChm+idjtXoUhTD2j
	Y5Hqg=
X-Received: by 2002:a05:7300:881a:b0:385:8aea:11bf with SMTP id 5a478bee46e88-3858aea13eamr3495327eec.41.1795182199481;
        Fri, 20 Nov 2026 05:43:19 -0800 (PST)
X-Received: by 2002:a05:7300:881a:b0:385:8aea:11bf with SMTP id 5a478bee46e88-3858aea13eamr3495275eec.41.1795182198873;
        Fri, 20 Nov 2026 05:43:18 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:43:18 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:41 +0530
Subject: [PATCH RESEND v4 10/20] arm64: dts: qcom: sc8180x: Add GEM_NOC
 interconnect for adreno SMMU
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
Message-Id: <20261120-smmu_interconnect_addition-v4-10-be30526391d9@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
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
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1059;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=EEkH7RME5qFBUL1GYWCz8dsl/artX4YyT169jSjW1ag=;
 b=D19IVJaRY8IM7fDFyum4SvhwQsx4wXunIKVaE9hZ9h85bUztqtI7mZs5BEvllnGtD1p8qtRRR
 KprqJp1ygTlAGWbe7sl8ozE4DjPRI5YllExdodSObEJfkOc69jqxYru
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX5CFL9v8weaEr
 1wy0QQs8ilXg3iWVq8rAgG8gUAMAXhFQUf8h9fI4aaj5JaZeaOBDacXl4LkJqJUbDFQzz7/JX2w
 hIZ8Wrni5s6W3DkRC/kfUz9cWmXepXO7vCrmWpZLZ4A8T0kdrlqCWPqiFf7uwMdLfh2xlfMv8OW
 ENxM0COPfdT2q97Nr21T78zyAjndhxk43Iq0kJwiKmsYUxZ3OwLNx8A7+hZvYWbeyaaLaqEoyGI
 gRCkHuMiflYRxsXMEP/NoCQSWqrqUy8lEh27gINrMYgjJeEbmTFlDjb66TPX5Iogu1xQ9Esu+a3
 4gH9dn/lmUjsg7t3XkWTe6cXmqCJ1uV6hXfCYr+82uem5FH6G8Am9C4yLK6qBzrwXFPcq9KomWE
 vwt3fONCF7rd/x3wiiWjpuXgHjBsoB2919l0YOznEvWSDHLU3MRi7eJwCKHuPsmLwYZKf3Ugbh/
 I/GLec7v8vbi17E+lLw==
X-Proofpoint-ORIG-GUID: X6qFlmm43NFcJ3FVWIq2u6l04MsC_dZ3
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b004e78 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=THzGGTBd8XYxRjXI8TEA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: X6qFlmm43NFcJ3FVWIq2u6l04MsC_dZ3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX9gj0DSY0NxOg
 awwdXHU7fsvMGC4rJBPPFQ3DFy5CpLscq7uVuyxbMXeFQPStCXcNdkihGV8O52YXHf0bx4ek+3j
 +ZOotcmcpIBrsjPehzYJkfnylmpeU7o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200054

On SC8180x the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index be79608b7161..acd05eac700c 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2410,6 +2410,8 @@ adreno_smmu: iommu@2ca0000 {
 			clock-names = "ahb", "bus", "iface";
 
 			power-domains = <&gpucc GPU_CX_GDSC>;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		tlmm: pinctrl@3100000 {

-- 
2.34.1

