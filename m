Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981874;
	b=LdJ1J7hHwZzz7/FZMfWSVZFKk/mamz0sRvqrgiQWJn6cN9/50mTFvkDVxlix/MhY0Fia
	 Hh4vamkfihV0psLfFboA8ceWOMaStFhCrChK7QWGGt/97FFCLRjcv08Zm8oAg35Tf8tBn
	 VEzqQfPmFxVe596F8sDkIyZkcvPFfv16/NdtdDz7JfAj/VagQyXBJKGUc97JmEttf3U8X
	 3GLdLhXveXh+nY5BAhVtv67awvgArrCLGSJ5DeFgrsmJTW+vG/5TZlbIXfblO2dyiWjRY
	 GIGvwR5tJbjzc9P8O3onco8xFxGBUlqVMZhaHSk+SAk64u8N6jnZJJLmfqKbEX3HBQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981874;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RAv/rkDlHZ6m8ibe6hSjsssJtaF0S9p6cdTEayCygR0=;
	b=4u3jWmCOQiE31fn6fEbGBdVtZlZHcSWO+J5VF403NzOO2qjybSVMCXAHDLvHDz2p/rXI
	 T9pYorJ8idocX8UWMFjB5cc6fz1R0O75w5bUAnZOKZj3S+3Y1mYbHA59CLKU49I7kQ75T
	 MPvSe3v+3TMPiL+6PRTyNsta7eDroQ5nODwuW3DOblS8ufPv+UsXNwgLjKUbvVHllQcOD
	 cPq3f5s2J14b9zwiXBPVio5pppOsqcLKKARi/BWXyMvpRMq6n+T48nLr0Z1eSwfcsu+We
	 t/bLfLQzmH9DnLtDmXsbTaTzZGNwV6+OWgWu5J9gO0wTt7pqZBlNI0wtpe2fBMBjLYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FHNQ3Obh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PJfFLjLp;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C589F606A325
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C589F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FHNQ3Obh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PJfFLjLp
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UwOf2602444
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:04:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RAv/rkDlHZ6m8ibe6hSjsssJtaF0S9p6cdTEayCygR0=; b=FHNQ3ObhT7bK5/4C
	oqmE4OEjPrUih9E4aKts1y0ItpoMxEikFCn1BgZADzr5epqfDzorCtim103Af4U4
	NfY+VSv+Cwiadyk8QXj6PM0/O6+EDRvDeoeI+Ah/yKGPzZsiFITQ9dlL/LM9iTOv
	LxUoqIO69eeT5DvPP2D2YMPc2zl9dvUyL0NotqnvZBSvDY6KU/6xBZ2hPnXtVTlc
	zYQA7SLMx4vDSkXjDjz8VgLLm6Dty59yKCWGXrjtUHUmzeMIipjyiwhcOJEO85RR
	1jRRHldj4sfNmYNbazIG4BriVdc10E0xt0xSdvqL7kF0cBBycMchzZ8eLnSouBm8
	0r6vbQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv71ftw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:04:33 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2efda3bfec1so3420095ad.3
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 22:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981872; x=1795586672; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RAv/rkDlHZ6m8ibe6hSjsssJtaF0S9p6cdTEayCygR0=;
        b=PJfFLjLp+t42e9u8jOnsmQXqwt3eVACkUPH2B9fO68D8SbRsJBFcTJCKznk3t72gbg
         Ynf8tcMyXuLmtWjNmbhta/7W3eumgHJ1js0kdNAFLhj/DmK/0CoIQzb/bQ2TptgTllIc
         UvcwzWhioZtt1jqtODkmf6gDy4QyzpbFvtyUt7TtBsnAyt2/I3aHHUbGLxAaMvobbCw8
         eYD81oTyWXvl5XqHoDryf6dn83Bfa8qlzJbB1UdILtU4YAWLQc2YSaKqbW8ifbuFnSo+
         By7Ru9Heg4bWHONKElHip5VSafpYz288et8lkW0p+iGsIivL85dmooKLi3ubQkiL7Xqk
         riIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981872; x=1795586672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RAv/rkDlHZ6m8ibe6hSjsssJtaF0S9p6cdTEayCygR0=;
        b=jWflTSjQEWh5VY8wgvA+o4Km5Ag8R2NkUCisj2e2NdbeObtwguzdOi+BH7JQAi3VZq
         hyElj/ottUuvodRLgH5nGz9epy9HGhlfw0xEGg4nIVb5Kljnzw7dRF3vAPv+bxqgaUBS
         AadJ8X+PVILIocRA+/VuAxCqWJMQESbhhhKSz+7B+MMpKc5t8q5yMrHICBCo4T+Yu8mj
         F4dqTvaNdn1mE83dAU9tU17ltaxyX/uY5vBaDOui6lhCMVIeTGI71/pmAORFWUBhJsTy
         X+qrNHF1yHnAq2ixp20E0+eC5hTP18oUdJHh1XdCP2MX/UOALaA8HnP6Gll3o7/O1mdU
         zMEw==
