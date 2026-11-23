Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452187;
	b=BxHbi7Is5okZVx+Ggo0FBd9Wp48R+BoJIT5dF6plGZmFaAejwgzhKDGo0GKILSTLlGF2
	 91HgOBn30BgPyAV8mXMYAvCJRAbZC4sRJynRvWN49aodAf/1aNsayts+ZpInJpl2pqmrD
	 aSwLZFDKJM/m6fgwjSgfUKdlXoxKSBbgUpVwSPV2ghKgzYlXkZ14pLQIA72M9F1obji2S
	 6PRnXoqagiE+m+Q3DS9DfLF/U+K2TiGkDoMBrGTiLwTgjELm+2h6B2cNid45sXB5F6jPX
	 2YlaJEncf9v1LgRlYMM7//uSLP1iteCPtSvfrDjK+UA/Nl8sBMQw0r9ttcXyFGLGMpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452187;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fcVhwGNGEDbkrG268cH/it3jO0ipQUHOtEv4oZrCYV4=;
	b=YkbU8mPET4zH6VSGBVJqbVTm8sEDCUH7LejS0qTgou58HeaP9ITkIVx7rkf9dGaxjUKQ
	 MdVnxBpaJQvamnQCzLkJMq2e8YFBcZpb2DBh/C4hH4I9oyWqSfiLP+BG0+1iBtCEUAfdv
	 R6ieX6HGpDkISPEEyoKb6VoyM9czHQzrkP+tA+EusKQn+a/8/elV7Mn0Jj+eiSVUK62v/
	 JmXkFet/ufASwmDi2ZvYVgYzqzT5G6gAlGkZnUUNFgPh54RubGu6KmbkVDjKxa54RiBJl
	 +PyxQAi+ILlg3u5R2S04QJJOWjx14o7uki/t6LSEARpthW+8uaOdrH2OcwdniMaQysg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Afw4t7Mt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Sm96VJn/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD90C606A321
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 16:43:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD90C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Afw4t7Mt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sm96VJn/
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGpGN2768985
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 16:43:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fcVhwGNGEDbkrG268cH/it
	3jO0ipQUHOtEv4oZrCYV4=; b=Afw4t7MtUxa8Qov8eQ9L4lq6ezGyeUEseouspj
	krKMoXo2mrkY02EZSRjF+izliAY780yCyRH36uh2EVmpsJeV6mj3pytdZauHJJDU
	Nebz99labw2OJyLP6EDodcPyW7AQNcrBI6ofWN4nJcrGjtrxPixG0NaAC8rE1a4f
	bWSQew5VN7VLftqq3G8vHqBIJb6/2OfihSvzH/h62Igi+qUPXOr5JRpjW6gnYOvV
	W1ZOXqeuqJSJlzgqhUWt1m52rBZexVfJ50z+KGtzKlrcc0bcen9qtc5ocVKLjgrU
	9oFKos1FiZ2rx7invxBODdkjbZOivYNd9hikFhhMfmJvQnXQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pacda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 16:43:05 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ece7e4af28so2596188e0c.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 08:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795452185; x=1796056985; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fcVhwGNGEDbkrG268cH/it3jO0ipQUHOtEv4oZrCYV4=;
        b=Sm96VJn/nS+ftEAnyeCEog/FvM6PZfILG9EsQM7bxQZocl9X8nahBAKcDndiLKNyTo
         S+d+fZRfHmB4SjLik+4vjD7i3MRNTwR4b1Qu3+w1mwoaXPEwjjudKb/do4znB/qh9C0p
         ES2BmpGBcPARpyxgO1dSIRK70qiX8i7zWev34vIrZdWygUrn0Z8KawBWlO9qQL+AaCLC
         vU9LTjVSN4oQhJRQKgGmHyA4/pFuogJM2l+LbcSDLhEaPo8EQ214txqJg77opfQwrUE5
         cdtno9lcM3eNo+lpEIqC8jB8r6OnOT/GkY/kxHvbQOODsuLmJ9fgbcHPBkq4nU7CFrJ8
         +xmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452185; x=1796056985;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fcVhwGNGEDbkrG268cH/it3jO0ipQUHOtEv4oZrCYV4=;
        b=1Z7qYHT7yxz/Uf8eoGDnN5cGEvY/PcZNID2ZUqo2ZFIcuV9VlUsUkfMpScS7Bw/Ver
         4dJDMmFSuDwD/5LIz7IIedBLBkToPnWR5YVY+yoDzo4QallTruJdcSY23a669LQwlyha
         TKr7IX4ikNiCsXEt3544anEambjyu5SkRCq5xcg3hMh1AwOo5rVoigw8knTuwpEsB7fy
         1eOmvoB8LvF3teX0EwigZgrDWMdxHwRd1SGYKSYlEtftVEoWFg0eSX6c2Zi0M0tsY/Kv
         zTMfu8auuID9bCzHqNDQXzmyC2E323OpqKxhZe4ZMm7JpXNZ59BCrJcDfv8vtFieJx0g
         Msgg==
