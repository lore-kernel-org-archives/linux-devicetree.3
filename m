Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794670772;
	b=dKTHFeCik2x/E5a3CFS+9Bq74rCCZurlz6v3mN6Fq1/ebgjJ/UjTvEe3mmj9/QGCZWn2
	 grhl65gU7KKLLdG+mrC5t5tSgnbtDXcv13BngN3D9WwVx4SgQPirJxBE/sc1kT7rqpItU
	 RDK75h9Ge3liwneYrLtBcm142POys1VYN/xZfhqhpZg8H3Xz/dwudvaFgx9VcVZ8COKYy
	 MZ5gNLjTYr6hYZPj9bjtKTKtuOGq6xM2J65MWGfCy05kK7T4ImAaCBpo+DHHanx0rZGHZ
	 87tiNMwEMB1+xGJ3Zx2KjPx0CczJs8gGlhtS+JHSKNb2pziSqRIVK5SPXQ0UP7cmU9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794670772;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=K/0f/Fx9dcCRSnODkYtK3aiTY3t3xedC0JyO9Aj9vBY=;
	b=WhkKyAAnBjnoEkMfA/FHGJmVlEfK5MX1qXsofacF3HzCOy4PJ6SGElLyijx/UQtLKNNv
	 bui5gfl8UOinsQICt1QFst1mTztVISwyGrpTrRvSoJzMkht3By38XyMVnmjz52Gw4qZ7U
	 o9mzQiTF5mj6SOMquhPLp6vEs73z/R//D4Q3qS/ipahrHh8s5hXrJiCyF9lsIVqYL+1i3
	 FizImOep6xJywHa3DlaoPV5wz1pQHONUJW2Auc5NCdGjz4IMiO7SCIUBSt2ht0OtgFwYb
	 TcvldC4joLVuapee7eFquedKGeuLGj+wsZYsE+XS7jDayJKj5GHrE4F/36Rbots+NHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CdQYFmAN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ckjtQ2E/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E819460A261A
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 15:39:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E819460A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CdQYFmAN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ckjtQ2E/
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDkTFD640570
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 15:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K/0f/Fx9dcCRSnODkYtK3aiTY3t3xedC0JyO9Aj9vBY=; b=CdQYFmANNQYaiL39
	Qs3rz5EFvtsph67c3HwOmOjOgk4E3mZ+5zvqvcHZq2FP4R4vdwxYkSDkWHNkAJ64
	RbuPE/xRu30gyYNW74rOXAGinif/Z2JNDoAPQFnSx8TdL9ws3qB/wdb+HB6YcDZb
	qNwXlCFfqjtbpUspOHmUvjZCLAwR58MeNrmx4WbYp6DQKrKLkNmgIP0ZQ+z5Cn5m
	RNfdM9QLtj+gFohFJeiOMPiVkSXYmyw3VnLApTnxR3rsDGIg5MOxXVa+lAgnooGn
	Wc+pd6o3d4q+/v3LoCyg2MK+IOcc9Y2EMpc3SQHQTPMIEn+YWdcPviTE161ccE7I
	aoIaHw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmah2y1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 15:39:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94960131b4eso87776685a.3
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 07:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794670770; x=1795275570; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K/0f/Fx9dcCRSnODkYtK3aiTY3t3xedC0JyO9Aj9vBY=;
        b=ckjtQ2E/L4Srvl+3Mz93nK7kXVRQ8DbtOnrkTf9RMtoeqPlj3k2KKb7/GQefHmAzMI
         hdrp+ohUMyY6ci+CvJHsKoqt3fVjhwAJW75/PcToTUjdv85s711mG4gQHRocO8wPbSJp
         RgvKX8BYJPV+PPv7laeydy8vTnIKlJkBL8ZB0D+2/WpcMKd0tnYaLjr8lcGK508ogJG+
         +HjDcOpSXMVGl7/UZEUEkl5mCF4U3hRpukupHCmaSxFwhgfUvtQeG1nJ56JllZZh31Xi
         GEqEV/va/Kc2xQLLUQZXAtyF2Qt1kdryq5YS1KCHDIPCaViRzcIkmrthzr9F+39rLc3d
         kYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794670770; x=1795275570;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/0f/Fx9dcCRSnODkYtK3aiTY3t3xedC0JyO9Aj9vBY=;
        b=FqqNPxG1IM9AcNudG8YZiNDdSF/AM0q7VsB3FWkd3bt6IeBmP/6G64ULppHaZQFM9G
         BA5ksjHZss5FpRTrKhw4PczMNctjC5FoET5LY4VnC1Cs+3TolH2aPQ8ohFX3fod2vrlG
         XYxP6HVjgog+NnfmEACLFNI45ptSjVqnztsoTylTgHY9x78LDktJn3wDcQ32va49shNU
         iUqSzHLEalN21Xnfm6VxyEHNX7JndvjwelvT6MyhEG2bzQKdjReHWm6a80sC8zYvzwsz
         bDL/2wfx+dtONRjNrVsdiCJ661WFOk4M1DFcQQledghmG21z8Vy/LNo3gpZ2ZaiQqRq1
         46Qg==
