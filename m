Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172843;
	b=JAWwlMeIDDJeknzFx57Y3rhJiVAHRpGU/BW+4m5zZtzGc57j4SL0PbJCq7V4AhfY91Kh
	 8VU7nJqo1lbgBZpCpDfLomh7cNxHrb/GaxxmL2MQqOaEIr3XSKfBZKsZRjFKVKXQGv5KY
	 ArzF8xbMQ1dH3B8rcr2JeKrJjYio2uQ0tLh9ZxKZxOOnlPGsr2wuVk9QgVjIVHhNkxr11
	 LPfN/Usq/d9f9VbXq5jKUjNiawKlz1Y28mpkZgbDr7uEdsirS+b0iLQBDZZF92QUh5VWH
	 zjGeEo9HGqPMjbQWBUKUaC1RbF4UmgSaKM2lNMzgKN/vh6i/wcqXNiemtnCscOc3Trw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172843;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hL3HLP0Pt+BHfyVSk1KqizSGo5qiQYi0LzCy+jMNuKg=;
	b=EpBB3TccYj/quxXqdPPz6m/+cEKdVh0Yu8jX/VmU331/IKgn0BJkHvhfMIrvG41E9ECC
	 IDIxcFYNdHzr8gQA6f7liRpURueeAiR2/h6Px2ExM+gTNjo0z0EsRUxQkBAwSykXkX/xf
	 +pLgDoqVYef+YtJotRQnw/3thRqF7/v9Hf8Q0ZZt7kxwj6zexd+BYKgQBfcE8rmd/EExd
	 VbRV+3U68tFeumBBg4aqd+rhkDkz3HqQz9oCbeqDb4NNGVw5TP9HTccLctT7stOaV1jAY
	 AKeye9Nss9KyJhi1EnhjO/LjWECCpa8C0EfHndskWViD0MTTPnapzmDktKGIz3Yoplw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W5ebzzsf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kPCeDkOL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDCB60A5BE1
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:07:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEDCB60A5BE1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W5ebzzsf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kPCeDkOL
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjprO1462914
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hL3HLP0Pt+BHfyVSk1KqizSGo5qiQYi0LzCy+jMNuKg=; b=W5ebzzsf7VsPPxpM
	wgD3pCatpFUOUy5/p47/gHoVKI48WEwh5flF87JheCRDoMizBtVEJb/3Vc8cBZjc
	R3wHNPtoMCzW5v8tuePAIaEmFUeMLrJKC/8RCYCpNFpwP4asU0Nlb2PSP5zdLL+K
	Gae7xJR/4DtcGJcV5Gn7vy+JOins1QZAhOBMghIZn1Hb65JfFJGd3LPYi35KhlNM
	yE5izBJKJFmLS0qjl/BF7iws2Cpw3NRPaHhvVUjxz/wsMw1LIb6nmQte2FTyvkpC
	9V8F8KS5PfVuC4wUvm8AP/us1nIjBviuqwLOZl+3Q/E31xUjd3s5+36QVVQ68JEq
	nZdNBg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guah5qe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:07:22 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-370230d93efso2460781eec.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172841; x=1795777641; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hL3HLP0Pt+BHfyVSk1KqizSGo5qiQYi0LzCy+jMNuKg=;
        b=kPCeDkOLEkZtsFMJL7l5svYNo202p4GDbSPnGHPFWo9s0mdq7Jt0doWQxQFrg8kNMY
         +L7ydD8SPjWLWGq5Bz5um165z1/y2NsEyHJO+wwEsE/qCdLnyxXOGSYaP2LkCKs15TfB
         /3o0H1XFuEe2kftxMEE4VfzeF/B0IuU8vyf/EXqEVw3cy1cpk0sxOkYepOj2iuUXmb2G
         MswoxtiQ9S7U5oT662HivuX8m16VkRlzJpLED0r4bT8noqgWGB9XNzi5diOhJzA/Dpgi
         wqd2he91JhCOC1wqxaDQtDMTMUFL+iUF28KgvUORxyImU/IH/vvmcm3sLCWjqwZuRWBG
         GBUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172841; x=1795777641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hL3HLP0Pt+BHfyVSk1KqizSGo5qiQYi0LzCy+jMNuKg=;
        b=lu5dhOhdsD9QC6S9xVodl7LHedNpWAlexOgUJAvUGOQuZqyfhoAFUxGt0gaS7PM7U8
         50Hut5XXn3kdZxDXKtcELGUoK34bvhuXf6NvDYyo1l4wo7In24coB4kSWSwmYsQ/EUg4
         OI0N9pIqgCNhkrtOaMwlHj53H3J02it46Qn97xMe/+TXY3o9yuP246GCYffpOqotcIB7
         2biaj5Inon67xK7ZJENxZbbU215KFWzZB5n58SonvhfZnYtDWz3oWiAm1DPy7cjKhI8p
         StwbFYhCgvN3nWMYsxbaelpEA1+nzC8G1ouqQLoDPVdRhn7D2gjhLvngcRldeX3li4LM
         X66w==
