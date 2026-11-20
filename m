Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182175;
	b=MQUWiQnf/+jEiqG15zcGx3uSU7JUX2leIHQ9tVZCCg+Zt6faLCUd+t2vITfRxwSq7PNm
	 lXN9Qqumxg5e32AwJLzIas+KPb9QQO/ngg9E8VFH10gJhZCMDQIEKUsxct6+UmcnCRYyl
	 dDJke3O2CzI2xHPPXB/mPndSkdO4AMlpUk6fyenIHFsx6UBK1A5sBKMvUNctDuoOt+T8f
	 bN++5eqOBNvQECHgHcjdLCTUPesy+o7KITCpr3brRVchk6Fhv83khnevFIyzehtGb+qib
	 wSGbNTCJpPHW3P2jrvA44kM6Q4nK9gBekn/LxOF6zhw5je0Llssx6aVz+XBbESV87PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182175;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rNsUn4dSC9kKr5schE1mZh9un8wSnTsQUYTEKMmA6ZY=;
	b=uV7S4k4jx3MsY/k5QWS8TxU7TZ4mGwZJbQhNa2bn7L757buuM1+ZtWA1JWAwZTGd+54b
	 On+4WNY3W1oNbatwbguT+yYnClNwYUiBKrmRxikAsYBRG8M1BPtrs95pgpE5p2NJNDYdI
	 lGmRlne1IsvLi7UodaZF6WwrpUulcC9yir350kvdGVRPLEHWO2I4IGoRgmdQCNIDKzsI1
	 BB/EyuwcM5ezYnR1bZyDYKW5fobtHqDGfMjIEgH3Uwbd/bnNAX8SAwzMLZLS/xND87xZ8
	 gUC7Ud1G1KLburLk7/u4rJSUclAs3LqFf13qFVuN3b8GKYHl6iFgfSTG1mTNm8Itgqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CAUYNwmD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L+lLWnxc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24820606A332
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:42:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24820606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CAUYNwmD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L+lLWnxc
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKD5f5Z1366912
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rNsUn4dSC9kKr5schE1mZh9un8wSnTsQUYTEKMmA6ZY=; b=CAUYNwmDCpzBPdlm
	MyKbSiLl1f2o1knTbSC9nBMYV4a/fq8yGsVUuE8CFNlQln/+pNv3bU7gXKPDK+l5
	E6mRJiiDzGU1kNTyQPytCjoIu0290cpZ61ztxLqHPzh+tMALv2OCB+PPNc7Sr1Oa
	iM7e5+6ppMAvc10SEt6O5IOI4RbiH0sq+BFw/j6DxNwYq6OcSnOm2Upv78dpccdk
	25IhQSyb41vRNA/SWWTM8V7xf2QZWeDBVWxKRPcvBm3iIVYkqcQkGH2OW2usdcXn
	aM64fYKUfxmFjbd18C9ZULu51nNA6GtFuzVniwrz3nL4hwkEDgT7DS+T2DUVt94Z
	CjK7iQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fykwsf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:42:53 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3724667bc16so712908eec.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 05:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182173; x=1795786973; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rNsUn4dSC9kKr5schE1mZh9un8wSnTsQUYTEKMmA6ZY=;
        b=L+lLWnxc2rsi6XGzfLO94COz6upI4/gUJgsuX5fsCAoKX9qw5GDMdAa7yFjNYYqVqZ
         PQ3PIeXT52KyEQQ4YYmUBcTD36rhgZVtXSQUpgN6kQDtI0+Hz+3X+VxNPJn3zw7U1hfh
         zwo80VEFsh7flPSIN5ASOtcpep1IYUlX8Lka+JLsiviDDPnksaIf3/fDBfuiTuHCrgBm
         NEbNBTBTl//yAh6E9Mq0EazX11CkWKCUJ8hhTJywFaeAZ1lxf7t8g54gWir044h68UR/
         +56bVq0P/pR4iAtm/h6cLY2OCa46bUWzJYGD6uT3TJlHV+oVgBKgQKk3i3SRktPRRHnv
         N+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182173; x=1795786973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rNsUn4dSC9kKr5schE1mZh9un8wSnTsQUYTEKMmA6ZY=;
        b=CAuyrF8gnRiPgdX/5tpsummnDKyPp42uNz1M6JaVMJIb1HGxRGuY4uyGlVtbritKLK
         W6RMgCHTWfifdeeJUEV1/m9LAbkmeTKcAuY/OojcuWqCQkd1PKDPNd/rxnWbtbuNU/Ir
         bzwDMVJWxsLhDFedakJleJS+OQjIXLAgLhfJ3cRnjvWj33c9Yt03yHB6WzcjUa2OIrJp
         9sntqspOMC6b7mBPGGTLxjMiWx2Qhy0+AGr5/ZFnheDR0Gbn7+Fs5zjwzpg11XvV0C2s
         9IyO5Ampch0aY80am4n8JY/KjDmNUo2glSFeeiEii3kLpAUr8fhhrPo7DhQhfzHwdn4g
         TvPw==
