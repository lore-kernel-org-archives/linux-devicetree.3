Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792685844;
	b=zpqwtJkjijZTK9O6o2K/C4kwwCV0C9oNdGCFEDWO2Z1pynlfPggWn191cQiZI7YLT02x
	 L9DpH9d7skIjLfTpqhFPqMZe/HGs4p5xLZO7R/mgRYd+u5CaU8c2l4RWZBasc+M6dhOmL
	 gIN5GESHZRylGJWmVhPPYrFt9Upo5w6xyi2KLeQBcchJam7BuvOtao/WeQvGGVG1k4YiU
	 WYfUlWWoe80/bmyrXTGp4VmoE4O4RW+VjZLXKLmFVxvfcHT2Qg34ESaMK9LnAY+he9qd4
	 f2e9G1as0VhMXggSsy1M7SqDLGamqyjaksqLQPah+yPkRyaKUOxGCeA6QyV5Rx9YU5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792685844;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=W8TGDKZPm9HRrn6f+ybF4qtH4yb+sCZXj0xYIYP+WZI=;
	b=pU3YzEGNoKJJeN9Lv9u6a4qdWh0C4EqoB0bv+XuyUW7EeuxbJ+tSdA/08EFQfA2gCE8w
	 hbxNXMWeHfLVYNXO4IVTicDzEAR27gBFWVt6MV9cgjU95N2onPi07C/uSjHhfJddKZQdU
	 f96nY257405YSZVdshUChUkffm/VhqILNZpCFK+sXjxzbopHqXiUpJQNu9amutbKg5IGI
	 ARONcWQWb1YM5WKWItYK71iGvsX78h/cmpEcunIbAeiIUu0tscr1onIGN3CV1kJ9EjycG
	 sNInxXECur2OVzqnyx8BZDbSBwPDWcJkF8vILCVy1I1mGLxc5yO4X/UQXGbU70RPvgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ni/5mqHE";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d3APwiJ0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351A5606A31E
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 16:17:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 351A5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ni/5mqHE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d3APwiJ0
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MEFpjs2595399
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 16:17:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W8TGDKZPm9HRrn6f+ybF4qtH4yb+sCZXj0xYIYP+WZI=; b=ni/5mqHEPn4Pg9cK
	Yzbv45AgeD/32UA3TR4NIaQ7nWsiltS4EiH0GBcHQsBF0D6wbcwCKR1u8VZOnwWm
	JO9+H5rhqD4J4rr+jsv8LYF7ToZiyFWU+htfXWjGLC03AmF/ogEidZMQMWBHa/H8
	RbuCFtPxSjLu8LGSdpB8QlgrAJE2z8zoq50NcqJ+eZkqe7o1LmnrBCXsJCQLn95Q
	du6tD1hZkhkqPkSpzTBPdqIHH1O/Dtt9p9gDvfyoeyUPtuyNLDSu2knkkDuSKZXd
	oVWG869g/BaihcpGBPdi70w96uY8awruxq6YLkfbsoHD3lZb1tzjWD8kJADVpPDQ
	UOhe2g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93amd7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 16:17:23 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3698bd5392cso302044eec.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792685843; x=1793290643; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W8TGDKZPm9HRrn6f+ybF4qtH4yb+sCZXj0xYIYP+WZI=;
        b=d3APwiJ01oayBVHB4/OfTRjN5HMRJWsngMceHFwKtFz/RSia8EhQIksbWAo99C8vVE
         QPCRwfSXXVSREVpARQHhp8N7Y4J4n0D/qXCw66GCfgHSoGS9ObZxiAk2nbGNQTGzSFk+
         VVlzaxpZsCO4a7vCE9tb3oRzaLidPxmbaDq6T18g6RBZ24T7Pntq2/n2HgN3jS2KRXvf
         hfYqYt2j66aJMBEgdgvIjmAIyvw4/GnLjD6JbYWWWIgGeH8hzXjS7fxuSbJmMSKkFUJC
         RoRR8h3ghOCxAaupuNxUtAsC1X8nV4db4VPv9O9jGrBQB4sPjUilOYcvhlhrZj8bM5HJ
         z62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792685843; x=1793290643;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W8TGDKZPm9HRrn6f+ybF4qtH4yb+sCZXj0xYIYP+WZI=;
        b=TLB2D32jRxd+LXYJxeL8xUWo+kFKMUsvgmX6Y4QGrYUbyBXP6nTUhIz0vOJEaKCaKE
         DH2O35J18aFLEWhEpdCRcCtgSMQweq8ikgNsc1e8zE26HP9OP+BaQyQuf86AFc35PO33
         nZ8Y+baaNx5EksmDrGJ1LEQvl9HdeaIfNoWzZZR2rQeNzAcCaPtgADedvRF/yyPS8PHY
         mMyh6qSJYkIq1i2xX4p/R5idrobDr/yXnAvjh8/rXb8jXm+udddQpbV4rk4tboNkuRTQ
         XadKrv9FPyuDX/2mvyw9UBXd60bFJfz5jXjCO2DUWr3Qjy0pn+2BWiwQDED+HgCvJtkU
         cMOA==
