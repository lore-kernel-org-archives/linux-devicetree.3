Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D55C4A2618
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048506; cv=none; b=RIr6nLE9WGDjuSa9G282e2rvGnCujEnkAXbpsm/tbZWQcVDdCdLh6zUP9FoWh57H/M3LUf4uWONZWY2JjQXdFZenq6V2v8lHhaFd1ITk/GMz6QXima4dg+wvR0e9AqovIyeG1EJxUIOHHXnBkatbMKfCi4T7Zby/064qBRO2jNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048506; c=relaxed/simple;
	bh=NTYhrykTWtTBp9V+M4bLcII7SFmdACoA2QijUmOeDlM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MkOTYhTgre1RUXjbLGXmYfXdJjUCndNTqZztMaIbkLDFxTATzn2xABnpMpJWHl/cDmhPNSidv+29zr0waJGCFgyofh4Hle/UfJ59Ma+gtiwVISbPcgnjtQ/VHurH5WZ+maDSfKc7DaZSVTQtatoXGd3TADtaRSD3Kpd754NNoyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gbLa2p3t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j8fAuNUP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gbLa2p3t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j8fAuNUP"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F65Wda644567
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:14:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KeOD1A+VdtDO2QTZ6vSzekuRwWPEc6a77wmmq752bMs=; b=gbLa2p3tR0PkBx/H
	h0yrYWNT3kkBE2J1Db23/igRBTZRVn8k8s8scP5bWJ4KFX2qQz2TIsLbkSy98P2C
	MA8hCDJoXvjVMDD4Ckclhpx5DzerpfbX0mON+G2e25VUqZhLYLv7XlPLlHBOBUG/
	sjj+VKXVO1cE2kYPwzFvsBLO7IP21fbqLVKize0hRzRYmShSCvw8M++35dVUqG1d
	CjgJrpgLN9mb/UiB6A5/l1th91bu0mGLSfp1JRUvNUJCku3K+YkvEpuPIndYS5QQ
	JUanF3gBIOemujcUaYikbY1U1fB5uDr95rhGpga933xtkxJglHCSQ1znePghb2Rv
	FZ/MIg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmy9nqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:14:55 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a813204f87so1157269a91.3
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 00:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792048495; x=1792653295; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KeOD1A+VdtDO2QTZ6vSzekuRwWPEc6a77wmmq752bMs=;
        b=j8fAuNUPaKxfo+Ae6vLk3px33SiS67719bABoMzYQQbyzNcHiit335FHJcKFotiZMH
         NF/4bK7Th2ljwtulcE8Q697Q7w4Wu1T1vrRmQNc/qM0xEBmqJFsKLRaw4mDtbgnjhISs
         I5Y/TgAHj95ESofFah8Ov5QlH1gKPllnIRzVTZkVV5qFLiJZ28pXrutx+QYk043SJEVb
         FRl2Nd2TXcsr2MY60F9YFfsVUlA2q2zu4w+WcrBGg2P5birc7nBMJH37jSGoHhGoCw76
         8Rg/QMjBnSprB7oMxXej+ecJbS7APqAgD6vaxAFUORoKEGjK89oNeG0yIoxpOUmscbWN
         EwsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792048495; x=1792653295;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KeOD1A+VdtDO2QTZ6vSzekuRwWPEc6a77wmmq752bMs=;
        b=bv4WmXHTqsc3+WUHbgSeUayINElBYOqVqo3WtmzhGOl8egR0p5P1G2ES6l6qi8+GqN
         PLlE8xsF5+uY0chganHfUZUsGM+9lmwwk+z781NXiby0NNsz8GHzBhK20hcqWhgC3j0N
         Va7g8IcIcqZ26I3uowKVu/XxDniXyd5lk/3Zqg5IH0F2Mp/AZF6GCD5a2gMuUWYZ5xWF
         PTVlmh+rfuYbF64S+fKbYUs9uG5NtZG7Rgwf+NXPlue3+g/VZ3CgDu40wTyCNcdY3eKj
         858iK+GfFtpHcKQvwLLJx1FtEyae8YPnqPAWMAEHdWhKqUmtinhxyC6JGYWUEm/ktBVw
         6Svg==
X-Forwarded-Encrypted: i=1; AKwUvByPG+i0RJNeGxAugQmHjIiVisvpIpFOQ7PANOg5JRBO3mGSriPVMUuQ9oRv23xghvImccuT3W40eiAC@vger.kernel.org
X-Gm-Message-State: AFq9FYL2EW0anOZNF46OOGo2iyErDd6we6tMLh3tXeRcFxbQ94P2F5bg
	OaQgohOTcV5TLohoXsddKogpfyFi31zTnoFljhpE02tOyE0LINhKAq7EWShbG2N0/kDxdz3EbKB
	eCdWY+ufUNmqwTfTv63RYdgjIEVedDEJtIu47jGfUAVJsOwQKWu/lj6P0mt7r171k
