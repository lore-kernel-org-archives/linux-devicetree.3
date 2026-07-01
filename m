Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE7B223DE5
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 16:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782922556; cv=none; b=L0sTNeY97FMS5thKXlLwyFPUMyUEJ0TzIgXWCRRyVyQDWyHu/4/Lh45BohQRGLxJ04LpVHQwI18qZzGiJlCjG/ZFVz2eS1weD0AkAMtj3vpHoC8ra32zI9x88h9Ts9EjwJMSKVprdEYMiy8NaG5gwy/8eC43doFGMmb6XOfJS0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782922556; c=relaxed/simple;
	bh=fffIHIq+K2Xt5vA/CwQMB8tzEP5cr2Jy2YbmMNydBjI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UA/HsE1wu+iLJWR58b6PQ17Apj2ST9PPiJfPXynSsaljRoOOMHOlzPnNYG6XuYyIAFyvAdGM+WsDALpjZmaEfK15q4r650e60FNc3TT1tglQqZhMB6MrV0QDtjSDJrFkNNWAPNTNhBzdNoEou+qSNNspFz9SkmluPvDuT+iVhAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pCWIxKkP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WTXzWTcS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pCWIxKkP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WTXzWTcS"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661G4lPc1510110
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 16:15:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kf+pwVBk5mAbEcKiU3KEkL
	A1zCtomGQqKVOFrEXk2TE=; b=pCWIxKkPE1J7j2MUqm8bIguckB3q4en2Y6TK68
	6a26I7gMeYxeJXJT47MCx+/MIAWRHIPPbzipzT/Skd62EymUx1iFG0BO9RxQRT9X
	AOiUuLLPvB9g/RX8bRarrxfttgQkKl3ukmjuYahVpZwWfZdZo+xzhqLF4EpN1hZx
	fszP8Y3zqRnYMHtZ1EcAi1UUTPULbH7HWrFcxe1V5uQJQbkuDuLska9oSupFDTZJ
	FhV7Kdj4cqmBweK17aPk5HRmL7dgXThz2FEygbiPm8f+g8AnRC7Ov+elsNwCfItt
	1Wd0mRZJhud1YW2uGtCKELqTk3r/Lln4lHCERE/UQ4+1depg==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f563mg1qy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 16:15:54 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-69e96638382so411755eaf.3
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 09:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782922554; x=1783527354; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kf+pwVBk5mAbEcKiU3KEkLA1zCtomGQqKVOFrEXk2TE=;
        b=WTXzWTcSfWv1enyYQ1kV8ijtiVngb+t3zFOkD+0C6BopKM+2KYQl41zQ60CWu93nJ2
         uEn2EitwoBeKMD9nLySMA254aJw4ffoJA10lHJVIvJx8DdJcjgUkwBI96abuPbtKvjzO
         1G2J+Li3KK8ynmWqrHcvwO9HgGTy2/aGcKJbdYI9Kwx0S10gjpS1qZ0hL/EsC7kW2E0a
         yzZty1ZZdr61ryav+v/H1h0mLPNljdgWuG2baFZjAFCR7Mm5MQp5xhDwCQdc27hTgyGC
         qrJyxL4ys6WtQcfTARscYNBE2YQ5oLcSHsq/40ijSc9xVoHZaM51j7EHoYMaPtCAmRq9
         UgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782922554; x=1783527354;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kf+pwVBk5mAbEcKiU3KEkLA1zCtomGQqKVOFrEXk2TE=;
        b=IUibXaf0ZNeOOhU7WwaLzu3OMW9i1xTJzXH3KC1+SH2ExyHjw2k4UO1fB/GD32PNx0
         26JK83qNbCVlbFnEXmJqqy+zwLZ9dQ6EY+c7iQrm3+/gDDIeocRyPebjr3oPPXf7zZxa
         ZRO6UBpu52mY/YpEmvZEKFfhn4F1imyXHDsPNhHqOwt2nuERqYWibZXn8Kk/uNh93D3i
         7qIRz8e2PRaR7i5rIeknsOhw0jnkYDtNfjJm31bGAEpanxF8ApOVvPzopfuK98wXiCyi
         9kFlvthd9kMfONhqMtvPjVOLU/HebFfceJhAeNyu85zXdOt7d4ahiMMc02y3p8udlBpo
         uunQ==
