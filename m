Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5DF378833
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 09:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777886723; cv=none; b=CQa+FHOcX91ApqoItn/AUqUXnOlHzifteGOes06MORJQg/U+rbre0aSXHcrAhxsmuLlJqPyv4uQLvWJTe+9Uz/g9ex9j0rqfSNV1Zyp2aGgUInZTZXHZqmYP+aS3rBgRY2g0el/YxNZEzX7RpqmzTIys1AcaX9WhQxS+BFvUiks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777886723; c=relaxed/simple;
	bh=QXh8tpoCgxIgIRivtPfwf9N7Ak8nnu/99/ev/ItSxFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iYS9sfz4SimQtniGSRqQ1Nl3qcShnLvQjOvgkXZwe5mqSFvZJbGnwI7EDfNmDZEkViNfm7dOzR+kBM/D9Pq/RGva2dgizjuqgm1lmAVFMw3IDJXZBgIuiQ0QHkpaDw1gQ4qB7K8FXirWinK0LWL5FaRzvdjN4ArO7m9Bke5lmpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EwMpDJNv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PgX5RlTx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EwMpDJNv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PgX5RlTx"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6448fSU13817886
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 09:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NuWaOvztEPnbaaknO2almKhoHkHjQ5+e988XXejF9fM=; b=EwMpDJNvlTRTPpps
	IIifzaLH68OW/kfIGuOnkK+Z8h1L9O5Vhi4rDnuI65D/Rm+qp3vkgfcQmeZVhyRn
	Sfp5TK4xJuuVRqTV0RG3GZF/s7Hwoc8tsu8urAry4WhUeNCw3YbsqlocuT9rBG2y
	BTCvwYJVZx649XHKrsyspuTvJxtvbk/2zNcZNqBQbNN5SFx2ye1J3VaoTMTvmBFl
	8vcDKtp/A/vLWR78OKmUwWMadB+q2n/Et8SYl7hk1qx3lWqAMTaanPVCE6ZzDPrz
	FV61YHeezdriZ+C95NuoD4UcgqtjtEHXm+HhMgiuvthhV056GqHziVVEBbaIFu2u
	WU8iKQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw9bvn2tj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 09:25:21 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8aca8a79f42so10217476d6.2
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 02:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777886720; x=1778491520; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NuWaOvztEPnbaaknO2almKhoHkHjQ5+e988XXejF9fM=;
        b=PgX5RlTxrvlS29ydwIugdYAA1mFcEy2UuoIHDxlKc3Y1R8/izu1cF3nxWjl8e3VAll
         A/qb7NNTtJB3u5P3u9qZY/gfe4DPnYRjEIemkyh3W2HSoQr6DmkQUrHEO5z27IlDHidT
         q0oFy4cNKNizL50wfHVSw3G/GNjP6fnbjoFfogempKVkNwT3/mQaJ2ZYcFF4Qj+QwLrx
         7R6VFYzrf9LBrtsH1LBUKhjOume+q0+1Eorm9CVj2hBKuecKerqDnC3COZXIApsKfGmr
         yC8Dt82Wg3sWcNwcmfWafS9bRDI2qiM9V5bfQ8p4lwjTRDXAGnD6LFA+34Wp1nOrK0Ec
         nqrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777886720; x=1778491520;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NuWaOvztEPnbaaknO2almKhoHkHjQ5+e988XXejF9fM=;
        b=CqKiT06w4ZOcP9yW6aKPGZjzT7F8aLz7I5yOy3qKovqqMmoyg4qGiperqwYLuls7U5
         ZCYyqGTieEZ85yPvP430LrbZm1OUaqN4/8OEx2b2pIoWajFf1b2QcnsYxXgQp8XtRMAk
         W4UHfATOB4FhIgBVNZXQ/ARYdoHU4dyjzv+1OneL7lxoEm6GZa0KrxNmPSHOKMG0hGql
         uzmeXlD+/Vx1ooRJjwcohf1DA2MSIrTkEYxcLgc3nPRlsmfeDruVDG60l2dgYMa2igRy
         lobgLhpV1OgFFlqyK6Iay9u6R0BqhfGR+MhBeSj28NqHwWckcVg+4YqIdLZksU54shmR
         zyIA==
X-Forwarded-Encrypted: i=1; AFNElJ/gvFxlxovOYEOB2fHsKjzf2aVupOCjQmb2slUoJVnl/NUAEQh1IKEU4urEDJIXoqFeOPHd8oKSk0qu@vger.kernel.org
X-Gm-Message-State: AOJu0YwZhA6HdRkRUoa8am9Gie6dS4BNq/d89twxJwGIh6V1zAADGmsd
	QafbcJqqoY4Lpb/c1Qqs9Cmt0lxlKXdMIYGY2A0lD1DabKjRoCJ0cAc5yO4vRCH1b7xKT3lqyP1
	xtv9fAwWPFsRqEsX5DpWgWek8/mFb6QEi8M+a2a8Lszn9ycZ2FAXWgdbm2Mrh679y
