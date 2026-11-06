Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973329;
	b=yv5PogIYmi2tefFcAAp19/huSqjj8FvmEv8eWHRMFLgI6oo9pD80pInubyx+sxctSIxZ
	 X2EwS2h4jRx+SC/EUXy5qj2hlGD7AT/f2VR+TFuXoFxjCwgCfn3Z6KjAGyehQJmU3UEem
	 /WBWwN6o5tYsvSzKVhb7jiPsv1t179DjYkBqFch82XSPc9Y5qhL6IhMeWYdDUCeq2BS+j
	 Ns5DVS7a5fX8JRCEDkN3s3tUa4s9zkksvTFDCTDufnnP0kRCGqfyTmSn8CaSHBbskC15a
	 PdDo4GfecUFvrmsYmw0zNX/PXnLGNDtRXi8jpbBLb7A3oyxugEzrSjA5p6awqT0UWNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973329;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=TgR5F+iBiHqDbSrZbID4DhVkgUbDwbnclx1Ow0233B4=;
	b=ZROTiYmS91x7K3oagSbkjOB8l5ELIhKW0CqP15VIgg4UCAkk90v+fxdLRvRcaDiL4cNt
	 GJ1y/nyf8FuMwo96clz/iwuviJLXr4HO/n62P+M5rWCJdGhKelYtT2IdIzzJJWEBz68FD
	 O3roeDowKUGTTxcFjgXUZtjBGrVElQHcMIG59l6va8LKrLVYb5fv0gYJIttyCB7DN2f2O
	 lQ1FzlWVU4JsNj2StqshpPd1sVpkTYborgW93q8IL8YryGE1qNkJl1Q4keEBF7vUI0TRD
	 n9EdlLlP/TU7xy3C/Da/d0AYX0ShPDib1wEPqnzoCwm1m3aspTU3TKqMCE2+8gjn3Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bm5Znuev;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=de+Ll0Td;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73ECA606D83D
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 13:55:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73ECA606D83D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bm5Znuev;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=de+Ll0Td
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6DoZsw3776349
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 13:55:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TgR5F+iBiHqDbSrZbID4DhVkgUbDwbnclx1Ow0233B4=; b=bm5Znuevrh4SmsgD
	vb6RvI7iPS2Fr56sekLTNlHWe1dwdGAcyEAwWtZRcQMaUMpi2827p8iz5X0w73C6
	gM8gsIdM3YDa6mN1YUYOTNTf0su8wIjuylpKeXBx7lfQ+zVSiB3eEJTtkkMyZde+
	sCMr+9DiT5MeeBEJdblEkKQVe6cUswnuspjc6QZlyLtAnN6rdTqB5TUibrakXBbC
	nKc/9yTZwxiJtJvoPJvxH7Aj6r/NsITdvweOxIE1xXU01WAITbBQLM1QufkfYvzV
	DqfKEGR5ae2YOhA52leR+Zinzd5TjCrFVUhVQ9icA8GFKfzPGVEJZcHad7JvBbs2
	p0HwyQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa31br-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 13:55:27 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7bf71bbf197so535600137.2
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 05:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793973327; x=1794578127; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TgR5F+iBiHqDbSrZbID4DhVkgUbDwbnclx1Ow0233B4=;
        b=de+Ll0TdO6I3gn28LBdVHqdTL21TYIs3UW/Itx4mJT4H1C70WWUx2q7hh3OWlywq6s
         6AlwHNnzCt81CPbaVb8YHTfiwtEmp5CvLbjajapScwB1/0sMpjtzs59iTMK/Mov55Lli
         6BcGRKxhS2BmX2mOoXkwD/rMRya2x88hBuSb7F/zJ6omKAMWEsK/TNM2KqRPYLgP0Y+t
         gDgrR8g3nvQKwA4AMDY1a+NrYNBG4+mQMz4Dy3IyGWOxgXjhiYM2BrMwA86ylf4mi9ln
         KvHs7Lb7WgBZnoGNLCQ+3e+qTWXnvqiFOeLNn11jFgo1byLE47ZF9lzmaRqp9PwwpchR
         lO5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973327; x=1794578127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TgR5F+iBiHqDbSrZbID4DhVkgUbDwbnclx1Ow0233B4=;
        b=fINXDE259XWbCePP2yJhrGc3K/D5TOuzf80bPVPUgMqfcyJqyeMsT7MD8P/t4dXm+B
         L0LkouNKk8gnsxqx1WvrZySULOPtt+636k+Gz9MYCa7UuFix7Ac7bTm8R8ce7N6HE7uO
         h406jtUut9bBRaW4dyfYeOylX1nJpt1+xOY+7h2MOmdnaRDKN/OfETY2ZTZjIIOINsIA
         uygh/L50LIb2trlhPc+80m1ihRDHx2MthcpyaZzvVZYMGSLkvtsnE85LHfzkM3syMkbq
         LjXwstyIYJDi8e3/mHDuhZI+P/76yxwgy0jZFFUk+J0aH9cpa0HhLqZV0G/SfP697KWI
         /68A==
