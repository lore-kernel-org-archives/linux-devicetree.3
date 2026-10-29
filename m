Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793279387;
	b=V9tIVgJhWy/EkC24vYd5yO6MOc/SdmQWvhwiw8k1NvW23gyVAu/8/iwwws/lrNh0aWjK
	 nId5VWzLfxUzR3uNDZSnLFD4ku7gp3o1CdA7tOhZtx79yUuAbfQPC65/vjjA4OroCn/Ug
	 87Xw3ZwL/S98CGa5WxVZAAt5CgmeiAdRs0+LrhpQk463uyr3XHH3ZqYyDCv+Y1cK68xDM
	 lLMaS5q7S+AyCVOg2Xp9UuXUKjqSh4I0sMGioCAf/nqtTnNw/dPAXfunDYe+tAlnhc9pp
	 9iMyYoTHT1vgmfsPO2o7iU1ASDOFdkZTF13sO+aRsOwkcsSd+Z31+cajxEsla5CzlsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793279387;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wYJ+1mP65rm03gu3ZTDNgby+9J5TH5hIzFpteU1U8PY=;
	b=qtMqdcGq6UiIL52ZC4Z/v4RDuxO+9oggvEI/uvBA58YgY1VOfVijl5DVDF8RUqjWfWur
	 Sb2TLmQ7jxvef4tPZTOtyJyB8g4D7h42M5l20GwbmqU/78mYaeoMdivysv8qq9NXbG+sM
	 g43lpBEHHinneZInqFhP2EXoVYhVJGBxqfGW+mLVugxQ+Qk89PvpHAyev009Nml1tE/FE
	 rse19p3IDPZI8JgTJdySWNlPvTUxhQeQJqcgWd9yMeeKOpx+mHHoRoLuuKMRNarC1RY0y
	 +V4+ZQlbTju+8djEYys1udVq1eqW/9wwuXK/MVYHGBujA35O/3efjTuZb2BRWbxFR0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="p6/kW6SS";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aSdWyN3Y;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1292A606A321
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 13:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1292A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p6/kW6SS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aSdWyN3Y
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCe7Pr3944017
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 13:09:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wYJ+1mP65rm
	03gu3ZTDNgby+9J5TH5hIzFpteU1U8PY=; b=p6/kW6SSbiy4Oh0c2cki7HvH5sq
	bko1iqCXSSHyFK1WGctUvPXA9GwRNuyqo2AjDleBsX5UwQieQyxkmnhVfgrXcbeD
	/Nj21atD0YgeIy/CBwHdamQYf79wPs1CU9q+m72Q04DoWMNb/nOO+W1+7Kr1Sisx
	OUmYZ1M7ahleo6oVwF1a24UofOMhWA02jgG+jpIp1vs0pPwIJMCCGhWXZ5/gI5Fa
	VxVpU/KJD/lk79A88VyAZukV//k6DlPapvOI397X35V431xu4SDzkGouVuBsjBAx
	hdAs/s5NaMPdLidNsPj4rgoE9dVlD7wL1YJEF2NivjbCoH/f5JUYsD3a8Iw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm42fgm7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 13:09:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3abb4c24125so1994117a91.3
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 06:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793279385; x=1793884185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wYJ+1mP65rm03gu3ZTDNgby+9J5TH5hIzFpteU1U8PY=;
        b=aSdWyN3YYJGY3JCYVfDUxAs+ypXSzGokQ1ednEuclujfpVT4caHXe+5DRsUe0LJafw
         VIJSZNOUxn5mGd4XgYjeL/maPEsSG9b9AHklFQWq4NZ3oY3gGilyP5LqjYoPlwkc+JTg
         r+fbe+tNpKdt8qaWyx1eZFj87WJPDVy+r9lMy2+4b8i0ar2AG59ziQwHkFgYsUA14elF
         OFd3fGfTKUnu+c35edojxRCZoA/pepwNYEVkjQNRLxVHZ/N83sXzZ3xeehqLoLUE4Sgv
         LWIH6mfu7RIrcop1FRWHiQcfK2hTbFORiYleYG4+d1vvccpPFAbjVXRDp3Wz074W60t4
         MJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793279385; x=1793884185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wYJ+1mP65rm03gu3ZTDNgby+9J5TH5hIzFpteU1U8PY=;
        b=h7kIlFyiRd4tk4jbgzvcXMZoAespmCFcCaUtR0FlODzchVvj8ZV2x7rq71mg1JayLB
         fGtRtE0iCtyayby8MUkGAApelQRaH39nailXZo6H7p9ycg+6KabTePRtlV1gs8VX2evd
         PofN63PmqOFFwcdz63T8iExrihMTQbKQekMytV8hqs0WNTDv/ShIE5QJ2JYt3b8Bz62z
         yHnUvxhU20cwy6e3eZQokmiHJicF8D8KjOG1vdn4n5EX1EUcx1h8pdoNOhAql0jYwSBW
         ohTadmKP8SM1udpkesVyiBevr6mS3sNCkFv2YhF/qczHL6oCjcEdiCOK3qikKn9QNMLa
         N/4w==
