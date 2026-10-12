Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF62638645E
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 01:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791768359; cv=none; b=fYjNGIo8ozOp1ymosde8oay/ibgVSEL1zd3TtUFSvDob5GBrWkXCnaGUyQBeoummRa0aSMh1gojeKV7de0XGqrdJGNsvjHxLoAsjPtIw6UcUAoeMMEQbZGssqwKXXZFgcXRDLrpVgiW5WWYFjhcHLfqtc4w3TKDlIFOP7yAa+6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791768359; c=relaxed/simple;
	bh=WcXPQx7tMGheRDfYV1c8+KKHPrQsEAxtPxGqErtQJPA=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:References:
	 In-Reply-To:Content-Type; b=LAOcGTVDWVktxBb28HC28saSD854dV8iys5V/2rFcofIS5Xyg7hgs3Pu0rnYd3Mxag1UKdItIIxb8WbKHUhIu7hrZjWely9nAY5a3kXpOTby2/tG5sybP6VC5FaWEZKtKCspfoBdaqqSWHhay2in4hOy7ED1hJ1GXYzMW/objvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ef2doeZT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G95OsfsK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ef2doeZT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G95OsfsK"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69BMWwBF924030
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 01:25:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+SEuxb14RGNKNzw6OwUej2/dkzCU8mOD1TxdNQEWpLI=; b=Ef2doeZT40tKHpf/
	gJ/AkFWnxyGdnVyMQA26UdzIFPCrlJ16TSSKJW8ShUPfKFtlqVwfMQehhlHxpa3b
	f9ffnFbqpBfQb5kesV0FFIwwQiCuY/awgnDdmSzuJ/7TuAKssJzhfB082f+BLlA1
	AHqK/W1IL6z4nX/bAhg7W/wbRrzNOt1K1kVfBYY1Ks4mVZuvOel9AG4fzFQzXTyB
	Z5/YeHFA+azU6JJkntqaCjIUtkQj165Q//c3LjEyzs2c9IJkn0X6mtYGNzLoslxU
	vSBBV5oYTAEpDgQp7ae3ppmfbjZwX1g5+BYB2M7HFl6qDNC6Fy+Z2RSsGIZkgmRh
	HYItdg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cc6ccxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 01:25:56 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1a439db36so945579a12.2
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 18:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791768355; x=1792373155; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:references
         :subject:to:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+SEuxb14RGNKNzw6OwUej2/dkzCU8mOD1TxdNQEWpLI=;
        b=G95OsfsKxmxq6fKHwlRjxHedlSm/8lxZlV64pvembC/n1KC60acAjMi9vSZya2xxlT
         A8m/ct2IXuH+R+qHV88RfWPEQPp/b8EJAUrCefXMNE7VeqThFGEj17epDykMiDJlAUIY
         QmtwHtvQRMZh30FEPnUcvfKW+QZDDdsQ1f2lxb5Np7AncTiZ4ytIMqihdsPWur99CsCh
         wGRobjD/Ubz97l1eUqEaqKzIGqrEhE5djjhnC+U4h5F8h3nQZj0Hy4owNycX13eMr3HA
         IY/1LFus9NvWMDP3xw2ObCiNjHz0SQodJsGR0jLxVbnxBJOMdgtNkPs602Cw33d4MN32
         YwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791768355; x=1792373155;
        h=content-transfer-encoding:content-type:in-reply-to:references
         :subject:to:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+SEuxb14RGNKNzw6OwUej2/dkzCU8mOD1TxdNQEWpLI=;
        b=FfMy7AidBF9E5iJC2HEr8kSIVRLurglTOlLXt6hY2am8YO4HDBn5RKTD4e9ufM8/ue
         amfHFe4wrYZm4DHDQZVfPMGbTHQgMcvwt7vWyQ7+/4322ysuTTXLMlR6DQxUorx+aJcN
         qDTPTZzY14BI5MqwOngur1iDxYG4ULAxC4oxsgEauxooB/D/rn8jKtv/3rr1t4GTD2rE
         79DeawW2LEM7b662bYI7WwrN0I8Ct4fzLHBGGOFOtTduX2NPgMGzI0JXik+/QYiYxCCP
         RZyW/JfIkjW+/JNLJ09x2jte/tZvr2fx9iCjRGw+kzCjDhCPO+kuLVtALk3QTDed8qiv
         6qLQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPH8xPYhGWq3Jj2qC5wVsB6VTZxCKKlhZbRUvM1Q8ixnMevPYPjzFxQO+8TTbbBpWmGTMatud9asOJ@vger.kernel.org
X-Gm-Message-State: AFq9FYJyMLNqNSdnnd2E2zdqWRQevIcRqBL45bULI1I3Kwq9Rd1Rr9A3
	M1ZkTOwNYapdIoFFan5fSFGC/Yvv8KsY88xGY5MO1s5TrNiTW7ibNqGi8uLJjZUaiWfRvGG/47m
	WsllwSb/oWzPrCR5gc8Su+ELAToNSAZgHPHjgYShmErOoZCp9LcwBsFTjTX1/zgsW
