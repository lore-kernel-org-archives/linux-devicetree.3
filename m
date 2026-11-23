Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447400;
	b=Ax1obuRk6quPHSpQV6QunWtw+q7z4nj/sZwUDxjTX565ySHTNRpKrzMY1UV220ksqDkJ
	 WhU2cKZtHMltG7Td5a/55fhb5JFSnJvQ98mfEf075zMrmupT4Y+3vUVsNRsLRhjzSqcDf
	 YRN5+1G2eWtAk6uxn7Rrse8AqIQYm108gOGUarozJdFgWDQeFAA5Pg3VpV4z+bjEo0QLU
	 8dnbutPfvLEH94TvqxwV+4Fpn63qQ2rp59l0VOQRVGhe2SX2fDCw9ksxMi7Vzr6539bdK
	 jBQ0wSNH3c5a0vHb7ZprCIfdg0yYWpcEk27+pNko+PS+mOca9luHFzYapjS3HfIq0uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447400;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mg+OgzQ4tpxhMat9cW58EZSWkaQSb11tNf1CS4bvl6I=;
	b=SH13HRD2R8Z4iln548ldUGSmNXZUD9/uAq+k9MjSfgk7KEfTilpwXgzuLFz8P/5QpNn5
	 /wfMJ0dzXjF6EukUImzaSuIEnkAt8bT5nJtQ4+A6ni/6cumFIHY+6r69wpMHAFAyvEBL+
	 jl6AKWZjM4Cmm+AW4+VrrKXgXOWqokT6ZFqPXQyP+PsAjjU+4AXqdSdLxsm+fnoxxBNWl
	 KL8Osrut9O48hVMrj02GIKC2SAa64Z+0LqLq6SZHkeELAQDXEe2zuQs/Y1fWxuIDHl+t9
	 3QfxgOercP4yyQBKRU0cpva8f7QBT1FazEwTiFlttFIoewMXEVudKIHRtZA5dLxsV1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="mGWlM/ip";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fvMxHDmC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C39606A327
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74C39606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mGWlM/ip;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fvMxHDmC
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKvQh1974195
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:23:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mg+OgzQ4tpxhMat9cW58EZSWkaQSb11tNf1CS4bvl6I=; b=mGWlM/iphsIpsRJC
	BcX6tCQe7ZorvtRP0AOhW4gcjfHcYZ0JBdt3CEu1UQ5Cs/H3I/m+yCDNgGGuQ3nV
	k+IbOXudP9tQYOrgbY19ZVum5Y//wqcG4zmu1usxUxw8b57rPwWZLwEeOoO49qYE
	Z1XVgWDtwAT4KPk0E7tx1TE6QB+5WqnAIJiZIBLb1Kl9V80fU3Tx44/ULGrzOMQj
	rYcEiN7zRL3eVaKnHxzRIO4WTiHC8TTdp5ndTNt80y52bMyAH2R96sqvmgyPGInf
	pd5/63oRX1Qo8Hv/PUstT+kJc6rp+5dVc6aLnb4/jB+D9cX8NhoLr57lK7eRr6OD
	9EdKsg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4m7uryyp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:23:18 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc081f3066so144469137.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 07:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795447398; x=1796052198; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mg+OgzQ4tpxhMat9cW58EZSWkaQSb11tNf1CS4bvl6I=;
        b=fvMxHDmCwHered/RPNTurJygkLN8Hh507+G33kgBcktZiJcYrJY1dexfGv386hlUcc
         UIlrkSdB0cum5Y5STJWHYrV88EccM6x1IF42bk90w0i2RrY8dht8YmlQ9tESPb/CQU51
         f3p9lVg9wbXDsrk5FFtJGYxNeMTzlmIRlxXrk42RpI1uhaGLAk/JZWfP7g1YuHaaYD9V
         EebOQN0skwjZA/p6aqcabjhzRRK34BIBGMbgFFS1FC12PAacZf79hYQMkAhLAGzTfeM1
         Ez0VdPdAe3g+TqTDFraeAXPtsP+tHX2+IeL+fEupRurCee+VYG6WijgiFKJAGFE01g1h
         l28Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447398; x=1796052198;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mg+OgzQ4tpxhMat9cW58EZSWkaQSb11tNf1CS4bvl6I=;
        b=10Hl1ayzRiSunD/Vd/JpSkGuB5KSGVXN9G1mf2c6ns9iYZvjOr6oAZwDP8wJFcn6RS
         DjCQUfQ3d4hLHLxbH09/WCF0N1wI/kzvhVThbMlqhDhx1ugqNl0RZnutdVLDHmoSavQV
         ZEhyDTUTFWV/jSE4h5GZSPUSZjvxC1017i+jJL+7G/TQR9VIpriyMpaauAOhWucd+hOl
         Ix9+1TB9vTpLFYDoyGIhWHb161nfGpb71SQ1Awx9w5Se3VpGodTh0PKEve3WpIBCkk6I
         /+vHURX8o2IWK2Cm1h2dJi6nk6/AdfqiCugkg5iDSSvEZzkj6JpVd9FoOBtZe/OtEIAo
         IoMw==