X-Forwarded-Encrypted: i=1; AL+hErEF7pBkZjmA2ElyMOU3bWMV5xJYjEFNNjTuLpEYILLVZTX3Clh9DgMc1LpHqN5ejZr/Fz8H19EdnhE0@vger.kernel.org
X-Gm-Message-State: APuU4Z+aJ8532nsnE3sa7tk6hkeoTYFjYnFHIuETkXjVXePAXtL7qI3A
	uG9xIny2+PMEt+pdLLlDjrPsKsJZOujgPmRy4Yn8W0ZDa5vfdNHnW7+cfeDcKoicMx+vAX85cOn
	l/NtlXaYPxjuVHxtazZ9KG2IcUUwe24oPwY77gnO6wfc7bHF7E46cyp/ma6rZtnI9
X-Gm-Gg: AZFdTZf+BiSHDRp290mBGthgRbNlXB40xmktxqwDL/MZuH9ETecS/1ojgYOh+2Vno3M
	bR1iXwZZUAv4J0ohZwkYMHzO1OLmr0Cw9v274RQ3dBvK9ZWDTBhxEM7VYawVre8lty5WVeqwNAA
	0UxqZ/GOYPe/Okusd9nL6WqVYS8r2h7jGJgqgqOhdxFEtMpp0MxXSrjUHwgN3/sbJJ/1y9CgLw1
	AwZT1FCiOq09mikz9WJfy3VNXtuDta6CWlX7+O051kal04X7eGRSyYVmVEPWv++fk+mOU47RxWP
	BWrV8jHCuU0Oib8bA0npyZ/ECnP7DS6jbj5kXinPjtCBtqRJzqbTsdIwqRKgLoIESyqNpLrGzp+
	Eqde0JoQfmkfzMe30Z4gg+I5AShQZq/gBJgtdvcq54TaFzPQpWBYUyWffhujXDZNN/4TWZd20NA
	==
X-Received: by 2002:a17:902:ceca:b0:2dd:c100:80ba with SMTP id d9443c01a7336-2eff7544621mr16464955ad.53.1794981872388;
        Tue, 17 Nov 2026 22:04:32 -0800 (PST)
X-Received: by 2002:a17:902:ceca:b0:2dd:c100:80ba with SMTP id d9443c01a7336-2eff7544621mr16464615ad.53.1794981871904;
        Tue, 17 Nov 2026 22:04:31 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:04:31 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:49 +0530
Subject: [PATCH 18/18] pinctrl: qcom: nord: Add gp_mn mux function
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-18-703f7badd194@oss.qualcomm.com>
References: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
In-Reply-To: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <quic_jingyw@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Lijuan Gao <quic_lijuang@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: TlWcGmA7Llfpaxn9jRMX3L7QbMfYti_8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfXw47ouhuGTsMs
 ZFFYanADZH1sd9ik50xKaD/TKJtk+3Sw7w87Gt/n+NOjShXhR2VPApZvfbeZja8e24a6daGd8HB
 YRZclcHqjHL0rglTsmpqv10WSOLVlwEhncM4ZQ3CmvJrvtFRH4RBCtHxlVHqK16DTvDicIJW05V
 UnyIPSMQh1O44yuEWglud8flFwwrvz03+iLZRu6y/40Ng+t4eb8LuoVnk+1rlY/73oWSFXpzv7x
 aIK7JTrHmVsmFYbs49nGjSTU+frCDjpRnwExFa5RhsBy3MQc7FYZpsmXGM5emZ3KGPiDFy7YVzt
 FGZcQsPEKkg0qDweNBuMYkLYu1biZHuDA7RUcaGVEIgxq2NSfDfUg1KOqvlZOQTnBiIaxXGiek9
 BDLTILwn26OQDoz1NTZlHdvDsgPBnhACHspaS94wCkqnqtg0dbCeGOMqrsmKm2J9gzB8JXuCa+a
 Ms1GVWCUlf73R5LfQvw==
