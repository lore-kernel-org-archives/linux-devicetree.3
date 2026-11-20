Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172854;
	b=YdAiucIemEKbGCbM0tM7bW9KUTpUKW0KHqEVt+oQETpdK54d1TajvTrfA7A0yeP9MarT
	 OWTedfPlr1h29LMC+NWhVIu1OsRM506GoZT0jlF+J/0kUeyXykMOfjT4K+fIkG5HiCTz+
	 LtNe23ww8rlntR8lZxqzL5tIsXqECprho57ApdUt26BXT/zJhgrFFlMKdNfzfmO5WTX1h
	 q4cuzsDw/vN+4K31C6NN5iBju6NH8j+F9OtOJSP2CrNUzCtgxdSAKb/30f/TKfSMkV8Ve
	 C+AD6vilDoEQoDXYnUx5KwsXIOg752f/OgyKpUqFVlbiTqCs42AncjQqNw7gx4OAghw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172854;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hmZxYNnA0FlqXh17OoqgkAggLp3AAiOCxOAyC3Iq++0=;
	b=RBU3IMr4RI5g9ttP3jX9xfzRZjCupLbqter2YcbUDrxHiXXULNHE0kfP/VqqJ0oeJU+C
	 IjvMpqwVq09Px5MyKy6urXjpPkN8MSZfTcVhnOHD5rMUHaJGVpaQEPPAnq/w8DnPzy9aZ
	 asn/ck5sGVDco6ZYlvctUEK+YbrTkxsQHaCOr5zLniPVLozFcLtuH7asKH3WcC/6MA7Tk
	 w6RLB1+B5lKMGHeSi74oxp1JMegZxCqGzkeCo/aec7WNfLRGLpRifHLYL6Y1rqGlPSfQg
	 4RKAaPTk1qgWy/BpC60VLjET/Ai1nZ95WI3cP7mk9lBU7TvlxTh20/oQ2irXDNUFKRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="VnN7/0Pz";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tecqmznc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5646960A6F6A
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:07:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5646960A6F6A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VnN7/0Pz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tecqmznc
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk0lN556502
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hmZxYNnA0FlqXh17OoqgkAggLp3AAiOCxOAyC3Iq++0=; b=VnN7/0PzTmZ2Un/0
	zIrk2N5Orv66HzLZe/Es24rOM2ssM4YtTEl8Mn+GL7AgPdhGZ6dgHOioe9vZZFNs
	DiAV59MKWHylvv96yU1SPzSML8oTJ/v+8yldAv4WAHsTGysNjIW3K47gfW1Rd+HR
	wcA+IuMyvxHIr0Jb1+5Kb4quagR6QA3l3kjB8TYAV96zHyaTrZwvq4qvDnPSkQ8X
	2QI2Sc9wsqfN8EiuCzCxTHpDgvkqpfYwjQPZNei5PvwtJpIGpmD25Ovkjob+hqRi
	Dc46oHG9t7DnTYRVhu8cix2ih/OWgskDTtlFeBnvVnaqVz1i3JsPBTDNTNV98adA
	Ue7gNA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fsbhe1f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:07:33 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3854627c1c8so1078634eec.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172853; x=1795777653; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hmZxYNnA0FlqXh17OoqgkAggLp3AAiOCxOAyC3Iq++0=;
        b=Tecqmznc75xfLAyLwQRueLo9zy4HQFItZJq82kkMgAZkQE1DAwHmdmMr6lY/jagA5X
         35wOAyn8ZfsstX7tv5DOrPRzWEAl8hUm3HWE4Ubktz/nT+qUV6TOOYTl/e+SCOJk9+45
         /YQDyNhwskqOJUgDv57dvU60bcplWEfK65CPayxF1+deDT5FR/wIXU7B9HHzVSGg3A+S
         R/zZae9HYxQCCbT6uEMGNkEburS8yxPBCJ+7vZEtol5H0QKpObzDbbQATNqZrvz79jOH
         z+nQn2sMKh4dTgJrlWUfECjXqJ1R4M0rZB8wZor9MzAkmHxc5z4Pk2caEZbbT3XG+w2u
         5tFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172853; x=1795777653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hmZxYNnA0FlqXh17OoqgkAggLp3AAiOCxOAyC3Iq++0=;
        b=MKlbrDHsu+/skJWnY7QKYwkwDk/gGuX2aiFZT0dNK9ORKDJ7tFJRsOmoQOlouEp1g1
         UksnjgXF4bEQ3doMQ0zySxfvoU/waWVecB3hR9+0UNkM/lLkwjHhX9U4Tpk9br0gIyHT
         /9m07RkomzLJFZczqk9YIYKn+riU+DOL9cggXy8qaTvra06ab1zosvamC6B1W5sSLu0P
         hvQav70U8IbxG2ionZuy8mDdOeQpYOKS4/zNYZp/nxk4Czac9ZRBlj9M3liP0zkyeX8B
         lrgenGocceh+adBGYgstFzmcG7hkURojRAX0TDBEIrlm83y58Id2KRNYwbMCsaQA3S9u
         TNYQ==