X-Gm-Gg: AYBFou0rLRSoijahdZaNjdUieKNBf0tYY/qKm5SHZ+UeVA2vi/FkkvzZ7LQXe0nO/Xf
	3pfnlXn2PKiv5k2Su7LQn7tFBbgqTJ1HmA45gZ1Kts50NckctnR1LTkx3qcJnoZEp57GiUGBtYH
	zrZIBZQutjh/w9z8dj0/z3NzvIgngk8IAMt5xVAfPkNqEOxS+JeTU8sTFBQjjZEyZ+1LSnwt17m
	WmoCjCK2yRrU5SWV86lYntuvZ2tAp544eCoHxEhJVXa51Az5l2dpstv447DzEdKu3aCyCuww0mQ
	rT3ImTreEFDZ0nzsu/7NWBVyrxUcH67WdvMd8TENMkpukBk+9IxHk9/uQaS2WPlRIZZG9ivFoRi
	frMhixNuhih+w+Pk5Nx/ul8wSE4I=
X-Received: by 2002:a17:90a:d006:b0:3a7:bf13:6007 with SMTP id 98e67ed59e1d1-3ab3a9128c8mr15605954a91.14.1792048494920;
        Thu, 15 Oct 2026 00:14:54 -0700 (PDT)
X-Received: by 2002:a17:90a:d006:b0:3a7:bf13:6007 with SMTP id 98e67ed59e1d1-3ab3a9128c8mr15605924a91.14.1792048494262;
        Thu, 15 Oct 2026 00:14:54 -0700 (PDT)
Received: from [10.217.216.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac944511c7sm3221300a91.10.2026.10.15.00.14.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 00:14:53 -0700 (PDT)
Message-ID: <84c2e489-05d0-4acd-a88c-ffbdcd111f67@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:44:43 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] pinctrl: qcom: Add gp_mn mux function for QCS8300,
 SA8775P and SC7280
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-3-1522662b6c53@oss.qualcomm.com>
 <a516c0e2-0ac4-44fc-99f1-ef8dd051fc18@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <a516c0e2-0ac4-44fc-99f1-ef8dd051fc18@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pkqcTf9J_gjML0BGv_mwi9s6_hOx42NK
X-Proofpoint-ORIG-GUID: pkqcTf9J_gjML0BGv_mwi9s6_hOx42NK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX4erNf1DI2TVc
 p+8pgCt8VSMdN2q0zG1CCEdeToXMfJ4h61g99RAK9wnN7HbQ+Opaij7v6bgf37ii1Uw/biGecWi
 aoKeD8t3i70nVwE/iBwRs2PqrOT+F/U=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad07d6f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=xfIMX-YVTLGOWNOYmacA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX9OMFB9k2RSlG
 ibNV56S0e1Zkkr9X174i4h9iAnR5op5cfl/JwxzMa0siKrIXjsYH8Vp4J0z0OOiRSVLjyLJJJuh
 qSTKQtwG9OXIPRisjuvepZdetoi8ODbdyPdOK5iHYV3mfDvP4TvkP89Pg7Mre/bI3vhG5z51Sgn
 RX1DO8qFihJyCQkx88olrD2bXUhyHsDYDV6buaVLnF0qBssFtrXCTxoVyv5kUGqEBaQ5QRbi4ZC
 YhC+sdnnZTRLKJNk1Eg2+zJICPxmZKeTfKffbzV6Gtlh3z+TfVV2RXW2wti/1o5fNApL9FO6EFx
 OFl9xnkIJs/YMyeBS3/jnF6zFlaIuY9ccEupHHCRkZlAAqigSdXiwvigE7LSnhWCiEagyWP7TSO
 w/CALZDu55sAP2+x6ylK7BawkmdmVC3BKGmVtMgW9RR6I1vra8nCOlTHa+FR/8oHvEPuHsV1pkE
 odosGLtFfYdqNaSTgNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150028



On 6/9/2026 6:57 PM, Konrad Dybcio wrote:
> On 6/2/26 5:21 PM, Taniya Das wrote:
>> Add the gp_mn pin mux function to the TLMM pin controllers for the
>> QCS8300, SA8775P and SC7280 SoCs. This function exposes the GP M/N
>> divider clock output on a dedicated GPIO pin, allowing the clock signal
>> to be routed externally.
>>
>> - QCS8300: gpio32
>> - SA8775P: gpio35
>> - SC7280:  gpio60
> 
> With the changes split into separate commits for each platform:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


Sure, will take care.

-- 
Thanks,
Taniya Das

