Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B576E41227D
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 12:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783687678; cv=none; b=LNjllEIpNldjYw+Hr8YNEd5UNuYS4AiZo48cMOAsiHp1w6frDmzYFah2K+VK84MklsD1NFgxTeg5Kc44mJkkAtMcEbSO+n3T/L8zvqveKgVypgV1ODO+d3Jv8HsXJ0CYZAMKF007cNCnqwL5ym6sCJDphGag3Em3QRHLMZDX99I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783687678; c=relaxed/simple;
	bh=BiV1y0ypbEQQXL3PVPRSFT6rBm4K9z5z5htZQHPWnaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=frqGPPWRKPYZRuJw1krdE/IPRjqxf+QrjKn36SDt2SZ5qJ3X6mAHHFSvKHfxkEdW2thSOj/WBBUAAlQhr+N3czgeiYX9Y6U5+Fv87h05G3gRnX1vuH2pZSndLXJZvyL5lvdgzeo5tbijPJlWAnrxtTS+OJv7C8AblTqtWwkpfOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oetCEnQV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ktn2PUx4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oetCEnQV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ktn2PUx4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AAmqXE521184
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 12:47:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sGJdPaZpaHpOQoeJ0zgl3SrG4m4qWzrVvBI3N5THHrs=; b=oetCEnQVSWKZ57+p
	XKlGiyzMK9HUX5QNJisOVpwaykPg8ovfs4uI1toO+cGFhgy5vhJRXUZpWhEzCZAw
	14l+Oamwq7tlE8pCDhwuu2nMd0y6m3I9DZxXD6vvZpuhAYbpugKgyaBq80tojzJj
	LhsSlIGBWvdRH3ImiinOfjs5oQ0n3GBDnYMLUlToJ5El5jBtXfqt+hu05EsWQMzF
	fxRq5bwL75GFRPGefwM59SAf7GsUiK1L2yv2ank8aJYZjEIr1wMwvAgojS+gGBoV
	DwRdsazeYb2QLYQW/mteG4Hy29GX+ths6TolNJV7w/TlwyAbfPC3az891e3fhmK4
	VDC4uw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fadvjcpq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 12:47:55 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-744e806f474so212914137.3
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 05:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783687675; x=1784292475; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sGJdPaZpaHpOQoeJ0zgl3SrG4m4qWzrVvBI3N5THHrs=;
        b=ktn2PUx4KlTyN4aBhlaJQgVv58RLjNNXLufvmD8ib6Svuj+Yrk+M2mvrk4a4GXw0nT
         kCdmKp9jf1E9S2RjDj5hoFZk3zw+gXN/s4cz933dNb5sQyQ0iedkheoPn3tYjvYwIMOQ
         CzQvRLz/uZeXcnEh0Sx9KK+t2f8QNjn9Uqas7CzT7H3K2ZqSdx+BpPvLIpCpAdGqjJ6u
         z1VOWYZVfYW+y0Aj2hZBA0iywBSFh9XAGOaV6Wz7C2OdbTfoAj4ouqxd5bkEmPw7eAdD
         Y1kj3Ou1naYi36MBREHSBS+radRAo1TaRIZ7lco45YIN/xCIhv9PzgOxoliGQJKvsdUN
         oZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783687675; x=1784292475;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sGJdPaZpaHpOQoeJ0zgl3SrG4m4qWzrVvBI3N5THHrs=;
        b=R25U9lZ7es/u3LZV8IHH4ajADFLQaEhemxdYYI2KpjB8n3gso2yYTe5BE+rJhD5C2y
         pv6hNpC6+cjn9wPVt/9gLaJo7/uml4IVKJ/AWcVYlO4F3NG8rLEK4ItbQjAo6bOcpTdq
         qsFM6tn1c3pkzAcIICJJ4dvjnrw3raulPD8sq8WqSZ48u/JLfND1o/FeKdXUBD12W41t
         SBthxWg8ba0Zc1UU+PGvRug1ykI5NoLH6OlXe10dClnSa4grhhOKPbZfsSFK7XxmAOTl
         k1PPKhlTNivodRkMH01UxUktSDmlrOCm7CvF6C49y/ZNMPXsuWwS9y43Fz+6pweUkzWv
         mmPw==
X-Forwarded-Encrypted: i=1; AHgh+RrdLTJmrfKWtQavc5xgTThNFbtuzjqDJKPFzkIjK0XvhJ49P9cUjSdktYWk7b/iRqZzvYhIrMzN+s4M@vger.kernel.org
X-Gm-Message-State: AOJu0YzKU3kAbFhr9xk1Z8ruBLELJ/MwPHn3mw7YAQlRK/4w4uYveO6D
	/y1JXGWmoQ8+pKVKW2koABL7RkKajmeXXy/RjSQCaBSZ7sVkZkvR21QESzLHS5ni+yS306EwpE3
	WKSI5TfkC6MKgq05SIusPc1gh3Jz/YVeVexRQlISPUrHx2aAMmasLGBRwuk0IAy1x
X-Gm-Gg: AfdE7cmFCtyG0uxv+p8pn6nhhcf3M74zpniiwexdYoZnlQL0+PKTUu7ICJRYe/1y5DF
	maEHbrgBr1phQjQMq/lwk2qbdQ/AuA4X1434y7B69zXGEjS2Wv1nQCiu+JMPVF2wr2otr4hirfc
	0wg4nohnCrLwNWphCe1lbMhygLxbSkzxcKf8YuEK53GUK8AyrMaGp0hzpV0PIkI4FnZT3u2hyBR
	ZwnvUInWmRgkU4bfFn+jXJuo9tPljz2vkacTMeouKj/+5AlosA4PFGWnIzZUYvRqFweNPxybz1d
	br9QMlObFAgjCM+OffxFpVGu3sXgf/x7SUQ875zyGNlvOv5mNFi9fL3qmagQNTvD9pj0rn7+FVo
	A96gcPEqyagD8COmQ7Cn2Q/3z2Wd4HknEr17H81Oe35PyyRt2hbapL26UvpYuzaOOk8CBWCN0x+
	Yng+qXCaUAdYUOryMk81IjGupZ
