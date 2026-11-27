Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795782459;
	b=OcTbtSFZ317fdAyKiJ3u25Q96nWTex/8X1Oi3zDyc0VOLDQ1xRQFZntTmVD5DNhD93Jk
	 Rdis938IY2ThWRCSbW8hJ5g0FyoTLfGY/lU2hASPOGVMshZEBPWESix6DuddswoNXV0YM
	 ZtJnhtTKuz1GSiR3fp9BDMOh3H7ABmavfyYWgHzADm3T4AhIurzyh+JCIy6uhtSXU/cE3
	 7gdPUCoNTWbwdpAVtrTHzbwWBvCjo8LkS58Zup2go6NqflDZhBtl0H68zqfZZSWwiLhYG
	 0tgNsk41FEMdGFoNAAVh0SFkPHfYgOYHpwsLDBh05vIifsbCRGqlm5+4u0kLPrZKPBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795782459;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=11n06xHUhUpNy9Ekpged7IOoqkR+QpoFDE5ZoaESnLY=;
	b=1FtG7YDtRaKZ2LiJwRxg1J1I/Uto++83yITAMD2Rfn2iLJWduxQxBroviPi9/f/fxGw5
	 diwIUBMEpzE2ZvD4xwVINj431Q7yReaarw6aAend2MyEx23U7Xcod6urbwyy0Z3DREdt5
	 6nXk5BvR0uztUxF92RkWaLkb1gEDZfT1i5O1pAAS+UC1F7JyGZrKHfs1VEIUeMFkB81bb
	 jLou/1/CujULns2AxcmnAjsbY82cWyS23/0Ug20LtxsFSyDYAmd8ZpeJmF+avLZDQA4gu
	 SnHKB2XbpRXbDIUQ32qI1k3/yNkaWiHEKzJ8Okvhz60Njo1FtosLKRBv+c+t4LFTZuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FjKDdGF7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=brLOI2dl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4CB606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B4CB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FjKDdGF7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=brLOI2dl
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAp5XG2268520
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	11n06xHUhUpNy9Ekpged7IOoqkR+QpoFDE5ZoaESnLY=; b=FjKDdGF7X+XkRq9/
	MXyrQkko/PPi4y8oYop6EuxujwZUSXM6+dGJa/2bPE+BBUlPn9xFIImt4pYelgrP
	UDqemhTPiX/2tiOnRI9gMsYib3VWGheswEuCpHEN1RSJ1T4LnCOPfAG9p9cSdoGh
	TgL597+3q0WmLfIt4N8C4Rby7zInxKJqxfROs9Smsmx272Yod/JtvvVgsFrZIpSC
	SX5RwWNxLIop4hbUW2kL1T7DHts1GZvtpyByMs1Mpb+Dv/FtpbH5Xw3dDFoWy+Xc
	DJ78loK5RgPiPvobQMvh0mKhT1wwKHSmh+FfNSP/T3ZtAIexCaOg2z/lfpJRKB/J
	rtdUTA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhhkbg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:27:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9495f7e03b9so78187885a.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795782458; x=1796387258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=11n06xHUhUpNy9Ekpged7IOoqkR+QpoFDE5ZoaESnLY=;
        b=brLOI2dlMBcvSa0oj4XrWcI49biEwBn/hxERcZUpXyz3eGr5mkBwTXAnG1XzG/gMCh
         9oJl+AM+vkwVdtglbC7efEaZwdLdh5C2C2Sf1LcFxFtd82WCiGKvWeTxJl461bH7Ayzd
         7Y3J0kU4c7GA89yE8DLPYc3RPOTQwy3PeMtoiIphfVF56F6KVPQPCydS0wkn47030BpM
         9mP39vjxQkz2HxnBIMtgnkfg0BHEk/AKH2SX8zmUSoE9iHOAK9W1j6sJccT5h2bLofzH
         5dGrZ2OAKmoHVmUSgZjmJNa9jNdCbAulFAYmZIwmjT/Ndv3c5ixyuWCqubcrUSYYZb6f
         EHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795782458; x=1796387258;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=11n06xHUhUpNy9Ekpged7IOoqkR+QpoFDE5ZoaESnLY=;
        b=jPM/S2t90HHf9VKbry6LCcPEDzjYCWfTMBDzWSoX7RZ2v/I0PDvaelCJ6AEF3zm76o
         JOfv5sMttmz4O0cTHDQVY9atsI3bLAwQ1qQq8aNyiSuRtBy47WLeOyzLohKrBC+poShb
         kJh5hkOOLBP3ioJXStwDmbXBfz3drJh8mdwcf4lk19ThhPy0KIKHHMiOpvpQ5kbHkw8A
         +tM/Rg4BTZSXeXBN1E9a6do77DvdC4Ogmdjli9k96n5EHAD0LHeE2v7gkndVJHy+lBj5
         SzME0q0pIjkYJ+UXFM/DcyEV4NRAuvxCI2WMxMVEilr1/DSqrtRTlf5g2bA7N+ftBiYK
         J5Dg==
