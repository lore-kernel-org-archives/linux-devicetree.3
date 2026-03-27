Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5724F3D5666
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 09:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774605151; cv=none; b=JxSkZ18Psu3ySQ7AGEgWdN/VFRqnnn5VmgzDQ3QRi+EHTF3vLOc5tyo/Bp4vkgDYgujrJs6MZfBvYw7/hAanvwMX7wc93ERuUlDC8hJkVt3IiRYC3ItSMl2eet2l+I7Gf8sRg21LbJ2ME3lS01l57O62XQg3X5EYwHefjFViQuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774605151; c=relaxed/simple;
	bh=hqhPthe6G+Il2/gcVS31IUAzLoRITu8+8efFljJuZPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=flO0Dc/ncUL2Z4TOi5qTl+Mf9J6Q79/OPz/DMc68Bi5kppOAVhYWI7FMzYyypENiwvOB+RTx8SlJ/AM7iWQs4I0rr87Rif+BhsEeTleGUB6+8Mrv7+0QVX3zUobvbXng60phi0Fs8HkONHvDwLoMD2TcAEjmPlmtTk97IrOuGfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j0B6Lc4W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IVw0ZRuc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j0B6Lc4W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IVw0ZRuc"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6wENv1710544
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 09:52:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4eJqhLdSz2TFniyH6etXPWrvMGTOsIWzf1qZeyY1ybM=; b=j0B6Lc4WfuQBBEZD
	qRaJGq9TSJrmTrD4/toh4rRrWl6PF3EXokn9W7QZZvaaHWcTOWVGp5b+7u/jslLy
	Pc2QWN2uGAJ7MyzC16AxYMlphs9JaUivSIa8srPtP1GPxulnOa5w1ESQzjMAwGRX
	3ipoWWxIGIeZujWvKcYGBKRHlPSKqWvZlEyPAuG8M/A2NTTUeR0BhLgE6S5TkdKy
	AP3o8O/BAIkrqRshHW5hnujgMwqZfp3L5ZrDd+jx7saxkVvUxA0IGG9U59Qg8v3A
	A5nOektHAegTe1ceiyT9ZQ05G9n0PX7I8aLiOCv0XBGT6sFwrvlEbYaTEm9iNOqC
	6YtogA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bxvjfc4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 09:52:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b33a19837so7268881cf.3
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 02:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774605149; x=1775209949; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4eJqhLdSz2TFniyH6etXPWrvMGTOsIWzf1qZeyY1ybM=;
        b=IVw0ZRucAE+tIE9xvfa1MtOpKQeRLUY4pJF0XV8ev6dnGs1B/L5SPhknG2ozE+vwe2
         uSkUu9y3QbJ5LYe3K2q25GuoypnltEb1RIHLJ3jfAucJmFU0akifdRKbVJPDdZ2e2lGs
         9sBNir4pQPoniIn4OjSZVv8AIekm5s+2kVbuRB4SQcTmiGFj5HOzLY3Kc2XXn3xL1vX8
         IGWM3Ljo/H5FvkoySWrx2xSA5OykfRd/SiUIBEpmnYDVMAicYls4GbJ0JE2RTbscMWPr
         ve5U4NefM9I8wGN8MMv0rKReqtUGUZMn9w1r/NYSqbNE/YMYTWOfkSEu827WyMJzUGbp
         EynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774605149; x=1775209949;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4eJqhLdSz2TFniyH6etXPWrvMGTOsIWzf1qZeyY1ybM=;
        b=qJH1CJDvGSlPUtmRYQOcYABQOxWLXJiB5fpjWE2d2mYBlhuAu0S5HBQeCvvMSmqt3j
         o+baubJ6fEy5sI0h6XORPBxvdpsqJ4j9czVjywPkMTZ5VOapeAVqbTRtmSRqDrI/MHTo
         2/YjeETaUjQ9JkWgvouuaXckSiCRMXEpsThLwY99caqX42WlGteKjArc9sDFZQfWxoYp
         Q5DQKxSclfNdx0yt2iKHM3ncdf613MgEkz0e0/NpeNyDVqu7D1jPb1lIPBHTLRmRFhYQ
         Bu+7mWLDnjixie1adHl5Xomb9U4qEi5pe1/P4hb43lCNr6+JAXT4rxnUdUTYqb9T2YFN
         A6AA==
