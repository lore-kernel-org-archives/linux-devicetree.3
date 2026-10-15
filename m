Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC1B4C14EC
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 11:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062382; cv=none; b=bcWSPs/mwm404wf2h3I/VCbTydkM3fxNG7Fbbkh7++z/UYORvbsqAXIA9YqX8XEdNsXuv/GcgFK7vDk7I+NddiIB6JATJRSo/V5Fc5bzw2P/bEta4T0712ZCJvhoIh1aztuohbzbiN1e5OVtLgv6BkJW4uoFDmRC0xiR6jx+VwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062382; c=relaxed/simple;
	bh=udTCXoH2ys2FdEoRBNtdbhJ9j02RTcL6VxtoF7/cxRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mgQItWGF69Ux/Ndoklq9jBCJm+CEXCA/iR6Roplc4uoAuGjFNxdecrFfPWqrvsbQMwgadD2M2L/WWLZRLEyBv3ccxHc/UlAxeWOLlQK6CO85rZ3GqydkOa4W4MQlKpvVZUIo7h7L76pMKxEaIJ3bzAWcO7wyu975+DSVdAYVVCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SIHXasmo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OqTyAww6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SIHXasmo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OqTyAww6"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jWc62416945
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 11:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AsYNJSBh0Wrd9np61Ns04WJE5AtICL59Ip7Jq4tsBek=; b=SIHXasmoRyUIV08p
	WIsNmvIbkDCmlJTcWWDH/vBGuX25ARY9bmlRdiZpN4xJl40j08Go3G7TJu7ip0J7
	tlHqKn8pG4c41IlHWlCqI/7FBdwTHJhJBiVgN3cafUAzrov41ilKQ9k/srbjiylG
	2MdcnJdS7WqQhDArjyYcD6J592cJnym6OzODFBVglydQfP6QjtbyQpr1efHj69D0
	ct43yDV0rF8fkJt7PSjfK99fXDzG+Dav8KfvkBng5K6QIo1JYmcQdmxu6lnNQN5C
	EfZTzh9fVMlzGogPw1UQXrAYStQXBc8zUbSnPYeU57Tb6oUytX3JVpYeigGZd1+e
	6dJVqg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqdhhrwu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 11:06:20 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5caeeb345c7so184948e0c.2
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 04:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792062379; x=1792667179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AsYNJSBh0Wrd9np61Ns04WJE5AtICL59Ip7Jq4tsBek=;
        b=OqTyAww6BbKHtop5ocGFl1s2Sq5mF4nZ7KAxnQxHajjhqm75qISsPBW2ja4/DRNfYG
         WDIc/t97hDNMzVHwWGvwVQ5aawFOhGUMFg7hhHr/q1C8SJJ3MgL0B6/OgfrwhNxeztus
         D44FqXAe/yObijcZWEfToHrnzHy0WUMClNABYO+G/sL04Tvoc7cY3W3xFzD3qZfZ5Nti
         Xng1M0s0L54B8amOMapj5GWQj1+b5kAPfHgyuW59IbKQzssPMpPAGREjXY4ts0IuNL76
         7yeh9jnGpBqTE5VNpCCe16YZR86ug1dVPBbfS2iYe43HUQlWT+XyqKAJm1z69RNU/q/O
         xbjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062379; x=1792667179;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AsYNJSBh0Wrd9np61Ns04WJE5AtICL59Ip7Jq4tsBek=;
        b=lJdRvwnLXAtkqts2oDq4reO3o+uXYxeEAuwpSNffH9DA6Xj25NqJlRPGDCpfPhURNa
         sPGiryFoSa4frChSg0Qui8T257yFinXc15D2PLLPqJNreAfQOmdXpiy9YsrWwJBJoee4
         xT/2PikacVWCnlIAK2eif7a0/TW8/626mYE/bCSZIPO20YDI6/XcWeu+wA18CXa+4oYA
         kYgLY2gCM1uG2cl36enchsQJmqoqLxVSniPByqMruNiFODEJVfu1jUjlj/IwzlhNc5RF
         cKR2Zk5ml79vZIjsfoGrnJvegeC0Y/7+UvwtyaWs4hiiIArloBGIqSFICPedMOv6pk4q
         NzLg==
X-Forwarded-Encrypted: i=1; AKwUvBzkq8ai5hcFfNXPxxgvcQLMwdPuvV+36yKna+kUPnk3C95IoVbdlrwZkkM3Qr0iGC532o7fdUMrq9P4@vger.kernel.org
X-Gm-Message-State: AFq9FYL6OVIojXxbiaugzYi0MVjrSxzsuJBHuRLFrcrCyIwH8NaSESEL
	gjNYz/ssZmVi1C5mjl357c+MG7hFSsA1hzriGDCSyd4BCj1thnJtEK8u5pZYhfxQvAES5WazKBj
	Rzj/8zydjCocmcC2xXwLoxnZ8BGlwCuzfm476jm8Ifcity3D1zYskAPQqFK/9LtbD
