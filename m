Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182185;
	b=kLObc4aE4fabf1e8mJ883sxSExHTcPzkkxC90Y7PkL7lSjZj9tQktz/X+KCh2B3g5Eqx
	 fuv1tBUdItcJzsUyOYsbxDaiAxjGqvHznB3nN7D/bgzDsx7ZbBY3wJc2EMRfYZPRyl56+
	 cd1F6LeI6M6DnK1aN7Nlodtuoh/fbCoW2JriitKSVADlO8TqAU2Oyi5ytf3KTVQVgPkOt
	 JnKyVxuMJpQ2vDn63sYDExYvYrfOwRNnBWL/40h8hdSm9v69qoDmuQBTeFZLMAH1puEjM
	 XNvwFW2mXrotbAYke55sbKG9YWifCZTO0ZNhtr28djmp9nUw+d1y1mfHdGiz+kBe0Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182185;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AVidbSNiizNkNTzgOXhRluYV4j9L9EQKnRCU13pMpyM=;
	b=sa1IW+tu0xb0T5HKc8gm+CeWz2AQ/JsgYu8aEG9OWR3ZMnY7SsB1Ket5Bf3/I6JLhYU1
	 iyvdDOJ24s1VVD6gEgJEUY8nbg9YTdBafQejcq3yqI8zkhB2zvABXgXWIEXmZ35bp3PhM
	 OeY1YXvJL4Qfw1BaoHRPBNe3lxBMvzpBqfAxz1MRUIe+dd0dG5IftA40J49bwSHZ8SERU
	 cHG+JFtt2WI6BLdAzWoHVeugtAA9S73x5YdkLHI2xFYvR4VWRY9C4RDETmmD3wtI5nGyd
	 YUEAkFVfQ7LAmGshZLo/+yZzXk54XD6IsnVRiobzO9Hk4eS5Sd6q2qTakhsZMfwH80g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ghWQDbGm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N2ueehAa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0696C60A2622
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:43:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0696C60A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ghWQDbGm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N2ueehAa
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjokZ1462866
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AVidbSNiizNkNTzgOXhRluYV4j9L9EQKnRCU13pMpyM=; b=ghWQDbGm/RfEzbMb
	9mYr4PyVHHfjH6865baF+WOueDP8HHspGjuacGVEWATd5rru1puooKpX3QbLS1Py
	BzdFjH6XXUE6YeF/yXJvjP9ibnmLX9MRyNf9ZfJxLcDsIHHvcg4x5Xff26tzCgER
	N26d06GwT7Hav+H1/g/t2ycw/cPuBOb0nAtK0fMtOA9skk6tOzs2jj3sMBrAHrnM
	zaZvoKKqWHkZ2G636TI8Tah5pZxfpfLMhDa0VheZF/naDI7mwNEoqNk8u+3s9oE+
	7e4z25Sem+AJnOtVy6oUYbWgI5QIv9qb+ZWE7wBMf30ZQxPNi/axKKqEXu2s7XQc
	IJu0uw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guahrky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:43:04 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-383ec96a7deso1014638eec.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 05:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182184; x=1795786984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AVidbSNiizNkNTzgOXhRluYV4j9L9EQKnRCU13pMpyM=;
        b=N2ueehAaT/hJZu7Ga7iCO6z+N0Xyjj4JZ+Ohz5QI6V0mU+jxie7rkmo7ywsbbVXVjb
         t4LtdbDLLZmHSK4kQP+v4U3vxd2H/xF9dI5r01lLij0+Vs06bZESAuAf2vdY9sZltybF
         2ZiL7yZMp3ANbk24t+tLiBgoixMeudvbvOz97Lizai4RwclQRUy6YfEwwdKoETLo8KDM
         yT0ZcrOVHsAqNDvyeqWHVADZK8ElA14Wb3+yTlLNj+eHveaFU/h+MsoZCIi1qkdw9fKE
         UjIsEhVauWrAZnvEYyEXj6f25R5IDulULsglwifdjooR06/KpTlEZjo9vDBXXjB4ekkq
         qtlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182184; x=1795786984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AVidbSNiizNkNTzgOXhRluYV4j9L9EQKnRCU13pMpyM=;
        b=BLXDmYPGH+IpGkxwJe4+gBp7z1yLBPrDJQW+70LJKS2JXZcLtBSUtRRSOp4s026qe1
         PUe+7MFXY784+ir+5rKTeRMe0RLq59pCypywTZNlVxL/nWXmj3VRMBlono5wD8Tjb9wn
         F0KG5kqhHk+9ZXbT/NIlH377HbIwK40MqZnV9r54bHhGBOq+wO9JFrKLGM1RCboHcFN0
         juYkDGbBaIgX5KAQw+NjbFfVmSnWROWcIGeLJ57HsarCMGZPN06bpAkEa822pEr12iAX
         iLTXfqGZ/qD/SHcpwyJ9PuJzugXl0IJ6dcRBwveeFRGq2ctPi2OLWSMJdABD6GEBF9N2
         Ybbw==
