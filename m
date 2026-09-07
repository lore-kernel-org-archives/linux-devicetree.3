Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B864C9007
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 13:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788789112; cv=none; b=XpZT6W4kR6x7Xwa606we3XSiFT1HmarpN8EDYUuECnQD5ca38pdJJDWMxARgNbBAMyCyOlyX0z/touCQ5Qha9qwclV5pUSFOdwvTIgc3lBYnL1UQOQoB9+1XpDvjQcC6mZ6fntFgpbn7YRCa5/Aj5NSRwe6esVLk5l2PIbGdq2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788789112; c=relaxed/simple;
	bh=VQ6kiCGze4ndD8UL+SDJp7bWahLizfXIwA6pMOHo8jE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EY6JpOpcEAhuC493z3TXeyHwnDm4bPdnnkp4a1reBTiUxHhB/GJFfukF9VPvWCwabqcmsh4H+EpyNUfUcSDQJbGuCL7QQ4IVbYwc0BuFE+zAss/SzbtQfiDJGJvlkFWN4nvbKvKrbSWDzHFs0WFHedgeLJm1NnznnN0qGnxFFHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=edyNvj3Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RthW/elu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="edyNvj3Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RthW/elu"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687DdKsU244073
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 13:51:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Kp7LY9QNe3eEW83caIEVbreVyFyPEELLkmLUIFtk5E=; b=edyNvj3Zi7nS0WhV
	zEkSKS8uSFr9w9JN/dGrK3yJMKggf2MfAXi5gntA2EE2Z67igbjT7sXEgR2/T/th
	0XeVFIDIwVKCcuKPMUA2fR5wKMJsF6Qx+ykDu+NBjXGIKmc9OOeeAX3iaOIjEekk
	zmWy3c8Vj7hl9cJYeNV82IguO/WGhVar0cxd7nu2gDouqPCml99m3yoXqXklh1ay
	IrmI9j+NAKsDHjnVhN9Sv5oOEPe/fbdpWcAwyx8z8tQQ3JAdqxSPJBltMIwz8mZc
	emV45a9sODzvqpn52nBK0Wx1JTmlcAd51Vjotc6qIRfHCQtMJEkIsGNYzUMWGHBZ
	e8sGdQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghs86sfg2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 13:51:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d6df0a1e18so71787655ad.1
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 06:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788789109; x=1789393909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Kp7LY9QNe3eEW83caIEVbreVyFyPEELLkmLUIFtk5E=;
        b=RthW/eluTxzYtu8j1GofXit5TBpum8geE0PzlVOBlNwTSRqEtkFfkLfYuBAHyx6Ul+
         n12X0Whw5kQQfRuGrI+ztDD6OOfrgm72GM0O4BHQ5vFedFx0Kzl/lfHG56hImSUPZbMy
         xzpgWqQj7/RXWw08EMXr0cdCUqiNnUFIGpAlh50jH5OSqPu2Fbo/7aXn2QtQI0MMdqbP
         arr4u/BXPLgQ91vPFj0BeYyoml7a5+FzsmJLaOKGz7avh7dpTemwGkzKtTmOyPLF5Q3g
         18rXTpAtU9srLYOZ5c958pR8bq2BD3P4BWNpWUM0t25GmIkqFjrrv1H5+MI77dz+H9j3
         mq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788789109; x=1789393909;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Kp7LY9QNe3eEW83caIEVbreVyFyPEELLkmLUIFtk5E=;
        b=pINoKpFISlheqeTXTVmYLRdonADuxcE9rVl13nEAjZEjhRYUYqO/4kBslQlmJCElWz
         X1TFaQWaVxynhf7sFrNYUsnx6K1j5/qu6SM0B3E584g1PJbrwm0yC2o5uqv7GyJ22+Bn
         1i+btCBQ2y//JCFFneVtBrR6QGZd0T+n7rIm/DNwO43iaKguu46bkIm12m55P1og50tk
         ZwadEjexQKNTDLOwU2Cocdq60mJcZPuZ3qOucihNuorFMqyav9j8cHVm5LIJY4QLwCmC
         u3lN9jy16DurlrfrYK1K2kCzmOc00arYYrxhmx2PvMib6Iw615k49jY22Foj4mrZY6gA
         1OXQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7RmNuQI6GWyL+HdXK5YUVA8hrkmJjH61jq/3WnGpRc3+K2scxpt2T+rDuidQLDwLa5Ci4LymwcTGS@vger.kernel.org
X-Gm-Message-State: AFuF++m4v27VqvjPI7aP15QwMwGrdG9JitqE5bUHRM2zCFIG2JT9sJ2v
	21+Nug9TZwrNiDIXxRPS12dwfVlf8Cztz6FtxPo69DbWMVeSV4AMlsrXeHiQWgmoz9XBPPsHZOU
	dR7CtE4i+Tt05guqHkxrbNXrcZ6meMLpddLRI66nTNsR34pEYGxaT9cWOTWpi6+oz
