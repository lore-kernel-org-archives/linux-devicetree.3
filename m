Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD6B3E763E
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 05:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789621340; cv=none; b=TOv+nrhF5O6qSjy+tPVZd+/An+MWQlkgF85FpHSC0bhrE0v+tAM14GAErvXqdYH9xnJ/mUuVfnSVJitBhvFweWXyt7nQq7cEfpObxNYITxi8W77yb/BtVGG7/YMS2hJL8A9Fl0VvWR8dMEf1Co6pbIncWZ7wuLiz+M2qkEtd+ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789621340; c=relaxed/simple;
	bh=Y9NxHc+xglkqVwfzuTXqVBNNH9QwhOHaAntxIH8RZsI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rR8o7Jht0y7YVeaCyzYxh35RMeE2u4Y/+seU6wyV95jUUniQM0iKJEkDeMK8iOYfHbn0VVYc9YU6r4aoFwNJYCmhqS31AMYaI8KZhqOYdO/q6fv23kIx8As0aVhOuWjHAd2bkYodixiQ6kybDtTsPUxkddm/yIiA0xgL+wjW5k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a0gNgBDe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BjxpyLz8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a0gNgBDe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BjxpyLz8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H0skg03402897
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 05:02:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M3JIU2Ao7wEoQjtG7vqxKzMv1IDq7N5iVzUKdH14XEg=; b=a0gNgBDet3oawHgx
	i/i9v8FvhTE3LvDlxg6ieqWgsQE3ec+shngtIuwdHjo4hh20QrD3Gr8fjjOSzB5r
	DOlxzGqXu/Mf87CHx1P1rH/H2nQylf45U1Fv5VIK1E9Ndd/WMQGlDDTO5UdW31na
	CfTVQsZAYNW7PKkKjqn4QdoG5E15OWnRnTcy99OKmUdGdCJ09QvOaF4CTISZgE1P
	eZGcYvfto1ttQyRyo4DZnA0x3cRzostYxQv1/3PiW6Um6A+R0UoF6aDUiOAbHEmp
	fLTV+XrvT0qhlxBs/yINF1qArfuCFFmZD7DSlqlkvj1V1+BAPMWVdFHdHkIF2epd
	wdPK6A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy2d2m6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 05:02:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d6f80c76e6so9340715ad.3
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 22:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789621338; x=1790226138; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M3JIU2Ao7wEoQjtG7vqxKzMv1IDq7N5iVzUKdH14XEg=;
        b=BjxpyLz8cOD8+7eDwvEblc79CvSTnAxsLCyRcPrzZ6G+xjnvh9kdro3e32vm1b74z/
         +0ybbkes3XNfvbTv9HRxtRXQGpkL3yWWtnKHqNg8yb8ILfJgp+6ckxnx3C/khBUfTuKB
         ykNktzG3K/XGcExBUoUyGSMb/9Apg4O1t3lhvgJXG2BqwTIyQtOPxjctOZGjMULQ64Pb
         sZs1+n2dcgzWnPEebRal1hLyhgfZSWeXoV4A4n1xOm1wUuMDr+cFLIOi3kKgLlFfFrgh
         iv2A+9vPE56BMkRdDYO1goX2u28LKtSOR4NdhDJEAlWoEFGbxLUffhzxhKQJgSsVPyql
         FMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789621338; x=1790226138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M3JIU2Ao7wEoQjtG7vqxKzMv1IDq7N5iVzUKdH14XEg=;
        b=v/oHGeqB+AGowaTBiYNjgAYgD70GExnXVvPa0ewQx4sTf7VZ6BNYiSMNJ9kIA/7C+Z
         WvJnfDLiSOoYtmffrwlLZS08VKTimpo5ddhe7aqnwilEDFi8YP+DxqjXbvjrkzBrfPWT
         fukQ6jteZb/U52Q6queMQSQv5jnzjOcZ5Le/s5ZKxQP/4HZ5AZ9+4r9aUdZ/uDALrCe4
         21hp9aEynZkmXGuy9NvM+KvMf4rOhfB+fbXikSXTPpb0QawRtJGYgpLmpmKkhipT7OvU
         yf2/jhf3xkTQ5VtcUz2bQCr8r/vPD0H/YBt3w6W9zvY2sW0WVCKOMJ5PR6OQDpqmpiEf
         6bsA==
X-Forwarded-Encrypted: i=1; AKwUvBy/ALvvzcFSAAMdhdKNNcwLwCKkE+cufl9f7kU3+B2AKLAZsvvPEsfCYOzNdmi1mwrLDFAlg66jZ8E6@vger.kernel.org
X-Gm-Message-State: AFuF++mQmIz8d+PnNBdlxIQzEqIWD+ZVdVX0cuBCqTAOQEe/5Q5JRhFY
	ENorf4UvnxNXHnTF2MbCa5ZpI053+lJYLQUQBpd0/pY3bcjhcZ4VGWTmMou7kAxqcyHEUgd5eV+
	z0ui6zatUsh4/ofJZCqhMsCLSViS8jQiQca9XN11jrN0W8s88ZNs1tBjxyLLVxMT7
