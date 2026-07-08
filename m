Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1097937997E
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 03:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783483134; cv=none; b=AnaOqzzJVfZPo8ofHjPNmD073UdAwppQS4FnTjP6RFgLEpUC8JoBnVbG5/+NRLg+Oa0roOWMyBzKUOD6EBuWT/GYPMWoxfJasswMb/aICJe26AyYilNgJzKFu8jqYes5RKFbNNwYQdzXG5UBHSY8SH2DodfOG+HXALDCEWd09oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783483134; c=relaxed/simple;
	bh=SbFJVCbDW7thUo9wl/zKc1WGlXsEXTKlcJaCWKyiayw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HChxEeL70HTzIQFGJKdOtfZBUYL0AhzNGRca4HhA4q+28CPhwj+oggtnGATFcDTf8C4Jg0M8r6j1RbkIuckjfqvPw+y7rf+vtFgsu31ooJ1iU2eLW2GWv/ymOybWyVKIiwCcpVJquXgQ/bJaVt6QseEo4HUWejmV6AOsQQ/ZXcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A3Ocbh1i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZHcOQl0D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A3Ocbh1i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZHcOQl0D"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667NS9wX900444
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 03:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Rxlhybev86/Ln0YkgAASFU
	CG3bTQ0usUH7X+nPUzF8w=; b=A3Ocbh1iQrO1/9dZMyrEXEl+zWYK3yIUOtEtv4
	mPIbldorCNXYVq+DwoLj/uAX7HVfCPjAgYUJfDBDGgyLswTraYETv/iNXQrT163E
	8IaNJfSoK15XYttvndGwAhxOBSTFPKp7dc/AF+86YXlH689S7uq+duR1ygoxBepv
	e0UwwRgGQNL+yJEu0ASqeW+HMbkySkMEbE1/1qOH5fTJeVusSbj4HI56oNbCutFL
	fDyFK0JVfxeihYb8FxB7i9gy3AJ3jdGEhsxtiUINgpZZ29zcEhmY8Kw/Li1q33P5
	Fym2QF4i6V7xvCOW7+GuaijxNVAFrfAA9J5pVkgQ/6oYOHwg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9b5g8thr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 03:58:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381250979d5so317429a91.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 20:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783483131; x=1784087931; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Rxlhybev86/Ln0YkgAASFUCG3bTQ0usUH7X+nPUzF8w=;
        b=ZHcOQl0Dk9LTlesSNLR8jVAkhV/Vv2a0UOUt9Do4NYhu1nXCNORv8ZDvm7TaJNu8wC
         ulvmU3GJf300OG+8Utq9yIePtUNDMb5i1927hE54AYN1+dgkaEowXl2YTz2UES05/1hN
         HOENxppFU6hPlnWxeG1b6KK5v6JhF5m82lUrfDQYNzC3RqZmSG4rzji83U+5ArSrIxyl
         KOa67oMej3eVzPKY39dpBU5rk2letyzsoNrnNF8n35ZBme/yLW5Pint5dMjwaaQz4mw/
         MtluBRvPhVUL7/28Pu4gFB6W4F168bryy59K9V26DjkUuF5m8Dk6LkgfPpVEulbZyIm6
         GS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783483131; x=1784087931;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Rxlhybev86/Ln0YkgAASFUCG3bTQ0usUH7X+nPUzF8w=;
        b=YRBWShcpZbIKhSUNjvUbByXGM/GLs5RzbyoeMjoT3M0vgUHNVfrsoTHA2U87z1dGAj
         r+uY2xXK3y9Ezdnfvh19NwwkfHoZ5x2QR2l6aaULT12us3lCd73a9PBOFHmhgkf/AWpZ
         mQXRDiqBY1vJg0yLjNcEEqWQ+eFJDj+SMlJGx1B1MjDlwcp/HIZAb8MVAi6YMv05t2ar
         golTgVhE7UUrGgMDAFkcS4K9f2L74xDN9kW//qHbPwnP9ZhF+rAYxfrVHlWds/PaMjY3
         IOcA5trGWsTJNwVcegLW7H6CALMxLBy6v1cZerJCPA8RlOdiCB5QSVblHIr1zHw4IxSg
         EFVA==
