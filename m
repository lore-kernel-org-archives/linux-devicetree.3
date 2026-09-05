Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2F03546CD
	for <devicetree@vger.kernel.org>; Sat,  5 Sep 2026 03:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788577517; cv=none; b=iPjhrj6r+s1AgFs5T6ShbzCpW6kNKb4gONC/2be84UG55zrSwTbcy6On/yBf7pGvUxMikRJ7h61K1lihcA0Q9qiLcJsJs0yGQ+iy9dp+CdxbkOBVYGvyRB7iGxyg13Ta1eJOlraiOGeaP38Malh+RiOW8pccFUEyLARCYxv4kx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788577517; c=relaxed/simple;
	bh=uGLcF6U/GWagHVa6Sz2Co17L9eojU1aX2IBfU2exRlk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qB9y5WzChq9nnDFH82shUp9PLySLY+ZK3mtZIfDVTfQLgJ9ATY9PsouEupk+7DAxwX5I9Zd9uCKkqgf8ehJNX36zAWsjRRFN7JKZENPIzxDrAiL26gdpFvze6HuLNhd4vP6eenKo+EEkZl9n7wCBkIRnf+GgQQmGeOr55bnEl6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ViDrNnWy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TbI2a3WI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ViDrNnWy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TbI2a3WI"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6852BlTc1414649
	for <devicetree@vger.kernel.org>; Sat, 5 Sep 2026 03:05:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=buhHNLxzpbcoVyoe89y/2W
	pJlQUmFm/zRGdNYFrGNQg=; b=ViDrNnWyhRr5LfXguj9P+QR2fzF3fyhVYiu3xt
	3fvdwpTb/BO5leiCZeo06FtdB3nqzzeFYJTs25XzzxjUphE0PHATvH0LSgMNekxZ
	fXEUtSDaA+wfXElwMS+ijL2OAznbDIVAw+7D/vGKLaIjw9a+MXbSS+GoxvGSOO0n
	OR6/NS21L3NB14DZNbzpflbrP44sAmIb1x9ejZ99S5k8krGN3uEmy38+pupYiJQx
	+e1v4g+xFS+WMLYjPfpT+ULBijqKB5/SFcNSmlga054DjphjVjXBg7/fWhzEkDmI
	rckKZTZ4XjYk0hnCZgn7GOhdwLJS0bdAUDWzx8m/RhOFQ2Pw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gga3703cm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 05 Sep 2026 03:05:13 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so2809209a91.2
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 20:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788577513; x=1789182313; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=buhHNLxzpbcoVyoe89y/2WpJlQUmFm/zRGdNYFrGNQg=;
        b=TbI2a3WIj7gtW+1/2hMz9lMYRpcYvdaPXlWRmrRXZp0b17vWS4eImYqNImDQAups3X
         TFHxMpHieLyZ4hT6yHZ1/XRwEfbAwevdxoEW3HhXZxzmhO7d7xWe4WE7tQXSunJyAotO
         dxmb+HgUvwf10pEDwVoHJovvc7+HAsGP0dCuLZzdTNSP2obyK8M3EFATqFPlLWL2mc7S
         E7v2KMTeRS1H+IQKyx2JE6OyYvK8jTb1j565e1TEo1q5/h9APzlQAGTQT8ZMu6bcrmLe
         0u97xHnmeVdNNcYFLV/esU8qNx4hEVsrvHU0elfAfDZXLIcdXnD7lkcWmLAQpK+FHVBN
         lyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788577513; x=1789182313;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=buhHNLxzpbcoVyoe89y/2WpJlQUmFm/zRGdNYFrGNQg=;
        b=a8NvKFxVxcZJ376O8RPjAZ48JJKs+NNjnxFwYgNzSbYv3JvYOCXH2VHSWp27RlabIE
         Rrjl4WRnvtLxIuKwG46J5yWMDO8MwQNQApA03x0Cd5ZaFpdMKd+LldpyE/4FZ2chbgfs
         H5pimQMX+J3Q8vrjYfySbOW3QquEqV7deNuAQifmwUmFhsK2CgnQ0wiYhoF1qDDDD17P
         mltF18MV1Q39w3GQ+EKU0EjoESlhwQK47Mjc2LDOjiKqyIhy6FpyhbX3BsOi+gcGMGwM
         2gZlUxvLs1R1+ZwlqoqZpnlhrEARrHz9KMWInUDZlCpkZthHR4DB2V29UAHB0LYRHnrL
         3Kaw==