X-Forwarded-Encrypted: i=1; AKwUvBzoqvCPFA/ob/SbVMeAXzNVflJSCcwCCVAPmQti09JShT7PvDwcjS8gPur4kUBDsmd0QO97PiPD4y6g@vger.kernel.org
X-Gm-Message-State: APuU4Z9Avyy6DWbboCxEWDRQ4W7+5DvaHmDh2Bd+MEbHbsac4uJIcE5v
	X+DMiLNfZ34kra9yymUpvVjAOLGUvDdmtC7jHgDFmKtL+u9xoR6mau0sS9/I/0051bUX3ppsrQG
	DSO8SfMSwpfMUGPkpEQQeaGX7gSSoOh1RSM2IQ5pMKB3NBb9Ca8/hRww295YtnUI8
X-Gm-Gg: AYBFou3ahjjAU9BYP4r+orGt8AjNGgfEa1W65xytX6zKIY9cA0lljAcSl1aqIjYQ3Ji
	c/jp8IOrh8ibrCfKT3wxvP3pPVttnMywb6k6HedLNsWfQnfw/jOkT0dJRZdtMFUgSHq0+7GDqFx
	EprWGoR21M+VI9ttA3xKTFMG0pis5OsKkfj2gqbbbcecZqeHldOxP5/JsPUFDXc2LRuvmMhaPKx
	yUZDFhF3aAXtBqkDVSQXwU/36oBa633e/eoaFFGM3NHLEttASFy7caU8NkPt3aS/ti6flldjdYB
	XMCmGmbQ0/InVoqJfDDgZr3kP8ueouhyBMRPsrXXtHvMB5Jxo4b7l/gBWBGzh60s8mKrlU+veXg
	9GM+xyXwogBLhJwZgdTT1hdGGlqazTOtXBFekA6SAYPkXRBcd6+TnDAuvGIQbbGH6JAV21I2MNI
	O0ToiNtwX6FNnLd8jD78qnebY+a2XiFmk+qM+pahOAJwYVu+eQU6baGVE16RXQYzK4San66c7EG
	6yPiGsOyRdfgdE+cUfk+3yGXliC
X-Received: by 2002:a67:e70c:0:b0:7cc:828b:421b with SMTP id ada2fe7eead31-7d2a15097e6mr1816174137.6.1793973326678;
        Fri, 06 Nov 2026 05:55:26 -0800 (PST)
X-Received: by 2002:a67:e70c:0:b0:7cc:828b:421b with SMTP id ada2fe7eead31-7d2a15097e6mr1816146137.6.1793973326222;
        Fri, 06 Nov 2026 05:55:26 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d809df2dsm3963256f8f.51.2026.11.06.05.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:55:24 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:55:17 +0100
Subject: [PATCH v14 1/9] media: qcom: camss: Add V4L2 meta format for CAMSS
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
Message-Id: <20261106-camss-isp-ope-v14-1-49c426cd2715@oss.qualcomm.com>
References: <20261106-camss-isp-ope-v14-0-49c426cd2715@oss.qualcomm.com>
In-Reply-To: <20261106-camss-isp-ope-v14-0-49c426cd2715@oss.qualcomm.com>
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
X-Proofpoint-GUID: 4IRKXJqdZNvBhCyDjRA2fGtrMXDwbHt4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfX6rM9MUpPzPXr
 DMqtmO1Eer3HddUWRNbomhqUoF3FuumQkvhi4GbZEeV3zQX+UvNuvPGl2B7MbY3XByQV4qnJsII
 U4b6aUkM879X0u4yt5dT9bz4RZT8TLwAoQHabhzlikP7QPu6vb+JDd5+eDwTBcoz+mtAFVI2hc6
 tQZ66eZmp3U53QPbesis4+V83VePhF41Q5Cj2LmSboKUDERHSf+AWuhJo6e9QWuroQG+ta5J5+Y
 uRYoiQ8/BD/hMGnHKHL7SmOjntYFHOtIQ8H2zSA9Es0/nPFBPHsS3IkTmLmlqeNX8qQn7avUs0W
 74dsRdp/w5r7s/aBjm9rw4i3O62AtCP/T45Kr28GK1JW2tb60dcspSI+lwGVi/WbwWD/pBNFnWo
 ijJe3NjEIvyt5EwhftuhnN+lHXgn/5GiXzmT+S/r5LWcuZPpZWNP2g7WT3j23Pvn4eLU6lkAX78
 FEhIV4nmQ2wOjuG/0og==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfXyUvrY0KHDfYv
 XpmElrFmvCuHbYoM/Y29br9m8LJ4t20czS8OsrehALSLNu1F/x1l5A+Zi6vRxapbptKAbLOLj3D
 opDreFEE10zc/cPY6+Ksrg0uya8lKhE=
X-Proofpoint-ORIG-GUID: 4IRKXJqdZNvBhCyDjRA2fGtrMXDwbHt4
X-Authority-Analysis: v=2.4 cv=CaKdd7rl c=1 sm=1 tr=0 ts=6aeddc4f cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=mDm0RygAtmZY0osY0NEA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060055

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

