Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EF5476075
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141454; cv=none; b=uBG4rKwfh/72VYwgXdcrtbSk3ekkrsFLAHY0W3oZZVRfVsJ8CrTMIYGrvmmPhzf+i3ZIz2h33dPMnVmLuPJ9GmA0fp1qy3AA78xHaSdsZ5IddRmunXts1A9sL/I+b8wDvTdtK46vq6NWm3v2VdDA0c1/wsHgedH6T+bvnIL2Xws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141454; c=relaxed/simple;
	bh=5rX9hvTS9mKTBg5ndn4tdrp9BOneSpV/KhbdJmbZSZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bzv9qfrE6HEjPwkmTIZIL2I7t3LGKd7i9i+SCWFMPPPC7/40cz3ZmeTTzQRK7fx89ty27G9pkYOv9YDXwuub20wuPh9qJRXCtVVZYCMbXzmSm+5SZgBhRH+gpHiYVUdZ77urAkJ9XQftUCzpiPLBnyEp1y+ex0Mn1Wblb8B35SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bOFmg6Df; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gFGwSyml; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bOFmg6Df";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gFGwSyml"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEm6vU3251731
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:44:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BV+QhMBUTp1YznEgtkaGXEsApIL3NyQC5pcNeHbuXBw=; b=bOFmg6DfOzZ8hu62
	ht9ozoFEEXIZONOEmavQTDXyjm4WyzssQbnemWUg8la+WlAry4sg1J0ufCZCxBgi
	ndl0LL4jG4IJFWUbWNILJv837dZVkIewSsMbOdm8IPyDJiaw8OIe2fFwdMihTL5q
	vrKtq0+2mdPsAyw3Co6sh7mxsA9Zz/GvyM2w864AKvP9vb32aH7uRh0IU5H38JwI
	DuviOCQwdOr+GmbNNm2XUnWpXxU9ypblAqBnxZJJnEKT3vVoDyYX8Av/1tehIssz
	AEw3vO1A4VrpBSP1kTRW+krvLUvjenM5cTArYRWJQHtv5aPdBDZm31oZzTNSyU1y
	5eUemg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm7uckay6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:44:04 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c65b0280a2so50639e0c.2
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 08:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141443; x=1789746243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BV+QhMBUTp1YznEgtkaGXEsApIL3NyQC5pcNeHbuXBw=;
        b=gFGwSymlPXukZn4jccqTc3Uhfe2ZNQ9ik7t5smCeb5HLwdwCMHANG2ahmgtcONw81+
         pddK/UBrxVubjZzPSJi9DT/iCyzhtE93Dut426FmVwvXTXgI7o6Pe2Hb8s4DC4EKmHZ2
         FE4alxTDdfiW8M6XXbfkZv/fgbdMVhjz4x2NsRPXwj8M0iokkL9YgZWtJfDEUqGOQLuy
         rLWEV1WuGLCiPutD2JrTKmuqpHNpOgguHwHSJpS40L4UO3VnzExBanFy/rJtJR1EirAa
         ayMvEhT+M3W8QYFcw3AaiHKPtlz2pnA3CUSCmqZniidsqcKRP94dckAjEGLX1ixvhof5
         vunw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141443; x=1789746243;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BV+QhMBUTp1YznEgtkaGXEsApIL3NyQC5pcNeHbuXBw=;
        b=H31JR+DoP4AweUh98KJjJWD1wThBygli6turCUan/49a7LExhigNhTLe1kFyxS2/LN
         KYcqW9I+X7JZnviF1WnjOxshNibOc1elrLPfbR7NHImRBPTJJP06m5m5n5Za3wuzOANp
         nWMZN1cYP2HDh1EOzNIo8AILyBgMDLa1Fs0gd/9LTkOWko++AL2krZKzAHsUcaByaLNr
         t6bTUfmjLVPzvpxPlCmSs/f0MqMyjSmBDA50NC0Hx9kw38HdYRS3UzHBxfQGhM5l7gvB
         JwwkgFoDjbRjNzK8ZuNNgZn1p5NUogOvdtwB6mUUB7kCCuc8Sf6Jeo3WcqjWilM0ra2s
         APHw==
