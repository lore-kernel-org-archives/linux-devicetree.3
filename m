Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2F33B8959
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 17:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774285543; cv=none; b=NOtvQIt3eDbCDx+Wn6x/vGzGQHERxYJT6ApaTdLdr1Ncgadvt0HGYyaJFEULw5ubhWL7CxnWEXSVdLATsuJqmkAdZ6T2ddBZMf5HZBRNs9yCtx022ROeY19rPNtQP3LgH3MwbGtpdOEvm1Ckmn0VPfldkVt/FDjhjwCYgpgWMvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774285543; c=relaxed/simple;
	bh=8G0K0/rTswwjMtz3qkNEDxVdQ1vnR3it33z+PjIlQHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oj7smn/E0pEd6BZMhR2qDel+HJ3mg+6pcjlE1yzyuxq3lKJC3MP+o/bNQHJM0a2WGdjm4xpxWIz/5+pwvkiNyxJbEqIdvRVk7W8BJhtDHw5pAcuZ9koRK/SEm5uBpnsgs8BZwhNrts8twKVtvYSyZ/17WTrh1EFWuiFfkmoberM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y4ndnKk6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CB3miboz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y4ndnKk6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CB3miboz"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFGXx02627195
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 17:05:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=twk35D0p9dZpOL13Q8MIfcI5
	8+PpT9w6ZoYUO9ckglM=; b=Y4ndnKk6bzgPxwbynX79MYyin0LlpLxTnyrDosDk
	pRx9aEP5AMZzhZF9r0vabFEtk4MVJo7GTz79UqwQv9ZNAg8EB5yEBXoxYXm9vx8S
	hEeDYbSQHV586WdTAnEqDkGACF9VKmQxmut1Z2ZdrnKko5C12Su0tiBXzDynoWmx
	qzafefppbSg6lPSsKD6PYUZdZMqRpHhOFDAneq5scIOvitPLpmYMJ54UwA9cJu/S
	Mm11fQ2YcgbW1I5tlBG6TS5+gFjrOU2PGz6WNN7n8rmRrl+uHVsqj5CuUsf/yVaT
	+1/DRJdAn9RCOreogvOe2W7U46aspgfcYkGKVu/1a9r0mw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc1yha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 17:05:41 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56aa6d6bb5bso3513769e0c.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774285540; x=1774890340; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=twk35D0p9dZpOL13Q8MIfcI58+PpT9w6ZoYUO9ckglM=;
        b=CB3miboz6pnQ3OeDgT78EAjFO/EcgrNbarBko+SlVLpARHLiCz8a2/uweCoqU89rBU
         gtaTft0EG5aF0g4ARHcBrJWA2VY8EYAW7asbYQM3PrpYeYYehvnUh+tBHCOHgzjruQuS
         cQe0wwZkI65InVCnoQ4NsV1ggzbvq1zxvZFSdgiz5sfZBRcqRIUBTVmHCFZQ6Wdst+fJ
         6jxsnihEFtMkxmycxVCr9UZZQ2BzMqfIyjrIRaiPwmlzHjqv/Hh0bveH73b1qcJBlGrj
         MBh7UydFODhH9lJelpIDvkD3FwcMtvot9zkybKZGsqxg6z+WQnc1RtJDTMLqhTIZQmFf
         MHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774285540; x=1774890340;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=twk35D0p9dZpOL13Q8MIfcI58+PpT9w6ZoYUO9ckglM=;
        b=HlasjrfmItXZH/qzadUPYEUYpmRYS2KTHcFxr6GEvMTVmBeJWi8ypCwF16xXuFET47
         kZ5S6NS+5cRmSGvtQ3uMgsF+vPx29LuXcE+qqFcLSKjhaU+Zu7mcHbhVUbKpfNjZr/R9
         4TCkKrTmQxOxyZ3wX6C34BnbXruj7mulZBNVtdSYUDrgT/xUBwFdtbZ0QRZ8jZ7SFC00
         9FKmQGuTMIFebUbJkAd3mL2nugKQAj5+AMgn9TVg/H8wdSuS1gsx8VNZK0FudHzbJexB
         tZbZG3ravXhwR6TfI0CH18/jouI3wvEi5AqOV0fIqbqDFtoaMZNKvz4N7jv/ViT5D5gy
         oQww==
