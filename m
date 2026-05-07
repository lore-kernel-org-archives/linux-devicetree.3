Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A49C38AC8C
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 08:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778144310; cv=none; b=dvRRiM9tKmAr8E4Z6o7qLefvIT6aCDIcRoPIt1votA5BcLQI1GOUfEqWlh6LmgN8KWT1OJLkCQ7LgsFSYXhSpgN/ZvINaXw9+SeRg64P2VovsSk+U2nQTMj2intIeDmtBUS+xvGeU6Xo7Dk9sS1pftCxdmbwSnqWcXLMP4YWLGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778144310; c=relaxed/simple;
	bh=OwBsLT+laZaiPCuphdcVdAreMTZfIIzwOQPcmZSMbk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IQbzEnvpSQUGXNeWLfHmOQSfCWC8hMyHOBCURWDrGYPPOCNt7Um637aSj0q+e8m/9tMgmaNzyEF6yCQ/TCMfA6H5urufStA//bPBZxV7BG5t67I5hLL3Cqy65zxVNsk+rxnhzXA3CCfmIMScMaDlaMoI3wAwfICyeKhNJJ8mpy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ID9tLEjr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O6e4O6QY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ID9tLEjr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O6e4O6QY"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475MATd3156937
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 08:58:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=E30nslBrQfilUKWanY0eyysp
	ddoh4I0nKO1YhfVuGHI=; b=ID9tLEjrE+IrXIHwRvHsi1TjxBLws5E1lfYT6uaJ
	SqeKsZgx2rSDRrKm8VBpO+IQgn8tDeuZ8ZAoH/bMnmegL7Yei75V2hbOFBYX657S
	5iad0WWmT8QWxxHFpnfQa1cmK1WH/vjHgyngoPDDw2KMmF3c1EDfYmoRjGL0fSm3
	PC+lEWyssWKiF4fD+T+gI++Nmy2K0IlTB0jy7E1cITAo8QsRXTrCo7D20ie5+3tf
	q1S8Dv0RGQ1BUCTJ1/3/LLP3swGXS5aK8+mNvhO2BU7izvIsWExRjvZdQA0jLj8W
	Nil7tF3VbfVw2clrWWv/+WtPYZsvzSjD9C2WT9sQVz+W1g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mhf0sr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 08:58:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50f817c3240so8184341cf.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 01:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778144298; x=1778749098; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E30nslBrQfilUKWanY0eyyspddoh4I0nKO1YhfVuGHI=;
        b=O6e4O6QYX/l0+KHHdDuN+L9kMed0e81859Hjdz6/nHHWn1OlyjNwn5wFpIKdMU5lqy
         7dRRdRxHLXLxJq19V5LM9HLyIF9hFTf1diNids3Pkityr4rtugVAbTOMPRpoXuAnAGjQ
         tHkU+prbCcyxjq7g5JzCq2/uPFhNU1mueIGAnU5hT49o7gd2DGAqiXsb4je6ybuwptD4
         WA4KTdw+T6pInYRKcEN+j0I6pvpAPRFbSX0nKB3exsFa3z/d93BpYQrZi6NLvb/IwdSc
         41qpzMDACEtUmW+hXpndNm1R0JkX6pXEgJf/qOchADk6NlfF8wUkb9rJynqrlAo+ZrMB
         pFVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778144298; x=1778749098;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E30nslBrQfilUKWanY0eyyspddoh4I0nKO1YhfVuGHI=;
        b=Q53pOzNi5NXTLzQXAsfHIUm9fk09I6BPp33S6TWyJjmWEKGNvTNGfBxRjKTgXOwxaU
         3FyLABhXu5x4Fu3JqXUIdn5IxLOUjXEKh6Me6YpEOTVyQbbvYoc+WiGv8GMn/V/4zm80
         bEq26ReciILDve+TtRk2GmjqzAsjcgsCiQXi9yJKnXxV3e96ujsKthymQ/GtEobH6hDj
         UwQ8G3G6Un4nFp+t22gxgId8PHP5jdEYcxM94UEDt29+dKM4yX6c+mOFXq2NfuccGgAB
         aR15pMiRVyWfDb8Zb8FzI5N08koc81Ua3TVsGIbzWq7sji8uWCxVvlpBrTqr0dd6WrET
         2/zg==
X-Forwarded-Encrypted: i=1; AFNElJ+yBvUrQO079Tif/vZLESEOBkqSq3UHL8aU+ssW31BNHJ64ah/WQoEPsR9VKzfNnpcXM8RarsUIWB5M@vger.kernel.org
X-Gm-Message-State: AOJu0YxyPn8MmIeHX67hbYB8GJjutuOGLVhoR2qinWkfdqENeKN00vG1
	01yPPZyruLejnpx8KPi/aXVPGcrn7/hRAZ0BfvhlQKVXG9Jk1u5Ze62598TghTwX3qF4KkWHZxB
	fT/2preRRZv0G04xr2BUJ3L5iYHXFZccojXpGI1xhKFzI64bSoeexVdIl3kO6hRje