X-Proofpoint-ORIG-GUID: TlWcGmA7Llfpaxn9jRMX3L7QbMfYti_8
X-Authority-Analysis: v=2.4 cv=H8xOUOYi c=1 sm=1 tr=0 ts=6afd3ff1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Nq_pnvwty-RK0duK2HsA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX3P7wKKhD7OGs
 r/vXa/mXpw5a2HvOPP6hU9i/p95YT8uCHRVgbr/S8ilGmQ/jO/e+MH0K5wMFWuke3iJ+bHPhZZZ
 ogbtN8dKRpVXW4rRHwtiq+50NMnwsIQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn mux function to the Nord TLMM pin control driver. The
GP M/N divider clock output can be routed to gpio35 via this function.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-nord.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-nord.c b/drivers/pinctrl/qcom/pinctrl-nord.c
index 010760cf0bf5cbbab95f41946f927c7a5f5e76e9..36b0644f041da07673ac82f19392be506df51986 100644
--- a/drivers/pinctrl/qcom/pinctrl-nord.c
+++ b/drivers/pinctrl/qcom/pinctrl-nord.c
@@ -542,6 +542,7 @@ enum nord_functions {
 	msm_mux_gcc_gp6_clk,
 	msm_mux_gcc_gp7_clk,
 	msm_mux_gcc_gp8_clk,
+	msm_mux_gp_mn,
 	msm_mux_jitter_bist,
 	msm_mux_lbist_pass,
 	msm_mux_mbist_pass,
@@ -1028,6 +1029,10 @@ static const char *const gcc_gp8_clk_groups[] = {
 	"gpio14",
 };
 
+static const char *const gp_mn_groups[] = {
+	"gpio35",
+};
+
 static const char *const jitter_bist_groups[] = {
 	"gpio123",
 	"gpio138",
@@ -1410,6 +1415,7 @@ static const struct pinfunction nord_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp6_clk),
 	MSM_PIN_FUNCTION(gcc_gp7_clk),
 	MSM_PIN_FUNCTION(gcc_gp8_clk),
+	MSM_PIN_FUNCTION(gp_mn),
 	MSM_PIN_FUNCTION(jitter_bist),
 	MSM_PIN_FUNCTION(lbist_pass),
 	MSM_PIN_FUNCTION(mbist_pass),
@@ -1521,7 +1527,7 @@ static const struct msm_pingroup nord_groups[] = {
 	[32] = PINGROUP(32, ccu_timer, tsc_timer, _, _, _, _, _, _, _, _, _),
 	[33] = PINGROUP(33, ccu_timer, tsc_timer, _, _, _, _, _, _, _, _, _),
 	[34] = PINGROUP(34, ccu_timer, tsc_timer, _, _, _, _, _, _, _, _, _),
-	[35] = PINGROUP(35, dp_rx0_mute, _, _, _, _, _, _, _, _, _, _),
+	[35] = PINGROUP(35, dp_rx0_mute, gp_mn, _, _, _, _, _, _, _, _, _),
 	[36] = PINGROUP(36, dp_rx1_mute, ddr_bist_start, _, _, _, _, _, _, _, _, _),
 	[37] = PINGROUP(37, emac1_ptp, ddr_bist_complete, _, _, _, _, _, _, _, _, _),
 	[38] = PINGROUP(38, emac1_ptp, ddr_bist_stop, _, _, _, _, _, _, _, _, _),

-- 
2.34.1

