Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616D73D1CC1
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 14:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782226360; cv=none; b=rLneGpZSPTFNix09qcnuPl9LYCpb6T+rXDo3y59sm58e3rTw9X3q7TWz9jVWap51tRsWz6oxMn3VCudZhgCmSm2DyinGRiT06Ago5LyGFgYYL18rzOnX/EyH0UaK5cnFDR8RpZZW6kGXFS1BaoURSH2+ie03mgq0qiFRVYoY2m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782226360; c=relaxed/simple;
	bh=zDre3UYfu+bNvtbqlWeBmCxN1oWAuVcva06ty0WiJv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qeuSrsCesZuLWWyZ5DWeI2DxxCr9Crkmw1vaty96zOtwtMLCFj1nXyhSb0CfAimVPHcNRWJZMfPjPVvcWhjlRcFABkR1x8J1SR9S0qPwguTVT8gp0SAYJJBf8+2hwEEJfRKYO14fAoPOTvked+yOHIMTzeI/R9EgRfoovTZc4lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kwa28SvQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PaYpvCYY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kwa28SvQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PaYpvCYY"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZgUF4052508
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 14:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RJVm2brt1ck
	UIcHVwLv3uY92h4oMIvtxcJLYHJJ2Evg=; b=kwa28SvQrt3egBJ2d+tL9tOcFn5
	sIkZ2yhrfYBfbXSV4hdd9WJ7B6C/1ue1mD7MLD5hxaEolvu2Fg+a8GHgBX3kzRwe
	Hzvq7lNaNWrZjqYeA4LH+HxXrtod0Zl4i4hVlbuRDgTiVVhxy86pc1lhXi2SWmLq
	sYLfn0tgDIFR3URLK4IGxBpAKLNLBnYPEhePIQ5RjnMCZKAsQbKtJ8OhNrH6gt3y
	XjIEAbD2ER6nhyE7L1j3O3v6BSrI72Dq1MgPqz9p1Bf+Jt+7X74om9rY+BFueWPg
	8PJbIsYuuQUQiQJKZatYZ8alYE+Qqm5bzYcc7JdR8mteEzQw+HL5erE61eg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr9ys38y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 14:52:34 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6c40601e2b2so6787617137.3
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 07:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782226354; x=1782831154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJVm2brt1ckUIcHVwLv3uY92h4oMIvtxcJLYHJJ2Evg=;
        b=PaYpvCYYllwvnLPxaH83pzrNx3mTnqvdkgLMxT+Hi+AGv1jILQVSjeTDjQUtpnw01g
         nasktD+wcb9HZnIro+YwBTXN29TP+0CLBjIgXjh8yc/AkP6tneh3M3uhEDaLFLszPL8A
         bH2jR1gEqmWuNTZ35UC7jhcdAjJEq32Ml4CLvjNcRMBN2cyK9EQMzW0bwoiCkLOO8XzN
         MBDqfEdkBHvHAxzJwlRoGUD8R7pGk7wETFPQh1RWy3aI37o5zIZdPwOYVSpoMl5Socqo
         NHPWC6mlyQpSqrTvvgiW2+YkHlVXUE65U+Pu2jkbKQS/KW0xdHtUZtC7cf+xugdhJTzk
         NYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782226354; x=1782831154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RJVm2brt1ckUIcHVwLv3uY92h4oMIvtxcJLYHJJ2Evg=;
        b=lnHjTK5eKf/6rioINgMJGWcj2EmA4n5+rREEGqghpqqr7CRWcliz+Efza1hJ/Gd99X
         ywYSDNMxxpTGdsq1oV0hJdQtaG4aFEFebAp/oc2GXNKjZIHTGCtj7BcJLpFNmhjjBaVE
         0jF+JT9FNkv12G71cy4JzIhY6JsoBO7aXeH1rdKA4pMzR5b9XC5RJRAfwQPklfClSGgo
         OW87/aONnSbUjKOCpwc6Wq7vwm9z/PiNQyIJIHYpbthjx5zs557RWv5KplXJwdG5BLHZ
         PPEhg43kRTbs/LWE7Xof7p2lQv55bMIfVMZcKkDcmxgihCXPcrBvGzJhuYc2zkVaTSh2
         Ss2A==
