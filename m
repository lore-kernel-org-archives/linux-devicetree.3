Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003763;
	b=jejbL/PfNr6Mw9Lg0B2+NCdUZvCjt4jdxpGCzpALxgtfV8zGAFpjU5vEHMvp+KkSiuER
	 X/RTnR6HPZkZmhqX02BmrcFz9i4vBiUHtY3JXUkr7eyBXXgt3nOKozQ0dDUIaGgluf27Y
	 NxfRVtNy14zYbB5/UBdDoz5UR+PjaGsoUSxX/x1Twm3q0oZazkVmQrOuF8WJKb5CT4C71
	 +yljvCPc5vAe7AJJYlsZUr7u8CSc2x/mh8xhPBou/HCl5VjDeR24gzbVyvwXW1zKhmvdF
	 fbpDXTY04SSkwNVoNLqUiwsSBPpT3kAk2lMD+zrWi4toW9wmOKOslG/7VeKjUjeDxAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003763;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fL4ijXnPOipnQQlloELZhTJsYgcVrNR+TVVQ5/sunBk=;
	b=vwIoAaNHpcErGjh2+QKsQsGZqSih42zR05z/qyJg4Trr5Y8PIT05ANhbZ2tHpJJK67xE
	 9d18r5whyeNXg4IiBy5kbl2ajhzBDDX8da4YWEutKe4wzDhDXOyO/u6sd4v7xvvXy2Fz3
	 ybdxX/EAPw5HiMZrwQbdKfOtKP1qWt35TPuQc6aCQ1g3VYAFjWvx4rH5LCM+zvMUm2RwE
	 3RuRYWGPSedIA5T91F6LHkort64wa9pO1MI3xY0Wg92x/ppjXgwnPED5q5zVQwXuOxZOa
	 WIkrzjSZyfyjuCHvKR9/eSHFmdcQzxCKUqsttCVTay24kaYhUTyEUKuE+ALsO/m4dZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PXWe90Yh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g6Cf1mMs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67150606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:09:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67150606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PXWe90Yh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g6Cf1mMs
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIBknmU412590
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:09:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fL4ijXnPOipnQQlloELZhTJsYgcVrNR+TVVQ5/sunBk=; b=PXWe90YhBRCaXDkh
	T269VXdOqRgbO9IpXhunYqlQ8H9+L5nWJr3u3nG0ftsbFJl2HCj5hQhslXSgLF1y
	IeHpp1ZemyItj6c60oPEm4sC6dgb3aMpMn6bZiBYNA5XYqVoO97qQWSHszVpyRrB
	9KHpCD4S9y2C6pstw0vYEf2jtBlTK5tF4YJhgXG5zXCc5daf3ZSvEOuD/AbD+WoY
	biCXG5q7zDmDmSWoYmCZQDxmf3tl881/GqUmEHj8uN08wxX0f+90ARBN5yC0/Xsn
	BsLt51qqDAJt343zELgFcTrmopyB7FhH2kweYJUtMtGzNGQQO92EUdiexldTodq6
	KZhXQA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8tvxr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:09:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495dd0f07eso194659185a.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 04:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795003762; x=1795608562; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fL4ijXnPOipnQQlloELZhTJsYgcVrNR+TVVQ5/sunBk=;
        b=g6Cf1mMsEH/3BzNaLLzANb35oy7i5t6+VY2LTULVIOCrDmZCfEuxGLcP2PiIeddCe6
         UDRb/bysO7uhOOOFojx/mCUc6+J2J8nSZsLBQIKKhWIYX11tFFML4GyMbqAD1Av/j9pl
         r1tJTei5XWB5X2aNZ9lnb9lwUgsBIz6Jv3AjnnCrOh5XI8Q6YT7/KKvDR2hsOVLXaCBC
         OPy9S52DcTvFW/JMjS70Mka6RGDm3M+TY06F8g6x3I4RhtoEnrhibfsdvAM1o/rvjqPS
         pccvTDkcEv85zhB2NRqWwuqhKrqAlrWsgEeQmYdzkcogerQuOImJBkFwRFwsG5Xb0G4P
         6s+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003762; x=1795608562;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fL4ijXnPOipnQQlloELZhTJsYgcVrNR+TVVQ5/sunBk=;
        b=l0gkcLQIMWU0gz8Gfk/ZWeNEpA8J5J/Rl2mfSTs0j32NA/Vm+NvwErVGSYhIMmz6zp
         8U/uOXsmETO1uujMTEhgHokoMqbhpGiRzsbf5Nm4rGYbxpkkyncCHXwr0ms1nameK0JV
         k1lSF/Lf5rpWvGm+u6nenQJxlBQXe6gxSeF4639zwf15H+80FcPb4BPWuw3hLoYNqrFf
         hMk3v9Uvc7A4j1dkuEGAVPEHkDwXkSc4IxDITmFuVYKIATrsNRFv3YPFlbnM+D3W5XVy
         RIvAWauqp3ks5e/OADRuPrQT50Y2kRqfLlghwhepA0XnwxTJFyXZi0+5tMI6/fp/Cvb1
         0ykA==
