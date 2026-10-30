Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341022;
	b=j7MCBExI0sFeQccVkDgJxa2o6qUt1sJ7EdivGns4+CIDJfeWAm/2wWjpnWFM4CiZ2+jO
	 U0nnIHz7kx2eNe3yvXw/RUc/xffAujFgv4xnK2eiVOnP2FUIk0TNPaK/G+BQuA0hmlMMI
	 snhcjPf3wfzecaTwdzhH/Vp/K91UWx46nSu58q07upJxKEICfAYZc6RlQEOdZ1pAGwmEP
	 vUINxP2fV+2io4+Sq7jSxFf192dnFG+0gXvtcTWHTOswW4NHfepk/7uhvBwqxPtERlTTv
	 iZo39gcBkTxp1OdHDASvk+4ftQZxhOGmcC6R5K4KsLt6ZT+5ycy9sHg5Ll3kRLXhHcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341022;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ACfZMliJrd3wVaDRtY5aGaTDVK58zbmsuoUuLA+8dus=;
	b=YnOkJpclkNbZRPxN51NHTPzUAkCTlDhmyzp4TzYpJoH82Tn+CiZPXjT8C1oKESgCbRN3
	 1GlZxmJbHtq/bMLRXo2xiOOnhSQvyx6yn67rFuWCjuC2DoWzQZ+FuNvLp4CIoiPIwDxNq
	 RvY5wK2lVgmTd0NfWmyf9lAWi7H1kQEfvn1cChal0M/WLvWPHB8ptRPcGwJcB37BQXFDj
	 j5Kna5ioEzGv08ECuYO9cXgQ1XPT3wiRHKTDlo/7cX4uc5ha913UljIhIvUHZv5q0tYOi
	 Ax2ghCiKSq9tV/aMAj6ZdidOKlPKS2dWpNu7PdSDpBUTFNgCC0IRRNDdxuKJRLtNgTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iKepuzNE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="AjEX/E3R";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF95606A31A
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:17:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCF95606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iKepuzNE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AjEX/E3R
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F4cd2286998
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:17:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ACfZMliJrd3wVaDRtY5aGaTDVK58zbmsuoUuLA+8dus=; b=iKepuzNEyWv3/RyV
	1XLY2KoJBHDLMSjUtFUhRhbnDDJRywYTxhSKFHe9vyAN9wCKrGFLFPCHfnxslrBK
	EQTzRMQnRRrRuYcr5W6+1SRLPMlaz0th9iTHgMX0YIqxdLXStaFfSFC0a60lzyv3
	dshbvtud+EKT3qrLKWz34Lfdgi39Rm1OLkFFMAxqOFeA8ETuLcxXq1LN7lL+RdOW
	UE4a/i3HAQknXNaMYC1G0o4j4IDxdu2sTiR38TNC3Va3FHZ+Wow2RVgxvrcXND5Y
	I7JetBFnKuD/SXfiESiDbfCJKaAkZVC+a0O+NdnhaTelRHML9nJhm/gVCMovBTMf
	ZdI6Aw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qhgna-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:17:01 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1067132eec.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 23:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793341020; x=1793945820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ACfZMliJrd3wVaDRtY5aGaTDVK58zbmsuoUuLA+8dus=;
        b=AjEX/E3RdTPu2IdqqYdu4bf8Up3bjfkLbaUx3L8TqlYb7azZ1TWKhPkXuNFwZAcNzi
         GqaOp27Du5BVp1/rcuEyrHErWEA6kmKjPWFJ+uhv6aJpz5ajyg30t1bKx2M1VLxy2hDb
         YXzEfEwQ5rrCilSs9Nd5/YzI+BhVWOFGxp3e3E/nt7LQCoTZF+IuePm3XIz3e6NnSbdg
         m1i80Syr5eH/Uivmsov8dkg5s0mUjCgjodzbKx/lpgs+fHIzm6Dnr2zZ+QZKF0MBBIeS
         lnIPAYL3nAH9EmG4W8gbveYCwfLTwojyTo4nICP5JfjQIxaimZuq6p7YAlN2XXCf/rSW
         A9SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341020; x=1793945820;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ACfZMliJrd3wVaDRtY5aGaTDVK58zbmsuoUuLA+8dus=;
        b=Eqr/93QnsBqU3hQESR0hEtrwQQR7hx0a2ymyCg0eF/14MvgG/GGXUSkrGU+e1q7+RB
         K+luwvC9tBMC2XXPUpIKfOHfXZTSCDS2R3CNtVWy2bHOxCTJmQhTOscGveGgJVwRGGLt
         9SB5Up2idsvfKoAmfsiE2xtFUIsX0fJoUmmRJ79Rc3f++L+APhwBMaByC2lkfD/XLhEV
         dQwJnyn/MkrROkKrfl0PtzgqLr4FDpvKeAiBok/8ZEIkdB61NEJ97BICNT6/aX3F0W8r
         Eu31pvxCm+8DFQillXs515CWHkVFyrCmZmQx1SPY3CTrV2vd2xMDAtM9Jb354PT7Rarm
         NiJA==
