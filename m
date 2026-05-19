Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867923AFD0A
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 17:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779210953; cv=none; b=rJAqZv99AvQYtTuNrGG0flvUyyn/yYNvN8TwRSYSRovZN5o4Vv8Aact++BbHdc50Y0nVn49TS7EF9kosqh13CdyA3KW9ShFUQG1VUJRb0zCdFEL5msGdKwt9vdYokvyVZzvNIQseHNhTNUIEQUGGBvsiLzF5jgS+d/Uudmnxsvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779210953; c=relaxed/simple;
	bh=KI+58/ONAYxQ6op8vnR01ldyxV8090Z36iFsslPUisM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EAXRBBvjhvDQxdOvhRT+wcX/LzGRUXSsNxLPDLHFkhUQ8R2RUjjg+bpRYVjf3E/WyAq5duA8DRZKO/OjtIySZDhLQ5MdJuN1Jtauhwupr8DLxORiuG8xJGT0wJfeE2xrfIZEkH0EkoilJay3CBe81JKui7mqW953+3qIHMbuecY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yg9oOiyi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kSjcuV93; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yg9oOiyi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kSjcuV93"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JEwgFC1739573
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 17:15:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lfKVHCmUtRu
	10BDgmOnebTByINr9r0sGsNkJtT8G/r4=; b=Yg9oOiyi+y5eLhnGUIJI5a4hY7T
	c4+gZWxznsB8Vf74Pyr0+59E922Ee4i+f7zqu3HiYK56EXU3DRVpTueDlRs/8tim
	c8pnDDshlnTfPis/zXQlyYMZ42R9r4rua1v1g1ljX3h8UzN2BknabuQkWdg5ZReC
	97FDoxX0UcEK4zQCG80pfs5vyGKpmHVbrKV/L6+laccCExqPkCe2K4ltiz+1JPsf
	f+K1eBSq9D/aJDmhBrLWzv+i68pxHmwee3l1idTou4NWzcAF3sZ2DmNlM+CmVe+W
	xiJxVKJ04lMN/Zd+Qtj6MnmeUzWRIaIVlzGlBgV7MB7rBR5J+jxiUeypYtw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3q8nc0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 17:15:50 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f6b984b3aso1985916b3a.3
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779210949; x=1779815749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lfKVHCmUtRu10BDgmOnebTByINr9r0sGsNkJtT8G/r4=;
        b=kSjcuV93WQqxfDLWCQsMaJVcTjM35jocDwqRHeEnnCRgB0PMCj24GbQX2dEvFFraKj
         4XxBiBgBiJj2FInZ4pu0vnacMIMKevGNcDxz5vGs7UETQNcFnFc1xANPPleSWfJVgEdX
         ZB/YkxlKBaLZfU1hDhiFkKhu+A+DeYK+0nomgghLz2DV9N/pTvNSrZ4cG0CdObj0dDQa
         HgHNDc7WJh1kXzWK+oYjndPjkHHVzzNgD8XKFgCLenDq9brspYAvYtlIO6yNfr2LBjiH
         CehRqHypJf8G44UfbycsFGQc4YsKXLIXxI++V8+rZH7w8hrF+M2nfDvatkQrPNvfWqE+
         AfSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779210949; x=1779815749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lfKVHCmUtRu10BDgmOnebTByINr9r0sGsNkJtT8G/r4=;
        b=ILaVn3H1JqnFS+eYQHAyyeY5tTABbmPZ+WSBdA5OAQRxN1s350KlacsTCKCpMGHCLI
         60qDC7YQBCsCABwfwrFiJvRi+juk/dfv5lcMz24BkAXA/fwPvhkjg56+Bz5oXgwAogaW
         FEtNm2sBWgDf4Q4TEg2BxcMZoEh7ne/yDk391c0RmwoJ/9kLOGh8jHupRQR4TEQIxm7R
         SBka0DnxbH38C0aA09mzfkZtSEjkpOCK7zuhF9v64YHNdUGWqW4FhaTDCwqaTH3tEhp3
         wsK4VsI4TLa8cDkbVp5krGQaxLx8rCYHt07d7PafRjjGSGbqpMi2IQ+WsRgTs6idGIn3
         nu9A==
