Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFE43002A9
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 11:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787656588; cv=none; b=o8Np5JtxyYqeOXSmvjeeQysVIZcbuzT3jCV9/9/hJqIJzLOqLUyM73dTzpbMYCsSa4xzLjjlNswA10Nr+D6dd/yDUKCOdxfxJuaGifnmz7G7v0w4xRKt3uZTfEWL4ENoqyyQoqGcuJuyxEwPUSGyWxwrePCskz4Pa7cdpkzrQNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787656588; c=relaxed/simple;
	bh=Axu9Fvl95G28hnwrgAHz4+FogWqAfrmu+dTrava7xu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M/Uy0P0bVRuG9wSvxk+56Bhu5CmGPKaTq/2UKJLuvNN9Wzm7zqnGc80A3QKJmk7IodPAXdFKbnnBkBOTYhyGu+zQq3D581dntdscl2caQXBUglGz2sFwMo+sJSXhSps+zYwtiDDuVGRrdr9UQ8BFsXDrC8vYU7JkIPQwu1s32Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F3crWs+1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D57pKSKt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F3crWs+1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D57pKSKt"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PAvLpr1547120
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 11:16:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G2Z1nqBbM6ia6egyrmwtVcqPZ6sa5ZG0U2JYfFmnNfY=; b=F3crWs+1vGFo4MME
	ljR/IAelEoU75keQVPqQOCcbB7aCygzD4ZIpuAP0HyjfjavmEyZQZ5VqaDFcVXep
	DZEFd5akXQFlqiAOM3qGSPUkagLgXTpgkV9rT7IU5YrKipb1AV0F1/36a7nBX+/e
	Nkg5VQqRcmjyBFY7+s8hJRkUPIIPuerDsSFtU/6iRc/xWEwIPplvnWeku/InQ63v
	5NnHHf8/LJThXlugZjljedqj+tHhsexZMKNokaWKKeyIKztMkuypkkebJN8H5nmH
	8a0hycIkugIy8Ox8RcUBcDO/sh/faMd2STmO7BavgDmFtaMimfKRkn4Wsc4xbJtN
	1Y8YEQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8y5jje98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 11:16:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52b4f6ac06aso85717221cf.1
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 04:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787656584; x=1788261384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G2Z1nqBbM6ia6egyrmwtVcqPZ6sa5ZG0U2JYfFmnNfY=;
        b=D57pKSKtLPjAF1SiOCfRY6yLPSk0Gs2aKBJDiFmk0Z2T8jQXbbuZoYq4Lya5oZPnNT
         r45fabSUL63dHCpa4qd8pnN8pyxGEMxcmXpykiuF3RkPNTCHXEVw5/8zlHcdBloRRQCh
         fVShKk0DRBmCNxgxkfhqLWRUk7eqKTDFl2bIHxxZa5b6le1FbGOeJjkW53JEBMcNtAOc
         3+0WSPasY6eYSc90HgLd/Mkm6ULd8REIrEiplgsGG04MUwmjVnGx+fDef2GWS/kTSgi9
         wHY1iQhSj9BbTDTrq4RBQyrW36pJfEw70QnKBYkr9+EQC8jrEv0JEXDIQmqTkaTtpya2
         DUuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787656584; x=1788261384;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G2Z1nqBbM6ia6egyrmwtVcqPZ6sa5ZG0U2JYfFmnNfY=;
        b=OijsFXg2Nrp/tLHDgLu89BZx84wr0H9bObjQr11qp5Lt2RZXtmiJLEycUlnjUjLUYB
         B+S1h4g5780R8rF4KfO5kXu+yrtV5ODn66G2rGzxPmOXGppe/wyn9t72084j/P3SgKmE
         s/k0hdKFmIe5dd0jFOQjsMi+hTGOw0qT345adBbfR0e3OpBi5BQSz7ko7Hn+qq/q9pmD
         DffQX5j0v3duEY4aIVhfKoZqVtp7Es1SF54gHZ8vGVjZfYKcF9R/zugLiyk1LyJk1Lom
         RpvJ9TMouRTxwGAzFt1PtNn4n8xqWS7zM9fjhavGHP00D42ed+JJD6uNyZQyrlB26kaR
         dkSQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq1YRu82oyor3kYIMX+t4xV8I3myrXOs3wEZEewtg3v1k/KTZ1oAYG6PgIG46gDLmooy2Dn5RO8Vab8@vger.kernel.org
X-Gm-Message-State: AFuF++nKSIjzJLNRsj6Gn02WbeCXQvwsIf6I+7rkWddr8OWfoYN2Sjr4
	QmEQ3Ic29THaEzFTjAGbN3XcLcwkWv4En5ovyuxHMV5BjXpBq44emQeQg3VSk5J6uiiamxfmHNq
	f6bQNw/w9VykB28oQEcCMtw1V/mfnhxJVQDIvQBjn4dhH0ntICgiwrh/pwHoDDgFS
