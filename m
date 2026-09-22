Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BAB51AFC6
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790074075; cv=none; b=LphSbjGbt1SU5faZ0BH2lJadsrj5bCzYfVj2XxgtT1OHeHrcaTKjYi3gcC5KYcFJ7W7an8XRBvrhqnP+r6YK5jhLeByCSJ3SwFLZ9IbRbqoOtcwIBjMugripGXVdDUKVVNs6cTh7+9OPVjM3A0UkLAPLtKeYv64rt7b0P+GKdLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790074075; c=relaxed/simple;
	bh=Tf/4+Enm9D0/NAqukZyJZkFtEngdm8tIFRIReueUIAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=CB8ahDHVd7iZjJCbhgrYr/vjGKdd8p6DopOEhKzEONIFYk8AiYctQGZXHp0auPT3UnGOdKpUpuONXxSi1lH3k9bH7dS91WVyBYNZw7pLzmQI8TFrWjGHyhSlOfWT5EBZaF1eutIcX3tDR2Jz2UjwsndAhcGe/cc9r+2VMB0m4Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mmzKDgLz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QPEXPiV7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mmzKDgLz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QPEXPiV7"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M9jUZC3382918
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O84WUB8dqqEkzuvtK3pzGiiU/apicX+V39vVDqlKB5k=; b=mmzKDgLzjvr/oxYF
	RLVh4FDKOrtvlqDbIMx2hKJjCyyZR38374W9IoHDiL++LHzabXWY0HeZUPofC7ee
	ziRtbrpeKsUGbUVpaWLY0iblTGdy/TPhEOxzc4KBSiD4vjcm09SBuUOVJFne3VYQ
	BdMpvXrPskR8x5HkrpxbVoqUT0P+p8Q0Dvgf9nyON5rd7gkS+eRPx1hP6DIBbmlj
	+cL7IrTm8lmQMKEdwKv4YgNiYx/Ux6qR/jKpkyi5tQA987R2Bk6wICOHG2Y/sH7I
	IzXNfq6kV0CCb8TlA17xpEm0TbYUiRtowslE5MZmsPoxiCXkrDsp9JBgzBeXeK/3
	wiOJhw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gujkj9fud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:47:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930a312222dso98555585a.2
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 03:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790074067; x=1790678867; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O84WUB8dqqEkzuvtK3pzGiiU/apicX+V39vVDqlKB5k=;
        b=QPEXPiV7U0alZGkprp6ixKBY1NgAxYC71A/XbRZv5Wrl3R3XAFZdMea+AdJ3OhfLYJ
         vUuVUHBMUQK4lzK+B0DExUAD4jeJZBqVTBV3qGQGHXrVibv2ckVVrbxu32CTom5vtu7Q
         +quom4Q/Gvy+GJRRFMHAcTveJzZMpcOepi0gXoqxeFU8gQ9OnQibY3dcXZbcMobk7l39
         z4PB0TyO0t8OqRB582SUFWQ97aNTxe1Gu+FseYHOnNERJVO9cO2O26uA7ge9FBH2AkX5
         yrv/U9xd49ehjeiqvt1tHsaZVZ9v2jQU5a3Elc/Tbr7VZ+9sIzEk3W1slEM3YX2GJg0q
         11HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790074067; x=1790678867;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O84WUB8dqqEkzuvtK3pzGiiU/apicX+V39vVDqlKB5k=;
        b=lcR3QJjIKAED1DtmNQjJpafESE832lTbV5ZZ8bWDJTN5A+BnAoQ5Ts1O9hmQEAGn5F
         bdxD/T6rMLRpRytE3F0iq/3f+7yFK+Zf4m5PLZ/ss1OK4NUcb+nybUMmksn9sL34AQXY
         omi7SJWtGjG6JHzb3RPN/Y7XbZm66bUjDxhwVQy96y5MmiVu68kcbHfsE4qXSddJsiIE
         ecgtXjao3Lj8KdHxxZrrdGSrG5TCctVVQynkOwu5KePx3fAlmbC1D4mNiWN6KIvcYKVs
         ij1SBv6noK+20w95zA4MKZf1QyylMwczeKuJU0IgYqW+86pGUpFTFCIpxpyZ/yTwNzCn
         8UdA==
X-Forwarded-Encrypted: i=1; AKwUvBzQdqAxmA7/FPlglOYtdXucdQWRI39MpxN/wztmIdGz/y/I5S89izGZUR6BhdejLcZ/PIIH8Sh8bjph@vger.kernel.org
X-Gm-Message-State: AFuF++lLZ6oJbu8IkkcPoOW4BQr7m2MureoRH2wUqLcm3QVq/3kK/eD1
	TlRo/DgTO4+FD5tPfbjIdEDAV4wAPG/lE/9l6saYuLFIrDFUNKjLStZX2ySJC+05FSqeJ2Cn8+3
	/npVU1AnniHb0iRpJCdFK2O6yQ8Ra/SyXpcl3f9eeGiOz4yQzlX0tfTyDwlTU09+w
