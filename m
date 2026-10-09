Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AC43D9556
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 04:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791521431; cv=none; b=rkzmvn7FR9Oe2OLJULdxBYOj4E8NkoYv6GLJpj/3MFMjUki7pLBjdYSkOxdyYaBECZUePVf0Ds4TRXVcmhmPkikA+oXu9r2vuqEE4iFKWg31MfRDpX/TwsDiMreNiSZWc54zm7KaO3gN+tfj0YOEQ3oQoG0nutCPsqYOL6bKNac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791521431; c=relaxed/simple;
	bh=0STYxAxDE1NjmlumOdbThi5YeoSWS5eKyqTdJTbik7I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mu7GMSC1e1iM36vJizbtJPOTJImFjQcTCe1j+UtoCvL/Zx1YDKibrqRDFMFpCAYkAZAC9riAnNbKOmnKhki7lQ4D3EEyyyy68QW46O1s4kYjve3Lx3yVpV8l0y8qXDso66BSv7Xhgnj2i1g0/NEKnGuRpdWcqw0xOkv/1Q9XztA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n8DflUv2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R1FLQ3ed; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n8DflUv2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R1FLQ3ed"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HWq04179134
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 04:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y6PDhPtXFIAM/ccyT8/MEF2gGuCNuVMLTbOdYMac8XU=; b=n8DflUv2GGnZ7OHH
	k0mx7cjfzL33RyK+vCD3SeAFnNxUkJK9vFtr+rTQPCV2pZZW0dElM8QB/R6oeUeb
	wWWF9RLUCSFqxaAivxamrp6kZWTleOJICgHKP0/cveiUSk07EzAcFI3bzDMQ5C4a
	WvIG4p7zWx+xbBEcGVpnRu9WTch/Kv6Q9gFXkeZ+oIkRPqL64OYmlKUpGgbbM5jd
	4dGPPJzYWG70p8fSHNmIHfIDXRR2pnzjSMSwkt7w8i5Uf2P6Q4MCVJzlZzbVU5ee
	gFsUFjCLHM/R5s6poIcyTc008GOGPn3hvGlsjIYa4pvMCxpldK1Ru5u2kUpCgixK
	oTRZaw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxrsy3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 04:50:29 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3515266f6eeso3408578eec.0
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 21:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791521429; x=1792126229; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y6PDhPtXFIAM/ccyT8/MEF2gGuCNuVMLTbOdYMac8XU=;
        b=R1FLQ3ed95twNhZCB+x19ix0cynVMxJRCjNOChpLnKQ2RVhrWvEYEnizdsBCO14Omm
         SpDOQpYkARVnddM+TVSx3FAglS2pYjrf5bqDV1069uhuQHOLHNi4kMQrjPGjUUM7JWzn
         qR6i7qLVb5x5qaNOwCFd+26t5Kyk9vT/4DjArdlPcoHC86Ad0XbXVS8mwz6RtpsabJ3s
         JelGT0A7JAPZ1VuaJS4jlKgIHICwBOY9+/k0fWEAJfaSKnVRg04tYfARUnBgYudyTMed
         +lzF3ccg4zlp2DNd0lHtNPPDik9Oq8qc0I+Bk8HLC1XnKwZaPp0cSwwDcihOhe80aaHr
         dwrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791521429; x=1792126229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y6PDhPtXFIAM/ccyT8/MEF2gGuCNuVMLTbOdYMac8XU=;
        b=sKCuTLkyDL0VYoRPf6lc57UtYgtN0kZB2xMuNSZf84HBWQHL/Ynid3qLbyXrzchfWj
         EP/CO83/HZyv4SCQqTA3r0sOx4xnCWJP3O5verYPfCh5EoQNUPDxGbk9/PtSNyxMv5PR
         MappfL+3yJ+HYZddRulzq5EZGXU55v6lL48yKoWQ4k6knQ8ot4s9xhGlbibQIlKctFbq
         cC1mJIXCAglnschZpgw32oKc2xjWP6AypwG+ZsYV7Ui7kvz9OSN5o0FRfiFM+jwY7nRb
         nCeEg7BKrysmoPdWkY5HnHoEIbn6kPg879Kf6dYomApj8iMBz7wwQPDT/s2yG6DSPeNW
         x2PA==
X-Forwarded-Encrypted: i=1; AKwUvByO/dLrdQ4jGIAGv8YJW6RXtFDU+J5h9++ssEzmUIcMrJD67YT+C0d84aLSz9+SJJHgClc4PpR0ZozS@vger.kernel.org
X-Gm-Message-State: AFuF++lzDbRXjQpNf0+o0DY89PoncxEX5o7LYy8fnjCLSTa494iYUV0V
	PTw2CVLDi5dcH85P/HPYtI3ADL+/DFYG+nxE7Sli3X0mapntdaMh+5HnWDaAAPeUkZt+zJ+UM1u
	P3eeJgZmpWmjHh13cCx9AVJdi3uHRdbsC4//RCTK+Ox0VCYSoDBWR5nKGAmTKGevx
