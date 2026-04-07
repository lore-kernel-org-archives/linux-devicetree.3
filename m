Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D3339FCD8
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 11:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775560947; cv=none; b=tdxZ1juLH8eO67IKKH2Eif5Nic9sdYoyrTxwxsYwqzHVJI+Er6Jdx5FngSgkjF0e2eu8H1SG1d1wgaOoWGhexjOEVjFk98wekfO/Ug9w4mEFwastVpOZWSbNtzHx96ntQECrSw52AY+5+l8eAWdRsHPkCDXdwlmeenmbt6VpAjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775560947; c=relaxed/simple;
	bh=P3dqmbnqkrWDfCd9axlAHyWR+D1HwXn3BqOK4drEnMA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k+Kw23ZCmkR0G+d72C80tQccCg4txrQKVPlZLzNBb+Dk+1tSkB/WAPcIEVKsSqivR3W7VK2V9u/SJTzn3LLTpADqyObRokbNu4+BuJeBc8rVsmZ1PRq3ncP3OG6QnP95lnnCl1Zxhb2Ukp0yj0XsPhR+ZAw5nNKQz414Gy5Fgtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bFTP6nhH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H/miWQ+z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bFTP6nhH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H/miWQ+z"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376bFlv2549972
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 11:22:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R3hxDXVoRGIe6aQ56fewcQB5Hz56pBM+IXbsRG+Hw0M=; b=bFTP6nhHHRb6Cqam
	1zIzYd2HrVw4CYkqHpD0Wb5Gai1aOCWB5Eg6gggzVnr+uaTM5uVH6y2Kr8daYoJA
	YxU+niR/gMZkoGiy9L5jvjZwsIlyWGLWFafyRLjtvkFULhUzy6Y1agq9NBMYc8VG
	S8LVUfPld7/1VoyZNDVRvsw0TprSZaabsmCu7VHdsitLomWvoLFasQZA4vlXrZqR
	67wTQk+25OoviwVBPchBM3+SMIIrQfPuZrIvSDYfYH/YUy3PTbmaoxz79yxVm55W
	Fi8yEl09g+UNE8OKgpT6xvrLKBqDoCOO3gwj7H6cXTKjEEgabiDA7vfmnI3N7F55
	YLyZfg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmreafu0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 11:22:25 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8a016b99579so21835516d6.0
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 04:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775560944; x=1776165744; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R3hxDXVoRGIe6aQ56fewcQB5Hz56pBM+IXbsRG+Hw0M=;
        b=H/miWQ+zoriPrKK7/cJLq5A1YQngVETGEKWm9uOzbEh4ESn+iuFMxXo2y+ql9ZbUeG
         2yHPqQvjWG3B2wGmBsX5delt74jaO2qkra25F0ZORDhtQQKhwgBMoxUZ7OHuCiYj8n3/
         N72xAS1aWMjOgk8jtWiEAf3ggVAq361xndzJ2BridXDBJx1uEmT9ORSkIRd57nVaEBqo
         vqNC5ysGn99kzlwnkAF6aAeZNME8yYqsdy+N1nNJHtFuIl2l/NlzXgLhlIoShCQYs1Zp
         MkTPPl+kdrl7Wbrkrn7x8Ud2zcpxhrU2yGQJI1U+h7KSxizf8OMr+o+Ujw+vdFxP6Wa2
         XO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775560944; x=1776165744;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R3hxDXVoRGIe6aQ56fewcQB5Hz56pBM+IXbsRG+Hw0M=;
        b=B1ZH2JhLwIeGOwWjqbmN41kMniBmXsTH/uatgrDtKG+QQrwV5z/y5SzEHlOy2pP23H
         Y+6kP9vCg+U+PAEfmNz6k4MjvNCnwk+zuKoGgmsjrYvL1cBMqGv3tfxthCOt9HjJ7CXS
         BESOHvU5Z0zT6Pbl6ezIlX3GY4GjSFJ2JRpOMQcK46hGhpJW7TKPFfV47i7Ag6bKpSrj
         WAkb377U1P5HeClSFEnqNPpPkgJOWIy1X4GlUPpcEonX8JbuMEv4GcQZf5wqA/VTloel
         RO4N1Y547TvCTwNqbPns4ZNWOsikgtuFqZIXIIj+XC+EoiA3uiVXN/KAEGEAIS3v2FkP
         A9aw==
