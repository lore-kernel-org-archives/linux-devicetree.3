Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A82391E45
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 13:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775569241; cv=none; b=KhmHCmqkVcy3RzcoxVBOy/qoxH5mo/Xohq+4KDhir+4vhNmJ19pmN+wPrYZuZp0F0tLSpk8AI2vnGm7x/tCE1PrU3k6kVlpkdbNKDOqAFooOonAOhj2DgoO+VZ9sDNv6afe5wYCHcvx1cA4JLoBaV9SAc5U2Te7bFjRW4bevmZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775569241; c=relaxed/simple;
	bh=fy0PvvoQTmYJHrlxrs4PPEHiEJyjsMPG6vOeiMDeWos=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HOO3xdFutfsvmxvVHZZF29ew6U0IS4OF+LjAPz8C/ZE7j/d3GUJkxH6B+jq6TVezGYWpN7Hh98+n07XUsUXT6Cc19MmGyeDxtI8HeDeRkxhQIAk0erikC3G0aETnOD2ZrAOpDzPAw/Fdt3B11ovsRq/fe9QTVl5SDRgtPhz+C+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eMl9tmzC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V9QctCO2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eMl9tmzC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V9QctCO2"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637DR9rh2009139
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 13:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vqH9qDu+RSkWSmOuYsas0/ji8lEDf8sfNj81OgPLcEA=; b=eMl9tmzC/a8uTVA5
	sPv2R2zrCjgg3xMYRMNpC3IZn2j1evlEHQ6IkTVqblYshMHU7L9M++IEcStbxNcD
	31oSp6fKZacdBLWDZ+Cr2znc/l21xYKfJVAABMsQizvNzqb1d/YvxHCHga4l5r/H
	09sBSsbql6Y0tFBzTmuIu4h3d3wodEqrCi4gPBC2PYY/y3EYmZNeXx1fIPq844zg
	2AiV+a5A9ccaO0S5WULPGfVvzdoAwuZPAuw/dUBqq/dCcXPkFN3UmXWpmyZr9JhU
	Tt0EtOH5Ud+4Cuolz3CSFZo6P/4V1zN5kfdRyuxYDLARzt4WbvkjmonXrA1POO+Q
	G78gNg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrrtxd0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 13:40:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b34223670so226501721cf.0
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 06:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775569239; x=1776174039; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vqH9qDu+RSkWSmOuYsas0/ji8lEDf8sfNj81OgPLcEA=;
        b=V9QctCO2IpxrtMnrBU04pHr4QlRgjOb6WpN6j7AJkK5g+OWT/9xxoNKbOLaoAmBG3Z
         mIB4mVOpmTspSLStzT469xIj4OmAyY3Lc8k8zvjSHpDqcaor/yh1CaK2/yZlc/qx/euu
         MhXvNlhpfbkBBJM0pMqtDzbFCBNcIYbRw+f5i8c3wIrTaQU22/H/lr+jiY1e0SlMMTnD
         fK4bQR6q1OtjD7dJcIqO9ME0lldASvGKfEBzlL14gz+W38a1A60DJdIJsgH6JVece031
         wCNcCaV4r4hbVX+O8T6YfU/FVYfjIJyJXz5r8jJrR7Jb14KD4TKX5dx9FV1fGbW9K0K7
         gZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775569239; x=1776174039;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqH9qDu+RSkWSmOuYsas0/ji8lEDf8sfNj81OgPLcEA=;
        b=D/2LDdXT4rb7q72IsnWZiazWHz8ua542DVSwNlqzvWTiIUl8W7S50a+js/1SnwA6jn
         otI0OcCY2c0bFfy7gN4P9/2kKaE/8UyY7K4AYxSfigLBpOnT/jk8VunEKZx4fIZqqENI
         IsuBsP9bwtNBgbDvsMBz5pvFsHlzpR0onKLNyK+lN3wGGZOUOZen/MyyOI3p7XxNnFNy
         J2oQfEffJoAhQNT8jUDZhn6qq/uX5xMZFyNLRIxu3DLQivk+aSvq1UVheY+36hbQG3qc
         NMETgT5fWg7ddCEtWeOtwNpIXvZp8eF6OjjTktDTjUimNsyYGDgBmQ9rdbJtYaYeiPN6
         qx1g==
