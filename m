Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3E53AA4EE
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 09:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775725907; cv=none; b=tSp1fjKF62IFewDNJjlhHbfjqQ2Uc3ER3DVuW6oUbNqFhgXzormS8gZWALSVO4UID9BldEoyki5Bv7Sw/TKhAFd31mBRDyQBNUmxLx2xqXRXJvmkXrj6SWO+sHu/NAuwN62l1IknDreeaDi/wAowyncDXpZdiKegLkej7snvcc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775725907; c=relaxed/simple;
	bh=DLFYA+6g/cS/X1268aP8WUi6d/wqyTo58OOdjlvzFZY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MxdMYFktsfl7rSm5SjnxLZNqoi5aZzERdIMM5gGitNcwvkOOCR94/vxLz6K+sfFYIlhUMKClwJEpgT9oxt+UMI8iqIgX2yoPz9vd9fM4C2Z8/wzbIuZv7/xYkIaC5buoL+Gid+OOoAJQS6YzwYkH/V70jzt+uhw3wL0F9kcC/5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TSyd7HCM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RCUZXdjS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TSyd7HCM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RCUZXdjS"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63951lNQ4107636
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 09:11:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=nIo7ubBe+RemoWbZ+szPcmHIVb6Tl1/ClKl
	0leoe8Fc=; b=TSyd7HCMAC7OW12iTKGkv5bklxPdwBC2i5N3Ye65kiz7BClH6Q9
	mC5yCg78TtqvbJKBM7UrMuOqS9rVHWQqtN1wUy2zHMR2qix31gQsz26s3vT8gMPQ
	quX/KcgDw4sSgOkFhJpBFEmoGgZXoW45JbsK+ayDsfY1wnC9RhOtg4KEMQPKEtLJ
	m7hM5kyy3Q7XeMWO6tFnFO5ywZGUQ9vsk5/6s9HlRBGDdk2JMFUTh9DDv7bBRt3t
	y4G31y8dV2BupFWeKlCXmGiVf4hLns/OaareM4+Qgo4pCHIb2tmonXr6xtb3bETh
	nQ6C2XOhhZTRC4PKWIakkK8P8fk1KSG0WqQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddxhaj5c6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 09:11:44 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12c20a91932so4143624c88.1
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 02:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775725904; x=1776330704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nIo7ubBe+RemoWbZ+szPcmHIVb6Tl1/ClKl0leoe8Fc=;
        b=RCUZXdjSFWTIE6UvQ+ZMcz7tXQXR6lXQAp8+CXsiqxN5+FNKe6x9YzteuzG59RgAUs
         GwuAK5NU5rt2qtJ8pfsNHPDZpXCgNH03fVeIRMWe/2rpbdJarTW7Q7akyBNLx/Wyj3LQ
         wysFa45lL0RjyFyVx9Gy/lV5ipgIdHibf3Diov4VSlTOaXWY6WVmHDaf5ubuZea0NZvt
         0a8dYiySSZHjV1frX9TMRqllofCErRw1C4YoxObjtlEXUMH+tsDuKJ2KJ1FvGAi1g/pS
         LuTqa9T8h8/IxwdVBwfj6m2HEVGGpb6THSZuDgaOrIm7HEk+M66RbN4jV2e0mHj0agW+
         41Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775725904; x=1776330704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nIo7ubBe+RemoWbZ+szPcmHIVb6Tl1/ClKl0leoe8Fc=;
        b=UHfrul1wFaTv78P4eb5NYZHrrnYM6l+Eg3bYwQOZLRSiwi7+MEYCwaI6wPZEQD+P07
         omP8aleAglmKDWeekPiE2NjT+ZCb95MAjETaZaxqGwPzbvDbkQ9jJhnZeNLI8DNX2sk1
         3rnyo6X48+aFcxIQxpVl+/5oTCk4+FP9k/4oS7i/7rJgtLSrsQRhlJ1peby7RcvdYUWj
         D9SFvt5LMiQeybsUDXeVX2RxyyJIuk/pHIRPRF8GeqtIQs9Ghbi+cCoBfRs5XzSvuAKL
         NjZ+XZSDbYa0puCIGVAxYMKHgna6yudYgu5dgPrMAryhRPpiZHj3GraS/ZhjIyJmpsf6
         wTAA==
X-Forwarded-Encrypted: i=1; AJvYcCXbulH9spe14TauTl917omlBir8sixp9hqA7WGd32P7vODpLuLiOwNvOCW+Ix0YuMoqiXoj1JaeqSV6@vger.kernel.org
X-Gm-Message-State: AOJu0YxRelsyZoG6zv4Q8/mllmLEzqp74FiHn5Y+fAQOK+ycAyP54T2t
	shU9bC0RVdkGXiBQRCQhF+kjREtgfPym5UmCRwuD41ey1wdt6yFr6dv1LMjQONvIxBXpu17ryUh
	XRKeIViScipoiUvhEN6hpro01i+3cxh/uxMthQO7QTShw++EY7FGGm4SBr2xl/ja2
X-Gm-Gg: AeBDievw7YZGRV2l7lJI4aVOlTxkipeV0B/tkVne4GnWFUdA1Jfv7bCRGZhJpTLHAbf
	IpriDJhXEPSKfLHS9omIW4Ppbx616LI1TXRup/QMlNV96HGf0zUsWLy9y8mQ0UIXD6P2s94h1HT
	nN5IJU20SpDA798mWfSGFkiM8A9sNeEY0fQwBl24TNcyaxXamJaUZ70RZiXLwDPgw9jZftvMStK
	+AzYen2CEFSpL6/pxb9cM+myTHjFoMHZh72HZoRXmk5UEeqxmED4guhntSRU6fnbfmqfsHO4UNK
	Ey9sp1plnt1hiI+7s4phtURLyUZkEdy2MUuEzFG50CNx0QfpxYtQofPrluV5bBVJLmut68mjvag
	KNWL4K1Im/OFTZSVmm99mmv5DdB5HmAJRQj/RpcYKOwgFztgPJdrBVpAwoVi9fsJjKg8nJEQw30
	sDz4G6uQ==
