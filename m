Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794204338;
	b=HKf8oarHP+WNQgnIYj9fUXqXCvT38ubAgafwZB0jCRt17RwP1oM1OyfCs1hySsrfaWMj
	 i8LAfRlzpH0o622Fe+png+vajjKDNrBwKRBKytmyzVSlVj2Ng1WFdg/C1AZ/pRSFZxaGt
	 EHCgkNiMbTexIIxB+XOp7GXtPC/w++mM6/leQzDZDSdCDa4QN1nqONaTxO0HfOq1Y8/gs
	 poNHH7rEL7yWQJdq4SNl8+Lw/lSjc+TQDRJfYpNpbtTJzsIbDP80WpkvY/j4dQ/uWxC5B
	 EEO8FthOwiqbXgksMKbP8eCzXhmqV9Ws26tTtRU98xzG8rMkFF3T+GAAc/d3VQWlGKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204338;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sFw54XMm1ori2CEdTotFB5r/3eWSVETSteMxiL7oSek=;
	b=DWwIUwWphol+tvXB7BsQxDptevgAg/tCFslBd3ZxsohpyMiTjNZSS4lz7H11HuM5I6jb
	 Nz8ESQILpMbpKUoqTs+q+gCyjPi5EG9Z61fFa4+yBpojSVuA1e1ypPFLhTIb438U/VUll
	 VUUjdT7vrrsmLDFR0F8JkpuXlNRopq4Vt/gGrScXhxwslGn1xc4nceRPKC61JjZN+NQbL
	 Zv52Gx4ewBig6IM4VTeCHgDDMXY9dk8fmT69SK9BuJOEZLNSEI/+sphxsYSkRIULSMtB+
	 7HqF4p7kFVHpRuBulMtt2f2WgFjhuStIkUCVXlmQUL2x/VO82Ka1Vmpg3q5JHqi79IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="I/BElP9g";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Igzl1RFv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BD3606A323
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 06:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7BD3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I/BElP9g;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Igzl1RFv
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A94B0Zn3382445
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 06:05:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sFw54XMm1ori2CEdTotFB5r/3eWSVETSteMxiL7oSek=; b=I/BElP9gIq7VJCxU
	7eiC36NsIwEdpPI21E+0RjlT0c2KJVUMIfvB8gadfxCrHi4XGO8x4OGqOz178dQB
	dZoRaKX3+ShDm3cqVD1WciNXbVSLwLUwflEa3urcaQIp6ee85dcXTH7YvhdzOkHL
	pZrtdId59YgeBlbY+8/siqsmOqCAk9b+F9CMhnzVj1mZTrMu95KnKq1KqYYbhCrt
	eL3I8TTXBpW75fMtC/zEKgaTuphMFNX0IpfdA+Ll028zp7gqUu9BHwBKS7TiG/WN
	La7AUo22SCxNQKFGkrZZYpjgsEP9VWVG4TYg0MDRyLS5MT7a0dBVXm0Zgi5Seb8Q
	wob8HA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2gb5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 06:05:36 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1a71dd190b0so2332117c88.1
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 22:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794204335; x=1794809135; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sFw54XMm1ori2CEdTotFB5r/3eWSVETSteMxiL7oSek=;
        b=Igzl1RFvmyQSNJ0MkU0mlqFEULBjA8ENnvWytXm7zluOJYLs4kaVX2MTNuM/wP8IXk
         V5r7b4CAbX/9Aw2QdZUrawnciFeZx+ARRF+vj4qVBt/p7eDS84beSx7oHGelQT8KBAhi
         ldv4ljHES4a9aeFkfUO3ig72Q0Gs9FwPyvOAO67eT7NT58hxguxJrg/iUq2A2r4h8wx+
         u7JVlpSOmTBMZ2RDrgDV0IvKWNv+n/TQGcfaymtDmbc7GLqWVYqjB9Sz4LLZn7u5MTJ2
         7wGYkWfjyw9LsumVFCNwBdXpNiOUsu8ulwCRahOH6+b+OZpfVJWr1rLpXnAxNLT7Wc/r
         srXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204335; x=1794809135;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sFw54XMm1ori2CEdTotFB5r/3eWSVETSteMxiL7oSek=;
        b=bLQa5EvNzhWuzxKtJCFcdNxVVJi/zJ15laYW0vOqEdFAmWK5TwLNXnEMHLFCjshf3v
         s2Rehg6jjLi49Ka+Ws0Wq0MA+3/jXx8TISaA/wKBuCGXAKFsgLVS80DJpbhS1ELCsiSN
         ninb67Xhd0kU617Uf6v37I/9DIjA1h0+e65VeIKfgMl5WkKkuxOq2N9vQP0Ug+4GSb2h
         c/ckou0tYuxmr/PmY/MXXF1u4QxgMA++t1Wjrs18b7wnW4P0Eb80IlzhCbVtmjlzUJsb
         UKfr1A3wY39UapAAvrrPHWXlVPOSgVWEmLZ70EuyT07i4Rgae/dEKPze00l3p/a1PP0A
         RBjg==
