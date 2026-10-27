Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102513;
	b=e/mLviul5KPfLrabIpImzLL0Vln0qr7ybMh+25W1Fden4pY/DwLoETEcgNGJPoItk4uR
	 pPBlSaXaR9CbmJSAtSb81eEybkScREa+UxwsbFEbJafCPon4Ap3BteNzeZnFw5TMJu95+
	 mS+i8ANPz32iniFz15XexGtiKzug2FF2ikcVutO/dj8jlETC2OiUe6neni/ghkv9PmMDG
	 lzOOv4a+g9lmsTimZRK2wcRXC5suj0F4qJyvKSoRgGRVvTDk3O5Dqhvi8GsMbDmxLCOwn
	 Qn4dEfFI72Q/3ZNsTBccRBwRk5MU1rqTFD8tEHdzbj9reg0S7W1C9Iyx2GeHXQJ4oug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102513;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IBwMcjhkH/5qWAjY7BlvDB/LeARpzZamJYtBa1MZy4Q=;
	b=nJOW6MjK7zHxZDFNjByRxG3LP7OQ+h9t7Hwg0N/OA8UxklX/peGqP+Z7/2uVd6kqvS6/
	 ZkmZtXMQStSRCcvH5BKSVyK8mtRkasR4JR/mewqpS0uyd3NXuGdVvwo7qBxda2S3MJKE/
	 8XbyfBcH73IWo/t0wSWI97zSf8lN++xdJYYvg1DpISZKaBxd9CQ18nig+Ne/u0y9oKwdE
	 9VSnp0dACDme8Ox7hU2taPEvM/ETceS9+++fi29JE7gYtdv+u1auvGtSbng8t68PcFSKW
	 pCQ30mMKRx2tu5Yr0VAo2GSsoXj1JkqYSUf9WQPx0hOB0j4aqGFBfu0Isyrgapvu5ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fuCwDgS3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="dVUA9O/i";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC7760A5BE6
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:01:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AC7760A5BE6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fuCwDgS3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dVUA9O/i
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe7DY432891
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:01:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IBwMcjhkH/5qWAjY7BlvDB/LeARpzZamJYtBa1MZy4Q=; b=fuCwDgS3MX4ohcug
	9wXn6nsWRS1Qh/HY5RtkDsdEQ7ZuXeQwR7MTEIEEkyuNqil2HNhFRsPCgd6gNP1E
	t79WD/wYrG4XP/cQpbi6IZ2wxrOSOauxfFdYWuELFNSpeMC2iwkCaJLM/piq+ogJ
	lRLH2kr84Hb73IFgB5J+ih6X10c3xU/Q6AwZzMmDdWXROcVe/OSuxCPWQbdpzRAA
	dwf2wlK//8cx8mDjYeVJvO0SpxBPG9k8Fp7HUr2HDuFn8vjiQrtpZ82qoStNsQWu
	pLL8IzXV7guE/B4e97dcDgEc98/T0gGz5O8TnK24Td+e2ozHuGvswILC9p2mq2Q7
	f3ntzQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54knm1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:01:51 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7c2b7a15cedso203809137.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 05:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793102511; x=1793707311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IBwMcjhkH/5qWAjY7BlvDB/LeARpzZamJYtBa1MZy4Q=;
        b=dVUA9O/iOB1WXY7qibUkLc0BXGuALjQiOUYlrQjJ7k4Rha0Ur32tT9hQlVbbDBT8SC
         0nKDRrsuxB9XYxUNSOOXIthprCusGvEq0S+MKotdBMIS8dYtzN5f6q5IPQ6oByoJJ/pX
         dvhSwHSp3TWdBSGVWTi2b+lMMttQEVb38ilx+1aH/UFW07a1vA+M0u5nIQcOvWUKrhI5
         SUi+fe0xUmE1pIBdUfRHfbFk17mojnsxxTnTcz7CZToTFYyRhmP2taAJqpUfL0rybXD6
         Ck1iVNXl/Y/NEZhZHHLscqd98DuRQzLpZRD2fGJe59toOFQDm6epQ41nIKATUd+7rqeh
         mjNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102511; x=1793707311;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IBwMcjhkH/5qWAjY7BlvDB/LeARpzZamJYtBa1MZy4Q=;
        b=ZParep8eWaYV57t6d7Yu6lDWWsnNAMlXRhMf9sQm1k9WZhMkq27JbeyFBAunonj02g
         WgMn+GyKfKgDsxEREPKKCkR+uZTPuy3AU6EWQ5fKLKcMKxubqVyRmmRk48XM2HrBSxn5
         RQirxNVuBsmOKWiBpmgxyrSnqk5ArlWKz17vcIhUdEd1ow+0ddb/emMAKDNV8hXnantI
         Ij663v5eXMh8VRlPPOTvbEb5fCm2w55FX/XPrJTTvLI01yBdNfEXM+zlNrkMg3T76dy/
         BlM1P6ZdyMPel9CDNpG/gzHdd7cAd+hUQA9jY2mGWhzoiWubitZ9ZmD/oH+G852yjiV3
         XIwg==
