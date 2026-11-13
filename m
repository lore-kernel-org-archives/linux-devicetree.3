Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794578390;
	b=wVStZd9XsfGdTEFypHtjHvqjvn0BSnMOZ21o/oDOWAP/4pltgONsPTNpDseYQBiNObg4
	 0CwvQwp39+/NL5v/ccrvbJl9J594T/E80HaDaOGWECSCQlbiZxbeioJ4d3Ja+Pc0ypc+i
	 2bMI3MH7Xol6H/i980ezPyyPkGj2eacxyD8iieRQ5K5xAXJNPmum7F+/mdaZpaBylWhmY
	 wIhHGCp/wwzbejg1k3MIA/Vr0N60+a/bTUfYVNobU+WYgulR940CKCmDEZnKwXGOEOSh9
	 g2SaLXs75ljr1BKney99QL/oU38Mt/yrbKmEp6U7whaQUkZin+A3pkKN+Y5V5tXJshw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794578390;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wWzAUjZknh4jZl3NcGcDKL8d9zuu/SZC4rP1w2kOxz4=;
	b=DMkgOcyZHm3rCXUFQ7klypYKDdzRw+e+oPtUaMdIVIWIhM28TC12GBHVq7za2/eBlCPy
	 VlcUy9kDVaBxoOKRbWOGo7Sq7ljeY3SwuIRAPM15q+dwXY3a/GDvohcJN2YhIs9BWZZKw
	 R2TRDh0g8tQ+TUqzqIQyo30fDdy9XGJazzSfhwl02we5KBtA5UmUtPzf+lAqOqA9TMhvh
	 Ak62+brjNuXFdG8x4gMeZMJ8pomHpLeHLahBXTvbucLvDgW9FIeRI+5ECSTxYioSCizfl
	 aMizWfVjiHxiNRnaAGw/Jrrx4qBJ9ORNQqe7poyzCnZHhX71ZRwoxalRUE4F5OwAY0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BHGYa9dw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AUfiTykE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F499606A891
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 13:59:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F499606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BHGYa9dw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AUfiTykE
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJwnE516766
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 13:59:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wWzAUjZknh4jZl3NcGcDKL8d9zuu/SZC4rP1w2kOxz4=; b=BHGYa9dwBFVPl3bH
	262z7vPEMx6Ep/+o9Zt/ee7SXdvIkpmkK7lS0UL3XibqX3ypzttHtwtcJL8z9YPE
	XyHL4t7/YWiiXzNU2XTmdN7ZqgT4s3PumGhG/9ksPU6sBn0cSbJLDCzIxJ7X9YP4
	B3K8MWkecn0doWzpI8EyFsotiYTeqhb6ZsyBBD1U4u8IPbWPVtps4QFEU3ZBIH8q
	MUsLx1CrsH/4D3zhYiHfI28X5PUR1k0mrMa4XgHcjeXuJR6+TvpbGhvni/g+R0s9
	Wgb3yBNkrfZjYv1bx+u7rvsr4Cju5hGf2NHvPFyaYSIQpCoqgePyuJg+z9jVLgID
	fWcpdw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkfdkeeh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 13:59:49 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91f2e2c3482so534596d6.2
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794578389; x=1795183189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wWzAUjZknh4jZl3NcGcDKL8d9zuu/SZC4rP1w2kOxz4=;
        b=AUfiTykE1LQCJ8DmFcDd1zFIHb5SCiK9MiHiKLv/Mv9tj8rqyfxAJLyiqo4JUf3j1S
         mv7JwR0EP+7UBVBJ8x8P2h/rrYCKUigHMVKdRljNFVavARqO6/M4XhRyjj5dV36B55Iu
         rw/T6yPqgw8zY7mlOPNGr/czymAn9aZ+6+0TzigTr1pHSqZsEZySDenmaSmO/mUudglh
         KUwHicYd9udcVVK6FyO/yZHzASRmEF30TmlFNl3qpsdzUpYf9xBSvnbqJkh9Vt3hTI1C
         Dc7B+EetOilA82ZYCu9b0UfEV8jV1TwotTtOF0TNHLR1aaXOEufqQ8FNeiL+DQdFix0a
         0ZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794578389; x=1795183189;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wWzAUjZknh4jZl3NcGcDKL8d9zuu/SZC4rP1w2kOxz4=;
        b=US7xN+k2glvRJLigIyWJHP884/KEsiVb1IJvHY53apnDihREqfTN3nqdqWU30mlQ8M
         EHFUoERXVciu7Wtf5oH6ZabBq+dCxF/TX6MnxLDFADmDJyCKHVvodb73n18thvsYDF7E
         x944GMWOg8lxOR3JFBXem4fNavM29lZC7kcEnJqa2U/QIzNWIW/nF4zMroaj6Xfnq/aw
         KRf/Oh1B/fBvuhq0mfmAxrJHDQRLiHRO+6nPil7G1//Gn/Q5r3mLEmFF1EUlXrqvw4HB
         0G+pzhz3P76y0t4z6n0bwXbbPe6eUsO2rH7Fkm/TB4Hq6c0fiwWKT8zSQybCCcZeeXN3
         cqiA==
