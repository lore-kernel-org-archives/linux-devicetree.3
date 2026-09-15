Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518793A05C2
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 08:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459872; cv=none; b=H9A3PpGClCz1lOR75Ba4kgIEtyEn5Jm3/mgyBCMyrSOTRLAlL258dwVCr20qRoyV53G78d9EydVhW9VnqC/rrpW9tKC8pa5OP8g4DiFJSLViCsD1Ez86pwzYE75UCk8az16MNXUWf5WsnyfJRpsxrpehQnYS6W7K1lMunXK/1Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459872; c=relaxed/simple;
	bh=TwbZMWaf5zHMMD2gf8LfNRX+QQ9gQjR1lauqLVDpOig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d9cm+UmcGE7MXPplJgGxwWDVm/xt/I7CShZENFieYNhd4Z/6ISpIO7LIodlq0nBZipz93BWUU1FbvLAFXXwRjIkz32y2zra2hgM0w/19O3Amn8lg7Pi7RAtOinopAjqXxICe9F1Dnfu+ghGXJCyQDRt2UXK4hZJ6TpoX8GpGkvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cmgdJY0R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GUfKEhXZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cmgdJY0R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GUfKEhXZ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZBRX2983702
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 08:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Mtr60xJ+ZTH3/m9/beJGo90PbSa/FEKMJzCUWRk9Mo=; b=cmgdJY0RFDho3MfR
	glnQVQdP6xuWAmMhvCZrUpvkd96Y+xNJE3HUhlAYqc+pQqHPpCX0EnNpbUDg1fEC
	LjevAMIen2bKB9LDxzRAgSylPUnr26t8aAZj/yqPBoiu0LwYswPFGbGGfw5VJdnQ
	JpJytloqGKuvJbDFGxJScA12zDZm2wEOB58mHAKBzo64NvxFjYMOucaOMd4ana37
	fyfYTYpJF2f8pqS8XCFe8oLsAh97Gd48Cs5uNKCOlNMi7dpDMHJHKWv7KGqDFeyb
	NEIlkQDmlzsM5EAiMb0VS88gQr45hisBT67ayzMocCoPxn0Y5MPHRNV1uKhUYV1X
	dExy3A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpnet375p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 08:11:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939062ecda9so651345785a.1
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 01:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789459868; x=1790064668; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Mtr60xJ+ZTH3/m9/beJGo90PbSa/FEKMJzCUWRk9Mo=;
        b=GUfKEhXZH1PpdH98JhhXTFsajkaJWBvK4CQ35LIZ8lOYS0J2saKq4Rz6p2WRTEGe3P
         JlApvwa9372teBY/gyoEeqgV4T2xMYDhXhm7q+lwp5s2Flauj7ynp8r+JCaSTfacN06f
         axHjg0uLVKfnYIHDFMmV+l9A3wjDJ7h3Cy6+uYj17XTxAfXBMjPPVfutEQO1aYPTL0Sx
         g0mD7SfV5WLNhGaeNBT8mJXu9cEVmFlxDYKmDvPFJrWKcnsvstBXzDRHpqXwI8vJQbZY
         O1VpXVskh2TlBx1l9HQgDIlYnT7kc0ggTDg4hBI6OnsZmzcCug+wYBnWAmeMsyfwyXCb
         LnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459868; x=1790064668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Mtr60xJ+ZTH3/m9/beJGo90PbSa/FEKMJzCUWRk9Mo=;
        b=pLHjlFldUBT2eoUwrWBCmVF4DY1GRm1AF/k0re30NGarmG+wk7MGurg7vBUJYS6R8l
         XgYSsmwWTfNP9m5xzHGJIqVZlJfh9vI7JvuaCj4euvDykeuziAUsphJJYxyrNjp0wt3f
         755dAu9awQ/4VvOM4DA90adWMDEVsQLIiE9EiqTFVXRQX26Hwl00jOc72mDGpFWTG6N6
         rM8+7VFs1qHFh329a9xe78uGxSbJ9L61UBE1wgqlJbUWJbMNflX+aJ1BPrzDtfSRPPsh
         k8R7YIy18QL89W77xR1Cs0FqDMD2MCsbg/5pIvkQF9CA3h41QcnVX0eDt72FlAX79fQS
         EYWw==
X-Forwarded-Encrypted: i=1; AKwUvBxJniXim50hASC3Z0XXSx1pd+37q9ZqH1fi7nxDdI9U3HMIvWFHi1JBVPtnjzXxpXRquo4fsaQ+zdXZ@vger.kernel.org
X-Gm-Message-State: AFuF++k6LbBC2nPgAn5ljcPSOXESiD2qQ/USetjLuw3Dl3NRsxiTbf7w
	ASid+48FNlQ7kGH3dQ7L7wIBvtiEJ/Ty7WCKbXw4bODoRYe75T/GzP/ge9Tkz9Wx+uQnOU6dw07
	JNT8MHN3luv02sP7haEZ1v5vj6svWD//SVx/XvP5xJta1MbW89HpN6Ys0tE8GKdBl