X-Forwarded-Encrypted: i=1; AKwUvBxx8RfqFRVkxu8RmIi9GYmuXuldXJWMggPvt7MrwN9xzWf9NyNpa4P0463gVZPKJAvOvbfoo6FPh9ot@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0AwfFvxLPk4AbTPpToTfEXgCYQZJYKqUYoX1oeRMfuw8k7J8p
	wsqjZEPzeeEgqft899T8nxlDQI/A/K/+DU+XloO3ROIZKCB4hYCtY6ojmx6/be9A1PAU766RtB7
	p0RJDiZtvHpLsxD4W+WuW9S+BPzAoOSg2mFhJkcfTAEzfHlCV/tQeZsMRzqPjnlCk
X-Gm-Gg: AYBFou1P1WKe04ORh3dmbfLvaORtEu3AL6E6Dy+DmuLsrbYBTlRJ3+yqqUcB0NSCiwx
	uIKv+9Ajd5FDsgPw+H5uwfUKGdVTeZ5tcrjlthvcsxWYG5roLIYkA5oeoFEVtLhDpsUi5KsCY4X
	eCV0SaVajPjVNqk72f2Prw+rm+5TIkmLJycC/CH82ECEzxVO2ta+dUi2FwQuWUCiCJOGl3mEbnn
	8fH+rYkQOly5qVpyEX+BEJIirzc3b9rwqlIV8la4Zl+f7Mu5T4ptYpmPGi8d/7VDE1S+HI95q7E
	cXlHJJ+nqf7dQtjwu9utxcr2gW/WHWCWCANDtQG61ekvRYsFI5sVaS/4jIeQ0WsxW8rbdGcIoWA
	wQz6YthOg9xVF/u46opBHztDH0jii94ANKpTSat11690yka8SJLJNAqgwRKK2HOTjh6xChOYP8w
	hfOQ==
X-Received: by 2002:a05:7301:4b0a:b0:369:9af5:7bc9 with SMTP id 5a478bee46e88-36a424199eamr2308081eec.23.1793341020143;
        Thu, 29 Oct 2026 23:17:00 -0700 (PDT)
X-Received: by 2002:a05:7301:4b0a:b0:369:9af5:7bc9 with SMTP id 5a478bee46e88-36a424199eamr2308041eec.23.1793341019611;
        Thu, 29 Oct 2026 23:16:59 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42669128sm4577341eec.3.2026.10.29.23.16.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 23:16:59 -0700 (PDT)
