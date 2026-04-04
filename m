Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8553D3446CA
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 21:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775336653; cv=none; b=aj3/sQiZf0B8TJJAtDp2+Fk3acfrHaYW/fg1QDLRRfrQVOlAom3sMfHy+ydopr35dS0pdsWY98nfPgBEu2QrTLGy9zC23tY+CU3uMfSPGC5z/r8ki1gEwAJAjmhhstOceet1zPizgP30HC+1toSQklhdKIsDeANbiwAvpIyN674=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775336653; c=relaxed/simple;
	bh=ccn0jChaL5zN/iyxjxDcPtJ373eleo71GyAme/3kkcM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q1NdT3p4SJHLeLusXC7u97UDJTCqV3AOBDivhAKnplRV1IdvIVKq678rk7jU4rAutDHiSPyzFzMeyYXN+4FOEKYuC58rOzSNjsynVITNDW0gVMvbVFbxsT8r9EtfOv1SC8l8gglWBWc7snYP1jIgKZC5iEtv94G9r54psfXv/2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PKJkB52c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IWKl3oun; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PKJkB52c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IWKl3oun"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63429ESJ2409353
	for <devicetree@vger.kernel.org>; Sat, 4 Apr 2026 21:04:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VWvdxIpjkxEIHhKLqLaBgrD3bE9pPar0wdDrSjVEcHw=; b=PKJkB52c9Ekl/ZH3
	NFBOCFN8T+AnVLbCDTRW8P0Mt+5GGtnj9oRjB3SF0IGmBT4JHHITlwZp2yNzpk4w
	wWe/8lJC1crs3WxgudB3JP0ghtKv0B0xRCZzpxzluZryd3+qFDTsyg7dEelUsy7N
	qxqKKfU2PlDashhyB0Fkt1GDadgD3oGu0QQIlCxJ6v0cTvW4m49IRwKDuUheYxMt
	MXA+3kyB0NFT5Z+jHT985MeLxJlWmRrwrSlCgccMVFH7pke2k9uWstrNiJGHTWcn
	dfboBl21HLHh33mXvsftA/MbF36C/9XPYCX5VLCF+4t+f3Oh3BYdkv3bT92F3EDV
	P00inw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daskrhm3p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 21:04:11 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35c1107da15so2794762a91.2
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 14:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775336651; x=1775941451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VWvdxIpjkxEIHhKLqLaBgrD3bE9pPar0wdDrSjVEcHw=;
        b=IWKl3ounOQEbLyRUtkj3gtWuX7407F5PJStNcNiHf+DDkcS3OgyEf/V0htU/WHg8fn
         MCO/Aw7DRSLyx5QPw3/JmvkihXmZd/ZQwyPu+IctCa5KV8CB/Su2NfgMF36VRBgfVu5B
         J1z8/7fWZBgwd7oPn5/mif5Z/CavT9YKrua9t6++djqnDAac0p0piCF0OrbR1FPuehj3
         FWgHe2ugfuNujGilEZu8VxKmfTlA+tXKrCAaHxzEO/u4LbRq4yBxen64YRQVlq1D4XMT
         7su5DMfUpV0gCYfw+o5Dz6x9p8rIqZLzIYXcZ9/RJbRRnsZJ/VtfduNlkNozGgAbVS0l
         F8Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775336651; x=1775941451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VWvdxIpjkxEIHhKLqLaBgrD3bE9pPar0wdDrSjVEcHw=;
        b=Qs5MhWbxEFVDeVFbHP9hw4ZL45uu2W8bwsjwBD/Ogf8KigcNppmVFkcUuT3qtizSUK
         aDZ0EJtF/etT4PpRLWMSRGDVYtEjd8Sk6bhiNzMvohUs0AGyXPY8cmb+65/uPZjNvO1L
         5ICWCgK3dijwvyazLZMuqD/+OIsPMKt29AIN336pLt5vLqVLGj3MF9eNsm9H5M0Obnny
         ReXF3+YRqW7VLhLtrQR7Il6E3JnjHCnyIXxImgfxNvP7uNILivldt6JQDLIA7xnFdSu3
         H7yDMfufRivn8DcCFubq1H8kLBQ04OrQf2cQlehca1hvRW0R4C4PeBbzuMYjM1CeRL/Q
         xGaA==
X-Forwarded-Encrypted: i=1; AJvYcCVvTeWIoFUOFzhFRhduP54nP+HzqJFOSxvRXs5T6xSG5Yuqq8Ide3JErT+caWB3u7HyrQM0lbmFQjAu@vger.kernel.org
X-Gm-Message-State: AOJu0YyCSKqgvqFqQAfvwgDAweAKWoroVrI9VQCMuvwdnb9tJejCEpsh
	QW8L6QpYTVhpBdsgg07v2osHOy1CKNfI59JSxZgZzuByyB04yUw+8H5VKQVBiimCZawOYNjPuFV
	ompTOhOBCoSDlgqOpiDUyplcZsN/kS0uuMAfQKT1A579Msx8aE9rk8WJ/PjpFlrQu
