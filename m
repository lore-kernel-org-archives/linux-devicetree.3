Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8883B0AF0
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 20:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779221239; cv=none; b=kgcTRFBCGaEw6iHcNUzcRBEpt1ELSEauaDckMzfTdcGUD1QIBg9sXbLy3tGL3SFp8qpejVUg/GQo8IbbAHqrcE0F0K4pnVpHDxq3WymuV0q3v3GxDg4lmtje/WrQWtdkICMmJ7llZPOFW5BigeXQ2hEqQEtz40KhWLvszG73Qp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779221239; c=relaxed/simple;
	bh=I3qvf3gT0P0uVoQM2XWb30Vlt4Ack09Ywc4NZ7C3l9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HEsokt6JVvqoQEnZIkzsCZMZn7xbSZdRGOEYCgpRHegOzQjvjFWKODm8hix8X/6vV62XVxaHRZm5anS+W87ok4euNFqNTQZKZ1S+uWkAARH9A3wZbF1I7k0Z7VVWfAfzVST2ZbQUGrOeRjpddCW+Q7kSvGKB40fvoUXQelDJF/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KsWt/+Ay; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ISZrEDpt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KsWt/+Ay";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ISZrEDpt"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JExIKf2143760
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 20:07:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ba9sE4umteuJuCK8CmKc37MvnxwnoKBH6bwhBFlN/h4=; b=KsWt/+AyyZ18HDOx
	3R8LW0sLoYxT/yBK++2NzOnX6QsXBuM6qaIFxOhY9uM0QMxP89hsXS+STtIVIjZb
	q6Q+66jkiZi6a6AKeFu3gMWazqKWXFocy3QtkjQkRc01JXxcGT1V42WmLUq7EW4u
	c5DVIvmzOBUshd7rFamrs39ROOZ9oi2QGNO57J63HrrglLeeMaqeRUHznzVrYKop
	4Y1viN1hJSt6mj0IHah6oSkP7Q4D4z7+hLGJT8DEM8R2btZAPkrUCgywyxKI2gZK
	udS1x+f4qzqBb+KvCsEay/rZSX12ClS+9THvcYLnynXzpb8IEKMkGxDOHhHnn64L
	syErBA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3thasr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 20:07:16 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5756024c77eso9346334e0c.2
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 13:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779221236; x=1779826036; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ba9sE4umteuJuCK8CmKc37MvnxwnoKBH6bwhBFlN/h4=;
        b=ISZrEDptLp7DO+R19eTuEkzoV26Ure506CtZ48cjGROq/f1oz/XJLiY7xk38kHc3AX
         TYVjCzyqjcUEwmFQCTjngoBv0zEq10t3nRkgmZ1waBCUiPdSYGrp7HCYStTkVsDwAcDW
         hzNrnHo/txykXwz0Gd6h620WXO+dsXeMIjUv3qND9cZ7/Z/zWAq8BeWZcZD6FWm4SmJV
         bIcj7Pfu2NwfR8ArmwV5dWl4To6gI+4vWUscWtHp6prdgH94bNExIe7kPumsSwsXqc1x
         iMfbTsFYf3eitCv09lyaFu4mET2qgtpf9WpXO0T5WbP/Qm3X6jro+6oKvlVMgcLDAhOU
         M/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779221236; x=1779826036;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ba9sE4umteuJuCK8CmKc37MvnxwnoKBH6bwhBFlN/h4=;
        b=Gg0hnbngsBs+NvLhZK5jfim2inGDFtqp4PBO3Wzw84duhnZNmx+++o82zwSHlTxKv5
         U4xBDKinjrRO9b6fGnqrE+QFZAm4Rbdh/WXsZEpN6N6BPGp8QIeAlQ8zPE5s2q7pDV60
         b6EruEQ5NQO9b205XP5J40GfyaqEzRk9NVBEriu0Z7iwbCT55G1hKQf1lSOiVG5PKcp2
         P83LJ3nCzX46EdsabeMwPfxHlVT00Cii3eXKhuarWwkzrg3oIU8c6BYhc0o92NoTxyyF
         NFO/HdWx/BLWOTiuvy6Nr7io2A00BaUI5naRaDuV37EdMT+wxhu8faCPTS4wbQuPTwPq
         7UWQ==
