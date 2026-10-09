Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81A6309F08
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 07:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791530297; cv=none; b=H6rrLFN2nOANX7lJCuAtXN3hhjCE4XsCpzDIE1rEyEo58GfrIGQ6XoZJFj6fAy0hICyCwGLX2ezP50CHrJXYusA1ZCQmdZxurN4apCpB/KBwTznnB9IHohhvuuyhudUltd3VfW7nlv4L4p/LUClSaUpatK5elqg2Ztncb06amMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791530297; c=relaxed/simple;
	bh=2nUyjIaHLKFi5X3ejPlMLU+6LJZM3sK1x15oKrJa7RM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=I5iHHE5cyJ6Ln2+wuHMBg1wSXwNKjcCzulx5XfOXzMurLiLztIuARQvhmvH2J5aNeG0YyMAQke+/3JYHR2huwHu5SDhdj3DZ/jcmDjXw+hO7KEovjftERD1FwShLI3+utg2rq+9xIrNO6uXXM4OlBJ5h0f6C+/kSaVrT24onNrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QHgQf0Ae; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Unz3/V9q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QHgQf0Ae";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Unz3/V9q"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HPBx1089455
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 07:18:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=g5O+9O9HeSDjYjJYDTxCrw
	PB6czEpC7YrfyKs/iuA5g=; b=QHgQf0AelHdYzU7H9SOxtM6Bjs3eRLamhTJ6Wr
	ibaRhnjyEJDW9kTn1HrnDMrQHo1ibXiKJ/7SNCK5oiv2qm72pw3k1QzYnWWBEw2M
	Va3e/AMQPYhCG0KnUdbLxZAB8FoqH+6gPzgNgohFaRkegXAK09bXDBlyK0HAsqkl
	iOLEN6V3EmO7vIbexx/vkcvQJgdFVkwLsOU/axwHlJgGhvQg6nsVmQaDvesEPPAr
	RX0IupsYdxE7NDMw/vM+j3Bqos/8j82tI1Tn597k1PxTRIM+IJeRZzIhJvUCjNq1
	nipK8Wke34ME3VsE83JyqB9ysbkP5ObTewjJUugVtLZh0QGQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ekvar5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 07:18:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a46f0f158dso1440917a91.1
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 00:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791530293; x=1792135093; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=g5O+9O9HeSDjYjJYDTxCrwPB6czEpC7YrfyKs/iuA5g=;
        b=Unz3/V9qgG3g+tN2veIAqRC7NgceTUGU8+Vgf/ImmlEPodZk+08Cyq4cVBaVgAa3UB
         kvQBltipLAYfgn19tXH0MWU1B82KMZoSXsqyLxk6ZrgQvnNhuPLLOW9RLsTExeABNscY
         Icayg/E7n5jcDu0YwqZQGGSrs/oW5aATbWAhN9FwxsT0DNa1ICrOmDQy89LtMkAkrufv
         rEILbhvO55WdpfKA5LGQSxw3t9wq5o9arvJXrPS+PN9JuQmN0252LiKrqQ1Xk0w9knVY
         Y7hn0k1b9Sg6lJ1yXYumRwTWQZhbD0dSM8RweRIiXagILT/1r6vq1fNhYv0Q47O7xEBc
         HdTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791530293; x=1792135093;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g5O+9O9HeSDjYjJYDTxCrwPB6czEpC7YrfyKs/iuA5g=;
        b=cTAJ+YCsqKZANGFlpsIGABhDM570rXRshOQ/vazq1GOE530epfX8YN2SB4r6aJRAm0
         woeyCiwdFAW0YNMaoUpOI2FgJzKeZD9nbAn6/pOOyUYOLB9+//ZKeadbT3mU0bboqTFg
         UdgXrgTo7tzn6S1h8EiK9w1Ux+2/avGPqL4PQVokoTruLCRCDKcSPb92hJBgeQmZDlCL
         2cYeUn90qTP0s3/lL5tcSfY/GafHdwW68McVvqEKa8l4RrPXyW8nTV4s1XaNy1NuH3Dx
         JIDAore+/4cAuizFrzuvlwSbzsAkZaf2vc2yhzj3KTS2Znbl3mkuUsYoxXVnvABPeoSX
         3gLA==
