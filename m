Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC11143F0A7
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 15:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785424863; cv=none; b=dVs6Zih+QzDyykQSEX4EgT3AS7II3lDOZakenrtkFWPzDakNw5Tcn2fuX5u4Y+KPscNgEgSXkv8wYzLXNJk64trnv6s4eCDbuGP1qWoo26dHsxHTkGnHl33ABnlXUEjUFKzgAoQ5X4c7nEVYgQ1cEB0hsXBItR1HCSdDIo4zTdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785424863; c=relaxed/simple;
	bh=lqX7QdyskQ7RXFy2JV6oSvDBqKCfU2laEAg+qP6UhN4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A2VbaBupX49B1LitoUoSMZNYezxWBOH/Le+CIsUBwZ9e5tPtMXzBD1VDKQM1VGLeNAt5n9jBrYD/NTUj6X6y8/zywYipjXvK77hrcN0ctSjlCfmKE9V5+dPfqU3UGza/kNxgqEaY+oFOVUq6h4HBCYNNaR6cFmVqKYGzXrw73P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UfNa/7WI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DGmh3SH2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UfNa/7WI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DGmh3SH2"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UEiVVZ986877
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 15:20:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aJe2KQRIog2NPnQ9XLxzIe4aEBDeOYENQBZJ0ZXTVPc=; b=UfNa/7WImfPcNiZX
	uEMDZ02bmvcav6vTqG7GhacQh7X2VLvC0EQS9JS0nms3cw363+9VMekP/1cnR/BJ
	MI7RukhkrhSIY3mapBt/a1IWnh+GlSBsZmjouwhnTzK3q9I6MFUNqvawBNoW1nEe
	qxfIwo9NZnmnWOi3rfhkb/8yMS0lL9mZS0dkw4y00O6hUynXhGXAj4Q8KDHQGd6m
	+fq/wTorAHdaXeLFgkxYv+sPTbeXG+ZpJZIlL23XJAvE+H+ep4Dp+F6rYWPMjmZw
	cUI2ay6jD26uNAm1YhNTvgNYABNuqxLKEqYVShSE2XyOTi2DQqD8TBZVYKYm5bBn
	+ekBAg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8n386cj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 15:20:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-522de3c645dso42038111cf.3
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 08:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785424859; x=1786029659; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aJe2KQRIog2NPnQ9XLxzIe4aEBDeOYENQBZJ0ZXTVPc=;
        b=DGmh3SH2WQp7/06x5xYQ3AnalEJQXt0wCKfDbPCA1sspXRLw2YHiOJGdHndpQDH9ee
         TxX38gEZMLIbekndw3Xct2ULvoTj0XeolIvG1emU4ofgEq215kDqS0WtCBN337J+rznN
         pdOLvEt2N/SA1wjmnzt1rh1X03MJcU/HkHjvKPJLim8UGFBamJ9cTPNs+06C4xCpvfFw
         iaOFOkxqT+R9cEg2cj3AzSo1SpWdGU71tNGFg2yoAYJidA5Xdjyavp7EAacRyWLi+eZM
         u4fGT0H1Lm4LJytvvGQh1Hzz4U60rexOuU51DIZlBK5WvzvpVSrebedtpp6Lo6Ie0GX0
         f/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785424859; x=1786029659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aJe2KQRIog2NPnQ9XLxzIe4aEBDeOYENQBZJ0ZXTVPc=;
        b=k1QQeteSMzvFq+RvrpaZ+T72YKcLiUGCvAwBViI2TfvqBC35lSWCIIhpR12wzln/TP
         kuIXkucdSeSNWqkGTpzVz5iduRYFnfD7uAkoM1vsQlTcFZ3qvpEShwIRnmLCvecBGWJ/
         SnEvEWEt6veLTci5UNVOh6cn7Wg9Prhh3fUwXasNf6gZkSLgrFwjXsvSVI4cs+nqSfwP
         /r9QzM+ZTsERHGYWvuSQfqyMCIvInVcdy6ojgWtSXH8oewhQEzjh2pvn3GZUMmU6sIja
         pSW5uDL3TQkzL5eA3MZwIqWStcmZIrFY3kYwXibydvo2rJ68FeZGXjZtbXllZmPs8PCh
         Iawg==
X-Forwarded-Encrypted: i=1; AHgh+Rop4f+L8m2BI+dFN53w36m/47eaXbw6EMGUbLDI9G3px6coU9ANKUNZ3/gqADrGL+dyXvwHpX+vnmTp@vger.kernel.org
X-Gm-Message-State: AOJu0YznNMJDAAwQaVDfv9QKrNjz8ul0lLGCYkxIm19B0zD8qC4fej/y
	WcMO0G+jMYyF0WoanRX9jPH16aDmfIXIvZ80TkEeozVcmzXlaSCtEfrGGkCEBJJ/OC7VvrAzmea
	ii7dI/42FGCiI9RidscIzXUFjP2mU2iFTe4V0YZz37i+1JrbyHx5VuGl4jmccRp3A
