Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309933;
	b=BAWYu/dlVjJouTHFhIZDErzFoJNi//K/x7vV6sjx+RVSvaVBP9DEqW3P43ZsjHhXIPhO
	 x0gYj/e9XPCKPpGj9ZzM+aycnurLCcTNIQqpjFTLUD8DY8rW2F1StwR3KWMvtsX7TMTgo
	 sOi5oJ0r7m22hhHKmDai3mGu+8vpchS+ViYBPf/LpU/3xQqRlZFlFP0dC2b+ZNNwe6gpX
	 GxqlJ4XWMleIm7+BzYNdyC7Mq1+3OQ4SETWFuFo5brBLsKUiQHKo2gkhLQDMhYBrS3pit
	 MVhIRkUFkYwZHOfZwEW4bcqMw5Le1ifb4t0GTMyP/KnpbI8rHekWIrytDcC2WhNHr1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309933;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0rRn0vIVvyaA1qSueBAyNudw6eTRyVguZjtA8xYRe3w=;
	b=k0r7oE4egbDTRrZpbgT1zyx6zap0HuWZBd6Djkk6rViCht1dfrN7wbgOb96l8+mmmkDS
	 iCH/Y52jxqRzJ2J/9xkPQkWtU6k19PvPjf1MZlxmZi38hErEwALpnZebCz8Ad9ahhVVZd
	 y8TYU8f0+bNjOXFn8+fFOQ5kZii6TYmxmKBDu89pAHQINglAijCuPihTDaeRdaKzWHjWy
	 3zfPT6w6av9yxeOsbqF4cDTLHuyXSqgrKkKe37kEEuXAE839zQSV90hPr9snozW7S2Uus
	 Mp2jxOx4NtD2CUJcJ/vV8NhFvUKJ2/K4G/bAF/iL0T9oiddJHPLPQ9q7mVtZJzK+aaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SsVTADHc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AWDHXQ7+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7958D60A5BCB
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 11:25:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7958D60A5BCB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SsVTADHc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AWDHXQ7+
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAUoA3178509
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 11:25:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0rRn0vIVvyaA1qSueBAyNudw6eTRyVguZjtA8xYRe3w=; b=SsVTADHcHBKzYavb
	nLGn+1vz37WypDtAQXwl9WLGZkVuoQ4m1NRqcSaxdHThnyYTnO0hVcmigznimkrC
	RBBSvTFukyiqAcq2iPekfLjEW47+v7j55zYxvWlTbjYTlnAmgH4RIsmrpCwOtz1E
	yg7YplOeUaClzVsIoGY4g6tPDU19Cavo4Wj+6RzgQXM6f/meoRHJEAefXIJUL0a8
	BSP7uwfY3ZX46ZIPVeAf1WN6DyxiQKxmUxe8SbjvUWDSs+RHPcX9rtLACiw4Q3bv
	lupQCnp2RpGoXvH7pMkjuX7GB6p6qAuKX6f1nHsa4rO3g/E3cz0tvqs5myKQ8cwi
	5nw72A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyufrkmp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 11:25:31 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36f479b9819so3542046eec.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 03:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794309931; x=1794914731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0rRn0vIVvyaA1qSueBAyNudw6eTRyVguZjtA8xYRe3w=;
        b=AWDHXQ7+lkQeHnXLSfs8jAiAlq9QzOGFG9K/KfEFyIZL9sbAxgjqymFR0SqlWk5QPw
         a2Ct0zfthtspI97wnZNxiQOig+ivpeUDpduHk20ZyXzdT17H3UnCQ/gbMvuvt5r23ImF
         GSSZ5JBHjHIPpT+yjzVIqd6HkJ4I64h5Id1L0GKobEzk5L4yWWhpZbP32TDisqlO8/35
         JpaC4bEniXPCptKwU0pvuxwyF6hGMmAx/Fn2cnyPUJ/io7RTzuvKOk5mJ4QqmMCjsM1+
         g7BGMi/CVzDv/l2eIu7j6AOpoxKl8VtP8vbbiEL9MBY65ZdodMespu2NLO7y/XpRzIfx
         wXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794309931; x=1794914731;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0rRn0vIVvyaA1qSueBAyNudw6eTRyVguZjtA8xYRe3w=;
        b=pYnBshCf/uVKboMfGSitVSdkR21FXLAflofLVAvaxKAEpvxQFnkqFHaD0UiYTgbV6d
         EXQk7B0SGFLySYPyOr1IiHL3RnVE1Ygn8FSEbz8P4TV478z/Y9oiD8ren+lxoAHxcIhP
         aiXr4OC0r5aTUmxI3BW/baxYNH9quZiMQyQQI428icRQfoDti+cmTttlrwBVLgYOS2R2
         QeoISJvvyF1XxVGyLOPzhw8mxmITKUJIoaZHwp4+N4xjBrb/PmaQwwiZX9Xj+uDkclDq
         BW+cDIA/sH2qI+NQGNdrPI/OegPBsY4nfMK/JQHtbgD8lT+VvtGNE1FNYZGXfzuHxGRp
         eThw==
