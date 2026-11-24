Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795508596;
	b=OADIw7Ob4iPE7dfdyyeD0s/GiJzqwZIJOSqt885/cMq1UT/81mzS7NJjN21sfTwPnSjd
	 Me+Si4ZNBItrde058YBLX+qe6eE4Yue/Xlz0RcgqGPDUi8F/EJzc13I42jIaNdseRkb8W
	 AhtMXJtIFgCL6Yb88hvb2ifoPmiUpFiVO5T5y6Zs8LUWxq98Wd3RpH7JgvWWYT5rZ6Gt3
	 sD8Ec3JZJkOHa0ifLne/Ay3Ff9bJSaig0ZMhC4u0Mna4uzQ5AslLmrI/tlp85KPot9Q5+
	 K49sqYplpybl/1t2AbUNup1fsdgcABDwCIIjc05tnkqyKoyLOYBTd1ZnNphKKK7OZZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795508596;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=auhO15mecizuo8FqDCWu2T1sGRf4Y64p8UuTILXkr7o=;
	b=IWV6/e86GtkWwr6RqtAmNYdD0wC6ZI5ucGTiSR9IoicFr/X+w/rXpopptr8cUFKC/hWs
	 edIEoDrs3251PS5uHcTF82bOiYcHYsvE+6rMr7YTOTi4xmfik5V55onKk75kJsQqugnkR
	 k9LiwX2J6jqit8d3p7mz0t4cS0CNf3IxisSnKoRu44J1oTFipVh9idE1rV/6cEuNaszt/
	 O17jLIBofMcbGLfqeeGfk3ZYdNYzZ+vkuEYsl+40PfHayFt22SLLfiEu3aoBD1RbkZddr
	 +KtqxpWvEWLrgZr+C/fbCUeLq6DzdwUawxQK9G23btqxR3XEHEThcZrwT7yMY5diD/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=foqaj1qz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jlhouz+s;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CB9606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 08:23:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33CB9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=foqaj1qz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jlhouz+s
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2kAfP196979
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 08:23:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	auhO15mecizuo8FqDCWu2T1sGRf4Y64p8UuTILXkr7o=; b=foqaj1qz8J/gqF0O
	BbRV3/+X65rWPWn2hI4Agb2czxq+zKzpoUsFnJqmYaCO7ClMvM4PG3OWsZ4Ni1cu
	Peq2aJXiDlxpT0rMA0AmYRQpml6SXSJqqI10EHFzpxo4oxQPWKq/DgpFrFjYPGOY
	gWwhUG8hVXBuW9l20zzdedN7L0wBrwpUkRoSrqKJtrGguafdkTueH6UfTHM42s45
	347306+T7J0QUFDpvzd5bmO6fUSVkwog0u33F7OhJx4DhVj6w2e6Ry0IiZrxNdPa
	wo1+J5uJueTu5Gx9gzf+Q5n4LRCtDm1fMOx8rFn4sJFdoETxnys2L84LHsMa+aab
	4AxSWA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukrajyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 08:23:15 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-154e9d2d94fso5295802c88.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 00:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795508594; x=1796113394; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=auhO15mecizuo8FqDCWu2T1sGRf4Y64p8UuTILXkr7o=;
        b=jlhouz+sVKPvVHAVLRfR2TR1ynwCcY4rpVxUo81e2g31L3jf5eVyrkNk3NROhO5fa7
         84TA0Ez9Wn+KZ3zCFUtQZYMFtyePDV9bnK4sdszJszrr41no7jyQQpX70B1ieCfvFAFk
         +y2LB1s1/PQNWI7j/CjrWj80izJQh3pl3D86MBo+Y9zbrkWX235qw/fBQBj+pCZoo6WI
         3YYrCRfLDb7LsjJI2jEvjrlXCrCX2WDCoZnNoeNdmd2tgreds27oo/rdMTcIiaF4iTvw
         OA45aa7/YxLHCEpuEkSizpvB9tj1/Kjf9bkxElHzimSr0pDcDKR/PNuC9Wp9SCodpOlV
         IFzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795508594; x=1796113394;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=auhO15mecizuo8FqDCWu2T1sGRf4Y64p8UuTILXkr7o=;
        b=stwqqieMkIEhIWehhuug3vBEVh89FYTBmF2UlYgF5Kd/528p+16cuw1wRZzyRYINie
         lYAYiT1izMhmILlud7OAChfOYTlobU23QcHpn4i4uo7ztDo1LA2KCkAf1WGo8Rp0oEdq
         lzdCLoX1De1Al+cS1MRzl7lusQBeeiLNNKiKVkrQq7WE2dqwGoOUXW4dgGbKcVmZ3nHc
         lj5fhs5uuZyPy1SLCAgD80uf96p7GnYUPzDhsXVa8S3WdePjfSSyrajlaRGjyzbWD8e3
         oeGuTFgl9O0K4GSk7pduUs+rpUNBaaHpiknGisI+PMWFW6JymJlfHSe2iw3WFUiioKn1
         8elQ==