X-Forwarded-Encrypted: i=1; AL+hErG+ZvRwGLAvt6tdVOKNiWBIk3F53s9MUj0hZmOPLaghlhGmeYWAaoeU5snwUyLVnKu9eHp1j/ajvEBk@vger.kernel.org
X-Gm-Message-State: APuU4Z9e6rIdxlaRHtWV+3a8l2pVvcig/I4PBYTuMZTdEUEZNFDztdwU
	5K+/S1UYhYqhjTCYQcEoRvwi1KPfxYRueO6q1zBPw9gLNATeH6j5TVGRJqQZ1jraOmrThiwSSQY
	p+jlaR9R68dlg+J+uAv4houztyR1Ox2F+jQWdU7DaLDUlbKF2/psi48HHEZzcFYFW
X-Gm-Gg: AZFdTZcdikVzPZ2rHMB5WXA0/604sfP0AB6Ot07kzMj3di9AVrp0quzU6+YAtVkqUck
	682KSa0oNRR2j7Tz8/XWziF5HV4C/kOicVdzQ4N6QKyYfnCeZPW5gFWao1f3HMOh/NNcCq/W2Jl
	YE8W42oxtUbL1Pjwt/AeR71G+nlDD54pXEbg31MUZSQRt+wOAg7zxZesTGCnoiSXEm4XaC2601U
	04lSxoUGPb3VLA+Y+gXTu9JwU3rThtNHfhU4GSD8tS9m+h9YrwBLAcOKBte6KrkQKfIY9keCJtv
	R85ltOzNJUARq3c0hmwVB6WdaDTe2sqyDr494sPuM9sgbpgI8faNOObZx40mwgK9J9jTRKlhWrl
	f8we+h4U2knSYiX75XylhgA37vblKnMHDgTbw0yLrCvZ8Nlr/jg+U/d+eRd3DbfNBPW+jZ2M=
X-Received: by 2002:a05:620a:5632:b0:949:a1be:c22a with SMTP id af79cd13be357-949ba9dfabamr3985059185a.3.1795782457737;
        Fri, 27 Nov 2026 04:27:37 -0800 (PST)
X-Received: by 2002:a05:620a:5632:b0:949:a1be:c22a with SMTP id af79cd13be357-949ba9dfabamr3985054085a.3.1795782457281;
        Fri, 27 Nov 2026 04:27:37 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba36e355easm10501705a12.3.2026.11.27.04.27.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:27:36 -0800 (PST)
Message-ID: <765f3451-0f2e-4783-9a7e-893c06b2a735@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 13:27:34 +0100
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
Subject: Re: [PATCH v7 1/2] arm64: dts: qcom: sdm845-google: Add basic audio
 support
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20261111-pixel3-audio-v7-0-ecf28efc5c33@ixit.cz>
 <20261111-pixel3-audio-v7-1-ecf28efc5c33@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261111-pixel3-audio-v7-1-ecf28efc5c33@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0OSBTYWx0ZWRfX4/JVqI19sboF
 8hJtOk3m2Ns+NMgE/G26GKzqoNSPzB9PynmmCFIfe8dpnma55bAR+oAhfY5jMVUeW+8aWUixLiT
 dnKUcVOYi0iDX/ggJipvkUalkhda4go=
X-Proofpoint-ORIG-GUID: oPE4Ei5QwDXRJKWyryZyd84_qbjPNXvS
X-Proofpoint-GUID: oPE4Ei5QwDXRJKWyryZyd84_qbjPNXvS
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b09773a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DuBmnH7L3UKxGZjpEfMA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0OSBTYWx0ZWRfX8jyWDMHLUVKx
 KbwqnfRX5AxTgKYoTxJvlc2F6eNL3unudT6A+EvlYiXpwCXUlwprrzbS23FqgAXCdXMjXC23Emj
 EMabuJevwN5EfYnLDB6shCpgsoqrwvWFG33qhkVlpy5glXwLz6VLn0sTpkNI3qY1Cl2vG/n8GiD
 YVOk/Kh7ZVKt+aiE/6k8DLw4oeRUjiQVuzJd/mMxmLdWEVpnw5/fsc7+onaAzAsqCBfbmyjh64k
 KCI650jo4AyhoEUU8+CKwgGItdA1Ymj3m/MnjkAkOM97Mp/qx0zgwg1qWK66rOGWIyeq1B5aEXl
 fbrp0r+wozMxYN/XU1Oi4gEFp7vnDmE5pWi7qhBkLU5h+bJUJWJaw1oI0KyYIASe5IH32hD3c7U
 TVMsnYwhaeNw+GDvA+61i9xqxScUeBYLZRC4FNfOCDiKSfF0A14e+GiNYOyAtCpgpCbnVd1S/9U
 VFBmVOVCJ4KL6ar3WfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270049

On 11/11/26 6:41 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Introduce support for sound card and wire two CS35L36 audio codecs for
> top and bottom speakers.

[...]

> +&sound {
> +	compatible = "qcom,sdm845-sndcard";
> +	model = "Pixel 3";
> +	pinctrl-0 = <&quat_mi2s_active>, <&quat_mi2s_sd0_active>,
> +		    <&quat_mi2s_sd1_active>;
> +	pinctrl-names = "default";
> +
> +	/* mm[0-9]-dai-link nodes must be positioned first regardless of sorting */

Could you try the patch in 

https://lore.kernel.org/linux-arm-msm/655212ed-4812-4747-ba5a-f0093bf05411@oss.qualcomm.com/

?

Konrad