X-Forwarded-Encrypted: i=1; AJvYcCVuNr/38qm3PqXGR5UCvw0wm9e8rlQeSMTOqR6EVXkn5x0B5ShHLvva8c2TfzZIbdb+3bpFCh6+CIU4@vger.kernel.org
X-Gm-Message-State: AOJu0YwHHOQfQRh7Fj793qkEtaFZx/uXlzmiOOM9nlCO1627PP0fMBan
	AcLN1xZqV1uQuRrlJLSliXnnLCWB53ehS9dIwG94hmyboPiZTZYawAwc+WeqXPpoDIq8avyumVH
	gP/liSk1Q4EXOEMODOVmQVmmPiVOne+iUud/rVmyKVOAwnIghTLt86FxQ9AN63Cu6
X-Gm-Gg: AeBDievP7DLplygdYKYE3vpB3wp6iAAoc/XEQQo0Zc4+1nOYjB0ojWCN1OQJlRfhcvX
	3QNJwOx54j2JXmO44imikBYK81LDP0gpAQNLBT2z4LKKzCugt/7n2D5wHLdrBpE5btPCVqBE0/r
	q3DBWS0BcdMZR6srvszZ8OAyiohKgWYljlpqbvb5tlJQrZDlViM7Vkp5djzHd8qXQ8FwiP1uB5Y
	otNJoUZYd5MAWLAurrmeSWTiCnojfzpKXfYoPCmkCrGBlqBQKnMitqAycjP8mvBPGVPcFAfVzBj
	+SWkkmkRd4HUAvSx0K3BOfFEdepTDXAse8rLOapOkHbYNazGSxKJUDva55vf1Md1qK3Hi3hzQp8
	roQIUhLiCle+y/oKrQSMw2reOAL/2kmaL3tFam8ZvbRCEXTtTIsxGwIrEBNuGJ/TSmZSXSB0/17
	f4aaI=
X-Received: by 2002:a05:6214:2a8c:b0:89a:4741:2147 with SMTP id 6a1803df08f44-8a7058792f9mr200455036d6.8.1775560944408;
        Tue, 07 Apr 2026 04:22:24 -0700 (PDT)
X-Received: by 2002:a05:6214:2a8c:b0:89a:4741:2147 with SMTP id 6a1803df08f44-8a7058792f9mr200454766d6.8.1775560943968;
        Tue, 07 Apr 2026 04:22:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3ca9a145sm544544166b.25.2026.04.07.04.22.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 04:22:23 -0700 (PDT)
Message-ID: <66e25445-e7f8-405e-b208-e69b6b401f90@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 13:22:21 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Add ADSP FastRPC node
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260403120753.105869-1-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260403120753.105869-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OKEXGyaB c=1 sm=1 tr=0 ts=69d4e8f1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=xlpq1E5UL7j_U2TQMoEA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: dBDDfxlc7fzXfMqllmCSZI_M_JN1E-52
X-Proofpoint-ORIG-GUID: dBDDfxlc7fzXfMqllmCSZI_M_JN1E-52
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwNiBTYWx0ZWRfX37LW6IF4PJGX
 XMBMASv2/lWAqvc1XAMj7YG71tjVAOA3GL303QT74pQZAinohWDzyJLgyj23TSoAC5T/nY04Jr3
 srzaRs7bqpWt1j/ORxdS1o2qYcZyTm3IfXChgYD0Pj9ugcOQk8X9rzTDyQd/NJmxfj4lhe6iU9Q
 Utif+xVhtwcxymLciFZiNaNjX/NzES4sRMRs5D3pbvvc/waTONa8JB07eWFZfBuZJOPIb7GTqTO
 bpZMgyKTcP/8WyvOsrYIuZSTXbrZQLyWdMn2y0U0oXZ7QOLB+/r+Y8D6mEAzu6HgNF0CWKbtiR0
 MQGJlwLtsfr303Je2o85Zc/jix52CUeldkItspMQhFioRwogWNRP5R51HKGnUBuvaCkhM+bpF/l
 l40z5CFuz/Dd6G3yXF0SCt1JuNzvw0mvVvA/dlH1yUChBS85bRJaNHqkpzXfaGuwIF2UUCMNqWr
 0fK9AR6tbPbtkh5V7Cw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070106

On 4/3/26 2:07 PM, Pengyu Luo wrote:
> Add the FastRPC node to enable offloading compute tasks to the ADSP
> via the FastRPC framework.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 27 ++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index 761f229e8f47..ee02acd18856 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -2966,6 +2966,33 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
>  				label = "lpass";
>  				qcom,remote-pid = <2>;
>  
> +				fastrpc {
> +					compatible = "qcom,fastrpc";
> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> +					label = "adsp";
> +					qcom,non-secure-domain;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					compute-cb@3 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <3>;
> +						iommus = <&apps_smmu 0x0c03 0x0>;

These are SIDs destined for the CDSP.. (how) have you tested this
patch?

+Srini, Ekansh I can't quite decode which SIDs are "allowed" for FastRPC
on Hamoa's ADSP.. could you please help here?

Konrad