X-Gm-Gg: AYBFou064PE4J8YFc8I9MpBs1DRG5/Qywe0ruSwX/RuYfm4GDA4PBNtdkLD/NPTS9fP
	w2r6aF+HmMUjzgZ5q0VZTGAwyxDWxrgJxH9iRl2UJqrhVH+eW9wBmxNgfUlDlQWbweTLNDpsY5E
	VxK6j2Mg/1eRm3S7JKocN+moVZjrE0JdutkK0RY/zYi6k53QP8NywYmFt8VpS21y4DL8lEf02cX
	qZ4O1Vn1vYpbagY1X1bbg+MdbftC+yb+7fjMeVfLLGRkD/5RR2Nr+6DxDaHlIqcPWT9CJYt5qKd
	cf11cxWGfDrIwLDK+no2F8DuwZPQXdksu57OJ8hnPaq17L2Dqv6yLQmVjU8/tCk8bN0h9cSGGLv
	/h2Fq+0VeXpbUHccvvBIozRiilxyalfIFF6sTqhCZijM4LY41geAGou+vkJjTMFb3+3pUUvC0t3
	bOON5V7qH1ojnV/1Ql4SGq8+3k0K/yn8lxpxIVlbYgOxd+1vq6sHA=
X-Received: by 2002:a05:620a:84c4:b0:939:7c8:78b1 with SMTP id af79cd13be357-93a29999e82mr1026087285a.24.1789459868549;
        Tue, 15 Sep 2026 01:11:08 -0700 (PDT)
X-Received: by 2002:a05:620a:84c4:b0:939:7c8:78b1 with SMTP id af79cd13be357-93a29999e82mr1026082885a.24.1789459868076;
        Tue, 15 Sep 2026 01:11:08 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:7034:b557:872c:5602])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d292d3csm48847885e9.4.2026.09.15.01.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:11:07 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 10:11:04 +0200
Subject: [PATCH v7 1/9] media: qcom: camss: Add V4L2 meta format for CAMSS
 ISP parameters
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-camss-isp-ope-v7-1-77b13d131d3d@oss.qualcomm.com>
References: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
In-Reply-To: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfX0F6m+KTCr0lL
 ao5Kc+F1Ewec8YFQ0JyuAcNsP8PpBiwWq/arTK0rTJ4YOy44jzDgssIgn2nLDQBo13lPYgjZQrO
 dStdGPTCF6pXJtB7xNsSD1Z6pR7aAIM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfX7L4PQ7vNcLNk
 9AlecVB7UQRiCif3K/ek5GAeqII6Nj602w1OtPgrbycQzi1onatZLWvXEUpHzqzB4xWqiCisqTK
 t415pEPN6CK2qMSpnUNFsfUXw68nNeVxJyDgfnLQxd2LQDrZh5QuSFGiam8h3ZMlSQp4NI2Iy+K
 WcN+ew1148hcyiZbHztun7rzNkoNbyFPPT493OsSvddgP6EyDy7IQKK0YCDVpyxpgy8JqpwIPyf
 zu3RXXO1GlwcvtIGsGSUB8FktWyhrRcps8bcB1fvItmHMDtdfN1WflrW3W+zTDhzlZ1J5IBjWtg
 EVEaO7qLQzCUX48vBbDtGMRda5E42irZDxPR9KnWBftV//Gxas48v0jAZYiAT1yXchWqsVjqWuj
 2L2SEhmxg7B+LLV/HgOwiWS/JLdyuWwxVc2Rx8nmpZsE24T6tDnnY9Spzv0eM10p0GKSfESDPAz
 UVe1GiuRgyOz+6IMf/w==
X-Authority-Analysis: v=2.4 cv=PKKaavqC c=1 sm=1 tr=0 ts=6aa8fd9d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=mDm0RygAtmZY0osY0NEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 8Xs34Xqtyp-HabyM9uoV6mONPilAHevs
X-Proofpoint-ORIG-GUID: 8Xs34Xqtyp-HabyM9uoV6mONPilAHevs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150116

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
index 5373dba640fae3d19247ab1c74ba336e05dc0fe0..fce574d9268a019aa7829e8dbc06a6187cbc5c62 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -893,6 +893,9 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RPPX1_PARAMS	v4l2_fourcc('D', 'R', '1', 'P') /* Dreamchip RPP-X1 Parameters */
 #define V4L2_META_FMT_RPPX1_STATS	v4l2_fourcc('D', 'R', '1', 'S') /* Dreamchip RPP-X1 Statistics */
 
+/* Vendor specific - used for Qualcomm CAMSS offline ISP */
+#define V4L2_META_FMT_QCOM_ISP_PARAMS	v4l2_fourcc('Q', 'C', 'I', 'P') /* Qualcomm CAMSS ISP */
+
 #ifdef __KERNEL__
 /*
  * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when

-- 
2.34.1

