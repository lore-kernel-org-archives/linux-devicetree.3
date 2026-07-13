Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78D4414DEE
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 13:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948121; cv=none; b=fWL2ZTeZ3pSPmlnFnHOfJ9hBaC9ONw72vE5ppxHdvI+BCBgemETEnhHlxTCkUPOcQmu8TSd3/PTutT2O7NtOozc/trqOSv1XWdwcjfbIsLdd01PKYUlw/+UFsq6MBk90lHxNkUTEs++IhQvLps4MM6e28ayPcsSKy9nfh4sFGsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948121; c=relaxed/simple;
	bh=jE7CekFZKhgt5cmGhG+WSkEJKcvyL7RUq/0SKWptMQ4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qShdTf55zRyibXCDCoQ6POlsVeSs6gEs3nuHe9EbFUvnyD5aIopIR76HuJv3x5qaT27DGY1FBsaEErdsB/BeoMe+gXdR5VeNwe0kUCtI/AJHNV2zY226cEX1a1w3zHSo1kQ8KfwZayPEvpqvOB5Gv4l3hK3U6xDdXMtFcjbmqHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=az3dOMgJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mv+Jfm+A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="az3dOMgJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mv+Jfm+A"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCE4fM1561461
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 13:08:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IbUQyBiTJhaPWdaTkK+imr
	RU+C+1Z31myd23GIEMc04=; b=az3dOMgJolpqHY2doKxRrXU/JIWohP4cNWjaAi
	Hu2hfAlkU+clmYtARs2WIW7+H/+OijyleSyIAJaqyQ23iH8g/fwwqprTwv+FKZW8
	aaxU71/7ZVqsXyIYlWWeXhywyrZXdKAIkUH5YqhXk9l+zEO5dyOoOZfzAKIleVko
	r+S+g6HQkEqobPq+g7EV0q1GxYzC+HEhdwjY2D5lu2cL4LntWQYM7duH5NLyNecU
	UA0d2TeTPGhQKVs48m3g5l2Ub++D+3j/VPcQW/tcmlQ8gEV2pgb7xoo8bNwZ8a2j
	weuXW/uqvyZjVUQC5e2lHYF8Y3k1q/uONB9e5FtLjD7M7duA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn3amq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 13:08:39 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e9dc0f5900so7421954a34.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 06:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783948118; x=1784552918; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IbUQyBiTJhaPWdaTkK+imrRU+C+1Z31myd23GIEMc04=;
        b=Mv+Jfm+AJeLuZAaDe+Q7ZpBlDMcY5+9EpeXIN+47svGzqibtDHZLBSvYuEiw9ITQo8
         OeTbyZvcZVGAyhpJ8fjIzLdnmWA1l3SbGccQTdauXOXZxfkmSaoUZ5udGQwXIvVVoUib
         MCnNprRqEAgb2ew6PYYeD3AyP/ZE8Oc1oqfjyxCKMTinbAYuOqOtnUN6JkYAY/uj4S14
         ltqL8S/zMXxTKhUag6VHXycsfB/1widu4Si87RYowJNzH/haLXafDkSKF3lXEffb6mXp
         0ew0fxnm3uKkSfvdC/bI9hMJ5M4i8N3gYdO9KzMBQSDJJFj6Sr45YiIgSoFfBUWIFcDZ
         +R+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783948118; x=1784552918;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IbUQyBiTJhaPWdaTkK+imrRU+C+1Z31myd23GIEMc04=;
        b=bMuPKoZMbxY3eSB/uxqaLLjdjnwKWdYFoMSy9u/nvDRaeb1ZOZ/tTH4o4C5DA/nKb3
         4zi8o7UynGy1Rl/5DK6yO7JlPYxTT0EaKV7CfFrRkhcHjenm+40kVFOSNY3MtYS79TjY
         5dJHIcGvJrlo+k/4Oxm5RYVvjU8vFGcBZPvOSLyYKYO0VdVJOSHLTWOmzmPNRJScLKZO
         5coXcW3I+BycRBbQT8/iIH4F3rqYz/3cckBrWmKD2VmGpeyvp+ohRafwxoyAcq5e/U7e
         77WpzQSxG7gbQ1SGuGkbbcwHYyUiBwhq/Y9MIdeegShW7E6FReq3E4GBUp7sIFDkZJDR
         t6Pw==
X-Forwarded-Encrypted: i=1; AFNElJ93D9Hd4vjJSyumjQ26VQrAueYiJI6RSNyyp6oNvFUGGFwukYroXhnoLSnIdE8EfTjU1mR9L/605Y9O@vger.kernel.org
X-Gm-Message-State: AOJu0YwCUYXmq2NnHQqDv60boWGGZ8HG+nKilzpWrwjrOBdzcHrN3VRp
	w5FVTxcUOhsQfAa3Oa928YxIkjp+Q9PfVsMlcbU0C+fcl3ZcRtqkQYyS1dEtEn9PbHOpOzNIX9T
	cEVl0CSy3bOR0w4OFC9ohN/2FBT+90C1cTJbfDzc0Ml7fnrw45p37KkEZITbNrmrO
