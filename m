Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794670765;
	b=WJovMwMZEHSEQKEE25Cs4UTiRV9asJk22IYEV1GZDVcZpScwQpLmi7Ap6iRqNCoPpCsq
	 tWeYdSYDbRjYh+vlLrpVGCytt8iy1equk++Bvv7ipXbhufgzq0dTAwwDfTVckiserj0I2
	 BsPltvSQA2vxtreNHNrLHQzG3kUGtf0DBXOcn2dciY3fEfmEMWBxWjzjKKZb5xFlP02U1
	 U+OMN/YJR6Cq5V5ttOGNzoIcZaEZqFBMpnxn1F0AHj8TViQ2he0kqLHEkbStSR+FE4ju+
	 Npxv3/bxy3pwJcoLqwpvPtRR0Uc6tgC6CN/xbXqIwsoNtHEr/fdu6xXj522fkPGYy5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794670765;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hrqRIR6qjCPCM/+FGJdCXYUIyo0/YN8fZuFRUdFOn44=;
	b=aXGSB4QqVgMcvOd79f69f3Rx2FFcdOqwEBJe+bphuDSGUImVIhCudm89CozPdI83D6gW
	 CxrFJyXDxphdrtHLwnFf/cK2YgFc6qugzrAdp9ZkW1OjcGmoFF3k05/8U34FEFb/5cqys
	 a8arSpbEYUYnb6eu8KUBr0Htf8J3nCbZ8Djrwbl2XTQqwQwMUBFTijjjdVLilEfP4HVEa
	 dPSayvVH5NfKTYU/eOtniywSXldbnDHZO4a7HSEq6mUGd8ucpTinYnbp9dPP+Y6Ns+urv
	 61U2R2zWPsj+j05T2uFw6V5VPn/S+Gbi6WrHWBp3+vK9XEpREPfUqZ05ufr9pjJOD8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NJ5dERUP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K91jUdB8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C9B606A332
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 15:39:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3C9B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NJ5dERUP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K91jUdB8
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDkI1a3740649
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 15:39:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hrqRIR6qjCPCM/+FGJdCXY
	UIyo0/YN8fZuFRUdFOn44=; b=NJ5dERUP40lOCuplzsjQIQvEd1F/kSuFP2mZsz
	MtROmKsv3rhLeZkBKDu36LnnT4L/+FT340iAaUa+hgGU75PtXhQVZd8xKJyLmRt3
	vhXnKKhiGDpOu4Nf7Oj/r80zkjoYlGPpEVgyYAPSoS71O0N9rfb+u1zxe8+c2qDn
	H+EXHuROidDO317QMgW6jERiqZoTW7z1YAmUrUmMlxdcK0FY7TJScS3U8nVgLEWy
	aetipLGOtjNlgP9xGYJfimwdbC2e1ilg38tDQsgs6HFch41sQ9VzUOVGKbyO8DGb
	SOaH6/CF60lQaqKBAoW+ZfHd14f4E6syAS71oiVIFMGkULXQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqh7cq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 15:39:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb93c874bso600059385a.0
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 07:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794670763; x=1795275563; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hrqRIR6qjCPCM/+FGJdCXYUIyo0/YN8fZuFRUdFOn44=;
        b=K91jUdB88Plo788fch13ZtsICCRBETCrLq0QvtWPxK4C0raM+ojhua9hmEIdnq+yfv
         Ce5thanxSEX0/fp1wlCA2FZxaL6DhE753hoPTOedBZa1aANXdhPuH7+m+6h9S9QsobpC
         0yXd1d8qvxZDUWW0op+A92+x8fG4+YwCCMTS2HrDqGqIs69FNcI3U4cv9t0qwC9u4QF5
         v6IstF+Zf+Tg/WqiSLW5byTHp2fzZC51mWdgjo/8orCpm4ZpUZHBA6kMaM7fSksyW3xa
         VV9xK8Ox3yYIgmdXMCGyHpx13NpijUc/92NkBcr7e1MF/3OpUrq5ZkbPQaavIJxopwdp
         7/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794670763; x=1795275563;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hrqRIR6qjCPCM/+FGJdCXYUIyo0/YN8fZuFRUdFOn44=;
        b=g0WEs/6MaxUtTvzu27JKjvIpssmKxY//t7dBoieZqLUu2EcvOjwA7xTzz2hIh1W11S
         dYy4tU6w+yfUaaDbHMJpXB7raLRSOyzuR1AJIVEge/kmpzoQM/ysO3dWO/6Bg+nzUbIJ
         lYtHPHwylRRt7e/l9oqb3xJick6yxQkz6oqMv2ttcX+ajopsxIyODRfC5RmGBSb84Agy
         RqvLOor05MEjr2dD7hLerpSfWT+/DBqso2WxLB01sKt0exXCNKApc86lPDztZHPMdT8a
         uDWW3q2ltYIWkKL8+S32BBNfJq9QkiFjrxNqRlYoRzi3FK+IytvnwrK32B3URgA3Ee0J
         8UZQ==
