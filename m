Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636360;
	b=h7Cul4AYFhvsnrZe4Ijd+0MTGSkK+3lla3MfwBaNTB15k0TlS+xhE/oeCkkzBB1l/RC6
	 6CSn/RrElvAxxENr4al84kB6MC6rggv1Xe6VHULZWsleXlmdFxo0S8IczThmN5ZSGP5T7
	 KVMwxDHkUaz0TVO6cEf5ASfKSOsFuGkxTYSA2Bcd+CYrKwMyhpoSlj3JBc1hO1EfpUQ7Q
	 NIdFv1BsBAyjJkbztQLcLyBLZNMAYfOOIv0EN/xq/ogfEZdmqh/q9X9x/KoMTud43MlLu
	 RYFnpQSj5DZyig4+opyPlYBCtyjCVZ5x97HAeP3ZPdapZPVEsJu6Lzfil6SeoNYJbew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636360;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lRl8a2c+F775fiXICpW/PScHe8VmAp8qGYbgkcFxwMA=;
	b=qFz29IpyfL3qhGDk2/WTwCu/nU2kJE7J5+cGhcoIdmPKIuH+oKMzyGoJCc9fBJmFFVKQ
	 HQrUzVm8l/UiCJst/SHueeMEC628C5jjTh1WTyKMxjvtOQNpkQLebAB4jD7oRBazWsyXM
	 D2ew/XLp3WhvGjw6oVo17EftcHmok9BVxrmOtd9qoXbYcx3IOTnhmxaW/6GGDKHYhqbub
	 GfJXgZEaX2KiaJRvuBBIAfbhHivMRg9Dx9UIBE77negait+sHlNkEOXUyydAiGmYsVuhm
	 8vA5RRAtsrBFXuQtG3bH2d+un6zu6vBh4VjmgjZtso0GzeNmQGK7xGyJhKWYOyL6CVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="H/LTMWGw";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EDvZgpZP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F7A606A321
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 19:52:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56F7A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H/LTMWGw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EDvZgpZP
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJAo2Q1357594
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 19:52:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=lRl8a2c+F775fiXICpW/PScHe8VmAp8qGYb
	gkcFxwMA=; b=H/LTMWGwpLj4JnzWOodswvm27tbYjNKHCSyk3agPibFXS44LUs/
	SLl2ElF0+fpNXQaCXxFEs2zZlPGR328IJSf1iRk4e74gNARICRzRUC9Dp08wh26b
	xpLeEKtHT4b713wC2YE3IZUahzLIXXA15+VyOT6qkbM39879E/u7K1vajUAOkqpF
	j2u/Bg7PKqnHKSCEt78iG++qT9PbmJwCBu0MbO5rIeS9S8ZU9+N1g2UZV+ODESpj
	beGBkB9DwhLkxJFcoqvkam1+6py1H9qhUSLAdZ+B9Hc4vx0bBWROYQ9d4TYpqLLX
	707wqksJm2IWlDddM/A8eVTBf0oOVzamM/w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5yaxstry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 19:52:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f5844e383so947796585a.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795636358; x=1796241158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lRl8a2c+F775fiXICpW/PScHe8VmAp8qGYbgkcFxwMA=;
        b=EDvZgpZP/8Wy2yKHCu/KzpebFeNF6c0ZFMzytVNHzSo49GNvDSNfJWWdNeHKvOsAWv
         gRXLElZVT4AcRc0yViP/C+cnFDm6WJeFLEZFzhDc5PyG9/1eEzZfrxr4RxrDGLZ0S6XA
         GYyCxbn96zqG12KiXMiaPPBaEA7csLpd5fqdbU2bXKD5yboGewGm0gSggDPC9seM+ikb
         s4DYamKaLqCCvbYFKkcxswoD0X4Q2hS7yM/wuI6gfuhul6oPtUAdt5rNFKLE2ERQuSoj
         T+xBpwirvTc8OBl+72bqCpEIU2SZTQ+6RQECRsLmPaDcZs2Z9bZfTtEbWnX4AjJ6RkoC
         VPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636358; x=1796241158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lRl8a2c+F775fiXICpW/PScHe8VmAp8qGYbgkcFxwMA=;
        b=Lb3YdVVdQ3qgPLD9Wtx4+kXGvLr5dD6LEDdWOwhQBWD1eJnW+hb8l5bn9wIGNb5ERP
         OgRaLAW2u4HqCm/IqfMhAFSbkgrhG6Kdw0+1huR49z3Z96YAV1N3TC35Fi7Ua1a7sgIt
         1EsiKG66HEXLfD4qzQOJdh561+S/ZR6KQldva1N2THq8Om6pjh4ZR4m2IJpVp3ISJIfp
         HUhnXC58ClLjoh8kBkUYFM2raho9ugN9OPUHLNjeygy6OdAmLFxbAiO05CBpSCIprwvt
         317RZPyWnNWCCfG/noMWrcmtMpLWSc8ya1+U5DFua3i7X9PNNXp8AnIgES5AUiH4Mfw3
         fEnw==