X-Forwarded-Encrypted: i=1; AL+hErFmp0DmfLTGEJGG8umc/8RVoMlA07pdxBK4vF8xreoiRB1x2CrcIujhWVxtOOkSDljhhAMcP9rmPUKB@vger.kernel.org
X-Gm-Message-State: APuU4Z90hsaSM0tv8z6NEPOYVsEnu1Ph4bHb+IX0TIu2G9YANh/1pkBn
	gG57O+3F9ZbHvXidZCzfdp7j5z4LyLjKAk4i30/UTtcxDwtBn/zVHSK3It2re35uBg8iqjwJPPr
	D/hyZ6mkCdlC9Hl0pLUJih4coW8YwNf0RHveFLoaX8kXtiFazPxyRGpPbG1TM4bnS
X-Gm-Gg: AZFdTZeL3xwGSnpVVXXHC6GFVkM0KE4cqhKkiGhdKOX7yWNEOpQ9iUj2R21YQOywpUG
	llGQgpV5VDlFq1ZH7Qw2Jeo7wZxy/W9oNNeB/varNsjBEXoEy+0GfC7XvEg/Qe6aa80REJTPQpO
	DlTvjrS8MX7gfPS08cy9RrhTVIFzgLqOfYd3j1ygg7E5nFMWt4FpEczSUTDIOJWQ0CDfliYY0Ib
	2OaHDbIE5etu0Z0+xtOQ3KcnRBpa60aT+PUpNWjc6M424bPQOUPb2O+QherSJdPSUa56hNlANM3
	8Ch/WLe4XVXtod8PfFK1t/Tl7YKYiS6FcjRmDAF+l0XoxLr/2Xfo4aCcjZ4i5oyWhD7sHz4d0VF
	tg+NKE73Gc9q8W5CbdW8YiTQZQoW5w4TAaWGQktsI/hwEw1yGvBAKTQKk/gcnCWcC2Tvz6ddf+H
	xl5BbFuOG6b/am
X-Received: by 2002:a05:7022:23aa:b0:1b0:166c:6a94 with SMTP id a92af1059eb24-1b5568e5983mr18603394c88.28.1795508594418;
        Tue, 24 Nov 2026 00:23:14 -0800 (PST)
X-Received: by 2002:a05:7022:23aa:b0:1b0:166c:6a94 with SMTP id a92af1059eb24-1b5568e5983mr18603360c88.28.1795508593798;
        Tue, 24 Nov 2026 00:23:13 -0800 (PST)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm50686826eec.10.2026.11.24.00.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 00:23:13 -0800 (PST)
Message-ID: <808bb7ca-ecb0-4594-900e-3114fd26eb97@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 13:53:08 +0530
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
Subject: Re: [PATCH v1 1/2] ASoC: qcom: sc8280xp: Add support for
 lemans-draco-evk
To: Karthik S <karthik.s@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261123072522.2358819-1-karthik.s@oss.qualcomm.com>
 <20261123072522.2358819-2-karthik.s@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20261123072522.2358819-2-karthik.s@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzMiBTYWx0ZWRfX7lPMKV6FzbiJ
 lSRiFv3Fx6jYHGI33Z2EjWfoAWN2bHbHJA2X01PdIEpBzReVHzPzy6HArsCdahlC1Ev9EbodNOE
 RGmQLCuwrfNjIv9SQ/i5fx1nNgNTQSE=
X-Proofpoint-ORIG-GUID: Ub8N4Q6iuHu4YimahzL5OFNCgQofCRXF
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b054973 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=K-guWxSE8BY5skIoOz8A:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzMiBTYWx0ZWRfX7ZTe10KG3nux
 YNlIf0iDKKbEh8QkH+5Luo8fftdxvJnK+H6b3QIBoYgv7GYosC4TZV/OaPXNN2xtf1OP6QDqhym
 VxNJPOHY4a2iJNjlOJgyTj77IndruLlWTWVBvmNvyu35Hb4ASQCqM1rUFQn1E0X+POdG1LrA1FG
 4PzmgcfhdKncJDV6q+tEU02pA8pChdu8NdJ0wG2NEl+KrYTwG1Y88AClZ1OOjAvtvZ7lYmw9lHE
 HdmkaxnDCljClBsWSv11SneIoT+naBuMFcSEjbcuM1CRSM3Jil9a+wwMJFreuk0N129Q7EIIrZE
 VMRQogPTYsUpnJPOuJ9rz5BWNKdzyhRhpdKPRdhDDrpp6yY0+Y51A/KbyRyUMe26snF6ohwCzCK
 ESSc7UoQNIaMeRcr6xKYaSieS+cXPOX8K3LqIKltI1YuhE7zfiD0mwdm9dH52EIyTdm+CDxP7BU
 I9NsC1MYNz7iS5oBSqg==
