Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016016;
	b=xp/LYODzezl0QmwVVUlZ6b1YdDU43NRKu9B4VRTbb38NrIQ5z1hHNuaFrzm8pwxcppg2
	 sy6G3HyZjWBWEqFoW+N0NM7Pk2wdKun1r0YsUR1Xm67XYOyDXDaF/eg0KNlrkPBmazAN5
	 Q1ZquOU7ro9lrv3kL3akTwblorWRvBg18SOG+hf042X9+qguv4D8Ebjg77iwRmbhe/qZ3
	 YvideoAUzj4yug/vPi/D2IYkkjTBaOt0GvHipfRHUHFv2Cjls54A0OpGTjL3q1ulD+byV
	 8Acaz1Y1TjkD/ewUYGFZWobWuqttmeGSEpH8X7UROTRpDPuhrYhSLTWgS4MfmoYjqNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016016;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gcrK14QXcprLb1eFWYrCgzQqBs9lqFBI0fblmJ2i3k4=;
	b=eSPhNjeDHOlkAT5aHStMY1MMcub4xyNVNdkGOYjOdt9Lx7MmSCeGtz526pZUQDjes93D
	 2fGpmhb4QygA5ZZ2FmtwjJBE/Q7QI09RYNaMpxGZqSVI6Mv7e0qkbMZPcFo0up1fX6gyu
	 N0LCue4vMO127QDamK4neK8zh0z5s3+us9yGcvZy8xE/zaUbow0f1NJ94TygWmBR9ZMcF
	 UO/G8QTGbjrtnuxCS+PWTk279G8jowT/CRp/gexsjsqNfoYwaBSbOWSJ1M8xxTOlN0EVx
	 +wBiIbr0HtrC4d/pm3rUlQEiaQWpdUVhSLGGbIVK4Bz0EKSPq2KG+V0krPIsSBRQt5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CxKwjpkN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FScE2MRz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B5F606A320
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 15:33:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2B5F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CxKwjpkN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FScE2MRz
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIDQO8b1928671
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 15:33:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gcrK14QXcprLb1eFWYrCgzQqBs9lqFBI0fb
	lmJ2i3k4=; b=CxKwjpkNnk+PLK95plkeuv2Q70+w/UHQs98aV9MNw4JsOOdJvKy
	E74BfEn/uUZT27Me2YvyfKHnF8LBaDtWSNrqseXYgn4rLjf+mkCdB2N5vebNvAJz
	RHVtPKQ1D5zeTvd3sBL4/epKq3haXaAWIelxA6I8+B9lxYdoHP2KA7mEsiRfZAvR
	X4aBfcArZvJTNfVz6Q0FSlSRNV0YqO4fzzH7xlfmF0aSn5YL6haua75HEgDF5AQu
	Px6Cb8wxJPQKJZ6CiIK+IHzLCppSAtM7KmGVosgX1U85Ycb2Qpg8AKlCdo/9zwLw
	M5xVNyteu3wpEPNeyvWOAooKrj4ll2vwHCA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8bs2k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 15:33:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94960131befso192848185a.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795016014; x=1795620814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gcrK14QXcprLb1eFWYrCgzQqBs9lqFBI0fblmJ2i3k4=;
        b=FScE2MRzf2qV7DvJdfNkU3pWI4Iysf/jCXHVQT2wYjiqbSvXhktQ9gMglN5ZYB71dN
         YqhGQF6oANO4Y2Xo0szMSWcygN+2JI+JeAzOZZcqDy1Mfswf0QTpWJAwVnZcVAhGwY/l
         AqDsD/JVzx1CNuxXNq+tbjK15UTi1lkV0WsJMdkenddNvq2F/WJhgxB49i0ob7w/1FMk
         AGMz1CS4m2AltxXBzg79ruok05eR1DFWpkQLZh9wgh0r+mypmbGAwfggQudPoVpPBfII
         CrUh7s6PkH/BCZQcv5vKVQaDBGro3KkDjERV9GJUzo4xBCDy9e/A/JL4c4UIdUThDilR
         7oOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795016014; x=1795620814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gcrK14QXcprLb1eFWYrCgzQqBs9lqFBI0fblmJ2i3k4=;
        b=DVyBzi8t5tvVZLdfGy1rARzhWle1MJvJOcfTu3IIW+8VsX3X7A4IEmHSJuWEEUgpCw
         yXgluEW01QbY5X7/hqMoEe8nM9fFI85i8Fh4kroDQJr3yleyG2kDanwwZVMqJ80KFKdN
         rffgqebuxh2oskp/I/oFkq0GprbcfxzMXKia9h+LV4TrojHlj3zUbe7DmqKpFBeibtc7
         ZLc5ix8lF2XJJoohxwVbjlvIN31YCrvP3FxfwZmB14x3pngjRjGoeeonAOkr2Wk5V5Z7
         zdG1vU/Ecb7vpoKj0YG30bA3Ud6JUAuutaVDGXlwC444c3jkXP8BKiFmAVVS8INe7zot
         Jmow==
