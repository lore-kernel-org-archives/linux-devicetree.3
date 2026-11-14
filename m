Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794630514;
	b=XDzgBOG2uO872ERfbVLme0fZDSFWk93hnECQclV36a5MgIgwxdOWAkiFwYBVS+Duhu/o
	 fW//Matd+PVtxwjJjaRxnocCoG0mfwSXMi7BAKUauu6sM0m3nbdrVDMI+B3UTcsfGSm38
	 aJd4YecvEWqfAh/RwFHI49pZjG+7dLcLR5gfCi98KbvWcl6wTORAqhOedDeghQqxL1ztj
	 skt9F9hfTlbBku4T+KXYzQZaKsNisPo9V4F8mCQIc22l/MiOAMgH3yodcoeekdMGNZLTD
	 +hJ+3tlzFT4K/XzNBUcpcGeEgeTXRmOcPFy5SNhkXkRSGDE3UV7PFU4VSzbDlrqefdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794630514;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=T9UbsSp9/GnIXIjjFyJeCzkRon0iAucPinHTduzdxeM=;
	b=FzUtCLN05PlhtlcT3Uam2NoV2qcDjQ6q9ctrQZX+M6CbPV9OQHIwnjOkrL/d5cM3JHT9
	 rh72806yU/+c6NjIR23SN4GlzEXuyMd0n3QYN2ilI4EdE1J1Inz+7RJ/55x7SsIcbte8Q
	 ZYZetZSYp/RGSZPy91i3ZGkvWjSVjXierNxbWIc2LxPdKSCjuCqeh9NEb81+kNtmxTCyU
	 soOTS2vi65uEXiibt5Q+ck7taX6Db5vXcz7uyJ402PWyleVQzd9en326MY+hsr4WPtYGo
	 +v46DD+EnFJ0F87Pr7W9vF04t9YBEbjdTqICKCwsmtfMQjiU9j3jjSRAFicubTzCZzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jkDSJNrE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ECCw8Mo6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70537606A88B
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 04:28:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70537606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jkDSJNrE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ECCw8Mo6
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE29YGC2845401
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 04:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T9UbsSp9/GnIXIjjFyJeCzkRon0iAucPinHTduzdxeM=; b=jkDSJNrEc3mpOQwu
	tctDgkoNIe+3iHVJggkzgUDt6pFD9y3c0TPC6S5M5S5RcZMpIhvkKxZonTbyOTKO
	1ZENoUyS1gpUl4vLkMnJ89L+xh5MT2PinDvUX0Y3zqpp9vT7nd2kBsT1EQVSvJ/7
	6DX0snAaSLLZFhfotW/oi6HeqvwZcO1i9kEKDTFW6vbZeqlQwSh3acfnLBiz9byS
	hM0vc34c34rAxmyEas7SY0w0tXSDFcVE1dDgUZKEZarkdzqBFPJvCOJYwl4meesQ
	+i0YO2Q15RiS885Qu5iw/RM33kfmwR2TPQu01v3yFp9UptsO/+Baj3WrcaIRjYKe
	lPwkzw==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxekr89d5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 04:28:33 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-71ad7f06ab4so109353eaf.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 20:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794630513; x=1795235313; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T9UbsSp9/GnIXIjjFyJeCzkRon0iAucPinHTduzdxeM=;
        b=ECCw8Mo6JSwxLM0LtFVn66FS4CYHpMH9rD6/6uCZyMqm/91EZrsyNKduQaCGIM7YnM
         Pxa73xv4Q/w3wVXj6ObbP1mGIZfEsr5AQa/S1ajRc+0BFo/LnL2Wr5vr5918CvtLbaIj
         4iYEz497sLbIbn3W8pMf1bOy66Iybxy2T7dpDhjIzYeo+Qk3qsAMBzpIDrGQkdZ/WJL1
         KUbLj1Zs92H7ozTyQ4WKLkwlTDurBjapv5l50HyS/U7grQpXSxKD5ydc87uUZqhUQnIG
         g+LsGZ7bj+LkkKDj5Rogykcuuy5fWoWB/OcVHJoQNoCmS1TSbvnn4MTA3WmYRxuHjoX/
         WaLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794630513; x=1795235313;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T9UbsSp9/GnIXIjjFyJeCzkRon0iAucPinHTduzdxeM=;
        b=y5N6vsKCPNn0Ys9+6OqRyRDonJmyglEheZW8NnILShxEKNuRyqvAmVPhgbDnThK/Yn
         ET15TdH+xH+wNB8cA0jlVEjSzoMZrj9bK4HbE2cVcp7etycgDfLGDgSCPAz1r8bpVPhN
         C5UvnzC4oOHR3E614xAq8vby8k2wIsAyPfYX6DOk8jGrNrddZ6bqIi40qzFugU1Cu72m
         uKWNWH625vJs/TJBa6cQrCijn1FEySzE5Juf7G5vLV2g7+6h6NqvlT3Av6rBHY9c+rUG
         qpMXEKjLvAsvMSLC6F6RNTJTpo6LMY/RJUxXvPLsUgql0+J1hublyrMmOtgPvoyIFc0v
         9Q0Q==
