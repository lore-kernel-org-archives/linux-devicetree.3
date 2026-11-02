Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793586885;
	b=f/1+rmW8Up4GopQh7mwhf/0Ng7J70LYYcmenB48z5QeV+ZZ/Ud4Zf5I0TkZvpKDt+zch
	 vDf9VZ+ikZ0MaNQ3yDZLGYPRI+41fjyMNwEOPj6SloMaDnSYh5/XTLxaiV1nUYzhroCSI
	 tFpSpaWk6HfMux/0hKcW8lW6WDjScyg7vWrkjPpNEGkUHNJjTBOdzNKMp7r9QhIS4pJH6
	 Sj/cqwa/4ulFApUPDcFClZG+3kI7EioOM1Jkn606ZnNJIWQZWJyVOIMJEy5HcpNZNQ34C
	 WO26Ibwx96XpobjvhpcudyY2dlwlkQivMkipvfKB1C2wWwNuEZihqdPxDuDaZ/X+wDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793586885;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pTNhaZslzEJDcamLWWGIWWaXhbibgaPik5sia++AYaI=;
	b=h04KPe7MC3gN1HAbAsGTF7bbf6+Ciwz05voulEQd84AWYxP82pVU8hc7LSJ874MyY4N5
	 h/WE4LNeGAnhv2NrSc3XdTtITedbLgGwHdUUuLKqREMLKKPgWEhF334v6OLW7ejtea4IX
	 kLLBGB9aLpUBHoFMcmMr5k9ltkHNP43AXJSjnX9jkbyVujAo5hh/Y7nxEJjxzFh5+bgAT
	 uelycwd61xJdBv3btpQHcKwmFjXshK+4RXtghkLJzh/cX2D25WZ+AhewsmvpJhfe5p74Z
	 ssF5PVOL+J/wnwYNVFxEL86XJViPVO64RFFIYRXOsDLvS//QreqxAdcwiVkhBdjYeEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="p88/p0yH";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vz5qVpJe;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E15606A327
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 02:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0E15606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p88/p0yH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vz5qVpJe
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A20V4Wk2317429
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 02:34:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pTNhaZslzEJDcamLWWGIWWaX
	hbibgaPik5sia++AYaI=; b=p88/p0yH/19nh878ew75k6VOBTAqMWiYwmjwMTWW
	JSKLLR/ZTr55p40J8FBULNc7ZVavSZOeA2RG133M5X9F6L4mC6rpZCKyxfrsMPo+
	gwE1OKaLXrwyHNrDNze8uCb8hRYk1dCwrqCeWTK/ntarEZr3FGFS8JybYxhw2NGC
	7KRDnc1Zin7l48Oyrq6uOCFkJC0Ge84XMcNPf0j613AALd8Ct577pAB0wfeiUG9H
	95MxXeX35+1+JvjT2O+vaEpLzSHMJoKokkaY80pdbknP+6OFAmGc2c9uCDavn2Q6
	KUSBft9X6N2xPTeMvbvnwE1HZ2P0ScOElt12vUf/jtLyuA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpg200973-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 02:34:43 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3425098ae4bso5579855eec.0
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 18:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793586883; x=1794191683; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pTNhaZslzEJDcamLWWGIWWaXhbibgaPik5sia++AYaI=;
        b=Vz5qVpJeTlTZUHvhp171oUICEBdxMsSepbQQ/KmD0kvQjg11s0DBQDz/r0cldw4ie7
         pXHqg6yM545g6snwkizEuTdjtCaJa4oRUcs3+1NlFVbJ+e9laIQfHJLbWrCwCKEcuiv3
         58pmfzy4odyQbFxP0QglOm0q7A8utfOor/60Cn6tkhHbIlNIOrfIYz4BN4d0O3RfmbmH
         0GeZGcUJPAZ9336C44Wo8PrwJsUM6FNHhJq9Fyt8k3NPYXTJWT0O/xN0fV9N1rEeNS9m
         gZp9IqjGPSY2WlsCK8tGfGCQM3GV4C0wFgwOukeSwPK6VrMlsM209qU4qoFyDUG/I4E/
         Wh3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793586883; x=1794191683;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pTNhaZslzEJDcamLWWGIWWaXhbibgaPik5sia++AYaI=;
        b=mZ/JpKZE4OTssIlsJBP+LCK6XXAIyv0TVUc0Xr+iX0BGfG4tC7bCOcFM1TAKNiMoka
         s3hX35BQ6ur6/IO/8QHUEe2N9aGPwAn78sglmQn/92+0h+/LYMMzRiEDZYInVZHm8okP
         qJWaMMpQia/nhGW+JpOEeIgrgam0D9QsGCjHFv+a468MshwrWMI1nTA2e2b8LqXVNkXB
         3stPGptJhDr2a/tazwYQy19aVtGJxqBZgat9rgYnOFh8vWV37ETpOIN+qmSmOtKXkbb6
         XbGg3BKQiLsFUcBwPL/So77TId/fGzovku2l5ovR2yw0V/QKRBwcS15JNNQI/1lOs18h
         wc9g==