X-Forwarded-Encrypted: i=1; AL+hErE8jwp5V7KHkKwMcgfbPbYPba0paWWGUnnEwSlPkvYjxr3jZ91UlnoQjes/vElK6Oua4C/hNa4GY/MB@vger.kernel.org
X-Gm-Message-State: APuU4Z/NXypCA5VosvWUHruvBv33nN7MokyYGvUmIuFZEdgrdcP7P4BS
	JDqwu2kd560+aFyHjzlRJVjb7/+LK8rKubahlsP08hKkpVshNUtKJhecT+6xQ/bQ+p/Pmfm3Bu7
	xZw3rJtmqrTDEaZJCiwRTN+TPjtUoHuI7l18a3fiZDH7BEMAt7chnKkPhItwJd+SD
X-Gm-Gg: AYBFou2myt37RAT8W76SEsZe7/5s4Bw0i5gHqM8C5cNGOVpmGS7agkYPFTtBF0h+bNo
	sYw+MR1QOMksqv2dHP1W75Kke0ui3hAiR2VCWwmTEPO4UVuUAvE5DGKzXvmMumhP5g5Rl6vTOP3
	rAN4vjNsdlaeMYxufs6jSPI5As123RZWqp7pVQogBZHbNnPjlzm5Z1leR2H99pnGWMzb2wXUXpZ
	URZl7l5BGux4SYKfWP0evWK9qkrk9RWoleSJQZHGSYcSarH0lb1yxpvYwgnUF/7RRIS4QfDAH+x
	XVQb93u5jCHEaiqLt3f48mpAWvfWvTzfY1+PXbg+G/oANjpzzh5RF+/V2tgFw3F7lHq0KrI15Kx
	LpIw0HOn1i8qydQYK3LoVB39JAc+6atGN4RvD/emz6dMOrjjp1+TiyrSFHuehZtBVbkebM86fr9
	gC
X-Received: by 2002:a05:693c:80cf:b0:36f:2677:fc09 with SMTP id 5a478bee46e88-37520217bddmr2806040eec.18.1794309930886;
        Tue, 10 Nov 2026 03:25:30 -0800 (PST)
X-Received: by 2002:a05:693c:80cf:b0:36f:2677:fc09 with SMTP id 5a478bee46e88-37520217bddmr2806016eec.18.1794309930393;
        Tue, 10 Nov 2026 03:25:30 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375218c7c50sm11890587eec.29.2026.11.10.03.25.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 03:25:30 -0800 (PST)
Message-ID: <6f94633d-b134-4b1d-885b-13fea6334767@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 16:55:22 +0530
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
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/6] dt-bindings: i2c: qcom,i2c-cci: Add Hawi
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261106-hawi-maili-camss-v4-0-d528c7a797b4@oss.qualcomm.com>
 <20261106-hawi-maili-camss-v4-1-d528c7a797b4@oss.qualcomm.com>
 <20261110-friendly-chipmunk-of-variation-eef4cd@quoll>
Content-Language: en-US
In-Reply-To: <20261110-friendly-chipmunk-of-variation-eef4cd@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cGZzwRS3C7665iBOnwWgdK661_nlVQF_
X-Authority-Analysis: v=2.4 cv=S6lMU4sP c=1 sm=1 tr=0 ts=6af2ff2b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=FDn66hFibwGTVsjr8H0A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: cGZzwRS3C7665iBOnwWgdK661_nlVQF_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0NSBTYWx0ZWRfX1tNopH4KRMPI
 KyG7ZH7E27yrohz+oDUfZwI3P2xI+joHnLGXz/v+RiCXqb/DBirAY9Uqm4DX7tTNP2AyqNErVQu
 B3zolkpgTIkyQkLGJ61KE+ZXvdXyaNo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0NSBTYWx0ZWRfX7K0n0QR5LKl4
 PaT4VWppT3VT21OZSlImb5eiu05pmqvsBYWZtlqxBBT7R7j9V59jQlRZ9WuuZx4EY944BYsW4MO
 HZTqaWq3BJSTQ+cpl+xBO9Ir3YleOJ9ohjAQyc/3fMIzOeWLGdGLu4p3io0u4EEvRqfv9cpJ9cj
 d/uDZK23sQEkTDnpqBsZLIVY1bwfX2mpKapgS15bx0DYBJQRgpDyd4i5Im5/DtR51N++U6LEnL4
 vqTkpSZxp5zvpp1N+lNeZJobNffIsD7Fewmqdto+P5vriFq4xi5RMju6pCQ8LXkIhEHT6dVvqCt
 rW7N14DBW30d5zOmIpBO+ouj6ypL5pqstqKwlb6MdXqVghOJCuhIe+hxzaKwXgp3JfOznszkSVB
 OWjM9VgawqijUV4p6k3wM0aqH3MKpPzAZVCYDO9vQrvNCbNQejWPzsmxyQ9Ya5rumx4iQ1NWWfc
 vNHsXGOBJk5CLJ4FWSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100045



On 10-11-2026 14:53, Krzysztof Kozlowski wrote:
> How could my tag go back in time?
> 
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> Who received the tag and what was happening with this patchset in
> between?

You are right, the trailer ordering in v4 is wrong.

Your Reviewed-by was received on-list for v3 and carried forward to v4, but I
placed the collected trailers in the wrong order.

I will fix the tag history/order in the next version, and use b4 trailers -u
to collect trailers properly going forward.

Sorry for the confusion.

-- 
Regards,
Nihal Kumar Gupta

