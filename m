Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8434BB275
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 15:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790005004; cv=none; b=TJTgTTUV/h31LpQ9fHh+jkGRAmPjf5pik+TIfYDJ/+KEhsQdUkcSH8o6G78WvqY1b8TFX6TEJ6DAYiw9XeOIgMTpiFyxWqmKADc8g+nvgTmVTQcqvcKVvHPbs0/sS5SYNAZE+WGlvfC8u3rsv4KIitKBsSKVA7L0SyBuXorwfRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790005004; c=relaxed/simple;
	bh=t9VRl1nMX4c51HXGRlVcUrJ2vYPgoDYjYMTLiyXwefU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V7jutFAC+w7N6rV+Kr/9H40oMUB01bNypjRPB7s7RaWMouMANqjL7VCvu87PoKo87Qq85OX1kX4CiBd2zGQLc3bcD9A5WFNgmT08SXZP+xhRKuOV4sNA7LPTTNm7kOHjSjw3eDHwwOD3FXlky5NBLq6ma+EviiCiwX3X+dif1Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XXMwsrZC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OHHSKEi8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XXMwsrZC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OHHSKEi8"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFATnb1437908
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 15:36:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	owC/0Uitd+RPnqSaxCQ8n2UoAK7Gqnd+PP1VG0zdCcc=; b=XXMwsrZCCFDMfbAb
	+jqy7EXRSWfFWQy1n0VWa2R/mhw88FeWkldKsYGy7bzsf87qQFfGHC+ARWbu+Rie
	//M+Ne14SO1/pyNkQvYdM7kBl/eqIIorBku4SLRssE2yLIo32/m/QIVzUXzJEeDW
	W0i6kYsrZhd04hz0S4yxr+25efiZMKWhQk+0/zn1s6TH2erIKl+WTuA1OqCK+0P6
	L7oSKj3nBgLXMnkvTxzkcxMfySAJfip3sTqP9AlMxdeebLAOdZlT9hGlJ1Ru3Gf5
	bptVJgFgFTvwx1RA024wKhCSZqK1oJoC1pWUBQauNcnqs2FgU7weZyKqKUXuod83
	eRsW4Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtwf5jn0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 15:36:40 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78f2fe53829so2752362137.2
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 08:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790004999; x=1790609799; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=owC/0Uitd+RPnqSaxCQ8n2UoAK7Gqnd+PP1VG0zdCcc=;
        b=OHHSKEi8eg01CgvkgHJftbR8VJatzsI9Kb6+FJpj6vl2vVAuyBQ8WKYH/jXiOSfeoz
         GKY5pMAC3+NsVfu7RaegvoRKEkM5/ZYk68JLBelxf+5it/hosopBB7yRan8F4K0qOFpA
         8GJCYa/6Y6ygusj5kUX7wgG47jLaJPZx9GEjJSmYbIOVWep/Umf9jhCjFca+VMEg0Gj7
         JDwRq7455jDNIjkezP8I5nMhrKzyaF3wqmkJtiFCSeUxSgI6QLRui36yyNmlrt3u9hkC
         JeTbvNizLL5mEcDC5BKAkKJmZ9kw38qNNz+TVn9rcFGhd5T9fjTBKP5rZdeOpHgQS2CZ
         n1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790004999; x=1790609799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=owC/0Uitd+RPnqSaxCQ8n2UoAK7Gqnd+PP1VG0zdCcc=;
        b=S8SX3Fxp3q34bdI6MZoipWtsi9lA9Tfe70bGBE3QQVc5ctKZD0wHRXBZi3KY/ugN5h
         i7lfTIzBTeXSTx/AjedLa/ltGAnY5uALjkcIYPCDM5MoyGKrGlydCsIbXrEFUdTWcnVw
         BBw1hgc5jWfWluUzhZy9898J/gJYPeWLRduR/p7cYZ86GnPG95pQ46NYhkdSIrXjKmpj
         0xoIpf17QzsrQnHxIw4xsmPbMZ8iXMqGZFcbrFjV2AsABVqLsGLg5D2c/0uDQPdi4xdQ
         7SlqTGQx9tKTDntUwqI0O8SzrITHkyzhbGNDquEfFE/YAocBlIUeOnN2QCysmuTP2mIB
         HocA==
X-Forwarded-Encrypted: i=1; AKwUvBwY9KXLyI4b46FNR9GgWVCvq7QRZlyL5irSCP2ZGDQO4JqUOf6N6CLIfIsjsU72dAKSoL4KmSVsaWt0@vger.kernel.org
X-Gm-Message-State: AFuF++mt0HH9/jweC5MdP0XH0xt6pUmyzJQ90HkZoiKj+mHOZfNt2Us4
	0jyJw4VkvrLFhaRQbLi6ZgTKCYZHxik2xfq5cVF7ubKNK79MaYBVOVCnqz399LHcMVOXS0+Y9DV
	PUVbBgYvHV4gmbS4IIlnEIjcT5JgVmpP/IZ/b1ELUkAqgMqNJyx2//A5CIuZ1EEBO
