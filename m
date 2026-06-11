Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70002D5940
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 14:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781186733; cv=none; b=sQtXONjX5+tLBT138Y0w2X82oQBsV5cvoz/aBGVGQY3GekprrOviJIsGxLfLp5sScJRu0/Pt8hGxYNxsdKN7aYKhLlu8VkUe5U8B58bXa2sRkY3k9GG8Gw9+BmU/HVHILofbr39DHevQZtrrJJmF0zHZVQFKFY9OxaTnvkcE0cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781186733; c=relaxed/simple;
	bh=Fw6gQFY3Gd6QiUmAnZ5DyWfDoT8MRmsSY0h3Ikqq92E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jouUZQ5BzAqarLiWNhd1KA8FxDAfckvyJ95eDo5CSMeVhW4Au4eRt0npVcKE4dsfzSj9pbnffoQC/k+uduUn2xk5R0cq14XJm5YSeeNHfR7GT4IzmShClR68fFpw+uTksDZkMczkkkb9gT7i5g/avt3B6BPIej/horS6ln6rWkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dEhsvkhw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=giULm2VD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dEhsvkhw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="giULm2VD"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BCStGN3224872
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 14:05:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MLEQXryaifs1QKuY0lfBGF
	UrdbxoYxdxNfya3F5CJGw=; b=dEhsvkhw1U4iu8cqnXSRHKZTBzgsEEAYn2VrZE
	UrSVO3cLd39/DUacluu5SnpnJaaG+gJqL5RciDMb/OnY5ifk/LulLDxFvwMB40zk
	GPwkk4aIlZShbgGLgu+nH9u67BekipsJdAR+ZS8bS9WhUT5+sapxJ2wEyc9PEHCC
	E/yHlK/tCOJ+XRF2BnkfW/iAYXl2Vjv9u0D5KyIR/yEmlDC6EPBPDPEOv/gAaF+5
	4BrBNJr/8TszATRrTUmD0wjHC79SyreAyNfYqeS2lkRVf7Lk9w+PH/yB5WZ/xIXG
	AnP+ZySoIPSUrW1+RFtCnw7D5qN7SDFSpJRYjuAyNRgms7xw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe79kqwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 14:05:31 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36b7f696b40so4977329a91.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 07:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781186730; x=1781791530; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MLEQXryaifs1QKuY0lfBGFUrdbxoYxdxNfya3F5CJGw=;
        b=giULm2VD5vQjF4dYEbquXK1nlWwmFkkCLP3pooPosug4tYQNTTXx8ekHHBLKO3lhYF
         cVqyphZ8JlysUpBceqCpobLpZBWahDL9pefJA2ZbWY0QTCgBgFYed9TbPVpHWIT6sz3J
         c4SnAZzYnuvQG8f4hk94w/atFi6lPhKscr1hhtdQKFnpNWDu0dNNEWJXVQ86f2cI4pEr
         u80ZSAflGPqCVlgXDhvAHZqe40QBGsJl3SGathyHpMbXsKOE4bvfHT0P0TVGaawzjOrU
         8kCryiuMblk87cQfsRqZv8bJ4xSwTQ3IY+3E+Mzs5zHxR3zErAiLjjT6q4BGXdcAgTR0
         bNNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781186730; x=1781791530;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MLEQXryaifs1QKuY0lfBGFUrdbxoYxdxNfya3F5CJGw=;
        b=oHxC4bRhaJRypvoJ84VQ9it2DbjPIiZimt/XDrhQ0EsOIkTxmXI5clFCuND2GruA58
         G/KysDn0Hiky73H+ezmX4g2rvjKATHv/PJnjosvpMdHa7/9hau8oCjIm4ohLTeHAnWxu
         92HxsTzFff3cLxYaCc86RqUQ3T63Ivc1iGM0xgcmNU8E7w2pLCSyxZfXe0tIgDB3TXdI
         dPv+dWt0w/XXBcLouLZvnZPnBhwpQJ36sibTDSCSsT0sYPVkW1vJ2e4xcgmokKb602x8
         MV0E1iWdnRC0KdMUIaaznGN93jwjHoZ/T53AZ1K54t6AWaIhNFwyW2TBC4RsrSBXFwl7
         m8JQ==
X-Forwarded-Encrypted: i=1; AFNElJ/qljD9XPqV7VUGB2DfYlT/2ylVa1icDTT+fTJFMJw3Ml58t9dF9FU9c01Z6YuoTxFZEELmPjsXAby+@vger.kernel.org
X-Gm-Message-State: AOJu0YwXgsesI633QO73bx1ucgBNXylLkscpFS+ttLOciKQ0Salb+Mpj
	EeEsUSpz9uB6Wt9O4kYwjZ1SAbuWm5ux/njxivYUrs16TZdF0/24lEI2Hru+kCPgbXSaEdBA069
	Fjx8M27uhpJArNx+kELqRhJbzJH1FpvOGGX+KcwUkXY4WXpsUX47v8PeNejQy4Yw6
