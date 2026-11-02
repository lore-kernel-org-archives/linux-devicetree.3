Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634803;
	b=tdrzLB0h1ugMTQmv+/WHDJMPNERM5NkaqOjWyc7n8Wj+cEadJdhjldqnNmmUT2krWefK
	 Q222Xf40Fe4r0G7VnISbJwnntLiqu2llPFzI6n46WECecFz8GRNZD9wnR1mXtI2GPoR2k
	 Qmox219EIlHaNd9gLmSRz4mapdoyvLkbCrXsp7i2eHh3thRQIPDvCRsh+l2M7iDZuUqD+
	 m/BkzcEAX3qEIrmnVsMFh8T4o4E97JxAYc8QqX7ly1YyXjjRscoKNVA/CMzhqShdAwDW4
	 u/It1cZO1PqiLDya8CIB6ILN17LDwdq2+tz/8ZJHPs5xLh/bQ5vIO8K+F8qlhuWX5tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634803;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TgR5F+iBiHqDbSrZbID4DhVkgUbDwbnclx1Ow0233B4=;
	b=3/E4Jxv3Rjmf+5ioZxqjQ0YdsRQja89YI3YeOCGVZjvwoEaUBiRnzIqVoepld3Aq1OAy
	 26otGIF/bTKGwdDfbtCgOkhfM4u9kf7tIFN9baamKYyIRK5mYYnC6FQ84eimSlXUB2d0B
	 L/uCZGnzyxCRAj4UfuktGPRIi7Sqm4j1tqjzfUM3CZBGAy1WLVVIaAw1Bvi67bUpsLoXT
	 SLDInLQ9wYARBRrgKLx4q6FHaHBXHbOzBeyfimdu0CLQ20RrqzG9o92o4Iy2EbOU/Z/xq
	 3gNUL/9QVGiwznb2zXHDSPsZbqCSziJR+z6WKiOCsKxK0/XuB+PmEQJ8/Ar6I9Kuyng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kM374WtA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="bb6GR6/1";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC960607A8B1
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 15:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC960607A8B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kM374WtA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bb6GR6/1
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpLR1845675
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 15:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TgR5F+iBiHqDbSrZbID4DhVkgUbDwbnclx1Ow0233B4=; b=kM374WtAawYrgcPU
	3m0FBrc4GZOrBLrImookpjbxtv6IW/CVCZfSvubGAeEEx5c0RvbQj6/Ch6zBkfmm
	1+/iJawSkOr9GkebN9c7u4o5mibgNUmQvKEjxzg0y7SyK14FPlaTYcP4bH8pOutL
	nKq6bIPKP66gtmF5g/5lnfRZu4tODup2wQNYVsnefLaG6KA7N4o3Xk941EuJNnc1
	RAxdBCGzc2G0op+wLlHVva1bXpS5VEm4mOQyIFsVhYPYU/aDxl9z/GtKNmhcDMBZ
	9ElhGvpqOeGKkRgck0xZGMtYHqHWtdNlyg9a48yFPlzBIwtUvg018qpxpJuluTgl
	SYqSIw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1tg2t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 15:53:21 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc01d48a1bso3699604137.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 07:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793634801; x=1794239601; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TgR5F+iBiHqDbSrZbID4DhVkgUbDwbnclx1Ow0233B4=;
        b=bb6GR6/1vt9QyyYzVNEwvjLJ/w25kNwfdChTLC/JVA/VawBfUXoK+oTbly7UscdgSJ
         7RAp0uKZZkz/cJjF+wjELVWu8AxnRZ0nyaIAzc7U+FFtDc1ka17z17ot5fcwa+42Kq4Z
         dJ0uGJrHZUq/lepbdCUnfuTgeNfzaXUw8VLmNK4decaVVqh3xj+nIzogUwRmFup04YzX
         lGz4nqIi+rVYZ1hYrqqYDBookm5yIQEhGoEjPdtAbwRqCn94J5mvK3dmV0xCp9g2zS5I
         L/+kBSnBuA+2oW+MXoKXxS4/Md+r2YHb0hrqN+01PgZStpV7edV2oqjRxHxw8tR/jAZN
         0s1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634801; x=1794239601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TgR5F+iBiHqDbSrZbID4DhVkgUbDwbnclx1Ow0233B4=;
        b=IX2YZ1fPtY7vSaBlfd/T2rZi+SZrZbIjNEkV7hFt5tGhRIHTICp9ROSBH/FvS0dSZJ
         sjh/olPkferdAQK6h74NfuENXdCOgOBhGWvT8zJSSX7w37RUmDXeCJHUq2hdmC6Mv3eh
         zU4RncPiXTPMQzozuGr6QgqOFOI4/AjOvoa2yGn/5Pr2nrT9IDgH8BLgxGhv7koamXSd
         aCMQB0OkEmEU8oDMp1PLNl/CgD5IJEKV/DHH3POJ9swzqHVm+bWw5ISCWfIMp3DGzuDO
         XlAsUsd2WT9edgmpNN8VgTm1BEUYhoFXxRW4z0U4UuRvGbhKceAwq05n3faSG+OwkcXi
         rXYg==
