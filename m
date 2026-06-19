Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078AD40D57F
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 05:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781848076; cv=none; b=ryVQ9JCUfNzoBaShM00mPBeFvgfBMARJ13ytSHqS55QdTf0uZX8m/MwXQhJdJEpUtiLpUgkKcEW2mPNaBd5To97edHU12HPN0pDzfpYQbMwxkIm1Qs6/eZtH5d1zv5lkhVuolvfkFzdqiKF0PRrXEmI7a9eQBXS3KetWujpPtZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781848076; c=relaxed/simple;
	bh=dxTYm7+fCcOtc1WgE33c7W7bydqY0UAaS/so9EHmsNg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EBP2vTRkTwit2k/7HgN9VvcbwuRgK6nOgRcKESZ69Zo1NKBLO5TlxuUknAQHFBFkgTNNOD/8sppc+buiXKZQinPEr1QoWh0QQ1Lt7cH5MP9wPxVHs4Chg3aneV5ffqT6jt8Wn9R1hr1Q6mtIWp8NRcA2NNWgNNykNuTAv/1Izok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lsw1vQKV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V6NvNj+3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lsw1vQKV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V6NvNj+3"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J2v4fP3428287
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 05:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6erC4mvveZnx8ekE3IpeKh
	+4kGF9HErlXeDjtyEV3fo=; b=Lsw1vQKVDY4g18tGgB3OJGSnx4bcjYYGYcOcRw
	XPBLYYyj91pQpKZ51BV6NHnvV2Yf170U5iBRCM4MiN7bI/5fWvbVP/RRlogxatyj
	zq09IGG/pQv5WUijn8MWLxRK/op3GL4Uqp1usl3KgeXXspvGBZ7GWVWrUmam5H3s
	8je91lSYfngzMAD4SBQq1knv73t2rVj9GcnrkDEcoEqGK2rQvCim+4DSNzsVUWT3
	hpnYHdcn/YTDazp4qZI2ATk6zYQtoegxkbHL2E6jvG07N6gg8nZ6ilEJp3vnXfpU
	91ikmcHkN8qqWBQdea90pGaWkqxe5ZUmFiK4mmTvwL4LkIuw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evpyussy8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 05:47:52 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8453e61d6f0so1353968b3a.0
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 22:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781848072; x=1782452872; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6erC4mvveZnx8ekE3IpeKh+4kGF9HErlXeDjtyEV3fo=;
        b=V6NvNj+3PhfALvOvD+50Km370WQs0f5iuFXBWLXfvi2nxLoWi1lbDSvDdAtkGxbWCc
         Hwjb8fGB1Rcdy0L5HSNDwVknQ9I71D5+8VikWl+UvXYgN6RZuEYSTymT/n05m/CwRsSN
         So87g7JC1aWDF1mNJpQE6AyKWfdTx+bxX6CluzXhK2aDTOedlhh1w7BabjpYPaArngg2
         X0EapySs/rLwMVwyZJA3r6hDER4mvEtEV6YF8up8b4FotSwz9CfxlB37RWL6BKk/I2pO
         o20G+N4QKaobGhBJAkkbEKG4bMmlUluo3lXAVVcJXDAjZdDC1mb936krUNOs4/upzWvD
         V8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781848072; x=1782452872;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6erC4mvveZnx8ekE3IpeKh+4kGF9HErlXeDjtyEV3fo=;
        b=SOksmn9BUflnpilsjq07axjrSCHo42tmvyxKZQYDSLH3/BBV6yX0COyfgFlF367wKG
         KfJHylni1kvXVAcJ5GwOCiv9ntSfzMHCSikO94QeVO1Nl1qn8pdP2JuT9ZudbMg0v61y
         W8L8amv3UEmPftNV+fa1/9cTQp+MX26woLUrwE+egTp7ixpBWCHsR5iSU/XORB8HUE3a
         ibIpJI+701biFeMPzxbfv0sixKpS/eK+ec86M6J8aksm8u+rkWMkUJ/5H5xtQWEzxK1l
         LydOaVvy/1dmNIfuns6xyzs/vxdxg3jjdwHeEqUque3pethIiWJsKwbbYMYYhJVRdW2y
         1KtA==
