Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F063E6DF4
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177742; cv=none; b=swtnwIU/CYiz2KQ1Bbzy4fbGy+9xB2eiMxVyhfGt7PxzIWW6CybgyZ/SpryPbgKD5Q2A1G3L0pyyHFiUrYtFirjB7tzwZbR9XQefeFH5kStOT4Wc9B8w11pCGUOaHAU4ciYp+QGt7swRKWJjB9ynoHRLA+VE7+BAPhIEumO9lEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177742; c=relaxed/simple;
	bh=6U2EpQbl70iTBwLkHktdUzi2+kfxjlaFpz2VtqrjLCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p8+02iK5vdHrxX7EpcavdG3QErwzO3z/SBfLrQVvwR/NLa0l5ePuw4ceYXiwQDn23cd3GVS3Lt21+Pyp+7Kg7Av7YtC4L3GqVfGlFuKdiMY8JY2q/MSbrAaa0UtFMX/JBcW9cNZBXWir6Tvg0n6hUeCb64ZD3CK/A3YLfJtZ3FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IsHlbCAL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TBbkdorV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IsHlbCAL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TBbkdorV"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BA1R3P168086
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:35:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=; b=IsHlbCALB5FXKPTl
	QjCSL7oURk4b9YIEDStygHDFYRQAtubmAaYO/U7Bo1kBfsRsVm6p+xeNbUlm6hTW
	sGXiH8p0tVWwIeVcggJ3V4kukXz0hRt7w/IadBzDvuQRHR/ANKDTclbVrqpLcEOb
	0yqO81ftQt1R/7UAHxZ05uIotR/l7Y32yqd0MBzipVrlz6uKF+qRh/T9LOaY+t4d
	v0ChiQ8CZ7DgE73tOMpmAnHff21n+D4Q5UjfOmkl9GJL+tLku8im16jD91GSNnWg
	9+ZmPD/e8EB8PQQspZucwQy599xxZnyizeKDFtaLxnJ6+w5H85TTgGzFxvCHXWUZ
	F0eW8Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6ub62b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:35:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5177b12d7bbso14771591cf.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781177739; x=1781782539; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=;
        b=TBbkdorV3Iv4oygyPlU3yOmT+ng8Tu+Y9utUPimBTBcBWhbu0i5k38c/WET2C1uKwP
         zDIvj4yKzfjmyCeeu7swMlFtcor9DFxNBtRCokJEpV9VlZWzeFNhllJAVVYnsfr95Grn
         DCQN7hbK9YE5xnkdRge/hwj7mYVbow+Gh3sH06wIIB12P03CNVEESU4AmlBZea92ASt4
         lqHJfXGIPz1f2GgOplcSIFtk9z/Uilm2tO+J8HwsyLn9Vq15mjaVBhs8/iBgSW75Urax
         OxhmhQkEEtG8eiXU3HfQLwIb3gWVZO3Fq+vzrqni3zSTbeqDFbFMbvLXUp44ot7fGo5m
         jygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177739; x=1781782539;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=;
        b=DRoR/z80HEsWPKvuSA4PPChcLgLeXnEy74z1ZasaXkfav5mzpfkXwR5gF2o30BAlXv
         TRJeCJB/dWPQqAnxB1Wp8r/Oi8BSuAlM+Rf8tRMn9iVcgi3E4ewGle+iHD/Bq6P0gHGt
         sKqXQSpJLkC84ZMR31u6DJEPqs9ReeoEbl6QV1ZaDgJDCPaSnAJ2oZexZwdO3s+sAUM/
         gka0KiK9vuLKg8xeTXKJLlIdx/sdp32oqQA8ofJyC54cxMrPkrMwZGWa3X5Jlw7FycIf
         G6Br1bKgk2waurWOsCpSo0s398U/6ZXzJDTBa85kdIdCahTNjU3jGoGGgUh8cura9IMz
         6ubA==
X-Forwarded-Encrypted: i=1; AFNElJ/aavGYBwBMcl3Z1pZydQy4EM3riesCYI0OisxsaVEpkPD7ho9ZtexALyxXNAxIFOoqY/NaUDSXgXbW@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb3gR6BzUPvyl3qsj324rlS0WmbkEz37xsTOwHSBRMLAtfpyp+
	ojQnt4YJhFRNHZZgFyXRdQ9gKjn+lxPk0IGdv6GaZbUMwUo9jTSvU5rZ4ju0Ef69ZG9xMdXyrpI
	BnjE+KDuLf9OqypfevPxECBkKWN/5P1s4rC8sDayHxynmbyGNnndO/a/VR8neBmwn