X-Forwarded-Encrypted: i=1; AFNElJ8RI+1ASsUtheqQHRWP1bS9/HfZOjEI94V8D0TXNyLgkfoFtS2Cq2G14e/yGdJbdqGiJrmfAUYn3hy4@vger.kernel.org
X-Gm-Message-State: AOJu0YzAegya3+rpfFu0wRGvxBipZmNHRL8Avz4yga3oMw8yCoUtZX7w
	XkbtXAnvFFJyLu195FfLkLK5Vlr92OXc6olSINtgxgqUKP9dPEwVRLMrf8FyG4EvSxadhSEkBT+
	wKUfRKR/ilHEepvg2zaEkG0gmswZsD5eAhmWqbJH8VvE3M55I61BMOtbYecQYrexJ
X-Gm-Gg: Acq92OH5wxXLOBG8qmgBGo5RbMR8mNK6NE/YdT0PffFSyqMgckS4TdJlju9ANYPKOBj
	Mhth10Is8nsNtfPjWARykTFQAelC0huYQ/pX6ordK8B+XJ8nMxJtMSdy9QrLDrpN/ugm1GYYvqh
	PQJEQBQxfAf3cTxl4uKnOgeDHucwKGdDjDKSivPKa3ZeXfNAkzZwgahf46DSBhep55FrG5kFdJB
	NfkbA2s1yGTeoHLdUoEaD5zOim8Dqgn3XevSA2FIREh+m4jED07M3zRIBNt2IjPZjkibHgWpgaF
	Jf4RPPCyqAV6b1sO/mzFmj6xHS7F/igTFvUZBQWVwtFAAys4x4wTP74CWJn9wxYiRjTdFoCCDxg
	zyxSPRb+ZsegOYPRploxn/pbTJtLrmDi74192/82oBy5srUAy/N4K9bOXdBw=
X-Received: by 2002:a05:6123:128:b0:575:d035:8cb1 with SMTP id 71dfb90a1353d-5760c096bc8mr12568319e0c.13.1779221236342;
        Tue, 19 May 2026 13:07:16 -0700 (PDT)
X-Received: by 2002:a05:6123:128:b0:575:d035:8cb1 with SMTP id 71dfb90a1353d-5760c096bc8mr12568308e0c.13.1779221235900;
        Tue, 19 May 2026 13:07:15 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feae166dasm131131645e9.9.2026.05.19.13.07.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 13:07:14 -0700 (PDT)
