Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794230727;
	b=35SLSG0irGf3lipQAlSKbEjmp6wDYyptsYesa6Wt5SvpNH/faMsT221bR1Tng+x0Z1Ks
	 tTF1YKPrlK0+kI4FOGlhB9U5qRt5+CxV5PViLc9BlIb+TGub8cDvxiJSbYYcxqrnCjzRE
	 CarwCAuDHUDrKOEgs/CbEwOcNVEUThkcBc2wdSOfKHVZNefaXG1IBB1qq7RWNNJOgzyDr
	 EayYV30MiPAGT4lAatguQScX7GBUbiumXcIug6T3DG0pIWYl8W8C04ESf4maJvJOl8eAx
	 XTPvKqMiG5+mhduaaHlwmn0D98oHyA5KjJxfKtGg/vaRQxynaX2bR+JMDh4nkfqJk4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794230727;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NdZ8WAHKIgu5R+aDU/V3gQzILOqggd2CA8XxwJMUnaQ=;
	b=HkZuNxuPO8fpLQ25GE4crFR8ZcgrRqO3eXnWWMkuQPJuB9bzHIeGrdsZ5hJK5jBHapnf
	 MkpWJtbGm8aFuTeAzgqKCqqwnDRlPsMhcHCdEtkhgSaKHrKiii88uWu1r4oJgm0BP3/TQ
	 4NU3CaPrB385r0+2tJXxDwnKAqsjE7jmLQWXYSW5aWK4lU+iFADmGmQMfH6dWlqbxBgrW
	 2p9Ni8hXx4yRDXHlrEwSMcxFoNyt8jl+r9sNGNkHp7J3y4G4VDOzWJMhp0RaUoS+6lI5W
	 fL0k6JSgbcSMcJ8sbtJ/42L3tzENChfy2i5Z79lLXB6+++rrHGok08teD2xV2sblGdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A2N2BIXo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BgRV4ATi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83296606A332
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 13:25:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83296606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A2N2BIXo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BgRV4ATi
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFHNo3461228
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 13:25:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NdZ8WAHKIgu5R+aDU/V3gQzILOqggd2CA8XxwJMUnaQ=; b=A2N2BIXoUnriedoY
	nvImvyBq6MLBI3geSgtYxH5RZKhfcMaG0vsTBKMAy16jprOQcUPaRFVHv9Q+Bc7c
	9RVbhiugOesjDfoOk0DKijIzl27O6d3sQEDo0YagaYLj2IXdsZfiSgCqeK9hd3x6
	SH4yPrjvn+7epiaqm74ZYyu55J5vxnFaxw2Q8HEEefIMmq7kR1Igs45s2cuzhOjJ
	jTB2z9R15BPpausQeZXVq2FvIrAcer8xjs6hPVDzGlmkmXW+g9MKSM2MTCKHQi2z
	8PU5bi4SwFeQeb0J1wmrK5f2JUO5PvM2Rv3XdxZJE4n9aRk5AsITXIdJ+Zk9TNb6
	dijq3w==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hue0rr83k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 13:25:25 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eaab6f56c7so31016e0c.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 05:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794230725; x=1794835525; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NdZ8WAHKIgu5R+aDU/V3gQzILOqggd2CA8XxwJMUnaQ=;
        b=BgRV4ATiSKwfrl7cGC+bmNesECcZh+iXYgoqzkzyhDQ4xZa6ViwF1ZfFzDZEhkWjzw
         kbn82FFDEMFtMoNt9PWwNi0Th+IQ4y4oHVBhjOiVrcIrKPibVmOWycl/724LibchJUM4
         9bDKXwlcXNgfz/bL98Fh+KnUC/1EUYJB01ZzyDVsTZkgdYS10AqOFUtDqYmiLpTqkoqu
         nYAmcAK5AHG7D5RjNvzETOwFHKo5hp7T7pnl4b2l4ViWX9X/V4hCSvyDiMlo/FYSj7/Q
         3YwLcXO4h2P1kXsjHbvX4XV4T3qij0doz9jpUvVVpU+k8uSvPgwBFU9tJBMHjS8RO8hf
         BJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794230725; x=1794835525;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NdZ8WAHKIgu5R+aDU/V3gQzILOqggd2CA8XxwJMUnaQ=;
        b=1jVNdhRN8nCf6rtHL0Ec9KwEDVJHFdRy9PjBdklcvnIY9RJihQxIojrD7pWh0GW3Ww
         KF53ZrgwYYNLYkSS6FETcNoNQ/u7JIbLvJrsdjchoyQUh5H9T8CHC4yPiaUQoJ5PspEu
         OAHPpzsT9U87hOgifEgI2pf5EJPJ8Zsnw6Z2GLFKo5WfhqQBXnQ9mm2nX4Qo5vQcgZkk
         Od61Y+t77dpCac5rqvtWEl1EpSRZBZuVG2NTrP3VgXZEzuvTW4mkLZ8HGt50wgSTKUHZ
         aH/xfI63UDIVMsyCDR5wNAEKyL09L1yOb2fzsxOMEE7OS/nzW97qfeZUMvZudC7qwz18
         3jFQ==
