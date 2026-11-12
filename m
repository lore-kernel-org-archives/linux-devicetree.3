Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794476256;
	b=1gDuHEVVny17WqXlgl8dwxpwbDbgJ1OIi7FZyOA+OPT6QA536GnilK23I25HXU4LBBiU
	 LNyxrvygV9m0pTq8moMKorUJB9aOTBQMdF2gjgRxtwxXA3SmcRhfbfS9E/8UULqDyovcj
	 FIJaoflmVI5nWOqM3A96j2AhQi5/PZpdXN3VLhtrm16dqtV2EdwPAh+s4F6iWn5Z1d7M0
	 GV+g/KsJ4D2EjVsFPcInE+85rIJBVbZ4a0Gcr49ne1c1Se1WB7+Ae6qK2aR8zayU27SD3
	 vyuuneyyRvtfHOHMC1hypU/0V6NZGiNukeXFmtUytyUW+d3Mr/uM8jnh/TLTRqIsHNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794476256;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 X-Google-Original-From:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0C4VCPOf2XQTwUREky8icGWL7YCz198hjE5AQAs6rkQ=;
	b=OgKbqN5Uuau/dHnViHWiatsXh0N06Z8VJqYQV3Fv+bU1fLugBWLPCcmzlRmwLaUII3Dt
	 UGE7w1biJwSDiMm9vyDGMjniA+AtC/e+f3ODwGUMHKih+0Lo/VjHHv562SMWuvp8YrB2M
	 8eoxMQSejDq8194Xm02EMVGwmLwuVETQpecQJRgwtdW+cS38xNrtSegG8KFyYdUNKvys+
	 Xrzk+MVYq1rQYbtKx3eqmNzA5fkvp9RmY76BCYYB7uYXuDD1MelaGwj/SPRq+Exk3Mu76
	 FkczDCdHA3UJr/7AjipU8vsAEtzToDJL4DZcxouClyY+kX1KfJ+wiIFueaK8k1J3+3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H3apqZVV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LTVzLV5s;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D90606A889
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 09:37:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4D90606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H3apqZVV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LTVzLV5s
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC5o2Tj442333
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 09:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0C4VCPOf2XQTwUREky8icGWL7YCz198hjE5AQAs6rkQ=; b=H3apqZVVjjVPAEjl
	cN2Cq6WnQgu82yoBdhcSfDWr/trszx65NmUBb1sj36/gsMjViqa1kMPyawRmJTPh
	J5kJz3KHXLt31PdG+BUb2dXRCFQphRDLPTY8aHR47Pb0BT7m6E/ouT3WBpWr3/9M
	EucYbXufySicB3u1Y1WSCK3vL4ubXLyamSK9yPmVL8g2LtZNhwkgndRBFPe5Xj88
	7spNDVV2ZTlc93g+rdkSRxZI7ou6EmwZCty/Hu+CaCdtJJCND2cms/MROOp7ylA5
	oYMz+C0bW1i9HpZNbD4/B75A6YO03cD3+SeHt+jPugAXuX02VOiOn3/2XlTmHu9S
	C7L/wg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw7nc0ubb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 09:37:34 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a59717b0c0so3240535b3a.3
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 01:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794476254; x=1795081054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0C4VCPOf2XQTwUREky8icGWL7YCz198hjE5AQAs6rkQ=;
        b=LTVzLV5sO53UK9acz7IqnzQXrVlTbMbZ6Aj+qtLc6U34/Iorqhf2f/ft5+DKnGQ27o
         I2+v88vEYbh1bi9fUi5sehxDJ6W1i00ewZstJMJvEQ3tgL+CAafODFh8VDLNDCSAKI8e
         Qy/2vIEZoEikcqQokB6sNA5Han2GL7GiAIZrfTjQ7ll+ETRWM4w7nT1LFjuJiRE2iFki
         Nr16SdOJY7F9zyqr5+x28Jo+w/PYQ4CMVRXgtWlBpNGqtIT19UhdLSgZB5X1IWdkb8PB
         vvSj4+Mivy86/X7GKaetnEc9HSKoS9X9vAuPU4P3EYQ2lkQKSAVUfZkjoJo7i+hxfN6l
         rK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794476254; x=1795081054;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0C4VCPOf2XQTwUREky8icGWL7YCz198hjE5AQAs6rkQ=;
        b=JWxhapLZzZuaIyjJkZbTTFxpoj11cShmnKr72W6ybauUaKByD/ZsZIS5QQjB9GW9c5
         7nPBtDYbTI+D5xrVOTBTFSXtXcsYVR+/AjD2qR7WrPQj32x0YYnZP8w9WQwbbXSEwryi
         CJPQ84B4O25OZIrRVIkLThEAVQUCAACIVsJG0LgStT37xzV2V0UIRaw01kd9eyj2oRHw
         ZNgGBfsboJMERnbQzTIvtzb4Xo+h7YB5OApLmmD2JWRPMbvxLeDFot1GIMF48aLdCq6S
         rv8gSYfqffSqKeidonAWn80XM/KbzgQBlY9d3bTkMDsMpxlGcFnZK9axtAnhjsEq29Al
         HyDw==
