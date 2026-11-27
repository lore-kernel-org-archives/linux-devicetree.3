Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779165;
	b=sfQLrLNJZi8wLkFgFIPkZHQGccJ5GcHq0Y1Ms+ate5Nd4gITIbUfN/c7rkRZo/Md4IrO
	 CyoeM6R4tEg/ykJdQESYlhdNPe9hNZQ7wcb92qsnGkfvCAInW0XWPFow/VaIxZWkanwHC
	 kj23fhqzTZZEy+Zb7x2AlgTIp9w0kvUR8WUIjzUTmL20fQoYjuSjrdG5e4CWMyEldQ8Yb
	 DHmk/hzSBRhQa9OYeZktR9wbxQd7OZQntBa+SEfYfRO2qOeoJEMHH+MRNyL2WD17R8/bN
	 m49S/8YXSiKTYyUo1WevPRtkO73PGiNdDs1827RVH94g+G5IHYvNHauUyQ2VMzRVWxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779165;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wNNDTMtedEII8GWbR4YeAz1zkI0o7kg6R+YCF+Z2AS4=;
	b=OUsJ28IgMQ6tDdORC8oSHmfrW2aqqtcQ/ydLwgTAir9Ny0Uj0sEb1Y+XRiRBaXbHK9oH
	 fSxMdMh5J2Zpi0xo57JTWfY5MTnH68WTm0ooYYFWFgdxap5npSehiQ3uwU/atk8wNCzni
	 akQdQOntxVvZfTesdyhhkyX+gU1kf5M0qtXSXd+8iG/TDf+ubBS0n0xOb2jV3Y8ueAJm+
	 X5BGNrBGdHzHeAD9aDdTEaNrKmz/L3Fr08guh4HBph0V7XY9djSTBDWfeyWvvgswYSJHb
	 zO9ya5OJlfYiiYsjD6QxUQdI6CyqJusW8/LCNCpBaRm7sZ4WpRV1LWm81apR8SbzIeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dxIfQMlm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K1S7Dw0W;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899D7606A330
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:32:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 899D7606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dxIfQMlm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K1S7Dw0W
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApdNZ052835
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:32:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wNNDTMtedEII8GWbR4YeAz1zkI0o7kg6R+YCF+Z2AS4=; b=dxIfQMlm2Yh8EP9/
	VQScG+IoCxTduN6xSeNmkE8g3kg7nHoxkCiPT+9hVCVux5oJ/Oa0rZVbIDOZeCt4
	BP4LU/wHTnxji77Qx3X2723GjOIJAKvLWGGg3Qq/U4G6yNFciK7D6uciyISptdF2
	hRfxBJizb9qAuUp2WP8FvOrg7ZeeJAXjQpe6q7E+rmg4h2Jz1rCN+v7XusoS+P7b
	YZX98M/wscRHSinV1vUFTfcbx1fwfQvw1T7O1EfNc0R1to89+r1/CEwQPc3STK8T
	ll4D0zdiLXfXOiREJiZnlDJ7poiV7Urq6jyo5sKgEmRS1vv+6dqKwiw5qIgOq5yS
	H2xDiw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74g6s6r8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:32:43 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ecba171914so367327e0c.3
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 03:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795779163; x=1796383963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wNNDTMtedEII8GWbR4YeAz1zkI0o7kg6R+YCF+Z2AS4=;
        b=K1S7Dw0WiX/sqsAUf29x65I1lbFYJ5zTMQP3R73ZVp9KdTt7+ycdnNJv2/VZNl66PZ
         65psBtSkjQt4D37plip1pQOGCbkzbcKiGAQWGfCkl+bNhSpVWqJwk2JvCraCNYAyfdmX
         NHE1kWMrt3BApxEp3WmOlbEsLYK18OtFtxkOYSu6wy0ZE2eRDvRc/v4JLJF0HU3Su4nf
         7lutw2ZcU0DLL70YpBCDwk272L4WtdjblYBkVQoPdxpT0IjHkx2FztF4p5jMtM6OSW+N
         QldjJe/RgWlizQG59/RT8K1CT1CR6RceDvjZ/e7ibrNyTe4u+iIWyzUkwSv6vnSfhQtG
         1a4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779163; x=1796383963;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wNNDTMtedEII8GWbR4YeAz1zkI0o7kg6R+YCF+Z2AS4=;
        b=XEDlQxqYtPIkNm2WfaeJknL+eeGeBfR5dSU44AS5gT+Lf2xPaX93h9IB5hUp3swHqT
         ShOEUuJZdfYDus+WXXKCgz3ecJJfF9W+3vxi/iTeBMFRBkPqpx8ihhB86dRU8cbAkqzG
         +/2TY8RpvJY63fy8IbxsdGSPVEsdzA738HwwwkyGONFYId8mTXzu/pMNNJBdYNN98EH4
         p8C5yomdznzEfXDAEAtc/j8opJmz3OTbqyS6nwWBmhI9cOKDLaHLZj7vJsqGDE5xozFp
         oSnmwcky6CCv8BUgkXNNM4w+DkaQAxEzE2x9DrILxl7jCvpeBrHGPQhEi66uFOjJUmrF
         Rk6A==
