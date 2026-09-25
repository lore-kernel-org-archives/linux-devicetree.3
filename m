Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46C21C862D
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 10:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331216; cv=none; b=ul38MuOrssxt2IcfueXTcqN9Cuhn4Q5NtcTbtbASZc457aiNK4hYA2LaOD6wr1SEGY2zU41ROIIRKGphvOax1VnlanUvRpiSeWCuOk9MUUa7Wf/sdB56LuD7bOtlHiJIF+mm8ETPnp201nVDb6TYP3mfPE45ZENvPj5sSfTiAIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331216; c=relaxed/simple;
	bh=LRFKkO1seXh0WFGcqXLLFLq4Fhx0lzjzwc7PamPgNvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gnWvNRy6dtsSbO2I8kDE+I2RcpBsmvqK8i7A78isaqSRPQ6V0uLww43lp92nl8bk9sfQXDiYdgamn/9MaQKYw7GuZrfVv43kfhxnXzWtiQuX8Cmeo7gJV1LooHiynzr9Kq0we8f3ehWjTXALJTHYyT6iAS1PA5BAFlNXtObf6pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aZHLJXnF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RplwHvPo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aZHLJXnF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RplwHvPo"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Z2rv1194495
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 10:13:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dYPoHI0AAzT
	qoxz4LyK6sk+OaPF3QC2+Sv89PHOEyG8=; b=aZHLJXnF8H33rNli34TUvrjWO4y
	XKgQ9AEgQn/hVooBk/Eu+pzGhBM1liEY6UNGt0zx3VF6bNU3M+IX6ZShrsto7cwd
	teiJhUjsor5pzE9tZz0zKuVGpK/3u5XG1GmXOEUKeP9eo++DklFDV28NE0wsTLbV
	4JoYyVP9COjhwm/CQm3JYi+Io1Qhvi7luVxtt5oE2bGRJlzqfF+FcGKb2y7hnlCl
	5QDuSqn4f2gBerElOLzjbEHW/vXP/LudQaBrV3Xd0mwt9V+yRSiJLLRRqk40pFSZ
	v0TV3VLQKyE8g2Zy4NeGM1oX6NdIaIpO6QFBn/EBnqMX5MQO21U0zQ1TLtw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw874k0bs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 10:13:34 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-313d1015161so2486345eec.1
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 03:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790331213; x=1790936013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dYPoHI0AAzTqoxz4LyK6sk+OaPF3QC2+Sv89PHOEyG8=;
        b=RplwHvPoO44i+wHyZZtbsCyRn/hqZlIk4wfAgCZrSNGZx5LI1aaV538BJh+2cpePdl
         pB2xy1nlhkI5w/OnXVkoAUvySo/Lq/aGadBQHLi3kytS4M2y9URmsRbuaDraDWIkX3cO
         A0RZc2i4yXtAfmYGPBLAOAwBwmtvhiIup2VK1aO1KhL1wqw9dqndtI4EfAfrh1E046IO
         H8PPjB5mRpvnLKokWsHu+38N/uI0D04S8NmYNLV5ahqdJtfQu6GceaE3xk4yalX7aAMW
         jNoaRC/pYSefr7+vcCRr/VCQPIWEIbR0PNJCfqbB9LGRXLOSR2GbULSvmIvb5g0bKvkt
         NlNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331213; x=1790936013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dYPoHI0AAzTqoxz4LyK6sk+OaPF3QC2+Sv89PHOEyG8=;
        b=pcGNm4pkMpVYtXMGavpQyuQOvAjhKIeTlzGBDsZAjKg4Be0mrJ+iE5FZVPYEl8CgiP
         obl/ijn5yv47+PjWLCC5esNl0TMiUJ6G2P83XOwzo5iJ1fJINidiOg1Nu35BzCxqey7M
         RwRKVdBYBTz6jccgJ2gTil4Ge+G3Pt1VXOMmpCRLSB9aqUGAvK+B77TpuAm5YnRdgM2N
         NURIKNopcBKSNVJFtwUrO5I7UOeGuuXKER1Jf8iu/Rwx1U8O/nbGARgVTdEZiw6+CXSK
         mESdZF01H9dHf7zFlNcJ073R/M0qzK4eEkbJKHk7wdnqxYG3zK9SXgyZH4FcFykKsFKC
         I4hw==
X-Forwarded-Encrypted: i=1; AKwUvBzD3Aw7jzTHyYF1ko/m6mDMqr2Hpdqn+MAxOGzAtcpvJdbVtZK3FyrMs8S83onc1tArPzCaKooT2DwV@vger.kernel.org
X-Gm-Message-State: AFuF++l/narIUAIxtykJqzJgkk8ndvE1zUg9+MYK4aAnR5h764FTzUjx
	kF1MUvsq+xNozRc0v/Zu65XJsNrUrhIaDX2p4wx1N6PJfxooze/Gz7wly/yMpOtcy23wNJjMdBE
	jMm3l3k/zP4+ltMqJ82jZ3eC7AAL4XxMCV7NhcO1YK4P8WZjMqQKzPZeOPCJvWj0a
