Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67503E451A
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177823; cv=none; b=U9j1qyJ05dJRZqMvF2kjHjvbBK/dlzr9+Jd431ulpNn3idX7hAjAo3rSf27+J0zzKo/xeLmaYqvQ6pL6OWSk6XuO1TGD9QcMak6014IMHs8TQ0yBa2ZQD7KZYbwmZz218g2qIwcYt64n/7l+8px2JxdTkJeRi7gKR20N2Rh+wsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177823; c=relaxed/simple;
	bh=6U2EpQbl70iTBwLkHktdUzi2+kfxjlaFpz2VtqrjLCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EpSBeCUjXn+r1lLGSTJLiRa1UBtMqpF6tiffmtJkC0huo9V/jh/YapZVE2CSvPAwOBXZJLhajQUIrzgJpzBxLrPQdtf26dOjz8Q4RGL1FbRlH817WcGJDv0mwX49/q9C7UpaD0GOtHT4/BTKpg7H260J/g5TfgyJ+4+dEcIC2TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O8A4zmwQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iSrCheF1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O8A4zmwQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iSrCheF1"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xRXW174141
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=; b=O8A4zmwQkCIJbpoo
	siDproRCMHs59CW2RqYoOsNvM/4WqHMKKow4gu+8wb7KACgFJpYDYG7H7jEQYW1r
	FBVzzUIqr0RvxKcevBxAm+P9gnW3jiLs4/TmhbEtbVMeWAo4xNaXyPXd3vmZMUSY
	8IkXjYoWtS8re6PB9VdtZ1v2OwM1i6qfER6c1zalv36JX1spdol6kp5MrhMUfcma
	3tKS6kcKc1oelZwwyNSCfX0bf34GRLWxAa4PyuVIdQhcTVNrHbMqN7zfY+6X/a21
	48AW/YPx4XFD61TB1NrvACilJf02TyVlsjCpO0soPK/Cc4VexkY1vXv4uhaYLpfb
	VuoQyA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6vb41b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:37:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9156dc90fdaso191291485a.0
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781177821; x=1781782621; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=;
        b=iSrCheF1emv5hMXXgouVN7tbcQQe867ShizF7ghSf8vofEVqxZyD/XOOqQajqzFQhW
         0GOQe46xaR0ET5iplK2HP0yyex08t9inafQL+/e5r95aphwWaH2BvhxtF06TBqPdT/QC
         YKcq1Kd8P4e0V2sqInR7v8aliJzgLDsT/qUNTA70WC2OCXqfZZBn1+nsAeGof1k6dDgs
         9zQ5hY3Zj74J51iHDsrlnRtlPx5jcjRwHVnkIYa7ZETq3yG5ygkH9JYAPLTRgisopg1+
         9/XbV4FGeo94giBuvHiDj4R0cci7By79HHfJEYuf5dehnoza4RCoKsLK1gE1rvYNm9cC
         ipwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177821; x=1781782621;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=;
        b=bt/YOUslTF71tYxY3vEj2Ju4LihkACt7LBGSswWM+/fH67nOtd4BjIusDBpP7OetIS
         0jhUKDrV8jTSDGdwLdURNNn6zKySsNmXUOPQVsS65W5r9ZG5NHpNxxVStBzMI3urqdgd
         F1RBhUu8Glv3s1cw19cq/71qMp/NJbTjyJzrA4Z+HRZf0bq3ctnIUOhPL9zq0yGWrerX
         6Is2HSl50bOjDQ3+nYifXFJ295mwB0jl3Bsh/tGmXaU0IUOTAlSe/mo6ivjkbRu/2i+G
         81eyp4q/gLdrAw8zRlm1NoXlANHfyyFLXVoyqLGo0BYIBbktBEgaOf/idGw9374fdLC9
         /19Q==
X-Forwarded-Encrypted: i=1; AFNElJ8/SUYwyrc0U8OXNQ2YrtASGPrCIbACGL5j0k/BsfEZtZb9DlLGqKwz+GRvh5DngWVhtSmDvJfGgZ6s@vger.kernel.org
X-Gm-Message-State: AOJu0YwLsVXMKyvG+33VjXCnkh0q9d1HF0PaupcVzMpf+0hdgo5LLRN+
	0O3+MAwLDxhbzbRh8WI5POyKTMXrofVbodY2xgjrL7xS1XJQNZKMNOiQ/r/zJskvwc76zxti1Ai
	AIqF/HgpOizbPjRoBl03j41tEdtHkEjUnD1oS5FXrzxeUr7SfZwZfossqmDNW6wS5
