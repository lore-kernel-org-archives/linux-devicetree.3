Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7004BB295
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790766696; cv=none; b=otVXOcvYU+6fQGxI3d7kTjUA0bJwKDLF2/Xb75oO0J2KAbqBUrglGMHv/cXrUqoYYWC99oMED5wNjNkDpDT3upzAPKZLDubpchzv/m14rWOHEWd4JmnOENAstD8of1LijIz5PNLm5DM6so/ZO2v9fH+mtQ+Jzj80rhgVc8xJ/PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790766696; c=relaxed/simple;
	bh=XfAUpWIB5pFLDFRK6D7anzO+YIDlxesyQMaNA6+Mucc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dLcAabopIsJpbDvQGLBsywffD2dNFwB8QLHyVQK6Pz3O1nOMIflft1xW+pUhWhHEyELOjOFq2IWKycVBiPr1WS/sHX3gkFDeRBhQZWl5IcjM5MDIlvq2KseXHeGMi+DhB66ELvtruyGysNeF8rIONLuceOcD4xQefM2B1ohidrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lLkwqktB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bCQ0+kng; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lLkwqktB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bCQ0+kng"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7J9N3554808
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:11:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pvmbI9rgvTTA/cwhiqUJrtUvaPKNUBBZFDt5+C+0sSU=; b=lLkwqktBl6bGiQbo
	h5dL9QQtCebhNsajnpPsHsODUeW5cfr6ntMO5C23PySDliaygC6WqJfMqXrVXsoS
	/oIB8Wi/p65eyENGVoyjmHlVBz3wvxBMDpVPA83NgsxM9WjFoBVjCw05Vs+gQdKz
	aE7mj9UfBkuT2KiHmHNeKaLNuRw63725lbIdCGuozD4AtZ8278uLyINuyl7q1LCw
	GkspzAtkHzSAQ5w4H+1U9fNXgKX4I//BuaVyrD6WfliFaN8+SrEy1hm8uKEQIdWj
	jMDITwFlQWyFr5Gpwo8fGsAEcg36mx7Ff4lUXGuFHybLJBKAPgiQpKmUJo4p5SAL
	rIqd9A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h10bk89ga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:11:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5333cac460fso9378251cf.2
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 04:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790766693; x=1791371493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pvmbI9rgvTTA/cwhiqUJrtUvaPKNUBBZFDt5+C+0sSU=;
        b=bCQ0+kngQExOA/9fP1th8eGyjyl8wROiXg5pYefbCUyT6R+j8an1c1Ka5XY+iKR4LV
         LuZwF3MGT0UpEI3Yq1bOihbO0OVid1WyOQiYs1iTBPvcBIuSMKehyIT4a1sHBiowEDvy
         ExdSjOyR13kscfqTtV8IVR3RhoUYgdwF7HA9kUJ8m65AdIPBjxBqgjWPB3ht8OiZyx6s
         ERORJ3/yof15t+67M4gZuNgp+HSp9nZrnXP/GAggdtdBGmSUFxTBhLMit068kbeerKwt
         wmjHMiaeR/ilGff4A7slseORtsG2szfNQL9hni0EIkMqsDQZ3Y5dutYyhyY6ouqUy+HN
         ls3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790766693; x=1791371493;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pvmbI9rgvTTA/cwhiqUJrtUvaPKNUBBZFDt5+C+0sSU=;
        b=QRBCGjATvjgsIIs2MCvHwkFKLS9HPbd6w8ZSuifmQ4TdpFP9ZXBXUOziQL/qr4TFFb
         /pi2Prot2wkPb65AJ5meiFeD/f5z6L3fgZfGeAUnYdPkaO0viSJdfAC8ZIh3d1xNPEtG
         Upqyvrc75TZ/NQPm0F/7lGnMj0Omo8em4621LQEXGWQgKn3+dJMcolze0D8PyIIzBvNA
         JzTIbG8Epw2DXs5n2wP9qfS8nRWiTwI8yOLuUNQtmfNE9WfDkBPr8UpNm40/B7fHmmjv
         ujKJFL7UoyQcLGXA8eiDxdli63Z8Xp2F9xHeEOB6bXcdmyTKCD4SVjAcho5x/fVqsM15
         ZmZA==
