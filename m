Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349437;
	b=KwqDZbxyqqDAptlORMc9x3IalcWfP2aUTZSN19CcRD29yhznb6rPEnOv6YbcQZ9WlFMp
	 3Fx1Lm5NevwDoq38595HsYzqzpqYPbz3hAHc8Nua3tOvBllLk6t1dtTlAkW0XqVvqKrik
	 /0SLvAxFRED++pIVT+pvTuVBO5hVuVwS2z9J3QorWPwuOBI+FTuJ9krfNxkwKoTv0Qyyo
	 5W25sLKkrKSkkiFh4XSs6goTTxxRImrEMPJZWd1MseuYPKHa4CPmj3x3YKeiuYCRK4nAB
	 XxqqzMDZnIzRZg+CXKYKTjlU9jEmMJyKe7SzJ/7uIoVU7xaTW4EcjRinFqY/zViQVjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349437;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=s8Ivp+bT7DEkicAhEn64MXcraB26IrrC5i5zD1lewD4=;
	b=tiSnLYSEO0aa6ns0XPMRnyfV/iDXjx9GDXhf7Bx+rCJFD9wGXmvUQQJ/ro2xlL2J8ylR
	 Bv3j3pSg7cHTra8rr/ZpfVcZqMrHqEQn12q9NgXGcKfqaFKq0Tb2wzhtLVY4AWUzlgtII
	 5J2LktMm+svK4g2XOd64umWlkyUYlqQwKAyYhLKbzPGZ98viA41OVVqbn7m0yIzDOYUEJ
	 ue4lHkwcjn1oCoIs5KqmWNdg/sXlTWxyQiLSCuqLtHNSODRRBHbhPM1kL7XWkXXmM/Jb4
	 UNTbyF7te2PPOQXF70xonWNWlKnfKEzxY+lAvLkQjzeupXt4+0PG9EyEG9uOtoKMesQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R6su5Xpz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GPzaiJs0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22FB606A321
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 08:37:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F22FB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R6su5Xpz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GPzaiJs0
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8FIJZ2733203
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 08:37:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s8Ivp+bT7DEkicAhEn64MXcraB26IrrC5i5zD1lewD4=; b=R6su5XpzpAGgyn9A
	0pXcsmChGNRgVaJSNhOyqG71lOUgobdh5lJyBWcKkYSUCEF/KsBqv+IUZXDdhkoo
	VpsCC9k88tNIfZ0FSB5ae9ox9Mn4+9LkD9898r15+6EHtQXgzr3QeUmWMgvnIuYw
	mCqb5QOBNlBf5i1JItnzro26L+5Bd35cu+1pdVjoLnuTyNmfCsKL5eS5y2+b8YrK
	uHrvMZ97jCjncvk0koZUM5ZIBkJYlyCsRy8erTshhYXpqGGkUxbtQtEN7B1gg8uz
	CgXRMZxxRoV6WgdfnVdalqPx34HHCX+9ou1uqUM3/yMMs0zMmnqr9VsYUcytjbuX
	ac4hMg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qj15v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 08:37:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f3960dca5so3815085a.0
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 01:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793349435; x=1793954235; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s8Ivp+bT7DEkicAhEn64MXcraB26IrrC5i5zD1lewD4=;
        b=GPzaiJs0o91i9mfa9N0ZOhDQDKiCmuvHsnVjf8PbTVu8tJu8Wq21//15Csce90ldjn
         +9siYOI5UMIz/6uSt67n3v0TUSjdUYD3ciBuiXTSSGLuXAwvDP7sza8r7tldUbDU7Ow3
         NIGvWiBGAgdV1+Jb0vRfwJQQGEkKrNkPXgXXcU6ulOiQyrAP4zsxR5KLR1tnZDb8DMpy
         Omwg+pJ2MC3XFBNkXk0ZoP2P3Y0C8X9Qt7AFwe3Fg2Z7GkdRiDAsRCWvQX/am1coYHGn
         3RPqqjC7+IQvDFF76nUN4VB8Bkvv74TyJ8c4s2YfV3IhXK+UYY5qrpSw0DnQVn49Oejj
         w6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793349435; x=1793954235;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s8Ivp+bT7DEkicAhEn64MXcraB26IrrC5i5zD1lewD4=;
        b=N6mZ7bZmvtLT0CL9+cma1tT8yZ9iOBmaZEKw8c+luJr4FU5z0m/U2LjatqV4Vqat4r
         WlUgVK0pwuAwBc7fwU5Ccr+YIbqzFO8jiHl8Zpp+GYJiBXVfzzxa7km6oYRTNbkXiCNg
         qdy9VxHu1S78LEPmEmRBfFcll0hvSfkZVlmvW86ICzLM0cp78lsgATiVMJxc335E7zkY
         6jJqxL7ajnjYyh8FbIbr53u3dub1X1GEL42K5zbY35kL7QgiPuhb6V2ezIVpcIgMs+X8
         Mae9rxXivga/YHy/LrIISNydlBnZnKtHI96slyexCr+gUqBxmqf8Xwaun6HS+J8o84GV
         paKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxV24HtwgMyeHn6XrQD7IMR3NVGi/6tGP9/FgvI9zPUkBqt+2PsKRQq6BBrP2eYKtIpb2T28oOmbMCV@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9/iAbomr7NsnDmuzB62SivaMntwLDc8iP7/FCPxSZCS3xawtH
	7Zyvxlk+GcYtkCkjgMpcyKqZBLRN9/006Fxij/XXPPsijgpNrJ4dSXXLmew75JTLxx2iLFHKG9W
	9LesJph4lhYHzu7DB6IrikZcfPtP9jWB9dkkWz8OIRbHqx8vT3jgWLLGlKogqVMu8