X-Gm-Gg: AYBFou39FeByZj0gx4P0dmpG4UExWuxPMD5dL6dCEJHSGpDbucYj1+6hSNkJIlZWVqC
	EQ55/IKA1onC9CwACwx+VPtqLVmdrY8DuaniV8Q53j7rg0Ryo4rx/BnHIFmp4A1UquMbc82A7Fk
	+X6RAUPqoM/ScGWbZPH/gjNDKsOGV3SuECul7f1fwSenU0HOHwmHmIrjSZakvmWMHBIXBu99FuU
	ps2zCjy7GpEF92Pp6QcbZgxsUdKmpbJFBHfwqEZFTK3R/rXGDfmEayPAw9cxnbjIV3lL50xfS9O
	0+a4RjVXQIj2s0RxZI1BmF6FeoLNY+TJpWPVJBROBkgl1zyRoUPtawWcBoainkvG0HAaazJdfip
	7Q63TPd2br6rox4nxLINHsMRVQPyw1h8=
X-Received: by 2002:a17:90b:50cc:b0:398:9be8:ea65 with SMTP id 98e67ed59e1d1-39b261d9da7mr39790563a91.18.1788789109320;
        Mon, 07 Sep 2026 06:51:49 -0700 (PDT)
X-Received: by 2002:a17:90b:50cc:b0:398:9be8:ea65 with SMTP id 98e67ed59e1d1-39b261d9da7mr39790482a91.18.1788789108833;
        Mon, 07 Sep 2026 06:51:48 -0700 (PDT)
Received: from [192.168.1.12] ([223.230.61.94])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243767e1sm23752649c88.6.2026.09.07.06.51.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 06:51:48 -0700 (PDT)
Message-ID: <6475d1ef-0610-4b8e-9750-99681ca5ee87@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 19:21:40 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: shikra: Correct QCE node
 configuration
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260907-b4-shikra_crypto_changse-v6-0-0676f61894b3@oss.qualcomm.com>
 <20260907-b4-shikra_crypto_changse-v6-2-0676f61894b3@oss.qualcomm.com>
 <iow4xf2uflvjduax55tkbhaw2r4436uqvys22u6pbm3ry2gryw@g777gu46cgin>
 <841a008a-1ce6-40f9-95ad-09b4abc7456a@oss.qualcomm.com>
 <CAMRc=MefGHidh=BH+iF-4F5hJku333p4OMe=g5p7dfw_ieTfMA@mail.gmail.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <CAMRc=MefGHidh=BH+iF-4F5hJku333p4OMe=g5p7dfw_ieTfMA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ithnoHpIRiMes0SYyWRRw72EHWy4FJEy
X-Proofpoint-ORIG-GUID: ithnoHpIRiMes0SYyWRRw72EHWy4FJEy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE1NCBTYWx0ZWRfX+LPLOykYyNjr
 eVJ9o/jAYOv0R5yn5gLr7MKbu8/s7w23pRJpi9UpDb1C8hPmyWZY2Kdspa7GB/MvL4inXxS3HAf
 ZHM2QHZP1dlFkr7i6r0FRipU0kQ5NRc=
X-Authority-Analysis: v=2.4 cv=LseiDHdc c=1 sm=1 tr=0 ts=6a9ec176 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=YDt4qybLIboWMMC/SFNjLA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=X6FU6-3TaxV6hX9_o7MA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE1NCBTYWx0ZWRfX/y6yMqPnYDeB
 zyOjTYh2BsoSZLpXbwy4MiThychlN0LH85YotlaNtcuLfJOgOmb+T219DH3HN0vqWidty0kocBi
 6jiBN3ifMXsx1dJiDd38QqhOpPvFCBMMUNp05SehQIFePu9Sr6eVGVyiWTEiuMLD13eBLteLOzu
 E4tcKW/XwSBHAliS1O5NomqcShDYrYRysZTP/bUgciMArKg1+FPmt2EbUFuAodrUsfnv0n0KSbT
 jX/i/XbDhT+BRD55hR5cbzi1Lajfon7z80nsCEFPdHWptxw4UkdzO+gDDv+XFpD0I8zA+9NoEdx
 JS2Ig9WlpY5cD0+Q4XZolnEgGv9Up+753qJWwRsh1f3Fw2YabZ8cinmnHvFajFFXFYQrYffv0HE
 2HeEAsYD+Q+A1usUGIZRcsID51sMGZLGitX/MfZtdbFTYibJEbCzcfZoa6vem05EhNY9DtklApI
 JPa3ujklT0K04DqUFKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_04,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070154



On 07-09-2026 19:14, Bartosz Golaszewski wrote:
> On Mon, 7 Sep 2026 15:39:10 +0200, Kuldeep Singh
> <kuldeep.singh@oss.qualcomm.com> said:
>> On 07-09-2026 19:01, Abel Vesa wrote:
>>> On 26-09-07 17:33:37, Kuldeep Singh wrote:
>>>> Shikra is derived from Agatti and uses the same QCE integration.
>>>> Update the QCE node to match the underlying hardware implementation by
>>>> adjusting the fallback compatible and related properties, including
>>>> clocks and clock-names.
>>>>
>>>> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
>>>
>>> No fixes tag ?
>>
>> I was having confusion so didn't add it.
>>
>> The parent change is in linux-next branch and not in torvalds tree
>> currently.
>> Shall i update Fixes tag based on linux-next commit only? or not needed
>> at all?
>>
> 
> It still makes sense to add Fixes tag even if it's targetting the next cycle
> and fixing an issue queued for v7.4.

Sure, makes sense. Will update in next rev.
Fixes: 099cd05d200b ("arm64: dts: qcom: shikra: Add ICE, TRNG and QCE
nodes")
-- 
Regards
Kuldeep