X-Forwarded-Encrypted: i=1; AKwUvByHzJ7GJpV+j2DKcR6zZ4TPPh+KvPy2Q8hhCWjEDqXJHBYoO5pCwPD/JaZhmU7pEH+Rrx2mSv+tucT8@vger.kernel.org
X-Gm-Message-State: AFuF++ms2l/hL2EUzyViazIWhDrMfolPf/I0ftJ+9+DXozdIg+0Im/8x
	wUoZaqr51qWZUJDTzaj2haJkdoHXKV7mzmmLdcBpuTn5qjAGwFc5ikYPiV+CGLtFvna+fPAiMQV
	4qbG6GymhJwttaVRzYrJNjFrKky9R4X6DgZw1GqcOd6OauOP4Z+WixeBa34UD3yJV
X-Gm-Gg: AYBFou0geRXVoOZ3a3Y8sZCc09wUoRG9O5p3VHG0WCJ36uS+eMey9lOsEDh9BtirLWS
	dU912VF6taGRzwJzFXUGjXSYtEluDSAWvOGUqwzcwIKZTVhnO2vF7lwCsbKlkrzlIJOmrsf+usS
	qjTpwp6A9lcStAipU3fBqBoGdyHwcurGt5NENuFJ0MDmnh8WYTonzA/VA62ZAT/4/IY35R+9OnS
	SquXSilhPGbfrbHQvQr3zYL8/ihEwROdjEr1JC9TmYkLTBmUzmn5H2aPq88LcNBC7NbwvIiWig/
	qvXw/GiS0oARl1EQegQQnnp4BzpjKMULWj0rTBzag70bqBY0YyW4yZL5Wmt+e1Ll6n3atoE+ftp
	2Tt8ocHt5QPs5XWjOJ5FPsqXVc2W4QFY6KIRgnp04ng==
X-Received: by 2002:a17:90b:4c41:b0:398:9bd5:490e with SMTP id 98e67ed59e1d1-39b2623ac0fmr13905998a91.21.1788577512922;
        Fri, 04 Sep 2026 20:05:12 -0700 (PDT)
X-Received: by 2002:a17:90b:4c41:b0:398:9bd5:490e with SMTP id 98e67ed59e1d1-39b2623ac0fmr13905942a91.21.1788577512434;
        Fri, 04 Sep 2026 20:05:12 -0700 (PDT)
Received: from [169.254.0.13] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa36b37sm10066268eec.14.2026.09.04.20.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 20:05:11 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: hamoa-crd: Introduce
 thermistor-based CPU throttling
Date: Sat, 05 Sep 2026 03:05:02 +0000
Message-Id: <20260905-hamoa-sys-therm-v2-0-1cb8c958c981@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNwQ6CMBBEf4X07JKlIhBP/ofhUMrW1lirXSASw
 r9b8OxlkpfMvFkEU3TE4pwtItLk2IVnAnnIhLbqeSNwfWIhUVbYHBGs8kEBzwyDpejBdKVp0PR
 VXaNIq1ck4z678dr+mMfuTnrYNFvDOh5CnPfLqdh6/+1TAQiyLrDRJZpOnS6BOX+P6qGD93kK0
 a7r+gW86novxwAAAA==
