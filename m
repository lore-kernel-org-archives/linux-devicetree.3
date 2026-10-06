Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5871D3E009F
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 10:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791282390; cv=none; b=aGOCW/UIQUUuklbjTX1VT8J/GJ2kgIC2OGWHdlP6Si1RC6Mi+4dQ4+nvH8ucr901FZp8Qkw0kNfR9tQHjoSc8iVGU8EcWJdGmv/EpjxURduqw4tne0ghYKq9odBYX7ghHBo4zSFl93WSzVmvFBHcKuwI25VdY7HfNX2mHr1VCLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791282390; c=relaxed/simple;
	bh=5HL2Jj1toihlaBIsVRiUv8m3bLw7lr7UZZmbpTxh3dM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rrcSmnqdIWvFR5aZJyb/8xHbjd5gwh5R2vdZH5B23qEUkWbXpZdzVTUCls/A6tBQrpZ4Uw7Y2KIf058ro7rTsHU/J36Oy+Z0WD0Rb6wCjOPMXe+ZzPhKD5SnpaHD6Pkq9V0ebDdsvIJYEX2+TLs8mtsuFMxskDKRQL63kVNgtvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LztVgXqv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C2Xzo94k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LztVgXqv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C2Xzo94k"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696A58Sn508201
	for <devicetree@vger.kernel.org>; Tue, 6 Oct 2026 10:26:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OsaI61rCGfIjgrkDnRITXwuRwuSSnYIbQplnAsxXdNE=; b=LztVgXqvpl+m+/Kz
	N56xbIZbQAX/LmvMEN9lwF8nuiZOVecPKsCf2vbs6lUHBsvjrsq4YJHWnjzCnhRh
	LoRLHInEqZlJNJDw7u23vHHuub3RAGa8e1hlo5swElK1QQYVbuXyWrMtoOLFuYRc
	XWfKmXAORdQ7ACJx5I85okEhSm0kJDmL1i0FjwRPHeo3cD41CG4Irau/oJkxn9rE
	IFl3C2f7W9mdpPQS4dfNX+0tpD6HxY3yiBk3/yr3DDCJYGQAD3voyzzFJ59nBkkg
	oFdc936JjCGaAfAZTYc6KLzMqDyAaaDQc7YoSaLhEDTJCroqkGXHYK83YcwVlXG/
	W7nNsQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xc9r6se-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 10:26:28 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a4e36d5a77so2930754a91.1
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 03:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791282387; x=1791887187; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OsaI61rCGfIjgrkDnRITXwuRwuSSnYIbQplnAsxXdNE=;
        b=C2Xzo94klDEgJQY0bkiugWIq3JLK31RF2Sako/2orvAfcEYTTyCqtE+PPalQe95OGp
         wzs7c/OI3w1iktzm5LnI1Ihj28ptYXfkVNNzMvz8qPcsccTVm7I9hHOt9uFc05byEPhO
         jfbra2DvMa/7gc7UlNXEc0J4zMgoqlTqFU0T93141iCrxEUauaiOBXKHPTL06w9+YGqd
         Gtbpi5xRngX52PdzaClUcRBbrK0qESAbC1za2R+vBXYCE/RTu96pSK2PJH2UB48rq52X
         RRu8+9+SFV/STbJQX68o7xXJDDmcXLIC9/8vjnW1v/pVfPj6V92f57JDjsD2xd1wEAMf
         tYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791282387; x=1791887187;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OsaI61rCGfIjgrkDnRITXwuRwuSSnYIbQplnAsxXdNE=;
        b=SC7WR/S6sCLtfYRNQPbrhzLib8gfyE0aZc3RAW2pAvC8Gy6MOdlfhVQqbqBfK6znLH
         mZjlWhWxvFExqIXYq5dQ4t3cCnfUDipxsNwEoC9X8VTFwo5Epy0QIXP49IRDjGFwrhhX
         k7fw5HxMrsme/GOMwebwvho1mzQ3XjpJ4ZM+YDGYcx5os7NlUsiEdQLOOAty8BW75xKn
         uSRy0aUlzg4VCj/KyXpavbh9alWtsK/+ZhtVNW/fCg3dKMV3l0ZtNkuEExg/eKshovYR
         wThnqexYE9jjEJANn3CEsQfRzMQmMXVFYrvEvgBoed49Q/rQOvTXeTnFgn9bxnUpoTbR
         SBWA==
X-Forwarded-Encrypted: i=1; AKwUvBySuy5z0mvB0duWO2750OESokbSv6BkS/Wyfo22yGfnzLCilKyzFcbRfP0fXedopic+MngLtEvVmzli@vger.kernel.org
X-Gm-Message-State: AFq9FYI96HfkYcCp0Fmrw8EFwu+K+Ci/qwEgluYP79dJMW2es3AVZBvQ
	c6VlSih7yD1XPNphlK7fZEZSkef3xsZ9KWwGVRHNyQ9eMzWXwiFPuc7VamQxy1JzTmoKPEhARM1
	iBU3kYTTo3LGNpLfGr8AJs/VW2o4KJJiupx6fUlG9+DJ7Jiajk5tOPn3Wlpnoygee
