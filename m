Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C809536D50D
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 07:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785569908; cv=none; b=EbF2MGCgOWGi7A0Enlkug9wpKw2KzHImySNGEvjEu/aV6JZgxCRlr/+AA/qXiSQDBFH7PRGEcKEYbEPUhU1bqR6f+wXo7gx3YAPNForPGF3ip+YEiAvxt2m0p6O4ddZzqYcF6YZT+E50nv9qZbS0N3ce/I659Ka40tnnuDFNRZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785569908; c=relaxed/simple;
	bh=qBcqygLGzctnWl0Ad9kRqj0ar7uVk/8H2PNp87JucGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AYlWKgxYSP/L4WAvDi4H9bOc++kCIlQNzsCnJkU5TyXWzSbGIRXvvSVgaNRAUJXY+UxgyX6CUYraUgUJiBOFwd16F1C4eZyB7qP3HDObj5rYAA2xt5HU2mteRYzje/jVfpeaN6tRVHcFRJKWyBdb+GlbAvR7pNPyJifZc3CPEO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q86wiqAh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M/CapaV0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q86wiqAh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M/CapaV0"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6713DhT82065736
	for <devicetree@vger.kernel.org>; Sat, 1 Aug 2026 07:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6Mp+nfA3N+p1lXQzMxJCbO+jynV1YH3G+4IyAbOESn8=; b=Q86wiqAhA9bJ5lgC
	OfOArRrU92p2EdlV32XF/6o4sL/Cm8scNPeDkz+TrWBt1xdMeH/BlcAqlewFfGEE
	GUaf0iU3u9CMYNjJ49VdbncUSEko2pbwkWoA/ScsURPZoxRwpZ2qM+0D+/z9w8/j
	Z+0IpchwAEgyeHgDe65xVt4XwaEJMf40WGX6mE9Vsd2Vnh9W6LW0FK1RNPOgauuU
	1pOigAOtyE2vwc3YmDk+wgsdwjjz1iACDl+SZcJd6CVBcmtUnyikH4mfWK4UXo27
	r4c8QRn6MwJMxlMA6zz1ZyOqee8Gq52zN0W+EUH+1/cBv/VQWjlVtzVVm5PmsmZY
	GBnIfQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8q50g53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 07:38:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so1940796a91.1
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 00:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785569905; x=1786174705; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Mp+nfA3N+p1lXQzMxJCbO+jynV1YH3G+4IyAbOESn8=;
        b=M/CapaV0FGtDxQItITP7nONrdCaJLfwF3HHFLuNYxMMgPGl3Sp5M9F7KmKq8o/ci5B
         SOM/9Op6DxtbfdvNkG2O7jcEp6ipzzfrX5hWHrDE9qny/2ASl8wJ8mqRoYjUBBFyTVeJ
         MS48BmIuZT18BXxVCU2/9y47vEfTg3RQTZnp0iwYS91qIhPOTIvEzHW/cx59o83FI+mM
         bSwRq4k/vXbECbnqDzxBui91mamdMOEx/5qf0FQyfiiziWT9jT+tIOD2xzUb/ppUnu6v
         /79twFNxtLm/pGw4l5WgSM3QzvZj1mf8EyfEditEk0WI2lfbND1XU+vEtBKmI9z7IIeA
         zkbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785569905; x=1786174705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Mp+nfA3N+p1lXQzMxJCbO+jynV1YH3G+4IyAbOESn8=;
        b=Zlir9hzUPPfOAhXlj+yfaA8na7suGdDxETrsuZa3kFtg3N0nO1Cmuf8Y9zcuXgsoEA
         jlnvRla5PGRwgAgD7NpnxB+cvYUwNNNa/+0fB5rm9yZniiHb5UUB66DjDHrft20TD2xL
         3HEedIojjYzzSEz2H2xdXxM67ZoUGKqgJRy7KQkXqRRL7lr3OJmhxR7DX+LSOfl2/5jf
         gPgXWEJ+ZHNIi2ABjMZRK3KR9Q51lo96WFTclnzzc0e+Qu/5niMwhhGD/3ZW3MX4RFAc
         y7hfEPO1y7IkA3hDz3GZSjRsr17E+bjFwDdrP8CiOY+rd4YCV04sBPnFeJEvNm/QHTyP
         YjyA==
