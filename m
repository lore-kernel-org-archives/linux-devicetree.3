Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D598470E87
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 15:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787068497; cv=none; b=dJQNW9LkWsLRml93QPv+UQP03Fg2CxwDI/0e7D4MmqQ1RONmVPnYMwf4MdPRzB1DaVfsyP0fnBjEt39T9Su1MIg3lSri/NaJdefLxe9oN5M7P8pDRONcolL/L+4V9Q5qfUkk3LCcJF8Mhv1tyHig5qyV4IN02TRUI2VYzhYpfTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787068497; c=relaxed/simple;
	bh=N8g+DXNfDRJOD41XTpggaSV1LHWFsbXlVA7q2pwOZdk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fju4UlQ+Cp0WmbhjzEvnKdZ3BqKbcVUSWlQoGHoMbH6suewDrJSH/cnr11hYvp9G6dFdRXGFVm+CsDMZbIc5VftNj6Xga88grmNYLIZtgGGm8+sJsgvMZCGkMX2FGgYB9hZ8EoSJc0xNxFBUaI2LmntiT5YXc6i4qw3NJCDHHQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OoL6cXfT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CYALFQNT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OoL6cXfT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CYALFQNT"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IE0bPU1527990
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 15:54:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E3jglw0Wq9Oscb5y0P5uqnvM312XMF7ZNYTvPJQRdZA=; b=OoL6cXfTsJI5mELS
	/S6bfnV2UhT5L8ox5PRSWYxVFmVzjn5LqOOE0/jsanWsgjYK8GKvliH+14RrdUIs
	KAoHM+kJFDyU2GWXCcaEiHdUOoRHpbl8d6b71NtY4AJcl+xrQ9XSRKeuLdZ+mELa
	3Kbuy18Rp01j3+GlYteXqmvXr8iAzFHbxz4UP9YG5HDP0DkaonRwWZnwFBNOeU2Q
	nZAav2bSE+EgDdgOIbc2pHo22hIpoKyryR/oxKCF/CiIOWY24qH2qbfgKhTHEi1Y
	ZmyWBsG27ngab+YAbAleKKOjavvNTToVqg58QS6vK7QsJmTeuaE5/Dnda34Y5tXk
	a6oMwQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4qyx0stw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 15:54:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dbe39ce62so1243777a91.0
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 08:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787068494; x=1787673294; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E3jglw0Wq9Oscb5y0P5uqnvM312XMF7ZNYTvPJQRdZA=;
        b=CYALFQNTcd3PqNdlRO5VikxIAZTkGmIAtkreZywiV/BWql7IhJwh/QuurA5zjmwpfQ
         n4Jd5hL66gWKT9icQdbvmwgiSUsgwj5it4MRTppA1Ar7vNLizxOkHxkYm6LMokiUXtFo
         e8puIRemYOTBt/Q/bj27QzQZ/1qagoS95sDnUBga3cEGAxvnIx9fBkCW0Be/UcPB3JEp
         ey2tp1GcUO6HXQJ35zImGJ5xA3Xuw1vOyA/W5J91kSGsjDoYh12a7R+okC0jGq0TqShu
         gB2pULINnjeVAxYlym+yHZ+8FSrcIrq4gFQFIspwBgEHIiKvNaVHdMc5zdaROj7Lmo3r
         48Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787068494; x=1787673294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E3jglw0Wq9Oscb5y0P5uqnvM312XMF7ZNYTvPJQRdZA=;
        b=nTb7tvRb6d3Nwq2/fzt8XbSXnLRKe2Wk8BHK//DJcUiTDimnBztTQtuu0+sobjd81D
         QxJkdA5QY+sN1KmhgwHQLwwoRv5xWRvHoVSYFBvZk7xhw5jd2rk1+L/pKd9XNnvfQjAB
         SaFdNo7TvqFHjAdQ8Xg0xuuLQrjsiOCcTp8zF9/zNFshtL9BI1aJpLFf3FdlzhN/Os6A
         vmWTsHGG/lPBPP10gCnF11+KaXmAffZ6t1krtlcahELfj77O9zHJDzVUFnIgKd1Pgfcz
         in2UQb8U7RqtVvfM4iKbCJ2//2mBknBZReNHHyvpUCPMku4QSJtc2p+QEx4QbizCqY7o
         TjHw==
X-Forwarded-Encrypted: i=1; AHgh+RrPKCoDXIKGdenXljYqhjbLz9njFh9KmwLWDF+U7fmD3c59X/N6lhQKG1w5CzYUNXotmhVkidcDPSvr@vger.kernel.org
X-Gm-Message-State: AOJu0YxHhqlFrq/fzCXHx3j/fQrvQ4Z37ezKsBtcTjXTxg0ay/Ey90O0
	Pad/aF8yQuljwyfwblOsfElvCAAhGYuxcvMve/EhpD/nZBi67yQmuUD6OIOgUHt/4bEIEH8Q0UZ
	jDtk7zxkFMSVL5rW/ll31+ZnHrg+n4s4O83WkwE6wm+V68meqGxZ+92RLGY5kyKXf