X-Gm-Gg: AeBDievWQSyoWjKCp7ne5UJBRHeZEfYX/i/3uYnNEq1iy75IaHrX6swGBITpEs5oAtE
	hNVwoNbLYGOOEx1vSV1cE/UoOS8/D0MNU7SnxvswIsmSxwwvdjNcwdKPSeIzHsxQ0KscAyCNIFb
	zkiDAK69AIkdAG1VDTPgsEyGl6FDUCnu7gC2SVD5hon/VRKPNcA4/cz4zEwmxh31FUsVwr+io4Z
	qBm9NGSWAHUTf6NWkZN4Eeo1Xl/zO5BFgkMDvty3Ccze3VL2qMASKcJtR+80EI4npc4pkHrBgor
	d5lgk2zrk+BhCSDYbRTHr4qetD94twn0jilu3giTH6tEwq+Lzx4r86S0hdMnZExYt/NpnJ/KRSP
	1aWKcHgK+PO43n03Xb6kCuJSWzM1EJaPUkLnHlLo6ASkniMNDuI1p4PMFAFwehBqOUIMBHEKufN
	4VicG1nhf3+lE5sw==
X-Received: by 2002:a05:620a:1709:b0:8f1:9e59:2208 with SMTP id af79cd13be357-8fd17d49509mr960459985a.4.1777886720585;
        Mon, 04 May 2026 02:25:20 -0700 (PDT)
X-Received: by 2002:a05:620a:1709:b0:8f1:9e59:2208 with SMTP id af79cd13be357-8fd17d49509mr960456085a.4.1777886720179;
        Mon, 04 May 2026 02:25:20 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b85e281cdsm3115053a12.3.2026.05.04.02.25.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 02:25:18 -0700 (PDT)
Message-ID: <9eb8e746-5191-40b8-9edd-1286e41cfbae@oss.qualcomm.com>
Date: Mon, 4 May 2026 11:25:15 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: slim7x: Add Embedded Controller node
To: Daniel J Blueman <daniel@quora.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260502063518.15153-1-daniel@quora.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260502063518.15153-1-daniel@quora.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5QTt9MBGuMsw2HLL2RA4_kA31QJilu4v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA5OSBTYWx0ZWRfX+3q1xFIgUkaD
 EZ1XSQ/hzH2H/RUBtZN+/no86flXzOzebAZj5BV1pDndB93/vRN3ZPZsVk2bumQokSMIM2IpPa1
 od4LhYvQ90Hdx2JRC9JXh3EK7+B5Q7028t9TcKzrHLtOFgJ4iDAmPnO9pETf7wW2D6jK0bCI8o3
 r/q6rGiKyLw98tfbrzeosGvSJYkSa1bCNE3I5dc1Jk7ScKCUMqSFM9517lYd3BQTPMBjygHJK7a
 9e/czhOdh2oPXGXzepEfJsizhNVBjsyqz8J9WTQ3RLhidr4qYNaqYibHVW01I77OIVrzfpXTTZg
 bRqqtKVCVO6OwCdgFyis98/2qP74xt1ue8cKZvU/2shfGrpi1TYp+ZHxgZSdh1a17gUCtavNsMg
 xp2VreQbyVtx1Vy51OM0wtT+RLUnPTyN2/X79gpD5EjATvklSGeWrHUzWOg0GryAtWlTxh5IdLY
 ENeZ3ilYGvjxHJv5C2w==
X-Authority-Analysis: v=2.4 cv=dqLrzVg4 c=1 sm=1 tr=0 ts=69f86601 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=t9ty7G3lAAAA:8 a=hdOfQ7PHE4ms6XNvABgA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-ORIG-GUID: 5QTt9MBGuMsw2HLL2RA4_kA31QJilu4v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040099

On 5/2/26 8:35 AM, Daniel J Blueman wrote:
> The Lenovo Slim7x uses the same Embedded Controller as the Qualcomm
> Hamoa Customer Reference Device (X1). Wire it up for fan control,
> thermal sensor and suspend behaviour.
> 
> Signed-off-by: Daniel J Blueman <daniel@quora.org>
> ---
> Changes in v2:
> - corrected DT compatible node

You still need to introduce one specific to your actual hardware,
even if the driver receives no changes at the moment.

This is a measure to enable retroactively enabling quirks for users
that update their kernel but not their DTB, so that if a year from
now it turns out that the yoga EC requires some special handling (but
other users of qcom,hamoa-crd-ec don't), we can easily quirk it out

i.e., the desired outcome here is something like:

compatible = "lenovo,yoga-slim7x-ec",
	     "qcom,hamoa-crd-ec";

(the first compatible is ignored by the driver matching code today,
the other ("fallback") one is matched on)

This will need an accompanying change, adding the new Lenovo
compatible to the dt-bindings file

Konrad