X-Forwarded-Encrypted: i=1; AL+hErGOLvwW4d1QY84jeA1dgLjNPAQytSrF3vBP8yY8n0aYhUbyxKbLVI4VL8zY/MuIISCkA2tnTDw2IQno@vger.kernel.org
X-Gm-Message-State: APuU4Z8MBtS8Ec1GnMMHA8pUkebeQbnkVWLg+dKlqnZqaRqzYhcRoost
	kYK5VrjuiiaB1sKEiZIj/HvfqQHA8/j0obDidATxuntWh/dpNxq5gt2/OerKq6Dhq7qJkSW8Ahw
	oxa8mlgH6nHHsHW9ZHJSyIpQjY6cobwUwexW+ld7QJ+FRaE/ii0G/c6xox6gypd71
X-Gm-Gg: AYBFou2xU5SdaQdn0X3NdTz/4uy0PsMhc8DRJ7i4CDBlimO0Cp8J53F4lHdaxH+EftN
	aINXrr6TO61lYRy6g3XTbpU6cXUAfU24KAMe4hkk6ntmv6Jhy3RHfan6gHoR1ZxXYkud2aAPrJz
	nO8C1kh++v5A2XjZsihHcIkUhieNnkW3sz4G/B6Y0ae0CSjE6NvInz0Tj970VWuGAoZa8jad0Fi
	znp5C/xnoOJeRAcurVgpcEr91m1JvQms5BV7bJpRl9NHJczMdowSBo516fQ2XBvwSMF+yfMeVxS
	BtGYD+n8/mRmaZjYnBfrEua23mC0Y/LpWKBBS0oEtVQzpVe42UiFnPY5KMC1VZp/Y3sn358mPxJ
	V2Sco34fOGeQTCZe99aAbsKCHxVO0wd1xxIVArOC1WNAMVoZ6Y9ExlIG9TAgueCg9YNf5bdFDjG
	WTEn1OXqHBdFoV
X-Received: by 2002:a05:620a:1a17:b0:945:c430:1c09 with SMTP id af79cd13be357-9493314ae9bmr1452402785a.37.1794670762777;
        Sat, 14 Nov 2026 07:39:22 -0800 (PST)
X-Received: by 2002:a05:620a:1a17:b0:945:c430:1c09 with SMTP id af79cd13be357-9493314ae9bmr1452400285a.37.1794670762326;
        Sat, 14 Nov 2026 07:39:22 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50a6c826bcsm167268366b.11.2026.11.14.07.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 07:39:21 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Subject: [PATCH 0/4] arm64: qcom: QCM2290: add the Embedded USB Debugger
Date: Sat, 14 Nov 2026 16:39:03 +0100
Message-Id: <20261114-qcm2290-eud-v1-0-b6157b817377@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0MT3cLkXCMjSwPd1NIUXQvDVEODNONEi1TTNCWgjoKi1LTMCrBp0bG
 1tQBgwEv3XQAAAA==
X-Change-ID: 20261114-qcm2290-eud-81e10f3a8e5f
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
X-Authority-Analysis: v=2.4 cv=KelHIgYD c=1 sm=1 tr=0 ts=6af880ab cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=b45o4kL6AAAA:8 a=EUspDBNiAAAA:8 a=rVLXYBqpOHlN8aflTEgA:9 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=dhdsR-PFWuPJUldTnwXm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA2MiBTYWx0ZWRfXzWb2bzBV9QXG
 v14ayf6tY2lmFyVbZhq9WmKOQzCc5p7qQXN8kl4cqrkgB5tw5PzK+VDXvfyYZFEfa/hAdS1a1+1
 K40t3qnDrw35kv0/OeyD/82iOyeAMBI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA2MiBTYWx0ZWRfX+AC9ppLxwZtT
 6+NbksgmXbrjFpJtxl4/QOFALEugcsvOKb0T3ZI9lcVCLkJyUzEKA3iOeJE1YxkXKoyQUKMt9tO
 sIjGvTZIC9Qg8+BKwgorjYxk4B0QZVwPA2cetkXyAp57beF9A6scQiO+PKiIGwHPOJP6Hk2cBZ8
 oZhyAFO+h9D+rWEenx6HD9kmY9637zoS5fXmbHftGJ3bt3UvbdLjiAjOupXZ1rXXCUZdOm9Hnrk
 Yxbf37xX/jqwWB4G+7SabUYpICUyAOskEdLS/jrNpolBZe86zBgAVHB2AIxLssn4Cv12u0TAJQY
 nI4o4fdwS7UKIS0kpNeG2ezv0G69YocYO1lfm4Fo8JZPCxp9XPiCp86SDqyGLg+DapfO+CejOiQ
 Gazdemm+wnfFa+2r0grCkoiedvGus7TEpv285aXLmC7NTS9KZnTLeiXJJQxwkl3/s6qeax3sf6B
 gUXML6PbE3gJdV1rPHw==