X-Gm-Gg: AR+sD13aOzKaiJ421XI9kUI3mHCT7GFIBnbRoIwiol1hP/NvWaNBu29t+vtk6901Diz
	499TRveXUsrG9Kd2zefOfh6eVtF5DX/sODuOFFIwC6TXj5mqHd8PW/nUJHuyeF+FhZUrEeFmPhG
	r6ErDTnQI4jYhnCFCz8PItQBpHlwBuJEM8+8bxLMtNyRt8NDaEihIOT2buQYjMuKOQc2aRh04+A
	ONl+RWeT14vg3uw07vOkE6ELvo/IeelsrIaitGeOxIIZ+R34ifc5PN+5HtuFhlJknM9IF1p0X/r
	sEMbJQAP238fyuUXSVLeajEjpPEEY8vnEIoau6tH3MPrl9iXtIUTAyotrxUn2LAGrsksNES+nK1
	BeU06ujgIUFVLR34kLVTFLJnEgniFvF/2acIC2A/9mA/KXp9F8/dd1j6o4mdQBHFhqCuSGcZhvn
	fcyw4daIbhGyPmnA==
X-Received: by 2002:a05:622a:5819:b0:51c:9c2:99f4 with SMTP id d75a77b69052e-52b386b7fd7mr28993611cf.64.1785424858932;
        Thu, 30 Jul 2026 08:20:58 -0700 (PDT)
X-Received: by 2002:a05:622a:5819:b0:51c:9c2:99f4 with SMTP id d75a77b69052e-52b386b7fd7mr28993211cf.64.1785424858491;
        Thu, 30 Jul 2026 08:20:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db95aae1sm420927e87.37.2026.07.30.08.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:20:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:20:46 +0300
Subject: [PATCH v8 03/18] media: iris: drop IRIS_FMT_foo enumeration
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-iris-ar50lt-v8-3-6597c08cea6f@oss.qualcomm.com>
References: <20260730-iris-ar50lt-v8-0-6597c08cea6f@oss.qualcomm.com>
In-Reply-To: <20260730-iris-ar50lt-v8-0-6597c08cea6f@oss.qualcomm.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4515;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lqX7QdyskQ7RXFy2JV6oSvDBqKCfU2laEAg+qP6UhN4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa2vQOY48nlzLfNabwprEwU4qZ0ODku9vm7CKl
 WJ29F3V0sCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamtr0AAKCRCLPIo+Aiko
 1Q5jB/4uYHjlZmcJZFCZrauzSvUMSyeutqXHnj4VkGSU4q1cHwR9g1PvcXWXctLfNDbu/KZbtZS
 L1mmip5Yh47z8DP6ZJEddTrE4NEKZCpnvfmbZfEk5e0KM/jgonETiasQPAtqzKLBl9sVR2DCj+y
 Unu6gj20TbUUUw3N/EqCCfAz7ZlgOEFyN3N6I7TafNMB+E5EPUgprMMm9F1NdPCpvsFlekWSWjL
 NsW3rMpHCoK6MlDIZ2AEvnia3xFJ1ETkNvTqnCIdQbIZM5HrseDZY0mxxuMReARL5MuVWAqJrK4
 o9cthHlNwe/C5/R+RGrNIfZCfl+CHogP12kPSdFc2j1mK0ei
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Ar/eGu9P c=1 sm=1 tr=0 ts=6a6b6bdb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=Azqn4rg6zLMgtGihcfEA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: -kkGwYwYpc2qTCzuXmCH6fQX2AsNfF5s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExNiBTYWx0ZWRfX0DCAnIbpQ/mS
 y7FRETDN5epW1YyQqKehzZ2Coayo3n+YowgyRKGM+Vee2klLuE4FnA2U0cmfGIS52H4rRloNyuw
 zO+MrtX1hJhZGTvh+yajov900xZzPvkqpriTZ3p5sbY/5vX2sRF9IJuxOXLsclNt5+myo8hag/Z
 IzPPnSjCosLtkKpdFDcU641umijautU71nWaUUOaE5RKeXUFd4cmR04jJ14Kvjjy6Pj1CecjwBj
 4v0plX7tfAt6v0Ra94srY+3vCfhU54f8OblvHUtiPvROecWrohWCyMFMy50fjyWE1oDnYl6f7dX
 6bSLcUBzIglx8k+OW6GV7nvL9q57XRiYNQ4kTuI9vbsCXslL3OW7FLAcvP0h1OpZDrhnoWxDSqE
 4Dg2WWhkUnnGqivstRfRMy8XHtZDMEqeqaukaQcZETRs8p3iha0p0zJicl3z5E5y0ZDJi2B6xYO
 7kfSumIR6fztqZrMBZw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExNiBTYWx0ZWRfXzvGN2Zpksy1u
 E2S9RvpwV9gUeUpQELKew8DG1H8T9DWbdarf0UISTWydSUHyE2ppOnteQQNcbZA0pKd5nsh3v/D
 BNbvSqZ+JDmAuf7jHky3Uymy6XNSjHs=
