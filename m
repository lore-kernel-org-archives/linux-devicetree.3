Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996FA3BAD88
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784622370; cv=none; b=uZ5OSzxxIMpuvWFhgrHkgnCKbT63Fc3NU6rec3zkt0HDyQ3exfkyWozkA7JEG8p8XeeoXV+cNNj4peQz7D1IMHNkThKDV8jVUtQiFKXojNmdw+bD7AEjyyx5RoitkhBHPsnEbEEeTmxGeU2ftaNhpsOVKSG1iMFJPEnM6AGKPzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784622370; c=relaxed/simple;
	bh=/KwvzVGcG3nM+jk2OJ9JEwX3fKFAmDhGAhJvyuTI3h8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gbfq9si0floSws193iC5VvxuYrkXbnh5hAWDXxmlbrg5VHS+f8ZUoExXH+QtNw3D7VcRErWk57Zu8Ujq9viX7Nz1qfSxUVUV0e0xuNWwf0423lHV6gl998dbDKgeA9VtdH/4eSlzMQK+3Wd0ydqjsd0g43cnEcMlLHBJZBUpQSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eOCQDWoh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iJaTjvuo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eOCQDWoh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iJaTjvuo"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L6T9fv4151354
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:26:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6ceafmubD3z2hNripLdtNQIg9SXY6J/piHZ+7M7crFE=; b=eOCQDWohh8Mc3bjo
	STTq17E4e+S+vMahxtoZ2fwaD28gs0psPN2IZjtvOUELE3/u98Epo10YpbxtBgzs
	GGBPsNPYyozLeR/LMtxRX7BvKVQWCoNf/OMiTRXyhj3UPUPxt9+dEu2w6dENi0+M
	Kvg/wlTY+p4MIc1fFmf/WRdz5TMqhNUHWjMEpRKyk9NvzZrp4fTD30kNGxEUDrDz
	1arJgUQwfmtTj330uKBIX0KoITociwiZTvjCC6npLboCFXaFXQ0lvSyXCth5dxxz
	JR9mKuFTEVUVAsUMAOwCXwhustKLvid6aGjhCEdUM3mCiRrs6dzoqFGl5SA9bpwt
	3sDm4g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqff3cf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:26:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174a23afcbso95079571cf.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 01:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784622367; x=1785227167; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ceafmubD3z2hNripLdtNQIg9SXY6J/piHZ+7M7crFE=;
        b=iJaTjvuoJTo7L4S/1GyrBucMD096znqOmKmzInRG9YH9xAnjgVW0ZltoGDUcnTweLm
         rFbtXIZ04Fitl1pQ+p/OirrDjxtoCGV43h3IpcsUo4QwaCmR9dzMc2xq0joNEFpd23ha
         1crhvTFpqaA4fj5KRhX/pHEfR/oCiREimwrktMpjlboVNxPlW/swjFDAWF7qyc1O3HKP
         TEVhfv94PoImnKSvYyIPnAWz1XpsVft5l97+zOfHQLG617/QL66hDc2b5GkN019zjoVI
         i+FPta7kybzlxScN1f6k6ZU8fAsI40V/8IEmvrBoyB8Sjj97T75ItfgLMIHY4OTRbnOh
         8zBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784622367; x=1785227167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ceafmubD3z2hNripLdtNQIg9SXY6J/piHZ+7M7crFE=;
        b=gV4XPL3cRXIrgJB9+ZntKGGsyerAiABO7EH23HJJzp42GZ/ocUy2BwcTArUvUfPzlG
         FfnQWTp3WsG5QeCoVT1oAHybacS1jgi3UGWS0oz4su4JNNvQgxCz2ojAwMxoC7VfcL/C
         80/gEG9lcYsIrouoevdOKmztaL+bTIiwa7FpzTmZoCWrS4bKc31fqKnaYbs19tZOTABr
         YcMAfN5gdz0Ty95SIz+lmlqO9nneKRq964IgzCWGARsnh3CVBBUKnoxE8mSDFxoK9+Qe
         zhteMIO5qDKh0LYM9pJwdjhIX4+rOGWZi0dqwYVuN356isF6bOGGV0f/LTARh1XErdBG
         B5sQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp638+2BgSqMRP1ToN78E379VnqhvQBvxxkX02CMEx6hJHSKwy8Og4uhzqBKCOPVr5n2e1q1lkXN5In@vger.kernel.org
X-Gm-Message-State: AOJu0YztgZjYNKMrPEti+549KzgmgmXBiT8oEMU/BczrSfK8dx6JOgQI
	i8oyh1NLXz85XOWLY51XEXA4sUWg9QnltyWYBMJesrhgILJ4gKkM9ZzoDV7weG0Ke1mhTaLrwaf
	Jkodh5WqAtHTAfsTmZm2+4OtqIG7QagfNwz7Yc5Qq8owWMg6jabjh9XMyRAX0mcrHzxHIzfa0
X-Gm-Gg: AfdE7ckY64xk54OMtmfpM5ytfxTc93pcgfUVsslCtjq6dHHvjaUWcnid7d62W22kB1K
	QWNGzsv50Fj5gh0Bzyg6S90j4GJ6YN4C3hWVlB+uXaU+jhmRKsQvJZGtiJwLKe0MPcAgDMrbK1t
	ciyPqh85cKoRXQfb7MYhaSrhp53jhsjI6utDYqXhb1GqaWIgsh1vqqlj4sxDvnNhot+2CstcPcC
	mPfcb09F/LMXTmWArEK2fZl9CwIM/b7yCSYqFAeskzUbYOJOvM27ZK/QvV5rjLp1TsLSiBY3FcV
	fKzCVMw8oiPA/xeBewTYH4Xb59x1K1DBrt202cdE5fkr3/lwqu+jKlQoqZ28mu7SW66+Y1/YAvz
	DKph8buNX