X-Forwarded-Encrypted: i=1; AFNElJ/YFQmW6eKfntVsLG6wdBFzCytIxP1Kw1JzhMmjhG+ot3JJFM3K/6REPKX/up0gkiuwqmBw3VCmoHSO@vger.kernel.org
X-Gm-Message-State: AOJu0YwQH7mj4qDr4VQSNYdeJnXVkHfrwQVFnENoWA/5HVtLRn6HccPu
	XzOmO2LUTVKQtHJtbdgcufglzPNFuxI11r7vDHB2bBgMkUESiZkBMsPcPFL4tzu0NL2ePU/XOeg
	up0F6JUx5c0YCWy+AJbDDGPOSEMZnTyuIWTcvxLFNtrSrHwEpSVD5gWC62BP/yspS
X-Gm-Gg: AfdE7cl+WPDHyMVufw7/eYEJqzTW8y3UoI/Lgk6R933ZghahdZ490LBjZQSLGiN4NeV
	xeIf9Inik+xT49OMyR8GTkSXxZwcLACuAjoRP0z+vbj/4iFm0wxi8TCbm3cJYBRe5k+LleydSnN
	diNX9Z7PkkalotLXSkvqaHL1JgT8eaH91LK3Yhps3EZzg09sXqAQbiSvm0BqkqHMoWcRdTAdZMJ
	v4zJw+MEEz7JaFT2p8309xdZsSZ1dl4BrQ8GpoYEvpO07o27bu5uDXM8g3w2xbN/dAFenbYi1p9
	RqT6hlH2pFK5x5F78oBwF6UZ803UsqepOW5CiaJkAF7Z2RZR7KXktPnIO1gs9+ytqfJKTqhcett
	4Fr4QuQe9KiwSrZPX0KwZ7Uov6ULkmChXnA/6HMTWaTcg+Q==
X-Received: by 2002:a05:6a00:6017:b0:842:6fce:6171 with SMTP id d2e1a72fcca58-8455077c299mr2148079b3a.3.1781848071955;
        Thu, 18 Jun 2026 22:47:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:6017:b0:842:6fce:6171 with SMTP id d2e1a72fcca58-8455077c299mr2148051b3a.3.1781848071494;
        Thu, 18 Jun 2026 22:47:51 -0700 (PDT)
Received: from hu-vjitta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8455364c24esm1076840b3a.12.2026.06.18.22.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 22:47:51 -0700 (PDT)
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 11:16:47 +0530
Subject: [PATCH] of: Fix RST inline emphasis warnings in of_map_id()
 kernel-doc
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-iommu_map_kdoc_fix-v1-1-9573e1cf30b3@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMfXNGoC/yXMUQqFIBCF4a3EPCdogVRbiRDTqaYwQysuRHu/V
 o/fgfNfEDEQRmiyCwKeFMmvCSLPwEx6HZGRTYaCF5JLUTPyzh3K6U0t1hs10I/VXGpb6bIchIV
 03AKm+Y223ed49DOa/SnBff8Bpcwe+3YAAAA=
X-Change-ID: 20260619-iommu_map_kdoc_fix-906ad8a33f1d
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781848068; l=2629;
 i=vijayanand.jitta@oss.qualcomm.com; s=20260301; h=from:subject:message-id;
 bh=dxTYm7+fCcOtc1WgE33c7W7bydqY0UAaS/so9EHmsNg=;
 b=pvgpYCPRLHSLBojBYicqa3PrHvI/H+OtyTj6y5c0Phfb6zsiE35HGspiGhSnxXEfP7uuoQtTb
 BD/zLp5WzSSBhPRiKwRhpRpQ/37UCSRCwtn3byM8ht6pKivqVz9cuhm
X-Developer-Key: i=vijayanand.jitta@oss.qualcomm.com; a=ed25519;
 pk=Lpi7Cs3wHe8KZtqvyci7FTOLzsKpEHKGCaPNZw+1zRI=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDA1MCBTYWx0ZWRfX4zbAR2ixvGlT
 eaL4nhIdbmWvsRZTunBBb4NVKR8h4LQHliFu8YbyPLLZg561+dYnbBEjjYJHQvMyj5gmBcwE4BL
 MWt2yOSoVZMlK5IeAwMIhyAOs2UkBNs=
