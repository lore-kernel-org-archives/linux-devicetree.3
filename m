Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873781;
	b=GYk5fqwMzp8xFexOmEmXbf7oZTibRVZfJVSPF0vGWtTpYyv8H+4XheUpHAgALzBtbmrL
	 2Xw+pZYbSsT6CYo/xWiZgwwnIJHsJ0ZjAkniSpTVZEsC1WQbJUR8DtIm8uzAoLsHaYPrB
	 fhlZpi0rinhjjELNogtPAjuzSDtDdIhVALBTnaOovkx+JB4G0dL5/UyoVHFtc0j9YRv44
	 Ny+A9Ts4S6XAWG3H+BfMdXonrTixAEzw8tIa3QVQ514XcxG47RBA5ch7NoeCcEAAMw4CK
	 GKFuKT3ZkARkYoaLCsCwxVgI2UcSj2iZ1Y0CSO1aPW5+75MI/4UGDEQpRU/IndWgM1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873781;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sNLRvc7OS9U73u6m0l5Vfg634kpS6gu15CVwplIGc98=;
	b=zTDq8LGP+I4p4QIu0TZoFfOpOuh5nI75QGdYBEmuhaLQedLOjNRBIvRG4162elpWPhim
	 e3ItwbKfMaJ2Q/yTtbEzBPgtxkUIs+otKPbzaqRbaw6f/douk4sUWC1mghxQGXHmUJM6A
	 vCv+5XJjefCFGuVs4JeVfeYSAuSghOl0gnzbLaNmJQIQXvJ9hMFt7Kd896LaQtgBPODGi
	 3qnWumclhsAZwEEBK3r/sgxPt2rLKiVULg7f6GIFqFqhDQNIDHb/128vf2gAUbh6gOnjX
	 tTnn7E7KzSagKmUrPmXq3X+lYLXom9OcH+1OIvx8xgJPDr8ccglpQKgnqU7JZVrDcaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Dm/rrgvG";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z4eqyKI1;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84A3606A328
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 10:16:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C84A3606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dm/rrgvG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z4eqyKI1
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tQbX406607
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 10:16:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sNLRvc7OS9U73u6m0l5Vfg634kpS6gu15CVwplIGc98=; b=Dm/rrgvGMH4DSLSF
	Nlir3zx3307J6xCw3fCd9n1NIa/n+sLVK18mfBvjQQ12WDY1TY8woRYsmKtFANu8
	7MRIZ4Tz65xAnOlFyf+eArVvFLG5fkuTUe4jRioo5pT653Gka47VkWXjzJ+cr9n/
	6cX/wN991s4mWBns3uQmTzajy4nkPOHEFbngA49gNM7HiLmf6kmbm4tlvWVRFeq5
	isxxeI+cppMuKbblwHKSfp+/d6XVRIXD5BPs1UL0Uy8KOVadfVvpqJEggA+H1XFV
	2IFhLuH8yFyPdQ4boXhOd0hJxgIQtb5AxMxhmhOFXJ7C7gwKkP3RfNZ2KAPdj9SP
	4H+jkQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrm9v1037-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 10:16:20 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36de26cb4b3so1143247eec.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 02:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793873779; x=1794478579; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sNLRvc7OS9U73u6m0l5Vfg634kpS6gu15CVwplIGc98=;
        b=Z4eqyKI16WMdHBK+yTWODvEPO1h+SWvk486TWVpAZThIaspsmqsGE4Y+VwkxDdFsQZ
         byDiwXP8J1DIpSCIYPBdL9+/bOHKA/b4khWSNiU5w6LCoeKUil6EqH/QYd5aK5X9aeMr
         LahqLzIys9MJPp5rKIXNHbLz73Ker02any6MLonZKXzUzeFtPVUiGBnrWu0upmsPFsB0
         GfpiN6HAFqmLCoBdVMDym7UcmDnqwiGvUezX5sECb1tqtx8EWkcrJf/8A8RX4Vy2CxWn
         dG4qsy0nDNfTh2bel3wIR7iOeV+Fzg8PkhViXuMGG0s42/tZKwfkQm0Ns7QvoL7M5zz6
         IUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873779; x=1794478579;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sNLRvc7OS9U73u6m0l5Vfg634kpS6gu15CVwplIGc98=;
        b=kDHTUo0tbgSQfveR6lHrSarocuTnsFTGpxVo+t8BW9wCyQKisiInteNc1NDUhaaZrN
         qe00XTPp4LxG0oKzRMt1jUgyPpknycGGh0SNBeO4Mgnontf154TDG3gHxZmairKNao0b
         bNoJ3+XpSxuSXknYbhabxzqqQtAcUCm2CV6uENvouIWVGdxZ+clrw0VnfXetuEAiuCOe
         LRYSg6dUggC/aRwzCMrqe5GQncpSTkpYXClkoA+Mxhm374iGqpMd0u1Jb2q++lp2THeC
         u9Wv9dwLQFiRZJFcNmoQ9dG3qCJJmiA7O1XB1KNwtWzCrBKqy1pG5yPtOKRjCpGWVA3Q
         czSQ==
