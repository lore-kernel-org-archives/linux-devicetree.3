Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795577126;
	b=UW3v5CHqITd82pHxQDTklMYUfUGkjPMKCrBAJPjrJvo+YamkM84CRDSyeA61CiVSJEjA
	 9kQkjYVMvOYwJWVGiwTP7w/3fewSofTkTQMeEKSEOKWG0TspdAEdOx6nqYwKIvZDGKemr
	 a8hrmcgh3hEMOC9fwd+meflAuiMCX+WYHCFL3+u5pVE3bKGb7hW7QQ+eKlEG+BhQTa4x+
	 WbRlYBJQ1DrnoTh2rZCdxiu0uTnDSWIz2tq3fiCxlW53tkhjskBPQWScvGfck8rbF0xSW
	 F7KodLGvClqxx9/9Lm0kmQ4tN5AUWJYjHJhlUjbaExL2/gcWx3n7wB10UrqcFFEW3/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795577126;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=guaeEGSbxYdMeTPf/CsUwW7Tc5rMOf59WZ5PCzNstoM=;
	b=324WUT+Ke4n1cDWnWSR039b07A2y36PG2IZ+EXPrF9Mec48xUQlmpzpCjrbZX0M2oj/R
	 7iogxCrCjWNkRqzsK4hKkgEE+gbjHyanWIZLXhABb7wlU4JpNTpC29gKGCBHtwBxyDig6
	 +dl7ewZ5kDEdcKRXkMe95udWChh6Nt8Qji+MZXu3LEhSCB8cbccSJTDIbBDoNLVXDwRQZ
	 iFlzI+Sd/4Tj7/lLXE7QbJTpPPphVhGYT4f3e4F3KkQmc4nIxGTrcpt84A0U1CybtntAU
	 Hfe3sQaKOgz60EVH3v8hcmnFD/7G+20QY08osTiBa2+tuAic1OB6TCQgJ4nhUZ2TARA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UYMMyeAU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="hW/HpCBg";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97DD606A688
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:25:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B97DD606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UYMMyeAU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hW/HpCBg
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP2B1WW1096763
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:25:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	guaeEGSbxYdMeTPf/CsUwW7Tc5rMOf59WZ5PCzNstoM=; b=UYMMyeAUKSimR04q
	KPMkE6j7SbeK898Say9b3E4NXVhVSSHx3kDORxNylQttW7ReeH+AQCbDOy/MzG3h
	GKayGNaRyNwfAX+OFMye6X8EFT5zUOwDKayLKRR+Y/0UB/yqpyMdV2qd2Lsm6Am8
	xNozeY5tyVBnbIqVZgZEgSSnCmTaKqFTtVY9zkMoYREgNYBHng0ewsl5cxq07OMk
	7gc20kk8Ivzqt/8t0ZHHZR+WVvEWEpORRIMa6Nn2vIYA18xe11pnuO0E1WcS1FKN
	NH0E20CyQo/Y7e+cxKvvtPTbShp9UM3v/2Bqw5uFjfJDXiOZderBFQnWXznCBEQo
	fe3Jgg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5efft6fh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:25:24 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b32efd7ec4so5519158b3a.3
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 19:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795577123; x=1796181923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=guaeEGSbxYdMeTPf/CsUwW7Tc5rMOf59WZ5PCzNstoM=;
        b=hW/HpCBg7DWDcJqUYV88NBg0BqcuEQWf+OQ9CXprdEyUuNBjNJjnV5IpMBw+IrK1Et
         0g5EdTEojVyzcWFPogUPtIycfO6OJGCiLzvOqwxkUiDx3BelFIgcUoeK4WJGeNGhNqi3
         jlYqAbuSTvrNAGjvwIFVKsK/eZXVimlDPnOOt1zPOMOd8wHRoeXsS1tWUSqGtBl602oB
         0PZTbPrvWYVg0b0VtiRl2PvHIlLnXHMZ/O9Kc35BTdQbrgkdYYQG7a0vlzzYfC4ureK2
         GrKZ8IZ5VoTCwS8vWniXvqMR9eIWaLi0EGY7LsMLFRc+Giluq68olua/OEoeOwPCnzWd
         BQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795577123; x=1796181923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=guaeEGSbxYdMeTPf/CsUwW7Tc5rMOf59WZ5PCzNstoM=;
        b=H4hSKNYFb9YvxOBS2L1RAZH3XYozUoCjwgVTS3U6BbhNwhD02JJNFqPuvsW1rlNUH/
         /Zi0xvEbwbmCAefqvRZiZf4ssBdGe2a5DXmzS53FAYKFdP15KgUi30eWoWhY0c53htHT
         Ju3qkbD0OIY2ZEPAM9pKqUUkk2woLKrgys/2tFI4OP90sX36uO9kEXWFWXDzX1WPrXwf
         tbskvgNLLqguKD2oTFMId+U/Yfq6hiBQoG4oVaR0bAgtybCidCClHBomoDSsiQ4Rf0IR
         Qim8XZ88/hgSk0SnNYLsxCUJ516ww9zS5xZ28ICEMYkBoekjqKKvzxP5LcRQREqGWfLN
         eysg==
