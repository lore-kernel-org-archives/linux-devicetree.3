Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3453546D9
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784725814; cv=none; b=UWBjj/ABzgH39Ic3RD2X3buiST/OAga6tZda4aAMsGTG5nx3jK7RfEorGGBo5xUt4WteAHmqdq04MvnKzCvHR+3fuLilVHz2c0i9OYjfmnResRWzbUivG6B5YcIV6KU+4JlgYI6k6AWqZ9qNuhv25IOPonASB4TW4+qxINlkvdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784725814; c=relaxed/simple;
	bh=7MJ5UPF4tQvjhvsGryXA/aiYizT4ABPo0f4jp6C/AQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QisS7YNFmYhiIlETl5gEwaccyKHLwVlfXbw5fjsF8hGH6mhBO0IbGCCAmuQ7le61+L3PX5H4A//yTp9ERojZ447H+doHR7XV28AITeoxs012uVivRGTGboVOHzlvQRLDINde/l7rs8dMN3sfiZIzV7G4bJ5wtk2R9FQrjiHBkt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S+STcdU7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NLvTUizn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S+STcdU7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NLvTUizn"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MD1mjC695637
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SH+iOr9VuSSMvrjo/satf2ls
	w9FO1OXQdxI/1IIL5Oc=; b=S+STcdU79qwv0OfY3d5ZM8TO33o4S2OAgCI+6txU
	Ak8kbJxiMW61QI553UlPAQd6Gsi5L1+5m7c04Z7KmxPsMz4jTzGXjrD7yTnyYsK7
	hsMOk+NY9N9g5Q/2zlb9vXFs6Z/GFJChcAfwxFrH/YziFnH1KxopwsIeuZwzYxul
	HWkN/NrlB621W3Gq/yH9STjWs3bpAO2flFlWjjmPE+FlMycLgaOfoPHeKtogNxgt
	2bbJOKGInWxg+J0BbK/+HNO2obgUUEn0XaulcXeP3554dkMPkOfKvbc+xmK/8BPB
	XepngVE1l81cDpJSKVjIDbuvDZYmsZOsD87hPEJE+Mzzbw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjtn2s1rr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:10:11 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73c040cc990so3688761137.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 06:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784725811; x=1785330611; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SH+iOr9VuSSMvrjo/satf2lsw9FO1OXQdxI/1IIL5Oc=;
        b=NLvTUiznGjPVkwNHEqKKzoOVecugCDqm6kRfGo2nr/T9J7Yvacx2Xme38NhL6kLi2L
         Uyk2G4iAWxoLQ8b5O2/YzmK7KgQ3owkz4KiLq1wwu18SDMquqUmwx2z2AL6ChBzGH1Vf
         dw5BikNrWawfRBF2pJ/1VD7GCHKgeicEfr/B0Ebt6/NMtvvQbRw8NyCrj45ZVPXPuCFZ
         EZSURF+DC7i3AKegZeUpzCVPGInduZwX5RWYFtAGwQnWAoXcUTBP62eedg5luUuj9sgf
         rg5Zg9nrzNFfK/L7lyvO097PF3nHVrF764B9Xq5iyH9S4EQXAHzNjVI0K4YNiLZmifB8
         vilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784725811; x=1785330611;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SH+iOr9VuSSMvrjo/satf2lsw9FO1OXQdxI/1IIL5Oc=;
        b=R/+YFpR0yAQjtnpZUZQZ6IbNpY8B9+HzFQkBxHgmS6J4uEeCGzWczLFFPb6pX1SJOS
         k4PzfDt8SH3l9jqe8A2qkqdy79M21lZ+cPF6o3g7gLM+NhhIXNo4z/RiQkwUr/4+ZS2p
         4lmLFiH4yRQ2zvgGYwaATH9ERJMm2jTQ8O0rIBXgjtPQzjGrz2ihaIhNyoTSFlRVgFcx
         hW3lanblDQHj3dDxcr1uFuSceqwB80s26HnI5eLpLM/XOK2BzNrsJ819aX4DfqWYGEEo
         rpAJ/QWHMgVK5O24PNQAqAXFlnoMl5iNQCU/m4G1/ofVjh9j3ZPXS/cMoZR99K6FSGWj
         jzyA==
X-Forwarded-Encrypted: i=1; AHgh+RpEdPEzdWyb2BLABHDuaHU2CKqskFXODRY9SdgbSZ/liEry0P6pm6Un4sH4AWMpSlqpscY/clY3aBiu@vger.kernel.org
X-Gm-Message-State: AOJu0YyKTvuQ04gc/D1RRT5GdDUY45GXhGjeBHRdozLvxJ23ZjwY5xHq
	ZbznCiFkrvSlOByx/2oReSme9X74DbpPXx/txysYdQF8XIpzfGkJgTWdguzsiSZJoY3jnEmDFfX
	dCUoAL7OtCv0O48uA+Hd6ovmBe7iN/RMUfyz1YkELcfbZwiEjjLzeG/huTVpq9gro
