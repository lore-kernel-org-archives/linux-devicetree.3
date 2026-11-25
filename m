Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604246;
	b=2LS2UZRuGkK26Ew/5NfJgxCJcdLQhSyTrg2F28GeLDUfQ7Ed1QKTFDaWXqoU48X+dxGc
	 S5wepqWWxOcYxad5Yt8J9JDpaDITU7JAX0nQfrhgXkGryFBGm90jiN8VpPkW+o1k+lutq
	 ATl4ZDZ50JSIOE6oWyL6vepEVOjOWmOs79NyS4Ms36iixfmFvpvfNeFObx5rr4cLnrHSl
	 MN4Ey6i3F74AiWGHe6Q2vshrcmkdCpnc5wtH04zxnC7nhzJOiZiwYcSzV3z6H1PK7woKr
	 VqCQ2bO4Ff9agkyQbO0ioNzpq4kDo4HvSdBoX9bT+MFC66oRgSJL/0ox465Fhz9BgEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604246;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6DzF8BpUesnkTDGC3vGLBqxidELpfvE698aw+tvKd3E=;
	b=RRA3sN3rlINDFj3RP2e5nU0G0xin3GyoFkqEiwF/xBfYv5RplEoSGS1MLUgysV+3Gmdr
	 CDtn20O0nKXDFTAP1eHir+yu8PpwZceXL8ydZdAy4tNJslDr5Gx7Q+b9D7yFi4GUKRMjS
	 Da/qzG3kevI5OOWBwORpdS7mLinB/T+40V9v5YgwoJA+f69+4e8kIVOvt4SC+6LVyq0zl
	 LCAPq7GdkjYEx22dZ2eInDhNQAUTcRJNH3ab5u5VpdObujWLHx/SKSVyjAB7gKWreMgPF
	 q8AFMotZtNEcvYDpkxRD/JZHCU2Z2KZEUddvuWwQUXgtE57M271zZZtMkLxe2h3Tjcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="U3/9eESd";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ifzydRbO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB36F606A327
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:57:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB36F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U3/9eESd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ifzydRbO
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mO6G2356539
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6DzF8BpUesnkTDGC3vGLBqxidELpfvE698aw+tvKd3E=; b=U3/9eESd1EiDqFmu
	Htw1EFqHz3dcSU9MlAw8eNl/xqnRwlg5yGQO7QZqbYbMyHec6YzyV7vP/Hrlgeei
	+/sU16/4ewe+HKVwdjWstxny5JbHnUFzBB8AyDuTkOc0U9IRp/JLtGDTgMoTAZPF
	aCXY2hB4Y00wSQUq3e68zW5ttLtniHmj+5DXXZ5/qAOyoOkkPEJE/aogmnHWiEsh
	WL+hWwredsAC5CWuSEJUjhRwLKSyT7ocd+5kPLBzwhJcc7lk2nS5k4xPw6Quqkjg
	+u9f1HocgqWDKM2eLceENQrpwn8TaSR4VNuJLOnYNOHvUIUX37aY4wtUViZyg3yU
	VkCCDQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5nu6a5s4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:57:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94993a54a73so51033085a.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 02:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795604244; x=1796209044; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6DzF8BpUesnkTDGC3vGLBqxidELpfvE698aw+tvKd3E=;
        b=ifzydRbOJO0fEF184DfHUFE9gWc3Bq6FoZCg5CoUDP2SYj6vpn9cBB1m40xy5sDfUZ
         3/g9CvAcOzafwpaZzptJfAgS7o9vyDme1areiettQOc1jfb1/BangZ0LdtZCmE6ahGXL
         IToFNN/2h+yVq25EHBSPY7riBA0XeSyPCMKEwO3biSKcTb9Tp9QFAJwHsQfGIPAgYYOx
         lAnvpyJKZ6VtGX2L6JXkoeL9JJ3qYwEtI2WCOwXjl51R6SSSU2mxJcGSE0HCqNkZWA5t
         pAxmxOJlo1RIammECTLNKwSOjy+5lsw2fmeCoZvfqEgel8wPqbBFYchiVNkL1VKvMWaT
         3g7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604244; x=1796209044;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6DzF8BpUesnkTDGC3vGLBqxidELpfvE698aw+tvKd3E=;
        b=eRN83Mzi9RL9tDClHubb6GEaoFsnZOn8m4i7pPQrfDepmOafKbi1MLkmYQj7Z4rG7V
         1xGl4B5/msanPo8ME0DwAzqyNtW2fKfCM0zG/xlPpDlYl/1ZClW+WgJM+hKm61A5AzW0
         zbis8vlEEPKzshlOac6NFLS9wTDRGB/5fMUktv9aJRIPgdMdsbd1dfvoDcd/bjPjragg
         fax4Nv0SSdfHpp8CogLLUQMbJomP1qtPKqsAnpNdkOmxoEVGeS3XfXUQYyX7Ef8pTkqJ
         Y29f3Ptday/KFiSG8qkfpysom+9JQ1waZHoE3h/lNZFs0aNQJopxhdUAdlFJPSP1+HHQ
         W7Ww==
