Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB64C45C6F6
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 23:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786577730; cv=none; b=apMPXTx4kDcJCbDk5okO0PWi4OFkydxlWpzPjjcQGEQ45w4AvAmuZApN+v3NbDu5wuHAXiDvxqsw/wikBbRhuBWUqDPxwQwfApZAEbW73rNEqQ8YU79mfrCo88dPJhop8O6viTRXFNF5nhJoWVToWDeWbc36/yIo3FyBFiNcQSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786577730; c=relaxed/simple;
	bh=y/Jwz6FngiD2np/hHF70//LNLqWrEaqCls36uVe595s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V6ylf82S26qAeRjcGZiSgRVdeny8dsN/gmmdpyHHkU8me4wxTmSRB0UANWTkVtqTQRN8ziuWgzjSszZMXxc5yZis7kZkHL/sKg6BqUheZ4QDVsH7kyA4zajJpmdagklaRUTBKikzztNbM66J+Wan1jzxj/R5jzMZ35ninDCUwu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lu/ecR2t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NjYfxgV0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lu/ecR2t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NjYfxgV0"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CNLWYK723466
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 23:35:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l+QKQ6AR1ad5oWQF1qcyBu89GPxfEiK2nPeWrXANXmw=; b=Lu/ecR2tRoKUnVui
	rNr4gsg3snH2hrB+t5TLDUas+iR5znPABm9uCvDcPIBw/KC/gEsdJOpw3E19Ca1t
	lcSAXqoS5RAxrPQUETNJjyCX9AxM+VQZWmfxFEyN2jMMmVyOCZrKAxApeV0mZlx7
	Tr4aNWu9JbChce0jfsfaJ6t5A91IET+f1DuLJyfmZ5XkeV80849yTkN2HOihi76q
	ge1A2mlWvgJWaMFubt2tKnSgnsncISTpYBmDJgQaO4qJ1T2sUE0eCOc5TJDnGT3x
	OawWXW6/e/Tm9CgY9OnTnqWKifNKUpIXE0DNvdM3qMIbX1NrYoNejzxmOpIldIqS
	nKBmTw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0pmyuawu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 23:35:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cceabd70f5so40328885ad.1
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 16:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786577727; x=1787182527; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l+QKQ6AR1ad5oWQF1qcyBu89GPxfEiK2nPeWrXANXmw=;
        b=NjYfxgV0vvFTLz8jMD+91C5aY12AJbK2qgpPo4XQKZ35/i2VV0aAU03RGXZPVUTLLF
         NkWHz3+Pu8yQ0jKPI3L2sjEOg3w8imz/yHQPdLOQjFoks7aJEYOEw0G1NjLPbnYNisir
         aHuXb99XPRX1Ktynq6YollotXNZ1TWcqlsw4I9mijGldliXDk+dVq06xzW/xbrdkthPI
         oWaFr3ZvN27TFwmdYOTNDBPKGdIS9RitLBBoz3PbUqmsO0rC/vZgz70+X/kU9oIVje9u
         GdOIYDn9+xciKF6kMiopZvW6Zjbh9+h5LG36dBCoEz9VU1Wk3zEwZwt+yHwaDp2NLOqU
         WV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786577727; x=1787182527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l+QKQ6AR1ad5oWQF1qcyBu89GPxfEiK2nPeWrXANXmw=;
        b=EriRQOqhbe9dq4tXFBsjwt8CQ+T8+FKL61b68hX8L02YaxD0l4if8ZvhycC5GCXzYi
         kfL31FjQ9VB4tSqxGB/H1KbsfSeS49uM6c9AVzolVOsN/gsFilN7MAH80X6hs13muqUR
         k3adZMoHN1yHDuzva4H4GmKf0upISx+tUq/gtrjWURj7DI8UepRr3ztuOmcZod/UfVer
         Ye4SOd0gvhrXJP8SKMfntVQ7OE0rO1YH2W0sq/CBXNev76/GXpZQ8sVEjAkJK4EL0xUx
         Tm6cjn643Nap85WBn4ef2gfVAM7zJYzM+15ry/rnBXG1bsh8dOvpJxIfoU1OrWetyuSx
         MPRg==
X-Forwarded-Encrypted: i=1; AHgh+RoNirvlVRsXPwzkqht35kyVTV1mXVUWzAMJzFF99E2LLEG96YvjxY8D/CJfoob4MMduneSQ21sueKas@vger.kernel.org
X-Gm-Message-State: AOJu0YzcoZI9p37/kLsOtO4cv2MRujeYYAT569bQqteDGiSVhXzdvhAn
	pvkvcahbR9H9mQ7QG3dPrMIPLOHt3b5yLw6lKWyt6wCrjXEFECXmRvju1KxqoQC7nugy63H21KM
	02jWdDrwby28oHYEdd1HxqX1vLW7j0WydZJd6tk/yN6eC1OSmFufdtGgHxbIKDDKC
