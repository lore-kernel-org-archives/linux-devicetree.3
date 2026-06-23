Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CFE3D3CE5
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 11:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782214928; cv=none; b=QWBQlOYOh62lsi9SrmigctstZKT4hj1NDODPe5Zkk+hTv6MTnpp1wri/XW0iJ2l63j6H5RBiQuqUZRoVhDe6F5bKtqMPF+9cAYWRG+KshRR2EKS+TBOCozAAqXNHXZwLdLaIK7fecFrc1Q6f8ROCCdwV7jGA3KxdL+L5kUMahVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782214928; c=relaxed/simple;
	bh=QAG15DDUb74k6M2l7iVsr//S3EiTDofYdPkIxWz6ULY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MkIT2OP8/pzJAHWxeCCbXEDH/Ubz75uhPQnGVSjy92ljEqKEs6rGIKY7GaLy+OAC8ClTdA3GxCifubNnSb3TUPBZLSzGzGFqTD0x27cWUgTo/h85ifyd+xOwxPC0lrR/TR9rP5jFu88hrXhMXGXPGH3U5bQLu7hrqdqGYXMga6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZhD3AiLq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gKzC7ufs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZhD3AiLq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gKzC7ufs"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZkRU4052866
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 11:42:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KlOY27h74B9C0OQgS9UR6AmQvHUAxUl69cLfO8t03XQ=; b=ZhD3AiLqbzO6YbxF
	l6JStl/bhIhj0RVzchSJ+KLQRxM6igUwFLuGIvi/gMqdTxL5CdaL3fTP8LzXmE6j
	5acgPlPIAx+khbCoSgHfT1NCPUTDR2vDIqQHyq9ediqpAokIBH2/qC7CXpt8LCMa
	VSQqo+ujvF9yMP7t8YaPfHWstJIlzOIMDjJwUBc9LYBUsQGZjhR6D6EfVfd/UjZD
	7uvog3sHuHwQ1mq6GzqpaFHK3c+eSRNa4c1DnTB46KSRJM2qFvmb0hX5Fmh4Igz6
	m6pSBS/2FZUvBm/0dQnfaCy27i7jRLOBYtgosXmdX0wmOTg4fTk1eJcdq0vTJED1
	GpcotQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr9yr93m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 11:42:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9203d077d77so732736185a.2
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 04:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782214926; x=1782819726; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KlOY27h74B9C0OQgS9UR6AmQvHUAxUl69cLfO8t03XQ=;
        b=gKzC7ufsnk57Lgovzg97MISElvyUqzRP46E/TYRECrKianC0gRjFObyBsO2Mz1D9KF
         JA0bYC4CxcSaspPW6AS1pu/4FzNakG7V3XLVglDXiPPSnYtAUkRWranB+RFH0NG4OzFN
         nS9WWvMRksm6Qp1IRamZnlb9FSlgXyF8XpXnRwiwMyP/4vATu9p3vkqn8wkNANVvBKrA
         fgJIHOMdAdNQbbd+gWz/64FEof3goZ4go2NwU6JsWb2LGajpispfwtcBC7OlbwmI9C/1
         o9Zh1nkOSNtcb7l9YcF/gVjFU/XnBBJFeQMaB70PrNU1om6/4/F34vAShjaCtEplr/sz
         DIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782214926; x=1782819726;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KlOY27h74B9C0OQgS9UR6AmQvHUAxUl69cLfO8t03XQ=;
        b=XO9hAxXmQ6p2w8HQujwmwfIOQx0ZDdiVs3SvxDJywO4XipfI7I84UTckP6PMHf0lOo
         mAVBALbg+dubQWIG7z8S2cfn3r+nFsLa/WlGs6BhfJigeO6E0071GIs0iLKnY48J3P1C
         keNIbTKOaL7M0YrDxSRUmhl1ZhrwetPFjAbE5XHSwawMmST0jK7LEYALhjQqCgLmHbGr
         BVbiDDeYfRuNXqOei35jTuDG4aI/Mfmkr7w+kL7PPGpJDtjPiC58/1Y8BS+lzBome8W3
         G6eh0mzbVQPsiKuip7Ft7Ytu0M6iXJlE4Ta2vuNPjmkonpJrlPsxfaPj5xVhWvXOqfW7
         2/rg==