X-Forwarded-Encrypted: i=1; AHgh+RqU0nqq+Cv7bIQSkYwlywTY7SaMGYgpzQi/FGqfQWLe16ZG8K+xmTI0Y7sD9NPvCy9XD71WNS7qBtcb@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/Ky7eaF+Xycyiy3II+LXXt/FyGbWiRdPUBOcIVSLcYoFscHIV
	fdN8BKnz1Nn+IxxNAopNwkfh3ymjldNtvnwhl2F0zU/dzhKvWk0rVBWmlcSSb3ymUdQ6MYzdOZn
	OqPY4iXirQy0UmnkYlLX1w+mVuDH1KAvlL9MW0XHKpyWCTatD33yiY05IIQ0Ahsdsj0iLnGML
X-Gm-Gg: AR+sD11Sk4vduwp17PAaa+WZbJ4R0VyjMZHWOLdw95iRMyIK1NEoCDD7nVHkqGQxfqx
	c6753sWzbjoUiSq6OLaZ4MXMKynOEsahJrquEPhPwUJdaXFSRh0T0158LVRk4KSHPoUVwmz9gQ/
	8trVsx+UONSU2kGbCtfjgZR461rO6Ia/BUhq/gfcZLW4WW/fasoLvKSHe6+/XFmrV7yGwGqQt/s
	DUnmy8OcZuh/OnipHD0uZ2tOipJEcSgTCe5ikD98QSTwi0TySxYZnN0Z2TPIRPf6cmE0JpxkqO5
	9lgmOHA5NPXuNwvaXdP3aT5UegR0PG/u4Bs1KJ7QRVciddC+7sy47vut6E39Sq/qt6bY/oQR7l6
	wNaUH6AbzL0UkcQp+6UImzUQjYZ93aWxWqg==
X-Received: by 2002:a17:90b:4b12:b0:38f:57f3:4dc7 with SMTP id 98e67ed59e1d1-38fbc4c66c4mr2472928a91.26.1785569904665;
        Sat, 01 Aug 2026 00:38:24 -0700 (PDT)
X-Received: by 2002:a17:90b:4b12:b0:38f:57f3:4dc7 with SMTP id 98e67ed59e1d1-38fbc4c66c4mr2472903a91.26.1785569904117;
        Sat, 01 Aug 2026 00:38:24 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e045016sm20729985eec.19.2026.08.01.00.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 00:38:23 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 13:07:30 +0530