X-Received: by 2002:a05:622a:118c:b0:51e:b884:4241 with SMTP id d75a77b69052e-5213c7e568dmr149757011cf.19.1784622366619;
        Tue, 21 Jul 2026 01:26:06 -0700 (PDT)
X-Received: by 2002:a05:622a:118c:b0:51e:b884:4241 with SMTP id d75a77b69052e-5213c7e568dmr149756841cf.19.1784622366129;
        Tue, 21 Jul 2026 01:26:06 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956537c7desm66664595e9.7.2026.07.21.01.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 01:26:05 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 11:25:50 +0300
Subject: [PATCH v2 3/3] arm64: dts: qcom: eliza-cqs-som: Enable CDSP
 remoteproc
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-dts-qcom-eliza-add-cdsp-v2-3-e1e52bfb3c12@oss.qualcomm.com>
References: <20260721-dts-qcom-eliza-add-cdsp-v2-0-e1e52bfb3c12@oss.qualcomm.com>
In-Reply-To: <20260721-dts-qcom-eliza-add-cdsp-v2-0-e1e52bfb3c12@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=870;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=/KwvzVGcG3nM+jk2OJ9JEwX3fKFAmDhGAhJvyuTI3h8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqXy0Vds045FGgXsGyL15/7AALBhFE2K0Kf1RvS
 S5xjDw5d/iJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCal8tFQAKCRAbX0TJAJUV
 VvhcEACVzANY/gJKbGcEjnSidaLKO/NzD5GCXL02r1oWAF3lNqDLp25/XpyQbkAbnBlaV4CtM8t
 3+LH0NvN9G/IQyU4oy6Q0jxyPqCRDqofE1LElKyxyWJlbRsUVA5jFeQzEMDucrr8Z9Y+OMt2Cd4
 eK6clfm/ER43a6Dh+hRcdG+IzGXxxCTN8JqYvb7zlKyafdmKB7yZGaAwjBfnRe0BAVks8GzP/6M
 X2qtpsPH4svYTgSrOY7FLM0hZUYn1H7Zgpb14zosAhoGisJ/xxUgbSkIcWQkPlVZTXAF0fEd7YO
 j4jRdso3KGTMYPsErQYIe4so0I42uDX3wLaFk+uOXKIhSzzL7GFXwZXt/NW8vFbjCOU7oIK4jez
 a64x68UJ020Osm1QU7CZ3aljJWfFWrODx0vb4XtwRHqNOXHnDuDQhMhJQwy2W0YYJ66dAwnCBjk
 VbeC06ENKbI6ve6oTdI8VCRJ6YE8XsdC3Q4hBfXhENrt8fp47yuTHbTXiKDPs2aq20USW7j6yit
 EpEVjHBiC/rKk0UT3HiTpB2Dqi9OdhkH8wDmSTymGKrMSivOVSFmvcihXqI7nnec3yZsIfWua5+
 QyAIuh3GKvywD2bAtsKK8v7nkM5RiGe29KjDsC6+1KGwg5fKQZR6fQMyadZTG71cx/5BqoqeOr3
 rLl23LQcRXTKAkA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA4NiBTYWx0ZWRfX8ejMQKf8SW/Q
 BQhqI6FmdsOi02P96SDkaQ9g2Agzk+mvJVzFadRf8tUa+LjuECx9kxEZwj2oPZoUT2kBhSh2e2k
 wvO2aRkT+GcLrV3D6QX7Pi+XDdIP25s=
X-Proofpoint-GUID: nujf-auupZm56QeJlBAwVFxfLF1uIOdF
X-Authority-Analysis: v=2.4 cv=FJErAeos c=1 sm=1 tr=0 ts=6a5f2d1f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=27Bx3adQT_mWtQqGTPIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA4NiBTYWx0ZWRfXwqKYfH1VbmIk
 YGWEvYS8Tg5I/iG8OCnMBfV7QXXFBxAdyfH8xYK08Lm581ZEYLpwM+3M9+MyjYJiysPnvqmhSD+
 jbpyeawa+MZaH8g6pC51WVr9demirqj8U4xHwWkNK7fN1kXgDvsBY6jC+YH2yHxwev3gyyq929a
 T4UEJffnWhFOD2DENy72o3VW1FX8DOH4AyW1LvJOx+6LWLtPBoyS7vdZwj7TZSd9oBw7mQZRlqL
 BNDexzFmJmbncBMpvL4bhoW+m/EUtnRmOZMz/48ZBYoQ5Tct7X3Lw21lN2S1uoSpI2MyxvrJIZb
 1irmMPq6Q5cbpiGCsnU1o6AFSPrXT7sRrbb4GtLUgZ9LcEju41JagMXBy5Fxm1EObKHmluiPygb
 B05edmecF13g3TJXHxLdKIs2R78AE9HkHH/gwJyUnvbm0AnFg58GLU5xs+i4JkEUDQOYDLMuUGv
 NPZytfBUTV8dNSp4f8w==
X-Proofpoint-ORIG-GUID: nujf-auupZm56QeJlBAwVFxfLF1uIOdF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210086

Enable the CDSP remoteproc node on the Eliza CQS SoM by providing the
firmware names and marking the node as available.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
index 318ae3c22351..d31267968cad 100644
--- a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
@@ -376,6 +376,13 @@ &remoteproc_adsp {
 	status = "okay";
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/eliza/cdsp.mbn",
+			"qcom/eliza/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&vreg_l12b>;
 	vqmmc-supply = <&vreg_l1d>;

-- 
2.54.0

