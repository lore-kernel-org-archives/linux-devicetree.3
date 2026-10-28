Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200880;
	b=CtfmEOvmP528QlQkNJrn+0y43pG9PZGk38M4ynmgWm5aZjve6t8f+6yCD2KqmMXGn33c
	 pdYDY2auURd6c7uQHYmQj1RYll2ZNWk6P0/2qvvFbatAZVtN1wPzV9JsTAO5Pfj0IZnAQ
	 vFGco1Ma2LPu2ytgtqxl/f4b78Xq2cdn5xKpOQVy2bLNK93DkU+u0ulb574zpegwy0tK5
	 lilYU59tT+pd13b9oQ4CNoc0AxJDAKyXLtYtIpLT+EuenWnOsQIdZx1B4pvjjwprCmiLv
	 5/E3B/sio4//8F/ZBJ1rzoIAjzoHSARY+Fd7W4VDpXfdAUYMj2J3k0sMriv6PpVvY6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200880;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mtyicMFphg8NIVF2KmS0oSGWOULir4B5NzOfXYC1xoQ=;
	b=vruqlc3XP8fMIPQ5/N1m24q4DxzXGCyAwGgEvwwQNZ2NdtEP2VsHAgCEDKIguUv8iS8n
	 ZLK0ZrllNIPVncoyqEh+vqhR6gD68RjLCHdLipzq2gfzlNJe3eMnICgns5OvRSZganjFg
	 9dij7BnMZXLGnSNgWQbkU/VeXI/1Xw6izB6qrVj8W/bQSzSKOBfBj1nJkVs+UcjjXWCvg
	 13l3CFrKr4hEAnoiLVaImTjLDyN10b8aacDoh4JQHNI3Omaiu4H4vs6kXIWsZS8MI/8nZ
	 3GmxpK/ji/x9jYwiLoVyeuXKUxlZaPbDAavNSd3TRHNxFeA2adDuShJofh3d6E5KtCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F+NFIjQd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O2U8h9Kz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26964606A326
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26964606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F+NFIjQd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O2U8h9Kz
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFB5Jd2070779
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mtyicMFphg8NIVF2KmS0oSGWOULir4B5NzOfXYC1xoQ=; b=F+NFIjQdS2yHtIq0
	XVAfqZLJkJbeyypfqPMoto3ULOCSYsonzYMFk1m7L6oggnOfJrOUO+VPx+Q45x2R
	gskrkkoQ/M3HYqIMW29inufC6KXCHsLz5SS9Uylp+NOcxoAKEujfpyZ+EBJxPRox
	glKj+vL6AcYOMWxplYAktVQHoHWWBPkT71PVgZNGt4w3o2UHmsb6Zxi/zlv3KYaX
	rfTaeUO14fiSwENsSIgvcpp2QbwXQ0DJWEskvLfJLc/kv9l8gPWUgVyDyWj60r/A
	qiytn6nF06/Cx3bWdTW01qYi7eSwYm5xs9CTC1fO4NWLtOV+NM1lpduM4EbQe0b2
	bxbaMQ==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk7g7jv99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:21:17 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-677c4ca2265so1846336d50.2
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 08:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793200877; x=1793805677; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mtyicMFphg8NIVF2KmS0oSGWOULir4B5NzOfXYC1xoQ=;
        b=O2U8h9KzwXl3Drgf1Z0ZkiTDS9BR8I7evYrvg5H+08SJsHOF2uw+tg8wp9nOEa4Fg6
         zZw3Kd1EZItTfjPveXpTPlf90ug4smYK1+0DqtYtaWHxvGHWRD9/53XJzDh0w7DmHJ3w
         wXfQ4sAEAEDBW4l/dGGsftk/Sp5ZJdiyBY0AiZnsXr7l3H8wzIOUHILEMUp+hMzfkfDw
         tXoJoe2fMaeZZ0OjQZj+G8vIyteP44r8C/Efqhe4X9wG9yLYHmskKaL1oRazVdweGg78
         kkCOGPbv268cDge8jzjtuRspHxyl2bPSESr87gA+/nXBvnItizDc5f3g1RaDwvDTyuQ6
         E6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200877; x=1793805677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mtyicMFphg8NIVF2KmS0oSGWOULir4B5NzOfXYC1xoQ=;
        b=0v6dKMW2y/brHwCicDK2YARiL2QvYYRuA1GwaJXrY4VEFWanig5JDNqWcl4qSezo64
         5ipCsSuPagnoT5mBWrGbWc0MIFvVG5e3iVaBi/uVDa6eWGGC7xUdfvpYy2ylw5gueIfV
         sHfsLbIV+97vtHhk8Y3vPTYG/c8dLcVG4WNddc0cbyNSl+2SG5LK44gryZFj7eGx2sGN
         dioGqWLRSV7mmBOKl6OA8O5/LOW4MLPONlJUgy8Sigi3bbwzusfnmLxMm49EIrEdpmBp
         4GEDaOIeRAvBmoNiqkMymtEZYgVDxFvW+QGNFCcflK1v8GFxrfQGeQlIovY9dj/MCXRp
         7kfw==
