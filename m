Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F65329BDBF
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 02:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784514575; cv=none; b=hm25BMQ61pbspThlXlHU5j/fPH/O16HvJiSU4bf0d7Wx86/r5JBJiscPccGmjMsIYc2kgyMQYuDmFCPBlhC6ymK6zLBQ/0o0ZbC3SSd7+jsFQLKpU17RsTtt+uIh7fT1hzauUSvsot0v3hNnhoJWfT2W2Ll++39gMxdtGc61DVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784514575; c=relaxed/simple;
	bh=hcW4+jnZG8b4vxEKZJlNUE9jP73WL0SqOk+06jOM2T0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uPO7E7NM3RBJ6Lp+wUsVoo4dwVEpIA+5akn7LJoFQARjNh1OUNzruIpoc4dPjMhJSTAfybeDtKecpZtWM/3v6gcLRVKQf42+HPDga5RksFNBZyHokh3e0pJ1sz/nFHvomVfF93G1QKLxanE5hNj1ctMvH4hVIzPyDrgOGVyd+Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SxJZ/BQk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JnoeF+Nf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SxJZ/BQk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JnoeF+Nf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNshei1911723
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 02:29:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a/JRSD/ECxDv7bVvnhyNJbXBL0lH3mP+ghfy34Djwss=; b=SxJZ/BQkNyLzx1KH
	1dfg4V8p0q8EZ6RfAX5oN3uIT7OD1EhpaiEI2k8dZwVovbNFRJ3M3gDQ4urE2OS9
	90aQXMnTnWZDsf3BoVxvZQrAMEFafcJc1hANUCVz1jKOZlWUeYKWVC7Al0Oor7uO
	ISkCNYi8f8jnpi6kJ+6c20Qy1PaTZdw146jJHaORpydoyj08BFtGPcovBVOZup2S
	nfW3ZI61nDmi0UPQDMQE4Izb7uJdQ/TrmxQRXhl0cKcqos/8/0w52rjP65EIxeYK
	zea8EmRS14VHkoh9duhLxCgjxgDvWwjzr0oloyhvvkabYQHLgdDmiVuq6YOu5/K1
	Hs+K0g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2aauyr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 02:29:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ce7dff6253so26811825ad.1
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 19:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784514573; x=1785119373; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a/JRSD/ECxDv7bVvnhyNJbXBL0lH3mP+ghfy34Djwss=;
        b=JnoeF+NfR5eSsnlbqg7YGazgx/3cq7BDg5CGbhnbnJIN18v/lKbTaWFBsOkKVkAV4H
         jm+l57lHb3fEJOK5M/9F3Vg/MKo05PMqmDnsMo9u+A4mD24v0M3vzvWdQRaOHRptHYS1
         w1mbpltnOfMbnwSS/KYFJCzv7kyQuAWZKSOsjvrrGfKwzHwPPJjy/yrKuFhH+/U8z+Ph
         w4wA6e6Un6g8YJyf/f/eRQh8ZNmbVNle5hBqJtjbnnUOKO/9DjyX8SLNQbHGjIUYcsa/
         3BNmXqavNamXnIJzSfb2BfV8BCAnxv5r7pFVfBth2pxCwyvAW/GEM1gA00b7w1C7jfTG
         Ytng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784514573; x=1785119373;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a/JRSD/ECxDv7bVvnhyNJbXBL0lH3mP+ghfy34Djwss=;
        b=WjrTQOUuGAFicheXt9bWAs4fN/TX7MaOoJE7M7NlTfpzv5GUq+/O61wEbhhZTTV80r
         dNrKO8GoMSLu3wEoIWtxssXcmHCyXVmBb4rufeuRPqqBeqgUgi0u+EN5098DaK1NPYn6
         SXdpfTLo8XCrtw8+ZYs9wDls+XBBALEH4NH7vltTETQd6k/mPbPhf3/rXxd9qFJjaf0j
         nQFrPBzbFglibqgaE51IYyIqQg8XSZQjiv3C3jCm08zULGMoF4fou5CJVe6+nXhtRxI2
         5NiUy6JATYgpDInregTpywLxsna8s1cYroxRP4ftc0pNv7wqleHaH1Qv9lI/MgoU9MnA
         L1rw==
