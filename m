Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5B6471D1B
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 13:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785937488; cv=none; b=kW5K2jdsMfFUgOhzwxIjEtNsKV7SMh//vqE/pJ79hf8SEJoOAgQMy0BR3qTzACWTZZsOOQZyUinRQy5UoBvkdv9bUQ03eZKo4ZcvemNO7KbbI+DYPmsD/CO2+J53+BbK610FFDGiZ3SbxqsAIInEd8kxG6M2rOUVzfPAefgc0Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785937488; c=relaxed/simple;
	bh=hrP5rTHxzMAfNHmLsJGTCWdjS1eSDth9PH20iZTDVCw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bua/THe1yutB5XbXY+IIFHpUkl5fNQSw5oyWLnLWV0YAzrNnRYZYnkuXlx8l5HgkrqROkmthzcCeHp5kGKz80xmmJgAJKQv/9fz2pfL7YqqGTmdN7Jngri51n7eTeOWlMSpRX2i0njJ0vWW2479eXi3lwG5gH441xi9zQ3GjGAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PSG56gU+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HKTNWesA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PSG56gU+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HKTNWesA"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675DHD592986572
	for <devicetree@vger.kernel.org>; Wed, 5 Aug 2026 13:44:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mpsp8/7DeRTmhUckVHrI0J2YGgdsGZzf7I8
	IqJ5gQ6c=; b=PSG56gU+aa9MYZaULxO/R4B2aX4/ljnKByt2ZRFbMVoGwX6Ufrx
	Zdm28NZtfZrTb+LVUkzg4nL2+1NMEi7W/DFaM4q9IVsZ4pKeboAqyXPqxKf8YVPM
	MnHw2SFFqAP8F1H/i+EY0l+uz38rSSdpTwKQUgJaiVf8BFZRyb9pSjC85ivGiauD
	hLjAXEMhAVyyhMwsRYY3hFL7OwNpEh4uHGurOcRGRuhEvLmonZdnkud5TLrxxilT
	9DmCKaNJzMAzKMwBi4WTh2jtAZlgP7zs0YyIKikcLyWDka9SCkzSFFnirulbdVnv
	tuOgs2xHUQG0c+kWtMVizXQOZtHeXqOjLLA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5x5r42b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 13:44:45 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-81e6bb29581so25805117b3.2
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 06:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785937485; x=1786542285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mpsp8/7DeRTmhUckVHrI0J2YGgdsGZzf7I8IqJ5gQ6c=;
        b=HKTNWesARGierjB5hH65h5fRCBpR0Us1ExVgaR8LbOrUqdUkl7id5JO10jD1NLOIWW
         CPyztilr+3TT3lQapmCxsbm41KZLRxgaDoPEPoErcqOBgU+IHLlTzsOXyLNl8nRugF4n
         40KW8+E9GisE7vJpAxNtvxKKwImPECv89axlJZqWWyAQmHFkFo03kLlgF0AfhAw4UmjC
         giiy6mae6UYAeab3laAqtZj/G6pr0f3nAb1YhgwlbFFgHW6rV1PlvHul7NiobBfiTa8x
         WUPnV1PnW4x/ogtv7cpqKtYatrzVjhDvL/SWD4NbK3GgCFNXqYU06uTR146FFPWdZo4U
         SrAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785937485; x=1786542285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mpsp8/7DeRTmhUckVHrI0J2YGgdsGZzf7I8IqJ5gQ6c=;
        b=XayFgH014VnlwfrYi3yC+1h+mz2SqzWpHB3vHjZo/CRzbSXw5W0qLXOlxjE6qY5zAS
         ylbSWWf8Krz04NcCErJ8vCZKUXCQ+U3w/x13FsHieqFB5UvjfuIJB3OGRsVnOY1hAnpH
         /GzX62ROY7EyS4+OQhKNKF/kzDA5yKFu1UWt5oraqAaExmYWblBjX+eKrqtM6MtRA3hS
         SHB9HPTBDfYANX/CrHrykPwPEY5JdH6Ik2TzjoHBAyHp21E/XBl403Y46olFIVf1ouo7
         /2XEoCGwJHMquVxjYbzFKNinjGLZIxX5at/mulwDrg1RtnDbYV/9nEHdMkr+/R+AHDRZ
         Arpg==
X-Forwarded-Encrypted: i=1; AHgh+Rrjt1/8IOozFNLuaEfGuWDDRwJMM//QzhTd1ZYFEKBYaqUgGAYLRoF/666FyusOMk6Pgswji3Jp0EwQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzMx0Ew6kZImmkconyEC7F7RAXThqPc+xfwrm1+DsikbT9JqBWF
	iOpbaNSibhy1JZexgNkiMp9Bqo+seQeHBXC14MnlsYS+HEOAWa8wTKbz+og8oufMw6rg0pcBBsx
	Sextt2YOP31e5SPERc0S6iAjxZ4icOXC1xXafNCUyjAU4aquIA5XnBDC3tIeZd1EP
