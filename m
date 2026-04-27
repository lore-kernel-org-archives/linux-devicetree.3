Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBBC21A447
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777253495; cv=none; b=sviEXwOK2LsAKLTzdqzSk3ju1TsvpRSZkc/JiIyX6FeZNlqxyU0vJbr448VlDltTyPwQb24X4snLkLdXl0GBQD/W5oKX68GJXNy3jYoR9J6nb2/Nw+fzva2w2w3vgCxPuTOgPbgKeMJd5yUfGTYG4/jLRpnVVnGyJdIF61B7NZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777253495; c=relaxed/simple;
	bh=CF/VkGSnULA8sexSCH7XNQhxVz6rJI9RlejZ4QQZ/iE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YcYknMmgA7mupq7yl5RTzS9MGI9w/mNhJNStQktVepvlFvglVRdTTW+ALBSUia27voXh2l8tb7Tn2YpzEfU+K5SlJoCZUiPHV9io/hl+Vs/ij0MkPlcmI6NvAJkp7DP05TnodR7IAkkbpU6CAj4RePXOw9iJ0NRdntFED1gHsKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jMaqNRru; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KFFIUYzB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jMaqNRru";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KFFIUYzB"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QKrAuu1437632
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:31:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1ykU0Jg/GL/
	a1gB+8RXaCy7Z3yIThudpi0vPFY9q8Ws=; b=jMaqNRrupI8ZS3eDfpZxynfLOIS
	ZGdbChWy+b6f49EHilVgDtQUpMj2NOrtWF/GeqFcFG2loKd4N1unoMr+9COe3M49
	cMnQt0YDBTViTEfTGAUehy/Ws++lo1nyNzzcOYG/L9rzLoPBZghyZ4+sofDSMLiY
	iWHHHZEbfTuUACPzvliL4kd+CXP5i2MWM22eHdupFVCgrh4a1GwmITjVEalpnqcO
	CmPAIMODhX4swyytC2sQuZZXlHDfzz24XJbWkkimSV7AXAA9Gs/ZX1TmxW3/xIZe
	GFsS3Ee9QC3T82MEaq/X/hHUZX2cJM4QK8M3LoYBHm3fNglVLOyZAxqMTQA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnnf3w37-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:31:33 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c16233ee11so13346734eec.1
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 18:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777253493; x=1777858293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ykU0Jg/GL/a1gB+8RXaCy7Z3yIThudpi0vPFY9q8Ws=;
        b=KFFIUYzBhdvRLUsa6IdNtpKzPVVBs2tFqU9ypGljmiIIJN8rhCkatklnstxpDHR3uE
         804TXOS4SBgRNk9sacbjohlZ4n1a4saf8WgOq5PhNs/rKabR+fU3hbvRi48TSxlu7nQM
         LxLdVPFlBaOqWa3xwgz4lBcMrj9ghsO+6JT9TQ6vSSctrTSLr2gylsFVS6ZosrUEmoaM
         nIv1qUH29PWS2Cdn9h1fqjJ02qnprJeskNxHKPjeQJlNTrz6GbNBBXjHzzL8G9qaLG2G
         UUEflYS4Mdj6W+kyCozB4tMouG/twY67iv5FcQtitl048KKTZvezYYtNA3nFy3iebjKL
         gpnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777253493; x=1777858293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1ykU0Jg/GL/a1gB+8RXaCy7Z3yIThudpi0vPFY9q8Ws=;
        b=DdsugUxWwLobvBZYc+TIeIsk3Fp4pwwrtZ4yAk9CZ9w8XLbPcJjSbDJfwFzPBhzwcd
         tbYB08N6boklTu0ZHckQKx2Hgdvh+q6xFv8SdS8mfOSTKIaviPJsSMJjJjDpFg/XoSvo
         m8yQxqxK86W33/GE2AlB0Z8x0WNWo0U00GldcILdnrIWW3THV4mCzQzwP4bslB7SNmIZ
         B3FAat+kxI1GJZiOimD6DaOaeZz/2/Ss/jZ2OZzlBBUB/6Ydk4q3r5FGqEhOANLM6vpE
         PHRLfrmR8pA/fYS/YlJjKi2vLtDSNJaFBsvpqAdxOK2Xsn9iOU9Et+t7PXAT+yY176/K
         5QWg==
X-Forwarded-Encrypted: i=1; AFNElJ87h04DOoQyijb62707hj8B5e36jWiXrpJtrcH8QAvx8Rof4yttRke/HwmA0+pOrvJ3eklaq5e5RBso@vger.kernel.org
X-Gm-Message-State: AOJu0YzqkVlxlhvleZLaU2wZX9VgSc2Pfj2dmNWf31yk5p9wd55m1DgQ
	/zTHq3LSOFVqj4jhjWipEcgspoGDYNX0V6qF+ROh4xRn2fXqsx4sxaj+o/zW1fbLD3SQVmFbj1B
	0d3eu0lIHb0gfPuI6Rt+GBuGpYkEbOdAeYMO2XoXOGLYr8Lexp5DCDz6Hz04TWP/Z
