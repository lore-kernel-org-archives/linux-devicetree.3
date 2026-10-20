Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481650;
	b=q71705QZBTKnIwnR1zrcDJDHxTeaVBNoj2UsuLvlouPAsVwbrRQiWzgPfNjCdB8xsPDj
	 O6Kfh3+ypgIHyGcU0w48/SOcGBzRoukp1MuoAJtq1munztBZpj7l7MXWkNQj5OFOEx+Ta
	 1eiyfPdsO64Ya4jpIE/GqgxBnTYxpjwt7drPQL/jMLsV/MX1ja8CLYHQL5BCTKufNKsAK
	 +Pb1GPCw/WGcXuhGIbGT+gusRmE+B/vj7QCi0Iu+juaUasLvxiLwvjXbxfBW7T0FiElLT
	 5aQg0JFNvAyocr7ccD2FNHiJ/ZkZjlTe43N9WO+Bo4pwh4StIg7CYY4F6zMNUJQy+9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481650;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LWzrZZFQhSyO/FR7rQo4rKuqvNnZWfQyCXRPSU+R25I=;
	b=wsP82pDFMwwDiJwWjGFOAxLODbgmfeINYpU2rU7dDNZPukupUeawy8oDbxURMl2m15LC
	 FoVdxjdOBFjZm3eNIfRIWpJkJQIuptXvBLn55MKved9keHKsfbtHib5bfNvd1Tib8Yv+u
	 kyjPGoDgXxZuHQCTcLJpFZ0eqqb7NGpWztPyrT7ydUxWMtgquzIaur26/FrWARi2hHMLU
	 XA6qkAO3GqB6e/sofhE/yEEAapIVlEjcAN7UzQ4urKPk5lLI7TLFJej5EaDoQCrvIgmS7
	 8oowkmzHXkJHHvv9q0lfCYShMKEBTMaaFD5GtWvBhidYdlwpg8wyxAZMyXlaM+FR88A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jxe8ahch;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CCyd+vCS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9FE606A319
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:34:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F9FE606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jxe8ahch;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CCyd+vCS
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tKYU4178122
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:34:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LWzrZZFQhSyO/FR7rQo4rKuqvNnZWfQyCXRPSU+R25I=; b=Jxe8ahchk1wjRBJc
	s4o4UFhlDXJ0jw+NqXMrnEh1GWL0YaAMDQR4nmF8AFWbthX5JqJhb9RBoawKuzR7
	RA1hK3KqMQ0MySBNY9jS2cYOeLw383XT5U3HMmGmXTG5tmoOW8qURACbpH5MK+Be
	1DliUpgwv+GwIvPWHxNQ6gfRrpa2qml4v5U6TPSI5MaTcYfHtF/EWaLoV35PU18C
	zeJH5oWNEZ9f3RXXxRBQr7JwAKvbJ2yr+TNli3HzGMoQoM7xqZUf+rXQvK+lnb85
	0cWqYTSvEztmg1yA3ILUPgvO6Mr5r4O0fekBS3NQpMsPxtDXiFesRHaClSLhjm/f
	VqKgsg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n1cnv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:34:09 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9106bb33cdfso8448226d6.2
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 00:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792481648; x=1793086448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LWzrZZFQhSyO/FR7rQo4rKuqvNnZWfQyCXRPSU+R25I=;
        b=CCyd+vCSudnDCf3jhn+M7KT5dOVEcUro6amKd3KMNZ2IbmMSaeigWpFN/oEg4+gpD+
         z8WFkBkUKCjMEm2MXaphIn84LKB4h4q3UofYYUZQ702f0RbBL1FE+vHWquZICPNIktSq
         PiRFxEl9Ce5Y9rrYekU8QJVQ7V0SyaRGEYPeZgBpParD48oo4APGsHBN5PSq5nFnizel
         ID/edc2teUFDz3r7csGIQnjAM1SZT0RPePfW/wWdBD1ZzX0zlkFOcB4ldCspxoEc3axK
         VNXx6WmPDd7q71Ux9zXZaHKvJBgDcg4Hy/fucDnoWrO+uGUbEIT4MTjzIoaBMbQtTUzs
         iohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481648; x=1793086448;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LWzrZZFQhSyO/FR7rQo4rKuqvNnZWfQyCXRPSU+R25I=;
        b=S9xXNWbq2hE3LQS1JyXoxAudhznqPqCQ+vBJen1RLKN4rYRq0GAE2pveKBu0aDSgVE
         d5R9yL9UeP/mV7/6yzDYZ92th77RfY+91z5F9H8x/1XiaRm9HGpzb5DhnXKKNm9EpYnz
         cKuhy/1nBdbXiir3Ak+XgA6Egvl1U2zzE0WWLV4Ov9sD812y/1WbtymLphd/TS5MZNgL
         BwX82VpEXiWlw0JGKW8uvoSQ/tX56+mgRZzo1hkGJJEW9SLt34lPV6n8ZBZy+zInNhQj
         swIELlvgAQnBa5x5cK05JeSnfjNvzDT/birnsPvhelTqtQQQnYfvhnyqNfKUfeDhnEB5
         KBdw==