X-Forwarded-Encrypted: i=1; AL+hErGsoftX7A+UZwtyUc3QK+BpU/zjNLdVYFNTYninWibVDBa2yTuWtiHL5WH/V96pxV52gF0s+P3U1DHp@vger.kernel.org
X-Gm-Message-State: APuU4Z+xC+m4ehggTXWMW8SlFDiVRnUnlCMRLvI3cYba0uSu9GAdElrw
	3wcdqIjFVovbr15sHqSRhGBIAu0GFkICkhCZFNQsBHxuSj0+xb0dysZyjBzSd+LEunVeL/iQASG
	rrZ7IgEwaEU4oLF3qdkiy84V3qrkbc5a2/N3hA2UVvw+fPQFg+VsiZFHzRXaMuw3H
X-Gm-Gg: AYBFou0CuH4qU3fyDzi2+RmzPE86fBNm3ydFbiGAIhedG6O+DGzxaVsaAXAorAZ1la8
	pwljS8Ckgbx22XdWUMgZpEsxcNuEZVFBVuXougbbZlJmTg90x4rJiaNgcZNl8oIhl9VBOKeoO+Q
	ZD4h5POEwo+BRj0H5XjhHS2xp6W0us+6ZJCfqxluUbJu4A7r44PA3NoLYq8ZSesDAFKIO0moIx/
	oruQGe9Kd9hrhE64E9VH2WnoPDDBZkI9YlRixBStsNuCugfUFF36A+WdfVhpp1Y0k2XLJjKS3+g
	qnswz+VSaA8P1sfII42SGOAnjc4Hw6nXEeRvX6W1hODf9Nl7WcYkCGqcvdioqyebFzsDmEfKm63
	nFCMlIdnausp+Y/IlE7S9LTS1J2AQBTxUx5uT9fm8sae+6nePhEwZ1Smv+Q+zOcjq/KUK0+AGdT
	g=
X-Received: by 2002:a05:701b:2412:b0:1b2:48db:23dd with SMTP id a92af1059eb24-1b39fe87c0emr4454211c88.16.1794204335375;
        Sun, 08 Nov 2026 22:05:35 -0800 (PST)
X-Received: by 2002:a05:701b:2412:b0:1b2:48db:23dd with SMTP id a92af1059eb24-1b39fe87c0emr4454167c88.16.1794204334743;
        Sun, 08 Nov 2026 22:05:34 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e936bsm12513090c88.6.2026.11.08.22.05.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 22:05:34 -0800 (PST)
Message-ID: <5e0f4424-7194-413a-af7c-f6e74d07392b@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 11:35:27 +0530
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
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,glymur-camss: Use CSIPHY
 indices for ports
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
 <20261104-real-nebulous-ostrich-017e92@quoll>
 <72064a9a-1b2e-4c24-99e2-2cc15a8dd7f1@oss.qualcomm.com>
 <a2d3190f-bfd1-4548-aba9-a186cfea878b@kernel.org>
 <c5af7192-c923-4fbc-bbfc-7f03e310fddb@oss.qualcomm.com>
 <fc9acaf2-f214-434e-bbe1-88e8e1af7683@kernel.org>
 <539842db-c672-4549-b861-4a6f3be47556@oss.qualcomm.com>
 <d586b7b3-675d-48a8-b0d4-564e571ef69f@kernel.org>
 <CAFEp6-25QrLAF=-KgGJ-rC9pDpGa2YgoQAMKxU-FoByu2CJpMw@mail.gmail.com>
 <1db9bf48-01d8-44fe-8dd2-7a3c84ecc556@kernel.org>
 <CAFEp6-1fSPP41cVFmu8=0z2xibDpHuH5Lxrw7W_rvnt+Fw9EpA@mail.gmail.com>
 <62fba00d-831c-44cc-8d3e-083a95abfbe8@kernel.org>
 <qKk3s6LA2dFNbAVvrsOlf17dn6zizSiyVMf1rJNQOvkvLGxswT_81cDlITq0atMX71Sw0VZu6u9WHK0fS1bzIQ==@protonmail.internalid>
 <CAFEp6-2_opRq3pj6S=2nDFxXBv0waeyGBKSxp3t8OOe6vvKcoQ@mail.gmail.com>
 <3df59469-e665-4901-b4b4-512604194ddd@kernel.org>
 <CAFEp6-0keBgVWbBPCghkxMQAQeLeOHW8By7sQrqhjSGtJaZmEw@mail.gmail.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <CAFEp6-0keBgVWbBPCghkxMQAQeLeOHW8By7sQrqhjSGtJaZmEw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af162b0 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=CJrH0-i5KYxoBsuygRMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAyNCBTYWx0ZWRfXymmTIq4ebL+X
 woia7K7xz0D0F3q1dc1G9h71jaWbaKt61+EV5f/Ii4em19gUpHftoovPsGlsFYTz9OB9UZLIcT1
 ijT14FnswzXTTTMr2z4q0pGBwHlAhATtYILxDDV6g+H/XXBfwp7zvPRXhQRtvWoHkfGzE1fcUeG
 pyqsItFCU1E4plQJiZW5TlgsX546rbaY/XTfGJmt6QrirOXLxlvDDEwAjisexF9vLUrzHNtoC4t
 O8AlfJCNRSxdhNexneYFUMCmCN/gDUD4vB68185SWA3CM8hJthNUEJs0R1PfrqyIOMyH+2t217A
 98mjs2K/ayCdaDmT7/aG7xx+L8/tYKGIe8RYNRrbBwFqprGLfMAW0QFtWG5wiHY4p0zTnz6F0kd
 DK7solcixx6VbR76iNIeKj+W0qnijnEyVlBQdO8ein7Vr0axSJC0mtfTEKs2+oQtiQvP/uXiUGL
 XMzySs4GeRDzGhiDkKA==
