Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A99B51FCCC
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058157; cv=none; b=orBpGRyWPDYJKTfdm7ijWItB1TahI829y7Q6z7RUcWAKzqzEZxxXfe3gyOI5TCh4nBuAl5qv//T06r9mluwLXRepFTsgci5Dfx6jdCNqZkOJCXEISU+/g2256IgGsKOuf22Ks5M9vQdQimy2mrFrsjQwTqdAzQR8jPuq+prFWhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058157; c=relaxed/simple;
	bh=B+xQa6aWfmJa8pgwrofKzJvK3PURgsj7wVoF8yt4ddg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E8OWckPuU3ur1k1ZN5w1KwMciQZ6TIP74ujC8P1BjI8hm+Q4BiVfaYCbyu/mCzxCLfm/nRQ8lUdS423oA7CrqTvFQOf/su3GrMr4JFjFmiv6JYHrgAL9+BcpU7ZizIIaPdQxyuP2RZXlNi9/MaUd8zHs6fFSNQH8/h9up33Od6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Aen46/Kr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SU3uSjUT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Aen46/Kr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SU3uSjUT"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jhJj1956108
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:55:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	71jYZoSFCUFfxM/4X8ZJ8jdu34wyLx9B8Cg6W3AdbKQ=; b=Aen46/Krbej98b8C
	LesDKNiB6nAn2RhbQZHG+DByVuGiiMKPTZeOhTiQCVQFT8fg4iCPBJKorqj7IWeL
	ZehWBsfpeUQz6zjqqKglJAlsioG+jREQUB07npAiHS+vi8ZKQ6I+E4NnE2tEAlJf
	TtAJIAs3AvtgwgLfa25T4cwdP9Dm6fhkNNUXEFrq1WRhVxWbMbEdfwhXdb6C01M4
	4Umqy9d9rQ/r5Mx9t00r5x6o4LvABuv7hBLjRi8hFpCdz1GrLf3CLzkSHAkTaeYZ
	aQR/j5/+tSWZccep93mxiV5jdIcKWCyVrraDb/C/BTPLEkH2MRA3Fn8kyGU04PR8
	tqYXgg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakdet837-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:55:47 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-151ba226e1bso6044818c88.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792058146; x=1792662946; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=71jYZoSFCUFfxM/4X8ZJ8jdu34wyLx9B8Cg6W3AdbKQ=;
        b=SU3uSjUTOvK20ZViBgxdOB1gNmzVsjSt3CFD56hfi4B4cAqmuYsx8lhpwwR8NgjxoS
         +flp62cQwJHNQcilmiSSUUoOdL84ws5t4+z/Pd/J+tckRjQHOwlA9TypxK6s/tRMmGxD
         FW7Yj+VvnJqFZhr0FVisiUXeg9ht1/4NB/OTZGlZi/GE6voJQ+0RymV2v4SyOswt3brV
         vLanNKf/mPCcdkuV0QXKEx3sX3NnhwY4qzp8xcuynqhKvTHdEXQVdCW77GskpNYVOOZ3
         Yf2TE1bgyKo6C7ePbQjl84PxrtJb+N79zWxYuXcwvaV/DKKo9NdJtnnUgxgwxNnX7JY3
         nflA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058146; x=1792662946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=71jYZoSFCUFfxM/4X8ZJ8jdu34wyLx9B8Cg6W3AdbKQ=;
        b=DJVC8lGLRXBn3lNAwNUMi3Z9hmGFr12NSc4tGriw4j0KnYl53DsSW32nAYf9hg+Aue
         A2Vo0OsWdgyi0z+tL89OXmPSXkiriRT1XLN/+uyZJpcl2yOI8V91TjQ/iWwZLS1qRV72
         u8kaQmKjip7nv54FmHOSLlZffPO0HyBHB7l+sVGGhbOM0GCRIaXi+xfSh4YqI+k4PnMl
         Wy2BTfActdew3VTlgL2SS5MtOc/TtzMSJRbUGAHZWZ0mNYdZA6ClOZIuySD+Z9+deuqX
         vovOM8MQKX8oVJDD7LKtxeJokbiqfOcFjo9P4AwB/wL1Q4Xfb4vn5/NTn/GzNySL+6b/
         OSVw==
