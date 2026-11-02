Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610696;
	b=dzqx3ONHG9jN74k62fWTXUNn8IRI1g8HhCL/eBOduUGQiZD2OB+nmNuTuhkRhoT5wskm
	 w3z8ELA84q3ST/X9sst3cfVTisIi5tjS6OTH0MOfQhgIeJwcOjS1j/C1crCDNG+No39Qc
	 RtB0jEBfQ09mvZsMUj+oAWHVKvI8+IiUhIz0qFqOwNgJkpc66apbK6IAna5+lpBgJNJ9j
	 jMYaUQKH2SOu9IHCXLVB1RwYN+vF2Rf65zLwoOkJSYVKkXZ2PjOUTl1JVAG55Iph1GJux
	 2VH5ylIQh+fQspp5w4+GaqSyjJBDpSTWdGnv0Tb+2/FlwMNfNFTq/hj4kXLdKzTucdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610696;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uh0srCBGufPNZ7cwNZU1GCOOPE61Pwx0Cml7uyDZJic=;
	b=gPvEEMcRxCsyHUM/McDgpCfZkh5BIm/8o8Nb1DqRW1nj+ZdzGuoAjhOh9UqhtMZRombs
	 VqSd+klG/KPYkW+iESkFMs3c8hPbbbg1X3X/AOu1vG/+bjReSZEipfwKSxl/9MnLVraQm
	 vZA9k3O77jY1A+TS3dB3mnrhClv6W+Uyhc+4TC0iXl4JpZ36/eLgRuFXm4BLy1LqYHEqq
	 I5bwNfn5pYlB9TnCirnGo2YHoJn5K82idx+0qg9AVO49NXpH+tSu7q+ENifvya0rG42i3
	 zoM7aU2iO9/YLcE/aORmZFAK/84JIEnupHMlHqvEv5xrWKljzHThcRqaF6xth7t1wUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QUWnkuiC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c7UBzL2x;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2A4606A324
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 09:11:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E2A4606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QUWnkuiC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c7UBzL2x
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A6L4213988
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 09:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uh0srCBGufPNZ7cwNZU1GCOOPE61Pwx0Cml7uyDZJic=; b=QUWnkuiC9xEXxw81
	CXmHwdRTUEXk21Gqf98cesdGE6yjk4JrLYRuxMyFjTc5gk31J8r3SlDW2sBz/AFj
	D76XGf2mYKajqd+mGUNqClPL+dtiJUjbxAdmmjfPCXA9KynPCiAKnec34fkEUE+e
	d/oVF5KK0EmBTkvjjVM9IpMH30UGG0f5WnEUm0G2frqNR0KNonYJ57HJG+zgCBRM
	mkTONZwP3yQlpJd9MAwABHLQKiytzPAHOppuhgQ3c6mt09HBj7SfKMXz+2x6OWsY
	+68ms6CnFWMULK2uWfcSDglIZE8DDxwGMiDYFzNhUpTJORhPDvi/F5cOGsv+YA78
	EDDaMg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1rtef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 09:11:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ea381ce04fso35122655ad.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 01:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793610695; x=1794215495; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uh0srCBGufPNZ7cwNZU1GCOOPE61Pwx0Cml7uyDZJic=;
        b=c7UBzL2xTWZ+Gks77LrZxV6ufkxco71Ebg1q7EhcC9qDgdh4UWYblZMMzDOHUACyms
         xI91GRvWwnrD+2L2EsMnbN7atwKtSQnf9T0j+PAd+S9ORwFM7E27BcJ73ahtutbUaxIB
         0/qGEMB876F0OHfCH/HXija+kywki4SvPo54txiEqBynWMX0aNiQGCTDJ3QFqIWzsEqg
         VxYrcrl9UY21rRyT7A28j+1pF3wiaEowK5xR+0WXmEgvzeqm4tuLwct+E9e2xrBuuHFq
         dW6SiAgcEpGQj0GHlDAJysGOBm8wUVBJU/Ii/E2Ca4cDEBgQ9fqzZcgJTP5Dg2p370CV
         Cd2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610695; x=1794215495;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uh0srCBGufPNZ7cwNZU1GCOOPE61Pwx0Cml7uyDZJic=;
        b=LHd5GBuzPwjD8qw3IuASwlRokSqgdJNkVUriBbzoLbEIHVE3r+xft1CZQOzJXu/HL1
         ggcgAgCpOv93DniPsGRFErdG5OK+o/I+H3rofSKhLM8t4WpYG6KdSVgRUBsv0e0rIctW
         XrKhuF7JgHsazP3NXZ80omARuQmTo1pi5PYAfJLqS24qjupv9+vpar+x80ftdFUZcXMM
         Vh4eEoViWbXYcEcFK/KWGjEaWDdl5b6hN5dvYOmOq9hDCxXHO6NKaZK4ky8Rz5QzY1sI
         FnTScFxHGr1K5zGXxjHhgnGuShR9xRlvzM/GlzqMrzhrQI1HEW71MSz1q3TBZDU5u728
         MOww==
X-Forwarded-Encrypted: i=1; AKwUvBwTA4rPPymi/LogGNfwgxtn+wq+zsydAx+QyxdMshE0vS0wYWxCqi7zKFc7w/on65upO17i+x9WLWEC@vger.kernel.org
X-Gm-Message-State: APuU4Z/Xkl4vxqwQIcj3Bms37VMHloqkkMzU2nQz7aawKiaQ93mfIaGz
	9l9QcDAtrKvXd5+Vfmmg46zeAeA4zBMyG2DEGUzM8E/TfzVwS7DodQld0qH5IM46sIbFmQU/QgP
	MsO387dNgfL8EOAoY2CSsKHbiYw4ELBCzFQ6IPlivVPV+Le9Ci5mwaqSZzOrDtTEa
