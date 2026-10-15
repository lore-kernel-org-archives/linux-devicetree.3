Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E2F51616A
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058181; cv=none; b=rpqik3rkhnyI6vWLYaMoBeFW6EZ4iuoenMbKtZTxImKyuo6Y7Bf7fH2rl7KnicQ5+EOjqctm4xnCtb1BRP5yR8LsdS1Hkm/47IcociDO+NOlW8aFDv1yFu7MZ+dkiO+jJ6FVpRqe7W1tGIcjahA5KSZ+sfUaUBVM7qSpIwKJSr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058181; c=relaxed/simple;
	bh=H9uj6sSRgDeKanFxTtA8ygC1BldkSBVH/X3TN8Ylvnk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ttIEN/Jz6/51yTdYV3AmpJhRpJyPPcYvxjr3kzOXqEq3yQiySuF3vak0bEFrB5ygYuN2XQsSLqaWqsCuZcAiWylDu3ahtCEMj+ksd0eBJypXB3H1MMtZwwmtpU56A4RR+6PZaHZm7vtzn04DoHJotRvCEDC/jHGXP6OYawa3VtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ETHsZN1O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XLYO/FXD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ETHsZN1O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XLYO/FXD"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jG7C4077443
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iP9EfGPQayz9jJaqzAN0fvZxxE2D2SSXLxCY9EjpCnY=; b=ETHsZN1Ob0Wfk/Q5
	1JsHMXbn2Ob49GRZmn+Yg2nCWAzR0J9Vnu77a2Q1m+kSfPNaYUGrT8CSngAUA/3j
	YeIa47ba8qMyW4sRRx9HcaJHAJztba3lgPgHW6zBhCLt+9SsB5SWYtggi5uNwPLt
	3DKNINqjMxBgDaMMsHdEmHzf8/MybxKu4jAKmqoA5UsjJTFSh4X2cs3Q7kLyTHv/
	7t1M1kUe3sZbjT/29cqth8K4CsCMEZNr79tokVnJgdykHmaAI4hNYGnYpped2XmU
	4BFS7hnmD75PXgTXSU5JZvTTOmIeCl5U8eM+m6zxhWJ8XREgMmmpbD1oU5b80xke
	06y4qw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4havbc03fm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:56:18 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3425098ae4bso2831337eec.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792058178; x=1792662978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iP9EfGPQayz9jJaqzAN0fvZxxE2D2SSXLxCY9EjpCnY=;
        b=XLYO/FXDEuGwNYDFfrAXw5F/ppqeKksq7GZjvbZJtc3WtX5wSYDNjcv1aHaNnMeJTJ
         SgDtTlg32SEwoWjAItH1I1hgCjaorS2kZdxbWCdPICl51FzxfhQNaAp1fBQA4kyJzmop
         q37Jt9JxWeibsjoLBbeQOtyKKeFmqwj6KML4HFlGGvn4FxvaSbqZ8vfQQ3mIlvIt+a9K
         iXSJWpL12cewtb5BEQZlFVOsdWPpzgxaoReU1k1w+/tKmjFbDh8Srs7Sk15pw8ASRuD5
         lYu6nzwqSzzs40f8ly+AUBPr7MMXdHp2uNBxO99pYR3c9JMeeZInXljXZjk3kt1B90hS
         wAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058178; x=1792662978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iP9EfGPQayz9jJaqzAN0fvZxxE2D2SSXLxCY9EjpCnY=;
        b=RtKedxzcuVOcuVdzCboX5csr5EUC9UpoaH55YMqDtvFfEgXUDc8A0/5iaeebmbucxr
         hUrVge11MxF4XMeEy+WH9iojz5EYhjXuN1Jn3Vtapf2E2AFBkyZ+Tw4A/vUJtPnkU+kd
         MY0v81Ut/whEc6nVQRTcGLs8hKzR3jWiYt/cOUYkDBEyGoSEu0v9kmDYFgMSBnWlasxv
         2KA1X7GbwidHkI/0IHxevnxTCl1xhCwDcwonbdUoov8IJz9ab09VNiBVhVOIk3ahLLSB
         QqawWCRfdgW858oO18QMsa/Gae2eiWf1PSdTi8iCUZllyBHxSFE3uiuu/cVlAXtuCvsn
         S0PQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhvVHKHxEdRvICg+bsYzK/xzI4ntiGkD839GO7+t0BU9rl6YZFszkBf7lbEMNlgbzCwmFbbeNrPw1u@vger.kernel.org
X-Gm-Message-State: AFq9FYL0t5nvrc8ZnQDAIknUwagZHJx1qBbm5wA9MKaMQGAJATj8uTRT
	Y+odtSmyHjAr69029MTLynkrI8QF/fzXk1Wnrfuz+9r0bXpS37vPEr1bMHQ+dMu5k3dZU7f+VvP
	S6eZFbi0/jvS2D05Qd9+7W5Dd5/A5G35SY2ARCji/xhfflZIJQcBJFteqDIsh3X75
