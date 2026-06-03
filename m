Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC58448A2C7
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 14:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780496496; cv=none; b=aRfZ+hSL+4qkB99rLXvq6Ktmkt0Ehk+sZxHiDs2Wq0pcOZnaPE3KE9A58WrcH1nhnREIEjW1UlnJ9L0OTDkCoHpvcmLGfE1CJy4uJSjPpBF+27RFcjrDxavSQd3NyE3MBzF8yy7x5FOmgjPt+82AwC0jdWQfL/9kbIOnKphMT/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780496496; c=relaxed/simple;
	bh=ZedtRlFClaBXevVNFnYB8UGxbyP20S9HuW/op1IPHAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bim6nNuV+3SUfi+ks1x3reHiP+Dmvjc1hypyXttQeuV2fgDP9jrm0Xy/7BAzQ0S/IkNq7PoSROrgPxaQMPlki8V4d3l9jBfihPc9oVcJpWlCM7aTAA6IkXVAdKuo1rtSp9AB4IEN6UZ9bLHZ2M9gD07aQvw3L/Tr/tsycPgEJr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h0m/aYQ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aKULIrBa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h0m/aYQ8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aKULIrBa"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653CW1iN1199920
	for <devicetree@vger.kernel.org>; Wed, 3 Jun 2026 14:21:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z4Gm/K+T3sc4qmyuI/6DYikh3FBs9pCLd7ruh8jMyfQ=; b=h0m/aYQ8LGz3nWUC
	5B+xKAFVUnyzkM4SoWnQVCR4I6S1fYeZEtdIvzuarM0yLYakynr3kB50+Rpw3jtY
	/nyHIIfH9Hb7YTmzllSUh6JlKMctL93Pgn4Q7xoAmGm/523jcANoyfBg+cBicIXo
	Y7pd+tOKH58L1CAdZmry5uNjhh51DMI+hJVOizXskskeysjFujB9770I0eJLL8wj
	sa77vsgSgQ55uLhMI82PqujiygQFeWiTunziGZpCD6NuzkpYn52wD1eaqsJpjL2Y
	h1LoBu9GRpcDwY4CfyYS3hQHEfQANDhuCFApKgv4t/lt6ojUhgdbeISpe1t7KWCE
	mV4gaQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejckw2dwv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 14:21:32 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d97415004so7793319a91.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 07:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780496492; x=1781101292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z4Gm/K+T3sc4qmyuI/6DYikh3FBs9pCLd7ruh8jMyfQ=;
        b=aKULIrBa9wmjAApESLtqpzZb3eL1iQAmW5BIvu+X0MC88jHh7wPtvch0ettIxL4qo6
         J8OlmRohjd6sFYVJBMlihKT59p3t+58bpEqp/rIYncTFjGSVXvplGCj1c/c3aOoszEDg
         PnhxUpPYGNTSF/9DpUIHlL6oODL8xDyCkJNmlv+VfBSHOZcBOS7jIz4a7CvmDJh/ioTu
         CaMoQQ3+1mfSqmhl+eDJJUu/x4MMNUs+BDEyP16n7e4IKWI6xoaMjwUC+ZZjZ5If3/4K
         dYg/bMuVbLPT1EYM5tlxlhxdP6M1kVdLZDlLN9gNGNnRPXn83ZhtC7dDEj9ZCVD8Tled
         m1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780496492; x=1781101292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z4Gm/K+T3sc4qmyuI/6DYikh3FBs9pCLd7ruh8jMyfQ=;
        b=nHfpU2mQhgeq4A3QxYdHF7K9gD2rtWVbx58TnNg0A02SDObStm89v46blhwRltmTR3
         udMncQ5g2ur1ZxEgqTDUafo5JqrAMu6b1a5SYKI+UkM3l/MCE+pV28l8rCIzTFh5wwbi
         bTDLYKMOxlhNqnM29cXxCpIl810FdCqKqnfhwo/nxie/80mCIGcwHbFalm2Da5ehjYmJ
         sDztlOMuD9Fwav57RZJFB0/h4KHPyPRbY8XBdFlyf1rBHpM098UVXXTOoXmfCRdofCnE
         JgpdSkzx9jj1PVZSWhepPMDbc1newsD6edn4Rq0ZpNRR/4vMWTKvsoo5SszFArSSxZt0
         IEZw==
