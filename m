Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794422804;
	b=C5t+PwC229jaUOf2KBlcL5QCWh1xVC+Bp1U+hNdslZBvNHpaUVBWVtBpeZ96Q5f36nWd
	 jfh1K1JGireEhY1bwz4WBjYyMPK35dkLCw3Jp+3kZeDHBd9SsSMuEctCrKZqecgZZrqYz
	 L3FZBBmNEeXP5mv+W9o8fQVjk8Jzn8Ye5gt1ldLdIgxVf8to5IBzNBt/4zTpShj5cyIae
	 +Cp1xnAXshANOTWvPwYXEkYmXULaBLMtnXm6DVMmTkG+5MOqaD9RVqAF4hzGkfxrJNGgL
	 4HKzKNRDOo6z6iegQSPQewV1Es0KkbsII2z47LFFSrwIlH/pCaNVdaJRTTDwo+aZswA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794422804;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MHpOPQMnBsXdD4rxYXwjWTXKlMKBvycegMK8DhfOcg8=;
	b=FjRYFg4xQe3MmlKdSNdqWEMvgSJCDx9UsgnEricq2yALyfvLLR1emp7e2cTwgycjAF5a
	 9d68BRv8zF1GaFIFIWkdhC/QM4Ld2xq7lDqOHHuo0AZVttmYAQOX/bGXVKe1QqmyAv2ni
	 eFr/tY+lGRRL2QfLZEWcAmJ6Z4+aiORml6kRAhz8uM1EbM+WJLJXRCsyAsWZMHy86jX9Y
	 CiIG/410dYeNOeJlxioWa+sDB1HSUKmUsAZ2/V9ZOJBpxCekUzmpalU9fYJV9QBrOBCGr
	 rqH/iE2oQRRhbZM7n1UGJLiSmx5seGxUuKDyKWv5YmcDGt7nZwPUipH+P469Gm+aBcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="G/wgCCmm";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dipNO6ON;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E741E606A31C
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 18:46:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E741E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G/wgCCmm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dipNO6ON
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABIgJNo2811955
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 18:46:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MHpOPQMnBsXdD4rxYXwjWTXKlMKBvycegMK8DhfOcg8=; b=G/wgCCmm3FHTOOQG
	e9/ng4bKh+OeU4l+jXQGRNS+CTxI5qvXs21sgkKyo4LH/y2+69ujEedssfuFYtDZ
	qrJiLmB3C55OzIT800Ia70b5MBla65L1pv8voXplP5uHxWxLkIS8PTRHDRNtdSVW
	Vg8ydmYis9+Xa54r9ps9Kovpp0FKv3RQNion6bMWVAiLzuND2hK/mEJMgJJhKEHT
	gBW7QmvP/kHO6K1XyJJrhfGXFQmT16qM8BXYnE5tIPV8GxHjLjw8aO3sMf6RBOVB
	oyOo4fn8oEQ+X55OhGFGV0YA+0dhh/T11OF5TBfThZ8Y32lpNirMgrB1MS5tktfj
	vgbVHg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvvw0ga0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 18:46:42 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d2c7428eb2so686884137.2
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 10:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794422802; x=1795027602; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MHpOPQMnBsXdD4rxYXwjWTXKlMKBvycegMK8DhfOcg8=;
        b=dipNO6ONct+dJbZtn3WLFsOkD3JElX1yoWdF6CKCZjrcThhvR372TU8EenGsC1tupV
         VhLaqB3e9tnq4D9j9BeyKbnp6c3WFFuofHrtcwE/b8Ao00Kw1rJywdSnGVpLDG9G5MKp
         oZw5tezZPXZtmcfXLh/WgycyLc6kA3e4ebkxSDfH3K4gRegMQ5MsomePe4ollnu1LZdV
         wJ6jnEAC/YeEizSu2wW5aqPSxLxg05WpUrW/aJawIrlHdbYv8PJ8n7livsmX+EbBlrHk
         wDtzn0oYBbpAEcR0ucWIN2lIABLr4d9WJScMEpgh/gVf2+f82X0wRjBN7exNOH8nFwwB
         OF9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794422802; x=1795027602;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MHpOPQMnBsXdD4rxYXwjWTXKlMKBvycegMK8DhfOcg8=;
        b=wPAtkMSVgqbCHR8dxWiXuPomknb8mq0XAebH28Sekc8QoCE1z52rscE32eOjbVBMLN
         0VC4SgGb8+o5Bk1eOfxWpDwKqwHhhk92JQB5j7MSv5WMQpSydMaosR+eiRJLiOwIWTbz
         GzjkfgAxIUBrV0mwFWd+095s5HgdVDlU0M74egTJiimiAjZ5+K41GbXrhZs6SI601GWq
         3664qDGE09wCEIZFN9ll0gdDDVFSaW+U//X00kGknUYOYiEF//g8iMGnnXM4V5MVnWpn
         iqvcP0s7IOmlp++8HgEGIyGrzY75cwiwjWIKf514maLw/YjqL5ePIn7KJtxX4HYjCOR8
         XV7w==
