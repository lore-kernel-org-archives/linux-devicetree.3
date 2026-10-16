Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F229D4DDB5C
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 14:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161896; cv=none; b=tNJGlEE9vHzsr6rtcBgtCMUIdUjTsiIT2UOMMMgnpqu0ga5UZoZBWjyGuLNczUkTi0NFfGk/Sv2M73TRAK2DUPlhk2rXZVbUhenuNg/puHwy5e47zkJxRf398Uk3UHiHk82Ha3QX8vIzPAlbKCGzPPmSxPpPLZkytAuyC2pyTB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161896; c=relaxed/simple;
	bh=OGC3IYwILLkT+uEr6oJ215xWaR18kxfFl9HJvcg4MwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bDkfVw/Cxu7ZiVjZKSG5doTXuSz2eMqi7GjDM2lrpNOl5oTBIUECmOc8i66jY/WFJl+rGVAe2eINNkdlwfxd+PfcjL7aIaxTWSW2qJdrohKph7dlILTDPLvevc+oSHUdO2paIrdHt/fmNFre7SQuifww2uHo4rRSk2KZMu3/I2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J1+nN9Oa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NpXfnuzu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J1+nN9Oa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NpXfnuzu"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE5h2E3506081
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 14:44:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gREwBdjjGcEQUAz+C6L2Ma1LTmDk/ySKUCabLFICV/Y=; b=J1+nN9OaVp8yKhKw
	US+sTmJiW9iKBlHLVmyDlgp+bO/AThZe/4zvrb7yX4C3mOBwCsqBGs5ZrzjZdryt
	Zbmpj45oQvsN53hNRpuhJlqDhfbGE+blL/b4+FW8/RqwcyPG808BWxGat0I8KEi6
	qD8+rOeHY/ihlJ38Dl42O/JtEqcOL8oAtzRXTPyOYPa+Cj4TcHNxH+eZ+IuZv9PQ
	vNhylw7PetmsZ2HiG2M6XL94XzMauiWBoz4FjcxkkPFvim4FwGVqt+0E4xHganIC
	75elFWsrLNYKu2Jn0tp7GqkyALCiNDoi3pZ4mf1OTd05kdk9YPk3qwLYxhvdDJhF
	H++XmA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8r131tg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 14:44:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92eebb130dcso343785a.1
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 07:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792161893; x=1792766693; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gREwBdjjGcEQUAz+C6L2Ma1LTmDk/ySKUCabLFICV/Y=;
        b=NpXfnuzuha7FL4R1462b7+gUUhCFpLXFC7RLw+XK5NeEIFa36IbsSur8134L8dzvqF
         96u/Eqy7qsJMGQn9nm3V7PWZfTKJwZCo2zR/t78dK34y35FlKio36FLVDJ5KXC0idxF7
         JLRiy5zqb8LJXaVugJ42Kcp1LiwtLpAE3FBswZTD4pjoUNOC0xLnEjjtAklN67ZeUQ3N
         KT6gfWtmGW4Hive2r0xHspJWxKNS7n6RjmsQg3dDOxNhbBxP4Xof/B+a3n1i1avpqPqu
         orcD6+kcZOv6zG2pl5+lWHpjWkJBa7lf2cOJpdo7kYgOaptMTCqbp1Nr9mGiOSGj7paX
         5law==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161893; x=1792766693;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gREwBdjjGcEQUAz+C6L2Ma1LTmDk/ySKUCabLFICV/Y=;
        b=x8YLfkfXIdGRYyIsKQ1rMgkblk2nmxy4ei/jl4x1bXPp8OcNFqqSUx2rkQV2ySNqe+
         ZTo2Y9JE/XzRpSdrsaJI/JepakKyDJ/RBFokZ1aEsw3CV8wHmuAHGraWq2kGHYyh1lGs
         KZ7ODQVIiwHlGwnCPD6asEDkpGPEZsq9ez/qHCUvHVP3VVk2TJqMKMbQOEI0C7/zxI2s
         epGAWVegg9yXlK+wHaotCXBok85W1XoqoQzigluZnfeQKHGWV6Esdwyq1/xmYppeaUdn
         NHpBxFWh3Zbv0SHuD6Zo9aSEMUChnpC8Fb525X4w6XdvYq5jzwgnhgkQ7UDUIsAY5Bvp
         FEmQ==
X-Forwarded-Encrypted: i=1; AKwUvBzChYaSZCv6khLPPcHyz1Hx+KY7bED6xkbTIhl516k//BrdCekWFN6Fz5XjW06cnDv13xTijFq6ccGc@vger.kernel.org
X-Gm-Message-State: AFq9FYLSpML0HtFJ0XBxOnCt78sStJN9G9wGG+r7XnEZaST+xLwiQdb6
	sU8oIeOsk5NOerTfS5RhZl3p0VG/ji09oG7ihgCvhMLYRSqqP3Cj8+N1FeIFUvZZoGtBoJb19F2
	V75D/RvZWgDAkl3kBL00kSI52iDOG+Ays+x4zNXAbGeVDdz4nGqMTdBIKK8RYhGbs
