Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1954A346E68
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774517952; cv=none; b=YPMI4wAgvQATBjqAvoXSMd/LAwRG7wnUYz8rGsjMjK3hFwgXBumHcy++9Cp2mRqybUImH1Zw2KNpp9nOtskqZw776tg5Bhh61oqED3E3IQj+dSslUNQS9Ta0+lIa6QNBIcVah6yBVQlmNqOZoR4ON+aDq913opD8+u1gEXIcWnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774517952; c=relaxed/simple;
	bh=J1mg5KuGxeqiUBfNMxCkrcsh6ySIvujpPY1Sj3t3DAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d5ktTdT4CQc8FBp+30paW+Q2lF2zgAqAMGW5qU/T6TUgmyzD+Q7qQ9QkVsVBG/mCdbR84i/U6c+0QIlA0ZSS79U9LfIxt5Uqm9/v3O9XCgRYRrJtuIF+dRINDROygR3BcTe1mLWVKegZgB8zhgfUfTF4X7d9wcHw5H79ZqRcJvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J1yERFpI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DnVFsRld; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J1yERFpI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DnVFsRld"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q6RVCP141453
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KvW9fBu7DU6nm/PicTUYBmsoJAbT3p9HbjsVvtlEcxQ=; b=J1yERFpIYWGjXThP
	vcGlE+YjOw/+YUu+m8re6aIf5FgpZaEmoTX1As+BiG4lAMbcA9wsPkR1Z6bY3ZEl
	tLcy13GWffHxRUvLqyOvhjXVz2FSkp03EGp/nA5X7DLGn9zKe44h0wo1ExPhI+eO
	ck7k71QIVEV1E43UM3e53Uimfv/kKv+F5SYj9milaIWp/rimSQOecHidlC+gF9jy
	lfr8HEOu24qbaGoazV6pFabGhaqk0TbGLXHxPrgkXif6JgStGP24X/IMewwBfAYY
	B591IGEx0VnLbIEMViZoccVxqCD/WEw4hvhD/MflvmUx6WjSHDvyCFvoDuWGB2tE
	AsXHpQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4q09284q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:39:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cfc0719a1bso18173685a.1
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 02:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774517949; x=1775122749; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KvW9fBu7DU6nm/PicTUYBmsoJAbT3p9HbjsVvtlEcxQ=;
        b=DnVFsRldAVWgGdGFhoFYmdj2EbQWsiJcZStNAj9SzziQF4YJCWLrLWPlUSUiwMurUH
         UpN1VVUvhbjWKXl7C4lRlyBODE11u9dqNrwZFfsqHcUIqQ5+exa/Vr/6OMRJgFXmdNVi
         +K6Otl2k7IV9hfwChkhucdQWK7huOk84ivI8NTf3WwR8BheoTbo6sxmllBiG3G1Lnwq7
         6D5n82nQEZQZTGvJZ7izI6dxviMGdK5kFa/KTNfLqBN4p29E4p3yN3/Qmz2FiKd8FATO
         gM3rMw2z3uSlwYHzrrvEk+DjcYDSDmukoTixg4eH4uO9HBlbgwp1+mh9ozHJZwMQUX0O
         mTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774517949; x=1775122749;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KvW9fBu7DU6nm/PicTUYBmsoJAbT3p9HbjsVvtlEcxQ=;
        b=K/XDjUUKJzbJeV+ohbPlzX1tTtVRWATWN4cmhGA2MZIRI+I68TxVgUFDwOaK0aicp2
         ssjE+pVeBcjEVeoq8g/mCfQSfIscTROtVF+Tn2SODvWVKSjRWKQSD3Qqez1UYOaDUb+k
         u/3uiuZd0eBeui6Mf9Mkn8q+LeFKZPiOXy0/fGx0svaJBEDBcJyL6ayHKCsFhwUSWNk7
         RF0i03c6jb/4MGySdsk3R65dgPNrbnPYgnKm7/+DJv+91xtrxbyFI4nXkNbEkoPEBBkT
         m4ry75bZ2M/R1OfZa3VXk/lLEmmfhT8P1dZPqqxyOBB8XOVyCkS/XWltRm8eK3vcW2Rn
         hwSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLDBzscHTQ7LuNcfcMa2h9rwKvLtH6Rxnq2+TT71/SPYr7qnk1bx/rygw/0xY6YyTk54Ey23jddIJG@vger.kernel.org
