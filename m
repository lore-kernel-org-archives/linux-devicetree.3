Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795166424;
	b=2H8cL6pXHJT5G8jAhbg7mQE5COpDbLES+UHs0kFVgSbQy7MvlUUapkGj3MZLKwIUT+lw
	 E0H8OoCTD+r7AYiOY07SYV0wEhKaUIcdON6nYLgDKfBq6TFY+1M+G8faHL4nyvhddWqFJ
	 wb9fEoDfAo3jmf+7zzR7VFmWEp7RaMo/U0bSa7A/Gkby7heXFL/HTjCvLnrFeJnpIFAno
	 wsuitxF4mgRGt6uhgHgjNaTBhF9X9ZjR08rsKxeqGIfwKlwgjzqhxaY9kL1HTh6S7FSHo
	 zNjTiz/KP1pwVvM91maIbYaEdXfx2p3Vn2EZzcVinLLTXUgG4cHZQ0/+KSTxj6SXUEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795166424;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=QjxxAQdWlHgrhAJkFLUIs1pMerHYTIEpe7z53DWWMQo=;
	b=AkkkQrqqjdY2Ux+TojPb0OC0dRHcwk+v40Ayqq3ZyYOmntnYxsm/G6kID40UQdK764Ui
	 /dl2fSj8BTDXtG0pKIFJVHqxTNo3Yz2Pfuj5Id0RVROfldzb0b75xZFH3FHc2VbBPsK4z
	 D1MPLALYiSVuHOXgbA/lyPyP54QycX6C3gNTLOBcDSoBZFeDPi2iOd7wcjLkZ6/iyOvK/
	 tdaGwokEiSf71Pr2rtZZTm/eJA8a/LQo24EB7j9NXY4MNl42t0mZmb9tY6KCLcTVDFeih
	 Rq2YULWEHNLg8ON1FOiVldtnaHTb23c+XcZZkBYnUCeK/CXnKjnM4UCZsKcoz7FCZvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fk52mJEr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CFTPaLrW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BA9606A331
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:20:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2BA9606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fk52mJEr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CFTPaLrW
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7fEpH758284
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QjxxAQdWlHgrhAJkFLUIs1
	pMerHYTIEpe7z53DWWMQo=; b=Fk52mJEreu/ry1t9ZxprtiAPjCU65Dbq0MPf0S
	yZDFof9lD0VybDPbagL4D2RBqeoltpx9I/B1LWG6MYCKB9Ids+TEQEMpbjzxqZ1/
	/78VoPPzGMplW3k2ycsV67dFDX3gJ0fM1rGyNznOEfn1MPn8Zcv4d05hNgKoo4Y8
	aZraNt1pyKuibQwzyDTAlYi/DyEUzHYSwyJBxyuGlBtuc8F8WWaA62rESJgUF/z+
	nzRX06GWCdra+0jwcOYGkCc2J+8WP1Z5T/363QPyj5aAdEFUaRagFQ/MZ2Y7WbWw
	HiOFEyNbfCVu3G6OpI4mjy5MVZFi612NQS92BRntoHgSSdOA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27b5tyy8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:20:21 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a05b68f851so1598870b3a.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 01:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795166421; x=1795771221; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QjxxAQdWlHgrhAJkFLUIs1pMerHYTIEpe7z53DWWMQo=;
        b=CFTPaLrWb+1Kq1pExP4HAx7ZvJ5mpBV82AJKUK9QsDroIub/KSjc5uW3tFgXflZgIB
         2CYVA+8mQz8OnD/j3GDPFu6JnywzRBhuhFDGJ1gEKroQEUks7y1odRwpZxFrwcQb7cAO
         0X+DyefENit74ZMbZ5txcVqe/TIxfX4Q3L3i7VSmX/kmnAhWd43nz3Iaa/2uH1vdLPHD
         halB9vXBo4t5g507uZp/6UogC1TrAdaw7hdRgSGnb1Qz4WOzdmPXmRPdiCMDof09qNyA
         LZip47UNcnTtaZH/gPuvMnmm7LTRklDxO79fK6lqh415soL/2nxgTylK+XLTbysaemCs
         7IrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795166421; x=1795771221;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QjxxAQdWlHgrhAJkFLUIs1pMerHYTIEpe7z53DWWMQo=;
        b=l4cTIui1GAnUpWYtM3NExUUlrKjkLIw2qhapHmsG3FxrFOlq7wZEvwR1lgWQyjgQaK
         MDi02LM8EO9At5DYSou4VqG6q1jZPqdPO/t6mthTMlsRfVGvU7dDxVdxnGsLpJeARyNW
         3J/DXo3rBaQ0l7IUK4EpWdFKAAQLjZ9Lz+FMVPfWYrwudXSHDLb0OEEzKIqrQ2FAKIAn
         mErWP/LoqPczLVKm/wxvow7UHRJjO+vzei2lST+NBvx+LTdZWm81UQOMkyBbNugTki5l
         k+rwM+PQJy5FwREGzkv9J8T3ec+YCiQ78lWxaDQpKQXpspCrLQV+ZTRSD/PuS+/XDz3i
         H15Q==
