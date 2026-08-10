Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8223DBD48
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 13:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786367040; cv=none; b=DKZ7GYo4MOpaTtf3mMxFQYsfqicSehs1QZRN/hy6FzDGYdltE5l3wcBxKwWxbKhqcmEf/4CkG6/7BfQX78A8VLDkMep3CU5HgNL7ynSTZQGuYVBnI+cV9hH476V8LcfFBgJOh7YA/+r3x3jcRNZpmh0SbQJ60gLOl5oekdNs2yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786367040; c=relaxed/simple;
	bh=5zH9MhKLaZum2KmKZSl5RInPW33ffUQGYHOoNnSZWAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Oe8RS5MQsUnC2P34yJbb81dusCeA+AFs/a0qrNNSXVxsyLEO53D0ny0lRzh/P7PDsGZgwfs9fJKSdlTBY/UdgHhnOsLUb9StOMommWjTHPA45UrlX3Hej19LFBhHe1AvOUKoAGJdfF/Aa9B98DYkhnAyEFAczUnyNbLKuLiTs88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c8DJpnPD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NAoJa7XK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c8DJpnPD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NAoJa7XK"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACj0Qw1671296
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 13:03:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e0L6ragntubvXbBsjspOrbZSJXFtACGSMAqOSg7odQ8=; b=c8DJpnPDAlvPlVcL
	7Dnhm6XvC0rrrcg8ugIlaKPV++AbzZDPGgpmAdC3VLcxkhZP2LRF59X2qI9pVUUb
	roUshqxZmG8G6KBHVgDTsE90IWM8WqKA6egrcAg/3ZmeeACd1hgBpzQtuEaT59jD
	TyE5/s4ZPuFlvfGho495UNJ42fn3QeOMcDWcY8omE3mxL+ZDS7gQJVUEiNANBIP5
	mVE3NIPDnf1XGLaISlM30DmZWzfkHNqfmQ4d1+oWrE7+mWj9JhZVGhifHuAomRTv
	T7hDN1OhMoUHcyHSrTSqoJMMerhEburVZJDFRXR9XQAeg2m49WK/1b8ndyMsuXmN
	LRtJ/A==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v29p3x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 13:03:54 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6ae8d87a96eso957791eaf.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 06:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786367034; x=1786971834; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e0L6ragntubvXbBsjspOrbZSJXFtACGSMAqOSg7odQ8=;
        b=NAoJa7XKTgz4IKILg9IOMsACSBJ8UH9z9/hb/O69WR4D9o/A3PDax8vVw3Ux0gA8DT
         YWrnSxdks40dOnVnbhGkZHNSq2zOA+Ovyg8ZayosjY+lH/NXIlm1edPMIUf+pscY9HD0
         NAbVI2mxLmZ3XS/FYn1f0nX8iBFhlEWfydkkiyMLZGBJraqZu2h2wL23fUBv0dJ8bjIB
         h9tpEHQ+8HeKKN3zHc7zDoyrJREaT1S5Cq5rP1ktl0jmROFN66JlkT5qUW+M9Pd5MziO
         1ADh07rYiO3W50gG216U8R+okT7pHsW6zlwtPeI71chP2dYGTn/LvLIVbq0wIfgEXtdK
         ClCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786367034; x=1786971834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e0L6ragntubvXbBsjspOrbZSJXFtACGSMAqOSg7odQ8=;
        b=r5+LmEbjOHItKdLdkjbSkx9Luvd2cIBc1E4638b5axk9CLV0+LnzSVsH8c+XTDGk6N
         NnNqnZv30cE2B5vbaL+YEvQG2sj6X9D1/6DSNKUTjasRpC99EOaXa749SrfQ06kodFKV
         qoEWxLgu42MCDoBLsuVfqGn46GpFuoXp9KVinmTAi5SZ01z3Jz3X3qYKfA0j4trN3UoW
         Ai1A+qmKuOweITdkxGwPd2PLqRytQVhyai6C7tPGzhApYx5YtukEuepsYc5buQdzF+xK
         glX8jgdxqYtpzNk4cCOgYsUCSYFnF5f2FeNhgn8ZBjsMA41EA90mcGzbwuFNC3d9nwbp
         KTmw==
X-Forwarded-Encrypted: i=1; AHgh+RpWcYTGYZ/+jXhi8TsD0whw0hfAB7UtbvWGmDugrVdDEI7riJOpB8UpYeOUXIN+dWrTNzXwgdMS8aCH@vger.kernel.org
X-Gm-Message-State: AOJu0YyNSC6qr6i15koXfJt9T+3h6G43NZ/Fxx55RCauASCyG5NUO7qx
	NdVonqdaMTPjhwtXyMyqG+p2JohSJ0xgVBGUgvUbWGMpfvvI07POWymzgQVuJ14i18WUXmNhkLP
	0jC0R4cOW64bBiBbdE9798TAKLm0Ga8qv54X5DgYzon/1OrRxw3/ZK1ncdTCtXkkBwMyk8Tm0oU
	8=