X-Forwarded-Encrypted: i=1; AFNElJ9O6ZJUuc8VWT661s0DGRve7JGbcTVKkC9mFA/cQ4Tu4jIE1zfcChdcTv21+758aNQEGyWi3gDcm+rF@vger.kernel.org
X-Gm-Message-State: AOJu0YxFlpEOYdht1K54rm/CAXrj52VXwqZ3KtjtdXP4JGfkQWX0wEJO
	dM0+g66VBMzLa4j7cDmiZ+vIbTQJdJo/VA4pJmwbQuL1og/aTnRojiloazIvAbaCi8aZdw6K2pE
	l26ETS9udDhgkNZ0PAklAX8vAMPhhu6znjw4NqaHv6taYlfHkneDgNWjzFQ1ifk7L
X-Gm-Gg: Acq92OExHKEU+9mPxNXc5qd/Qglz5WFiYHErIjRVvQGiFDirXeBhIKfuOPeKnqiqaEs
	mp3S6wqGtGaZyDI6mWkzU4yyUwgpuN/BEOztYoQsyDEedo9HZ95HR5fEOVXdQm9h7phnwegctDM
	RweIshCARxhvhC80tB6x0Vdz068TAEgSwdmBYLigabEtcvBrpY0Z8UMlvwdjncojL7zLJNJ5d/T
	NuoKh/mmLXiyKkSae0fhx8JgyT78I44qAMKJHSi2bY1X6lgk4fVYyVDrN1Gz9zyycDQvGjHtzja
	PFt/Oa7kRTauRXbwUWibiYzd4sgrkZFOqztwUALg6DzXbn6Y5jV9nRGi0CCangC3Iik0lNTJotU
	M3RGZcX95UK340SMfDLMYiloajKCqIbEUgXmejT1Dw2n7YRBbgMpB6ibVq4Og/n7DfQ==
X-Received: by 2002:a17:90b:51c2:b0:36b:4d63:4a96 with SMTP id 98e67ed59e1d1-36e3247617amr3743115a91.1.1780496491847;
        Wed, 03 Jun 2026 07:21:31 -0700 (PDT)
X-Received: by 2002:a17:90b:51c2:b0:36b:4d63:4a96 with SMTP id 98e67ed59e1d1-36e3247617amr3743089a91.1.1780496491404;
        Wed, 03 Jun 2026 07:21:31 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d37esm41514955ad.9.2026.06.03.07.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:21:31 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 19:48:50 +0530
Subject: [PATCH v7 12/12] arm64: dts: qcom: glymur-crd: Enable iris video
 codec node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-glymur-v7-12-afaa55d11fe0@oss.qualcomm.com>
References: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
In-Reply-To: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780496410; l=880;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=ZedtRlFClaBXevVNFnYB8UGxbyP20S9HuW/op1IPHAM=;
 b=j6KLzRXja9vw21nECiRDIymu9bT8tQkMHvQods9ahk1D42LUixH/CxeLS/SQpISGW74WdmXD6
 6drwsQqNiu6A5EHUvmo7hBgLTSczmKwFmTd3bag+LS6ZEe2eaPj7UfW
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: Hq1aLSKRql8sBkGttK19HXOk4QhloNIs
X-Authority-Analysis: v=2.4 cv=edUNubEH c=1 sm=1 tr=0 ts=6a20386c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Dn0IJEph4XI5J7oltBAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEzOCBTYWx0ZWRfXwA3DeU58sSYq
 OPhIog7MFgSfCcv1DCn0TwjOA6eZ+qu23yw3k8N2h8zzC2zymJcAIn94keDk+iYRW+ax5trUlzO
 sC+kNL06Fs22AaQ/ZIxUstfc9lQo6soM/1tb+wSRxlxmreZqukiLYvz5tznu3L2yGaZhWAJexGf
 sfDfInPKKVJaF9e4G4x8cLwUs+2DAct5N7F4KLfWj83dfK8TSvdicuLHGnhcQMzeitz8MIa8p+r
 R+lVw1J3ZsQ+rEKFVdtOoTsjRlatm7qib8V33RpB0MaJ+SpNWjulr9DYaZYCwN4ByMcAbWvHiRZ
 ix3OhDe9nguEfpMRwVq5T92xtSup3ypfQ7YrkaJxZ4qpAi/mzy9VYrGjZEv9zHcBzx7zop7TtlN
 X5aq+IpzIQJQzfQKIa3DRTxbYjeE88I3VObbSFMFBozRslBh8Q7yB3TcZxbFinyx0kz3vwj+55P
 whQ3APWHSj9l9zWbEzQ==
X-Proofpoint-GUID: Hq1aLSKRql8sBkGttK19HXOk4QhloNIs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030138

The iris hardware block is described in the glymur SoC DTSI, and enabling
it here allows the media iris driver to probe and use the video codec
functionality.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index c98dfb3941fa..9445badeb18b 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -198,6 +198,12 @@ ptn3222_1: redriver@47 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu36_p4_s7.mbn";
+
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.34.1

