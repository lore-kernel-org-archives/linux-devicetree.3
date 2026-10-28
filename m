Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793194699;
	b=gFHU8/uOPvDnDird56YLUT0emTvdpBvEERv7wURxHaf35KS4TX3neCt1vKa0DKhKAUWC
	 NX3kaeLcGgiysPyWrMLoclfj81zzGAktlKAnQmKw0wM7yZlyfqhpy9zbMAg6NTBRIqF/U
	 P/D1OahKMj+l+NVTr/UTp93QNYsxzCw806AGN8wMj+cL9GSkFuF4iFvU7I0+j+TBJMWPp
	 Earr69wM692ilqp089sJcik+6OkcEVrAUNbja6Lejw30y/46HGZJ413+WN8eN2aY7Fi9a
	 JZOlcXgWImLmlJqfY1yUaxDFBfMtJUp3ELoNxGyEFSsPVMG3nFEUsOAkGUIbPkjSJYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793194699;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/mpEE39JA9/80m6032FRQgwoN+AByKF2xUG7co+uHQE=;
	b=iUeYi8znABMi6F4P1aRrzitJKP0S+Uc4wUP1Piiy3h6A0qaZ8FggHndJDZ6y3vb6h0h1
	 kbiPnFHtblDltLsH37iJNmYC/Y42nufu8XTMCkWrTiykpejkNgamgNUh/bvmIzcmucWJe
	 JElcYuSRBPIh5TAFcqujTKXG5Qmy1wabhthYoFU44biITnYBQ5uAS5ge4kjpSX8geIKmI
	 OC5mf5UF1k8tBJDJrD4CplTqv2y76yRkw3rOtUUNhZblzqLRFHMrDA/QKQ9KxD/FcnZfk
	 kfAEG5m8mNUfkMAVEt4clgb1swTCU6x/TNCrmObXuNoSK7XOatnh7twHdAZMRlQyoqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="kybmvRQ/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=djHwWfUg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BB2606A31C
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 13:38:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6BB2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kybmvRQ/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=djHwWfUg
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBeAWK1606932
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 13:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/mpEE39JA9/80m6032FRQgwoN+AByKF2xUG7co+uHQE=; b=kybmvRQ/e8UryMBc
	WTenpDPQ1WXj2/WXl6n6Bq5zRTSaoMiIq1oHOfYCQs2rjN60Az7tYyL1caLBWoyS
	5uqiCf81wrK1zFnWSOQIieq+99Mp/7YDDAtU0NWqbMGq/yGOIG9i+KiL8yiR4GXi
	X72Lp3p5GyAH7Hd+atC3W3CIHzw89ogn8shdErygiC+Cx3+/ZCnIsh+o3RgASQYw
	nA5ake7yV87wcaPewH//Urw/AUqpqUwOlaJfT/+j3Xs0s89eDvv2Z5ivMRoET1iX
	xdHmIFy9DRmjwRxZPsUiPxJtNp+hFSemWqCalsL0lyhFkkCT/d5doiVtaFhagvjK
	fB74Bg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk7g7jdnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 13:38:17 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eaabe26601so93434e0c.2
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 06:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793194697; x=1793799497; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/mpEE39JA9/80m6032FRQgwoN+AByKF2xUG7co+uHQE=;
        b=djHwWfUg7mpzu1uq6nHEi2OX/T89tBmMQmOfLP8QKR4P9N1VvL5X46Bo2yMkSmQvyF
         E+lLCfzhIe1dkpwgf4pdm1irvUr9+x6OVG+KPfmYaE+q/x468oFI96WGhtGLdRe8fDz8
         YGXT5ODIgq/ncLSNHLAEJjqMssWBDnTplw/oNePBO5sXq+sji9xkpfucYH/ihqSA7Etu
         y0qyC6DwlQVHM4CbCgApVUb5Y2amtDvHw1u/Y5BmvCKIuHv9vS9jXiYVUfFlq+3GtJ4j
         cGyD0/e1GbMOhB54JrkGghtvqZ1+ru4qF2B18UknNyanPGimm1B1p1/PdXVU3GNM76Ni
         KkPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793194697; x=1793799497;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/mpEE39JA9/80m6032FRQgwoN+AByKF2xUG7co+uHQE=;
        b=qf3H1laD5YKL0aWnVXXNeflKJ38Qhh8oc0WLMLqwfYajTCuIpMcXrvkC4jfPbYyzM/
         CGcw2yeTbGQVpCLs2wj7byyaYB7m8SInh+NaqHbnl5Y04O+YegtqJ9IYi5NagRFJawFq
         /PcvoRN04l+HWLvQMtLkeiTIAPTO6hQ9EEpiSKdZdMGcFojXnejQFwufWGI0zvW4lJJm
         5x7RD36EXuua5R/3fN5t9TsyeIYMdilHwFmnLjo965eljbxv/LzDhiM6bQIlDfvK2AeI
         r9a2UYKhBsTrg2opu6y9B7FnW86lNmJk+e42pvAOtsOf6Zt5rNxi4zC6iJOXI3dD/Fyb
         GP2w==
X-Forwarded-Encrypted: i=1; AKwUvByE6qEilBQi4zENCevhJZrYxIKaN+0QhvidGoH/GtPvLpPzIJYysjj48aX5H9Rz62s/WddSlaev7YbY@vger.kernel.org
X-Gm-Message-State: AFq9FYLus/WuoUi8P7pQnuw/YSn5JjS13nhULw6Py6S7HdOYrviedlyW
	jY9bbogQMyZGb2A3Bt/saNg8Wm3ud1LopMSHqK/RtyUrAyqW5UYJfKFgBH7KA2PHXtA9V5aR7ZW
	m0bFszliGN8tABFaKFieLbmTJ2xhejJ1kyMuTosQSgzzrYd8ckci9DC8BhoApicm0