X-Forwarded-Encrypted: i=1; AFNElJ9YjQM/FkxJUc8jHWQzxY3f/9+BtMWne6bM4KAJ/G2733CyYAOgjAlJ/pLH293frPeVh9A2kqgJXAlU@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw/d74CHnIL5hwBkFqAD9FflhpgzGYVNJKWF0NZjiiJUoKYfpT
	e+OxTp6Ta2VjGe3e8SK5q2IdEKkedyJ3IRNdSmgZwGR3+AoAReOw+0R7FSabbVfCOKztNm5UKVC
	FjG93FijjGNyNCwP9t9qEMQKlCv8z2E71WXuEIczj2QFIBcOaYK9mAyg4aOiNDj/L
X-Gm-Gg: AfdE7cnpanfRBO4o18xRE5gTSdI5jwwQfqXVmcZfuLCC2SBW2878HGCvD/m9XiSIm7w
	+NXqYaM4uoNOBqb1O/25iUsM6EmylP/+i3yFxceyc5IuVzVJXEgPpLpea9Iv1G95B6END6TKQLk
	E3R6DQx3k3v1IYQVkC86bM2s6KJsV103XXw2MxSQ1f6ov95zqKQi4dL4FTP8Z5tyZkDOCjvv0Lu
	Mrr+IIegKwZLBaw6JP8cxu5Ce8SeH8281Ylqx48FxIvHVH9FoawfnreuzDzQT/ssm0crkae7xyE
	unDceibqnpSeD7b8RcAQL4ELaR+0ytzt07nQGRMoUlfe+G/fKxZZzYMdBzh/m8XpAs/OO4Lh3cz
	oHCrTsSrC5T7lcVUdclquRvAF8zlXjvc31OdBZPLCqk5Xlz1XYBejZV5wuWYC2wNRexb8SXFRel
	RHo+fmEb4wlDRQVDrxFDfQdXMq7NyK2ur3ZQXGKXn7dvIuOh/hqPgRpK4MiahUjZw=
X-Received: by 2002:a05:6820:829:b0:6a1:9a9f:7be8 with SMTP id 006d021491bc7-6a309b37233mr1197984eaf.48.1782922553811;
        Wed, 01 Jul 2026 09:15:53 -0700 (PDT)
X-Received: by 2002:a05:6820:829:b0:6a1:9a9f:7be8 with SMTP id 006d021491bc7-6a309b37233mr1197959eaf.48.1782922553393;
        Wed, 01 Jul 2026 09:15:53 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d1ea70sm299570266b.3.2026.07.01.09.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:15:52 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 0/3] leds: pca963x: Add multicolor support and enable
 Monza RGB LEDs
Date: Wed, 01 Jul 2026 18:15:50 +0200
Message-Id: <20260701-monza-leds-v2-0-c1be0b472926@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADY9RWoC/22MQQ6CMBBFr0Jm7ZC2IWBdeQ/DopkO0gRa7ShRC
 Xe3snbzk/eT91YQzoEFTtUKmZcgIcUC5lABjS5eGYMvDEaZVrXG4pzix+HEXpCMNdweybrGQhF
 umYfw2mOXvvAY5JHye28v+vf+zSwaFSoaOlKu86SbcxKp7083UZrnugz027Z9AVn3Q9+rAAAA