X-Proofpoint-GUID: UlOCCGXNw305QrxwFRCx6qDTgcI7Efjf
X-Proofpoint-ORIG-GUID: UlOCCGXNw305QrxwFRCx6qDTgcI7Efjf
X-Authority-Analysis: v=2.4 cv=cY3iaHDM c=1 sm=1 tr=0 ts=6a34d808 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=2AyYK9INLeoGlSRvxWAA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDA1MCBTYWx0ZWRfXwEAU5358lKUL
 djgdbWvpf+cORtB/hZWm7E1n+Ckt/iJDayiZcgz+1OdE+znaP3gHgUEToZyS23ti8Ok+1u/Bkg7
 ZrnuZxZWYkrExnLaECtoyr79hllqkI2u2k9z+cDgrED23Q8rsPJNG9ery2jtTW0PsFwKk/TWRw9
 FwYC7gnieVEvjWB0o3j2EZuGVTzaSZzdJN5/FqQsrDZI4H1mniTsX2Is/rG4ikjmluKI6qPvoBh
 adlVZVYhaqK/sx7ahkflXalRVvDtw2xLLjk7ayRgSjznLH94fqb1W/T4bMHfXPhGf8By3HjsCTd
 R9GanRoeFbgh8FYOFR6es7KGfL2xiYAZTON09OdGLPByeK7c9j8cHBpt3nceBCYDRCOgXCoa3VM
 MABHdAoKMcUBu8lASRiUu2ls+2xoAx7S6K8F9QZhu7s7QM7zE+3TnLoy6969wS2cuIciPNcZ59T
 btJsMmFARP6hqX3Ma1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190050

The @filter_np parameter descriptions in of_map_id() and of_map_msi_id()
contained the text '*filter_np' in prose. Docutils interprets a leading
'*' as the start of RST emphasis (italic), but finds no closing '*',
triggering:

  Documentation/devicetree/kernel-api:11: ./drivers/of/base.c:2134:
  WARNING: Inline emphasis start-string without end-string. [docutils]

  Documentation/devicetree/kernel-api:11: ./drivers/of/base.c:2260:
  WARNING: Inline emphasis start-string without end-string. [docutils]

Fix by wrapping '*filter_np' in double backticks (*filter_np) to
render it as an RST inline code literal, which is also the correct
kernel-doc convention for pointer expressions.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202606130111.ldC96rqf-lkp@intel.com/
Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
---
 drivers/of/base.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 7cb0d7e88247b..6e7a42dedad3f 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -2160,7 +2160,7 @@ static bool of_check_bad_map(const __be32 *map, int len)
  * @map_mask_name: optional property name of the mask to use.
  * @filter_np: pointer to an optional filter node, or NULL to allow bypass.
  *	If non-NULL, the map property must exist (-ENODEV if absent). If
- *	*filter_np is also non-NULL, only entries targeting that node match.
+ *	``*filter_np`` is also non-NULL, only entries targeting that node match.
  * @arg: pointer to a &struct of_phandle_args for the result. On success,
  *	@arg->args_count will be set to the number of output specifier cells
  *	as defined by @cells_name in the target node, and
@@ -2350,7 +2350,7 @@ EXPORT_SYMBOL_GPL(of_map_iommu_id);
  *      stream/device ID) used as the lookup key in the msi-map table.
  * @filter_np: pointer to an optional filter node, or NULL to allow bypass.
  *	If non-NULL, the map property must exist (-ENODEV if absent). If
- *	*filter_np is also non-NULL, only entries targeting that node match.
+ *	``*filter_np`` is also non-NULL, only entries targeting that node match.
  * @arg: pointer to a &struct of_phandle_args for the result. On success,
  *	@arg->args_count will be set to the number of output specifier cells
  *	and @arg->args[0..args_count-1] will contain the translated output

---
base-commit: 598c7067dd8b65b93f3ccada47e9014a13137f1b
change-id: 20260619-iommu_map_kdoc_fix-906ad8a33f1d

Best regards,
--  
Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>