X-Forwarded-Encrypted: i=1; AFNElJ+6UJf1xP9kBpHUtxl6ntsCbhkyBDc/8tnsrhpt2DF5khDx4UfkzzEc1z2YvKUBG911NOMqsDirh6G7@vger.kernel.org
X-Gm-Message-State: AOJu0YzjuJzi5eHWUtMa8YDrNrg9csvsH/RVj3+6yyjMWBy8F8WcoTJS
	TjGFtxMqsZF8xid26NZ+qZH7cynPKgoaWRHTrjVyWXUeNPbQD9T3GfNT9ZmBYTvR7aXNhgaz0kT
	gOkdfve3UaEZJEvT4WDbR+icEv5QWcCl0amYG0dRIMwyHIm9OYk9I/oNaFyzwHGNy
X-Gm-Gg: Acq92OHQL9PorPaBZPKWTHQSiYHUVHy+nOsQNGPRKriLYT6VQEn2n4Ca5fKJfxdugqg
	Q6RZYpVOUsdda+xYPj8jSXbdegF3rMNqYpjt6FZ/5kEnbXJZTqyWd5iamgjjhrx0mPBcq7WbHJI
	gffQqNh0nJ1kdxLWPNh2wb4Ao9Uo1xDAtCCFPZ1T45xXpHfe7ohrFpHSGxwN9jHEsLFr1/u4W3t
	/kO6IPHvv4P1WXve3zt8shq98HWIUw97qCp1h2g9Y5Ky1644POiNSpiaUuLpT0qWzIAY/MntCv2
	Ibht+sqbiGxz/1TlVHWxS2mPGgRH+kYr2cyT6qqkRJ4csLB4bJMDmSAcUSwidnBywDvXgjDIl6u
	o4EPGuxdrzptWpTEJqHYA42at79awiJlfs8j2ldcTSYuYM2i4
X-Received: by 2002:a05:6a00:4397:b0:837:8ae9:6c30 with SMTP id d2e1a72fcca58-83f33d8c21cmr20246539b3a.29.1779210949123;
        Tue, 19 May 2026 10:15:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:4397:b0:837:8ae9:6c30 with SMTP id d2e1a72fcca58-83f33d8c21cmr20246501b3a.29.1779210948532;
        Tue, 19 May 2026 10:15:48 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c77822sm18634720b3a.41.2026.05.19.10.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 10:15:48 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 4/4] arm64: dts: qcom: kaanapali: Add minidump SRAM config to SCM node
Date: Tue, 19 May 2026 22:44:42 +0530
Message-ID: <20260519171442.1582987-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519171442.1582987-1-mukesh.ojha@oss.qualcomm.com>
References: <20260519171442.1582987-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VjjUAjKZM6Bsm1IN7B_5gWqsVbLgHG6C
X-Authority-Analysis: v=2.4 cv=LcMMLDfi c=1 sm=1 tr=0 ts=6a0c9ac6 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=ZJQsJAtiAu0WCEyc7p8A:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: VjjUAjKZM6Bsm1IN7B_5gWqsVbLgHG6C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE3MiBTYWx0ZWRfX5wT5CXsWoaiN
 Hj9wj33g42HVCuURs8LDasvVrkKnpr0kVUm4HAhWlkBW2ooNgqlAyEPpBBBz0ZEh+YFgxydrY7E
 eQNL4cwEpKAy6joFWDV1Czgko4EgKVc3Hj4XsLle6RRxLZvzDsTqI1LozhjzoEMTRYvq1lXv8m+
 a9M9n+/mU3q1VwvSBiTueJnpzzJBXGRYjCwrX6CxNbnbOR5xkHtTqHP9v0/OIswHXQSJSSzS3OT
 E5zdB1PLRv16MhQXCdt786kRpKED4Ts6kG5poeZshdNC0RaZpBAutOoNmWDstdxyJlBAaBUKuZ+
 FcDDovIRIh61gmyusm3snSBgqMvbv9iVjcLm8hfgBUfu9cLU8UmoB516G4G3P5uh/N42q3AhnL6
 j3RdQcu6dk2NfkPIKWVy1+uwilS6jsOlUcemZn+zlSPBuXl2Y/dPuuMFjiz0Y22kXsLW9wzOxsv
 VyPinLjcsgnto0mFkdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190172

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index bcd1cee31356..425b532c53be 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -224,6 +224,7 @@ scm: scm {
 			qcom,dload-mode = <&tcsr 0x19000>;
 			interconnects = <&aggre_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			sram = <&minidump_config>;
 		};
 
 		scmi: scmi {
@@ -5448,6 +5449,10 @@ sram@14680000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			pil-sram@94c {
 				compatible = "qcom,pil-reloc-info";
 				reg = <0x94c 0xc8>;
-- 
2.53.0

