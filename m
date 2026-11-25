Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603842;
	b=TdAj/NmlOTnzaV5r4a96qJbwWvm1lZSSDnFljN93m6pMP5Mb8sjPozvlLGGH79CxnRj/
	 LKn76uxuroHnFRvWdsa/wfLOgHUO4OqIwtryttOf8lawOxTrYbJ9OwvJdsjIo1R/eQOdX
	 Hpo0bU1O9mQO0WLvDZ/yBS9eAnzw8DDY006KfmpPdiwHjgFlpYOkz051f12NjADlRXbrF
	 S5oJA5BqV5UzL6iluzWWPbj4rZUXedVtQtrZihEckiONfl6WOA2hFX5wabEiDl4pLO4tU
	 WO+pL2/pXhkwx2WmBpwYm0sDPTHVHD5i0sYr2mmscVLS7nXhI4EIdbxir6VJyhfmjNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603842;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BkcA3UBi3z2Vo2rswGT3gpDM+Y0XNTnsc/3KgQ5NX68=;
	b=edo1wtk5Z3tJTU22Ng39gthQnYEPm4XheCq8PUVvO3zb8JdW1svbeoaZdD2GJJGRq1Og
	 WEG3RDx+fS6K4SsTwZOJ+fgNXUy5IRrT07VeRR4h9Yiqe+6TcEhaXlHI84NjPsHgjE2LG
	 sIGGQnooFKruZYzOQOus0wPPGUMv/dNN4/RJboMrehNzoUUYrDhwpY8lwNBDLw+w/+kZ5
	 Xb6geNEibv0ofbYmaHnzOWi3cGnwr4qEwfYtzAkr/7LZjfeDPeIIDaP8pxNRj8rito5d9
	 E1Nwb+zkDXbs35gsIIfbvriL9cCpFspUHjFcO6tI1XdtMoXezAMqtmHBxWH6XklX2TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NvewqBbt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cs4hDSWh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC29606A321
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:50:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BC29606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NvewqBbt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cs4hDSWh
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mBEt2121021
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:50:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BkcA3UBi3z2Vo2rswGT3gpDM+Y0XNTnsc/3KgQ5NX68=; b=NvewqBbtFskKavjM
	uKNcqk1XCmGCgo1JU7Ag1oqkOAK+IHlslEo3KpW9GwEp0jR0gQ356zTk/PRhD0ig
	QjZyShjo00Bx7fx2yhQjKUEq/6xRcYx12EMfaOuGBnmCV5zo5UxpOqWV2KMrTCmp
	gLWYN21XGuZvYH9kz/L5wwgvOVlgYE4rYjcJGvYhOZDumCC1UF7x4gPv+6Tkg+Hx
	CFrFxyfi9xvSseZ8qxkZtpJReS2oIzGkHUPcysMO72kixvzlNIo0HUtZ4ddF4O84
	zrhGqcxck5/+3L9aQ6ecBjmLcmIuLcXTLAAB9caxCMuYvJvjGZJHbIDqTnkgxdtv
	hq9A0w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vukreuj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:50:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5476f5bd009so19082781cf.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 02:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795603840; x=1796208640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BkcA3UBi3z2Vo2rswGT3gpDM+Y0XNTnsc/3KgQ5NX68=;
        b=Cs4hDSWh2OLfIMz8cahrdAMHXEMDyTSaK+Lq5Unu1b4VQwXqeBW+ai5km7nEFcduDI
         CapM55KZrKePNgwwqg4p5C7611UYVEgVx7MZiUF2lWR/nGxRPFoigWr+iyU3DJNNvJEX
         FJLQU28SxBiaNsZ5lIfpGvvYa5M5dLpryzUyncngAEqMWwb1fb0OWx1IXGkRLCHm4TDb
         0tZdrzyy8FI0rgGOAaUqCLxpBL07O5IL/wS/M7F2tjQVJItXY2ktnqthTFMQZEL3KXyU
         eYlA/Jl4hKTqkjhYQH0EM8obDVCSaTvh+BETv/wYT79xxZ/0GKOkqmKASGnSCdLodHX9
         WclQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603840; x=1796208640;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BkcA3UBi3z2Vo2rswGT3gpDM+Y0XNTnsc/3KgQ5NX68=;
        b=fq7MH+PlrbtHG+nVcbRzzSRlgfvZ92JITsjEiVCl73vQE2RPUywzHrFfnSnUh8xL5k
         xnF4IXSaxT+Fly581Ocb7BxtQEMxT3ZE3otDJNXSEiUenoUna9Y/DOGT5PWdel7368Ae
         m8Y+DYUWFHmpQWMIG06/eBcn86xFSvY7ojUr1auwoVvFbet86qyNT7IyxdABRt+aeDI1
         6Uf61iJ/Cs6QPRLUl31EmBi7ruQhTKnBy5BJwaTyCvpvXZqvuc47NkLvjB1qCZqhhPX+
         Z36ryAnGqkbLp/ta6/cHhIVONdk4/tPJPo3rMcvpGR6mtJws2J+IbUvT00Y83LGE0Ftv
         1FXg==