X-Forwarded-Encrypted: i=1; AFNElJ8w1ho+nesG25IM8Xmju4E6JViKWW2c0kWwCb14nxhMarJfCkhRLqFzIz5CeSekJtrRpo7Q8sqNsdet@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6yPxd2/Jb84nCQ7yH1THc3yMJQErtXoDLpJFTrMr6zhuoyRzD
	JSs1HHQP0KY2Ic3YhHhiNWf+Z2CrI1ZDi8fa3EMSQczX08d8yy8fmmj9QB8GmQlnXeAJDssMmQ4
	PrCuUs9OnXJvnFeU8uXn3UsyU/72pM//Rv41TcjzPVWeCxTziTAYODeqkN9PP8XdM
X-Gm-Gg: AfdE7ckQ2rYJcq5dNU31F5/X3nDjLntBb2De/i8QZWSLdmR8bPRNO5emin0/Ae430eT
	ltxQW9eN+gU7AlJcq2VnztBBoqBLYMHjsKE/DtM0CKywDLM6fgsnhEdjjq9nD6xvhjcE87ZmA+8
	q39WgO6jd59hE8ppU6n2CWfrZjOrMzKs7DKMSrl8PXKzHGDG8Y4AugIXMq3r6QBi0EWlOLL3ccm
	7/DoapPJey4qsI6mUumR8kKHmTvskRVnLNVUAiBLyFmcUhhKu+MvMR2oQ1snYm/zD1ge8Eq6GbX
	Zu/AotOQbvTBjak5np6A80Wbc4HqgQ4i+mnHzvM+HP+jOFqtcHq+wXN8VctHFZt5UgzF3lXa74E
	4jz4PBHtkZIpI/XMYESboqcTyM9/w/7H6y9+h6pZx
X-Received: by 2002:a05:620a:468a:b0:91c:ac0a:690b with SMTP id af79cd13be357-9208fa25179mr2976645785a.17.1782214925746;
        Tue, 23 Jun 2026 04:42:05 -0700 (PDT)
X-Received: by 2002:a05:620a:468a:b0:91c:ac0a:690b with SMTP id af79cd13be357-9208fa25179mr2976639885a.17.1782214925195;
        Tue, 23 Jun 2026 04:42:05 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.218.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666788282sm51702639f8f.17.2026.06.23.04.42.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 04:42:04 -0700 (PDT)
Message-ID: <6ad8d604-b04e-4f24-b616-980f0e18b4c5@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 13:42:02 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Fix disp_cc_mdss_mdp_clk_src RCG
 stall on Eliza EVK
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260623112755.317180-2-krzysztof.kozlowski@oss.qualcomm.com>
 <de941d2d-df5d-44b6-b95a-437e35917cd5@oss.qualcomm.com>
 <be95b95b-dbcb-4b80-94dd-a7e97ef4c446@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <be95b95b-dbcb-4b80-94dd-a7e97ef4c446@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JYSMa0KV c=1 sm=1 tr=0 ts=6a3a710e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=qMZSjPy+XpteAuilWfML4g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mu5b_UQrn1g3QmYy6j0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: V3MHC_ACuqxMVPHV1x3wrbL3D728zbNJ
