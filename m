Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792656398;
	b=DZxEFWR4D2wbkY9/EpBRIH4oMIn8wGODyK8Q0Rbu2s6EQqo11e6ErfhEhmRMzrq9bUvd
	 i4D+xo+/jxVZlkL/PJ6JXZpO8bLZ1IfuGwE7kFXrt4eVSx1FiTZaRAdFEgmbZUbE5Klka
	 XjbU8d+XJqP9i18U+3yVgDjkBNlYPiIIq9g+e1rSj6zlEyHfsb6YI7sqpkwJSvCqb5IeY
	 44aUQWQC6uJUyjww9oVnYkKArmjjjmAIzYlXJjcXBJ4f7Qg1KY4zkaREslya6xEy/hLP/
	 fVM/FxVQyPyWlTk4ATtqy2lSk+HOyIWJyxplwJnSl9hOzCeegYlv/UpmwQN3ZQOtEtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792656398;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PzWL9wbyB9BKu8/5KZoI0l/gUO+TONtg1mz6cnzHEwA=;
	b=KlnNRozdt49epqa1HKqsDiPg8/6JlFLcfc9PEVGd/uUXMunByLBqQvGLVJGXT7fQ+npT
	 TR1+iB/hLBJRyEF9q7NE+QPdoeQlrHD5aTQ6mSXELUfybj+iYgkIWNPlNaDEPu32jPw8R
	 452ZyLiHqneeZVhjARypqISwyhWqfRx/1rh9CERIo7ICYj83mX9SHLC3fPGT5G71bkEcq
	 gyv0d9kE5EO3b4XXnhRhzqNi/ylWSHRyrjQ3nXd5/YPWWk9O8a8oz/XfipehU9XqjO02Q
	 3QljRLrgh0G0eCOXTM6bIxzPO6SBt+VkInfKURnS9AmX+Zy/AvNstHqaJ5K01Ve+OlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="gJsLT3/1";
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FNtjyoqG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F376606A31F
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F376606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gJsLT3/1;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FNtjyoqG
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M705UV4110647
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:06:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PzWL9wbyB9BKu8/5KZoI0l/gUO+TONtg1mz6cnzHEwA=; b=gJsLT3/1t+6P8kg8
	WjfolO8NkEf9NuXXYOYi/ibaJQElqu7U7xuhvvhb0WI3Cx/pmRSSv1uR6GPPuHdc
	joWkaieN1xjaB7mX73lFUgFKjFUoDDjLCTsB9bFLFD72UHXJn/HdGw5VYTSi5xB2
	xyFxvyzZY5HpUPPVZJtZ91Xcq08qIayFgb2pGYz2tI+Z9WpEVvenyJ93oxz0X2R5
	XnGOUQlUFwb3rxBpLrEhC6LVdW4N74wTeSGgTbw4Qk7UuQAoOFWfChEjaN7HOn21
	d0ZOm7W53FjEfZFaKs0KI7qLzcI93PYZ2jGJUjOAYoupiwDSOhFmZMi+gkwvgsRR
	Q4kr6w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahcpu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:06:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5338bd59032so2508201cf.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 01:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792656396; x=1793261196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PzWL9wbyB9BKu8/5KZoI0l/gUO+TONtg1mz6cnzHEwA=;
        b=FNtjyoqGlagUNO72W55xLr0C/c2PTcndQotxRgkLLqVUifEFO1hzAeMrmkFa2o79cM
         YozQPNWbnl3cjCWggWgQIDB1JtnWTYCyi4kRMeExy94QSKWHWAAV4vuj7qnySdMpxTfJ
         t+PvSo7S1gSN7axdfm+4Wl+e4GGbUuoOJBJZRKpCuWPlyYHdo7aH7JRfRoanvZHtdyOn
         xLb0/us976aAwI4PcEPSgjRW+ZaGdNOLYuPIYVfI6A8ju2I504uCZ5o+KKCrEx/OW9z1
         Q+DlfvZ/XhM3oKeMW3piUoGtt4J2KldnPAk5qtOQUf2ym9dBjXUJNbP0AXebo/AuWlAQ
         K7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792656396; x=1793261196;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PzWL9wbyB9BKu8/5KZoI0l/gUO+TONtg1mz6cnzHEwA=;
        b=mO9ttGl7E+XqhrIFHXx1EDCphvD2opwr9jtO5vudiOj4XjeWN6MdDTu5eha/I1V/Az
         rKx4noC0+WsEIAztot1Rm0SPVBmSmvLHNnf4hJs9OEa7CkEx1HZK51yop1j2AJ9kPP2F
         BifHZMNkVWN0ADC4lUlD1vz/Gxsg+yTHWUBKdjd9ldTRBxXkMsemRxF/LobygqMavMFH
         +qkcBU9Bo4TTDS3IBKBPJEmSEhUTkWhdBe7kprIrrwdBpAptIz2+PA4lpNDV0o0N8kqU
         k8GWQImE591BMQCz/I3Vibxop21y69HWzBPzCsHq4WdvV6JzjATNw/edOrxvz5RsXJKH
         DQlg==
