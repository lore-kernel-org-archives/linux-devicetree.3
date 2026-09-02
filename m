Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798214A92CB
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 20:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788381833; cv=none; b=As1Yc61lv9juWOOjNbEDwRGZYjfr1/wgRdD5QTiHJQuk9ltQUSY9fowmuOD/zy6oMe1KcmmHP+sUNcUPUs5loffgQ9nMm/MYP1H9r4RH9yGtNw6wrkGXiHY7QGrLJCDHe4cwxCGepVqC7jW0wprgZhFSHZGSLKNV2IoWP7Vri3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788381833; c=relaxed/simple;
	bh=f6q8FoltjlovTDu1+uHniIV9mJzmkVGNfZOq0t3Zo08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J/uPTPpPie29ZLsTB8TjYN1CVDXRUDDnx1QD1LuHR2dEEFOXbOvdtcbKk9Qn0j7MLsNgl6GLVabfC6+8+orCCiRYNgVHJUqUJqPR3TAHkZxO4/jCSs8LH8uQCAnQPFA+GVJp6NLFecyYWKEfVJ8epmPPMrCFQmaw2s1H0M8A9Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Et5DBHyR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IUcQmWh6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Et5DBHyR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IUcQmWh6"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KHFDv3289331
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 20:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BwimQj+9cTD
	SXnjMRJPGoAVIfRVGDT5GaFq9hY5e000=; b=Et5DBHyRvF/r8A40pKXkCpcvi7n
	pc+ccSgQslut7Y7/Z9dBtUxnzI7V+eraO6a/SrKznn6+5Gr7J8IxWoL+1hIbiSBS
	w+PAStqgrsc28jy0CWzwcqgvVmzfDDA59z4FnHCUBeurhHu/53Ns1JDNj4QTqM8d
	W7K7PRxdbGbdd12/CKoYw2UDxmRwi2/eE6AX90Ttb5YLKudEbuh48xFgOd7e6RuT
	LU/ue2gJBVAvyzp52enSIIwDSFnra3E5x3IeIYcg8cMVP2KKPuwu2o/EqVKQRAxD
	PWCOoxMIB4X+ufB5wmwktevgN8xGjYAeu9Tnd2FD2oiD5/mYNWZFmyh79HA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gerdn8t4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 20:43:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d63bad3d09so25880865ad.3
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 13:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788381827; x=1788986627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BwimQj+9cTDSXnjMRJPGoAVIfRVGDT5GaFq9hY5e000=;
        b=IUcQmWh6PkZ1fU2o8LiWY7O+8WlNmG2q6NUFEGZjVQwun04eC+hYzOGIWIuGqkwt8q
         4OWOQN/MmO1fsnP7LDKRLrXO0tm4CmYwftCezANz3TwXRgqUPjzc25+1EjUhQHZI+5/P
         406zHDFy5EP65np1wupuHYjX8kZTn9K7Vz5K3V1+L2YWgQ5wYOQFLcor1eAwp5P6Up0B
         urPfYpBNnHPmToSVssMRU6pO7eY2FrfBzFAYwgS0f8Evgf3sCjUzMuc8KftKnum+Wx/m
         yMXwswn/qX6QZMZAH5wWq4HwrMliyp84Wf/HFoQjrYfaxe53yjKO84sjpRyyy+oZj3iY
         uzxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788381827; x=1788986627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BwimQj+9cTDSXnjMRJPGoAVIfRVGDT5GaFq9hY5e000=;
        b=qJM0VXLin1IxZPoYMBHinlDhsBGT5YU2az3g64hwNd0elyaigG9pvzk/Uy7SxMYEAr
         yo00RDauPqMjVX0DcWoS6DMOEoTsi2OtNlGobTKx8a41tbzaf9ZzxPEZ8oqOfLHU+/En
         T2PrqMkW84iGBh+wI/RlZHsQaCa0udfN+1BV/AvPp0GrqxOMSnWLIOnIzYNNsXAGDhYL
         EdB4Wvfde5xcn8wo/q0A7qq40zVyV8sNoYP5ZtzbKFeNGHRKajbzW7/XDpA+Z4PZ7WBQ
         NOx9wSaKvu4WVa44rm5QGdeqeIWeo7qK9S5q5KZL1zMDDCwGMKjPPnesMpLrie5+V2rP
         Tqug==
X-Forwarded-Encrypted: i=1; AKwUvBzLtPfpe5J7A5DAJTXiXfD9RZJGhJEx7UngX7zb7xCAgFpUb7QosPu2y7jNKDGVlJFoGYH+s4OBo6uM@vger.kernel.org
X-Gm-Message-State: AFuF++lImysGz0I0mL1ikMlCuzCEv5ebhutb3sY4tN9JcwGKbGFNeOl/
	PzMJnRNxprUgOYO0v9HPnPRZixFlMjoiGsR3tdjXa1El66U9gIg1yB9PUo0teMQTtbiEsuYG67y
	HA7m3m9+lCEVgGy27e+zKoGqoTzkBFjO1Q/FFktjW4TXTetx9X7Hi6sSzDgs/yW7I