X-Forwarded-Encrypted: i=1; AHgh+RoC1MasmOLc4mSSs534lR5H059luJGf9OeCU3j8tSoa6bI5KWRIVh+m6+25CQVrCs2eZUN3RgSr/VCi@vger.kernel.org
X-Gm-Message-State: AOJu0YyRHT73hMLmVlIhoSJAxTCyfidOBwEVh6Ye7GiHrNBgY3+/FKGF
	LliS4MFnJdIXBluKRELT4PsYhFQ3lSysuHmKQicnT6/+ylpJXORx3eYlcrXFcnOxuEIfYX1p4zE
	lABouW/ZRrsaUjWzw1b46an2A9GCKBUn/k25+iXKeGbnErKygg40vX+5Od2H6jg5J
X-Gm-Gg: AfdE7ckwlBXEglQYG6v5A0qTPPAEQhtMtIcGSuV/V89AbcfkZk+0aUNB0lhuy7FRP2j
	Qyga1REiddOIag9CZUG/jTHTRyepL5s07UlZjOk3rq5q4qB2+kkxbsfQFteUKwtMd1KLlfji1W8
	FxqxIbS4A2PasBPkGMMy1pEs1DmWXdipjeV/xUXU4nMcruJAGobTPTBbWv/htkGzyA1PRp8ivHC
	2LJL6tkoKf7xqxSa4JZmNKuauVv9aQnn5DC0MP7J0Hp1ARLSfby6AjWPIwGk059Gcz0ny2nGPFb
	H4IF9QEhxkXSHC81A0esDhe8qBVqIOQTC00OsUYCPSCKAJ8ElgrOKcnW6tIjmEipulsYoS9Kyca
	qkVcTLKGI5CvI6Edn
X-Received: by 2002:a17:902:ce0b:b0:2c7:f5c6:c4a6 with SMTP id d9443c01a7336-2cf34878effmr128423575ad.7.1784514572731;
        Sun, 19 Jul 2026 19:29:32 -0700 (PDT)
X-Received: by 2002:a17:902:ce0b:b0:2c7:f5c6:c4a6 with SMTP id d9443c01a7336-2cf34878effmr128423385ad.7.1784514572249;
        Sun, 19 Jul 2026 19:29:32 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344b1348sm48260335ad.18.2026.07.19.19.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 19:29:31 -0700 (PDT)
Date: Mon, 20 Jul 2026 03:29:27 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Wadim Mueller <wafgo01@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
        Andy Shevchenko
 <andy@kernel.org>,
        Maxwell Doose <maxwell@maxwelld.cc>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
        Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Subject: Re: [PATCH v5 0/4] iio: flow: Sensirion SLF3S liquid flow sensor
Message-ID: <20260720032927.14fc4f9f@jic23-huawei>
In-Reply-To: <20260714085358.20842-1-wafgo01@gmail.com>
References: <20260714085358.20842-1-wafgo01@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: L2jTxPJa-bF99gvwaNVA5FmSm9C-nRoz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDAyNCBTYWx0ZWRfX5DSSoGVL1HcU
 IIdRYrRu4pZcBQg3QySTXDNHVgo1ZckeqsSHVkfI8XfGbHX9kwQxkLzcXEGrCbaMRNndHOghseC
 w32/GNHXYTQxDvVNR7jdYJVzg1DJOoM=
X-Authority-Analysis: v=2.4 cv=b9aCJNGx c=1 sm=1 tr=0 ts=6a5d880d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=LsRdE4r2pVaNBGN-3VYA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: L2jTxPJa-bF99gvwaNVA5FmSm9C-nRoz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDAyNCBTYWx0ZWRfX+p1z17IY4xYN
 BAsbAr9bh+1iMnfqXYNclNYnJMRjB2TpVzAw1SHXNTbA54NzbKV/6bBtIzfekmUKxIJcgSsKMCk
 CqaOD/Sn5fM070+56E9d5JsUKnBjKzMNIRrmUpkw/tKm6GQGqEWJaLi09h+3wf+ovNgwtQGh5I8
 fFpE4fM4ryVkJAp1L20MaQTuWTtcaDW1I0Cp5QYaCQV7k2gDaRf+klFnT/VyHLLxZS8yFEn6yip
 t2/auyvmOr3JksQva4ewrwseMZJehidkA+cvJAnoj713v8XpTdMiBEDUwkqs6N6EKaxgmpXKiXA
 fe+Wz2v5g5ygOoFiD6USroYUYue4Z6/zG5xGDeUt7wTPv/EqFD9CvxyQRcCHVzNbr+Tt9Bb0yae
 vYu0zv1kMERHmUia5kSqVNJsRFFIoozKap+Okz/FS+WAD8YKjaVQDUqEl3yU7EJ/GoaIFiLlytM
 ZflkYX8+neEl1hQ5fUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200024

