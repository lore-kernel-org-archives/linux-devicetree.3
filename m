Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4529451B19F
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061603; cv=none; b=efDiZ2a6jCnxFLOxtWwKwt6dpJpL3OZmA9oTFJux08bbqj7MocQk2n3gxuwTicUP2Hx/vCbN1e7aWbMj/xX8R8GcGVTuuJnti6mNhEuz1iX6jEE3dI8jnZ/HtyKARYgv9J5xiTRJLu3+os8z5qlwBoqu3rcHath9vbpB8CNcRXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061603; c=relaxed/simple;
	bh=UIeF/uFE/u6rU0favTCVtO6maO6d9vtYbeitGGcwU7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Enn2vQ6VlaJWG1R/fMJPi9ncqmMkNixVUrAHD/0d2UdsH1Pm3UbQyHbTgeS/dTMAZEte41zuId63fsJRCEpY1lmBMuPnrqvwqHeLQTLcBgC2iRE/aQkFn+25NvRgoA8h+lh2tPJKQylvOPbr4umLkoYmjK+y+XBjpNuP8iNn8UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rgmv0+bS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QsIGr7+s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rgmv0+bS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QsIGr7+s"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jhOH3510317
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:53:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ngvKecSq/oAhQCBlhYYeePQN6SeoGA1j9720R8Z3F3A=; b=Rgmv0+bSgUP/CxCG
	hEsYbUb38u9dIXuwC9lRveX69BMA2+y7fY47+wrw61b0RsQkaCqpUWWkgvtPGl5h
	8H0DCX/fSAyWiVg4WI2DDM4u/JNk0lEZoiGezrkGKdr5G5OI0IV4Xht5jXFLw3PJ
	7ChjMvq+gM0mtfUJXci41wtQ+KtURMGB6EGI4hHk+du0nSYcEM3Ph1y4gtknPDyJ
	xNA5ivkAnXPpEqn/CrA+QEn3aPCItBeIu6T19LkFRc1hhPiiQHv99K2thRj/19TB
	WeMf8RXyNWhF80dNE+6PT9mZfFQyPqAtPopRbNXnsM3IFS/pU9A+zZqZhCneMFzO
	VS3dgw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqds9mtw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:53:10 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2df375fb9b2so59745805ad.2
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 03:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792061590; x=1792666390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ngvKecSq/oAhQCBlhYYeePQN6SeoGA1j9720R8Z3F3A=;
        b=QsIGr7+sWGKTagOumsOB65U8ypOEDT+I0xhMfmuYGckIPuLbwCBY1zQewuBvZAAygH
         /kuwboZ3iY38ELE8jVbyNTV1uL717Ec7BCGebwNu/txjC7Ay9JL4xPMtaPxfzT7HP1oT
         2Pxu/gLpS7JuiJNNSrE4W2d82AbBRm5s0Oo5HzqBrhYEfdNwPLWE89EwSkXe6i55+F4/
         xvxDYdYFcNndcE+8XqEZCS+Snxu1G8caYXRmwI+w4blTdW+lOaEjbJ8CwjEiqRHjQqFv
         dtDkatLkEk7pVNvCfNV/t4xuwPYuMNOiXtB51nLpLIwlVY1tyzv9RG4urDd7fIQ1z+Ma
         9FBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061590; x=1792666390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ngvKecSq/oAhQCBlhYYeePQN6SeoGA1j9720R8Z3F3A=;
        b=p5YR9LyhEnP5PgthJU4CW7Nuo1U+BHoIpRFHQ9JfG5V8ueInu0sM1IBVdjVOECnjQw
         CBK4qNRs9Zn0RN2xcpoI61PnffFxQDHaMfWp6J4q3b4N+R4RoiLMDAT4FXf0iXte+dNR
         SuV7ChFr14SoC/RtntZAGqy9L+vUaq++S2EIGUlXMqMgFu+Y+M2JixkmKTqRaESGKyuL
         giK9yv+dDtdvmSAsnVcRQNZUVl8TFnMkAl1zRTG9OOTvA3OjFjtVHD7odZVK8l7VDjlE
         yowiVEUA0BWle6KsguN2plEZbY6nG3E9B9Ih6efGGSbE5Z6iMOQm8z5elhWMD9Pq4d97
         YdAQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8sjtpXGZyTAOvtrU5TwJRHJ+IeVRHQrqU2iKPL2hkCovVT6bdVI/JRGY6T0yU9ihxtAzXUk6fiaoZ@vger.kernel.org
X-Gm-Message-State: AFq9FYLabmYrKFA5zLRoObtp9/f5dOx2tv2MgscGXe7VwW0ka3Bi7zUe
	MVF+0tvnUZNSZFaNTnuHArby87OfzIDksIeUpog3nYDonjKga9i5nXhbzv7iu1ZAjMR9RKzsOeE
	YBnGs6hY6AOxZr6nT5SwgESSll2w9i1PfGlywGbNp7s/f3jfQbw/7VRqsruq+ZDQF
