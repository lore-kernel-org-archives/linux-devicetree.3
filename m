Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053B03DB314
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 10:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419187; cv=none; b=mYScB0Edl+ZWFY3FbRBaL4R1n8l7vB/CpYsJuHKZFekcvil+YQ7L/q8MDV/vHoS9bHDtdkSyH/c6Zw+1ao2kZfJ6HNlOpPXH7HH21UpkJt4VAnGpTHbkQERATf+l2tY210NWeEL5txW3Jqe4yIafW2ooihk4dCfYUTdr67cTJS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419187; c=relaxed/simple;
	bh=FfEUAF8+lLL4qL6LuVUgTiQ0Tb0HI4D89dvQdM2x170=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qZ+7/+9CDydCQAUlADYSBwRCdcS7QFW8Cu/sjLqqs1diEiJI2Kklp6NuRJ3UoxoDFLQPWzHuuNLfTpYoYZh9RAQxLNYlfPSEIkKxqrgfTiB8e0th9CdEJ6ZtC+mxy9lWW85Cq5MXxVbX1ta69DJim8TsAWX2GRGfRz+ypE5vsjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CzX72+0v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ff08fnzh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CzX72+0v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ff08fnzh"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667A72Cw3471422
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 10:13:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/wPM0DgYJmC6ld689rrHwMGcNHTJvtFW6fso4wq4mkw=; b=CzX72+0vG6Hqi+l7
	3g3b3eBHae7WSIloVcV9l+fPMBGprhYxnU2TmLRsxa6DGk28Z1QUIaRddEb5wJWS
	ugC3upVR6Va7Ii7JTUMGMRL3Ch/l7ZUwJ9lO5HzE6K3+wcY5khCGALGAX6nqcNxd
	mLtyAScIBObIne2YulkhZL2RThj6gCs2h+1JDqEpH8JbzVECaz0dKGU+u5TaYWmX
	U8nRyx0/IAyl+MP/28cbG+Gg8xC8Tu4Xveo7kzf0Hq5q1Y0nIPcQUMQKRKsx/Rcx
	iHr+JHW/INBptHWWd3oy1BlGAgNfS8DdoaRBHtY0XmvaiOp1odZye52qkmsS/2tS
	kj+sdg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8ye0g0rv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 10:13:05 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c889d1eedcdso6637794a12.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 03:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783419185; x=1784023985; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/wPM0DgYJmC6ld689rrHwMGcNHTJvtFW6fso4wq4mkw=;
        b=Ff08fnzhNSKHqb8g4NOwfrZq2dk34kPwI+ZGtFnRwBVzsREOSiHWqr81eUKkwfm7jf
         cElD/VvWhBwRC7z1XC/yaux0l4+7TIr8oic34vAqcnGtTXwo9Fm0vGhrY5xaO1VHgnZO
         xcorDU1KylZv0SGxGYB6UdAYuFHcrCANC+UspTwjMV85Um7d2L75B2sgCKSFJallqlHv
         hTG8NX0R75qrMV30ld2hv5upbii9P+QB86LxuQI0/pUB7xP4RMg6oMbLgzgmnkggkU7w
         UzWT1WfhOxdcy+jt1gWdEsb6lcQC/MRB4ZCdDeGJmWMmRPMOwV8llbX736ro7lPBErpY
         HGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783419185; x=1784023985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/wPM0DgYJmC6ld689rrHwMGcNHTJvtFW6fso4wq4mkw=;
        b=GaG+Dw+2WI5UnIR0RslhIXz0mI03LqcmdAfYZ2ltNHq2svIwGEKvTJuG/sETHHHRGR
         v+1Wdm/1eaprNaWPSOTP/sxKikA+Y/Ni9x/opALs6ltzEIJOCOOTglmbAHDTBHmYed3+
         G619yghzOIps4n9tCXt2U/g589aX9F9rsNPSok1FmDD23i0XWznrqKBpVfYpkQe5Olcb
         T+hZ+7UWPoDbZgtxgBO0/peeJ9SwQCRIsDNRDAoShurLXeQbOAFYhFDfUVNSsuJj9Jjl
         aYQmFAwEicJwBaUVQ68FKz4jv7ep81Pxu1ugBqpyWt5F8pcrXOo3dUgKvifEq9DXfXxC
         wKdg==
X-Forwarded-Encrypted: i=1; AHgh+RpWBNQXe7yuXcGaNIePPVVMiNRLRK64JhLKvFHWvdTAKWZ7wpW1aZMSHWWIfDtTUvYJXWwcKru+IpjQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yya16nKuaocS1wjfT+NLawjYSlOuKG5kHchvhofg1XAciCNE7Xl
	ZdUJKGMyYlv8JyKSeN6He0LtNoLfCrHTV+qH+1FZ3mQw8a7WKj++ecLXdIIWaq10/flnyBtv4D9
	CtjiaGGV3+QmCZ4HHjATIEyXLzozHhEjl9BInAH+WR6P1Uan9Ao8TP0EFdhc9twJF
