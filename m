Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDD333BBD9
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328174; cv=none; b=ccjIS8Pu59NWlAwOLpzcGIUymwzXoSn3rWTXqHcI0o9nppdivh1nh9spRycfQTpiPyRReF14JvXrTy64syFOJMdZ1N6RPSb/XNUwTLe7Iyt8oF2yDyY8kLw3vOwvpY3dA/jxQDtjtvb+FLOavZwBZtRYf9hn65Je893Kz3MA+kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328174; c=relaxed/simple;
	bh=PCR1Avg3wKF00OEiFfGAm/GCHDD772888WheuRaZJrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XVaFfq34Y3qwdADF2CvTHXbofEGyDs7F8oN8mCbPtiB87ITjAoj8xMdtABjcDaU2KCXs/HiyhisabRGPBi7qk/bR1TuO4dIvLyrvsOkGphK5H9L/U6VKJ5GAxUPYae95LoiILZATqecVrvD8b7IMZpflunW3UFULiZsUahvcIs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RC1HXMRT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cJAfX6Ma; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RC1HXMRT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cJAfX6Ma"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OHj6PC4153414
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:09:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sTQYAytRwag
	UR8kVm08B5B5QZF57Jt3LflBwX+0NUTI=; b=RC1HXMRTcpeR828ex4Jk6Ug18+Y
	HgnunOSWXGL/p/fJ4lLU+XaDSC2V96jFErBon/NYUoiOmM+ECx4Wk0TvetstVFDF
	TeGTI4VNSeAh4Iq4GsLztq2d06SVmq6yponsvqi1NlARS+OHh3vpmDRjhLR7tOkm
	KNQ8XkwN40F4WwLj/UGTyZo1Nmc6eLXiGXGJPrUlFEf9GyoZY36jWDSOZzSqorV7
	oJdqg4mxN2h5ytrm/LJkqHN8KOaNz6Sj1rsDrZX8LROunk5WFEqDyDG5XbmLTIJY
	SVuVQ4sroP0Atf0377iAujau4RTs3CN1RRyxsFaNGbijb8DOt3fK643vC8g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0996k614-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:09:31 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8426ed9f24dso105690b3a.1
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 12:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782328170; x=1782932970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sTQYAytRwagUR8kVm08B5B5QZF57Jt3LflBwX+0NUTI=;
        b=cJAfX6Ma/N+UghtTT72ECT44Xn2J1CmKKpeYZxZOH3ZFmiWjgnyo3diQ34d6Y1FJmU
         Y/tKkyB/Clnl0BYlPpXufzepPJWcW2zsF8gLbkO+rM6fUMhfv9jiGLxAap5BWpv6/hXx
         icbWGaoO9X684i7dPfgfWQ0oB2pw5jBE3yRfL2phXf6TZJzEXZleHi69p8UjM0fF7QZm
         +nqS0Ze4HGc4w/UC1Xa8fbhPicpCUlR5qYg6T1zo3j6akvgk5VheCMJY3PP3max54Eh+
         vthi8zPAsG6doW6p+HeoUs3JqskfJuOYzAGCzmx1/XxLwSdswUM/k3QELQV8ennWpsA6
         wRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328170; x=1782932970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sTQYAytRwagUR8kVm08B5B5QZF57Jt3LflBwX+0NUTI=;
        b=QZD2sP7Pj4cxzDXmODRtioHOdOffSpP6VcaJyI3SoLl0UMy2UHkHArVLV27YvBPLjp
         I4X+Iix8+AezreTd/8CPBUpwoBBQpM3rxH0j5kbJDIJhTZ/CDBb6V6e2Uml60Z/vTxN7
         tD9/2yl6EM8ECPmsaJZJH545Y6N3X2XnwLluLO85SqLrt91wfky2gYuqWsIoyaCQPilQ
         vZ4ONakUAxLWHHldygdmb0MOKuvtNjMdvbFgIYWRHIYrnDgQ7AqDeziF4lkRZo1rfpZ5
         /EgpE3ESH5SZEQhDEv81zGHu1cl+tX/xxPvcjDHP6Oe/NuYmGA1nM5t/bHr0Z9UqiJ+5
         6+eA==