X-Gm-Gg: Acq92OHt1bPZsEO2nU20tPcXBb9tL/ix2bJUe6xYLtyVRtDJD2Oq15pWKKEje+eRTqw
	6eYn759iowmJTY7Vuv5lPJ7LsbaJwu8QV+kGfmR5DmRu3zq923Wxbs1Poub+tqR2Bf5QGxcHDhA
	A+2pZfBjhDvcPQvJAfJMd+jOUwxEL5bgWkIa5p1hz0WqvR/3HQ/TpUgsMhG8UtaYDKMSzkaEPW2
	MKWCj3XmqozSWNZXA0bCju07DBj4aw6+OHgqtogrMUDfFPhKStTZdmKgbUsdzZiwR6xS0p8WBDR
	V0hz2ri5PbdvhdfZBFx6wz0mvtSTuDmTSXW49sFFyBiCxXKujuXt3AD0XoZ0OOKhS8qwVtkToMK
	J3DjEpxHUmJd5ZmIaVl8Nf10/KkydpWEtvu1rtUDJ4+m9xsO0MO8aSCE0
X-Received: by 2002:a05:622a:c16:b0:510:144a:636 with SMTP id d75a77b69052e-517ee281cf9mr23529681cf.8.1781177739379;
        Thu, 11 Jun 2026 04:35:39 -0700 (PDT)
X-Received: by 2002:a05:622a:c16:b0:510:144a:636 with SMTP id d75a77b69052e-517ee281cf9mr23529401cf.8.1781177738938;
        Thu, 11 Jun 2026 04:35:38 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65027662sm11020827a12.11.2026.06.11.04.35.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:35:38 -0700 (PDT)
Message-ID: <2f72036d-2f88-434b-99e7-cca93de47e56@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:35:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/18] arm64: dts: qcom: sm6375: Add minidump SRAM
 config to SCM node
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
 <20260522195009.2961022-17-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522195009.2961022-17-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfX+2gZVPvAK1ld
 H4Z2fqkA0TxepEgEeCk+Tqeu+2olAI205MlsAl2xQ8hK2RWJrI4vyEbUQa8MG7sQ9/e2ILVT2Te
 +T4sPLCtsFLR2DMXqDEKsLO+JYCgLBo=
X-Authority-Analysis: v=2.4 cv=atOCzyZV c=1 sm=1 tr=0 ts=6a2a9d8c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ZpVAhvDm8T4WZmbhYYoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfXyu8x6xgrSEHz
 cnazPQ8Ak4CqlNqM0VoBHIoIkW1DLc03+ubwCCU51vUnObhWOGxyLGGxYjUnLLZWmMFroDAKiYi
 wUiytK3U3mqydyg68TUnuQo6J5SEEFeFFX6XHGe4XO2+qo8UY6VejUl1kOj0ETNO/yysrcwUJXL
 D8MevnWMVC6SXY4pwD9h89d2OI1+kFJkLYgeOxs1P8cTO+hdO34YJ2ZSMcQNKN2dMGZE32ZCVIU
 SQYsEuPjKuv/bqF8Vacc8UHsEMz4TUr4mAMsbLhnuU7zJqV7UXYY4grNiUl2uuyfO6VbNBl46EN
 1gySUCpaljhArVzr2XKIUyTaCF/wxhUarndWCtbu21gMI/04dkcbmec+gUWAx9RDnYU4QHtSpB6
 /TVhOYE24SXiqCPvIfEnpQXI3tOsJ3pHbelfZWAThUylYhttf+2A/8DEIydPp0EnyMorvEnOuhI
 pT9YFlV5TWLWpLObXrw==
X-Proofpoint-GUID: lWVeeiXcyavafgtfLJF5e40X6wlrF4PN
X-Proofpoint-ORIG-GUID: lWVeeiXcyavafgtfLJF5e40X6wlrF4PN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110116

On 5/22/26 9:50 PM, Mukesh Ojha wrote:
> Point the SCM node at the minidump config slot in the always-on SRAM.
> Boot firmware reads this word before DDR is initialised on a warm reset
> to decide where to deliver the minidump.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
