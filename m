Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCEB468C17
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791793967; cv=none; b=WkqLfy7/FAZXg7y/evgTpDp4IX/vJuNtcTIVl8/70gA2FVWhuZ+In06dT/Oy3EBE8Ffcv7PKGjDVgEH37kwGo7DJjnNJoWBZwex+Wmd9Hp6ipBH861Y0hucQ1QMGRzbxMeUabFT+ZxNdQ92Po+HCFlv5fV/5SpevNB4+ExobRuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791793967; c=relaxed/simple;
	bh=ExkRX2l1iIkYDq9kgcTCCd7CSc5H/urStxIl9201EGY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dXxPpRDeHw5wNCh3Wd8YtLf8JTNHQz5wjsTnCPjjiUHaor/M0wQHq3yA2q/0XnoB/StmF9b4L3dcnoL3brDPp6xtgGdKy9mXITxIuUqHZV1EtuFb4a0uZdekZ8MuinT/WHRbk4PzB0OxBW69vgQrFrw6/sxNmoTBJTqTlBMW/d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AJaP69lZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YY2g3haf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AJaP69lZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YY2g3haf"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8LEs61754777
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UK9oIxJd9lX7Wy3mWsbMb3G6xBMvsXJpxCDNzyTrQho=; b=AJaP69lZ9UuaD7qd
	OSJijOX7fPxRPzhYX1U8TbvnzlnyeE8IK5smD8X2OFm7BGlszhjRXSStsY+LeeVX
	L1hSXNP9YvgDYrldHY5P0pwniVrA+sPXGZt25bvBFaZGS2FZ3VwokOqjXI1j08Iy
	u0gFcaVx5prmu0pimB3ddhcIgEa0X3vDoelzne7yRRVXtOtHm9H8O8I1gL+bgGjX
	VYwT56Ewv8vhv6B8X1IVbSpy+HSqX40OmGbRzcqnU+VMY7mYo1gPkmN8fXgXZHO4
	77iFiQte8a8FYC8M0c5TETASbLMowqEHFZqK6vABzO1wwzRei2kia5tphdffLQ8R
	nI+6Hg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j711uw8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:32:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so1255201a91.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 01:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791793964; x=1792398764; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UK9oIxJd9lX7Wy3mWsbMb3G6xBMvsXJpxCDNzyTrQho=;
        b=YY2g3haftGWeBFyFoQua5YWM+AEDkSAEmqmMtZd8LGTNe0yN8xU57J/9cLLGkuwzQY
         Ym4Blo81noBDUNeaUV9/l6wVNrcR78/e1JJNkoSbkrRRSBK0jjQvVEbodTuw1jqA4VLP
         Xi5if5mKjaqmevN5o56EAiaALIMJR3Ld9gtPsYXsc+mtVCzse/nontPedooJ+C1AaHiZ
         hfk0YAxQJ+CPzwpYABfFSFFPNe6RnCE3DTqY7sD7EvB/RETSduA1nZD/VmQ5rKXKDEEB
         1ixvHdsCUiLTwXRNCoEoI29CjOk1N7dW7IKHeSFDN2SJwS9aIBQ34o6iXaSLzmThcjto
         O7tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791793964; x=1792398764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UK9oIxJd9lX7Wy3mWsbMb3G6xBMvsXJpxCDNzyTrQho=;
        b=DyKlSc+P2mXc3uQnqZ+xlXSPHECLRjR9MfQTvp9IR8Gqtk97otYrVXzdofAMflY/3x
         wqdj2UPDXhOwRSrk/gN331L4Zq/U0+33L3lTixTkX3ZiJ/u34E4npJc38awWo2dAEG+Z
         jgaqgl7zcltRXrjRQwfSzJlTXYbOek9OIDdFvBTXRzVwYruCkkeJVKj/7uhueTcFMYxL
         Ytss0x4tn/iLtRK2Xi+DjacyUiZ3B3Q8JxFo8X+kT9WTuuGhmYb2MxJ8dy+UuODJnhMl
         QEXbQOLRxjMOMKZPZmMrXLLIwbeRd7f/2hYStCw5d6hfePCepJ3E0c3WHqeJNaPldVJC
         FkIw==
X-Forwarded-Encrypted: i=1; AKwUvBzd3194lxzaBB6EtxuVIFNWCOFxdhEv6GM47zmG0iHOB9Oh+sUhnXu47qhZQU/S3t0/18fxQzonh7oG@vger.kernel.org
X-Gm-Message-State: AFq9FYLYr8T6fYErQU5TIurmLB5aKFdEt6vHwVtbkZpxd9jxZYcWVh3S
	Lpt2MkA1scUgIwZH4u5SAGEKOO1AYoxpXZ5C3y1H18XBOA2Mmk3CNO/JP3C50qzU1LseFrwXJBQ
	UveYTUy+5KBQFjT0XZJGznSxRLhsVKlT3+X3POTdMWx79B3h9HXlcnA7YAgWl4FdR