X-Forwarded-Encrypted: i=1; AL+hErE/Z/i4AM5cK4lxognQJAL4qzU0hyQGCF2Yq11PHfo+pRGAJd7McrHftSDVlyDDgA0LtvbJzKsiA2Jw@vger.kernel.org
X-Gm-Message-State: APuU4Z/bHLk6wQjEdsKVVVyIH1zV5n3gh71gvBNh0j07Hdk949sV3eh8
	AADYWAHgm0FHKlTkLuu0uDOeHrSr1FGHLLw+GikCLjr0GMDlTV4aubvj7r+Env1QSCrxQg7ZwO7
	jOTfqfVW3d1SSoh7XIS/jh52VMip99Iw+zk9AMbRTm7RIyWUgfQr5ga4PVgmpCvYBA+TmpAED
X-Gm-Gg: AZFdTZfvR+QJIITwoqOWxN3TL7tmSAh73fNXiDqJVG9gTDzSEuEYefI1J6PhlgTCwta
	gkSk3aVHD3N1NOU9oGkTGF5APStRuXEGDtR1Q5c+HRFZ6tB8Klmg7fa+hhQnqRvMzI8Rtx522Pb
	GRjXD5fM5+YeDYJ9Ni4uY2Tk/xDZUgTfp3/aZavEXqAHEw9kMa3vyII50ih8h7F9eVHBql98ShM
	tYBTe1Ngvgjz/PHuNeNU8aAV6gto7Sl0uo7G6CMhXOK6dVEX8sI4fv3iNfjVceyreeszEeXPC6k
	iRSbBoWa6EoJ0XV9vSFYier8WhphefWhUQfhPg3C0vNqtaAYVPBWLffLK4gg5e3EHGSz928cA/3
	j/2xNbnluWv+aZZoDQc0fSPfGWnfxi8+zHuzX3LA2YbyMpDMhD1+atrEmvZrhLzvchBIQhXNtY2
	mnCYp8LLOijCxL
X-Received: by 2002:a05:6122:e14c:b0:5ea:c37b:450 with SMTP id 71dfb90a1353d-5ee8af9e1e0mr6465994e0c.20.1795452184752;
        Mon, 23 Nov 2026 08:43:04 -0800 (PST)
X-Received: by 2002:a05:6122:e14c:b0:5ea:c37b:450 with SMTP id 71dfb90a1353d-5ee8af9e1e0mr6465964e0c.20.1795452184261;
        Mon, 23 Nov 2026 08:43:04 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm426725366b.80.2026.11.23.08.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:43:03 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Subject: [PATCH v2 0/5] arm64: qcom: QCM2290: add the Embedded USB Debugger
Date: Mon, 23 Nov 2026 17:42:55 +0100
Message-Id: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22MQQ6CMBBFr0JmbUmnCEVX3sOwKDDIJJZCK0RDe
 ncrazc/eT95b4dAninANdvB08aB3ZRAnTLoRjM9SHCfGJRUFSKexdJZpS5S0NqLGgnlUJiaygG
 SMXsa+H3U7k3ikcPL+c8R3/D3/u9sKKRoKyx1W6MutL65EPJlNc/OWZungSbG+AW6blr5rQAAA
 A==
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2NiBTYWx0ZWRfX5pcf8YuNaMXq
 hzA5QqCeCVncMURwThJ5ApjuaSOvbWIRQvmTiDw6//P6z4npfYZ1BCmSPE2rRXYiGrjChoTemX5
 WT6q6CIFWq2mkiF2ryVWe1ZXFRij14bS3/xsjIQugFHJ2msABaBMkO+0e3wMdBFxBG7yrkmk4is
 s+848AA73hAXLFiIkOHFedXllzxn57joSwfgRaA/Azr1hRTPcIv7jSsN4y+z97y8R2Co/5tMELh
 UPg+VjlcuzriseEFenb/EINhFUfDmT2mPZp7EHgJMxvXbR5vxczPinIXV4Cef5qOLL4u2re1Qcr
 FrOu1/y1ip3LmJTGiQriknZ4dF/8lLU+X4onwG4ZjzQ7t1PxFrnQPEWe16WO7G52W0QBz7xsE85
 Pe1IdTBjZ2Jefnxwu0WVx7kBHFM2Y7Jb/CdATK6hwIOr3R6NzmVMF69+kB7blBbwpkmwFro9IwB
 l5es01/+iD7GMTEwO3Q==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b046d19 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=b45o4kL6AAAA:8 a=dAV_Tri6AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ibbWKvYsyCdnmY7Y1RYA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
 a=dhdsR-PFWuPJUldTnwXm:22 a=jmfqb_Px-22hg6zlGo4Q:22
