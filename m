Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F79544D5C
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 22:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790115115; cv=none; b=A7I/AGCEj4Gx1laBR46E55JqFZ3L4pcU7w/W27Qe1KrSbz0Mwa6GWJULnYIskzDFRAmt6Je2xHjB5XzUHEflMBCP+2q7uI7KbZ5UH1NU61sFg0SnSuYZoa7ykqJmhDL2SiHtmyhUo3Ih8zYz+4FWTw5lrlqn6rTzALu6ZQaufkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790115115; c=relaxed/simple;
	bh=GV0RIdXOtkfjMVPId86FT3OFmS+8Og4nR8K49a3WgB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ViBkykYxiGgfwQI10AKYMwfn/3LRsoF74/JaFY7iGVl4c/JibcIHpXluBbEtTU0tbIkjvj79xcSY7FwZEl3i77oYivlduyKaauBim3z8+6FDXjoc1u5rNu7W1wthWDNftTQxK6yndHCMDtf+0q822l3eo+wp9HJ6gC3Mmxp8sqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W+9A0AUE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Re9ZD9VN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W+9A0AUE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Re9ZD9VN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI6wA11873472
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 22:11:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DS28oPm7nJH
	+RSuD3M1Gk+EsxwlEoa/DmGIN9P6AsqM=; b=W+9A0AUE7+o492Aohc4oqSvJK57
	jTSaWEjZS2CTjKIEyy9AOrOZ+QO1H6VuG88khneuaCOj6YQsr95ghGyv7F36lw1G
	1T4Ac+/lIqafE7DG8hguqfQ9mdM7CYZ+9DRpaHA+0Orx8TEzBAw0UoFCZRLGTC7G
	KRvGVn7B+PzM71irgeA6djIqtteiFavwCVmAyPLnqUA9QnyJO7bJW+j30prsDwKO
	G93aoSWjTJ62/cNtlOWVyybfbo2nkBeQZG/PryDtcbZi8blrM0mrSuwO+t1X3oYz
	c6OHoHSvxmS8Pz8qtgm2mUWP3x/3AFZPsAE9/Ju6G/JBnUTKMx4em6UwJ7Q==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guqk4uc4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 22:11:45 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97e9e2deaa4so348838241.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 15:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790115104; x=1790719904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DS28oPm7nJH+RSuD3M1Gk+EsxwlEoa/DmGIN9P6AsqM=;
        b=Re9ZD9VN5kaNiiDa2EvAfHpcMOfjWssn0f5pgoCyOXtmiGDG+PLfoluBOJutyJ2ttX
         48/Xru+LWMIUBwbMTxqbtp6TVY2Nx/Jw8wJ4Jjxqz+BXNs1pLHOxtYpSOUMfDVVCQh8x
         tWqSH43P+qFahWiL2MRMSkkppeel0Krd59Vj/3kCZARTibK2ALVotuJi7kT0azyfncAx
         Z81GoFdV/KJu/1FzGdd2L2CJzz9OzN89Ax2Hth9QmZcVGHasWrrAdeDNyt7zeI8pBUrP
         a5nei07Mr6PmCrI+/8eCJFBcnT3RAr9Iq03KmTqDdZnooLeyI+iJfJujoli1GXPz8yqX
         v9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790115104; x=1790719904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DS28oPm7nJH+RSuD3M1Gk+EsxwlEoa/DmGIN9P6AsqM=;
        b=maTmyl8Qvpf5F56LoZyTYozltXGVcdBisPrFprznznmDPCcqCnsDaFtCNzs5ciFo4L
         gO4346oGcnjC1S2tqOylp1hkjbK/cbtqpT6f+ZpiqH9dwbKjMcpU4U9CshnafYucamoG
         8kOsPZPFWOY+cK6dRigVtQflAEdHi5jlmrYTAkoO0MOxTPpytHsyXaDh0utBwoBYWO29
         vacad4DTtznauaMlKbuRmye9PiPNiVSfrRTaQ8vzRjJxIeGaqsVlnaI93bYzRQ84Lnjr
         lAMeOodjLmcG02mp9r4s8gv0GG6SD7aOtJ04++Y5Q61zQziQJQXUL/YItjCUtrgmIKeh
         RAIQ==
X-Forwarded-Encrypted: i=1; AKwUvByoOLMOyFQOsmLIWrZmtwj9W4X+/yg/myyD4rr1SyhM13xuKx2vXPK9Mg9vyk2+zGCNgig7AY55qFd6@vger.kernel.org
X-Gm-Message-State: AFuF++ku2e5sPfapanF+vkdzUU+mk8z7WgdQZe/RfygN4hlMjj5DRgOz
	dNCNqH3E9P0ZukRKKNSx6tZlK5InCX6RI06pv9VL4WYxLXbLKAfYwfvD/6a3SNBBH83vcrRrql3
	YspWP6ej1JqaiYRmO8vO7RHhXoVfrBHMRQkbnE+DNiee0Q2ye3kR+6sRD8yNqw8Rm
X-Gm-Gg: AYBFou0Qa0/0BPKdjoMt4/DpHfhXDqEeIQ4PDJ1xJPVQTzt2Y1O9XBh6yXhWaWP+cqO
	lUqYWR1CrQueZQKmT++nmApUzZ7wIA2OmiHENs54qcmWW7NYuHc5D/UpE7LtjKOcy1YnpVIDp/R
	u1TXB4n7oTfx5fC8ICuo1qgsjkO7VB89Blv3PqziDjUwzRS8QGFv2mjTle4TLzcItQ+56HVqDtp
	EcTcxGg089wdC1CiqFzO4vk+yFqGFLNkJRK6Iz88EVkN3DpqGKaDRCr8DzrhazbdpvkrVBTYWjk
	ZO2Ke60JUE8qpDUd+Gx6g1dOJK+yy4l3PM9+f0SPkp0lfkg5tQeQBiPNrykLEcisOBJn/l3uZ8x
	WzbwwFI6pwLoFJ7Fo/qRktHLRdnpEgp/iUaSvGyxk7XfRFWh/2Znn4xtYIK5tvSxx
