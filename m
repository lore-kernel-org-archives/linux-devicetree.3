Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E907F3815F8
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 08:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784278230; cv=none; b=bXbGFGSaQZ5II75jBguVocCXUc3Hks4TKfjxJURxOxlqedS8dDPBFuos5zFSH5bJlqwJ2/aJrCJw4X5Fg7BGaPP3kopz7p7jZhTCe7KFZbA12nlhNA/hhRsf4IosPh+sfu9nehvUD+Qm0OCWElfY+syUPyJUu4YdDW+8d+hcFIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784278230; c=relaxed/simple;
	bh=oKGmd9VKITYAgis71P4kQGwc4rXok/tzjeOQCJucBHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s3R+PobEoMLZUWtonaKo2PKLrBbU+mjAfLt6V2AU3GlA95jfDhR6kLsRdsd9kIJ095cG6CIlckk6m9Q4b29m8igtQaFwiDowJfjQy+qUXIG9NHwITHfN8WlO/8MgESLPjbJhcXRJDB4e7/PwIn1gKrptK5n5MUuOE+yHQdxvX5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=meGs3FhD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hme2WIWn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="meGs3FhD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hme2WIWn"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6d85M821253
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 08:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5U3C/GjAzha7ZrtVRpecfP8NcD9XDmgMj/TS9PpZ8Q4=; b=meGs3FhDszga7BLA
	U5tmgAPuL8aaJGrRpyOVZeqV4klE4ljmPghPzo4jFAOXSjJTama2dhuDt9eGBAb4
	k1aPMWKeJADPBzT8W5OXqSVm5zoLONijScDI/Wvc8+736I89g61+FI+qPK4iFETO
	WV9AE5OT3SeSkfsKE7PwoNbTWC+JCwmNtuxpzlur/Viaq7v8ZjfI7LB5SnJ0LeZi
	3dJmmkZMo1+2WADAb1PppwOy7myfF2VY5taDjKaRgKLrDwSu5sJujLgYZAi6Jvko
	ooMJlJIi6L/LSsTjR+ML9Q/f1vSn4H9FZZ9CefUwLL67akgPdCN8PDYuTmN9lbJg
	dniOSw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fffag8f23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 08:50:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c069f73e4so16068901cf.1
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 01:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784278227; x=1784883027; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5U3C/GjAzha7ZrtVRpecfP8NcD9XDmgMj/TS9PpZ8Q4=;
        b=Hme2WIWnaG0MK5adiNwDGrFaimIdjptyODgsjFyMUW2qBkuakbiWMjtQEG0Gl25oJi
         aQH/snNuNOWAsoOnNUu69S11Op7wOUQnxIQXeyRrV1QeEH+XyFvpitrKnEgpuGfBYfnX
         Am8W5lXob/he0Nh/pxtR4APhtgjZqIwTCVPlDan7TSF+6vkVgdsabLHgzjPdQH9T6n/d
         93NiLmews3vQho9DK53laxqHRVgBwZ5ETAk9e6hE1PFpHzpSl34YhWmq3RWzIMiRQPzN
         6zzUQmyX0KdO0hLpdU9t0Z5U16CRcaZMiV22ACAMNyaKk0Cfon3FZNiBX0BNqtgtUtWG
         3WUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784278227; x=1784883027;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5U3C/GjAzha7ZrtVRpecfP8NcD9XDmgMj/TS9PpZ8Q4=;
        b=LTUSALJiLx3FOAEGBGvC2G2JUhVfntaG/MAG2NdlnvViGPG0nsPjUaAU8a8sbqT40c
         U/tLFDizozziLPnKhw/XEYGbvGO67XTe0xUVTrU2JHKkGE9SkRnTY9AYyiWoibw2Hf9+
         UoYJVYvaP/Z7bctf8fMbUhpN5FnB12ABW5yJDJ+vHpeyD1A+C5Fkb5+DCdLUNof1j++W
         6b0ztEQyvxuh5tBVzFEMXM/r2zhmH6NPLhAk2azxaOlyInrigBjs7LUrfbuXX+HZMjmz
         G91dNlmgs6K5PfRUZbmIJpN2V4+BbCeOi3oJp3jnzPIstcFyqAcBQn56twXpYTj/zBvc
         hZ4A==
