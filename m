Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78A836B07E
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785478499; cv=none; b=tylM02IHhICFWqmvjsGgSHeIe5IAWroyzm4//Umsbdlz1lVHDwj3qK0vpBxMZ8KT2cMHSfCoBJW4tUd6EDDysYLbS6fvdM2eVkymXbGg3NOBcu6LY2zlDekXGZDVtXhwGjQXEfdzmGF2sYX3UEcWOAUqJn13ZuCaqNg9hZXmGy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785478499; c=relaxed/simple;
	bh=jkWeTjrNI+xze3hIGsedzEI8x6ITSkIXkZnnxBafFoc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GpAj2I1GAoAJ5Q3nXXrfxIZwCNfhkE6W4c9IgB3IEBcW/UvH94egIs6XO7MmHIw/vs455cXgphntUx3grm+9oEIGj/9grtjnYricTlNhnXHEt/tPr4GlwITCaN3oBF9PVBEzE0Ryl+MbHLNySWs4lLu/umuANG63lyrBMnpUQDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FpxQj5Ih; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sz0J0OrF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FpxQj5Ih";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sz0J0OrF"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V4upQM3277878
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uf2pAx6sV2vt+5z+Vbi+GKfH69mjyonF0TZZ0rYCIc8=; b=FpxQj5IhIhmj6Nx/
	1EnEmoVzPNI1TilGMIxhDg4/TezVQFQovSr5OW7ax19W3m/W3Ml+49i2kN01oLno
	aasVgw8hMjCzZXBmAaMFAPqzgFswB8BJxgcXwxkcEGpnA2Aax0a0JYIdQTCErm20
	kUPdJXjYMNl1UKrm8O1/eG3tP5JSXfGAOHi40q6sKGHGtfTnrCU56W3ty1Zn0i/G
	bNmR+EeDB4st+OkC68QYCDhL6cS/gd96cQ2Nk8E2XEFS2aHKjDEARWCGip2GjoBg
	KKNm0zvE+cWWFo4zkJPr5mNxvOEWQGV7tfgjwa+RM5T+MPLR5xpwazdUiZaAkUQu
	v3UneA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frn0f88sx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:14:56 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cec4226c70so12348175ad.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785478496; x=1786083296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uf2pAx6sV2vt+5z+Vbi+GKfH69mjyonF0TZZ0rYCIc8=;
        b=Sz0J0OrFYES2wijH2ZiGeBxnm4OAlabkfPiADxLz6+5+MYb5ZbARBRSoCzcVu9IW0r
         IkyMO26OA8oTXG+DnDFyvUYpgF2fJgwW5qhGyKCrHnaaesUuum40SJMyAhyumtL0+1v1
         Io+G9+ZC6DIcVeBnzrFY8lW8we3p3yXHiiAR0zoMgHQPAiqWy0LFVdKycHx37Y65KNWm
         1u3Dw9JOQbmQKdK42jMgCLt1QVBT3tqX0Zl4jWTic6QgzSDSALOGQ2GVG4A8rrdctQlv
         b48DrYPwAfAvX8r1969gxAp17Y/rvzR2yP70fVSklpp2mW6aojQYNtZevaDCUL2FlIMH
         VEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785478496; x=1786083296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uf2pAx6sV2vt+5z+Vbi+GKfH69mjyonF0TZZ0rYCIc8=;
        b=HmhRzLCQjdeMFNEvB8hgwIY1tO2eS7YZcsASDcvL6T7zIBa38X/DLKf3+OIliW4d5R
         pZnSuyD0aG7odu50a9+ilu0r/i6gUnOKqe3YVPdAGQ9fUQOIf0aosytlmoJwjgW/wVj/
         7/Mkm/6HVhe/JH/buTbMs2Qshm4xNtghA4OHkAdMaIsU/0pvAzU7vclsZJi/Usc8Lk9D
         7Mq0JFjVywU/43v6KTM13c8Z+ydOKABHgbkhuqRwmur9saFhiMgIX8YBgRo7+l1KLojr
         555PzWdae9T8zMkJzM+NCBAYjF76kShgCMc6J70G556GfeEvlYbcQMFEM+QPK2RxjUYp
         n5eg==
X-Forwarded-Encrypted: i=1; AHgh+Rpi+yNiI8BOTnUujNFqW2YrgzthEPcEX+HXzTOC7pACC6LcprjWRGc2wVJ1FhmM8+pdoO/INokB+VmU@vger.kernel.org
X-Gm-Message-State: AOJu0YxIq4HpYbk9nvMiEURunZLndwvUxfmTQBFuhKMDtQKz8NnpN3fb
	iMC9zRHJmiCmflJff4f/ieTI1eaQy0tu6+KaXx9eAZ2SbEoaNHniUVkvAa9m0FZxLvBQMHbVp27
	AMJFTydP8r47YSfMZsfJuI3KqgqdTeawNK91e5XLTAaUlpXxtXCukKe/4YQV5rK+P
