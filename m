Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098636;
	b=W54fPKnin8J8xM3QKRt3Vti29Bw3YSwOQqPE+VPxHcAOEWgz3Vh17bp97+riccN4p1/M
	 Y77f2mEZpXQkB15UkuHk7qNrVo3TcHzBQJahvFzZ/zfhT1O6/dWfO3jv9Nxu+c9f69uQJ
	 rkD+gdTxSC0CC1A6kqjRXcMyzCpDJVxPBsfQGDe1Kj44o7ujSW3Kgk4t9Hunc3CGEii1g
	 7scgbJnRZS7cysHULnyKd9xzyx+wPrB3txSkqNrYmBLPn38u34rH1Dak7ydQzUghfYAH2
	 D9AYedJdVp4Yu6qq0KXw5GdpGjDeEO5YWU2As/69fsGeraaN7QHwg1sKbdZN/7pEdQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098636;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6Xs7gTw0KvqYciU+Kau1HiI8SAmkgSoonHql5kcru7s=;
	b=xSYaHGVnn3IQPhsIK2G9h4Th8dCEpnKlW7Y/zbOGDlGkRBfKUoa6Vu4ctkb/O2DcDEb5
	 hlhVPAYjG18OoMyFKUcZfWR03/6eKGOjzjrqUGl76qd26fLQ/49+KqwOL086LRm2REvis
	 J+XpnQf241FF/ZuN2cqtPAar2tjVRB8NGzjRBQHEjYmBJw/NxQpAkdzEC1HsdHyZDwJb3
	 sZiu8x5jvmFHgCTpDwCrF4NfMHAwERjNpBZpPbYnV4nRYT3ctv4oQRA7Ys1WdAZKTyvKt
	 L2WGd3NkBNqOHZa/LNOSO1Fti/eXSzDhETjBWeKPwlu+0XndVXYO0PJdQyxt2uXSiMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="k1/6mUXN";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Le4gKRQS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA7F606A31F
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 10:57:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEA7F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k1/6mUXN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Le4gKRQS
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdxwt2458143
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 10:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6Xs7gTw0KvqYciU+Kau1HiI8
	SAmkgSoonHql5kcru7s=; b=k1/6mUXNIgFhNYWqNZoqANg+0ig/u1xWRNSyuVej
	XRQar8CaJAP3chXDH4ger/M175PrTQbAFr256q7GkNvpfPKxJChrwSkwzp5LbOre
	dM2gZZaL7Fcoyfz5snUxxFYGRAIFH3R42Chio1Zan72Agh+9L7yIyaJhEc2GNHHT
	fSVY1fArNbdhpdI1VeKWrCNmRICZzqSaohodEZOFwAlV/e/W7oOZ0L9buVdCZYOm
	97EdESnmayAtt8801jagnQ7drcjxqyEZNKTwPVHBlxuJvY8uxSQ4QaxnzooghZ4N
	dJGDoi9NTZ6jCYMNBlg6DCQFiz8JqNYYsznBsWNI+cPH+Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbt9w7r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 10:57:14 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-89ff20e3eabso420508b3a.2
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 03:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793098634; x=1793703434; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6Xs7gTw0KvqYciU+Kau1HiI8SAmkgSoonHql5kcru7s=;
        b=Le4gKRQSBUQNovSdMhiUYb/cQXUdOu6az5LxovQhe4/RG5JWqcr6+kelfTnsSlPSJO
         rt+X/k4zpiUgUNyLFRPwiPeITbnDLT++rinblRQ3iAp2FZ8pNpeSzG67tQ7dcRvgIAIg
         uUGTX0//91ksmuItHJWjc+gOmWm1GtQ+XPoG8i+jb1i1poxutOJrLS8EGP53zGEKutiR
         xRhHlSZbtJJx1znYNXyofZZLedhPqrz8TQn7/Q5QnNZ72bca19DCu1LJy3DAz5V0Uz5t
         f8aAtdL1YBEjs45FfB9HmLk8bG/jou3jf3MN3s3KehbOD9dVMhcFWJY84/N9q3nEwFCU
         DYvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098634; x=1793703434;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Xs7gTw0KvqYciU+Kau1HiI8SAmkgSoonHql5kcru7s=;
        b=j7lVBUDdzMFefzqvWtjHSesijAtUM6OUAsa6WrKBzMW2tl95Zh7iusSfa0Aruvo0KN
         1qBHYdSY6VTipzSduOkLoa0RPhSs2kl21e1wDJpu5W1VRRCWFve8TKMAVQInL0wQpldh
         FdJHXkhT+yUzHJQralk7/9XxDlo5XB6j+kSfliYur0o6xpx9hRou5Xcu+gKtQw/QaTjz
         kT9J47MaF/uH2NlYzFjKpKlTWvchS6JD6eRh+HDsjSlSqUSpLfTodZNisI9pTBGd7MpL
         o2nUjtq3pUQujAMHmmNtDMYp9TxVP1A42zUxi02zFLf5esxXF2zHv+QT+DrMOg66Jq8b
         tAEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwoua9+T9dU6JPomcezNf9/yBU0cW9+FrscNSOYq52ecGI9E2BPDXLvboC8l3jLmSVJqeVTV4EczvdR@vger.kernel.org
