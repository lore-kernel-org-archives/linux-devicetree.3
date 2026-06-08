Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAE5322B72
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 13:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780924249; cv=none; b=N42OW0T4C+2YP0g7tRlM46McVOKqFthI90ulEtto2Al88cNCngDBiNiO+pzO3Mp12T6jEvGPBG1mbvIW7EuxSP1ZuGKw81Gotk05vHvoKFTbqOodmHGK1zeskxpmrKV9SANnFNsQfk0I80Gwybk0LPO3iYdcH/6fbhBW27FFrk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780924249; c=relaxed/simple;
	bh=ue5t/Mkn+WXC92cP5D+ch+Xn4xQc5TBGd665tzA8pzc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NB6nRiv9szNI+9IDCiJv5nulwgfY9N+Tqj5WC2lIJ3J5oAr0Qsfe69HBBlYtyLEeExnW54Ho9Bsbc9q86iEYveRZJjVIh5TSYBoUlBMA9eSko31UKsmagByIM9bVpNRO2xwfZ5fWtNDUFG9pknbrIAvVMRNBlEvPsuJ4+WtT6V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f0sXGvMY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JUCxNTka; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f0sXGvMY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JUCxNTka"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658BBMrv3417707
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 13:10:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q48k7tN1w7wJ+iHjXC9qpbNvZsHt2Qv6AjglorJLZ/Q=; b=f0sXGvMYdBfdJ9yB
	rEQBGs2KLEhft8D6oOcL7tbyQ3vztZriItaqmWrn3LddIxVPGicA5WTIJddK2e/1
	OfFzZj5pJwbvAuK2TcUsevLNwkJ+J+oR6hwCYoQrQOxtyK1j1kaopxoB9wcgiC/Y
	vgq5sWRnIwhyYUrphmkSPoKnZfzMH09kpmBq7wdrBkOF/e8swWcUWg5YR2DB+Q64
	aozW5nQIz/45C2rgSj+BtLsW3ZTzF5HAUbxvs2XdujJnVDV0pM1qSe+m9asuVg2J
	Ifhqa4VezWkSqmj6KQc2RiB/nzH8zD5CD8YcMw0hVe9ZyBKD+Qkl+5rdjhW/uQAt
	Ei/GyQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enuptgsam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 13:10:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bfdd99f6b7so58883255ad.0
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 06:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780924246; x=1781529046; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q48k7tN1w7wJ+iHjXC9qpbNvZsHt2Qv6AjglorJLZ/Q=;
        b=JUCxNTkaOA1aUmUo1lPRJ8k0+buoGIENBfQ+IBPSsQ9gSNoF+JFNfqJZ6nBzheA1CH
         g4+UuCNS+96PBAlb2KXqv8e0tb0KkODRvuZy14dbl4XEH3kpmsrkFpBuizREQ//nQ9hq
         Ui6qSQd6cXpE+VqXfiN5Ia5F42jHkUQuqKGWsxmy2Y3iAWamxylo/fSy11ZtzeZII2qD
         amLkee7lOy7Wr2u9q7IiTxzOVxEHrttf9Kv3EmTuB7b4EMIzg/6A0ehhld0P2tpC4gCv
         gIqMx0X6DA+0ToGcLv8EzaA1uAlPwfFyAJRLe8O12kQ+JmH0kkCAklDekM4Sj1VAR2zw
         Qa8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780924246; x=1781529046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q48k7tN1w7wJ+iHjXC9qpbNvZsHt2Qv6AjglorJLZ/Q=;
        b=Jxt8wq++eMBlm04JS11A+IqFbhPvxtxW2Ma+qNMKVIYGzd1t9J5rC7QZscJ+BXdXia
         tEjTxGopH6J8+EuUfJnqyKtLBdNyFstg+JvQQJUF50O5NZ3Jt53/D17X9y8DIqpSY8a1
         sHyprCCLwcukNAQX/xHvyEXH/1h6/EsU9yEtjGL1E+3VLqvjMNscurb81QFUmDSFpgph
         54+FDkpFEqnQAv0bshXCYi/Khqbqypw0NvWKdlzJDhOJAYKboIzAa3W6gOHCa4BgRvcf
         bp+B1P/5BIndnGVq9N5af6AcQLu9fZlDXxx25S3ggnFeqYJXmOsCm/8WFWJ2b2HLpMLC
         kFQg==
X-Forwarded-Encrypted: i=1; AFNElJ8h5mSk0dzgzPXwFCRcVp1Y1hFL6rGjcP8kr4c7JjDblEDL12XoVlFgU7Aa+ollvRImABiKPRfwiOqE@vger.kernel.org
X-Gm-Message-State: AOJu0YzZRktqh++uKY0djujsBCYk8ZePCk03j1cvAh4Nui1JVYQN+BkD
	DHlFm2o/iLSqcpnl9YhKvrhydD0xn7n74QA51GQgiB+FdVb1FEODahMi8DEZ6OCvGlpy0s8OJy/
	qYIPN9les7/0UEX80FIafeuj8ULUEDy7dvK+Nwtd4Hz8Kq042ub3U8+SHjSPR2KJu
