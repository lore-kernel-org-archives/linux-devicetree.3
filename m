Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF2A3BF673
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 12:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294014; cv=none; b=Kii3OHmFMU/a913lnjujf3zrVYsEN9uBxWfhv+AdiCD9dxXafZsJGtlG98984GgmyISGrKA6Lrp2gCL4/seih5X2kcyoFOjuBlV/JXJcd8SCf0wkJJhIl8zo8CSXUmGKmbCgnaUMDxLAnrtwTLy8VZZJLyWcu40iHoaszKwgMtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294014; c=relaxed/simple;
	bh=lPbPNpJ2ajYXcbSU6CUgF1cdOaknw2iS5g76PqOTMJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GDSQ/38T7hHHxeeBJmi9Vf4Ay5shJ79dD+3gSql23KM9QKp2sovzL8A6r/7U5sKDpdoszvEjDylHwalm9eCgSh6V9avnjnBDJdQQENsCzuZctazt2dzsyd2MkjFE7ampRF0w4fObFq+NLUo4np6CVxR8gy8QVKaCCCOK8rNB0sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kbDvfWxb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iqlwG8O7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kbDvfWxb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iqlwG8O7"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R9Oc4n3825222
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 12:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+rZxWV2BVzHNmwNyI4KXBWCRAzv77VAsdiAZYzEAZKc=; b=kbDvfWxbKpo8tYce
	l1OaVfKx2eJfaNCcN3nbhN2Lz1E/0sxlqzqE/RjKegt0WTh9cMYUFgojSREZ4iho
	2G7DoUdE2u87qIdqOfGsDgpSnjO/UeVqeaYIuYoPyPjmcNh269gdn+l1EVtu3ZgH
	+3qRqwo8MA8ftaSrORJj6BJ05Gmb+NUUib8F0+6TEmz3dlVjcszu1YOtB8EGELvs
	Dn9x5RQK9EM3RuD8CMbvwpS4ah+fXLPlfnifaFrHDDDHIDer/qS39P+6RjTWwLA9
	xMFRRJfGWaH9MZsyAroL7IndcN6/4lbKkLRlYs2SO3fbHmVd7LmyHKZPZcA5u1Jh
	BYXN4g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt5550r2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 12:46:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50da529ff48so39046631cf.3
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 05:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777294010; x=1777898810; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+rZxWV2BVzHNmwNyI4KXBWCRAzv77VAsdiAZYzEAZKc=;
        b=iqlwG8O75Zg7jCNRHXfk5Vqk7CUxc3cbbc7NSwUjEZ4ftprGERSPIwg82wPaYLTnlJ
         7UKNtS/ToV8pRjmmHd8d8ZklUizB5k5o/+kKc7BBnTC2sNu10y2nlcZSkSdhmQzVwYXF
         VEy020Y0HWNpUpFhaGxBchZcuHkZSppoKPNmCpYnV2fDnzsaxnEWNCAqeoVJYCFC3Pvm
         LEVh4U2TQ0LmyQkw6k1PwmsVD9WNZZKOoqoqjp4JiYjh+SMR6BOdz7YKELwExpKn9OgJ
         IQN/ymehbm/oEzd5nCv8Fow5Zo26lEnApjQKl4tD3crygFuaBMypmg/7mQF05uuNlR4P
         atFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777294010; x=1777898810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+rZxWV2BVzHNmwNyI4KXBWCRAzv77VAsdiAZYzEAZKc=;
        b=Hox4gZcRRknt01gJRPMiJMEvtGGC45DzWH39khnKYp0aTrQhWUAQl7aPqmUNuPFt0V
         771bQLXEv0qDeZDuRa4hCmYTD1wqAFko4COJSn0aeIvMHvi+YKcODccefgRFjUmfVNlm
         nKDoSjjMLAdQwX1xb6uqnIq6iRBZT5JR3VYeSt0kHlpiFsJ7PoOBX9LTgPp4fxvYL7Zh
         6HDg+5Os90xy3vUa4q0VpFs0iS/49b/MGUSAljKjn2luUpqJqM7ixG7A6PZNu1IqbGWF
         Bq9pPTf8oBCV9aGR0FEkhtGhNIm+gEGnY+QFfdYdtrEgaVKoQ8FdmRqqR0+d+5RPXRDZ
         Z/aw==
X-Forwarded-Encrypted: i=1; AFNElJ9NdPEkZF5SYHWUDN1yoChKhf4YLDS+zKY0PDdaaEP203Ctj/7w0Zw/Pm2NMSj+NJugVIZuwkZhFrN8@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2MncSvskFEpOcu/uZEAcNlQk4PY6Rhm7TAAu8e0N+iyDm4x7c
	+Dx2YdRnULxmeTfIYw8y8YjO9pfxTSvfKlfaSBsmymIMM2B/3u6/TqPnbZjHUVFA0rncl2/Az7l
	ft4/dpjWmQ9woydl5nM28G+0g5RLitpnaePiYVWKQgJu1irtWq68lqT194gPRJ5l1
