Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6549918B0F
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 01:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784509809; cv=none; b=VvEu6c2rB4RTAN551/kqONwgsDPACkZGEEeQDEg2323GtXB7tQBnUtjhgqp7rrgtwYCra23Xu2uRXdnHzC0QFs9V6lEllFP2E5QNdIHhac1F2d6suh5xsFxStnjNduqE6bhyGivnHcpCiW05NRE8T2t/JTlDf9Mpn6ZdSyCuuHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784509809; c=relaxed/simple;
	bh=hDiOy+/M4OfbO5Y+OUa4JeHIlcDyUf3B6CeACEejA1o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nXyOpE4yXxI90aYRy5XwGrEliFG8EKzEl1HMyAZdKuEo9z6mTOKB5QXso1Lw3DJr91pfU2JolIrjTOhC2H5Uyf/oNw70ybOlb8lWASglcv7DikmVPMTo/ExevW4IoTcCzFCTsPxq9J+RdLsVQolqkiG8tB+odXwbrMOUzVflxSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AxmZcS5X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gogdtSP2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AxmZcS5X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gogdtSP2"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNsELF1911109
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 01:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OVqOUuBVtydQxQUla2vfU1Oku0cw1BoRtkOvkgKRR7s=; b=AxmZcS5Xwpz//RCl
	BcSCobVgIdL5tCaLK5EJ6MXNjnGU0FBlmbWodP9Ej/8g98kCYdmMOsQAyPD86w7e
	1KGKN7K2nUhG5XjgwOfRWjtdmt0ZgOY7nyDdEU7TdXPkP8jDn0rmgk0VeWB1wyud
	2MO2MF/m7NlhntB3Tu+VzLXyQie9Yzv99/o8F+VBP4hSEXSDZkm6On31J/FSnpio
	LkfkNbO8Rz5ZXNRwysQpLQXfGeDc6VMCMimUAdU7LZ0xHo7yoJf4UFEXdql3+YQO
	fHpzUqMlpP5KCvLB1SBbx1OHGObum4Fz1aZ93QGXJfrxWxSQ0tawjA3/7ADs4Ro2
	JF8zdg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2aaut60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 01:10:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cce02cb769so81023935ad.1
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 18:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784509805; x=1785114605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OVqOUuBVtydQxQUla2vfU1Oku0cw1BoRtkOvkgKRR7s=;
        b=gogdtSP2Y+jeO1lzRNi3hsN2Bz194kJ4HMrJ08oV9Ff8S+bdkMaR0+/TYHer60pEm1
         6Vc1kkFv9Ob7rlVzmGgcqzwQbiqxjwrAfuAfkEKETIa5AU6BmjHyvmcZQHRHKmk0AEKd
         g1oPQMnF7798L03W2lG9AiH3ZqQDoHjG2rpV4WATubx0nGxXBx1+Aj46Tk+pwkcY6kJg
         YS0tb7u474K2bZ4JRIds5vSLQe7FWjlpoOMB3u8/LbaIHfDCosF6egg4FjkvXO+Pz7Iz
         VmX+u02BUKAoSdoHzA4HWAVhGWQj+9IHwrSe/iccm/TkSfCUo8qOCGHBRbhIK6VGNivZ
         NGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784509805; x=1785114605;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OVqOUuBVtydQxQUla2vfU1Oku0cw1BoRtkOvkgKRR7s=;
        b=gsM/S8fWqEHo4CLNhpY/rIj7vLRIyorh3KzXKqDcUFhVGY2VpKTbyvTvK7xnSp306Y
         hq0SmiUc88plk7rl6dDnZhnV5/0I/ZfkTPlM/07DKqtJUJdDtaWYcJZtYmujG3jnRhKq
         iDvlEzWhzV7lbGxKYOoPK1k6/ZeVnL9KCekAxA8NmzlRz3uCdtjV9NLXRUEfjZkZAR7Y
         e9OdGRZe3S5ZhfO0PQvdcDRs2BQvbJ2SiD8r8LtFaAgG3iYodO3g1qugctZg4tv/2quV
         cmrCO10ORx1zLhQmO+RHSpF+C0D229ABm0fIUWlt9Pr3wGw1emWMplUUqBLDC3fb1Ov3
         ef1Q==
X-Forwarded-Encrypted: i=1; AHgh+RoD9F/05H6rXQRqgSFyj0sk+LTbdocSLOWImAqoPTqGX0AfzA2OnhQLXKPbnZJkcKkaqcdWBFUL4WjL@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6cFrDyy6YdrQGBZMGXVM5+alxWBCxiJyk1C/Jt/KhH+6tQY2i
	DlD0ovwxtz5GSbvu84GefT/4aVteyfAAHih46twT0lcgHlFldqZnwG6vd1BWU2FZiL2a3GX5Jr/
	J4l81pZ0AkfUGO+45AhCJWhVtjl9N0dcTKi4BbUMgPRwSR8RfFKjM9G4uCJGv5v2c
X-Gm-Gg: AfdE7clbbITYW0P6BwXah/eta1r2oTQ6gJBA+P2lx0vyUKCdAxwsBOnX2xUI+qg6GuF
	87i2+ywq8Oq9qgws9A1wdB7lBMIAY6md4N5VXSuJeJ8mF3d0Qfei65F8J+4+5NU3aDf0G+AXj6s
	Q+Pwsg9ZcWirwrRayrLvK8thZ1TucmX9P8EPwa+SBdouTQsCC7LLBkKEOq78jU4ExHLprqHN7+j
	X6snIuTZDlPz/uurb5DJh63Tzgj3A6yT2vPH6PnbFq7HcM0+dtwZnFeHjPjHuH6+Gs7leof7nBM
	KKcaDm83Qm7vuGbEyp//xWAAAfLap3FxY2FLCevjGD3mVJAG+G7KXf2zRZ4dycw8uR90E/ZKrZj
	AhKL0mRs1e7vpEacF