X-Proofpoint-GUID: 5e_ddcUUv8rl08Tqdwb3afdM5i799YZ4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAyNCBTYWx0ZWRfX83J6VTL8l0h1
 /bii2isIrfHdlvOEhkDIxNhY4Sd1WCz5FbUpXEqfpGWhYZSTHJ8356mPazve/2kXBbGmcqymU3r
 fnWAUzQdduXGHcgGfaaEH/hKJoVlZ/0=
X-Proofpoint-ORIG-GUID: 5e_ddcUUv8rl08Tqdwb3afdM5i799YZ4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090024



On 05-11-2026 21:48, Loic Poulain wrote:
>>> Alternatively, exposing logical port IDs such as { 0, 1, 2 } also
>>> makes sense. In that case, the driver would simply maintain an
>>> internal mapping table, for example mapping DT/logical ports { 0, 1, 2
>>> } to PHY indices { 0, 1, 4 }.
>> The media-graph informs which PHY connects to which CSID. The
>> port-number in the DT really only identifies the fact a PHY input exists
>> - it should be considered a mux in front of the set of CSIDs with the
>> media-graph being the route.
>>
>> Since the route is runtime selectable, the media-graph is the boss, not DT.
>>
>> You can try this on any CAMSS device right now, PHYs connect
>> independently to CSI decoders.
>>
>> PHY_NUM_SEL is derived in the driver, not taken directly from the port
>> number: the port indexes csiphy_res[] and csiphy_res[port].csiphy.id is
>> the hardware PHY index, e.g. port@3 on x1e is CSIPHY4.
>>
>> More work should be done to represent the fact-of-life - the mux. This
>> was discussed extensively in the standalone PHY series.
>>
>> The ports being numbered with the PHYs was a consequence of the PHYs
>> living inside the CAMSS node - which we have the opportunity now to
>> break with and should.
>>
>> Port number in DT should just be a linear 0-X for the number of PHY
>> inputs. Which CSI decoder that port routes to is still a runtime selection.
> I think we're all aligned on that. Point was not about describing the
> runtime muxing or routing to the CSID, but rather about describing the
> CAMSS PHY input ID/link, which corresponds to the input of the CAMSS
> block (MUX input).
> 
> So yes, we could argue that the port ID itself has no inherent
> meaning, but it acquires meaning through the convention we define,
> since we still need a way to map DT ports to CAMSS input IDs. What is
> really changing here is the convention used to describe that mapping.
> So, for Hamoa, ports { 0, 1, 2, 3 } would map to CAMSS PHY inputs { 0,
> 1, 2, 4 }, while for Glymur, ports { 0, 1, 2 } would map to CAMSS PHY
> inputs { 0, 1, 4 }.
> 

Thanks Loic, Bryan, Krzysztof and Vladimir for the discussion.

Krzysztof, understood on the DT binding concern. I should have got clear DT
maintainer agreement before proposing a binding semantic change, and I will
keep that in mind for future changes.

Based on the discussion, I agree that for standalone PHY CAMSS DT input ports
should be logical and linear. For Glymur, that means using ports@0-2 { 0, 1, 2 },
and keep the mapping to hardware PHY indices { 0, 1, 4 } inside the driver.

Krzysztof, does this direction sound aligned to you? If yes, I will respin
accordingly and make sure the commit message documents the logical-port to
hardware-PHY mapping clearly.

> If you look at the mdss_mdp ports in glymur.dtsi, you'll notice that
> the ports are associated with their corresponding INTF numbers, and
> interfaces that are not present are simply omitted. As a result, the
> port numbering contains holes, for example {0, 4, 5, 6}.
> 
>> Honestly I don’t see much value in continuing to treat port numbers as
>> hardware mappings in DT now that standalone PHYs have landed.
> As long as it is clearly documented in the binding, that should be
> fine. We will need to introduce a mapping table for platforms that do
> not expose the legacy PHY numbering, or otherwise derive the
> corresponding information from 'somewhere'.

-- 
Regards,
Nihal Kumar Gupta