X-Received: by 2002:a05:6102:f83:b0:7a1:f7e2:aae3 with SMTP id ada2fe7eead31-7ac1d0cb103mr873922137.21.1790115104438;
        Tue, 22 Sep 2026 15:11:44 -0700 (PDT)
X-Received: by 2002:a05:6102:f83:b0:7a1:f7e2:aae3 with SMTP id ada2fe7eead31-7ac1d0cb103mr873903137.21.1790115103968;
        Tue, 22 Sep 2026 15:11:43 -0700 (PDT)
Received: from debian (cust-west-par-46-193-35-178.cust.wifirst.net. [46.193.35.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488688856f0sm1400270f8f.30.2026.09.22.15.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:11:43 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, alexey.klimov@linaro.org,
        r.mereu@arduino.cc, srini@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 0/5] arm64: dts: arduino-imola: add support for sound
Date: Tue, 22 Sep 2026 23:11:22 +0100
Message-ID: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260223133950.221234-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260223133950.221234-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwMSBTYWx0ZWRfXyK8JGJ6y4yyA
 ig/JRAN/2fuGfnsi0GfvszOkigjDdzPSMF/r+EofH8qkCB5cdIIzOcaFKqFmZtH98AHp0T1cP1g
 Xd8+d81iiqiBAC3sp/R4U8RSep210E2Ga52PkwguLmsS9M55yLopVh87ajdivzYs12a+HC+Sz//
 mrQERmN/SXW1m7y17ZMCyTOf6whqODFCkbMQWguVQ4unJQo243lWkvW56GivkrNFUfl1RKR1paG
 OC80w9EdhoMYMseUaptUp8HQJP1fMi5LFwtkQAiYo+5w4liQ6quizVtuSdvhePg5GWwzfzrqHPk
 /GN4euZW+HKQbkxY4DssK4skNvaflnE0rL5orB06XS1dp5Hece1u/5zKJGCUYotc2/rnoCTjIh4
 f9ujNmF5jXTxvLLIXYQuOV5EbhosUajAVDvctPKUqKbkYPtraOtDGwB5m3NZqRfAUjHXRxOP6CW
 HA2pihcc/wO0nHuF76Q==
X-Proofpoint-GUID: bO5JFbE9U-zJQGdN3j8ogM_fLDZOBlMJ
X-Proofpoint-ORIG-GUID: bO5JFbE9U-zJQGdN3j8ogM_fLDZOBlMJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwMSBTYWx0ZWRfX+wiPEPTT7zjd
 8hdf8K9yH9RcZKA+A6pPORz/5YWAmnzajZwtkrW7PK3q+wdMSYcXsJB38OCvcy0dBxBdrCZn6zM
 y/rrzqkzzObWXIm9YQ6TEbSEj6kMKV4=
X-Authority-Analysis: v=2.4 cv=XrVvqlF9 c=1 sm=1 tr=0 ts=6ab2fd21 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=Hji71o54RgNgZYqDgtlrhw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=qC_FGOx9AAAA:8
 a=cOr29_qJNzhy3HpcGCgA:9 a=TD8TdBvy0hsOASGTdmB-:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220301

This patchset adds support for audio on Arduino-Imola platform which is
based on Agatti SoC. Some of Alexey's patches are reworked and sent
here as per previous review comments, mainly on the dt-bindings part.

Base SoC-level dtsi bits are picked up from
https://git.codelinaro.org/alexey.klimov/linux_next_tracking/-/commits/rb1_audio_wip_v3?ref_type=HEADS

Along with these changes, add sound nodes for Imola, a clk fix and
defconfig changes.

thanks,
Srini

Changes since v2:
    - dt-bindings/mfd: switch to properties.compatible.contains.enum
      with required: compatible, per Rob.
    - agatti.dtsi: collapse each <&q6afecc ...> clock cell onto a
      single line, per Dmitry.
    - keep qcom,sm6115-lpassaudiocc / qcom,sm6115-lpasscc compatibles;
      Konrad Acked staying with the established practice.
    - defconfig: carry Reviewed-by from Dmitry.
    - rebase on next-20260917.

Changes since v1:
    - updated various register ranges as per documentation.
    - added a fix for sm6115 lpasscc driver.
    - updated commit log
    - fixed various style issues in dt nodes.

Alexey Klimov (2):
  dt-bindings: mfd: qcom,spmi-pmic: add compatibles for pm4124-codec
  arm64: dts: qcom: agatti: add LPASS devices

Srinivas Kandagatla (3):
  clk: qcom: fix SM6115 lpasscc register offset
  arm64: dts: arduino-imola: add support for sound
  arm64: defconfig: Enable configs for audio drivers on Arduino UnoQ

 .../bindings/mfd/qcom,spmi-pmic.yaml          |  10 +-
 arch/arm64/boot/dts/qcom/agatti.dtsi          | 157 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm4125.dtsi          |   7 +
 .../boot/dts/qcom/qrb2210-arduino-imola.dts   | 134 +++++++++++++++
 arch/arm64/configs/defconfig                  |   2 +
 drivers/clk/qcom/lpasscc-sm6115.c             |   4 +-
 6 files changed, 311 insertions(+), 3 deletions(-)


base-commit: e657a464aba873f5eaf3ca821b6e4016674492d6
-- 
2.53.0