X-Forwarded-Encrypted: i=1; AKwUvBzTEENMTd2UEhyo8xttuz7Jp7i/2qYpeG+joisN/5fOHEy8YYnZ9UUBloDR6NC264p9vxkVpmiu+6OS@vger.kernel.org
X-Gm-Message-State: AFq9FYJBlVEKNgQbfahyEf57gQ5XFl6M0gp2c9I5SDfJ+a2yeeJbPzCd
	bZfWJpFKKeA8rSRyAa7N5wJ6m/XwbDmidWz3Lyn901zXUeuzxdamgdlrpeo1Zt9p2jdHQ2dPJDV
	wM2Xu+LsoCua3b9KWb/ONBZhQHcI6PMfciA91dt4K3sBcISJgsMKM/Cyk+3YcZp4A
X-Gm-Gg: AYBFou0sbzBQrU852W/PlKlVjpehcKfmC4tJB7LRQ8wLzyg14zv5StoWCXVPJ/6uOUu
	NeUEerWHivNyRro0i4PCk7ARrJWokqRHMOx0xDF53hxSj0Xf65WsDnQbde3+34i/JstGy7n76a1
	hJBI+AlsJTwVNFXS4vD2cNbE6svgR/QQpZqjHKR1JzDG0DX2TLzL6gdl43rl2MgKMeSdU9UBJ0Z
	YwFaDRuMTkzP96qWPK2zbmITAtX+w6QjRMhnZ6G09YDJewzs2sj2FQJG6mk02ml7phhmb8bjDbU
	ChOisIWoJ/+S9g/wivbya3IYTSsrkeRXq5fvTLhDYERECfdLg7jbrIV8vJQ0MotvQXa/UH+bsqV
	+DDQz+eSWqoyMuWuq9ak20QlCJ3cNdbWV0D81vdUmTZAS0TdG4RdxJThS/1bUKv9Q7KU1YdwhKH
	mRNwQ4KsWW6BG+Bg==
X-Received: by 2002:a05:7022:eb50:10b0:183:942e:8493 with SMTP id a92af1059eb24-1ac5a67f97bmr13780719c88.11.1793586882549;
        Sun, 01 Nov 2026 18:34:42 -0800 (PST)
X-Received: by 2002:a05:7022:eb50:10b0:183:942e:8493 with SMTP id a92af1059eb24-1ac5a67f97bmr13780655c88.11.1793586881735;
        Sun, 01 Nov 2026 18:34:41 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19c6b969sm28674816c88.14.2026.11.01.18.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 18:34:41 -0800 (PST)
Date: Mon, 2 Nov 2026 10:34:36 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>
Subject: Re: [PATCH RFC] arm64: dts: qcom: nord: add ADC-TM thermistor
 channels for Nord PMICs
Message-ID: <auf2vF7MRgWDCk93@QCOM-aGQu4IUr3Y>
References: <20261028150103.520428-1-shengchao.guo@oss.qualcomm.com>
 <6drdycuoo4n4qssp3axrij5xrftvg6w24z4oa5xw6wmtayknk2@mwz62l7bnvhg>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6drdycuoo4n4qssp3axrij5xrftvg6w24z4oa5xw6wmtayknk2@mwz62l7bnvhg>