X-Forwarded-Encrypted: i=1; AFNElJ++fzZBL2CL7xnTR/O0/3iQD9rcu4D/Z3I0LwVomSLmWKQEjKJ/T9tfSbuZfvwgvPH3DNoDn+MpyMKh@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0EyhpK3xSetH0Movif+L/lNJWOIB8rKuaIIIvzjHV/7HnmDUj
	MXcwaamQWm1+fJMhGwyDxNtVNA9R8RiwTrOxFfaEvKvOJDaPphpejthfMBD93drG+YpZVrwISoz
	arDNdZrbeGFpD99dMioZCBU1NCFI5404lehoukrHSX6PB2uBansy4sK4AkORb/n31
X-Gm-Gg: AfdE7cnJNgQshFEj3jza1BFpEOo5mQSeufF9zPX0bSBucFNuLMPSbT/D/0bejatE8wU
	mEw1nMR87/dsdi6c1x5Ap4Q4C0GVkKGbuQHZZMIgKPCEdKPd5I2aXukFRR0DRUoPEUSn7s2rJ6T
	8GqpZ4/oixCGyleWujbkLxJeMgL6Sxq4hGPErFEgnlp36/LyXNm/64wux0fjostAR37TKKZOSM0
	N0CyCpEaGICtNKEmXXF0wuF/To6ZmXB0iSohJqTaf4De2GBy0ykx8pVupQUmbxT93Q0L+9HQ9l9
	8+z4iUXg/tRGP+xfaJOX48r4eIgXUbE5Q8MXkfZX7+PKSsGfpubq4Eu8dEs+D5VP/d/wvsFIzH2
	dMOPpg+7zLlmxJ0T4P+f+1PysQgr9sLB1zN5wJxY32lRi8xlDDpMhyq0wjf8vZL2msFQoU8qGdN
	fJVNxOL1Onc2Mxnl9WPAWj7bePIA==
X-Received: by 2002:a05:6102:6a81:b0:6c6:432c:84d3 with SMTP id ada2fe7eead31-72fd5ea52b7mr1890216137.12.1782226353677;
        Tue, 23 Jun 2026 07:52:33 -0700 (PDT)
X-Received: by 2002:a05:6102:6a81:b0:6c6:432c:84d3 with SMTP id ada2fe7eead31-72fd5ea52b7mr1890185137.12.1782226353222;
        Tue, 23 Jun 2026 07:52:33 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60aca46csm534042666b.36.2026.06.23.07.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:52:31 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: [RFC 03/12] arm64: acpi: add acpi=hybrid support
Date: Tue, 23 Jun 2026 16:52:16 +0200
Message-ID: <20260623145225.143218-4-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623145225.143218-1-johannes.goede@oss.qualcomm.com>
References: <20260623145225.143218-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JYSMa0KV c=1 sm=1 tr=0 ts=6a3a9db2 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=ZBzCgZ0olsrJ8aaC5scA:9
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: j_k7ag8lC_NHj1ZXnSNeKz8r9iJwu8Pa
X-Proofpoint-ORIG-GUID: j_k7ag8lC_NHj1ZXnSNeKz8r9iJwu8Pa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfX7bBXXFa/aVgo
 W3jVXneqA1IIgqEZaiDnAuVB7m2j5e2i36o6xqqXm1LXH5iNKtmhMWHo1Jbnnv65C6wXdHupGhC
 jjD7J8sdpm/asbxFsSPsP5DV2h8fSuvqoSe/GeL7G28ZaZP9DR4TqXPVbTImrSxrGl5E6cCix+W
 XYQHUL573zzdjNiK5J6Cht2H3rhzbmEugiYyKnISUpQge4hHBrDoK+QfBnXop02x7wyzzGPXyas
 nnYcJreH7JPhjHA2Jt8gqYlHypOHNWLi5nfLrBHZ0e8hibsQIi7laRfjSjLU8gLWTpEj0DLDoXo
 v8OUa14YeI6h9v9WvRkgM2P3VB2Yw0qgK8gNkRXI11kSl8hjXGw8QYA7y8XeDPdsAa6DqBqn6F6
 gPnqMHi68tnnfL8NBtSryZaGjZkWBPRJiBcCb3TPOHwuLtQuf9rJu25FD5rz3C4kA1dla+jIM/x
 pZZdZIA1ht7xrAZYf/w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfX3muHfMZFjOaJ
 FtfC7MZj1uZME7QszLJZNWD8NkJO6nMCleoOd0EmZW+5eAar4dZSzZUIeSj4MQvS3G5bpMAw3gr
 DilKyCjPRmu0emlaEs371lY34gkCo1I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230122