X-Forwarded-Encrypted: i=1; AHgh+RruyXZYg2O3khX6/EOA4ustXIOuXWZWNMydjSECfEz6YqHMDWXcjk0TUW7sf/c6e83fLp7m3un/6CQW@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0L9eq0MQrUXH4clELVheAfyCDqe/gexZ+2Dwk7xv+Q493c4Wa
	tTwunsJfCW4JNQv4DRiJ+dZoezjBDZp2KHiS1TwoByni2TEFeHZ7DoD5MWMnTkykBvAVPFmzexF
	9Tc7vUjtNoBizpGq6UV7lsNWJOzngcZdOndDGEjkF3T0p/3J6CXG4kPWTgbxaXpcR
X-Gm-Gg: AfdE7ck9Woe/PUJE8phuRyoYyTjuIW/P9Bhy7Va2CZbxLZinHrH7T13lETo84yS+Dns
	3koXyfiBYfHX5NxXafZ8h8krwH907rEKtfzrbIdMQeaqJwphox7/neRrfZbFyS4F3wrCnGL7B/y
	UkYS+7SKKlFTMiNHyNEsm81/bw+A6wAESNyBe1wHIHN+sxrYaWIvVGEI5ylnspuNtCavV9wFFGl
	aR+QnoafTSCXhLbgaqrzFmh/J0an6mm9mySpFrKK156inVbYvnyxfMnQ1MY9dOySMYl7og4qMSu
	/4KaSr18xOS0BU/7hiu8kkmvwDk48311B+peTxOIMMU17IQWVtOrfdgr3PkwLVVOqErLlm8RmCW
	Q1qezb3NanT5RMjUH/O+6jFtB
X-Received: by 2002:a05:622a:9dc:20b0:51c:223:3c57 with SMTP id d75a77b69052e-5213f375aedmr7960371cf.10.1784278227271;
        Fri, 17 Jul 2026 01:50:27 -0700 (PDT)
X-Received: by 2002:a05:622a:9dc:20b0:51c:223:3c57 with SMTP id d75a77b69052e-5213f375aedmr7960061cf.10.1784278226882;
        Fri, 17 Jul 2026 01:50:26 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6eb22107sm357981a12.0.2026.07.17.01.50.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 01:50:24 -0700 (PDT)
Message-ID: <7cc35fc2-9fe7-470a-b068-8b088cf1fbe7@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:50:21 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] arm64: dts: qcom: add SoCCP DT node for Glymur
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260709-glymur-soccp-v6-0-16f70227547d@oss.qualcomm.com>
 <20260709-glymur-soccp-v6-4-16f70227547d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260709-glymur-soccp-v6-4-16f70227547d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NyBTYWx0ZWRfX6qrBh1qUCvvP
 4yXUMtvPKTGb+oBACDGq6eDWReA6zk8lcaeXZLHlSJcyVGhuOfyt5xcx0wjzZHo465IKJUAMU3l
 DXfk2/I+4w4FmMYBQMqgV+W/naRZ3Po1BndxsOugJyctVahRHrANJrSOBJRwMe5kIpIGETRCV39
 gQGtdxF2Jy6YwELVFnFfWh6ChCG4dh8WLqf8dJDE7F+y5BKDsSY9Mujjm20QdPV43h/kIy4e5td
 i2K+U0d7dp8dcPZqo4K6oJx2zcZ/UJh/1fluNUiJhjgNbSz0eHx5AL+GPFWC2nUF2trX8txaFKZ
 1PzzjJM+2qVsc9Aw8/R/zkMHLCfedJfNsCjRSWdZaqOrF92kUmjDdpKWeXDbVfP5JNht0YXwOQI
 tysRX7YRu46HhAi5Ky+Dk8Q6/qXpdyXt40khZ8B51xrlSKP1UWX/B+ndCm9KjSaryY1uVzXBo0a
 GdP/gM6ChP1t3n66xXQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NyBTYWx0ZWRfX4X/aIKlpyD0b
 j1k0hGgN3ZLvlAXjhObA2b8gJqmkBvRdJODRDMzx4/luM4x+Ze7fpHazYOrLGadiDWI+kd5srxf
 5/YCaWFAGW7LHQ4sxU60DTVcIN20k7w=
X-Authority-Analysis: v=2.4 cv=KZfidwYD c=1 sm=1 tr=0 ts=6a59ecd4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=sWIZHQe7GSxdn9xkVP8A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: XGnuOuPQHGDMF6StWbRLvrWbghpCuaRH
X-Proofpoint-ORIG-GUID: XGnuOuPQHGDMF6StWbRLvrWbghpCuaRH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170087

On 7/10/26 8:39 AM, Ananthu C V wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> The SoC Control Processor (SoCCP) is a small RISC-V MCU that controls
> USB Type-C, battery charging, and various other functions on Qualcomm SoCs.
> 
> Add the nodes required to enable SoCCP on Glymur/Mahua SoCs.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Co-developed-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