X-Gm-Gg: AYBFou2iBNBWuwZ3b3vPCYg/rszXLUY8Ez0F7mrdEB9/z+GOadWTTf4Ldphw61f7dB0
	wpASyIsAOafc6h+xiLdZRpgynCgTNDMgHAR4vh5egz6MhMf1kzZSQExvgPZ1tm1T1SiWv4WZ3OY
	sCcVrjgGl0mzPyLuYUP18n3HzPXPfUEPiXMktgC/KhaF/U8bWdhKMvMtSAcMxLZKJn0zmvKHpt2
	+DnUQEUg9gLxesK0WMz46rHBZvYtkWnQV+hwIPEqgUr6W25zomSfBtJO5/SIC7k/MR3Kz/z95E0
	Q7Gm4nZh7K82aHIn9xi5zYWEFijUNmBf8+rSbju87xKw2/kYeLN+uCR7UwIDU3sZRXxsgz4NEun
	6Y9k/lDSmigs2W+xP42qjTd2+SHC+gvU=
X-Received: by 2002:a17:90b:3d47:b0:3a0:9fe0:3aaf with SMTP id 98e67ed59e1d1-3a8736f333amr646738a91.48.1791282387135;
        Tue, 06 Oct 2026 03:26:27 -0700 (PDT)
X-Received: by 2002:a17:90b:3d47:b0:3a0:9fe0:3aaf with SMTP id 98e67ed59e1d1-3a8736f333amr646726a91.48.1791282386719;
        Tue, 06 Oct 2026 03:26:26 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853e66d7fsm4088289a91.5.2026.10.06.03.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:26:26 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 15:56:07 +0530
Subject: [PATCH v3 2/2] arm64: dts: qcom: glymur: Fix fastrpc compute-cb
 reg values for cdsp
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-glymur-dtfix-v3-2-44e2bc5370c2@oss.qualcomm.com>
References: <20261006-glymur-dtfix-v3-0-44e2bc5370c2@oss.qualcomm.com>
In-Reply-To: <20261006-glymur-dtfix-v3-0-44e2bc5370c2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Mahima Bhattaram <mbhattar@qti.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791282367; l=2005;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=5HL2Jj1toihlaBIsVRiUv8m3bLw7lr7UZZmbpTxh3dM=;
 b=Yh10oiU0F4Vnt+kyZLiBy/nNHfYk25rmfjH8F22kt+RGtbTDjSopDTC3B9A0R7Ru2C5EtYE3s
 /3ayel1XxWdDd7lw6TrSSgNQWbl47SYugmWCcQ+dL/m7SlZXN6I0NKf
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Authority-Analysis: v=2.4 cv=ctMOAF4i c=1 sm=1 tr=0 ts=6ac4ccd4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=lQw7s4k734Nnm4ZOuq4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA0MSBTYWx0ZWRfX0yPSDcSDR7v1
 omi8abyy/H9I8euIsHxer8lBq4aUG1Tkg51aQnh2wuqWRn9DleAjslQ1px93OVrrTUA+Thghuxb
 GfUYe7VVrayfPAy6afTwZnqZOjFsdg0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA0MSBTYWx0ZWRfX1MdPmtr2qGTD
 V3HN43ZLYZiwJF1/HQCJKBgxs3EmyllxOlOxxSQYOTPN2/vsRbUBz2tVupUYT84P7fPERTnsyYY
 WNZD/qm8RrH1o690LuTFeLup6kfVJ1YRnrQZqZRfqUHScnzm5QjgDm6oKBkN10QhP9pPzbhKyb3
 A1Pg9oKRXt2VVVhpPaJEvEyZR/zEoxPP7CvAL637g/ySqs8/GXgTFWW5gZPrLQFfZ+pZaeaVXfi
 /nMW9oBjYzZZ19YBp7Imyad0IR/zB5t/AiWB9ucM3v5tGTZEWr39jKb0pqSTD+B+sfZwGTqqqDS
 LMRBuf8NEWzaI1pgpHsQGtjL8o76yakkFMtyzA3Y9nFFUi/4PX1ftpSGq3j47SnhfQLBbQtFBq9
 3Vn08a3zpej/HRKol4casBSKWlnM4zH2iVzyO01ilOYyTHOOZB2otr5AheCKGHboredgWqIJeQ2
 l8XsrwUUYMmFbgH4jdg==
X-Proofpoint-ORIG-GUID: _gK8QeNBWU55rgs88l5ICcJvGSAMMO5b
X-Proofpoint-GUID: _gK8QeNBWU55rgs88l5ICcJvGSAMMO5b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060041

The reg value of a compute-cb node must match the SID (the lower
nibble of its IOMMU stream ID) it is associated with. In the cdsp
fastrpc node, compute-cb@10, compute-cb@11 and compute-cb@12 were
mistakenly given reg values of 10, 11 and 12 instead of 12, 13 and
14, which don't match their SIDs and leads to SMMU translation errors.
Fix the reg values, and rename the nodes accordingly.

Fixes: cd1d174c75f7 ("arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC")
Co-developed-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
Signed-off-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index de7c395d9c35..3219603372ce 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -8471,9 +8471,9 @@ compute-cb@8 {
 
 					/* note: compute-cb@9 is secure */
 
-					compute-cb@10 {
+					compute-cb@c {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <10>;
+						reg = <12>;
 
 						iommus = <&apps_smmu 0x240c 0x440>,
 							 <&apps_smmu 0x196c 0x0>,
@@ -8481,9 +8481,9 @@ compute-cb@10 {
 						dma-coherent;
 					};
 
-					compute-cb@11 {
+					compute-cb@d {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <11>;
+						reg = <13>;
 
 						iommus = <&apps_smmu 0x240d 0x440>,
 							 <&apps_smmu 0x196d 0x0>,
@@ -8491,9 +8491,9 @@ compute-cb@11 {
 						dma-coherent;
 					};
 
-					compute-cb@12 {
+					compute-cb@e {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <12>;
+						reg = <14>;
 
 						iommus = <&apps_smmu 0x240e 0x440>,
 							 <&apps_smmu 0x196e 0x0>,

-- 
2.34.1