X-Forwarded-Encrypted: i=1; AL+hErH0PD8ztVqG8qLWKPihL+vnm6XioR074XJmOkPWmUYMoikl4X8jAfmBcWMs2A97HzInaEKRGtup5uXE@vger.kernel.org
X-Gm-Message-State: APuU4Z9PH32/1NKz97gY+Skln8gvnVrZapwCoH4lMQIZFKMv8Z1Wff3n
	FM8Q8qYYSbx65ZhxyRdN3ItwZlDey7q+AKf1je6occ3g8x+ojSbaZhr8CJLaA64zdf/UuzAv1zR
	41MiavOerlTG24fcOrHPu5uYpgMFQF7hOdGpjkJu9v1nHhcLOrVnCBmktK/5x7edP
X-Gm-Gg: AYBFou3MooTkMmIrjBiZcmanUf/X5Pdaq/FSGJjWpYk9sj+7ouxb5jc2WhS+3bXlIxA
	eUmkMK4n42l30Ire+/3vkEcyiOkSaW8ONirSxgI5mcrGX2JMZcrpTozYXWYyWAN2zNXyLde2s82
	B91a4fmq5IR93r/zC+tqJoDLU5WK/LrQhLZlp66AOJOYB2d7kL4EbNaxzJtWkb71Fcp57X69laO
	Jbj3XsgfNuodtGKAhfjiWzPwuNfMrlNtBTn3T3KbAxXcEEzSs7a0f0qv9Oa5/c1I/7wQ/BTm6dn
	w323dj31OSbB5wWZJFGD89YaNBECUaBAzYMMjFfeiIcUH1WRW39y97hDQZzGWpBohf5f0SdDD7+
	c7OfuCbfNo7JjaPUgDbEJYHLYugG1KY8NgQHq490QXphj/n1aT9Fs7OmN9UNO+44cEFVXwzc=
X-Received: by 2002:a05:6214:3103:b0:914:521e:7da5 with SMTP id 6a1803df08f44-91f2405e286mr55051066d6.1.1794578388496;
        Fri, 13 Nov 2026 05:59:48 -0800 (PST)
X-Received: by 2002:a05:6214:3103:b0:914:521e:7da5 with SMTP id 6a1803df08f44-91f2405e286mr55050386d6.1.1794578387916;
        Fri, 13 Nov 2026 05:59:47 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae2b76b6b1sm8150891fa.6.2026.11.13.05.59.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 05:59:47 -0800 (PST)
Message-ID: <182a6790-90ec-4083-8da2-14be30803740@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 14:59:44 +0100
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
Subject: Re: [PATCH 2/3] Input: synaptics-rmi4: Support drm_panel_follower
To: Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        Vincent Huang <vincent.huang@tw.synaptics.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260911-topic-rmi4_panel_follower-v1-0-c1b2cf1cdb62@oss.qualcomm.com>
 <20260911-topic-rmi4_panel_follower-v1-2-c1b2cf1cdb62@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911-topic-rmi4_panel_follower-v1-2-c1b2cf1cdb62@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1NSBTYWx0ZWRfX8rwl3SRl/3ro
 wYJ4BGlpSkI5EfHVEzaeCfybrONMjzD45x8c+RTMyM2OqEz1RoVuLV/+mZtcgoJ5VGHWubsGjX7
 qsuLlw88R0RgYJG+bRTwMLmQfa/l2e0=
X-Proofpoint-ORIG-GUID: TFR3krNwon8pfUAKcqzCRozwhxJpHvf6
X-Authority-Analysis: v=2.4 cv=DoTDa2/+ c=1 sm=1 tr=0 ts=6af717d5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=hBt2bvH4Q003rsbsdR0A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1NSBTYWx0ZWRfX3rLG2aFflb8h
 hSAEq6wmY/Q4cEkRbedeDOyybB+16nijdUmkHSw3emrLeQq0KdDAwFrGNla41py52IhFv1ewkuq
 1p8PnTOV7Qar/7HcIDrTXk/uo36MzVsdgHNbO/jEy16U8Xp/w/dDoYVOiXUxgPTfiQDsC6bsOXI
 cYHR1mle3GHUNRD5jGKfp2JyJ38Oc/ijua/vIAncRBbCiHk3OgNs6JcBC25ed4SUCn3NP1fAsox
 eXjr/kILXf8lgmvTyS3abDW+lTS+mId+e13KQqcGcHV8KFTULZ9Xzot8K4+3o8Ipl6FQ7AgvqpK
 BVaCI60FXX/iRxX6A2YxEeEmgyVAOH+ubQ9pAKkONX0dmHwl6jCRAVnfR6eDZEoU1aSwBv6akYv
 er4d8yuIwYCdhOhtaJz1SowJfjCiAtKh78I5NRlQ9ETlwBN7Ucb1NTfVj6deBhl6EKzbMLs0QQd
 9ZSFEpHdqUg0zWVdsLA==
X-Proofpoint-GUID: TFR3krNwon8pfUAKcqzCRozwhxJpHvf6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130055

On 9/11/26 3:18 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Many RMI4 implementations are present on in-cell panels with very
> tight power sequencing requirements, normally handled by the DRM panel
> driver in Linux.
> 
> If that doesn't take place first, the integrated touchscreen IC refuses
> to work properly.
> 
> Add support for drm_panel_follower to take care of that dependency.
> 
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---

It's been a while, since there has been no objections, can we go
forward with this patch? It would help us remove a DT bindings
violation in the qcom tree.

Konrad
