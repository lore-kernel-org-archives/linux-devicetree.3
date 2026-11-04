Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793794968;
	b=3H251WuC3Yp8AVdcWr/ijsrVstSP/GE90rsk8DWmghCmhdvnt/9BeijnB1UsdSDvpDBW
	 Y3zjLvZDvodNG8rC0zx8c16e+3Uvn5iMVmckCrtci2VNqF6cJkd/xLycJp8cy6KGqjzY+
	 2hWs8bOZF7FWTq58uFj3uIr9jUCigIakOCd9XTt+3Tb83OGmoA5RaCyDG9v/a5neMRVOO
	 whbPbJMkDB3a+2VO8oxSy8xZ+u0Vf0W6GEGkuSVr66sVQDY9U8KR1hKgNQDC36ppt+Ptz
	 8vqFyBrM+wJ62bQk5jyhtB2g0ThdxHvgzu2H6+lMFstVNYpknQYMclG+DUHUGFqW+Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793794968;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rht0f/oWrWjTnOGn/C9y300E2QsF7Wp04C0cb+p59CE=;
	b=G6m8hoFyoNI5Q3yla7JIamZuJ2FafkqBqIrufwLySHKcabVhCCLVrFu+E29hW3PkdKx+
	 m6prWKd9idkmCM25q7ItRDTBBZTVcHIRVv97ip5mc+06UvoA9eFx/pK2I1xKjoznI/aiK
	 j4jfP+N3y3OVTFlaRHVQpKNrkPY67MDVvmCZ0+gjmFOa9esWaM29pcKujs0npUgw1ZW7d
	 F9Pi9fijVUu/UgupjhNTImwYST7Bo5Cf9zWx0KtmpOKqsd1Uad6OGi8pI+nZAMHQ2MDMy
	 NxqSkCOeJaAAXjO509T3mrap5cKFmtlHZ/Ddi7qfpPUAK8LHS7NOB0qRT3xgrYlbOaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oALTAcXk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AJgJ6RU2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600F1606A31B
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 12:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 600F1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oALTAcXk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AJgJ6RU2
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZl0c739119
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 12:22:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rht0f/oWrWjTnOGn/C9y300E
	2QsF7Wp04C0cb+p59CE=; b=oALTAcXkLMxJZH82YR/E8oEJjAXU54X7v8d8+GVW
	Sc4kR793PmMP/dd5+Jx9SjOqmy0XriHDnIuzzMJHPMuTJVMRaoQwTZfhqB6v5sMa
	IorUNMrHkn9QiTuw3RWlTs31XzzDF2eQDBQeuI/v5k/ptUU6z+sDMicz2yw6jGI1
	rRoUd4I7yrcFlJXV6MlATRmsTFOZ+Dmo9TL+I4lCVmvXIsNKQXiElDviXnBvsape
	4QK1uNEjPXHmOWrdonleCa0azyjX5QmxXANgA+WSfcRoNL41QENdx9FW0U1yXW3G
	CiHMQ01ceYE7TK2Lbrtx9jt5ZbKbxsE9SEE9B1C26pnWjQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr163gxtg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 12:22:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3adeba76cadso546073a91.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 04:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793794967; x=1794399767; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rht0f/oWrWjTnOGn/C9y300E2QsF7Wp04C0cb+p59CE=;
        b=AJgJ6RU2rLOmRuZX+a7xqXvHkAIRgJA9ZRrfUhmOTLcUxWksjSzSsilGLUCgeH2HgY
         JjTImsgFaQqn+ESUXysimgCCmtYHE7RopN3kXfNjHUQY5Pv+xfvE8vc1hhjWWL+MtNmL
         wjQY5L2DUEl9GqmJELoCwVPGynkK11rTN8x7L8v/KbIT2jLJf5bZacuN6yODUM3Og/Ql
         9ojyfiN5iB1Nz9qFWl6BMZPhaz0wA9F8jmfKzzuDYumzCLNqUv4+W4NpsKb4brWHHhV0
         WmyrwmOd/+9Jsrcadz0k/y4ej2X3Ndehyb+rE6u1HJ4YZ/9/C7cWhsQeOw9vdgBKmzFR
         rR5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793794967; x=1794399767;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rht0f/oWrWjTnOGn/C9y300E2QsF7Wp04C0cb+p59CE=;
        b=xiAsCJvB4mK5idhrHbIecuwgOJz+0isUWb2tOegHLHUEH5iMLiCBoh14yzZITgrpli
         y82jbw129G6ZGUALA6Y4ceMqEkEaIKQCiFLMKMq4hfoa0MiEue9CzxhnbMI18PJRkWy1
         1g4RQe9lW5Q6ZOByUowj9pGT56zldGkDOqKTuXU1Y25kznWUg+J5ST1t16lsNy/L20Fy
         YGAFuMdGf2aRD9Y8t6HrjIcJNcWEqzsl5BeR2cNW0E+Ht2M4EoKy8Kovb+805vpyFWVJ
         AvtOziLfRjrdK8bjZHZQV7UuxwbOfpJ6qSXhZMbOVKkgujTzvNYPLZvUcC2bgirCYk01
         lrWg==