X-Forwarded-Encrypted: i=1; AKwUvByW39y5FLUmwEbyKhOYE9Z0PgzPJHOVJxHy1EvQRYeJPUeCl6iXZ2NP1CDSLKkcyiONbWSXV/OI/Qu9@vger.kernel.org
X-Gm-Message-State: AFq9FYIwOH+nhatWnHMfbxycqwisNuYlrvCwjwut0zH7XTVzo4OZ952r
	8Ypdq780p3YOiCh7yd54RMDbwJ4ldkHNcDU7GaSsKJKhcrsAZTztpW3l4mcUoMVNxWZxh2U1Uch
	5jWLGonZcOjle38Op+ItJHGYOhfQJ2PfBXS/KxiF9tdbqalSQIy5BfjiwnzbUwL9F
X-Gm-Gg: AYBFou2Rk+13H3CJcHpJAgjeaSxpUvgpGUrVHjiey7k1X2zVfimB4vqwB6Ia4wRaBbW
	jLzfGI1m2toHs1AwzKVeqz8NpdpLLaKoMxVdB+5UROjatxS16aR+/jdKxWJzlKT5qpjXFwAam+j
	pDzvOe23OJmLwiQMOhsV80smuwurFAcZpanYmwvOg+VFwZwicI5BZiYxLbo8Co7JQ1Jl6dLTZPa
	3hZjlvfdjsGt+87fu0mpcW9OBrC7x20eueqyOecrNo9/3YX6yvhAIyRzZcIGyhEVgAettsiJRES
	PvLYIbo5q8s3wks2/4fFMSNw8Lgn/aIji9iN5MiJOMF0985ub8RvOtva5NsYORXcQcF011eRbQE
	39X8ANtkXhfpOz+/n5OZkJE3vsnk5PSC3qefADIRaD9NTxSIhkX1OTzlHsn+zyAy3HdxuiTi3w0
	YZV1XvwpOa2bwcltDgXW5GpquJN4SZ0uEDq0wJj7gi2qjtLpMjLXxE6T3BhsJ+9BiQYpFnJlWiX
	A==
X-Received: by 2002:a17:90b:4ac3:b0:3a4:b0a1:c7ed with SMTP id 98e67ed59e1d1-3ae580a9d51mr4661273a91.13.1793279384693;
        Thu, 29 Oct 2026 06:09:44 -0700 (PDT)
X-Received: by 2002:a17:90b:4ac3:b0:3a4:b0a1:c7ed with SMTP id 98e67ed59e1d1-3ae580a9d51mr4661254a91.13.1793279384272;
        Thu, 29 Oct 2026 06:09:44 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3ae6e973ac6sm4598145a91.11.2026.10.29.06.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:09:43 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Anup Patel <anup@brainfault.org>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>,
        Deepak Gupta <debug@rivosinc.com>,
        =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Atish Patra <atishp@rivosinc.com>, Xu Lu <luxu.kernel@bytedance.com>,
        Hui Wang <hui.wang@canonical.com>,
        Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>,
        Sergey Matyukevich <geomatsi@gmail.com>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: [RFC PATCH v2 2/4] riscv: Add detection for Sspesa and Ssplcofi extensions
Date: Thu, 29 Oct 2026 18:39:11 +0530
Message-ID: <20261029130917.3714691-3-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029130917.3714691-1-mayuresh.chitale@oss.qualcomm.com>
References: <20261029130917.3714691-1-mayuresh.chitale@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1MSBTYWx0ZWRfX93p4qF/T7/2w
 rHSkO/hSElA1pfT6EKs0xRapCo03FDPEkn67eiSMjH5ESNYz3n2NLZolKU4MlzsueVjt14+Qp4Z
 yMU8h8Xdk9C6XslhTvSX8maX6TJ7zcEai6IuewRKkVOKRIXWXztVod4ukNyC+nz5YKPqtNguSLu
 Mu2uTudR16DnAkTJYmRsw108DAFYpg+sxlLnMZtqdffVgG8itwRQhwhQ9pBOPDUh9oHygFT/FeB
 67gdLKJtdsSEnqVd64baMKquyperxpsE6Ah2ReAMW1+ildcYDtjUxoI4IxMcptbj6EKYFe5x82C
 5VoYHtBBNiEMBwriWDOjTvzaZD+ZZfOWpRqbiB/WaCtR6gyzbw2456kTjR7dqkam1ZZvX2ZZMkv
 4cv76hbluSZfGa6A63+QqjiENjS0yvIpQN9clnX/nkcLgvUMFQHAwV+hNGSgUeHHUN6FHBn2mVp
 vDx06WZh+K+AJbImAhg==