X-Forwarded-Encrypted: i=1; AKwUvBy8A8RKG72zMMoRGVf2CVsXBXFzz9LOBMIKbiZ0y4wneq63+S0wK49yw7ErKF7VU7YjfM8GBuxapf88@vger.kernel.org
X-Gm-Message-State: AFq9FYL5dZITkl9CeCQsIvRoPple/N42Wn+qDsu1Ox4UPPir5Trfai/F
	AUBgL/7PlFrkPX0sFlZK5bMlLZ+sIdJbfNqbSMzyCZ0YP7cmrL4xbDkEc50y88M7bQNsEiidqAG
	7voE01ezu47sDZ33k4M3BvbSaZV0DC6isGp3HB4U6UY/3p9Br4UqtaTtOS6ooLjuP
X-Gm-Gg: AYBFou35g/Qa427s0Ql1kNtdtvGWVqlGmV1f6J0uGv6TXtmxQn72rB7EQpKtKe1q60x
	XguFMCdXbl3N/Qc4aQ1xqZo+BYtM8rb8ODOtlhCzYEd8M0/AhaZEPmJax9JW6IW5P3qE9lBf0Iw
	taH/Zr/9xv1dPP5WQJRLbtwFknMd2WWWkOh5erFphJ6kS+wsUegdpmR5ZRDz4WEA9bomgbe2DWS
	1Ly/aItjNhgw9dDu6nHvtetLmKV9U6ohdSSqiG4dj0HRDbuU/RF5YA/XDxcedpheXrk2jvGqtTV
	nMMzlOeM5Buy1A5P2Yfpt/wy6ratjvkrRXegu+J3l6sXqFK4R35W+nuoktZgJ7Nl+tB0jtx2KW/
	/ODGrNIY8lBB3DwMiF3LOChxY/XEBR2ThhfF9yn8VNtQ7+WCBXG+rsmysBxdeevUe/0XZA91xPi
	0201dvRGRf3A0i
X-Received: by 2002:a17:90b:5826:b0:3a4:c1f0:ab1a with SMTP id 98e67ed59e1d1-3ab36db604dmr1043469a91.29.1791530293499;
        Fri, 09 Oct 2026 00:18:13 -0700 (PDT)
X-Received: by 2002:a17:90b:5826:b0:3a4:c1f0:ab1a with SMTP id 98e67ed59e1d1-3ab36db604dmr1043457a91.29.1791530292996;
        Fri, 09 Oct 2026 00:18:12 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e1d287sm494387a12.13.2026.10.09.00.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:18:12 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Subject: [PATCH 0/4] Add Glymur OOBMSS support
Date: Fri, 09 Oct 2026 12:47:38 +0530
Message-Id: <20261009-oob-support-glymur-v1-0-96cc8ffcced3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABKVyGoC/yXMQQ6CMBBA0auQWTMJFjHUqxAWbR1xiNJmhhoN4
 e5WXb7F/xsoCZPCudpA6MnKcSk41BWEm1smQr4Ug2nMqbGmxRg9ak4pyorT/f3Igs7aY+e61vQ
 +QAmT0JVfv+kw/q3ZzxTW7wn2/QOFFMLndgAAAA==