X-Gm-Gg: Acq92OENOwWaREbbnZ7+PS7b/lxhJ+jn8KasymJgAqed3IYHlIkuPmMmQaNAWhFoZHD
	K98B5M8N/jC0g4sPCZDcnWEiYprm8rBBEn/wLkhn93gzYmS67jJyUWfXRfwAVnSfQ47o9POKi3B
	yJoHe+QfL/h8eR0V8AgCEc91YE7a54BsRyT1r7rWhd4oXFEWlR5fsBJRbcVJFTBIYGICgWLctrB
	aAtz9AE31cARd+Tn6DrkAGfgcZaH4K55H8Ox4weKp8Cs/1KLah4xmUMtsulmDMIP1NopRYQ/xMo
	5y5Rb82+W66TUh6i2WpOGqvblUcW03OwA+T2bVsb0RsfR1I0OhrBI1qF+R+uE9LKutSCGgRzmMJ
	qRsjPtojYL0cgLkD/Cmb2zTnch7j1XVqww1UQ3pPyai6arMfw1l0haODO
X-Received: by 2002:a05:620a:4553:b0:8f1:9e59:2208 with SMTP id af79cd13be357-9160acc6f24mr193368285a.4.1781177821097;
        Thu, 11 Jun 2026 04:37:01 -0700 (PDT)
X-Received: by 2002:a05:620a:4553:b0:8f1:9e59:2208 with SMTP id af79cd13be357-9160acc6f24mr193364885a.4.1781177820650;
        Thu, 11 Jun 2026 04:37:00 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb0f147e2sm53745066b.7.2026.06.11.04.36.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:36:59 -0700 (PDT)
Message-ID: <36162ade-51a8-4229-9134-144b452e3a29@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:36:58 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/18] arm64: dts: qcom: sm8650: Add minidump SRAM
 config to SCM node
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
 <20260522195009.2961022-12-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522195009.2961022-12-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: CF74R95qTUe3WqWixN-RFJWT5xkRjVD5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfX9gng79xG3pbL
 XMyYRGb1dS4zis5RRiY2FigjQmsZeAVOQaaOpoBOd8ypgsWUt9+d1Kqawaw9VjtWtez9RLChfPV
 vAECi/F8J0JdWixdVK3HZP4UQ90/RsM=
X-Proofpoint-GUID: CF74R95qTUe3WqWixN-RFJWT5xkRjVD5
X-Authority-Analysis: v=2.4 cv=UsRT8ewB c=1 sm=1 tr=0 ts=6a2a9dde cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ZpVAhvDm8T4WZmbhYYoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfX6sOsdVgU9H9/
 IrtmjDUH355AnXbrH6Qh+2RuarxedpyQbUtL5uMYo1wEGReWk6tvIsyWBqhrYP1C6icf+HAKSJT
 79yy/OSTx3b0pCehafA2jKRuC486FHMkbeudx2Rne1JhKcy8BlYSm1JTSAeqg9kscAM7WF9jTp+
 WoLcmS579TeLlE3SQB/BDH5RX+R0djkbBJmILsQuLrEj7mBWWUfH1twex3TkkAKTSuoCyfyOgf2
 PNAgnbXv4bf3xpBHXuOgtbqWxIzOU7tik++79DqbF7SQisoQE1S83ljfh5fpqAXM3fpUMbcoXFj
 FbLLxHopU8UlVvQ74UWvkWbCk1yDoS3+xbKSOOVDuX1yGWMF7ecoEmNFy+VJeaORmINOiwbwF1v
 jX1wN4Q6dK2PJEJ7oh2IAF6sf5aGuEcXGRVjKxAazbv7EQBoZx24D9alaO6g6CWojVkB+4h7F+z
 O4xTqbOOl6awJiVJ21w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110116

On 5/22/26 9:50 PM, Mukesh Ojha wrote:
> Point the SCM node at the minidump config slot in the always-on SRAM.
> Boot firmware reads this word before DDR is initialised on a warm reset
> to decide where to deliver the minidump.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