X-Forwarded-Encrypted: i=1; AJvYcCUeU8dz1cGOAQpPc3qJM/qu2uyRpi3eXFqtGGEkxknUm8UIVf21NGNn0FR87WXQgRdtSfTfp2sR9HB4@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+0tr41XEmoP5h82qZbdDS3YQUoifadhuMy/wp0y6Mtq/qKtD+
	7FXDTnnVnbZyXGZ2kbcEpydWSehq74GvXALqvFzzBc8pLfJe/0lzcOpw29PGKom/llUBbTcY1WJ
	+UsqSa+SZNRNGlTNak/cmqUhwVx94Ponkou6CICXGWt97aZYn4Rv5lo85oxiwzdKJ
X-Gm-Gg: ATEYQzz/yk/eVT5Dx3uzTMVhrUT59f5Be5+CLpkk2A/DKLduS9/BlHPr+BG6HHgqx0E
	aLjhH0ck3tsOwDn/fWSsn6FMmvugHVbKd6x+2rW3FjHrOLe6NTxQo3+4FE6NtUZjTv4bNCUTqyL
	iaXPpq0TagjKFHJOLi3UMGIgNZ+0+NKmwQOsImKYY2LN3LAjLBr1Rd8xwDP2/nHr/S+kLNAUkZK
	EzPYsdRp3e3nJhu794/LOUpKaj2nhNlddyg61ighgC8uZ4ehDEuxQ6NyWTLD3uEERAKaSeoxW3q
	hXbyxCRQbvLE3BH5/Xekr60rX0jfJOaKE8tuQMpPugLFCunkXY0ck26cexK7YZn9YlFEtWHfQsD
	ViyvWWMzFcSnbON6UDPjollLVVFb0NWtV2On4DHszbmwS4Mkn3j6wz1QuS5x/ZZsUuFKXHVXpzv
	4P8F8=
X-Received: by 2002:ad4:5aa7:0:b0:89c:cc08:c56 with SMTP id 6a1803df08f44-89ce8dddebamr17218956d6.3.1774605148636;
        Fri, 27 Mar 2026 02:52:28 -0700 (PDT)
X-Received: by 2002:ad4:5aa7:0:b0:89c:cc08:c56 with SMTP id 6a1803df08f44-89ce8dddebamr17218726d6.3.1774605148096;
        Fri, 27 Mar 2026 02:52:28 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20267420sm224436366b.24.2026.03.27.02.52.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 02:52:27 -0700 (PDT)
Message-ID: <ac75a339-ca20-4264-9295-d7290e218bc5@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 10:52:24 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: kaanapali: Add SoCCP for Kaanapali
 SoC
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com
References: <20260326-knp-soccp-dt-v1-0-a60c2ae36e9b@oss.qualcomm.com>
 <20260326-knp-soccp-dt-v1-1-a60c2ae36e9b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260326-knp-soccp-dt-v1-1-a60c2ae36e9b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sHGV4lCXy2KBJ2_-XJVm4QsxU3ZftA_S
X-Proofpoint-ORIG-GUID: sHGV4lCXy2KBJ2_-XJVm4QsxU3ZftA_S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3MiBTYWx0ZWRfX5oi4Amiz7wWE
 o9GJTrbtcZeonv21VmaqKWvJ/qn15bx/aukfHHnJPfCVGpWS9sWhpxKRyqrHr+QXrs1g7ppii8f
 77vEGKgePr0RHrtdeiukrrdhiiGizL4dydXT1IfVUi0q/fwOhXJCP/pQ699vMMiqs7LzT7KFSKF
 Z4AoK0iLGfEuRvfeRPhlrtpSGuW0zGbmA4eeUNDeeevjoXKdfonG0kjMQy6xh3JohpE8/TDx8Fz
 OzOoRvUkup2IRTxU/xLMpuK1ywJ/82fcWNBiKZu76hODDJsU1eHG2eGf7fS5U/DhYo/J7LLy/2h
 IDdQuHzIxuDlrRvw5HiX2I1k9DmOxc3KnzEj/pP3I0xq+3Cj1gMxy9hWTNVm1BZHHDP5XiDBl57
 vCXwvInPLD0LOufY/C7kkPuNOt5sNay2YlaqwyljFF0k+LFzak2GAh9QXP5iykl7n9eUnmBqW5t
 XoXNm3Dx6+W5WmGVD+g==
X-Authority-Analysis: v=2.4 cv=ToXrRTXh c=1 sm=1 tr=0 ts=69c6535d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=hrcmu3upo-d0Drj8khsA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270072

On 3/27/26 4:20 AM, Jingyi Wang wrote:
> Add remoteproc PAS loader for SoCCP with its SMP2P. On Kaanapali, it
> is brought up by bootloader, so set the status "okay".

Simply remove it, "okay" is the default if the property is absent

[...]

> +		remoteproc_soccp: remoteproc-soccp@d00000 {

-> remoteproc@

Konrad
