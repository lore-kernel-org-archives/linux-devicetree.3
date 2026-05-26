Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55E838C42D
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 18:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779821087; cv=none; b=I/PhYKmcoNVReQt1M/DMwHwGkMluSp1aUYnUtI9tFmx69vT+Q7XeDx4NOdFdvstAeBrGl3CRmOz4TNeOVyVH0AGxtCdMhrf+Pu7LoD7Q9vCx0G2CmQ2oUiJuP4EbowVwM4hBmP15tTq+Jeg05Zk2MzXp2M2nOc9bUqlaQmNitIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779821087; c=relaxed/simple;
	bh=tvQaf1UD99cLBwqLZN6ehrYMfjI2LZ3LtjJr3a0bqmU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TYlG7c0uiRC2or+p4wMQHxPsZGBaX998iXAaEfS3KWF3OxsWEpv/PcXn1ITELWnAicT9GeOa0B52ya5cWrA6WPpgANgLthteFgaUDHhD+t2FoRZlwAYoaFAQ0dgMg6YCPxIJRvzVqSrkp7pcFNkQtTkvNKA6dMsjTj6jqQ9NAfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FkSeWpaV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G79Ifqkp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FkSeWpaV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G79Ifqkp"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH0oaJ2977139
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 18:44:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0wSEW2ON+E2
	SU4GNk1FJGyc6Ek7uJYGIs/wvnW8nuy4=; b=FkSeWpaVBOzEh/V2OZ3dxX/Bu2r
	WKwiZcMgfaw5TOmTV8beWZcMkBSQpL7xhcp96U4Zfjns/fFxvyh4oAxjO+awzmHN
	El2NQjs0UU+FS64MWY23+KgLj4BMH4/2iknl+pUT9zKDHGXGxGsq1Nc10/SS22nS
	GrcA6RJvB4F5ziP4UwMx70XR1hHKdI062rrjCkRVgD084n7LP11+UAgsxWXElWdZ
	0Icd+7/FIRsSghKy8+/WjY02jKOhvxrtpCEyway3ZHeSZKGRHFWF1PnzBTIcnjuz
	szUtXHX/Lb0tjMDk3/HXYbeQVaoLUVSapgHKoCtEX8U1xSLBg6xHnY0Clvg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eddqks23r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 18:44:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3663818cb1dso2363209a91.1
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 11:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779821084; x=1780425884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wSEW2ON+E2SU4GNk1FJGyc6Ek7uJYGIs/wvnW8nuy4=;
        b=G79IfqkpJ9MH3my4E0bon9DJsRHwonNWwdPDwGGbOL0vaB8SwbKzoFK9CUWLF9/opA
         87gRuE+2/PYtlg0F3gK6l5kB4N+ACyTRHcabYqDCDaBTo4piH0VErd0PhEBWEYKKYtnK
         zzzGEqBOIV/puRDAdm+WkX4iFhVvkPXOZOr5pBan1U0U7GFJLKyOqR0smO1pNY9ckmKE
         N5HpQUGYONIJvSH/vfmD5oIF3Flw0FP7SvWsX6Jcb71HeFuGsaL0iHSaaGJIewTpL8g6
         RZO+4QtFRxoErA7QFGIGOZPJ8WZjVd1wk4GZGVsmDa5pdBKYKJyECwqhw5wKh9LtFvKq
         FY+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779821084; x=1780425884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0wSEW2ON+E2SU4GNk1FJGyc6Ek7uJYGIs/wvnW8nuy4=;
        b=Qk5Gdx9KbY4MgRabMwRJUO3LXa16YyU8nbk028GUotNfn9vlTCNLnmTgnqs6tFZhur
         qGzpnMWYw+f+27SRlpjC7jQND4EtPessv1YlVO5/f/vwedGIeI3QBqiFG/0EJh/RVnyu
         X0mZKTHvaVE3a3NctwgKgfNXriP76e0k5ohEMZ7kWK6o0YjycKz9DXd3GhGIu0uTMBMM
         i/dvHrSrLu4En2E0bKRoNLovCyX+QEQ20j8YznkBPgvFj0hteZ005yuXi0Eo+MfhX9KB
         utYoycEUSijlzzWTQ0u+f+/ZoGhUB9qLsbRrEOS4VUnIF5eZMtF4/mxa2h2kfUONC5a/
         CBKg==
X-Forwarded-Encrypted: i=1; AFNElJ/KRh8ZJGzzKt9Ku2ycUnltS/M1S2+kxeTeFidUtuLFKKS+hTHHciV2bJ3krRXbC/sm9+CLM74ytqjI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy17ALIelarHY0kyEgMHrRnfvATu/smnTyl5HqHh/ZnIdwYS1Kq
	HuQXCLSE/68FVMbmu6MKRMqx5xBBd95NG9jWlZInUpbCz86elKdDtcAbietruZRR0gjxmwTlOeh
	dHahND/+ev6qyoX0IleC5VG0Sdry4+I1iymXqnkzk03EnVEkKGnYhrT8UMBmT2RU=