X-Gm-Gg: AR+sD11JYmBf7Tos3cSOtYXkOLLFzOqDxmGfC2wp075UmDYgbNCdy2UD8NeLJwyxXPP
	NIuy5I3/5oek+ZHYxkJmyGdi2Z2MYlWMX6mlhXlYjBDCd0SF4KIlE5qupKkcUH+wREV2uXOEEh1
	di62XIz+YNPAw9Vb/sDk+CxE+EaA59KN8ijurcW6P9vmmMOb/nCWctESOPoSIH60/9yF9dv3zdi
	wYt3tYTRWd32SKMURQXd8UHxuurSeXeyUVY9GyHN0ITsPC9lKWPWGZXla6VWFUxCy1MJDRYPeTp
	8Gb2+kzT0qi73SWL+D9f8KghZWpWHcSKsIWUnIeQ1QnT598MnX4e0FwvzZCPBg==
X-Received: by 2002:a17:903:1b46:b0:2ca:d91d:d3a7 with SMTP id d9443c01a7336-2d37d884e0bmr18080685ad.10.1786577727467;
        Wed, 12 Aug 2026 16:35:27 -0700 (PDT)
X-Received: by 2002:a17:903:1b46:b0:2ca:d91d:d3a7 with SMTP id d9443c01a7336-2d37d884e0bmr18080215ad.10.1786577727034;
        Wed, 12 Aug 2026 16:35:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c26d0fbsm2136805ad.37.2026.08.12.16.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 16:35:26 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 19:33:50 -0400
Subject: [PATCH v6 04/11] riscv: Add Zic64b to cpufeature and hwprobe
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-rva23u64-hwprobe-v2-v6-4-c985af3256b8@oss.qualcomm.com>
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
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Qingwei Hu <qingwei.hu@bytedance.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5790;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=VLbBTWJCKZUIMQKhsVDcXNJs8R0yLJYIEevi+ZPuabY=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqxaZpEt9euvBqx2PaN+K1ff/bWVn+W3qdO3c64/ujs1m
 XeJwiPFjlIWBjEuBlkxRZbDR1uyt77yifZ9zvkDZg4rE8gQBi5OAZiI9T2GP7x7358L12+y0d6e
 KL3yw9Ts6gWchaYzrgXP0A5y6UpctoDhf86Bkrmu1pVW+XWeP5uyeNKDhSYr/nrwvdCp6dmRHZN
 YWQE=
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfX+YR9IT9Ho4wN
 DEP2XaTg7FT9gi7W/IaOsEOf8tkIVeMqG+zKuJV0vUZLKUIOzgk70jgQIppHaIYAzYjqryyiScy
 FkQA1WMzq9TLbyyaHOmbN0z+RHxe4VU=
X-Proofpoint-ORIG-GUID: tLPVDqReeJWD-oczc8_i5Fd-qg9hM6wz
X-Authority-Analysis: v=2.4 cv=C/fZDwP+ c=1 sm=1 tr=0 ts=6a7d0340 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=HwFc7jivAAAA:8
 a=968KyxNXAAAA:8 a=EUspDBNiAAAA:8 a=XYAwZIGsAAAA:8 a=fFnMLytXjIv02VNa_WYA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=kr7TZk85JJIQSqC0cl8G:22
 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-GUID: tLPVDqReeJWD-oczc8_i5Fd-qg9hM6wz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfX8K7wi+knuUsg
 KPtvkpdqK3ZDltg5PbofnLgfwth7wZVroEX79xEu5uSfELz6T+t//owY6FXawSnfp5kUsgfHQHa
 3cUnH1CDgtKWYyqv1rk+XkHZI0H3hH+GOPDKr+2JfA7n3LMc9MxVDmbHF1T/J/y7y1qJJDTjZ3G
 FfL/P7hFsIyGf/sIZybso/tAHA6X6d2darQHTTc3jANp8cDGwmV8uK1Tjp0RGvc1Enkmd+FFpRT
 8eJ5abJKwYPiAoBRYBkCqYZJvACpCMQzQHpdxMzAcYJK5aDPN0cOrPwtuCtF24/j8LLTU7yEAK6
 DdwzEA2XjOpXVYLf1wbNO4MmxwPaFHD3MrGE7N7eb73z7UOcTc4P3OXY75sqZ1TbX8362UCvsrE
 peBm38SMpOVJ4MBtWwf1ddFeqGu0rEevjcqC99VZNpHaYulHDipUPBgMrhYPTeU5Rnn92hCghHf
 5nKoe0Pt+w87QZqliRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120190

