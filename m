Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7E0233927
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 12:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784896943; cv=none; b=ou9msx9uY6/kRMayz0M/AmrbLr0QyMwyByNLZ9yGirhLt0np7ph90bWzdrGa9FGhu3wNaZPb0yBg2rgaKaJuX+tYjI8pHnD3jBFpcyPho3qTUcUnabaxB0n6lzf641AZP3vbLHRielD4Ze5Pxhs2DL+5r6P6m53GCss105gaFsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784896943; c=relaxed/simple;
	bh=wPkzhur/NK1jDuLBYAFWPkrcGSJqVdt0NxnLJdG8vTs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rp5jpsXPJW8PCu3mLUpagUXli9CCRGf6BZ+jBPFGPerSE2IuMUYfQmEbDFZIlGsOBCu7QZj5lBsOSB0bSfPI6MgLfhOA8lPQhoEJBd7Y0kTJ28iAwRomndiay2sTGDgyzZw5fVC9o+lbTQ9zd3WdB7kNhqpDyElAXbLWuTrRF6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XXWqa59H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GJK8KLAk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XXWqa59H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GJK8KLAk"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADxkL2917051
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 12:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	siT16xslIPoeGOQMS9Qvx/13T1/+H1Y1mPmxB4G8X2o=; b=XXWqa59HcE4zdB9t
	53Ft4S3nfR9aSQaSjhCNKd93KFtCQ1ToeWjv5y/C+vd+2OuNb5r7GPfRGG+HAARe
	hoMOqASymbB8a5U15AG5mZ9ENuClGcwNrLUiExzW0/9neLmRKMJv+rZtIyoEJ5Tl
	3ViWB7WaBeASY86E5bLwfm5FCNgGRmMbjWxSNkwLUP7LU6EDzndHCk7rkJ6zxlwb
	vH02sgTBiNgm3y7qLaFF+9Gv6SiId9c00xdnC9hKPvawep9dzZkN45JUFFTYhiAk
	rrGva/6IvFjW3Vl25sxIWcbyG6OlAkl2qS/tmHeZcgSBJkOXyaL4VlKzspjHPUXL
	CVMZ/w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkp5vm6m1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 12:42:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c01ff996dso3855541cf.2
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 05:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784896938; x=1785501738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=siT16xslIPoeGOQMS9Qvx/13T1/+H1Y1mPmxB4G8X2o=;
        b=GJK8KLAkWB8jJUgXu62Zu9xR3LhKWR+Darg9NyE7DVlJx5x4MkaQ3p1mkeRihILkdg
         FqqG3pB+Aw0y7SwH/yeDRwol0im4oG3wtLbj2QvQVu7b9HFIlrS/QwXNpL825flmTBL8
         PxuJWo1sFDmsOWZpdX6+6Dr10w/3ercTwiMbiKSKl6ECaQW5QO7m2AHOI1+XlKftQ5YR
         LQHD8rrXbF8myw+dBSUybWdEIjllUDghtISckI3Dk8+ZX1gqSZI4RXRHhJ9UsjrJ+pTS
         mxSl+zjYPxoeg5tvI9rpB+vBq/SusqG+Ihstya9OFq7riBiWEdpkaLnHYeowZcg98tXd
         AyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784896938; x=1785501738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=siT16xslIPoeGOQMS9Qvx/13T1/+H1Y1mPmxB4G8X2o=;
        b=Nv83+BIZPmKZowg6QmAfFWNxSssYdoc0e8jmEn8JHrwdqJt4QMjasS5+35r8ZBw6VF
         GjfWuFRtJUkDG2mRsB1Gz8GLWRRbzDt0p1aWL+8Tum+AZ3WSGBGR0qO/VRHJ8mOqiJJ0
         9nED64GfYLDvBq6uj3rk9QIBsbuHUFg4UgzWY0z/TETj5nsGjmfQd1olhZOTFjg7IuT3
         Rf4XIAsnXpyXAMIyVupUc0Y36k41TMBl51bsgL91mhHas+8FmzBdg0bjvcs5UV00E3Ud
         IgB9h+xy7pFOqIKe2UjxcgOxd6Hd+jitzTiVNJaULDTou82KvG2cc1J8TTL3oFf8kR4g
         KlJA==
X-Forwarded-Encrypted: i=1; AHgh+RpVJf6ixA9YszP2RPuPQyt3TbIbfKAuKVmQhtqXoIv1kSocaldv7qYX75X5oVrkdOcUM7y72jmDS0jt@vger.kernel.org
X-Gm-Message-State: AOJu0YygZj70BFCKV4hGfYePRw5thVmuwRNLqwUZ8lRfo5Skcu1HAokw
	eYh1vtKuEsXCOdBl/NZOYX7xmISryHJ4RQmmAkcobAjmZKlMk8vgi4XLtFXrr5uNSiW4AK9Qi+1
	H8SCgrEEvmz1Ek9hsZOVAmPC2gjG7TTTRIo73KnujSO9s0kBCEA1y5uVZ0CSyfoV1
