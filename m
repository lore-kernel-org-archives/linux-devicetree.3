Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C383E9F90
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 16:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774455738; cv=none; b=e1rnTz12quTlTlgjxaYiaRMLPiBgSqRSZkpQBR08iyRIH5J4fEKgy78z/vn2QMwu0MDis4UhytG47MI7aPUMMC7vYLoV14DYZagg9NsgJG4OoqphwGDvjn+XRdAUmHSfCDeSK9wCWoojPj627G2x33Temo5f73NoDd4OnyC8rbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774455738; c=relaxed/simple;
	bh=qNmwkvFamYkwV7C+aa1O9yNiTeVw7IeC1d3q36N4w8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PD1XU++JOF6KdDTED8VJ9X/gsqjptcUA8w9er9Ffx0x7nG9rRhOv8CqEmjliDgm6seNJTAIoAsYZebDrrC2lyU81zqBxVTtsQxkaT1TqH9CzXu2Q0YpdAQeYgHZhkYHYD+7cwS8uaYznVrMuLfSJ3Ws5exvmz6h5e4hLpygEsaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mkpObtTk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OZHMIet5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mkpObtTk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OZHMIet5"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFH8rL2737579
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 16:22:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GWT6G3Bd0orn86nHkIcAG1VAB2T7rcCWVucJU2c4LtQ=; b=mkpObtTkNdh/yzSu
	LhUxBBf5MMUvk6GM3HOB7CPuv2ZLshHpIpvZLG/2bOwbQu5K9uoSGaRGjVN2VInJ
	JxJ3jZGcB33EAHi093cq7nhdLzRMzi9xsGX7ExIrVC0K1mb5sqalF73moI7LJ9Oa
	PGU1gBDm2n2ebPirmAt3zF3OWiD0Bo8AUDjlFgeFU01ssnnfeoakAZ0+gCCI/JiD
	lzrgBnsn4HhuCxdv6soN38/iBDOjCY5RTfuhNt6CWE2juU9ne7FJZ1/XFXYFbSgP
	pw2uLL42jEq5kCB5iNxNBqnxk8qX2i/yJPQDG1Idcifs+NVM//o4DDh+mYzLq/uG
	nUkmkA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4859anmx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 16:22:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b059ab124dso13205ad.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 09:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774455735; x=1775060535; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GWT6G3Bd0orn86nHkIcAG1VAB2T7rcCWVucJU2c4LtQ=;
        b=OZHMIet5whgPIQoC5DO1z/d2XP1ENroN4MbDvvRpTAUx2COmpW8rlHil/CiKGl+nvu
         O+0x92PPpXLQPBX/N7Wpu7CASjFSmhuFKUa0LIdrylMTDtck19pV7FpxC/HFLok6+YpW
         dkYY6HzZgx4dtFYs/s842qWrg1aKv33Z9WMyyW9B3H7YZtqTHA4DTrd9+1FruD8qRGBi
         lmd9nmEV2VJaByfztNCDv3Y9UUYn8HnaGBQgqRMpvu76T8oIeRVVsl/MdxdOaZBm/XTv
         one4dCzjeMAKshTrDukAdaPzc+4V62IroYpldYZjLTlIyK9FNT7pPZi42VimhG/xaFfc
         2ZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774455735; x=1775060535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GWT6G3Bd0orn86nHkIcAG1VAB2T7rcCWVucJU2c4LtQ=;
        b=kzVs4g0BTl9luW+YXhwiN5xI3veTS9TNcet9Kj4WlHKD6CPGGpyJgMiHWqC+w7fwZJ
         0VOHRvFh+CzT0L/Y1wtpjCyBEI1xqB9igBP0fRoO9ZaNfUizYvxnaeBB/UM8j6UxUneM
         Fn06cjXWKFFfKTz6bKq2dqGCP5H2qymxn/f3uVvCKh1oVCl0pl7He6S68XR9yJMmpQBr
         pEqWtXdlthpm9wzfKXX2XQzRXbJJ2xCIeM0kd2nI7gf9oxNBe5zp4QLl7p2+S9LBTZWr
         6WqzsUTZepNtl7jEXo5mt50H5w4R71REA9ztJLoVP4anT8iYI5mLWnhKhTKQEsBT8/ND
         MmJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVw7urdnhEYsQIZRLBsn4ffcBsAJDsaGKFvsnnim2Glo8M4nc7f6zXrnCoBfca5PixwxQufXVyi4YpA@vger.kernel.org
X-Gm-Message-State: AOJu0YwRhZukDxgmzlJz2gsLCNbBRTwZ10qbApp7y3OTGF0vIiCl4Gf/
	+/qiUlcbzA/qhuubZ7LwLqN/yPXKKGVYAXRn5LlWdhT1tR+JB1bBkH4VsB6Ur+GHqOSHHBDl0Li
	Sw89iOcESxls3ZVtfSC/olsPOXCsGytnHExxdlxnBbANdGC1ErZNiDv/L03EnA4YE