X-Forwarded-Encrypted: i=1; AKwUvBzJg/Pnsv8C7ht1cSEQRlWYpg4sl9LzjGbZZ2Wh2KXYmBeEuKXqKBpqCDm7ojWKNJu6NcBqXCMovyME@vger.kernel.org
X-Gm-Message-State: APuU4Z8FmZbZvaVMPgBlgTcz+JtHgLJU5/Mmo+IsfpJKStcAdohkttnq
	lgcyJM4+e6DlHelDQdd60iA4xE7gVaw7MsDSslXSQCocqo775vKhy2tfybABnIAbUEIKRYZcx7L
	071z+UHJqj/ZtkpDbePdmqR5CbGao1WwLxovr/I5Kd0tI2lif8Ff80Z55jchtUi6M7vy6bJpIGR
	U=
X-Gm-Gg: AYBFou0rR7Y0q3+Rv3w+N80/MQLyLekZ0fncqXZsk0S/2SaacgId34qoimBM5ocoLjH
	Mr11dOBQ1wBg+GwxuoVVwvpUVBspLYZdfNjwTxK2c0zPSJQfYlbyxFaSNhm9pX+4RurP+d6uEJ2
	tNP3twQfWRXvXm+hZi3LVU1W66/i8IZUJav0nz9WprSu6SeMQqr9zx3XUKTveCf/Tt/eVyonn4Q
	eUEvE1r7lEtBZtw6dPDchITEFs5CApI27H5ElMAGNeoMbXyM4pm0iKVoyFZMFlmNBUeQcoLZ5Hb
	cHShQ+9AMPJ8qD2DocQPtc3j8UU7/3asbP68y14sdLOTgAEDylAd88TcfhKgFnNhqD1lFJRos6/
	+KM4R7ZiG4J/ggMXJxghwVBKGFdcCafwMfZ1meXDpLZ5qXe75fR+DgVdIYK0VzepeXfozfImFHN
	/bE+B9GXkTJboRFQ==
X-Received: by 2002:a17:90b:5111:b0:3aa:f2c4:12ea with SMTP id 98e67ed59e1d1-3ae896f546cmr12767066a91.20.1793794966813;
        Wed, 04 Nov 2026 04:22:46 -0800 (PST)
X-Received: by 2002:a17:90b:5111:b0:3aa:f2c4:12ea with SMTP id 98e67ed59e1d1-3ae896f546cmr12767039a91.20.1793794966293;
        Wed, 04 Nov 2026 04:22:46 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c9928d1sm9513731a91.14.2026.11.04.04.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:22:45 -0800 (PST)
