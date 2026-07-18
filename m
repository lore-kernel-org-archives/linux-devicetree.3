Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB4D5733E
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784379417; cv=none; b=J1G59x1XaeEf4SqjJjO6NyGrpzEM3UnBnrYWE7SgGCGkHy4/+YzkOJsgC7nYafS55fa7FVRLYBr0a2+F4bkRSgNE0UQyE0CEWe2AMK8+wkZLsk1qPtFeBJJdApBHtm8b+KpSoOa88/gL4neyyTs4o2cqzdW+W2UlTWAzhkI48yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784379417; c=relaxed/simple;
	bh=dGEfhAK4uupgOhUwPKBGXOcYT4gsGsCJr8Sy8qP8Tq4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iUOG/mpezRA0jTeOiq8k2zB9no2RbtLP1s7xGsf9lN83Y151JTjP4HIIFsxDU2gpUXw0T7jIo+5FXJwCrFKw9cvaPp97XHxQ8nP06J9n3plVV1vj6vUZ6m6ANYxXbx4JjNHJV82iO5X83T01ou/Nf7fO+JP/MHs3crC/XmCiT+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=liYCtQzi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O/MP68Xi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="liYCtQzi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O/MP68Xi"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAHENb583709
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oytBSSj2PCcWVbML0Rvj5z8zTJN6Ww96sRR5XsSIIdc=; b=liYCtQzi9X4oMiJN
	OYMXBtSZJBs7I0iIukH1G7PtEzvA3iQYt4L/HLm3xHums3jeQ54xjzDhKs6P0PvB
	IQ+FOg/F1+Z19pV9jBGJNUjtVi5hDa1DSdZRilZgcjCFdfHamCC5YDvVi4MK78X3
	77Jxr76CENUhSiWztDwNubMd0OFHgLWBzVpXI3Qq7vjJkbKwD77B8qJYYJC+vRpF
	UsmBAtvGVSdNcOIDzUHmaJblBrBoHV6YquxhWA8fuLnCBlt6Xwed2lZ2FUmX5A04
	drnRDoHGi5wazSPQb3deyazLBJ00yyDeTr1Kc0Ry11XfX40Oh2jLub9RAaswczs1
	oVryOg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2d90rmc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:56:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb6f6a3f4so42516855ad.1
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 05:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784379415; x=1784984215; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oytBSSj2PCcWVbML0Rvj5z8zTJN6Ww96sRR5XsSIIdc=;
        b=O/MP68XicPUrJa5BNeG62xJde/HCh8eQjjK652wyycti2VlhKAc5SH3HJ/IEv6pB6r
         MCyXVk32qz/GFZRMRsFhlMQA838EePYm+8EK63pMsC3QtC73otkTislZxeNO1fLMWJuy
         wLLGq900ycdgF/gC9FMLW5YrvdQwwKUH+Q6f1TZD04YmQO0ad7rbPHx7+i3zCkaLOsMj
         aZFFqZCZjioKyAC22OgQXND72t57MaxULTunk6/GwnuyL2InC/GQ9Pa9aUnmVK28jmfu
         DsWUyvarwmMvo7vvvYIuA+VzO4VuWwWgLbVV4g4+NWTtDvUtI8dAZWGgwvrpIY+DGFfE
         6Iqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784379415; x=1784984215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oytBSSj2PCcWVbML0Rvj5z8zTJN6Ww96sRR5XsSIIdc=;
        b=WfNjKP+gil3MIYTfsueEqNZPFBbYRzd0MPhaqk8ykom6y+kJIRvmtgJCf02kq6/+bo
         8wt0UyI2O6voD5Jl5umDHxQyv5kGEZHPYdvxM74YKUryb43U0szor1E6djqRbvOJf69H
         VDFr1CR+4c4Kb7KAipc33ZfGqSivfCATP8s0tAVM/0moE1gbfXqkpcvaatResTb1P8Q9
         J/DG7/IP97aoaY+/+ofDGH9ElnF4TcW4PLlTXWsqFOf/CyV4+atd88sWSAkiYUJtgqHq
         DcDs6GHqQYhet+PJ7/6K0bdWes0grIRzcCV2gKEGWxI/QRFHs9jd988BjwyzAjWkrPkg
         pgow==
X-Forwarded-Encrypted: i=1; AHgh+Rq3BgqtdQrkehDn01VZ2OFhtFbg4kx4q3ONYeYBqKwjYakl9sHzP+IEtKfjDRoFX/jP9CrtqOdHMI8P@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0m1ZbO2MTVRJJ/4MBE6WvUJcXmMX1ozErFckVbNSFsmpt42y5
	D41MjbkWpv5fTfG7/loQg2HXaWbc2qnG6mETo40QIcSg4rplmtXo561lLygvtvpTOUiYjzxAKAe
	3cCSy/YSaK8OTk0f0ojwYqaVzDwRRiNaNOaqOcklAb4l/BmF5Fy4T1mlajf+L9BR98olovC8o