X-Forwarded-Encrypted: i=1; AKwUvByi48e7aX4WRoKdhycVWtwf9AA5Y45v5SmZrvkvFBuzYL7nfXgK8VDTd7G1fNVOKC/k6/0Fbkuau/Uu@vger.kernel.org
X-Gm-Message-State: AFq9FYKgGcdALgVgbhYzRsb/CClMCWZl6qx8GdOMOKxFuyypU8B4vzDu
	6vSIObeANnzMXovg2f/IXVa1zUhbZpt9Ljz0Twy/T04bOvlFDMg7EkRu2Th5fo6uxorABxAfsOu
	Cw6abmLUDXSorXFQFB7VzetSqfNFtP6giVgdiSzmqgWfZF1ehPoVeShYXPoT3w9oH
X-Gm-Gg: AYBFou3E7aiFoeQXJudo9xkZdfmEIhTr9X7iSr/4aNQ6FDfBCbaGNhuDZRbqxYNXfBm
	hqr4e3A9ShxgxLoYnwlyY0rtHLPAFI+b4Ck3lW2anRz8zXcwMy/abysi+yCz8XHboyp4JC7ctWe
	7EZeU8/b+MVwee30Yfw40/f9HLeLMwsGh5OXctGzd/ey6urjC9T2l5U+44xCROs27Zl0t+YIZP1
	r+U9bHTnlTFjUXKk3j57/oM3z+XWuJ9NBLWk1SMuo2PHYeNDovEHCqvverQp3SJ8Ji16g2II8YE
	3QzC63Srp0+ydVYT8T5KR6dggeaxiN8oUBg/0w8G1e9VIDDBjMBzMFK+4RZqOA1LrAE2+Ylj91/
	WcpBn8srUkav7OkPCTfqYXg==
X-Received: by 2002:a05:6122:e006:10b0:5ea:e196:2742 with SMTP id 71dfb90a1353d-5ec232d4fe2mr3522003e0c.4.1793102510380;
        Tue, 27 Oct 2026 05:01:50 -0700 (PDT)
X-Received: by 2002:a05:6122:e006:10b0:5ea:e196:2742 with SMTP id 71dfb90a1353d-5ec232d4fe2mr3521917e0c.4.1793102509679;
        Tue, 27 Oct 2026 05:01:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e89cesm445373366b.13.2026.10.27.05.01.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:01:48 -0700 (PDT)
Message-ID: <1dfd5e01-d701-4a59-9b10-062fd59e25bb@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 13:01:46 +0100
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
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: nord-rrd: Enable eDP0/1 display
 output
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260920091930.2215803-1-shengchao.guo@oss.qualcomm.com>
 <20260920091930.2215803-4-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260920091930.2215803-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX7WqZOqX7xrWj
 wEOFFe58RZc6LgoCgBpg9Jpcylvu8Vsp94YCpUaa4WwBHuj3DdMZBEfafr+W0SYLdMqJtzqJU3b
 0T9etQ3YtoccOZok31yiGaPh4NxBnpo=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6ae092af cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=wx-G1DhjD7h3rq9mWzQA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: UcXls-hv7rT02SLtUjwSohc0vsaHJvGh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX5Mnup9dlG5XM
 WB3EAEOgHaVNxMmRbuQH1DPMtWs91hKdDSzkJwSv1ZRBMb6dpqrGIKBX7LlY0ffPzxt/sR7lekx
 MlrlryxF/d+jHRAKwt62FofWDydGONcao73nAIxQwoj8cAmeUuxlVeDvagIQfHWXYWTRMog/Rbp
 QtimF1L+M1nYqhiL0FVoQgVCTN/2VKOE4iktGbH2LWDwQlOUh6DEQXx0AviBcZgNjOY/ZLVqcbz
 9pj4F/L5pRZvFl/j3C17rl19gYiMLQ89FFCblhqJFOJSJ2FnyD7dL850stlpEhjJrp8DGh9DspJ
 ZUYXe77l5OGVR4d+bQbPnYdy8mEQe53YUezWgImunZsMM/K1h5LjOzNfFpGXhCCTMa86akqwJv3
 jEgAgxoTWRlyvQLGPrEfcuNHfjmyNXOZH9fFE2LFkH6v7hI/5umRpfHLnp6LTYQqnu3ebYRfXA5
 CBLEWuvhg3x0lK5kB7Q==
X-Proofpoint-GUID: UcXls-hv7rT02SLtUjwSohc0vsaHJvGh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270047

On 9/20/26 11:19 AM, Shawn Guo wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Enable the MDSS, DP0/1 controllers and eDP0/1 PHYs on the Nord RRD
> board and describe the eDP0/1 connector, its 4 data lanes and supported
> link frequencies.
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