X-Gm-Gg: AYBFou2FXMZO7JgKq808xeerijOzMVu3OV9MmOFWKCf2iQU99S8YYQJvD2+lPQsFo3C
	hzcF/u5TyyovQXh1kYPvJhVVqxc3IFJRkMKQM5FC0gGLXs0y3hVbh4Itqz01ZIjxgyDel7P0Ed/
	QpPGBv7RipK5sFMcYngTtXxzx4vJ2lt1Om9FvVllHylIfkRYf7ThD1QFtggVEGB7BP36+y+5ThK
	YMvAINSRVEppsok/nJOqm+fG0Vw0gMGDBNpA8jbyC0rSuWXvtYW7vfsbXAq2ooKDbvDyFdHdpyK
	1hcyc2qvXmesYiBgFyZIAcn69EjsTXTzjVazT/dCtHwNvgh0o2442snUGtm4QZ6dtP72IG5N9ZJ
	Q3HdHlfRRo6caQQExH9vX4g9fp4Km1CQj9A==
X-Received: by 2002:a17:90b:5785:b0:39d:ee20:1e2c with SMTP id 98e67ed59e1d1-39e1e5042famr17381495a91.18.1789621337764;
        Wed, 16 Sep 2026 22:02:17 -0700 (PDT)
X-Received: by 2002:a17:90b:5785:b0:39d:ee20:1e2c with SMTP id 98e67ed59e1d1-39e1e5042famr17381376a91.18.1789621337310;
        Wed, 16 Sep 2026 22:02:17 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b2753csm23544223eec.31.2026.09.16.22.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 22:02:16 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 10:30:28 +0530
Subject: [PATCH v11 9/9] arm64: dts: qcom: glymur-crd: Enable iris video
 codec node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-glymur-v11-9-e0c8bc914742@oss.qualcomm.com>
References: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
In-Reply-To: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789621265; l=1017;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=Y9NxHc+xglkqVwfzuTXqVBNNH9QwhOHaAntxIH8RZsI=;
 b=3U56MsFfuNyaH5fXTSF+gKX7NCUWQjZAG/aLF6qAe2JljJI4XoZVUwImGi0n+tjqEChuaW1XA
 KhWEvhcURLYDHfPTsVvgXfSCm5/9I1hcbsPjq5bFT0MSjCAL/G62b24
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: PKE4yebhaLe4goQcnveJglvr06t0lcXS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA2MyBTYWx0ZWRfX3X8rEcRlzs/o
 D4FzonxkfR/SMj9nOO7SmyYbBqo7atsSellGBEgMW6NKof14nTcO6qFkQ7C8dcEU79KwC/hgBXR
 cAFhvKzSuLFjMFPXBNN0R1qYSSYIbj0=
X-Authority-Analysis: v=2.4 cv=HbeB3SE8 c=1 sm=1 tr=0 ts=6aab745a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=jls_Txh2LmBa37OkJYYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: PKE4yebhaLe4goQcnveJglvr06t0lcXS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA2MyBTYWx0ZWRfX2JBq3i2dicyM
 aThOSAeZXdLHpc/4GcphS+15VAZ7LwBeyb8/Y7nMx5b5pl6RvdJDNvkUHNean+pW/PKG4CdDNts
 ugN1kVocSqgkeDXuPwf6vOiHAD1/nG9b5zk+DKn/U+2Nj+yzhIVolNPxnu4Q2ajKjEX5afB9KiP
 PadtWRTE7bb5fl1p/ttYVCaCkbIVLLGDbqxnMEEbGMVT/D4Oag4qzBOkziQK+f0QVKykI/43DoL
 /K4vRDRMHFfdFYIEen3oiUMofmL34qzhEHiJG61kwGUYMnfoiLAQml4wADMk55dAJM3AepAcXnV
 afMErqiJj+1q+JVSQ8XYrbaDnD+1lB/k7gkvDyk26vfrHeBF19UHUUIUV2gLmDrK/MbOEhBP/Mu
 SBpEXH2Sf4lVf7PnLdZMKU37vqN5iAbxUsaPvsIWbdMPtv62Pu0Q5k579UpKkgAd7CXv3Kbg8OE
 xm4ogtLHHByZMk4wW0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170063

The iris hardware block is described in the glymur SoC DTSI, and enabling
it here allows the media iris driver to probe and use the video codec
functionality.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 4df3ccfee106..df36e3ba9816 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -694,6 +694,16 @@ touchscreen@38 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu36_p4_s7.mbn";
+
+	status = "okay";
+
+	video-firmware {
+		iommus = <&apps_smmu 0x19e2 0x0>;
+	};
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
 	pinctrl-names = "default";

-- 
2.34.1