X-Gm-Gg: AR+sD10iGn4auvD1MQD0A/2yoXw67SvTbrI/xfr16H2fCsLIUTKR+cdjfDxgmET8Rvf
	m4bfFqBpyhr+Ugkp+RUBUHl0ycWBh5nNNnB0MjbqYxJE92sizZUFmZB1Pud2K+NYQ6lrQA/yRl+
	UN/5HMXJ90LauqwKBwjEPCzKZHsXOOwC+EFC1P61zEMMFcOQ1PFNCz1R/IOVExVC51SCl3qXCv8
	TJmFtvm+tqLA0o4f3m57YLbvLdqirNhy7m8km2Vm6pzw5cfQJMJDwjet7aM6GV8V58dbRUEgYbK
	tmKx7Tm0WAFTWmGiJflrvwcGsUJ0dut4FPPASWyWshkDoTnlbKQATYhk3ZyeR5kXeMzVk1cY9cN
	p+W9V9NdtDCmu5n5stO09Av69RnlQkX321sgPrJNGDgE1dHIgqTcZw1nHt5lGLKr3BhR4VJ/8U2
	5SPceziXE2oBkslg==
X-Received: by 2002:a05:6102:418f:b0:639:43f5:1fdc with SMTP id ada2fe7eead31-7475374cd1dmr7128418137.26.1784725810655;
        Wed, 22 Jul 2026 06:10:10 -0700 (PDT)
X-Received: by 2002:a05:6102:418f:b0:639:43f5:1fdc with SMTP id ada2fe7eead31-7475374cd1dmr7128398137.26.1784725810192;
        Wed, 22 Jul 2026 06:10:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6d8c40fsm4249741fa.41.2026.07.22.06.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:10:08 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:10:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: eliza: Describe the CDSP
 remoteproc
Message-ID: <sypbfhwfovwwwg4hx6loyqocq5h56vg3v37iklvj5h4bdxnov7@hgtrnd2byond>
References: <20260721-dts-qcom-eliza-add-cdsp-v2-0-e1e52bfb3c12@oss.qualcomm.com>
 <20260721-dts-qcom-eliza-add-cdsp-v2-1-e1e52bfb3c12@oss.qualcomm.com>
 <33arw44e5cnz3ui54f442rkgu4smczb4fwuyiouxo4lvne3v7e@t2tl3fsq3cxf>
 <gyjvnu2mljqdvwn55z42tjrvtmz2nrqrsxi6rclsk2ubnehnw7@wwm257efnqyg>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gyjvnu2mljqdvwn55z42tjrvtmz2nrqrsxi6rclsk2ubnehnw7@wwm257efnqyg>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEyOCBTYWx0ZWRfX1bm8Gjb88AtI
 sP2F9Ad3K1Y7Q8ehpuWOQy8Xl/+i2bn9em45s6tYw7rM0M3yUSh7oHKuRaBtDORKCHT2vN6E2XJ
 Kes+OC2aI6EiQoJ7ZP9P4i5JhRyiW8+sF21J21VCd4TBLpjrPHzBU7NDzokDkDRBRJRhgRM0Y/0
 8p98/CCdYPsq3O7PnSYpdpGUttsL9i/4AqG9SArIxK1pFl40t5rIyz07PolxLWweNU3e2f2/8qp
 sQbOV0BrXQTG5GZksuvY9veZ76hOzfyRbNvNSCGCZ9I/HpwfTYhslOXRa+RdR/2LSuUk4E99KUl
 XcMI23zp6hjp0DIEEbeD9AHiWfkH4PBEd1LCSHlzoREeUB+EU2lt7l6Fl0zY6+39VrY9iyuua5+
 j0cNYOAoUhiiD56SGMqodO3GZ11yfMOHCtIbxhF7FQGKcXoqs7yen3sLFrv5mMM1i6Qevoqet1A
 LFQI6EG52aorzcxFnqw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEyOCBTYWx0ZWRfX/atikE97d3v7
 DhmjPbOo/Pqpsno1qT9XHTLfrGH1feL6rOuo/tHk+9RqE/BdvyZv0RxA9mvhcOEkhmONHymyDbD
 VivH5W0MtEkHDakrhPx9SLt/ssUqX8s=
X-Proofpoint-GUID: QS0EnR-0dcTSoG679ppKfHhoYeVU42r2
X-Proofpoint-ORIG-GUID: QS0EnR-0dcTSoG679ppKfHhoYeVU42r2
X-Authority-Analysis: v=2.4 cv=T+28ifKQ c=1 sm=1 tr=0 ts=6a60c133 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=fGCyMEVNY4hdu2JpfHgA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220128

On Wed, Jul 22, 2026 at 02:01:27PM +0300, Abel Vesa wrote:
> On 26-07-22 01:30:27, Dmitry Baryshkov wrote:
> > On Tue, Jul 21, 2026 at 11:25:48AM +0300, Abel Vesa wrote:
> > > Describe the CDSP remoteproc along with the related SMP2P.
> > 
> > Why is there no glink-edge / FastRPC? They might be not yet supported,
> > but please mention it in the commit message. GLINK should probably work.
> 
> I'll include the glink-edge in this patch.
> 
> The FastPRC was sent separately, later, because it wasn't tested in time
> to be sent together. Mentioned here:
> https://lore.kernel.org/all/20260721-dts-qcom-eliza-add-fastrpc-v1-1-cbea68d8e01b@oss.qualcomm.com/
> 
> I don't think commit message should talk about future work though.


I would not 100% agree here. It simplifies work of the reviewers. If I
see a DSP w/o glink or FastRPC, I need to think why it is not present.
Is it something which doesn't have GLINK support? Or are there any other
issues? While stating that abc will be done later saves us from those
questions.

For me it's similar to the USB support. It's not infrequent to get only
host or only peripheral supported in the first patch. But the commit
message needs to specify if it's a hardware limitation, a software
limiation or something which wasn't done yet.

-- 
With best wishes
Dmitry
