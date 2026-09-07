Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C2A46A61C
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 10:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778286; cv=none; b=iplsUQhijXURqWqVkDvHzCQgEkzmSeIBl92uappauZahvuCa1sgIae/KFpv25gKGlRyV6CnBTxCuXc8H204eJzOdpH7n84i+cb26ap+ut/G0xaYmKVjR8k0/l0vA2gYqRHXxhPa2Xr54nNKcnNwEb7h9itPx3sq386FD9jPJ0Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778286; c=relaxed/simple;
	bh=TwbZMWaf5zHMMD2gf8LfNRX+QQ9gQjR1lauqLVDpOig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=drjfzCCWKCf7BaI8Y2I/2G33g84WaPWR2eB3ZwdLPXlVe4/NvSGZci1U2HVk0kom8qAxpD3HdYjc735QhFpfYwF/NkTJ/2gOS9bmZJDbDrWVcXFGFeQD8oH0jtJuKqQybCLrYRyoYSnksjkZbTQTlx/axc9uBWYGxJcMY+rBheA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PYMywZUj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e5yFI0cH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PYMywZUj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e5yFI0cH"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687An53w3230511
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 10:51:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Mtr60xJ+ZTH3/m9/beJGo90PbSa/FEKMJzCUWRk9Mo=; b=PYMywZUjHZOZ+ucH
	uIPoYtEMgKVdton3e+zSZUdbwWz5+nZTgeIUVlv3sgiWN+o6QX2TCdUMZrnlXDUZ
	jxXq6nH/yTjuLAw9bGlZ9jodiBUW165Zk+qFeuLZBGAqIFtsijWt5gDm8LKc4RWc
	rZnGs8m85D2GrWpdr5F/WPxtqxkZTCotOiD5rIKBhLwf+MhC9kF98OL1ie9Um7w+
	BjeT/pVR0TPy2td5CtjmyX3NQI4X59293u+KMy38330tu4hNixcnv4e4khTzcv2z
	tR+pc7oRTFDhgIuF65d0Zvt/wZiXihHM2HJbzc2EX7FcRWN2IoPp4PEk2nhPDu+C
	1Uqveg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfxktb98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 10:51:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939062ecda9so421606285a.1
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 03:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788778277; x=1789383077; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Mtr60xJ+ZTH3/m9/beJGo90PbSa/FEKMJzCUWRk9Mo=;
        b=e5yFI0cHS62PIdBk8luSXTxxhgN5lood98Yg1hPXxXBeZhUFu9luk4TwPSj5R6D6SK
         k6h1EI5yJ1paM5bzi4sUJa3XHFho3tMtT3SvFzDvKU+1LxvQIFQM/N62HiLgjsDOsDiJ
         Eki0ypReYP2SHsQIsXAhfP+l9w5ZOa2k5xHfRFfYAc1F3WH0P7cLnM2LFPS9NyonnFJO
         LCam39Y08Jh5jUB0WcDrweaiK3VEFCxEYZpe5bKjFemMSLkqMS78lRHfY3qFQiqa2CPV
         ksSthG+BwHjAHZ8qNH7BFDJa230k9gKDSORLqCKf+eW6k9WcYw9x8aXUC+2/nnKcfaog
         27Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778277; x=1789383077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Mtr60xJ+ZTH3/m9/beJGo90PbSa/FEKMJzCUWRk9Mo=;
        b=ZSOfeCMDegssaZmC8hKELaegWhuzOqs4Rtivjunml7X2IVgACBhA/liq+GvpetoFk8
         NVwXze4MM7v8BEzpVM7/LlOadt6aZmXj5ut+lgQ/xdlToHF0gOmxE/Hw3fVqRValxYuB
         NuLJ70Fcphnc2xHb1qcrHmMv/hQlqlOz7oOaYtchh2qTOXbZvwVsDFQTOmzCfhXaQ319
         Trn832rXgdRiVl0L6eCgnyyyl6FUZkjNU3wtAQ4KRkDxjLKl4rb5UFcv7Km7iMNdXVB4
         +DCjmmJi04dcJFF8vWysbGeUdcqTYBvOmUT+hHjGZEwqA9b2kw5Wu+Roc3P4S9oW/yph
         oPTg==
