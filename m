Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245713C819D
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 19:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784835592; cv=pass; b=a/85Pn3OK/s2JGeKkmbOYoCnmSRcJ6S2SAb8XDUh8/TGdEiznfX786Mcngy2JAZo0FvGp6W4JS7d1WNDaVRS/GcuU5YAWPRheIdh0uWb6LTdyscUHLu5zCOkt+pIRrzQhjjL9Cx/YcqvRhKxtZSSrINqstRIt7L49naZfkrcdaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784835592; c=relaxed/simple;
	bh=OjmerZlh2Ae0w/xoRAIqaoUMyxV5HsJ41pwEyuiHBsg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XF/ZRwzdyH9Mc9Mi+UQlhx2ypMkiMvqyBTeVHCA49klxXrx+OAaqAyiGxP5UWFGPxJNT8GGISgic1HypuxnwwQbAKDzleJiQQO9RxnBMPsMSUXLq2syJWpZ/X+Kdzw+1mWE8xruNERQM/+3OunAMYNJDLvPaeGLLhnZbxRXt+K0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DYT7e07F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gaIE1ped; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DYT7e07F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gaIE1ped"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NIm2SW681595
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 19:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k7gjuT0+aFniLuCctCVMtzeg
	Qak+FZ7MzxxwdoW/+fw=; b=DYT7e07F7hb6HKcF6rLsSLvkEdUzswrmLe3B1U6+
	5IkwzZGdx1bJrWgoPufsLDZE2P5l3TfGFm16G2CuMXDqf4Eq/ohaQzgnKQ9cJXEQ
	11w79+EX5NBwG5bHHR73GQ/FpJQS4P2dxzhEj7qwq2NYHP2PfvNk1DbmXIXzNPIj
	/ObytEmQmbI1U15aoonSVvYfk/IsyfFyo5QiTbFD3/zGcw85l5VTGFwCzyuzurbW
	WqGdFJfR63jSfvpLemOgFccaGLKuF+BrhD9gfplpsL51ssng/5S6Rf55rDIAMUGp
	8K9xTK+g1NWN7xj8P6/MwB9lZQ/iXdwqwBZzQan/OgU8kg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fknbmhab7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 19:39:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfc52ddc55so253695ad.3
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:39:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784835581; cv=none;
        d=google.com; s=arc-20260327;
        b=TYY8NSbHjMOy8FGn+MQ0pynnKZF4gRPgOpGfirUmzI/3tp90sP/kUSX9+D6LoBQY6+
         r5/7RhD+YQciTkf/FCi8xZK4vJuhl4Hum9mKFZ86wPBUL5IwwZHitJQoSCW6O6VKhnGV
         oDXWmLP06xcIHwfe8ZtUIu95n8rHKyvPZPFFl3tfzGAnNrrSHyTwsfhRncPuR1pPnm//
         YVK5CykkGkr/el0U5NOoxT9AmgiYD2PHwn9DYJsJ+o5O2+4tVREEljkChmuKVNiaufBJ
         R85QaIwVqD5vxX56W1BKXx44zT9ze6MKB7iImlD8+F1G5X2SqWOCFO7rQz8WdICdYmoj
         1wIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=k7gjuT0+aFniLuCctCVMtzegQak+FZ7MzxxwdoW/+fw=;
        fh=DdJvqy39u8T6F4dYW+JO897/UUlUsRAz/Jg6Qlo8RGg=;
        b=P6RnvNRZlVy09AoV8TkY5nqr6KBA5tJw+Ms9aOm5d31zkL1yTm1jQJRCYoq84OsecY
         Kvrdt85JmFtzKi4nCiPht/GxOuQZaR/J4VC9qQkbkHZcNUk92049KHsR+qvoOGlCQG5d
         zQ9TU8rWUxHwCEGqfAOmSum8j7/0HO7D9msT2BiQxWoLrCIR4vicqAjNuWjV2GS5SmhT
         YGHWm9QuUNYKVltpgwuD9qS61IWSw5H/p8vMcVrp+XCLPTAqnDvrqu/LYoDhbw5Z0g6s
         rNjPdFxnvrVSRmoweeNEU1zSjTcCBJBlaIhhMadbyfoWOppsxdbli33HpFnbvokHVxT5
         md0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784835581; x=1785440381; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k7gjuT0+aFniLuCctCVMtzegQak+FZ7MzxxwdoW/+fw=;
        b=gaIE1pedS4aRUGz7B8icVfdQo8WnLNkeo21uw5b3UYqH2QWKcgyicblb0/1t9vl8g3
         N/F2nIFUILxT/+EKjHJS6+7GoUtSTQG5LKawzpG6Ew8J9bftyLeO7qvqX1fJ43zjLbyp
         Hmi6T4vF36X2ENltc6NMiFzTMlum2T/07tJUi8vUKa5A8GVNqD9+v4QVBtz+g2qSOaes
         kaE4iuNfo2QkO7HvhBWMcmPxRmSFXNYjTYdUBEFUn5QXz6MW2WQn7yIyvu8Spb9kd5Wz
         KnZWBHYIA4v+l6/8U5I7lTe4V5LmdDjeIwX7TdYx4YIrZ/DFXLDcgpxPpJO90li+4eyt
         +2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784835581; x=1785440381;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=k7gjuT0+aFniLuCctCVMtzegQak+FZ7MzxxwdoW/+fw=;
        b=GgWnVTyPQZ24rL51yDT/dxcIYIdQSkR20ctw1vaRO+KQC5B0m1UOqCttnvLETqOKfi
         sqqLe8ay6/MN2LlYXAcP+pfUxVCyULpPt6r0eMOC98dPcyRFqocP10Hi5MI8IoS3TZD4
         dX7pSK5I/HFKRx7WDWccMRdSsjL6CmOuddZLk7su2ZVN2cjs2aTdo3Rolnr5tz4QU6QN
         GM/iB9VJLfH2L57es35jEUhH28V2oDiZaDlrmUThhCwf3GBf+B9IqDKkOJHc/YSg1+g/
         CRxF9ADDHnMIA3iBw4XJGcsdHoISnXkUAmvi4Q33bbuzgpyCQjQFpAwWR0QNmo2ljvl8
         Su2g==