X-Gm-Gg: AeBDietqRfY4zs+RWU9l5JaV4TplLCvdo83HSDLCdQj/yYHRQM0O5K7ihWfEObqChDM
	/Gc2mrHq0P+LhZ7vmxfrCF2uFOCtaml3um+TshRAvhPGgUYZZAPmnyFvBsjKjyfBSAW4JL2NxHg
	L5iBhglCFXnzV8OEN+YdZ/r5BSdGa1AiKI9JDVueT85Fu1v7CvNOyKFfWyfOTDnZliDQTTsV+0o
	kqKzvCeK5tfdoFUY8hG+Lbmmeu0O8iOTnrUvEgviJ7fh5Dcb9e5XfoQgk453EUDTGqhYU9803AZ
	X1yylt1EOXDbOPob1HExERVXK/HSh5D+gIfgwZxytGqGbpXzQ4b3g0tmo/jJTJ4WpGf97Xv9Gcu
	GpXVIIXcsUkRd9GNv7gmWhVfjud8De5x73srVGJ9l8GrTmg==
X-Received: by 2002:a17:90a:d406:b0:35b:945d:752a with SMTP id 98e67ed59e1d1-35de68f82damr6916279a91.17.1775336651036;
        Sat, 04 Apr 2026 14:04:11 -0700 (PDT)
X-Received: by 2002:a17:90a:d406:b0:35b:945d:752a with SMTP id 98e67ed59e1d1-35de68f82damr6916267a91.17.1775336650573;
        Sat, 04 Apr 2026 14:04:10 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de677e2dbsm2675545a91.4.2026.04.04.14.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 14:04:10 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Apr 2026 02:33:17 +0530
Subject: [PATCH RFC 4/4] arm64: dts: qcom: Enable GPU & GMU on Glymur CRD
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-glymur-gpu-dt-v1-4-2135eb11c562@oss.qualcomm.com>
References: <20260405-glymur-gpu-dt-v1-0-2135eb11c562@oss.qualcomm.com>
In-Reply-To: <20260405-glymur-gpu-dt-v1-0-2135eb11c562@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775336618; l=767;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=ccn0jChaL5zN/iyxjxDcPtJ373eleo71GyAme/3kkcM=;
 b=JRFgBXK2KbPsL05frSwn5I7UhOJlDvht+GmFwpZ3gnbdAA0ZppSJwRmWewXWhpoI4MqTiVhEr
 9DATLVPnMy7C90DgmwdBoebxDyPBn/B2JKWyKW+ibt6nE6RA2tYEYbe
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=Xpv3+FF9 c=1 sm=1 tr=0 ts=69d17ccb cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VLalC5YaDb2G5u0TXLgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: OUcqqcT6-3ilTPtH_9kgzT2ZnrWqUcjJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIwMCBTYWx0ZWRfX3qyc0w00eJ51
 8+peWTGB3s1zYxT6Wu6C4qqyFBGOv5gA4vtauP4Ua8PE+tv8URLKVzE7AID0j+ZiZyrIkyG9wTp
 7syp46m2fqI856E2ylhRZmE5g/73QJUxcZgZcVHKZd8+sGuge3kgSAC9jiGY+VBL3tOE4B9/CRD
 NIPACIIiBqE8IDvSHh3kF2rZTFfDaPra1C2k3LuRrsfnudNyvO23C0HUhuGsZIMK5UrXxClfYSP
 KmT4Q+1qUC3iXHMOgfeRC5zGjkvCnoDPx9z0kQgGExvku2oZXimBqe5pX18EQt+QVlXmVAe5Q6A
 CAemyWzsENSUwv4NYs+gq+CcHxPXoxvXlmjVq1xJg1QhrIpGn4nz+4EyIyrKR5/L+HwhcbFa6I/
 fIigVORsLCv4K74eA59Psd7WLGDRnfHFKsRxybpr3VZsMXWTPmvxLUddoG/uGLntuigO0+bdTwk
 n4FmWZwtchRF4jy4zcQ==
X-Proofpoint-GUID: OUcqqcT6-3ilTPtH_9kgzT2ZnrWqUcjJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040200

Enable the necessary DT nodes to add support for GPU on the Glymur CRD.
The Glymur CRD boots Linux at EL2, which means it doesn't require the
secure GPU firmware (zap fw).

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 51ea23a49b9e..a579df902323 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -110,6 +110,14 @@ vreg_misc_3p3: regulator-misc-3p3 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gmu {
+	status = "okay";
+};
+
 &i2c0 {
 	clock-frequency = <400000>;
 

-- 
2.51.0