Message-ID: <e8a78a17-7ed6-40e0-9da1-2e70be5560f1@oss.qualcomm.com>
Date: Tue, 19 May 2026 22:07:11 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: arm-smmu: Constrain clocks for newer
 Qualcomm variants
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: catalin.marinas@arm.com, kernel-team@android.com,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
References: <20260519074059.61405-2-krzysztof.kozlowski@oss.qualcomm.com>
 <177919680700.851863.10253442471292780349.b4-ty@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTpLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQG9zcy5xdWFsY29tbS5jb20+wsGXBBMB
 CgBBFiEEm9B+DgxR+NWWd7dUG5NDfTtBYpsFAmkknB4CGwMFCRaWdJoFCwkIBwICIgIGFQoJ
 CAsCBBYCAwECHgcCF4AACgkQG5NDfTtBYpuCRw/+J19mfHuaPt205FXRSpogs/WWdheqNZ2s
 i50LIK7OJmBQ8+17LTCOV8MYgFTDRdWdM5PF2OafmVd7CT/K4B3pPfacHATtOqQFHYeHrGPf
 2+4QxUyHIfx+Wp4GixnqpbXc76nTDv+rX8EbAB7e+9X35oKSJf/YhLFjGOD1Nl/s1WwHTJtQ
 a2XSXZ2T9HXa+nKMQfaiQI4WoFXjSt+tsAFXAuq1SLarpct4h52z4Zk//ET6Xs0zCWXm9HEz
 v4WR/Q7sycHeCGwm2p4thRak/B7yDPFOlZAQNdwBsnCkoFE1qLXI8ZgoWNd4TlcjG9UJSwru
 s1WTQVprOBYdxPkvUOlaXYjDo2QsSaMilJioyJkrniJnc7sdzcfkwfdWSnC+2DbHd4wxrRtW
 kajTc7OnJEiM78U3/GfvXgxCwYV297yClzkUIWqVpY2HYLBgkI89ntnN95ePyTnLSQ8WIZJk
 ug0/WZfTmCxX0SMxfCYt36QwlWsImHpArS6xjTvUwUNTUYN6XxYZuYBmJQF9eLERK2z3KUeY
 2Ku5ZTm5axvlraM0VhUn8yv7G5Pciv7oGXJxrA6k4P9CAvHYeJSTXYnrLr/Kabn+6rc0my/l
 RMq9GeEUL3LbIUadL78yAtpf7HpNavYkVureuFD8xK8HntEHySnf7s2L28+kDbnDi27WR5kn
 u/POwU0EVUNcNAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDy
 fv4dEKuCqeh0hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOG
 mLPRIBkXHqJYoHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6
 H79LIsiYqf92H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4ar
 gt4e+jum3NwtyupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8
 nO2N5OsFJOcd5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFF
 knCmLpowhct95ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz
 7fMkcaZU+ok/+HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgN
 yxBZepj41oVqFPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMi
 p+12jgw4mGjy5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYC
 GwwWIQSb0H4ODFH41ZZ3t1Qbk0N9O0FimwUCaBdQXwUJFpZbKgAKCRAbk0N9O0Fim07TD/92
 Vcmzn/jaEBcqyT48ODfDIQVvg2nIDW+qbHtJ8DOT0d/qVbBTU7oBuo0xuHo+MTBp0pSTWbTh
 LsSN1AuyP8wFKChC0JPcwOZZRS0dl3lFgg+c+rdZUHjsa247r+7fvm2zGG1/u+33lBJgnAIH
 5lSCjhP4VXiGq5ngCxGRuBq+0jNCKyAOC/vq2cS/dgdXwmf2aL8G7QVREX7mSl0x+CjWyrpF
 c1D/9NV/zIWBG1NR1fFb+oeOVhRGubYfiS62htUQjGLK7qbTmrd715kH9Noww1U5HH7WQzeP
 t/SvC0RhQXNjXKBB+lwwM+XulFigmMF1KybRm7MNoLBrGDa3yGpAkHMkJ7NM4iSMdSxYAr60
 RtThnhKc2kLIzd8GqyBh0nGPIL+1ZVMBDXw1Eu0/Du0rWt1zAKXQYVAfBLCTmkOnPU0fjR7q
 VT41xdJ6KqQMNGQeV+0o9X91X6VBeK6Na3zt5y4eWkve65DRlk1aoeBmhAteioLZlXkqu0pZ
 v+PKIVf+zFKuh0At/TN/618e/QVlZPbMeNSp3S3ieMP9Q6y4gw5CfgiDRJ2K9g99m6Rvlx1q
 wom6QbU06ltbvJE2K9oKd9nPp1NrBfBdEhX8oOwdCLJXEq83vdtOEqE42RxfYta4P3by0BHp
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <177919680700.851863.10253442471292780349.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=feCdDUQF c=1 sm=1 tr=0 ts=6a0cc2f4 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=-VkZa0qGcWT4bW_tupkA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: faE9erpN47lULWIs5eNpb9JQu6kGKSwm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDIwMSBTYWx0ZWRfX5AuBHc6Y2jfj
 cCJntB4sVTpK1ccyqoTWmorSVxGdh0+2VdOHHkMC7ZmfrNSXCZgeZ+C61vIzJcDY92TALFu8ze5
 EDVPlyd4WuLX9pVOs/+W1W/zVOSO5JOEhmrZE0aDeTfPdzACzSlsiCJpk3lh/XzL4eVOr0FJNnv
 6ZXYVe9cexGPT8Wp+36NGH/0ZlG2ZbeU0xMq2666/vHXPjNEKAJbFxTkB6rl9BJfkVCfnbZoUyE
 zVfF9egtePUaJYV9qOtZTyxXzYWmqZxhyLqnCtYsiuwslMaY4tEoKxg1Yra7jrQmMhCEYn0z753
 JtBbKAZk2eQUF+qm23KtEniD7eO9u3Ce6NveKLEeGGsbD+h+auIlkih9FVWXGbcNmJlG0nMykrg
 myCXj64VPVa8HdlyO1b7aDIUk2f+NBuHXCGmqO3poodcE6dYLC/kGR2TZci45zAmFt+8PsxbpRR
 IkWc+/igCoYQhIaMc2w==
X-Proofpoint-GUID: faE9erpN47lULWIs5eNpb9JQu6kGKSwm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190201

On 19/05/2026 17:23, Will Deacon wrote:
> On Tue, 19 May 2026 09:41:00 +0200, Krzysztof Kozlowski wrote:
>> Many of SMMU on Qualcomm SoCs come in two flavors using the same front
>> compatible but a bit different fallback:
>>
>> 1. For application processor, usually without any controllable
>>    clocks,
>>
>> 2. For the Adreno GPU, with some controllable clock(s) and using
>>    additionally qcom,adreno-smmu fallback compatible.
>>
>> [...]
> 
> !! Please note: this conflicted with the Glymur GPU bindings update. That
>    was trivial to fix, but I've also queued an update adding
>    "qcom,shikra-smmu-500" which you may want in your list of platforms
>    where clocks are disallowed?
> 

Thanks, I will double check and send a followup if needed.

Best regards,
Krzysztof