X-Gm-Gg: AeBDievzkS+jagLwvj6BJEbnTCtMOqLSrp9ePFSyKxkjre8Y1I6Wy6C8S93cZCC8Zl8
	2BXtO06EYeUS9ucAp5z6L5X1CxnaxzK/ibuA5tLWlQ3vMEukL408hRwiKjF6UQ0iHXz2o//R87/
	5G5UVzHK8oXVTmpVoDtUUcgrQ82LVISgp/9EtsTKK820q2JWVDLgaSvfBk/cah1MKpR2cZTfSta
	phRTJa+4E6Je+QYW8KWwlHMf7QRB5oVb137VrM14QMlMgeeS7hskCJkJN4CUCUz3eEmc8SFvwpU
	yKtKDWJoAm1/fW0XTUcBUee4AtiqjpO11mr5msImk/B4f8m/iDgVevJVr569DOpYF5Cb92t8psM
	2y41aXAKrCxJ9C94WLLot6AZq/lmxC8CiSoz6Nt9WeiRluhQBJ50GYLHLcdbG+LlEKPIHbb8wS7
	lAzWpCv8Chxvl2MMJcuMJkBJkxXCg=
X-Received: by 2002:a05:622a:65c2:b0:50e:5acc:e792 with SMTP id d75a77b69052e-50e5accf287mr351235191cf.14.1777294009721;
        Mon, 27 Apr 2026 05:46:49 -0700 (PDT)
X-Received: by 2002:a05:622a:65c2:b0:50e:5acc:e792 with SMTP id d75a77b69052e-50e5accf287mr351234781cf.14.1777294009301;
        Mon, 27 Apr 2026 05:46:49 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bd19sm1091496866b.37.2026.04.27.05.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 05:46:48 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:43:35 +0200
Subject: [PATCH v2 08/14] media: qcom-camss: Add image formats for Qualcomm
 CAMSS parameters buffer
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-camss-isp-ope-v2-8-f430e7485009@oss.qualcomm.com>
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
In-Reply-To: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: lMFOwripEaz_H6hnwBHtwEHc0OLRT6x9
X-Authority-Analysis: v=2.4 cv=CJEamxrD c=1 sm=1 tr=0 ts=69ef5abb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=QedBaXGEmMrZQ1XkLmwA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzNSBTYWx0ZWRfXyZqFY9TWZqw5
 YQ0lsL7/Cj+4aX6ruoUDgz+5NZS5qYfAEM+deaUb6k6LyP6hEyANP7FsBkcmwrXw+7heHFiiN3W
 4vdW3bsJC4v3WWQK4lm2GwEkwl3AWU5kj10sO/9sI2QTsDCFUifV8ijoP8y7PFW13ysbUa3HWUO
 M1hDhAvXA196FcXcoQ6Iic8xX+2pIvymP39v6ZzFE9ivNmILOhs7esxNuNxb6lEanILlmTjlv13
 XQJpVE2f6s4couFyi0BCk846waQL/GqU4fq4Fn9UUdknysHRLrwsaLAUYIxJ8dBquLF/buOZ2as
 gvd7yy31LAxvTh2nO/LscdRyXI/A8Lr0sN2ci7BXbzBXxFEQ7c5IAQyE0yTIdQpg1wNbQlLjZEw
 fyvdmXS2bO2cRYbDoEuU6+8S92zWc+P243Yk6/IKMYzXr8kNEBOTwlQ0BR+Gu9dltEu2P+boV1L
 V6o1CpZTA8UiAmHI2Mg==
X-Proofpoint-ORIG-GUID: lMFOwripEaz_H6hnwBHtwEHc0OLRT6x9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270135

Add a V4L2 meta format code for the Qualcomm CAMSS ISP parameters.

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
index add08188f06890182a5c399a223c1ab0a546cae1..f861211ebd7aefbcf4096885388069efed27ddc3 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -888,6 +888,9 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_MALI_C55_PARAMS	v4l2_fourcc('C', '5', '5', 'P') /* ARM Mali-C55 Parameters */
 #define V4L2_META_FMT_MALI_C55_STATS	v4l2_fourcc('C', '5', '5', 'S') /* ARM Mali-C55 3A Statistics */
 
+/* Vendor specific - used for Qualcomm CAMSS offline ISP */
+#define V4L2_META_FMT_QCOM_ISP_PARAMS	v4l2_fourcc('Q', 'C', 'I', 'P') /* Qualcomm CAMSS ISP Parameters */
+
 #ifdef __KERNEL__
 /*
  * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when

-- 
2.34.1

