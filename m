Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E1A49A3AB
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400817; cv=none; b=lqIU5/0jUduA4q9wSN9ug5gSC3F8i/7kS2Ipn9Y6aLqn6AhbDHQsKmEIsvC7EuVGyJYyLtO+Yj8rASkk0ZBwuFDW8hu6I1S7W6baIWdUJrEz/J53Ov0wGq5MyUxi9D/NNgmv5OE/qOMhdjVC0ceBkmeI/BjGupYdm5VibfZnkzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400817; c=relaxed/simple;
	bh=s0I1woyWAu/v2gstIsnhHbgNcnCF3ybxjwh3mK2siFs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IJzdhBut2UNJeuy/AQfxoQ+Q8zOTwq5G7F1sCUTZ7SbdQeOE0tRAg5PjUcKksUOMC1q8nLomP2nHQjCJ2NgvnmDAu2rdeL4Ac2RYGAl8/Fe4c61TvnVN6o7+X2e172iUOpkLY/KocjfJVCoubokrafPxT/zfkgyAiFpcLryYz1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SE8KO298; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MQTR/o1a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SE8KO298";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MQTR/o1a"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OwQS1168072
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:06:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uO3IhbihC0Sbg03k+zk5kkl5LrK/ssnsBYPXdHEGx4A=; b=SE8KO298BCNhxKYh
	GImm5io7xfeBK/SUXunwVOOo1SnGPOqLC4Ef7gfXGyzjrhUTTpQYFGM+vjlqmNvL
	TWqGsHoB6Guu/oD2ayPoL8IRhguCJwR8UtlnY06FphpCcRD4egBfdxzuTBSOrkix
	PLmcY54vNNDEFWTDPBK/6jyjh1Hwmdi7mqErLhSq5vCb5HVrpk4SlBRpVtGFfxnY
	Vp4btWOZlQNR4xjT01AkNlxIAmhiHF/vWMvQtD8Mzrz/0A+8xBVRx/8QNAincQLJ
	hgZT9vCbBvGd5QptFz9vY228QSMnAuri6hhW9AB3gE3FFAPSThhlJAFN/vTgzB19
	s74GCA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf5c89dt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:06:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-536708d1a3eso2027081cf.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 02:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792400814; x=1793005614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uO3IhbihC0Sbg03k+zk5kkl5LrK/ssnsBYPXdHEGx4A=;
        b=MQTR/o1akyJhdbv8oA2ZDXthRRo3cOBT+jvT+rgVbZm13Blb6fNFRppZP+DSbTGMrh
         ILKYl1LI3oHF8uTQ4s8durEfKAe4JDb/hGmaIgpejNEnj6QnRth+bQ8VCP/HZZpK3E9Z
         DUcE5PgR3lS7SH+ed3j6sY1fXINGQ1fOQDTpluPPOG6RiFRIHS5xwZsrA5sGHGH/2cbZ
         usk9Aqm4e/0++eFucgWeQQSE5IzQ8aBGvYEiY04q7nAHi25pCNmCwqU8iHff1NNAWBJ7
         O639oXWgjX/wINJTcpoBmeXcoWtVJCxEralYQt2Zk/wk36lBxdlLp1iW4Tu4P60Z9Q4o
         xKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792400814; x=1793005614;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uO3IhbihC0Sbg03k+zk5kkl5LrK/ssnsBYPXdHEGx4A=;
        b=KCnnu5p4CtSrlCchTx8s7gD6p4lWLa1BEijF4p8keOfJANQ2lEWIckzxitLz47ouuY
         kEVzKCRZSRdTIR0RZGTkshwSzQkFiT9GmkzjZ/8EwcxiGo5zcFAbzPQaokxtUmNytdVZ
         M3HUBNuseAlz/pYpFHW0SS7C+czFTQxmVhw4L6TiXAYM8DnkGP/5dwbf0r8r27uyn4PH
         5QXK1kuHclvffJGccV/GuTdYc1HZrLYfNg5oKh5wLidghRqPfTO7E7XCXWFMUm+cWi9b
         sxKNRy7nmNcEACp2qNkJkah/ugyFA03kSztpe6Uh//A1aZ/nV0h5OEwXxVRDxFZ/M7Nr
         bmsg==