X-Gm-Gg: AYBFou3p7sJlrfWERebm34Y0b5TqH6iNqmOpU3L/QS31vFbt5TVw/hKiET/kJGtSawJ
	Aaz/EsmDMEDsmHJ+l8TkSiIilA9GGCkJ33qpUVd5Tv4XFnZ7Sb8ev+AH7Jkvjam6wpUhI69LDh/
	kzyZkQAkCxjX6t18jU3Vv1oUXjC4HSP5aqxZBhapLqNFn0BmSqjS7WceImjxYxP0+psSe1xocCn
	aMl+EAHOsvhZ3nepWJMWjo9ZI4/N2ElzdZC5je7C7mFI1rP8hFogHDBimK245BZusQNp6qe7Ztd
	mLgO31EiXpxYHK/RK7I4rdIQxu+Xl9KeVGdBOEHbR1NBDqDkN+HHtnFCxqBdCWi+ampd2tIGCYg
	Pl1+zvBb2tbplRsbdBqiiYg==
X-Received: by 2002:a05:6122:8111:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5e91efb84camr3996582e0c.0.1792062379105;
        Thu, 15 Oct 2026 04:06:19 -0700 (PDT)
X-Received: by 2002:a05:6122:8111:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5e91efb84camr3996576e0c.0.1792062378544;
        Thu, 15 Oct 2026 04:06:18 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed963e42csm111355866b.26.2026.10.15.04.06.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 04:06:16 -0700 (PDT)
Message-ID: <ddd2d324-4202-48bf-8984-45edae0c3278@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 13:06:13 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] arm64: dts: qcom: sm6350-lena: Enable Bluetooth
To: erebion <erebion@erebion.eu>, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260926-pdx213-upstream-3-v2-0-b4612e3eb536@erebion.eu>
 <20260926-pdx213-upstream-3-v2-5-b4612e3eb536@erebion.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-pdx213-upstream-3-v2-5-b4612e3eb536@erebion.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0NCBTYWx0ZWRfX0Fcg+tgFhoIC
 xASOI+Ux945oNFQxyvKWdqFgsMvF1D9jQJOOlF62doHIwxMnECo26/gPgV3ylY4AAuIn/2EP2cH
 M1hcBkrVys6TkKqYSnu15q79xyayk6NOvCb5p5CCYR7aG/NB3BWNK9DYeV8J3B4Hjj7e6rKn7zS
 pl8B7HPVBmBgJAKrF/nQvuoydiws0rcOdbU7w7gBDGL6m4o/oNB5oRNORH6kWq5CILxXHqTVx2n
 ya7NUhcu2BBqbrvzAeA1BNUJKuon/K/wN+mK26dwmuGwFpAZV0VecAyKTLrsYcSr/IpQHwexWJD
 kTf08NlwSSeAGGxY+LXnSNzbHmn6PvD/32scs/oQB72sqTE7AD2XIIjJlSFq0ACsjQ5472NXpDC
 4Wr1spwpZlta3Ow55VHgIZADJD3HASFTWK1Dk2TwjoqavklkJSZaZLFa7UMpPWDPDbGZr2hpKpu
 7qtIsYq/DWN/YHU51Ng==
X-Proofpoint-GUID: wnC2NeBQ_hjxD22upRSj1NaGUhASo2-i
X-Authority-Analysis: v=2.4 cv=DeeCOftW c=1 sm=1 tr=0 ts=6ad0b3ac cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=JgZe5hknAAAA:8 a=LKHdihu55Qpm22szt-kA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=ODtDA1adfiiB3BH7YLNA:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0NCBTYWx0ZWRfX+Z7l6nUaKZBI
 F98XUGDtqAtMPz/oCIdPLMOp0dYMXAoMKFL4qFWD8yKvb1VH+gzBR1DmYad3X5Vj3XKYzfQMgwR
 zwD/k6FKFWfzqlig0iLNonTWsOK6rD8=
X-Proofpoint-ORIG-GUID: wnC2NeBQ_hjxD22upRSj1NaGUhASo2-i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150044

On 9/26/26 4:00 PM, erebion wrote:
> Configure the required regulators for Bluetooth and enable it on the
> Xperia 10 III.
> 
> Signed-off-by: erebion <erebion@erebion.eu>
> ---

[...]

> +&qup_uart1_cts {
> +	/*
> +	 * Configure a bias-bus-hold on CTS to lower power
> +	 * usage when Bluetooth is turned off. Bus hold will
> +	 * maintain a low power state regardless of whether
> +	 * the Bluetooth module drives the pin in either
> +	 * direction or leaves the pin fully unpowered.
> +	 */
> +	/delete-property/ bias-disable;
> +	bias-bus-hold;
> +};

I don't like how these comments are spreading across the tree as
everyone copy-pastes them. On newer platforms, we settled on
setting bias-disable everywhere and there don't seem to be any
issues. Are these edits beneficial in any way?

FWIW I think this claim of lower power here is just preventing
leakage current from a floating pin.. 

Konrad