X-Forwarded-Encrypted: i=1; AL+hErGZnsgkYkMKOLWKFChYB2+jHyer8ZhzEYXE1YJqQgiTTwH+uj9LWuabRU2BVtIfYJn+G5YTyNHJMqAs@vger.kernel.org
X-Gm-Message-State: APuU4Z+5ivF1L9auL/XWbsvbi84FYZ7axM/17u3nsDjFRPn2F2iNIkFC
	V9Wd0T5fBk/GE+4oxioIZBCoBmIdBN6rJGSCCSrY9htLnsBQd4TqVZwqyDBnoUlrsmQg/W2fzSI
	g6/BhxvMreivlOrD6UdV22wo6DWvdmgSSXpcpbrffJID6+NFgGxlJ/hO+s/ZdUxVY
X-Gm-Gg: AZFdTZcLQb1S+QqR7+vvPWlXl7dv1uwED8OP11+mRaHfc66fZyk091HeJ/BO/3VIoG5
	tJ0q3wOvd56RWClpiJ2V/HC4B57P51AteEEvJXbbscbk37NPFe3gGsJ8TI5djOdAagDxN9/hcSY
	idHgAQh31VoVzcA1FMFaCVZgbww3v2K4qOYvJWdeNwUKXw8S4Ivzdp+6opSGQZRTHquiN90IOxL
	2LGEEYqJdIpuPWJWP0nstKlmOHqc7fFugv4wSz7ZXHom7YJ1k7/JBh8pMOZBl5S1YGoCioaeCn5
	BHwPhQczj1JzPbCIrhl+ns/TGKYJsvnkQFo7t1/7zLn6TDQG1pY7kcUoJ1m51hbFUc1NwvNzkS8
	YccQtTnupFxG4vqoGiwAFmLIrKVpISnm1TLKMGjnSWzHDWyT1U/YfQ4SAULlt1sd0TCOek9OLrC
	+qehsR4FE=
X-Received: by 2002:aa7:9a8c:0:b0:8b5:94e0:91a2 with SMTP id d2e1a72fcca58-8c87baca56bmr15326677b3a.10.1795577123386;
        Tue, 24 Nov 2026 19:25:23 -0800 (PST)
X-Received: by 2002:aa7:9a8c:0:b0:8b5:94e0:91a2 with SMTP id d2e1a72fcca58-8c87baca56bmr15326640b3a.10.1795577122901;
        Tue, 24 Nov 2026 19:25:22 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8cbe173453dsm4762399b3a.25.2026.11.24.19.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:25:22 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 08:54:12 +0530
Subject: [PATCH v12 5/9] media: iris: Handle CPU_CS_SCIACMDARG3 register
 write via program bootup registers hook
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-glymur-v12-5-5c34dfd73fc2@oss.qualcomm.com>
References: <20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com>
In-Reply-To: <20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795577086; l=3644;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=Vz1PVBmTlFZkSCWZjrjzOWTwplg/khgPXuic+w5vTLI=;
 b=KpbccKg+aY4XQVucemH2sUFqyoAGN1CBaySFRU+8uphvoe5z7Ta3DXuO2XTXFJze+KryjVQ70
 I7ALjbgY+xpBUAZheGsqJv1KhMiDxUFV313hzi0EDhq9djP4ZeUHmVV
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=eo5KXYpX c=1 sm=1 tr=0 ts=6b065524 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_-2Oxswyk2Zu2Y7AJ8cA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAxMyBTYWx0ZWRfXwa+8nRL51qim
 s4LYWy/8fC7KdDPo31ZZ+ammZj2pteCTDYNTJW5BvINEnPWIm5+gDry2SZkaTbELyH40teVjn7W
 gh/4f5dvGBfqtFZsgT7kQwZbZlMXVgVdMiR6E69PtFPU6jswD+rH69wglASzBSzbFK0wsV1Zlk6
 q/YynTU2EFm8qK77abEcxWqx/Ax/d3NlI5UJDyGQbAbXdLRPG6A7pXMY9Sh4r2J9UVQSkjDx1zX
 kd+XBRfYqQwqaLaS39fA3ON1Ttzo7nehVxYXfNiDINH60C3dfBcFsgrDUbeOH4EQ4xJCG047Jl/
 e5vsJujkFpc91gq3sB2QBFSdhPZ3f8YVo/1Oa98/ZGjEm9nyY97JFtNREqXxwafU4V0n9vpNi56
 oJj0BWFws6lk9rxPSbxhZN51Eaj+AlzHEF4qyqBzCW0yzRYESBXonJ03AMePUDlWL8co8gA8rMW
 E1PIDvi/LcYTR9G84Sw==