X-Forwarded-Encrypted: i=1; AL+hErFN6DezXUwmqcq+tnngaMPE/r4kGM/Ga07xLofKfS3RHeZWSUPcQL3HzL8klGCgoDo2yNzfStITBesa@vger.kernel.org
X-Gm-Message-State: APuU4Z/TsvbQTTF2rjUpOxT583BBpniHJDPvOMuuHWTYY6+hd6QkA29j
	TMWS0j/gx9foYAN4E20nVSrWuhnJ+r4IHqKXWBmOBG5ha1JHFM2xvztjqefudrkjUeLVspBk1s6
	QV4UwlY/2cn55M3Z/vBqXKzXNCL7wVOECvFW7OW+GiMEla2YB3YFFuQ1ou5al+QXH
X-Gm-Gg: AZFdTZcFXvVmbRGHJYmV/aujw6RLdf/fN3G7R6Ks45WVF0j6s8f+97k8yveW/r/8fKn
	X3dy5jOgDtR4hG0uzjkhkInADXINmWnXFvEcSaVA0ZH6U6yx+yMNZSOGVa1TPR2nYuVHdJY0vxa
	7awJrtqfswuWCmTPq8REZk97EmjEHQWJG3RcoORbZDnDx1grYdQfBss7NtepSjnqCilzTqSkVPg
	dqkmMshbaOooaAUEII3tohQRtxUTopeE1+icz5gVH8gLsul4sLiGEWipZWHRFtcjxHbOAK2p01q
	fvShTkf2szjXJwy4PsNW4M0QYjFUQ88YpuBamXQexvzrTGZn6rrIHCAhUmcZNadwV8Ixnd+7/Ii
	De43FB3c12vTdi24hyWjE0uECkFpXPiWS2acbxXbAByssec5tvG83M+93vN1FeSEYTgnFHI0=
X-Received: by 2002:a05:6122:6b86:20b0:5ea:b7b5:454 with SMTP id 71dfb90a1353d-5ee8adec997mr6972865e0c.1.1795447397510;
        Mon, 23 Nov 2026 07:23:17 -0800 (PST)
X-Received: by 2002:a05:6122:6b86:20b0:5ea:b7b5:454 with SMTP id 71dfb90a1353d-5ee8adec997mr6972787e0c.1.1795447396812;
        Mon, 23 Nov 2026 07:23:16 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aeabdcbsm420368466b.46.2026.11.23.07.23.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:23:16 -0800 (PST)
Message-ID: <6b036f68-e2aa-44e8-a606-e4c334587666@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:23:13 +0100
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
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: shikra: Mark RPM message RAM as
 no-memory-wc
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261123-rpm-memory-non-wc-v2-0-3e868b4bfa48@oss.qualcomm.com>
 <20261123-rpm-memory-non-wc-v2-1-3e868b4bfa48@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-rpm-memory-non-wc-v2-1-3e868b4bfa48@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: C4xM_zK9kB-JWLg8pddCGMc6zy1swrfS
X-Authority-Analysis: v=2.4 cv=KurYSmWN c=1 sm=1 tr=0 ts=6b045a66 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=OlIfnwjDZ2IE61P4k3wA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: C4xM_zK9kB-JWLg8pddCGMc6zy1swrfS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfXyAUBSNAoDI7i
 quiM2KT2yn+w4AgW0QWhmi2iQlHWrUSf8SlNPsHC/zjV9FAO7MH26/TzRXBbxAoOqkaF7yZHvww
 fMO5tXRsvFaN80NRWW1q1H53K7AFdts=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfXxbeGCLrtuOyl
 KQJvQtRTEct5YRt7Tk3mzebKWqNfXclklldOgHqjxG9UDML34ExR9CNzoz+J22q1KklstUcBNGf
 iAadCsoXRRDr94by2Q+7781bYRGBYa/AqbuXmMMp6bOWfIVOml+SXerjxhXyXZt6az7vco5A4V1
 0pNjQyUo5hu34u3X86fS5lSl8sBBPUm/hAoYf9ofMHON81uda2z5r9yvz/xBHEufcW2ltJW5dDQ
 7CxReKOMOY37VdTBH4tuQfMdlL6ZTmtUowNxH0rR5Te6rXI/nRW6orKnIFwPcLB76YlliH4uY4O
 4rcylXa0Lk7BZzAhV8dV8jnyv6t4ZNiztgKs+rDlSXfGM4DGpE8n22/M4Wu85DJ0K1dmPJsnZjf
 Ai38bGnN+3g0hE7D8FFMQmfHc8QEi/ei2h9YxfSLa+o9MtzFTEXhI7a+TeuXauH5H60AH+J+ZXw
 aHnq48ygz+3B5xjPSlg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230061

On 11/23/26 7:18 AM, Vishnu Santhosh wrote:
> The RPM message RAM is shared with other subsystems, and parts of it
> are not accessible to the APSS. It is expected to be mapped as Device
> memory.
> 
> The "mmio-sram" compatible makes the SRAM driver map the region as
> write-combined (Normal Non-cacheable) memory instead, which allows
> speculative reads into the protected parts and results in XPU
> violations.
> 
> The violations are seen when Linux runs at EL2 (KVM with VHE), where
> there is no stage-2 translation and the write-combined mapping takes
> effect. When Linux runs at EL1 under Gunyah, Gunyah maps this region
> as Device memory at stage-2, and the stricter stage-2 memory type
> applies.
> 
> Add no-memory-wc so the region is mapped as Device memory.
> 
> Fixes: 66664b5701da ("arm64: dts: qcom: Introduce Shikra SoC base dtsi")
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