X-Forwarded-Encrypted: i=1; AKwUvBx/vgrqcsqpb0c2AeIqcUEqGqy3oLRIzQPlq0+wPu5fzph/cYbJ5IGtgKoxbRL5b8ysCPjLgXPw8+kz@vger.kernel.org
X-Gm-Message-State: AFuF++m/E0x2r5a+2cGUvfatMF8DF0sXDDL+5owt2eQdF79kfHNvShJL
	SVQir3Vui+FRpBRmkHP3UwsyOAZtmQX5CSc+6hxak6vQB7sDzWW6BUloAeovHB80QaiQWK6otZC
	uc5A8PYoThreN8QRZrYVkKizO355Sjyf63ZuoUTt4k86qxKyKLygx+8PdCH18GsLd
X-Gm-Gg: AYBFou0Ajnfspwd5XhKdtmks+avhlHKO7sNZ3vWhnwer9pZSCial4HonjmGqyKER43v
	9OgXd92sGaVWhof554fJS2ZHBUPHikHMjcUccVCkjq10zSnpTXn/qRLM8yCPzsVmLm1yl5GjpEp
	bPQOEAXVfM62YNVVK3JVdqBoH2mgsorfqzd2w/aAGG8xzjacm6SxRRkpkTW/Z1N45WMl3pDTy7k
	kTtjVgcEFyS/owv3uGW0rQrvqRmyLDUa+HSqUJX48go9RLxhe6Id4j+Z5i7HbOnBmkQ2ntEIQSj
	o4a35Jk8ngvDDpgElK2yRerdiXX40eeu956Ryha6bMMoGhRXA6yygfyizsbPPBgs2JLIQ+RXW4m
	e9abODxUGMxcOz24VrpgyWw==
X-Received: by 2002:a05:620a:700a:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ca97d148cmr150770585a.6.1790766692872;
        Wed, 30 Sep 2026 04:11:32 -0700 (PDT)
X-Received: by 2002:a05:620a:700a:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ca97d148cmr150763985a.6.1790766692337;
        Wed, 30 Sep 2026 04:11:32 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e22f803b3sm49118666b.46.2026.09.30.04.11.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 04:11:31 -0700 (PDT)
Message-ID: <c61cfe2e-56f9-4b82-a9d2-a2f5dd7bb45d@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 13:11:27 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 14/15] arm64: dts: qcom: maili-mtp: Enable S5KJN5
 camera for Maili MTP
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
 <20260923-hawi-maili-camss-v1-14-cbbb42e534ef@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-maili-camss-v1-14-cbbb42e534ef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WcRP0z7Aygbt5mCby9ZYueEQtazho0yQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0NCBTYWx0ZWRfX5GG/L7bvxcl9
 GasqGDHZiFZH0jIA/VeEcnRFHNQWI0I+yCt+q/lbzOmwDdXflbrcGc40AR67tRaD0h51q5PKX5n
 jDk279gS2pgjh4TwVF8yILG7qQhEn7T3D4SEND2DZVVed4gOOFIXm1T8zKOfGBCgeLoFFmv93dW
 rbbBvSd9QcDlRKfLD+HFZAVvmimAw0v/1MKY1qVtjlbWgqMu9laUyBznV+F/FDsL366ACrGIigT
 15T26U1Tqd1WTtkZ6VNyeIQRqQqsZo7ze+z+7KbdydjXyGexiu81Anm4GtTzBsu0fxI+WWdjkkR
 seSebK79kvHRH+susTsmeCRWZHoMv60RsMZg3JhQWwI7ey2eYG+8sJAsQk1uZd8MEFhJkp7ISfJ
 ZzwA955DK5G/Y5+MGfpYF/bteC06xmpRktnCmckcwl8iMYDEK9r2dt1qaLPuSnE2XMpQUQUZxHa
 0uuynLv/Jct3hh5fklw==
X-Authority-Analysis: v=2.4 cv=MZn5KJ/f c=1 sm=1 tr=0 ts=6abcee65 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=lfXJP-rXcfLZvGY9UOkA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0NCBTYWx0ZWRfX1CwR/wBqeAT6
 gqEYlBxm2+lrGqImzWQ79eBSXpQdM9+W6y3qAcLEuzpOyFv25qR+zOUU0xFlNISulqvywPDZUjq
 OdkgIfqU2ADFuBArWiRIdU2Sl5dHrIU=
X-Proofpoint-ORIG-GUID: WcRP0z7Aygbt5mCby9ZYueEQtazho0yQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300044

On 9/23/26 1:02 PM, Nihal Kumar Gupta wrote:
> Qualcomm Maili MTP carries a Samsung S5KJN5 rear camera sensor on
> QUP I2C9, connected to CSIPHY2 via 4-lane CSI-2 D-PHY.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