X-Forwarded-Encrypted: i=1; AL+hErEMZHxZ7JzXdvV4YV02bb8GRWVcDFZiLQrTX6gy7pw/URWvnT8aGmXqRPp10zddtc9zDANcrElEFL/G@vger.kernel.org
X-Gm-Message-State: APuU4Z+3yJUCRKJSUeXzvaBz+VbxzB3UeMo34beV8Lx9VV1OVstFXXhB
	3UaqymejAT+aayH70MUpcuSQmlN00eWVA/aMOS7IKtU+KRmkBpDTNfr+4GiAfaLyfMEknDvmn6b
	2H2kcK90YEEA134hh70sEoVzRVWFwV04I8Gg4V4BVHpJtvE3AkS4wy+GCU+JuCwBa
X-Gm-Gg: AYBFou1Y4U0ZdOJ4dO/aVnoHxbMI5nWjik3D3Cd9wd777svZ7kc59NERynbOCBsqAnX
	RUkintVHbdFdErdsmNsn+4QpvBv4o9lfbl1FEW7QNOmQjGKhvLD/6pj7CxKIJ+ByfsfEynh0hdF
	oJI/VJrvC9JEskhG6eG95bMlItgDngbbbIyIQXOTHwFFC/+NjNRJSmIm3P/0jGJaelJdGbLPPRd
	YMXhxSrvJFXwYW4e+scO17B6jHXPmzs1CgWfS/QYDaV6FlG4Owfa2Pa/Lxt+t0KVCBPY/FaESwZ
	lHBtFpxDMXrLXh6xU2dimLCqd47mjLNHLBkKZ5rtv8ZSDclsMPi6EZQ9SmbDB3qNZktQOWfUBF/
	QAl4bQJl3sbjZ/tQ4GhqnotxZDuNuKs3y//jY3QN02n2RUQjtlagofrWE2gisr8IkiW4=
X-Received: by 2002:a05:6820:151a:b0:6fd:e28f:ad38 with SMTP id 006d021491bc7-71ab5009004mr2987097eaf.32.1794630513185;
        Fri, 13 Nov 2026 20:28:33 -0800 (PST)
X-Received: by 2002:a05:6820:151a:b0:6fd:e28f:ad38 with SMTP id 006d021491bc7-71ab5009004mr2987085eaf.32.1794630512691;
        Fri, 13 Nov 2026 20:28:32 -0800 (PST)
