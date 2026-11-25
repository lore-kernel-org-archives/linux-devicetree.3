Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605839;
	b=V+7khHRkEE+bNHefZUileOz3O2vrcfBZNZFSLrBlLhJJ3oq3yKAjU2Ocf9PpIInSLiT2
	 OhlXiY8T6ONmSfT1fjdU5PckfbRdaRfaHkS7bH4j2yXlT7Bcbq8Vf7DpmKLXh/q98DQSt
	 y7m89FLGPFEIkvtHkNQldrNWI6qfP7AxjtcZN7N86JBPayWobm6CB4Bx2jxc0uDLnBOff
	 v7sg5b9ih8XyObXiz3ArvTGl85HR09xxZ5s7XnA1lgVx+QQ97FpnEatVxWz+wVgVMMJql
	 JwUQw8v+zDPcoK7bjrwNKFOb2MKOBzW5GY7twWKOjzneFE5wNsIa+3+hbzL5gkPIAbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605839;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZqyE+XGTWOgC2A3mi7+hrJBzXMkQ44TzEigxTeE2xT8=;
	b=YVjJuGbVunS42mkkUy83RSjVo38Z87eZfkMgMVEzmLSR5avRo/3pbkeRChN52wIbs8L/
	 P5GlMPh69Z36yemz7C5sP1pDfTre1jMBaAgYbmI/Zwd5Z0/pRDCUij5gTtUauOiVx1ORl
	 aBxn/p/x5lbTw6K9hJMqzlI2/ZKhb8AZUSRBel02h+xo9rMlvEmCRhAUqrqmFeEKgTzdr
	 KlH7CqgDM8ezlkD3bimxuxeBgV5PFl9hQImyzR0WCD4nhKbwCfyUPcQCdUyFV2f3uqOGw
	 HWaw9BVCMz7nzQ8dYm6zHLxhiG0rFj3nONvgIQUlTZeCtmCskGo2Fgo7Ykbt1OeX7bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nL4ewuhA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ia+BShyl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E705606A32C
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:23:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E705606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nL4ewuhA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ia+BShyl
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mR5a4131722
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:23:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZqyE+XGTWOgC2A3mi7+hrJBzXMkQ44TzEigxTeE2xT8=; b=nL4ewuhAv9oyScHu
	e+ClnbT2414Iwn52QoUbnT9u3D32UAd3+XVCe7sMMh3E9BzW+1yWdSu8tiDiLWmv
	uWG1EbsKKI8BR8XwdHpEXv7Jw5v//8kau8jr070/U8W2A7Y51dGPcg4ZuMVvfpxf
	j4r0mfzBhizlcq3EVt7ZgupJQxCwmORBLrvEDVBnI0PppaiFLcQgGQ4d6eX3VQN8
	1hTKMShfesk98FYX0kkpmQt8YEhW/Cx2ormbw6NjFHpGfWRVAy4rgDZRPp/bMiMV
	/I2HNIkL+EYjujndRxemOMqUajJZrdkWp/CUsYBlctWD6/1IamvhDsurGokb80JQ
	cFzugg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhrk7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:23:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdb91e288d7so4432152a12.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795605837; x=1796210637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZqyE+XGTWOgC2A3mi7+hrJBzXMkQ44TzEigxTeE2xT8=;
        b=ia+BShylIKbIPCrYOM1gtCiA7ht57v6tLSiguVvK21cFPrItLN6NulzPhovkB8RLu0
         D6PXlgze7CgGYsCyjjxuzAvMgBZAXnjcxtmU57q/Jlo7cO5ElY9QzIxXqn+zbuyTSqUz
         XLlLGjfmPTrOPTlm7sT4mNUWLCNAPNAbqyaBuFjNjKCKe5UqOa6EFiM9UBod6/CVUXeU
         ToYMcaa0QDZuC/uJIMkCGH+YAd89XP57mm3ZoaaKh6oGU9tcLUl3a7ZszKkO77Z0KU75
         1y17DuKnlWfiwwZvZjJv4j6t81VxEwhLJx1HXrasxrjZaaAjtrmymlF0EhypttiZsmdc
         VA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605837; x=1796210637;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZqyE+XGTWOgC2A3mi7+hrJBzXMkQ44TzEigxTeE2xT8=;
        b=DAsuQsjIUY5Yy6DzZEPtvledTG2JBy5bEf8zhdX5Q9tjjyJ6GgscdwWriUtjDSW1vx
         0cg1AmK9NF0JpJxUkpF4LP5FiYJtBQZRSHCNyq6DjdX8sDc/ATA2jvbJZ6Yqzq0CozFw
         IPH8fNoZ3BQEBCxQPNaaUghPP4XPvPSoYaJ/KnhEhqimroFuQ3NARFM/RPx632TvETdY
         YXNi3sVux6OBqkPgS63VVXepW863eIRH/FDzR6p+duyz3VsKP2g7p3+DU49Ggu+3odDw
         DwZRZkW4lv6ykU1NCHMxMrfgNflFw1FRDCcHo+apYEPQJgRhHucPIgR56+9VduWUdDPe
         ne4A==
