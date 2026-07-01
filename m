Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44073361657
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 01:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782870889; cv=none; b=el7uu98EkerB0nmzeQYcBKq3snzTYlefJfwSbhd7HVKf6P7RRGh6w72CLVa2VAp7cTdKeJW+v41ovE1SXIERyU2z4C/jXVXCIH1w+2zee/dnaSIHp2LVULpLl5vKhNmx8ZHbGNnqTYfgNPhILTu2EE3Tt83CIlQ9fRAdFZfFFOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782870889; c=relaxed/simple;
	bh=OBSctkNoPUXkv4iIPY07zyqOMNxZfKUYjyMh/aKW2us=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D2eTezul9g9GaJUu4Na+Ikks1Z6t4IPC/mM5G20BMJAhMcOJtly/qApxBgeF4KAWQ3+NwawPrf+8rPz7tos0T86rhV+0b55+F/BYGqUnQb662UPJb/g8J0odUKuF7OgKRzC6oIQp5+zzeVtlosxn7nUrQtHw/Vh1+W+3FDvxf64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NOl5BNY2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TicPrjdT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NOl5BNY2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TicPrjdT"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UNMFDU3496002
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 01:54:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YC26FmdTmn0Uux8AKzau08ESZRvbLNzgi/lvhbTZq30=; b=NOl5BNY2eMXlZxTz
	KmSPPi/syXcZzrooD+OjW4tOGXhJ8jAFFExHKGmd5CY1SveoQ91VlbCeJvd+FT1K
	pGXY0yMg/64K9o7u9WqBaddb9GvM2iFpeCGxhaZKWjywaRJSuTjeI5i8wC0QKNc0
	WP20RJc3bmqe14dfMy37L6W7sxhKu2knKGasyo1QPH7Dy7sP6+3tLAASYmcjhaDV
	P5uvF8OdCDxnru2MzFc/dML7/NUtZvNInWvSOMdKL2H6CdKwmvPVsiRqv396AM2a
	ph3l+qWOQItwpQ2vZTUqjYbiWldQk3zHZlIA+Iu0UUWIddiaTRW5fmkRo2bjoVz6
	ALpb/Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4j911smr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 01:54:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c8e14ebb2aso4709455ad.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 18:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782870887; x=1783475687; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YC26FmdTmn0Uux8AKzau08ESZRvbLNzgi/lvhbTZq30=;
        b=TicPrjdTakCRyOJqqt6T0BwLuSZ5D+yjQQT3uXztzF4LwSDC5+hX9TYIobkAv5829s
         f/+u+TRobcjSYgprPpHuQk7n7KHXsn24kNv5bIu+QJcNxvx5pDdzEa6D7yPlFsww7HXC
         GrcZ5W1/St7pUpisg2Vyl9h7J+Vu1tmIaP+hu6uCOPdAygUamw2lf74fzBapmiSpAHeA
         jZQ8fB5qsjdDR/Y5c11SXFxpqFwKvjgUFIHPuHlrMr8apIU2+E9T+m3RknykdDJSoqCp
         jpuWgwgzDk6lUty5F8b6/D4pTH3bbZ3Vpk1n4ZClytubseB2DdVYWmcy2sgxPfYjR9fA
         vrLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782870887; x=1783475687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YC26FmdTmn0Uux8AKzau08ESZRvbLNzgi/lvhbTZq30=;
        b=pOgoIxnfihO6x7Cy22omEDEU4pjL4TdJyIXqIx316gPBw2ZlwQnUKH5dL1Ag4nY6k7
         gmyuO2CHtgbo4PWep/1HLdSJE6UGU9DUWiiLmULdYZt5cGRZCov8O4JQMoC//Gq5JASi
         lnzdW8YroHelE+93kh0KBjNfCjDVIf/UmJrxcXxkCUINo9J5uoD/OBJ9X8YOIbi9sACI
         Zq/FTqU9qAzg8GFmufoICyVlnI7S5eKWoRm9z63IM3NzWZ0WYilpV5s++cIn+iFhEHSJ
         vfs/gKNYrJKNE+lr8G7Q3pO5fBBWnE39RXK+A1b3oaF3mNHLat3vxUr8Krlel9fV0/5r
         F12g==
X-Forwarded-Encrypted: i=1; AHgh+RoHHC2psoMFM+3BRAXHch0XwH1TcWQV8Sz582uU9pQEK81QWfyoQMeMiy8fbC2y+l6W0AMqGYTxJB00@vger.kernel.org
X-Gm-Message-State: AOJu0YxEiesypDjMEyOuBT4Ef1ctYQPNOyK82Or9GTX1zGejHPi+ErWU
	ZquUM1dEGSyeCjFOiTQq212XD4q2arxF5CQJ3l4bXUetzS4TFJqocPvYjXx8arGDw9mechFCtAD
	mRjEoxTeeRV/J7zp1LXvMfqu1vwi1MWyfrTWcFCOKC0uK4sPmSkD+tZCptiN8Nmff