X-Forwarded-Encrypted: i=1; AKwUvBwfxyaHZywycCbQyJB/OYXSr7o+59I0Grbx1Ppyms1cCrhY/6qF0QgnTjTmbIIy/iLc4i8GuIz+OTAK@vger.kernel.org
X-Gm-Message-State: AFq9FYKUfpcGXVX2NBPlf//kZqF2U4i8508z6b/lDv9pjiHPc75xrnek
	R/GU6kzxNC3UyHldoVNofXosmJ734SoiRjAZ3NFGnUmNL835QZSEkF8+X+YaN1/1ebwgPO3l4XU
	Jt2I6Mtd3c40AowJlGncRSZ+DJ7qOFs/csWpZpZFWiujTJak+SuX6ww2Yiqtjc0UN
X-Gm-Gg: AYBFou0KoVSF4OA+blNF8MAEagGgMYuShT33/uZkDpnCJyzr18Nt9XHecAlSmFIrqzr
	CBLhWSnq1dkAOa+KYlKmJtYJSLlw+s5UTPABZCnDWX7wTKummSewR7Kpu2GbT5FG1PMOoRilRF7
	nTlpda5JBN/XVMZw1CD2nZaghWkKJZ+pGfmktNWszzNkjQJpDvcNcDjysbT5mRj63YV8Vj6xF36
	Vx+ncad93zWi2j0oCS79a8a8pdcLj17OKGdcgf2Z9ZKfNQgieCpG5NlbghBJu1XnvdgpCFatOA9
	YlJKq8nX22g/agzY98MT6iYles9vPxAqDg8n1r73ALEYdWSv6L4W1OzFohgNHC5sQMAmjPmdSEb
	J7OIxI1GAYFhNWsUfAQEUy1Q5/w==
X-Received: by 2002:a05:7300:ec8b:b0:368:d722:48ac with SMTP id 5a478bee46e88-368d7224a10mr2854588eec.14.1792685842544;
        Thu, 22 Oct 2026 09:17:22 -0700 (PDT)
X-Received: by 2002:a05:7300:ec8b:b0:368:d722:48ac with SMTP id 5a478bee46e88-368d7224a10mr2854534eec.14.1792685841743;
        Thu, 22 Oct 2026 09:17:21 -0700 (PDT)