X-Gm-Gg: AYBFou3cscJtq/Bz5KjWheUkZS/dmtxRqNZFdlzwS+qnrCgJWybhANO0Y+CgMCMnF8a
	zd7QDMV+lvWNeaCss3xWGNhiVh/Bp7+3mGjW5MKiTHlzAMH+hqnirugGjvHBpLo0n4d3VAZVq0/
	3OVBKQ9rz9ollpdmzwhRnGPfNXs8S9F4vchtLApTquvLsEHMqzgu5NC7YLzNdEVmzqrzklf6m6v
	xEp1FRwBuhtlY5kUCeT+j3Wgq8N4PjthKakc/uEwsj+lyaQLgpsqv2yxNabeLAcNsK+01tdcOot
	3KP/USCUt3Wu7N5a9YOzgwWVSn2kIk7uyD0/FcNc3EN8CFw8DxS/qCfkakWG7fBfdKBXg+81J86
	mujiVSh83idytpWQn5CAV2g==
X-Received: by 2002:a05:620a:6484:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93c15fefd21mr490653985a.6.1790074067521;
        Tue, 22 Sep 2026 03:47:47 -0700 (PDT)
X-Received: by 2002:a05:620a:6484:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93c15fefd21mr490649885a.6.1790074067059;
        Tue, 22 Sep 2026 03:47:47 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c42fa4dsm63760066b.3.2026.09.22.03.47.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 03:47:46 -0700 (PDT)
Message-ID: <f43ebaea-05c5-40a2-882b-3211e3590476@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 12:47:43 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] arm64: dts: qcom: sdm670-google: configure analog
 and digital codecs
To: Richard Acayan <mailingradian@gmail.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260922015801.32373-1-mailingradian@gmail.com>
 <20260922015801.32373-12-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922015801.32373-12-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zcCRe6f-x-5HlsNlQXwJH3ieVuNbGACw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE1NSBTYWx0ZWRfX3Gbk7cWLOe9a
 03fqWTB+ncghvxq39QSKum71becZzOism/99kl5HCQtev4tCn5lbi+WjSN6kCFCY0JEjeEpWkFh
 Q/GAnmz9ZwWsbH0owCiIMUJZQOU6fJHGSW/KzdwdA/GYTeEhczoI9Vz67W7zDxVi2tLZtUk5ORH
 bbYkwRvwm41pcTwBbYUvfYiWStiTf1nB4ExbFcu0FXGOgvxBiCktfNTwGOjaztYFHEE8ROKqx+0
 jTdhmAN5kgxl+jMhpHuHpU0KjYC+zKs1gQ9upbJBYNWDidIU6GMQoxe3gmkelw2a73QG1kQz3je
 ikBv/RxMd6pPg2xbYlRfWktEIUPzcT4sqdb46T45yGuGyyUzQQ2YJqwd0i4dyRNEPNMCYbrRgYr
 ua/4ptH9iU2XhP+RPdSebN7JH3kpAI/bFUaTMabvh4bvoiA1wILpYwQqm+TRhHP2utFZJR3VhUN
 goBM6cyqDE6iGSaEeuA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE1NSBTYWx0ZWRfX5EAhST2PAwC5
 Pdym+sxcudBjxLhGZIBA1rdvaGYQvyu3615V5ZLNBRVokfoZ8kMPD0UI8aI9vhdomHLFK5sny48
 XG/xVrttx7iupLCx8UwFYV/Em3Cga64=
X-Authority-Analysis: v=2.4 cv=SuAFe/O0 c=1 sm=1 tr=0 ts=6ab25cd9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=C3CjITKvYYIGiS2BvvcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: zcCRe6f-x-5HlsNlQXwJH3ieVuNbGACw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220155

On 9/22/26 3:58 AM, Richard Acayan wrote:
> The SDM660 digital and PM660L analog audio codecs control the headphone
> jack on the Pixel 3a. Configure them for sound playback.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

I think it's better to squash it with patch 10

[...]


> +		lpi-mi2s-rx-dai-link {
> +			link-name = "LPI MI2S Playback";
> +
> +			cpu {
> +				sound-dai = <&q6afedai LPI_MI2S_RX_0>;
> +			};
> +
> +			platform {
> +				sound-dai = <&q6routing>;
> +			};
> +
> +			codec {
> +				sound-dai = <&pm660l_codec 0>,
> +					    <&lpass_codec 0>;
> +			};
> +		};

nit: 'co'dec , 'cp'u < 'p'latform

Konrad
