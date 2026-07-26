Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBB234404B
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 05:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785045098; cv=none; b=X7QjLEAd6b5gGhdn+4IBoGe+eA+5kYOrr9ycNxCWB5klaoWzBZ4DAsSbCi8hmNpXdiUZBAR5lf8PSQf9P3uvcOiH6yuskde9pDH/C/2UgolZ65naSmKkVZIXTbOXg24Dg9PZjUPLYZ8YWr46DTzhUILTp3QHbY/LDscwIAM42pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785045098; c=relaxed/simple;
	bh=h5DMpNBYTzOe55aeFRp9dNOeZeJHfE4b9fvXSqVdjk0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cMs0REI5dhdV1bjWLTea5ftpoFLkydhDAJskm7eqOwYXIzG8Kf/CAOstBYBffsPFpCvbO8TKoFxQDnmvPxCEj0UqtDmRlfcIQ9o0MDrdqnEu1nBjiFCi20X4kpv+g2LhYBuIKyOAhZV8K9uw8u1/a5d2vO9PIP8BmCiHT22iLKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AED/YfFz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YgFadqDF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AED/YfFz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YgFadqDF"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66Q5RpBN094106
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 05:51:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kMgLneOLhVV51fSaQ1xIqLuDCHe6XasBQUPgKJgGFvg=; b=AED/YfFzk4H/ZrD2
	QTGglTaB2TY1XnVpYVEu98xYtTQNUALeRqv7KVtbUpgvCL3i0q9k9VbF6ld4fjwQ
	jFeiYhDCP33Y9XQxG7/9qYlpQCyOjg2sm285U5hV+HASn/35jHwuxC0ia0jhPf3Y
	2+o+eFvx3GRr08UdcHXE5ZKvOzywh/DBVSeYl5eMbO8Xdyhz7ylNZKN8S2J15PZa
	uD1OYWV8WC6QjGnHaAUDUbUs4BzyQwCQ5uy9GlmJGPRbuZlRwRgM8x/qPC8wUHC4
	t+pZgGc1MUDzCpusgenpyzXXYksEZEpPq+o6SLXpNfQ/d9qPjCDadgOROZsXilhJ
	wlE6Mw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmm3saenh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 05:51:35 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c9fe4c5eb39so1129699a12.1
        for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 22:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785045095; x=1785649895; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kMgLneOLhVV51fSaQ1xIqLuDCHe6XasBQUPgKJgGFvg=;
        b=YgFadqDFeHD48p/q/AlbYZ5M5vCqbKPQi9F3O05ambpRFKLtGe3xYvoVJTKYOjLz+m
         VpqDYz5wW20V/3CLzuvMtA4vsenGSP4zs9WR9csuBg8rSLCEpsgduyE4G7zHbF4XMx6L
         gkXL/Wqxjf7qHa3OXYPh+T6t99SR0hRg10u95k97VQOfxB0qsm/dV15YVQY0dGY2CZ7h
         6pbNlqFCesUg43zGSeGENFRfpIcrmw86NFE8VGCqkLHBv97R1sI3XMsdpRfYTwLXsgwb
         FD8pVJa5aNLJYm3XyZWN/XCNL9FhMoJg7aO1egbxjaC6IePM6RKpG7uS+T0g46ORE9WJ
         IDYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785045095; x=1785649895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kMgLneOLhVV51fSaQ1xIqLuDCHe6XasBQUPgKJgGFvg=;
        b=ZAVj55YPW63qQUvlTL8uBW3/BUqYgKaLbHQZmmF62FYMN7SbTl0xPh7pgTwhX+O6CP
         zRuIpF4BC1C3bU0AU9Y90a1XmbTskjtDeU2Gz2A43C6njq727O5N9vHFbmotTss50M+L
         tMaapgLn+4o7K29KNFsyiuNibUj4NG/sqQUEOD0FcvIrlX5OAjHs6gvD4HjUsYd3XFeI
         tzMIKEAcVRGZALfJ1YEBKmelN9dTzdsc7cn+KeXDPYs4tZ2VLCo80Da1lrMPFhLiOHvt
         66+LtSuhR+Jkkb6nu0cM0xVsLnPG3Nli1F5pHfC3J8GPscY2bDMNn7prK/VyCxHmzydf
         RL/w==
X-Forwarded-Encrypted: i=1; AHgh+RqX58EWIFP/15nue0m5EPH/2jWqjuBdoxINPcWyTxTZJLaDNYV9nyNLOZQ5YwSgLOJHMIKmhHHc013U@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+RTyKYIftzOZMN6w0PUAm7wbsazQd8i5rI/2BWjibeI+XbbqY
	1wn+EVkkCCcL+Exa3Dpw3zWEEpghs2yFL7FagvU/J3IpiXM95L6t9N4haE75Ayc6qbmlg7iX5hd
	LhtyrKHLH57d9Aw7w1fIglum8/NgR0T2CjjF4c3C0w4hMqRIDfY8KwjgsDoN2fXQ6