X-Forwarded-Encrypted: i=1; AKwUvBxovADVIs7rCuDVrOm62h3TlMUySk1YeqApqScmu1QEzasAj9RUjlk+5gKtyx+EWT9pHILQ/EsYf76b@vger.kernel.org
X-Gm-Message-State: AFq9FYK8yVGMxuA5lJ2JAwJ/EQYxiRmnKdEcE/35SrjgniINCYMjN0Aj
	ub9c4vGosF0hoNaBpASHHxBRh5o+eHSPfTWvtaJjNqhhjfj8g0yrMcURq4IzDk5qu2AGFEZdJdi
	S/aQmVIiP/t4nhlG1+2jk8XZEtUBa38l1OnMC8dlp/Ku86iwWb+P0IrErFpg6O7SW
X-Gm-Gg: AYBFou0AicB/IiFV3HyQbiXo5UrXur/jcor04dBwTmAapB8rNyQJuxIslWBebLizfe3
	jVxxIcNu+avn6bRqbFruMkvnDU4cDnt3N0HSpwmngPHx/6p9eRhG/U2u3YOswas705zup6g//Ux
	0RBXmGc6ec1uyd0W3f8LlVX6T9N9vJBw/sSh9TR7Q8wt/GPwz0yYHptSaOJvfRPavra+D6zenMB
	XG8EOMPcnm7rln/aFmK04fnzyTm+xGRQQEd9ZVm8/bYtQmWe/MBtjp3JGslDPR4mkyxfFnc5v8F
	YcJsLdNqPBLg4UvzbM04DAFenV4IL4g47imoQTroZ17VJ9+LbA1rYUsA4vDyER7wljDalCt8qrG
	Bhmpws8lDrMroQysowN8M7g==
X-Received: by 2002:a05:622a:1304:b0:52e:3991:84c8 with SMTP id d75a77b69052e-53645d643e9mr179574621cf.2.1792481643550;
        Tue, 20 Oct 2026 00:34:03 -0700 (PDT)
X-Received: by 2002:a05:622a:1304:b0:52e:3991:84c8 with SMTP id d75a77b69052e-53645d643e9mr179572261cf.2.1792481638228;
        Tue, 20 Oct 2026 00:33:58 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dceadesm461490166b.20.2026.10.20.00.33.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:33:57 -0700 (PDT)
Message-ID: <720ed230-4284-49c6-9332-e29f23765944@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:33:53 +0200
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
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Samsung Galaxy Book2 Go
To: Luca Weiss <luca.weiss@fairphone.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Jasper Korten <jja2000@gmail.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Luca Weiss <luca@lucaweiss.eu>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
References: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
 <20261012-book2go-v1-3-7188e7ea7a15@fairphone.com>
 <fb634f17-de56-4f43-b139-3d040a35f019@oss.qualcomm.com>
 <DM3MSNLF42BV.1UV490PXB0C07@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DM3MSNLF42BV.1UV490PXB0C07@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mnW_nLeN-0VTI-_XhkjSguGs-HZdKos-
X-Proofpoint-ORIG-GUID: mnW_nLeN-0VTI-_XhkjSguGs-HZdKos-
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad71971 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=nd-lUt6iTfUX6z0NebQA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyOSBTYWx0ZWRfX+rdmB3GggcGE
 H2Wp8tChkLQrCnTBAuag71EXDcL4PkHMuk4zJnUG03j9OmblzyqvgzzZm8Oi4803JYpo+uqqmND
 V7x8MCAeVMjwrm+LJTIOSnKp30NgH3Numxnw4VxjZT/Sa7uWoVhvKTpxhDTZzg2UrRcoLXqfBVh
 mjXzeDFEa1d1orhAwUIB42meGZ2p2bYvZe07tM6Di2v0O2IpSg3eJbOghh9dCLJWRlJS9PbIv4J
 rqj5TBODcu5IHur+j3pf2kGCA+1WD69Gol5VRKqdogWa5vBR4wHrwE4FlG52Syqgr2UUMv0WbK+
 9fZuZ9mJYAis5aek/cdxI14GdRXvaxPegPOqxSda+Ojd9rkeaw65Bx2bnJEgGXuqIKhYEixjzpW
 NJAG+D13DCYs8mnqaxhEMky9KutmH/DvR0sVKePrf2i9T+h7d6YEO5OKMat0BtayVWvXyg64MTm
 X6uiAmBX5KgVzqhBWtQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyOSBTYWx0ZWRfXx9b2k5AuJkh0
 tLuY9UXyn9pr3H9kNN/67/bKK+D6rw0UqwPxyvdrITEJMlsKFFHTUkdsu8GHc4Tishm3qcPPR1t
 5qePyQj00Bsax+udsOCOU3uf8Iz/KA0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200029

On 10/13/26 12:17 PM, Luca Weiss wrote:
> On Tue Oct 13, 2026 at 12:10 PM CEST, Konrad Dybcio wrote:
>> On 10/12/26 8:11 PM, Luca Weiss wrote:
>>> From: Jasper Korten <jja2000@gmail.com>

[...]

>> Drop the output-low, the consumers already take care of the state
> 
> For both enable and pwm?

Yeah

Konrad
