Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6907E3AFCF8
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 06:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788936069; cv=none; b=Ezclo14Sd0JQORws9O4cx5MayNoSi/8V16HShIiMmsLkcMilK4wgpbIN2qRwGOz2b3o7IEurg1o7UA5aj9Fcfsuy/j33OirjIBl0qU667gF2loIN+EhWCwzV3hTN21S0vwJt3+2zEWdXk75Xu3Hhst/w9TV10ra37AtH1uWqyeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788936069; c=relaxed/simple;
	bh=+Jp6VRLD4MUVawAQTMdryv1q6Q9g8UqRjjHIGO201dE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DEZfCCP9QxS8Ley8sRYzdT0Y5Sl7kDes5tSoEhBE+dbUKSP5kN13M5rImzeLBo1mvzGl7eBUiUct4kY4gK9rhfCLRGrwcaulFPjmgUyooNM18tAnNAbpgEUqu6nqWwJ4hYinCuw9Xc01XInOtUihDurPqyXp2H+3kwO5YNA0EQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=asQTOyWs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NYQF6OTZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="asQTOyWs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NYQF6OTZ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896QF4H3817272
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 06:41:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bGBNSK/7wsv92hEK0ELVfH9p+Nwqv2/ZRXgKBSn2pSE=; b=asQTOyWsEo0de7yO
	EpftvU84b+WMqAjebwS/JZ6HOmlSwPXDilOM5vxK/Yx0HCqOGQEip00uQ9Ea/bJc
	RK6g9BzA6E1GH6rjcXpIV6veJr2D9vk2qNvvL4HQrD3y1uWJKnhRAphn68QbxB3R
	DxE0Jt8aWAtOGemcH1SPiAkA1mreDjdmc/POSl6d8vyr3nTjZwSDun7OF/ykgcbx
	6nGK/IBT3N99Pi0WoHBgwBtolKpdzY9nelXCl7NndRjy+xtQIRIrkuGwKN1JnWC4
	DrfQiXIbEb5ndpKHonnQwcblD11ayAjV6E+mnWqqffHPNT1fr3W3x0W5DKhh7pgZ
	5pgCFQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjstu9tuw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 06:41:07 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39af92138f9so8484248a91.0
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 23:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788936066; x=1789540866; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bGBNSK/7wsv92hEK0ELVfH9p+Nwqv2/ZRXgKBSn2pSE=;
        b=NYQF6OTZpfQnSe9EvBajbXZzEtsBs0wL0DodvxE33j2RkJBnP46MnUQGAyIQscRjUX
         TjqdHmsYwLCwkGqd+AmZAf6VvjKnwOcuasSy3FLOtDIz8P1Z8x9ek7mWaKgZCmuNHtDT
         MHok/qShfC21sN9GZEAWagJhKVph66nwZtufPy24VLx/G3aM+/xdGUNJ1xKIIcawLOCJ
         sW95GGCRKcsBqO0Tt7QUfDgosGZu+2RSp3z5YY5tp4bSN0r9T8QEYBggFVCPokZb9i9S
         sdVUqOyG1Om3URCG5bLL3pWSWNuT4LrDpbzoBXTlQgiGQkXjJUdbprGnLkVpS6LnozMF
         vSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788936066; x=1789540866;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bGBNSK/7wsv92hEK0ELVfH9p+Nwqv2/ZRXgKBSn2pSE=;
        b=jfXtMCSxOMhn7j4+uTf/2pt/Qhsz8U66AsGzJxArpuUbxG6vGZv29KcIRuhhBqR8Vz
         MOj/q//SyK4+Tpr1BJvE5lfv4a4z3Ahs9RcUYMSWUlVumMln36PYhuYGT9uxioFYccAa
         PlPKtPpT6+dlgDTmzaqTg5PkIIVeNBMqKBCVUrHL8C3DEi+FcjZhfd4WTVs2LR3zb4qU
         NNCDcalQObMM6BNVYajc+JKp8koeGxkLGBvxa7cEZxbrRLXT0pd1CvqoHSkie6U1dTTt
         ABaLJDjP/lNlDt96PR/jaLs9Ck9aup/XIYTDHDz2Gt1Xj7yYdHVkeKNDi/7mDKs000a3
         6Rqg==
X-Forwarded-Encrypted: i=1; AKwUvByEx9ohfQRGWwvdP/Gczj3hmbROxzMN1fQB4aTEmwbb2d/23qUSHQP5V86N4C4PvjbVrURJ9P2yO0oC@vger.kernel.org
X-Gm-Message-State: AFuF++mGkgjM1B3gpqAJz6KipfvRV1KO4sumWpwcyupjrP0SH/NPYn9/
	8xVUho3ixikzmPopTlWFlQWE5e2FECp+iXeg+6uFqG++Dli3YCH1NeROYNZHNy5jJYMpbj9DdgU
	/7e0wK7hmE5RaC6biKp4fQqPb+z1/a4dclmBmNz3ZLGRmcDAu9Ts1oEWUZ5liQSi8