By default when a non stub DT is given to the kernel when booting, ACPI
gets fully disabled.

Add support for selecting a new APCI-DT hybrid mode where the kernel
booting in DT mode still loads and parses the ACPI tables, without taking
any further actions like creating devices.

This will parse ACPI tables and populate /sys/firmware/acpi and
/sys/bus/acpi/devices, which can be useful to e.g. get an acpidump .

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 arch/arm64/include/asm/acpi.h |  2 +-
 arch/arm64/kernel/acpi.c      | 16 ++++++++++++----
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/acpi.h b/arch/arm64/include/asm/acpi.h
index 3116bb872f47..8f8a0b9e49c3 100644
--- a/arch/arm64/include/asm/acpi.h
+++ b/arch/arm64/include/asm/acpi.h
@@ -76,10 +76,10 @@ typedef u64 phys_cpuid_t;
 #define PHYS_CPUID_INVALID INVALID_HWID
 
 #define acpi_strict 1	/* No out-of-spec workarounds on ARM64 */
-#define acpi_dt_hybrid 0	/* No DT-ACPI hybrid mode on ARM64 */
 extern int acpi_disabled;
 extern int acpi_noirq;
 extern int acpi_pci_disabled;
+extern int acpi_dt_hybrid;
 
 static inline void disable_acpi(void)
 {
diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
index 06ab3a9da64b..9d2c42375afe 100644
--- a/arch/arm64/kernel/acpi.c
+++ b/arch/arm64/kernel/acpi.c
@@ -43,11 +43,14 @@ EXPORT_SYMBOL(acpi_disabled);
 int acpi_pci_disabled = 1;	/* skip ACPI PCI scan and IRQ initialization */
 EXPORT_SYMBOL(acpi_pci_disabled);
 
+int acpi_dt_hybrid;		/* disable ACPI-DT hybrid mode */
+
 enum acpi_mode_t {
 	acpi_mode_unset,
 	acpi_mode_off,
 	acpi_mode_on,
 	acpi_mode_force,
+	acpi_mode_hybrid,
 };
 
 static enum acpi_mode_t param_acpi_mode __initdata;
@@ -65,6 +68,8 @@ static int __init parse_acpi(char *arg)
 		param_acpi_mode = acpi_mode_on;
 	else if (strcmp(arg, "force") == 0) /* force ACPI to be enabled */
 		param_acpi_mode = acpi_mode_force;
+	else if (strcmp(arg, "hybrid") == 0) /* ACPI-DT hybrid mode */
+		param_acpi_mode = acpi_mode_hybrid;
 	else if (strcmp(arg, "nospcr") == 0) /* disable SPCR as default console */
 		param_acpi_nospcr = true;
 	else
@@ -203,7 +208,7 @@ static int __init acpi_fadt_sanity_check(void)
 void __init acpi_boot_table_init(void)
 {
 	/*
-	 * When no ACPI mode (acpi=off|on|force) has been specified,
+	 * When no ACPI mode (acpi=off|on|force|hybrid) has been specified,
 	 * enable ACPI if the device tree is empty (it only has a /chosen
 	 * node, and a /hypervisor node when running on Xen).
 	 */
@@ -230,6 +235,9 @@ void __init acpi_boot_table_init(void)
 		pr_err("Failed to init ACPI tables\n");
 		if (param_acpi_mode != acpi_mode_force)
 			disable_acpi();
+	} else if (param_acpi_mode == acpi_mode_hybrid) {
+		acpi_dt_hybrid = 1;
+		disable_acpi();
 	}
 
 done:
@@ -257,10 +265,10 @@ void __init acpi_boot_table_init(void)
 		 */
 		acpi_parse_spcr(earlycon_acpi_spcr_enable,
 			!param_acpi_nospcr);
-
-		if (IS_ENABLED(CONFIG_ACPI_BGRT))
-			acpi_table_parse(ACPI_SIG_BGRT, acpi_parse_bgrt);
 	}
+
+	if ((!acpi_disabled || acpi_dt_hybrid) && IS_ENABLED(CONFIG_ACPI_BGRT))
+		acpi_table_parse(ACPI_SIG_BGRT, acpi_parse_bgrt);
 }
 
 static pgprot_t __acpi_get_writethrough_mem_attribute(void)
-- 
2.54.0

