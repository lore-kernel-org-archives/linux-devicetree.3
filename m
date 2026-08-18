Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE4D472F82
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 12:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787056338; cv=none; b=Ay5vEmJRCMdmTwcN5JV0oRIR2TQnEPveReP1luGcF/qCW+KQGDw8eoSCGyuNWOJItuVqsTNTjZr0vRBJKjQP00o5RFUTA51i+j3UBl2jFigE1ko9zg3PAMK6w0kIs2tuGZtMBzG+jI74Zwi9/OHRqUQpOK+qmzJZPn8wcYnjhXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787056338; c=relaxed/simple;
	bh=kcW42eL8ewWV1BMo8zyyP7ynhBtRV3JJb/Jv5xe9JE4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=POIavelAZCd6fBZ8U7sa0U9v8++cVYjN0HuxssQLfyuCOveF6DnUSAuiQw6AlDtv0JbEC1i7XOD1xFmjb/OwG9tOX5NkEwoCrmVAPHQCQHRUvsh4xDWck9quq0QYiMJWIufSPaRUliXSoiomHieOm0ck/MaxM+EZaciJfTOqc60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ilvlu//d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AyJenn7u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ilvlu//d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AyJenn7u"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABWd9068516
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 12:32:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S1bO7QSRKy8RMXytHyk/lJz1mFibyTopJA3AZH0/vyU=; b=ilvlu//dvriJgbLe
	9lmoq9n8oomeZusqWQKaUh3N+9TufwkSX+pNNDz+6GyDm/dWVBVnmA7PO2PNx2ko
	sGbP+dW3MzDZvGNFs2L2QWTVUQ5b7T/NyDF4dFZRMWqA8+7/2T7RDVYNMfavzMfd
	nXxdOvror8sMJchJ8hQeIhPERXy/ys3fHtXUsPi5rcuG0EqKxZSXuz6HHk5P6lhD
	0dQVkiVBfd/BPESpEdKOb+woX2W2S7w+EP91fvT1UZA3IXsglmyM5M4lc8JoGytS
	bIGoL1T3GeE8X6hA5ary1IHwFyBEouJyeJikGosbTt8VGfLP4LhgO4TWwC/QafPJ
	P7kroQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4f5pt618-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 12:32:14 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-73966c839bfso12353137.0
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 05:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787056333; x=1787661133; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S1bO7QSRKy8RMXytHyk/lJz1mFibyTopJA3AZH0/vyU=;
        b=AyJenn7u8aJJoIckJ7dzQJ3rUco0g92HOtaTk46m9X6ueefEvDA50yjtgVjV6hwImR
         t2Bf6EMlLssKbht7zQ+ygMVeAQ/NyqCMCtVhEBP8L24GTl/dh7PVeYGvagDM6ndf0mQV
         Jof4ysVMnb81qmQsyd1cxDCsyXgFe7IqsKI/h6UxG9nGKMDels7I6rttPERKXmtTDPZ/
         0OZpLzfAmzeC7WR50EF8flpq+LCkpiuFp/il6zoilF/RDrFQvNOe+pWj9AdkBc10nADY
         FgZyhJc63qJ5CrHAr3dbhIa8b9viHjergOn+1tN6WuhUU+VRE8359tMN65zIWWgFBQHf
         1P/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787056333; x=1787661133;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S1bO7QSRKy8RMXytHyk/lJz1mFibyTopJA3AZH0/vyU=;
        b=YrfTla5P0ZBePEkbjljU3DLBApGAaMTRuC+l+IhxRrtQiR6RvVP5DvmU6a4Ohh4ryN
         xpOX+RPGI05+pAdQ2k4MrjZoP1TNcfh+G1pcBjMvcPjlZi60nELk6CLMsYzehW2qjSAf
         iIHvKx+RfEb87Agq24CkCkbkuBlFU+//VSzTh0NgJLajtMgH4HhNFzKFAradJohOKj/Z
         YagO3hYaolyIdWhOezdRh1BqE4U0VIaAebHWnjUj2/BzK8A5ELvrsD5XE+JEPIn3r5NA
         Awqpvr3vShkidFl5q06NeXCD2hQqo7hmTnRtXt8ltO031Z9akrWWGm0NdIN/CbYAUotC
         ZRSA==
X-Forwarded-Encrypted: i=1; AHgh+RpNH2hi/Hkc6ZeCxwzDyu3EbUpF83cZ41AgDW+NSr5KDEEQkldtJE0Amko2TxHjr9U94Cl3NT0eK4UO@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+qE/FSh5g5eABfm1whwAXh3T0JFGwpUi77de5JsbjZ4t4Kue5
	9tV66Hsl9sICJbztpbHfEIxw6ozCAQfDesGvyEFpfsrxYyOhkDskhYqeKbu4RQpfDG0WD8Pi8s1
	1KowUJU+/Fth/YImMWwpqDXe4ClrRphNgoOWSpF7krkyUGl12Ex98YRdAfCIcYRVk