X-Forwarded-Encrypted: i=1; AKwUvBxrVAyU9OL9XjAjju4+UeFKpM0PhdYEjIi9qyGR+nMVaG+8z2Qx78FX6TUAx+R0qZOCGQZVytmwV84d@vger.kernel.org
X-Gm-Message-State: APuU4Z+tk11u/fNUXc/jw7zh7wOMmkmHTVjPHpWWMx4Cht0qjofV7M+W
	XtmuvTg8NHYWjRx3roDG29cmshCjRhIeohM1gHkvjsREGGp28dKd3D7DV8gcXlK11dGz62FIYu9
	/VzV8PyrxX3aFqMg0p7LOpvIaIeaJdD2SMafTCgDD2oithoSdPddMfnO/FFoHFV01HKEfZy9hXo
	8=
X-Gm-Gg: AYBFou2AapttrSBLbydpPXfPBQ0c2/TD4RUnD1/JL6qiEgSTcX1svLSLl4co54em4j1
	vaSawmUXa7kaEWcO0JFFWvoL6KMSxyL0GbgPKpTL2YCCBtL/v6VYUxV7AHOyjwf75VSdmW9NE6o
	HtOShy6MYso1SW+yM/w2RpMMiF2ASdvbl1ItMaweHxJ4RGj1kW7pqXF1zEyp4ROciyDNJ5pLsov
	+AV/11egpQgq3hpWeMf+tUBhua0ruyinaXZXwvxK9FFNVp0ckcVQZpW6ISNLcw0l4a7Y3eoytAM
	4GazM1cDmCYQ3jrBrYhMZN1UFzAgpiIQf4dugE/wXgha3UpWXejppoTLlIOCeozylhILXtYuaWY
	tRCmgW30QssLnfBtIcNwu8cHcjh+iCtyDIDIRBtZfKuBa3GC0icj3Cf7/hexKPCiLgcpn3axgg2
	FDqC0RSpZTfJWQqj0jBDpWzan/dITpJGSGRHEUY1cg/w6h0bEUwCclyYzPCNy32jv+mw/DpIKu2
	4+sJF0hiPvDh06YwTpqed6yCifp
X-Received: by 2002:a05:6102:4490:b0:7b3:5b2f:7030 with SMTP id ada2fe7eead31-7d053f25b2dmr4101184137.4.1793634800694;
        Mon, 02 Nov 2026 07:53:20 -0800 (PST)
X-Received: by 2002:a05:6102:4490:b0:7b3:5b2f:7030 with SMTP id ada2fe7eead31-7d053f25b2dmr4101170137.4.1793634800239;
        Mon, 02 Nov 2026 07:53:20 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8a7d1sm20700323f8f.38.2026.11.02.07.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:53:19 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 16:47:32 +0100
Subject: [PATCH v12 1/9] media: qcom: camss: Add V4L2 meta format for CAMSS
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
Message-Id: <20261102-camss-isp-ope-v12-1-702254689feb@oss.qualcomm.com>
References: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
In-Reply-To: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: q8SkbTq8zQacTncMgahhi7adDYC4uOzN
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae8b1f1 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=mDm0RygAtmZY0osY0NEA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX3UccvoPAGCTm
 HS16aKG40pUClGuF7WPDw1r5PXlq8jtElBTbhMCccnBpX+aogfkBWU0bZX8fHGMuBXr2dyjI9m+
 yyy17owoAHq23Y7hK2SZGtNeS5JYtClwCGxn+78uz4RPaoaJl7qY1oVZvMyoJNLo1p39cvI7vOe
 /p+/9VWsuq1ZjH8mo2n/LzCRE6HkuWH9nU7aJDpIzJ9lRvKY4Q//kXEMyOS6ZbsVFMm6tO8N26s
 k3oJvhjduY7EN9SIvbKcN/dUYTwiEvRmADcafvZ7jK7HI+Lp2LoUhili8e2QJbMNYFY9uz7GFTC
 dZFvi4eAc4K4J4ezYCIYJUaAzwyIW2ZKtEbv9zuGTEgShE1ZRzp0Z13h0CYoB1v4Oxha0xRMubQ
 p6a/Wi6wZBLWpc6R2uYVDXpQgaVQM0TYW4DBaT8WJieXVEqPitL+f3227sCTgIgggoBpSzV87Bg
 3L8UN73kl/a22T+48bg==
X-Proofpoint-GUID: q8SkbTq8zQacTncMgahhi7adDYC4uOzN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX5090GU2K63ez
 TihT+pUz4vUUxAAVRXvMEP8Kx65Y7ZqdltudLDuLNAvKU/o2NimZyfpInKFPbxRYRxe3B09mF1n
 e3ZR9LbuupROpEg6SlUETmpHIxyjz70=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020063

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

