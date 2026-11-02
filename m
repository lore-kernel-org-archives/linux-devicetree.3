Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616150;
	b=kBCIddd882KgbMl5+WiRVqIGiDkdJTRurtGaW2MPqFicNRj6OiMNTOC61AGXUqIjN4QV
	 BKA19S7rjMeqVZsHdZerKtkLk8AeBHM+zHzTUpRzu74HGFBxOtReyDdoYg2aKakJWmWwI
	 Gt3ocDOKtL8Mw6vejaHORR/ea8WUdhlEbsUdjY31pld9xJ12sc9i68qdxyBVGm0FYeXe2
	 dklmQ5ZgeAXoc8B7ePudCgocAY66tmUg4RJad1wcqpOFFRf87lWmGaUH1tVEcUGaFZWHN
	 GjvZ//7AgVyo4xPCp22x0grlrSXLgbahSqvJMnGtzaMD02TFJuIWdOz2YtUXJlY8Cww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616150;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Um07vBM3gsqnJtvymP7VQb4GOHOjEPUnXIoHN/ARP/c=;
	b=0TdM4lnVw6TMp6ZZ9Y0pZJ7MierOXceziTwbmc1Kh2QDgmJZaxGRyzK4LJx77/ROPxIx
	 iSY7/BWqs6GxRYv7tfjLw8bamvWXfRSYuwbL7zitOnOY0rPofwdQC48vMDzxY8npKZBXy
	 qo0/J4XuGQ2Sub+i5eC7XbD/X2HRgzw7N/O3bllwZMwdeCILbDO2QnIrhrXmPH7hfM53e
	 O9wcyHXr1X87AqayvmmcYFC/LFCIZRGep4G8UGVWM4vgjnqgmvrrO2DYIT37Pad52BiTz
	 lwTXS6UmSSdJWiA2XLogtd/dfIvq2coyDUrdWH0HuzrPC9i2al1kGAkPTe2LyY2Dzxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jGc2JBXc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KFGNo4B+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD8660A3807
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 10:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABD8660A3807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jGc2JBXc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KFGNo4B+
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AHUR2880728
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 10:42:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Um07vBM3gsqnJtvymP7VQb4GOHOjEPUnXIoHN/ARP/c=; b=jGc2JBXcHRzAaY2j
	M2zTSW1A8OQVIx7MOuSKUVYMzqUJfLubyC6g8QYIJ/sh3rfWfu8OU/MDQe0kIBrm
	2racFMZj/gcYDUov75XYNb9VLNfyYg/J7ESr3Lwk4eVQanGlnDCfhMrUalFP0ago
	sfGaKtvOmBHyE4NuYld4uzPkh6vHfL9sVIg+ns7HQbnV9DvjVgu2eTrzyB3UnpKf
	Qi0mnyiatnym4t2/yuxzMUHQjU3P3KyngNiOqxlMwKgFVsk8L4XzAKqaTmOvR2QR
	X0x5mOhKmPYxeRjN7ZbjhqNdWY18S0Zej3A4L6+xaVdYnCFRkhQ8a33vvkv/NARZ
	DY2Q7A==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrgdv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 10:42:28 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-85d630e451aso1045331a34.2
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 02:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616148; x=1794220948; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Um07vBM3gsqnJtvymP7VQb4GOHOjEPUnXIoHN/ARP/c=;
        b=KFGNo4B+DP4btSo7/2YReGJhFsHk073linvZ/GqiY41NhZpJCDt71j7KEiBhd8BTWW
         xK0E88ndYiCW1zN3t30sp5Os+qBPve771yJrvKVHyaRZG+0bb6sfe/xTGqei9pFrCsR6
         MAOy4qXZjyS/NZIX217vKNB/+vIHjINn5BAhoPXo6eu+GstpPGvZusZP1rm/RlAbH76F
         3nZ0EAVYBxO5TZFRaBx4d9Ffizac2lhlhrDY0djZnFgRkQaUUuSYKY9Ha/+oY9CaOvhs
         CTViqXZpRDR+ah0J/2jpCFUhL8QOUONz84oNu/NZqbAsRDlyV2jHlD+hF8A72y1MeOgf
         Pijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616148; x=1794220948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Um07vBM3gsqnJtvymP7VQb4GOHOjEPUnXIoHN/ARP/c=;
        b=k4KGEo3lNZ0R3/6laisSWKF6Q8+92Ll0CWtHBqvzTdtH4AcAnrMbNrRPWptMLN+82M
         44aO0eFk1IebxC1htN/NxQxlS6+GRu2TRaXe2W7JpbJXE73L/LaTEPNsp70V8T0uZqC+
         kEyNmMEpYoHrMcP4m/bKWCdBj4oyNQ9N6zHKQQcQWEo8PZrdr+vm5kVV2ARDWxRqgl2T
         ve6w1Ext6B99cDTCyXHJ+egol8NGAkS2dIEIWQUi1aE4IAYgCAvw7fhXE58X+mv5XoSW
         JRMQYNmj4BJtYuyGgLxTINLn2UIi/6LYAZn4cTeQhJ3Iy+xSO7i9QL+r/y1cotEGUc54
         D78Q==
X-Forwarded-Encrypted: i=1; AKwUvByp7K9Mk9TcWutjiACRgMQLkE5MnXS7d6N3DB+PYovSAW4AFqKmWFkHNQYO88kfLRkwcmWgq5+8Ri/m@vger.kernel.org
X-Gm-Message-State: AFq9FYJl9PU5GC3NXyD6JkQpIsMqMfylCv0jISLLEvewVkjkWzjaHshC
	OJVBxgG1OnLemYoYL8VYlkgmSOy8LNRdiJdLrueUoXswKMX83JNxmtRKkMK3sDpAl86ZLXBF0Tj
	4jCNZ24eSw2tIZV8+3yznrhv29EzrS2ukZWMaKUjsddF/ZH0vaidXkUzFqShJ9WKW
