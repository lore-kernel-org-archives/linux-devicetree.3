Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867395;
	b=IngAr91+Eb5Tt42vsjOuyzBvaSgxK0mDA7XYa+Sh9a40UtoGK5oQ6LAQ4DY4GxaE5NQZ
	 CVfSKqNgHNw7eoV21Ab7eS1olPsmGFZrtOrJdY5FUYXqG8grXTHOFp74RUu3rAkXQxzVj
	 5luzDSDo0ZHfdUK17TbGMIG64SwkbhIHwp8UjChTTzeW0L/KBfHXaa/rsW1gxmR5SKZRB
	 E/i/bGNjj/t/Qm+P82ziPmvNrfBvJdY81tr/uPbwIa0tkyizZhUHfBhHlPVrgX/C3ODIm
	 CgPlF1etRh1B5UT4ahDWoaTyS5wgSeamrTOZ8oG2O53I630c/kgEZ80DllG/8RzAGsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867395;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FMGEReJTj+oAHaCArndjVTrwh1iXUa0fwaYYB4jT5wI=;
	b=LllcMT4RvOY8CrVbB0YyQC3A0QfoWOCccUlxyFDLKvZaOXsfgadLutPmGQTKg42u5N23
	 S1sdeUgH1cahGJn4rYwDFeKrDcsuTNbPyVfoATStMJ/Zyhj2WkO29mFKVcsLTX7gW4st8
	 yyYVcQRTIiqPtQGk50kTV5XOvE+4NcNVnHY7ND9wZ6OVFOYnrkjRjFewg9nn/6HD5ZgEk
	 IER+1WM13ZdEnJy9k9N8zR4ix4TCLTUu2LPUAYy4agl2q/Fg9IZp4dobGNyEVTmbkdV3m
	 sZ3yzLoxQSZ3xwBcXb7B/d7nxA4IMJpLc/u0ekJPaXSfK4EWHFVrtYyQrHnz2a8/x7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p4L8Q8px;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R5vfObo0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC422606A33E
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 08:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC422606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p4L8Q8px;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R5vfObo0
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56U1Tb4138353
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 08:29:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FMGEReJTj+oAHaCArndjVTrwh1iXUa0fwaYYB4jT5wI=; b=p4L8Q8pxyOPFZ+ir
	eqN/r/lNwi3swCV84aPKoqPV0iwM7IJSMMyMI8OCd1Wld/OS+BWIk6eRpz32L0hM
	1ciTqMhj3+L1LXWzOnLj6al7CGulHEnTjXJbVYkCLalyHo4VZUlsXCeifVkT8ADF
	2n0M+X2qHHnRYeNjLiBQRyWeFbZrJFPm3eKk5UJempKtHsL1VxYryR5EtFhz2bYN
	714qVSBbfHMmzzjUKAIeWSjzLChnw0JUODUcpk1m+nvPPMBrJuBAN2/o/tTPhUBQ
	w5W35zJeX+/hP5kQePdIlHv61UhWercsx9Iw4jUdgJAAArFq6XAOCBFXUy/u1M4s
	QOB+3g==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrm9v0htw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 08:29:53 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-990835cec5aso359381241.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 00:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793867393; x=1794472193; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FMGEReJTj+oAHaCArndjVTrwh1iXUa0fwaYYB4jT5wI=;
        b=R5vfObo0KF6yQfI7hbUgxpPjvH0euLzImtFk9AXBcZCv9C33dkogjgVFV/G3JiOQhf
         kPR7wCvtfq5pWBkRG0HdIRstLXXfh/dWni450ECVgTKSkUBYFyiZ3nuU8iDh6Ew2sMPN
         jNirDBwSXkatd7acwoqnigfStp4ltlX7Zn91xsW42Av1/au8NTY4RHIQCUndq5xyyn1I
         5NaBjKKIBSR8HkqqGQVx8sZPgycpIaNzGD1TSkym1WuzPWaYEpyd8iSZeldOxxaNKsrb
         T7r/SiVBXsHWUVYph3WfuI6TH0fIQNFydfAURJ8qpH1VNbw7DFZj+LDa99DanopD89N8
         vgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793867393; x=1794472193;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FMGEReJTj+oAHaCArndjVTrwh1iXUa0fwaYYB4jT5wI=;
        b=hlPd5CiA2q0M4Gb9D3bpmOs6iuQNh2mrAOjDOhwNj4NWeaY7fdwhqVeAQpMp8hIM0U
         iF0JbujrgXxlyMn60ysxSDqbcauQQFkkMBhNpkiS+zi9FfHTQx+WO4RpJRuOH0XDNl/v
         L0vkfizPHHLhopoXwnJ0fUGkxyXWiTlbXlABdBeMpok/JBcWkfjrBlBqLHsuJi3vItJ5
         ydCHXrvJh6uFB9Gd63Y+gvX00EEp+ifAogWZdpFlHU+4ZwFen3vGeqxW3NVsJTOmbjhG
         J6TKAWBNclIP7EjBUh/YyOHLVSU9auBXn8xdyq6Advue3F0h2pKk04IIbJklXQxtJGYT
         Fwug==
X-Forwarded-Encrypted: i=1; AKwUvByur0gIgaynsVuG7KF+jzr4aZeBITkm8KB/0LOkAYOAdjCG+jIb8vTHVCHxTl5SxbmfUdo4vHIFZV7g@vger.kernel.org
X-Gm-Message-State: APuU4Z9uMdnXZ44Y80ThhEb+32RS36DALGvJWUtggEDyKt95dqhjiMLq
	GWYdZjHT85V/tj1aU/V5QCpiIHw1xMBZRprHt6BwM9Qx64Zi3UOFFhkUc30L1fLDI3XqoP88F4b
	VfQdLe22rTL3abM22vhNAm1DDEGDv2t+b1nEDNR2XVfouncKijXT6+M0GVTrW2UtQ