X-Forwarded-Encrypted: i=1; AL+hErF+Smdq9hAQvRzhB2/rxdeCHBkvluE9iXlUZjDvBDEPz3ZCMU5+kjtmJ8DhJaRI3W8Av1QdaL5UZvyf@vger.kernel.org
X-Gm-Message-State: APuU4Z/sxzkApAWY1tKwFudFNufEbMBGmDT6EKFm8RzxQYjMdFs3iM8P
	Dpc0ze5NVlUwNWgiunXpmk1zpulP6eQI+fwrClV32JaRMbySujmAF2E9XpVOu9ohAU7EeJHo8sG
	XhLMc8PNX3epYB4+zYEHQoGjvg8wwJ8epcIJjsXxFA02v5UJ0GVeeUzVOn4VM9pml
X-Gm-Gg: AYBFou0KvDHYn0int1E5gdp0vsTe6cZ/3+zvO0XkGtD3LTZHb1h5gnCPAM1gzOossnN
	R9d7wEdC/9v1bRNEvOxKSqqhZ9uJQbjw1hKkPPjOvMOEUBMUJUY55JV3blxpx+WQfY0wYR+1URz
	Ev1Uaz/LfDvSI73a+5kvKTtuRgkoLtTuORa3MJ3J/CLmf1l0gOUnslABYSukqtYnNCAksUnG7SO
	T7gHgYc2hFeGkliskvKnqbHFZFgqwaGSBdfmAd5911a6M69oE7CChkDMbtx9BHAqe5O/euDPIrO
	PoLNuxt/BPgk9jGaaikSXdK4KBUXMv5muWxEaoK7fcg25WcVQ6zU1Jw38SDZrjzZXkgwr0HjzlL
	ZImKOu5VX4l3mkSIcF3ObL8wKNc4GoG7CHNzEibzqov4ttJHLghCam9ljvL1V94jSzxe/bNtHRj
	H9WVxBd4OkM9Iq
X-Received: by 2002:a05:620a:444b:b0:93f:2ae1:ea06 with SMTP id af79cd13be357-9494bb59a45mr995698685a.44.1794670770392;
        Sat, 14 Nov 2026 07:39:30 -0800 (PST)
X-Received: by 2002:a05:620a:444b:b0:93f:2ae1:ea06 with SMTP id af79cd13be357-9494bb59a45mr995693785a.44.1794670769898;
        Sat, 14 Nov 2026 07:39:29 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50a6c826bcsm167268366b.11.2026.11.14.07.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 07:39:29 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 16:39:07 +0100
Subject: [PATCH 4/4] arm64: dts: qcom: qrb2210-arduino-imola: enable the
 EUD
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
Message-Id: <20261114-qcm2290-eud-v1-4-b6157b817377@oss.qualcomm.com>
References: <20261114-qcm2290-eud-v1-0-b6157b817377@oss.qualcomm.com>
In-Reply-To: <20261114-qcm2290-eud-v1-0-b6157b817377@oss.qualcomm.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: HZ42LbJDU5wRk1i3Obbb8QnSmv4DtmfQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA2MiBTYWx0ZWRfX8DW2NLkQWGSJ
 0XIflZLUfFGoW8vO+BtYbB0kvl6ta3/0rxF5ap16f2b9kxlhQB2FXRfYlBXMLipXE5rsFDXwy5A
 JAJE++b3ERkrIhD69XF2uwv8CQ+JvjvSoN7UxOQbsS+QziqCgrhTF5O6+F1KOf74COtobiVpVH9
 md0Lp7SrXe2awvOW1a86Ycuw94VkmFzK12NmZaSVDh786v0JtWtZD1nCjZK56h896kRjU35UPNC
 0LSwwlK5phjsUoodtAHv6gbxSASH3qlPpuHlcG7wChd1SzeEludv+Wr/E9gxma2V72xhtao60u/
 toZMtHHuHcdgDrfjSp1gaDxL1uSKKVBHtQHyApcGpyB7YlP5ala5g6c9WhPzM3adwhIcI8zs5x0
 6DAdk5KqrsPu2rPZu0jwxLngDaZzYeJHQGMnYCI+85tgvNeXmpo2dgu7dRi9+5QtPw8jZ207DPE
 eXKNFOtUrb9QFfjZg9w==
X-Authority-Analysis: v=2.4 cv=NdhzRGD4 c=1 sm=1 tr=0 ts=6af880b3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=pvBjvzZ7d9aESBAnF-kA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: HZ42LbJDU5wRk1i3Obbb8QnSmv4DtmfQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA2MiBTYWx0ZWRfX8AZQ4yYyG7oB
 S/8fxdAzJ/0cZHu6ZlooiZXopHh0ObRXLlND7nAPhYfT/fzyYRlkICJy24GHLPxdyu1l4qK0TAD
 srbm7gqxYMarV1TzGOF4rbmlwjM2WYo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140062

The UNO Q exposes the EUD on its USB-C port: with it enabled, a host
sees the EUD hub and its SWD/trace functions, which OpenOCD's EUD
adapter uses to debug the SoC.

Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index e99d2a56dc28..a1af2caa5bfc 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -226,6 +226,10 @@ vph_pwr: regulator-vph-pwr {
 	};
 };
 
+&eud {
+	status = "okay";
+};
+
 &gpi_dma0 {
 	status = "okay";
 };

-- 
2.53.0