X-Gm-Message-State: AFq9FYJstagIriVYtsDpaacRWrM66r+tuCdKjyVGM1GItAHbKRSaA42K
	S/YQtXM/YeXR025qDxnbJFtyZ05DS8gWcmiBIEG0M/ciZEr9kgMUbUM9stqbI6LLbYAi0w63puN
	NVR0oXQ5L2+GrxvFiyZjAZ6vAicSHbILDz/Xyri/GHBAdVbQxf+1OTNMC3zFy/vv0
X-Gm-Gg: AYBFou1RdHoy+1PZV/ru2qAlQfBPC4IFmZKpxL01NQqVTAK6zo7c7bg8iKHjA3zfQTm
	yhcW9wBy4RG18t8jcMFfT1LcKX2T0fG6zRl4TOwZpMDw6+zTGDpStDwf9qJGYHPJun5g7A3KnuC
	Dw4e1X+MqW24rm3CD6LbhHstUhL21BrsEWMVlTNlMLyTrvBmgfQlVahvJqwVFRhb4aRb+Lz4EFA
	sxmhcFojH3giX/Djvb2ALy2fYwbCiHv5CWZaRj+xlpG5SiC1DMbI7x8L0tQCgiAb871pi1sscId
	vqHpRbVhlBGLnsJVH64CVY3TyKgFy9bVTj3rJU6m4MKw6KLb6cbLL4iddHtJo8cyye/IzMxD2ux
	uZ+yVeAU1ygC3zzDQbKUQbj47ybVmUz0RSLI4EVk94qX2P6yIHERUpuCZa7ZcuzSWuZB6BmlEWX
	Rs/SBUQIKl8SRHo/FZRPRMidr5xjufDhbedLN5JDjv8kct3Jv9SwcE
X-Received: by 2002:a05:6a00:348d:b0:8a5:866d:d5b with SMTP id d2e1a72fcca58-8a5866d0dcamr9445082b3a.1.1793098633663;
        Tue, 27 Oct 2026 03:57:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:348d:b0:8a5:866d:d5b with SMTP id d2e1a72fcca58-8a5866d0dcamr9445059b3a.1.1793098633216;
        Tue, 27 Oct 2026 03:57:13 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36bf0f4dcsm2190344b3a.44.2026.10.27.03.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:57:12 -0700 (PDT)
Date: Tue, 27 Oct 2026 16:27:05 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Arpit Saini <arpit.saini@oss.qualcomm.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com
Subject: Re: [PATCH] dt-bindings: display: panel: ilitek,ili7807s: Allow
 backlight property
Message-ID: <auCDgewe04WKbamD@hu-vishsain-blr.qualcomm.com>
References: <20261025-dlc_backlight-v1-1-1d1c49c3e101@oss.qualcomm.com>
 <20261027-fantastic-benevolent-boobook-272a9a@quoll>
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
In-Reply-To: <20261027-fantastic-benevolent-boobook-272a9a@quoll>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfX5wCwHkZBWWpc
 vzNIZtzOENPxISs9e3WSfyoL/WjSEDZJG87EYzYl6H+jbeNkOxZQX636Zr3RMV0GQyQHgGOH79m
 GxGOIZua/gM2lZI6aiyFlApKG3l0SWg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfX/uTxqsb9RebL
 TcHcn6Nj6KEqX/Z4b4ooDglvC+1v0ypu/feTZWHXE3KlpAXbiUW+GOdyKe/jRAIOCmZf+yXtvyc
 Q5gmVd6wGZQf4E0o57be18pWmUEG6Jm6KY4Kg6PJsXp+zeBguzgc9NZPxBfrQnyrC3wgl2Z9kbi
 bN8PUKLZTE2d/KH91V7M/TWFnQzUdqr4S3rT2+ElJefyOs5fcdDOR4dsetxshJOW+6qvLfxdTZq
 xYxhaULb4DrXtHdUT0218QjFA7NYZ8dPcCdThHQhli3BfYeqzviG/h1h78SJ6vRIED2ctq28sWY
 hpSa8kwr/NsYRi4pK0IeTIk3tRGIcxsx6Wt2amM7VymqX+J2H+nBlk77mic0fZrGipZXbLIFDe4
 /4ccwwNMelAQgeTGKSL8yUWxCV3+0HRrGA1T0GXCa2X9F5AFAIAL1j6ykvHEf2x1I6I6+roPlLx
 xbqXjgT5d9wqRGhoMeQ==
X-Proofpoint-ORIG-GUID: gB8TFOiTd-WM94jZs6KKiiU9IgbdlgTf
X-Proofpoint-GUID: gB8TFOiTd-WM94jZs6KKiiU9IgbdlgTf
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae0838a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=a2tH-4IN5IZEDPfwvVoA:9 a=CjuIK1q_8ugA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270043

On Tue, Oct 27, 2026 at 09:12:27AM +0100, Krzysztof Kozlowski wrote:
> On Sun, Oct 25, 2026 at 12:18:17PM +0530, Vishnu Saini wrote:
> > The DLC0697 panel is lit by a separate backlight device, which is
> > referenced from the panel node through the common 'backlight'
> > property.
> > 
> > Declare 'backlight: true' so the property is explicitly allowed by the
> > schema.
> 
> Why do you need to explicitly allow it? Since when?
> 
> I see no benefit of this patch and commit msg does not explain me what
> that benefit would be.
It is required for below DLC panel, when enabling backlight using gpio-backlight driver,
Apologies, missed to add this in dependency there.
https://lore.kernel.org/all/20261021-shikra_display_overlays-v1-2-adaea735999f@oss.qualcomm.com/
> Best regards,
> Krzysztof
> 
