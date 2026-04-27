Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED60F37FF5C
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 08:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777278211; cv=none; b=kas4Cf62f7qguShFTAVn1knuEO7gaHKQz9EYl8R8A5MpJS7nsLl9ZZKKwd+T0qqoSf7Dzado7GB3aeysS90mBcanLGNPhIhpXgKqS8El+itQ4epwhpWUIDCJukdvOWUn7RGIxX4wx5grAn9+O42DkqUCfAmjW7qyx+m56Briq6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777278211; c=relaxed/simple;
	bh=S+UC5l8xLtwplTScFcAPLUWxLbOcZ4c8cKWGBkjX09c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bN5t0mmwHj8YjsHoUzkkNxCwq50htmOBDYfgS965SWBrDSlMEaCRQmYjVyS5NlQPSrhuQqchyGDfif55sSYvpSXdDFmpjd1qjxQl1LcpBHOQlY31RHQlWKwD4QLdNIGGbt6fOypU/RiaRRLXVY8dh/NVbBBgn4PcxxRIkVPUpNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WVDg6lCO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jUJNF8/T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WVDg6lCO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jUJNF8/T"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R84wdh173900
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 08:23:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tiRArfcKehWqRcHRhfjkDPQuN1XNjJnT51L
	mmPgOUFs=; b=WVDg6lCOAqr0Bi/0aGdgXnRrlKaCimHsYluJXB6SN/Ld+tPVPkd
	xZCXQB1WukaG2m/MIWB7tN6/NEKBPFiYgr2SWwKkPkCf8zrbp562Avng5oD/RvTQ
	3Ryqnvpas8mfHwkxHsIE1HWSxuUE/Xtp15zcJiM9wXht3RbZzZQ0QS3+D9vImSwR
	jZIvABaTHQ9gQjCTmYRB3zI1P8MP7/7Vg4uWXc7lPWfDHOKYdWji/j/1UTp+qERJ
	2qimVFSBsNeI6l2G+b/Wd+y9WslYYo74EmxNWw0oxSPVHDdXnZggJv8MxfIa5Ekj
	w73aMlVN/2r+J/3ShwMV0HHDhmgfz9d6MMA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnqrn3h7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 08:23:28 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so15447126eec.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777278208; x=1777883008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tiRArfcKehWqRcHRhfjkDPQuN1XNjJnT51LmmPgOUFs=;
        b=jUJNF8/TXX7z4/uQJfsUkRBJsfBrlNt/tbr9FLt6x/0bqCwx4idH6LKPYLIZlv7U+j
         YCqqfhP5WHa1fgWTSN/p5lSK2AqJSE2MQnPFZm8HuHcUeCPLob4DqKCipWbrTwHNTgkb
         Por/yUS0D+JlsxJE1ho7O4KBq/iNdhnDhbeXaBIVBZ9yPzS7RjnSidPCDZwY1d5xEKNY
         uUE+qOQPDHW4HxRDXurtE+LzqDfn2aeamhkOji78iFPU6ooxBHIcOEDvybjFCy6uctSM
         3w0d6nr+LtN98JBVv7lUnqDbPkF6QxP7qO7Or28706o4909WlrMsjGQeuw6W+efctiVs
         bv7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777278208; x=1777883008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tiRArfcKehWqRcHRhfjkDPQuN1XNjJnT51LmmPgOUFs=;
        b=HHN9+QGP6SQTbLAfoI7EO/jiRx5lt/L8tKxtMy1jaiAhH/1WAT0Sq0l3pH5ek1EyWT
         0BoW9w6HGGEgyWvZ5Ry81uOVHjzQhngRR32PXuQ+TFfpXA62nuVEwAxVpRG8DINx7RRv
         c88paoJEoENKPNs04L365A/mM88lSwxCFtHlv74Nm8cp7Ef40dglUc2tNwJPdwx96IeQ
         vIAopYYBwDnxVJ8xVKlzrqhl0byplgTjNmpYQn/HCi9LuMY4yLeGxYm6xOpvQiMXrqhV
         T6P0F8v4HqzzBZ4Y4HP7pfsJ+eGgi8ITIRVpN47QLKB3seOxnx3sJwDj4a2i24S47CVh
         2YLQ==
X-Forwarded-Encrypted: i=1; AFNElJ+sNCC3xyPYcUpbm01Akhg1cvzDlSlsXG6yZwR+WYDFCO9BIYVYSKbiHpxi38s1ptwgyCXA2Sb5u+4/@vger.kernel.org
X-Gm-Message-State: AOJu0Yw57iGwb5GgdCXdnRw1lPZCKo5fZ7lNLZfjWSni/sN5UPzA/02D
	8GG7QoIsW13tw3x1uAeEbh9PWPnu+/+76aR8tDsG4cN1Ww1OCspdlUp1KRu1xnwX6HLdMMEG1wP
	z19VpdM0HsL+3vVBYCQPOgqdyVT5RLvgv0Gc+KMwvCfgBEE3XljMi6HoUjSjDCCOT