X-Forwarded-Encrypted: i=1; AL+hErGIZpSJHMegNxuWZNo903y0diM99OuZj5iNlZU4kxC76PboW/ReUZKLxxAAk4GQtDUMa3FUkJVDfhFa@vger.kernel.org
X-Gm-Message-State: APuU4Z+p0pUc09NTJEQn0C433mOJGZz41EnNvARQk8KgLCqLTYoL1lDz
	qUxfugTYLdf4sYDR5mIfmCtM9ElCYw5qxHTY9xLJaUgPXYcHK06BQLOTXMZXtWS3LbzkLoz45/h
	LCCzKK/A3hALDsrxMvGIKZ4Nl3RCtKHFCS5eHHkgZypoRjUB7NskypjlwtIbpZclV
X-Gm-Gg: AYBFou0kKT6Ns+R4wIPSG8L5tKnVJg0zNg+Akj0ZkiJRgFe7RtqmeRzBlqUDAJ1J4G/
	u9jQ0XHU8yAHjXvzlzvctNH20zCZtAMN3thw4cHCBbvqaDi0rPvVHljPTTJDYkNoxGX/pSx0gty
	LvHxs8mCEOxU5HSM1PcYqOEc4MVtOpWPXr7JLD9R4LWRit12n1Fhd4iXExm0un4oun49U4HgGau
	LSiGMvz5qW4ClBjpFutNB+NreqdIqU0rCbA4yCKC+4PkqBG6oICa4Y01LjK3OixtZRZUqvouJfB
	DsB+vGTctaJt/CSTQkWJMA4H+n8jgJwSaUpeHZyHark9DQlo5as+EA0KlO+7LUm51SymLfW/ETf
	FcXqpABB35fCImOh0yIbbgVlhZzhDgf9gJrfWNxKXNlBBDzoNtjkWgplJFECQCkuh39K7QQ==
X-Received: by 2002:a05:6122:25c3:b0:5ec:afc2:c0f6 with SMTP id 71dfb90a1353d-5ece71d4b67mr1035251e0c.2.1794230724689;
        Mon, 09 Nov 2026 05:25:24 -0800 (PST)
X-Received: by 2002:a05:6122:25c3:b0:5ec:afc2:c0f6 with SMTP id 71dfb90a1353d-5ece71d4b67mr1035243e0c.2.1794230724265;
        Mon, 09 Nov 2026 05:25:24 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a4af502sm172676066b.55.2026.11.09.05.25.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 05:25:22 -0800 (PST)
Message-ID: <f9f06d7c-2484-4349-aff1-239cbe1a99c9@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 14:25:20 +0100
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
Subject: Re: [PATCH v3 7/9] arm64: dts: qcom: pm660l: add analog audio codec
To: Richard Acayan <mailingradian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
References: <20261107022453.159341-1-mailingradian@gmail.com>
 <20261107022453.159341-8-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261107022453.159341-8-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -1n4tbrK_uBIuZQzn0amhkG9NOEqu2CL
X-Authority-Analysis: v=2.4 cv=MpfHeGae c=1 sm=1 tr=0 ts=6af1c9c5 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=eTyHnkIEs6k_cr9LAPsA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MyBTYWx0ZWRfX27YvZNe8IvNy
 /Y7U/KlXkNjMYA8m9zS1u8cTszKYC2IEgy3mVvwfOh0FM2kejJJToIdJd/Go/tRAid1jDT2yGFg
 e+OEcx1+dwVUyM0yLGCt/iAMaw/wdwMEKlEPYKhRBE11JLqxdGUrT9eTMXygCySXrXi697F3et3
 Ccv1uW224qS8sYQN82DEVDe5/LeOqftF0ytMSqHM+FqceV/0Fr53PN+4EKWVuOQKn3ylhs0wI7Z
 NARnYkPzAsMrOHOXvocefKm6ifxWboVEp/R8nw4v7WEyMHbVJ0ViRnwGOHQW7tOzbtbvzk3NZaS
 q8jWGEQOkzccDz3/J0ddTCMozC3w8RzDbseyUaBUJQJv5juopa31EhrRoZQ2mNgUHmdFJm5T0B2
 ml6X+c8EWiuJTzRW6Qo9uELloyVDuozbJf7KChmBck2xfPcDuWs6wUwvo1egn4dcoEmIQS+KGQd
 Z7V6tadTF2j4YhabkpQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MyBTYWx0ZWRfX+EaRaK26uvIG
 NSY4pyZUJkRCxhurYYPz09Ox7WV3NlaTXH9lhtA2TWkwa7x9l6m6ueb81Ve/niL4hLOuiPkXHf1
 5XkHF88u1AyY3Mn60oMNz3C0dog+aHk=
X-Proofpoint-ORIG-GUID: -1n4tbrK_uBIuZQzn0amhkG9NOEqu2CL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090053

On 11/7/26 3:24 AM, Richard Acayan wrote:
> The PM660L analog audio codec (PMIC revision 4) controls the headphone
> jack, and optionally the earpiece and speaker, at the vendor's decision.
> Add the analog audio codec.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

[...]

> +			sound-name-prefix = "Analog";
> +			#sound-dai-cells = <1>;
> +			status = "disabled";

Nit: only in case you resend for something else, please add a \n
before 'status'

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