X-Forwarded-Encrypted: i=1; AKwUvBxjjBWCYooVvBssgoaOkdEFIjGAHOFGcnn+x6fgrJMxqL3UnOvo2wWHUqVksftBbVXPRiZEYLqUazVk@vger.kernel.org
X-Gm-Message-State: AFq9FYK/cYgFJqgNzs1U4ZOTRlh2VSA4QEbF74rHRswef1QAe/QIV+1P
	xIo+dsRy6PezmB2cVA1eYvDxafBlmkjfBZOfUuFNnoVxAyD7yvQprSQxOPBexsg/3uhZi33DLDe
	DnhZGJxMuClyHFLeeyPJDFS7YqxGFVaPzV2zegCcwwmx2KCX2JOlqJbmjxl9QZvKU
X-Gm-Gg: AYBFou1CPdPl3/HnVLi6pkmvusLimZrl9trlDCDk07qiGxYSeCktKlzhQOuvtk0Fhb7
	jfTswcqBCgJB83ZMMNE3VwcKSxHn5e/AKDIQyz2BDeFKNHUP91oIDIsOoJ4Ienm+aLX5DpwNjCl
	ENd5tA1IyQpaVcgaT9RQAQQQ6Dur2aDN9XjeOF8MIBUcbmIm+JKwqNJsVzEi7jOnemAVG5zW5iv
	Jpm6tys62cDtgnXGAE7k41EgikX6jSTvYKsHIvbpkvx380RhngUExi7JOJq4B/tEBYmf8Sv657B
	P/wf07iOMOzvsDSIY8P/MOs307cKOt1soRQZAJ1q26HJL0noiV7SGJX5OtvJ8I3PI1etu5AY9Z3
	LfoZTHNdM0X4k7QQF/9PlaQ==
X-Received: by 2002:a05:620a:3728:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f29a0a71dmr1347764285a.0.1792400813804;
        Mon, 19 Oct 2026 02:06:53 -0700 (PDT)
X-Received: by 2002:a05:620a:3728:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f29a0a71dmr1347761585a.0.1792400813322;
        Mon, 19 Oct 2026 02:06:53 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dceeafsm339806066b.17.2026.10.19.02.06.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 02:06:52 -0700 (PDT)
Message-ID: <366ab238-2850-4962-bd01-8ec16f6a0604@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 11:06:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: sm8750: Set
 snps,resume-hs-terminations for USB controller
To: Peter Chen <peter.chen@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
 <20261019021547.1694088-3-peter.chen@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019021547.1694088-3-peter.chen@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfX/tNB54RO82gT
 XGY+7POzcJo0iPJwh8IxuGYeu2KotTg3cJxwrZJ+DA8pi9LgRm01B/2U9GNU1Q9/7nPbiG6RpNN
 bhKf9jnvMpU+4hFOyqE8irgN4E4ANog=
X-Proofpoint-ORIG-GUID: zRqrztmy9vaoc-du8Ns_onyuPh93KUwo
X-Proofpoint-GUID: zRqrztmy9vaoc-du8Ns_onyuPh93KUwo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfX6CQs1MRKbYLr
 yjZzJ+YwVU9p0GlKHR/NsdzDUVfFDiM36MqmVLFQTgvCIK/0LQSTVjiOArxKxVelbGylxMCfSqh
 Dx/kE1Ia7Rd0lHAwvJW6EPTYXGG1q/PSyN59enIcILYf5gPQQRsP/C60FGrrm1/HagD7ZKbtcfM
 b42P6WeexRVH8FgeGcBJdGH+MjEDjhEK0z5XVB4m4kjmbr2WPhIW8qSPs6kvkYAneKE/Rqu1XfJ
 5m8QIgCWcs8kfEc7/8C0Wp5r6SgV9aYJn7wjzha2k2Cx9A/lg50SOb/y2jNdchBLWsZmPGyvtC2
 OdbBMWUFIGVliL5NRdjeXwbdn9NNOLcFyWPCEqF2PyLUqB20b6bxXYgKh3q2McgJ29gj70IaDAR
 M1f7r2VvOVbqtmoutYGHmuKsnQ23BE4QuPYP1HbDmzLZsSqJ7ua7PZTU7dL6aSZTtu/uA9sbWvj
 MlOOyQLV7mrWT8KOS1Q==
X-Authority-Analysis: v=2.4 cv=K6O3jCWI c=1 sm=1 tr=0 ts=6ad5ddae cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=puRPeVu9JBWJxywSoHgA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190036

On 10/19/26 4:15 AM, Peter Chen wrote:
> The DWC3 controller on SM8750 is paired with the M31 eUSB2 PHY.
> According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
> (RESUME_OPMODE_HS_HOST) must be set.
> 
> Set snps,resume-hs-terminations on the SM8750 USB controller. This makes
> dwc3 core set GUCTL1[10].
> 
> Fixes: 7a5bb9f60527 ("arm64: dts: qcom: sm8750: Add USB support to SM8750 SoCs")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