X-Gm-Message-State: AOJu0YzgxKAi81fCx/HQr396Rnvk1/rCA/2xv3+GH70hjQhl3sVQE55f
	97BZl6BAeby/5wGNZJt+pnsEgRTY29+/2fPF6uGLral8M+BY7sq+RRQkgJDOYW40wDk+2lv2EG4
	8H6W3zu/v7sjy5JKMiPT+7suduDfdda3PU4cXxaq5EZWvSB6qj0kFWCqqKiUD02hx
X-Gm-Gg: ATEYQzzFuxKYOcnf4tXABB+vr7SvEUSOxk3YCg68nl6ZTrGay0uuIWWk16+0QgdSsuy
	PjXRpUmMws2LvYjW82NuVK6BNUdz/uONq+R6QMtfnQGvUGpk7UsvnoqP/g6z/lJwI3gVt+kns4l
	yDknXhZdjtBl2ebI2yAYAFqBYJYWgp8yxmIEguuQLjNjWx25WijusRshO/qQt1/s37+3K1xeQ4n
	2aGsj3qO2Y5YoLMXvFxb45mv8b03YbasuUpxr9iiYSD150s46zLkSJ14lXaRXjazwPZa5p2Nmi7
	2euqGSj8J7BL9dwh/vce3NHzYMwZay7X80lm2DG7KqGjfDixw24cb3xHsfcuZbYhmhjjeB6WfeU
	M4aGzfjDVMLUqrbtQuu0sjuW5fXQ8YD4w7NQIxDZvUwgmEJa0hGvhQAZ/PMlSYPvLaMBuSMHQQ6
	pR8no=
X-Received: by 2002:a05:622a:5b06:b0:50b:51eb:c355 with SMTP id d75a77b69052e-50b80e73582mr64090101cf.9.1774517949408;
        Thu, 26 Mar 2026 02:39:09 -0700 (PDT)
X-Received: by 2002:a05:622a:5b06:b0:50b:51eb:c355 with SMTP id d75a77b69052e-50b80e73582mr64089941cf.9.1774517949015;
        Thu, 26 Mar 2026 02:39:09 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b202663c6sm99356366b.23.2026.03.26.02.39.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:39:08 -0700 (PDT)
Message-ID: <c324b4f3-2af6-4592-bfd4-2b78c7231eb9@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 10:39:05 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add PMI632
 Type-C property
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
 <20260325-ginkgo-add-usb-ir-vib-v1-3-446c6e865ad6@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-3-446c6e865ad6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fufRpV4f c=1 sm=1 tr=0 ts=69c4febe cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=QifeDmTRV7nuaQTzNMIA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 6dIgqbOuzv9Lqsq4EiM_tNuP3X4XKdP-
X-Proofpoint-ORIG-GUID: 6dIgqbOuzv9Lqsq4EiM_tNuP3X4XKdP-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2OCBTYWx0ZWRfXwxjVzChPpiGR
 CJewax7t7knuSOH+11QYcXsr2I4eDTSUeAdkb4/Ll5CKnGiKxH4yDtw5lVtSFnjgoOrfkAUiHIb
 //xjStCCiAD1BZnQUd6c1Zy79FFWuq3zSTRb0JhimUOJxnF7AEunYg2P3vVJpYxHNiIHJVIJ9Rt
 /QIr/ha6Pg/sdSOZuWdvJVryJSQRSEaVmnerHX23rsLovUtXrhn1d7otrptbsmy7Nlcf1LV1Pwr
 2b0bBomAmJNISKVLdGLc2/JLaMjd99QyqduX6QOMy7B12mO+3kYef271S9SR6S/3/kkTVeH8utl
 UFyZbF86CcuTZMvZaNGL2fdyC3iL2NLtp71vY0r7yopscqRgLSR/dhgBLOaty5lUXp9ET3eVFrs
 TvV+jOli55IWQX40r/qdvrPfDoHIP/77vggfNT2LlL+M4lTL2C6rELZZ8hr7UjSfboL8OE5P6FW
 BWATCI4W9i4xxeHiKEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260068

On 3/25/26 7:07 PM, Biswapriyo Nath wrote:
> The USB-C port is used for powering external devices and transfer
> data from/to them.
> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---

[...]

> +		port {
> +			pmi632_hs_in: endpoint {
> +				remote-endpoint = <&usb_dwc3_hs>;
> +			};
> +		};

I'm going to assume the SS lanes are not routed

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
