Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3C13546C9
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 12:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790771882; cv=none; b=tvFkUsON/HL3o4bc0bGyJuOSMhJm0KBvLI6rFefRd1uJnyIV1noRxucxHsP7muN6MdD7oF5t/SQubKyKFVXOF6NYb9HHKPapwzAb0J5/jWoLxg5SfwEII0Qzx8DWypzkYM4dfTbgReJxeFNizG4qEnV5GONMsA1BA+xxiR5eLGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790771882; c=relaxed/simple;
	bh=kg66g+UvDwg168UNQb/RRHCbGtBGxTEKpUOmJIOl5PE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vq5OktZiLiBdkOGts+u5R+l/ChKVaEQJa+irJaklYWYfXvA0xbuxQE2obiZmfjRxhj2oX7h0X6iLrJux+oRbB60zbSMDER9xr/qPS5f59UQyVPaaRDqWb/cuqyod0fjNGkzaVyea9p7R29HbJy7N2sYWQBXokFLFH9N4r/rLau0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p4DzFyl3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cjk4gBUk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p4DzFyl3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cjk4gBUk"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB8U2U3796660
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 12:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b/FBIdQAFOtpRV9SArhXKK7VUOg8kAx8+Nvg1pgL1fk=; b=p4DzFyl3A3itTisH
	sBSnqoHs2b+hFtnMnFEtpqnY04hp43l7EIBRFWOJAwO2kfGMkJ61wKZqZZrB8sy8
	tP2w9NITF1QRZxxuaZKfLRY39Eoc0crEK55cZ1d+8Qs9gkiSmxripQLYQxDqSQse
	o35g6SpMXVyt5xeemne98rToC3o4ByvveF072y9NgbNfXX+/yDmmE7SbNuEol4nN
	v8utUMf/ymBEu5rjc2t3HaFFnNLk5fKGn5DJuZq1oZIOeGHikRhx5Xii16FUQs2J
	mE1vfYtc2BWeCUZCsnK3PSy7roXAeFB6i4Waq8qt/7EZOzG7XTckKszr6+sT6/Gb
	NTqlNA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0nm3kdpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 12:37:59 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9179ef12a03so1501026d6.1
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 05:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790771879; x=1791376679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b/FBIdQAFOtpRV9SArhXKK7VUOg8kAx8+Nvg1pgL1fk=;
        b=cjk4gBUkIj5Ne1MdnQz6+7xl9UGfPPC2cc1bvihzHT4gZin/BlT4Y4BE3O4JcE1mv0
         hlitvf0Le4wpKHW9znp2/gTHeRzmhJZAX852fSalAHW4DBuMk/CdjV4eIxz6fTmF4aw2
         4x+Ij7h7BVOZ2+5fcscWFiWKNHzgtKy1cmERkUaxnBl+DvK4ma3Tlsm+h9SKI0I4YTHI
         hl6KoLaBPQSe/bi8X1v6iVKmJuGT04kotwcDH82ocgRJq/8klNcA3VBkksQenEhQz50G
         aVrL35rrdNDguFd4BpCGJ6F5MUP3Az9WG1NwEkLXdi1Gf9m2Ly6cQni0gBDkvxGQdzax
         xesg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790771879; x=1791376679;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b/FBIdQAFOtpRV9SArhXKK7VUOg8kAx8+Nvg1pgL1fk=;
        b=GwBt9NaEvROKCDDZ8+7ZS1YfYSanWBz+4NuObbFLT2by7CazPsXK+Ks2eoNBwLTBLJ
         V6WQKAwYkXVZXTJ0KoGW3LUn/4K4SBmZCQhfVk17P0xnwtGqDyOHR3kba0AX1zrtG3JZ
         LfOBC4AyDVa3AGF1rKZUuBqf9RoC5NGc6b8ZozeGHmWcqMfr/IEenlopYnhOMIrT47k9
         rUCDcq6hIYQZKl8HjjbpmtnnkHdv6pKm1gMjt66FlT7KzrNPtXScQghBaLad8EIDgUfm
         kNw/8g5/3EpIozAORP6R9Ba4pSsYn81+NkfLzynPeE+DIZSPZk5pmBYkw3HMSlcyXWrB
         9u7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzh9eED1vHfBxt1RoHYr3bMDjJA6p74VkhapF5q5eiIyiHi7liiZCwnp4JU0LkG16Ng7TC0VOqaoKEX@vger.kernel.org
