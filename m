Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C633DC4CB
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 07:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777964450; cv=none; b=b/8XU853mPnZh8RVk/ACNt/UAQSGXv1nFjYgayZ9Ys6mPf8F9FhK0TlKezaWpzdPA+eWI7XAsXPJwumWD2oLG7oy0ktAs2SFeWox7MDwyFmbBX9+CKfqHgyOB4g5uYqn7iU6Sdbol9IOLoRauK5AMQyXkki3MqdkeGyOT9URPV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777964450; c=relaxed/simple;
	bh=YXK+1kgquuMBIXjQrVSRCBE4q5ESQLclNWvU0QR64sE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bq1MFs9uZTamXImg4G2HejWLncvzxPHcTuaTS6q9LSuRLkshTMd+EYfrKNrB4sRankcis/BFATWYHIgOpiPjLyfoEOA8okAYqn5vXDB4QrBYixU4Rnmvjy54MEEysD8rpAnO3jKAs2Godt1Rc2RpnEgqcGo7EXcyzK9LAs/p+kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PDDxS1pD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M2Gpijg+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PDDxS1pD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M2Gpijg+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6456lWCW331129
	for <devicetree@vger.kernel.org>; Tue, 5 May 2026 07:00:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3FtecQ4utCQQhYZ1lQ2laqIkmzIbFQvnTmfCWCJD5gc=; b=PDDxS1pD8LTZlUzF
	WRykcGdhCXhawKasfeSjVCkLIlNMhm5jqbVk0D/cLGHx9hkHF95P9xmvKSUTVLJf
	A2nVGzSLgpBJxPcHlJMIRX4aw49M3kkyut/N7iY/U9LEqYA0HOt/lfXT9kbPAUHL
	VJTjx9o3vzAORfYg1uCdDYO4gROTB5ShpsEgGgl1Uk7dfclsiZxCXOIRNTlqWv1T
	q+tuDnIx+MSNPD6qLEEjFXB147mEkujX6KtBs0hgv/oodf0B/DRZhjW6vb9WDrn6
	ISdjmB72L/725wVhT5+GvNe38DtTx0ljgZnCKeI/qZGkJNI9NKWJyyx/gpLqnOS+
	f+fb9Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvr1b87m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 05 May 2026 07:00:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-365290bc5adso1179347a91.1
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 00:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777964447; x=1778569247; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3FtecQ4utCQQhYZ1lQ2laqIkmzIbFQvnTmfCWCJD5gc=;
        b=M2Gpijg+TglpTYG2r7uKf93JQLv7uydW27f34V3q/oJKmv264RoAivPqFDgrKLHKc3
         5P4aLqu4nZ4PVSIXVNQCN2ntZpdQyJTu2Reay38IKd3E3J1OLjnORHCia+9rsMBhQTQB
         3D5INzVGGxZHynhn4ztUGSDDeiwen5MyWA36ElvaeQtkJCrnFO50OPo7n5LU8lNd5z/4
         ZSHwk4nKGPdvmU0wVhcKptzpb2moPc5JP4uLrMgwUX9IL2h9D9vgdcHCRd4jDfTT4fhh
         r5TzomLce2rpxCJI4xuvgZbpeY5oSjnPlLIH5QNl9RXv83MrVe1IUKJuZvJPLIFiIPc/
         biDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777964447; x=1778569247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3FtecQ4utCQQhYZ1lQ2laqIkmzIbFQvnTmfCWCJD5gc=;
        b=BEzQDezCt07JMIODTM6knAPDVF9ktAGatb73zA5JW4zaZKguTvpb9zxN7gEUNSeZ47
         2itD9qn7KL3r2bIC7ahhCMnJ7X2Np5ZvMcWEIcmPcLXTfmq2LAmGv5aQ2zgGTg0kNrDw
         2UH0q4ICNCnsyQt465uCa3JbyguG0fBUd4dMRu6NEZYLps7RPgWMjrUT38wwE5Ax2XCY
         uQTCrtr7jTEwUtHvyb7bHqIaQEle3d5VUsaXlvr6luTxNQuOnSSEqfl+JpTUcsdzJC5O
         TTp3vUQxCyMQ+yQWNgvr0ChLOzbLMXTcVfEXl2hBJv7UuRc3TUYpCUYlut4T/GkT/BZE
         Pijg==
X-Forwarded-Encrypted: i=1; AFNElJ+FadlwVzvx9dVbAEFMOvdJDdw7YXYH7aY/UKlOst1juPdJMsaccYmRNMcnXBaPL4wOPljOspmG5xpS@vger.kernel.org
X-Gm-Message-State: AOJu0YxbmUbCibIHyE9Ipa4spvDdo1E/0kkrvxbOK72bX2yMT3SOhKu0
	KkIBL8rmTjIzCS2ei1hVWq2BTN9EUgAuRoRN+erXg18hPbEp8Hgayubt0E51L21oordmto9THMl
	rKky2HapPx0NM/MQWN+GybfGLFr8pWgSe+hqU08DXjz/NqaLVqrnadO4eb1YdRr6H