X-Forwarded-Encrypted: i=1; AHgh+Rrp4x1iHBfRAOa0JgLsQ6OyTndroAvIEAmjGEoU8Fllh1ikkBebQ7wl7uJP5YAVkgNYSIFrZloayVhW@vger.kernel.org
X-Gm-Message-State: AOJu0YzQpyZ6F3JLh8erqd8QdjQX/5ltq/dPcUJoHOWhRb11+6yKOzis
	eRSFcuxkfxIlggkqYiGf0O4vtaaeUGOmr3qvT8U0O13bKXueP1pv8w+VUcBvQ5zsF/zTqo9qE9k
	06mfv+qs0A4OtO+aeaThQZt78HWomG18VT/0YPgAsZcIOeCBflUF4y9wSLJ6EvX+4
X-Gm-Gg: AfdE7cm2jsq8vgb9WFAzmGRyd+kCBo0GlvEPxWXKJIDvCVfh3S4ZBQfw43FOo3HjF9B
	3gjTuWLrlbhL1AkD41YysPSmElMOEaNKHzAWscN5p+YtxtzmGVhu/7ZXq6eFjDAH4i1JyejxPnk
	X8eq25n9gJ+UviksWdShQxb7+wjrsO+QnJawIfrVFWKv19eO4v2gGtUiBmfCNjz5MPL1J2OWyxI
	Mg5Su8sz4al3JlF2CPP5weh/sMAaSkPQi8/9ALMNR9eIQexj3dkgf+VYLWtZkmVL/Yh1GSnIL1Q
	Zv0OzcuAGqO3U10DsRdaguYzqmv1+d/vrKvy3C3OzzMS8aqKpg9oX/RRF+tQ8K27IaJLhuGRxNE
	OlITICONHMtStA6vGCAqviGjuyipIPgbO7lDQ0QqKfEKz
X-Received: by 2002:a17:90b:3ecd:b0:380:925:aa25 with SMTP id 98e67ed59e1d1-3893f97ccbfmr851408a91.5.1783483130818;
        Tue, 07 Jul 2026 20:58:50 -0700 (PDT)
X-Received: by 2002:a17:90b:3ecd:b0:380:925:aa25 with SMTP id 98e67ed59e1d1-3893f97ccbfmr851373a91.5.1783483130327;
        Tue, 07 Jul 2026 20:58:50 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm14487136eec.3.2026.07.07.20.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 20:58:49 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Subject: [PATCH v2 0/2] misc: fastrpc: move ADSP duplicate session creation
 to the driver
Date: Wed, 08 Jul 2026 09:28:31 +0530
Message-Id: <20260708-dup-sessions-v2-0-da40f9c98a2b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOfKTWoC/3WMwQqDMBBEf0X23EgSJZCe+h/FwxrXGqjGZmtok
 fx7o/deBt4w83Zgip4YrtUOkZJnH5YC+lKBm3B5kPBDYdBSG2mkFcO2CiY+diwINTpEp6xtoVz
 WSKP/nLp7V3jy/A7xe9qTOto/oqSEEtrYpsW+tyM2t8BcvzZ8ujDPdQnocs4/8WHQuK8AAAA=