On Tue, 14 Jul 2026 10:53:54 +0200
Wadim Mueller <wafgo01@gmail.com> wrote:

> Hi all,
> 
> this series adds a driver for the Sensirion SLF3S family of I2C liquid
> flow sensors (SLF3S-0600F / -1300F / -4000B) and a new IIO_VOLUMEFLOW
> channel type.

Hi Wadim

Something seems to have gone wrong somewhere. I'm not seeing patch 4
and it didn't reach patchwork either.

Thanks,

Jonathan

> 
> The series is now based on iio.git testing, which already contains
> Rodrigo Alencar's IIO_VAL_DECIMAL64_* core formatting work, so the
> external dependency listed in v4 is gone.  Patch 3/4 adds the
> IIO_VAL_DECIMAL64_FEMTO format type on top of it.
> 
> The compatible/fallback layout of the dt-binding is intentionally
> unchanged from v4 while the discussion on the v4 thread about the
> preferred fallback scheme is still open:
> 
>   https://lore.kernel.org/linux-iio/20260621145117.70b2d50e@jic23-huawei/
> 
> Changes since v4
> ----------------
>   * rebased onto iio.git testing; trivial conflict with the new
>     IIO_COVERAGE entries in the channel-type lists resolved (1/4)
>   * driver: include err.h for PTR_ERR() and math.h for struct
>     s32_fract, per Andy
>   * driver: fold the per-variant scale_num/scale_den pair into a
>     struct s32_fract, per Andy
>   * driver: add enum slf3s_variant_id and use it for the variant
>     table and the I2C/OF match tables instead of bare indices, per
>     Andy
>   * driver: slf3s_send_cmd(): drop the "at_least 2" parameter
>     annotation, decouple the ret assignment from its declaration and
>     check errors first, per Andy
>   * driver: use sizeof() instead of ARRAY_SIZE() for the measurement
>     byte buffer, per Andy
>   * driver: parenthesise the (FEMTO / MILLI) factor so it folds into
>     a single constant multiplication, per Andy
>   * driver: derive the temperature scale from MILLIDEGREE_PER_DEGREE
>     instead of a bare 1000, per Andy
>   * driver: checked the struct slf3s_data layout (re Andy's pahole
>     question): the non-pointer members total 260 bytes, so one 4-byte
>     hole remains for any member order; left as is
>   * driver: drop the inline comment on the mutex that duplicated the
>     kernel-doc, per Jonathan
>   * driver: fix the duplicated argument in the DT/sensor variant
>     mismatch dev_info(), per Jonathan
>   * driver: reformat the i2c_device_id/of_device_id tables to one
>     member per line, per Jonathan
>   * MAINTAINERS: updated Maxwells address in the R: entry to
>     maxwell@maxwelld.cc, as he requested on the v4 thread
> 
> The signaling-flags word (air-in-line / high-flow / smoothing status) in
> each measurement frame is intentionally not read; exposing it can be a
> later follow-up.
> 
> Thanks,
> Wadim
> 
> Wadim Mueller (4):
>   iio: types: add IIO_VOLUMEFLOW channel type
>   dt-bindings: iio: flow: add Sensirion SLF3S liquid flow sensor
>   iio: core: add IIO_VAL_DECIMAL64_FEMTO format type
>   iio: flow: add Sensirion SLF3S liquid flow sensor driver
> 
>  Documentation/ABI/testing/sysfs-bus-iio       |  11 +
>  Documentation/ABI/testing/sysfs-bus-iio-flow  |  21 +
>  .../bindings/iio/flow/sensirion,slf3s.yaml    |  58 ++
>  MAINTAINERS                                   |   8 +
>  drivers/iio/Kconfig                           |   1 +
>  drivers/iio/Makefile                          |   1 +
>  drivers/iio/flow/Kconfig                      |  22 +
>  drivers/iio/flow/Makefile                     |   7 +
>  drivers/iio/flow/slf3s.c                      | 541 ++++++++++++++++++
>  drivers/iio/industrialio-core.c               |   3 +
>  include/linux/iio/types.h                     |   1 +
>  include/uapi/linux/iio/types.h                |   1 +
>  tools/iio/iio_event_monitor.c                 |   2 +
>  13 files changed, 677 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-flow
>  create mode 100644 Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml
>  create mode 100644 drivers/iio/flow/Kconfig
>  create mode 100644 drivers/iio/flow/Makefile
>  create mode 100644 drivers/iio/flow/slf3s.c
> 
> 
> base-commit: a50909aa46dec46de3c73235fc15a7d6f763d996