X-Forwarded-Encrypted: i=1; AL+hErFYBjfmlleNno+4GZMxOpXZOxTjZH2HxyA01pOBnZZ7FHCGjVzkTqyuA//8g+74xLujWQ2jf8y16IQO@vger.kernel.org
X-Gm-Message-State: APuU4Z91aFS+98Dh+qP5ljG10W7BiGKLeohTqJqNs0oNO0vEcIzglzAm
	FPP1v8U4Zfm03htCyMhVrKdBRQwgUOd0xu2KtsW99iPYV8CL7wXJWL7hy6hsfmlhpimXR4U9UkV
	mWFMPB6DAlsw5sZu6MJ8TaCi9VOzqD+I614Ioq/w1LFD+RwbdZfPeh+NhwQnSsEDy
X-Gm-Gg: AZFdTZcXllkgjXd2Gkv4tRB9KwMtrYYalrHo9n/SuzOMBkHEhvxkEYmjzojESdclWcU
	l0WgRxJNI/TwXn7yQfwVSecPtmGJdqNw0hMojTPlTJJ9Wm03ODo3lGvTkw3TWKodMPHjmbxqIHY
	5GRlqjD6aQ/tDIXvIMPGNJWd+SPc53VvBm0we10gGe2KS0e6sD4D0Cwjff2/358bdQNfRcQvQLi
	f1JbPJK25AKNAo6dPu+7K/LO7f8ddaXmc2y4f41WFCX27Md5uvh5G1bG/+XOKG+qRzIHcHNY4I0
	auxOnnmo0odG1LBYOsuPx2V2LdyL1RaziipBkkX60OSejvm9kUmq6JnJ9K2dLgj7K7cb1mWdGds
	wRMPFxT5xeRTjn8kB0GQFEBGJVBoTSWHMY9MHY/BznT4cg7YXai6fWSWqreoxS4uqfEE052aoqy
	Y5pFac
X-Received: by 2002:a05:7300:6d03:b0:381:9b9c:6140 with SMTP id 5a478bee46e88-3856fd5bf5emr3103029eec.23.1795172851677;
        Fri, 20 Nov 2026 03:07:31 -0800 (PST)
X-Received: by 2002:a05:7300:6d03:b0:381:9b9c:6140 with SMTP id 5a478bee46e88-3856fd5bf5emr3102974eec.23.1795172850989;
        Fri, 20 Nov 2026 03:07:30 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:07:30 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:49 +0530
Subject: [PATCH v4 08/20] arm64: dts: qcom: sm8250: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-8-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1033;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=W3R0vadqLaDaPerwJqu9PSx+OZnsGkbm84YuXP3uSZ0=;
 b=2QSTYCJTswayLaRtH+B8G1NNWBpnaZuzUwYJDYa5ujCqH09DMFxaY3GcRjghHbNwCvQg3CFqR
 pHhnKyLIK8zC8y+M50UC9afzeFvT+6TpYpA4Z5kJbURrxQvEsqL1Ibu
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX5Mg/wDdAg5ZC
 JFkTNJ1HlsGYanDJR56SUqcwWr1zPtB4sgDdJ8ScBEhmNxk/RctlKTzwq2G0NIqtloNzkZz8zQN
 rKxFdlr//rSbjU2Nwo+jz0daNWt1zfplX2Z2ybnzJHLaMktHZnUXRbM38JSzljfmVnYwgWwm9CF
 yLJJqpHt78AaAyHnnxwDq/18VkLlD8GvUjC2onU+er6n1LOh6pJ5m41yjwBy+ZgGzYLKxcEF+5M
 JRjFNvtnIyQapjuALYcAOMwSQBqCFvarAFt9bOoatGlneWXJvBQhsh2fC4g++h0oS2tgk4mYAsH
 vQgOSmmeQyUH7+ViAGofEXWDLnGouzUcvRdrP5ivxWiB1WSgaQKRzgAtdT0O0UP09+2+k/MZqos
 61TcksmKzUwNV2c6qk/7WSevM/bLUxPGE20YV7d5UXclHGzkmf83Vaan3nk9rZQPGnb10xbFlOJ
 s7Pqb3P+m/1DVIc7DHA==
X-Proofpoint-GUID: NH_aFj9KYJ1yKKgloUsjVm3zLcXTUsfZ
X-Authority-Analysis: v=2.4 cv=DeiCOftW c=1 sm=1 tr=0 ts=6b0029f5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=IeQ55TmpMpvzCWFLjAoA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: NH_aFj9KYJ1yKKgloUsjVm3zLcXTUsfZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX5CezxZgiDkTH
 zVonVDpyXFr4hFI6j77Gip86dTqdJUiNj0qCdJa9sQg65czA/SzPDscAybYlsLBuFB/SYY6yvEg
 HawdCpqFYwpdt0lBuysxKQvYB0D6mgs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044

On SM8250 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 992284e64d38..3a368ef7c22a 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3089,6 +3089,8 @@ adreno_smmu: iommu@3da0000 {
 
 			power-domains = <&gpucc GPU_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		slpi: remoteproc@5c00000 {

-- 
2.34.1