X-Gm-Gg: Acq92OHWIgF/RJfccGLjcQSAEaIhqzgw1+Y8Jut+vqHP4GtfZ6Etai+Uj/CHskcQGP4
	O15FvEgaP2vwRPQkrE/P0JNZ86iAIyre1tXuB3/HFkxrMMK38kB9vAZvbUjj87lOqEDEcWGSNeb
	j0e8yqVyBhkcipQH1lup+gVw+TXQRARHQL1XyGganqARCWMIamsoMfHca0MjunpclN0oTuXc4em
	E4gZegHH69DQYtWuQZz0nyQICzxDfwbCTcXY+JkIQ3HyDv9pfGCJHa/ErD5wCgKQg7mWrleHqP+
	/R02vc0zhgpStTSPxEMGkAaZqcj0b0sGfmYH5bK3vo/j5BOo4r0FAKh09s1oSmXAxhfgI0ZeUNb
	QxaD+QxRN6F7bG00VLZFul677P7j4Ts3NRTdJiR2ztaC5pUuyqXD6pydE7wdt4rwubGKYdXT+SD
	GzMf5FOiiwjgIei1Up1OKDoJBoQlrXeOXkQ+Jv9oP7X7DVmp6sepjT6Oeq2AFBxv6u1oupVPTGi
	o6BQFRKoYn9
X-Received: by 2002:a17:90b:4a4b:b0:36b:d2d9:a584 with SMTP id 98e67ed59e1d1-3779f83d834mr3307658a91.9.1781186730254;
        Thu, 11 Jun 2026 07:05:30 -0700 (PDT)
X-Received: by 2002:a17:90b:4a4b:b0:36b:d2d9:a584 with SMTP id 98e67ed59e1d1-3779f83d834mr3307600a91.9.1781186729772;
        Thu, 11 Jun 2026 07:05:29 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64e2c810sm11133831a12.9.2026.06.11.07.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 07:05:28 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Add INA232 power monitor support for Arduino
 VENTUNO Q
Date: Thu, 11 Jun 2026 16:05:23 +0200
Message-Id: <20260611-monza-ina232-v2-0-e4375ce652d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKPAKmoC/3WMQQ6CMBBFr0JmbUlnjEVceQ/DotBRJpFWW21Uw
 t2t7N385P3kvRkSR+EEh2qGyFmSBF+ANhUMo/UXVuIKA2ky2qBWU/Afq8Rb2pJyjHvNxrRuQCj
 KLfJZXmvu1BUeJT1CfK/1jL/3Tyij0qqlXa8dUtNgfwwp1fenvQ5hmuoy0C3L8gWLVPByrwAAA
 A==
X-Change-ID: 20260610-monza-ina232-de180e669dc1
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Martino Facchin <m.facchin@arduino.cc>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: CKHCKMlFjSOQfRdAH0w3K3WUHXXkL7XX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE0MSBTYWx0ZWRfXxvwS5R1J3y2X
 6NM3eXCP/MJrCEWBcRcr4KS3MOwKUSxA8geR4AdktPo4mC2FoFBBQKUG69s9DYdRu3bnJjIDyLo
 eGs5eZnurGseA9C07lMIFk0pk5KShvWe0Ld1xpymL2nSisl4KCYVHvXYO6E/0QGeZqG6siH9A1v
 6Eaa/UKkgJJZJJfhABoZ78Cu4uw4aanUJYBYUGFLv41K9SFrpAQYOAlMFoYWn6oSJTwcJ9X36sI
 1bJiWzGnNzqtP2gGwvLMF+58ZIxuHUnZ9oiEOoq5/siNWOelhCVoXYfU3bwYjgduE8dXKhl6wef
 rj0/KVHYV1wHJEJ0gCYGXf46txk0E/dbffS/ayC2pEGNsUU8Gbn3B0oNgVrDMTFpHTMP/N9DB09
 L7M+O5Uc/Vnl6uSRfDztOSEplC5ClWi8PFpyH+03ss9LaTiKT4rs/Db3ECEE1brly3U9X6bD90x
 sWSqK7gyV6fLrHH3Sbw==
X-Proofpoint-GUID: CKHCKMlFjSOQfRdAH0w3K3WUHXXkL7XX
X-Authority-Analysis: v=2.4 cv=fbydDUQF c=1 sm=1 tr=0 ts=6a2ac0ab cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Nm-2SeViG6Lg8r77o8wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE0MSBTYWx0ZWRfX0N0+SG2elnFP
 e1wLq+6xoDlT/1TUtjtH0ZipO4tZhuGeRhPX6OZnkqnspVbpZGjibr/zV6oN8UqNYijUiU1ti1N
 8Rc6XD3/WUrJgZ38UbwN/zwF9Zhvvrk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110141

Add support for the TI INA232 current/power monitor to the ina2xx
hwmon driver, and enable it on the Arduino Monza board.

The INA232 is a bidirectional current/power monitor that shares the
same I2C register layout as the INA226, but has different electrical
characteristics.

On the Arduino Monza/Ventuno-Q board, the INA232 is connected on
I2C12 at address 0x40 with a 2 mΩ shunt resistor, and is used to
monitor the board supply current.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v2:
- has_update_interval was missing and should be set to true/supported
  (sashiko/Guenter)
- ti,ina232 added to two allOf conditional exclusion blocks. (sashiko)
- Fix commit message, it incorrectly mentioned 2Mohm instead of
  milli-ohm. (sahiko, Konrad).

- Link to v1: https://lore.kernel.org/r/20260610-monza-ina232-v1-0-925b0d12771b@oss.qualcomm.com

---
Loic Poulain (1):
      arm64: dts: qcom: monaco-arduino-monza: add ina232 power sensor

Martino Facchin (2):
      dt-bindings: hwmon: ina2xx: add ina232 compatible
      hwmon: ina2xx: support ina232

 .../devicetree/bindings/hwmon/ti,ina2xx.yaml         |  3 +++
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts    |  6 ++++++
 drivers/hwmon/ina2xx.c                               | 20 ++++++++++++++++++++
 3 files changed, 29 insertions(+)
---
base-commit: 8a4062d204752e0d66a1e7e1a2f8834571a8d40f
change-id: 20260610-monza-ina232-de180e669dc1

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

