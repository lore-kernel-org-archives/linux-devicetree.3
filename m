Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649165;
	b=IsxRCYnkn7MXiurQHfd3s1UxBT6m/Dh5ZrclNL2r71FEuBhJdysGFuGkx98XR5MagYvu
	 tA6GuATtBgHPKtSH39gyVShRwkzD1/zQ0ahFWKA/8MfkQsBGSgzHUup9ADLlZfbGoiZ6e
	 9Sc2OrUvNrOXCvLs/cJ73M8wLJQZxERcJaviFuDhQNHa+oT5gLssK0oMEJVwrRatDnhuR
	 5Sq3YPca73d6AwA5ze6tYl/vqOHumsy7wqNeVDadu896rA7E7vVUPmg10ZzaLNpHgrnjE
	 N8f3jsVBjifHeg24xsZL4LELouN7QDpYFTvO2A9pdPuxbyYJ0T5ynKUAOkO6hI3Zi6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649165;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dUux21q4cPFzrk4Zy0I0IDXAjBQ6onqTlomYLes+A4M=;
	b=uD2yMwWezlkWjXwFjkgYZRAG0LzpfOiVQpMvF19B5bXcg5QijgWERT41ySHiCDE23a4y
	 xeva7cHPu/govilQMSHPxUlgUM2eHO8j6iWcXvBxpRSzWjI1o122Rdhv5T46vKtiKr2ef
	 5dVMEh3gcewR48QgB8PtLS6ynjRyBX3CBGaFeBvMoZt4Qrexibm1DY3THvi8nA/Db1Li2
	 3VXobnNNXiLFaVupAtba5D3leK6pgqoosJYt96+Lx6gDWfXeRF01KJr+jRYCsEKCtYBBs
	 oWYWc5jBH6NvNHtrdgOVpJyPCqfEChckXcsqlftxW8YS0V8rsJDKAoqEDiuk/ydFlEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ETIdX3jz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hY+aqnDh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B59606A335
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 19:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7B59606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ETIdX3jz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hY+aqnDh
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2HPOLq328016
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 19:52:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dUux21q4cPFzrk4Zy0I0IDXA
	jBQ6onqTlomYLes+A4M=; b=ETIdX3jz2PnKgSLwmvQdODohKsPhIoWDci0X3o2B
	EjcdMAXRSNXoWmIWVBVt5cZqNjL6o3NvwoJKLL/+s60j3MYUGFW4cJs3RQeLVoTV
	HhASkB4HeE1Nk7S8o8cYeHH0xcmcUcMmA2ZH9p/a0VZzda1C6rNmAafL9E4F3DXL
	jC56FyZ1Cl/wr4DUtafoQGmIC2VZ1a4G2HG8OOJq22wrkP1kSlXi5/2Lxs808K34
	aO7s1/G5gPXmJlD9e+MS/TWEfOQje7zq2UNJ2065ttedy0VEq+Dy3/4iZflwQBQW
	Sq2XH1r7wKgf0F8Qy/5xIBDJ80/y2VybLvbP+0RSZCELTw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfeayua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 19:52:42 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso6409455eec.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 11:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793649162; x=1794253962; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dUux21q4cPFzrk4Zy0I0IDXAjBQ6onqTlomYLes+A4M=;
        b=hY+aqnDhge/cdeYiYLcMt1cZpa57vMaHYDNYl3S41+cJw6x2GuCJ96CcaH2QKlpaeD
         M5p9cQZi4StS67f1tUh42/SIYJkmDZHv7n43d2dGpu5TMG79/w2I3mIOCtlS7B4dQL2q
         55EsuodQfBP+FYsX3KndiwsCSUFxCgkD3sO+B5GLrc7DdURQ4PUXk4iX4rhwzGxmeMJb
         Guq2/YmPXnbU99CZlG9MazfLt+uyFO7KoSeIYHeZtkwCwgdSIPEB+d++7DvQvGJZd1HL
         Y3jwi2XvVnMT5xgvkXGnj4beaK9Zt16GXPcERlVxdUiA9kIfBM//zWRl/JNU5cJ09Pqp
         UgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649162; x=1794253962;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dUux21q4cPFzrk4Zy0I0IDXAjBQ6onqTlomYLes+A4M=;
        b=w/rJuZFtgLDwMncF2AHqSt6rbjKzbOE+9eRYIHV9j8IguGE+kPFZecSLDNlUKvWunL
         3cdl7S1KnVvmKJJR8Z7VlV39j/ssilv13vLmMxGHHjzfKpkYLIBp4tuTq94eoZFQFu67
         2njOMe6W/caiSl7l8XcgJXnCr4WUxVwpCSVzVBOi1jWFWwtJXJPi4ycN1GdVoZ3CPET0
         hs8MOe++YypGj3RCALP9eSu07SnTkCO14x3fBf/p7CJXrknrg/0NQ0glCa73kM4dcaOQ
         2lT/2EHzBvGmtdS9RaBcEBdACvss6qhyUqjZ2pmfLC0pGnerNB7NYiGmKGjvnvdNHsuA
         Kqsw==