Message-ID: <9dbc3e69-35d8-441a-9cc8-87a1e0355d1c@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 11:46:52 +0530
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
Subject: Re: [PATCH v2 7/7] mfd: qcom-pm8008: Tolerate missing interrupt
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-7-b395d2b3f668@oss.qualcomm.com>
 <e68177a7-f2ef-46ed-a468-15d0d9421d98@oss.qualcomm.com>
 <ddefe6d9-1a75-46f0-9ccb-10766729e04c@oss.qualcomm.com>
 <52b1a1c4-6e04-42b1-b868-2edb132d37d8@oss.qualcomm.com>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <52b1a1c4-6e04-42b1-b868-2edb132d37d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Af-vP0t8t-UPONjS5GdV2yWIVZ-viqhC
X-Authority-Analysis: v=2.4 cv=KLzPn1Fo c=1 sm=1 tr=0 ts=6ae4365d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FUarkfPcEUWQjx1WGoUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyNCBTYWx0ZWRfX02EaWxfXQU6e
 2vkIWvbEmAk33MlGWark0H2Qao+zjVbOHf6zI2xVPFqzKqCu+sKKnXVbJ45OwoEdtmyLj9f1CGq
 uexceoXjPDeQJ0HEFsVWM9rdTID3BklvoH8G3zWazwP/15mygPkhyg687e7tE6IrnWbxsZMdewB
 hmpEke5Vpt1dkkpXNkX/6LGaW59qJkBzhPZmUA77bZfS7JPxrpZ05TzAhhu+724cnXj5e8j/tPA
 tdaLUpR3anJSLbHnI0GJDxDycf7nPNFLBhFKGho5elCmjHuUj1afO3p0QC75JgxtIGiTNHCs1BF
 WUOqi8du78h1IAnMj+N6idi3C9tDfFF6OpOEArjwSNoXZTNBk1N2DEQ1CswHjbRlvlIUuT3yD+E
 kvD++hmn3cyrl65KCtu5koS5Kky7gbCBLMyzhQ6umsb5g/y+VPazwp9n2jL2jnVWYBl45/AACGf
 EjIdyHjVsqNpIH3VVnQ==
X-Proofpoint-ORIG-GUID: Af-vP0t8t-UPONjS5GdV2yWIVZ-viqhC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyNCBTYWx0ZWRfX5iVyKSJ9AFeW
 4HQj/tbMtf5z9dqOnCxO8fklqx9OgIhMDivN4QLpYzX/2jp17UTK4u+WMc6rMh2RdhO2weSij/1
 ZzcQOJjWfFjLOemSO99+Pe2pTDf4Pmc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300024

Hi Konrad,

On 10/26/2026 7:42 PM, Konrad Dybcio wrote:
> On 10/19/26 7:01 AM, Jishnu Prakash wrote:
>> Hi Konrad,
>>
>> On 10/15/2026 5:35 PM, Konrad Dybcio wrote:
>>> On 10/14/26 12:32 PM, Jishnu Prakash wrote:
>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> [...]
> 
>> And another point we should note is, the MFD cell name
>> "qpnp-temp-alarm" used right now does not bind to our temp-alarm
>> driver and this was intentional, as explained by Johan Hovold
>> in his change (mfd: pm8008: Rework to match new DT binding),
>> in the last paragraph of the commit message:
>>
>>     Finally, note that the temperature alarm and GPIO subdrivers need some
>>     minor rework before they can be used with non-SPMI devices like the
>>     PM8008. The temperature alarm MFD cell name specifically uses a "qpnp"
>>     rather than "spmi" prefix to prevent binding until the driver has been
>>     updated.
>>
>> Since these changes are not yet done, we cannot use
>> temp-alarm for PM8008 or PM8010 over I2C for now.
> 
> I read that as one more reason to shave off said diff
> 

If you mean I should simply use the existing MFD cells instead of
adding new no-IRQ cells, that would also not work, because I
added them specifically to address an issue Sashiko found in v1:
https://lore.kernel.org/all/20260918165721.CA17C1F000FF@smtp.kernel.org/.

They are needed to avoid assigning IRQ resources from the MFD
cells when no parent IRQ is present.

Thanks,
Jishnu


> Konrad

