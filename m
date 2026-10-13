Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586FD39A070
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 08:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791880800; cv=none; b=bgsiAJs0CnDlVUczw9mIXrR4PQrbGUdOiL/cc15Jmny9539XCFxJF9ie43nPdqqNtVdomY/H0sZwV0oxCFIQXI+WeayAMRYyR/+GM2K2vDVOCPtyMK6XV4GAUmB0pzRmeU7jqKD8fcLBoqKzFvGvnwoWuxq/7Ml7/3LAJ2rl4l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791880800; c=relaxed/simple;
	bh=1aL7EQLDdLDEJ89Mg5MD5ZUMkF+ph76lnTDMWKkf4aU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F3xJ/ZzAw/M06FiWUgDJFziWogPLFqQL9DaVpg/m5yxHV1IsD/d3Gv+grJHuQ2leCHkfrEwdS8QenEsw9dXe0WoPw56s0/8vrIjy76AEbdlSVzWOizTxPSFAD+pf0uBUKFoZ83QIvl1qgwXKbmlyn2IkbzIENAjXrwlnyfSxH9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nLkc5y0X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GeFI4344; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nLkc5y0X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GeFI4344"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D6CRTC949361
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 08:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eNL7vgR4kDGeD5fPFGvpl05GH+Y/43WiLVBF8tPpz6M=; b=nLkc5y0XQPFD1mUJ
	sysjhMEBmQzsIDnt88JYqviIa6WrohOk1363fbZxP/QS/1rxks4/NQfmxFh7cEfy
	OUeaERIGqVFR2kukDs0FbS8IP1of8lbUjfO5jd1cBFdZCNTI/4OAniUq1MRoFmTb
	Dm4yCrW8faLWkO0iNXi7c5t5owEFnW8NA7G8ia3wNGz4JD2oYuN5Wgwgt6IC2kkT
	uy7hexJiVGkzPheO/Q3EngoHVLYwrK+jYLhcNbci6dcK+FyA9yANYYBlp1p5NIVD
	6Hv54PW3CZDkoWyjVKjcJcfUSQIaBZDosq98vnI+6ed/pgWGuPZ93oiesKvT9lgC
	Fc0OhA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9f628jud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 08:39:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93dea15d721so27020285a.1
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 01:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791880798; x=1792485598; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eNL7vgR4kDGeD5fPFGvpl05GH+Y/43WiLVBF8tPpz6M=;
        b=GeFI4344q6NfFkdR4Bg3dZzZeQ4VAWCqeeIR10/ORzhMsvakOcstxQ7K6Y5l9xiR05
         8GeJfhD0x7z8Ub5pMo+NlKbi4J+KU2MVytMyNOZNc4CSwy2g2sywudINLzUYlGbpAh78
         LJeH8I+Nsy5vrwsaaq7gdujX/jSvRK4gjpiMERg4Vfn2VYwF3H4LU6DVOk+yq9+yfNAs
         5y6m8d5bkWdmdHsqAJiTUwj2gAk7hB8QcA6a5qxF9lQwJ2Dt/YtfaD95QffnKQznbTRg
         ut64t4E488QtNgce0tPP083I4WNHQJF/6JGTtZv9lZ935tJ2+zZ9l5re47dKIYUjJrWm
         KpSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791880798; x=1792485598;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eNL7vgR4kDGeD5fPFGvpl05GH+Y/43WiLVBF8tPpz6M=;
        b=ncjo+7jDeQ5emlLy7GoX3imcquO5b0phzlZZ4NI8shvKtn+I03riTY9h9K2Jelec67
         z0ivD64HBupkYJHMwvBZQGY/H5hWriEDRTmVnIx9yoWE3IBBVK1US9fG22DwAWrdEGga
         +KfWhMt+Z12QBP9fabMOidYBJhVJB64n6shWvaO2/L7P0r7XwxBKZjaJwyRyeOA7JrIh
         cH6QFQhaZXLJFLYt8lFMGe/WAu4Ri37dS0TU1OfjuJU9SlQDjgOhuLZ2KBLPuBXtoABO
         pY4V7U75ojQ39LHXooYoNWRvdeb2c9XQp3HK/7FPbH03j2/XmoOl4BPUXEqXkZwsEe/v
         SrPg==
X-Forwarded-Encrypted: i=1; AKwUvByaaFna8exZ+zhdndnwr1/3UuDuh1z/uNfbMNrhk8Z+GAFwcZDcmCFpwiH9AJ9MCwBd9noe+dvWvS/k@vger.kernel.org
X-Gm-Message-State: AFq9FYIbDZ2zwUMElf8DS/C9MN8NLpAAudSzUzy3YzICEXefPn1nebn4
	GXUbVfi2yARcvMpRD4IkIhchxUDopUFSyFZfUywI6LqIm4nsJiNFQWUD5BC9dYQyFb51qw9sJdY
	sVPe55pzp7eCXJqIjNUiNxVv0666/jf0Q25xJq5Mw+fDlgzMOWjjr4pUn4qN56H5x