X-Gm-Gg: AYBFou3pZdO2pLEuFAtO1imE+1sp/0q9H9G52oF4C1vZ4+k/BmorLr6ycqlkZy7gBVi
	3mBuIF5XBRL/Ad05E8xZHHSACjRmhQAbOyk2deUskxVVTjI7fPSA2dx9f24Zrp04JoYWJiSSuKy
	fW8YsSSCkl9xKR2ibTPzgndcbejummDKQSY3yJhsebfIaE5k8vhT1kzTJtFhdd9wjNt95qOfAlF
	p/y4I0wxLEOt/Zep4A1jOFluzTRXTJr2m2ZXqJ8icx143Nr/y1iDhEfMHrBVFvi7/9SPZMEubEQ
	pg9vjJAhS6JUfxwcZjmPhgciyjX/KZpEIaG/Uw6Q0EhVMq18ixSZ5ZMRZycfSmPVnGhgyOiYyNZ
	BfFeEzvlm0s69JcO2qpuQNxiu1es647CahzcJPL9UJlDkSuCCGL7jfiw6rLfwQlW3kdfXa9U7Rc
	ijAPvS/sCKeI4dtJKyVSbX51iKhkc3Sumft0fBN9XJkduYZHsKh+R9qtwQEJU=
X-Received: by 2002:a05:6808:4e0b:b0:564:3fe1:2f95 with SMTP id 5614622812f47-5643fe14f4amr2068868b6e.56.1793616147947;
        Mon, 02 Nov 2026 02:42:27 -0800 (PST)
X-Received: by 2002:a05:6808:4e0b:b0:564:3fe1:2f95 with SMTP id 5614622812f47-5643fe14f4amr2068846b6e.56.1793616147534;
        Mon, 02 Nov 2026 02:42:27 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe0fc77sm7447171b6e.12.2026.11.02.02.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:42:27 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 02:42:14 -0800
Subject: [PATCH v24 06/15] media: qcom: camss: Add Kaanapali compatible
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-kaanapali-camss-v24-6-d6b8f3f6f66f@oss.qualcomm.com>
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
In-Reply-To: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae86914 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 5qfX5k5iNt8d95dEwiX0m7zlMB95PLFZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX+gQN9eZK/0Qg
 Sm5NSigYdYDeCGnrEotVOJW7eyzq/521Akg7Ho0OD2Y4mKjnh7DcGqC8zgpc1wP7N128iEcuOLe
 nAGnX0x/QHhZjwXVR+WxOPzRKwNY+4g=
X-Proofpoint-ORIG-GUID: 5qfX5k5iNt8d95dEwiX0m7zlMB95PLFZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfXzC/epE6GS7Eg
 hSwayNswXhQz/v4Q4Kk5LOAAasFFXynyLShVhUh8G3qKCdeSdwmgVXO9XW84EIbVt3su6fZBO63
 SwI+1u9eBAglO9t6P1pbHiCrFgCsxjGW+T2irqtqik1OSpodkQRL0TYVOrE+unvn+FesfT1SejO
 lHRikfhjIBnFFwjfoxGmjfhvWiiLIaPlJPu0qPpcqNAuVv3K5auoyQWoDIIuAf5An2rbLEu2viJ
 vnqTDz9BeORK13VD/o0C/a1SlyE3a3tUm2IMRXnLe6C0rBQUpAIqRVUjIAYQe7szZHzY0JN3Bqn
 cQlhzmO4ZCKePtapNJbNCMbv3UiuPY1BB78JnLQJmE84StJyCJbs1hAGG3OKdBUaSnTjq5rYKnO
 xaOZno9JJzZZPolzQifliQ5uDvyD1IAB5l8LV4kynGGoRpM62diL8mP9VBfjPx4MyCeiSiJ9u+y
 L7+Z5LIqwnZvzcqZa8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020042

Add CAMSS_KAANAPALI enum, Kaanapali compatible and Kaanapali CAMSS driver
private data. The private data includes the ICC paths and TPG resources
and sets the CSIPHY count. CSIPHY resources are not listed because the
PHY is probed standalone. CSID and VFE resources are added by later
changes.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 25 +++++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 26 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index be58a39f4a8b..385be682e8b9 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -38,6 +38,20 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct resources_icc icc_res_kaanapali[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 471860,
+		.icc_bw_tbl.peak = 925857,
+	}
+};
+
 static const struct camss_subdev_resources csiphy_res_8x16[] = {
 	/* CSIPHY0 */
 	{
@@ -5589,6 +5603,16 @@ static void camss_remove(struct platform_device *pdev)
 	camss_genpd_cleanup(camss);
 }
 
+static const struct camss_resources kaanapali_resources = {
+	.version = CAMSS_KAANAPALI,
+	.pd_name = "top",
+	.icc_res = icc_res_kaanapali,
+	.tpg_res = tpg_res_8775p,
+	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+	.csiphy_num = 6,
+	.tpg_num = ARRAY_SIZE(tpg_res_8775p),
+};
+
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
 	.csiphy_res = csiphy_res_8x16,
@@ -5823,6 +5847,7 @@ static const struct camss_resources x1e80100_resources = {
 };
 
 static const struct of_device_id camss_dt_match[] = {
+	{ .compatible = "qcom,kaanapali-camss", .data = &kaanapali_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 431afeb381aa..97fec24e6804 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -96,6 +96,7 @@ enum camss_version {
 	CAMSS_8550,
 	CAMSS_8650,
 	CAMSS_8775P,
+	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,
 };
 

-- 
2.34.1

