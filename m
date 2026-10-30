Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364660;
	b=l66nVkpJcDbnKlBcBCZ8UKznKFkg7FhaNsIWLKqMe95YasYyZ3m+4HvzFErvxhD/RfT4
	 zXEHC+x+QbS04k0bNtJWjX3dzmK0JReI/2fFj4PiP8uO8sZVUl4x9K+gWAE4FgtZyF3uT
	 mfJBa5P3gv1wPXVY4f3tKOYaHT0+QPYrBtAtGjWe2Z1P6N6Y2vRL3WJWFZ4o1sguukqFN
	 bQchmtreZ5LOUDUOZ6mrAZgaRenUJKv7rxU77kJBWXy7s8QutlsIiKWqAXyofFg53h1Il
	 6f/xrhDWWZv6Qm2FAQEdWJr0+ipu+mSE9wpsDmcXZwgc1160ErQXFAPMbQweTrS3lrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364660;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=j7XG2epkt+u4jh/U7Xi9zEB1haXM3mRNOXg327scj8s=;
	b=n6YjE3JS1YsZP7IAsdwZVwTXN2FFhldNuSy7J4rIVMrh6inAdq/02i/Ix1Jvw9gpfN0N
	 bT5dWQz+3fjyMvhjO2YD8gihYhm+7fgZ05WQfAxoY95DGOLbwKuSzXUOcA/QQsM8z613k
	 uyFXvmnff4dMZLwanCuF3+p6Vj/Wrca072LGU1VV9X+3MSQpIvDsGTTSO4JixIsY0z/vn
	 6rqlLYwJC1aPi5i5CzfbDN3GXYs+7s5Ytjhb7rigJO2eklDzfI687x1OF73ntDvy+rhRz
	 Cx2bArhtq2ikd2i3HBJwjHWW003L+1Q/w/LsNz3hDot71AkkvIrEIDZ08mua9P/yIMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Uk1XQeTf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BbjxLpEN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F22E60A2616
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F22E60A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Uk1XQeTf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BbjxLpEN
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBGOhO3130325
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:50:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j7XG2epkt+u4jh/U7Xi9zEB1haXM3mRNOXg327scj8s=; b=Uk1XQeTf5VBuY6rY
	ERww9IO0Xx9JMZCsG+b6ToAoehRvNhRcgWEeSCp3bcY8iTD3J4Sz109t/9GQbYCD
	6pJnsCExKblc4sH7+I3I7dwz5xvpS/qUblktApuIoMV6L0EcI1bskoX1o0pHQXD+
	bubrU36IbjVn7vM9UoNQhwU3jEsr0aKc5a9QXuHl4xcuhuOiJZ8bPgctyCajg3TJ
	I+QAGDNKvIV/XZmy6fwSYbCqabqH0DCgcVJtJddT8SB8y625/GhE9X604Qj9NujJ
	Agjd0K6gDffoD4++126TGBLJLS0LtOj+vKRzMc4I5DPt5LlRWXnoln63MWKdcxt4
	dDh6cg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qk1h5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:50:58 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-988ba2453abso16966241.1
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 05:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793364658; x=1793969458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j7XG2epkt+u4jh/U7Xi9zEB1haXM3mRNOXg327scj8s=;
        b=BbjxLpENK6NROq/blE54+pYHDTX47+cg8DB8Bzkr/qplFdBR0o1EEU2i0oPC0tC8Rs
         +y+ewt/jSODUnda4vjkiROZ65NinpuJpdkEUAHLLJGn+JjKFo12C1l62GqjvK/9CBxdq
         cVwGcK3mFJYCBV9Zmwfqr3N4vdsZ+7Kh6out5vp7I3ysO8yEbff+ec9u52rdiOZKokMS
         HjaUf+hvojfDovycByIeXHHHlQ/FfPZYNCnYPOX4y88SmBhHNU+26GOaZ1MqLANQZXep
         Pk9v6DU4/tbTwFikQqsNGDVNLmdVmge+494sJZqEjEIiRwahFsZckTq2psbr7+mvO3+p
         K38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364658; x=1793969458;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j7XG2epkt+u4jh/U7Xi9zEB1haXM3mRNOXg327scj8s=;
        b=S7QDDZeEBVlsouuEt0P6b2Mwrzqx/84BH+tOsTMK8t1enV7bMPmhbIN9SzWpM75CZ4
         wReE22RnfBSkkwN/zdOL3H9llBSvIshQd3MCNqmi0Q2QkJ+8uDzVhXV24FYStggu6GK1
         r2TecpHVQQjIvdQVezxR89BsmKltaUqP+HAM1rUqDIqCzO6PD63uLuj2u4h7YHXG5bil
         It00Vl30rrlqs3PewpzGSwi469Mc94KdKNYYITa7ZthXW3qLAt0Vzm+JLV0VmvwF+Ued
         QVQtYrcLkm0k7RhgbXVLzeyTPuVOFouUgyivVHNYjXgs/BdUeiIO8475JqBp7VXx5FpH
         u9ag==