X-Forwarded-Encrypted: i=1; AJvYcCXOsX6UdeAfQ9WJYXkV2k8I2VY07f8a/DbRxwftw6NGUOGXeLrBsWw1L0YXj4Fi8//8DrO1z5+jXqSq@vger.kernel.org
X-Gm-Message-State: AOJu0YwpuP83Y3dOuOhYxQ/mY1VlIY/eBAhAKH9pQq/PBOiN6DMSxNDW
	uRCeemSuALbvE5D6J2v1BWGW7QM72ptCwY+pnpDsMUQPz0KcF7TgXVdwVNVjM0iCbkwhPkPoCa2
	XM5ucT1Z8h3dIBhkz9n/SzzGE0aoxiuHTkRtQMhLs7Ic8YYKCXdkFNNOuavqYwUlL
X-Gm-Gg: AeBDievRoQCSJK4SOPEn94emINajXGdipZeY8XJkea/TZHg96vZLRAWGP7iXAHoBbFY
	xqTt/Me5N3kPVq0b9SWnxv0ur8ae40bHU5x9oUKRAYjpa9glJ7H9voVulkGI4DHPEky44qxHsVd
	ppCxpXzFtr5N+LaqscMhaMRBQAb08FoKJ5Wde9z9nGVrtOjsUzxn9M9rBqXJPWpiFOn5fx2etik
	b2zFEoTAV3EGrCqpMce224HAtMnJgfcm+B8BNabgmHBuv9bkxRWFjwqIOU55gFa1VOhmwG7br2v
	usnuwK01a1D9CndtBDE9Mo2vl+HyXWsPtO3tleBozz7V0j6MWeQ42T4nmGnmhnXi4H92B5f4R11
	t1Sda/4Som1r6m4g3Ai8cIi7WG3sNVAI7qVHtDmZPhv1epjQ0
X-Received: by 2002:ac8:57cc:0:b0:50b:4167:7889 with SMTP id d75a77b69052e-50d629c5299mr254528191cf.30.1775569238888;
        Tue, 07 Apr 2026 06:40:38 -0700 (PDT)
X-Received: by 2002:ac8:57cc:0:b0:50b:4167:7889 with SMTP id d75a77b69052e-50d629c5299mr254527351cf.30.1775569238289;
        Tue, 07 Apr 2026 06:40:38 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a71f7sm52599754f8f.1.2026.04.07.06.40.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 06:40:37 -0700 (PDT)
Message-ID: <4c4e80be-4aeb-4275-977f-b3f8c6ab26b0@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 15:40:35 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: clock: qcom: Add video clock controller
 on Eliza SoC
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com>
 <20260317-eliza_mm_clock_controllers_v1-v1-1-4696eeda8cfb@oss.qualcomm.com>
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
In-Reply-To: <20260317-eliza_mm_clock_controllers_v1-v1-1-4696eeda8cfb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyNiBTYWx0ZWRfX+QJQ6d4gQTbv
 pt/SISvfZSe5u7pF1nS/sAokkT2iY9na4kNZJopABCPmBxhABInwVcXgOqZKRCa8V2DdB/2fDIO
 1Ut/PLkoxvMEjZrDJFPtyqKulruPYcDhcXBncMy2GFLmZvRW1AN7elHEJo9sfJ9sCcdJRyqlQg1
 UgryFO3f3/sY5vi5FvUxpA1DkwchBWdjQH/6QFaTiUHfh4z7dqR3VHgvhn70YLFM71NRdfFKGCe
 TP3wVnj+A4Bmz/n/AJ7KHIqH/M4f+mlTm3/+85omDSGY4hhjaOP6OOYLGvzmzVFs55DXXbhja3d
 /Cs/Ma+8l36jEJ3zA8GDQuOMoNmifn6GbAC+dmpPKEDN1rkUA9V0QzIbx+7asvIwhNQvhu8sa/C
 nPC9myHXrBNcSo2kZAqyXXoTOf/xX9Z/rFQEKZ1YIsgpowzLd4ZkA/D85jOhBLuvzptuRSIqnD3
 foXE+T0w9cJEXUDnOug==
X-Proofpoint-GUID: KeftANfMHmOn8F8POipmV12HFOX2a9ui
X-Proofpoint-ORIG-GUID: KeftANfMHmOn8F8POipmV12HFOX2a9ui
X-Authority-Analysis: v=2.4 cv=LquiDHdc c=1 sm=1 tr=0 ts=69d50957 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=NEhj3jsE5cG0449qHM8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070126

On 17/03/2026 18:14, Taniya Das wrote:
> Add compatible string for Eliza video clock controller and the bindings
> for Eliza Qualcomm SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,sm8450-videocc.yaml        | 16 ++++++++++
>  include/dt-bindings/clock/qcom,eliza-videocc.h     | 37 ++++++++++++++++++++++
>  2 files changed, 53 insertions(+)
> 

Although I already suggested that this was not tested (and you never
replied where did you test it), but I also checked and this fails checks
- constraints are mismatched now.

Best regards,
Krzysztof