Received: from [192.168.1.11] ([171.61.216.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36741e71eaesm37045478eec.26.2026.10.22.09.17.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 09:17:21 -0700 (PDT)
Message-ID: <33ee0863-3e11-44b8-8d66-9a2e0e6b1161@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 21:47:14 +0530
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
Subject: Re: [PATCH v1 1/5] ASoC: dt-bindings: qcom,sm8250: Add
 shikra-iqs-lt9611uxd-evk sound card
To: Karthik S <karthik.s@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ajay.nandam@oss.qualcomm.com
References: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
 <20261022094313.1074873-2-karthik.s@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261022094313.1074873-2-karthik.s@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA2NCBTYWx0ZWRfXyyzUX929jwMV
 jOs7Bd0SjlHnhG0aVGk6Sa+cLqfGRn1AIksBLljdoWE33JuVca60yCRmj4l1WDplGoN0QjY3vic
 dJ7il+rdZ5V4SofCALbweF5lnTi3SsFJDBWbtifpiAXfNqam1oKwC5Mc1HAlLqBEgbMDhukkm3Y
 ANNFwcixNBhSVDtQgg6o+7AOoWkwNyqkRmMvAmt93fBzVyIOpmB5FAvqidMdeZlwbAps3cp7p0x
 ONZbqRAn09SlHTu6EQSFw1sf87RS4d3qbmU9Ks/YGtZznATcCxedJ2GiKrIV42r3vYrV5erqMfW
 /f33ZkogqG0mcu8TeVVdZBqbj0sh6NJoLGvdnLkSBYKKwaGQF3hYTIgESCW8v6TggTLlbGRJcgj
 TSU1jQ8T95nItlqUOasipOuVSjTnLsfiZpf0CUlJPiyPN18b/51O7SxzBsiRbI+A1bQ55KX0dQ5
 fjdoPl8tL8eCf7KOfwg==
X-Proofpoint-GUID: azmLmDJIIIQH0hZ0A77K2A6lBt-_upOT
X-Authority-Analysis: v=2.4 cv=feg4WEQF c=1 sm=1 tr=0 ts=6ada3713 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Vglx2bvqrojy+vbCC2YzaQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=poZCmOCFEqE_XbxgsBQA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: azmLmDJIIIQH0hZ0A77K2A6lBt-_upOT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA2NCBTYWx0ZWRfX88yvTeZDDZPI
 1wvPoU7WBu3t87VPb46Pa58HhYN+oWzQWAYmo8dFxwOkylv81Ojt/ZfV6cxepwnHd6hBL4D+rLD
 2gt1w0du7hJuT3gbhvNwYlfodaqSFjU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220064



On 10/22/2026 3:13 PM, Karthik S wrote:
> Add the shikra-iqs-lt9611uxd-evk sound card compatible so DT can
> describe board-specific audio topology. This Shikra EVK variant does
> not use the MAX98091 codec as the base shikra-iqs does; instead it uses
> the LT9611UXD HDMI bridge as an I2S audio codec. Describing these
> variants explicitly in DT allows the machine driver to select the
> correct DAPM routes, controls, and clocking behavior for each board.
> 
> Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
> ---
>   .../bindings/sound/qcom,sm8250.yaml           | 43 +++++++++++++++++++
>   1 file changed, 43 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> index 1536fcd96d68..d1f948a14c62 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> @@ -50,6 +50,7 @@ properties:
>             - qcom,sc7180-qdsp6-sndcard
>             - qcom,sc8280xp-sndcard
>             - qcom,sdm660-sndcard
> +          - qcom,shikra-iqs-lt9611uxd-sndcard
>             - qcom,sdm845-sndcard
>             - qcom,sm8250-sndcard
>             - qcom,sm8450-sndcard
> @@ -247,3 +248,45 @@ examples:
>               };

Nit: please keep the compatible list sorted alphabetically

Thanks
Ajay Kumar Nandam

>           };
>       };
> +
> +  - |
> +    #include <dt-bindings/sound/qcom,q6afe.h>
> +    sound {
> +        compatible = "qcom,shikra-iqs-lt9611uxd-sndcard";
> +        model = "shikra-iqs-lt9611uxd-evk";
> +        audio-routing = "VA DMIC0", "vdd-micb",
> +                    "VA DMIC1", "vdd-micb",
> +                    "VA DMIC2", "vdd-micb",
> +                    "VA DMIC3", "vdd-micb";
> +
> +        pri-i2s-playback-dai-link {
> +            link-name = "Analog Playback";
> +            cpu {
> +                sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
> +            };
> +            platform {
> +                sound-dai = <&q6apm>;
> +            };
> +            codec {
> +                sound-dai = <&lt9611uxd 0>;
> +            };
> +        };
> +
> +        pri-i2s-capture-dai-link {
> +            link-name = "Analog Capture";
> +            status = "disabled";
> +        };
> +
> +        va-dmic-dai-link {
> +            link-name = "VA DMIC Capture";
> +            cpu {
> +                sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
> +            };
> +            platform {
> +                sound-dai = <&q6apm>;
> +            };
> +            codec {
> +                sound-dai = <&vamacro 0>;
> +            };
> +        };
> +    };