X-Gm-Gg: AR+sD13YPpAJ7KaqHwbx9G5caTW7cjkkN2iXpxs6+oddOjQY+j59+5xee+2V9jfWYxj
	yGThPTk2lLVrIS9kC95nL38FSxkjMbKe+SZryxVgM0ujdrlQHYdOcHSajBJaD9yKXwnocbgqbNS
	wEUPcjlPtVaUTO/MlPLKsHF9YbirItQwUUaKSIB7brcGKtlgOZitkcOFjLWQkxeXV8EIMFl6cmO
	vsTip0Y3vLyyXVmWsMIFGgosvfvqFF/B+JQajrKEhaIVcT+xHavac0s+JCSIStJ7vAwjJMesG5y
	OT4jHeWeuafVo9s+jLRti561PfpfO9lUSasQ21WDd4XL1TZ7ZcJzPMyDDLsQOOlY4MJTmilEoXF
	g2mnDsL65WUQkwOGO6nw+YI3/2/M=
X-Received: by 2002:a05:690c:6ac2:b0:809:6b62:2f7a with SMTP id 00721157ae682-82022348e0dmr39710677b3.21.1785937485038;
        Wed, 05 Aug 2026 06:44:45 -0700 (PDT)
X-Received: by 2002:a05:690c:6ac2:b0:809:6b62:2f7a with SMTP id 00721157ae682-82022348e0dmr39710187b3.21.1785937484507;
        Wed, 05 Aug 2026 06:44:44 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8201341d3bcsm20647057b3.24.2026.08.05.06.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:44:44 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v5] arm64: dts: qcom: sm8650: Add minidump SRAM config to SCM node
Date: Wed,  5 Aug 2026 19:14:36 +0530
Message-ID: <20260805134436.2817251-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dwKsQHZzakpfjauXg747w7-cF38nTVLb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDExMSBTYWx0ZWRfXwAUCMY4wCU+2
 YKcNYOfvg4c6/WAZebqYlc8ln+JZpI8QBwtAex851uU64bMuXBP2dnJb1IRaeng7jpcNh/klBdd
 x4BX+n8kmLR73YwA5B/mo0gvQqllR8L0s3JScf6n6gWmJdooh/DPkNWtYpPgbSG2VVE8n7FkhSl
 MPen5cLIKh/h+bHpWmCvOjK1TrDqRhiG3Sh6T3sYzdB+KkTWnAjP4ugKl66nElKMJyhcyPKhu97
 0E/Zol0tZqbMhI5VBmxnxMSaJkQANmZyQTM7YD57sDUeXYPx1mZCX3wvkWv3uIDyrDnYQkajj4n
 +BInhioLJrxmS4PJNIc/hbH33Ln1YPnQNiNbV9Gw+4t/Guno1HFjwQKFe4z2QQEvMCT6ixwO6PA
 T8feo2JsegfsC8v818UPzW/vGwZBFcv5stKeKH28ElV3uyKtNsFmadiUvnMvdVMoNJN/aAOKoAV
 RMivyf9HCovFodAdsfQ==
X-Proofpoint-ORIG-GUID: dwKsQHZzakpfjauXg747w7-cF38nTVLb
X-Authority-Analysis: v=2.4 cv=RcygzVtv c=1 sm=1 tr=0 ts=6a733e4d cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=TzvV3HYDIdy8bbtRLkAA:9 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDExMSBTYWx0ZWRfX9/P0Ja2K8ONy
 DeVKCFzyEZBZ2Wa1j0WrwdnS46Al1DNyVxbmbZ9vxOt5EMVHCLDiMXq29x6I3j1gyASzcxVOpjK
 nlcy6IZ8+PdvTJgrz1AGYiOqBBENVA4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050111

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v5:
 - Separate patch, as other patches in the series got merged.
 - Resolved conflict.
 - Rebased it next-20260731.
 - Link to v4: https://lore.kernel.org/lkml/20260624190830.3131112-13-mukesh.ojha@oss.qualcomm.com/

 arch/arm64/boot/dts/qcom/sm8650.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 075985ad7995..44d33f1bb0fb 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -701,6 +701,7 @@ scm: scm {
 			qcom,dload-mode = <&tcsr 0x19000>;
 			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			sram = <&minidump_config>;
 		};
 	};
 
@@ -7154,6 +7155,10 @@ sram@14680000 {
 
 			ranges = <0 0 0x14680000 0x2c000>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			ipa_modem_tables: modem-tables@3000 {
 				reg = <0x3000 0x2000>;
 			};
-- 
2.53.0