X-Forwarded-Encrypted: i=1; AKwUvBzfDYzDHYgLRX1zGeOBs+bGvG01C2p54u0NP937qWVBPDVdtSU6zautw+s21+yLSD5Ioi6D+2EVf46I@vger.kernel.org
X-Gm-Message-State: AFq9FYIVZEYeXXpbUo08M0rlOCoS1e4KTlCayvPXXqO10lw5OZdrApo1
	aUxd7zOluVOEyIB5pdD9c3bKGRB6c9nk58NauriDU7h0YJQkKX808fyOsOHyVZB6ZsTbr/5ryiF
	+WVjoV/RK/pxDDnaLHYyX39PbGSQO59B9yp4rN9wXLl7cccZoXvJm29E4baKYHiFm
X-Gm-Gg: AYBFou2hPerh2mXhmCVe20yrBIUT2+wOw4viKx5HONyXmCqXP+QWjsbxDtAfk9ljyO5
	79ULltFF7O45TWcW0RTdy083TIevVSyjxVfhb6xu/wiMIEf9qmfShoAJJDCAVFi/yAjgI8ZwFgi
	1R1cjwQZFDvR7AjZ5Bf9VsVFa0dfTf3eu3XrpToISpnPDbG445+KeZ5wXiqW4SNSfnU5fmkeVgT
	qFGVlRxdTnM00rBy3Ujcp8BgLMNXWuvyYKzYaSNDu8KRssfOxB0f0Zhbbf8Mv6lIMTvWcInL+4X
	h3tiyRgoGnp/FYDxxDJJi4170rVqMRP/UF7L9NX3s9EcljuWrMEJWmvYoin95pSFutBL53zgQP2
	YJ0fZ24qMRfHp7En4ZfbsioIZrnXMd2fD0oqRSIwythTovoh9xoj9xww9YV5VVT0l7i3Kc2XKRe
	1lbAQsKljA4uqkyzNzt9jUZHucPRmpGp2H+9saIrqOlNDKQp/E6mwGzBJLO6Qj
X-Received: by 2002:a05:690e:2061:b0:672:d32d:999 with SMTP id 956f58d0204a3-67a7b9b9f21mr1313088d50.14.1793200876537;
        Wed, 28 Oct 2026 08:21:16 -0700 (PDT)
X-Received: by 2002:a05:690e:2061:b0:672:d32d:999 with SMTP id 956f58d0204a3-67a7b9b9f21mr1313046d50.14.1793200875859;
        Wed, 28 Oct 2026 08:21:15 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a803cdd1asm1107541d50.4.2026.10.28.08.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:21:15 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 08:20:40 -0700
Subject: [PATCH v23 06/15] media: qcom: camss: Add Kaanapali compatible
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
Message-Id: <20261028-kaanapali-camss-v23-6-95f250b18612@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
In-Reply-To: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfXy4WZgiGibTTi
 +mwdACUZpPHq99gksqc0rqDew+E47oKKWzIHWcoV1wlmoZ8BbVbBLca+TdQmxUJUKolMOAeJBQw
 U8DdjbLnTsIBP9N3kjKPnCYVBcGrFps=
X-Authority-Analysis: v=2.4 cv=SoIFe/O0 c=1 sm=1 tr=0 ts=6ae212ed cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: jDlwxrJTxWdilpiqCsI2iFpUyuRJAMe-
X-Proofpoint-ORIG-GUID: jDlwxrJTxWdilpiqCsI2iFpUyuRJAMe-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX+QPH/kRyqp+h
 DCCTDM7oR+kYvPzFeiwsNttKHjMqza5w6TAOYAz/Eu5j0UHTf0xCmtPu6wsLYIRna24vFnyA65k
 X+qm4KR3CxSnYQkkMRK1z0MJIF1IuYodNsQYEuY9Kg+hZfdbh35pyKrnbW9DdC6mlJlJfOM9YB6
 PV/vgtCfdLg2xmWV9BXQ3BBjof5QTX/TVEKnwsBE9Bz7iOsR76Wxj1V2T3tDBEXpzj1o0Ivbvd6
 F6g30Yi/xem+ZEMomtJExEI/i61vxbvwsqkY3ybt8fLIfm8HpYPHE1eXMqrRYlztp9/3iPIPxwA
 iyRJDIFx1do9mKrzjXJ4rKhlq09c/6Iorqy5T8ZTVsU8hbFKXsl37cIldnD36QKea3ueOstKoS+
 GS/zbNxJvSSgzCRFGPl5Wq4+0yY2Rj/OtVsMVmfNF993DzT+Qu9kz9t/RzQLw/GsCM0ADRg30K2
 2SOCNNnT8MDeH4X9nkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

Add CAMSS_KAANAPALI enum, Kaanapali compatible and Kaanapali CAMSS driver
private data. The private data currently includes only basic information.
Later changes will add CSIPHY, TPG, CSID and VFE resources.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index be58a39f4a8b..98ec23c39fda 100644
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
@@ -5589,6 +5603,13 @@ static void camss_remove(struct platform_device *pdev)
 	camss_genpd_cleanup(camss);
 }
 
+static const struct camss_resources kaanapali_resources = {
+	.version = CAMSS_KAANAPALI,
+	.pd_name = "top",
+	.icc_res = icc_res_kaanapali,
+	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+};
+
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
 	.csiphy_res = csiphy_res_8x16,
@@ -5823,6 +5844,7 @@ static const struct camss_resources x1e80100_resources = {
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

