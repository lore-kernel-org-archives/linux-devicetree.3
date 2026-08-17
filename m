Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC71448B97
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 16:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786982569; cv=none; b=L6/zmiUofVIa0uYkQ2dqmhmqaVQBu/7gnne2vciCO/iGx4MD4Hxm1/+Qv0YnF6JRgcADdKgW+IRXvJafyrka5DlhWyZbZ28a4fdvHyEzEQbYvEfxjUYz9AkWkOsea0N592o8cC9upd8ldzZpES3LLWF9GVX2JcXnvoSkVzkOpMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786982569; c=relaxed/simple;
	bh=Ldv8EdppRWOPwNTECWUx+Uit6DS4cMsliryNurou6fY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l7lu8BT5kSgf4qCyWUmJ0DtXpic82Onwb4q/zZ2wlw8eMmCg9QprqTJwQbsj/6QKd+uRJiqftAH7JLLoThsJHRTIbS35UIs2bu3oHyd5l1wLijbQWJgVTTwNkevGsKaoVg+xzZifHZikInd7DEE84iNKgRQSfWmH3YwMXNKc1Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iT1PrO+P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fO2a4pkJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iT1PrO+P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fO2a4pkJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HFYht93082015
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 16:02:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DRZIbW1vGBp
	/wtVL8vbCZ6t98BD8d3Nj0MpYQ1ianMs=; b=iT1PrO+P4jWxtYAFL4U2OFfSqcc
	RXSacy+IBUy6gH0+wfZ6Txm9VFCy8SECckJ3bKmfV3aMVlZCxF8v3kAM1HTzXTyq
	VgoJ4468KKeIvZHuaWIyRiY7pGqbV/g7jbdQmNrFxFsNi7qatP13ZZHX+ZK3kNBR
	1vluveu6HCUTsE8PBUm1SzHhGQL2zCDeoDkQuHyb7wvuL3chsD/AwpGLA2nQPRJM
	uO0ZQUgmcvpcQDIPp6FNwxe/fIgaOvMEXBYrOyVXoT56xphmjN/OHthmNNKfYJwk
	Sa47MfoCD7k/1ziR3KNZRx9WNEurBN1a36PmvTmgBnQV+tJ6DOcZidiyiiQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3y779ptn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 16:02:46 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848474825ffso39689b3a.0
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 09:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786982566; x=1787587366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DRZIbW1vGBp/wtVL8vbCZ6t98BD8d3Nj0MpYQ1ianMs=;
        b=fO2a4pkJPV7y1mr8xBgVwt34FQ0f3J4MmT67LpIx30OPh1mQZmmFfW6dYLjuVTWlpA
         e45PUdKr0tNQyFhvl++hwNdbGO0Kq7a9UsDK8c6SIId5nwyIvDq/US1RW4w+R0n8YchM
         +QlSa+b4q3UoIAvySFQzltt7ZooJvtRsd1fpcSFW4K8DHC1ul8BgxtCaJeCYy/uZYp8+
         lkZRFjyKz/u2dWDFBoc5BcUE3JogmjSAC6iedP8D1VrQDMN41ZPTFiE3Fg76FayNVFvv
         cnGsFeTcYkGN0utkumLKBbAzYLkVlBnbRaV5h16B3m9TaIfAVhHmPIlGe7T3ljtv2HpR
         QFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786982566; x=1787587366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DRZIbW1vGBp/wtVL8vbCZ6t98BD8d3Nj0MpYQ1ianMs=;
        b=ef20IJVJXPtKhaUD+RDYrzTIDinckGmh7ZX1RHL0lOfT2cJxOHi2EvvKm8gXQ59lfC
         zl51nONbf107O6jxeMBIwYqIIYlJG/7b+dHlzK94+ZkHERV5bvxSA2Ar9uELAG1O/1kp
         LTkPtWiOxD0ZWzzJ7PB3bENqclVC+Cj1/saCcKqWiu+3J78VI34BcNEh931pIjW1q+X3
         zYRQEFEGk1xwkb365oe94zbMF7vYpOUTlo6E50LaKdqpKWeIKfFKED2pev2EvhyZZqBm
         dHcOQvTKvOHGtZt52OvR/sz4qY7vx/k9pYnjqlXFfKy086WH53k+BqsLkZprM+WZavn2
         2okw==
X-Forwarded-Encrypted: i=1; AHgh+RoS95Kp1yA3ngXsGuvGhbWSe29tNcNIoREgOrS+OsoTYmdnO38I1z5kAyU+SWGcHHVql6Cmr6XctvZk@vger.kernel.org
X-Gm-Message-State: AOJu0YwfEXUN5SzKX0jIXYrJaEpi7ttkrNuX6QOGLnUzVmPOW83fGC3T
	2zdIVxtcgyMSS62upJnix4aBcEAuCK3kVG3ptbvITjyFaUvgOqtyfW6KpnCyEgIxzlU+ekfMC9+
	i9fuymyKm6Yif6BFs+0PHlocQ4ap1DKeK1ED+XMtrxsadKaw6it+elUN4o0+H/ewM
