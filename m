Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E6E429810
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 12:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777983914; cv=none; b=NIK6e1QUUdR0bZI2hin1LtoBHR6qiAYWECvgBVXvGu8DyyCYm2u4zDxSkn2uEbOqgiE/LcO2mBUJHYEbKtxyd9RytZ5ui6bjic8H88GVPxHIxxbS8RiiLFSO8dPDlyA3ckimQAeAXftfG/FMmDuToTv67VX8v2G2OpSYsvIamf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777983914; c=relaxed/simple;
	bh=2IM4lMSreVHLqyyOxDBhvYJWupnQlqLCRMuo/4Cjc8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dLb56BQvnefVGZu7rhRfbG07UYaDq1xGL6mH3SgE3ic53HmQt91ZBv378ZoN2DxzisHNGuJLs171RDKbKko1HYvGt4v+zjzHwgD2I/j5DrB2j0llV7Kgm7cBqERnCtCdAJ6oJD6w3FTHeCDRmed1tzVDP7R1f78bf+RGMde5hd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TdJ65q7Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X1HqlDmr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TdJ65q7Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X1HqlDmr"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6457gYMk1346173
	for <devicetree@vger.kernel.org>; Tue, 5 May 2026 12:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6n/YGblvIcxORdMx+6LxziMRaZ4/mcyw2o6YavI3itw=; b=TdJ65q7ZsmmM7A9s
	PBnNuQ/i0v4A8QPjn4V2POdg9kz/RCuU25m6xcXQN3WWok6aroZpw+rrldHYTAbZ
	5vmi1ETWcg43mtJQa3IAqFY5hg7tK9RcBniEEWKTdSS06luxc8Eczlt+X7+WJeNx
	L58cHgLKPuHNpiOZOtZ2EhMfaLHEcqX+Nn7QWtzGq9jAfltQVyF4h7cdzjSQXk5u
	OFLqy9roijDBrGdoGMOMzIv74cr3H1oXxHkL4yzhB2yeSmL/LwLoi31AWcK5Ut64
	7XRuZOKq3E5iUPMH3MtU9B3zbZv0T3EkwdhNm6yuqhBVPcjKMtSqvRbhH9q+Svkm
	uJTYKw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxx2xc0rj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 05 May 2026 12:25:12 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c822bc6ff86so202546a12.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 05:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777983912; x=1778588712; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6n/YGblvIcxORdMx+6LxziMRaZ4/mcyw2o6YavI3itw=;
        b=X1HqlDmrXexcEOl1Ody1QMG6ObFKNmsZQQmEMY4SYku+6/UBV4KClNEUL2DB9N85a0
         g328M+Juk/enKeteDRE9Dq3UzS1RJWKdSXt0TsGVbET1oAuRWFheHPYPF7w7XzLa8G2h
         1km6HnJl97RsjEPG1jZcepbS35+7Kv5sCMH0PZ5LsdmjQIq/OJLf9/v8AkD74KmIwSJK
         tCEjlQhc/MW0E90vmcKrzL8dBzpH1AEl0SoGpC1IvEoE4LaqiRypkkU9NevPAAoaoge6
         tZGL1La6/HJeN5IZBRWd114O+2VmK4Y8R7Qr3KAhJNs6kbMaYXd3QHylCd2apCNpQ9Jz
         ROaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777983912; x=1778588712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6n/YGblvIcxORdMx+6LxziMRaZ4/mcyw2o6YavI3itw=;
        b=WO0kFQhL/NjbBKzarHm6DHTHp8CmxSk51GGXqkmqf2/Y1b8f5Pc74HcgZ5j/x9kulM
         mXPxaJyG35bVcsNTBlFqcb9JwscFG39tfdit6FtaDNpZgNxS3nB9A+orG6kc0uT27jGG
         n1OxACMrJo7ys2p3SleaPUoF/EB0EB0aPGE5mhyz3UPMChBCJ4SaNhjxOqQF1FRsIIUO
         ONm0/zZzNKeaYZjoIu/VLySdVTlS1ISWAsuPVj0pJ2H8ZudJ7mzJfYPhNef49ilASWUV
         MMsuL/SWSWt5B1Rcz71L0CdZTJOqV/AuNNFRzJtW7ukx8YTP0U2QEYK0oJT2ElX7P4yP
         nCrg==
X-Forwarded-Encrypted: i=1; AFNElJ/cBK6OXEHjIkV7tAWsGZJQAhsfiTnQtDzwq31WsRmzBK9wwcP+mcPKWmMda0UZIY+kghX8mDATPK0Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi/kHi7R01yla+rL9ZP+O/B/u93fkDSxOwlcCytdJ4R7X4g6E5
	ed7+d1cxHS3kmk8CxgZN3eC94RI8l2jI0QP2fR4kOYAbIqvdf+OcujsuorcDiyAvhVkuQqVc8Hs
	B8rnoWKrnFQzcfvKw4HcYYUCwRgLvewMKacR2qlqGLK5LuduwTwH/qmLCyq/Cl2Au
X-Gm-Gg: AeBDiesB90yWeKAw8NjIXWY0NVrhk0dmif1Ami6OtxJFVXw3Sh8IxT2dYv7OIgFQ07N
	QJeXLsYs+OlF794vnvisDxFBLvk4SQxsP7W1W42ApB0bcyeSVc7AHh8GrBAknL0rq1+MwKxhYt0
	ILMQg8bKyyOsS/Zx4V80XUxSLjFQ2DmNSaT1EPYRsa6o3/45f/zyLpFLBCI3/2GUxRepKwhtS8I
	z1qQptz53xpmuZoRpkbUhzpSA94ArwdssoHAJLsZSfRABMo3XkctZcCxLeK98rHDLNM+zqwt9Ia
	sei6XmPtxrkvDaXp88AbejWqHcS/8LzIFCHp4FleuRUI2VKuCyPxfK84iBwV3qA+Mo/2T8zvwOd
	1pVRMkEMHLviAItfjsc2MXnV7hLjZQId1GnEdHKHB2wodq+IJf8I/zhBcm4Op3mU=
