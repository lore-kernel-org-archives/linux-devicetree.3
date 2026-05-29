Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7D33AFD15
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780040121; cv=none; b=pOEoRGLhOda3cRvJluZBjplJdpn6vqNCYB/cZEuhBryNQ2ccU7bgO8fx2ZdcWq1rZSnl+yQcSzA7yZ/185PMbY4npi2Os8JKmI+Y7D1al08TpW6HnPVZbgOIeMNNUJde9S/RfdAVAFBBrNh4+Re1iTZsPnRwvqOQLgB5ezzfloI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780040121; c=relaxed/simple;
	bh=w6oWbfDOj/BPupXGbVudAgjHSjNgfkhVHt8iQTi4sQg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lG7x1sywqWNEPdYSCW0PtKWgL0r6muneTkGDFux4jw2ezXHUJknVxQSy5UYs7p7r+bhBeMu3lNNLe8PHDWs3dFQbrdwakHv/Vz0vJctCJIVclbEFjL8tntr7VkJXNSw5Y6J4Ckp8yu0a5mV8iaG4hNAmS6znI0DoLi+TrKvBztI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ElR5DlSe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MyX7IFBU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ElR5DlSe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MyX7IFBU"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T4THuE4193434
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:35:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	COZw5o5UIhVUejwwfofcoXUCz1oK/yVZrfytNjE34uo=; b=ElR5DlSetqpYNsEs
	/vgTuafi+h+pGUlX4p9Ta3nxUPhhiVqOwSRwOfmZrtJQVF0a9KhQOnntzApHlDbq
	LfaS07A/eOL9Oqy9DnBQ9wT0vKGven299IShWrzePRCt/8Manj8iaxgPI6SziSKw
	a+IqooysEiLS5iwDktYD6jvKVCHUKddragedu6yomNAJWLobIWCqvc14YbvGVurm
	tUTdJ7dvOsX14ChwDXuY3CUB0yDX/QuSF6rbYQR8okM0qnNSDxatR8qq4MtvAqiz
	J4Xr3ZR1sx7AdcxnLkYbfBWx42L6l/erpIcsOOe8pO0aXySJ77vjvALrndYnA/VJ
	tlVV7g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef3te0qah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:35:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf1dece2ecso8065435ad.1
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 00:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780040119; x=1780644919; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=COZw5o5UIhVUejwwfofcoXUCz1oK/yVZrfytNjE34uo=;
        b=MyX7IFBU9ziNQOWSOQFNh7tl1OKk/DZhwL9I84vGFoMy9QGgDD+4cxqjdlUwMbSVGb
         eN3qi5LeXWDRXxMIIccUB0gJtpNpURkm5hfgfo1aDBtI8p1BqEG4bhF+mN731L5RlI5x
         VdSrlW3rhjXsXDjjp9PXp4jyfjss13OVbEI7lm2IT53V9gW5CCqqypYW6gPK9IAdBGIl
         idKC0DAm8fxnIWQ72B9Tm9OvnhGiI0eg5ejMMOTlHL/OvacB1oULIy0PDAlwJ2V9rHYh
         59Hf3dw8OyWw3wi6b/mn0eV8MVqmezyya1+5zDj8S+J7Dcrga5vtmGbjAgTrAV6m79j2
         b2RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780040119; x=1780644919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=COZw5o5UIhVUejwwfofcoXUCz1oK/yVZrfytNjE34uo=;
        b=DLde6jLCGXV8XNjmJaF5Kd8k3cg5VBWbMw5dvzx7dLQDAAIb967ibv2I313Thy9byf
         eZFkhlZLwTMXo+MD1XVw0xOY2J/QX/eMzIEzz9sKNtRA88tlzhwgjTOYjqSj6xHI2VT/
         19Jr4y1fYh5RUr4r+TzCwhpCd0uunuusqnHBGdN67DcX5oNutMGWtlMowN5Cj+A49sO9
         pJVeV5jt19PI5rFYomtCqYmWCmhKhmhlJhA7tmwjxQYISxP5+O6KbVooyf47+6tDkcH8
         D145ubKOwJEBCGNEMrO+yaEKuObnUYIpQjSesW6OyZgDP+Ql9nkkCA+GITAdF8/JNyxr
         A4AQ==
X-Forwarded-Encrypted: i=1; AFNElJ+nQnzHDPjiWoJDje/Nx4yM0/Mja6UKoyfMxU0o5bE4vWJp3jd17cOtWdtc3FvnYSCilQwuLU1LkPPA@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqi12vO0LvnVRX3CjkH2VDdBJCiz/wU5mvEZQEejHWwgQRq1xR
	cGsq4glcNeauHcHOPDVbH7kmIlgqrka6/54hgzeCm3ibKIFyCP3531D1KKiPYpPxbs7oC6P45fj
	aEyNfaZzvq3IFeaIVkg8zoEIFp+vUNlkMGhMHAJ3dpSvt4dhiZoHV9UCozzpNjK1e