X-Gm-Gg: AYBFou3JW0zmJVaSGxcBPdDAANWBXqA+obQ0Q5zje2GCmVO83ksvUMisa+WB6yjtVjc
	pQo+QDIHt/k+W7Np+GJ3U8uVkzyZte28n35QgHwsCXf9OH9Hos6t7k/jshYbyIp6du1cBokayMq
	6F7L7AAfYc4Y81BsF1Nvm7aOTV66sspo3NVhSicdixjtQ5j/AIyOjgAJaZ5INhEMPy5A1RoCWvB
	qe8pxLPq3SmcJTK7Ex/eFflAfSbK9Kr5/yB5cmDqN2oSKXeXJeCf9rg4NTlEGvPh3gYhLMxXhpk
	V8CHqbxeyQAMh54zRFJg0VxOaoZDLBoaaflMvc73p4eNc0wt9B1rRhbA17OhRwykiQ5ieoez+Xe
	XIBX/EiUSQ6N8k3gqAmTWjPoONxO1KpbXl585mFvkEJNi2rFhIYKfKsAvoOJAorPXpnKAdoH/Sg
	==
X-Received: by 2002:a05:6102:a181:10b0:7d2:8735:49f6 with SMTP id ada2fe7eead31-7d287354e7cmr708752137.42.1793867392565;
        Thu, 05 Nov 2026 00:29:52 -0800 (PST)
X-Received: by 2002:a05:6102:a181:10b0:7d2:8735:49f6 with SMTP id ada2fe7eead31-7d287354e7cmr708746137.42.1793867392116;
        Thu, 05 Nov 2026 00:29:52 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecf8ef85sm9375427f8f.27.2026.11.05.00.29.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 00:29:51 -0800 (PST)
Message-ID: <5de385e0-1ed7-470f-a172-bc7c8762e0f0@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 09:29:48 +0100
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
Subject: Re: [PATCH 1/2] arm64: dts: qcom: msm8994-octagon: Fix side touch
 interrupts
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Gustave Monce
 <gustave.monce@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
References: <20261104191700.676773-3-krzysztof.kozlowski@oss.qualcomm.com>
 <31d38c50-665c-4f1d-b191-55ce5d38660d@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <31d38c50-665c-4f1d-b191-55ce5d38660d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzMyBTYWx0ZWRfX8mt64N2sMija
 mlAOGuEteO26NcjYcD9JZMZyT/Kt7uC2ldnoKn4BPmx7dNNCadbEwAYZ+uHJUMXXKxRU0wCjAJ+
 9FUyoWWNsqlojvN7rIUgo1EeOhq91Tc=
X-Authority-Analysis: v=2.4 cv=KrHYSmWN c=1 sm=1 tr=0 ts=6aec3e81 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1eH2j9bIuW7Q0crD8LEA:9
 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzMyBTYWx0ZWRfX652rI3bkQlQ7
 /i6nbSogDxQ5+IqtxvTjsBmE0IDI6pFLUFPuLgXcNFBqgsyC1xoC2G25yzcdEGTbh2bYz07YQSv
 ECRs80wXjHvDGZ7DN9GNuihc0AiXfWjWnG+Lc1LLO2oEmKi+g9pfJugg07OAtKUHX2CWAMReduL
 ZZsusgtTS1kAPzAraLGwYp5aEq0pNpFek74annmdyeoe/QYluUigrl6Vc5AKjLeYlVjBkvjYW5h
 xPNjqbhY1qOIs5YPRAQSCrotXuAlVQAVIHEW/XSlbhRXJSJWJ6JZpyvqOWFvT2NB/O56vi63Bqz
 OcNlzoHLVkzon9Ll/fgNYa62ScE8i+UqghJS7S8Qw2S2CivhsubLZtW2T2oAbFqsOQJtmpCGyTu
 eyplAdQ8OG0X4+drtBNbUrUgy9ppI3zORokTGThuUrFaa8IaBaQrL5vS61mt6kSMGC9CwXXj/QO
 de1Sg1kr95BD//vYWRw==
X-Proofpoint-GUID: tfNBVw81fVL1xBCDe80rZfm4dfGZi_yC
X-Proofpoint-ORIG-GUID: tfNBVw81fVL1xBCDe80rZfm4dfGZi_yC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050033

On 05/11/2026 09:07, Konrad Dybcio wrote:
> On 11/4/26 8:17 PM, Krzysztof Kozlowski wrote:
>> Interrupts property takes a number, not a phandle.  Passing the TLMM
>> phandle made most likely the interrupt as broken, which could affect
>> touch operation.
>>
>> Reported-by: Sashiko <sashiko-bot@kernel.org>
>> Closes: https://sashiko.dev/#/bug/linux-759fcb27-d081-4ec4-9683-6667b54fa3dc
>> Fixes: c636eeb751f6 ("arm64: dts: qcom: msm8994-octagon: Add AD7147 and APDS9930 sensors")
>> Cc: <stable@vger.kernel.org>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
> 
> fwiw
> 
> https://lore.kernel.org/linux-arm-msm/20260911-topic-lumia_drop_captouch-v1-1-6f92f1f3c6d3@oss.qualcomm.com/

This solves the problem :)

Best regards,
Krzysztof
