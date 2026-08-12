Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AE44302F6
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 23:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786577723; cv=none; b=d/oV5RWr3clxM8iRuUy/9lUZQPo9dZVqpceU4+cYUFeadOLNRKiDAjEKP3XEyoNBSgTeryZouoUkVNkeUCIiwSg6MvaO7rxPGSTJbV70cFcjcMLevI/fb1wGhcZdraZSdSK9zCHwqE9PvDM6FG7Jn54f+/jJuLA03VQr76neEgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786577723; c=relaxed/simple;
	bh=df+eBxBrANzUqAkDxq/LIOvp8cwE4dtT4e7eHOHJASw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BBevsEbmD9M5CV5Xwhbs3kdzhiu+XC565N/ow2AMBJTFmCnI87HVWrlihUTF310rCupUQuLC7nlwVgDrTZzPT0LzcrwrT9pl9F4tUTn5gxg9WVISNxA10NbZiISDccrqL5gZj2VCL67hZxde94VK3f4Kw67U4O48pQBthONYdrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QRVSFQ47; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JZKiB48s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QRVSFQ47";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JZKiB48s"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CNMR0o1374758
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 23:35:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7ew7essRfW4CKu/wg5LnPI4usVo+eyUYoe/mBBDpBn4=; b=QRVSFQ47/HfFj+l5
	1NZcpNhH7D+NfqSPF8QVnXbaf5oeLkC2iCGcqnpkNvYm5pXkI9msqwKdEFoZpFes
	Ieqiqj/8LByLIG1GwqMz1f/C+z0DItXQw2vicLrDlSCXPlseo8tZ0uJ8wcMsv3Zi
	VtLf5PUfW9PvmlrSdUqX6/4R1DIPyp47XdohzGLgSgI24v/r2aT+Is/hyxUJBR+i
	GeUfKVvvWJXyG9xLYmi9+THEo8L2T0tp+fv/+s+mgLr73oVH0NXxCCGG8K4839gE
	EkgPTDywrjy3ElT4GWqtVWtFzmJKv5AryJ7alo/+nmBIGcJ0DH5BPSKWIsjAkiP0
	i6OvSw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0nuckkvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 23:35:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccb687f82eso2735275ad.3
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 16:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786577719; x=1787182519; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ew7essRfW4CKu/wg5LnPI4usVo+eyUYoe/mBBDpBn4=;
        b=JZKiB48s9Y/tn6Upo8IT8HRjjIjFO1fVgYSz5kkFvnpVZPr0QLVMSqbCyHqZJ0Rw1D
         MaTYFA/nw+NzkLup7Pw8FnDrxjPB6SHECmmunAd4lfKBZg0Xg0EFBLQtrzxJHOMQ03kb
         9hK93VrnSc8DroNYY0L+MCBYP0pKMHaGcziBsdDO2cLnzdYi/Nsvx41i6SslZwPVI2C+
         2mXbJqObBlmBUg0XnPqxqJxOetII7DL9edLN+YeYgjcKd073CZzmsnSPTW4ATpwP36/0
         O1zmV8YU8zBCtRkr7Kt/m8rlAgaTE/up0hNSWxG1jl9b269jY6czUw+NYGuJHLdwaf4b
         8Epw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786577719; x=1787182519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ew7essRfW4CKu/wg5LnPI4usVo+eyUYoe/mBBDpBn4=;
        b=itzRMKyX12y5HXbb6sFCbDLv0pGcK4QqlcN6OluaMxhp0/qmOM0KieAfwEI0wD2mR7
         phImTjv4sHaucQ36ka//O4O89rYnBkuXhmnvLjxyeEjTkimNVhWyd8hCVQuwWjN9qgij
         +ONiqxYcFLofIiqp6uNzXOjh9Cs6PMFdZObOgQoTLheI+LeKz96YJ24daKn6Orizudy2
         CoyxXBzy5Oz9Eb9bTyyRg6uvGTke242M2YPB272W+R6282z5vPSZX9/XAbWaB4qa3O6w
         jozx0TyTtOMUlxFcGVTYTiuaun5ur061n5JWp1SQsvrJK1zM29DEu5BPzTMvVv+pbIyQ
         c3dQ==
X-Forwarded-Encrypted: i=1; AHgh+RpeG7BUPDJw0MLwv/sN+ug/USyV7h3emtcFiGbuLMoe1UBrrZF5r5ZNrA/zvJjtxm6U8aZI4YZHn7Ob@vger.kernel.org
X-Gm-Message-State: AOJu0YzEwAO6SZUflSHhmXp9/q53lkrdqSXaNL53kpEwBD6srPX82R9A
	OWhMM1/NIuDUtsepbOJ5+nscF7ZECJaQ/oOYmDKSd3oXXaMR796FHX/5lgFktvDskI3q6s0l7JQ
	8l/8jauofr0sdt1l9cSczcO4Ht4p0XcCuDKD+YpNszQx/Gvhc/IZf6annWcjBZgcR
X-Gm-Gg: AR+sD10YpqUXWSq91t2215q592OJGv76WDj4meVksw2HE/c6O3/Aq3qB/+dKf7zb1rc
	wd2NaZmU8Ic8ma/hZCd+H8QTPSKCMrnPJhGEpzFpUwpYISKsxQ8G6IboB2sheq7X/83pawn6Adp
	KJd38uXbBonjE6f1kD6p+NsTK4Y61WAUJnQ3MqVBwv84arYO8w5xegu6FMZ+hrnzMjSyPD1kZ0V
	GikAu04/GOOQrKxvBrJFxzelsWTyzYw4Ors8jFi7MuQ0wegTeiyNDdB72tTnFTBxYpGTVcfFgQC
	N7Rq18W7+TtOmYS4Au3BY+P8hq4DOYM0KB7UxcMI2knWdyye1PYU/neRxO3GjQ==