X-Forwarded-Encrypted: i=1; AL+hErFzwXnOc8q8+byldYByj1YC+1rXOwqEoPghw8hUrpCdQ4Ww2khpNa8qjSqyFiA4kfEWHMzz5mgaE7gi@vger.kernel.org
X-Gm-Message-State: APuU4Z/JFU9G/Jrv3fmCSqwpXN/jJ71f6U4WkurGQBoKKKiJ7cCODem9
	L6G94yj6e9xlubYXxl7TNDi29qjFOOnSK8al0NgC6Gvn0G2JdYXYq6vvwwyxCF2c0XvgEpI83aT
	FN6Ekom2iCF2lKYX21hHpxlh9VORSnc289z/QHhJrMUWYWc+Z88qBne2EQOByLuvu
X-Gm-Gg: AZFdTZejnXA4W7o2vcPUQVkmKInRgUpY5+XH9ljxV6rF4ivLqbUVysAOyjwmbrnwj7G
	e5ATg60ws6ddn6vTZJa0hcGTq5wX9l37uMqfvdNj4AWM/EYU4XpIsLE0PbmKNcR/95Xqr5cZK+r
	gs6fU5eWeA38ScwJy+KYzDldpRGwqnY0YhHtEiCRYODB8vErtcfNbcCU3XQ+YSwjq1AvseshSWM
	HAZArn3fFHa9a9jLTO4FnaKA/d6YMauIizXvrhN3ZspVIdMinCRUovAXRTAHAOBUWOfEWXgc8Dn
	0NmkR1YnhSwLZNdTSdlJ1z+XgmjKN/IdOVwUskOZ5L5IYHoZNmKUCdcfwatkP7dECb/tuqgFiwG
	MLXaLe77gVCgIqG1V+FrKgbvD2na5d5PqTM2OAPnLNZ/K9yYf2StGYHOXmjCvg3RMmQEp
X-Received: by 2002:a05:6a00:140f:b0:8a0:76ea:36d5 with SMTP id d2e1a72fcca58-8c876736fe0mr1773802b3a.0.1795166420675;
        Fri, 20 Nov 2026 01:20:20 -0800 (PST)
X-Received: by 2002:a05:6a00:140f:b0:8a0:76ea:36d5 with SMTP id d2e1a72fcca58-8c876736fe0mr1773761b3a.0.1795166420208;
        Fri, 20 Nov 2026 01:20:20 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873c1cfa0sm1186994b3a.48.2026.11.20.01.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:20:19 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: [PATCH v2 0/7] Add support for QCOM SPMI PMIC5 Gen4 ADC
Date: Fri, 20 Nov 2026 14:49:40 +0530
Message-Id: <20261120-pmic5_gen4_adc-v2-0-94d0e1fd6847@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAKwQAGsC/12OywqDMBBFf0WybiTGF3bV/ygiSRw1pSaaUWkR/
 73RthS6GTjDnXtmJQhOA5JzsBIHi0ZtjQd+CojqhGmB6toz4YxnLI8ZHXqt0qoFk1SiVrSJ4zp
 PMylFqog/Ghw0+nEUXss34yxvoKa95ZNwMM7eNP1incbJuufxxhLt268x+jcuEWW0UEkhOYDIm
 uJiEcNxFndl+z70g5Tbtr0AjzBDrdoAAAA=
X-Change-ID: 20260730-pmic5_gen4_adc-f33d756bba5c
To: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795166413; l=3424;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=Shpckpdenax8LsAlGgqsTsb3IzqJc2WNo1iLofTB81c=;
 b=BE3hO53I3jGoBx+AX1Ky+ysoGgJ/j4BYJpmzFNYTvAmnUApou7B6oFraMqnoe8SaHi9LfY+CL
 Q8bKSEuVH98DwkV8rfeBwpuxaRdlV+0hpb5rquQwhSU28fipKGWjA9+
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNiBTYWx0ZWRfX/tH8pKji1lqk
 04q5JTMdMrKaR1LMdrMUx+Ni0NYJM2QmI/b6Z6sg2M85+ehGOceQypxawKgYcHed76oIkNPsIsf
 1VDebC8OnIQRNmr6iOIzgq4cSBfHe+w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNiBTYWx0ZWRfXzHE6DWn9mVlK
 HS+D3dl6gj4oh1H5yInL2UitO7VQg+3XihHPnCAs0pTREpECRCg9rJ0olNkqehJVpvDzZO6E/Wd
 hg+/80jKcDjB214DfyjtbWXgi4ddAzHXqXQkAU3VH+Z+7aDOstar3q8sgqWibFA8MN3TP9u/mWq
 K01+/U7ubd14w/3jpJu5R12pFUAl5nqmWdtZy9vsIDDa9UlI6sss2ViGR/ZczW4px+7jkPg485n
 5J3vLGNJERGksqHNuAQdKNXWY9YmUb3J7iZLSINgzhvalZmg9Z63y9Hiy45E1cUBE1T3bfynr+9
 N7UBg+Zolu5Ry4ye0EozZptP6osCqR569q7TnpJnEOAwmIOZt6rINMzmlKI3BEZ1AubiwS3UGm6
 DHZ0/B3j2g6YtLUdJRZX+FijOxws0AaKo4Fi2/+xq9Uxn/xZu5l4TjkwNxdpuPXjRkgsFAzmQnf
 yeIe7vR0ZCxb8R4jkow==
