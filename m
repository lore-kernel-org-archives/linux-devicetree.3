Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557363;
	b=Fsfi/qsXPc3fP4ATEk/EatBCbtKr+RcSleer5CNNSFjAQxx4vdqnO+2I+Vu8G7kmgLEv
	 gLPuPOgtp//UabhdGyGPH/xpCXemTG0/VUPzQYr7xus3nuB2qbmXaqInPzT9bziT5wJY5
	 GtTkfpt5xkHRpHHdiYFlLzd4GjIgNm8vFmhHpQV2ge2tK14ETXKkYhvKWqbj3K7oBJEuD
	 1NhqOclDJIwrhPJPl3QcB8fuUupBfIlgP7rsliLTIBZRQnr32/fyt8cfQ3tx5HFGSk2kZ
	 5CVqKcYFpb8Ad3wejnfBD6VgifnN+vHgWJUrxKlpTGqhcfTuoRREcsiWAiwng5exXrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557363;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mkD4uiCcgXHBYuq4A24cX3DO/hjlaKeRWga4ttkhp+o=;
	b=sky3chDuI18FxhPHXRPG4RCoVOhOSzZ8qykU5iatjySWSMpjHcyqBVP+hceIAsfXj2dT
	 VotI7lRUr/Hajci4Pw/ytJQDHDPX9PB/7MJ6hPRpv6UiL7iG+jkbiz/MbZvxxcxRXFmbA
	 iglyW7MWkj/nV0Ohs/H/wqnR+uQbauiU+g7YXupqbpcQBdnX+3doYx0sM/3pAhX+QPMul
	 06TX7mO7hsjuEhmKBKSJXnYVtCX2GG7cpOkIdS1Mh0rvlUAZziWbFm1SzhEkb3p+QFSkq
	 3qOHhmViUpPxEvfjMrNWrlD1B0YKfpr4BABXuJnF4zr09Iz4bAnLbl4sNJw2fvn4Ydg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J40ukahT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aSfLprN0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC8C606A32A
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:09:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DC8C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J40ukahT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aSfLprN0
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57AAY3717466
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:09:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mkD4uiCcgXHBYuq4A24cX3DO/hjlaKeRWga4ttkhp+o=; b=J40ukahTnNUfzPEW
	lPnaRydEpZizw1sO4rxBOD7piY17oGk39Xe4h6sIXD8bOGNulJcsyLFUnnuP5YVb
	dWwSMmjOiPg/omFAeLPVPAGvPYYbKBUljs/+EkDebCv5Px9Yph7njtds81LeuG6O
	kgqsKaMhA/g8jqhzVmJ5feKwpU6yT2D/KE5XVmRuAVNL5LGM3KOikJbDoW4P1FQQ
	sfEemdhfF4oWGTAWX/pU59p8XDoQaxqikIL3FIG6IqtG+OFJPUcVMiANzeIZpzmO
	m2c2IO486Wri4vpCYWnsF+yKiS5gmbm3HEawl5vou6I3fF9+EhEVa49qfB31GL3F
	ZC2J3g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufhe75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:09:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2bdebfc5so17808185a.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 00:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794557361; x=1795162161; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mkD4uiCcgXHBYuq4A24cX3DO/hjlaKeRWga4ttkhp+o=;
        b=aSfLprN0bqRXbClMHpP6CaNBc7BmtlflbD1cx0a8wrK8ufYXJh7tOWd1DIdb0BS9fg
         124eaav558J64bSDmDOAvwD+mOo91VDYxLnnNbxIUpH3nJFOIpW13FwVLqJ+y109KvFQ
         dnv+MK4KIadET1JGGfA8fP3ZNRyrFNXwpyj/BN4OCB4hs8JQXHsu5Q5fkMoJjiQ7/Pr9
         x+K9a5NefQsGOZ2myMWU8dXOcWWGpRB12e3C6IgIGReREtMKro6dXuphg8w5PEjJnqpX
         5L2laftDi2uC+F6owkw+hPKtx9klqsBO9GOKAtFPdnQTow7sTMjocOkEfwvG4aeo9qjh
         cfqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557361; x=1795162161;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mkD4uiCcgXHBYuq4A24cX3DO/hjlaKeRWga4ttkhp+o=;
        b=vl31axOvjG8rAFawfN3z39yWp/MkH9PgQsHC8L34D9ejFw9cBJe/SjeOtRX6eW2Ozb
         8jthD05tn4AZk4mhDVox21zOKbbAMNfwb7I5dp+75oMnbihl44Rp2e55dwC3ZjZ68+yz
         yMtW4uLu8f59cfu/OO3YXvdaJ7cYga4KGNTy8V2QnPpJzBaydzyyDjVoJL595SH0V23q
         s/9NKplIvsgzEDbXDaT4PB6zpiL83xNHFu3TsmrZ2b3auvl6pSbHnwNT+d12/cmob7Xq
         3ZHQ32L4LaWlnbn7qDJf2Q9xhYHPwMCmE4ePRJQlaD5EDQfT2fXao6ReNfuICvbiTK5u
         OS7g==
