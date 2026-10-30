Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349390;
	b=pjwACrz2IVjMCI3UyKuGHOb6NHuqusBQw9vfKJScB7ejVnn3y4LVBlOhWgtFmDMCNaC3
	 221L83bfLo/1ieqJZ0TSkFltuMDdGH6rNEZMyhgJBzutS00avaz3qIoxdi/GzQM81C101
	 R+0Fg7sHD9Et/V3AB0gxzgyFcVL+k+/ENQIsbuIKnSaAzJ3sAdW2hHshxvvePBx/Tib7K
	 cw2KGb/FvOIrw+C+b58NaSeQeeBUDRveQ4ohggxqBnPaV2haCmfRRKNcVdrNGe9Tc0XCz
	 lot74dlAxf60LagD5kDC2GO5ZGEMZC3P0kGhAeGG7/4akmf9hfeqXp0WkXjLZqTTruQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349390;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XiPjhUsig5pIDEdVHn36C4Ya/fLE2sA7Ys9Oot6koy4=;
	b=owjB2mhp1sejdY83puJqIDahSkRp0cumTLU4z0BYa47p5lMYZNCGFT/lEmps+KUc9WUh
	 IxAm1wkauib/YfCl2Ivs4n2IxgKbgW7WSzNdorvC6ZDJLumag/wVgO6RPITKKWdKyLvwr
	 LxcEIqFuoexX5VQAkO54KIGwnYB3qPyTw7sbTD4QIpdCYA97Pyip/x1cDBiti9naQPKGL
	 xWdSLeuoprQfhxpMqFkZRwfQpsVpldL9uy6TR6XX2oH+eem7Ny9phkl0iQlCmkxJ/pToG
	 D4DkuzU9JgdixYVs9zgcFWokcF2zWyJh1Qok5QBfBYlJ+PB96OAygEyEcqOa3BG1w+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zd30QhU2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dRjezXQS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC82606A31A
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 08:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CC82606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zd30QhU2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dRjezXQS
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8FKIV2733275
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 08:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XiPjhUsig5pIDEdVHn36C4Ya/fLE2sA7Ys9Oot6koy4=; b=Zd30QhU2iqk9ntL7
	Sztk6fR+WV/ESgBM+fdkzGRewZFpYKWSK7k1RDaCmvzYLBuwKV0r59AVg9A3nLh6
	Yf4jqKashRRwzzC1x7o7zl5rEhuZUTkPe9syChPxNW8Z0uYTGjKv2ahMd5y6kec6
	rnpZHkhgvNsJfbDLhavhtEDJucsslX/jDA6uw+L1a3vMK79tLxsQ+844ND13vxht
	nRNfr52oilXxbAOq4qvLZc/jGJdRLziDUnt9Us9ap8MbSLMNGKx1vu8zNnUlwizp
	Rv9891tfjHSxzaEre9iiF5lAwZXyOxK2bi4fIrvzo7o+Gs/VGOGlAGeWVhsoNUVE
	se+bGA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qj12p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 08:36:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93edac5877bso3461785a.1
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 01:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793349388; x=1793954188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XiPjhUsig5pIDEdVHn36C4Ya/fLE2sA7Ys9Oot6koy4=;
        b=dRjezXQSkvuEYJ3daXgErwKbHJIx7z11OUgALKAU/Y4Ta/HyldA9WLM2IpnnXbh6nU
         pIqdE26yUdQc9oj+o1OTIazrAGa6yyUdE4CjL0gsQwrB9oszw21JEVTNJlRzdpWOWkXi
         yp0JVgWdEDgOCOB10XonyVScZn+LJ7eRkqfNvm+SxuitVYz7nPcAEwwlgkpXn95hk+T/
         YRCOniNNFv8/t92oPVd6qbuJeuFqIwhfaHX+pQy+yobwtKCzdFbPPyMfKLFVdx2Kk8yB
         +7+t5AFL6s7y6uAwyqhgG0VXlADqkB2xmfXCM5WmhSdm+s7lUY4Wjka9gEs/WWTR0vAf
         fDOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793349388; x=1793954188;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XiPjhUsig5pIDEdVHn36C4Ya/fLE2sA7Ys9Oot6koy4=;
        b=D7gXazMky+eplAmVazHtuPNXD7u1K9Q9wCCVYhyGTb4TfGyaEI36bFCWR9M5pQfj3z
         syRa3odlSHpOS0riPx6WdSmY5C7ZsIcQourdc166VfHZDVzhoGp7LNqxAXD8Aot+4cdO
         hLGMRSVryVSUOCwfB2sNTJ0Ire/Ju7oxiWDKNnZiGUCHojK2gBQoFH4jqYiH93JnjSs1
         pG8TSgahxOEXHoRyaq7/TfJAvOzfLD1cr946th9iOnQju+dsbtZzddj1q3q7jsTNsOLl
         H6VsB6SaU5OaWwPIj7eZT6wccPSKMcd03bt2EvcO6H4tc2vwW/ycDjyuiDbYLJP+1u7D
         G1Ng==