X-Forwarded-Encrypted: i=1; AL+hErEvEDY+qAVDFdZVHC4xWMvfziYzHntT16TOTLik011OL12aZQMozrYiRu5uZSTifZjJJv2UvIjyDta3@vger.kernel.org
X-Gm-Message-State: APuU4Z9LeD/UNqseBbE1/1wvxI4NNO/bFODQA+N9XrN72iU7OB88XnZr
	1WZxmlU9gi9y1P5RWU5pgVl45dg/xoNVb6IH1CYnGeKF2FSDUORA/IG+w8+3XL20TAE+UNkdOvr
	ae+4j2Sbd7wDpRE7crFK1WzzkTAdjPvc9Nr74Q4e5zjTSxmZh4OCoEGHjPNVSy7RE
X-Gm-Gg: AZFdTZfayLwSnzdMm/mdcLU1HLztxwi4DbnpNTdpOu5PZgh9ab77lPebuwif95tMK5u
	z0kgDNFfA/ArJcxWuEDDybBfupofivpldUJf3MgN1huy6f0xMDqB2hEo3B7kJ0xdy1QfEtKyoS4
	1MXRX39v1mBH2iWnro6DFi0bWejcKASkLS0JEFC386pktAjimvsFJCmccLS5l9CnEdKk+x5jAKG
	CD5cfnhDvvRG5hX+IQ0GjUt3H7TEdss+L6H1NX96qvG43VYmIFwbYhMh4FT0tqrlV+mVR7WArdi
	9P6U5IdF/cuq0Y3dRe6XzXSFwl6vMG4VPVfI6TOJoWKvPbb3sPPn9yrLnuot+cj0TNZ670OE3wV
	UrKptpR+a9FnFHJKI+ZMz+39qBRAg5Fuxbqi0i1KGXROHv05f6chZF2zfFIy0NNwuXHY8vXQ=
X-Received: by 2002:a05:620a:5399:10b0:949:6fa5:1edf with SMTP id af79cd13be357-949ba7f2491mr2901804085a.1.1795604243974;
        Wed, 25 Nov 2026 02:57:23 -0800 (PST)
X-Received: by 2002:a05:620a:5399:10b0:949:6fa5:1edf with SMTP id af79cd13be357-949ba7f2491mr2901802585a.1.1795604243589;
        Wed, 25 Nov 2026 02:57:23 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba37108c8esm8206482a12.31.2026.11.25.02.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:57:22 -0800 (PST)
Message-ID: <e70f9afb-339a-429d-a569-fc9c452b1cdf@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:57:20 +0100
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
Subject: Re: [PATCH 1/4] firmware: qcom: scm: Add QSEE app start, shutdown and
 services image load
To: armandas.kvietkus@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org
References: <20261124-fpc1540-tee-v1-0-6c6985f05b06@proton.me>
 <20261124-fpc1540-tee-v1-1-6c6985f05b06@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261124-fpc1540-tee-v1-1-6c6985f05b06@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XdZtzz0scQdwI0T3qu_57X0nV9SWo_-q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MyBTYWx0ZWRfX8uCzXMchInVh
 zOnBNo4G0CIKEm6nfH/9g//PnWeG/0UyXU5YwnD3TSRSVD9wnGbnZcMgHFhmiHz58ekqYfIfyB2
 dNUU4GI9tzS/3NcI3jph3LkgVyouyWg=
X-Proofpoint-GUID: XdZtzz0scQdwI0T3qu_57X0nV9SWo_-q
X-Authority-Analysis: v=2.4 cv=Vra2kO2n c=1 sm=1 tr=0 ts=6b06bf14 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=br21HGidAAAA:8 a=6imIkYERwPMp48qjzFQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=rq5_1Q1BYlbxkLLkNd_B:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MyBTYWx0ZWRfX5HzlSQzdfw5e
 JcMrKb0Kv0fYn4/jDWgp1IaoeW5T/OgUw+lyu+5TZibimgUnRmLAgJSYMoQRwhwkP7nAUvIgKeb
 w37gGdMbg+zBpUJyJQEaXfa7Zht+pfrGAfxN0P4GNcBSBnhFPgCZRkAn3IkphHVPYQElckCjbpO
 pE0ESdbJyL7jdx+1+qCXmXRRbKMfmgFFK1Eouhu/lTimXLwXSUabrcxrOfwmT75B8r/6XKl1/Tg
 9WuuB6NxW0q0FYHpk9hapajxy3g8U+SoslzeragBx8yIbXsg5RTxcDqRy2gxJ44fTL8EBs1GOKO
 YIxIaJmyfoRPPaYt/7227tPGsrDUuU82JA40Nnd/p4R7bRsP9H91YpNpNCUqnl15PHdWcVRj5IM
 mE/ecciFOMINmLHqVcFQqY8mXGV/9wAZBw7jf15/lPmn0A0brxFhOQGiwLQ/I+pdEZbpvYTi1AR
 8gF+zfVof509VL+0vaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250043

On 11/24/26 6:43 PM, Armandas Kvietkus via B4 Relay wrote:
> From: Armandas Kvietkus <armandas.kvietkus@proton.me>
> 
> qseecom can only talk to apps that are already running in QSEE. Add
> the app manager calls to start an app from an image, shut it down and
> load a services image such as cmnlib64.
> 
> Signed-off-by: Armandas Kvietkus <armandas.kvietkus@proton.me>
> ---

I see there's a lot of interest here. Please coordinate with the
other efforts from Dawid:

https://lore.kernel.org/linux-arm-msm/6b1853f3-4315-49cb-9b7e-83f967720a2f@dawidwrobel.com/

Konrad