X-Forwarded-Encrypted: i=1; AJvYcCXwviQ8uVEpui2PQ4LRHcz0fZpZE8HikxeZSYElNtFIcJwkOifTEYoLLyUJgwRH9iIA+yuMxdAlEDEG@vger.kernel.org
X-Gm-Message-State: AOJu0YzitrISw7RmyoYXWF+GdacqI0FNra8RTqutrh6cVYJztwSuHEm7
	mm8jjky8yzNAoCS1/BmvRMJQzUFsUa+ecfR1snOwEn1oZU/75VIOiL6/ml9BXNDw9NBOD78Zlhc
	L5fSjh49LvRI0jZlNI+nS15CfbUkQRRUqkUALMDJx9fJ99c1c2fy30cTSnUgnlOtS
X-Gm-Gg: ATEYQzwym0/x/7WeJLRVPQkYYn/IaD/5cMycivkgs6H2Mf3Ko10BzyjNeV6j3CHVxE0
	5SjeLYti2oBYQXyKw9I0bgChGKALlBRxYYmrPMHXSs2mYtY0GwXPYwi96bhQfUWau2JFHFAeb1r
	1avcbBWULDLaZU3Y6TUvYiTPYs1VLkKTs0tl9PSQjV46HgFr5071MT/ZTnRPmf6Oitxv8hirhW+
	LA+o3GaDiSjka9//tHINImnWVzsL0BDKyGXT/j5aAuKWIwPlGXWB68bSww1u1MEV7EL/1/JxzMw
	h4Jmzh4qcjTaS9tSxhRet3f7UZ2VIUQiTQPRsDSLFRWiRhXL0vIy1+RWMElDpDODypcyTgeXK5W
	2sIXxXLtd+y6MfuRSglfH1zle8yUSlPJg87fneOPLe5wApdUnkXA+6EiUuaBAgiNHG7pwsUy/ie
	lnljxaO8cy/bA6wdS8XMuP2kA7e/ebgZ2Xa2g=
X-Received: by 2002:a05:6122:e251:b0:56b:5893:d051 with SMTP id 71dfb90a1353d-56cde437244mr6064727e0c.13.1774285540265;
        Mon, 23 Mar 2026 10:05:40 -0700 (PDT)
X-Received: by 2002:a05:6122:e251:b0:56b:5893:d051 with SMTP id 71dfb90a1353d-56cde437244mr6064665e0c.13.1774285539828;
        Mon, 23 Mar 2026 10:05:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285206f68sm2546288e87.52.2026.03.23.10.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 10:05:37 -0700 (PDT)
Date: Mon, 23 Mar 2026 19:05:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Aleksandrs Vinarskis <alex@vinarskis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, laurentiu.tudor1@dell.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-dell-xps13-9345: enable
 onboard accelerometers
