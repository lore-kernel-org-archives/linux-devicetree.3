Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EF747798E
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842623; cv=none; b=ip1D+IpQUjunIBHYVQU1XuMWVlDAB6f1Dq/Xver8EUEBZqA6mJwV7fOy78fdWiAZehRnksYSVjpJPk8AAKdUDP22gXeBNQniPOJrYnj8TjoLQFTiQ6Ja+VKcafyXQ5T/cC9wE1ITxSgwJ4GORX/VKGpW80AoeIQ+kHm2OhpmmIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842623; c=relaxed/simple;
	bh=dicEJZtLq6zW0VUaiQ1W5EgO1yN4WYL6q5FtmZ8EKdM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NJaFAN5rIGJNeBKVaz5ICp7Bdqxi87HlYWcQXZVIYCmEbmkaVcHS6tNngvesQSCTGxKaHFGso9PZEvFufZndZg7GxB+FcK12mMe+G5V6evcfLNLuKUc0bc9IJOFylbZkzS+dsewEKcuyHCxYb3aBqszXOVp6JB+VoBO9s9Z43t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AZ2H+8oo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HoORg9hr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AZ2H+8oo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HoORg9hr"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5Cb814008231
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:57:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hyGb0UCYPIrtzlYMMFqHwR0AZmvnwPLK/gKxBVnW7aQ=; b=AZ2H+8ooF05v7y0H
	xIgCR5NIb4kQCvqRm6FSHP9F5S6SwrUKUG4eG0aLrrhhDVnUQgnh2S8u87N9nqvM
	5/LSusG5va5ZHP4KxJSl9SqopZOFX5nWAW7U+wQ2y0VXXDdpuledHSVvhXdz9ije
	00uEZLmceNL9dWg5Xrqx0iGUNDUEjyafba2R+0muoWfEq6bhnkehM3tiojGsKx53
	1HcZWV0/2QMh/iRNwHZUqGu6ohzSBodZZS7dl+9qf0AIOHJQhdodMRiar6x/VHUT
	FskwZ2DUqbyJhEmxWUb+S7YxUsPAhAgii634IunxvkUQ1kOBq3vTizmH1h+iyhoh
	OFVcIw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1stxr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:57:01 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8b7e68098dcso212094576d6.3
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 03:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842621; x=1779447421; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hyGb0UCYPIrtzlYMMFqHwR0AZmvnwPLK/gKxBVnW7aQ=;
        b=HoORg9hrbOgIKho/a0RUMyw3Ip4CcqSYl/TXHKeXQZjHx4AzczYYl/68Pb+RFyAbAX
         3sL0Cp5WkibBRpY19+3/GY8TzkD8bk9SaC9fpD/pJWJtU8PUX5U+3qCl1gFgSrcYiLo8
         jVrOrRaNDj3sHUpsSzow0HzXigQv0plEzzo2OO3skQcx+xuhvcIbzTAfBKvz9/Bn6EWy
         jOw1Eqt1XmSY1QWSGXuHuz4Z1w9IUZadlM82bIE2kluJKQzYTc3Y5gmfw2HYFUBMFkzW
         IUdVbzkw1JfwWl9kmcOmz6J9PlYXFM4LEj4FNgCUhOEbBkPF0tOUr5A4Lsxj5nTAseld
         HAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842621; x=1779447421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hyGb0UCYPIrtzlYMMFqHwR0AZmvnwPLK/gKxBVnW7aQ=;
        b=S9TdWAiYkA9YGVhXtt+/vPsDE7LMixnj6QH/d/QLSSUOwOht6Y0gGJVTjRHWfEYScm
         XrK1UeiPvzb5cIq0xn5OUqsVLfYVuaeRk3s9N+yognpSunwnKLojq9igXCPKp4mxsMaL
         SvTbnB8Jb5pYerJCBGmnRVgs1c+KKm/elWJ/AgxQqeh/IYagTfTUVB9ktN1S/AVbGtHg
         TTMxxCN2vZ/R/3rs3/4yvdP0SAjKcU1r3GlJJVpibD/K+rliKsyDMEkM9Xtpq58ASaTD
         elJzyKzIHoyfOOzDGAMe5ccTutQqzreGI/yAjCJgHtD59m9BA1KM/IOVifNzRwVsKhoC
         O3iw==
X-Forwarded-Encrypted: i=1; AFNElJ8XNLbPLtpbmWECzvK7EOOtbscD+yiyzD/PRW7P7aOFXYjSVWV/+2NRmRFxX7TNWr3YipgyH7+ZldM+@vger.kernel.org
X-Gm-Message-State: AOJu0YxK0mfoIMimWcIw+W6B/jyG04l2+DWlmYKI7CABVnyAARbeGcWf
	xDBJ6SJDGdBkJWD15yJ9+2BbmJwq60KpBLot+zh8Jq8ibhjXFWH4Vn3jHdW2Sz47+4LvGJG7W0b
	vp9T/jw4M1jEwQt3wzIXoDwqOpVTw9tIYPA6cYwg9exL90dBU9isFlW+qAr7q41cJ
