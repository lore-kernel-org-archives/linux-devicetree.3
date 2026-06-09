Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5E837AA79
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 08:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780992546; cv=none; b=l92duVDKxqdff/BLHidujfs5byDrCCD11Gigp+iZi2SHTrnoz1MzqRGCZWwtTtJNXsZCeX9poj1vDvzMHwVy+vb9lwnEUiDzu8g0cWssXkIOthfA9ajty1oUDvjpoqh6WT/I2r30db0qF9Iz8fGCxJva4SAD8qtieSkuJC6d/Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780992546; c=relaxed/simple;
	bh=BWm3nGLKCi2joyFCAViC6bp/DeBV9iqZPiIn3YWtERc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iwhGP30zyNXX7dRiRyEp1PfpilVcG0SdkPtyjfsyx0+8gdSMm8WCO4oAAIs/D7XfdQotB1a0C/1cSM20Z3EbkJ8RgbH7J1wu4OvkXsC1zTJxu/hL4GTuYHBKYsDZVEAcYkYSGOlsDpW1tlAsqiFFM5bylQuORBbrdmk8bkXYcbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LcFkZZMU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gXdaYjou; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LcFkZZMU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gXdaYjou"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rJkd1585645
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 08:09:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c4XPd+wWpZM1fJpNrLe4aOekbkivtV75BjWBDetnKBc=; b=LcFkZZMUpbH0wss1
	BE3WlRIrHY6M25HK8yshws4qycoj6hyESiMF/VxS+V+dJmjJU8+0wICB+AS7226g
	NJcSMc7e1VLwojs2aQ+P3tZq7awVuEyPLeC6469nmift2XPaG2FMfksYFvZV6wx+
	KInE0QC4W0fBV7lkMnWlBuMseHlVsIjaKaRwjKzXkmnkpPfCoc5vhMkq4oCMdAOd
	I7TlR3jJUWiF7WRNeU7PLh9WCg6wfVqDqF0WAEkzqpNKlvMG/ZitK9y2DI27YtjK
	iEw3D0SSWbxspu++dhmr+R0MUr7uu+V4J54gYKApijeRa1mfiLQo+67U9ka0I86R
	FnnuQA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeqgg3r5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 08:09:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517741bcc53so14524901cf.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 01:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780992544; x=1781597344; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c4XPd+wWpZM1fJpNrLe4aOekbkivtV75BjWBDetnKBc=;
        b=gXdaYjoua3QQpWaKBp/bhHo3hRt+bwK9hTGZW3BDYZOixqmzxuIDMEkJECpp9T48D3
         NsI1pxxA4AS/9IxmTgJrSCG4cFJXDmTbqRnKFQeNbtphOeyrv665Jv9CwtTtuM58xoTl
         blZymZZX3o/iR1rKLj1eKiBcmz7AT4s0RkJ8XvVTYYeayNdOI894zMJrpmhV87GsZCnj
         mAXPUVA6sNRyYAW+yoL/kQTV1cKVu3rvLfD7n85B2ZwKC7ZU4ZynC8s8Q1nXfnGFUhlt
         MmoQsxOk9qzXz6Z3dU2DS6Dm4wsmu6XikBTNZ5O0HquI+2tQ4dWbij9BnfyVi1xBBvNI
         ML6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780992544; x=1781597344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c4XPd+wWpZM1fJpNrLe4aOekbkivtV75BjWBDetnKBc=;
        b=FglL3DNmE/TWMA4qNSIH6vx+SdvTWvZ3XvIYRGez7uaxAasvwS2NVCusfbo4AnIiYX
         +FXtsvS+f3LDmLRJMR8KwuBhL84M36twnIWVrKbXOg8JhVWlAg2UcqnbutiCgCJ/au3A
         c57Gt8+Zxzm18R2HHQ5V9FWKFRIb3VDarIv9mssgxIQPBeKCGMQsaYcb3glWhVlRubQD
         NSD0zVPQ8C/BTp2SUMB4QK/bn2PbRU4T2CBRLkr1WIeQ69oRWweccx1hMqhQkLH3//E5
         jVZ+0vjJw1T/3PSqWzPfwpQs1HhHRIFcLDi2Lj1kx6qqVTdg18M5QkfGCllOPyp767oM
         eV2A==
