Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C97448A2B2
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845711; cv=none; b=nclVymyCWqJ/0YlcQmVZzkj6CM/h+WDVGbKVhmZ3rxgN2FeqjspJNayspXkTDRnPSzUF6ObxM128lMYoFRP1kYX5VTymqPQJ2vPKZJJfqVJEA2D+0wwOEKliSlvHsQDyRwKB4HbJ3DFNqklER9XgMQ93Fho6cGoJXonhqwzROio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845711; c=relaxed/simple;
	bh=kRKs4Ld/R5wPud9lDZEt6GV0QZ16SIkZn9USZSX7X/s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wcgt+fkJF9ipjX2v292pSM/TOe6CuQ96SxpebV1gEYyEeHXi+9eCG78Bmjv/xvtydsExxecNEHww1r4fvHphMdq3z5O4XMymGFT+F+wIb4Cf/i2b1spbDnAQikwqssHHS/HMU7NQl+a9JQQhNksK0GCdViu/F2Ckse6dC7pLzHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=crxSJPnk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OJbznKVS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="crxSJPnk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OJbznKVS"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FAsBjb3671196
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ereORPv71dmyzxkJLNhe5MuVEc7N5EYW40Eup96NbL4=; b=crxSJPnkYP5J1fkO
	h9m6GS2KOcWJXNrGoQiNpZ9imPjlY/r3cAMV7jn/nLUZUVeCZOVzuXDED2vwEV1h
	6LH0iIFkgqNs4C6UYDOtBQFFedAyLg7W4rAU9e0ItBhi2WC3Q1dJxE+cibHP7dMp
	UD9YWv0NU8WjghJj56UjCEIfeU5oVdfGqrKPmcmwXW2Aq8O72b5ZgZfcN9uMOiOU
	bGTBK4LA8c30GpX+JAX2JPQqjaKbLyCx8DEcNpbS6kUNgDjMhNs2tW50QQ8gNzda
	atNGEZ9K/6cYS217tEqPYjgqICgNJs3v3VS8FyjPMaB4StqzhhrSh/LUjDAW7SNk
	nzCCgw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s35h2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:48:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d812c898cso217220241cf.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 04:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778845703; x=1779450503; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ereORPv71dmyzxkJLNhe5MuVEc7N5EYW40Eup96NbL4=;
        b=OJbznKVSN2/jSk/N9Dmj8FHpjCpygXwwgcP8cMyhtFf/baOeRcpZK1SBaN2TWW+DJu
         xEbg82cLOAmotqnSok24nCxd59VVWDIIPndUQTsPOsS4TliL/L5xJOZcEZLb8oeAEs5Z
         j/Lr3dKNDPM1/wiRwn5CTBBFD4K8RE3+VtENIpIjOpZT0JRBSWtlAC2WHL/Kp9LJtW/S
         0KQ3Hux3AvZZh+7M7j6RrYSNPTduSIS8hcHV1/hkhAA91nMsnCnY2uwLlac5FUB0+IU4
         Jy+P53zGwa5DZ4JWw73KyXXWyzo4rtlibC85JzNeR03fw1BnqOnqURAbnkNOOG5u2RuP
         USqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845703; x=1779450503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ereORPv71dmyzxkJLNhe5MuVEc7N5EYW40Eup96NbL4=;
        b=MFBLsnWOSHufSwDvoTWDr8JFQIzTEwOCunjtRrhoDteap6vjFqchcZKtzcP6NqjNLG
         pfuLMezLIyCOsUjf3Z7GLT3mdLJ6Y3l+nYliey/z6tRYUSp/GjQ48PVaAcEEXXQQvNQM
         jDjChx0fbNHUrFo5Aj1QPUosj+/2iVCjTQMyGDSs0D7+OZxj1lnhFBx6sYh2rB0QnncA
         JH8XV5BNmpBr5hvv4BGdvHMjHYq59fqDRSKy/rA0E/QTgyXFp5TylJltKOk84ms5HIua
         DH0arDJPTyQ6DD2elvoxbPbl46v813ZUtISBBDjOgiXneHASkHd5IN6njfEdR4SURaep
         cHrg==
X-Forwarded-Encrypted: i=1; AFNElJ97EGUhAZMlHHBl1oK8QY9HUYFM1Vy8qR7PMVhZQnNkfPCsJy3kkAS8PhpO1tobD26Wf4T7jEu7+Qae@vger.kernel.org
X-Gm-Message-State: AOJu0YwytGwONoUJC5Aws2ufRDIXlr5U3qf5YBSVFFFpPp+crDN6v16w
	vR4AfGVA+xYzzrBJ39b9jTQhLVNh4BUMz2rvBfPU1294vJA3v2LtwQzRwxBJO/53PRGY4WJhBhZ
	D9Vag7txtilT1AD/ZpenYvQpqsrk5uaaCFCQ6iDcLMeYn8hK7VFN0wkaM3IrNHgxv