X-Forwarded-Encrypted: i=1; AKwUvBzOy4N9Eh/FlAIwyN1I/PjFj5FSHGFHBSqe+XqWzrGTAzF0AavuTLXw+FSf4O28Vr7OgLkLRK/NhI7+@vger.kernel.org
X-Gm-Message-State: AFq9FYJCV9qhMh1PSRmVK2Z5gMO1P2s6DMtNZfNDPhTmhue+deUE4npC
	4a+HpGlVnW2LsLVJqOEi4O1RUMwxaHO2hp4RnMlexrv7PZjtQmU+p/30puxu6mJe2aR7JPFCLQs
	iIFxaBn1DPJf2DyU8LG1v8fS05zc3PSWjCeVCUCKr7ODp/OhyPZUNYyVrkj+r9Qtn
X-Gm-Gg: AYBFou0jA3LbIQt4NES+AUH0a1HQjtIENFIuv+HgYGocVALGCenWSG7m8Rdx2gdIgas
	3ZSB15GYf4hh3l7ZMVq+MbWynJTgKE4lzg2wP03h2Sk4zg34k6xSLvgw/GKSQRxLRN2VoH6TKji
	Ir7ZXp7cMtw+ytDra4KbBC437o21ie8rmhEYVGuZb1dsbp2wgvjIrEMbzqqpzl5wlJPO6Yczc1w
	2Wm9MpFFNdHOFCm62Ovpg0hQBbdyX8L1YCAu/syA0BfZw5+yc2mnFg5f2PB138/QiHhai9JAf9t
	A8MFLmgmEKTeizlcwnb1IbFj1LrUk2ivBao+G/BGMX1imWjx8EYTR+HIaF8mo5/JakER1sfvUd+
	zp3dvIpwcOvijq8id48sjCKOy1ulUYm0gt41AaPs5W1rN/2Sc1y5puo/HUZPS8A+OS4850sk=
X-Received: by 2002:a05:620a:a29b:10b0:93f:1a1a:2974 with SMTP id af79cd13be357-9442173715dmr264142685a.6.1793349388383;
        Fri, 30 Oct 2026 01:36:28 -0700 (PDT)
X-Received: by 2002:a05:620a:a29b:10b0:93f:1a1a:2974 with SMTP id af79cd13be357-9442173715dmr264140085a.6.1793349387893;
        Fri, 30 Oct 2026 01:36:27 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe96185sm38480866b.68.2026.10.30.01.36.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 01:36:26 -0700 (PDT)
Message-ID: <f2aa28e5-abb7-4ce8-932b-6540b38ffc6d@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 09:36:24 +0100
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
Subject: Re: [PATCH 2/6] arm64: dts: qcom: lemans: Mark USB controllers as DMA
 coherent
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
 <20261030-usb-dma-coherent-v1-2-3147b8f7aa64@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-usb-dma-coherent-v1-2-3147b8f7aa64@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3DFADoKJHCsOTmnefS4vdKTd4GMlj8TU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfX8Cz9TOOfNp8w
 hgQuCes4Ixn07NOTZaUYbtj0KjWzSFfYfRsOLIDreyGRu33Q8HU1PdOGVfGZ9p7coICVrj5q2yk
 lwOAJ0/gpa2Kre2LbRiGzxEgvP2Y+Gg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfX5IS+TkSJGOMY
 ANZW75h/liSYS6qAHCAIiX4NrTZtfCKWWcEYo9u32Xd7XHd4z4TVzNLXI/ba/4rsBKwWuzqVLUZ
 pKK25Q52i0sHrngORlo/WyusBFzdmNzxdnnx9oOiYp/b6OyWXoU0yswzjh9s5XdsHhstZk/46ex
 UUwFk8PnzRLW7qYXUQ18hMq4skZxhsnhqcDr7rm794lchBaYW4cffC1yEPP/5vQzA7FfbxTwOH8
 RoZVFf7YjHDCgd80H1J08PjFShW3Clef4noiyigpLxQQbHEmgO6mDn7Ptf6FQEZA+z4KVWmFGho
 GuFR6n9Sbfhq38mHuolJaQH5F8aPKV34YhEkbVOxvmHixX8844nNZ5NyJNm9vQf7ZqsPcl354Gu
 e6vADWxu0znhSgG+uB5capI8+QkfDkx6OiVArTAn/UxftaiOyHgGmwgGDhGf5ssMGVeKIZspKbP
 MSJLyl38jZ1xLwI5e9w==
X-Proofpoint-ORIG-GUID: 3DFADoKJHCsOTmnefS4vdKTd4GMlj8TU
X-Authority-Analysis: v=2.4 cv=TpVzFzXh c=1 sm=1 tr=0 ts=6ae4570d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=B4nYI1lvG5CAbMSH5Y8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300034

On 10/29/26 7:33 PM, Krishna Kurapati wrote:
> All USB controllers on Lemans are DMA coherent. Add property
> indicating the same.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