X-Gm-Gg: AYBFou2FUC7/7O7b5JrgsXlB0tk6tniX6Fc6zLR3Iw8cvLZVrQcdaoxpbFu1NNe7gMO
	cmaF3HC7jBKuTjrJbWXnW1tIu8CXn3IhCYFNLXOtN9mUaX5JqjYl+pUccKEN7mNr0oHi0jAV4+4
	zp7g/Yecmt9pmbzgfygsU1Q4Yj3mHDlL2qg17nrF9K7JdZKNbLoUUCv4EJ5Xgo1uMNS+cUzPKZW
	NERBKZtCppqX5mLp65kA1nH43wPbBNA61roFeiLXKhOnX5hxhqCwQyDhzTtMdxIw+HPHB4uY/HY
	f4DE20WVhsI3GzFST5q0FakwcaceMLRx7a044kDT+vmBwlRc0tSGu4P1WaW9uag5MN5O33AJW6w
	/KjQrGU94OmQsD4oZuxUGkgAkKw==
X-Received: by 2002:a05:693c:87d5:20b0:33b:c758:74e9 with SMTP id 5a478bee46e88-3400449d090mr4722472eec.4.1790331208392;
        Fri, 25 Sep 2026 03:13:28 -0700 (PDT)
X-Received: by 2002:a05:693c:87d5:20b0:33b:c758:74e9 with SMTP id 5a478bee46e88-3400449d090mr4722280eec.4.1790331203165;
        Fri, 25 Sep 2026 03:13:23 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3413fc2413dsm5397961eec.0.2026.09.25.03.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 03:13:22 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 2/4] arm64: dts: qcom: hawi: Fix PCIe IOMMU maps
Date: Fri, 25 Sep 2026 15:43:06 +0530
Message-ID: <20260925101309.3826038-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925101309.3826038-1-mukesh.ojha@oss.qualcomm.com>
References: <20260925101309.3826038-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: IVlvRxM3f1UAL_Q8vxSL9_flYovmTtyf
X-Authority-Analysis: v=2.4 cv=MI71C8Zl c=1 sm=1 tr=0 ts=6ab6494e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=yNTuY5RphX6TMQbXDycA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0MCBTYWx0ZWRfX2JYjgpivrIgx
 4h6+A7eIo59W7UY1vAFR5aoBhxJ4b1ZSf1c3FX33WUsvs9DHXdfFlAiELPTGDcAQeJuITcxmrgR
 ZqVYEGUFPKY/sW+sB7oIn8uEwgFKU9cMO5xKAp8D+F3xJZAzrFGo3CbHxNx/7w7oK3Q8yk60SeO
 BedWX4Gn8NUIUoOPqZvCHjP4vYBi0kcy5TE+fCv/6gABVSmOdFcB8Ipvr8Kvt4MWoW8esbaEkR5
 qFs5yRarDK2htm4In+L2KxRK/DSRTA+btwfxqZ+kC9T7I0H/5whUvc4UnV8bNkJ1Fsde8uoeQvZ
 38BsXudE0PUy8iz2ZZtgdYtEnjbBoE1l616zFfpIHTa4kbouPboe8wYJfh5Wls/akslYbkwvuqp
 Y9XZlOwKjWMxUbQHRdExHs2VwReB8G5t7S1TGs1JaevdSrRADcsNwgTsZGFnFMz/R98KilBboZS
 gTR4R5Vyjj92hUED1Mw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0MCBTYWx0ZWRfX55PkoW0lqzHG
 ROOGWdF4WtOq+VMU74s/DSXeMRcYPhY2Bj/wU0cTKEYwtIDkt8t/oQ1VkMUZBABbJhzrLaF10BJ
 DfedjMTAmjAgHt+nEj8yq8RpBtO6bsg=
X-Proofpoint-GUID: IVlvRxM3f1UAL_Q8vxSL9_flYovmTtyf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250040

apps_smmu defines #iommu-cells = <2>, requiring five cells per
iommu-map tuple: rid-base, phandle, sid-base, sid-mask, and length.
The pcie0 and pcie1 nodes specify only four cells and were omitting
the mask field.

Add the missing 0x0 mask cell to both tuples in each PCIe node.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
index c7ae8133b9cd..89bf0f59304d 100644
--- a/arch/arm64/boot/dts/qcom/hawi.dtsi
+++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
@@ -2958,8 +2958,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			operating-points-v2 = <&pcie0_opp_table>;
 
-			iommu-map = <0 &apps_smmu 0x1000 0x1>,
-				    <0x100 &apps_smmu 0x1001 0x1>;
+			iommu-map = <0 &apps_smmu 0x1000 0x0 0x1>,
+				    <0x100 &apps_smmu 0x1001 0x0 0x1>;
 
 			interrupt-map = <0 0 0 1 &intc 0 0 GIC_ESPI 213 IRQ_TYPE_LEVEL_HIGH>,
 					<0 0 0 2 &intc 0 0 GIC_ESPI 214 IRQ_TYPE_LEVEL_HIGH>,
@@ -3140,8 +3140,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			operating-points-v2 = <&pcie1_opp_table>;
 
-			iommu-map = <0 &apps_smmu 0x1080 0x1>,
-				    <0x100 &apps_smmu 0x1081 0x1>;
+			iommu-map = <0 &apps_smmu 0x1080 0x0 0x1>,
+				    <0x100 &apps_smmu 0x1081 0x0 0x1>;
 
 			interrupt-map = <0 0 0 1 &intc 0 0 GIC_ESPI 106 IRQ_TYPE_LEVEL_HIGH>,
 					<0 0 0 2 &intc 0 0 GIC_ESPI 107 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.55.0