X-Gm-Gg: Acq92OGOXaMdZws2ytR2CTquuHjm4hROc8viiij6oNlQPWcEZTGLtPLlDPzaJIs9BNC
	CSWlKKCrDUD/zsVPbik3exQPv1eCJJVR9h3V99q/QRbik5UEO+j+fzvoEz33f2/Hv9vYcHDrU6Q
	MM2FVM5SH340538yUK7rgQni1tZimgrw+xL8sDPA0BvGocjXeI/hZIlQD9Dqu0V0oXxGp6aetCG
	QCi6uzPPNTJVBM1SuJVkajrfK1f1TlyNDe1/AMnyhWuTsbw+6dDRUgzGbxP/t+Y/ELI6oG7HthM
	oXqMVM1Bg2NWEtvbXR8vSujSfuP0B90f4GV4Eo0/wKdAu7PPJXZ75gZGxqrtirhyAZ4wyklC+9s
	aMqRiHHEUfCVdE/JpFvadoNrGDmszxXSM2fibX5/O6raJCCIDj06X0XwhenRLc+U+roN7gs3AJw
	e4qen48hlwEsuPDcVtVW+D9enP1fxIQuzNbzM=
X-Received: by 2002:a05:622a:8596:b0:50f:b9e6:e056 with SMTP id d75a77b69052e-5165a1e6733mr38965011cf.29.1778845702989;
        Fri, 15 May 2026 04:48:22 -0700 (PDT)
X-Received: by 2002:a05:622a:8596:b0:50f:b9e6:e056 with SMTP id d75a77b69052e-5165a1e6733mr38964481cf.29.1778845702533;
        Fri, 15 May 2026 04:48:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a682sm1265079e87.31.2026.05.15.04.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:48:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:48:07 +0300
Subject: [PATCH v3 08/16] media: iris: skip PIPE if it is not supported by
 the platform
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-ar50lt-v3-8-df3846e74347@oss.qualcomm.com>
References: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
In-Reply-To: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1159;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=kRKs4Ld/R5wPud9lDZEt6GV0QZ16SIkZn9USZSX7X/s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBwf1dzSPYUNXXCAOdUKHIEe8uETw5V1d4cuvO
 zeJEq4oI2+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagcH9QAKCRCLPIo+Aiko
 1eyRCACZTIolvT1g8ucoISptBMFImSKXBpdskGTfE4rzNWnqgntrg6+BxvpmbbqoIADGWgXpIet
 ijO+qYJhtajgbZlHVVQZLmhMAf0zvPOguTa6FWPqKszuIDjZ5t/4DusDiJrE+nani/K3D7iJLr7
 slPBOJ8yS+ePRHsVD2LYkfkU8SU5NrYHo2wN+Q4eZMwS/Wo6apOT+1H/WJJeZdZplSRY8MaPj0y
 yudpDutg0N+UeXPWMaftEhDbteGwKfK2DTc+K1tAf7GKPIZSQCjo551ek6V0tJzWNcgIuDXGRMq
 ji2DtGnoK1q8t7dN0I58ZewzaetTkVEghD94y7R+2KGDj8pG
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExOSBTYWx0ZWRfX1B9eCnohuhE8
 ZCgaA+feFT5uYj17aWaCTxn670yT6c+gBvOSS3mxyoPRlGV8/0t4EjeL/FZQ5yPFRV/fEXOJ/HU
 rxwPIr5T3bM1SWnev2H0ECiOXqxV23rOYwSwG4f8/L5Go25grqQNdMLkTPhyr037+7xkMuR+7rd
 pLjIbFu22+6GiMKhmg5bblMFJ8+8Vnz2cMwf15nlWbudYbui/DSGvW3NqHwjuRcAA6jeIJ8vFfr
 LRhqSFpITQ8C+H+kSCJf1era0/0yDkqFFYbdnbKubTReFxz35QejjacYVUuuwJMvSWYIx4p2nX2
 d0RR7zzKU8k+A8xKN3M3/gzXjnM98QW2tXxNtWZ811w+yTLlrUORPSDt6cQCTkWC0Rwzd0QgGUC
 xRywXvzw0PVlpbJZdLb2inTEawMt5RcRgxgFTAcCKptDq97PQvoOEkY3fc2Uo0Fgs+ns/WsdQhm
 0LzNOSe8YU90RIx77+g==
X-Authority-Analysis: v=2.4 cv=Md5cfZ/f c=1 sm=1 tr=0 ts=6a070807 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=9TuWGWrZIemhly9L:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=DRvvl89rPFtLv9ObwM0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: CnfBR0Fey9S6_1ZfvSikK2YeYOMqKBQ3
X-Proofpoint-ORIG-GUID: CnfBR0Fey9S6_1ZfvSikK2YeYOMqKBQ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150119

AR50Lt doesn't support HFI_PROPERTY_PARAM_WORK_ROUTE. Tables for AR50LT
won't have corresponding entry in the capability tables. Let
iris_set_pipe() silently skip propgramming the property if there is no
corresponding capability.

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index ef7adac3764d..f438dddc19ba 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -450,6 +450,9 @@ int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 	u32 work_route = inst->fw_caps[PIPE].value;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 
+	if (!hfi_id)
+		return 0;
+
 	return hfi_ops->session_set_property(inst, hfi_id,
 					     HFI_HOST_FLAGS_NONE,
 					     iris_get_port_info(inst, cap_id),

-- 
2.47.3