X-Forwarded-Encrypted: i=1; AKwUvBxBNDp0K9NXxWkrkZI38Gp+dyEh+dGXNFyp6w/k/bBKcpWidj8QwtCRm1dbQWcRx81qyZkh7L/vZvNz@vger.kernel.org
X-Gm-Message-State: AFq9FYLCZJ1i6lViQchGPDQXiyYay/Fx7w8opMHRvXvKFHzKKYbvT7RP
	MRs2QlfxxiaCoLY1D3VnAH9yGuotEs+px1Um17EZXCctiR3rO+UerKn6HNWEboQI2BZJ7cpb53m
	2tH5zq15tgmrrVOe5tHkTjr0RHcr+xqbR7iR9DPZYgqm4H8MgbTEENEauaKr86L0Z
X-Gm-Gg: AYBFou3iIgNhYKxQPO4vfECRL3w8wUw/DWFvcbFhhk2Uu2jfd3AJdXaQDtXaPnS/W0n
	PKFAiaYvXXOsM+bktMG+TpyOE7RRZWBBxxsRuRigZcmGsaqqFi/3DtQlSOaWX3+4zXC5BM1ac2Z
	vUSJ1sJdNkgdUSIiaeAsB9YvrAtSUiovCZ0cHvcGHNVxoVF+//VoK2xpVixpVqNLQPqZGxQ1bB5
	S9sGLvXSQGg1HOOFIDmvgwcassYPK4cpPsMCg8WADl+JpuCq6Yi+WXIHHsRV9QUItQJDxtOsDQh
	Ubdgh5S9lgjDFkCldV/UOcMtI06hNdw/cEZn0gH3Q1YPT621qZwhfdLG7r1k9A2nCaoJsxbdJxH
	LuOwZOzvR1AsgeP17sdeSZQ==
X-Received: by 2002:a05:622a:134b:b0:535:162c:2e81 with SMTP id d75a77b69052e-5369bb640a1mr79438591cf.5.1792656396248;
        Thu, 22 Oct 2026 01:06:36 -0700 (PDT)
X-Received: by 2002:a05:622a:134b:b0:535:162c:2e81 with SMTP id d75a77b69052e-5369bb640a1mr79438221cf.5.1792656395805;
        Thu, 22 Oct 2026 01:06:35 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a59d641sm79781066b.60.2026.10.22.01.06.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:06:34 -0700 (PDT)
Message-ID: <d1e5541d-3bbc-4079-82a7-b0b4d1604048@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:06:32 +0200
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
Subject: Re: [PATCH 3/6] arm64: dts: qcom: talos-lyra-evk: Add RPi 7-inch DSI
 panel overlay
To: anand.tiwari@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
 <20261021-lyra-display-upstream-post-v1-3-585caa39cd7c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-lyra-display-upstream-post-v1-3-585caa39cd7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX1HJEIsSExiGu
 73elftd6qElxM2ocoIWENIOFIsbkv9Ftt/jJL9ymKdRpa1dSk/bqfgKzKo/0vjUkJtNmXtMjOi7
 SZ4r/fJCmawpvl7+mMk8ilMc96mq6E/RcxhRukT/nR1AVvW4U5ho3bwl4UYA01CAfyf0fNqzTXK
 8eqew6xni/VmkSmWZKYFVR5GZt4+tJ9KbAjhB7YgBqQhArLWi5jWPek+LF/53Nc2ZNNwLhrpM6Z
 O8va9lvQDaxTo1qeVnsjDLM0HUVxHETudp/nTFz085jpRHrRlGB1/dtUKnBjFMEM9K+mNh2Jnkg
 wJJzXawNuSqPzaCY0AGWMFSresnn2hfK0uG59W/oFjgAh3wZfKROGRrdffJd2xsyGUSGZD1eKmH
 exaPtKKlbpmyNQwCwEgweMOYsRFj6s9C+9mqhVnTo8QysnLcqIF7OjiUFFT+UcsewGNTvR0KD/r
 ZYW1sTZG/Wgr8ad/A6A==
X-Authority-Analysis: v=2.4 cv=H7FOUOYi c=1 sm=1 tr=0 ts=6ad9c40d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=y-N8J18KE2yr1oCy9oYA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: OwUM__T4EunF7DYrXe9l5tcIWR6lthpU
X-Proofpoint-GUID: OwUM__T4EunF7DYrXe9l5tcIWR6lthpU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX23tkKJxsTSXR
 RgVdRyT3p2bAImkhYANp9HOYBBDS9mcFF3vfmdwA2VQvP8MsDuZi8oRctNOPpvghO4aweJEp2Tl
 LvyUT8eLePo8nK0ykImk37YXbmBXx5s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220032

On 10/21/26 5:17 PM, anand.tiwari@oss.qualcomm.com wrote:
> From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> 
> Add a DT overlay to enable Raspberry Pi 7-inch DSI panel connected
> to DSI 22pin on the carrier card.
> 
> DSI0 from SOC is routed through MUX which can be selected by DIP
> switch S1016.5 ON for enabling this 22pin connector.
> 
> Add the regulator and backlight controller at I2C2 address 0x45,
> Goodix GT911 touch controller, panel power and reset control, and
> a 2-lane DSI connection.
> 
> Disable the default HDMI bridge and connector in favour of the RPi
> DSI panel.
> 
> Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