Date: Wed, 4 Nov 2026 20:22:39 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/3] arm64: dts: qcom: nord: Add Ethernet support
Message-ID: <ausjj6ScavYiYKWo@QCOM-aGQu4IUr3Y>
References: <20261101080413.1428016-1-shengchao.guo@oss.qualcomm.com>
 <20261101080413.1428016-2-shengchao.guo@oss.qualcomm.com>
 <658a44f3-219e-4810-8931-192a26ebdc3b@oss.qualcomm.com>
 <aurl7S0IEOeNHDo3@QCOM-aGQu4IUr3Y>
 <02ebb6b5-4f74-41a3-b6ba-bd8ff24ef000@oss.qualcomm.com>
 <aurv-mqf4MJEiuF1@QCOM-aGQu4IUr3Y>
 <26bef7c3-3c5f-4f9d-a9fe-bde9607e532c@oss.qualcomm.com>
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
In-Reply-To: <26bef7c3-3c5f-4f9d-a9fe-bde9607e532c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: wEWXALEMpyssXNWp21XxrctELx4twHFR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfXxT/+GQRe8QDp
 HXvm3pX4Lc48cAc1ctIzc7FOztWX2EDmFmgL+KpRZuoNCTliwK/W5cgwdcyZuy6/sLeKzXOtvnm
 W+ioKMCVmnD7YsFziVsxt+ICSXdwCII=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfXzCC41pOxgjEQ
 i91R+WTeTQGIlfoy+cKEP1dYXd6z9h04GJqnjVG5eGnXJNPGX76wtwhrz79gjCxKGs2QrcfGJZc
 82ytizuBW5RR9puLCCxbbu9GkbGPFMPlxSjG6yAvj/oC8TA7DJQRahMnyqkZ+CtRcSGgzOE5VBP
 PKJOG7i/ItJwksR8oRHuh8viClRkqMd4uJVohEbKi3hsJ4Ca7cR7d4vy6vW/fdOQhY3dKrx1KGD
 rF+7DvDS3RQzH2uMtEuNZAdbZymjZb51iQM4nvePD33mf2+LZ9J40D6PPBf03Xetcoz1NUrjd6h
 8s5nU8rBSwCQrl1B2vlypNG5bnXV5AXtBhXVNEE3x9cblMx54t3D3QKCD/rLtVxQ1ola/tveaQ8
 DlDL5+rTc6tthuSGCXMhOhL+bYjNg2heX9HT1/isuO8a6i6MYHlu5HW29kgVX2gLgPa58eFWE0X
 jSxBG0dmbS1bVA6gdcQ==
X-Proofpoint-GUID: wEWXALEMpyssXNWp21XxrctELx4twHFR
X-Authority-Analysis: v=2.4 cv=O5OsLx9W c=1 sm=1 tr=0 ts=6aeb2397 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9PWAzHYUss3Xwi-i11YA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040049

On Wed, Nov 04, 2026 at 10:04:00AM +0100, Konrad Dybcio wrote:
> On 11/4/26 9:42 AM, Shawn Guo wrote:
> > On Wed, Nov 04, 2026 at 09:04:33AM +0100, Konrad Dybcio wrote:
> >> On 11/4/26 8:59 AM, Shawn Guo wrote:
> >>> On Mon, Nov 02, 2026 at 04:01:03PM +0100, Konrad Dybcio wrote:
> >>>> On 11/1/26 9:04 AM, Shawn Guo wrote:
> >>>>> From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> >>>>>
> >>>>> Describe both Nord 10-Gbps Ethernet controllers, including their XPCS and
> >>>>> SerDes blocks, clocks, resets, power domains, interconnects, SMMU streams
> >>>>> and DMA queues.
> >>>>>
> >>>>> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> >>>>> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> >>>>> ---
> >>>>
> >>>> [...]
> >>>>
> >>>>> +	phys = <&serdes0>;
> >>>>> +	phy-names = "serdes";
> >>>>
> >>>> I believe this holds for both GearVM and embedded, so you can move
> >>>> it to the common DTSI
> >>>
> >>> No, this doesn't apply to GearVM. The SerDes is owned entirely by the SCMI
> >>> server firmware for GearVM variant. LDOs, clkref, reset, and the per-speed
> >>> PLL/RX/TX programming driven by an SCMI perf domain whose level is
> >>> the link speed.
> >>
> >> Right, but I meant the assignment to the EMACs specifically
> > 
> > The EMAC0/SerDes0 and EMAC1/SerDes1 pairing is indeed the same on both
> > variants. But the serdes nodes only exist in nord-embedded.dtsi, since
> > GearVM doesn't expose the PHY to Linux. Or am I missing your point
> > completely?
> 
> No, I was just completely sure that the nodes exist in the gvm one too
> because it seems like they do on lemans:
> 
> https://lore.kernel.org/linux-arm-msm/20261103-sa8255p-eth-phy-v18-1-b00cc2fa0404@oss.qualcomm.com/

Ah, right! We will likely have it for Nord GearVM variant as well,
so your suggestion makes sense. I will update.

Shawn