X-Gm-Gg: AR+sD137/gbXQ0VcU9fVOGOFxmWP487eVmK4ApBCmyMnUl3NCVZnpYRlf6YUL0jld32
	TwfYOVtVx0RbyHyJJbHqo8xrPQlTytOet3Zrj0CJ0eyzRBnuL8fY3fzrcrAnHz54nKMeW3SYS0m
	op8lMBtAnpIGh1q4rIVisDBFx9CqorvFJNW1rM4otNQl/8qQg97ak0PogAD3JVFtylCzAdfnZtp
	T2vs/ko9TH1LK3TJ9QKyuJ507JJrjaiRVDfqztNkFn52jdiNWLulLfmAfM6CMfukLlRpzkZx+a/
	PLX/rsIFlABQVE5KwKOv5TBWWGZJ2Ego94f8G7be5E+A12fA7qug185MLSUQ+8HrcnLPakQvJLa
	6Od2T96EcQs6N7w78bXoUr7yoQkEi5KGR1w==
X-Received: by 2002:a05:6a20:a10b:b0:3bf:a881:4094 with SMTP id adf61e73a8af0-3c67df58b6cmr3517151637.50.1785045095314;
        Sat, 25 Jul 2026 22:51:35 -0700 (PDT)
X-Received: by 2002:a05:6a20:a10b:b0:3bf:a881:4094 with SMTP id adf61e73a8af0-3c67df58b6cmr3517124637.50.1785045094860;
        Sat, 25 Jul 2026 22:51:34 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f55c6sm67106334c88.15.2026.07.25.22.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 22:51:34 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 11:19:39 +0530
Subject: [PATCH v10 09/14] media: iris: Handle CPU_CS_SCIACMDARG3 register
 write via program bootup registers hook
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-glymur-v10-9-de451559e88b@oss.qualcomm.com>
References: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
In-Reply-To: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785045024; l=3528;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=h5DMpNBYTzOe55aeFRp9dNOeZeJHfE4b9fvXSqVdjk0=;
 b=Q3fdnYYwurHs0Psj2jmbiB/7zjP27y6enve684LT0v70Fz8DUgeAv+DJc4YW9x5A6G3u7d47M
 elgjTUdiBrUDvPVkaCGkVfZ5XS8tdCceAIO+jjNGoKi4OkydeoIkxJr
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDA1NSBTYWx0ZWRfX5kUlR4LsH//k
 YQpoLQlNEE2zukD1aDz/81zi1qkmu/aFomqeVuuumlVgcNLZDaeiVwYvkzgkkWCg5HZnGa3FgHw
 ZvLdlReYku7PL6dg/MuwpJpc1f2brmYALvbi+S23Q07h2ArTEc2HfxhpYxfdTAFLMll0HooqgFr
 zbKPl7zR+slS7rfwfFuimJGbQnhoRsBsTYGhT1si9x1PjowF/xFlqO7b0d0kSnTtdTAhoc7cSB8
 o2pW7aJ5ZJkLZsJh0nzYlASyBJahuilIy5CRYC4Mc6w2n97ea9R3fZ1OFrn6PV4W7F2Aj7bhpm0
 LRZ2Eko3kqTqPu87XqG1/LT6Po0Ic3ASYAt3bGRAWCK/CRjcyckHnBTzc/pJOhP7+zNSKmCO8K9
 JUxsvc6TMKISBlMh9GLnmWwKVeDtvRx3hkvb5Mhmi46HJJnvUwE89l+Ut4qk2/YV+NLkYkJXEy1
 GlmF8ntVx1WQORSJiIg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDA1NSBTYWx0ZWRfX3s1UpquuS+Xb
 MzHiMWJCxAhU/6KvOVVw9Kn4ooJq+M/ztwU7sNPS9bhPGkiuDCv03YTdVThIicszIrjdpzlpS0z
 ajvW7xHA/UB3XKhOenFsp9/rfE0LKq0=
X-Proofpoint-ORIG-GUID: lLwEKKN4d5ltSGvW_r4J2tUnUcF-ZnbC
X-Proofpoint-GUID: lLwEKKN4d5ltSGvW_r4J2tUnUcF-ZnbC
X-Authority-Analysis: v=2.4 cv=KanidwYD c=1 sm=1 tr=0 ts=6a65a067 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=_-2Oxswyk2Zu2Y7AJ8cA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260055

On the Glymur platform, the firmware reads CPU_CS_SCIACMDARG3 during boot
to determine the VM count and increments it by 1. Writing the default 0x1
causes the firmware to treat the VM count as 2. To avoid that write 0x0 to
CPU_CS_SCIACMDARG3 as a Glymur platform specific.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu3x.c                | 6 ++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c           | 4 ++--
 drivers/media/platform/qcom/iris/iris_vpu_register_defines.h | 1 +
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 1b08461ee4d7..5212f7d4e606 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -328,6 +328,11 @@ static int iris_vpu36_set_hwmode(struct iris_core *core)
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
@@ -361,6 +366,7 @@ const struct vpu_ops iris_vpu36_ops = {
 	.power_on_hw = iris_vpu36_power_on_hw,
 	.power_off_controller = iris_vpu35_vpu4x_power_off_controller,
 	.power_on_controller = iris_vpu35_vpu4x_power_on_controller,
+	.program_bootup_registers = iris_vpu36_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu36_set_hwmode,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index e690c566c875..72eb8f6240b7 100644
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
index c44c85eac3b5..3782454b7d06 100644
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