X-Received: by 2002:a17:90b:4e85:b0:35f:ba08:35bf with SMTP id 98e67ed59e1d1-3650ce40d34mr7090700a91.5.1777983911504;
        Tue, 05 May 2026 05:25:11 -0700 (PDT)
X-Received: by 2002:a17:90b:4e85:b0:35f:ba08:35bf with SMTP id 98e67ed59e1d1-3650ce40d34mr7090668a91.5.1777983911014;
        Tue, 05 May 2026 05:25:11 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbbaac5bsm12597998a12.6.2026.05.05.05.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:25:10 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
Date: Tue, 05 May 2026 17:53:47 +0530
Subject: [PATCH 3/8] ras: aest: Skip unimplemented records in debugfs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-aest-devicetree-support-v1-3-d5d6ffacf0a5@oss.qualcomm.com>
References: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
In-Reply-To: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
To: Ruidong Tian <tianruidond@linux.alibaba.com>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, catalin.marinas@arm.com,
        will@kernel.org, lpieralisi@kernel.org, rafael@kernel.org,
        mark.rutland@arm.com, Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-edac@vger.kernel.org,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777983885; l=1700;
 i=umang.chheda@oss.qualcomm.com; s=20260328; h=from:subject:message-id;
 bh=2IM4lMSreVHLqyyOxDBhvYJWupnQlqLCRMuo/4Cjc8I=;
 b=fu5pDeP5xi3HER6UMYy15HGHWu0Q0X9dpDdi3I2AdC7VPoEVXMmPbTCAZ4BK67PM/lvDZoL4u
 HVgHnE+TPdgB2ZI4YYsNx0SlBhhGoi8hF8+KMHvtMao8NtxlePtZQ+7
X-Developer-Key: i=umang.chheda@oss.qualcomm.com; a=ed25519;
 pk=3+tjZ+PFFYphz0Vvu4B14pBQSzqcG0jZAQspTaDRQYA=
X-Authority-Analysis: v=2.4 cv=U9eiy+ru c=1 sm=1 tr=0 ts=69f9e1a8 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Q5xIpPglxa2DKV_CsKsA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: pLaHRtU-m5cjg0GJbob5hVXr4VRrefqV
X-Proofpoint-GUID: pLaHRtU-m5cjg0GJbob5hVXr4VRrefqV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDExNyBTYWx0ZWRfXx4tQkWc9SBXJ
 2H//PNrNF49BihKwYaD+DiNgX5j/j59dVf74W5i1fvzhq0ic7jqVOtPkZt0zFAdOfoMXnkgnQEz
 Oevg235MerE9vdV2Gt80c++G78Wrs8fwkHgznETKCVq/vDSbfY79o6sy1i00BXwUUJ4xt5n/bXQ
 WsOT5uwZxkNBweY+opdvv/FoqjWyXfHoMM5LjZCQBU36lPK2PbjcLwLltluKnCMZlq3w+wHkYbX
 xPcUdaiaMFj3nTZpmLLEgmGdX1j0q1FqRuCmnPlJ0m4Hwqo1+ukwPKUJmk5iMM/ASwgR8MvtCO4
 GksmT6SzIZQm96fAcgeaBdqEfMGoNSvXoC/+u+VTH9U6B9H7anGo1i0LLV/aQsuMlRZ5lQXW6bv
 E7/nmOwtEdPWfTYe31EjqBjtn6Gso0EFlUA4GSzl/a9sFPbDeFI/d9+yjeqK3zGUngJyyFmcioA
 eUoGGw3VBDXu4ptnKBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050117

The record_implemented bitmap uses the same semantics as the rest of
the driver: a SET bit means the record is NOT implemented (skip it),
a CLEAR bit means the record IS implemented (process it).

aest_node_init_debugfs() and aest_node_err_count_show() were iterating
all record_count records unconditionally, creating debugfs entries and
accumulating error counts for unimplemented records too.

Fix both functions to skip records where the corresponding bit is set
in node->record_implemented, consistent with how aest_node_foreach_record()
handles the same bitmap.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 drivers/ras/aest/aest-sysfs.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/ras/aest/aest-sysfs.c b/drivers/ras/aest/aest-sysfs.c
index f710503e4d74..b36190bb3b3e 100644
--- a/drivers/ras/aest/aest-sysfs.c
+++ b/drivers/ras/aest/aest-sysfs.c
@@ -52,7 +52,8 @@ static int aest_node_err_count_show(struct seq_file *m, void *data)
 	int i;
 
 	for (i = 0; i < node->record_count; i++)
-		aest_error_count(&node->records[i], &count);
+		if (!test_bit(i, node->record_implemented))
+			aest_error_count(&node->records[i], &count);
 
 	seq_printf(m, "CE: %llu\n"
 				"DE: %llu\n"
@@ -174,8 +175,11 @@ aest_node_init_debugfs(struct aest_node *node)
 		record = &node->records[i];
 		if (!record->name)
 			continue;
+		/* Skip records not implemented on this node. */
+		if (test_bit(i, node->record_implemented))
+			continue;
 		record->debugfs = debugfs_create_dir(record->name,
-								node->debugfs);
+							node->debugfs);
 		aest_record_init_debugfs(record);
 	}
 }

-- 
2.34.1