X-Gm-Gg: AYBFou32cq/wAg1J4v7F48vCDebGfj0di/RdU5/tXzZ3boGtFMnLXNrjDA6VkRnwtmG
	55778TT3oWa4GGjTwMqwLo2Vu6IKhPfCjG9grd93xmwvqk1L6/e9EtPUIU43B2IT5kLNI7rOK7D
	lOA+RkyT2YM/vPGOSY5HpEhzgwqhxCyCf0pW8wYgpkfZrPcCX/UsubOwrMKAh5jfKpteTkiTbSe
	WOUnl4axI/W1WERGRMumMxxoOmC+A00cMYOC82Vt7ZmlS/eCeRsoDSAluYcuLr3aXsgP4e68dqx
	MoqJzqsYGdfcz0NNckK9J9JXB7VLikfYKuSXnqy4e14HrBR9V8GRjAkheFiXHzvt/TYweInQ5ng
	xv22Zv08G/kTgzOcQwfnYEXn+lGY=
X-Received: by 2002:a17:902:da87:b0:2d9:6db:9fcb with SMTP id d9443c01a7336-2daec6f6b81mr93347445ad.11.1788381827400;
        Wed, 02 Sep 2026 13:43:47 -0700 (PDT)
X-Received: by 2002:a17:902:da87:b0:2d9:6db:9fcb with SMTP id d9443c01a7336-2daec6f6b81mr93347075ad.11.1788381826893;
        Wed, 02 Sep 2026 13:43:46 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255d39d21sm613338eec.16.2026.09.02.13.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:43:46 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 1/3] remoteproc: qcom_q6v5_pas: propagate dev_pm_genpd_set_performance_state() errors
Date: Thu,  3 Sep 2026 02:13:32 +0530
Message-ID: <20260902204334.2061226-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902204334.2061226-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902204334.2061226-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YcmNIQRf c=1 sm=1 tr=0 ts=6a988a84 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=l42t8P_hCmqpnny7Gc0A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE4MyBTYWx0ZWRfX3qUm0LRPtMeJ
 USylyj2jX2imRymfbTO5N17RikF0wG/Yfw5bxwwf7t8pAbbPegF0SOGWdvyNMf+Y3is4zPCGrLg
 jtnUcHWc0CyD0AyWcaUTjkbGzeYkkoA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE4MyBTYWx0ZWRfXy/lcBw1BAsf9
 NSCRpzZhtC+TrcXQUPn7G/RpZiG4JQCyjU8XLvHgNyk3KiWqnoR59cylBVwqF939Hz/LlJ2l+cH
 QGux2MWwuZuDC8cAZrEv4SF6WZCf9ia8ya8jdg5OB9d6cksnu9F7ljlsGI+H7C2IzARfPtTw1Ge
 yeP+mynZI7o7wqTmxgqb4p+ngsiPQQj2lGCNunROse1pcw8CIOJ0nyBUUwX3IedDKjHJX/KrOas
 P/SCEWxtkEVHUu6s5qzfeHA35omVJpHr2GPZr9raq1Q3Tkvm/jUkmODwFr8iAlh+1PT3OcdzcpR
 ziP9X7vKtmlNt66D67ukYNSIL1gvJuBt6CTyXtyCsSX62SNSsJfgIuMPWqZFf/b79jA1SEMxn8a
 AFSeakYpogLY18NucoMttVTXMe5cJd0Cd13Yh3qCHbF9twoEtuirO7GB0MnIrD1uU0XlssV0Be8
 J6LzYtUENiXKg2/BKrA==
X-Proofpoint-GUID: kt00DTYvzDy_t4sLbe53gCIZgIDYv5rL
X-Proofpoint-ORIG-GUID: kt00DTYvzDy_t4sLbe53gCIZgIDYv5rL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020183

The proxy power domain enable path discards the return value of
dev_pm_genpd_set_performance_state(), masking failures silently.
When the call fails the performance state is not applied, yet
firmware load proceeds without any indication of the problem.

Capture the return value and emit a warning on failure. Firmware
load continues regardless a performance state failure is non-fatal
but the warning provides a visible signal for debugging.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index a005546c265d..01dc0194e130 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -167,7 +167,11 @@ static int qcom_pas_pds_enable(struct qcom_pas *pas, struct device **pds,
 	int i;
 
 	for (i = 0; i < pd_count; i++) {
-		dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
+		ret = dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
+		if (ret)
+			dev_warn(pas->dev,
+				 "failed to set proxy PD %d state %u: %d\n",
+				 i, INT_MAX, ret);
 		ret = pm_runtime_get_sync(pds[i]);
 		if (ret < 0) {
 			pm_runtime_put_noidle(pds[i]);
-- 
2.55.0