X-Proofpoint-ORIG-GUID: V3MHC_ACuqxMVPHV1x3wrbL3D728zbNJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5NCBTYWx0ZWRfX52sq/Jv2L8cT
 E+8L8jk/FDlYjfrvJ2cviXHE/a7OQbA9R9WpSpwKySaILUAYbXZxtWKR/vOOjzeXLG6OirImyRW
 zy3QHTRfWyVJ/qAlrgF8qJJSMx42VI6PfebS9xxbkOP17Z4PEPg1A16jLDnZThZgbXiyLR1ZPJF
 siQHc9wY0GTWd0kOCMHsnSV8shigyq/jLDrhBuCX7AbWCe479NSmeA1/rRVF47P/f8bAAdzoUZR
 CObS/nkSwBbkz23WyX3Ibnw3K1uecIXhXMPm5SpgZJg4iP/UjswM2Fld0SEy28fR9V8HFlhnOM7
 pyVEBJWzByQq2fhxqUZ+u0zCJTupz4uapHrl4Hf9qPQGaTY+XB0DcFnyvH/GrICFnDcIoUOhFRX
 hlRnbN3bHUEMiSSQZmfqbMUNvOSv0Ctgkl0MZq0/HUuC3LS9YJvAlOfnS5F1vUD1SnVGbWLd595
 zcTlHgBcxCLO74Wc6ug==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5NCBTYWx0ZWRfXwG9Mvfkq2bZe
 PfviS75w1skLvSSW5twDdmmNfcdh/HEW8SKcUtU+Mcf+oE1Al25TyjCbt+3zKa4zb72hFtZNdC7
 2LzimMKz7XQUweLbfB7fAk6GmfM3Mbg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230094

On 23/06/2026 13:38, Konrad Dybcio wrote:
> On 6/23/26 1:31 PM, Krzysztof Kozlowski wrote:
>> On 23/06/2026 13:27, Krzysztof Kozlowski wrote:
>>> Eliza EVK (eliza-cqs-evk.dts) does not have display enabled, however its
>>> Display Clock Controller is enabled and references parent clocks from
>>> DSI PHYs.  Devices which in base DTSI do not have all required resources
>>> available (e.g. because they are simply disabled), should not be enabled
>>> in the first place.
>>>
>>> Having DISPCC enabled without DSI PHYs causes clock reparenting issues
>>> and warning on Eliza EVK:
>>>
>>>   disp_cc_mdss_mdp_clk_src: rcg didn't update its configuration.
>>>   WARNING: drivers/clk/qcom/clk-rcg2.c:136 at update_config+0xd4/0xe4, CPU#1: udevd/273
>>>   ...
>>>     update_config (drivers/clk/qcom/clk-rcg2.c:136 (discriminator 2)) (P)
>>>     clk_rcg2_shared_disable (drivers/clk/qcom/clk-rcg2.c:1471)
>>>     clk_rcg2_shared_init (drivers/clk/qcom/clk-rcg2.c:1540)
>>>     __clk_register (drivers/clk/clk.c:3959 drivers/clk/clk.c:4368)
>>>     devm_clk_hw_register (drivers/clk/clk.c:4448 (discriminator 1) drivers/clk/clk.c:4672 (discriminator 1))
>>>     devm_clk_register_regmap (drivers/clk/qcom/clk-regmap.c:104)
>>>     qcom_cc_really_probe (drivers/clk/qcom/common.c:418)
>>>     qcom_cc_probe (drivers/clk/qcom/common.c:445)
>>>     disp_cc_eliza_probe (dispcc-eliza.c:?) dispcc_eliza
>>>     platform_probe (drivers/base/platform.c:1432)
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 4 ++++
>>>  arch/arm64/boot/dts/qcom/eliza.dtsi    | 1 +
>>>  2 files changed, 5 insertions(+)
>>
>>
>> I should call it RFC, because this feels like a band-aid and should be
>> fixed in clock drivers maybe. Eventually DISPCC should be enabled on
>> Eliza EVK for HDMI, but DSI PHY will stay disabled.
> 
> I'd say all of that hardware should be kept enabled, if only to
> make sure that it's parked safely
> 

You mean enable DSI PHY, even though there is nothing attached?

My warning probably can be fixed same way as:
https://lore.kernel.org/all/20260622-sm8450-qol-v1-1-37e2ee8df9da@proton.me/


Best regards,
Krzysztof