X-Proofpoint-GUID: Ub8N4Q6iuHu4YimahzL5OFNCgQofCRXF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240032



On 11/23/2026 12:55 PM, Karthik S wrote:
> Add routes and controls for max98091 and va_macro for playback
> and capture. Add mclk enablement and codec dai format enablement
> for playback support on lemans-draco-evk.
> 
> Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
> ---
>   sound/soc/qcom/sc8280xp.c | 38 +++++++++++++++++++++++++++++++++++++-
>   1 file changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index e136407c56bf..2a542699a51b 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -44,18 +44,41 @@ static struct snd_soc_dapm_widget sc8280xp_dapm_widgets[] = {
>   
>   static const struct snd_kcontrol_new max98090_controls[] = {
>   	SOC_DAPM_PIN_SWITCH("Headset Mic12"),
> -	SOC_DAPM_PIN_SWITCH("Headphone"),
> +	SOC_DAPM_PIN_SWITCH("Headset Mic34"),
>   	SOC_DAPM_PIN_SWITCH("Headset Mic56"),
> +	SOC_DAPM_PIN_SWITCH("Headphone"),
>   	SOC_DAPM_PIN_SWITCH("Speaker"),
>   	SOC_DAPM_PIN_SWITCH("Receiver"),
>   	SOC_DAPM_PIN_SWITCH("Int Mic"),
>   };
>   
> +static const struct snd_soc_dapm_route draco_lemans_dapm_routes[] = {

Move the audio routes to the Device Tree.

Best Regards,
Rafi.

> +	{"IN12", NULL, "Headset Mic12"},
> +	{"Headset Mic12", NULL, "MICBIAS"},
> +	{"IN34", NULL, "Headset Mic34"},
> +	{"Headset Mic34", NULL, "MICBIAS"},
> +	{"IN56", NULL, "Headset Mic56"},
> +	{"Headset Mic56", NULL, "MICBIAS"},
> +	{"Headphone", NULL, "HPL"},
> +	{"Headphone", NULL, "HPR"},
> +	{"Receiver", NULL, "RCVL"},
> +	{"Receiver", NULL, "RCVR"},
> +	{"Speaker", NULL, "SPKL"},
> +	{"Speaker", NULL, "SPKR"},
> +	{"VA DMIC0", NULL, "vdd-micb"},
> +	{"VA DMIC1", NULL, "vdd-micb"},
> +	{"VA DMIC2", NULL, "vdd-micb"},
> +	{"VA DMIC3", NULL, "vdd-micb"},
> +	{"VA DMIC4", NULL, "vdd-micb"},
> +	{"VA DMIC5", NULL, "vdd-micb"},
> +};
> +
>   static const struct snd_soc_dapm_widget max98090_dapm_widgets[] = {
>   	SND_SOC_DAPM_HP("Headphone Jack", NULL),
>   	SND_SOC_DAPM_MIC("Mic Jack", NULL),
>   	SND_SOC_DAPM_HP("Headphone", NULL),
>   	SND_SOC_DAPM_MIC("Headset Mic12", NULL),
> +	SND_SOC_DAPM_MIC("Headset Mic34", NULL),
>   	SND_SOC_DAPM_MIC("Headset Mic56", NULL),
>   	SND_SOC_DAPM_MIC("Int Mic", NULL),
>   	SND_SOC_DAPM_SPK("Receiver", NULL),
> @@ -617,6 +640,18 @@ static const struct qcom_snd_soc_common qcs9100_priv_data = {
>   	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
>   };
>   
> +static const struct qcom_snd_soc_common draco_lemans_priv_data = {
> +	.driver_name = "sa8775p",
> +	.dapm_widgets = max98090_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(max98090_dapm_widgets),
> +	.dapm_routes = draco_lemans_dapm_routes,
> +	.num_dapm_routes = ARRAY_SIZE(draco_lemans_dapm_routes),
> +	.controls = max98090_controls,
> +	.num_controls = ARRAY_SIZE(max98090_controls),
> +	.codec_dai_fmt = SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_BC_FC,
> +	.codec_sysclk_set = true,
> +};
> +
>   static const struct qcom_snd_soc_common qcs615_priv_data = {
>   	.driver_name = "qcs615",
>   	.dapm_widgets = sc8280xp_dapm_widgets,
> @@ -743,6 +778,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
>   	{ .compatible = "thundercomm,qcs6490-rubikpi3-sndcard", .data = &rubikpi3_priv_data },
>   	{ .compatible = "qcom,qcs8275-sndcard", .data = &qcs8275_priv_data },
>   	{ .compatible = "qcom,qcs9075-sndcard", .data = &qcs9100_priv_data },
> +	{ .compatible = "qcom,qcs9100-draco-sndcard", .data = &draco_lemans_priv_data },
>   	{ .compatible = "qcom,qcs9100-sndcard", .data = &qcs9100_priv_data },
>   	{ .compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data },
>   	{ .compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data },