X-Forwarded-Encrypted: i=1; AHgh+RpHct7xdCAD47ryn6VIaTbh9Uv7UowBhz7qDskh1dAVA7+Ikp4U6HODeQnuLMy6LqbFHWBC17beHOpm@vger.kernel.org
X-Gm-Message-State: AOJu0YzccYW3svvMsxuimGiNXKmtR3RtbJuv+ZO/WqsbAOhrABwWBy/t
	hpe4HswcOM+Wl9bmFDU8R8p2DVQ7YyU19LUjOW22r1iWUWv16jafxVLsjh2qHvCrIdqLvgtRxAa
	LOmjolFEFh9ZNfKYwX+fWDEB9mu9GNm3KfqWEF0fN7jLNp2USsrCFhow238GM2Zo+TNep73TJrt
	AYrcNkpkbJRQort7gD7M4yb0//gmmS6XlZO4Xwdaw=
X-Gm-Gg: AR+sD12G0j+lrtfNpUCObR4rXHqY5cooGPmvl9KhkMtQPYVbe43vGluEfVLczpztper
	39sniTlkeWin0YRoPwqjt7ivVh54TmpmVZGx69AGqF95JCTzDdD8XkRHOS59eCIf7q2C1Gb+jWt
	F3dJq6mczZDd2FUjfN+FXe1NbeD1OpG7CkJmk8XRwnNQBaLGi5nSc+GJFT
X-Received: by 2002:a17:902:f642:b0:2c9:c517:d078 with SMTP id d9443c01a7336-2cfa6c7884bmr52774135ad.36.1784835580620;
        Thu, 23 Jul 2026 12:39:40 -0700 (PDT)