X-Forwarded-Encrypted: i=1; AKwUvBysxbzwrCJ1kVmBNwfo9khL5GveIZw34BA4bTQFGtnw04VA6X37uU1uweOahtGwvWHTSO45Lty4DVDr@vger.kernel.org
X-Gm-Message-State: APuU4Z/w834JL27yMIy6NdBMSTzDM04HkLbxc/K46c+82kTrtHiG8Ho6
	AUiz8B0QvlwmSOAtwB5/KWIE+7ySrxUMPMig0koH6wsgWXxETuKqurc4S/QTnMPiyQmQADaDi/2
	tjZEFmUdq5RCwoqz/7IfilPnhW2k1/5ElHn7LG1kaAp6vhtB63YMrpNHc/3fCZmv8
X-Gm-Gg: AYBFou1eZqouHXcnZ72f5lDKDcQVjCgz9DHatuyoLFgIhYYV6jmCZrlrGxt06Sdj8FP
	Dlf8+cfYvKGEpUgroiNTdaT8GYn/0Ei7N2QT7ywgByUWtZBAYWgT+BVA5Pqh0DBhnc8nWAdfYga
	0lY1VKd2EiCbmSdMcQ3AxMcT1jtZGX0um4QlKCPdhHvqj5ymH1lm33GbbkQ4EcycBbRB4h/ROfi
	pfOlEcH6/j1HyXMgnwiG8y1GhHPXJa/c8CUo6cekpnC1vv4H42ISPWLm6HP0i7W4Ndlu1w2N7Te
	/FRkBMEQpxBaSoaXdM9htXpXoLcuwdA9Ag9Jxg4E1KY+NI7xpc1VpLWEPCjma45CwUwTX74D+4K
	iCMABUafoDRMglPdtOQd0p0+X8T6L8hHodlwge+qHpE2S5CNEhrADWvEDo5NvsC91548zvfqOP0
	h/
X-Received: by 2002:a05:7301:1705:b0:36d:1e81:4a6 with SMTP id 5a478bee46e88-36d1e810863mr5355030eec.13.1793873779418;
        Thu, 05 Nov 2026 02:16:19 -0800 (PST)
X-Received: by 2002:a05:7301:1705:b0:36d:1e81:4a6 with SMTP id 5a478bee46e88-36d1e810863mr5354978eec.13.1793873778588;
        Thu, 05 Nov 2026 02:16:18 -0800 (PST)
Received: from [10.217.217.199] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38fa273sm17792403eec.16.2026.11.05.02.16.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 02:16:18 -0800 (PST)
Message-ID: <e07bf018-9a3b-4b2c-aa2d-32bb3a8db60d@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 15:46:09 +0530
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
Subject: Re: [PATCH v2 01/12] dt-bindings: clock: qcom: Add bindings for PDM
 GP_MN clock divider
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran
 <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
 <20261026-b4-pdm_clk_gp_mnd_v2-v2-1-ff8e4bc8d567@oss.qualcomm.com>
 <5ekc5ibn66mc7gubh2n7htv3u64zomvfopsjnddanzayenxnpv@nczbef2enjfr>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <5ekc5ibn66mc7gubh2n7htv3u64zomvfopsjnddanzayenxnpv@nczbef2enjfr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MCBTYWx0ZWRfX3MIhoXTUVpuX
 L9pJqxYvGRvwfV7S4pZI/bd/NgsTveqlG1abG2W17Uu0ISd2UBBm1pDPB6htr9+UJ92uSZTaOak
 ikuO0eus55EHfTVBkmFCoQ4xJ1eedTE=
X-Authority-Analysis: v=2.4 cv=KrHYSmWN c=1 sm=1 tr=0 ts=6aec5774 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=D307_pyVuiG9t-qGCPMA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MCBTYWx0ZWRfX818f/FMnf7KZ
 KCgbypUxLns8brTOjwhXloamMEt4PpZzC/u6LEhEw0nX6PRA9SWtbz7fq1I9jnNFTyWWSkGTfGA
 dwtSUhaVNvEMDnHlQW1jpAJLzkDZjftBGYAy/qLI95brkHZSmhcEFn2k856ZM2svJ9yVl9gd4Zh
 bWW+3HO7LpCd8L7DvcSZ5Q0F3hRYqAaA9Rdx4TpEGOTxcZGCMH2/vXhHjSvwD8Z6tJIKmWx5+hi
 9h9hsYJy6osuk7Edb9Zc+8YYGNiiNXOGSqoJnxbrIVoEczQJj4L9S0f+D8T4ocJsI5H4bTe6p1h
 mkvkvBSJyvDjhW6UM9lh6Bc4vZ9VMu62DHHXVYKFFlYrIzhJWNONqj95/qNTNrkc4DvvWJmXVpe
 JQ7A8gR/1iB7ymmn5HowxLJTfbgDV+taquc7F/Z7zfOU1NM5uhTxg1qKc0b3y2b+QT+QT1hXDPM
 sTuwpBV6RNCAX/v3olg==
X-Proofpoint-GUID: dXfiCQufXlU2XmuZpfhFmJWJxnc5dfgR
X-Proofpoint-ORIG-GUID: dXfiCQufXlU2XmuZpfhFmJWJxnc5dfgR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050040



On 11/2/2026 9:24 PM, Dmitry Baryshkov wrote:
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: qcom,sc7280-gp-mnd
> What was the first chip where these registers appeared? Was it present
> on SDM845?


It is available, but we didn't enable or tested the block on SDM845.

-- 
Thanks,
Taniya Das