X-Gm-Gg: AfdE7cl8bbqryZ9aPdmsRl7sx8otnertQg5bQgabWaxaZaxB5/G7OZLCFPNmWcxOwnf
	bYv4S3YgkCNp44hz0Tp9fFaPLR6I6tBk32CCyfvMVowtRnXNQoa+aUU0QFxPYKi//B1DN+pteSr
	KFEUrgnl2Ed03bU/WimNrmhEl2gdJsLhjsQMlHhzww6uPSKIIkZxzSWLwamBxGVcKImU+GOZNb5
	6lP7YnJUZfI1T+twWko58A/wPZ9rGuZbiHvs/UKs4BiOKdcGhLhUIhz++NS4+Ad48ka9m2r78ZM
	88MCWcft/pINcIlEctfENpYqi5vDyDHgGcWhUZNewh3nJ81FZgdsetAFZirXJbcDbmvjWCLZT+4
	i7M5uVQrgz2wOTrg13GIeUnxHEAHij5pjGqO98It7IOjzKjjqDUO0mdVYF8eGepU0NwAkMCW/fe
	Nq1KIE
X-Received: by 2002:a05:6820:4df2:b0:6a3:127a:bf27 with SMTP id 006d021491bc7-6a39bc515ebmr4445656eaf.11.1783948118255;
        Mon, 13 Jul 2026 06:08:38 -0700 (PDT)
X-Received: by 2002:a05:6820:4df2:b0:6a3:127a:bf27 with SMTP id 006d021491bc7-6a39bc515ebmr4445645eaf.11.1783948117847;
        Mon, 13 Jul 2026 06:08:37 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a38e16c7d8sm6415913eaf.9.2026.07.13.06.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:08:37 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH 0/2] phy: qcom: Introduce USB support for Maili
Date: Mon, 13 Jul 2026 18:38:27 +0530
Message-Id: <20260713-maili-usb-phy-v1-0-3285da11f148@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEzjVGoC/y2N2w6CMBBEf4X02TZtuYjEGP/D8LDgKlVKoQtGQ
 /h3K/gyyUlm5syM0BskVkQz8/gyZFwXQO0iVjfQ3ZGba2Cmpc7kXsXcgmkNn6jiffPhWmXJIYV
 cQlaxsOk93sx7/buUG9NUPbAefyf/hsdhCqJxqzGLRLCKiui4elKZaxXrOBFJlsRcce86eAoPD
 T7g7IjEMEFbO2tFiBMrl+ULfVV/WMkAAAA=
X-Change-ID: 20260713-maili-usb-phy-216495a80a6b
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783948113; l=1143;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=jE7CekFZKhgt5cmGhG+WSkEJKcvyL7RUq/0SKWptMQ4=;
 b=Q4FD0ucJopGcsAl40GSBbU/a6doNSvbPxBE9+kqKsoy7utWRWVseNQ0AIvjBywrPj5uGX8JNT
 xFEoWOZPnNnAPToaDmRkDPrjfcaF90oa77iwVSCwyNDJ3XXSzC3Duo0
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzNyBTYWx0ZWRfX/pu91JPavCa3
 2UyTLrd6UVGgNtMnAOTS4KsEHQCPben3xIruwT1EHzCt0DUNMkre4LEGVmuvwVBMX/LlyRU/U2x
 lP4S/gsn4SUTwm5mFI0c+bzHYfMguaZfZBX6pnALxh++GmhmYrqMM9aSEmRehxqKz5QAMp8pIb9
 flBkxjf+E8V+tsvV7A3C3OnLsM/KEEPjl8zI1eJSw6kommGpsNwAsmg1vg2v0+tup/yjOj+Vf5G
 vHZ0gMdrb71MOswm1N3KxjmQzp/M26MMlzZGjA/brL2EgCerFTAnr/nN7Qi4D0sBWZaSlHCdoGS
 nAeqJXLWonPf6FRMagbya3tiYOKUuxX6WHeNm5styrxmEbL3RxmELOR4fRwY+kWgIg2EA9oi1JZ
 o8rNO9SsL971Uau1rNf4Hbvy9/A4nWtnnLvHfGiYV/qBcyEffyvP5Xlabtcetu0klcmwlHeT75m
 +kn5GMUTlFzIjJ/KA6A==
X-Proofpoint-ORIG-GUID: IdTjBvwQyffRfFvL32KSg9C_mHKa6TuJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzNyBTYWx0ZWRfX3popXUqd2mPW
 BWbIqfTXvnPFAkbNKPEYy1MSkdPTggg5Z0ehaSmDO4kIjz9ePbG2mXOtG5QgPGPYwkxl3sciiVQ
 uK5FVSPzMsz3tlnvKVwJGVSOnudBbLI=
X-Proofpoint-GUID: IdTjBvwQyffRfFvL32KSg9C_mHKa6TuJ
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a54e357 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=7E3VzwZjn1rR5_zOvygA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130137

This series adds USB PHY support for the Maili SoC. It documents the QMP
USB3-DP combo PHY and M31 eUSB2 PHY bindings and uses Hawi and SM8750 as
respective fallbacks.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Krishna Kurapati (2):
      dt-bindings: phy: qcom,m31-eusb2-phy: Document M31 eUSB2 PHY for Maili
      dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Maili QMP Phy

 Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml         | 1 +
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml        | 4 ++++
 2 files changed, 5 insertions(+)
---
base-commit: 9eab4ee76654a970b27e32ef8db5faa0e0ab1611
change-id: 20260713-maili-usb-phy-216495a80a6b
prerequisite-message-id: <20260508213234.4643-1-ronak.raheja@oss.qualcomm.com>
prerequisite-patch-id: 67eabd10459a30018201dc8e1de5d92afd66a65e
prerequisite-patch-id: e6a3b60f5be496990f4e20b61bc4e7d95a9ed6e4
prerequisite-patch-id: 2c8c33235fa26efbff7de1c1fb4fb4a914c669f6
prerequisite-patch-id: ad18f334a41515aac21faf5d684206657ada699e

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