X-Received: by 2002:a17:902:f642:b0:2c9:c517:d078 with SMTP id
 d9443c01a7336-2cfa6c7884bmr52773955ad.36.1784835580214; Thu, 23 Jul 2026
 12:39:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721-drop-sound-storm-v1-0-23ae4a689ffe@oss.qualcomm.com>
 <20260721-drop-sound-storm-v1-1-23ae4a689ffe@oss.qualcomm.com>
 <85f2799d-fadf-478d-9f3f-fb8ff91ba84d@oss.qualcomm.com> <6a609d87.87c5160c.1accad.0f33@mx.google.com>
 <CAO9ioeUw4QgW47xmC58dGc1_j2UPFjDM+dDRF-bggpBPFA32YQ@mail.gmail.com>
 <6a625f94.4d70c427.b2b96.9b5b@mx.google.com> <5o4nyr5iycpgopeo5dllygtndbp24g5ejqvh43d3mxwnxufork@zds6b6aqvcqf>
 <a6f86d96-48bd-48e6-9306-159b17380ff8@sirena.org.uk>
In-Reply-To: <a6f86d96-48bd-48e6-9306-159b17380ff8@sirena.org.uk>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 22:39:28 +0300
X-Gm-Features: AUfX_mxHE1J6imuCX4kEX4NevKVebUAQ8I-BHSXEMNlUFDgV1mwWb5gbYYJ9FqY
Message-ID: <CAO9ioeX9LjGLwKGFj5W0Gwh8X8_+E1e81Wb36vAHHzg2ZDf32Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: qcom: remove ipq806x Storm machine driver
To: Mark Brown <broonie@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=e742j6p/ c=1 sm=1 tr=0 ts=6a626dfd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=7tSWEDlCfLhq9vGkEV8A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: Rdwcsq3PZOhrHpeygIcWbEAP81hZ_xT4
X-Proofpoint-GUID: Rdwcsq3PZOhrHpeygIcWbEAP81hZ_xT4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE5MSBTYWx0ZWRfX3BX3VfVMc1mp
 lBjgXpG2fXLbYeC5eoPxMQ1CoRvwnIBu6BQO25g6bob2rZBuJPMc/ltsCkR18tvNPLEKdXr+Tna
 NvpqeXVgMBhsiZR79FiDt+3USAPIIao=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE5MSBTYWx0ZWRfX4rlJl0QHIiZ3
 WsGv0eJHm3ZnA41wpustsZlA8kqUeRqJettAfTmagGnTkCxyYhLGBptIFnsBuy4+S677zXtHrDI
 ETKnr0MrSq7AzcXQvK1Zb4e/JMiwK6RGXu1/CuHMB/AaaiGFAxteex0AfH9ckorS0fI+KQatdBM
 XpbS2RQi2H7jZnHjIMl9rkRR9vtAlKaoXSbCvHNA+PyggZJMJkb+qJI5GPMNPbBAV2zMrwWCSEo
 MzOSn75Dg4iai2amH1UdHMkrM6MvxX6o1qYu5fGIQkjASuU+risp00kYzk0NIWT0ZOsPHcnqXYd
 55d4ELyzbim386cQqfu8c9UEmyAxHJCQC5KcLjcLj1+iVm22QBj8Y7d0nNJq9i13BP7U8V0oPcx
 3DT/V+/Y7x1WUKktCXGchvSAmvsQUASf8AxTi4vt/3ZP0Gs3+b8ahVMm3Jo/VdgFFb9hzM1h8PU
 FrJKdnCdD3XzCoWm0oA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_06,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230191

On Thu, 23 Jul 2026 at 22:24, Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Jul 23, 2026 at 10:18:47PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Jul 23, 2026 at 08:38:09PM +0200, Christian Marangi wrote:
>
> > > Yes on OpenWrt we support 3 OnHub google devices from Asus and Tplink and
> > > they also use the storm driver for the strange attached speaker.
>
> > Ack. Then pretty please, could the OpenWrt community please contribute
> > those to the mainline. It is a quest and a process, but it helps us to
> > understand actual hardware users.  Not to mention that getting platforms
> > support upstream would lower the burden of rebasing on the new upstream
> > kernels (assuming that you are using close-to-upstream kernel) and it
> > would also save from similar cleanup attempts.
>
> So should I drop this series for now then?

Yes, please. The driver is being used.

-- 
With best wishes
Dmitry