X-Gm-Gg: AfdE7cliOgVfko5XHsErt/s2Dc0A2jbbrdx6C84t2kXE8HUIkTapBXxlJ6x4rwsqK8u
	mVGy3JzJaGKfsUEwmZSqnY96Rd41eTvAKTPJp9yaATB//t8XJNxmfBfY8Pg3NQ4hVel6A1WQ/RV
	YQ/gxGHp2ZPJ/YYMHbmepnmm/PY/mDcG8YRs2SPKAGbhQ33Litki5CGUsUp5F571FkRkPn7y0mC
	A/NLyv1tIjoQwVThPfSGh2WRgRSPLzYtwY5SnQ5dR4UKnGuKWiBdnKTJxcVJ1OhSa7l3JlX1IUr
	UflNVCQexdNXY5n6y4hz7OW6c1nVJvQRQ3TH5yAajm+4e9SDsZFj/DsH1qbU1ilLwFGHcGc1wFi
	u+6vkIMUeCD6/bo2/fBuIr2JiwxbrZFIjEZ5PyuMQwhWQoXHTqob3/lZcypvDLnIqC4C+4BHl0g
	==
X-Received: by 2002:a17:902:ec8f:b0:2c9:ece2:822b with SMTP id d9443c01a7336-2ca44889405mr30905165ad.3.1782870886735;
        Tue, 30 Jun 2026 18:54:46 -0700 (PDT)
X-Received: by 2002:a17:902:ec8f:b0:2c9:ece2:822b with SMTP id d9443c01a7336-2ca44889405mr30904765ad.3.1782870886152;
        Tue, 30 Jun 2026 18:54:46 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37a7102esm23040315ad.6.2026.06.30.18.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 18:54:45 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 09:53:45 +0800
Subject: [PATCH v4 5/5] arm64: dts: qcom: glymur: use Aggregator TNOC
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-fix-tracenoc-probe-issue-v4-5-aefab449a470@oss.qualcomm.com>
References: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
In-Reply-To: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782870848; l=1699;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=OBSctkNoPUXkv4iIPY07zyqOMNxZfKUYjyMh/aKW2us=;
 b=DA3VNt61VJoRRUhPlCsksJ/tb1/he7RYq8J1STLfm51nmK39SVAnVB6X00n0cewpsdBoqJdpB
 JT1nt83u2tRC+Yf5yy+NIYonPjpxkwoJLPlmL7bGr+jjXvozH14h0gx
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: 6GmVI1j3rMPs48POFhDeVblQp2PsOobW
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a447367 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=zFLblpEf9OP3IKm3h4oA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 6GmVI1j3rMPs48POFhDeVblQp2PsOobW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDAxOCBTYWx0ZWRfXwS5/WDLs7EZM
 1Ad4jJmOvbt0B27DupAbC4INmq+yRmezb71ihIKY/m4L7Hu/rkSbKp6tYB06/pDZ/Px6RX8dIqD
 wmBf5U6C1VrIrmxdWC59u7YCZohCiGhJRY6eMP730bS+GVR7dLEMvSm6ni9w1hSW1yVhdXR3rIc
 hLvBWScm+TcCnE/JE+nj78MwLGUYIhYCXBT2uIKjHagLZtdxUb08p/57MSiCAlAZ7LOEX28gExu
 aW7tRcRlgLHjmCcK8OFSUv479geIP7zajHUt1SvVp0EcPxaSYc8jInBjiH2bncM67nNZO3Gxmc0
 91cKucKWpo8PLbREI8fXo9fVsCKywC2UeFVhQLWVNaot5X61E5WLbad5j86DcSPRWjd8uqjG8FS
 49wtFm5LJRVt4YnAHKxTSFiFgJsXeWu/0P/JoAlf6RK7Bs+f+4fT//AnVrGhSxUtDQAYzNXe+He
 0FVw5FlpjxK6yOyAmeg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDAxOCBTYWx0ZWRfX69ovcukKY6rX
 wLcf95uOkW8uRIV28JFBLq2t8WpJVcryOyCDMPMQWDQpJVj5v37kLNBG8sNV5CxOkw4zKrZ04Wc
 lW1LhwFyEl7MIDWMgsR9DXeHC0jhzKI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010018

The traceNoC node is the system-level Aggregator TNOC, so it must own a
valid ATID that tags the whole aggregation path. It is marked compatible
with "qcom,coresight-itnoc", an Interconnect TNOC, which is never
assigned an ATID. As a result the aggregator has no trace ID and cannot
tag the merged trace.

An Interconnect TNOC is a subsystem-level aggregator: it merges trace
from the ATB sources within its subsystem (TPDMs and other ATB masters)
and forwards the combined stream to the system-level Aggregator TNOC. It
carries no ATID of its own, because the Aggregator TNOC downstream in the
path already owns the ATID.

Switch the node to "qcom,coresight-agtnoc" so it is described as the
Aggregator TNOC it is and is assigned a system trace ID. Rename the node
to "tn" and use the "apb_pclk" clock name as required by the Aggregator
TNOC binding.

Fixes: 1f7d0c42a08d ("arm64: dts: qcom: glymur: add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..d612e8ed54c8 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -6038,12 +6038,12 @@ qm_tpdm_out: endpoint {
 			};
 		};
 
-		itnoc@11200000  {
-			compatible = "qcom,coresight-itnoc";
+		tn@11200000 {
+			compatible = "qcom,coresight-agtnoc";
 			reg = <0x0 0x11200000 0x0 0x3c00>;
 
 			clocks = <&aoss_qmp>;
-			clock-names = "apb";
+			clock-names = "apb_pclk";
 
 			in-ports {
 				#address-cells = <1>;

-- 
2.34.1