X-Gm-Gg: AYBFou0CUNA3ImJ3exa9QExV6GD2PRp/9V5mS6gaGk5G1eK7ZVlev1VzPQ6J4tjEqzN
	+NxbhuIulhXB3JZR6fEZyBhhvfUgSF5PLLI66GjQ+nqBTAzNHozLOdB71S7GK2+yTSQFbX/wRSv
	9G5ilIk7KBJFjz1RlVQAgfCGjUqvBEtkndeY1xWVH9nH5oDJ7fuN3HJtLvTOER83K1Zw80wkfqN
	6fP6U+jtd0gFwQfGs8PFNG8wufBnaT5tYZWVlndZrkz/6KadCMkvmfWEbUrWeJsdkZ31qUUTzOv
	1KUGgZKblOz1cLX08MUjtIRXLd8pVPfOqtteraryWefStJjUFdUWfk3NSLjtV2psTbR6OiP0sBK
	6sQ5Lxt6SlinIHUrbsc+uuNHKVYXi0R5lR1OOFcfjH+/rLm98NmgCm4jJtE0UA7/+nkS/YQsMyI
	PwfAnS8z4/PalzQpomUNvoYQJEe7AIig==
X-Received: by 2002:a05:7022:f503:b0:143:54c6:6a5 with SMTP id a92af1059eb24-16a6169583dmr868440c88.37.1791521428431;
        Thu, 08 Oct 2026 21:50:28 -0700 (PDT)
X-Received: by 2002:a05:7022:f503:b0:143:54c6:6a5 with SMTP id a92af1059eb24-16a6169583dmr868404c88.37.1791521427901;
        Thu, 08 Oct 2026 21:50:27 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442956asm4151609c88.16.2026.10.08.21.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 21:50:27 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 10:19:58 +0530
Subject: [PATCH v6 4/6] phy: qcom: snps-femto-v2: Fix order of arguments to
 qcom_snps_hsphy_write_mask
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-phy-v6-4-50408e45bcc1@oss.qualcomm.com>
References: <20261009-phy-v6-0-50408e45bcc1@oss.qualcomm.com>
In-Reply-To: <20261009-phy-v6-0-50408e45bcc1@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=E+1YNqdl c=1 sm=1 tr=0 ts=6ac87295 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=GpOyvZhAS4UUCrMfQdkA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: iICuUlOPprptGvlqI-fyR3jvw0Wu4ihd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAxOSBTYWx0ZWRfXxaS1LruWQBIv
 tSJJEak42JGH/yE1kcT92zgiNSMcMgELmZg9O3+chvbCDfpj55ZDx6tCOfiYIYhXV4VLLy0d6fd
 3U4IkaCDH+0OnMSjE3cOddtY0aZQmcDPLQvwq3MlUgPEx35Tbw175FhGODxbL4wsg2IA/xLtOfx
 USLAm9/fSFIx4JZk5koIp2/w4kDcGWxKLK3PKTM265PQ15gIhM5xzvITB7AsBgZO0c6QsYEAKtp
 XqeUzP3D86ct1f5vwbgDGrO2BYMhDJpFBK71P8fX+w0j1TZy/Wq+054e+UAC885VIlk5i1HEeWi
 N8W/iCPFaDps4LEuMCzgSpT7HZAGJWrUjiWDE0yAuvs3C+W8wsQTQXqcaSKjrK12c7E4JlgCQrC
 ejgdnKVF5GvClwCup2fGgBnviUcBrNNy6j1fCdMgxDNIerUdf/tuAj64PArnQgcBoPAZi4G2Bm9
 n6wLIwetI89bcOc8VfQ==
X-Proofpoint-ORIG-GUID: iICuUlOPprptGvlqI-fyR3jvw0Wu4ihd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAxOSBTYWx0ZWRfX00OA2txlHsvp
 CNUgSiHYVoaQxsSCEvvQCE7rsWX2GwUFLSaSslQpEhcz2+NKFREWQAyR4ravTk1/6YpCSpGZV0x
 TCjv4rQj1nFYw9LX+y1B3+PI5E4Hq2o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090019

Fix the register bit field mask & value argument order while programming
USB2_PHY_USB_PHY_REFCLK_CTRL in qcom_snps_hsphy_init() and USB2_AUTO_RESUME
in qcom_snps_hsphy_suspend().

Fixes: 51e8114f80d07 ("phy: qcom-snps: Add SNPS USB PHY driver for QCOM based SOCs")
Fixes: 0d75f508a9d56 ("phy: qcom-snps: Add runtime suspend and resume handlers")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index 980ad1fb1e2e..0ead37c0dcfd 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -193,7 +193,7 @@ static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
 		usleep_range(500, 1000);
 		qcom_snps_hsphy_write_mask(hsphy->base,
 					   USB2_PHY_USB_PHY_HS_PHY_CTRL2,
-					   0, USB2_AUTO_RESUME);
+					   USB2_AUTO_RESUME, 0);
 	}
 
 	return 0;
@@ -426,7 +426,7 @@ static int qcom_snps_hsphy_init(struct phy *phy)
 					USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1,
 					PLLBTUNE, PLLBTUNE);
 	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_REFCLK_CTRL,
-					REFCLK_SEL_DEFAULT, REFCLK_SEL_MASK);
+					REFCLK_SEL_MASK, REFCLK_SEL_DEFAULT);
 	qcom_snps_hsphy_write_mask(hsphy->base,
 					USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1,
 					VBUSVLDEXTSEL0, VBUSVLDEXTSEL0);

-- 
2.34.1

