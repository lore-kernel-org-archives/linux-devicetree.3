Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792497547;
	b=SC3J5rHc6Pba8xHSfgfqYpDR0mnuNk+WnYA1IuQ5NQiDYs75ApVP5ojScD15xMGbm5Sm
	 DV/R5CWrvX1x0khH9LozSoOAf5dnx904aGpAlCkx5QeTZJRi5TlVkheM/sY2+/mOf28cI
	 A8Gd9OY3Tl3g8ijm/63IB7yuB6/zCsvmXM6qrQFujC4GxIW5f5dgmu2XAjWmZDzxVP0sN
	 dle2uvPTkQUFEDWLpgT6LQbp7C1Pm0iEFyZVx/dWfrt+xdEXSWv152j3LoKfg2JwcVl+t
	 MuU/1pkOIdA+PNRrw0hdeJdfD3AV6h0ZTaU8OJL3Xnzw8caDBapxOfmQ+XukXsjIpUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497547;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=B7B0ogmG+yI8zgy4iQeMNyHKfdE1d/1H2LE3NA6bm4I=;
	b=l36UvXffSXNgyRQehorMA4CQcY/XJjVCm/ccm1lavy1pZ43WOBXqZUbW4A3cJd9jnhol
	 Q0YtCQmHQQRGt/2+JKXii/88esAIm7d3Ta6q5nAyhSFnJ8WRiZfZhE41XOXKWdQrvKR3/
	 2nFN0QTIPU54vmr9elM+MXjatBWnCp2vHOcwrckukHzwXNrRDyxcDAHZ0oyrt+0GuOGYr
	 YNtjRPRnPQFEtPk5j9AXrZhhPpfKiRXBvov/xv1yzuN1NRc4OHyV9d9S+3HPxlurz3hEc
	 RmpcnbDWQNsLzN/aPinrcj/PUsL1npdTqeNfp3/WmEWKujyxIEAKT5RlA7Qyzroi4zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CP2iwbvo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HgGCpnxE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F23660A2611
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 11:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F23660A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CP2iwbvo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HgGCpnxE
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KBWVR21571787
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 11:59:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B7B0ogmG+yI8zgy4iQeMNyHKfdE1d/1H2LE3NA6bm4I=; b=CP2iwbvoj9AxplqB
	XtEYnOAUryPZSXQz4b96sLKEmHLqgy49V3FSllEBqwBhizNXO+xoEJBm+/bkr0W7
	CCc7PrY5HGU6jL6GUxJ30LcaQFSiggwWq2ll/apkteFfT6rXPts1PQN/9dnF9OtM
	l6NH4bLEyOr758vBG0QovrfpdRgPMfQrGn5LmKDxbtqBV3ph/H3CvAAa3yOmaBXh
	+LyksrSIHbFLC1TiaJP1fKYAsG/SAmDiRuo0jm1CimGtqPy+HQmVbhm1MmBBhAIW
	8AhZgXdKY7PxKoHn4idEsUwoSkvA+bd+xW+B1PCq0TeIRgYbYPQc6WaV8qu031Wt
	/qctwg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h282ks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 11:59:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53389750985so4809491cf.3
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 04:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792497545; x=1793102345; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B7B0ogmG+yI8zgy4iQeMNyHKfdE1d/1H2LE3NA6bm4I=;
        b=HgGCpnxEBhkge1Z49EB/vhEsdhD5eMkHr79IrTXLfgO8apUtxkGbp455cpaRctktyD
         ymHeGB3N9kFZ37Mtzm09nXf4I8i0yXsIDE6+fWIs9SmhYwG1KM9cnYQHwj8Y8LzwMt3I
         DWT8CL1Xe0IkNfZ7itIcLHXMcozf3fgOcXypUR8FDhZBYgkKN/rZmhnoguPZ55ZFwK0o
         V4aN5R19CJ77J77Jzrr1CkZA5z+JfuFX+jYwgMtrXy46qUiMu8tnA9IKrhGsnG2nURMR
         g/3xNcasxFJ/kngRK7oIG1fm/ETOtEKol8tOfgi80e7dwAsqgLZBXza8REu+azigZzsf
         GS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792497545; x=1793102345;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B7B0ogmG+yI8zgy4iQeMNyHKfdE1d/1H2LE3NA6bm4I=;
        b=b4krFEgPzWw7YdrC4/VbE1WZjytNCa6RZ9yPqB1KJjt5wSpig5GDAxnfmBp/s80De/
         zWtF6pAc6tc1oe1hHbblIzdSZJpnr1OotBhDXSY7XMkOZntnw8baHmtN5FaVgu5rNvsg
         xk2gNV77SYyIBJXnLNZJgATyBJn/ZwMflH4v46wkZUj1GTeQS5FM0qr3C3RQ+r1BEuyn
         ME1iHoV7KFu2/6T27nEXjZDNermb949d+l3hR7BJVF3mJW1IDYjoEMu7ZUtPon9n+2No
         q33Km0Z/VraqiDIKITcn2YLCDkgCoWLCGsTcik1lo4K6RxyUXkGA3L6W4D1VsEgro082
         VmwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNySxxFl6wDrnfz3aw3WDgCy5yEckvNQ7DYwrJdtUQtmbm4uO+iCs/Qy1H0sbcFCAF5KCPanztBesG@vger.kernel.org