X-Proofpoint-GUID: fcelh9ANKoajMNA-N8Cq0x3vwYF0HnwJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAxMyBTYWx0ZWRfX913mT+uBK8pM
 nNO8aE9t2GFtTohcpGtldiKTH7FYbz93WFnlQ9ddtN7JUH7DJnuFki6P4LWIFFTI2H/c+8xsjcB
 h8reyAB6sbOzSS8eiGmOipjiOw1ZCCE=
X-Proofpoint-ORIG-GUID: fcelh9ANKoajMNA-N8Cq0x3vwYF0HnwJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250013

On the Glymur platform, the firmware reads CPU_CS_SCIACMDARG3 during boot
to determine the VM count and increments it by 1. Writing the default 0x1
causes the firmware to treat the VM count as 2. To avoid that write 0x0 to
CPU_CS_SCIACMDARG3 as a Glymur platform specific.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu3x.c                | 6 ++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c           | 4 ++--
 drivers/media/platform/qcom/iris/iris_vpu_register_defines.h | 1 +
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 4c591538ed82..fe0c91af3301 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -334,6 +334,11 @@ static int iris_vpu36_set_hwmode(struct iris_core *core)
 	return ret;
 }
 
+static void iris_vpu36_program_bootup_registers(struct iris_core *core)
+{
+	writel(0x0, core->reg_base + CPU_CS_SCIACMDARG3);
+}
+
 const struct vpu_ops iris_vpu3_ops = {
 	.power_off_hw = iris_vpu3_power_off_hardware,
 	.power_on_hw = iris_vpu_power_on_hw,
@@ -373,6 +378,7 @@ const struct vpu_ops iris_vpu36_ops = {
 	.power_on_hw = iris_vpu36_power_on_hw,
 	.power_off_controller = iris_vpu35_vpu4x_power_off_controller,
 	.power_on_controller = iris_vpu35_vpu4x_power_on_controller,
+	.program_bootup_registers = iris_vpu36_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu36_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 4ea7bfd204df..b282cebeba52 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -26,7 +26,6 @@
 #define QTBL_ENABLE				BIT(0)
 
 #define QTBL_ADDR				(CPU_CS_BASE_OFFS + 0x54)
-#define CPU_CS_SCIACMDARG3			(CPU_CS_BASE_OFFS + 0x58)
 #define SFR_ADDR				(CPU_CS_BASE_OFFS + 0x5C)
 #define UC_REGION_ADDR				(CPU_CS_BASE_OFFS + 0x64)
 #define UC_REGION_SIZE				(CPU_CS_BASE_OFFS + 0x68)
@@ -67,6 +66,8 @@ static void iris_vpu_setup_ucregion_memory_map(struct iris_core *core)
 		writel(value, core->reg_base + SFR_ADDR);
 	}
 
+	writel(0x1, core->reg_base + CPU_CS_SCIACMDARG3);
+
 	if (vpu_ops->program_bootup_registers)
 		vpu_ops->program_bootup_registers(core);
 }
@@ -78,7 +79,6 @@ int iris_vpu_boot_firmware(struct iris_core *core)
 	iris_vpu_setup_ucregion_memory_map(core);
 
 	writel(ctrl_init, core->reg_base + CTRL_INIT);
-	writel(0x1, core->reg_base + CPU_CS_SCIACMDARG3);
 
 	while (!ctrl_status && count < max_tries) {
 		ctrl_status = readl(core->reg_base + CTRL_STATUS);
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
index d21c2070c32a..23068fca5f63 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
@@ -29,6 +29,7 @@
 #define CPU_CS_A2HSOFTINTCLR			(CPU_CS_BASE_OFFS + 0x1C)
 #define CLEAR_XTENSA2HOST_INTR			BIT(0)
 
+#define CPU_CS_SCIACMDARG3			(CPU_CS_BASE_OFFS + 0x58)
 #define CPU_CS_H2XSOFTINTEN			(CPU_CS_BASE_OFFS + 0x148)
 #define HOST2XTENSA_INTR_ENABLE			BIT(0)
 

-- 
2.34.1

