Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F6119ABC6
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 01:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783994269; cv=none; b=UaeFJy7COjynWXAZ6AtlBz0aAXbljyh2TQ8YXwJU5dyTHdkFfjFnPWR56c9/GpdcVCSoxh+L9Gaig2tm80CxF5+c+xieObl9ljFbdAXH4+9dFWx5uIlyKoyMP0pVul1o4R0SmFRlpnM7SlsWGAUZzRqJzQ5ZtEQ4tAun6Wr7wUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783994269; c=relaxed/simple;
	bh=F2K9sEjjREWTXCiiFvgwr/QcjLlB0RgcEW4s31Wtlh0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=trmq9QeME6U5qEQppfIpssYY2ug7H2ABxGqu8LGAGcNHD5LWyVyfj1vgLpkRVlFupPHLcA3AzPcDw9eo7j5Brjjyd+Yt7AWSBP6I9NtT2S5WjBRX3SmJrzrNjTnLvAVJl/sVmgY72ypGR627EnsEL3Atpw4tZEqER/0KkXjGO8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lt5XL7Nf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CY6TtMTp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lt5XL7Nf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CY6TtMTp"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E1jv5j3259263
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 01:57:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tp+sv+c71VTdHi1qXlE1u1
	5U+7SzQuSNHRz9AK/D148=; b=Lt5XL7NfRoJOWWR8HMi5u8+L9Bxyt7UKH/i//O
	mk0zDHYEstNElk/MsiQ7QES0PZHqITKhrdr7jARMSK4u2ssThVffL7vrnAlqCuuE
	wLM9ZtHVHg7p+FRCPOtljYj1Tc5Tf6JWl9g/mmwF5RlBjRvpCiBj3dJ5Izwil0e5
	i+7+N3Cn8zKAXuD2lQqGW7ix0S3DM2EredYGOu2m8uXeWCBQAuD+E1AMPi7OnOCS
	ESabFpCjUNDTLaKUi+YhRn1LvloIwSP3+MFf9knwCxeuIwA9N32mK2NEcFJygi1d
	F53KKGBK6YKqnkXnZdr55AogzMwzyw5nrJpq2CoaujSo+Zag==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdbr480ys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 01:57:46 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84870e7f498so4503603b3a.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 18:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783994266; x=1784599066; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tp+sv+c71VTdHi1qXlE1u15U+7SzQuSNHRz9AK/D148=;
        b=CY6TtMTpJoUgSwtftr+lrHjNXglFuVBvSJdLNlCbpNVycrD4q3BIG8QSHQ8IDC+Sw9
         3uSfsboFzqGNs66dx29jpN7cmTmXsYhEJ6jqZl9X7uyvufpwW8sHLQKA+2D+dyXN4XGo
         ywKfOclkExakEC3imTxskxbhFwPpIAih8WQMaYK8yQUeR/J/zv0ykH6GZrvXHgBKRCGc
         dJCm6LaKJbu+0mJzWIiiXGGcNDFTiEcAloDrTNGOWC8RVbO9b0c9mPRLTMd4zXbZKZnD
         6I1+Jwss8N/VkJaLhM5dgSbJt2p4HL5UWJ20BCdb0GFxr8ufF2jmuhRytdubA0uKk1Xt
         W+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783994266; x=1784599066;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tp+sv+c71VTdHi1qXlE1u15U+7SzQuSNHRz9AK/D148=;
        b=spsUsrryrpcSZyEh09gOaojQ3tDSR2SxZn1FWJUrvDnyqFETB0YGx2xIkOqgmiYwLQ
         GgaMLNAg+cbOPt1AgGI41UJmwNgX8tHVXpr9d+aZ2PNJciM+HhNbiCYsl1qrZX1bmfJW
         UAQfz6AgIOAy0K6+YfoNunRkPIwSya4shUpHMteKMHJO6iIDyA9F/MQSXjceHqa+BVoO
         mRh+FZb0g2DE2rk+WR00CCRPRJ3iOgmybmW5FD2BnZhNu7nCU5TypTn+4dc4gGgKyzDQ
         FF9D660EMg2mHCFw08p+jQmx7EWmdBkXE0GBsSCfyFzjITnTL+JbWj2n2fbpge5Grqa4
         kH4Q==
X-Forwarded-Encrypted: i=1; AHgh+RoaEeIq/sT/1MZXDVV9Qj4eJzkPh4FH5RzW3FSlxb+1EelCt70mgjJILh1YSGK1mGVjKGdNzLAOhxb6@vger.kernel.org
X-Gm-Message-State: AOJu0YykEM9VadDj9N8+F71JlUN485KI6BD9uLT6fOwBoBZt37unmzOk
	0/7CRBxT4tzeLws1C8h2gGEzi2IWceiM6WP4ni+gksKh9Y4eWlZToJq6VpCarjRa0Sg2DYkwYNO
	YwkvVNzx9HiBvj0zkJWxOoO/5LMaDj/UVTGDjzLkOUZJuytRPspu5HjIUzoWqKLxp