X-Gm-Gg: AfdE7cmh5FWZQQD6nQCoetjsH6iyFYe1mXRrwwYPded82sqGws88q9PZi3bD5JMdG0q
	l2acLcSRwD0z/sMRg6JOEoTKy+KMuEWIkoSvcd40hxSaEQ1hGBcDZ0jrB/73fad6Pj6NfWgRJwy
	KSIuQNKnd3WWrkVoidHIS4colfyBipoJNwtYUojTh/E2N0m7yugLFohgeVIqs6dng2q+5vFcxbI
	6MggcDdmPMEVUJVD2nBPNdHDp8nEnEfRzj+CDbmAnNc7beyJrBkzAD3EsHIEZIicnQt4Y4IeeoW
	ac9kbPu6q/laoTPzzpK6cxa8ZlivSV8XqUCPJ2Kj+MrA4pfzzmSrBemCEbhntIzrAC6AElpbHoS
	OUor3CfUU6R/fVscS+4Ujpix+1LybjDU5uGUegF/VcbGALyEJpYt1zPhCR+Hm
X-Received: by 2002:a05:6a20:94ce:b0:3bf:e2f1:1b12 with SMTP id adf61e73a8af0-3c08ef69fc6mr5768631637.41.1783419184693;
        Tue, 07 Jul 2026 03:13:04 -0700 (PDT)
X-Received: by 2002:a05:6a20:94ce:b0:3bf:e2f1:1b12 with SMTP id adf61e73a8af0-3c08ef69fc6mr5768592637.41.1783419184271;
        Tue, 07 Jul 2026 03:13:04 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659c8665sm7098929c88.10.2026.07.07.03.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 03:13:03 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 03:12:45 -0700
Subject: [PATCH v5 2/3] arm64: dts: qcom: fix SoCCP memory mappings for
 Glymur
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-glymur-soccp-v5-2-053993f0c6fe@oss.qualcomm.com>
References: <20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com>
In-Reply-To: <20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783419181; l=1137;
 i=ananthu.cv@oss.qualcomm.com; s=20260327; h=from:subject:message-id;
 bh=FfEUAF8+lLL4qL6LuVUgTiQ0Tb0HI4D89dvQdM2x170=;
 b=uYF/nYfRLSgTc/cFUMRsGFwrxFRV17pyXS1OGbme208txqsb7Hg0pgqkI6EXSOzp0eioz+guj
 l682MqKNvsfBO3e43gV6Q1xUrqz1B02gmBudRJliNk5vHmBq55H39oG
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=Yyv4ldZGagB5zyqtlYRdUX/L9FZ6y/INQAXO9L3wfl4=
X-Proofpoint-ORIG-GUID: 14x-GLORFaJ4_IM-GVDqzz81pccrHTI1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfXxRAih3cYAHox
 NYOEAXIoghKih3FPCHLJ3d7k6h4jdEUHAM6PHpuQQH8UCttQJzj18l5mvcrlkbTC/Gi1pt/bROv
 dPilcjljC/AXQG9zfu6g8v98jnVZNCk=
X-Authority-Analysis: v=2.4 cv=SZfHsPRu c=1 sm=1 tr=0 ts=6a4cd131 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=PsRd9AHgjfBglgpcg1oA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 14x-GLORFaJ4_IM-GVDqzz81pccrHTI1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfX/ckg08a4cKuZ
 XcDacA9pjQasYGoJNkk0QMN47YsDq4FJtzm3tzwFJgXn2WR7iCQy5bBVqAqFqcD1kIH4qvZByXG
 iIOLHvdHq+wjK6qzyD/5ES36iWJZk8VmjlDspHq9Hx/jLvM1yuXh1DIs2hewVGz2f5CbeibeiIe
 z5T8qxoG6mv6Aoo86q2moa+FayPv7APmStwjp0JO7wcwpF6ImqJofzRTgWSI0xHYADQIrW4Xg45
 khqk7Gi5g04JcrsEdrCxeJBr2o6B33DY1i8YVYJtLPIiMwEMIHJQpmoey3rcQa51dXYLLhRzNf7
 JtzFISsxX9Y+we0xntGEfHLrlV9IksaLkdJywp7taS+llRHfmenDr6dXPf1DDdzVIzeQ5NnVrCG
 KQUg1Bxtx7tEFtA59Opo1Wf+DuVGn0sQ9R60d2B1MqM0PS3gF31tjpaEqOIrAhiQ43Ug1rQhNbM
 cltALRqh7+cnkdMLiVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070099

The currently listed SoCCP and SoCCP DTB reserved memory regions
don't align with the memory requested by the SoCCP Firmware. Fix
this by updating the SoCCP/SoCCP DTB memory regions to reflect the
memory region requirements of the SoCCP firmware, as described in
the Glymur v21 memory map release.

Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..9ec7c256b80a 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -602,13 +602,13 @@ spss_region_mem: spss@88a00000 {
 			no-map;
 		};
 
-		soccpdtb_mem: soccpdtb@892e0000 {
-			reg = <0x0 0x892e0000 0x0 0x20000>;
+		soccp_mem: soccp@88e00000 {
+			reg = <0x0 0x88e00000 0x0 0x400000>;
 			no-map;
 		};
 
-		soccp_mem: soccp@89300000 {
-			reg = <0x0 0x89300000 0x0 0x400000>;
+		soccpdtb_mem: soccpdtb@89200000 {
+			reg = <0x0 0x89200000 0x0 0x20000>;
 			no-map;
 		};
 

-- 
2.43.0