X-Forwarded-Encrypted: i=1; AL+hErE0mCG8XAkkPHfvwUSwEkhsRPa2gz4AkIuOBNLQMQ7OQZ9xk3/VjjlAAF3JA7WaA4rxMfthI4gA8IJA@vger.kernel.org
X-Gm-Message-State: APuU4Z/9USmxWVo1g3GulLUPGnAmzszreZWZ1UA37JnjTGfZF0yy9ZCb
	xvIwop0l5YBevce5k5DxO5aedONjNTsZJZifDuHoy1rbL5bU3EQZI+tlFmE/YjM4SjPyOg4+San
	rBv24fv9iQnfBSQxbuG5SjF+ontP9vx04qEWAb9UTVkmt5ztdOx2A2yW1ub9iaWfC
X-Gm-Gg: AYBFou3MZ04SNCgRr0y16PSSLBQZV3gwsA6DI0u7/DYW/u+sKgI421DJIx8O8fDADP8
	IhwRmDIUKqjH9QOq0WU6zJd0dzxvmXQ45mMVgyDMuWVoLzGvQenxxaJlFDXSXx2b/cqrvmZFwQ5
	RvnynOKeGKuv5B6Bl6vb4pmCUM8qph1UvZq8yE0BVA/0jP5Pn8EPI+hT+sgmASmzWtZrhqg/dKw
	+Ch2qvl4zA8L0TYt2RR9E7ufxIV3pg3a4RVLscXSXqaW8+vjUBxvVJlq8xBT6vBilZn8utoVdOS
	vV0pQ91yS7x9UjBJlEGf1ZMWlF08EvYG9hYy3+pUze8BTDxyRXuDDz3wOHIVEiycRrlSIdh8TLo
	aNz+9eH84ucZkx2d/pbYvg3yKt5vy2kqAVtoHW03GVI6uskqF4H5dq3mr58+kPae5APC+VfKflr
	0=
X-Received: by 2002:a05:620a:4381:b0:949:7b2c:671f with SMTP id af79cd13be357-94999658ae7mr397172085a.82.1795003761640;
        Wed, 18 Nov 2026 04:09:21 -0800 (PST)
X-Received: by 2002:a05:620a:4381:b0:949:7b2c:671f with SMTP id af79cd13be357-94999658ae7mr397166285a.82.1795003761030;
        Wed, 18 Nov 2026 04:09:21 -0800 (PST)