X-Forwarded-Encrypted: i=1; AL+hErFxPYMjIUwxH2ghIngTjUth+I8n7cWvIQnqwY781ob6Jzntka/8gl8iSH+Pifqjt7i6deeol6ZonQcd@vger.kernel.org
X-Gm-Message-State: APuU4Z+vEkiQ/sPmc9C7Ya+9kuZLRG1bjkWrFbtBIMcP+0XOGuXdg/Y9
	hwN73LA0P3KZNqMBdI8rD+aQXOoCbaSpjbbT1IEk9QPz6c010BJ33Ul+YVlQml1rl9/sPPutyKA
	kbwlJMy4aqmUPO4VJDfNoQ7Ew8pv5ZGDUVQKcQNkX6wjsVNUS24d7eSMtb7ngZPnt
X-Gm-Gg: AZFdTZdaxqvUt7pyNqzSUu7XM0z2eu1IHMEKE06+BLepl+gyAzmyYfzqM8sVc/uJ3Em
	BaTcJ3YE4hMfeogZJZWkzO8RwNwRtCws8tJW3czIJ+UHWU+twSKF+3sBqFoEg8co5W+WfOoPCVW
	NDUwL3yBDSdyvHQitIYSmLqoyysIq/q5Jx7yhuEgYiS3p4isyYBkDY0OTW1zL6tu1X/XanSXHww
	elPdAw1iNm8Eu9qKD1rFQiP4vwZ4h+q1wWzZwSAR/+hwIMAjZSj5HMHhNBk6VCCa4oI9sq5nPT9
	nGB71k6PR/xgn4waLAC1T60DxFO/hPiPfNu8JCelsaLdYeN1u0KfWB4xGvQD88zxMMxBiL/QEKR
	7u6lj1EDSfiXJCQe6mBV/Oox9rDyzEKikrrke+yebCYYOX4Ike3gKynNVIRlxi7Q+
X-Received: by 2002:a05:620a:260a:b0:947:7f5e:2b64 with SMTP id af79cd13be357-949ba969faemr3131218585a.18.1795636358456;
        Wed, 25 Nov 2026 11:52:38 -0800 (PST)
X-Received: by 2002:a05:620a:260a:b0:947:7f5e:2b64 with SMTP id af79cd13be357-949ba969faemr3131214785a.18.1795636358031;
        Wed, 25 Nov 2026 11:52:38 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm774316205e9.11.2026.11.25.11.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:52:37 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>,
        Luke Macken <luke@phorex.org>, Srinivas Kandagatla <srini@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 0/3] qcom: PMK8850 LPG backlight on Mahua T14s