X-Received: by 2002:a17:902:f651:b0:2c9:c991:3bf0 with SMTP id d9443c01a7336-2d37d581162mr19111025ad.8.1786577718837;
        Wed, 12 Aug 2026 16:35:18 -0700 (PDT)
X-Received: by 2002:a17:902:f651:b0:2c9:c991:3bf0 with SMTP id d9443c01a7336-2d37d581162mr19110515ad.8.1786577718418;
        Wed, 12 Aug 2026 16:35:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c26d0fbsm2136805ad.37.2026.08.12.16.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 16:35:18 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 19:33:49 -0400
Subject: [PATCH v6 03/11] dt-bindings: riscv: Add Zic64b extension
 description
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-rva23u64-hwprobe-v2-v6-3-c985af3256b8@oss.qualcomm.com>
References: <20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com>
In-Reply-To: <20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, sophgo@lists.linux.dev,
        linux-kselftest@vger.kernel.org,
        Guodong Xu <guodong.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2714;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=df+eBxBrANzUqAkDxq/LIOvp8cwE4dtT4e7eHOHJASw=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqxaZpGghL0lKZNWVsyfs/b09AnNXKwq7Ue3Jb5z3bP1V
 bmp1L69HaUsDGJcDLJiiiyHj7Zkb33lE+37nPMHzBxWJpAhDFycAjCRVHtGhs7zvq3twu+tnrx1
 cD9TvWg1n87SC7vz+1NusSjfZ/ed2sjIcEBQY4v9Xc3WDZeKznt5ss3XPXZa67/EvvcOlyzzb9n
 t5wIA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-GUID: 0yH1ZXj3tNqROHQx7gaha_KVyZHIJG2h
X-Proofpoint-ORIG-GUID: 0yH1ZXj3tNqROHQx7gaha_KVyZHIJG2h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfXwgcoCYvBlK3s
 xzUKi5TVJaxag5hJ3NiSxXuJawbrET152lIL2tvj1/BSlHi2pS1oZUg36+Xk1vasPTWLNcUWThL
 VgWahrfpQcJ3IzJyZ4CkKRSFtfFIa9kVefEv9JvjUmaQNaQ9pe5r6/WorSiUmwX7IT0IIG8hYp3
 HiWky3FPH5m4uMbb5uuSO84r/Kkon3wI6BWPZ7ota4pLpskrJY+w/0we7lWYANsq2OkO76fi2FJ
 N+No5o3JNKJXZJJf/2ShX2xEzzlOKMjrYQO0Mmtl54ZHyNQDoGZXIq95Kaq1BX2C4tmBhn8gSAs
 wnvU0OVn8SJ8rPqXkCS1Yq92wURrb+q4RJam7A2oOJuqRLZLAJp8Udu86vQDYyLAitp4YI0V7mq
 0sbpm/fyQCdzd75hhdksQjzv73biASvIPr7/KrlnS9s54huc1oUU+ZkAP32RtVCIlMzteEPCnhY
 bxPZKE3S78ZfqlFfEiA==
X-Authority-Analysis: v=2.4 cv=VcjH+lp9 c=1 sm=1 tr=0 ts=6a7d0337 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=B0juqsJzrbe9EOqzv1oA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfXyOsSU9lxYey0
 DpwYzA4gp2iGS9VIhAvaFvtXOy3++m+jcIlLZeXgEISHSRWOFWba10KMKxQ7JTzxxqpORfCFjpF
 w/QySzDkRd5VR68PbuYpDJUUz+j3Jw0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120190

Zic64b mandates that cache blocks are 64 bytes in size and naturally
aligned in the address space. It is a mandatory extension of both the
RVA22 (U64/S64) and RVA23 (U64/S64) profiles, ratified with RISC-V
Profiles Version 1.0.

Document it so it can be described in the riscv,isa-extensions property,
alongside the related Zicbom/Zicbop/Zicboz cache-block extensions. Since
Zic64b fixes the cache block size at 64 bytes, also add a schema check
requiring any present cbom/cbop/cboz block size to be 64. The check
matches only nodes that use riscv,isa-extensions, so nodes carrying
just the deprecated riscv,isa string are not affected.

Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v6: Guard the zic64b rule with required: riscv,isa-extensions so it
    cannot match nodes using only the deprecated riscv,isa string
    (same defect class as Rob's bot reported against the Zicbo*
    block-size patch).
v5: Commit message clean up, fix a double space (Conor).
v4: Insert zic64b at its sorted position (before zicbom).
    Update the commit message.
v3: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml      | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index d4cde2a7b8b2..79491ef8f86a 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -537,6 +537,12 @@ properties:
             in commit 64074bc ("Update version numbers for Zfh/Zfinx") of
             riscv-isa-manual.
 
+        - const: zic64b
+          description:
+            The standard Zic64b extension for 64-byte naturally aligned cache
+            blocks, as ratified in RISC-V Profiles Version 1.0, with commit
+            b1d806605f87 ("Updated to ratified state.")
+
         - const: zicbom
           description:
             The standard Zicbom extension for base cache management operations as
@@ -1211,6 +1217,22 @@ allOf:
           not:
             contains:
               const: zilsd
+  # Zic64b mandates 64-byte naturally aligned cache blocks
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zic64b
+      required:
+        - riscv,isa-extensions
+    then:
+      properties:
+        riscv,cbom-block-size:
+          const: 64
+        riscv,cbop-block-size:
+          const: 64
+        riscv,cboz-block-size:
+          const: 64
   # All three Zicbo* extensions require their block size property as there's no
   # default.
   - if:

-- 
2.43.0