X-Forwarded-Encrypted: i=1; AKwUvBzFyZFUgq3czxH+XVNIGv9oGrl9zw8JFrYhwfzYysKPjUDEckYjOk9elxvQEq3gA4SXaIigHP48LiiI@vger.kernel.org
X-Gm-Message-State: APuU4Z8q58LjXqd+H4B905zFeTZA26pRlVj/uQqXgcjOx+JG4eyPx8zV
	JMjhjwpK5873R8LOUyKVso5fI0xsOovY7WPXGBR6qEVowpCa37RNTzkvhHI86jk9537FKJfx2Mv
	mNDEn4Any78z5sVVng2DrpcjbQMJmiEtE2Ll+zxIJQnPy4/Xi4oJaM3I8eqGahsDq
X-Gm-Gg: AYBFou3eUzSXZj1sQpsj1KciRxJ7H9+QwcqBmg9F/JFSH8F3YkkM/TCfIMOGmr51Gsg
	9hY/WMkwBCVu3b+eNqGUPumM8XiT6JiyF+bz96wXgssErhV4VoV21Q5izZ65Hvo7XSF/lct4xWX
	h/k1BWmCS4vqSpA4iSARe6eMU0X56CqVgfQOLTaQL6MjEE+uKQ3R36E29Yxmbin6/N8mDiHEq42
	aoUQMULlQ/+xOGUfqMuawep37HCbRwitdF6h6YeTaCtcLYf+8nOsXe/GzBrU80yD4GXjmroV8FX
	bQII/xnaBraw19wGnDuTX4h2JG7JrjiUu08DJb6s1pMrBWuTAcTvk+hGy7W+XIj9rTu14f8rB7x
	k4e6yMThbkasSBNepIZDNcPA+7S0CmbNijHA3dVaI3RnXGZLP/5RJZ7KASHn10BRnL+nOxgSJxD
	Su
X-Received: by 2002:a05:693c:41d5:20b0:368:d0b6:b231 with SMTP id 5a478bee46e88-36a4239256emr15924169eec.10.1793649161577;
        Mon, 02 Nov 2026 11:52:41 -0800 (PST)
X-Received: by 2002:a05:693c:41d5:20b0:368:d0b6:b231 with SMTP id 5a478bee46e88-36a4239256emr15924124eec.10.1793649160998;
        Mon, 02 Nov 2026 11:52:40 -0800 (PST)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42952e1csm42317392eec.20.2026.11.02.11.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:52:40 -0800 (PST)
Date: Tue, 3 Nov 2026 01:22:33 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Raj Aryan <raryan@qti.qualcomm.com>
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: qcom,pmic-glink: Document
 RTC client properties
Message-ID: <dv4mnrd2vrmoucjje5efyu2hl2u2zljc74eaiihzfwcsb2bblq@ri2ouch4uout>
References: <20260807-rtc-glink-cleanup-v1-0-7801e4d69c4f@oss.qualcomm.com>
 <20260807-rtc-glink-cleanup-v1-1-7801e4d69c4f@oss.qualcomm.com>
 <anUemwQJgHJP7iOS@baldur>
 <2yndadk6urzktzbb4mg7rhnywb3lxi6liuw2afdee6tswhnl6h@tqvt3n2r4qkj>
 <6079c72b-cb98-4a38-b887-962a78be2877@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6079c72b-cb98-4a38-b887-962a78be2877@kernel.org>
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae8ea0a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0277vH5HcBAn9Oasa0YA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA3OSBTYWx0ZWRfX/FT/Z+QKuc16
 gCrgY60EDv/NXFo9o6qWcZf+d6Ux5M22VbMItyNijElLdGuvFqU0/osEZotIvZavbmECtbsRu6e
 qH0gNkPv9nr3Rxr+JQtFJChW7QoryYPzdcFnIcTV8zaD/HF2CJ073fWB3+KJrJfEYeQ7Kf6w8nk
 WfxzJxNLVwqaIIGku5V8vHyBYlTxSZVw9l8Z04Bhfu8g9m87UAoYB7+hNIFgC95/8JyYWn9yfm2
 lzKpw1d324Fe3iJ543G4NBxazkZNMmvXbIN+BpbLVEZe3B/IVAKLDHxKZGFbTYWEhOswCsWY8kv
 /zwq8hs8IQtPL7fneJVSAiEFRYJK3NCPbQfDDJLkj24s5yVF+VIrKV5QKqH6n+Y36IC21Val+0d
 dV/OClqlcQAsUzP79FX7tPz5SvH/Lyob3O6gXXkoqOVCy5Lc2sCMp4qq9VfPG3we79XFkJ+zC46
 W0ETNTGUkv06ux1OezA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA3OSBTYWx0ZWRfX05du/hx+PZkM
 t79YEgDzfL48tIS04RezJBh+d8WHRtrLJipxFmdPbe1x9iH89fZl0c4G9hQntUWEFomWlS+h4VO
 QRORCrepDNjnxPWZ95jw1LzYiRCN5VE=