X-Gm-Gg: Acq92OEVhpmYMarGjxjDeJ55c+6CF2KXH6tXIn/qwzY3PJ7n+/dERHzO5krmKnwDYFB
	ODIztxyLhKoL784Hu9y6Duyj8eZxSncpIDzcKgDvfbfYZSkzAP7hYOYoDQ7KvR7W3bb7KpMsYL9
	TQ2Bql2B56mzpygMU8gSXlCTcI2YYErNbUpLXXgESGiscGH4fRtOGaoOzE2Fu6sforEhMQHAC6Y
	e//UTrAxa91uPttEDhsWySJkwKiZFM+JuqL16CKuYmCP0xqC2xl8K+rpMvG1z1K29DLnEy5bwjc
	C2VEs6pAVjdMtGk+9UjffsTZwLhtdZTLFE4ltpcoFfnnF/VzY/S66Wsm0YIZc3/RLuCw+Ud6Ywy
	Mcuh61U0OW3UzSqURIlI6mgM7MHF8OOGXA39YAEKjC4B/zjg=
X-Received: by 2002:a17:902:eb8b:b0:2c2:4ce4:c5d4 with SMTP id d9443c01a7336-2c24ce4cbe3mr74750375ad.17.1780924246244;
        Mon, 08 Jun 2026 06:10:46 -0700 (PDT)
X-Received: by 2002:a17:902:eb8b:b0:2c2:4ce4:c5d4 with SMTP id d9443c01a7336-2c24ce4cbe3mr74749995ad.17.1780924245869;
        Mon, 08 Jun 2026 06:10:45 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664ad172sm185235845ad.83.2026.06.08.06.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:10:45 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 18:40:21 +0530
Subject: [PATCH v4 01/10] dt-bindings: dma: qcom,gpi: Document GPI DMA
 engine for Shikra SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-shikra-dt-m1-v4-1-2114300594a6@oss.qualcomm.com>
References: <20260608-shikra-dt-m1-v4-0-2114300594a6@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-dt-m1-v4-0-2114300594a6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780924231; l=1050;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=siSRub+fQLM5lCWyMREXkIiIBlOosbQGbKhyD/VrTPA=;
 b=W10DtBgK7FWABUPtedxztsCQ/0oAfxE24Fa3aAckjl3CIA2i8EFpxUPo5r2As4NI3BL2z4jDK
 y1uXdp07n/mAZp5YTc46R4v2VRxxAMSldWE4yVkqIheCFiqNO+WDf7d
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: G7okDIJuqH8cqExqvhstAeDWqPcobvpD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEyNCBTYWx0ZWRfX/HBAr6uQ4F4w
 L5PDfLaegPPneYNNgB7V4/0xmll4PEQQMYJ4e75Ogw/mLeDGN/ZyybuGIaHhgtP/0tNf6m/yd3Z
 75RWtXvToZZr2N7UQNNUZjSDSbRkmWDD71+UpPkLP6nqqoxy1YMh7HrrpFu9/RvaJ09NsNf72ys
 lcRCc4llN4Jm4I/1Uzg4u/z/1CbX/W1XnUNXqu7CIwppDYV9Hk7O92Z0WCzHknlsfz+zmsyuy4z
 NSoMLr04S80NA86SwK3Jf+f+h5mQR5jQOie/uBsYJhFUdrfB7+f48CRsbIGpBYFDE8DKNhgdAD6
 5dwcYDO2wJDRQful1aEEAcUMVFTPPHyqdEgyP1PlRAB6spBG9CDorO627SFIXXUfzTpBTxOlB31
 NQ9JePA2mTnjMjOxbiLEETQ/+lDlHrzHq28Kq5yundsocQolVHRjt7+j+J+4Zlx1KrcaDrTy+hF
 uPqJjPUKc3zurpbVaKw==
X-Authority-Analysis: v=2.4 cv=XKAAjwhE c=1 sm=1 tr=0 ts=6a26bf57 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=FVGO2dOrgB6TF-zC7f0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: G7okDIJuqH8cqExqvhstAeDWqPcobvpD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080124

From: Xueyao An <xueyao.an@oss.qualcomm.com>

Document the GPI DMA engine on Shikra platform.

It is fully compatible with the GPI DMA engine found on SM6350,
thus using qcom,sm6350-gpi-dma as fallback compatible.

Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
index 8f9a552fe30e..54dca623223d 100644
--- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
@@ -37,6 +37,7 @@ properties:
               - qcom,sc7280-gpi-dma
               - qcom,sc8280xp-gpi-dma
               - qcom,sdx75-gpi-dma
+              - qcom,shikra-gpi-dma
               - qcom,sm6115-gpi-dma
               - qcom,sm6375-gpi-dma
               - qcom,sm8350-gpi-dma

-- 
2.34.1