X-Forwarded-Encrypted: i=1; AL+hErHhpih4Tic5hgYqrMMs386LDitFEgo/xh34al749Tk30FotlmmBPZF0d/pTHjT0FFbzGrp3B+9FONop@vger.kernel.org
X-Gm-Message-State: APuU4Z+OIX27akslJSY/xjmQqsxJXovwPFm7irZKnxTQk/HJeK4B1n/K
	jg091yEOr4hkbHWz8+LIFjAcsyVLQLwMX+NLvNw9FcK1ExnYqsth0Hurq/e7HU0eULlDPl2z6wq
	TNKoaYh/u47KQJX2R/zW8oTdZlykG5mrOkjT1F0JogqVylhRonE7CFHylw4+W7X1R
X-Gm-Gg: AYBFou0A2GCIb3L1rSDnMBIf4126ULzsW9Bf+LoMS08xDy73Aj8g0RrNeBLnrUv7sQy
	vVjuyHqJr2IO0D++NhQQCPCIMby9CVEmhkGnd3D7n3dcDZpsjZF3WH4GQLFfYJ1T6dXJgTk3/HT
	9wMFxewqAu+a88ngQL1PxNpcahm3YyuOy+cPe8kZ5d+HMpuR5Kb/jlQ0ef6WjxSf9d2Utdue/1/
	PUVBKbSon8sJL8JYO8rBsjXMuFlM7DfdQWm9qOtfWNEpUpOK5LJc6SqiE4XiMcVg1KoIakSK1pP
	p1DutOeBkRtH5VFciztyNayCxpjdg6CP3LZzsy79db9TewTXVmWoyoZ9eLwLJOPbG0axpRc1nOs
	obOlCENUlu26XAzsVA3dA0XOAZWCUKd18voWGkhvGImd/nS0H+GtgML6zLPJDJKXJnFlY1bk=
X-Received: by 2002:a05:620a:5811:b0:93e:54fc:2c79 with SMTP id af79cd13be357-9494bc39f92mr293510085a.5.1794557361373;
        Fri, 13 Nov 2026 00:09:21 -0800 (PST)
X-Received: by 2002:a05:620a:5811:b0:93e:54fc:2c79 with SMTP id af79cd13be357-9494bc39f92mr293507385a.5.1794557360952;
        Fri, 13 Nov 2026 00:09:20 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c21b5eaesm646327a12.1.2026.11.13.00.09.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 00:09:20 -0800 (PST)
Message-ID: <afcb4a7a-1089-48e9-b42e-aab834547ce0@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 09:09:16 +0100
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
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm7125-samsung: drop unused label
To: Erikas Bitovtas <xerikasxx@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261112-sm7125-samsung-grip-sensor-v1-0-d45dd9c845e7@gmail.com>
 <20261112-sm7125-samsung-grip-sensor-v1-1-d45dd9c845e7@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261112-sm7125-samsung-grip-sensor-v1-1-d45dd9c845e7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: m7U54cltBzgTfC6J-BGpI7Y08NdOSFzV
X-Proofpoint-ORIG-GUID: m7U54cltBzgTfC6J-BGpI7Y08NdOSFzV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMiBTYWx0ZWRfXysbIm3EYSb0b
 5LnYTOIm2Fc1A9Zrvc2QMXY2Nyk3/8u1cPJqNRnBMKHX6fuY1B2ZVtUkX5zS+nHrkBMgx85CEe6
 /RBgjIMfXRhkX7O/UuNPRNQaZux2esu086OO16qenzmaT9xkU9iOzyff/9StuI09Ry9w12wuCrD
 a+Xh4WOxBUKn0clXvWLxCcdWd/OuT0pbRWd9ogvtsVxgmQR/fLv3oHvqj6/idsjrKKCTd/4qrBp
 2OLB86qETpsvgTph9c1xxYhRI+cLPDYEyteb0kbLFzLengP9rF6rIDKQINe9Qj0N/etL2rYmuLs
 5f3tPiVxJuSEv/TwCbu9OBbqI8HSfiYWr0s0X45PCkkCtVXIs5NMgBAX7GDRQv1cm36RerPMU4W
 IrElcNniqKDNVfy13ZUhDwq2ZN/WX5v9TBuE6vLGKTF7Nwbgdc7ywqRB8xkHBweTbkYZl0tiXPB
 jPHHrjUcUN8oR7OQvuw==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af6c5b2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=zf4sTP8QFhBXReTkVZsA:9 a=QEXdDO2ut3YA:10
 a=pwadHHMnZuEA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMiBTYWx0ZWRfXwuxAcNh0Us5q
 2HpwjeXaiQNWbCD/yNNvzpaLhe4abjb+4xvqVZUrBaff4kX3Mo0q10GjBLL1aEBYpD6Wr8aeSXw
 pgRK4spi56S2HIwbCT2neKrXJIR/rDU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130032

On 11/12/26 2:32 PM, Erikas Bitovtas wrote:
> Drop unused vdd_cx_wlan label for vreg_l9a_0p8 regulator.
> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