X-Gm-Gg: AeBDievkGJFR/ZUc9QrbuhiIRsmwr4HvnSq+i/MmvaO6MuoG33T48cFT30aPEv4dqWZ
	llxnfhDSelS1R1qhcroFYH8oE5oKcbnyfHtt3qliZOKpWaGwELOz3bmHSE7HUrrthYbrE0XLH/g
	UgSQeOdYlYIHSIGQ4+H3p5pBowBqSCXc4dSH2nCB2RYh4do1+TmhbwqQasYClemI9yqPsKxt/7y
	jWEGwi8p1eWKiVlSLxXXmwdUvVcqIlYJaS50R8g6GzynDRKnKubQRkTrIyb1er1c8gwrjJc4osY
	BWTxCZEEymQHVoWAGRwVDFtb8hb+AgwAlet2DYfuwOB3hNAnL0TP2e5SZDEHZTVLEQpFL7ifPzh
	QooWvgXemTR+4JQsS28AQKrmSNJHGkRBr7ubBzF0IUEq3Z/s=
X-Received: by 2002:a05:622a:4a8e:b0:50f:ade2:2da with SMTP id d75a77b69052e-51461fcdddamr100491961cf.44.1778144298227;
        Thu, 07 May 2026 01:58:18 -0700 (PDT)
X-Received: by 2002:a05:622a:4a8e:b0:50f:ade2:2da with SMTP id d75a77b69052e-51461fcdddamr100491401cf.44.1778144297399;
        Thu, 07 May 2026 01:58:17 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530b19besm36764745e9.7.2026.05.07.01.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 01:58:16 -0700 (PDT)
Date: Thu, 7 May 2026 11:58:14 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: cache: qcom,llcc: Document Eliza LLCC
 block
Message-ID: <j3pfv26yylt3a7fae6u2fozbko7wvy4gpleogyg7sg4pqp6duc@bdagnq7gcsr2>
References: <20260504-eliza-llcc-v1-0-d7006c899812@oss.qualcomm.com>
 <20260504-eliza-llcc-v1-1-d7006c899812@oss.qualcomm.com>
 <20260506-imported-emerald-quoll-fd1ef8@quoll>
 <0028dd41-d039-4ef5-a9f7-deb730a05b0b@oss.qualcomm.com>
 <319fc5ac-1211-4845-9a66-79f1a3026126@kernel.org>
 <486d6b30-8762-4f14-aa19-7c5497cba00f@oss.qualcomm.com>
 <2920e0bc-3f60-49bf-969c-9c049b080703@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2920e0bc-3f60-49bf-969c-9c049b080703@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA4OCBTYWx0ZWRfX3eU4EEjY1aYt
 SA9jVDenUchK4IXEnp0m2UD6cPPe44/XcjfiWyR43Pv+baVkg0h3kP5rxHji5EYkqlBRdVmi23H
 RpMQWhWwlObMK6umhL4RMfLT6DQImLOd5iR46WzWGayK5nj/ptUQIlagnPnnNUdSkg/apVjGqLo
 b18zJMi38dV2eYCmbYWVhg/hv2Wa5jbyPPaaWSoihYvK7zaRqv3sZyQ4VAA70rUOoTSFgCaiuBP
 SVeSDXe0bnKQx1IgeU+bONFETTAQDombFj7SEkRq1KTrbDP9lcLpVm/QPKla9zzQela1Xg050Fp
 t5oNpG6G81DYIE5vovfv3Y7IYgbCzB6Pa6p2hGvWXpS22pWwoTZPUsvvsJYBUNYXErEPozDHHrY
 hDA6iNVxrZAo/BDAhLhrSapNyHhubkLMXhd6ViV+h8o71/Bl+Ea8XO1ntDxh6fEB+PcjswrT+Jk
 RJjOipRwwIMyelkrLsA==
X-Proofpoint-ORIG-GUID: YT_o9KBPB3bv8UHGWTbRfYC-JJ-zFPhC
X-Authority-Analysis: v=2.4 cv=SuagLvO0 c=1 sm=1 tr=0 ts=69fc542a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=JAKgS-5HGXHXDUih-usA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: YT_o9KBPB3bv8UHGWTbRfYC-JJ-zFPhC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070088

On 26-05-06 14:15:57, Krzysztof Kozlowski wrote:
> On 06/05/2026 12:47, Konrad Dybcio wrote:
> > On 5/6/26 11:56 AM, Krzysztof Kozlowski wrote:
> >>>>> +    then:
> >>>>> +      properties:
> >>>>> +        reg:
> >>>>> +          items:
> >>>>> +            - description: LLCC0 base register region
> >>>>> +            - description: LLCC2 base register region
> >>>>
> >>>> LLCC1?
> >>>
> >>> Unfortunately not
> >>
> >> Then let's just skip the names, because it will cause unnecessary
> >> confusion when name is llcc1 (since it is the NEXT entry) but it points
> >> to block called LLCC2 in the manual.
> > 
> > I don't think skipping the names is a good idea, especially since if
> > we keep them, we could teach the driver what channel the region actually
> > corresponds to
> 
> You still can do it, because indices are fixed. Names are only helper
> and makes that easier.
> 
> The problem looks to me purely doc-related, because this is logically
> second channel, so LLCC1, just like qcom,sc7280-llcc or
> qcom,sdm670-llcc. Does naming it as third channel (LLCC2) is relevant
> for programming interface? Imagine driver taking LLCCx and using the 'x'
> as offset?

I think it creats confusion for someone else who will consult the
internal doc and see the difference in naming.