X-Forwarded-Encrypted: i=1; AL+hErG4ypf/hWiPtIG1wDGfCNbqnQCm7KrJ4eut6QpuZlMjKMkntIFfjvlQexQJiHamayw70dQ1b8vyGJOr@vger.kernel.org
X-Gm-Message-State: APuU4Z+Uxe0UcewJCCJ3pj2mWsa2CC/vwoxsnxKQeIvmsT2pKMKO+3PA
	mT0rNL1iO1f83f3u0tjL6qsJJLtJcNpTShn3T0MTL/b9RhzUEjXOci5LH9d3a8RJBvQ/OoYqdDE
	0NgFKeCnqh+XYpYHETCqpO7RaQdYmb/MzPZI+F5IbSe5AgMR41ZAVYP57QfJBTe3TLygsrX+p
X-Gm-Gg: AZFdTZfQzJ4CEJ58qzH+3ZV0ZP4mMexCl++0bzrDf1CuVJKYRjrzGjXnSoqrfw3L3DC
	0VaLaozvERlWgGv88APhyYNhqDePrLd1gA1qpFYawASIUg7JqUR4lI23AS7i+wRe1BRE0YjzNut
	2jRP/bfibfIiT2oX2hKMUB6SJqeh+nMTwtbMPcNwPZccs2WI+3K9qoWAI67DyNK10FxzhvaOFcH
	0Vshopm7BvAP51GqUZtX2SOk7mqLNSsReMvex8xjcip/ThrjqG9DXgfwWd574NRUhN1ck+NtGiZ
	n8NzCiPh4seB/N97tf3Y4K0cc41upmHSA0ylGhoZZbiJGnBPZFvt+NPHdYTe1waKRfPwzM0hSDG
	vR6WQnVayBtAK2QwjpkHAPnqpldtIESjODDlptlsFQvZvpUOmhbW6lvqMJ5xz/ZnR9wc3m8Hsfv
	rOPvY=
X-Received: by 2002:a05:693c:6395:20b0:375:6fed:8e71 with SMTP id 5a478bee46e88-384b3986edamr4218403eec.7.1795182172852;
        Fri, 20 Nov 2026 05:42:52 -0800 (PST)
X-Received: by 2002:a05:693c:6395:20b0:375:6fed:8e71 with SMTP id 5a478bee46e88-384b3986edamr4218365eec.7.1795182172191;
        Fri, 20 Nov 2026 05:42:52 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:42:51 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:36 +0530
Subject: [PATCH RESEND v4 05/20] arm64: dts: qcom: monaco: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-5-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1018;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=1lPh+lGGWLKglbX1purFejDWg8n5fwBJBYl3rhWzR6U=;
 b=oUfXjkp08+mArsrZiKnkDBUGoVmuJ2eZr5NDLzeoQIP9UyDpL2QqdSa5M5lOtFa9uE0FtdArq
 WMGUW2T+o9/CdUf/Y5BNFEnVKbWTupmAIgS5HZe+BEAMk4mE8b6FF/0
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX8klTFmFnb54J
 crUFbo3ikIOL0SjttDFlL7Cgim9OyI9E7nnyYsQmF415cCeGtyelBmGqOPJY+9P+whGS0sR1DDU
 nyMR6GKCnRBjrlq1OJrW+RWiOtSiR9U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfXyCAocR0bfX8c
 1j2M3tUSIc+r/NbbL5X4Oi6UtW8M5uWyKcqFX8NXfFTkiAP7wDKM/M3lwBBWSyAfiCZU2lEyw/d
 wg21evPLetSA+t1Da03hD55bfIrRK3UAmgDd5mGHW+gWKrTXGWkKdkmLewrwblIlJ8A7/7aeCHk
 Nxwerf21yOGNz2W1iXfTck+RU59q7yUsXum3MmnsflgNuz6xpPe1ZHZlFD46kilHuzGUHQFnycE
 LIdgPX9o9ru0GCMrjwzwuSQXY2b19PsepDdEM8EhzRdcO8pecbKHdK3jdUWYT49EhCN3lI6RAlN
 RB5A3xI2uP+OW5KVKSDG/RGCh9IcBGhE0IszZsNaWdXLcuQF7aF4eJ2lwIFXUubMNQbT2bC5T8P
 ij8BzOEE5hWKk89lUAzM4p31tsv9rmgI68e1KRUcBc2il7uoHwNQS8W6JiiyXfECgPot+7U37IQ
 MZakvVJc2I9nm7OvxbA==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6b004e5d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Jjng17ChVe8r-G2aFk8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: GsswTx4X9nV3adqAtS885suOFPuh8lwn
X-Proofpoint-GUID: GsswTx4X9nV3adqAtS885suOFPuh8lwn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200054

On Monaco platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 3541313a79bf..13214aa77279 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -5113,6 +5113,8 @@ adreno_smmu: iommu@3da0000 {
 				      "gpu_cc_hub_aon_clk";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		pmu@9091000 {

-- 
2.34.1