X-Proofpoint-GUID: jySJ6TY3IWF971y-Ymkh6GqC0JwlkHCW
X-Authority-Analysis: v=2.4 cv=fZY4WEQF c=1 sm=1 tr=0 ts=6ae7f6c3 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=qMigHBYzDqo8UOFGUZcA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: jySJ6TY3IWF971y-Ymkh6GqC0JwlkHCW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAwOSBTYWx0ZWRfXyXdAzraxwtCA
 qBgjoWlfY33vt4rrfmpH8KqtNsRJ+QQnMKCn/hNfH4MFxlUSexdbykk1+Xc70bDu2NF4CRzsw71
 KKa8iCungyPOet8R/ZvHnaXyW7Z9stERAGA/svH8mvBXEIbTOFeyX70le8/zg3OB+JbTDTV8iAB
 IB1R4mWmDhbIRM1COBhFYcELegOTjDDVCPXN4EmiW5JV1kMK79Elrsz0vz/nHBf00TG1S6FxwCm
 wkcng56jNm98vDkLvVk1pcYrhh23/HN760Cd/eMcE1uBrjsbemCtTOsn2Vtp8cLl72WlQgrSyJu
 G0jaJSAp2vCKYyNwT3QBs3JIEP+oUzRm7BcxV47reQiN3ejJQZ/E2XWXXRzpON6NTIhnwuEt5TS
 HSIRmMClIhoc1wtAKlQQRJCoYDCLO5p8J5OgJKNFIKXKg0r9U8ECIKtRnjsja49TGP8aNKKzLlV
 DKsiBxKyjyCoW3yeg6g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAwOSBTYWx0ZWRfXxKHj2n0N1jD4
 //3oaOI2eyyR7Z/HuhorhrXtBlHw9VDr64Qg9mANev/bf0Flh8cE1Mid8XglkG5lqw62NIIcE4y
 FHZRW2XGg8n9enYGIyiPzd2gBpaAigI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020009

On Fri, Oct 30, 2026 at 10:28:21AM +0100, Bartosz Golaszewski wrote:
> On Wed, Oct 28, 2026 at 11:01:03PM +0800, Shawn Guo wrote:
> > From: Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>
> > 
> > PMAU0102 (Kai_MV) and PMM8650AU's Kobra_MM ADC5 Gen3 controllers only
> > expose REF_GND/1P25VREF/DIE_TEMP calibration channels; none of their
> > AMUX thermistor pins are wired up, so none of the board thermistor
> > rails feed the thermal framework.
> > 
> > Only 3 AMUX pins are actually wired to thermistors on Nord, all on
> > Kai and none on Kobra: Kai instance E's AMUX1 (SDRAM3 THERM) and Kai
> > instance I's AMUX1/AMUX2 (SDRAM1 THERM, UFS THERM). Kai's other AMUX
> > pins are either DO_NOT_USE or wired to voltage-rail monitors, not
> > thermistors, so add only these 3 channels.
> > 
> > Add #thermal-sensor-cells = <1> to the two Kai adc@ nodes that gain
> > a channel, the new AMUX1[/AMUX2]_THM channel(s) with qcom,adc-tm,
> > and a per-channel thermal-zone for each, following the existing
> > Gen3/Gen4 board pattern of a direct thermal-sensors phandle into the
> > ADC channel.
> > 
> > Signed-off-by: Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> 
> ...
> 
> > +
> >  		pmau0102_f_thermal: pmau0102-f-thermal {
> >  			polling-delay-passive = <100>;
> >  			thermal-sensors = <&pmau0102_f_mbg_temp>;
> > @@ -501,6 +545,42 @@ trip0 {
> >  			};
> >  		};
> >  
> > +		pmau0102_i_sdram1_thermal: pm-i-sdram1-thermal {
> 
> Existing thermal zone nodes use the "pmau0102" prefix.

Indeed! I will update to to be consistent.

> With that:
> 
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks Bartosz!

Shawn
