Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CCE3A759B
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 17:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776707722; cv=none; b=iIqRM6+NgAvQW52oE3JK2+fGBi3HnvCeCt7FK3hq037kGoFZYkGa2dj2CG2EVwVZQHAPzyJlK/wTVcBLnPC7KkYixKaWgsq1e/aqu/qBf4F1cgIQ82EUIJZilYvpBUfwwKcDGIrpMLxmYdK7t1fvRHseHiKttqH1AKKPdJntJ4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776707722; c=relaxed/simple;
	bh=LH9RzbwyjgWoL1woAWJIcRl2Bzx66HpbbFG1N5/ogpk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gua5JvQ8EcGyxXd3Eg5exJuR5DWDDgSASK14Um+gp4PAKWSepmCVdM3QEdz7hljyO5jxngF1UIqsEB+zU2mRf1rKd5SGA8sMUZ1kwYkE0IZSqxCx2LaXJIo9MWZAOLdckGjtyXkhnxwksKexGe+AOumnvTNHeVuZ9m/MS4tHHeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jdJqKdok; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fzBkoIX3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jdJqKdok";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fzBkoIX3"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KFZtHk084436
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 17:55:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4mWc8pu5UPxrZcFIMvMGsIUsa3LBefYhNY/mt9+x6Aw=; b=jdJqKdokxWedLT6+
	4Xx5HgmsNgw2OuO8PTivMlm2IiqYcyqg30oh8UXKHX7BYVsS95SKc+Zcphc1qZOZ
	gOoaf4mKuNzTGA83aSI30+UhuIlcmpbK9m7JMCMZnj9su7WHoBuXljHhLrF43oq+
	zgu2IH/zjrj3H5OXN29BPbImk15iFAjD+25enHI7rF4NXdpFGSLGN6J4XzfW4Wph
	3mutCqK5Z7ocR1eIYkYoEq2HpzFcMefqlU0ZWCyb6LwWHQdh08fBQUpnXBct0ZVB
	ruuTPMUx7TooXwHpiWK9/HElMPzo8Y/VgFM9FVxvzn++ABdym5C5CU339guKaHJ2
	vUTmog==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh81hy12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 17:55:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50edf0245b0so18968871cf.1
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 10:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776707720; x=1777312520; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4mWc8pu5UPxrZcFIMvMGsIUsa3LBefYhNY/mt9+x6Aw=;
        b=fzBkoIX3SQTOc68Mv1pCwT3yQy88KZ+ssOpOrJyyhFw0JCnj6R3nrkR3kQas5HH+BT
         aZfZkGZfQYi84m57TlRrPEmZQyhoauoJxI02a3MZDfRaBZrH8ESNi5FO5yor1slIsxDx
         dxu2xPbChRDH3T7GgvIWzKAPT39pVCazLP7L93seb+KCj3MEtV3djomKQ9szTWwL/igT
         yy0V97LE/gLYyUjhZZjVMTUVHNgRnuemvyBHo+cBrgs5RiEeYfx6SQg1kPyq6FQ/f1aU
         0nyGPp5hux3FltVeUxXx6sDpLzxBWZqY0mD71thGiMenVo7MPwvzB7MUPbMxr7H4ly9l
         aC1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776707720; x=1777312520;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4mWc8pu5UPxrZcFIMvMGsIUsa3LBefYhNY/mt9+x6Aw=;
        b=X5/DHIgVAVXfThpLprsREQVRPguCXchPOx0rtmO8rtMkaCN115Nl3u8xkJZ0n8wjui
         jQeICUwb4/Dui5P4Guk7nHfRbKWUd1lI0l1Ragy8fo+chVI56MH5gALCrHtqJNp5M860
         SSRAZFRYbXpqSDPAEbyVq+pL4C2U/9MYUfMDjLBJsBqmXLPr3Jjqd1N1qatwEIi01qPq
         aTjgKC81u37fsW87gm6GZqCf3S+/tp6RXifHwJaXT4dnD3LlL/NhH3aU1p0GV9LtLCLv
         6GE7GrkI6d5/H/0k3cZo5RtC3uOF631/+eNiM1Kj2iLACksrX3vdx4ItMkSlbDFvAAoH
         hCBA==
X-Forwarded-Encrypted: i=1; AFNElJ8wDUgZyhe20VTfAEQedTp2gh0Ol4SnqTMf39JhOq/BaDMp/vapwIfKK6OXPi72fFMATpY7cYmWCLwX@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq+SV3iKqkOZhd+apU+HZ9ZWF3aC6YAeHMEY72axlFCc84e2+/
	ha2RlOkSOMHlvpK1CjkI/Nk4TnKcbX7gJz0fN0P2K1/Kau76CdWEFPn/6Qgl7LZMhjWHvnx/jfL
	KrjN7LI42l8VSED8OBrnoegMYNfb9vA68LVkiv5cB5kXEJinWIXIo26X69ftRh8dO