Date: Wed, 25 Nov 2026 19:52:23 +0000
Message-ID: <20261125195226.1563577-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
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
X-Proofpoint-GUID: iv42LkFEJ2uSw2IfTLj8wtzYBoSqiHZR
X-Proofpoint-ORIG-GUID: iv42LkFEJ2uSw2IfTLj8wtzYBoSqiHZR
X-Authority-Analysis: v=2.4 cv=ULpIjyfy c=1 sm=1 tr=0 ts=6b073c87 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=eNx2SGrOvgKyolGvBP8A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3OSBTYWx0ZWRfX9yIaNkCEW7JI
 qMWVPY24Ix7y/FGwcoaldFBh1DsGM7X+U5044AThILXPGfJfJbV4AuRHJilC2MXVrVbmkZP5Ziy
 s5TJCKhHRnKwdKX7eL2YhF3epYG/ZsvMsMhTfEzh5t4P9Hp5M3C7DZVsi9OpbG51eO7oemknqTA
 bMxMHTVs/VQDWxaL8qPFm7gVXntumZGyUjM/sTWi3m3KY6ZKYLMEtwHNZJQp7AhfwYq5CowP3pT
 WLKVEAtQu40TDtuTpw3qb7CYWcTaMjbYJqBFCr9Z9W4QoLjFiJ7tNRQy7Qd/Kyl0cz3ADt2kR4u
 cbebFbnzbr0eWDkYWMUXv36UHrveVQJt4jCHJpW7H9196+rMI6i3NqIlhnMr1WWWanlsi8HYfAJ
 gGs32QvNem2knl959lzT9ROnGwdYC10E2FOEhRj+M2I4B/M0YiqOgFXRFwfO/GrTIq5+Um6McbZ
 2ukWtxNEu5Jgxwt0SpQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3OSBTYWx0ZWRfXy0IwKzgiNydS
 JQsS1ysrZu6YDn28XXG9W93NtcknzSZoBlxvBPuCJgLqIX4PV7v3ES+YzU7zNZPCF8VMyfNnqED
 l9pau0ZpOpOA1fNUEHNUqBj3RJfjiOw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250079

Wire the eDP backlight on the Lenovo ThinkPad T14s Gen 7 (Mahua) through
the LPG/PWM channel on the PMK8850 sleep-clock PMIC. The PMK8850 PWM
block is register-compatible with PMK8550, so list qcom,pmk8550-pwm as
a fallback compatible; no new driver match entry is needed.

Changes in v2:
- 1/3 binding: use qcom,pmk8550-pwm as a fallback compatible for
      qcom,pmk8850-pwm instead of listing it as a standalone compatible
      (Lee). Krzysztof's v1 Acked-by dropped since the compatible
      structure changed; re-requesting ack. Tested-by not applied
      here (bindings have nothing runtime to test).
- Drop the driver patch; the fallback compatible matches the existing
  qcom,pmk8550-pwm entry in lpg_of_table[] (Lee).
- 2/3 pmk8850 dtsi: use the two-string fallback form "qcom,pmk8850-pwm",
      "qcom,pmk8550-pwm"; pick up Reviewed-by from Konrad and Tested-by
      from Luke.
- 3/3 mahua-t14s: pick up Reviewed-by from Konrad and Tested-by from
      Luke.

v1: https://lore.kernel.org/all/20261015194732.64428-1-srinivas.kandagatla@oss.qualcomm.com

Srinivas Kandagatla (3):
  dt-bindings: leds: qcom-lpg: add qcom,pmk8850-pwm compatible
  arm64: dts: qcom: pmk8850: add PWM node
  arm64: dts: qcom: mahua-t14s: wire backlight through pmk8850 pwm

 .../bindings/leds/leds-qcom-lpg.yaml          |  4 +++
 .../mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 26 ++++++++++++++++---
 arch/arm64/boot/dts/qcom/pmk8850.dtsi         |  7 +++++
 3 files changed, 33 insertions(+), 4 deletions(-)


base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
-- 
2.53.0

