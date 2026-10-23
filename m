Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768178;
	b=VbxSYo0mzU0JNFsR9Qiydsoqsip0zNMIqp0HfuG5vnsu+HWzSLzQtkOhBE0VVoi/1NAa
	 nF96CTqASC1iKuMHJl4r40KIhuOMCeNBEMN/Dnkg9s5iu0rEFAQS7fXUOd47MhoO4XRDy
	 gFe28oUKFgKdgWbY/R7HbXdWzbrBDrvB6QseqKLIkt6GX7zi3OWOzP6Imib4eOJm1nYq7
	 Mjax4hbXh0OR/fmDawU27MCBX6qPK6pE5LahgjjJSjG3u6xXXFgBxANFdtryMHqO1EzmG
	 gGipxlngoc5mkH6nY89AMI6hEKOYCed+TbpMAj5XhaKrqX1M6FV/XMZD//bIBOws7rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768178;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=owC/0Uitd+RPnqSaxCQ8n2UoAK7Gqnd+PP1VG0zdCcc=;
	b=J22mAHB29EVVrwaBtWruhBfh6FV3W/km55Lox+g//ENv7rywJi1780ISNuo5fIDXl1yY
	 XFFpBzCAkgsQEOUoGIx2LhCWpbxFF29SKG1HqHD9UaX1SQRagZ9Ce/MHOVJKwno9D3RjW
	 TAzpUiDX06MJSQruwW3PZuDPd1bnxCUVRl9+kwe7x0ITodrSK6/glKAK8wmeIZ9vBxNan
	 GHdjuLeETF93K3BUcEKqt75+m1pYPhzfLcs6A6tIdat/qiTivbRYPf7fYq0HIizW6M7uN
	 IZ9xUAgRkkNGIllW62jGzmXcvxoQXSJG/X0PBjQHDxnzVjX3ImR6dBG5Kbi0MUIc6Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gf+4Ox1p;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rt19+j7Q;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51398606A33A
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 15:09:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51398606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gf+4Ox1p;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rt19+j7Q
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6Awu2999836
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 15:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	owC/0Uitd+RPnqSaxCQ8n2UoAK7Gqnd+PP1VG0zdCcc=; b=gf+4Ox1pI1TJJiqp
	t3lu4fUZWLnoa1a2jMZy5jsyEYxcwmUATjZW4xGitP3AHjJFtnOe/ocLMBvIsO3t
	w0Nwc9goGRkql8MWb67cNqSjA0VuxcaYrADgiaQsLanKdSdiI0r8+LVcJDFU6i1I
	Nnjm9gkymXlnNuml2qcv+3d2Li5PjObCfClZRqf5H04cDuuImGk7S/cFRrEeu+Oe
	0UQcklRe1jOBfoxoV6XA8pxrfSNMBGe7FqOZycLyi8D46ZjUhz/j9ZIpfbMZbnUT
	5TpRb0pZiYVqZsXmIULFRH+E687Nsf71gQBvc9Zisimwvj2xWO4c+bLU+4bzEg/7
	F0e81A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7cn0mp7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 15:09:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844cb60so182130685a.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 08:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792768176; x=1793372976; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=owC/0Uitd+RPnqSaxCQ8n2UoAK7Gqnd+PP1VG0zdCcc=;
        b=Rt19+j7QgadhsvmGbM3BbYhgP3TYDl6s/nsDBcknPsqOSv4E8ZpZrSh7p3rbVnWXs/
         12GrFPLH5Vpx/j4Zh2F3+9Z9XS1eES73BS3pGnYoQ+XeCXx+FaX55BDJDGpOjIteuz5k
         Lwggz9iJnsM6saA7cjC3DYxQO5eASS/IHzw64TJtMCBfLKNw/sqip5oICaGkyM4J12ds
         7kIDP7q4srVfqM3zeZ7w8Y0CuTwt9uovu8z1PzD3JwEdfJyH+UZ9S2L4v14HATXKkGFf
         5qTKdI8mP4YWmW+hZcTFNqqbuzNvKXSfZ1HuyHRmHFJpgZFKQBG1WueHNKyLG50uRNkt
         J44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768176; x=1793372976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=owC/0Uitd+RPnqSaxCQ8n2UoAK7Gqnd+PP1VG0zdCcc=;
        b=DWkk5mAwn5Hc0vvbEsh4FfAn19vVNUYy+2qXZd15dvVXiZdlA4mrch1uygswnqlWp0
         MGLiIAKS1oi2c44KZvfnVpT9HXJPcflyBg1Te4WBJxoC5Ih0Rl6O6fjuVPQZYoHvp8xP
         aAqAfowS/0DCMAhJby55NMbBHVc7X7WLjgFEU3NTBq1XM0fh7gb8MSdt0hnO7ymV57ir
         5gya8KKwpoEC8iV+YXIuaotqoQg3TscXmSk+jmgNQOc+HgngIdnTCTOH4CjBDlZ/j7ky
         ru5S8EPid/TNJv6LxZskV9fujh/GNt33snTeGHgSqAtVxoNmhfw3uvmPJQgs994wBBrV
         AN+g==