X-Gm-Gg: AYBFou0V0jCHpmA49G1GB22ZgbBOcRavCk3NZ8nygPpJI/uRy1kmQx0grfNRpWfLVcx
	HYEeLP+YrL+I2sMUDmlWsRyKEOHYRIFvnHJvHgcxfH7Hi9mm5ER+jeZUNmK68JnCBOWNYkg4JuQ
	i7SS8uJM4HT0Fv+6k17KaPOMgRkFU7UccOwRmP1zm4xuWz4gT29DnY72WwYv+K9csfgIeGZ9rMz
	749nwompZ7EgUkZfEyBNQdPECMpZF2iRJjHRyFhek030YPpKblz3QytWoeWrxrpAhU/Sxyk1Xgk
	0kCTWjXyXsJYe08DrtqU73v1ZMKilTGu0aMcjNyZWcitNfhAs4Cw2M7QHDJLopm5l9KC58EYJRd
	OFEYMo42faSKFbRLnSHqvGw==
X-Received: by 2002:a05:620a:8084:b0:93e:571e:94f0 with SMTP id af79cd13be357-93ebd1eabeamr2187958385a.3.1791880797408;
        Tue, 13 Oct 2026 01:39:57 -0700 (PDT)
X-Received: by 2002:a05:620a:8084:b0:93e:571e:94f0 with SMTP id af79cd13be357-93ebd1eabeamr2187955985a.3.1791880796886;
        Tue, 13 Oct 2026 01:39:56 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c36fe6dbc61sm51688266b.30.2026.10.13.01.39.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 01:39:56 -0700 (PDT)
Message-ID: <52adff3a-370c-4445-9797-e0b0dde36fab@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 10:39:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: arm: qcom: Document Microsoft Surface
 Laptop 8th Edition
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maximilian Luz
 <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
 <20261006-mahua-surface-laptop-v1-1-406fc042162a@oss.qualcomm.com>
 <245e5eef-e18a-4ec5-b57c-65e561101351@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <245e5eef-e18a-4ec5-b57c-65e561101351@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FOKOVOos c=1 sm=1 tr=0 ts=6acdee5e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=rd0sP4ULdwr9m3flnKMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX941xplmEmHb9
 2BJgodToYQgvxpOAnc6zKNY5OXNQKe7jLPNcWAzHfr63I/QX2+5YV4eyo+c9Hlqr38KRCVtSFhT
 BZip7AjpC11BuT+Kty5/eMUDTGlaFAA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfXxhag2WeT3Dul
 d3gFu6qhyMgFF3OItPS6+gwsRCYTs/mvTfOSg1EGFssSAn8HnOyZU3ZJN+RxGlFAqei7/0R3qFG
 YP5Yz3cVfhr+BfEmxKwdG5fqk9ksvXnpXAEts8V5rCFSfaYTR55+PuNXccm8JEVoOiEFIAoUf3g
 I4tmbodk0KdB8Fhx8hG7DLzGijtpYEq/gf0S6w0ZF4urespX/PYxzxOJD5pax9ojwb93Zj5iRU1
 bYGcpwSIXAKSRim+ZODTdossq1zvWAqUYSJrDbjWcEBpt47OpdsGOamjoYxJL/5t68YdUSYih+S
 hECua/OnZgeXa8vzJnxpBxG8eyn2gcQpdsDlaYX6+NIar/BdU/lFGPyPe+4YVdnwbB2PSQHh4PZ
 gVVMQ8KOskqVboReEecBhbP3fkIkuHA8CEMKg+4MjXbVBoXiX1Pf+qZUVCxQIl1gBVhgXiQiZUy
 godAv5shhBWOOcfT1FA==
X-Proofpoint-GUID: _LRstOXoNEiPCq-z1A4z-M8Fg7-ChN_X
X-Proofpoint-ORIG-GUID: _LRstOXoNEiPCq-z1A4z-M8Fg7-ChN_X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130034

On 10/7/26 9:11 AM, Gopikrishna Garmidi wrote:
> 
> 
> On 10/6/2026 3:20 PM, Gopikrishna Garmidi wrote:
>> Document the Mahua-based Microsoft Surface Laptop 13.8" 8th Edition.
>>
>> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
>> ---

[...]

> Before review, I'd appreciate your input on the naming.
> 
> Surface Laptop 8th Edition comes in three sizes [1]:
> 
>   - 13 inch:   Snapdragon X2 Plus (6-core), UFS storage
>   - 13.8 inch: Snapdragon X2 Plus / X2 Elite (Mahua), NVMe
>   - 15 inch:   Snapdragon X2 Plus / X2 Elite
> 
> This series adds the 13.8 inch model only. I named it
> "microsoft,surface-laptop-8-13in" (mahua-microsoft-surface
> -laptop-8-13in.dts), but that clashes with the real 13 inch model, which is a different board (UFS instead of NVMe) and will need its own DTS.
> 
> I couldn't find a codename for these, so I can't follow the Laptop 7
> scheme (romulus13/15). Could you please suggest the naming you'd prefer
> for the compatible and DTS file name? I'll update it in v2.

I can't find any. The LLM suggests the 13.8/15 in codename starts
with "ROT" based on the INFs.

Konrad