X-Forwarded-Encrypted: i=1; AL+hErF8KOxuM4TxKMUi54eKvoVopEBN+ocjf7xjxI6J7Q4izAmLBoouDchsWOB8enAYntqA6r5vugXhWruZ@vger.kernel.org
X-Gm-Message-State: APuU4Z93PT+xriS5LJ2iJ/Q0PqDUep9lZdLzSDOWIqgD/B5APiVdtVeh
	T1aoeycUoInqAVkfg2GnQue//ao+JFYcGl+KJrO+MvCRuQFB2XoV4pu4zT2qik1CgI9rObIouNK
	vbTEgkcNMGTyUdTtFyhLLIFgU0bfNx/3u+Fgq36kowz5rK5xa4zbulpDkkqqkX3xW
X-Gm-Gg: AYBFou3sC1czSttoFzLru7La+sIGe076xGMT3+Pw5j1w5nbhWt6vu2MbPQTA6zMoT/T
	Lh8Q9a5+zbDAZz6rOEluL+D3IP+7/ZOutNUz/uOxOWqFSzA2ShlUxrNezmPTzjwT7YGWrpOCcV4
	MU3MeWs0GFtR2intwaHiXNe1FXM7YUKz7M/KmAy/qzYxgdBfqFV/ktau1Xr1PgMenaSnuE9F2cH
	EQWObHzri/QrSujqR434HtreLylsDYYj6IX+x3E9+fiW5Eq1HGWX4ueAzuXDGQfsg0EBQ5wVToF
	O/8PseoK/zPFiwNJpN3vI5YrB4u5E2zSqh0l+BqUDfJIGbGeQxdkCD5ZZvPsdxLsTXm761o2ZON
	L64xmpd6X/f2VL7EMsjpYmcHWqxSR5xmnppinKZxKR9VbYzMRYzofSRZEBrRdrMxMCeDltaHihi
	E=
X-Received: by 2002:a05:6102:605c:b0:7d2:9cb2:88 with SMTP id ada2fe7eead31-7d5061dee63mr964750137.32.1794422802155;
        Wed, 11 Nov 2026 10:46:42 -0800 (PST)
X-Received: by 2002:a05:6102:605c:b0:7d2:9cb2:88 with SMTP id ada2fe7eead31-7d5061dee63mr964715137.32.1794422801221;
        Wed, 11 Nov 2026 10:46:41 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983600bc9asm11539016f8f.29.2026.11.11.10.46.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 10:46:39 -0800 (PST)
Message-ID: <88380d74-ab37-4903-8f8c-4e6652dd5ded@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 19:46:35 +0100
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
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: msm8996-oneplus: Disable
 disconnected DSI
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark
 <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan
 <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20261111-display-msm-of-graph-v2-0-fdf8fd97f49d@oss.qualcomm.com>
 <20261111-display-msm-of-graph-v2-2-fdf8fd97f49d@oss.qualcomm.com>
 <7gqjjq7v5krgibjxqelyjwmrfygfnbsvyfubgbpkshkvgdftxr@dwm3rdpoqbnb>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <7gqjjq7v5krgibjxqelyjwmrfygfnbsvyfubgbpkshkvgdftxr@dwm3rdpoqbnb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bK1Xfb-qrZaZZphChKCKqpnipO0unMrs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3NCBTYWx0ZWRfXwwUquXPfnKrs
 J7PwE/oiaKHaJgcRgkcCKGwX89BUEQrUFE3poOLAD21PdSYx315tDeEF0SYBEVQ3ZlYG8iBixEr
 9ySejNoT4dKN7dyK/vN+Tlse0wSbtcmOkoQXWsCcE/VFyB9wS4DcBphnpAFQXKpFZOHzjq+Jx0G
 0/QwFTDDjRohKALrem9JmfXfZOnkIagJy/H60QFgZ/6YLgitjPBYNGKiWZ3oj8CBhjOqrmcqZSA
 x+L4Crrc6Flt00H4gqeaHvETO//HMxLBYwFkuhL8K6lp5qIAnmdmnOZLyZI81QyR3ZB6e1oBq/6
 Jv05DhZbMi7EE3Z47wonVkr7VlL1Lbw/VjSvDHVklCf+yKtkLDxZX5987Sr1G/eb4EtP1EjM82b
 G60XieVrgd8OvYt9PDynem8xvKCfuOXM+YIu0vInlz5b4h5nQf4rvGJyQSZd/fpbchkTjaRZhQm
 2pu7K1qHeCXMeFbuskA==
X-Proofpoint-ORIG-GUID: bK1Xfb-qrZaZZphChKCKqpnipO0unMrs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3NCBTYWx0ZWRfXxEg+MDSXeNru
 a4S4o+UzNXLTFM2+0nLJH+0tsY52a63EghW6hLK9K85anqHYourjQ9plDtaY8naL1q08S9AHG/d
 sy0HaHb9amu0J6nCF+PlL7GtSMS67tM=
X-Authority-Analysis: v=2.4 cv=ct8OAF4i c=1 sm=1 tr=0 ts=6af4b812 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=NUy6FM0n4CcUAni1w6YA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110074

On 11/11/2026 19:16, Dmitry Baryshkov wrote:
> On Wed, Nov 11, 2026 at 06:45:01PM +0100, Krzysztof Kozlowski wrote:
>> MDSS DSI and DSI PHY are useless, when nothing is attached (no panel
>> description in DTS), thus should be disabled in DTS.  Linux MSM DRM
>> drivers will also fail the probe.
> 
> I don't think they will fail the probe. Nothing will be registered, no
> bridge will be attached to the DSI host, which means that the component
> device will not be constructed / bound.
> 

Indeed, I'll rephrase.

Best regards,
Krzysztof
