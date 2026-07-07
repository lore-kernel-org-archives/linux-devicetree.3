Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F363ED3A3
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 10:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783420163; cv=none; b=YFkWFeAAUByO8ZcHcXs1ANMfJOYBXoR0sWDqciX7NstazUvlyPCHskV5mr+WcHsqI+EE6fbOgjoqieKHry7JEUJDthGNmR/JjnO3HlVXCPU3+t/zPtrc99GHRxHVDgm8CO6ffSgt50xqoyVcC1pex/uZKueKzIktY2sAMWlquyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783420163; c=relaxed/simple;
	bh=NXVfq838yL1A6Lx1rXO1eCI8oNBl6eBKys0tt4+YCoU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nk9GjkI4UfletOo7hzKzTvr4mafTY9lgXLL5tjNyJh079M+dQf4gJICdOU47J0F6p2ua4m1jHqZOp5b8M7oIwYfwYolyKlRUDhboNsbLRLGBzGE8KkDiKtZf8/vuE35A01eq6u6r/rfngG4w0+eJDgfXribsVT2Ta4wYF71nXwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c17X/Qx1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BH11C666; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c17X/Qx1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BH11C666"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667A72mx3471407
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 10:29:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NXVfq838yL1A6Lx1rXO1eCI8oNBl6eBKys0tt4+YCoU=; b=c17X/Qx1U1cRZUF3
	R174hRDHUmVK94ghmlzRRf59exRQqz7y9IJKuOfvrqUDzjXRBhhOR51q92Vh70QV
	+ajztTarFSdhydFANaoLatZoaCtaBCtYtP4/4nZ1FH3PeP8qlYXe3FAW+nAeD55p
	voaOpIzX3Kgd1wv0w2WqqH+2aMAJjQ3Bc25n53tBIdSmjunPPmUGZWQeYgdG9qFw
	0Sa/dxYYwNRREdFQQbMienJbXxN+cYvzE4XrO/EWt3HKDN9ixyAztx18zlhKOFL0
	KKADr7jtqAqH+/ixTyytD0R0DbPXM2Upx8vIFYt96iniCWuMY99DaUCmlJyzAbTf
	VBYSfw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8ye0g2hs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 10:29:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cccfa32670so5986935ad.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 03:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783420155; x=1784024955; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NXVfq838yL1A6Lx1rXO1eCI8oNBl6eBKys0tt4+YCoU=;
        b=BH11C666EoqTuWQVs/FYSbEZxEt+5akabtVC0BnBn00wc9jBnTYq12dFsSpGJQLEbT
         9VImetqBvTEa2msSaRSot2BjCCU4SQY0j7AYwkRk0WEeuZU3yA5C03BTkB2R81uI2gBY
         jYMhi87uOtqzmV3GSZfIVP0/+vqkAwgwXUvF5tH/blIZEutItOJSHHgvpeL+Y5R2fnEM
         dYQCIJiZVCOWzudoDDU4SpdPDg0fMG/joXqU3pTnI7ygofqjs9q4bz4gP4fongiLuVs/
         AdBugPdEwL6XIRsiKDu6Ti096d7uw86xagjLe/WUwNP85DjYzZNstMZWH4R9EvEKGIw4
         ZJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783420155; x=1784024955;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NXVfq838yL1A6Lx1rXO1eCI8oNBl6eBKys0tt4+YCoU=;
        b=ST1F6N8DDvT5g3AxPvYknHoXoahJQit0L89ZxXNICFH859x3Wmw4TRoA3B2T5C27HY
         zLGtkiLl+Du3fs2krmmYTLu4PfPtrmdfVB4x02rkWGqUPIpc7yJP51xabuSY3D38ZlUZ
         RJHknNX8vrtm5Krg7FE7zWdZ7KgphEcEj86fkCSNmyH8WzTKojRwJthEG0Ad7330jT9V
         HtsBJ4wE8h/+Dm5RLOpjawBXK5LBBrweBmZeU0sjNDDrSSHnShtcTsAFL1VXpuCLWnA9
         ZUpF0DLr2/ovA5CmSwUgu2TrFHImYFACM4K/2l/zhYVPc5XgfmhfFpLSKoCR1mZ3b2YC
         ADnw==
X-Forwarded-Encrypted: i=1; AHgh+RqhyNdDXMT/4WGJ5OwnjjiOaD1KlchZt4Lw8NnrU80kRPdy5mTJ6CdJbxMO8RijkbCshl0JLHcHODqu@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5ujun86KbL6CAgjDVQCcJPi13VQlMIGxXrxvau1aONeJSJBZP
	HXStmTlyLzBvVtaOVy3rh6uTdircMeGrE66BzNyqD6zdR3d2OufkD9jnQC+eFwRv5NuiexEqYxN
	qjWEwuN2xokbfwcRd8bDWH+a6vaE+BmK7R+H5S7sQ9c8PRxZYUnMGVmlK0kb70kla