X-Gm-Gg: ATEYQzyp/E3fLL7U8IV2FoC8zMy+q+pkIdC/snxhYcfBI40EDyUO+xlKldd7BbhdxCS
	y2CFzlyfqzqXUJTrgShdsTur77/FUaVBQ0Pw6jLbF6eiOoD1ABHnsrnZ0uWuP1xiz4zlCSxw2Fr
	i27PIdrHtVhhBUa2Glc5KOD4tnfUGECoh15jKEM9j6oybsJ5sk0PFmQw/TYy8zOlEuIxR1n1zHj
	R2qbosiZcToFIXhlnqCteEWxXt5ZQJ2xnWSI7py5A38J6TEv+45/fgGWJAFzXhnKV3e7v6FUNIJ
	MOWIurF64g45s63mv04MwIXI+S+dnAfbVUGkCzWjF3mFw2eRBwsleAYf0XNsjXsLf4jil6/ZD8T
	dkBhdmmNClYrXnXoYDMI+GCHplZHg0oSgb90FuxTUEPPyGRXywa/ogpVIEmx1WWJOvXETScwmH7
	5+3Tb2leGtH1eO8gDaCgpKfs0xCWorilBmxlyQyafWfqbBqlWB
X-Received: by 2002:a17:902:e885:b0:2ae:c67c:3b05 with SMTP id d9443c01a7336-2b0b099cb9amr47459655ad.10.1774455734780;
        Wed, 25 Mar 2026 09:22:14 -0700 (PDT)
X-Received: by 2002:a17:902:e885:b0:2ae:c67c:3b05 with SMTP id d9443c01a7336-2b0b099cb9amr47459225ad.10.1774455734317;
        Wed, 25 Mar 2026 09:22:14 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc8e958csm2945415ad.66.2026.03.25.09.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 09:22:13 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 21:51:51 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: mahua: Fix mahua bwmon
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-bwmon_fixes-v1-2-9433f9d4c276@oss.qualcomm.com>
References: <20260325-bwmon_fixes-v1-0-9433f9d4c276@oss.qualcomm.com>
In-Reply-To: <20260325-bwmon_fixes-v1-0-9433f9d4c276@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774455718; l=851;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=qNmwkvFamYkwV7C+aa1O9yNiTeVw7IeC1d3q36N4w8Y=;
 b=MIZzkonLkLRbbp6XCUQClhuh2LgrhsxPTsaB/IAvPmNDl7j4Ml4XTqyjsk3aqNjY0V/3mtidJ
 Y96RU++JtaOCVCADRKS/SEO9btI8xxSqQDchm1STRHVO0VB9VZFntLs
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDExNiBTYWx0ZWRfX+Q/wsnr3N3wI
 8cheOLzgq834M0qljr/ot620ZqXJEJQegxqsSZpLzQXoa7pOHshAkGsxMJpKN3MSS7IwrlhpfM/
 YwOcx0SY8eitHcyfgPpCSBcPqKzXddDPSVE4lwmp/4rgC/xeMzNfF2bFsHGpXC9Kh+9PuwRwqsd
 TR0QApcdrwkx3OCp663qxGdG4wnWb62e+107IrKYv5ScAqO0Bjm7IoYo+DWjNSYxltcId4YrxMR
 2kqyNNlPcbWx7Pbx9wKaf2sKGnc7FadXspDp4nvx70vMKtxf3HkS6H23UkhaQjfbN3Bvig6c8JP
 kl6xXrjt0dgIUdGDlPB9xwOrsHLEsebDjw6ppaVdBx0R1BV6BRk9nPBMgrdLYKctvSfXtmUxjAH
 pg4R93UT0oc5mxE0prQtOAdooCzBpr+JkYwm5rqp7wBXQmoabFG/NLq9zVzMJagN3p+kxjYzmED
 6w5Os10hmN4sLZWEbUw==
X-Authority-Analysis: v=2.4 cv=VODQXtPX c=1 sm=1 tr=0 ts=69c40bb7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=LcZodfw3TWvoJB7P8G0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: -rOIPRdRn1tftNE6_613Az_Bv8qSRpZN
X-Proofpoint-ORIG-GUID: -rOIPRdRn1tftNE6_613Az_Bv8qSRpZN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_05,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250116

Delete the bwmon node that corresponds to non-existent cpu cluster 2
on Mahua SoCs.

Fixes: 598eedb21ddd ("arm64: dts: qcom: Add Mahua SoC and CRD")
Tested-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/mahua.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
index 7aa8d26b2b3a..460285e783ba 100644
--- a/arch/arm64/boot/dts/qcom/mahua.dtsi
+++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
@@ -6,6 +6,7 @@
 /* Mahua is heavily based on Glymur, with some meaningful differences */
 #include "glymur.dtsi"
 
+/delete-node/ &bwmon_cluster2;
 /delete-node/ &cluster2_pd;
 /delete-node/ &cpu_map_cluster2;
 /delete-node/ &cpu12;

-- 
2.34.1