X-Forwarded-Encrypted: i=1; AL+hErHrvV0Pw1nRvJ9C0lxgd5qGqYMhQ86+a1Uw7BRan1g8m15JbMG/DDVAvbtfPdiKJqGKjKB00ZjNOL8a@vger.kernel.org
X-Gm-Message-State: APuU4Z+VKIBXh9mYnZ2g/VupI9OJueFG/gTfYO5ix4g9SigVKNWop2Ll
	M4CkCURnC5cJfFAv+JbbuJzw+x/0LmLQODMIy42SBsIU+NQEgTcvjkOdEgwYvhtYpaTIOqqDusM
	XOy+FN3k0EmjzzUfc3ePwWOVhGep54EcsTLRyDEGvbuq/lmkZhouCIamEQ6vjPwQU
X-Gm-Gg: AZFdTZfnLN3UE9+Cy1uT8QYEMrfxSrGzwpmQYzrJ/s3ZPCzaMrYTCc0P9p6Smw7+kUR
	Pl7vIhM3VrSXfs5Ww4kO1JsmmQvJgW0Q8+OTzABEJo7V2JND8+i5UMyThSnz2bVOsRjiWxG9D5l
	4CHUy3i4X6mNISPPsuqvKNMNvM5qgO+ytZuIsLBslHr0Fm0gqfszuKYs/lngeNCEYb5WSJnqbXE
	KHa2XVX8uh1GB9vImZfrdSCnPU42bW8zpcj/umLk6hSZf56fT6+IFNI4ItF530i8iMOOqjBkHhx
	WssHq/D1dcqI2H3THuW/beDmD3pHOhbvYnZgjBRz9fDmbbZoTqBWE400C+AIsFhEVi/HT6hiuNE
	ucnUVzOP39ChLWEBKVd+31/RjC2BFBdD7f1k1TntorTPxX9nkI+K8eaQrk8yqx3l8ZgwhqxaJDO
	C4vfDWQrSsOLMsgFRbUPBhs9lmKTrM/JESM2F23Y9q2JlFgoHKG84RaRH6GX37nvxFiQ==
X-Received: by 2002:a17:90b:388c:b0:3ac:e6a:1b2b with SMTP id 98e67ed59e1d1-3b41c5585femr17326634a91.0.1795605837182;
        Wed, 25 Nov 2026 03:23:57 -0800 (PST)
X-Received: by 2002:a17:90b:388c:b0:3ac:e6a:1b2b with SMTP id 98e67ed59e1d1-3b41c5585femr17326617a91.0.1795605836738;
        Wed, 25 Nov 2026 03:23:56 -0800 (PST)
Received: from [10.79.116.36] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a34asm26985027a91.3.2026.11.25.03.23.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:23:56 -0800 (PST)
Message-ID: <6493f02a-5880-4245-86f4-1e1bf00da017@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 16:53:50 +0530
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
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add qcom,remote-owned for
 ownership update