X-Gm-Gg: Acq92OHM9zEBiLJ/1e4aR1n6zD/Qw2uvbnY99gEzZabTqWiQA5SqCi9Ezo7V1a6Bqg1
	gT/yUM9z3+JUGzIlrL8KSyEk7jG132RNkMYa5e4tuoDL+gY5vrDQuHwoR33B1xPYP9MB/QhFw2W
	82fSP0eB+s06w4Ocq3BF2SUgFDjMy5A2oBAGqzhM8f/pf15p5y84FKLRP1rmVu9t+dWwdemlfv7
	SG6dU2L+OYI6tlLB3WcugGuvW5s7zFkZBt78TOc/x8LnvU59DZo7ViAiK68FXNSh8A+wC4qnQi4
	T4Z9t1VUL6YcYQe+AlkDXb0bAJn9fmaR/abq5WPBWIBeeRTji0X1xVr820thWUqZ6V7rWiqVmU7
	IOnxFq/1Obrrj/fW4l/OVeQ8C7AFIjNeoQWQ1ObzL15c5fmKMfFEspJD6vdPQ63AkAf6q6cEbot
	brhNr/dek0shBezV+hzY9PYTkNuELV1cs=
X-Received: by 2002:a17:902:d4c9:b0:2bd:1903:6ced with SMTP id d9443c01a7336-2bf20cf905amr23286815ad.41.1780040118570;
        Fri, 29 May 2026 00:35:18 -0700 (PDT)
X-Received: by 2002:a17:902:d4c9:b0:2bd:1903:6ced with SMTP id d9443c01a7336-2bf20cf905amr23286415ad.41.1780040118068;
        Fri, 29 May 2026 00:35:18 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b011d3sm9767335ad.52.2026.05.29.00.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 00:35:17 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 29 May 2026 15:34:59 +0800
Subject: [PATCH v8 2/5] media: iris: Add hardware power on/off ops for
 X1P42100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-enable_iris_on_purwa-v8-2-b1b9670459ab@oss.qualcomm.com>
References: <20260529-enable_iris_on_purwa-v8-0-b1b9670459ab@oss.qualcomm.com>
In-Reply-To: <20260529-enable_iris_on_purwa-v8-0-b1b9670459ab@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780040102; l=2070;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=w6oWbfDOj/BPupXGbVudAgjHSjNgfkhVHt8iQTi4sQg=;
 b=FivbE9ySB0pMWqRMINmWT2gQ0iQYeXqUZZzN6HFlewOJ2SHoOEzAjpS20neXRvTHs7328fNIN
 pBmimr3MGF/DYuMdIaVJZ2312XXGQJIymwjsiX7gQhdAFjR4NAPws6K
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: wkr8OiFHkrKLCRo3NfxHmSyp8BrTw73d
X-Proofpoint-GUID: wkr8OiFHkrKLCRo3NfxHmSyp8BrTw73d
X-Authority-Analysis: v=2.4 cv=daSwG3Xe c=1 sm=1 tr=0 ts=6a1941b7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1Ijdk7qaabStWezMxE0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA3MiBTYWx0ZWRfX+oB1ZxcZCbGP
 O/t/r7daQGFmJ7OqbSDyKp3soDMQapwkO3RDpLfvg+r0J3AM262VAcL/Y9PZnpEVIVcT8gAE+75
 5FQfpWKXkRcuoqKgU3NrvicnWtXxr3JgAODSGfguVmLZ38nA+7KNy3B4I77J9mNoCBycZzDH4Ss
 q8Gr6WdjZOHtVvmXqgFFWAxkNo8d6Ai4gmU23/TYHDhgusA/PSUuxzUWlFAdGzKm8wR1YZ+RrQ9
 dvpqd/eWTygrWhb29SO9Q2aNn+QHPIKdSii1pwbtxmQGP43masYH9B7mAM0BgZRlL43nEAEaewz
 YMBTY07YacRSEa0FEDNp2amsNlrDw6FWoHBYxD7gRibkl0C2/R3eRfnIfwJLEvU67Q4+4icVQDR
 /NL5Vl1xJ46ZGtVRgMluEoXIXnN+sVKBuFxmccgM7tqFSoHmIi6nVwdt5e0Wk39Y9ULOwrWmZKc
 3lT26Q759JUvJ242j1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290072

On X1P42100 the Iris block has an extra BSE clock. Wire this clock into
the power on/off sequence.

The BSE clock is used to drive the Bin Stream Engine, which is a sub-block
of the video codec hardware responsible for bitstream-level processing. It
is required to be enabled separately from the core clock to ensure proper
codec operation.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 3872c4f37987ebbddbb040722adaa252faa40a73..5a85568c5ee1c5b656131607e7aef1b8a75e020d 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -224,6 +224,7 @@ void iris_vpu_power_off_hw(struct iris_core *core)
 {
 	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
 	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
 	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
 	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
 }
@@ -292,12 +293,18 @@ int iris_vpu_power_on_hw(struct iris_core *core)
 	if (ret && ret != -ENOENT)
 		goto err_disable_hw_clock;
 
+	ret = iris_prepare_enable_clock(core, IRIS_BSE_HW_CLK);
+	if (ret && ret != -ENOENT)
+		goto err_disable_hw_ahb_clock;
+
 	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
 	if (ret)
-		goto err_disable_hw_ahb_clock;
+		goto err_disable_bse_hw_clock;
 
 	return 0;
 
+err_disable_bse_hw_clock:
+	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
 err_disable_hw_ahb_clock:
 	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
 err_disable_hw_clock:

-- 
2.43.0