X-Gm-Gg: AYBFou1J6g4QzIG4O2VX8ONOE2PzYbcullme3hbopQfe3quZ8i1n/QYpT4/gR+1qhu7
	GEPkeN6+N3iEB9ekDXH4mYJM1RInggAiv5u17YmxC5T40rO9/kpe7XN5LpSeUOakMijCYJ+iL2+
	liyHKYBayNMrPS/YVv8HqNBz7oKOFAzeSOE+FFCAXyiIidBRNongZ5mNr58KJWt3A1kQuCTRK8g
	ncNveoGpIriPIFwMQJf9SnN+g9oQVRu37DHfz+16vSRocmTuC+gX1VauzgKoWF5xqVIaLkTRor/
	V3ZrucUqoUn15Gv0RVEJ80yclTZQ4hgFD7q9UqaK1G+RgrnKRrXheD1HNmV3E0Uzx9lzjtRQavu
	27KN2wCC0sqQbWF82G8qudxtc3VZL
X-Received: by 2002:a05:701b:2602:b0:14a:6a66:f6e3 with SMTP id a92af1059eb24-16a14507dc2mr26143284c88.20.1792058177678;
        Thu, 15 Oct 2026 02:56:17 -0700 (PDT)
X-Received: by 2002:a05:701b:2602:b0:14a:6a66:f6e3 with SMTP id a92af1059eb24-16a14507dc2mr26143254c88.20.1792058177099;
        Thu, 15 Oct 2026 02:56:17 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm84476533c88.18.2026.10.15.02.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:56:16 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:25:24 +0530
Subject: [PATCH v2 8/9] arm64: dts: qcom: qrb2210-rb1: Enable CPU cluster
 low power mode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-shikra_lpm_addition-v2-8-ac7f1a0d5638@oss.qualcomm.com>
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792058122; l=846;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=H9uj6sSRgDeKanFxTtA8ygC1BldkSBVH/X3TN8Ylvnk=;
 b=DOguxFdDz8eXRwGTpwXmM914l69U245h6uQPMgNmIWIAFEd+ABsBGuwQIW21R3pvV2Ov9j9xI
 kT3ddKmka8EDL7zEPOGqasjxQb8I6e3QFrxqvgEBADuzNKOnUk8j7Gt
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Authority-Analysis: v=2.4 cv=QbvzLcbv c=1 sm=1 tr=0 ts=6ad0a342 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=SQDDdHR85c743OeLlmwA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX5dcuvlrANNoQ
 HMBOtfzOtPIljeBIob7BJudp24Fm7HFZ6CmgKjDf4w1/9EjIoDWBxebYR7geGU9Y2UBVK7kJo2s
 SVKsm+2wFzb+AqLyQjni/SC5i+ju4pA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX+fOYPfw8yU8P
 Km9UhxUQduocy+t5/3xm5QUk4nuuh87bDp/3JjBs4gEUxWPjBlXBT+KkptUl4Pchyc7ymzUjBwy
 cp1xCnsgyYXLNf5el0WqKCCDnaYAbc4C6sBAqdL06WueV9q/4fBLF1GWPkGW6zXG5OlF4wufFg1
 3MSfp3v4/6uUnxXE0TmxwSJk3cHskT2mS3O7+nAnnjWK1N49+70o0wFasWGUo30CrWsj7yGGh9s
 Ik3SZIExgrr0TGudd5ecALJoJQMvhlHh5zMh0X9mO1Hv5K59PgZDqU7i9t30Bmio3qm/Fy+lI/9
 U5nuUD8e6vMM3hh0jieUM8RTRPQjMqgRC8/R3rnE+0XNUf7yWmT0jMhjnDaixYPeg+KewSpzoeQ
 MuxVPmRwMAYp9zQ3HiFhI//a22IfvdrGn8yXEtQkty7UdEOx+QZ+g8OPTU9kZf27RqCBrU4DmYq
 msOD9QdJUQ2g8M7bpOQ==
X-Proofpoint-ORIG-GUID: nhSCYKVXiRd0q6HzfOLy7R7eRRBXciQY
X-Proofpoint-GUID: nhSCYKVXiRd0q6HzfOLy7R7eRRBXciQY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150039

After the recent refactoring of MPM driver to handle RPM notification
under CPU_PM callback, the CPU cluster low power mode works fine for this
board.

Enable CPU cluster low power mode by not deleting the cluster_pd power
domain node.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index da46e9d6552801631e668f7a43f5ae1c27639fd4..73c53af3eefd31c6b551f83f7675018d502f23e0 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -244,8 +244,6 @@ &cpu_pd3 {
 	/delete-property/ power-domains;
 };
 
-/delete-node/ &cluster_pd;
-
 &gpi_dma0 {
 	status = "okay";
 };

-- 
2.34.1