X-Change-ID: 20260629-monza-leds-c292e68c9a49
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: apPNfWGaWycWHi5bIr649zDXUnJ2Tiu3
X-Proofpoint-ORIG-GUID: apPNfWGaWycWHi5bIr649zDXUnJ2Tiu3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE3MiBTYWx0ZWRfX0VkFJRkx+HlB
 ByazzvW9iIaHqHgv5pLN9aLlOpUekcfQ4Pf5iu0VPUhv2DO8Ju3298JPBSCutU5BgVNcxTNqkKA
 RNHut5/kr9F1eEeuNxINYe+ZtEU/T+sjb8w8lb9bOEpcXDZ3HOww578LuvK6ScuaghlbF3dUSVf
 67o5EUziFKuW1NCItQy3Y9LVuH9mmamLTHzyC2Ho9eVbiggl3Fq1+1CzK0X39UDi/1eCvQG3S0t
 XgVV9REE8PP0nZbCd4FV7/L0z3b9S09zJhYDuqwVt8jNQ/CR8rblUIPv0YHn5kw6MF2IfFCFzG8
 Jls2Hq3utS5+4JYXCoLaLt04vEMkti/fRZQ9MWY9ml73wa7BqOHqv+19tk+3S/RFNsKl4mX8KiB
 twozRl0qXeZeWpnkwcKWOCPVCigrFnFoUr+CUbeT0si5zxWv7IrJH//HAWS/rBRLPW2iSDviwZ4
 5dPsQNvSL0Ha8Tcd2Tw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE3MiBTYWx0ZWRfX61WKTfT0qkhu
 g/PbqfJfKAL5/Z7Qw6fenV3rbyLSAk4rO/4DWhTXhVO3xZanLzSw5UUwwvtA2n1afwXXZPJ4gvA
 rzbIwUWPWs20oCFLAgHPXjrAaQnBFKk=
X-Authority-Analysis: v=2.4 cv=UopT8ewB c=1 sm=1 tr=0 ts=6a453d3a cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=yzvYhh2-rlWI4r5pe9MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010172

Some devices use PCA963x controllers to drive RGB LEDs, where
multiple PWM channels correspond to a single logical LED. Add
support for grouping such channels into a multicolor LED device,
using the LED multicolor class framework.

The DT bindings are extended to describe these groupings via a
multi-led@N node with sub-nodes representing individual color
channels. This follows conventions used by other multicolor LED
drivers, while maintaining full backward compatibility with
existing single-color LED definitions.

The PCA963x driver is updated accordingly to detect these grouped
definitions and register multicolor LEDs.

Finally, the Monaco Arduino Monza device tree is updated to expose
the onboard MCU-controlled LEDs (compatible with PCA9635). The MCU
manages four RGB LEDs mapped to channels 0–11, which are described
using the new multicolor bindings.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v2:
Changes in v2:
- bindings: Reworded commit message to explain the motivation (Krzysztof)
- bindings: Kept the "^led@..." pattern and modeled multicolor groups
  via a dedicated "^multi-led@..." subtree.
- dts: Renamed node from "leds-controller@22" to "led-controller@22"
  and dropped the unused label. (Konrad).
- dts: Moved "reg" to directly follow "compatible" (Konrad).
- dts: Fixed unit addresses to lowercase hex (sashiko).
- Fixed checkpatch issues
- Link to v1: https://lore.kernel.org/r/20260629-monza-leds-v1-0-0cf7c0a7dc14@oss.qualcomm.com

---
Loic Poulain (3):
      dt-bindings: leds: nxp,pca963x: add multicolor LED support
      leds: pca963x: add multicolor LED class support
      arm64: dts: monaco-arduino-monza: microcontroller LEDs

 .../devicetree/bindings/leds/nxp,pca963x.yaml      |  79 +++++++++++++
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts  | 110 ++++++++++++++++++
 drivers/leds/Kconfig                               |   1 +
 drivers/leds/leds-pca963x.c                        | 126 ++++++++++++++++++---
 4 files changed, 299 insertions(+), 17 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260629-monza-leds-c292e68c9a49

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