To: Linus Walleij <linusw@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Prasad Sodagudi <quic_psodagud@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-egpio_fix-v1-0-569d220a4748@oss.qualcomm.com>
 <20261106-egpio_fix-v1-1-569d220a4748@oss.qualcomm.com>
 <20261110-modest-significant-ostrich-8dd408@quoll>
 <CAD++jLkpFWWSV55LkhAa4YfckDvzB6PrHWugX0Mth=cQRYkMDg@mail.gmail.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <CAD++jLkpFWWSV55LkhAa4YfckDvzB6PrHWugX0Mth=cQRYkMDg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b06c54e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=oGwIKRxBBWau_mrDdCwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: oRdI9RIivh78ciFWNbilEK8KzwNVu9oF
X-Proofpoint-ORIG-GUID: oRdI9RIivh78ciFWNbilEK8KzwNVu9oF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NSBTYWx0ZWRfX34CMRyN4YqPG
 EnAlMe49yt7HzqBdxJTAvxbWrU1CR+zKGqDdE2ZzFvFYftA5a/b7ReWAHvVTmSdE9c+rosH5ZoT
 hf7zWqZJMFlQdEauYcxgaW5obxhAuwg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NSBTYWx0ZWRfX2GTuQGbDCQts
 3ZE1J8urbAkPfCWA0UEmWuTl74/0Hr7B6xsFuizQ6lHFTLt2wJDait53aUkebrW2Mp8LF+fXr6u
 kTj5fccqGZ3OEK2lSk0KPIwzkbA9hMhtIaRVLZhJaBQBugprLt1KPXs2SISTzPLEY+JwMhKmAWj
 arO0eVJ3r5zlsrH1tFUNZ/XlIecUKVdyjgFfEDyB3U7T0QKDETjc+uYGZEIu6d6KkGU1AUOJDt6
 i/t8KVtqsjlSU6hwEInC4o73CYePAAaJoFC1K7KjVXZ7nra7srL+rBz96jeYPpHBS47o2MeuXHZ
 2MeAn9zkjbDskhff0dDfbjAXveEict0mHFEaGcLSWk4T5+rIlKPwDH3k71dANHctEphtlZXOaND
 k467mV6IkTZt0+FHC7snvEl3BXmFvxSJOEB9ZbHwSLsCzVtNINJN5fC4TsUCcdj7XLdn4IZyDFU
 a6APUAKisfweWoA7lUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250045

On 11/22/2026 2:16 AM, Linus Walleij wrote:
> On Tue, Nov 10, 2026 at 2:28 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> On Fri, Nov 06, 2026 at 01:29:41PM +0530, Pankaj Patil wrote:
> 
>>> Add "qcom,remote-owned" boolean flag for egpio capable pins since they can
>>> be owned by remote island io independently of the selected mux function
>>> even if function is non-egpio.
>>>
>>> Presently egpio is treated as a mux function level decision where as
>>> hardware programming guide(hpg) specifies it as pin conf level decision
>>> i.e setting egpio bit is independent of selected mux function, the
>>> driver/apps claims the ownership of the pin if it's egpio capable in
>>> case of mux function being specified as anything other than egpio.
>>
>> I don't understand this. If the pin is not owned by Linux, then simply
>> do not list it. What is the point of listing a pin configuration which
>> should be skipped?
> 
> We have instances of device trees which are maintained in Linux
> being used by e.g. secure world, U-Boot...
> So something else is using it perhaps?
> 
> But I don't think the device tree should decide system partitioning
> like that. I think the boot loader should set gpio-reserved-ranges = ...
> before passing the devicetree to Linux instead, then pass
> other reserved ranges to other operating systems in the
> same physical system etc.
> 
> Yours,
> Linus Walleij

It's being used by a downstream driver which cannot update the pin
muxing in any way and starts accessing the gpio's assuming the
configuration to be as expected and the property is set in the dt node
in overlay. More dt nodes will start using this property as the
upstreaming of those drivers begins.

TLMM is a reconfigurable block and the bootloader is common across
multiple soc's hence it can't be responsible for platform dependent
peripherals enabled in kernel device tree.