X-Gm-Gg: AYBFou3SRZCH4N7N3kGtcAZEsVH2309zLtaxoYYBaDLTYySvIDmdPwYnweilRjDllhq
	RSAbIDIsLTxtQDB5bd74ULmG8RJzD9ER0f6R664FdErz/brXOjjK7w6/7Kd+tYkQJbixMINUrz2
	tLaSXbCve2DX1kuHFvuehIN5maaek2clvWNiAXa7S4IbiZucgffoWn8xvXiREcY1uI9esHlN/ec
	uMIeEWQ2uuNrtJ6GOz4RY8EOK7Wc5iONfzijIQ9hPyXmazdmJX7/+JlNNuvvzQO680IJgq7Ts6T
	aJXx3oyjl/wSnrHREEUDreXJpPEkeb6D00qoqdYYuROxUZv3HjdzSLbmrsEeX3OY0bxBbiM3Nm/
	zuDJXntHL3WgrbVVZl7sCeNSFm4nhTC73pzBozgsXgh/9g9ESsdXzmQDjg5VkLScX7mnZRkM=
X-Received: by 2002:a05:6123:553:20b0:5ea:af6f:16e7 with SMTP id 71dfb90a1353d-5ec4cc714a5mr1020160e0c.4.1793194696816;
        Wed, 28 Oct 2026 06:38:16 -0700 (PDT)
X-Received: by 2002:a05:6123:553:20b0:5ea:af6f:16e7 with SMTP id 71dfb90a1353d-5ec4cc714a5mr1020137e0c.4.1793194696325;
        Wed, 28 Oct 2026 06:38:16 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709f3d9esm30451071fa.26.2026.10.28.06.38.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 06:38:15 -0700 (PDT)
Message-ID: <0bbe4db6-0c47-41e3-838c-37d880869ea9@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 14:38:12 +0100
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
Subject: Re: [RFC PATCH 22/23] arm64: dts: qcom: glymur-crd: add WSA speaker
 protection VI feedback
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261023171433.820092-23-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023171433.820092-23-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1NCBTYWx0ZWRfXwMQz1CqD2pFm
 VJbd5Vo96/GuV/rTIseQyeGy7nwRCWH5PSOpKMjteJbcL/XLY52TShk0YoQDjsvC7V7HL8ZXU5d
 0OhiBv0ukahJFOD+0nzfqOhBPgtP4Kw=
X-Authority-Analysis: v=2.4 cv=SoIFe/O0 c=1 sm=1 tr=0 ts=6ae1fac9 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=7ERdoP64vwSu8KGZOMAA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: -9MPV8C0OE5pJz9sw7D9DWij0EPFl0QU
X-Proofpoint-ORIG-GUID: -9MPV8C0OE5pJz9sw7D9DWij0EPFl0QU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1NCBTYWx0ZWRfX1WCcDn0ylsg2
 N0SHIpXuamozQiHrjn96dRdJgymbirxb+IehDgBNI/YszW44V0pXj/H0x0PgUVh2exF28IYaTeG
 NjMokofBlyeq5pYVwjtq6I0ovOGqrp8TV/8bUszasijIqd/MBabSqw/cV8r6lw+tvXplTuKklYu
 eyMqDIFesf9A+f80BIf3U4IHDHml2KfT61YkCKUKDGlauxeS0JEDHQwBYVJelxs92I/qWR6sah/
 gu7Kbum8jydUKhQSlQqR3vB04qeBMg17oiK8MqX9Aj8Aj7VhdvwJTIp42ep4aa/S4SwtnWFI1S0
 6WaDINvRi9lHCrovqOMXoOlXh+3jDIaQFnuk9+vI/v5oG9TchvMqyOxZzB1qNCw/RpG+uOMEqiU
 BjSIHC8kqMeOpg9MgyaMJFmJ+K0h4WkcM0WSow3FvBhUAcYVsuUOvmYVnRFl9iLAmdHZR50DRRn
 XtkTXLCzowiKkKjywfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280054

On 10/23/26 7:14 PM, Srinivas Kandagatla wrote:
> From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> 
> Add the V/I sense DAIs of the four WSA8845 speakers, the SoundWire VI
> ports and the WSA macro VI capture DAIs to the WSA Playback link, for
> speaker protection. The speakers now expose two DAIs, so give them a
> '#sound-dai-cells' of 1 and address the playback DAI explicitly.
> 
> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 29 ++++++++++++++++++------
>  1 file changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> index 58158b51fe29..fddc76f59557 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> @@ -256,11 +256,26 @@ cpu {
>  				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
>  			};
>  
> +			/*
> +			 * WSA SPKR playback-side codec DAIs plus the WSA
> +			 * speaker-protection VI capture-side DAIs on both
> +			 * WSA (left) and WSA2 (right) buses. One MM1
> +			 * playback open brings up both chains via the
> +			 * machine driver's multi_direction_codecs flag;
> +			 * the SP<->SP_VI control link in the tplg handles
> +			 * the DSP-side pairing.
> +			 */

I think this part belongs in the commit message instead

Otherwise, do you think we could bind the speaker protection
channels in the driver to avoid having to modify the DT?

Konrad