X-Gm-Gg: AYBFou2geiK+4mVEviUgnr+uImCGxx7qd+VJnToDACB7o9eq0DLWROunFDZJFJ51pxq
	XvZuv1+YKKK19ItIUU/slhC22+cmIRUnLr90VdYNZSc/2rPr1dwZbAcGf9dX3/D/YX2G763HTJ+
	4X3BSYbg4S9etpOSKEhmt3EWI0MjqgbYfPiymo+/PTpxUwMJc0KLBpsTbzUpNF8oqyf+n9B6vE8
	AK7oi44lSxTV9faqWC5GtPlIj2OPOZ4y3CXKlrTek+7CHDFnaXdD2Z2w2xjXISi+1efprX9zgXP
	crL1PvaU5IWHdNeHpFVCmEX/HsFjrfm0wfLvfM6CywuJGy3it+lKXRIU6WN6gX+V/5/ru4XbBxt
	sovHSYZQLt3+1Mis3llWZoIW6wFilJ723ydlcTIWlnaSc2sGk1QGmR6BWxFzUCPsj
X-Received: by 2002:a17:90b:2249:b0:396:d28e:b53 with SMTP id 98e67ed59e1d1-39b0865350amr41698929a91.20.1788936066547;
        Tue, 08 Sep 2026 23:41:06 -0700 (PDT)
X-Received: by 2002:a17:90b:2249:b0:396:d28e:b53 with SMTP id 98e67ed59e1d1-39b0865350amr41698873a91.20.1788936066069;
        Tue, 08 Sep 2026 23:41:06 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33450e140d3sm35553014eec.4.2026.09.08.23.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 23:41:04 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 23:40:54 -0700
Subject: [PATCH v3 3/4] firmware: qcom: scm: Allow QSEECOM on the Glymur
 QCB
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-glymur-qcb-v3-3-c194c0219218@oss.qualcomm.com>
References: <20260908-glymur-qcb-v3-0-c194c0219218@oss.qualcomm.com>
In-Reply-To: <20260908-glymur-qcb-v3-0-c194c0219218@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788936058; l=999;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=+Jp6VRLD4MUVawAQTMdryv1q6Q9g8UqRjjHIGO201dE=;
 b=/UlNSsShpnHZTrx7HwszHe4HQ47zF71S0Gz47ikS+aF0wk1d9RKjeo4ct9CJHAkqzea3bMi9b
 ZsCQIipVyxfBnCs80Z7KbpEI9ry1nz+ZYMkYVFKn9YWEAVxi7XeaqVr
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=ItAutr/g c=1 sm=1 tr=0 ts=6aa0ff83 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Gf6kasYTCoD6TKqZ3V4A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA3NCBTYWx0ZWRfX02sfnTM6lqYW
 yn3Q4+uIn4HFO+zJQuTjwgmmeRq5IvaHY0okH6QOJhqFS2ZwjNqHnY4ZGqsTThqxHojLVHGbUl3
 6GccQisEg+XuD8dtpntEt7tS5B1h/WI=
X-Proofpoint-ORIG-GUID: OjPcAiNh03G0k-Az_-u2YZ6QSDwcqJLa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA3NCBTYWx0ZWRfXwksaWSTXsxIC
 o7DMuObRqOsE50kSXObNriolywRQBuaJfU7YInbZXc3+9nMOVfQz/Kyu+tC18p/jOTyInPva3XJ
 MNpxM+6CVq7AG6yMgzxqdAs4aEWqUGiC6QeCHEPEdIWrWENKeFCLkBMagODZpFXXpt7hAiGafcf
 /KEqUGTzJ/AmaiTAhTizGEzPaTeFYOIwG6CQjB02I4sM0qr44TnCF/ea+Wc4rQyairav1wdsVj+
 Y1G/3mufbAltlRFngIChUHEGelDDdD8L0UNXUxwFnHanVyY4ryMEKZDz6dTuukvzQWQXlc6m0nq
 /CXKBiZ4VfgwqLh7sXO48ePUBnra8I41K6x4MwdD6gM7kVye6W+Fm1H1o2BqxOUblaX/v0QrjFm
 U0EKo3gBwVi+28paLuW801Tq7S4wkkdYoF/wEN847nn0DRhdcxddUXlGC/4FzY83wGO2vxs97Lq
 qT6ZkU5c38nFNQIJG8Q==
X-Proofpoint-GUID: OjPcAiNh03G0k-Az_-u2YZ6QSDwcqJLa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090074

Add Glymur QCB board to the QSEECOM allowlist for enabling access to
efivars and uefi bootloader.

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 882d1865f3a4..9bb3b072d8b6 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2243,6 +2243,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "microsoft,romulus13", },
 	{ .compatible = "microsoft,romulus15", },
 	{ .compatible = "qcom,glymur-crd" },
+	{ .compatible = "qcom,glymur-qcb" },
 	{ .compatible = "qcom,hamoa-iot-evk" },
 	{ .compatible = "qcom,mahua-crd" },
 	{ .compatible = "qcom,purwa-iot-evk" },

-- 
2.34.1