X-Forwarded-Encrypted: i=1; AKwUvBy5i9JzPxwqYgXZfQDn54ZM5TMN1ZvX15PEWJ15FoJHX0LXlUVsEr/x9014jrXAZoDHxWrUxmafHNYS@vger.kernel.org
X-Gm-Message-State: AFq9FYLeTD6Rg9YDo13vzPQiI3qq76ZYoNLo6bqTsb8fV+kKXp5TXwuM
	xFRaXAJSo8H5zV4dYlOI+b8gOVWHmcLiSTrP2uFCRvsquLo/lrr6VB2qAnJcjtTj/mubj75Sp3z
	S7W/WY/KSIMVL2mb46IFp6mxy/nu5tcTCeqaSc2XIez7KHJA2xGXrGOFfbzEuiI4b/5YbcNoB
X-Gm-Gg: AYBFou1KA5zf4aedRoDaZTtrtPKoljzCFXjiGeX2gTB3PQaupb3kzLj0BUijm/WdL4n
	hoCdVuJ41TnOThxm+96HyH1ux6uX0kHMwHxqBvrtnYPcMbRvNyDySfreld/CYvZxDzrYHwABsD4
	2KuJc5D2EJrWtuHfB43gK/DVOUhZuN3mP0EXTkllnNNWyCtLUgWRbPUGuH2ZQaiX5LVStY3r8An
	cXin5qEP9GnDaFAnocIVXbPM1yoPUA6xapZhy6/0u4D/wgWsAxLYOk50bhiULb0bBjvJ54yarOV
	hmWiS/Oso1LDx8N3YxEN0wZoAwvSibDhQCZEOg1x4c9IwFyCQ1gyvCtEPphbQb51BtXiQXWzT6X
	M5DJ2Cm44B5WTBh+YwZh57Pe2zYlMHpXdXj8NCXO29nnfaQ6Ndd2gOqd0v0Ypg/RcLuuSbzU=
X-Received: by 2002:a05:6123:420f:20b0:5ea:e196:2742 with SMTP id 71dfb90a1353d-5ec6894e305mr915227e0c.4.1793364658153;
        Fri, 30 Oct 2026 05:50:58 -0700 (PDT)
X-Received: by 2002:a05:6123:420f:20b0:5ea:e196:2742 with SMTP id 71dfb90a1353d-5ec6894e305mr915216e0c.4.1793364657717;
        Fri, 30 Oct 2026 05:50:57 -0700 (PDT)
Received: from [10.169.205.110] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe5006dsm60694766b.64.2026.10.30.05.50.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 05:50:56 -0700 (PDT)
Message-ID: <2f3a14df-4443-4c61-b479-c0402636b737@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 13:50:55 +0100
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
Subject: Re: [PATCH 3/5] arm64: dts: qcom: milos-nothing-asteroids: Enable
 WiFi
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261029-asteroids-dts-updates-v1-0-79351337d681@pm.me>
 <20261029-asteroids-dts-updates-v1-3-79351337d681@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029-asteroids-dts-updates-v1-3-79351337d681@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SCa0k2sXcxC4hW6gu_rw6CdaRZ09czFy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX8XEZY8Uo3Npm
 6pCpPIxMuFhYcp4WHDmTm1epvIGwTzZPO+uKCqxxVp4JYKVbsjtBuGpdVR0GUeNxnsLNIF2F3Rk
 hMFi32qFhldp5hUwpryFAgDZsl8fpDY=
X-Authority-Analysis: v=2.4 cv=DfSCOftW c=1 sm=1 tr=0 ts=6ae492b2 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=FBJPXfl-2ZM4KHcT95oA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: SCa0k2sXcxC4hW6gu_rw6CdaRZ09czFy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX7gygnavJqnAi
 AsPnBiL7CZH2OP2/HVDm+fDP/jMeilO/dP4NInmhJHhvmz+eqd9YuKLk88+pC253b3m0NxfJcCs
 +0YgIsJtlb2dGaG0Yxc2S5UJ15Sy4+3w7QhWPw6WKFjao3FE/VqqB0IUcp92AuPc3m0RqOGrBzI
 jMn7r3EcpXoAKabrHxrtUyVUx096La07143IX8ITmKh2i5os11H0Gn9IfCPFuRiitNZy58p0WAS
 Q44B1J/MslbbOCROzmK4bEq2JIKmrVe/cemVS8k/6nhEs7xYmYQdXApnrEIZwezUny7TJmxn36Y
 w8GqmLk0/redn1DW7owqUoouxRwQYZ7HUP8TFcoLy5RCD7PRVhyoQp9SBFGWlLjX+1JDxao9LlB
 UDtOmNSCrKiBXrNVVa9UJOU7oK1Xg23On6ssepboW5nv67nO6D/nd5qzgFahFYZzm+P/+2N0FS6
 s5yuX8kPARTwSEF1rSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300051

On 10/29/26 11:33 PM, Alexander Koskovich wrote:
> Configure and enable the WiFi node, and add the required pinctrl to
> provide the sleep clock from the PMK8550 (PMK7635) to WCN6755.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