X-Forwarded-Encrypted: i=1; AL+hErFszmcQvho5Ip6atxCn6mx84dfFKGssPg7klG4HbohAtt41tZ2MGqKEkPG77E2sEWzsk39yl3rXL2nA@vger.kernel.org
X-Gm-Message-State: APuU4Z/OloIUn19uNfQ8OvqrF7PI84JXMPrzqEFnoaxhbmniAjwGq8Y9
	7XHcinaGmghlu6SdTU/W2h4AxprKoo7cRBb4RBepcOwhpn7lza0DecWDnMrMPx5ErLqCwfa70Bw
	1gTOnBkat9KxexjEpExz0fnxO649tNdFtW+1xJ49bBr3NUuYQupFrmcQ6v5Y7bLTUNtZocXph
X-Gm-Gg: AZFdTZeKfk9oq34V1YXg4kkw3na+hrOOmnusF/thQxVQ/DvVOTWwmkkilInHyChUvEU
	0+RPAcu/8FN7eqstCE6PdxJGRCGC/07lGoCQodwP0RCNQbjOGoMIE8xoKscwAN1wplf/5dtEBc6
	6jAc5/C76TwACYlWaPqQvtyHno1c8qvgrcv6VEPWOBIKolpSjnb9/W/WcOPDefG6LR9WMkfvrTF
	n3CAiqC/AQ63KrwTm5S0URb9VjG6yegjg59IzrgMZY3+/RtuIWL86sgrfZl5LzNrbQZw5RwsJis
	NoZXfKpD8vZ1GYJ/0NIjLAakzBbBa0kQyg9dYR+1qg3e5VeF5aiHYSh7qCyJEk/eJUiXRxXa3bC
	gk2kEBSoeK38ooyAKYTqBYD4AG6QjiFDqj61L9xIQ43gMpHCW8gr4BoIH0EwKHz9dL/6hahWCAM
	ogUeQ=
X-Received: by 2002:a05:7301:182c:b0:376:e950:873e with SMTP id 5a478bee46e88-3856f659994mr3192398eec.12.1795182183423;
        Fri, 20 Nov 2026 05:43:03 -0800 (PST)
X-Received: by 2002:a05:7301:182c:b0:376:e950:873e with SMTP id 5a478bee46e88-3856f659994mr3192369eec.12.1795182182790;
        Fri, 20 Nov 2026 05:43:02 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:43:02 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:38 +0530
Subject: [PATCH RESEND v4 07/20] arm64: dts: qcom: sm8150: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-7-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1053;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=9j6IWx76cjPCAQZYybv4iXqHVebU//kZAlxNICMxwEI=;
 b=Q5lXe6lJujeOj00C7B5u5JWgPIuSH3J9emwvnAUTAiwf7hbY2q8uNHI/0TWnEjU25aY5pCK8+
 qR0GG8stZHICFvs4wha1pqrJMlaprkX+Iyva1ZcsqdjrOm4ImQnvkfF
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX91Iw+H8KRhVJ
 rQseH2mmXXlTjOEwhnESXgfJJgcyVjjWHX4hh7fE3RS63hcO8U4tdDGgbXHP5akpWZn3Ynj/gyf
 D7CavFQ/zeEgDb2yXsG450PVAv1lB8a+PnuKEro8aI8hygM5tWX+J/HjCQ7FSSBbJ1eVdYhQJOa
 6JMvXdzHOGGYxFWuGvgf7WYNN7HdG2YVNIKBfstNrYazcO3Bkv4AQ+cavcK28IBiJgExx6+oJbd
 CDd8jeS4JAqcojRyFNET+N0gfYZFwq9hy9oUcIYf8Te9GqF/gdzQxB9LqrmeESh6iUN+sVwWOlY
 PY0Pwk+IL8hSHZhXb30qUeh4qV9qu5zA9Sq/fU+io3ZqGdXrTnZRfwkHQSccS4WArBk62hmZxoW
 1y0oAYtIv2vSiwQ1Ev5J3H5WJuX/jur+szSGP9ckW+F76RidX1HDS8+9GF1GSUCUhzOUtExW5v/
 pJpsO+TX1SRrri1j/qg==
X-Proofpoint-ORIG-GUID: DsvFfhyTs_lCSZG1ZG2Tsnw24lO33nxz
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b004e68 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=2mEde68aHbpXMYUSS8oA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: DsvFfhyTs_lCSZG1ZG2Tsnw24lO33nxz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX6vExyBdLdeLO
 QAf1EfAmkVjDqpRUDCYRXHBrQQIUFcCaaJ4TGG8QvCXiyCv/7lqZr4hBaENCUAjCgvABENXXD+c
 ZZTl3qCRNrsN1V32dM7OBDGbBEMogNo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200054

On SM8150 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index b9846b424a93..4b2ff316db72 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -2396,6 +2396,8 @@ adreno_smmu: iommu@2ca0000 {
 			clock-names = "ahb", "bus", "iface";
 
 			power-domains = <&gpucc GPU_CX_GDSC>;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		tlmm: pinctrl@3100000 {

-- 
2.34.1