X-Gm-Gg: AeBDievlTyFMYE3EHxWw/X/JBO5f4ZQsoQm5omemcCrhzb3fmzwCB6y8huuDRGRAiFs
	QlFp+I3uHVqiagfF0bneak6DwhV/Tm/Ji9pT7OOWHtQZFwSqUTVJtBtiKxc8ci/jw7Uk0hJFt3K
	Rv2Em8gGbiAwsseUXCzh9FYXAOmZ2BRqkttltFkqunANnrgQLC3reWBoE1OoEdhokF7ydPR4kVh
	n895zhiUlLUdhzMBL/Xg4guIIdhWmgR68DdxZtLXa8CnSskt7taCTICQP/cT8KK6RAEINj7d65a
	e9vaghaQf8ndU1Ekcx89IZQzXJj1bNFMSh1Ujpk8RTG/BnH7dN2IGMG6AbDRPjYNKIVZ4KlXm2F
	jKR4yxe1xFxm1nOYyavP5SGFXEqC8jD4cTzCx1BwDmZC7hnbKXz6LD6ztI+nldDhZ8ssZ5uvjSR
	9Yxw==
X-Received: by 2002:a05:7300:3723:b0:2d9:db50:c6d6 with SMTP id 5a478bee46e88-2e478a331b3mr23189772eec.21.1777278207586;
        Mon, 27 Apr 2026 01:23:27 -0700 (PDT)
X-Received: by 2002:a05:7300:3723:b0:2d9:db50:c6d6 with SMTP id 5a478bee46e88-2e478a331b3mr23189760eec.21.1777278207087;
        Mon, 27 Apr 2026 01:23:27 -0700 (PDT)
Received: from hu-liuxin-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e539fa5c86sm50814692eec.1.2026.04.27.01.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 01:23:26 -0700 (PDT)
From: Xin Liu <xin.liu@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com
Subject: [PATCH] arm64: dts: qcom: talos: Add EL2 overlay for talos-evk
Date: Mon, 27 Apr 2026 01:23:25 -0700
Message-ID: <20260427082325.1895450-1-xin.liu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA4OCBTYWx0ZWRfX9d9PsaE1bI38
 1vzTVCi2VYa541hOW7MJ+nLytP0BUhcupOhuSly4k95HcUR9IIBeyDZRquPVw6h83J5b2qZF3/t
 AQ8CVOZhewPy2pft9d/bLdDsmPMPYBGy23flRwLXZV9Udboo7CDsW/a+x8bchulh78DhWudkAo8
 NJmgWg0Z946qqf9D8Fx24M6PVP3NtxoatSzM9wEkc2qHru79UJJzmkHYCbitQSvcB+JROiWGGi0
 ynbShv4tEgNmLw+08/PSzSr5rsaREA3mejy2OJcpaa4UJYMGa3246ui17eVRxoC8WC2Gvj/ZX3u
 mQOextm4WA1W8dzaKfxc54RYt4nsWy/3V/gPUqA8TOkMDbVFlIPop+gJrn6QeVBgAzYD0hhDHXV
 MwQW5YktOzlVU2QOHPlaNLw1t0Yyex8LhbQqQvU2KXtsnu79wwUyRnnkr0uj0VHmIx60x2kpQb6
 Jdj+VJRXoEeXwCs6plw==
X-Proofpoint-ORIG-GUID: VvOTf3tt4sIsKhixZrkkQwFjjN-_mZUD
X-Proofpoint-GUID: VvOTf3tt4sIsKhixZrkkQwFjjN-_mZUD
X-Authority-Analysis: v=2.4 cv=UcthjqSN c=1 sm=1 tr=0 ts=69ef1d00 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=_9oBJBIr4Ljb0oQskpwA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270088

Add support for building an EL2 combined DTB for the talos-evk
in the Qualcomm DTS Makefile.

The new talos-evk-el2.dtb is generated by combining the base
talos-evk.dtb with the talos-el2.dtbo overlay, enabling EL2-specific
configurations required by the platform.

Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4ba8e7306419..c89e4327ef18 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -393,6 +393,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
+
+talos-evk-el2-dtbs	:= talos-evk.dtb talos-el2.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-el2.dtb
 talos-evk-usb1-peripheral-dtbs := talos-evk.dtb talos-evk-usb1-peripheral.dtbo
 dtb-$(CONFIG_ARCH_QCOM) += talos-evk-usb1-peripheral.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera-imx577.dtbo
-- 
2.43.0