X-Forwarded-Encrypted: i=1; AL+hErH/YD6se5MwRbCEPURwkzkRDh9ILICTwpdgkNsC+p7z33J2N9ht3zJi8DxLM6+Hm8WaHKgqx40qTlhl@vger.kernel.org
X-Gm-Message-State: APuU4Z+HiweKqxydHlqnvnuSc/qqGzK9aRvQHyW0YkY2lZBTFZsswq/W
	b4RvBUhTwrbPwNl43DBz9tr36s/l4Mu0+mUCKikRzXJYk3jkN+jYnVYjXn+s16z9VmLmb5IkNAv
	DVqiZ2HlFgHlA5qIq2dqblvD7h4Yli33iqrssArWy80hSinnI6U8+Mhx/4mQYfpB8
X-Gm-Gg: AZFdTZcfrFpzStaESyFvqY7I69UI1D5Y/Oxi8dGRYfdAnjXLBduoHX9iSTQuDLtHFAX
	+I85KSB//E8LgSvseLCOvU/LCU+ly6JUgmUGaBD10yF0y91mSNE+QApL1V1k1vyGLQ175nPsr4c
	7IBlsR3n6ZdAlQI50NUhPuChArHaLUb/wxZaMxMh6xXqd30DeRnn+pMFlUlkw70/M7Ef+U7lPUI
	RuuuX5KnUlhwmxhKCMKpizcTwiDzafcPNIFZ/iUx55Qq4KmDWL1anRjA0PfauHPZEYoToI37xuS
	PA96XHRDvzK5e/C5Pq16W0AE+dNfskalpGSzcWZXh9Jfh4rdfr/z0AIVpHiltGMh0LaaRQ0F/CI
	fmRYa5HQEnfLrvOwzh3WcGSFJhBpOZUr0eyFYS1Y76vyHoI9g20XYHhXCDUiDAiS+T+EouBTCxm
	CFzu4R
X-Received: by 2002:a05:693c:4142:20b0:381:7f3b:3c13 with SMTP id 5a478bee46e88-3856f4542e7mr2706094eec.23.1795172841280;
        Fri, 20 Nov 2026 03:07:21 -0800 (PST)
X-Received: by 2002:a05:693c:4142:20b0:381:7f3b:3c13 with SMTP id 5a478bee46e88-3856f4542e7mr2706055eec.23.1795172840688;
        Fri, 20 Nov 2026 03:07:20 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:07:20 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:47 +0530
Subject: [PATCH v4 06/20] arm64: dts: qcom: talos: Add GEM_NOC interconnect
 for adreno SMMU
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
Message-Id: <20261120-smmu_interconnect_addition-v4-6-cab8ee8be0b3@oss.qualcomm.com>
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
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=992;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=7PKy0XlSNrGfUIky+MIq+A+DSi/A91nh6BKC8dJ00Ww=;
 b=66qF+/nWyNlaszLHI6kXBTrNfnf56mWk2gMlIf8O2jXgkbggFAh7NqKDs7jmCnHNac8yzPs+7
 GLQvX00gi3tAwC66SIoqPkgnkyAmuUiWflZTxDS/kYgtXzWwiKmG/EJ
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX2VCMrW1ABfMh
 pfgiMDMv/2hdAHDZoAZpdV3r9tFaTwm4fZulUbM5p2qq6121opQkOLOi/yl09GgL4ZuVaCAp4oP
 kxhPyCY6M9uKXIA9pNxaKXF6vcurfJFO8+OZrAz+sEfHgvrlXG02Z6BUBPq/27q9x5DNe28YDNR
 7x2kpn73G5jfvkWDpt9qLQ4kvJMvGaRA4IrSCDQ2eQyvSgBR8JFcgbX/hfZMA/5IZgrhXy4JqGX
 QIHMlA5voRRXJkupc9hLFiF78g2XKIt58XlzHAnCVlMrswFYRToMxj/cT6CgFbVkQl9BlUL9X1f
 /4UzeuUqX/dKUdTYxgFJxOQiq2ThXNnos1wsaUgLk1P8GHIWXaMqNit0rdZcAZLIpJINE6qvyLT
 iwy/s/x/Njiod96GmyICuTXxk3Qna8CcDofzTbQVnDsEoCLGSot3LXhjOvKfi2m3c16hFcxaDLe
 T8k0V0CCvNf3FJT2TLw==
X-Proofpoint-ORIG-GUID: VkHkBbOjjY-20J4BGYAIUKsYhzGhcPGQ
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b0029ea cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=rfUXoPsZI_F71NZxNB8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: VkHkBbOjjY-20J4BGYAIUKsYhzGhcPGQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX84CWLa4mOkQW
 ipGYsikQmCDoo3Ep8Rflj1eGrrjWCG9zPB6mVCfrIktGangEif7MgNeXIhxi50u3pg95dMCVZ71
 4cBqJUFh7Tj+U+19/05mSZHRyBDt5mY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044

On Talos platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 1d74e459f892..f022a44ae5c8 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -2102,6 +2102,8 @@ adreno_smmu: iommu@50a0000 {
 				      "iface";
 			power-domains = <&gpucc CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		stm@6002000 {

-- 
2.34.1