X-Gm-Gg: AR+sD10pq1OxysHPxrk+eZvZIFEFvIQqyLRkPUZZX7CRnme/BH1VYrol2qRpLWbM2L2
	OBYuMmBsrI1UEdMrMzEW16XHHsp05FsW/XGUGLsM1aAyiC//I5/BcZl9R/hzw1O71qCKdXrrr7K
	+L7+d+gunfNRcRoBX4VyLGqcQ/7tFn+IXOzQsuNdNLchvmYFFIxm9dvFa32LZ0r8tPZe6naYnXr
	JX4boSh9NOvAYEyU7N44Ju3FGUIwmro0vTRGzA+Tp0esY/TWP7VDnKzmXElfpxEY4BeIuPshHYn
	NICAgM0a9qKonAwwnsQhdv4fNTWC2tkVgoTJhMYLp74xbC/bfloRQuxXBkSsxqN6GwKrgl4eOf+
	IkI0Qkks4heOZ3pVnLGeVv+bRE473
X-Received: by 2002:a05:622a:989:b0:527:7027:cc1b with SMTP id d75a77b69052e-52e2f14ef8emr67364981cf.32.1787656584519;
        Tue, 25 Aug 2026 04:16:24 -0700 (PDT)
X-Received: by 2002:a05:622a:989:b0:527:7027:cc1b with SMTP id d75a77b69052e-52e2f14ef8emr67364301cf.32.1787656583957;
        Tue, 25 Aug 2026 04:16:23 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24968a336fsm1761451866b.60.2026.08.25.04.16.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 04:16:23 -0700 (PDT)
Message-ID: <a4cbb7b0-5574-42cb-b854-ee3e70df3287@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 13:16:21 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: renesas: Use hyphens in node names
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260822075813.199336-2-krzysztof.kozlowski@oss.qualcomm.com>
 <CAMuHMdX3yfDq8reGL_yvwgOpz04yvSrHLzMsQ8jCP+b4xC34uQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAMuHMdX3yfDq8reGL_yvwgOpz04yvSrHLzMsQ8jCP+b4xC34uQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O5QJeh9W c=1 sm=1 tr=0 ts=6a8d7989 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Hdh_4_rHqsilpbcAtvsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA5NSBTYWx0ZWRfX23QujXc/m56L
 +zPmi9l5IENBnKpKkoDFOgK44YSyMvT1elyWqOV6mY0rAWSLuY0LqYopGdMhmCwdtzZwPzFCCYO
 ctaSXSR5++f7vuSnU/8BHx3NCq73oYPuE4uv9nNaKyg8E+LCQOdrX0+wUc6GnPMZKecqpkK1F98
 EdXVkSCQLubaudGl/mjGMFV5KPWDqCOkArwS2rO+qChLFsrDlhk5cKBzHiR3+EQRddl4G+o26/7
 efAlmGizN6qqbSIpdBxuWjJ14uiRpl/m79BlFvqM4NT+ziSxsCZyI0cCo/MU0YpOfAEyGbyIp6z
 9H4ysKb8SFSZiDWwDjbz+E2WSOqNRrSQJbv5mK1C5piPNqKYZOp/Fi33frdoKhzgMDQ0Bg2BqG7
 IOZEhVehd9fq0oZrlI+YogPry6BM4nNWH+I6TCYfEhi9sWa2KI36HqvdjKBD4olVzdOoV6o22g8
 A4nDeoRBBasjolFEqYw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA5NSBTYWx0ZWRfXwV9XjFIkQk/c
 zrS/Scc+6crLKFLHfhH1oG7Ax2YpTANnV2lQWQLCKJiUlHH4UJsaDPlbHXSmFWivokB+86cYh/f
 yKBRCI0UV0H9sx+NG+XEq2WaAf0FsFQ=
X-Proofpoint-GUID: FwnMeX4wwiaWShf6AyfCaNjd7uxEZVjw
X-Proofpoint-ORIG-GUID: FwnMeX4wwiaWShf6AyfCaNjd7uxEZVjw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250095

On 25/08/2026 12:27, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Sat, 22 Aug 2026 at 09:58, Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com> wrote:
>> DTS coding style encourages to use hyphens instead of underscores in
>> node names. DTC W=2 warns about underscores. Improve existing code
>> because apparently people copy it instead of following DTS coding style
>> for new submissions.
>>
>> Semi-manual validation by checking if no new nodes appeared:
>>
>>   $ for i in dts-old/*/*dtb dts-old/*/*/*dtb; do echo $i; fdtdump ${i} > ${i}.fdt ; fdtdump dts-new/${i#dts-old/} > dts-new/${i#dts-old/}.fdt ; diff -ubB ${i}.fdt dts-new/${i#dts-old/}.fdt ; done | grep -v ' {'
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Thanks for your patch!
> 
>> --- a/arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi
> 
>> @@ -696,7 +696,7 @@ i2c3_pins: i2c3 {
>>                 function = "i2c3";
>>         };
>>
>> -       irq0_pins: irq0_pins {
>> +       irq0_pins: irq0-pins {
> 
> This one shouldn't have used a "_pins" suffix in the first place.
> I will sneak in that change while applying ;-)

I see other nodes indeed lack it, but usually bindings expect suffix for
pincfg/pinmux.


Best regards,
Krzysztof
