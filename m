Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A006344471B
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784224382; cv=none; b=VZzJHX/WnEfbxzNXzBFyv4iYfKCNfXOhfJNI9MPuBFtAXkQWb90VZUUg10vaHvIQp7WM9cZ6hJh7Tmqnw+9mmg2GOi3cON2SxzWEWGtLR1rPoI9WY1bp8DxSfaO3vVyO/SRU0sZlAXvgGO1ZIA+VFjq62IeAbjUqLHsAZigM7lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784224382; c=relaxed/simple;
	bh=BYR/ghk56lSok2v2umJY3ZICREtw/tFBhnOm6ucsTPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mGkEQV5lN/Ei+znpjWbdWNBdbZtn8MLe1eG1LEk7TCwd58AauvwxrRmGCNmcqNsHaQiSbguaGMJQbwi9WpiJ4DpW7cg+o8efQm7r6o6C/irLAd64Z14oV6bQPNbdJ0+rWJJceOd863YK5mFwcfynqb0AWxKidmFqjdLHhrK7Hdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OvrH280K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LA2HI90M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OvrH280K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LA2HI90M"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GHZYOg3280893
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:52:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NiIS1s04VJ59oGpYSdrTGLppja0vUQVhsdgSXvnaagg=; b=OvrH280KO6UViHfF
	yYoQ1GCcEip5dloFRUldSKqSgFeIUkx6Z4W9q6jq6wkJf51A2mZEMQTI8oSOVMll
	Tg0EbzrZNGeUJGrcvrcxxsAWrS1rmcvnJJDZkMteq1RJCQwO5lLwtPOwhQO29bPQ
	WD90AhjPkniOu3HnVvN2ha25TfwnLEqqmb9u9P3tCDE2d+GVvJe1/16kvysEHq5m
	pVXXxZKzZp/Mjkfdz43H2mD6oCNKY+McBxZ8L4nhm5vZoU9qYGFwm1O1l/tjhFVj
	CoP57SxpYx+iX/y1g/hZAQbEv13g4kkv4HwtSqborf2LiWqn+pN+Enbw5Ar+ax7t
	lpmcAg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u8g1ub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:52:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfa45b280so15667741cf.3
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 10:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784224378; x=1784829178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NiIS1s04VJ59oGpYSdrTGLppja0vUQVhsdgSXvnaagg=;
        b=LA2HI90MQc9BRX9pm+EqhN1qVN/7akikgLjyVLfvervQyv2LAAY7KZj1fDInNTuxx2
         DW/QsEi+A4NhtuxE6wFshk1Vdy7WG4XNNP5GkZzIJ8U+//o9sQ+AP1aphYCcdf3PBojR
         sYEm7xGLoV6FqWNYkKJ6oavgWELlPwOn4PpWdhMdB6gvSOl7+afSkPsGGxEDe6lGtODi
         diPL1q1B3zxa/NGEl46slxk8TqfuImnQ+mHN7Ru9JY75EvryUE66wtEB0Fpc6IhC7jY0
         MTesNst5jNfmehiKZGfsBeC8oiHuvbq9c8YSBxQbV6PaGkGH2aA/p87SQceH1goEmxNB
         sM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784224378; x=1784829178;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NiIS1s04VJ59oGpYSdrTGLppja0vUQVhsdgSXvnaagg=;
        b=Ft7o7h8KfcHCE1+LBK+TWMLC9kb/QSF5bF5GT8G6VIwVlx7nzd7bWglWqCn8xGv+FI
         WCoV/yg3qfWtgNX5psDRDO9XOkE8ajLPePlsM7N6waoKms1jn3l/LSJMejJXyxdIe8wm
         u84KR81VatAXDo4eHEASc3RdVVmjhG7vXcPZbXMG+essMl8MJSuC/ZsK4gMdurwmBu6h
         UdM2SYQ03i7VtNX3tZZo03zcEuI6Uz2sO+trkb/CVbqgqFqZvskK1zKmBb1vrKsXzCJF
         befy3x2JXLukv1JIF63YmpXBhXEm7QMlLgkeOXkMpqlVB/7T1YtE5bV4uJrrxGjQazpP
         7noA==
X-Forwarded-Encrypted: i=1; AHgh+RqxqeX+Ady7DtDW9U/anB+8FVbFTC8lQY2CccB0RqG7opCn1ZohySi6A3L6eRC2b+JpS4WZEoeX+lE/@vger.kernel.org
X-Gm-Message-State: AOJu0YxwkmFloeApaYZos1oY1eNWFQDYxQdGlmB2r47XV8nqIKhH34LQ
	cpKY5hiw7LkXrPe0lm/+ThYe8GedEoL0uK8Z0AjI8Zqp/4oC/yc2iGukV82wKX4rjKdRsFgI24C
	cP5qdWocB4hcYUkzg7ifn2+DgQ0/Qp2srmf2nbP8gp9ys/vknTV2tmeDX76IYeXaj