X-Received: by 2002:a05:6102:8019:b0:744:dc62:55ae with SMTP id ada2fe7eead31-744e00d15d0mr6760352137.16.1783687674953;
        Fri, 10 Jul 2026 05:47:54 -0700 (PDT)
X-Received: by 2002:a05:6102:8019:b0:744:dc62:55ae with SMTP id ada2fe7eead31-744e00d15d0mr6760341137.16.1783687674460;
        Fri, 10 Jul 2026 05:47:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84b84954sm9133221fa.23.2026.07.10.05.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 05:47:53 -0700 (PDT)
Date: Fri, 10 Jul 2026 15:47:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
Message-ID: <6tli6ulvne6wutgekr3c3knjagsd2ththgoej4ymh7i63ldzsz@4wcy2pod4bzd>
References: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
 <20260706-shikra-dt-changes-v2-2-56fcd1659ea4@oss.qualcomm.com>
 <8a3cc857-0b1c-4bd5-a5ce-a564823ca614@oss.qualcomm.com>
 <ec5017a5-8af7-433c-a011-9ad7c6cd33b7@oss.qualcomm.com>
 <6f8d8cf5-1e35-4d45-b2c1-6f36ac51ad4a@oss.qualcomm.com>
 <d7322cb1-1c8f-4c81-a3c0-638d60b53230@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d7322cb1-1c8f-4c81-a3c0-638d60b53230@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEyNiBTYWx0ZWRfX2x8mcyiYoAv4
 wLzDGQPVoTMfj4U0JbBlSY6OZVwaM+wpWl7qMQteW+056A9ubCCvH9YmuGBTN0UBB65SyaVcRO1
 8phk7Pxs968GnHBS16FaSAO8EBCbhimC2aR43UZfIQ5XXk0Hl/il0n4wD0aKOQ00ashlh1lVAX9
 wjcigFlGmTcCumOX0vpdc2QFb9peDnfwNuz8m7uoHqsfs16X0JcgNzEXUOt/03sTpRMAZGnHD64
 q9BlIfDG0cr2OIMr9qAqwPD367a6Nf41jKCkEoaz0qcDykLLGRYlbpUrVgTIqavrepugadsWj8b
 4utWqNv//nt6vFGjE++5DUOV7ekSI3D6s+x8T+M5K+9/YBC149DoLkZyW082xO5Wz6iGpe8ObeZ
 bpWG3vbHFpBToqUekxesO3Cc6VQF+OMbF31HqukRJ6rXkG8qw4G16ZIAtrbm5QIZ/8YYI6HPvFs
 ecayp6YVTvo9G2PdUBg==
X-Authority-Analysis: v=2.4 cv=WpIb99fv c=1 sm=1 tr=0 ts=6a50e9fb cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=G0HjAHWLGnXFZXo3PwQA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: Q5vi95ECycl0kNrpFwyPimvqNL8YF3Av
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEyNiBTYWx0ZWRfX5Gng3uzeDPlo
 Q30bXjClajXmWgN6frNNgJg2da+CCC1/hxtpAH+bTu+r8lXC5g5Cn1/RVC9hh64c+RAbivTct9p
 /Su3i6NpXcMq8S3pgXRpfxt9IaDMK9I=
X-Proofpoint-ORIG-GUID: Q5vi95ECycl0kNrpFwyPimvqNL8YF3Av
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100126

On Fri, Jul 10, 2026 at 02:10:48PM +0200, Konrad Dybcio wrote:
> On 7/10/26 1:58 PM, Arpit Saini wrote:
> > Hi Konrad,
> > 
> > On 7/10/2026 2:31 PM, Arpit Saini wrote:
> >> Hi Konrad,
> >>
> >> On 7/6/2026 3:33 PM, Konrad Dybcio wrote:
> >>> On 7/6/26 8:04 AM, Nabige Aala wrote:
> >>>> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
> 
> [...]
> 
> >>>> +    panel_bl_en_suspend: panel-bl-en-suspend-state {
> >>>> +        pins = "gpio91";
> >>>> +        function = "gpio";
> >>>> +        drive-strength = <2>;
> >>>> +        bias-pull-down;
> >>>> +        output-low;
> >>>> +    };
> >>> output-foo isn't necessary, the panel driver will assert it as
> >>> necessary
> >>>
> >>> Konrad
> >>
> >> Ack, thanks for pointing out.
> >>
> >> Arpit
> >>
> > I just checked,
> > 
> > Normally the backlight EN pin is controlled by a backlight driver.
> > 
> > However, this panel uses MIPI DCS based backlight control with no
> > 
> > separate backlight driver. Since there is no driver to assert gpio91,
> > 
> > we control it via the panel's pinctrl default state..
> > 
> > So this is platform specific pin , we need this to enable/disable
> > 
> > the backlight.
> 
> Why would the backlight state be so tightly defined by the panel?
> Disabling or adjusting the backlight level without shutting down
> the panel is a perfectly valid use case.
> 
> Take a look at pwm-backlight or gpio-backlight.

This one is different. The backlight is controlled over the DSI link. In
this case there is no separate driver for the backlight, the panel
driver handles it (it needs to be like this for multiple reasons).

-- 
With best wishes
Dmitry