X-Proofpoint-ORIG-GUID: Mwnr4welL3dkuU9kdB86ciPRmNYtcP-a
X-Proofpoint-GUID: Mwnr4welL3dkuU9kdB86ciPRmNYtcP-a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_05,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020079

On Wed, Aug 26, 2026 at 08:11:36AM +0200, Krzysztof Kozlowski wrote:
> On 20/08/2026 21:23, Kamal Wadhwa wrote:
> > On Thu, Aug 06, 2026 at 07:02:44PM -0500, Bjorn Andersson wrote:
> >>
> >>>
> >>> Assisted-by: Claude:claude-sonnet-5
> >>> Signed-off-by: Raj Aryan <raryan@qti.qualcomm.com>
> >>> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> >>
> >> As with the driver, the author/s-o-b chain is wrong.
> >>
> > 
> > Ack. will have it this way
> > 
> > Assisted-by: Claude:claude-sonnet-5
> > Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> > Signed-off-by: Raj Aryan <raryan@qti.qualcomm.com>
> > Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> 
> The original SoB chain was right in such case. You sign only once, so
> first one is dropped. And this is what b4 produces.
> 

Thanks, so will keep it as-is.

> 
> > 
> >>> ---
> >>>  Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 5 +++++
> >>>  1 file changed, 5 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> >>> index 16ad4f5698fc..38db1ff473c0 100644
> >>> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> >>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> >>> @@ -79,6 +79,11 @@ properties:
> >>>        - const: charge_limit_end
> >>>        - const: charge_limit_delta
> >>>  
> >>> +  allow-set-time:
> >>> +    $ref: /schemas/types.yaml#/definitions/flag
> >>> +    description:
> >>> +      Indicates that the setting of RTC time is allowed by the host CPU.
> >>
> >> What property of the hardware/firmware that this describes would cause
> >> you to set or not set this?
> >>
> >> Also, what would the expected outcome be if I declare that my Hamoa
> >> hardware has pmic-glink with allow-set-time?
> > 
> > Actually Hamoa firmware does not support it yet, so it may get ignored.
> > but if the support was present, the writes will cause the system time
> > to go bad, which relies on the RTC time elapsed during off state to 
> > calculate current system time, incase network is not available.
> > 
> > this was used on rtc-pm8xxx.c driver as well
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/rtc/rtc-pm8xxx.c?h=v7.2#n622
> 
> 
> It's a generic property, so where is it defined?

Thanks. That is correct, the property should have carried "qcom,.." prefix.

seems the orignal property used on rtc-pm8xxx.c too has this problem (as i
copied this from the older driver) it also doesnt seem to have the prefix
added.  I'll raise a different patch to fix that.

> Why isn't it implied by the compatible?

After thinking more about Bjorn's above comment about this property describing
the Hardware/firmware, I have decided to drop this property for now, It seems
unlike the rtc-pm8xxx.c driver's case where firmware actually blocks the
writes, in the current case we were only adding to prevent the RTC core's write
(with the current system time value) to the RTC HW.   

Having said that, we do have usecase where Time service daemon (in Linux
Android) does need this time to be preserved from any writes, as the RTC time
offset is used incase there is no network time available, the time offset will
simply be added on top of the time captured before shutdown. So it seems, we
cannot handle this without actually blocking the writes to RTC time.

But since this time service does not exist in upstream kernel, so can you
please guide what would be a good way to handle this requirement? As we would
prefer to use this driver in Linux Android as well, can we add this as a
default disabled property still? something like "qcom,block-rtc-writes"?

PS:
Very sorry for late update, We actually wanted to enable Hamao as well (along
with Glymer) in the next version of this series, so testing and firmware
updates took some time.

Regards,
Kamal

> 
> 
> Best regards,
> Krzysztof