X-Forwarded-Encrypted: i=1; AKwUvBzB1fUONwi5E/fDMbz/i5Ugqowncl1UMF1giMhnzejWma1TbUtVXrNwhTGjDHy30RX7NdGaJUkr5vw8@vger.kernel.org
X-Gm-Message-State: AFuF++kBpbly3WCqEwdP6RE5in/wpY7cGE6DRsll4V51EbLmnMyUwJyh
	bFBdJpM5Y9Muyt7omi7CUJxEEDQCC1VnzyuI6aO0j8Qm7SuwJM8ubyMIHgVSGNwyKb35/dUchOj
	yE82r86ovk70JDjk7u2lfA/1IGuFcptBUvO0KUc6rl9XbbQcHWmJTxLCK3yzUk49M
X-Gm-Gg: AYBFou1b+UM3HExnZgLIYmDIT322I0cFBEzeDykKlOLuoC7tzPPqAf+vxzJbGiliK8T
	xLxuwMBbtEZ9QwBDGdj7Oq6a8z2Q2D5wTAHcn5S4apg/+0QY36IIqNDrj34CkIC2Ok6VPncGpDQ
	Byn/odt2Jh8z2DBbC027CksRUFr0C7rmgtj64jrq7szDsMLfT5EYdEVE6tLTdtdP+viGHID51xa
	vws4jJU9vPVU0BOeeIZM1Pit5+JLc4KOWe9Y7Z3WihzalMvcOPA+wS3WlA4Jnxt5TeVASLD/T+V
	8muQbWcR3GZd9qms0UXwVEqIlMeL0kvoLCeFbsiAQKDaA/VDu3ISTV7OhxOWi+cMqdZXO8hJez6
	1zMJR0hE=
X-Received: by 2002:a05:6102:f9c:b0:795:250:3c56 with SMTP id ada2fe7eead31-7950250766cmr511026137.0.1789141442974;
        Fri, 11 Sep 2026 08:44:02 -0700 (PDT)
X-Received: by 2002:a05:6102:f9c:b0:795:250:3c56 with SMTP id ada2fe7eead31-7950250766cmr510990137.0.1789141442547;
        Fri, 11 Sep 2026 08:44:02 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296598e8b0sm100060466b.0.2026.09.11.08.44.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 08:44:01 -0700 (PDT)
Message-ID: <2fd56aef-6a03-4af5-898d-8a57e7034600@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 17:43:59 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: milos-fairphone-fp6: Add
 touchscreen
To: Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260911-eswin-eph8621-v1-0-db447ff9e445@fairphone.com>
 <20260911-eswin-eph8621-v1-3-db447ff9e445@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911-eswin-eph8621-v1-3-db447ff9e445@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O4asLx9W c=1 sm=1 tr=0 ts=6aa421c4 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=T5nqnGCD1gggo4biR1sA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxOSBTYWx0ZWRfX0oINIVou2dOl
 44sTl6Q44eF/YRFAPTtfImsdhrrwPn77O2es30+KUaudyCxul+rBIZvfhenxmQ2bwGfGfOvAgv9
 8aRp5kPMBNeJISPxF9abvZoVVo7g5/gLrE7fFVwoDI15Lwfbts+OzlUbhwenQDJeTkzfzGYhPSF
 HOTBh/PAWUVmd6lxFcY9IorHGfjIFmqC0s85HKnnEQQw1BmCW80o0yyYyHvffA0CHRNzJnuFEbb
 3R0VC+8jLtU3wdfwVPlhN5R1/CqWzi16rD6lEKacPBoyFyNnfZr1J7AiDL2hsNvRgeYAEJWmEie
 A2vmw4V5RML7n5abwcoBXxanWLgys5XMdDJbQ0+Cj0z+XZKQw3lMgwa/ccHd9j6K+OWj7d82gqE
 dMpVUfWTThW19oxVQa4ZepFw/Lg8iTaLZnBiT9jf2YpVJryddsHb5rwDqfGScKWvYDJs4BxRNIq
 cyB13+fZ8bFedAOY8FA==
X-Proofpoint-GUID: s4f1521V2tWKcYZcjTXIVgwb1DR8AaHA
X-Proofpoint-ORIG-GUID: s4f1521V2tWKcYZcjTXIVgwb1DR8AaHA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxOSBTYWx0ZWRfXyYZ6sGfxoKcz
 fnm4XvhzbKBHRThY/Dpm09C4/DAeX4vCOgKrW2+QJc2UEufeYKEyt+CkjeGZr5dteNiKM5bJU6f
 CXf8A1tftjMnxK0oK/w3tOwxUaSh9m4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110219

On 9/11/26 5:16 PM, Luca Weiss wrote:
> Add a node for the ESWIN EPH8621 touchscreen connected via SPI and the
> pinctrl state for the two GPIOs connected to the touchscreen.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
