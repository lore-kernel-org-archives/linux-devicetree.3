Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393BB434408
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 10:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785578430; cv=none; b=QNZpNa1yY6V61i9JxrprVI5BroCDHe9WoOt4Gac9HP8e810TaNW01vBK8IMq3KNx16vnYGopEWDnLGre2yW0IvTwiM/wtX95IoqMFg0jMH3dStHtfLOY/5M6dUCH6LzTK2E4yGwaqdli2MLNHLjA6lAwzrj2Vw0dbAoO5KwcVQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785578430; c=relaxed/simple;
	bh=xKkW8JkAQ1Vhl3TZIzNa8+ozFoj7WCUtudLFKvNQfj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wy7lnaoYsyLLhVtU2hYrH1oLInevycsoHiJOEFJ7QcjiMsEOuOhKewYfcUkUN6lgALPa1AyYeglxY6N1lXKELPZyLInz1mw+i6cCfhhlez1I9RhVKtVae6KVBNlp42Y+Otjj0kuDPoCSJ0mLrLhkOLsCzEM4vBdVwXrh13UtZfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YwnhMIF8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=feRn/nJw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YwnhMIF8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="feRn/nJw"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6713Pgx41919053
	for <devicetree@vger.kernel.org>; Sat, 1 Aug 2026 10:00:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ht5fvyfbePHEIlm/98arjAMGkHBafuoSDc2M14Bf44I=; b=YwnhMIF8ALzOuskg
	JVJ1sxD7dloeSnINtrTiABVITFNZHBdRx6DEzmmYAKH6g+JNNPdYs1berSUQBjeF
	h7oT9BJ333Hca8RP9KIUjR2OGoU71W2D2Em01C/3KeH5Dymvx2QR9FiJ2qVAIbnh
	Lh9qDlYGfu8Nw4KqLq8yzdXzT4UQGyy5xgCFef/enzmOrOOR4SVeeI3gSBrbZgRw
	RUDPNZY34M4N27raPQ1gol8AX0BCtdBxSMv5WgBdZEIgDrkK26d5Df+pnbNkmS5/
	svkL6cb5+sG67ZeOC7RqFvuu4yibbPyr09i/KhaHXR9F9B7mqvtycsMlag10lGoG
	GXl0sw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8vt8pws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 10:00:26 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso1767331a91.1
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 03:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785578426; x=1786183226; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ht5fvyfbePHEIlm/98arjAMGkHBafuoSDc2M14Bf44I=;
        b=feRn/nJwsepKS3FJpUfHyzSdBl1KtissoCbcEwknbyi6y3ZfpA4pPNC2lhgLGSnRzp
         gPbxxiSyp7JhG4aUax905uElWNDMrA0hWlSFz7bxLJ8gY+eis3JPk8XVwb7tlVtN0v/H
         kWjp1rTXPIbfkkMO7GhybcAa8JAfqjroUe2+dQyzQmwBormjEFCmrDxT2urMzHCWy5Zm
         3QlFBOW4go+BWvl60ZbHDFFwRZ7DYhNmjLIJFaVztXF32I4Kl1pe3rxINnoRSzD7XNyY
         oUoHV/1/Y2WiYMw237Nu9IjlIfB6LSUJx5OmapxrCVoq22hqQM24f6VAS2l2ja5rGG/2
         jstw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785578426; x=1786183226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ht5fvyfbePHEIlm/98arjAMGkHBafuoSDc2M14Bf44I=;
        b=CNxLtTeg7Z9korhLwtMtK6WCD81hnBdV/tceu8yxnomWUaZzTECaJy2U27xK9/t37y
         uqYWa3L1TB1B8wuDGR5sXG4Cour+GgFtkMSQMzRe8kjZ/xKV1X8edq69XbzCjNNZCrz7
         KE925s/BSTAfwHt1ixhEz79B+rcbmFG/Us82Dy84Vc+BG3jP/+dP4VIrXQbPPA/VTjlD
         RpxkCuywBZ8YKuepyECA245AkZkTwctLJU6kVbIgFJ1aixNlxcO+BUN+KY71cCCSh/fq
         tyxHPAubdyeDiCLZca7xmwK4tgpka1NUCImqdnsttEvM4PYkM/9ksmT01dR2Ig5bOXUK
         5WIQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr8w9BHX8CaIZ1PkTijom/G4yiPriNetiqpdsuKnTTzjpZM5IGETAmvEHe2F6KThl9Yne6MNbUeyOBM@vger.kernel.org
X-Gm-Message-State: AOJu0YyGNEr7Cnsc+7vRL7Xm/+tNcwnID39VTisvw3EMATyoKRI2GK9Y
	Vpas3UTIChMr4jLxZS/NkB4WD2FUkWFk6Xkk+o1oH8zAPcy9zDWydq3Y/wEcFPoxwoE+BmVebRn
	Sg9RMH0io+2OihCe4uah+nmOMGVxf2Vc8NWxmW02htxGILIeZQuLQhOkSOjJi5hOd