X-Forwarded-Encrypted: i=1; AL+hErGMcrfhRoYFzMiJ0qLr4EDAjLbNoe00iMRHibfeEITaANHg+1RKWv+tPXCvnQV9DyrlyItg+YrR5q6U@vger.kernel.org
X-Gm-Message-State: APuU4Z/YCrsBI/lJoP3hoJRcbCilDjIiz4Mg8gWs3EgkZ5U6txkRLniQ
	sH3FQdnF0yw5cKfiqqQBA/CT7kjMw3lavL45SDc9sl9DeiyF+E9zVvy59enlF4FXaPZ6qQSVhws
	VFxS8MWMh1Nwlyr7aR4x5aAkZFLCUPGdz2EClQu9KK94C3oh7ZCVwRZcCtGLkiYmC
X-Gm-Gg: AZFdTZdS2VZ3sDSTNfSUmxPSm6iPAOJKcl/p1ubaodzzrz/yf5p3oDqScNAIITWD9VO
	0OHQkMU4NTu9lTRfv4xFg7U3/IVttzPQjjG340TieHrufzwASRILdAP8Qu+f+7iTqHV2jXZUhG1
	kE1xPoViPqhpLpcHTdqIr3XO6zHSpQhoXrfhHFXUKBxiyVjiIhExv96562j+kgjuzNfmH8OXoas
	8WX/wvsAkTDl1aUsia11NFivHaYcxuW0ixeXTeVzT7e/zjRuMaq2e8GHcBIr8wzHWCNMOK7nUhB
	3x1TMkCc7rTB+C/th6ZIS5I09fWjJ2oIJvy5iIlGF5SWpZ85QmBPd9+S8hm9oVj5VtSOS3cybNx
	ZZOiVniAwEWM0aTYb1Ig16pig+kxvtmkfak4qaX5xu7IbNCmgFBRSl3Q7m+HF7VWOHVKZCfY=
X-Received: by 2002:a05:622b:1ca:20b0:55c:2657:9cb8 with SMTP id d75a77b69052e-55d76b1a306mr308079451cf.5.1795603840493;
        Wed, 25 Nov 2026 02:50:40 -0800 (PST)
X-Received: by 2002:a05:622b:1ca:20b0:55c:2657:9cb8 with SMTP id d75a77b69052e-55d76b1a306mr308079171cf.5.1795603839996;
        Wed, 25 Nov 2026 02:50:39 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea31e4sm624414666b.39.2026.11.25.02.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:50:39 -0800 (PST)
Message-ID: <115a7167-d9cb-4a5f-934a-2da3974f1ade@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:50:37 +0100
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
Subject: Re: [PATCH 06/11] pinctrl: qcom: kaanapali: mark egpio as a GPIO pin
 function
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sean Parker <sean.parker@viasat.com>,
        Stanislav Zaikin <zstaseg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com>
 <20261124-qcom-pinctrl-egpio-v1-6-34f2c06b2658@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-pinctrl-egpio-v1-6-34f2c06b2658@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KfVHIgYD c=1 sm=1 tr=0 ts=6b06bd81 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=AIZUApCXal3OlWm8CXsA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 7tVTlcQt78P7vaS_jvrk-mgvo_0gOl2A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MyBTYWx0ZWRfX83/POAJ6tSG5
 FTcU7A2RaVyCHqzjy1IUl/8rc3Q2ZNXZw1RZ+DDyFAy/jWZiE2eGEzYRWcwtzc1UUBsSMmc8rmr
 AY46Dy3MdM6ls/pignAyLp5rxkPk85c=
X-Proofpoint-GUID: 7tVTlcQt78P7vaS_jvrk-mgvo_0gOl2A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MyBTYWx0ZWRfX5Y8isFnlyG5n
 yLasd2v8OiM9Zj1hTPN9NxfYwX7b53zDljcBV6AyHPYiCRlLUKlfZAOAz/r8G5QyK5aQ+4nvJiK
 2HO02nvLLxhBoBDGWCfNni1obcy0n9S6gEdoRyr4CfRgCYfABURua+DR7YTg0hxFxHkGh+n4avS
 XL9cdRocof1fhhQsjc7UaXmC3EhgGneobpnp8/UCbHHGvENPrzOyjvNJX+1ZXrDjKuxbAZkx71Z
 036zdry3tqB4U3Xusbpr4Jki92UxIy7oo0C8HnoMYlaFZFDYxkGUFFc9yXdzgeYRLakkGSN94FO
 t5h4tmZVmIjBaO5jvLiq+f7Lj4PfQsEgF2ihQJE3aCtwg/6+7Q9TTVIWxE/hyw/Fjg4UFgXEisy
 ixIL2qiUdiNSfa0EmNGIlG7tBshLeN9IQZPiY2dIqyFIxD70VKRM/HZNB11wFhdIF2mELP8jt35
 8f75aBG0B0wwLccgC8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250043

On 11/24/26 3:29 PM, Bartosz Golaszewski wrote:
> The egpio function in the kaanapali driver is registered as a strict pin
> function. With strict pinmux, a pin muxed to egpio cannot then be
> requested as a GPIO.
> 
> Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
> be used as a GPIO.
> 
> Fixes: 35ff9c6b318a ("pinctrl: qcom: add the tlmm driver for Kaanapali platforms")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