X-Gm-Gg: AR+sD13cVnWEmVvwd38z3TgdfyBiCD636Si8+y7NtSGQqc8U7jZMHZCJX44reRqN7pI
	npuNVxiPfDN/MFMRXHiFhHZ/2HPxHymmYsPsvv+6gTBTdHst3MgtSEXkUEgILpVcNa57YutoFBM
	LI0f3mikx1P1+75sXj0nxvnpZa/dQKW1bCT5nzySiFEmHjGiinME2BfXgJdEkqf423XcRNL+1xT
	bINfDHUMndoiD+PUk8dKkXwBn7ec2d4CreaDV6WNEntzTUig6rG1qnOq2bpH2naSowCuIO6ExhX
	9VAi4tYNP/I88MWlTzdzkxpHuPHVUmExmcXKjP8hmskchvarnPtnzet5T7W/hoVIwDdeItATeJY
	lTzHxKHob5OvzwTAqbhkGPrVW8Iar93mrcGglwExKYJskuJsjCGRx0ztAMQS+MleuGIvtH7ls8O
	LgIKt5GNyIAdsZAAq4NEr1WnrrNA==
X-Received: by 2002:a05:6a00:a01:b0:847:70f4:613f with SMTP id d2e1a72fcca58-851bc396235mr99905b3a.12.1786982564619;
        Mon, 17 Aug 2026 09:02:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:a01:b0:847:70f4:613f with SMTP id d2e1a72fcca58-851bc396235mr99816b3a.12.1786982563857;
        Mon, 17 Aug 2026 09:02:43 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-851b6f8b189sm562883b3a.34.2026.08.17.09.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 09:02:43 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Guodong Xu <docular.xu@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Deepak Gupta <debug@rivosinc.com>, Xu Lu <luxu.kernel@bytedance.com>,
        Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/3] dt-bindings: riscv: Add Sspesa and Ssplcofi extensions
Date: Mon, 17 Aug 2026 21:32:17 +0530
Message-ID: <20260817160222.3313295-2-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817160222.3313295-1-mayuresh.chitale@oss.qualcomm.com>
References: <20260817160222.3313295-1-mayuresh.chitale@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEyMyBTYWx0ZWRfX6arujsO8gJKZ
 AtQdKRC1gNxY1Xtqr2jwJm0OCUQrGtXeKsRmYc+46PkPuGdnzAKj8/uh19m0rmkZvj+KTygeWla
 EdPLu9MrbhliyH/xl4vEvNkSt7YYB90zh6/0BzVratlRX58YVOqYB1zOPaADKKRa/R4P0smT9dP
 exA37O0BfmCE16YArBatfBoDoWKX/nYyCpvboGM9J+m/zNYg8lvgFzy2HXL9fAUPEzjISjqE5Nj
 4KhV5x4efgCbom6SEYIv92X0IbPWLX507sAvppvh1p8C8fJYU3wnqKsg4Z0abAhLLWXQ6sfzK0j
 dMjJktVNCgP9jbMRfLJ3r3OWWpze5zriUMm+oVmluklgejBuAxQkJ32MvarcmjI0AJxyJEckBGd
 CUXQASYHeW4o3890pPBwt0843IIwvHbld9+2NDtjIyAnGISoBbVM6C1ZPnoTTp4/WBfedgZMR6k
 Pq/yufViOC1Ye1/ukQw==
X-Proofpoint-ORIG-GUID: FWrtAuTmHL8Xur0wTXjW7oUhA-byPc3R
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEyMyBTYWx0ZWRfX3A1ROxozQD/s
 VWBK0h3EIecgMXy6ctBu6moByI+R4s3hvRpNe6TkjedhkCowZs4iWCls/3SC/Z0YwK/FgjdqXe7
 BZXAfJmjszFofBaSKj45HD8+HJYrftE=
X-Proofpoint-GUID: FWrtAuTmHL8Xur0wTXjW7oUhA-byPc3R
X-Authority-Analysis: v=2.4 cv=WNhPmHsR c=1 sm=1 tr=0 ts=6a8330a7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=2yNJKbwY4VjyOEKDNOIA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170123

Document the RISC-V Performance Event Sampling extensions Sspesa
(Precise Event Sample Attribution) and Ssplcofi (Precise Local Counter
Overflow Interrupt) in the ISA extensions binding.

Add a dependency rule requiring Sspesa to be present whenever Ssplcofi
is present.

Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 .../devicetree/bindings/riscv/extensions.yaml | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 5ffc40d599c0..f316b93754ff 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -232,6 +232,18 @@ properties:
             ratified at commit d70011dde6c2 ("Update to ratified state")
             of riscv-j-extension.
 
+        - const: sspesa
+          description: |
+            The standard Sspesa supervisor-level extension for precise event
+            sample attribution, as defined in the RISC-V Performance Event
+            Sampling specification.
+
+        - const: ssplcofi
+          description: |
+            The standard Ssplcofi supervisor-level extension for precise local
+            counter overflow interrupts, as defined in the RISC-V Performance
+            Event Sampling specification. Ssplcofi depends on Sspesa.
+
         - const: ssstateen
           description: |
             The standard Ssstateen extension for supervisor-mode view of the
@@ -934,6 +946,13 @@ properties:
                 const: smnpm
             - contains:
                 const: ssnpm
+      # Ssplcofi depends on Sspesa
+      - if:
+          contains:
+            const: ssplcofi
+        then:
+          contains:
+            const: sspesa
       # Za64rs and Ziccrse depend on Zalrsc or A
       - if:
           contains:
-- 
2.43.0

