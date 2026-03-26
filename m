Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D8B348860
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774518016; cv=none; b=nqUddiIHOjfByksBnn45jv6yeTHcBVHNbBqzSYYX/vRDKvlWVfc8th4qheonByZGaBf7/oRu44ynDHR7vJrMYchQAlNlf3qXoKJn111UdmfckLDKUHqmPR42GZKK4HUQjodRTtk3EWozYvKzWjqi9P07pOWlKu8FrrmX/p+qUiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774518016; c=relaxed/simple;
	bh=cIepne44jy0x2zDmcPWadh5Ql6TCY2pHBP38cCOEhhM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RhRmsaglz+E8u3aNwk8I7BCEn9/vMvqPBKsHQh1fMqW13R8/ucIq60hG2v826GjDR4QGxxF4k9cWDtkMqb1D3cQv9uxuIysB9do27y4Pri6oTxOcYSeJ8zjKNJ5DUwCBcoB1/wIfr/YKCb9yxLV6J5lIN/XB1Ind8NUJyUMxmlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b4q2i3cl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CNPli95R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b4q2i3cl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CNPli95R"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q88kVZ1554513
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:40:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W5C8gn3OXoKblaVTn3KFquVs5mlGk37UmobM7aTAmMo=; b=b4q2i3clmFLWLUal
	Fw9ajmi1yQdy0w3xl3tJimwEnMBh1MXHGgSBxql+fTAAkDJzrB2L9xRaVxP3hbUQ
	LrpgOeVS62PLtU8ag0E9FP6NQ/S6JdjnPLw7F+Av118rTWkuhZfKPlKG9CWExApH
	iXjkIFdScIL1unNnPdPxbqSS5MPLEN6gsuYKxr291SZ7TiFOcBDhbHIGAGXbqWm5
	8i5lKH/v4mZ48HSdUB7QE+HSF/uTVemzb3WquA2iwEAucOPiBttksnMTEP2mLwWp
	k26hIWziTGYqLQTMo2FT+7sxUZzSmwFRbZ4/40wLkE/Q3GXdjWfhxDRlvu2ZC1QL
	4WBX9Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4gj7bv09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:40:14 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8954b9b5da7so2430046d6.2
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 02:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774518014; x=1775122814; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W5C8gn3OXoKblaVTn3KFquVs5mlGk37UmobM7aTAmMo=;
        b=CNPli95Ri1ZDalFJJWpVS6C3KvkNdkhblbnz0l33osZvNrRVYXzG23Emix95Z/6XxO
         SkmQjEakwBh1Thk9QnpYhXhjjZIUge50wUy3bTV3ddHaaVOb+g2E6wGLVrRvBDCkW36S
         PnPgIOkWevldPkOgSubob6fB/y/ql3a8WsJ36Bks9gAX/wVEijbxXwRIPrHwiL1XKlo2
         /+hm8keoQbFt5cqVTeyXcnHDXCjODlrIy98beX+mIeCaTqH+zZyW5bCGtaAh3NKikZlv
         UEWvST+MuNYQAaVgxk8tq6hsrSEwag1wPKQ/2EsGcHsmc6hfC/9s9OUdynjbl99B1HUl
         U1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774518014; x=1775122814;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W5C8gn3OXoKblaVTn3KFquVs5mlGk37UmobM7aTAmMo=;
        b=kw2ISqaWsVkW22o8ZcceX6wpD6+SOE1B1FPkw9ZaEKGUDXWiitmch/hJCJmgUT6cDS
         ERAN8pqAIYiSQvWwIZQ1AluJtODo/FEUaBycezhzKB84JwA5sciwSyCjGKV4Ul89CD0E
         jDlOTwLWa/JXlQp2MkZ175LCbWhFNahauiLzv2L1HBGd9uQO29gT18rVkcn3GwpgGDKV
         6CaJMZrY4onGf7g1GvgEju3XihaylOxdsTFlEaoFj7mYxa5kWvQpDWEy4S99d0Hfo+b+
         S1tXxOonDUtDTVM9bgilyxsudTp0zLfTp4Ytzm48FZ+wmHAfRUGXbo6syE4BK3uyIUq+
         sqMQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9C0PaVbbtDdhxWdsVYJcUdxnifxdwMF30oPcDXCqvr6zfC2VPkozRJ0BjXkfBNxNSnG83RAOppPKL@vger.kernel.org