X-Gm-Gg: AR+sD10q42IS2lJsCm3sbMG/Jp7faaHohIY75r9ZdwVng7XOL6R1FxsFV3233IzFU2r
	Fi/cH5OW5dzDtll1ZoKk8mrywaDoHt5dHpB5+BEpYauz83k8r5fEX+cA8bHH40gH0tHL7S52Fct
	9vAhJ/lqY9VB0TpgPTmHDadQ82seie2p/SkdHKBdpHNOuRPb6ZENXFZG15ijh2t+7n446Mum/N4
	0m7Lbx62M/hXGOTwplLTz6aXDcfodYRwzetDIMBL1s+PhA4JbPGw9e5lLTYphYkaAQ8bu3pAHfl
	uficvFEemTzOQ4mVAljAUvkyUbBwgkHHPaFSyOZiymTGucBObemXKZlENSUkpJCqalXlKniitht
	eeVY3mF0TH8pTGR7s4ohnTEwfQ+DjtHWT1qmkgmV2ePx9zMGSyZJ1q3z05v9yoRnd
X-Received: by 2002:a17:903:19cb:b0:2cf:dcd4:c646 with SMTP id d9443c01a7336-2d046e8817cmr8420835ad.33.1785478495573;
        Thu, 30 Jul 2026 23:14:55 -0700 (PDT)
X-Received: by 2002:a17:903:19cb:b0:2cf:dcd4:c646 with SMTP id d9443c01a7336-2d046e8817cmr8420605ad.33.1785478495116;
        Thu, 30 Jul 2026 23:14:55 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b15d26esm719635ad.76.2026.07.30.23.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 23:14:54 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 23:14:40 -0700
Subject: [PATCH v4 4/5] firmware: qcom: scm: Allow QSEECOM on Kalambo CRD
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-b4-kalambo-crd-v4-4-e458f8b08114@oss.qualcomm.com>
References: <20260730-b4-kalambo-crd-v4-0-e458f8b08114@oss.qualcomm.com>
In-Reply-To: <20260730-b4-kalambo-crd-v4-0-e458f8b08114@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785478489; l=984;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=jkWeTjrNI+xze3hIGsedzEI8x6ITSkIXkZnnxBafFoc=;
 b=9FkTobWKSq3OTUgsN8Rw8LGKU4eULjMRN36hqMDr6rhVEyM1jYx8jEP4ZdopWea68YbW39ia/
 QD9rc4j/0smDh/zukabBcFD+B51HmsiVuyjkpwacpsSXdpL8mxdHYPb
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA0MSBTYWx0ZWRfX7shCV9uYcCqD
 3KUI8hS/Ko5HsqFBvFDWKJEGz6W96xAb/K3mzK/mg263z6dJCrMXkc7o3SGmlTv/dh3MHwskl5X
 z4pmma2k7erBxAXCRduOCsLgH0v07K0=
X-Authority-Analysis: v=2.4 cv=HJTz0Itv c=1 sm=1 tr=0 ts=6a6c3d60 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=sPeBD9Pss2NjrgU8DtoA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 5wqb5xXVOroYQ_WnwLJ9RmAq4ZIBPx4x
X-Proofpoint-GUID: 5wqb5xXVOroYQ_WnwLJ9RmAq4ZIBPx4x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA0MSBTYWx0ZWRfX36TtnylQZXjG
 uV1wJQ7DuuYjfaa9MxxaOm/yAcU2UoO9GrlhZegX3uGTUxMfIRTUW6GHNgRh3ju33DrHU2sL/BL
 YEDWp0611CdLGwaoocwj1A0rQTDozi79H00YJYbmgQCsEXlVGECwA561Vv1n5pWAsiiAucer8os
 4XfxO14EgP5zLQIH59bLM3n8ySmLs9qcXJKVcqC1vucW9qmlaxRxky1iuR24xMl8BdQIHXZPPmB
 EXKAjngEbDusjaSpBSFn/5uZYs/vpv2nBufpHMOjracZqzv7fYMzhvuzBL2THU8oAIMMw4rCuTJ
 2uPGRIzKPSklfciJaXEXAY/dIgHvOqKRtrlYENttk/v03K4E7HVBVlE71lX3dOKY8nKpc8NPUZD
 KdWffM5X5GpR+LXuUpJG/2F0QVDAR7FPvq2Sph9Mx5IcP0rDkOHJcT4/iyQ5KbgfxJCJNn2N1Um
 G22li80/dicJ0rorolw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310041

Add Kalambo CRD board to the QSEECOM allowlist for enabling access to
efivars.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index f35f2ee39130..d1cc6c908daa 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2327,6 +2327,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "microsoft,romulus15", },
 	{ .compatible = "qcom,glymur-crd" },
 	{ .compatible = "qcom,hamoa-iot-evk" },
+	{ .compatible = "qcom,kalambo-crd" },
 	{ .compatible = "qcom,mahua-crd" },
 	{ .compatible = "qcom,purwa-iot-evk" },
 	{ .compatible = "qcom,sc8180x-primus" },

-- 
2.34.1