X-Received: by 2002:a05:7300:2153:b0:2c7:287:6740 with SMTP id 5a478bee46e88-2cbfc45b1cemr13334067eec.28.1775725903703;
        Thu, 09 Apr 2026 02:11:43 -0700 (PDT)
X-Received: by 2002:a05:7300:2153:b0:2c7:287:6740 with SMTP id 5a478bee46e88-2cbfc45b1cemr13334043eec.28.1775725903143;
        Thu, 09 Apr 2026 02:11:43 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca78df8942sm31265060eec.2.2026.04.09.02.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:11:42 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/8] arm64: dts: qcom: Introduce SA8255P as Lemans family SoC
Date: Thu,  9 Apr 2026 17:10:52 +0800
Message-ID: <20260409091100.474358-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 3n-kM1gO6AdTsEMFA4X0IbfbEMtsjfDI
X-Proofpoint-GUID: 3n-kM1gO6AdTsEMFA4X0IbfbEMtsjfDI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA4MSBTYWx0ZWRfX1WmF8uAx//2K
 ACNNJtm9pvIbbVTQNsrOmwgnaUHnyLOPHNwX/7ph9NpHDcfcph9qPY0Dj332qVHKIy5qkBLE9Qn
 tDsRo40zhfQWwEsoOboyAM43V1y0oS2pcNwfmPvUBSLadrCXUM7NdfA8Jtbptj7Ec9nHEj1eICX
 gKcGWWDJ7hv3gq8B7cu9YjbouCr4qnPEUNHenjzZuJZbn9x2otKuoFVBGR1cHXxN+w1HYp9/usy
 oOaUEhHGc+nx/ijke5UPrGNClPQPJZi/fkvpxyPh1eWIkHpt66S32b4zJ1mc16MxLhwgokmwgcQ
 EJA4MAZEMomUTvcVB4AH6l7TAG/fsOqVOyeXmedGbeXkVZjvyk/13ATsdqTVS0rfgrx7X4KIS5E
 IIviCwOxHFxCze/OB1nwLMLpCuvHu4/T7LoOK/jSBBXqIuzgA4zMvECPkYwYzDIpmwDpEAa2AG7
 CrzLUxu4oEG5gX1gEjA==
X-Authority-Analysis: v=2.4 cv=BefoFLt2 c=1 sm=1 tr=0 ts=69d76d50 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=_elaSrogNjTq6yN4jxYA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090081

While the patchset [1] supports SA8255P as a standalone SoC, this series
offers an alternative by introducing SA8255P as a Lemans family SoC.

Lemans family includes IOT SoCs IQ-9 and AUTO SoCs SA8775P, SA8255P.
Among them, IQ-9 and SA8775P have platform resources clocks, regulators,
interconnects etc, managed in HLOS, while SA8255P has them configured in
firmware via SCMI.  All Lemans family SoCs actually share the same
hardware configurations like memory maps, interrupts, DMAs, etc.

This patchset moves those platform resources out of lemans.dtsi and get
them accommodated in lemans-iq9.dtsi, so that lemans.dtsi can cover
SA8255P as well, like lemans-sa8255p.dtsi includes lemans.dtsi and
overrides/adds properties as needed.

[1] https://lore.kernel.org/all/20260304-b4-scmi-upstream-v5-0-f8fc763d8da0@oss.qualcomm.com/

Nikunj Kela (2):
  dt-bindings: arm: qcom: add SA8255p Ride board
  arm64: dts: qcom: sa8255p: Enable sa8255p-ride board support

Shawn Guo (6):
  arm64: dts: qcom: lemans: Move PCIe devices into soc node
  arm64: dts: qcom: Rename lemans-auto.dtsi to lemans-sa8775p.dtsi
  arm64: dts: qcom: Introduce lemans-iq9.dtsi as a placeholder
  arm64: dts: qcom: lemans: Move pinctrl states into lemans-iq9.dtsi
  arm64: dts: qcom: lemans: Move platform resources into lemans-iq9.dtsi
  arm64: dts: qcom: lemans: Introduce SA8255P SoC support

 .../devicetree/bindings/arm/qcom.yaml         |    5 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 arch/arm64/boot/dts/qcom/lemans-evk.dts       |    2 +-
 arch/arm64/boot/dts/qcom/lemans-iq9.dtsi      | 3711 +++++++++++++++
 arch/arm64/boot/dts/qcom/lemans-sa8255p.dtsi  | 3027 ++++++++++++
 .../{lemans-auto.dtsi => lemans-sa8775p.dtsi} |    2 +-
 arch/arm64/boot/dts/qcom/lemans.dtsi          | 4041 ++---------------
 arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts  |    2 +-
 arch/arm64/boot/dts/qcom/qcs9100-ride.dts     |    2 +-
 arch/arm64/boot/dts/qcom/sa8255p-ride.dts     |  222 +
 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts  |    2 +-
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts     |    2 +-
 12 files changed, 7288 insertions(+), 3731 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-iq9.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-sa8255p.dtsi
 rename arch/arm64/boot/dts/qcom/{lemans-auto.dtsi => lemans-sa8775p.dtsi} (98%)
 create mode 100644 arch/arm64/boot/dts/qcom/sa8255p-ride.dts

-- 
2.43.0