X-Gm-Gg: AR+sD11qv1SypYi8/vEVFndfWkrzvGmNrzEnksEN7B+wZeYO69SG7mLNzxQR8+kvZsy
	G4hZlSolePIRUhOSliIQLBb9+X4pnvq47mgugMEw93nOn7iEfgI9uoX/ULEzRUttyYYbpk+t6Hy
	1G1P2Hs0jegpXjQ8kSOsBgoVOc4Vyy+BRSOszGZqIF31JI4KD3LVPT26GWZ+DRmawZHuhiNZ03w
	dc0jdVhSlQ7bx3SEYPlSgSydoruuk90AYsn9wXCaNUw5m/4zBfWcXdBWKZRvA+pPECnl6fEz1vs
	8fuy5tZxgRSphyrilEhlk26sy94fTRqyOEVHJoYvCoD3xjXaQuzt+uSMJqUl0gKOR8OHPGJAfrf
	Xg4/OMIR0G2VsKQke0HkkKT2m0yXWAfaqtlY/RyKYKx6snT/TrM/XyQWbbzZNC+hiI5/VT3n+lp
	L/lmR69MPSzaHx8Bpyqa2UwIuN7c0OzTOkRrr9/ULr4nDMdl5N3A==
X-Received: by 2002:a05:622a:903:b0:528:3c2c:5c72 with SMTP id d75a77b69052e-5283ddf7510mr64662991cf.32.1784896938494;
        Fri, 24 Jul 2026 05:42:18 -0700 (PDT)
X-Received: by 2002:a05:622a:903:b0:528:3c2c:5c72 with SMTP id d75a77b69052e-5283ddf7510mr64662651cf.32.1784896938025;
        Fri, 24 Jul 2026 05:42:18 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:48e:a2cc:6c4:c92a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ebc828sm352591166b.43.2026.07.24.05.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 05:42:17 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 14:42:09 +0200
Subject: [PATCH v5 1/5] media: qcom: camss: Add V4L2 meta format for CAMSS
 ISP parameters
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-camss-isp-ope-v5-1-e70ad4fa39ce@oss.qualcomm.com>
References: <20260724-camss-isp-ope-v5-0-e70ad4fa39ce@oss.qualcomm.com>
In-Reply-To: <20260724-camss-isp-ope-v5-0-e70ad4fa39ce@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDExNSBTYWx0ZWRfXxv5Eu3xZnzZq
 a7aAyjmY6jtEOwL8YUMRx8fTxBuJfo1CJjSRfVNGHmkFPCzTfm8Woq0TFaWUjIC60OmQTd6DrAV
 BjtI+OUcLGsEx22v1uBazT2aEMdgd/k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDExNSBTYWx0ZWRfX8Mv2e66SO2YA
 2tBl45Is9HeU2AbNcPrEs7QhxgxgaV14PAqas9vUKaIvk3gGYLBHfrRvrmfufHT7XM10FMYdASi
 GC3O6Dzkf9u4kcSrzD+6Bc66vYvk+uq0vFKuo+hlL9W9HTwYujgksWGn9xyri5aNwJL0N4F99M6
 evPtM/EcFYv+7EurkhPl3SIA3fIvE9oGUjHZAVzPA+FB+trsIj+Cq87VrtpnGLxeRNdhwOh6OPQ
 bRhK6OYmb8X8+Gh0bvnI8Ih4XPWbE+bBCePFXnk83wJtPUSKHIurEvwKyADNHRzWbSLbS+yHt40
 JyFTp4OaXNMmDwRgeIho19CYyJvswnEpWBEDaSN+22eL2dzwK2ZSin7uNDBFRKTBY1CPX7LXdXC
 MP2Gx8AiUTdLOj1ojrT6cRltIfwy9DzRY+3BtVsfI7ukEmHn+TQmr2Fu1SdLdirIYvlPBlIs1sW
 VYUdmmFZCIbp019UHkQ==
X-Authority-Analysis: v=2.4 cv=Z9Dc2nRA c=1 sm=1 tr=0 ts=6a635dab cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=mDm0RygAtmZY0osY0NEA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: dt-pjRESkRvb8VdAV0AFGaQ0uQ5L751X
X-Proofpoint-ORIG-GUID: dt-pjRESkRvb8VdAV0AFGaQ0uQ5L751X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240115

Add a V4L2 meta format code (V4L2_META_FMT_QCOM_ISP_PARAMS) for the
Qualcomm CAMSS ISP parameter buffer. This format is used by the params
video node exposed by CAMSS offline ISP drivers (e.g. OPE) to carry
ISP tuning data such as white balance, color correction and chroma
enhancement settings.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
 include/uapi/linux/videodev2.h       | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 98512ea4cc5b9d725e1851af2ed38df85bb4fa8c..7b6e9a9a514f037190d55d59409dd6cc97522943 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1471,6 +1471,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
 	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
 	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
+	case V4L2_META_FMT_QCOM_ISP_PARAMS:	descr = "Qualcomm CAMSS ISP Parameters"; break;
 	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index add08188f06890182a5c399a223c1ab0a546cae1..011026194a20cde22a374e6fb2570cbc6bced230 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -888,6 +888,9 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_MALI_C55_PARAMS	v4l2_fourcc('C', '5', '5', 'P') /* ARM Mali-C55 Parameters */
 #define V4L2_META_FMT_MALI_C55_STATS	v4l2_fourcc('C', '5', '5', 'S') /* ARM Mali-C55 3A Statistics */
 
+/* Vendor specific - used for Qualcomm CAMSS offline ISP */
+#define V4L2_META_FMT_QCOM_ISP_PARAMS	v4l2_fourcc('Q', 'C', 'I', 'P') /* Qualcomm CAMSS ISP */
+
 #ifdef __KERNEL__
 /*
  * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when

-- 
2.34.1