X-Gm-Gg: AYBFou2V6MiVcDVjfWbGvBTQdYK4PUTd5vR3mieqj091iFDorcdTjiT41ZLddqxw2//
	BtPfVC1Aw5CH3NfT4DU1djQwwq+4lSx3TU5gCgy6f5aVQ74eMekPPEOqdA7YuTbdjprfK53uxtJ
	1+wQKD7vs0lPPmxhsjxgfA2r80NNyl1bOhSlgqwjW4CNJH6Dx4qQ0of4Ide1vIYKYzmAjoa2UHf
	Rkp2YQRQZj7fCQekySrePajljO3gcXpBAF/Ymoae/xD0D8GrdNN8tvfbqU9ZO/KwMW1I3n2DGvQ
	mZ0oPabRM3gkDGoYe3C4qwc2NxDjamsrqLhT1+4oo4eyDs2yZJQUr5j6E+DmDbMgiNPP4tsUCix
	FSV9xM+5RRHi2+MXv6YR/2A==
X-Received: by 2002:a05:620a:4624:b0:93e:70cd:e420 with SMTP id af79cd13be357-93f29d54268mr3743485a.5.1792161893017;
        Fri, 16 Oct 2026 07:44:53 -0700 (PDT)
X-Received: by 2002:a05:620a:4624:b0:93e:70cd:e420 with SMTP id af79cd13be357-93f29d54268mr3739485a.5.1792161892511;
        Fri, 16 Oct 2026 07:44:52 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1337d2sm1009944a12.1.2026.10.16.07.44.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 07:44:51 -0700 (PDT)
Message-ID: <ae1c2f22-f753-4d42-9abb-642d8a135305@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 16:44:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 35/38] arm: dts: qcom: msm8974: Add newline between
 subnodes
To: Waqar Hameed <waqar.hameed@axis.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, kernel@axis.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <fba7a99d988200d102d88c7f644ea8cef7047d65.1790892852.git.waqar.hameed@axis.com>
 <8b22f94f-4091-46cd-aa4d-d45c05aad13a@oss.qualcomm.com>
 <pnd7bjhn33e.a.out@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <pnd7bjhn33e.a.out@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RC6dV_4oYk_d826vMT5XXySDCwhSYbam
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1OCBTYWx0ZWRfX7eJdimjAR/mP
 EAWFkh7JUcvmWXC4/I/9lew0QdM/1dXQC0VBLgEhZsFdGepaeVeEv/+gK+1Y1rGpxHwpaGSGmLf
 yI6FVrszOo9AYAt6w3YHkKdrXTc3oVk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1OCBTYWx0ZWRfXxxmYOUgFckG3
 Y125raXYAActK9WATbFLa5TfV1XCDvsjc27VxkqHUcWKSd0MQ4dEC4Gbu4og2tDIpoLyUfCRI//
 MT/8k8vsNOMa1Ls2f6zrXPrhdCeAfCKFgQu7dN74CRJa9zbkwSdzxfX9S9juCVzpBP0bpBTU9wR
 txWZSGCOVq5l/5oSDBV3b8VJGuZXsuvjpHpYwQNJ3/x2ltHUKSSuNbSGQQK5SnfgULYLU7IM+Sv
 4HZgQ5+GzKjx3NecTlCRb/Trh1Wkg2BtVl9cYpjsVHKAKBXDj/vUkiypJChqjB72bLrHpQt7Lga
 4c47z7/spTlMcisWd1pMQoprUmlwa4JiwA1EkD78ORMw3226XpBsC9lPGnahSNs1qpzmmuxinH9
 JBkCF34+mpoQePKZ8BNGRlNuWcPDeOFp+IJ/xYfQM8+27WeOnVdvgsUwEVC5h6aGKZRTSb6JwVA
 mR5JpB9vB94PQBP92qw==
X-Proofpoint-GUID: RC6dV_4oYk_d826vMT5XXySDCwhSYbam
X-Authority-Analysis: v=2.4 cv=L/CI0OT8 c=1 sm=1 tr=0 ts=6ad23866 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ORyyYoCyCzIJxacVLkIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160058

On 10/16/26 4:15 PM, Waqar Hameed wrote:
> On Mon, Oct 12, 2026 at 17:51 +0200 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>> On 10/2/26 12:36 AM, Waqar Hameed wrote:
> 
> [...]
> 
>>>  arch/arm/boot/dts/qcom/qcom-msm8974.dtsi | 12 ++++++++++++
>>>  1 file changed, 12 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
>>> index 4c2730b34cd1d..1a2f0cc9f8a03 100644
>>> --- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
>>> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
>>> @@ -960,6 +960,7 @@ replicator_out0: endpoint {
>>>  						remote-endpoint = <&etr_in>;
>>>  					};
>>>  				};
>>> +
>>>  				port@1 {
>>>  					reg = <1>;
>>>  					replicator_out1: endpoint {
>>
>> P.S. ^^ we should also have a \n between the last property and the
>> following subnode
> 
> From `Documentation/devicetree/bindings/dts-coding-style.rst` I read
> 
>   8. Child nodes, where each node is preceded with a blank line
> 
> I guess that also applies to the first subnode after the properties
> then, as you say? If so, let's update dtfmt to add a blank line there as
> well then. Thanks for pointing that out Konrad!
Yeah, thanks!

Konrad