X-Proofpoint-GUID: 4ZdiDtwAj_M3iqT0ZXLym3XlW_C2ffFt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1MSBTYWx0ZWRfX9O2yL9UsO8Ux
 76zGEhTDVdTRU6U63QneonZH1a8hvDrQ9gNrmeVWZ0jAIwrK3M/FcSCVTsN7pXMvPiKd+YkPrQ5
 gFw+sJKVGG0YoAnXKfxjFZjeYRLP5N8=
X-Authority-Analysis: v=2.4 cv=UN9Ijyfy c=1 sm=1 tr=0 ts=6ae34599 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=FU1YQ2pZR7vT3BSyOn4A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 4ZdiDtwAj_M3iqT0ZXLym3XlW_C2ffFt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290051

Add ISA extension detection for the RISC-V Performance Event Sampling
extensions Sspesa (Precise Event Sample Attribution) and Ssplcofi
(Precise Local Counter Overflow Interrupt).

Ssplcofi requires Sspesa, so validate that Sspesa is present before
enabling Ssplcofi.

Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 621f84d1898f..220d1dfab89e 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -350,6 +350,18 @@
 
 #define CSR_SCOUNTOVF		0xda0
 
+/* Temporary addresses for Sspesa (Precise Event Sample Attribution) CSRs. */
+#define CSR_SHPMSPC		0x5d0
+#define CSR_SHPMSDATA		0x5d1
+
+/* shpmsdata fields */
+#define SHPMSDATA_CNTRID	GENMASK(4, 0)
+#define SHPMSDATA_MODE		GENMASK(6, 5)
+#define SHPMSDATA_V		BIT(7)
+#define SHPMSDATA_METADATA_SHIFT	8
+#define SHPMSDATA_MODE_U	0
+#define SHPMSDATA_MODE_S	1
+
 #define CSR_SSTATUS		0x100
 #define CSR_SIE			0x104
 #define CSR_STVEC		0x105
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index f8db798b2654..030a946c73ef 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -122,6 +122,8 @@
 #define RISCV_ISA_EXT_ZICCAMOA		113
 #define RISCV_ISA_EXT_ZICCIF		114
 #define RISCV_ISA_EXT_ZA64RS		115
+#define RISCV_ISA_EXT_SSPESA		116
+#define RISCV_ISA_EXT_SSPLCOFI		117
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 7329792978cc..46405bf2dfea 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -287,6 +287,24 @@ static int riscv_ext_zvfbfwma_validate(const struct riscv_isa_ext_data *data,
 	return -EPROBE_DEFER;
 }
 
+static int riscv_ext_sspesa_validate(const struct riscv_isa_ext_data *data,
+				     const unsigned long *isa_bitmap)
+{
+	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_SSCOFPMF))
+		return 0;
+
+	return -EPROBE_DEFER;
+}
+
+static int riscv_ext_ssplcofi_validate(const struct riscv_isa_ext_data *data,
+				       const unsigned long *isa_bitmap)
+{
+	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_SSPESA))
+		return 0;
+
+	return -EPROBE_DEFER;
+}
+
 static int riscv_ext_svadu_validate(const struct riscv_isa_ext_data *data,
 				    const unsigned long *isa_bitmap)
 {
@@ -631,6 +649,9 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sscsrind, RISCV_ISA_EXT_SSCSRIND),
 	__RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_xlinuxenvcfg_exts),
+	__RISCV_ISA_EXT_DATA_VALIDATE(sspesa, RISCV_ISA_EXT_SSPESA, riscv_ext_sspesa_validate),
+	__RISCV_ISA_EXT_DATA_VALIDATE(ssplcofi, RISCV_ISA_EXT_SSPLCOFI,
+				      riscv_ext_ssplcofi_validate),
 	__RISCV_ISA_EXT_DATA(ssqosid, RISCV_ISA_EXT_SSQOSID),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA(svade, RISCV_ISA_EXT_SVADE),