X-Gm-Gg: AeBDies0i/YWUCdyxprvYDqgHx33f7zt411i4hN58lQygRF1Nz+OwUzrXvBNHOGsEv2
	sqUbFH8U4o8l3PXDcqvuEybpq+rXAfTJJiGHC1ph1urdYAyo3582bQ2z0Qdr/I0rB+JHuKhgMM9
	Hi8dkEB/0VexvScMH7cE9gpYDupjbD1cuMy06eRWx9CqPdUrBgHHBT9vXVF8D3TgxP5wIbT9ZhC
	jG9T/K9QIeAtYWHUCPj2+ji8i6XB/5vkXP783pXk82w7y1rVmJSGo3s+reEe59cXO2sqQrtjM+w
	Ue4AVzhmwQA5BVIebjgQ8QSPCOTHvTL9isvnAboXqhjn6H0RWGqQsLjhsHpOas6YAAWHD9exgf/
	4L3/Ur+pxxd+72y7Ph08McaOfK1SqqKELPe8h3HCE3wynBahgCiIDWIR6Xz5zNy5hxQr9MosuMA
	oE8SaOrmnMCXci2cLh
X-Received: by 2002:a05:693c:40c9:b0:2e6:ff79:e344 with SMTP id 5a478bee46e88-2e6ff7a04bemr15279272eec.9.1777253492751;
        Sun, 26 Apr 2026 18:31:32 -0700 (PDT)
X-Received: by 2002:a05:693c:40c9:b0:2e6:ff79:e344 with SMTP id 5a478bee46e88-2e6ff7a04bemr15279255eec.9.1777253492218;
        Sun, 26 Apr 2026 18:31:32 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a8018sm52749042eec.8.2026.04.26.18.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 18:31:31 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: "Martin K . Petersen" <martin.petersen@oracle.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/2] scsi: ufs: dt-bindings: Add compatible for Nord UFS Host Controller
Date: Mon, 27 Apr 2026 09:31:14 +0800
Message-ID: <20260427013115.231731-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427013115.231731-1-shengchao.guo@oss.qualcomm.com>
References: <20260427013115.231731-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lhCsGjHFUqLJ5u2sAKVav286wU_NC4Iw
X-Authority-Analysis: v=2.4 cv=Y5rIdBeN c=1 sm=1 tr=0 ts=69eebc75 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=o674AwMwzFixoRFAmicA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: lhCsGjHFUqLJ5u2sAKVav286wU_NC4Iw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAxNCBTYWx0ZWRfX1Pk5E1WGgZLr
 X8K3CPHP2VRj5aCTXCTA9wIbaJh7l5H//o2wrFpubuG688px7T36iHW+2I4w8lxNh+ePXt5Ex7k
 arB4GJXsnqXu9SAIvaRbmxF9rPdvHvs/2Q9IwDQsuNTfXkRrO3a8zNsF/4zcsVwW5l04RAwD2wD
 wK4Ge9nZPCfh42xyTGfkjf4Q94wYPcM4sO0EjVswz5UvhFTB7QcRVgJRF+wTdyH2GyuPxhWNs6t
 pz1oLtMDWIplyEMphW7CGyJ8Q3aWrYxysFoUWFdoiAqY2Gsoq9gIl/C6IXtSiTtFgudE/U5dahO
 2eSST66u1O2yP6lyd/VqF38s/5fCftiqi3xnxgf965H0FxxPLpu1MVQ+oDduRB9oBi3uNNsJPGX
 B4ITUi+Zu35Lgi6pf4LHUYUzUA0mLAUmXhSw1esVCMhuIdcbvtIN0Guls4wu8wz7ZqKsYT6FtJT
 wtImkLPa1RVKrzpQugw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270014

Document UFS Host Controller on Qualcomm Nord SoC. Like the Eliza SoC,
Nord has a multi-queue command (MCQ) register range in addition to
the standard one, making both reg entries required.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
index f28641c6e68f..900d93b675cd 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
@@ -17,6 +17,7 @@ select:
         enum:
           - qcom,eliza-ufshc
           - qcom,kaanapali-ufshc
+          - qcom,nord-ufshc
           - qcom,sm8650-ufshc
           - qcom,sm8750-ufshc
   required:
@@ -28,6 +29,7 @@ properties:
       - enum:
           - qcom,eliza-ufshc
           - qcom,kaanapali-ufshc
+          - qcom,nord-ufshc
           - qcom,sm8650-ufshc
           - qcom,sm8750-ufshc
       - const: qcom,ufshc
@@ -74,6 +76,7 @@ allOf:
           contains:
             enum:
               - qcom,eliza-ufshc
+              - qcom,nord-ufshc
     then:
       properties:
         reg:
-- 
2.43.0

