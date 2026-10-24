Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792873455;
	b=y8yhnfHNdMdUrU2EOWnHG4KZNXhG6+ga5KY0PVBbGbD5+HRJqb6qgx9A0SPft930Spi+
	 Pu/z/5ZRD1lmfMagYQJ7QPt8Ab97BNkfo40tQfU0xF4KBbKE8LLh/AH9vZWf4UBsILi+o
	 UhZTVv9KtXIXiCzGqYj6+5gdgj4eaS2GgmaN+qz//DSVTgg8YOEj4pbsFS8sClm6eItTF
	 YF4H0f2bsFseKHvRbgNnbP/EFMCdzINvmH3dxg8chNau1I61nqO7UKZEpOyJt13RA0Kkg
	 tyg0Upn2C5oKAIJTcYZEJVwHuDbtCu1pfQeOHq3gQtDBlnWb/W7D2EUINKL2sa4YIGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792873455;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OSWoeKkSl8LV8SI4xnbQdI97ATBMcNBTzfvGNoiDQeE=;
	b=A+VDCbrf0nbMeklNbIHjWdOGzFogH5rJyw5Nv2fJu9jzp2U0B9O0YxXcgHLAErlzQtGd
	 J5N+e/Z9B94D6iQWrV9GvsqZX6e5uEt3m5NRP9fxh6RNGaDnLfAP2LjhQWoQGtu5P+Pzn
	 s8s+EofeNBlbhmG21kCJQRYpSgeRBFWTpkR32dHaEXTGqjsigKIDU7u8scv/RMOfqS3SD
	 Q39bV/x56WcQ04S5pqAwqG6S5CEym0uZIoWoTA3f5lInXqGAC6eOvHcxlGHKJkVlTXWs/
	 fVYo8pHUp6z88zLtDIIwDDmpq/DW/I5Bbjy6R90LbjRfUJX2+cyOk4mjJuk/+4egRHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nSFLzhfB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AWmCLqyE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB81D606A31D
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 20:24:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB81D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nSFLzhfB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AWmCLqyE
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69OIUErl3376420
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 20:24:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OSWoeKkSl8LV8SI4xnbQdI97
	ATBMcNBTzfvGNoiDQeE=; b=nSFLzhfBkwVROVya8rQbcprcd/wwmxZH2IEH+0NC
	/EGySx2O54lH4yS+3MCMM7e4Bf2L7/0LXM0rUPVBbH2GsT+B3yJveCFKOw88DPCQ
	R0aX83tHrbINfjf1ResSTTQ2ZgYVuBRaUwdaJ3hVgZRKSSCS7e+GPfJSKqL8LvAO
	5wTNZ9iZRUUgVVn4mQ7nUFGZV14sz2dpgpS4a/tM7RIGPBZ3nipMGdfjN0sQVWcS
	WBMvptXJcUBu00iPf2NFwDREQk4gK4na3cgZBysIZ5B3pb23YVDWF6YAbyv0MHTZ
	CQaO6xck6xKKJrA49A45ywGiUhF2ryMtB1ZFi2vDekBDlA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkms9uxf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 20:24:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ce7a85f04so397054685a.0
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 13:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792873453; x=1793478253; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OSWoeKkSl8LV8SI4xnbQdI97ATBMcNBTzfvGNoiDQeE=;
        b=AWmCLqyEwBm/meuHJkBuuEbfmtULihA4NR1YSFB4Au+T7j7I9IZgonW6E+0tWY3eVk
         C9+77cMndtfPcggxTJWefEKpPSPJiA3EMqqK2H3MyF7z9P/9unPckabc9HU5c/aFV8hK
         XV6kYwp6QVEyU0VCs/JTAEmywJZQRy6pYbo/sI889pTdDX5V2zo9ZtXS/zgXXUXMsW7+
         ExKI2HyM14OlvsPZ+M6D6cmD6jODdFD+Ckxg3M4KBYX7GXTQzxpK+InKF221GYTExpT3
         u3Q0xAvyfG9TMtvKboipM9Omq/1DDC1akzU7T67DJ9WQu8XpG3tHuGIhR+CJRA8J1/2k
         mUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792873453; x=1793478253;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OSWoeKkSl8LV8SI4xnbQdI97ATBMcNBTzfvGNoiDQeE=;
        b=C+sGhgLwUjxhRN52aL2jQe5QSg6a4OOb5d/j/tEcEWTyVbkyTs8GfORuJK09JnOtyt
         8e++ox1HB6U4eUTdzae9jDz92mgeWlPSVW9OmI8ih2WC0HDKpRcy/Nb/UcwBS+F4VGyS
         Qp5LrPpDG2TFu6uBZcvTwAn3FmcrriY72WY5qZ+R+gus8AlfbSyYVkkrmgSMYziUrLjO
         sHTJtTtE7VeNobwsU3xpnedDn1iJwxUeqMwyADzy0iF6X282neTTYpO97Qx4m1B4G9GZ
         4aSSnYDzwc2OSzN09ycdKLdLSyedFSZp9ecc1bVxCmRphBtCojLY1LBf5cCc1MS3iSIX
         y9GA==