X-Proofpoint-GUID: az97WnuR3GxHmRXC7R7xSL67NLTbSQA3
X-Proofpoint-ORIG-GUID: az97WnuR3GxHmRXC7R7xSL67NLTbSQA3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140062

The Embedded USB Debugger of the QCM2290 is the block the SC7280 has,
with one difference: its mode manager ignores the enable (EUD_EN2)
unless the TCSR register TCSR_APSS_SPARE_REG1 is set first. XBL_SEC,
the secure part of the boot loader, does exactly that when it enables
the EUD itself: it sets TCSR_APSS_SPARE_REG1, then EUD_EN2.

Patch 1 adds the compatible and describes that register as a third
reg entry, patch 2 has qcom_eud write it through the secure IO call
like EUD_EN2, patch 3 adds the EUD to agatti.dtsi and patch 4 enables
it on the Arduino UNO Q.

Why Linux sets the bit and not the firmware:
- XBL_SEC runs that sequence only when the device's debug policy (an
  optional signed image that enables JTAG) asks for it. Without one,
  as on the Arduino UNO Q, the board boots with both registers clear.
- The stock TEE (QTEE) does not set the bit either. It allow-lists
  TCSR_APSS_SPARE_REG1 for the HLOS secure IO calls next to EUD_EN2,
  with the same policy (write allowed when secure boot is off or
  debug is not disabled), i.e. it expects the OS to set it before
  EUD_EN2.
- TF-A does the same on Agatti [1][2]: TCSR_APSS_SPARE_REG1 is open to
  the normal world in all builds ("this register only permits EUD to
  be enabled"), EUD_EN2 in debug builds only.
So with either TEE only the driver can complete the sequence, while
the secure firmware keeps deciding whether the EUD may be enabled at
all. Where EUD_EN2 is refused, enabling fails with -EINVAL as before.

Tested on the Arduino UNO Q (QRB2210) with next-20261112 plus the board
support it needs. The A/B runs use the same kernel, with and without
the third reg in the EUD node; without it the driver only writes
EUD_EN2, as today:
- TF-A, built to allow EUD_EN2: with the TCSR write the host enumerates
  the EUD hub (05c6:9500) and its control function (05c6:9501) in each
  of three enable/disable cycles; without it the writes are accepted
  and the enable reports success, but nothing enumerates in three
  cycles.
- Stock QTEE + Gunyah (secure boot off): with the TCSR write the first
  enable after a fresh boot attaches (two boots); without it nothing
  attaches (two boots). Reading both registers back through the secure
  IO call shows them taking every write. The USB controller node was
  disabled in this setup (Linux cannot program the SMMU under Gunyah
  with this DT), and there only the first enable per boot attached;
  re-enabling after a disable was not looked into further.
- OpenOCD's EUD adapter attached over SWD on the TF-A setup (earlier
  build, same enable sequence). Not tested: RB1.

dt_binding_check, dtbs_check (qrb2210-arduino-imola, qrb2210-rb1) and
W=1 are clean. Elson Serrao's pending EUD rework touches the same
binding and driver; this series does not depend on it, whichever lands
second needs a small rebase.

[1] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/55733
[2] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/55964

---
Igor Opaniuk (4):
      dt-bindings: soc: qcom: eud: add the QCM2290 EUD
      usb: misc: qcom_eud: set the TCSR check register before enabling on QCM2290
      arm64: dts: qcom: agatti: add the Embedded USB Debugger
      arm64: dts: qcom: qrb2210-arduino-imola: enable the EUD

 .../devicetree/bindings/soc/qcom/qcom,eud.yaml     | 19 +++++++++++++
 arch/arm64/boot/dts/qcom/agatti.dtsi               | 33 +++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts |  4 +++
 drivers/usb/misc/qcom_eud.c                        | 19 +++++++++++++
 4 files changed, 74 insertions(+), 1 deletion(-)
---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261114-qcm2290-eud-81e10f3a8e5f

Best regards,
-- 
Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>

