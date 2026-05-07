Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30E83D5672
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 22:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778194229; cv=none; b=UfTBtihO8t25QsOgQEVVuof8mQovBexc5Efc3ARjCEh1UkJBay8XH5bo1olnfAWqdLhqka/C6l/Q20kUfkGjzHJqMKi+H3RDgLJhEjp7Nwg14Qu31mqd/4vrfBCVkp+V2GEtklFJJ66SLotBg1B3JINSK0VueR7iyM9SqaiWZN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778194229; c=relaxed/simple;
	bh=Mh7PVsHAeBxro5wjXWn2s92lyXis/97vUohYTl63Csk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wyp2ASVjld8ZZESluXto3SJI6qZsRTNLuTjZWP8OnwrHEhfudGeKjSdN4tLhtaiQsHas1eLd9cakW81cIAXme5HX44uPfxAtNq8DEKgBMvRERDSYQJQfSEZp39ZQh+FYVCwoK3J2K4AF4veHneM2fe9atYxVQEVSi0PYdMclG7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cm5cXAyn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j6jHnOaK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cm5cXAyn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j6jHnOaK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647J7VJr2531395
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 22:50:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GkDMdHG4MAKPTHoh78zrZYswwET0RC/m0vlXIvO5Ql8=; b=cm5cXAynoc4yOlLQ
	Jgq7Sn2/5lfb8qefqI1moOAHcnBVK6py1EVTTTQBE9ZuPE8ue/beKKNxKf79hVer
	d+8PcKd90wkmQj3WTNzlUGRc8iZyDyaNmYzHBZpcLeOcZa9wueyNPcaocMcXN08b
	bOo8l1r8O3pdhi38r0eAQhUoVCeiS9PkSLQXvlOMsG8vh64beufan/GDnrG8nPIc
	CXcQKCCxfDGL3TLfFi1WGdA+y4BA0RklDrpoDvzDAKaau/R2PAG4uduZIxTdp9FW
	R2h+m19auigZT+nl5ixXBMcph2gCg+wAZThbJWDKnJRN0i08+3ryCt3s9FnVXFCD
	uTwIQA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e10m9rm38-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 22:50:27 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-57584c23424so366762e0c.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 15:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778194226; x=1778799026; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GkDMdHG4MAKPTHoh78zrZYswwET0RC/m0vlXIvO5Ql8=;
        b=j6jHnOaKrmorfm+f9mAo8le7AMYl+hjGCVyNCRuytYyYfU/mD0y0ELN18+YyJNQddz
         gQBXCPkDmVrmgMUsBE2rIHbfD8DGLv9pM39cEqyREeWT7uW7S1DFeQQABlpIO0v/R1Qi
         OWWrNeacCb6Sm5+AJ9UcGxd1zMrefX80qouObUz2EN4vYlBbS3dv9WarQbdjkyRyvodO
         zScYU3rWoqhLmse1S1hnDZ+0yGi7myF4UVXby8BOtwlLRbY0pcxP7J0bgPAgDV3Dj9b5
         Cj/xil7Z4FiWKTrN6Yjbn+QHnRHdwTNdp0U5B9sU8a5bKH1Gmiv4u6Sqc9BZl/QRyGhy
         uzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778194226; x=1778799026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GkDMdHG4MAKPTHoh78zrZYswwET0RC/m0vlXIvO5Ql8=;
        b=CDCuQ8NXShcEIoN19RvZN3ybwIxprE3jaSUkiBeHnHovWTcwob2QQOVTHuEObuyQp+
         VKLvdNUvSuKtbgoE4GSjGE3+iUhTEOrj9WpWxs7dsHuqP3dMvKe7/Da/r83oEg4PKER/
         QEZTkMfA/ipTX3iBl9ZdQZadfKi+bZGkT4G9mQlmizDbHHF34Dgaqfb0yGgCPvCE4SB3
         7/M2NCvR/zWslLYvr4/lOmvUBfn6vo+rDpVp+atLECLeMFh2nZyJPtFEG0KnU+f+4RVW
         DYyBByeSm+pDvqv60i/IXLkJ9LrzO7Zsr6aa2sx4Dt0tbJRSjahYUziHL6DtWElonZtS
         0/Rg==