Message-ID: <l3cfeezstqrabhgba2xnzciztfwp6ijunzemlb5uanpxhgmscu@kh3jdcc2dhbj>
References: <20260228-dell-xps-9345-accel-v1-1-daf9e3b3b5ee@vinarskis.com>
 <630bcc07-5290-4099-bdf3-b7e37105619f@oss.qualcomm.com>
 <kFzSXZV8ReVKN_rvfVDZw9pOzHeLI1ia9bepKas6qG-7G4WiRKk1RcvEhMnPrKrFDvRzLMUSIZgnDY5oerb7kdSBreCjnxJEdPZG9iyYp9o=@vinarskis.com>
 <0ed387b7-c4ed-41e7-bccb-eb1a96064c69@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ed387b7-c4ed-41e7-bccb-eb1a96064c69@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c172e5 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Ey-UEif9ZV65Nm3MetkA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: XmGAoyOHbevRkN10hyy6eEVGfkwCVjq4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEyNiBTYWx0ZWRfX/6lK3xMCuU97
 L9N9ZrdieNf6OwrdQrajBGckQ6cxE1J/VOCYLLmBqfRTIo5Rb5Ql8T/A8BzcZ99rbnoaUd0jUmq
 5+M3yY/y//o39JUEbhTQApLJQYa+KWvaA1zOU6Js8eeoqxKq2izKKXQyhuBiBAV+SGuNHRUp5n7
 rUQKWT/ss+FfilsbciRoFpJ+Y6GLLBZCrWrwSb3wheEZiFkSlPJ57dT+6W9pivx+v2oKuYk2tFX
 c7G2DpKsYyBRZ95BUZ/gBqMHHOWqswukKU1tfR6ZFBc0zCLyQ2TwtgVjf8hF/RleQZQD66yPky8
 ijNXSYxa3fi9vQs4GBxFixwnOnNlYwLFvLkHPHrgKRhzOAxM0uupb4QOnt2x56AXvtcfAWnZENu
 kqhI6XKFpcqz5lw5TtqUfqiecyvj3rlYhBf7ZQqdQvAYu16ZZXn2o+ZYfgQbInPEpFYdKCePNyX
 IJVuBeV/Rclv+4ocQyA==
X-Proofpoint-ORIG-GUID: XmGAoyOHbevRkN10hyy6eEVGfkwCVjq4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230126

On Mon, Mar 23, 2026 at 04:06:53PM +0100, Konrad Dybcio wrote:
> On 3/2/26 2:25 PM, Aleksandrs Vinarskis wrote:
> > 
> > On Monday, March 2nd, 2026 at 13:14, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> > 
> >> On 2/28/26 6:46 PM, Aleksandrs Vinarskis wrote:
> >>> Particular laptop comes with two sets of sensors:
> >>> 1. Motherboard: accelerometer
> >>> 2. Display/Camera module: accelerometer, ambient ligth (and more)
> >>>    sensor
> >>>
> >>> Define both i2c busses (bitbanged), sensors and respective rotation
> >>> matrices.
> >>
> >> These GPIOs correspond to ADSP/SSC-bound QUPs. It may be that you're
> >> poking at the same bus as the DSP is, concurrently.
> > 
> > Indeed, Val already pointed out that there is hexagonrpcd to access
> > sensors behind Sensor Core from DSP. I found corresponding .json sensor
> > files in Windows for all x3 sensors, but could not make it work yet.
> > 
> > Without these additional things in userspace it does not cause any
> > conflicts: I've been using this for a week now, no i2c communication
> > issues and device orientation information is present.
> > 
> > The question is then if we want to keep this series which ignores DSP
> > capabilities with the advantage that it will work for everyone with
> > the new kernel vs doing it 'correct' way over DSP which requires
> > additional json (and binary blobs?) and userpsace configuration,
> > meaning that most users will never have these sensors?
> 
> I don't know what's the endgame for sensors. Maybe +Dmitry knows whether
> there's any action on that point.
> 
> Going through the DSP allows you to keep aggregating the data at close
> to no power cost (""low power island""), notably without waking up the
> CPUs if there's no other work. That, plus I'm somewhat skeptical about
> going behind its back, since it may be that a firmware update or some
> other trigger makes it start trying to communicate with them.

The sensors story would require DSP libraries matching the firmware,
sensors descriptions and several still-closed-source libraries to work.
There is an open-source libssc project, but I don't know if anybody has
tested it on this platform (and it will still require DSP libs to
function).

> 
> But I'm not 100% against this either

I guess it is a necessary evil until we get libssc to work on it.

-- 
With best wishes
Dmitry
