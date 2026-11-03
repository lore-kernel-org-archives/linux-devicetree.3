Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736355;
	b=mNzAIs+tmEWF200CeoI+ODsbXn8h3Gzf9MUANXt8DngobKWPNqBtF0FsJQItB6ZGaIR0
	 GTrsIm7WvltC9PEmHsEEGxrmVVDqaR91dzp4/4KZnrNKk3tQLPCN6sFzB5Z7uWsOjXvlY
	 QnCHv5Fhipn/DFP3auM5rNpbQgTR+XxCE7mlkqbv/tQgHpOBMhgUiqALVsybj/xk+a4V4
	 +wwkaCH031RyikIojWgW0FqspNZ2TTHZJ7MT0Vp1dd4Q14mqLg3+dpeoNhxxuCtHpedpS
	 dyONkq75EvmWQelk/AIKhKSknrECTwbhq8BmewB4bH4/GHeN35pAA4GIYNU484wwIaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736355;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=TgR5F+iBiHqDbSrZbID4DhVkgUbDwbnclx1Ow0233B4=;
	b=2v/16HWnWWcTP/AWOjsJkVWoYYYf/P6U6/ohYgQyTfgz5q9k/fK/pu7h1mjhq/Uj+Mmq
	 CZtrQ8pI/5ZEupFCaYOyAnNUPtPQVruXQcww7ob6OObRINgv2FwDBd3cT9z6tv51Wm9H9
	 HsCfiWkOPT/hBJu3ymIrESONYb/r5EzmllmKTsbn5QehEMWK+DZFrA0/mrTN5HhdNNRO6
	 OMGvAh1Q9ch803ZUxCBnwT7uwjsdLRLUrbtPAm/0o8CStQkIx3befNX6WWp2Wipc2U6ty
	 i+y3VUp1j4s/2Xwa2JzMP+VfyuVyMzgFnBfFCi9BkgZPUs/Ib8NW/YUnvWTDjO9DrjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OrdkKGXM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="A8iYZke/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8F9606A33C
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 20:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF8F9606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OrdkKGXM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A8iYZke/
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3Ip5I53673073
	for <devicetree@vger.kernel.org>; Tue, 3 Nov 2026 20:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TgR5F+iBiHqDbSrZbID4DhVkgUbDwbnclx1Ow0233B4=; b=OrdkKGXMIYie7ZBw
	gX1jlhQeGe0W6e+SD2J+U938n/FIjb6t/MrnoJrjkj9ngAeb3GyWdxwYhUMijSz4
	c3MESy5kh9H1mf14YhEvsnc9EaKlIp1CnNSmOtUSa1tnBYWGFSqMV5ru+0SCfMyk
	wzcaZ+gwn4ZTlGBFp4Q1bLIHntDHo4XbHS8uKEWRIuvtNDR+IqmjNaUSm5I7U7OL
	TYg/LWQZ7thcXer47bFvIdxhgoVaeJgDwuP9+ryUvJJE1fkf5NfROFm+5+Ov/qaP
	hEgb0CNvqMcydckZ8VngxuvfEki4uNsQX7ujeWJ/FRwUK3mE5jG+4kWryOGCHAeW
	QfEXWw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8ng98e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 20:05:53 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc10da5ad4so1174183137.2
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 12:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793736353; x=1794341153; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TgR5F+iBiHqDbSrZbID4DhVkgUbDwbnclx1Ow0233B4=;
        b=A8iYZke/o8wtpJunv+zXr0VhcPeHQyuBbFbYkQwcpmlVicQx65rhK+ksKl8jrhCHc/
         70Sb0Wz7JCgpGTyAGauaFMNmAsHPcVxOtl2CbTEL18SNcCs7mxPZ+WOiRvuWzkyZGagB
         d5CEEdKlu/+Nn1YSPB8wD3Q2bGppdm7fSBUkNZ2EtqpJIz4z7fsOMvdhKHSbTWSUelDD
         BWNeUUcJVWO5OFI3ikqaSbSV/eB89elGVox13SWGI5GJ50HJXQQOaH/6QKKXYxWsilJK
         ogi6n3BpTax+g5xwRotoMus0iyTVO/SwYasf9Y+hP52EmgvpFLC1q3fRmkY/6pPS3G4E
         8g3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793736353; x=1794341153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TgR5F+iBiHqDbSrZbID4DhVkgUbDwbnclx1Ow0233B4=;
        b=SnhX0rxCpR39iabv+Gif9jbx6lmGGpC7EW32itOG7RG1mwopyYBTO6mv9MqEWmNFpp
         vwHhZhUCBxpXvXpIrAKORpfl/C/nmiQbftZwJepXwMGN4hExCsg4Nv2kGtTYwP5RLDyI
         B8dbwEug18z9OOuydfmQ5IVBHc6aOP1AcL/Yns6MnyiFUnXJaZWGHVsoUZNpYi4WdL8v
         dhTaWq5JaXQDYxnxEasqw1avGVbC54LErICwuqa9CDUys1AhnyXQQ/JNZOxL9rzEWvTG
         OMgDujJ33viqnI0os1/9whIHqvZuP5mCmgBrvcTYyXXLfuKcFwqqnXxRzJvZBmuil1vg
         Ndxg==