X-Forwarded-Encrypted: i=1; AL+hErF5o3DVK0v3Z15c6zUbTSrwxHw+Tha6M29y/O0Sbi3C2vlnFYVCQ2FJyPRZQo8tIhK3yxXqp3iLVBHd@vger.kernel.org
X-Gm-Message-State: APuU4Z9EdJJ0JdAGR3wozz3R8F66jS4lbobOx1IotfHNN6cpgFlBwAVq
	rN0/qdeJWGQAwizlqs2eXBYCI5CPIBVSbLad0zsTw8IBNeHgT0i+E2kmDjfNaXG4cv8BDzbIJlu
	/urmQ2GPE6d88gvKt5reuL594az3kkmCBMYzI/rpOOnf8jGJydfUSd15RzWHTypzm
X-Gm-Gg: AZFdTZeBapkPF6gN72DLwjuoEXQ+WjuT3U4YU16ov16IiKE4P5KCerhmurW7ZiN5Fog
	RBX2pp15wDGuq1ThdSoXAtS8tfQrMomuYBHKeSrPFsoxbdWPbHx5RKNVduDaLFSE9wxIIIGm1H0
	qNCNs7Tfe+wgz1WAPleX8FcoroKaYk27fRK/utF/DbZEx/tAVwN2N0lz3m29vcUeDZlkaT+b1Jc
	yxxX19C9ubgulTZih2IzGKONGsME/hARh4DzLyOsYEImXehbFrldckgQoiMxAGKNgS5YgkVmkTZ
	T/GyIZkx4Wd8fJqy1j9o4tJ93qr4g6g2RXyGTxhVm2sw/hCRs1lJLm318fLaW6ELbCgQrInnu8V
	8me3l+sWTCUZWHFkwP2QqgOYZqXy+ZzVOGL4VHSbq3O3BuYU2/1e3qanUdLDR1GUSNLuJWq0=
X-Received: by 2002:a05:6122:4a01:10b0:5ef:d97b:2867 with SMTP id 71dfb90a1353d-5efd97b3b39mr544182e0c.0.1795779162794;
        Fri, 27 Nov 2026 03:32:42 -0800 (PST)
X-Received: by 2002:a05:6122:4a01:10b0:5ef:d97b:2867 with SMTP id 71dfb90a1353d-5efd97b3b39mr544142e0c.0.1795779162302;
        Fri, 27 Nov 2026 03:32:42 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm901356166b.6.2026.11.27.03.32.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 03:32:41 -0800 (PST)
Message-ID: <541df6c2-2b98-415d-a57a-2650f03cc495@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 12:32:39 +0100
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
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm630: Power the ADSP from the SSC
 CX rail
To: fabricioakio@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <lumag@kernel.org>,
        Martin Botka <martin.botka1@gmail.com>,
        Alexey Minnekhanov <alexeymin@minlexx.ru>
References: <20261125-sdm660-adsp-proxy-rail-v1-0-b91784c69623@gmail.com>
 <20261125-sdm660-adsp-proxy-rail-v1-2-b91784c69623@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261125-sdm660-adsp-proxy-rail-v1-2-b91784c69623@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8wQeJdnjgI6P2NTNf4qpfW3dOeQfF_8B
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b096a5b cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=JrArOcoNHQKtsS5ItqMA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NSBTYWx0ZWRfX7hmE9OmaA3uP
 sl4/9O34mVsolIyBC+ghTpL6KmDsbLQ3rkCDPpo68KoWsVTtddW78+F8GNkRVVFlYP36fUdUZZR
 C+PRXQjc5sleItMxxS36ksK8IqxTXRg=
X-Proofpoint-GUID: 8wQeJdnjgI6P2NTNf4qpfW3dOeQfF_8B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NSBTYWx0ZWRfXwS1ZjaP4Pc9e
 WA3KFqXUWRrjOBRYd8ZbGjTQj/s4/Sm+ZwozFdB9NZfwMIGZKyay4VFgmABx/VDhL1BgomMfEc7
 qlnSF2qYvhCqFe7nj461wdlaUwiNkzVXgVTE3mHuSaNO2nvhcvsNqP0ZJtsstq0slExLprLGL2D
 4lMDCLPr81Nsaz+LzUNk+7vxfskEVsFtiQ4Ie6Ensyc/07Y2+NwunbtYXp47TJ1+r6AgzALefOI
 3k0BABL4R6HHpem5q/6cNYcPlh2i8SM4tyMfLMLJlp0QRMIziKrMc5UKZ8jZWz1a4ZG2Yti6T9B
 tVquvIocdVGlWsWU2yq+rcqLCQAaXXUw1NOE4OsPFu26+Q8ZfeiNK8F94Ww4+XbR63qKxLEQDlS
 o+hxfORCsvv9sqASVtXAlvf6e10pVYVA+vuisayPgBy/3Ch53xWkJ7V8E07KrX+OmBxaNtc80MH
 Ky4YuhAURT9Znwxm0bw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270045

On 11/26/26 3:20 AM, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> The ADSP node names RPMPD_VDDCX as its power domain. The rail the ADSP
> needs to boot is the RPM's "rwlc" resource, PM660L LDO9, which is
> RPMPD_SSCCX: with it voted the DSP starts again after a stop, and with
> VDDCX voted it does not.
> 
> Fixes: 7ca2ebc90a46 ("arm64: dts: qcom: sdm630: Add ADSP remoteproc configuration")
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