Received: from [172.20.97.102] ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d001a64sm63760025e9.0.2026.11.18.04.09.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:09:20 -0800 (PST)
Message-ID: <96e3cc39-d10b-4743-bd9a-d683a91fdf34@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:09:16 +0100
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
Subject: Re: [PATCH] arm64: dts: mediatek: Remove undocumented, unapproved
 aliases
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger
 <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20261117130556.234785-2-krzysztof.kozlowski@oss.qualcomm.com>
 <3882ec4d-9f99-4419-8914-19c3a2a3cc46@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3882ec4d-9f99-4419-8914-19c3a2a3cc46@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afd9572 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=QXGhswp5__15x8Fhz6wA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: dpQoIMZyOuK_dxXQBjotSO52JsM1QkUJ
X-Proofpoint-ORIG-GUID: dpQoIMZyOuK_dxXQBjotSO52JsM1QkUJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0OCBTYWx0ZWRfX6VMvZH5MZmJz
 FQN8Kiij4duaANZXBSJ1IhMzFZw3+eK0jIJoKrYyF5S3NWyqH2Z48/K0Nb87r0ezq8VKQ/cJVRS
 T6r8DgwbIGbf3qFrxZ5S4XJv6rcYn2KR0BFFH7LP49JxQGVD+3BDctIhUq0dpseDI0/pLRKEdjk
 oJ8Neql1uk8u6xfanfx2rTV4AWbi/okwywXTXaj16LMIIrptkJS+ECIyyHFRa75FvBfrvoRSFaA
 nz7uQGBtLSgnGjS01HWFjFgfRA168eBscSS079LiYXJFi+b5jANMQbKQadtksMTAL7eHBBeptZC
 2Mihdw/TIo++1KmS8brisQiKuo3OVYqj1b267/J7EIgOZORdaTEpe427TUgAOE0bs0LBaf23jkj
 13bO+JQ+5ZncnyGPoza6NcgFOZexrIdqXy0+ZZJvGaB3rKJBtocBmGbrLzQM9imRzsLQK1znF2e
 rs8MNIzAuJqUSmT9yCw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0OCBTYWx0ZWRfXzyiLmMxZwFQh
 XJUtQ9G5nQszkyn9BxyomsGHr61iu1JPXb7pWEvsqk4HMa694GLA4A8nCf9Mb/FadF3XFHBBcxx
 7sg+gYYh9jGGnmsPeqBmZEYxBo6yMyk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180048

On 17/11/2026 15:06, AngeloGioacchino Del Regno wrote:
> On 11/17/26 14:05, Krzysztof Kozlowski wrote:
>> The ovl, aal, color, dsi, gce, rdma, split and other aliases were never
>> approved by Devicetree maintainers, because they were never documented
>> as actual ABI.  Drop them, because no new custom aliases are allowed for
>> years now.
>>
>> This might break users of this undocumented ABI, so these should be
>> updated to use only documented and approved ABI.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> That'll just break everything.

True, almost everything. I suppose few aliases are not used, but rest are.

Well, it's a start of a discussion. :)

> 
> I do have a mediatek-drm restructuring series that is partially resolving this
> situation, at least for some SoCs it's getting 0 and 1 hw instance id dynamically
> recognized, but with some caveats that could be unacceptable (as in, if 0 is
> disabled and 1 is enabled, 1 becomes 0, so it's not actually resolving anything
> for real, it's just making it tick right when stars in the sky align in the
> right way, which for some SoCs is reliably possible without side effects).
> 
> In any case, all of the ones that have only instance 0 (and all of the instance
> 0s) can be removed even right now already (still needs some testing to make sure
> that there's no regression), but everything else can't, at least not until the
> whole restructuring thing is merged as that'd break things.
> 
> Worst part is we have two new SoCs (MT8196, MT8189) ready to be upstreamed here,
> which took almost a year of development... and it also does rely on the aliases.
> I was in the process of slowly cleaning up those (as I said, there's already a
> restructuring that makes things a little better in this regard), but at this point
> that'll need to be done with the highest possible priority.

That's unfortunate and still new DTS/DTSI should not come with these
aliases.

Best regards,
Krzysztof