X-Forwarded-Encrypted: i=1; AKwUvBx3lyZ7UL5CRedAYtonXNJUFoQWkxSh480AqfL7xZwzixPJUI8X6zsyotgseh2f1bzPcykxExRFW3z2@vger.kernel.org
X-Gm-Message-State: APuU4Z+nJNwpWJAxxn9iPJHznRP1oPpjdtadO4LW+utcng/gAVfcx3Ky
	zlhc9VW6aDuggamjKFeW2sbqiuLuqXBIQHoqWf7jTjV02eVtv347L1zqKprYPC9vJPU0glDCC/+
	bgyu2U8KCoeErwh42b4O60YwtxjwkD4c3PqkDwTGm26x7IGjhDPELUA+ynk7aFGtd
X-Gm-Gg: AYBFou1bdWvjDWxWX8MDp78IuzSSc66DjUllRvsPGRGTICrpX9KmsEOJVDAcShysMIc
	EfOlT3tcN75rZM1WmpfMwgUgfA9gX2nm/nOe7u1CiazreRWWdRpq79h+n5grQdPAYjv5O3tNBOc
	RoBMO/PwnDNOUYLFp/s32jQLdH4hJ6DWBG8E9V/Pzu45StaxXi4Z/5RSJ5lLIcIn5CoKZ1w4T32
	Hk1/Pe3uBNsxWXb9k1Q3GQI419DyYJNiGc8KvySoaxsVInQII0IS63yehlI8dqq1BX6c3a5KxJA
	O7Qq0YxMl3zRVB9awQgekGfAHoVjzau5vxjPx7LyKjMTKzif+DdUc4HStL5FgNSPNM/XclMYE8s
	ECx9mdznUytkwfQsNKy9Xb+jFh+0cBWFJdv1I4w7NDb0B2PZd5eyyVs+Om9rO2NclF4Zm+i5o1o
	o80PIsuCZOSk5aie0BL1H1k+wwnhvhxQ8VTGI+dHcTKlcdHR754+xAz7xhY29R+KsfCWBAjifnT
	ngivuD0xH4t40NEKijXcstUZFpo
X-Received: by 2002:a05:6102:5811:b0:7c3:9a36:bbda with SMTP id ada2fe7eead31-7d0727ad784mr5651410137.5.1793736352860;
        Tue, 03 Nov 2026 12:05:52 -0800 (PST)
X-Received: by 2002:a05:6102:5811:b0:7c3:9a36:bbda with SMTP id ada2fe7eead31-7d0727ad784mr5651401137.5.1793736352383;
        Tue, 03 Nov 2026 12:05:52 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fcd03d01dsm358875f8f.44.2026.11.03.12.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:05:51 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:05:45 +0100