X-Change-ID: 20260609-dup-sessions-ea2acaac1994
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        devicetree@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783483125; l=1994;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=SbFJVCbDW7thUo9wl/zKc1WGlXsEXTKlcJaCWKyiayw=;
 b=NlQ/Wx8ghJtoXpDr4R4K/wZQviwH9phco0+9hlqjH3VcWj42wvZmZqtTKeCGVfiFlBNaey4ta
 RJ9xaiX2aNhDIW4TidCfeUr8VjsT9iD57/kakbMukZ/K/7BxmalIsrJ
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDAzNSBTYWx0ZWRfX2Fj3zgfU6/HT
 sdDPBuR8zI5/YyMEhKN6m1UBzEynj0xVv3dSuIa6Eiml6K/MO1Fv7uz7gXl/VbbiE6wGGhMozbE
 TUzrmatQ/DvsgUAeL2zzyPPtLSuoYKI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDAzNSBTYWx0ZWRfX6vyGbrv/0qsb
 UoaD8R3jn6b0bfW21+9WgucpcLrdwrKP2OGq4IG7dNBJg2w+gEsrZbM4bE+WbylMMAWDsBe6kZq
 hbnUcF3mU0p2iRF3I0qPvn1aM75IZnAsusj434sX1sHkK98SUbR/aZLVWljoTC2kcUkZ4TaLQE8
 +9Qxaadh9ayI2E9XpMLkqjxWpw5kWciGVeGD4WjUZl0Aj/zE5bfWn4bK2xEPmr/z6N8nxqrsvCq
 +3SKnjFTlxe54XwqRUw1qax9JJ7zL4wZOrFQKT3Aabd8ojsSIvw90NR5SHfd+3+gBAgsFhBjqfP
 NT3VlEYB9u8Q6xqGWo0KwlI4zW/u3syLZAtUgxbp8QRovjYMeWEoiUeTrEBvNUVfeKK7bcoj+Jb
 BnFE2wg+RVfuKc2aD6omnMKxzeDSeNz0dzd/RFmDBI6iwG0xCi51C0iqlE9V+6GZM2rYDW4jds5
 ra0DZXaza6sCRo/sjZQ==
X-Proofpoint-ORIG-GUID: 5-DTYmosjIgN0QBC2kQbS7h4XIlfrXo5
X-Authority-Analysis: v=2.4 cv=JLULdcKb c=1 sm=1 tr=0 ts=6a4dcafb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xEkKumbzGPLJN7pZj7kA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 5-DTYmosjIgN0QBC2kQbS7h4XIlfrXo5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080035

For ADSP, only a limited number of FastRPC context banks (CBs) are
available. Each CB supports a single session, which means only a few
processes can run on ADSP simultaneously. If all sessions are consumed
by fastrpc daemons, no session remains available when a user application
starts, causing the application to fail.

To work around this, some Device Tree sources set:
  qcom,nsessions = <5>;
which duplicated sessions inline during fastrpc_cb_probe(). Upstream
feedback indicated that this policy does not belong in DT and should be
handled at the driver level instead.

This series removes the per-CB DT-driven duplication and replaces it with
a fixed driver-side post-probe step: after of_platform_populate() returns
in fastrpc_rpmsg_probe() — once all compute-CB child nodes have been
probed and the session array is fully populated — FASTRPC_DUP_SESSIONS (4)
copies of the last probed session are appended for the ADSP domain. This
keeps the per-CB probe path simple and ensures duplicates are always
derived from a stable, fully-initialised session state.

The qcom,nsessions binding is deprecated in the same series.

Patch [v1]: https://lore.kernel.org/r/20260609-dup-sessions-v1-1-26934abb9fa3@oss.qualcomm.com

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
Changes in v2:
- Added patch to deprecate the qcom,nsessions dt-binding.
- Kept the logic unchanged; only split into two patches.

---
Vinayak Katoch (2):
      dt-bindings: misc: qcom,fastrpc: deprecate qcom,nsessions
      misc: fastrpc: create duplicate sessions after all CB probing

 .../devicetree/bindings/misc/qcom,fastrpc.yaml     |  2 ++
 drivers/misc/fastrpc.c                             | 30 ++++++++++++----------
 2 files changed, 19 insertions(+), 13 deletions(-)
---
base-commit: 97e797263a5e963da3d1e66e743fd518567dfe37
change-id: 20260609-dup-sessions-ea2acaac1994

Best regards,
-- 
Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

