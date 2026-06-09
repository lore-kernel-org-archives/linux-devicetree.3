Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5915241C302
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 13:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781010369; cv=none; b=AViKalnK9W06SmAoT9peW+9EV3YnZ09ma2VtX6pM8rlt9uZE5hMtT/hQMYObpKKdw+/Y11ygRciq00D12mMpnafGrt2HcVgZiXi4DfAp0HXZKVmpYl2tKackXva0XjMmv8Fg8a1YZpc4IiTSRkQTWmhaKLFLnc3Xlii5VVsf4xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781010369; c=relaxed/simple;
	bh=YQTC5LqBvYdrEq/7NI/kZY0CuEAr8jfvYnezNkrV4TU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iRSzwnz443yoFTMxTidPF4iI3ODCAlqdB8/rUqpcGa5CTHYa7w9fU2B4PJ3v54cfreCLBM0BwM83jquWbK4rykVCoB1lSONaya9MtuYGeR2c4y2EzlVqhSA49aHK77Lt7Q2QSRGaQ1Cyou1RvxKwU2qYf0EY6UwZmGqBXX2MHa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hoxdPeW6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X89oXK4r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hoxdPeW6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X89oXK4r"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659CnMux2668556
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 13:06:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YQTC5LqBvYdrEq/7NI/kZY0CuEAr8jfvYnezNkrV4TU=; b=hoxdPeW6aHqFtnaR
	l8W+0aINbVu4xZX3CM0Rq/jD8Fl0pB6R3k0Sw5ZetfRQnKFAaNrltJDzMO6DX7N4
	npHb2RgPjYBZqLrhpAa9EKoI71gGZqau/I0NcGnnDDVHibfGEMoZNa9JQ7tm1Ke1
	F3R5HvHVfbhh/oxo3ESoiPg5I7U3qK3nzaGLMR7DkDBbADZGkvuiQdO+E4QoC0Fa
	Rjh8Cl1y8DY3jkGCijmlil7QRvxGluW2pXMkxDjkOeZ2UPTdtfzhDYA9xFhBCB3+
	576bIExdKzeJBwWHKELIZc/9yq0Ozu6SaOKb9PPR4biTj3wW7vh6q55LVZ5aOAKZ
	qC4lLQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epe25sh5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 13:06:07 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-963d19536eeso228880241.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 06:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781010367; x=1781615167; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YQTC5LqBvYdrEq/7NI/kZY0CuEAr8jfvYnezNkrV4TU=;
        b=X89oXK4rIuYimIN38b0v7E10elc8VLnXA1izI/YoBzndccRU7N/iIrFs6b06MjqwEz
         NR0+jLH6ESbu8RrUy1QRsOI5JJXrzDTJUX64n0B+XiQgp3hrLTNH2x+R4NKLiMTxIj9R
         xh1oWhrhXKiT+4vti2cCKkI5XoGTv/B/PoSJItkbd1sypGTYHosOySuOSx1lJTyEDE3a
         G639K9pOK0iczy74T70qGuVySzOdkcc2H6ITVQzTIaQTYMOTGOthiUXViylkclLOs+qt
         7C8YZ7xTEXnrzHmY0TeZQOk7+VvVU70lOhoWa8h1vBG5n7rIaPmBS2HTFkw2V/YRkxbc
         gCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781010367; x=1781615167;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YQTC5LqBvYdrEq/7NI/kZY0CuEAr8jfvYnezNkrV4TU=;
        b=dBa5Fx3prRC7KKDKZSdj2zO6YBrLWn5xFWnz2O+JwXVbXmcg/ZRoO/G1J5mfFtxF4q
         JR0godJ/2J3RQqIBZK+1edkXGZJnFDo5siCxo0bp3AOY5Rt7iZa/A403q0MezTV8ioc8
         8gm/yuOZ4aZKPiEAy981GI9LTUl6HrjYwgdh6yOh251kMVzTJ9cjHYgAAhqME0EliT2n
         NNdjkrRVPmgXIPrJygShfsTyAQVXv56QT/0bNQlnVyDln4rw/Don2EDlwF5Tvy3GKFb2
         nY/LV5ukj+T00s5Lgaj/rD6hMid4wStNZ6kKFp8s5r+Zg1hTme3h24BOmIcO5sz6wMDb
         qCUA==
X-Forwarded-Encrypted: i=1; AFNElJ/+3FSachJNx9Mq/u+vhZ2PJX7mScnWfNCs2S9n6HVPNLjNGlp7ZdIMUMuySX+zLxOwiBmSDhUkcTE0@vger.kernel.org
X-Gm-Message-State: AOJu0YyNK0gwrNXJQdTERgh/ffTNKSw8hF9bgzp/Co72zs8+boJP09o7
	CcoF0I/ZfLOVHYk8c0VqwA/4TCjBH6eK+Op4nSHdk6yuW73I26IDYw2zVDgPRqT6kme4Ny51Q0+
	CoHQg7lrJFPhnNVJ25JENIw+JSult9lJ9X00579tqlCUnPQkDqpKJNzBUXPfdQI4l