X-Forwarded-Encrypted: i=1; AL+hErGBW6Fs6lTgFyItHnfP/dmJRiHRgLd07j6PZ8e6wOg4AJdjzkeWETPAyyowp6lcucF5iiAbGw9iV0vl@vger.kernel.org
X-Gm-Message-State: APuU4Z/+3mZTdLNupToNfzg1MDQmAeux9/fyQMyD5fv8dVaXZYhdVtYp
	7d5KiXYkObriF1ppFLayrtZr1rG4K6gwOZTxgnsrpZ/h3BhlgOHE6oxlaxgsHtcFlRu1Wl245yA
	sUuCl2NGNjkElxACb04OdkiqzfQ845Xpu08W1KQrYieUm8XRoMTBxtX1sq11DhLQnMHHZ90m/l1
	Y=
X-Gm-Gg: AYBFou1RtUocPepWaNeLupYpVQyyNI/QL02AKiElZoe9mCylCf7SY4jr2jPJCigw38P
	53SynVoxJjpymnGrrRi/EwDy45seldA+OgXPTZKlBq2CbQ12d3nCS+kDGnCUDTH/wXlPBu/IMtN
	kT5vAGzkR5BHAnonpQsbs/JFbB461iE/qKmUbilnIQtRvLREAO/IszBoym0cVMT24KRMpFDZpLP
	J5gP/LWZ8P8sox83QWRVWO57qwChAtLFY8FuF2zIAskoPWQJGuUtpS9JtQNYg/pOLOS1ZesIeBu
	sZxkt9vp8eN52BO8gLp4SYLdCv6Y5arJlecVhXn/K/Ln9yBy0cIJFjMYoOPfpu8KDdPmcVmJ2f4
	MMc2y/E5CJiXqEfSedHJERf7TCy9MKlKReu5U0sAwTODgx9EQBFT1Lv1X
X-Received: by 2002:a05:620a:1a0e:b0:949:7c43:d567 with SMTP id af79cd13be357-949995d321fmr526674085a.50.1795016013764;
        Wed, 18 Nov 2026 07:33:33 -0800 (PST)
X-Received: by 2002:a05:620a:1a0e:b0:949:7c43:d567 with SMTP id af79cd13be357-949995d321fmr526668585a.50.1795016013174;
        Wed, 18 Nov 2026 07:33:33 -0800 (PST)
Received: from t14s ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2aad96sm61034995e9.6.2026.11.18.07.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:33:32 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: Fix touchscreen power on
Date: Wed, 18 Nov 2026 16:33:26 +0100
Message-ID: <20261118153326.12640-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: TvPwvWfFJyTKyLttsz4hDyZq1qovsbSp
X-Authority-Analysis: v=2.4 cv=N9u8hG9B c=1 sm=1 tr=0 ts=6afdc54e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=rYM_yondQcVyUL2waWkA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2MSBTYWx0ZWRfXzaSD2TacDfJD
 fhKwMJBZeqSIoOIQWgwFMnGI9HAwTL5+mT1w3tt8EL5KaIMMKO0EjIbbmzjUPPYN4TeXQK5BFfk
 yc20L5zywRknxOBsu4nH+5rvwBnik45zW5JxR8j6ilZYeQO7/iIkxzaejN0vKBLTwMb4Ef+PC8b
 ELoF04IuWy0yQJROBpP3jfHHcmdVxsRpsBiVmrB91wVRGf7S7bCq71hZby214Oea4buzjEqvag/
 0T4YsXihyeUKJ+uMN1SvYAwVLZ7xgccCIM9Jv0+5u+lZ+HXAfTY1VEmB3JUKWaZVChuPh/PaqIT
 EXVQYKibEgkfEDdGwrNOKv3BkX2Vpc9wQxtAqU7dxmbs3GBjZYT+ojVJhGwy9JYFL9uxVqDf0GQ
 VTRPPkp3Cn3ZqBRrxL9ClnH+hzBBkjFI9d4jor/jO6lWXApHkAWQt+gMeVV1MKJq/EW/bgHiqn6
 gk4jUUDjazJ2HyK4VGg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2MSBTYWx0ZWRfX6x1AGCC8UgTq
 v0ZSd9M83J1U2Ot4HGigqHHbG+s62IdcnWjszWJNFKHYyQ61BRGFj6xFPBlWyrxtc09DiZ777OO
 ICCvgu3FZSVw3BYGtt8reZ3DvhHaM8c=
X-Proofpoint-GUID: TvPwvWfFJyTKyLttsz4hDyZq1qovsbSp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180061

When the i2c-hid driver is builtin the touchpad on the ThinkPad T14s
fails to probe at boot. When the driver is builtin the touchscreen gets
probed immediately after being taken out of reset. At this point
the touchscreen is not ready to talk on the I2C bus yet, causing
the probe to fail.

The touchscreen on this laptop needs a delay of 200ms (taken from ACPI
power-sequences) before it will accept I2C transfers.

Add a post-power-on-delay-ms = 200 property to the touchscreen DT node
to fix this.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 7c9424248120..16b25e596f0d 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -1349,6 +1349,7 @@ touchscreen@10 {
 		reg = <0x10>;
 
 		hid-descr-addr = <0x1>;
+		post-power-on-delay-ms = <200>;
 		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
 
 		vdd-supply = <&vreg_misc_3p3>;
-- 
2.56.0