X-Gm-Gg: AR+sD13AR8ebIJEtXRdlJzOqWbBAPJz/FslFwGt9bnG1qU8wiFfdvh6m78EHqASZHEs
	JZG8rSNYQrVEcidqDIr/wPHuvZVvy+hb4K1aMEu6eE1J9xD92GWPsLE5zqj84/yTRZRJD6klrEc
	SxY3a3CNmU0f1bH5kxpPJjnAWIUyIT5CVH5P3nlahoQ6Jt+00ml8L8u5hq3FGzbhYLTdxvuoBSQ
	4fJxJ+8GXoOFcKwwtyTXgJWEpeLlQI1b95TZA2JQa3ckhVLzna9/YtyVIeOTUaU5efCWPAdRd/5
	UT1N7TuTtVHp8vPBhljbmV3aV9Cps5UppXMUAtL4pJtM/V59MmMVFbUKfqKgmQ4Lci8dtdEyb14
	WD9RKB6Zkm3tmFTc5+dbfru780wubhOkmGnbCKp3eE1yxXHEqyEuckovGUf2tvfS5
X-Received: by 2002:a05:6820:c95:b0:6ab:13:b207 with SMTP id 006d021491bc7-6b0909c5b04mr824782eaf.27.1786367034062;
        Mon, 10 Aug 2026 06:03:54 -0700 (PDT)
X-Received: by 2002:a05:6820:c95:b0:6ab:13:b207 with SMTP id 006d021491bc7-6b0909c5b04mr824742eaf.27.1786367033611;
        Mon, 10 Aug 2026 06:03:53 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-459f1a9e431sm8218971fac.6.2026.08.10.06.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 06:03:53 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 06:03:29 -0700
Subject: [PATCH v2 3/4] firmware: qcom: scm: Allow QSEECOM on the Glymur
 QCB
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-glymur-qcb-v2-3-9e6ea7987b9e@oss.qualcomm.com>
References: <20260810-glymur-qcb-v2-0-9e6ea7987b9e@oss.qualcomm.com>
In-Reply-To: <20260810-glymur-qcb-v2-0-9e6ea7987b9e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786367028; l=999;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=5zH9MhKLaZum2KmKZSl5RInPW33ffUQGYHOoNnSZWAk=;
 b=51BWj1htH7YZOCECgS7ER6LaPV1JbRKMoqxwWQDMBP0DQmOXqLFAoNmY7AnTzI2r2mnbcTPHi
 6FSXVQjbMJ1CJY4lkblqz2B9atgs+yLgAgS5pQZHq20F3PAyE9ZsIaC
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=S9PpBosP c=1 sm=1 tr=0 ts=6a79cc3a cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Gf6kasYTCoD6TKqZ3V4A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-ORIG-GUID: NQTXsCp05HWyXNl_-z9r2rdSg0PKm8xx
X-Proofpoint-GUID: NQTXsCp05HWyXNl_-z9r2rdSg0PKm8xx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDExMiBTYWx0ZWRfX7Zwl06r7xpbE
 gODeYoP1XCXNi9ZmFK8wM9j8Xj61OwPJRDaQR5MDNE38V/E5qHBt0yV/USvCLiZOUEnmesP3t5A
 dP0mbK3A26UmuHuHJ1J4Rp8hU9srPXIX+ioyW7h5+NoQD9uz8U/61OlF9xGsI936THINs28V1Hm
 VwkaVACutIhhlVoyV6jCOy87pwSS5NLgRZKpe6fHSkiGamcISEOSFZ+mPUNCSGT/lOP5QFfGPPA
 xx7xRKHuq9lU/C1ouHFG6lIc74gpy6TyrPKlA/6SAygBoQ7Fx7tu8nkkKwTMa6b9Kp4JQXMQ6uh
 468Ew1ZTVAG2cFElg0JuIPdBaEOBHP/S7y/dV0jWVIbM9DwuC2Rp0mAoI3fMD81as0MSZQNOO8L
 zh2TANZFsHpOvU/4LTHb4DMA9DnoqcFJYkwqpVVo8B+vbypm6jnIIcBGbe1aCm9LOa1DvCUGDF3
 KLacXtR7nlMGdtRP1zA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDExMiBTYWx0ZWRfXwK8qaeP16EW1
 o5NWryq/T6t/WisUT7L5zQLmMsXySz+0EoBY8ETORFQwtIcNRnDormy5XiT1yMkkfNHNeU98TM7
 LznFcV+Fx0KZR2X82aWlXLCxg22zn04=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100112

Add Glymur QCB board to the QSEECOM allowlist for enabling access to
efivars and uefi bootloader.

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 3eaa4c9ccf3c..5ca1149a8438 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2327,6 +2327,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "microsoft,romulus13", },
 	{ .compatible = "microsoft,romulus15", },
 	{ .compatible = "qcom,glymur-crd" },
+	{ .compatible = "qcom,glymur-qcb" },
 	{ .compatible = "qcom,hamoa-iot-evk" },
 	{ .compatible = "qcom,mahua-crd" },
 	{ .compatible = "qcom,purwa-iot-evk" },

-- 
2.34.1