X-Forwarded-Encrypted: i=1; AKwUvBz4p01Q8hk0R8B+iMAiCkLabBB2P2q25ZHAerROyRnB+/2bCPgby6MtjtFRSOekqy2mJ8MPb4MYEJAs@vger.kernel.org
X-Gm-Message-State: AFq9FYI16zq/IezHA0rs9KQUR10hDYZybvLdh2/KnRKZHJJdj7kEMB/Y
	PEu5p38NBmQWmxFx/wAnosjt/qJ6cOWkLURbOLPgzvYwCfXaa46SVmGJ2jAr6G8q/7KQ7zVyHBp
	T/r4uewN7AoNX2peF0NMvfOnkPDvg9xhxFhDl9/9XmbHQEag/rO4dzL4mRLWK6pBD
X-Gm-Gg: AYBFou3EllxS914QUZTHG7HJsbpJp/MDt+syqRceqyymUepwEjvNhflbYpTvXBsfyak
	vCQ4C9llGfCvPOH+zGA75AZSqscWEwvrHTdSfB0toUBelA+F58XrIhH3R/3BqRfJI0O7OQgLC74
	1+0mU8pmWD9GbmJNuRHGEcDL78CpzCOKalS7VqltILsOHTftRTnuYGg3/gkz92O3nO7AA/9YXrr
	ARZA83w8owx2tWqns7PtFX6eJ79mzJpjXZP8BiLwDgtIdY+49y0A6NV5+ed8MwaxTQMqvmZD0K0
	la0RFDDONCwFG7D+x5s6t/lpz50rp1pkkH92i0lPWtWiTlCSMo3HVZq37sSqTaRUk3pATn2ia09
	dcOgkI2sDx8Oz06u+
X-Received: by 2002:a05:620a:4152:b0:93b:d7a0:d9e6 with SMTP id af79cd13be357-940ef98b7d3mr417512785a.64.1792873453048;
        Sat, 24 Oct 2026 13:24:13 -0700 (PDT)
X-Received: by 2002:a05:620a:4152:b0:93b:d7a0:d9e6 with SMTP id af79cd13be357-940ef98b7d3mr417509085a.64.1792873452350;
        Sat, 24 Oct 2026 13:24:12 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2d6f6fsm73364725e9.12.2026.10.24.13.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:24:11 -0700 (PDT)
Date: Sat, 24 Oct 2026 23:24:10 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: qcom: sm8450-hdk: add DisplayPort audio
 playback support
Message-ID: <x4vqbuds2nl4apdi533rqkx4jbtb42f3gtdog5fqvilqx62x5g@lhud5o6ayymw>
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
 <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-1-8a189c71938c@linaro.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-1-8a189c71938c@linaro.org>
X-Proofpoint-ORIG-GUID: b7zN5FqXq9GFUvs_9JE8gGDxKIuMPcdS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA4MSBTYWx0ZWRfX2RhnwBNpdhDK
 kpMqmJw1Tb6v+V4ggr+UBPgiUa3LowLpf5stUotR0Zr6jTcrLo2fi19BOTgqI//KOWwaqSl0dC7
 OcPFJBzpImrbcI/XrvMNUMTycG7QqAO8XrLZHsf4hUacvsXPzrlIuON5BC3vj2HD8FtK1aZDkbr
 gTH9sObjPtDdyVQEy5SIbQJGqYNTCr5WICXhKG0ZFl6Uj5K3c1kVpEiD4oFxLndfNxIcBdRiDLX
 vQ0zmcHTJRW9BdQ84ue6AgFYmXZtsJUPLYAb1Sh5SLe/xC5vX44YyWypJ16twPBmJduj5JTFCgW
 h6Zt+Xib9ceA23Rsm1AONPAAJPcbzVVgV2o+/5dMrziMFPKLnNxFgumT6uNU6MS/diRVnTtjMv9
 7MwZd/eHFIyHzY2c5mFpqxEzJ34b+IUfaSzqlqgDXJTzKAmPhTXu1Mp7Xtgr7XlcrZMD4/bnJVP
 1WFsTDzcPRVUnZBw93g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA4MSBTYWx0ZWRfX9GlD3GH9Wnpz
 0wC9IIoCsYZ7OKRDpS3GaqEwhaHGM9eFr9tiSI13K8mC81xm5h9+30nxv6W26jhpaaOxqQap0cM
 N2ueNB3ZTN0p9k1ll0yNcJRMmrvFUqc=
X-Authority-Analysis: v=2.4 cv=UqX2pOwB c=1 sm=1 tr=0 ts=6add13ee cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=lwKPvcPLtPgdvEeQYCQA:9 a=CjuIK1q_8ugA:10
 a=3Q3lADbaBCgA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: b7zN5FqXq9GFUvs_9JE8gGDxKIuMPcdS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610240081

On 26-10-22 11:36:21, Neil Armstrong wrote:
> Add the DAI link needed to enable audio playback over the
> DisplayPort altmode output.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