X-Received: by 2002:a17:902:d2cc:b0:2c9:97a7:f548 with SMTP id d9443c01a7336-2cf34a49278mr136309685ad.46.1784509804854;
        Sun, 19 Jul 2026 18:10:04 -0700 (PDT)
X-Received: by 2002:a17:902:d2cc:b0:2c9:97a7:f548 with SMTP id d9443c01a7336-2cf34a49278mr136309295ad.46.1784509804384;
        Sun, 19 Jul 2026 18:10:04 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf347166e6sm46987155ad.59.2026.07.19.18.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 18:10:03 -0700 (PDT)
Date: Mon, 20 Jul 2026 02:09:59 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
Cc: David Lechner <dlechner@baylibre.com>,
        Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Siratul Islam <siratul.islam@linux.dev>,
        Luca Weiss
 <luca.weiss@fairphone.com>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: iio: magnetometer: add QST QMC6308
Message-ID: <20260720020959.3d5e38cf@jic23-huawei>
In-Reply-To: <20260714202842.340293-2-jorijnvdgraaf@catcrafts.net>
References: <20260714202842.340293-1-jorijnvdgraaf@catcrafts.net>
	<20260714202842.340293-2-jorijnvdgraaf@catcrafts.net>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: V8mi6yZ0ODYwswvw6twbWj7KgolLyB0J
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDAwOCBTYWx0ZWRfX2b9romQo/1uS
 qudkC2hs/OqzhCD30sRbzP/MRc7woTthP+oGcsk0LjNcE6ARwpBR5dOQJoqeqSKy7tfude6axfg
 714y4uzqAT1OB9cBYKd2GIm6+xmwvLM=
X-Authority-Analysis: v=2.4 cv=b9aCJNGx c=1 sm=1 tr=0 ts=6a5d756d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=s-49AVHpAAAA:8 a=GYSh3LzNAAAA:8 a=XZePDpeZXBMwPD_SGuQA:9
 a=CjuIK1q_8ugA:10 a=324X-CrmTo6CU4MGRt3R:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=tmfrqOOcxroFHF4kknLN:22 a=lWcdFasyL5yHfcDTNXXo:22
X-Proofpoint-ORIG-GUID: V8mi6yZ0ODYwswvw6twbWj7KgolLyB0J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDAwOCBTYWx0ZWRfX7UUrc4+D1jLI
 4y8eOk79emw94zCLrAnzFNV4AYh/cT50HJhG71Ck1T89q06cWzdyOxtA6wXGbJwU+QHaa5QLNdT
 TKh+FgBUXPoqOKvH4w/MqS+LlQtK1jV+5USVv0G1+NtapYCw8Jdqh0fhbpjt4m3OHTSnBwbdsxd
 Y5JgFFaDmJWy6Fsm3j+8EGm0gJPKloRnNTn4I7Z0PGcyh478spPPppMBaeh7yhqrxZvx4l+vrO6
 4yMXEIKEjb6URdbwlN2a/AQl0nFo7bE+qkP9Ltu0QK5wYJafCYbB+0HV8xSbHZv0foGr+psreI8
 FxNhFaM+kuidvhUz0KjgLjhez90fJDKRiwFrf1iqNVdmJhNlSmJw70EkIc9JxUDkzB6omIsB0YA
 yin7MbKfRlhN0EgaOOvD2j5WHqbt+1wG2fxL6dLMgSa6sNgvDeINltjMuLe1MtrjI60aHOwcelJ
 gTz01VrBuJRfGvNfAnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200008

On Tue, 14 Jul 2026 22:28:41 +0200
Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net> wrote:

> Add device tree bindings for the QST QMC6308, a 3-axis AMR
> magnetometer. It is an I2C device in a 4-pin WLCSP package with a
> single supply and no interrupt pin, at I2C address 0x2c.
Hi Jorijn,

As below.  Don't think we care about the package (and manufacturers
often decided to release in more packages if large customers ask for
them). I'm not sure what AMR means, so please spell that out.

A few really minor things below.

> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>

> ---
>  .../iio/magnetometer/qstcorp,qmc6308.yaml     | 48 +++++++++++++++++++
>  MAINTAINERS                                   |  6 +++
>  2 files changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/magnetometer/qstcorp,qmc6308.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iio/magnetometer/qstcorp,qmc6308.yaml b/Documentation/devicetree/bindings/iio/magnetometer/qstcorp,qmc6308.yaml
> new file mode 100644
> index 000000000000..ced839d2aac3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/magnetometer/qstcorp,qmc6308.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/magnetometer/qstcorp,qmc6308.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: QST QMC6308 3-Axis Magnetic Sensor
> +
> +maintainers:
> +  - Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
> +
> +description: |
> +  QST QMC6308 3-Axis Magnetic Sensor on I2C bus. The sensor comes in a
> +  4-pin WLCSP package with a single supply and no interrupt pin.

Not sure we care about the package, but the rest is a good description.

> +  https://qstcorp.com/upload/pdf/202202/13-52-15%20QMC6308%20Datasheet%20Rev.%20F(1).pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qstcorp,qmc6308

Unless you plan to soon add other devices, can use the more compact.
    compatible:
      const: qstcorp,qmc6308