Subject: [PATCH v13 1/9] media: qcom: camss: Add V4L2 meta format for CAMSS
 ISP parameters
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
Message-Id: <20261103-camss-isp-ope-v13-1-c2cbf15a39b1@oss.qualcomm.com>
References: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
In-Reply-To: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfX+2NvtNIpHxR+
 Vq72Ao/ZImxoNytCZXIgONJXoYEkb1EmiGLH2N2W7a0DTUhHaU9EizzEoJYqDoaOUTYRxMCpQLu
 fsIBx3WVD1coib2crGIbZGfjyiGvijXp05x+f5UqOG2OA8CqsceDgSCfrHwDISJ0Zeee6BTuquG
 s3QOaW+8ASlBRdjRRFjT7kid05KagqJus5y4KsgdmwKmUNC/bViQ/3gJMUmUyTqppE9cOMPPw+T
 2nrE9JAy9CmY8fGxg9YaKzetMlJHrryP8UY4EPD7Tv9wwcuE/zDCM0UXDgiCnkrxXNvhuAZF2Ji
 TrZRr1g2aHD6ITdHoUXJ2MWgE9MbX5978Zqx72tgzOWDzTKnfJYPbwBnhp20yz/ZOwXKnCU1fbr
 ht3Xl27DcGpaEwKTs9ulsH8bExgB9gIoiA5NV5W6T6LLb/RFT565fAtykKh4VbytiWVvMLeR09b
 nvIi0NPSTIDSbJhI+fA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfX8V/wCq+Lh8Jk
 0IJI+egOG7dCEjK6VvCjp0G5pKHO8CjZcdM9PRASyX01CGqbkza7F7lLzXqqF/Gy4h/Vx4qBnbe
 X0IS7hdmF60AsMXq5qVqHVK7mBgEU9k=
X-Proofpoint-GUID: T_a79HcGGNhYiwH3nbdUi_a4pXNAn_s9
X-Proofpoint-ORIG-GUID: T_a79HcGGNhYiwH3nbdUi_a4pXNAn_s9
X-Authority-Analysis: v=2.4 cv=As17T+9P c=1 sm=1 tr=0 ts=6aea3ea1 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=mDm0RygAtmZY0osY0NEA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030080

Add a V4L2 meta format code (V4L2_META_FMT_QCOM_ISP_PARAMS) for the
Qualcomm CAMSS ISP parameter buffer. This format is used by the params
video node exposed by CAMSS offline ISP drivers (e.g. OPE) to carry
ISP tuning data such as white balance, color correction and chroma
enhancement settings.

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
 include/uapi/linux/videodev2.h       | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 17ba1ae707355a134047de646f61fcc2d1512d4c..cef1593c1835070f7b34a8b8c860738fb77f533a 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1471,6 +1471,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
 	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
 	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
+	case V4L2_META_FMT_QCOM_ISP_PARAMS:	descr = "Qualcomm CAMSS ISP Parameters"; break;
 	case V4L2_META_FMT_RPPX1_PARAMS:	descr = "Dreamchip RPP-X1 ISP Parameters"; break;
 	case V4L2_META_FMT_RPPX1_STATS:	descr = "Dreamchip RPP-X1 ISP Statistics"; break;
 	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 5373dba640fae3d19247ab1c74ba336e05dc0fe0..70208a9443d8ade569f130e2fc3d6beebab6b636 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -893,6 +893,9 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RPPX1_PARAMS	v4l2_fourcc('D', 'R', '1', 'P') /* Dreamchip RPP-X1 Parameters */
 #define V4L2_META_FMT_RPPX1_STATS	v4l2_fourcc('D', 'R', '1', 'S') /* Dreamchip RPP-X1 Statistics */
 
+/* Vendor specific - used for Qualcomm CAMSS ISP */
+#define V4L2_META_FMT_QCOM_ISP_PARAMS	v4l2_fourcc('Q', 'C', 'I', 'P') /* Qualcomm CAMSS ISP Parameters */
+
 #ifdef __KERNEL__
 /*
  * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when

-- 
2.34.1