X-Gm-Gg: AYBFou2NZIAv+UVsD3N3hAM8JalH/J7zxtd9T1lnRmO2+KzrOlzkzudZXfzF+323wjc
	gb5fhm22Svn0i73neDQkOc0SoC/vriHs5vwdmkpgAojW5BGfDTRPbmeaaYolH+1bS6cVzwjVKcg
	YUOSdT7TBnW4n15NRwmNwMGWGDMcMih+wGMT4Wdp7QNUdXq8wuHtIdSXn/D+klxHNopgramHW77
	K8MD8D+yhHlP30T1ZtcAafq3DFG/g2I3cR6bQr3Fr+XriEJ5IJarXrZSPdNCE4NOHIUBLkJazZg
	ApInZzZoCo9wWW+Wj+QgZHhMSvbiq8A26MTecnRQBFIrRdc9TQjtfAI3HuTrs3dRw8BO8kdmwug
	Cw9ePZpfoUVXej51Nky6xp6d/uREnpYj9EoidvpSac/NxP81va75n8STsLTmOHP06Dn5eC6MEYd
	SUsxvskDzGIL16zBV4sXDGOdtQ56H14mxECMJTWNVkNDHCqeft5Qg=
X-Received: by 2002:a05:6102:5e86:b0:7a6:c647:cf50 with SMTP id ada2fe7eead31-7a6c647dab2mr3641395137.8.1790004999396;
        Mon, 21 Sep 2026 08:36:39 -0700 (PDT)
X-Received: by 2002:a05:6102:5e86:b0:7a6:c647:cf50 with SMTP id ada2fe7eead31-7a6c647dab2mr3641351137.8.1790004998951;
        Mon, 21 Sep 2026 08:36:38 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d5b5:76d2:82e3:e5fb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd07bba7sm231054065e9.9.2026.09.21.08.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:36:38 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 17:36:21 +0200
Subject: [PATCH v8 1/9] media: qcom: camss: Add V4L2 meta format for CAMSS
 ISP parameters
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-camss-isp-ope-v8-1-dd1c86a3c8a0@oss.qualcomm.com>
References: <20260921-camss-isp-ope-v8-0-dd1c86a3c8a0@oss.qualcomm.com>
In-Reply-To: <20260921-camss-isp-ope-v8-0-dd1c86a3c8a0@oss.qualcomm.com>
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
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=SJLXx+vH c=1 sm=1 tr=0 ts=6ab14f08 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=mDm0RygAtmZY0osY0NEA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: QKT5ZDV7McvYRC6Zj0nNNFtmlg5_8jHE
X-Proofpoint-ORIG-GUID: QKT5ZDV7McvYRC6Zj0nNNFtmlg5_8jHE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIyNyBTYWx0ZWRfXxWd9q5dID0wh
 nM8mMCN3A8SUG4dk0XRZEXAZiRGfvIKonAZHJnlWKlRVQSJxjWS6cFaRIDLEh9nSwZOiNI8lAzU
 gBQ885JbGsqip4gUULPjtt8jeXt84As=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIyNyBTYWx0ZWRfX4vJx3z0Arn2r
 P0ByVXop8SqVieG1N09+rrRTdbT0gi4qGVDbxNvdnf/zK7aZu+pT2izIyR8NvcmtlgEiypmzIzP
 1/ITqgMP6wIf2mo4q1cqgWNMEeVUn7PoEHvtG/LV738VrH1JU3+FcjmtNqDPNGjX4/KYMmUq3R3
 usaPG2WVja0fy1AVlF3BlyHn61iuYXLnoEMVCwFSUFEjtLzrEK4tCwMZEKwZ4SS3q+LEUxEItG0
 D8TvWMwJBzcw1ZZKkzkHG+j5ry3UaKcN0M/SW/elYpJSQciRAxc3Ak6be78IXZx0EiwMwdAfdKO
 J24f4lw7N2y18NHo/B/to56VuBKWlhfNMcmf/cEKBbqBqCmR8dgkGwWmxHMcEgxyK4NmGqrKHHJ
 gn7Lhsn7kfD+nLdgeqHDp62Kzc2veR1waeitX839Te1PUyyF6SsQVfQciheqCbWxBMsHzG6AXGL
 eDqQ4jxvXmSKD2iAGAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210227

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