X-Change-ID: 20260923-oob-support-glymur-a9945a5328bc
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791530288; l=2165;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=2nUyjIaHLKFi5X3ejPlMLU+6LJZM3sK1x15oKrJa7RM=;
 b=aHjQgZG6ppIdYCCje7XLn2GCBgRHpKw8vrRamQbcD6RqFriLDNJq4LB5rkwf1B3PVXzxTviEa
 FYP74SaFAmuD0HQQkmA8YxNtaecscI37Q5Q5KerOxIGIvglJxLYE9HT
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-ORIG-GUID: IiYobnl0HiYpqUrMUu8i89Bc9kZ3W2PD
X-Authority-Analysis: v=2.4 cv=csYOAF4i c=1 sm=1 tr=0 ts=6ac89536 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Sg9nDdXpY9lkW-gxszAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAyOCBTYWx0ZWRfX2hTNpzMLGAlb
 8uo5orRBzGMBdydd3JO+pFLJ0LEe+GsxFs+Py293zlMdsTppC7sIlWpZ14qDj9w3N7kPecr7jPM
 4DBRs1T0IXqNsug2/pfWuA/G7BaJsrTDPnDtGbSg8dmmsI3l/i+4Psox2i12HEQ9DPDT3kKg28R
 C6Vm2SWpSiq13dzJ5rKaE412x6po8YaeQj4dZ6p6O/ZS5fpSy2DmMSAkWkGQ9+h4wxkjeFTVeC1
 p8fDI7rDxW1ImQ9uplBq8IngOZi9+7eoapCZmnndSKvunIBebhdPojNpeBbYxzXMqqoPRffBcYZ
 TWmTmk44A7UFG0mhdOscOg5C5cKtzSBd+0gdVDWmIumktibseqmtDz3oMQPIW1rJpU51uU+aOWi
 iSpr1QDuBw9AfBvjYw7WWJlRxJOe5NKO1eCwKInGSAmrn51W7LZPdUzFFCe8KxVA72dWQ8sC46/
 6Cp/RCZLC12EUM3HbFg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAyOCBTYWx0ZWRfX0nNs5sifDL3y
 j5Ko5fAffIcmSSCowq/LJNz5cfgnqutP3rdShXEEOZCik9PcFSAEoyi5cK62+k278W5Z20lggmA
 sS6jWEf5mFGEAn2xfpirUZCCXXFTYi4=
X-Proofpoint-GUID: IiYobnl0HiYpqUrMUu8i89Bc9kZ3W2PD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090028

Out-of-Band Management Subsystem (OOBMSS) is managed by a common remote
processor and consists of two Zephyr subsystems:

+----------------------------------------------------------+
|                         OOBMSS                           |
|                                                          |
|  +------------------------+  +------------------------+  |
|  | OOB-TEE                |  | OOB-Non-Secure         |  |
|  | Primary processor      |  | Auxiliary processor    |  |
|  | Primary image and DTB  |  | Secondary image and DTB|  |
|  +------------------------+  +------------------------+  |
+----------------------------------------------------------+

The primary processor is the Out-of-Band Trusted Execution Environment
(OOB-TEE) processor. The OOB-Non-Secure processor is an auxiliary processor
that depends on the primary processor and cannot function independently.

The PAS remoteproc driver currently supports one primary image and its
optional DTB. OOBMSS additionally requires the secondary image and DTB
to be loaded, authenticated, mapped, shut down, and released through
their own PAS identifiers and carveouts.

The series adds the OOBMSS device-tree binding, generic support for
secondary images, PAS parameters, secure and non-secure coredump
support, Shared Memory Point-to-Point (SMP2P) signaling, Inter-Processor
Communication Controller (IPCC) clients, power resources, firmware
carveouts, and the required Generic Link (GLink) edge.

---
Anvesh Jain P (4):
      dt-bindings: remoteproc: qcom: Add Glymur OOBMSS PAS binding
      remoteproc: qcom: pas: Support secondary images
      remoteproc: qcom: pas: Add Glymur OOBMSS PAS parameters
      remoteproc: qcom: pas: Add Glymur OOBMSS coredump support

 .../bindings/remoteproc/qcom,glymur-oob-pas.yaml   | 156 ++++++++++
 drivers/remoteproc/qcom_q6v5_pas.c                 | 345 +++++++++++++++++++--
 2 files changed, 476 insertions(+), 25 deletions(-)
---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260923-oob-support-glymur-a9945a5328bc

Best regards,
--  
Anvesh Jain P <anvesh.p@oss.qualcomm.com>