X-Gm-Gg: AeBDieug3DHU7UjV7FyUr12mv/xsKQw/i0zRSNTY3pJhZu27wbBy/Ew+oSvoeCs1+IZ
	/IduSb0FADJYkq2vHbfky6JCowD1ImE/i1JU8ynfUSqyfdMXlTK3gqvV8MDCrIJ2w1Zc17cNASO
	Gx/tJ4B3Bp9Utr9WpWJiVQrYRXx+YnbVoIXTw7/ONPeyJRHvrpQhaeCzeZAyPyqlvb8Z/T17NPk
	czZxccnE46uc0r3acEMwGJOOzYMr2wgyeeeWRz/nGZWE/zYqupv7GrKKtgZj1U6qGKrE3/S1FRz
	tEnfgbUZl27ljlMm+6snCe0b9vtflYRSkC5XBqD0H3EUq+pmc+mowyHIKibY3T7X7LGHlNt78FV
	VLWwHNkSnZp1C+slZSipDZiTurWqfGIooNyflWta1bSRPMH6yt9DhTIUx7fG2D2p9L3PmXRzBDj
	pNuowOx3pn8vmzlZN1po8=
X-Received: by 2002:ac8:7dc5:0:b0:50e:6054:b4 with SMTP id d75a77b69052e-50e60540c4emr54801581cf.7.1776707719584;
        Mon, 20 Apr 2026 10:55:19 -0700 (PDT)
X-Received: by 2002:ac8:7dc5:0:b0:50e:6054:b4 with SMTP id d75a77b69052e-50e60540c4emr54801111cf.7.1776707719106;
        Mon, 20 Apr 2026 10:55:19 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7bf969sm91851475e9.33.2026.04.20.10.55.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 10:55:17 -0700 (PDT)
Message-ID: <cc1a4826-96c8-4074-a2f8-bc49f330d11e@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 19:55:15 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: timer: Remove sifive,fine-ctr-bits property
To: Nick Hu <nick.hu@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Samuel Holland <samuel.holland@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260419-clintv2-remove-fine-ctr-v1-1-7527f4d45850@sifive.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260419-clintv2-remove-fine-ctr-v1-1-7527f4d45850@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE3NCBTYWx0ZWRfX8I5j6fMwTMax
 8W7/FTlf/wfdx1Y7OaYQMt6qJYMXlvvP5s67huRQpMpyJZDeL/z4iJZ2lQOmz5gHjLAraQwdEY6
 tvg8T2XHasjNPD2dEWldVgoNjdPiUIVoMfCec1I6ut6eT6QM/oj+a3DwKxtzMgYkC5/UuOcsnQk
 ilxYyMTRk/d6xswDFcjGzhYyz6kvYLkvdRnMUY8BiAI0nA18rEruZqoNjjzWiNZTcayCVFAQ1oT
 WsKSTGhbj2NVN8EXBIrk/uM5VrCOZ+uOfAN+a2ypUCos/6av/jodceTf2bH6arf8ckNUAJADtNx
 J2Y2ALCfZe3mhbG8bhjD7zaE4u/n9NfeZ/7OabKLWkHoxvj/a+qV85JZMQE4Pg0XH4pHG4AsGVb
 8XP1iAkTmBkH69m1pzqaC0BRQLh7lItivG2KRg99xSg/6bbci7zuaH8v1uKEl48r5ZJXn+Tlt2l
 9Ha1V11VGEhNVWpRqFA==
X-Proofpoint-GUID: E7NG-GLtKj3qZi5czfCzpULT14e3JVRR
X-Proofpoint-ORIG-GUID: E7NG-GLtKj3qZi5czfCzpULT14e3JVRR
X-Authority-Analysis: v=2.4 cv=PsKjqQM3 c=1 sm=1 tr=0 ts=69e66888 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=pFyQfRViAAAA:8 a=8mMVmbDXBDW4nnSvDdQA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200174

On 4/20/26 08:18, Nick Hu wrote:
> The counter width can be inferred from the compatible string, making the
> explicit "sifive,fine-ctr-bits" property redundant. Remove the property
> to simplify the bindings.
> 
> Fixes: 0f920690a82c ("dt-bindings: timer: Add SiFive CLINT2")
> Suggested-by: Conor Dooley <conor+dt@kernel.org>
> Link: https://lore.kernel.org/linux-riscv/20260330-relative-hardened-5ce35fe1ef57@spud/
> Signed-off-by: Nick Hu <nick.hu@sifive.com>
> ---

Applied, thanks