X-Gm-Gg: AYBFou30Zo4cQZQMo5fm/jPXx4yQOhINk231Smm9+Z9KWk7OyyRLMukHXKCSalAg9sK
	+4Mje8pev1VLSYA1+5f7lWpELkUcY8BB/x28HuWDNzk4e7kZQU0sMICBG9YeaKDbQxIKLqiTpoa
	GBeoikn+YuP/VmHCVU5fSkRg8UgVs98mZkgpj6bvKALkDQu5oPIrGyd3+dLY49A1BQZXu69JkdF
	/s/Aa8Hnlw1KI1aie2qPzBE762DBsd9HRo3KWp+7JOCKVPs+X/k+V1QiCdOB/wDy0dhi4byrknb
	OEYFJeT+BjdaGojwT7+wpv2zuvoBENStL34vk+u+cGeLUFoVc4rPAomJ3TDUi8MBp+NU5tfb2dd
	AptFtyZL6GMQ2lf/PGURrDtZsDioeR2bGhnhpgYJMIGNKc0vD7CUEOb7dTr4Em2SWm6J5c2vZxA
	Oz0vrMCnAIDQ3O3a6WQVhT0rvCTLKRtmGH
X-Received: by 2002:a17:902:f607:b0:2e9:3dd2:a8f6 with SMTP id d9443c01a7336-2eb364941d8mr67629415ad.9.1793610694927;
        Mon, 02 Nov 2026 01:11:34 -0800 (PST)
X-Received: by 2002:a17:902:f607:b0:2e9:3dd2:a8f6 with SMTP id d9443c01a7336-2eb364941d8mr67629165ad.9.1793610694447;
        Mon, 02 Nov 2026 01:11:34 -0800 (PST)
Received: from [10.239.96.176] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39248909sm25062335ad.33.2026.11.02.01.11.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:11:34 -0800 (PST)
Message-ID: <757f0875-8940-496d-a35b-5f482887739a@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 17:11:27 +0800
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
Subject: Re: [PATCH v23 01/15] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-1-95f250b18612@oss.qualcomm.com>
 <c10dbcfd-b9d7-4ac0-be30-6b78594bfdab@linaro.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <c10dbcfd-b9d7-4ac0-be30-6b78594bfdab@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: N_OAlD2vveYQgF0f5K2On_LOKLln-Zkr
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae853c7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=dRQ5KtDc-XJZQSWJ7xIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfX8bH/BqkiFLws
 SDLMk3oIPbimmADmJ6lfpuJ3OY7Cue1MMDk9jG6KYlmzniqNXFJABM9nrfpct6ZEnwEMvsSAOCt
 UUnrshPK8Vc4Q+XJ/YR1U94CM3ZyJXBc2ODnRsr7T9WaU3b3Jn5Ok8MsQkmrZ0Alkm9xGvuV6rH
 aw/PO0jw4Dq0fPsiiGoyVKdpp+LODrIDVrBrn0JL8CoJo7P+VtY7FyyJcVxj787rzU7VANYKGKU
 6LRp9RRCo1gQK/K5SJW9H+Nuo2wsyfxdycmMnQtZT4JNsjb+kiy68t2/eZf4avYXJlq/gZINyDu
 RAaA7bC59zzYvgcsJScDV36tm0spANFiGOvsBs1QaDXHBukBUDNUBsaVVFG62g9Po6YSBY4C9g6
 wjMd8aqVeg/2WFLirHKG6lnR3wa9ogTpwuxZWAIznyPfUakmlJX25HuPJqAydUR6nJyHYWeN03D
 01QjLhQkLjNlyH/TmKQ==
X-Proofpoint-GUID: N_OAlD2vveYQgF0f5K2On_LOKLln-Zkr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfXy90KHVM5yymL
 uheb14VBMJ2lgbvlJjYBSSYT/gUQphXXIeDlb92gEUUc4aoDyv1GMtfrW6lzH6fQfwB7Nir33FA
 bZlstJNarLUUKy012jv9Z8RLkaL0rcE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020036

On 10/31/2026 7:42 PM, Vladimir Zapolskiy wrote:
> On 10/28/26 17:20, Hangxiang Ma wrote:
>> The Kaanapali CSI2 PHY is compatible with the existing x1e80100 CSI2
>> C-PHY/DPHY binding. Add the "qcom,kaanapali-csi2-phy" compatible.
> 
> Wrong, it is NOT compatible.
> 
> Due to the functional difference in the register offset, which is
> described in the patch 0002, it is NOT possible to fallback to
> "qcom,x1e80100-csi2-phy" compatible device driver, and there shall
> be a new stand-alone compatible variable "qcom,kaanapali-csi2-phy".
> 
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 
>> 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2- 
>> phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2- 
>> phy.yaml
>> index 1f1e2a4993b2..6e9eb8e265df 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>> @@ -17,7 +17,9 @@ description:
>>   properties:
>>     compatible:
>>       oneOf:
>> -      - const: qcom,x1e80100-csi2-phy
>> +      - enum:
>> +          - qcom,kaanapali-csi2-phy
>> +          - qcom,x1e80100-csi2-phy
>>         - items:
>>             - const: qcom,glymur-csi2-phy
>>             - const: qcom,x1e80100-csi2-phy
>>
> 

Agree. Thanks. This line of description is stale. The commit description 
doesn't reflect the content precisely. Actually, KNP uses its own 
configuration. We notice that register offset difference so that the 
adapter macro is introduced to handle that.

<https://lore.kernel.org/all/20261028-kaanapali-camss-v23-2-95f250b18612@oss.qualcomm.com/>

---
Best Regards,
Hangxiang