Subject: [PATCH 4/4] media: iris: Fix frame interval enumeration for
 non-divisor framerates
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-iris-fixes-dma-pseq-fint-v1-4-aba0cb22f6ab@oss.qualcomm.com>
References: <20260801-iris-fixes-dma-pseq-fint-v1-0-aba0cb22f6ab@oss.qualcomm.com>
In-Reply-To: <20260801-iris-fixes-dma-pseq-fint-v1-0-aba0cb22f6ab@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785569872; l=2222;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=qBcqygLGzctnWl0Ad9kRqj0ar7uVk/8H2PNp87JucGI=;
 b=Zb792k/Ttm9QCTPbV0RFTp6LNEeiguSLfulNYbjzUaoDXYPfSPyu/FE/rWHuOS0q2tZe/Ya6Z
 4QbnxgnmjttDbmKXo+Ky6fdgKaEt/djIbmE/8LIlw/UkVeCP8Msgts0
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDA1MyBTYWx0ZWRfX2AhiTdL39jr7
 OTS7HAOt6YwtTOeq+Hk+yE7zr3zFA0rXJl4z/+ihIAhQs7F4WKEJA00W0N23Yoay24dFmeRzJQm
 UdFLT/PZdssABNQgKGkZvJ6d/IHOGsY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDA1MyBTYWx0ZWRfX0QRU2M+0y2ss
 qdaBKFXRLROiS53mmT6w01+hC5MTNsZr/nI1gl+w8nONpzI+M03HXmcIFFr6l/B2LF1CkC75Yj0
 jS3Ab7ShCalMXbgZTRB8eznEA35OJtr5mkclSrhrg7SlPyDmNdqZEl/QlKGoQziQm6cEW9+8cjG
 mgBeCbVs1s4peq6xo43SmwUQXvyqqcEuUgLJx+cgDxejuNiFWlOBgJEWte8NAlGzrAU4bXDzgGp
 VvYZpL5wLLONh0obN2ePi7/kRQp6LXzLTwXafyXRRXgcYXpQF3iR9FEoxhLTd2AozVzoI+ql1K4
 +0L6QWzGmT45O4lV6H5HfFmzltHC8pfz4GtrHIxqmrcOv5AQoePaxJSYSEBOT2gf4QNZIcC6vSZ
 FUnk4xK9UJgJm4fPBedy3hsjQvtAfsPl6Co89F3wcnLovB1akxd7zXt3Q+fUiR3hsDcmZzCg+Dc
 BZDjVaT56yccCpaDveQ==
X-Proofpoint-GUID: HcyIJxkVzr7_KY4JOG7aUjqUik8WPwA4
X-Authority-Analysis: v=2.4 cv=IYC3n2qa c=1 sm=1 tr=0 ts=6a6da271 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SOCO_u0IuGyKYXpwI1gA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: HcyIJxkVzr7_KY4JOG7aUjqUik8WPwA4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010053

iris_enum_frameintervals() advertised frame intervals using
V4L2_FRMIVAL_TYPE_STEPWISE with step=1/MAXIMUM_FPS where MAXIMUM_FPS
is 480. This caused client to enumerate only framerates of the form
MAXIMUM_FPS/n (where n is a positive integer), restricting support to
exact divisors of MAXIMUM_FPS (e.g., 480, 240, 160, 120, 96, 80, 60,
30, 24, 1).

Framerates that are not exact divisors of MAXIMUM_FPS, such as 29 fps,
25 fps, were excluded from the enumerated list. There is no hardware
restriction to framerates that are exact divisors of MAXIMUM_FPS. This
caused GStreamer caps negotiation to fail with an "internal data
stream error" when encoding content at such framerates.

Fix this by using V4L2_FRMIVAL_TYPE_CONTINUOUS. With CONTINUOUS type,
GStreamer creates a continuous framerate range [1, max_fps], allowing
any integer framerate within the range to pass caps negotiation. The
step field is set to 1/1 as required by the V4L2 specification for
continuous frame intervals.

Fixes: a6882431a138 ("media: iris: Add support for ENUM_FRAMESIZES/FRAMEINTERVALS for encoder")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vidc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index fcbc60016bee..8f20cb281a93 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -438,14 +438,14 @@ static int iris_enum_frameintervals(struct file *filp, void *fh,
 	mbpf = NUM_MBS_PER_FRAME(fival->height, fival->width);
 	fps = DIV_ROUND_UP(core->iris_platform_data->max_core_mbps, mbpf);
 
-	fival->type = V4L2_FRMIVAL_TYPE_STEPWISE;
+	fival->type = V4L2_FRMIVAL_TYPE_CONTINUOUS;
 	fival->stepwise.min.numerator = 1;
 	fival->stepwise.min.denominator =
 			min_t(u32, fps, MAXIMUM_FPS);
 	fival->stepwise.max.numerator = 1;
 	fival->stepwise.max.denominator = 1;
 	fival->stepwise.step.numerator = 1;
-	fival->stepwise.step.denominator = MAXIMUM_FPS;
+	fival->stepwise.step.denominator = 1;
 
 	return 0;
 }

-- 
2.34.1