X-Gm-Message-State: AOJu0YzvSdnVEYDKRVYxdtZln+i1whqXUK3ZvTEFlvX/Hqhxyel01Mn+
	77CFv9bRHADrrcmV3OuCac4rVbJ1ksDWE2TXY0jQYfBaIkSpY3s9IvYJ7VKdQG66RhInrV4HBLF
	J+3tvACa8oCeZ35JXj8PkNC8oi6iuZLfUzpdpmrGpSYMLdW2hP0xYILB0mhi0cJ8c
X-Gm-Gg: ATEYQzwuGjFLK73Tgz+pzs7qVbzyuH7kgnKcLkH0J7ri6dUsPA37aGL9BUXh8J0Fh8c
	QlA7k0gYhXraliuMIKeurCjgjZSHNy15Sr8By0X12fQvLA/53LPAKY5iUuHAR3xGkZt9gaH8BYa
	6Ovc8aoo5/reQ+AEL/9/Mzuad2Q5Bluek9Q0HMf9UcjtV21o0Za2UqBr681xje3w4mi7jC771ag
	bRFxqYOEdyNGyhFY5DZoprF9ZARba0s+EMFEh/E7s5EP7F9YZgWtslI/w+KbGlVO/gGrtmCpRDF
	hfN1wFAxcRAXykEpDe78RnrJDHFObRHQkN2q2Kg/ECR2v9XvsTfjxsHJQ6GWogn8lyHzaxUK0Jd
	UlSo/GitoOQoPGRZ7L7AOFNdWyZj3BkY+AyFy0mc6QINHvLjsHEBMeZvpLPm1GflrTY/kr4GCmv
	Cp0Uk=
X-Received: by 2002:a05:6214:19c8:b0:89a:732e:f805 with SMTP id 6a1803df08f44-89cc4baf508mr90673776d6.7.1774518013943;
        Thu, 26 Mar 2026 02:40:13 -0700 (PDT)
X-Received: by 2002:a05:6214:19c8:b0:89a:732e:f805 with SMTP id 6a1803df08f44-89cc4baf508mr90673456d6.7.1774518013540;
        Thu, 26 Mar 2026 02:40:13 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20264ed6sm94765266b.20.2026.03.26.02.40.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:40:12 -0700 (PDT)
Message-ID: <834f159c-c1df-4738-898c-13e89df53957@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 10:40:09 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable
 vibrator
To: Biswapriyo Nath <nathbappai@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
 <20260325-ginkgo-add-usb-ir-vib-v1-1-446c6e865ad6@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-1-446c6e865ad6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M9hA6iws c=1 sm=1 tr=0 ts=69c4fefe cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=6skNi_Mt2WqB1r5J5RAA:9 a=QEXdDO2ut3YA:10
 a=fFR93BqyA14A:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2OCBTYWx0ZWRfX434wcNFCQUkl
 4oCPbDFEuMSbn0FWx2mwp/7hjE8BkR8/t07M5Phm/byP1t3O6hopMwkjNnsueuvbjMpt/wh5duu
 //0AGuxeH8fIvjeaRfBfa2C8aB3QPMjH4w4PORDUqw1ZF1eJGBpHthQ2i3ZIYyiXcI+oOrsfWGU
 7pu3JmkUE64/KBOHxlT+XrsJLxub5dtMsJpg3E4TwsSnK8eT+7i+vx2j+va5cgMGUgN39DG5PSn
 JTW+YIKNi8qUBj6C38/bMFjSq3wKjgT/xX5qGb5Fb8SjuVlcmcP+9Eqw8cuMxjBIFaw39unMSsh
 Un4ftZYVvkPlRXdnoF7xAgdtJ686+oS1FT8KNaZfnHr+EuACxFn+NxgBl6GYqratfXrXTnwu+6Q
 Q5yVc/rI2Vm4qclC5wgOd0OlY7sl9bTuZao+tGHT10tiUXamd+2t1BALxaw7NKcqIqcCqvOg+03
 Vmp9zcYVPnzlXNHT+bQ==
X-Proofpoint-GUID: kxt8kAPbUogYhb6XlwfyY8xAKMVC_LtW
X-Proofpoint-ORIG-GUID: kxt8kAPbUogYhb6XlwfyY8xAKMVC_LtW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260068

On 3/25/26 7:07 PM, Biswapriyo Nath wrote:
> Enable the vibrator on the PMI632 which is used on this phone.
> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