X-Forwarded-Encrypted: i=1; AKwUvBwf3nT/eYPyJ5nLb4AowjP0F+6RLvPbI9CQLXykwlA+huZ721zNAE7HaUOLF+vzCS3A5rNKAhRwrfTS@vger.kernel.org
X-Gm-Message-State: AFq9FYJmvXKZCWz7GWONEXry1tWuaKstil8MalFmKEwbTqDXNofl9Kdn
	TTg+sA290x/8OzqMMQbeySG3JMx210EP3QZvVff5G7cXC/MGpXhhdyGzhfIOcUCJZMgb5sEPsot
	6iRCAECoEm86Y+vt6ifcJScVOJYnxBFvehZq0p51AG/9s+0CiTQJtVn3iHPXSgt4k
X-Gm-Gg: AYBFou0j9l878LX6uv1ut6N0N7XWU/hClwk2fEpbOzBN5cdldXtlrFTUU8/NG3SwgjX
	ggdVyL6GSxzOq5MYjZO+2VnSzMP0lVFbEoHnprrWKEby1Pp+diW+GNHHHf1OQWYmrmyB9OXE3L3
	iNNXwaeVGaJNa9B3tcWpo0tw98TFJjzXm3z9KMef9VJX9dtVvvCpDc3srczKIlOl1HuvanJTeLo
	PDOp4uEXBDG9OQl0xA9q9OHx7m/1cFXg0hZQJz+tcqBY/YQY62gI5xBoLGpj0DnWw8agYf0xAxG
	zj4CaSp12gwKYbNzRHfRoAUdZHuktwmXeqxqv3AZDMqUj0vbNyhdVkYd9DzrHxz8IYOOAHXfOaK
	ICcSKuF6sViLvVN4mSRYLZh4jQaryo4dlxF/XHH274/w6Ur+aQW9NXP0jVOGxs+S9MzbkGspKhq
	2HFhMMe16msUpgbfGGkr5d6RsPyMH+tGj6TswAVCCHg2xS/PjYN0w=
X-Received: by 2002:a05:620a:2b4d:b0:93e:e111:2778 with SMTP id af79cd13be357-93f626db3bdmr945065485a.14.1792768175951;
        Fri, 23 Oct 2026 08:09:35 -0700 (PDT)
X-Received: by 2002:a05:620a:2b4d:b0:93e:e111:2778 with SMTP id af79cd13be357-93f626db3bdmr945056585a.14.1792768175420;
        Fri, 23 Oct 2026 08:09:35 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d0fb:daf1:3106:3697])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4040d3sm323962f8f.27.2026.10.23.08.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:09:34 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 17:09:12 +0200
Subject: [PATCH v11 1/9] media: qcom: camss: Add V4L2 meta format for CAMSS
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
Message-Id: <20261023-camss-isp-ope-v11-1-0c2937195298@oss.qualcomm.com>
References: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
In-Reply-To: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfX9/5mKOfHsu3n
 NtBFnyvX6kYuog7mY7nzyKD986k0b9lTk0QnOmsqc7ZkHD/+uKnSjkGPK1VEOvBLGvmz3/m0Z+E
 mG9H86LSypCPc6VJ6u4Yc3nZOV9+GLQASHhZFxOgb/10LSEjHopPlM/2R2Sj+CEVqHZT1yxwArg
 ZIIrJ6DfOkkur4MZ+TVXOJdI4iz9EWyuzHqVkrazih/kCaVrzLbY+mFiBFhMuRIKfCrUm4UgU/S
 I1G487paZWTEhZhNCsVkogHrCsQ+uSkpk2wNixjtNSffEMaEaidQMpjsDbaGsa0EBCxphj9Sx2y
 T27PRGvUPni8HEEkBSuVpieSTU+2/TTWkMGiIcp1W2L94o204za+DiS2Bo++wbTM8mvYMiSctdC
 fMzQjzIRDcjwTLUfUvHfioIPUIhXhMHa5UdoL1bGhPv+1pzzxQQvJhF13XGDSXCgkDoAUZyASP+
 9nPvaVrZ3JdzFPi/Wjg==
X-Proofpoint-GUID: FGU-qfHUV7IvLC-vf-ERbbbLsg7AZ7Vn
X-Authority-Analysis: v=2.4 cv=a9mlZkSF c=1 sm=1 tr=0 ts=6adb78b0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=mDm0RygAtmZY0osY0NEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: FGU-qfHUV7IvLC-vf-ERbbbLsg7AZ7Vn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfXzr3aXAclk/tz
 f7zMDQnEQoDQJuHy8J6Wt64SZVfczu4VKUymkXVIfqjxle67340iP/wog1KIEb/AqgOKUdG8zBT
 Up4bfw9k+nrCajZEh8GMZa/uP60iTv4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230059

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