X-Gm-Gg: Acq92OH3m7VJX9OkSRHLMTMthvw29sLu1InFDOGcLsRHhLrMWQlMFYTJerT5d80y1n/
	RS8Pdll8E+nlmkl/So1Bhb092qJu22p3IgT498BpHUjGe7io8er1Uyi4X2IT9UP8J0gBz55wSBv
	525k0S15QEGs9Ttpm5M9B/khALb3HyJ+kf+sVs8tNi0kcfe5J89j2dG5Qt7K8zNZ3hyc9ZVMy5I
	5Jk5Z1xVM7ZiLBOWi+ywe2KHwOtRul3htNhZPdV+jiXfDxqX0n9PaZrW9/oqkfYLGs3caTrMurf
	4fB0+oDrtX8vWJWbNbbtSILchpv2Vb3Mh83mYIKdPE5N/3Za9REaJBngoMrOjHyTJQMLDz0GVpI
	vC27NuPM1baEN4lPlTl2jPPI8MEYACZT4qU7SuUGMJ8dz9s1JLjzJ8v32TyTodFprcy4R6xfzJm
	/eY/8+2XUHreoc4yYBroGQy/C8r9NWc6PAhnE=
X-Received: by 2002:a05:622a:a1b:b0:50f:c109:b78 with SMTP id d75a77b69052e-5165a27f690mr40192241cf.60.1778842620587;
        Fri, 15 May 2026 03:57:00 -0700 (PDT)
X-Received: by 2002:a05:622a:a1b:b0:50f:c109:b78 with SMTP id d75a77b69052e-5165a27f690mr40191891cf.60.1778842620122;
        Fri, 15 May 2026 03:57:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a91e2b6db9sm1240195e87.84.2026.05.15.03.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:56:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 13:56:40 +0300
Subject: [PATCH v7 6/6] arm64: dts: qcom: sm8350-hdk: enable Iris core
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-sc8280xp-v7-6-2e21f6db1897@oss.qualcomm.com>
References: <20260515-iris-sc8280xp-v7-0-2e21f6db1897@oss.qualcomm.com>
In-Reply-To: <20260515-iris-sc8280xp-v7-0-2e21f6db1897@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=806;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=dicEJZtLq6zW0VUaiQ1W5EgO1yN4WYL6q5FtmZ8EKdM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBvvx20ibhcyXL3eZcWWuS862Er2vFjwSodOzw
 Rahz938nNiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagb78QAKCRCLPIo+Aiko
 1SQFB/9tiL/qrkhwOb3ggfuT+YKCjJTR1YzIN9iYUzD7LPZ+DsO3kc+bifc4Ors5cDpUp45NIRh
 vjkFA81yG/FB391tPyGcF+blLaquDo6yfXm5c6b+Tc7kZ2O9DIxXlGELpebZK77/N11zNSHXgz9
 ygizgljwa7w6hxMQp9btwKcrxjb2FbZoOWHWJ8olX+XVJPEigsbstgKpbAKfmrLhFnIMTg0S6tv
 kyefLEzu/K3CWG0V+vwic/3askgMcHfqHMqe+C+ko3Visxx8kW0WSrjyHaPO6RElKcVBUAi0KYz
 9imM2Ipok2t2mai5FARi8SjOFNU7cl25nOuufJua1fLH6ejA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: byHqIK1z1KCJEe9V94y-H-TUigw0AKFd
X-Proofpoint-GUID: byHqIK1z1KCJEe9V94y-H-TUigw0AKFd
X-Authority-Analysis: v=2.4 cv=cZPiaHDM c=1 sm=1 tr=0 ts=6a06fbfd cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=6kKVESMuOeKZ7y-A11oA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMCBTYWx0ZWRfX+wU7CFVT5Y96
 3wpYj6LU3vlPTS+ruq3VmGanvtLPGIslg+YZtxMIQJdomXvcJu+OPFEKqiaHYyd9JR/K1x+sT5h
 eZei4M3hYGQaRZwVCXs+SaluftPfNg+dCsWYYFP+sY6vgJDz8O6+K3a2ddmPCCToXD/NjIL3Gn1
 B51nT3qEQl1klz/wIVgySCc2BBagsIDpu3bmFkdWysY6deswxISuVvtS3YsxlBsQ9GRmEY+4bgo
 rEdJOZoKZnQB9XlG0EY+RFOh0EPlHUmAHjIu3tHpVAfVNpjKufwXLANxh1sRuSvYgDf0by3pEod
 u/b4fgc46GYy5WKhPyHTWYbcju4w6neE3mRepXHF5HGdCujqK1cFZ4KouThPafCfB181RImUrMx
 GZlJMAN6fanvwtYbVwHdokGGTk5A5tTFkBihfGAu4HtIo6l8kZ2PM1BylW7yr3nWajS/gJNM3uR
 7nzSe5nPNpj+19927NQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150110

Enable video en/decoder on the SM8350 HDK board. The firmware is not
(yet) a part of linux-firmware and needs to be extracted from Android
data.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 5f975d009465..055fc8ade85a 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -472,6 +472,12 @@ lt9611_out: endpoint {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu20_p4_sm8350.mbn";
+
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.47.3