X-Forwarded-Encrypted: i=1; AL+hErFaEurzYIuwbf3BHMlNpnJngSaz20mMn3bMXxnohvkH2k36syW5Mw8iPjkmipEBDFkccp4k0tAJ2FyB@vger.kernel.org
X-Gm-Message-State: APuU4Z/6QJ1G2ndv49lKGRlasLqhpOCoRDjcrWImLqfB4jcOZx8sr664
	P//+sH1npuGaRugBR0TeV/zrdNXf/pt5ukagD4OhSW8lY02awt3baFpFWs30IM0pWwyvBqUEveS
	Wxyec6lWMsJwt/zQt3dLRUsEnF5tS0fi84FWeerMYQh01cT0f/ip6RBLZ01ulpFmp
X-Gm-Gg: AYBFou0Kfpqk32qTEDuz4sc4ye58GtFBY3aM3mUF1oLbD8aReeKnAj+lfDZ3YXCSc5y
	9tueMrpgSKF8ty9sheKVjSKGbtJjhiJVR9I0jMlpA+5l3DcaCG6QrZGKWSmpnvw6+NUb9NtSeC7
	7EMi06ieAbFJZIcUFEplrWQsuiTqs8EKBKy+YZ96MvLPTWmu6FI43qmIZSl6fAmkE+8+eVDbSvh
	yue6EIZUaS2oRXBrz3d1h1RLJIFGvZFKbA8wCsHayrtOglmxB3WEnGVRueTEy0wShIWW1Cbj3Ww
	wFoY+vkYrCx+Danw1hMMkilNXk/N8otxZYME8KY7Pzv893P5b2mYWyNBGBuBg5ja5guUWSckHSf
	iUubDrk0SMhySADQT0e+EL7tZqzlzOBOJ1ZXIaAsADx2xI8qW5J+M1JG6M1t44XoqLEFSH18z9X
	cjzE/8b7A=
X-Received: by 2002:a05:6a00:22c5:b0:8a0:4807:457c with SMTP id d2e1a72fcca58-8bc1d332510mr4962215b3a.39.1794476254237;
        Thu, 12 Nov 2026 01:37:34 -0800 (PST)
X-Received: by 2002:a05:6a00:22c5:b0:8a0:4807:457c with SMTP id d2e1a72fcca58-8bc1d332510mr4962180b3a.39.1794476253726;
        Thu, 12 Nov 2026 01:37:33 -0800 (PST)