X-Change-ID: 20260830-hamoa-sys-therm-fb4f80fd6770
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788577511; l=2156;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=uGLcF6U/GWagHVa6Sz2Co17L9eojU1aX2IBfU2exRlk=;
 b=Rd/3yrTzNRRorl9q7XDeYOkxcnyiFcE6X5ZA1OrEBC8kt3kL1jpmHIIc3kXuavnVPXyR37rpU
 nJsl4T3LUeFDm1aZ9kmiIgudghmi+ZDVi1cf3+6j5wyVs70I+qxSUAp
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Proofpoint-GUID: NyPOw58gf_eGpwX8O95XgK2Jaf5J-ck_
X-Proofpoint-ORIG-GUID: NyPOw58gf_eGpwX8O95XgK2Jaf5J-ck_
X-Authority-Analysis: v=2.4 cv=CbQ4Irrl c=1 sm=1 tr=0 ts=6a9b86e9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=io0WvpAr2GEc77V1jsAA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDAyOCBTYWx0ZWRfX4yWAX2O6pQeF
 hHDReeMLqqIaTGld+PP2MZpBbIL7g3q16/zGbmZnA7fP3fXfygkT6uZ1/TrVrqJ//ya458eGsEi
 C0Ay8szxvzEQ9U3HP92Tc1FRtHUxuTw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDAyOCBTYWx0ZWRfX08HWaLoCZEIl
 MupaRgbqpgn9PLxoJ3m4AgXUHk7IZaVCG5FJwDOGTfhwSQwaUenWq1VXpLQLfzd+cHBfWR4uBqu
 LFvZNu3i9M6Kq+bUbk6qlDCZIrSARUVM7HensUpppn6zwX5uAvNCLk/Ago2ni6Q5CWJ0pbPhfrG
 J5WVON5x7khm05HHA0s6FLdTEPXpRz0ncz/LUFsWJ2X4Nvl+7I7Ug+u+CshZiv53RDikO8kM311
 +B/Rwykze+jE6D2QBHlEso0eW1MjQCIz4mQdBPNc+hKB0GGcKw3WI7EFfVmrdZxJFDfdB0ABUab
 ilnZAx0Q1UcQpKtczxes9GCbQqTNkLGUJUdqfLgZ/JNqPfyoJeqV3HAQpNdcmrxt3B46h0a+Kid
 MudzLL/TqMKB8jLX4c6emcXSkU252PTtZFPER3HSBnHrxWcAsNkqMOf71fXvr1p6AnwJoxSryno
 6w7UDsMWi/xBsc8FfZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609050028

The Hamoa CRD has multiple thermistors throughout the board to allow
measuring the temperature across different parts of the system. In line
with other platforms these are wired to the PMIC ADC and thermal monitor
blocks.

While "limits" hardware management provides rapid throttling of the
CPU cores, software needs to throttle the system e.g. during prolonged
CPU usage. Wire up the 7 thermistors found in the CRD as thermal zones
and throttle the CPU based on the "keyboard hotspot" thermistor.

The same mechanism is used on other Hamoa-based boards, but the
thermistor configuration and mapping is board-specific. As such, these
settings goes into the CRD dts. It's plausible that it could be shared
with the Purwa CRD, but this hasn't been confirmed.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Changes in v2:
- Dropped second keyboard alert as the cooling maps where the same
- Added mitigation of GPU based on back-cover sensor
- Changed keyboard trip label prefixes from skin_ to keyboard_
- Added "critical-action" to clarify the expected behavior
- Link to v1: https://patch.msgid.link/20260830-hamoa-sys-therm-v1-0-27108c40fba5@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Bjorn Andersson (3):
      arm64: dts: qcom: hamoa-pmics: Mark pmk8550_vadc thermal sensor provider
      arm64: dts: qcom: hamoa-crd: Add thermal control
      arm64: defconfig: Enable PMIC5 Gen3 ADC thermal monitor

 arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi |   1 +
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 119 ++++++++++++++++++++++++++++++
 arch/arm64/configs/defconfig              |   2 +
 3 files changed, 122 insertions(+)
---
base-commit: 3d83758432b5e6ed9507500a57efb0f3af41ee7d
change-id: 20260830-hamoa-sys-therm-fb4f80fd6770

Best regards,
--  
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