X-Gm-Gg: AfdE7cmcI3KvouIVr2qTLBfBbhnWgQNLmiENhGECbTvcPo60mFDNLQdvM+0N9c1+xLx
	cGscn5djWZ0gekFwcg89B7MhoP8rA3lO0lWsisttKwp313nI6cuoJUj4ZtQo3F+OzaJ6eOBLmuZ
	EvXmY9vLAXUyxq2A79oei3tRBtRkZWIg8dFVZF/IzJEf4o13uEG3VxbsmOZd8lepW1F/HG6Wk5/
	/ZcB3yGdMAKnV3ZTonE+l32/cqfu8CJ31MlahsgDl24MUTp0QGisg2WgTTQAZyPVXhmsGR77DSs
	Hg+1N7/eff1+RV2rkQN879Phubcme77W2zrZexgocaYfQnFmxVb4gV4D5fHEphgpRb1vcaMNip8
	ZhvN7ld2w61xhKff3PB8Sswjy
X-Received: by 2002:a05:622a:34c:b0:517:5d21:9899 with SMTP id d75a77b69052e-51cbf1f3f75mr186838501cf.5.1784224377632;
        Thu, 16 Jul 2026 10:52:57 -0700 (PDT)
X-Received: by 2002:a05:622a:34c:b0:517:5d21:9899 with SMTP id d75a77b69052e-51cbf1f3f75mr186838251cf.5.1784224377194;
        Thu, 16 Jul 2026 10:52:57 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c168749d7e8sm245027066b.54.2026.07.16.10.52.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 10:52:56 -0700 (PDT)
Message-ID: <6dc98a7b-ece6-4611-8b8b-d485c6848a77@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 19:52:53 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: ipq5332-rdp-common: Enable quad SPI
 mode for SPI-NAND
To: Md Sadre Alam <md.alam@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260716-quad_dts-v1-0-74d86792944a@oss.qualcomm.com>
 <20260716-quad_dts-v1-3-74d86792944a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260716-quad_dts-v1-3-74d86792944a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Z-pB15j9GMPPB-2bcryyVp7nokah1qHh
X-Proofpoint-ORIG-GUID: Z-pB15j9GMPPB-2bcryyVp7nokah1qHh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE4MyBTYWx0ZWRfX5te5NUZrm3mb
 uvV0ojG+qfDh36rMZpVf3FaV8AF2jvafeXiilf22dKTgmqIwvC+XZKDTPvcHwclo7kH6+i0BJW9
 npcNNTHqEm+BVRP3AHG8hzS7A7S9UTM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE4MyBTYWx0ZWRfX7bw9ymwtxFK2
 WH06l4Lok1beN7XqCkQl83VkwmwNLqrJ+HC8riO+3g9JTRY8RZU3Gj5KDqcmHV/yOal1pkLoET2
 h8XoHMzcsHGS59CmH/KcImIEDD7Jd+428z9Vdh7ldGRqSmN4rG1vvc9apoLDcC8IJioyvZYqTov
 VyYp2wmilfTeufESrGopBab9y/Yf7VAWs4bNI8iQxL5Waqtkzi/VoPvd5XcQXIMTzCkICsNrS8o
 VlXrejEw2j8WUPctzG2S/5A9j7QRZfNM2BRxpJNS5WNWV/7QVJx8AtAVSDREvUHNtp6U05WrI2J
 QY8+3gKjh6FZaIbcqzSyytlZsVEHhHtJ3HT+fRxC5BkzkuFX6+f7gWilqYvSHoY7GFYFK01O8Do
 pBaIZPGkLvqepDp/xA7J9RDTa1EKw55ahCKZH83vW+akS8rZlaEWvnrZRbqo9Z7kTygeOkR/A/8
 ukNWi/z5ME7GZozVPpg==
X-Authority-Analysis: v=2.4 cv=TL11jVla c=1 sm=1 tr=0 ts=6a591a7a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=bDFlRis0_Pq_FpikMJAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160183

On 7/16/26 7:55 AM, Md Sadre Alam wrote:
> The SPI-NAND device on the IPQ5332 RDP supports 4-bit data transfers, but
> the device tree does not describe the bus width, so transfers use the
> default single-bit mode.
> 
> Set spi-rx-bus-width and spi-tx-bus-width to 4 to enable quad read and
> write transfers and improve SPI-NAND throughput.
> 
> Signed-off-by: Md Sadre Alam <md.alam@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

