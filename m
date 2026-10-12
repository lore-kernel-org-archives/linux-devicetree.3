Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB1B4A43EB
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820308; cv=none; b=j740Zo1QxnkxmATB3pMG9P8c2fLYixil4sVQocmOgfGtymoHZ1ZFtRu9Pg4HKKq/QahMeYRks4gAhaw12VPhQvJAxAPxmhmsngXhSuxWqcnv5aKz+Mz0lBWOdmjOemKvbhiSaJhHx2+VN4ETTMOpH6heRScDnt+eaBriAzT8euI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820308; c=relaxed/simple;
	bh=fTnw0g7gx5Aw2Y5mxm9ltk+r5VwLNvbSYXJynxSDXak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TDWoLJScerSPGVY9bmhBNf+dvrZeV+1Ip+e3s7qVnznNasfgAKzelWxyrJjnnqt0vOr53RL1PftftmV9eZEsJiiBMF0+Bjw4KKc+ZsOqJY5tIuuf27wGmcUZq8S36hKKHbmAE2sm8JgTCuaGUBsyGh0YCHSC5r0wxwas22QiRLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jbiPvxCn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fgA6jY9E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jbiPvxCn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fgA6jY9E"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFfY4B2768494
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:51:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qS6AZ4+ULj8E4qmw5derPFvpwNN8WBKWDU4Fh7Or1Hk=; b=jbiPvxCnQb5m35UD
	vCGNHveyraG9lxzNplHqRUI0xDbEy4r93Nzq5bkcPsUnrWBGG7oUIIHCDHdfOITl
	rGYjqi/30R5Pd4S+fSAkMB2gJyKqooMdKlaS37aZsrdAnD6GyR9cWKRr1GoRvlX/
	wOT5mizpWQ9Mi6/vJARGByALyiceTg6+d8U1P+i5sBHs4SIRguT+TzTvVx7uAkZp
	K6Q2ycxl5rSgaeCeg8BSe073U0fJt2Ue+XlG9LmJl55w3pXwAYIsca4MQkvEOAE8
	vG9WIHLmENNsQVg7UMWUWyesrDlgHydOzpir2zqvk+urbdidGHDgc3uhF6lZDVzd
	ADSNyg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8udq25hg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:51:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ea6b66e53so28521285a.2
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791820306; x=1792425106; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qS6AZ4+ULj8E4qmw5derPFvpwNN8WBKWDU4Fh7Or1Hk=;
        b=fgA6jY9EvsdhKbpgr6CAxMLBQMHGE5WlU2cRMp0oBniNHCmHBMxvTiNjD56mpg1zSP
         Bztj3GqpNOQjVeCSnd25nWy5GSyZMNUpZwuq8Oe3WbtJ1zvLpXarYLjn6tgnNPnlleBR
         A9rr5tJwmBqh3A6oyqnigG0hbz+hXMY7sbU0cGHxLktHeylqf36gpXqZZgEzq32iEjNC
         2/AxmdB8MTbkK66vD/+i98sWwl6vlcSyR9v/1USwIL8D/mtgZkldb9DsLPBA7KAxCEfV
         fgsx/J9vieV56OA/W/mvy22dpNdju4Kaoe0rgKaDfrVV8bPrWqS014OrPOn9AcbSHQK8
         6S3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791820306; x=1792425106;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qS6AZ4+ULj8E4qmw5derPFvpwNN8WBKWDU4Fh7Or1Hk=;
        b=G4jq5dimsgv2yvqwefNbot0sJu17odp1/n0vcCjE8T2jU8GWrR/SpRsSXnQC4PKwT4
         YRBa1EEn9vmRPTv0q6ZwwTzZjNHXZgA8XtCaELDe20UyhlGvjFzuvnPiCDHJJhv4iFk7
         sbi91Bg4G5VmsaqyTyajmXoiAkns5EWsWt+EMwsUPXKS+P34wokqWD9MWOfPbYMumD8M
         32EjzXD6UbEMwAjPdCSJ+yLFxoPs6SU8hTOmLyxpWtHyvqqSIyQfcKvxhpTNqNEtCqjw
         FEmFoSRXcVUfBrJog2fWTmVWYHLRrwOpmoSMRmlEEIpqUZkg8LBiLQ0jUPQFwtgD2y+w
         jEyw==