From: Qingwei Hu <qingwei.hu@bytedance.com>

Zic64b mandates 64-byte naturally aligned cache blocks and is a
mandatory extension of the RVA22 and RVA23 profiles.  Allocate a
RISCV_ISA_EXT_ZIC64B id, parse "zic64b" from the ISA string with a
validate callback that requires each cbom/cbop/cboz cache block size to
be 64 bytes when it is present, and export it through hwprobe.

Link: https://lists.riscv.org/g/tech-unprivileged/topic/question_about_zic64b_and/119631059
Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
Co-developed-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v6: Rebase onto riscv/for-next: RISCV_ISA_EXT_ZIC64B renumbered 110
    to 116; RISCV_HWPROBE_EXT_ZIC64B now uses the _BITULL() style of
    commit 8da45c93dfa9.
v5:
- Collected Reviewed-by from Andrew Jones and Conor Dooley.
v4:
- Credit Qingwei Hu's earlier Zic64b cpufeature patch: set him as
  author, with Co-developed-by (Guodong Xu).
- Validate only the cbom/cbop/cboz block sizes that are present; Zic64b
  does not imply the CMO extensions (Conor, Qingwei, Greg).
- Add a Link: to Greg's confirmation on the tech-unprivileged list.
- Add the missing blank line before the ZIC64B hwprobe.rst entry
  (Andrew).
- Did not carry Andrew Jones's v3 Reviewed-by: the validation was
  rewritten (present block sizes only) and the patch is now authored by
  Qingwei, so it warrants a fresh review.
v3: New patch.
---
 Documentation/arch/riscv/hwprobe.rst  |  4 ++++
 arch/riscv/include/asm/hwcap.h        |  1 +
 arch/riscv/include/uapi/asm/hwprobe.h |  1 +
 arch/riscv/kernel/cpufeature.c        | 19 +++++++++++++++++++
 arch/riscv/kernel/sys_hwprobe.c       |  1 +
 5 files changed, 26 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index fc68dea397aa..32a14331eb9d 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -425,3 +425,7 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_B`: The B extension is supported, as defined
     in version 1.0 of the Bit-Manipulation ISA extensions, and implies the
     presence of the Zba, Zbb, and Zbs sub-extensions.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZIC64B`: The Zic64b extension is supported,
+    as defined in the RISC-V Profiles specification starting from commit
+    b1d80660 ("Updated to ratified state.")
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 6a693210b251..b103aaeafa47 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -123,6 +123,7 @@
 #define RISCV_ISA_EXT_ZICCAMOA		113
 #define RISCV_ISA_EXT_ZICCIF		114
 #define RISCV_ISA_EXT_ZA64RS		115
+#define RISCV_ISA_EXT_ZIC64B		116
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 9323feb7c3c8..9a121ee3b436 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -123,6 +123,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZICCRSE	_BITULL(4)
 #define		RISCV_HWPROBE_EXT_ZA64RS	_BITULL(5)
 #define		RISCV_HWPROBE_EXT_B		_BITULL(6)
+#define		RISCV_HWPROBE_EXT_ZIC64B	_BITULL(7)
 
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 7f615d1a175b..de7cff5f48c3 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -136,6 +136,24 @@ static int riscv_ext_zicbop_validate(const struct riscv_isa_ext_data *data,
 	return 0;
 }
 
+static int riscv_ext_zic64b_validate(const struct riscv_isa_ext_data *data,
+				     const unsigned long *isa_bitmap)
+{
+	/*
+	 * Zic64b mandates 64-byte naturally aligned cache blocks; cross-check the
+	 * cbom/cbop/cboz block-size (when declared) device-tree properties to
+	 * avoid inconsistency.
+	 */
+	if ((riscv_cbom_block_size && riscv_cbom_block_size != 64) ||
+	    (riscv_cbop_block_size && riscv_cbop_block_size != 64) ||
+	    (riscv_cboz_block_size && riscv_cboz_block_size != 64)) {
+		pr_err("Zic64b detected in ISA string, disabling as a CBO block size is not 64 bytes\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int riscv_ext_f_validate(const struct riscv_isa_ext_data *data,
 				const unsigned long *isa_bitmap)
 {
@@ -529,6 +547,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_V, riscv_v_exts,
 					  riscv_ext_vector_float_validate),
 	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_H),
+	__RISCV_ISA_EXT_DATA_VALIDATE(zic64b, RISCV_ISA_EXT_ZIC64B, riscv_ext_zic64b_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 12ea4f39a838..656cb100ac48 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -208,6 +208,7 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 		EXT_KEY(isainfo->isa, ZICCRSE, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZA64RS, pair->value, missing);
 		EXT_KEY(isainfo->isa, B, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZIC64B, pair->value, missing);
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */

-- 
2.43.0