X-Proofpoint-GUID: qAzZqCEpmgjbXlUmgE-pXXQa7p6v7Oai
X-Proofpoint-ORIG-GUID: qAzZqCEpmgjbXlUmgE-pXXQa7p6v7Oai
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2NiBTYWx0ZWRfX6kOCVOAnGlt2
 UHUnPZjXSP9o235hGappzCAQQjeHLO9hEXxxfradL50xqcwPsRSgV9fcQaLyvIj1tYggmRKEEpu
 /rnHgZg0EP8SdlGx6keYYIdsS9amjzc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230066

The Embedded USB Debugger of the QCM2290 is the block the SC7280 has,
with one difference: its mode manager ignores the enable (EUD_EN2)
unless the TCSR register TCSR_APSS_SPARE_REG1 is set first. XBL_SEC,
the secure part of the boot loader, does exactly that when it enables
the EUD itself.

Why Linux sets the bit and not the firmware:

- XBL_SEC runs the sequence only when the device's debug policy (an
  optional signed image that enables JTAG) asks for it. Without one,
  as on the Arduino UNO Q, the board boots with both registers clear.
- The stock TEE (QTEE) does not set the bit either. It allow-lists
  TCSR_APSS_SPARE_REG1 for the HLOS secure IO calls next to EUD_EN2,
  with the same policy (write allowed when secure boot is off or debug
  is not disabled).
- TF-A does the same on Agatti [1][2]: TCSR_APSS_SPARE_REG1 is open to
  the normal world in all builds, EUD_EN2 in debug builds only.

So with either TEE only the driver can complete the sequence, while the
secure firmware keeps deciding whether the EUD may be enabled at all.
Where EUD_EN2 is refused, enabling fails with -EINVAL as before.

Arduino UNO Q (QRB2210) was used for testing, next-20261112 plus the board
support it needs and this series. The registers were read back through
qcom_scm_io_readl() with a debug patch.

TF-A built to allow EUD_EN2, three enable/disable cycles:

                 write   "enable"   TCSR   EUD_EN2      host enumerates
  enable         ok      1          1      0x01010101   05c6:9500, 05c6:9501
  disable        ok      0          0      0            nothing

TF-A release build, which refuses EUD_EN2:

                                    write     "enable"   TCSR afterwards
  enable, clear skipped (as in v1)    -EINVAL   0          1
  enable, this series                 -EINVAL   0          0

Stock QTEE + Gunyah (secure boot off), two fresh boots, two
enable/disable cycles each:

                 write   "enable"   host enumerates
  enable         ok      1          05c6:9500, 05c6:9501
  disable        ok      0          nothing

With v1 only the first enable per boot attached there; now every one
does.

OpenOCD master with its EUD adapter plus the SWD fixes in [3], TF-A
built to allow EUD_EN2: attaches over SWD (DPIDR 0x5ba02477), halts and
resumes cpu0. Without [3] the EUD's SWD function returns USB errors on
my host, with the kernel that worked in October as well, so this is not
related to the series.

Not tested: RB1.

dt_binding_check, dtbs_check (qrb2210-arduino-imola, qrb2210-rb1),
W=1 and checkpatch are clean.

Elson Serrao's pending EUD rework touches the same binding and driver;
this series does not depend on it, whichever lands second needs a small
rebase.

[1] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/55733
[2] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/55964
[3] https://review.openocd.org/q/topic:eud-swd-fixes

---
Changes in v2, all from the Sashiko review of v1:
- Binding, driver, dtsi: the TCSR register is no longer a third reg
  entry of the EUD node. It is a "qcom,tcsr-reg" phandle + offset to
  the TCSR syscon, which already covers it.
- Driver: clear the TCSR register again when EUD_EN2 is refused; it
  stayed set before.
- New patch 1: clear the enabled state on disable (existing bug).
- Link to v1: https://lore.kernel.org/r/20261114-qcm2290-eud-v1-0-b6157b817377@oss.qualcomm.com

---
Igor Opaniuk (5):
      usb: misc: qcom_eud: clear the enabled state on disable
      dt-bindings: soc: qcom: eud: add the QCM2290 EUD
      usb: misc: qcom_eud: set the TCSR check register before enabling on QCM2290
      arm64: dts: qcom: agatti: add the Embedded USB Debugger
      arm64: dts: qcom: qrb2210-arduino-imola: enable the EUD

 .../devicetree/bindings/soc/qcom/qcom,eud.yaml     | 25 ++++++++++
 arch/arm64/boot/dts/qcom/agatti.dtsi               | 34 ++++++++++++-
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts |  4 ++
 drivers/usb/misc/qcom_eud.c                        | 57 +++++++++++++++++++++-
 4 files changed, 118 insertions(+), 2 deletions(-)
---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261114-qcm2290-eud-81e10f3a8e5f

Best regards,
-- 
Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>