X-Gm-Message-State: AFq9FYJjX5LAY8MRWBAZFTwLA2kNixsLghKpuGKTai2x16ISle0rXAxV
	J5jDKxo9C3Ard8bFUwlasVV8Mwk252LPOZj5AxX4qAgvgqAVsmB0s2bNdFBFb1ECwGU31QQcGUT
	E/IJixHUUpXrr03K8EPVS3/GNfFyc6EESe2qswyRW0JjwzBpB3oDUC/bOSumeGI9+
X-Gm-Gg: AYBFou2d+2KCA6NHU1huUk+ZG1XR60WTLOxhclwft8hv14rln1FqxvmzFRPNtw82d9V
	GVC2OZF8glkpAmzF8m3gpO4eaOmynnrnJmkCPX9WdlO0gV1oFji1mU5/jfTQYJ9FS9rrORkkfsY
	na/h485ST97jLT6SClslcFE9fbJW3zDyrfCqjsO/j36j/bOL2QVcEHPx2D91Jzr6NknroleqwGJ
	fysj7iI5WCWbSgTKTv6lY5L1gZBJRUfrk1bgxotaQKCyvNo/gHwk/K+he5s4QZegGwxMJ4eDY/O
	JZK/e9FjOneJ2AfZANKfflcOv94n9jXhZwuJEqcTyIOD/u+qvsCSlDLWZQFnjUlG4372lD5Dun3
	N7nbSO84pBZ0Sfy2S782mSA==
X-Received: by 2002:a05:622a:411:b0:535:162c:2e81 with SMTP id d75a77b69052e-5364616cceemr192543781cf.5.1792497544973;
        Tue, 20 Oct 2026 04:59:04 -0700 (PDT)
X-Received: by 2002:a05:622a:411:b0:535:162c:2e81 with SMTP id d75a77b69052e-5364616cceemr192543371cf.5.1792497544441;
        Tue, 20 Oct 2026 04:59:04 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32bc33sm476375366b.5.2026.10.20.04.59.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 04:59:03 -0700 (PDT)
Message-ID: <372be891-fa8b-4d17-a9d4-2d7becf1ad8f@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 13:59:00 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: shikra: Enable CDSP & Modem cooling
To: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        gaurav.kohli@oss.qualcomm.com
References: <20260911-shikra_qmi_tmd-v1-0-96c1cca82f30@oss.qualcomm.com>
 <20260911-shikra_qmi_tmd-v1-2-96c1cca82f30@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911-shikra_qmi_tmd-v1-2-96c1cca82f30@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pU__d78KR7Y1CdTW_YTWZroOGQaP2rgm
X-Proofpoint-ORIG-GUID: pU__d78KR7Y1CdTW_YTWZroOGQaP2rgm
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad75789 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=2J1e7r4m5WDM-kp8FRYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0NyBTYWx0ZWRfX7FvMcpaiqXop
 t682oPAX3gm252FL141W1GW2wd8Th8OCy5GWx89YBUO5meHKMeTaN+OM5mSuanKthm4GEFxkvrT
 dbd/4Q5MGDesp1uec9Nt1MB1S4GieC8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0NyBTYWx0ZWRfXzqI1qotKKFDt
 s3i6y7jigHGttTis0pjy+QZh/VmEcz286I0dBEcmlMl8+Zr0Vv/Z3WvrIBV0wyv5k5vMKlZBeXP
 xN39dOS1k2xrhf/p78KSLV/mmlQDF/HXGhe/FRjWk1dHRb5RslT8YYo3C4DVV4HBHp1wmgVmWar
 MB/n82/8AIHLJMC2/Qj/wKNa1mSu0BrdwNDb+KDzmFPeQyzZ8o5oP7QWL/RYfxK5WNlxNFq7YqP
 EwtcYBirm/PU+SFmmWM4K80t4njpTNgY60iXHqai7F9T3AX2UR7scr4/TB31ImSKqYGDIYzBxtV
 kamkILVVlCynk1eGrjQiF60SrpSVSzcWh9uEl1ciXYJOSunR/nUWv6GFfyx38Kd6Y5rtc5hUxhP
 FCRG1R3YvgfV1FwdZlR/rhGFTuv0cXgm63hwj4GedGuScoBurBWWvGYwVbUsH04icaFvaNdF+lm
 +AWEnXw/dSWUeyPz8IA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200047

On 9/11/26 7:03 AM, Dipa Ramesh Mantre wrote:
> Unlike the CPU, the CDSP/Modem does not throttle its speed automatically
> when it reaches high temperatures in shikra.
> 
> Set up CDSP/Modem cooling by throttling the CDSP and modem when they
> reach 115°C using the QMI TMD cooling device framework.
> 
> Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
> ---

[...]

> -				nsp-critical {
> +				nsp_alert1: nsp-alert1 {
>  					temperature = <115000>;
> +					hysteresis = <5000>;
> +					type = "passive";
> +				};

No "hot" points? And no throttling at all until 115?

> +
> +				nsp-critical {
> +					temperature = <118000>;
>  					hysteresis = <0>;
>  					type = "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&nsp_alert1>;
> +					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
> +							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;

Please align the arguments so that we have:

<&foo bar
 FOO BAR>

instead of

<&foo bar
FOO BAR>


Konrad