X-Forwarded-Encrypted: i=1; AKwUvBxOZXxKFV+UWN7Xqm8Aq5RszYD1z4fVrEtrdmWlBdF1aIPDeBPqbBtAFld9gQiesit5EeWqLXMPP015@vger.kernel.org
X-Gm-Message-State: AFq9FYKKvATwsoN1E4oZSAZGQeMizuXTKPMbXRexDNZIE9u6c22pw73i
	+umr8nrKgJk+ahtPDjEQ9u/mWl/cMZGl2jRld9J9uUKohbh1myzbfFrIjItRVdLsggSguh8w24A
	dnIhZvKNe4oQYhxTky9W/XBtYB2WwQhpZxGvh/PBKUMH9sqYN0ebdA+cdKJ01d5Y7o2YXtUKL
X-Gm-Gg: AYBFou1m9GVS+hCfTuczylwHfCHkA1/5ydwZZC9cC03AbyBgHNDq4ZaHAlBfxExSixN
	6F9L1YZZG/KUn8NuanZ9KGywBHYpnTVZpQZZAV3Vwh1HA3HCZfYlLTbXZEQ3ktN0B+VZ0PFM3OQ
	kELe6kxYQLZciAaOvUy9x+vTSvfMdUtrGXnqVcxuqKQIINd207OAopvSreG6IKW4uetvxyY22qP
	VO2ryzBZySLEY9WdMLOWbis6kYlyyFshzTt8IuTpF/WCTt3Wnb2hhUzQdsOgQV9ulj/uOnINFvJ
	tWJXMDaCv7QdXNyqJ1BDuVfsph6XQPSFpXP3HGa/V+15FUHG6+hPTgavn8eI65arZOtXGpr3zKw
	tB/96woig9rHmCc6GxtFPGQ==
X-Received: by 2002:a05:620a:3725:b0:939:94c4:b799 with SMTP id af79cd13be357-93ebd25945cmr1902167185a.5.1791820305555;
        Mon, 12 Oct 2026 08:51:45 -0700 (PDT)
X-Received: by 2002:a05:620a:3725:b0:939:94c4:b799 with SMTP id af79cd13be357-93ebd25945cmr1902160885a.5.1791820304915;
        Mon, 12 Oct 2026 08:51:44 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3498276daasm160389366b.51.2026.10.12.08.51.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:51:44 -0700 (PDT)
Message-ID: <8b22f94f-4091-46cd-aa4d-d45c05aad13a@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:51:42 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 35/38] arm: dts: qcom: msm8974: Add newline between
 subnodes
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <fba7a99d988200d102d88c7f644ea8cef7047d65.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fba7a99d988200d102d88c7f644ea8cef7047d65.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=evJKXYpX c=1 sm=1 tr=0 ts=6acd0212 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=AsWBEyVj_8_gRfwDEGkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX3WNd5IkF1rAl
 ixA5Teuyw0h7wlz4AsDU/rRqzOl5TMF85/AwouGZVFluEoyRj/DL31X97cgyh08T4CcyCdxQ1a6
 2VWxVvBueTFJ8t/D83AL8AZostMFY5c=
X-Proofpoint-GUID: wEPXrQ_pMt5iwy3ZU7lThnQVHl23YGJN
X-Proofpoint-ORIG-GUID: wEPXrQ_pMt5iwy3ZU7lThnQVHl23YGJN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX1AJBxv3uvIao
 EVGDznYeLWpJOqHiQpq3UlRfoobpHOuw4CuN0LPEnsxJDkLJRA9Tzy0YFbE1pZt877EUW4h5b8Q
 C+Rwf34l53pqRkTcTj9JTNXcfiQZvIfUKG65DO/rgjKrDW4ShZT7tst2JOQ0X+pSsUMmb3c5pWH
 AkTZt552zwMt8C+XHa3VK/deW3pKapzPwI3iGnnHoLI+RzdJEB9qaOFYSYBW0FVIyoJHTAl5JYL
 xd/yBzZMJRKO+2HVrjzjgDrqDFlpTCFfCpvpcjA9WZGE/ws0orR3P6/WIZqK5PqnUkayUFYuV+H
 8UTAHIRpKUHnG1w7uAcKyXiOvjGELTkDpttDkxY0S0/Qh39cv8kq49BKBmZsFsZPoCTyne7DOez
 r4OIAtdPNdS66h0k6e67vDf8XjEI+JHdbQl3o+o6XSHR3W4NlbHS0xZPGKsPgIdS5el/SIWUj5U
 jZiKbduFb9XY03inl9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120063

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There should be a newline between subnodes. Found/fixed with
> dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

>  arch/arm/boot/dts/qcom/qcom-msm8974.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> index 4c2730b34cd1d..1a2f0cc9f8a03 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> @@ -960,6 +960,7 @@ replicator_out0: endpoint {
>  						remote-endpoint = <&etr_in>;
>  					};
>  				};
> +
>  				port@1 {
>  					reg = <1>;
>  					replicator_out1: endpoint {

P.S. ^^ we should also have a \n between the last property and the
following subnode