X-Forwarded-Encrypted: i=1; AKwUvByXd9VHZaTWHhyUcR8bU1I5kKV1uxP+pB88puCcgAy8l8R+BbCsIFACkSAJZHN8Ka/wcZgFQWfS9QVY@vger.kernel.org
X-Gm-Message-State: AFq9FYIgQKRfto/FIfPPSFmezRX9akz8HC7GbjvNeg/EdmL6rZft/cT6
	/Oe6A4KyRuSoJz+bmOM8I8ggqEMzfE8VnvUCDyDILgY5dJgHKp+tBTfnE/ggVb9VeJEGjDFbI4d
	6xgsqos99c7ld1S2yA4UmbPUGIzqtKIPBqCDlWRIP6CQiQktHyQr221oqaw9+W5YK
X-Gm-Gg: AYBFou00wbn7HqM5V3y/xAvSz/df2a8w/bz3itNaEr2vHnh1DiSn0MZTn59Bz/gSz9F
	gwBBtLNWvzOxaeV6OoEmfe6oezuf2aBqqxh9ofD04Ez1wBWQj63iZ1GUXobm/cS1dNF9EvsTHw3
	G3O7prCl7bsh4fkgPOOiN6IJJEVnk+o7k4yFNJYKL0jlH0vamxRx9UBUEzUkCBI3GvlFrMfYIpT
	MM9N9fMlXHzHBXduQ4mBBkYpu3z3UuhdSZiPXdBPlCa+nUcT7wPQmH3tNRBg37gNg9BWIZ1Qlhj
	fFHykIKtrEc3+wwJb7O9ODaBj7G8GkEIWTi3vA/GSVrLfcjkAzwn3fwdlOc3xkkh42dEuL7ZXBV
	5RGsc3h8nhjlLwPG9ykie/XD3EH9U
X-Received: by 2002:a05:701b:2710:b0:144:e246:a0b2 with SMTP id a92af1059eb24-16a6203df08mr28902782c88.44.1792058146151;
        Thu, 15 Oct 2026 02:55:46 -0700 (PDT)
X-Received: by 2002:a05:701b:2710:b0:144:e246:a0b2 with SMTP id a92af1059eb24-16a6203df08mr28902738c88.44.1792058145567;
        Thu, 15 Oct 2026 02:55:45 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm84476533c88.18.2026.10.15.02.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:55:45 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:25:19 +0530
Subject: [PATCH v2 3/9] arm64: delay: Move USECS_TO_CYCLES() to generic
 header
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-shikra_lpm_addition-v2-3-ac7f1a0d5638@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792058122; l=2581;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=B+xQa6aWfmJa8pgwrofKzJvK3PURgsj7wVoF8yt4ddg=;
 b=8Qsz/wTwPE8obmSszofPzNsTV3AW55FSO0pTbnSQ8pL9/PopWeZZUe3RYhaBB1KpOzqbR+2wf
 Wv2lcWzDyyFCGsPOWNA6LQvNsuv8/3dekFfOSjD6FM7QFxHqs7+fJJV
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Authority-Analysis: v=2.4 cv=OdENnRTY c=1 sm=1 tr=0 ts=6ad0a323 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=5RFle6wAAL-XeIEoYeUA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: third3ExYLjTOftXu3EDBHOgRW7uG-uZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX/V+Od6E7zeHt
 PWGPrj/HxIekXC4svaUdi7+mSVYMgho3+QyNt9oSedfelF/1mznibaAqDBPqKGZPZv38AzXmoZp
 uCbH7QVY/Zv3fXhGwdxP9TMMmDIluX5KSkaMixaPe9jSIBIw8+E43EUiV7izKW6X0oKF6UrKoDJ
 b7Qyls599V91rhee65+djvdIdYcdo4XdYB/IF23oh+Oajdwo0pgPAT+L8GvYxh3tVXJqEXZrcep
 qubBd57NPHFF5OACZ01A7en5++frcjoTQLsFPBnHBauruaCs/t6PV/nSvgueSLruib49VP/1+/7
 mEbBL8FUUoem1u773uTPlNvsRhj6ZBpVDIMnmcjRFqC7x4ER2n0Qxp2p/NGCu3ymgPxH4YL8Dyl
 8F3rdbg3EUoz5G3LSpJ8sQxxqtr9ELZCwJWWfbMAUnKqn0NBtyfyU1pulvfib5lqacwC5JgpwpT
 Z46xSO5J+oXD/5GZWTw==