X-Gm-Gg: AR+sD11o/9VLNl376W9i65PoAgS/2jDNW8n6cnzB9jNcSaifMFn/7P4E7Qm75ZoNHIR
	BkBBzuanESsL+6K8GIZWXV0InlYEP7juB21x0IGzdGeQYf+FQYEDSESfr1ei3SCD57KqdwjEiOq
	kr72GT5WSZdbhHpUejypYyiEHM7p61ctsVHaAUYlkLkuQH115gLiVz+IMjzCO4GjuJanpTschlb
	kB+wRkv22bZGEFKBhAxiuKsSZ11Bhoe9aGo/2HE5oOoKWjZKRo3LYIhPDWzCsUQumEsWAl/GpZd
	179rF4Zeps44m6cnIL03/a2scsRI8zGQuN3P7Hq9utaJWrrva6yjKdbGSHRIjdXtCn/ovixSWqV
	yh2Ch4cq3Avh595J0SiIwr8eov/XPMNMsbg==
X-Received: by 2002:a17:90b:3d92:b0:384:927f:3db9 with SMTP id 98e67ed59e1d1-39563854dadmr5435304a91.1.1787068493913;
        Tue, 18 Aug 2026 08:54:53 -0700 (PDT)
X-Received: by 2002:a17:90b:3d92:b0:384:927f:3db9 with SMTP id 98e67ed59e1d1-39563854dadmr5435258a91.1.1787068493455;
        Tue, 18 Aug 2026 08:54:53 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39531fbb41esm8877721a91.10.2026.08.18.08.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 08:54:53 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 21:24:17 +0530
Subject: [PATCH v2 4/5] media: iris: Fix power-off ordering to disable
 power domain after clocks
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-iris-fixes-dma-pseq-fint-v2-4-8dc8c4b3880e@oss.qualcomm.com>
References: <20260818-iris-fixes-dma-pseq-fint-v2-0-8dc8c4b3880e@oss.qualcomm.com>
In-Reply-To: <20260818-iris-fixes-dma-pseq-fint-v2-0-8dc8c4b3880e@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787068461; l=1899;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=N8g+DXNfDRJOD41XTpggaSV1LHWFsbXlVA7q2pwOZdk=;
 b=YS4oHlm8T8nCDzMMg9SyTy5BQFzxnfosvqqjBnu1xiAUXnPBIKNHNGhgZMbqLDDNVQ2jWNqek
 okaZrqlPtpPBpf8eVhlWHydpoSkCSt0g/tuoP5IqMhkuugyWG3CcTq+
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDExNyBTYWx0ZWRfX6k9SQsrHeUH0
 u8zEuzrEMmVPfru6y7UGdD035wnj64kMwVQ5fe1rt0FVyShpgyh/rL7WQ1+ZAp1/nWeyF+NTHdJ
 BU1FDjB8Sz91/Cjvxkv19OOHxXOzinw=
X-Proofpoint-GUID: fKh4i1iGydZXEZEdICJ8L-jcE7oxczgT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDExNyBTYWx0ZWRfX5cWTpoK1fkVr
 Y7Ri4iEw1IG285UWyE0msVHtT0Wm/PitbDpFU3Q9zN6IvDTKIIZsifL1mz4P8o/n6KB2Rk+pxw6
 GeGMCmb1wamm1xWGsADBSty/m8ynHeG5yeEZJK+t/xlZKCkBcMXWaNTqtuIqLF3tOvvYx418xvN
 0Vq/VR3fPz2Xf6LMND2gaDHjA2d2u99YcS5COc3gcI6ZQGthcqIyncc3yIP8cu/mM6dn2ZZt55H
 W939uukkrVvAERYpWixj9TvoHur6EFLJ+rbntNWckUbscoX3UchSfxtiHpU2H/SoN8nKqkPDWYJ
 LjATqwbeoPfDMxvq3lfl1NvSdpQn+++o+gzsZPq+XhOrwaQHADW9p/U41G3hlULVZszxHTqqwqp
 pfeRyRTgQ46osXxAWVSZxyfJeJ135cemrRuARwqQv7hoJcsnasIMWoigHrH5k2qaAI9tya9KorL
 JD1Mzv3AjexxzX7fXmg==
X-Authority-Analysis: v=2.4 cv=Ad+B2XXG c=1 sm=1 tr=0 ts=6a84804f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Ou1eOjPKtcA3bHzkrowA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: fKh4i1iGydZXEZEdICJ8L-jcE7oxczgT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180117

In iris_vpu_power_off_hw(), iris_disable_power_domains() was called
before the associated clocks (IRIS_BSE_HW_CLK, IRIS_HW_AHB_CLK,
IRIS_HW_CLK) were disabled and unprepared. This reverses the correct
power-down sequence: with the power domain already removed, the
subsequent clk_disable_unprepare() calls end up operating on
clock-controller hardware that is no longer powered, which can hang
or behave unpredictably.

Reorder the calls so iris_disable_power_domains() runs after all
three clocks are disabled, ensuring clocks are always turned off
while their power domain is still active, and mirroring the reverse
of the power-on sequence.

Fixes: bb8a95aa038e ("media: iris: implement power management")
Cc: stable@vger.kernel.org
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index e4847c107709..3cd493b06d84 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -223,10 +223,10 @@ int iris_vpu_power_off_controller(struct iris_core *core)
 void iris_vpu_power_off_hw(struct iris_core *core)
 {
 	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
 	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
 	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
 	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
 }
 
 void iris_vpu_power_off(struct iris_core *core)

-- 
2.34.1