X-Gm-Gg: Acq92OHDKenynlPzF5PBfznwN7Vpu8rKlX3QAZL2KMkg4RWaus6/3tFwciSyM5XXHWc
	Np0Dqx9KkQiHvhp0sQHcyX9ohZzmkobz49kUAaUrfEoBlHbZGYcDp9eXmEHxM3YuHF9t2Hi7duT
	vO7Y303aOlL0/hKyTKw6WyxNKJqTJsj1mp29lr2b5hLqyxH35dbXtk+wCn5/kf6LcEQT5PfBTt1
	iPUNSESFLOuFH7RQc9Dik1WrHVV48kAntcGtA2wkz+IUOdTdA9C/tha02zAzEJ3u2UnhvafGD6P
	91jjNq1Br5Bf7EgclJQtvVqe7R22W0KXEvDh9GX6+enj5Qg/AreD15DkI0TKic38QvCZnn8HXpT
	TOr56KTaN8fwwKN13dn2ge2C3ItCTiSYf7kqpGW4OxI9U//9iIr26QFvs
X-Received: by 2002:a05:6102:5490:b0:65a:fee5:ceac with SMTP id ada2fe7eead31-6feffb06cb0mr2878503137.8.1781010366638;
        Tue, 09 Jun 2026 06:06:06 -0700 (PDT)
X-Received: by 2002:a05:6102:5490:b0:65a:fee5:ceac with SMTP id ada2fe7eead31-6feffb06cb0mr2878459137.8.1781010366181;
        Tue, 09 Jun 2026 06:06:06 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fbc9esm4578992e87.22.2026.06.09.06.06.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 06:06:05 -0700 (PDT)
Message-ID: <db074223-ac01-4ffe-ae82-187ef0cb2cbb@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 15:06:02 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] arm64: dts: qcom: mahua: Switch pcie5_phy ref
 clock to RPMH_CXO_CLK
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-7-ded83866c9d9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260527-tcsr_qref_0527-v4-7-ded83866c9d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FqoJBXR8zFcbfQ3HGjzmZ7u6inhADV-v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEyNCBTYWx0ZWRfXyXbAwPij4BSN
 EWkpxo8UqSmt+m1aa8I+626vwwrw8ZgzLsEHZzJI4SM+u0uayVQWothCM7l4nM0Zfly5othjwja
 TSxxUcgcB3mZJLl0MFypm6JLdIrnWOxNbc3KK0IUBRAO0fDn3/tvuJB0Q4tKhHoO2QApLIPxeH2
 wIfDbKT8JQJKbI3DBxKQNtLUVRA/6++qSXPkFOxgKYaw27H+sk+YuXqtyD+7AUDmBfM+JyEJqUv
 WqXl8zNb4jwhBPNShk8JgBjt0OK+HV3VmfilFf/U6/tx8pN7gVgVVrcE+0671LRMpKRDrYFBNmx
 eEV6mJVPG7HHqVDAhxSpU3y7rHZ2H2x1GJ7d/rUB+sYF9MZGxrF9FDlY1NuymsbAjSmUv40kUPJ
 zAnFGNgkDTsxGqRrlZ+aReH86/Bx0r5TlU5JAC8X3k6rdUW5GOZLuNZCzM068VKxTDKrASxKLWb
 SC6iH8e+GCtzrLRnH4g==
X-Proofpoint-GUID: FqoJBXR8zFcbfQ3HGjzmZ7u6inhADV-v
X-Authority-Analysis: v=2.4 cv=LoqiDHdc c=1 sm=1 tr=0 ts=6a280fbf cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VaM7kzH05nLpQn4dOD8A:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090124

On 5/28/26 4:29 AM, Qiang Yu wrote:
> PCIe5 PHY on Mahua gets refclk from CXO0 pad directly, so no QREF
> clkref_en voting is required. Override the clock list to use RPMH_CXO_CLK
> directly instead.

This is the last piece of the puzzle that this series is missing.
There's no QREF clkref_en, but there is a refgen that needs to be
powered. For PCIe5 on Mahua this would be L2F_E0 (0p9) and L4H_E0
(1p2).

I think the easiest (laziest?) solution would be to add dummy clocks
in the clkref driver and only toggle the required regulators. Another
option is to defer back to individual drivers (such as PCIe QMPPHY).

I kinda like the "one central node to drive power" approach, but I'm
not sure others agree, since it stretches truth just a tiny bit
(although not as much as one would think since there are *some*
controls for the transparent-to-the-OS hw pieces in these paths still
in TCSR).. Dmitry, Krzysztof, would you object to that?

Konrad