X-Gm-Gg: AfdE7clkKiU4VI8YjA+IWMbSetVrX7xpfbop3ZsSjOdftdehugUk7ia082xWTZsxvOF
	heVdfmRShkRTVUw1iqbEQ3Kj+KRsYHrf1ti+GTswth5UqWUNrNChSXMcfC5yqQ5kn8x3+yefZMC
	FlgizT0l4jWYhERtaK9pjkP3eqS9//HgqSnL+FgpzhVgFinbxxooJfuaMb5w294EfYbYjzxwdBD
	anzPfsUYbcXLPnyDLCADdmMVpD/CBzETDQo2BXxQhugk6sUJaBzxQo7dAq+xmKG2gJhv0ki65sj
	JN9A/BU8izC7Lbc+OnfikOlc/1HJuD2uYYOqlZQDfHdIAPtXXXoXmVz6Xado1ot2FN9ZRzKnzgG
	2C0JelvmOBdE+ZZgiWXiAOlSjHWR4qV4=
X-Received: by 2002:a17:903:98d:b0:2c9:d56d:afa3 with SMTP id d9443c01a7336-2cf1f4bafecmr119853475ad.15.1784379414938;
        Sat, 18 Jul 2026 05:56:54 -0700 (PDT)
X-Received: by 2002:a17:903:98d:b0:2c9:d56d:afa3 with SMTP id d9443c01a7336-2cf1f4bafecmr119853145ad.15.1784379414444;
        Sat, 18 Jul 2026 05:56:54 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a18a47sm14238910c88.8.2026.07.18.05.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:56:54 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 18:26:12 +0530
Subject: [PATCH v6 05/16] clk: qcom: qcm2290: Set POLL_CFG_GDSCR flag for
 DISPCC and GPUCC GDSCs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-shikra-dispcc-gpucc-v6-5-62703e05ef0f@oss.qualcomm.com>
References: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
In-Reply-To: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=HpxG3UTS c=1 sm=1 tr=0 ts=6a5b7817 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=WgD0fBIP9JuU60yQWEYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 2zFn3OxD3BUH-aMOx6cxApsm5Qsc5F5a
X-Proofpoint-ORIG-GUID: 2zFn3OxD3BUH-aMOx6cxApsm5Qsc5F5a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX+JWJ1n0Wm4/F
 SpPuwxxWG0INr6qSQdmWAOYEyh96RvFPQ6ID/5u5JdskjwC9ycG3II33Q3r1CPbVIrv3T6hHdCM
 a/DYYpp3q3ytYDlbcwBjsYkSL4jRyZDw9Yb9Fh2LyR1i+DcEGz/fWUbpcYCNa6sF4JPpJzQGfTA
 nW8WJdmYK7y+q43aUBOKZqSX1zNbZyhBt1UAKLLYsxFZWBypj663vavA/E0MJSMxijeFftPU6Dp
 Ab+fny6OFnMSPpwXacLmo3eR6JpW13cPQRB8X1t+M884lEo60WK4iQ1gZQd29wfVy6h9+YqIqRU
 7k56Z4Bgdw5lRY9vdBp9URE9Hr3cnrPPoYMY4hSZ3w1/vOS0f3o9Zrkj+A24StYzpra5mACUR54
 4m4z3I/+CuX3cDzR3iGfLsHYeXLcZ2f7CCFwYqJEoppmEBLAFwvrPz3Upyv1FDTB2LO449TUs9h
 JZH7vfAZCQcBZnPJ+iQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX/SwLd8lyFGI2
 F+9PYWYMeNvdFRSkft5BZNlLthAmTOEcX71evPeNkB88VztZl3o1V547aMpelH9fDfBncK7DzXn
 z7LuNEeW9jTQhBsvaKF3l+ZY45rOi+k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180133

The Qualcomm QCM2290 SoC GDSCR status bit may not reflect the actual state
of the GDSC, instead the power on/off bits in CFG_GDSCR must be polled to
determine the GDSC state correctly. Set POLL_CFG_GDSCR flag for the QCM2290
MDSS GDSC and GPUCC GX GDSC to ensure the correct GDSC status. This is not
applicable for GPUCC CX GDSC, which relies on gds_hw_ctrl status.

Fixes: cc517ea3333f ("clk: qcom: Add display clock controller driver for QCM2290")
Fixes: 8cab033628b1 ("clk: qcom: Add QCM2290 GPU clock controller driver")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-qcm2290.c | 2 +-
 drivers/clk/qcom/gpucc-qcm2290.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index 2350ce7f46d9f6e395c87c7a00669b10e8bce3d3..5f5bc5b1e09e2207466d2972ded91140ce8a6ecf 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -455,7 +455,7 @@ static struct gdsc mdss_gdsc = {
 		.name = "mdss_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = HW_CTRL,
+	.flags = HW_CTRL | POLL_CFG_GDSCR,
 };
 
 static struct gdsc *disp_cc_qcm2290_gdscs[] = {
diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index 66dea9d2a0e519dfc64d977ef107b5c875da3869..3b130f69bb93898ce49654f2366851a7c1c94524 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -313,7 +313,7 @@ static struct gdsc gpu_gx_gdsc = {
 	},
 	.parent = &gpu_cx_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = CLAMP_IO | AON_RESET | SW_RESET,
+	.flags = POLL_CFG_GDSCR | CLAMP_IO | AON_RESET | SW_RESET,
 };
 
 static struct clk_regmap *gpu_cc_qcm2290_clocks[] = {

-- 
2.34.1