X-Proofpoint-ORIG-GUID: -kkGwYwYpc2qTCzuXmCH6fQX2AsNfF5s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300116

The IRIS_FMT_foo defines are only used for indexing values in the format
enumeration arrays. However this kind of enumeration doesn't follow the
V4L2 logic (which expects an array with consequtive indexing rather
than a sparse array) and complicates adding support for platforms which
support different sets of formats. Drop this enumeration and use flat
lists of supported formats.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_instance.h       | 14 --------------
 drivers/media/platform/qcom/iris/iris_platform_vpu2.c  |  6 +++---
 drivers/media/platform/qcom/iris/iris_platform_vpu3x.c |  8 ++++----
 drivers/media/platform/qcom/iris/iris_vdec.c           |  8 ++++----
 drivers/media/platform/qcom/iris/iris_venc.c           |  8 ++++----
 5 files changed, 15 insertions(+), 29 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index a770331d1675..ffdbbd20901a 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -17,20 +17,6 @@
 
 struct iris_hfi_session_ops;
 
-enum iris_fmt_type_out {
-	IRIS_FMT_H264,
-	IRIS_FMT_HEVC,
-	IRIS_FMT_VP9,
-	IRIS_FMT_AV1,
-};
-
-enum iris_fmt_type_cap {
-	IRIS_FMT_NV12,
-	IRIS_FMT_QC08C,
-	IRIS_FMT_TP10,
-	IRIS_FMT_QC10C,
-};
-
 /**
  * struct iris_inst - holds per video instance parameters
  *
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index 961dce2e6aa9..ba91672df1bb 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -35,9 +35,9 @@ static const struct iris_firmware_desc iris_vpu20_p4_gen1_desc = {
 };
 
 static const u32 iris_fmts_vpu2_dec[] = {
-	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
-	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
-	[IRIS_FMT_VP9] = V4L2_PIX_FMT_VP9,
+	V4L2_PIX_FMT_H264,
+	V4L2_PIX_FMT_HEVC,
+	V4L2_PIX_FMT_VP9,
 };
 
 static struct platform_inst_caps platform_inst_cap_vpu2 = {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 74626b35d9cb..7098b652c117 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -49,10 +49,10 @@ static const struct iris_firmware_desc iris_vpu35_p4_gen2_desc = {
 };
 
 static const u32 iris_fmts_vpu3x_dec[] = {
-	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
-	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
-	[IRIS_FMT_VP9] = V4L2_PIX_FMT_VP9,
-	[IRIS_FMT_AV1] = V4L2_PIX_FMT_AV1,
+	V4L2_PIX_FMT_H264,
+	V4L2_PIX_FMT_HEVC,
+	V4L2_PIX_FMT_VP9,
+	V4L2_PIX_FMT_AV1,
 };
 
 static const struct icc_info iris_icc_info_vpu3x[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 9e228b70420e..4c8bc7aac135 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -63,10 +63,10 @@ int iris_vdec_inst_init(struct iris_inst *inst)
 }
 
 static const u32 iris_vdec_formats_cap[] = {
-	[IRIS_FMT_NV12] = V4L2_PIX_FMT_NV12,
-	[IRIS_FMT_QC08C] = V4L2_PIX_FMT_QC08C,
-	[IRIS_FMT_TP10] =  V4L2_PIX_FMT_P010,
-	[IRIS_FMT_QC10C] =  V4L2_PIX_FMT_QC10C,
+	V4L2_PIX_FMT_NV12,
+	V4L2_PIX_FMT_QC08C,
+	V4L2_PIX_FMT_P010,
+	V4L2_PIX_FMT_QC10C,
 };
 
 static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index a945992f63aa..16c52ad07e2c 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -80,13 +80,13 @@ int iris_venc_inst_init(struct iris_inst *inst)
 }
 
 static const u32 iris_venc_formats_cap[] = {
-	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
-	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
+	V4L2_PIX_FMT_H264,
+	V4L2_PIX_FMT_HEVC,
 };
 
 static const u32 iris_venc_formats_out[] = {
-	[IRIS_FMT_NV12] = V4L2_PIX_FMT_NV12,
-	[IRIS_FMT_QC08C] = V4L2_PIX_FMT_QC08C,
+	V4L2_PIX_FMT_NV12,
+	V4L2_PIX_FMT_QC08C,
 };
 
 static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)

-- 
2.47.3