X-Gm-Gg: AYBFou3qFiaF68wWt5XwuMX0gvORaJ38sUrST9ZWKuXbptYi2QiBdKdsnC7853OU7Mr
	ihWF4ycbfKjkRUYSW5t3iyscUVc4UAbPuQYGJbIjv1nsQ5ZxbJKQnOE0b+d5NX11+twcKU1I33N
	Nd4Wecmhm/AfnEaQDgNFXa0Gj9a4TyTTTqT+ZWmwuNlWdH7KDKOWPStJDiDxAOggAXbCEzFCbBH
	0p8Pn6xKUaglEq9O100KYnHnEVBs4E/gxN1fpjYsbbUugbX/r4jh+FvJjhWdXeh3KCD1kToEzOi
	RUbAJkbsQAGyohEAEx0tzgzr1/2UU9fKX6NN7LLWsPQND654DaGay9C77HjIEc7ooamUgr57LNs
	8tn6MYBs1oBL/2VunwI6uJCBr+/awEgOi0aYGsmFPJFfXRNU3l0I73XCKXb5GnJuFw3jecdM=
X-Received: by 2002:a05:620a:a29b:10b0:93f:1a1a:2974 with SMTP id af79cd13be357-9442173715dmr264364585a.6.1793349435440;
        Fri, 30 Oct 2026 01:37:15 -0700 (PDT)
X-Received: by 2002:a05:620a:a29b:10b0:93f:1a1a:2974 with SMTP id af79cd13be357-9442173715dmr264361285a.6.1793349434941;
        Fri, 30 Oct 2026 01:37:14 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfdc7bsm40134566b.21.2026.10.30.01.37.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 01:37:14 -0700 (PDT)
Message-ID: <987b21ce-cab5-4058-9668-94afb1210a87@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 09:37:12 +0100
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
Subject: Re: [PATCH 1/6] arm64: dts: qcom: sdx75: Mark USB controller as DMA
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
 <20261030-usb-dma-coherent-v1-1-3147b8f7aa64@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-usb-dma-coherent-v1-1-3147b8f7aa64@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ShgO_b5i3yWy-8Avmg2qHvBc-c6GJmSh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfX6UUzgeitMu8Q
 2OFoVMrwmgiSi9XIr8vJqeNc/QpOiGT9uvnhDSdK6yomuqwn7Tj6m3gnB8ZmRBrYvBtarG5yp6e
 hJOtaO40okVIFKjgdK7g3GIuibLl1LE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfXzkFslxixntWA
 ngKzGmdMHvmrFNSdQuEa9DoObF75cYQLihj3+Ejdwasyaqf1oWASy31ue8uBHTF4luG9Ydzs3wp
 FN6DBU1cshx+XNZzurm2jLgN1anpgUgAN3wgeJ8TUlclg4CSfvjzqxCYdCP+8pCG6IuYGwSxBtJ
 13wbfPgqr2fA8WXuCS8TVVfqzQVTdNb74qiZVTi37rne7n04BFfOqahYI1mt0q7Kn8R9QnRB0cR
 lShSwu6xMF9arDzRulcT7Acs0OiPIJoZ7appu9Sg6sz8nAtqxDARgS/3QWbubqqoDSDLGZ91bHw
 krlLg/0FaEIne1RtQ0cKy7iMBaohteku2vo0jcYUqpIoL7p0jRV4MLzCbi9Ccp7n98oPzl2Zu29
 YqeouyfXIDHWSJIaN0NmmgscOjZNOAntACld5wEztCiWZn7jYgxpB7ANzY33BzHVvKPtcrQIwrU
 RdsgX+D1JZ9IsfJA0nQ==
X-Proofpoint-ORIG-GUID: ShgO_b5i3yWy-8Avmg2qHvBc-c6GJmSh
X-Authority-Analysis: v=2.4 cv=TpVzFzXh c=1 sm=1 tr=0 ts=6ae4573c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=7li549WNwbtQ9Hvr_rEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300034

On 10/29/26 7:33 PM, Krishna Kurapati wrote:
> The USB controller on SDX75 is DMA coherent. Add property
> indicating the same.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