X-Gm-Gg: AfdE7cmLPvUwEqi7TJz47P7PDmdZVrPuPAAb5MqF6N2m3sIeRx2299C27lt6VAf2UJI
	O6soCjIclJtDy4yQFJuqN9CLEdKOTcJsGQnrJSIky8tKPe1xBu3XUUemBkvmhLx8/H55+jWgRrd
	LBXFFlsV8Hy/7XcK8BRCwZmOB6IRmiA90ecxXssnSVQzbTpXivn4w0g2s7QOil4J6Cj+JgvSJl3
	DvhHhqbHWDo5R2/S+TMqTuFAKOKSNZGcKzhyxkMhcOsdP/6T4wBQFJYDzjvJ60EevAZb2+TkXNd
	mAYHUxlJ8bL2VynPNC2jucAtLoeKTuVV0ytNDIOtSffxfLvMzifxr02xjm1rssuXhd0GH4dMudY
	Om9cZUz8dTjoaLZHJtn7J6HRF714HHkO+2370t7Mk3KtXZz4aq6b6GGDVqpdZGH5jCcFZ1bBLiA
	==
X-Received: by 2002:a05:6a00:4484:b0:848:700d:c950 with SMTP id d2e1a72fcca58-8488975a906mr10015118b3a.37.1783994265794;
        Mon, 13 Jul 2026 18:57:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:4484:b0:848:700d:c950 with SMTP id d2e1a72fcca58-8488975a906mr10015096b3a.37.1783994265313;
        Mon, 13 Jul 2026 18:57:45 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f29ed3dsm634191b3a.27.2026.07.13.18.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 18:57:44 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH 0/2] Add CoreSight nodes for Qualcomm Shikra SoC
Date: Tue, 14 Jul 2026 09:57:24 +0800
Message-Id: <20260714-add-coresight-nodes-for-shikra-v1-0-b1cf85962455@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIWXVWoC/x3NMQrDMAxA0asEzRXEJjjQq5QOIpJiEbCLVEoh5
 O41Hd/y/wkhbhJwn05w+VhYbwPpNsFWqe2CxsOQ51zmNS1IzLh1l7C9vrF1lkDtjlHtcEJVpVy
 SEJcFRuTlovb9Dx7P6/oBzTuaNXAAAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783994260; l=1206;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=F2K9sEjjREWTXCiiFvgwr/QcjLlB0RgcEW4s31Wtlh0=;
 b=nhcXZEAnqwFMvxfhtW3CN+qiVqmS7C8vIUCnVOD/G678bP0apyOiIDi0PpEatlNLYmjRNgQQA
 CrX5DtpTQwnA+B9F7EjUkpiwWwy6VWaUTVTpQ/ijdd04dI+/7Cm4ypP
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: l-Sm8olAFA_TaP43WprNuugqhv4HEHbT
X-Proofpoint-ORIG-GUID: l-Sm8olAFA_TaP43WprNuugqhv4HEHbT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDAxNiBTYWx0ZWRfX6+hz+umQe2SN
 SxyJ2a2FKfwN1YkpQsSiPSymjagL4IKzo+eVBJP+evsXHIKXCdsdHDb6KXkFgDdIyRB9na/MLpN
 Q9ejbeQetLVJUYquMtKUIhBtm6+N/a0LhVmy+V3mxBGIbXVc0Tr7jUGqsAcaDruKrhC0mkOrwN7
 Ak50y79z5qmTTzG/h4opQG9hzgO1qUAQhmZ36srX+MD9aq0mRAu1Be48OHgoPZqhlMvM0uVWLg5
 pZ7AUEAD/JHwttWwtIlaqyYQTxuNu3bTykPDf6JR1w8e2PS1XbXffPWWgrGvZ/8WJQu0fjWGq/w
 GEYUmmlG+T3hrpIdMvvduF9InLhqzB27Tz98jWO0K9bLd9PuqhnTxFzRMkt+LF5oX8sGcR4o0N3
 ay14msDKrZzYqMzvBZd/ihzMwW7svKCKS0oDyPofz6sg6W9CKGiT2Uv+QXyYx3uT/X3foFUeV+6
 UI2waKev/431elgJsoQ==
X-Authority-Analysis: v=2.4 cv=F5hnsKhN c=1 sm=1 tr=0 ts=6a55979a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=YMzFSpygh5mOmOF2B6YA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDAxNiBTYWx0ZWRfX6p0tAOLFJob8
 HDncGm2EfPo0MctD2hsMtabQBnowu99Is4ouBvoh6QIKdzea2l3baNmrtluASukZ+uMHJ3OMhbl
 /BoxPJwMngiHi+g84S86pGZLMCQJ7Rs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140016

This series adds the CoreSight debug and trace subsystem for the
Qualcomm Shikra SoC.

The first patch adds a fallback compatible for the Shikra CTCU (CoreSight
Trace Control Unit). The CTCU on Shikra shares the same configuration as
the one on SA8775p, so "qcom,shikra-ctcu" falls back to the existing
"qcom,sa8775p-ctcu" compatible.

The second patch adds the DT nodes describing the CoreSight topology on
Shikra, including the funnels, replicators, TMC sinks (ETR/ETF), STM,
per-core ETMs, CTIs, and the TPDM/TPDA trace collection blocks, along
with the CTCU and the dummy source/sink endpoints that model external
trace sources and the EUD sink.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Jie Gan (2):
      dt-bindings: arm: add CTCU device for shikra
      arm64: dts: qcom: shikra: Add coresight nodes

 .../bindings/arm/qcom,coresight-ctcu.yaml          |    1 +
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 1298 ++++++++++++++++++++
 2 files changed, 1299 insertions(+)
---
base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
change-id: 20260714-add-coresight-nodes-for-shikra-fffa261ead64

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>