X-Forwarded-Encrypted: i=1; AFNElJ81OiWL+mTcluhA+cMxk/Sux5DKRMwihgjOp5PvkPidtx+Ss+b/0CWuFADVM1DNh7m1dcSIcD1cyUAA@vger.kernel.org
X-Gm-Message-State: AOJu0YyRv0p6GrSCjVyfy7Q5bqwKG+4+x62n5ohsLNQN1UrYV70lBL4/
	LKd+WDKmOF+NTC/uvt+/LHB+7nSu2pXSLJLmsZf+PbZv3TMeG+Zil1rpAqdEuSuiO3NzDBQKGdH
	3WYdxnBkTj/z/OgDarIvzy4PwmAgkKzHXQL3d2++iN9PQ8K1aFkYIv4GNLmnMktkQ
X-Gm-Gg: AfdE7ckwvcTbFfw1QZsUb0vHGgypM7DPTFoqftvJmjV/l3ZAgRCK0PI7E3aqhRhohBx
	ND/lJpD7kB+atXpQzv9AeGsVKhoBChRofzGL0OqzeMNdbx3peKPdjW8r5M1HYZ/Z64t/h5CeZkk
	DDKtheqBDvm25o2qE2Px1KEP/coW2AY9HcxA/MJfIFSMvZ4t7nqCvjUrGChiML9LN3Z7oeRHJJl
	2DFQ4pf3YQUm+icBMgJ492RSlVPsORYUNvI2uq/aGgpUsFk1es9A1Tya4BVOt5hCHDwUnHrvpwk
	vZnG7QchiF0SU224eKDrwLYiapvbCooSlKwa6TLF2emdSI6WpD7Z9+HzIxfxZxEShEaEP0UXFp0
	uCx1MLiJAm95dp/CERhkGCvAKS4svLhAHVT5fzw==
X-Received: by 2002:a05:6a00:1acd:b0:82a:146d:36a3 with SMTP id d2e1a72fcca58-845ad30203dmr1475696b3a.21.1782328170134;
        Wed, 24 Jun 2026 12:09:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:1acd:b0:82a:146d:36a3 with SMTP id d2e1a72fcca58-845ad30203dmr1475667b3a.21.1782328169606;
        Wed, 24 Jun 2026 12:09:29 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a412e5e9sm2932120b3a.54.2026.06.24.12.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:09:29 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 12/19] arm64: dts: qcom: sm8650: Add minidump SRAM config to SCM node
Date: Thu, 25 Jun 2026 00:38:23 +0530
Message-ID: <20260624190830.3131112-13-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: W9U6F7OpbPmGi6Wzl-dbxkhecyhPwhAW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX7Cy+8lsG85iP
 cCxZn2MeuDhhDnth93RjXxjm2Qukz3b6/njJUlSf6PMDXkOzo/Osn0RXCiLhf3vktxFEAOcnBbQ
 CWphG97nQI06Y/OBoTE3aDHn7VtCHdY=
X-Proofpoint-ORIG-GUID: W9U6F7OpbPmGi6Wzl-dbxkhecyhPwhAW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX2JEtxrfj6/Kq
 KZAsiVIkiqxn7NBXwGeBiitpGwuKJ13HV6Gov/ET+Hu9zZl0wBVNPF159fXrU8CXT3NV6i9wsJa
 JKV1QZVi+dGNJBGiV5gYLJfpUzgqXTHoYDIAfQc/CGk36VmwBO/9/v6vo3d8K7h7F5ZeUDuh0Ll
 M93jmCyIY9skTFJTgPEbLB2Xozetk8vPvkrIJu9zsxSneJrsmkjGawG8TB46HEsf3iYWD++7H+3
 mbxw8UI+YYipp5gnjroKDkuwe9/cSezyCJyZb8ZfDa3WJ46qNJvKJ4LLr+qJWU9gzSCZR8DGRPJ
 Frulrb6q/ydCgMSWkCBvTFuyGbq/TIZBLFRpQTBqyIPJIhpxiOFWVnfRRShtwP7Pu/Q9GZZWupS
 YHYRNlhmKg8DfhSyT3aSTAo3KOzITA==
X-Authority-Analysis: v=2.4 cv=Tv/WQjXh c=1 sm=1 tr=0 ts=6a3c2b6b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=ZJQsJAtiAu0WCEyc7p8A:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 phishscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240160

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 160ead25ecf7..88751d3b72cd 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -645,6 +645,7 @@ scm: scm {
 			qcom,dload-mode = <&tcsr 0x19000>;
 			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			sram = <&minidump_config>;
 		};
 	};
 
@@ -7091,6 +7092,10 @@ sram@14680000 {
 
 			ranges = <0 0 0x14680000 0x2c000>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			ipa_modem_tables: modem-tables@8000 {
 				reg = <0x8000 0x2000>;
 			};
-- 
2.53.0