X-Forwarded-Encrypted: i=1; AFNElJ8KoBpaE+UJHg5CRmeeYWFzNx6c/1yqohossQER7w1sE5JhQghHaZ+TyMKiXERCGx9TfVI+0zUG9Gq3@vger.kernel.org
X-Gm-Message-State: AOJu0YxT1RcHjrKFXut8g+24Sh0rPy5+HiAywXVGD8/kblExZNOk/rNO
	SsFsfG7re9u+omnqhZEM85ntz6fTo1XZzZ0o7le8NUF4MNhNZLf5VaCJ+PDQ+gir85MwZDFF/ee
	8BMETWYCZUrEHnUKB5fZN3wX+68UcUwLD8bOXLo9/Rs/A4Lu1wnaxs+GOZnJUQROU
X-Gm-Gg: AeBDieuLkikPrfQG8VmlZXU98lgsn1MCMrC0vFWHACzaX0kxWlaWb6oD4iR8rWSneQq
	5GXwk0T3SZSELIVtDjf6LKG/YrRAGXYp4m6+RlWa08RAUHgqp7/fqxEfDHtzBcWPsNL0PCY19Pd
	7tLtkE57a1afeWprPuTC40CCH1sO+3jzgtqU6o50xCS/P5LV/RDeJLzg9XmIEt4d6k1P/SsNuni
	vytpcNdh7Xp16zkDUWft7RPQ/Xnk8TrjCcPU0hbsouWrOY6UWmrQ1VcIfjEa74kfItD2kw9rY/F
	d+EocadtzfruZj613yfkAqCunCcIgOWaGkzSftudKwKCIeoez9VQtw2ZiiBGgeoxx5TLNmtXraL
	zVLSs93djPGqgeksdFLcXVp5Ofmj3th5h6RZ8c8n3RYmULPLPfrdzEfpg4HP+CYaYD21sVizzbV
	iHQZwQ1P38gE6KOZUQASc0/upoqQI=
X-Received: by 2002:a05:6102:f0f:b0:606:49d:1861 with SMTP id ada2fe7eead31-630f9058f05mr5648723137.27.1778194226281;
        Thu, 07 May 2026 15:50:26 -0700 (PDT)
X-Received: by 2002:a05:6102:f0f:b0:606:49d:1861 with SMTP id ada2fe7eead31-630f9058f05mr5648702137.27.1778194225890;
        Thu, 07 May 2026 15:50:25 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac4359dbesm102466b.48.2026.05.07.15.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 15:50:24 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 08 May 2026 00:49:22 +0200
Subject: [PATCH v3 07/15] media: qcom: camss: Add V4L2 meta format for
 CAMSS ISP parameters
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-camss-isp-ope-v3-7-bb1055274603@oss.qualcomm.com>
References: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
In-Reply-To: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
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
        kieran.bingham@ideasonboard.com, johannes.goede@oss.qualcomm.com
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: oPUnc0Gxzs90rT5dNRZYFWhQzK2wLWGr
X-Authority-Analysis: v=2.4 cv=VP3tWdPX c=1 sm=1 tr=0 ts=69fd1733 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=mDm0RygAtmZY0osY0NEA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDIzMSBTYWx0ZWRfXyFZkWhEeZbdu
 xslhX+QIEAFgoWV4Huxwy95G49+w5RFr7Byk33WLnQf3ClkhcuOclVnCAR5QBUliPt+1cx/63j9
 9x1t6WXuvjyP4L9g+aRabU2yfoQZTzoas6X5L2+mf/cNYUy9vL+N65iDKSBjA8J4aE9b52t8Qu8
 KzeGuRC1nPqMtis/SZZTm0lAO1Z5omhlJBdU0zRvKIzz0a6dkLjXkYVmXFSnNNshbOlPBICk0UQ
 J6fUUl5e9Dn+JE30G1vEPVGC23w7pNzYg1EUEWMQqzCb0RCl0RnfKH0Rf/yic7NKr7j17zQm6KL
 RkrmLFSGxxOkF5m7zE/r0pu0fcA7SGmsC5nAnMzrpHVotjIhOjcKOHc5129lseROAbWwgRKME5y
 ZFvW2a1LYQwX86ogKGLFWJOC0Nrk0Sx2rxHFFkuUWL59YHkyTnHPodSwjKieGDhO5Fh7WzcleQh
 ycNS+YPdMfBzkRxg7mA==
X-Proofpoint-ORIG-GUID: oPUnc0Gxzs90rT5dNRZYFWhQzK2wLWGr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070231

Add a V4L2 meta format code (V4L2_META_FMT_QCOM_CAMSS_PARAMS) for the
Qualcomm CAMSS ISP parameter buffer. This format is used by the params
video node exposed by CAMSS offline ISP drivers (e.g. OPE) to carry
per-frame ISP tuning data such as white balance, color correction and
chroma enhancement settings.

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