X-Gm-Gg: AYBFou1ezIzUBlUxW/0A2hSGSfgyz8GIFplp8k8bwuN09g0b/YEGEPXQnJDPOBVrBPH
	vgaVfsrigIkiwlVJe3nCWBXNp/z2BxGy1JcnHyNvYtnEY5c73S5zXa5aKPatEF4iiV43bqVp3YV
	i95ptBL/Aj6DtZs3OOIzWTxQEvAD3e178a8OtJBcAvYnTDQj/7bff5gX2FQXcGoT4y7upzpsazN
	Y88BSaAQYW861skqy9Ezc0IVc5mf7/8W33CApeYXtobqoQMj9F0YcBAWxVNeSaL0E4E+vXmVWTy
	4rCkaizbxNYsHXhvSfY8O/rKXdprimZ9ESOS314v6VbK9dnguixGhnYSGm3+T+stlIFhrkzzQFj
	A366dc208ka/GxigmDfY2qon66537d7FwGudPPXeUVnAVkn6MZI1xTnHiJpV9yTM=
X-Received: by 2002:a05:6a20:4327:b0:3e1:4f30:fdd3 with SMTP id adf61e73a8af0-3e16c0b5110mr7383244637.66.1791768355512;
        Sun, 11 Oct 2026 18:25:55 -0700 (PDT)
X-Received: by 2002:a05:6a20:4327:b0:3e1:4f30:fdd3 with SMTP id adf61e73a8af0-3e16c0b5110mr7383226637.66.1791768355028;
        Sun, 11 Oct 2026 18:25:55 -0700 (PDT)
Received: from [192.168.1.6] ([117.143.161.217])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89928fd8469sm1622685b3a.61.2026.10.11.18.25.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 18:25:54 -0700 (PDT)
Message-ID: <5d4a3126-44c2-494a-938b-1887503c7a52@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 09:25:48 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: hangxiang.ma@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Subject: Re: [PATCH v20 08/13] media: qcom: camss: vfe: Add support for VFE
 1080
References: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
 <20261010-kaanapali-camss-v20-8-63e98ce9ac0c@oss.qualcomm.com>
 <a6e5dc34-c2e7-4a3c-a0e4-fb0a3a28cece@linaro.org>
In-Reply-To: <a6e5dc34-c2e7-4a3c-a0e4-fb0a3a28cece@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Va3cNw_KGMLtThI0uZo81y7Zg75w2k69
X-Authority-Analysis: v=2.4 cv=XdQcX455 c=1 sm=1 tr=0 ts=6acc3724 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=K/RrOd38U9TixX+j9hIN8g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=HmBDO3gPv43XiXRR4pAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAwNSBTYWx0ZWRfX4U4JH//XhX9f
 uqMz/9Z0DxoEs0HHPXHamABJ935zvwL3lwlud7ciIHcjygLgvxP66SH1aItua7Tzan6UWf1NwtW
 /XmOngqXYUHL/4yS75QE+1d6r7+tGNjtPD4V8LbZIkwEuSYQKRXsak/XHy0ATcMwdvmSZ5A35Z7
 4HxTLlSs48CTajDZRNwFDPnxxUWBf92KMTO6UsFQW2XOujg6jHr1WZYDd25XdxuPDeJE7huhYMm
 IMZwo8bYu9MJIhTAGj/QQtD/1q8nTw8JEW6PeuvlFwRHFZ9kga0YemkyRUU1FGbPSu7UHZZoH68
 PLWQb8w9B7B1nASxBKs83Gi22S7CCtnDu4z1EkkHqBVySn4NVputCbr3s8vZFEq+WNRz48WU/ut
 1P1AcSoVU0QZu+a4mzhA8xwzGEJ/jCGHQlIMTbPjNEQlOffrwB2r9ZtAQuoEA/Qp2ZlBLJzE2h/
 3hZdpoBE+kv3RuqWGxw==
X-Proofpoint-ORIG-GUID: Va3cNw_KGMLtThI0uZo81y7Zg75w2k69
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAwNSBTYWx0ZWRfX+BjOLvz10Z7s
 fxxtCQ4a43tiY06L3K5GWCxHbluhd9mmwgT+uyp4mXmRRzXsHUoeiWIQWwMvhd64qArRtPXvhhJ
 KjCrxmhbq7lgJXbywvdntn+HMYnxSHc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120005

On 10/11/26 4:56 PM, Bryan O'Donoghue <bryan.odonoghue@linaro.org> wrote:
> On 10/10/2026 17:01, Hangxiang Ma wrote:
> > +        if (!vfe->res->reg_update_after_csid_config)
> > +            ops->reg_update(vfe, line->id);
> 
> So I'd prefer to have a discussion about if we can move all of the 
> updates to one method.
> 
> i.e. why should any of the updates happen before csid ?
> 
> Sure vfe 1080's documentation makes some sort of explicit statement 
> about an update that has been implied for some time.
> 
> My question is why not gate all of the updates this way and make this 
> not a flag but a global behaviour ?
> 
> ---
> bod
> 

Yes Bryan. That's a fair point.

The reason I introduced the flag is that on VFE 1080 the documentation explicitly states that the register update should happen after the CSID configuration and it really follows the guidance, while older generations appear to have relied on the previous ordering implicitly.

That said, I agree that if there is no functional requirement for some updates to happen before CSID configuration, having a single update path would be cleaner and easier to maintain. The flag was mainly intended to minimize behavior changes for existing targets until we have a better understanding of the dependency.

I'll take another look at the update sequence and check whether other older platforms can safely move to the same post-CSID update flow. My colleagues who have such resource maybe can help me on this.  I can remove the platform-specific flag entirely and make this the common behavior if that holds.

In this way, I think I need to raise a new series to collect changes among other CSID genN part and VFE framework part. Could I mark it as the dependency as this KNP series? Or functional dependency is enough? Thanks.

---
Best Regards,
Hangxiang