X-Forwarded-Encrypted: i=1; AKwUvByiEo0tZyMTvEfVJFu0lNSanX+Egw0y3Nx7rnITbkafy7vq965eL/rY4na5NiBCwfJW0Evbgx4XUoe9@vger.kernel.org
X-Gm-Message-State: AFuF++mZ+4++CXaWPGK+N3rHN5Tisz0gDFCQFsMSMLfZ4IZ8QgnQZ9S4
	ELYMm+Y0H32ACAIkh5YNjtE3FGtzd6mP7c9jX2lNpGXw+ukFrbxibdUMfGRB+/DcpYwZU7p5uh+
	thUisEmhmAMDe/xSCarUytNSr3qc8uBFAbgoO88DVKZrSQhjevPnmhvhFbFOIZN7E
X-Gm-Gg: AYBFou2i3v3aa6suq3C6XDpdsoxyGq4lMfqHF5FdVk/7u2iOl3hBMrfdCn6WoNaTt3K
	r2FeNUgHpJ95XlTDi20TK1bPyqfi30amdBAeN5Hcdx8szDd26qb0r4huxGRCuSLXSQau+E51gGa
	ZXL4XwoNW4E5AAj+z98IcLP8dCKoocXZ8nJAIiQ9EYTRGMvErV20ZLaJEfjoNMsWwrIYbXBvfpk
	d/PH+OLGjCnQgjvx6Ou2AhGbxLFWFC49ohLoWJIEXvF0S84EtqGtoOoTFHRgt5tK2qWc9aLUp7s
	v0tUb7VPHXXF8ZapU4VMvBM9x1a4pbNaWzLkQz7fw1jIFj7ZEDtKPYmnbEclfiqCGztu/hiABbe
	iNS5i9tucx20IAJEVL4BMs2HzvP1N8jhkl1OCxSSFQ/BjOznuVqgyhr2Yz/Io+bDg6pu99cpEax
	QcZ3uaKtn1HxNsvzCG5X75w/vlNqKbTTNUtkm0jW8cfJxbi79gMIE=
X-Received: by 2002:a05:620a:4490:b0:930:9585:e08e with SMTP id af79cd13be357-93980328d99mr2054533185a.10.1788778276628;
        Mon, 07 Sep 2026 03:51:16 -0700 (PDT)
X-Received: by 2002:a05:620a:4490:b0:930:9585:e08e with SMTP id af79cd13be357-93980328d99mr2054531185a.10.1788778276164;
        Mon, 07 Sep 2026 03:51:16 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:e90a:787f:72ea:b218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cefsm410263775e9.5.2026.09.07.03.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:51:15 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 12:51:11 +0200
Subject: [PATCH v6 1/8] media: qcom: camss: Add V4L2 meta format for CAMSS
 ISP parameters
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-camss-isp-ope-v6-1-6b915b9c5131@oss.qualcomm.com>
References: <20260907-camss-isp-ope-v6-0-6b915b9c5131@oss.qualcomm.com>
In-Reply-To: <20260907-camss-isp-ope-v6-0-6b915b9c5131@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfX23evYCnsRKkw
 OGeEgFGaUI2bQM1RyKbXDYDHWZRvmRRJBhX8yFS5nNOiz+NgMm+NJ1IyR+0BC6AU8U0zBKR2jnq
 LAW50SAirq+jURaHsAtyzIZi5NKzV7UInlvLJ/Ri3pvFtsAkokYyrIKqr53AIkKzjHHsRUUDAu+
 H8r6puFVa1SDmdRlWCbQaoMWTDsrAytJQgMVgUAt2TY80kY6k71jZ3qgdkth98vlxM53g4Hnhkn
 gwKwjRfLoJ46Hi6fufbyQ3Mqp90LLXlDndKcklTmtQJ34VwH6Awln5RDcfty7xPs8RCrb//89Z5
 vjM2cUF/KCnbKrZ0X0j8pxtStvtff4JlYtFtuu9zX2SDOO5dfIbjrMqPwaBwa6R+k4zt5DO4RWg
 JzfR4cmcRRcB2NBCGqgC8mSfyZ0NS4uwWbtMKn7wjNf+VxvKGsGAMwABJ7w82UOQOR3/f12jDhf
 xB75oq4KYBKatdyK3bg==
X-Proofpoint-GUID: ooeDWSeuIpGtThXBoM4zl8ekbAfJExqE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfX8yHMA3jLRAPd
 vPkKL4vS36/JRmggNx1qGJu+TVN4f1JgdGxhpr1TzumjeGysJsucoGccQ/OFT/F+Qg0fauPTM1J
 E3ABXNMPcwfg6y4nlSISH92Ju67rGDk=
X-Authority-Analysis: v=2.4 cv=daOwG3Xe c=1 sm=1 tr=0 ts=6a9e9725 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=mDm0RygAtmZY0osY0NEA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: ooeDWSeuIpGtThXBoM4zl8ekbAfJExqE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070118

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