Received: from [172.17.0.1] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab3f44dc4sm3292269eaf.0.2026.11.13.20.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 20:28:32 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 22:28:27 -0600
Subject: [PATCH 3/3] firmware: qcom: Allow QSEECOM on ASUS Ascent QN10
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
Message-Id: <20261113-qn10-v1-3-e09b2aa7ccbe@oss.qualcomm.com>
References: <20261113-qn10-v1-0-e09b2aa7ccbe@oss.qualcomm.com>
In-Reply-To: <20261113-qn10-v1-0-e09b2aa7ccbe@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=877;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=xh76U6IOsJ9uCmSSVXfGSwpLhEJoGHaAUmimAeWEo04=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBq9+Nrfu6H2iMY82S+D5ICGxWCanZlmpbYtSpjG
 Oh7HojLQ9KJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCavfjaxUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcUFRxAA2Zp3gYccXh5/DQj1uTdcPOS2kjnUrhLDk3ejanO
 VR6ZhzLVWwzVUcLrAQeKwSjB2LYsivhh8H80+698WL6+8vIFNtH5Xn3Cx46rdsYXy9kUQTxw1Ua
 cxkuKJ9BGC9vrM0INYj1C0iZ9df3lIaNd6XdUw/iJrWxH2PEonZlRqCld+PDJ7WqIyNTp3Jf19/
 vaU1fk+AougMFZJ2JtLX0YJL3ya/I4ObnmXa0yep/mTqC5sPOpDV+si9BuLOzyPqeIfEE08QSWw
 uBGG9BniH+av0+dP6yIwqBwtngGq5j8kwnhNrWWEd89yVuaeg+l/I5a5J36uPf5B+++v+J0nBvJ
 MvxO3GSnUevJxxBnsZ9vwH9UJhf+Zs/c3B82yYEtyyTjFOjwBqcaZ/sUSMT77EnOSL7ZPcKgXj6
 PEIWoce6FFFeMdFMnJacQU2IL7/+HQY97h18fZ4uozrjehP8FOuSMOfefM693UEXCI+sUvJ1yqf
 lM9hZSVrqsQbB3prrPbwYpTffVfzWiQDHo6OPIrGElxhHjWFVKBz4Qt7PbSLnC/U33q4sqVDidR
 8Qgi6/2qNueQInX5tHZJrzIRtLSdohdzvrgrIxW8kNUh85eweE0r6xF4BcN+BztUdiIoD7/DAG7
 e6h31gXeEsHJ9fZQGoePfCkwFkSR+2tzAbxnVRMZ78CE=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-ORIG-GUID: UfLbvMV66-4Fhtn9svBN6Q4FGxARoCHa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAxNyBTYWx0ZWRfX/NoUR9dhHacT
 sFmsfburSxp6pqzSeZGfWVGnAVcOc/Gf9hKnMruqeNA16ToTR7ieCyN7YEj4lIyo2MAqNhXpWYh
 qPDaRH40husQD/kFFcNBqu5rKmFdNVySSKZHMN3PPy0OzqBCNh0LfLmXra+Tnqd3lcLZECChUbY
 FZ+JShMy1El9HJv9TVuEBCDJry0oQBFXxBVga7wZ2CNGOAVPmEeJLuYlNo7P/fJFgALykTzBSG+
 1Rqk6hBnx4EcjZlyHKX8n3cY4DY8oo1wv3ILWp1RklEdNVHM56Bwq+LIcJjOlphqYId9Y7zVxOJ
 HtRQ5OtDODc/Dg4UjnqQDfdCL7SyaCsQp++4JvES/8PmXiPvD27mIjXtUh86i8p7aZR3ETi2fZz
 9bqxaVTwfNQ2Kb/0vf9rWGfcpR2xIpyfHwy9Fd8NSuF+/0tTtvXy6wjeyJklqF4+nZDnAr/i2Xx
 3yB8D4WQvH92h0hsc/A==
X-Proofpoint-GUID: UfLbvMV66-4Fhtn9svBN6Q4FGxARoCHa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAxNyBTYWx0ZWRfX4f8nJil9UDst
 QOvFlg/A8gKxq0ldlvGlV3SO2pTdeobvEYn1ZZBTKJ9lEcOxZW6L2ApMFidlCoIkoMVb2XoJqvM
 jk8hfwpUYh0HH1wzUJAt6LJzW47g9B8=
X-Authority-Analysis: v=2.4 cv=AfAkjHXG c=1 sm=1 tr=0 ts=6af7e371 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=PMzojMwlkinoLF_R2aEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140017

The ASUS Ascent QN10 provides functional uefisecapp over qseecom for EFI
variable access. Add the board to the allowlist.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 030e4ba90812..fa94eaa020c3 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2226,6 +2226,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
  */
 static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "acer,swift-go-sfa14-11" },
+	{ .compatible = "asus,ascent-qn10" },
 	{ .compatible = "asus,vivobook-s15" },
 	{ .compatible = "asus,vivobook-s15-x1p4" },
 	{ .compatible = "asus,zenbook-a14-ux3407na" },

-- 
2.55.0