X-Gm-Gg: Acq92OEqhVEGMsnfzCmzFphtVqNW0K5pb6bg2NJ6NAWuyC0GoyTZRFVvTj0OZpCDXE1
	63E+cTFRqL7V2uoTeGAMea1bTZt+qjyqFXTP1vfCPIXmaKy+5WkOzABrdCeoZTltwnAzj0Mcx+b
	sKacsfdhfjx32hCUtJ5Sql7j6Es55KrSP3HoTdoBDdJv+MRrut3+NGAxjWq9WBKFgZgRSZu5EL1
	YUNP4wFNr4oMaTP85OwWNKULJAaJafl2q+r2AINLr8usy0eF7n9126cR2EEUu7EKBwuCtM0aQvR
	2CP5ckvSumq9/lxXoZ3mCcXTbuhIaImUJ2dDh6miSmKlAsLHmfyKeOxBzK4doYFIZ+tfDi+V8Bz
	LN44qyw2x0aCWkg6bCFAfbEgy+hhqoqkb0bpXFbxvx2EfmUJBmF3udw==
X-Received: by 2002:a17:90b:520d:b0:368:f0a:1c49 with SMTP id 98e67ed59e1d1-36a671f4fa3mr10835718a91.0.1779821083843;
        Tue, 26 May 2026 11:44:43 -0700 (PDT)
X-Received: by 2002:a17:90b:520d:b0:368:f0a:1c49 with SMTP id 98e67ed59e1d1-36a671f4fa3mr10835708a91.0.1779821083427;
        Tue, 26 May 2026 11:44:43 -0700 (PDT)
Received: from hu-ppratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a721c7baasm16866628a91.9.2026.05.26.11.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 11:44:43 -0700 (PDT)
From: Pratham Pratap <pratham.pratap@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>
Subject: [PATCH v3 4/4] phy: qcom: qmp-usbc: Add support for "phy" reset used on Shikra
Date: Wed, 27 May 2026 00:14:01 +0530
Message-Id: <20260526184401.3959717-5-pratham.pratap@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260526184401.3959717-1-pratham.pratap@oss.qualcomm.com>
References: <20260526184401.3959717-1-pratham.pratap@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Zubd7d7G c=1 sm=1 tr=0 ts=6a15ea1c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=PuS4rQwjIVkbyJhllawA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE2NCBTYWx0ZWRfX4gYqgFGzI9Qj
 SV5L1roBrnqUHMfUMb6w/zziGPlcBaf6b4ClQvLTHLMVaGqxXpxSifFcGffFa7VoLuHMY9vi5e7
 nCuJVGjUj/47mEJdV1MYfvZPvYx7lVkdqvChMuroLpBPfFzpWnQj40FWAoUbPlC2DGJmzspO+c7
 7ZbRT4YN9MX5gre/3BVAIur4A18JlGuIBFeB4L4ee+zyqLoYu0EAFeFsFbcjtuR8KESxVMi0wHp
 NebSTg28bvcxCtEorVg6ZGbpOiNRoGE/LYKNT5Oz+cmr/5EnC52Xz52l5FL7D0Di5Zj0TeudzTJ
 dwPBV0/a8IZBzOyG6ozhLmze3Qjk8kANLu+NQzg8FEsAWS2JFQJeau1wE3ynbEZkIYuij67UG9N
 Dz5WXsQTmbUrkRS9K7bycvUilEIXCbBXeRCPEk2xn2XQl7yYa3X6tCJZZeO1O62iTYvl7uESSSp
 NkHYAVbfxJXaNTDEr3Q==
X-Proofpoint-ORIG-GUID: 0-nn8zThaJrwVziK7OT6XHuWSKLwez6t
X-Proofpoint-GUID: 0-nn8zThaJrwVziK7OT6XHuWSKLwez6t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260164

From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Shikra uses three resets (dp/ phy/ phy_phy). Add the extra "phy" reset
needed for operation of QMP Phy on Shikra.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Signed-off-by: Pratham Pratap <pratham.pratap@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index c342479a3798..067e7f6e5642 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -513,7 +513,7 @@ static const char * const usb3phy_reset_l[] = {
 };
 
 static const char * const usb3dpphy_reset_l[] = {
-	"phy_phy", "dp_phy",
+	"phy_phy", "dp_phy", "phy",
 };
 
 static const struct regulator_bulk_data qmp_phy_msm8998_vreg_l[] = {
-- 
2.34.1