X-Proofpoint-GUID: third3ExYLjTOftXu3EDBHOgRW7uG-uZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX9yNslGMkhIHZ
 ROBc/IsKd1+MdS9jVRJSbOEzgVKO8NsaEHEVGN3gqYhHoxUKuteG6ZKra4IyAQrJPXFnAP0S5fg
 TQ7xZ3FxkH2xHwalVFb96wa22JV6jBw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1011
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150039

USECS_TO_CYCLES() converts a microsecond delay to arch timer cycles.
rpmh-rsc carries a private copy of it and of its xloops_to_cycles()
helper, and the MPM irqchip now needs the same conversion.

Move both to linux/delay.h and drop the rpmh-rsc copy, so there is one
definition for drivers to use.

No functional change.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 arch/arm64/lib/delay.c      | 8 --------
 drivers/soc/qcom/rpmh-rsc.c | 8 --------
 include/linux/delay.h       | 8 ++++++++
 3 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/lib/delay.c b/arch/arm64/lib/delay.c
index e278e060e78a9ec3953657a6bc8c0de0da4399fc..117ac5a2f13df1935dbcbc7bf32901f7a4411295 100644
--- a/arch/arm64/lib/delay.c
+++ b/arch/arm64/lib/delay.c
@@ -15,14 +15,6 @@
 
 #include <clocksource/arm_arch_timer.h>
 
-#define USECS_TO_CYCLES(time_usecs)			\
-	xloops_to_cycles((time_usecs) * 0x10C7UL)
-
-static inline unsigned long xloops_to_cycles(unsigned long xloops)
-{
-	return (xloops * loops_per_jiffy * HZ) >> 32;
-}
-
 /*
  * Force the use of CNTVCT_EL0 in order to have the same base as WFxT.
  * This avoids some annoying issues when CNTVOFF_EL2 is not reset 0 on a
diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index c6f7d5c9c493d9e06c048930b8a14a38660df4b1..4a664d522142747427de5589f8aa90b3e3b74bd9 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -146,14 +146,6 @@ enum {
  *  +---------------------------------------------------+
  */
 
-#define USECS_TO_CYCLES(time_usecs)			\
-	xloops_to_cycles((time_usecs) * 0x10C7UL)
-
-static inline unsigned long xloops_to_cycles(u64 xloops)
-{
-	return (xloops * loops_per_jiffy * HZ) >> 32;
-}
-
 static u32 rpmh_rsc_reg_offset_ver_2_7[] = {
 	[RSC_DRV_TCS_OFFSET]		= 672,
 	[RSC_DRV_CMD_OFFSET]		= 20,
diff --git a/include/linux/delay.h b/include/linux/delay.h
index 68b2a69dd24d6c135f9f749c1e2f15f8b3bdb141..31e1a3dfe2dfc1a9dea7fd6d7db735f9a2507474 100644
--- a/include/linux/delay.h
+++ b/include/linux/delay.h
@@ -17,6 +17,14 @@ extern unsigned long loops_per_jiffy;
 
 #include <asm/delay.h>
 
+#define USECS_TO_CYCLES(time_usecs)			\
+	xloops_to_cycles((time_usecs) * 0x10C7UL)
+
+static inline unsigned long xloops_to_cycles(unsigned long xloops)
+{
+	return (xloops * loops_per_jiffy * HZ) >> 32;
+}
+
 /*
  * Using udelay() for intervals greater than a few milliseconds can
  * risk overflow for high loops_per_jiffy (high bogomips) machines. The

-- 
2.34.1