X-Gm-Gg: AYBFou0ZAn7YbSlnobGxHMhf/7m53sYSb6K3Fastc8K8UyZDW2CiNgSQmWVMCO4I0BR
	Mh1kFAq7hmJ0zjYfoUOd5tuGUWDVpGwE7UIJeHHtEmbNIZakZHvYYPKNdN0jvVnG9Ij25obOqU3
	NYjQ0XGDhz59q+ulVuPZ9tDGS2UUtn0rTFb8DFos9oBONdBcYsOIaRvRXrkQP7xGiLUZTmpOm0h
	XboA3OMffqkfVtUNN6xLfKsj9uy2PJ/hCBit2mVgb0vSqAzzPFOeQ0Rq9V58HrdCcTPN/8rn28f
	V+3Rj8MzFWQo+HCT0Rq1+RXHocVzLKL+quNyngqLtf6ozYZfkVdpU8viJTSGPO6RsEPrHn2Blpk
	77QJvvn6X9o0G6RcCKSj5ZKFOhGIZ2o4ger9PqpNoVrdhPi2/ag==
X-Received: by 2002:a17:90a:ec8c:b0:396:41d1:cbc7 with SMTP id 98e67ed59e1d1-3ab3a2902admr8257995a91.3.1791793964435;
        Mon, 12 Oct 2026 01:32:44 -0700 (PDT)
X-Received: by 2002:a17:90a:ec8c:b0:396:41d1:cbc7 with SMTP id 98e67ed59e1d1-3ab3a2902admr8257977a91.3.1791793963944;
        Mon, 12 Oct 2026 01:32:43 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3690474esm15749423a91.0.2026.10.12.01.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 01:32:43 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 01:32:30 -0700
Subject: [PATCH v3 1/5] dt-bindings: arm: qcom: Document Maili SoC and its
 reference board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-maili-dts-v3-1-8b499e7b9a52@oss.qualcomm.com>
References: <20261012-maili-dts-v3-0-8b499e7b9a52@oss.qualcomm.com>
In-Reply-To: <20261012-maili-dts-v3-0-8b499e7b9a52@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791793957; l=982;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=bFgYH5TvYpmMe+3DkZYQN4L3cjnfL2VwrYfhO+yt2ag=;
 b=LjINStvUqvCMiO/tEJna6yxBw8Nmw/mJKeAciEVn/VkjLtmRTgAjithJWHrMFSZ5pMKJjqK0+
 wBCtJ6FR5+WCL54eC7ZD+KpKB4MYMN7raA6VvitAqDH9vgX1Ppbqof/
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzMyBTYWx0ZWRfX0oB2R3J7S3PN
 8Tx2tsAz6QxeNNG1ftrWXgB5wGEIbuWgqhyk6vJI1KU3POdEEXMGjos5KxI6GtueH5ZTQKc1qJf
 qglmCKWyMH+gtVPTEV+a/mH2ii5+BYo=
X-Proofpoint-GUID: 8MQxndsbYTxOAAayJNpGbI_SFk6cK7To
X-Proofpoint-ORIG-GUID: 8MQxndsbYTxOAAayJNpGbI_SFk6cK7To
X-Authority-Analysis: v=2.4 cv=ePGGH3p1 c=1 sm=1 tr=0 ts=6acc9b2d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=6Y7mjEJBC9y1Ajt-k3MA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzMyBTYWx0ZWRfXxq060UIgs7WV
 +w3C1b7M0oU1Ba75NpKDzyEXxsyWJxpM4Z6QJgZ9utH9OQp3z/8ttE4k0vyJofbK0P7db5biPcL
 N3oIsk8VBlmPpdgjya6lTUuSoRPskG2Li3JBHBddFpV0tXsr6FBH0FNqh7I4+z6kS8XT0fCQM58
 EYmevwA6DpMlMek8oTrFn0v1vcg1O0sWx5R2UAB4pZ8SX8vNlk06dAUgaAQNwGYDbHuOm7L+9HN
 vzeSLlcijq2zerwCjeWtElsmPfKTNEgfXDtjAk+XCHZz0zGvh8VfoO7xrZKyf2OAPiOewSSYgJR
 LPxQYs0fq668n00uMYvkTQ9wkjadgchbyRJMtqtXP/hvZnU7sqqPNgHH1nI65G1ID+idyT75BBD
 cwEX/N5IX1GPpbgZGusabx9DcZmA5Pb/+QnlS/8LaDQJo1bb5Ahx3eNqQSP4t0sTw3d4R9fr80J
 HB/F3UL825PkZDsL25Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120033

From: Yijie Yang <yijie.yang@oss.qualcomm.com>

Document the Maili SoC binding and the board which use it.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..360bf529d0d5 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -201,6 +201,11 @@ properties:
           - const: lenovo,thinkpad-t14s-gen7
           - const: qcom,mahua
 
+      - items:
+          - enum:
+              - qcom,maili-mtp
+          - const: qcom,maili
+
       - description: Sierra Wireless MangOH Green with WP8548 Module
         items:
           - const: swir,mangoh-green-wp8548

-- 
2.34.1