X-Gm-Gg: AfdE7cncSGLXMvpnOnHEwtqB1p38mZSTZlu1MTrwTu2k9JfdXFJjnAraiV+uqC4U6c8
	L+CriFwoh/Zl9NSDDkXCHMQypuJgOYwCc4gIUxtZ3wm/Z6JkVTpC3GT9vTCqtz3CuM4WOlY1Gs0
	4QN/x8vCMQ8OeV1ybM78fgpZ3yjzv2iv65yg3/I8JXTsqLEfIKUbFYQpCWxQbG3BItzoJYn/mzb
	v37XKGHdekIJkzVhX5w7bV2umTWvXYaXF9LJ0Yt8ij8mczg+svhbljXM8GYmfgsBR+gZP5mIgTO
	JagXQ66h8GbFPfAF30S41Gi43feeDSbltnXkUm0rYv7nVfppPB0exWIgkjKEylcxGQWCDtK0OWW
	MKu5IuUrv/AFX/V4WTe0h2hx7bge2Cwd9C91/wqgfGXui
X-Received: by 2002:a17:902:d4cf:b0:2c9:b480:f5d0 with SMTP id d9443c01a7336-2ccbf053e65mr47341135ad.39.1783420155025;
        Tue, 07 Jul 2026 03:29:15 -0700 (PDT)
X-Received: by 2002:a17:902:d4cf:b0:2c9:b480:f5d0 with SMTP id d9443c01a7336-2ccbf053e65mr47340995ad.39.1783420154594;
        Tue, 07 Jul 2026 03:29:14 -0700 (PDT)
Received: from [10.92.203.183] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e28fsm9213955ad.43.2026.07.07.03.29.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 03:29:14 -0700 (PDT)
Message-ID: <95e256bd-191f-40df-96b4-6cff38473c5b@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 15:59:09 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Add PCIe PHY and controller
 nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260610-eliza_dt-v1-1-7bb72b75fc5b@oss.qualcomm.com>
 <rnwgxeuz6t6cpbcrmcggqtzsfjnur6kmkttgymp6cbglzjva5v@q4cyoq62p3yp>
 <a8a2c394-666c-4294-9eb1-911564a32fc7@oss.qualcomm.com>
 <toeqm5cizcnlevonbhpui6277fffqgnio3vjsfwjbl2v2pa4gh@63xby7l2zjzr>
 <9448e854-d64f-4316-8fdd-4e1e3dcc9ce0@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <9448e854-d64f-4316-8fdd-4e1e3dcc9ce0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fPf65qcjv9B5pJntr8DJcOS9tyygLQmS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEwMCBTYWx0ZWRfXyV7IP9Ic/zeL
 YxYV8m0/fsxXre2n0H34lsPZJ/lJ1sGW7trWA1lZuArXRjnPwuBi7tWHyIlHi2NCj8FXw4SuyS5
 q1zdX05BcpJqwfBtWpIFN2MoY5YZ+us=
X-Authority-Analysis: v=2.4 cv=SZfHsPRu c=1 sm=1 tr=0 ts=6a4cd4fb cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=qQ0QJl8GeCU3ww7rcdMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: fPf65qcjv9B5pJntr8DJcOS9tyygLQmS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEwMCBTYWx0ZWRfX1sk+Lps7nCmM
 XMzXZTyH/va4y5yTqdTyGqPtUrEdpFwaLUj3YYMpn7wdtlKQeeMJi3ZWrujk9yZwmWljO63//lQ
 fZZfLl0oJ3idNHjl2vYxe2FjTv+3pM0NKx8aV6sfXkNXkgygNpH6Ghf+qzxeisytlPLykshjYRu
 fAKZJpKQVLYWG4bbFYRiM1wmVy2hpql9hrD/A+zKrd8tR1WT5L+QFbBWfgkxett1vqp0mG9DxeV
 5RhddCqwcUfi6rYF+6hX9PTller60mRN/XV2IWB+XIUmxubWqnKQc6osSpIQPfeFqjyx3A2Cbl4
 acx/5RzgIpdqf47/TETBmt/+YTzYbrSp0SzRTgt0BeQsYBMHMsdXP0WVIONZGaH/rzr314OoWhh
 1Z+iKRczt1H+G7SaBMZcsyYhmpVDij2FuD6yfgkY9v4IJv4OxTFd1ZE0m8f34MLe/3tynfikyWr
 I7tfLXYk1jh8PXOGCbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070100



On 7/7/2026 3:55 PM, Konrad Dybcio wrote:
> On 6/26/26 5:15 PM, Abel Vesa wrote:
>> On 26-06-26 09:46:03, Krishna Chaitanya Chundru wrote:
>>>
>>> On 6/25/2026 3:42 PM, Abel Vesa wrote:
>>>> On 26-06-10 17:40:09, Krishna Chaitanya Chundru wrote:
>>>>> Eliza supports two PCIe instances: one 8GT/s x1 (PCIe0) and one 8GT/s x2
>>>>> (PCIe1). Add PCIe controller and PHY nodes for both instances, and update
>>>>> the GCC clock references to use the newly added PHY nodes instead of
>>>>> placeholder zeros.
>>>>>
>>>>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>>>> ---
> [...]
>
>>>> No pinctrl states?
>>> As we are adding perst & wake gpio's in board specific file, it is better to
>>> add the pincntrl also
>>> there only.
>> I'll let Bjorn and Konrad reply, but most of the sm8*50.dtsi have
>> them. Though some of the newer platforms moved them in the board dts.
> Some folks argue (I believe purely ideologically) that the pin states
> should be defined in the board DTSI, but I don't think we have a single
> example of non-default routing in the many many years of linux-arm-msm,
> so I think the reasonable decision is to keep them in the SoC DTSI.
ack. I will re-spin 

- Krishna Chaitanya.
>
> Konrad