X-Gm-Gg: AYBFou27VU3VC04wBiDsCani/TwFb80Bt8WFIcvXhdIxviR6oAYkEYbmJh6jDepNIua
	JhVwyMLAFCVu8cJRRp+1VakaaVa3+3IyGdzMStboEdkiXYe6g1oEb1IG6GkKGcUnOzs4tpa9pYk
	ljavlrmkWfSMbaHVvByi51K1lLGEoTnTfs+M75hgiQ5Z/tg0ssy4rWqdXZUpPW4yEvBiENWq2XA
	ZHCAMiM5Qpkwf06jr3nSofguJUU6a4Rr/pvHEhQ/gUji/SH3zJq674nnVF4/1aeL9aCGCWmhqla
	u5BylmPc0BuxznFA6qBXd7Zyqu4ZuYvyybpMetf6NfqwjzluAXQAZlVV0U90IVjB6v3ReWClhhR
	rbPRWCI5WVUCCS1wsuphDDcGVKfZ/ow==
X-Received: by 2002:a17:903:2f91:b0:2e8:b20a:88cf with SMTP id d9443c01a7336-2e8b20a8a88mr105055045ad.11.1792061589835;
        Thu, 15 Oct 2026 03:53:09 -0700 (PDT)
X-Received: by 2002:a17:903:2f91:b0:2e8:b20a:88cf with SMTP id d9443c01a7336-2e8b20a8a88mr105054855ad.11.1792061589334;
        Thu, 15 Oct 2026 03:53:09 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e95013dafdsm12770465ad.42.2026.10.15.03.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:53:09 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:22:31 +0530
Subject: [PATCH v2 6/6] arm64: defconfig: Enable OV08X40 camera sensor
 driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-glymur_camss_dts-v2-6-e7b1f403146f@oss.qualcomm.com>
References: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
In-Reply-To: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792061551; l=715;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=UIeF/uFE/u6rU0favTCVtO6maO6d9vtYbeitGGcwU7k=;
 b=V5WOWOVNAffWw8BYm3GDswhcihws1NuZbLJrM0BKGBJuOSv+3VfR9SSoMTRk5KdBTcd2VFz4+
 uQL21vt9F9sATBUEz70EkYJT0VJO++HTauBJ0ZsugsMSvrxmw07Iu8A
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: n_NZtMHWdzMsMoXEcof29SppYy350U6y
X-Authority-Analysis: v=2.4 cv=fNusTpae c=1 sm=1 tr=0 ts=6ad0b096 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=WSFeanDOTqpEkpu4Xu4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX8nwLzbJKSfEl
 lLHfhd0AASiG9jlhl7VneCMc1Qf1hNiMdpXF3pBw+LDIb+koJ6ekN8N4OtaoNfxGmsWdUG/Q8eZ
 usZPXhKBQGp1GubCKqSMX1app+picpZIkeA3y56EZl+nSDwZTdAHSHQHNU3nEl21H74UOkulmTH
 lTHDUAy7Bw4BVUHWNzjnX6rrNhbK/IhgtYrLoMu/TCSueOZm/zYD7tm7ZwL10g82peECKNNrlq9
 5GJ2cqVDi4tJ6fAAOLzj4+L751LArAGEstMr1ojeElM727DBHpcmt6TvRsFe8ZrOOV6/e3W9AsA
 hiCa0FuNn3cWqtisr2XngWg58aCvNoRl32YwBuEJ/bVkLVtwJmbuB7Ea7SgOP6Qrk/sDT/aC7aD
 DHuDe9NvpRfGpB1Ebd0Fz8uLDBC52yNwVxLHgb0aArxTpUR/+ZFM+TqMbpmuamdYMnC86Y2rBht
 quhlZx29tv/9bgUE6EQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX5YyW8sRH3LTR
 8z+/s7rRfbn7wdI0lMBfY/ZIWs8RW5NnRfxAAgPgcLwrEdnIpt2nD0xlw5JlZr6XMG07t74SWaU
 37EsdK2WPKVNesmIshut5F6l4h5Q1Bg=
X-Proofpoint-GUID: n_NZtMHWdzMsMoXEcof29SppYy350U6y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150043

Enable the OV08X40 driver, which is used as the camera sensor on the
Qualcomm Glymur CRD.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21c440c7912f0a24665bdb7010d9e4..7c0926c8ebcb3138ea965f879476000951dac432 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -965,6 +965,7 @@ CONFIG_VIDEO_TI_J721E_CSI2RX=m
 CONFIG_VIDEO_HANTRO=m
 CONFIG_VIDEO_IMX219=m
 CONFIG_VIDEO_IMX412=m
+CONFIG_VIDEO_OV08X40=m
 CONFIG_VIDEO_OV5640=m
 CONFIG_VIDEO_OV5645=m
 CONFIG_VIDEO_S5KJN1=m

-- 
2.34.1