X-Gm-Message-State: AFuF++l0AFc9JpUD5hOxQMMXGHi8eYdoR0RvK+Xrg/60Z7xftqJ9RZCm
	gf6330+mUQTQKqXtGJ51OGDCkxtDwpEb72FukSDL9XVQwxz/ItbSX8oaQH63D5U/8PJnYKNhGrb
	7faYLwiJikDRfMnWgQQRCqw5v0Q+uDRg/aauUcY0L9wXV1Q0g+8wU8CpVEYAZabvj
X-Gm-Gg: AYBFou2DA66RhalSDFS0cSeUGvLkcxGPxfdmP6yiUIregm2AQg4cHxhpxqpOY080KKI
	i7PcGNZw1pH4e7qxAVhegk41fT5rC09Y3qcqulsaAIQxPxg+Ib2AwwLv6eGoaFb6jgdSSEibz3l
	cspl9CNJ2+ots3jBPshmfi3mUpMR9NLeRBTqsSIt66TDdkEY76sDcfNpAB/OFvTFpgmqT4DwUq8
	7raWUwpjq2HkqfOgcnhqTAAKY0kKuS5n7PHFoRv8r0F77eLr9F0sJN7f2Z3zio3daI4E7uTnjDZ
	iUYCxk4HhlwWCpfJJFwahlIEEzaYYH6oYHJfnU9eBfpxdIV+FunNVKzs8LqEDgNyICSxXqVfrQ2
	28MJA5Oe2Bo/W8Pg+zQtE/g==
X-Received: by 2002:a05:620a:4541:b0:939:eb09:4458 with SMTP id af79cd13be357-93ca96cd5bdmr170702485a.3.1790771878795;
        Wed, 30 Sep 2026 05:37:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4541:b0:939:eb09:4458 with SMTP id af79cd13be357-93ca96cd5bdmr170699185a.3.1790771878365;
        Wed, 30 Sep 2026 05:37:58 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae047e9b38sm783768a12.3.2026.09.30.05.37.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 05:37:57 -0700 (PDT)
Message-ID: <a25bf79f-efb0-450d-bdab-6cdd857f2328@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 14:37:55 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845-lg: Enable NFC
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20260906-sdm845-lg-judy-nfc-v2-1-63aeb7b1a5f6@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-sdm845-lg-judy-nfc-v2-1-63aeb7b1a5f6@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WRtzppVW9iw0sa1miu2bcLG4G1U-7G6S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfXyoLiNg2p9kS1
 EhJ3pKQL3k3pzbVDM7jncszWZ73lCxludQ4eRlMyWNQhU6BoJjkPaf1+fvjwUc3KRIumBI4QYZH
 X4Uw4f0VOrVNhrU46EC5XZaaKRK/MmTCVfMbqhndltcWmOtBKgyQLEAbMUr4QIkJn6PbuMOf9Pm
 3NaCv2YteN2/HHytFdi+j9P8xtEKMe3TU6/WdSA/W4+guJRs0R5moO2BHWPZIzIaCfIpG5keawV
 z+5cZpBtWThCo67HjMk+6OExjTHcOXciHjltwPJylVziMqXUjCeGJ5zfnAj+XNcgVG+KDaBPGhS
 jka/q51dOq1Ro6e5M6GmuRwWAH1Ala9aOpU5pPR3Ge2lW0L8FZZSiwuhDoAeSyXBqxXT6KQn0z2
 hB3dD/uGZZGITwK9fvjJ3NS3z7k0A296Vth4xpjuYZ6bdMyjpWMHdJhGbp2nFR888Vu9uRNYjPz
 h/OOcyYCYduzIbHQioA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfXyyBqSSMwa3f1
 94Bzv8kGIJ13JPHwzgu1COxcVgtGcnDcqLMgigzpstCHlSU1m/qKzGMQgU6PKTqkJeYFQ+bcl2m
 1Q4soBq+wdUczAHM7piEDa8559oL8uQ=
X-Proofpoint-GUID: WRtzppVW9iw0sa1miu2bcLG4G1U-7G6S
X-Authority-Analysis: v=2.4 cv=fqxJ914f c=1 sm=1 tr=0 ts=6abd02a7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=OQN141zOAAAA:20 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=GcxSr_ZgTee_yd3lG38A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=9vIz8raoGPyDa4jBFAYH:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300050

On 9/6/26 11:11 PM, Paul Sajna wrote:
> Add the i2c and tlmm nodes to support the NXP PN547 NFC chip
> 
> Downstream dtsi for reference:
> https://github.com/LineageOS/android_kernel_lge_sdm845/blob/lineage-22.2/arch/arm64/boot/dts/lge/sdm845-judy/sdm845-judyln_lao_com/sdm845-judyln_lao_com-nfc.dtsi
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---

with David's suggestion applied or not

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