Received: from [10.204.79.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa1b1bf1sm3225569b3a.12.2026.11.12.01.37.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 01:37:33 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Google-Original-From: Jayant Shekhar <jshekhar.shekhar@oss.qualcomm.com>
Message-ID: <c19f662d-8d04-47c9-a458-838e46521f2d@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:07:27 +0530
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
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: Add Novatek NT37802
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jayant Shekhar <jshekhar@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261109-jshekhar-nt37802-v2-0-a8e9efdcabd7@oss.qualcomm.com>
 <20261109-jshekhar-nt37802-v2-1-a8e9efdcabd7@oss.qualcomm.com>
 <9b05fd08-7bfc-462b-81b8-a560350f4235@kernel.org>
Content-Language: en-US
In-Reply-To: <9b05fd08-7bfc-462b-81b8-a560350f4235@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wofA-MGtDru7OnPPu1HpHqcqHaG-8HdK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzOCBTYWx0ZWRfX92n8Pc7WZky8
 0R58MYsh6HoDqTi20eW1cHFhYQXZ+b52KtjtBaXqE/K/GrTRrJMxmfNjStotiteiVZ2vgPLu5y9
 drM6j1aMtQLVsiNOFyJaKyXalcWIUQw=
X-Proofpoint-GUID: wofA-MGtDru7OnPPu1HpHqcqHaG-8HdK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzOCBTYWx0ZWRfX6sqPUM4OYmy9
 Rkxg/mQ8L8QLjLdBwrQeu3TvxOO8ffImrlFXtqqmmv7y+vBhnbi6X43bph2Skm4tm3M+IHFV7Dw
 KCPk5Wi0BcW+yssrH9iKbolvZlYNFVuG5XaDX3gINGeqcn4DiOABlqE88JhJQxweHapih8pB7xr
 ipyp/jFnbJqalY74DkJNhQI0V14Hb3lPYLsse/LSIhdHEBRgtGt4L68RiRCkdAO5ZqPRs38rOXq
 QhFMG+1zaXSIgThBYWVfrNRfDMPqA/1T3GZYJS7gUkzpbQbCG62PZEyjIy7TWq/dwHvlLTz/DtV
 RaFDtDKbVyo2aSrLqjsPqbTDfhn8okJe2d9+meNXEmNgHJJ0VjZZYIIDtb5c3P1P+JXJ/NQKgBt
 4pXDzon1dbneLBAeHRzrR7T35TRRIBia1T+ZX8eLXT65pdSUUrS5cE1Uz8YXbJmnl5hW/OiItX3
 PRLEcholME3BPCXJRXg==
X-Authority-Analysis: v=2.4 cv=A8b5rKWG c=1 sm=1 tr=0 ts=6af588de cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=sM0BxRoSGqECXxgCHJEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120038


On 09-11-2026 18:48, Krzysztof Kozlowski wrote:
> On 09/11/2026 07:27, Jayant Shekhar wrote:
>> Document the Novatek NT37802 AMOLED DSI command-mode panel.
>>
>> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
>> ---
>>   .../bindings/display/panel/novatek,nt37801.yaml    | 49 ++++++++++++++++++++--
>>   1 file changed, 45 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml
>> index 1b38c1d0af68..be318cc84d52 100644
>> --- a/Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml
>> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml
>> @@ -4,26 +4,30 @@
>>   $id: http://devicetree.org/schemas/display/panel/novatek,nt37801.yaml#
>>   $schema: http://devicetree.org/meta-schemas/core.yaml#
>>   
>> -title: Novatek NT37801 AMOLED DSI Panel
>> +title: Novatek NT37801 and NT37802 AMOLED DSI Panels
>>   
>>   maintainers:
>>     - Krzysztof Kozlowski <krzk@kernel.org>
>>   
>>   description:
>> -  Naming is inconclusive and different sources claim this is either Novatek
>> -  NT37801 or NT37810 AMOLED DSI Panel.
>> +  Naming is inconclusive and different sources claim the NT37801 panel is
>> +  either Novatek NT37801 or NT37810. The NT37802 panel uses the same common
>> +  DSI interface and regulator supplies, and additionally requires EXVDD.
> What is EXVDD supply? The example DTS suggests it is something fake.


Its not fake, it would be something like below:

     display_panel_vdd: regulator-display-panel-vdd {
         compatible = "regulator-fixed";
         regulator-name = "display-panel-vdd";
         regulator-min-microvolt = <1100000>;
         regulator-max-microvolt = <1100000>;
         startup-delay-us = <233>;
         gpio = <&pmd8028_e1_gpios 2 GPIO_ACTIVE_HIGH>;
         enable-active-high;
         regulator-boot-on;
         pinctrl-0 = <&sde_disp0_vdd_active>;
         pinctrl-names = "default";
};


Thanks, Jayant

> Best regards,
> Krzysztof