X-Gm-Gg: AR+sD10buDMWZmbTZzK6tF+sUZ4n3BwAfIfhvAfQEwS+IE7Lqbgd/9mHls3h4lwonyD
	miIdcCKc9QhwR0tB5bk6SNGUnqVGNRkGgyMPK7eBNMTOJGCGk+CNv71L4uT6pPOUMul0HoyMIsp
	wwowGLns0YVg8zBUzrCfzoWjx7tzt4wDR6p+Kj1LHOyis9PFsO8O5UbUJDt3qgQ/ldJPfP2tCC7
	wq1T01lHBEkB/kDN3xCCDPI5ZMdpFAoromCh7iV8iWArH9tZ3WhmK1HypnoBYdnxhbSK+Kt7anq
	ksSpG65O2F0Fj/stkqIFqExq78IdKzppas7qsQGYbX8aGXwj32NR4M3A7WLbsR/2xMNAk2GRXPz
	Y4UQI87nMtfjdurpEX0Zm9M/5uPwCn/6PZvcwWlxEEGabUzX+9n6DIJ2NUMfMQxqF
X-Received: by 2002:a17:90b:394a:b0:37f:f8c5:93c2 with SMTP id 98e67ed59e1d1-38fbc51a356mr2690758a91.21.1785578425595;
        Sat, 01 Aug 2026 03:00:25 -0700 (PDT)
X-Received: by 2002:a17:90b:394a:b0:37f:f8c5:93c2 with SMTP id 98e67ed59e1d1-38fbc51a356mr2690677a91.21.1785578424622;
        Sat, 01 Aug 2026 03:00:24 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e04506csm16290600eec.17.2026.08.01.03.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 03:00:24 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 03:00:20 -0700
Subject: [PATCH v5 5/5] soc: qcom: ubwc: Add Kalambo UBWC config
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-b4-kalambo-crd-v5-5-22160abacf3d@oss.qualcomm.com>
References: <20260801-b4-kalambo-crd-v5-0-22160abacf3d@oss.qualcomm.com>
In-Reply-To: <20260801-b4-kalambo-crd-v5-0-22160abacf3d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785578419; l=1205;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=xKkW8JkAQ1Vhl3TZIzNa8+ozFoj7WCUtudLFKvNQfj0=;
 b=AnESG/HcyDhetBpeOfjWCmIboN1k6CfDvIHPoFLeba9qB9etEL2IuxGeF4b6mFLcmTHc7bChi
 fr8hV6tsUpEA5oSFaPNKsiImA/LbMrihxABR/cyyg16YvcHYcmY+vqq
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDA3NSBTYWx0ZWRfX54tZQRRYnpW/
 j2wtQveOKPHHYGSIDBa9q/GWih6il5790PxLrw7DyvbWt37zu66jyMsBAY1Wxgt3gXJuW79qDqd
 ak9UUvjva4Vh/4rsksq3lxtwcQELpFo=
X-Proofpoint-ORIG-GUID: khiEZv2v9pCYG0rR88OAKQYW4TvTna2j
X-Proofpoint-GUID: khiEZv2v9pCYG0rR88OAKQYW4TvTna2j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDA3NSBTYWx0ZWRfX/Nwx/wKuYjy4
 EQQYAGuIr1HEsuZeYJacYVah6N3OjjUDnkkdrywNgiOAkl/wDOBBK1W8k0NpAjx0ZRX151J/lex
 s3QF+mJP5C42T3EqkaPzjx0S9ZtxiX479/IIQaVRNiXL+QfFLqAQ/WdJtwYklJSzpqy5YpZj8Eb
 Qi609yzcfD96wDhTkfV1EG/9wI25HSsXDR9TdbYqaYuX1B5j1CAkq6UHbg9JVAb5mn0nOvwRRPk
 jb11I+yaBsGx/XTH/V9740QeCe8FlWZFwQ78IS8RcBPhFRoniJuWLSBSPFoEQXlwGa5IP+ZFWP/
 ZN1eqXC8HMF2g/1PLUWxOZpNxxtTRepRLf1qc/xERIKOT2MYEOhwP7g3+flq+vNlldClhzZw0t3
 L0AzlocXp9Sbxvg4kuvcaKP9WAxUmolqYZs/XzdgM894+mklDV0Xs6+Es5vmAR4Gm0UlO+VNp8/
 TSh8ORv6cjihEM1eVfA==
X-Authority-Analysis: v=2.4 cv=fKMJG5ae c=1 sm=1 tr=0 ts=6a6dc3ba cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=vwhQhcXuLYmSI6hVBhoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010075

Qualcomm Kalambo is a derivative of the Mahua SoC and shares the same
Universal Bandwidth Compression (UBWC) configuration. Add the Kalambo
compatible to the UBWC configuration table to enable support.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 0209a02c390f..c5f79210ad52 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -112,6 +112,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,eliza", .data = &ubwc_5_0_hbb15 },
 	{ .compatible = "qcom,glymur", .data = &glymur_data},
 	{ .compatible = "qcom,kaanapali", .data = &ubwc_6_0_hbb16 },
+	{ .compatible = "qcom,kalambo", .data = &glymur_data },
 	{ .compatible = "qcom,mahua", .data = &glymur_data },
 	{ .compatible = "qcom,milos", .data = &milos_data },
 	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },

-- 
2.34.1