X-Forwarded-Encrypted: i=1; AFNElJ+PFZXibhDwrnwNXdoNp6UxtGvrTDi9NrklJkqqeCKv1eENASSQSA9WLSfuf/luC69ThgTm5yrXnARw@vger.kernel.org
X-Gm-Message-State: AOJu0YwKtINIFSu/+xr30kDSiFRetC7wVK4jFwcHJGkgnqQj5wE7MmdC
	wq4o4U9sHdeWkZZTbdDw3RQEGAR8qg5KbOgrbPRrkzuBKg1NLErR15sWgGjElI/MYx7j6kXJHkj
	J5nBvFP4fIN/idOsZEI+uaDPnUz0mDkgJ11iktyEb/H4ezfXqw2cLoh9SWZ9uAHQr
X-Gm-Gg: Acq92OH3JgoI5HWVqt6VmBqwetw2pABKaYYyQM4/Ep3lf2THhYRzR+RAVPhnbaZa83F
	B9leWdCC2ra7Fsv7kgFLgP5m2YGyW9X4abMgDUZmdd20w/ip0eLLZJxcaw56C9NUSwSiEgetfSI
	sp3UBtqcsIlfFsUvg24Eh6hYgniTUflBGv/eUbG+OXXtYtVZOw2jrLA8xM9mgJ4HGUxJG5pz22A
	RD4YKEpUuaB5eaZaFAffCTRu5XaRdpaocvipRirTsVJmWFUCUhee5meJgmJolWm62vxx5o2MJmw
	ahUp/dDKzSMBvGZPG24JImNrAn5d/+wZVfC6LGmiKg5NBmz324aYoguaWrNlnpnUXrlGronhLxc
	ks2/dlX5vhU82hWvOxYOXyJWVb3GBgfPDLGM6LoVss+fhu7Y3tZCSBRuc
X-Received: by 2002:ac8:7f91:0:b0:517:57c1:bbdc with SMTP id d75a77b69052e-517ca43b7dcmr14829111cf.6.1780992544050;
        Tue, 09 Jun 2026 01:09:04 -0700 (PDT)
X-Received: by 2002:ac8:7f91:0:b0:517:57c1:bbdc with SMTP id d75a77b69052e-517ca43b7dcmr14828921cf.6.1780992543502;
        Tue, 09 Jun 2026 01:09:03 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055305d40sm978297966b.45.2026.06.09.01.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 01:09:02 -0700 (PDT)
Message-ID: <aca330b3-3fb4-403e-b30c-5e3a612eeb1b@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 10:09:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Fixup
 panel compatible
To: Yedaya Katsman <yedaya.ka@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260608-b4-compatible-s6e8fc0-fixup-v2-1-d23f373603a3@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260608-b4-compatible-s6e8fc0-fixup-v2-1-d23f373603a3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3NiBTYWx0ZWRfX65NbrHm7U3zs
 Cg9ZFZU6ae1q5wB9VoDoThNzgXnDorUGblhLREdJWj1+O2tKGq9O8t4gQWim4JbEOdelB984gjx
 MIVJv6+29DZVjJx+ba3nN3bEUB1D9IB5ydzDN/rMyS3leuOl6BJJ76ETBn3RzooR1/3R60A3rp8
 eNqsiVbrYywsFfVFp+fPGqsZoNbabYV5uWPgYmrU4HFEjLd/XXjAdOKdMO5GaQPx5dPCV/VEnAs
 NUWKxOiVHXDkuDNEIAw5I7HWdByWMt3XHOktjMoot594Fy7SHKw7y1EU8F2gd3KK8nfHj5jTVLK
 TFTVFK2IcHr9iw3WHWOzQA9P2/amg5hLk2NkPB6jE1FeodeYmCz4+v52oc3qcOyfkOT48VhHykk
 Kw+xGns6GXpJZfw2xWYoCcYc7vd1uJLTgnyyyv6DW6Iz8Xw6xuO3jj+e6W77SQPZYvezvQpmz5g
 EPpS3dN9hMsV1V7/t8A==
X-Proofpoint-ORIG-GUID: LflH1tBCiDFlSrYimZvYICCB8aJRSw36
X-Authority-Analysis: v=2.4 cv=KdHidwYD c=1 sm=1 tr=0 ts=6a27ca20 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ubw6xtKFYLytkWTF8eAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: LflH1tBCiDFlSrYimZvYICCB8aJRSw36
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090076

On 6/8/26 10:10 PM, Yedaya Katsman wrote:
> The change to the panel compatible was missed, fix it. This compatible is
> already in the driver.
> 
> Fixes: 493cb869874c ("arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Enable MDSS and add panel")
> Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