X-Proofpoint-GUID: yjA7WJ-XV6kW8qIhmmeZS_kBVQ1NApO9
X-Proofpoint-ORIG-GUID: yjA7WJ-XV6kW8qIhmmeZS_kBVQ1NApO9
X-Authority-Analysis: v=2.4 cv=LPTz05W9 c=1 sm=1 tr=0 ts=6b0010d5 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=xwbyxjife42ruu_RaCEA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200036

PMIC5 Gen4 ADC is the next generation following PMIC5 Gen3 ADC, with
several hardware changes for improved performance. In software
implementation, it is mostly similar to Gen3 ADC with the following
key differences:

- Increased ratiometric conversion resolution from 14 bits to 16 bits.
- Extended SID field from 4 to 5 bits and addition of a 2-bit bus index
  field in the SID register, to support communication with up to 32 PMICs
  per bus across up to 4 buses under the latest PMIC arbiter (v8).

This series adds support for the PMIC5 Gen4 ADC:

Patches 1, 3 and 4 add the dt-bindings, IIO ADC driver, and thermal ADC-TM
driver support respectively within the existing files, to support
Gen4 ADC channels under existing master PMICs with Gen3 ADC peripheral.

Patch 2 is a fix to explicitly assign any enum values used in hardware
to avoid issues later from enum modifications in the middle.

Patch 5 is a cleanup to remove Gen3 virtual channel macros after they
have been updated in both the IIO ADC and thermal ADC-TM drivers.

Patches 6 and 7 add the dt-bindings and IIO ADC driver support for
having a master PMIC with Gen4 ADC (with channels under it being Gen4 by
default).

DT patches have been dropped from this series, they will be sent in a
separate series.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
Changes in v2:
- Made following changes to address comments from Jonathan:
  - Split documentation and IIO driver patches to first add support for Gen4
    ADC channels under master PMICs with Gen3 ADC peripheral, and then
    remaining Gen4 support, for master PMICs with Gen4 ADC peripheral.
  - Reversed order of if() checks in adc5_gen3_read_voltage_data.
  - Avoided moving adc5_match_table.
  - Made formatting fixes in adc5_gen4_chans_pmic and other places to
    keep code on a single line.
- Added patch to explicitly assign enums used in HW as Andy suggested.
- Added a cleanup patch to remove replaced ADC Gen3 virtual channel macros.
- Added kernel-doc comments for new members added to struct
  adc5_channel_common_prop.
- Link to v1: https://patch.msgid.link/20260731-pmic5_gen4_adc-v1-0-9c49b2eea6f9@oss.qualcomm.com

---
Jishnu Prakash (7):
      dt-bindings: iio: adc: Add "qcom,adc5-gen4" property for ADC channels
      iio: adc: qcom-adc5-gen3: Explicitly assign enum values used in hardware
      iio: adc: qcom-spmi-adc5-gen3: Add support for QCOM PMIC5 Gen4 ADC
      thermal: qcom: qcom-spmi-adc-tm5-gen3: Add support for QCOM PMIC5 Gen4 ADC
      iio: adc: qcom-spmi-adc5-gen3: Remove Gen3 virtual channel macros
      dt-bindings: iio: adc: Add support for QCOM PMIC5 Gen4 ADC
      iio: adc: qcom-spmi-adc5-gen3: Add support for Gen4 ADC master PMICs

 .../bindings/iio/adc/qcom,spmi-adc5-gen3.yaml      |  47 +++++++-
 drivers/iio/adc/qcom-spmi-adc5-gen3.c              | 133 +++++++++++++++------
 drivers/iio/adc/qcom-vadc-common.c                 |  41 +++++++
 drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c      |  19 ++-
 include/linux/iio/adc/qcom-adc5-gen3-common.h      |  59 +++++++--
 include/linux/iio/adc/qcom-vadc-common.h           |   6 +
 6 files changed, 251 insertions(+), 54 deletions(-)
---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20260730-pmic5_gen4_adc-f33d756bba5c

Best regards,
--  
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