X-Gm-Gg: AeBDietEVlUtcyzhS3XlUa6lMpeR+12cenU8+alHcxXzejs6EVVNDZokSlHUDEGjPBN
	y5fYbqJyYPYtTeTegqvi2jbA1VTZnS5iW6h6AeR9cAt+R2d4UGyq5L1k4rw5Za5ibsuZFRlz/pf
	vGgQtLt08Om8zPzqKDbiNb4EdhLwloPGnjk07FwwKOkSmuvJuKeq00h78HFJBoMs/a98iDJS/XC
	RVm+C9Hq7yn3TuPr3Z1Dpc9yT3C6Y2TjD4HpEfjSU3sEB22XUDBYSIIpnYwjmGMNWirIGp1nXFB
	WKm87/ePPpM9XIThauXDj0U9gIeIyKN4ov5iCm4Khk+jDyfmI8++RXACUYfHpTH/l+ktz51UnuO
	/gcmaPRsKkEj8FPtw+6W4Fx3sMrrPdIIj1ZFrP16yVPIYMNghMGQlF8qvi0HJh9AAeg==
X-Received: by 2002:a17:90b:5112:b0:35f:bcc2:c351 with SMTP id 98e67ed59e1d1-3650cd70549mr13312183a91.6.1777964442132;
        Tue, 05 May 2026 00:00:42 -0700 (PDT)
X-Received: by 2002:a17:90b:5112:b0:35f:bcc2:c351 with SMTP id 98e67ed59e1d1-3650cd70549mr13312139a91.6.1777964441588;
        Tue, 05 May 2026 00:00:41 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ebec73aasm13840146a91.2.2026.05.05.00.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:00:40 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 05 May 2026 12:29:23 +0530
Subject: [PATCH v4 02/13] dt-bindings: media: qcom,venus: Remove clock,
 power-domain, and iommus from common schema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-glymur-v4-2-17571dbd1caa@oss.qualcomm.com>
References: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
In-Reply-To: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777964421; l=1505;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=YXK+1kgquuMBIXjQrVSRCBE4q5ESQLclNWvU0QR64sE=;
 b=REQWCbQT538q2OfZtlZ8zIjExLWixsiRImG7cUZ40McZz5JR0uUkATzy47T0Xgrc//JP5rRzN
 Gzye7WurnQfC4PYei3rXmcB5CVGYRoloioAa7TSJTJN4AmwWU+cfWXg
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: 0O_NzR_rm_CQcjHGrx2y-q9ZFf0yQoC1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA2MiBTYWx0ZWRfX8xKOuev7D4ki
 AHdcwGQlwO7hK+df3kbWlkLZZXbkN9mKKQGdlNSQI+yivdf1XvwQ9Y1ZxLeMNGoS2V1SPzFuGjz
 HDuE9fwB9P/wc1lf65vmGqaf9uzpMToRtPY9snuaXya8JNiEaAxZJ1wpfeRAMLZ4942qaY3lHO7
 Qvj7hqlI9hiZLcaKcyaMF6nxCB5wt4mKlyhY9PSvDF2U4eHtf0bsI2L/0FE21bOxU2NuZPmK0QC
 1rTI4CG6o+W8QiPpHGlgcxZuw8Ubr68KUQXffKid79oZXNvc0v6orOKkdmldCYD84/Mwyqc1btm
 mzr+9OsX3nEz7S8iQjbxrQO0f5EV0ElvSIXQNzLYt3AbiH0wy5ywcs/Nyo6xWmpzEhievTdpavU
 6cKbN9x13GlYFf6jFbPwa8dcIulHX1MPHgcSTKU8XRJCFQ2CodYVcK1wJ95MY9TmEetg1E7EM80
 0J/8FZ54a8iTMZUlgYw==
X-Proofpoint-GUID: 0O_NzR_rm_CQcjHGrx2y-q9ZFf0yQoC1
X-Authority-Analysis: v=2.4 cv=RvL16imK c=1 sm=1 tr=0 ts=69f9959f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=oAqX9iOIqteJqTbqMNEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050062

The common schema defines minItems and maxItems for clocks, power-domains,
and iommus. This suggests that the number of these resources can vary,
while in reality they are fixed constraints per platform.

Remove these constraints from the common schema. Each platform specific
schema already defines its own exact fixed constraints for these
properties, so this change does not affect for any existing platforms
that use the common schema.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,venus-common.yaml | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 3153d91f9d18..5d310783720c 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -18,35 +18,15 @@ properties:
   reg:
     maxItems: 1
 
-  clocks:
-    minItems: 3
-    maxItems: 7
-
-  clock-names:
-    minItems: 3
-    maxItems: 7
-
   firmware-name:
     maxItems: 1
 
   interrupts:
     maxItems: 1
 
-  iommus:
-    minItems: 1
-    maxItems: 20
-
   memory-region:
     maxItems: 1
 
-  power-domains:
-    minItems: 1
-    maxItems: 4
-
-  power-domain-names:
-    minItems: 1
-    maxItems: 4
-
   video-firmware:
     type: object
     additionalProperties: false

-- 
2.34.1