X-Gm-Gg: AR+sD11dR40Hwc3JKyt2pXVs9zgN8aiIhTiNNBT9QcaasjpBA4WG2AU+O5F1gHyhhgb
	jmgD8poHcThr34gE7e8/+fPU/BKRPQmi14AeGTqFnMRMY6FsitK0MakSeQES4k3+dbvOyjdjy91
	fxuBjtzAFzo/13VFbQg1qN7OyyQ9YEci8oK1kJIInpvpX6inFw24DF8EF4+dHSpSwWmLA7FtPyj
	vvfQx5Sk8mR7zhRJ4NmQTnG5ppVUCIY8UEy/IQgTwznBUyxTZDAZPKO6pS8pDbl/c0/gRHnDQuu
	oXoi1i7dWI3OMEQL5uR0fGCdae8qy5I4VCCZVCe0tjN9sGI8f6l8+vDzWfr4IEdgmat413NENOW
	sOdGY1V0AWaoTrblvZ7TjWNdr
X-Received: by 2002:a05:6102:5091:b0:72f:6669:286a with SMTP id ada2fe7eead31-76f2c540eb2mr2375245137.2.1787056333405;
        Tue, 18 Aug 2026 05:32:13 -0700 (PDT)
X-Received: by 2002:a05:6102:5091:b0:72f:6669:286a with SMTP id ada2fe7eead31-76f2c540eb2mr2375236137.2.1787056332924;
        Tue, 18 Aug 2026 05:32:12 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fea2ce8sm173007066b.17.2026.08.18.05.32.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 05:32:11 -0700 (PDT)
Message-ID: <7dfcdd41-7552-43d3-a2af-915aefb6b218@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 14:32:09 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8150: describe download mode
 register
To: robin@snyders.xyz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260811-submit-sm8150-dload-v2-1-fb688ac4896b@snyders.xyz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260811-submit-sm8150-dload-v2-1-fb688ac4896b@snyders.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S+/pBosP c=1 sm=1 tr=0 ts=6a8450ce cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=OsHF4jKAAAAA:8 a=EUspDBNiAAAA:8 a=wptXqXowS06Jby1VKWcA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=aAwnOj5LE8VeXseigifb:22
X-Proofpoint-GUID: ew0jY8SZ3v85piUjPigZElMtpc6Tg-Ao
X-Proofpoint-ORIG-GUID: ew0jY8SZ3v85piUjPigZElMtpc6Tg-Ao
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA5MiBTYWx0ZWRfXw/wIQohug0W1
 ZPqKhGj4+zSmcszL3Q5sJ6L7auWGOuBeHWxkKmRoj42M41MNr0ucB2+YHFEwL8zC+ELX5wHgcnO
 JMVBjsEjnpETwAP4O+0Ylpv1ZshzJ/yI8v1+Fe6bq1ZhJLGXgy8DoFLygLLg36k7VdxpsEsa7Yi
 oAyp7ZyGOHcwJLEfHzuguFRHRDUiZjE941jEx9A3xQsL/FuIEKJ0EUFDMrJ2atA5V1Xdzj4cXPV
 +U7dXXj1xrAz2ng97c8W1M9y6maQFASFh8bwxWbxJ+vUCwdxhFlUUm6L3mNLjHXrutWLMCAT2lZ
 aTg7kybcc3B4/bd782p3L9OmUUIi+WQCveQD06avkG+6LUYBCpXEZb6jdtBeR23J38rmnJNdCRH
 25RsIT5l/cNjcnZAb9fpD5/ss23yCEpyMTRo90FyvYE0QoWxe60vUxdq8uuon6DRYOCjeDbbfEr
 JTvhDUhPd3suSjfSIlQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA5MiBTYWx0ZWRfX5QxZAi6OJLM5
 ZEZux4P55OcSzbzdZ51v1tflSEuBRFI6qLGwTDkMS5KPkDeVYcYXLOolTLyb6ZuuPKCZ2Pi4LXh
 jcUOIpyKqsG8Oi9mxeSdu+YklceuYzQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180092

On 8/11/26 11:39 PM, Robin Snyders via B4 Relay wrote:
> From: Robin Snyders <robin@snyders.xyz>
> 
> The SM8150 SCM node does not describe the TCSR download-mode register.
> Without it, the SCM driver falls back to a firmware call and the
> mode cookie may remain set across a warm reset, causing the next boot to
> enter the Qualcomm crashdump transport.
> 
> Describe the TCSR window and point qcom,dload-mode at offset 0x13000,
> matching the layout used by SM8250 and other related Qualcomm platforms.
> 
> On a OnePlus 7T Pro this changes software reboot from a reproducible
> 05c6:900e transition to six consecutive successful boots.
> 
> Signed-off-by: Robin Snyders <robin@snyders.xyz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
