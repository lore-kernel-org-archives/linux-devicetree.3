Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC6E3F39D8
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 18:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791397054; cv=none; b=HE75p0Q2s5GorAAoGVQ0woAIbEDhAITlMFSOT/+GhC0ohsUX2v90rIHdWLF2TI2zq5LrroJmhd5aBgec5P39jt4IyfaaAClFdHggvEP9iv3L3PW1W3qbS0d7S9vtQxrUDMJl/qwOqwt2dF7hE5MjYl2vhFJw1wB9eIoqJtolUl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791397054; c=relaxed/simple;
	bh=7p1E68LhKBh6yTqP7m6fWj1obK2raK41V5zAFLXEVsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XmTHlUloclf0qpJVzBCW+AFSZcLQVDn4/peTH/7wXJa3potKBtVPjoD2qZ8WnUlWHeu4/3Yi15fksEfMlzvXxZ4+gyIB8J1gDfbQJvnztf9sTqbvYMFfD0VBacP11ozd/snOr7Kr6fDuChgMnhKKvgt5UgZaALgbA6IxQBf4yMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FGEjaKTK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X5aiF7Vu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FGEjaKTK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X5aiF7Vu"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697IBEwc1494309
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 18:17:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HzfN1dEYOJJZLs2bxJwMzeI90eUiWQZ53IXN9K6O594=; b=FGEjaKTKiTMns4jc
	ySHa7nijzGtMIzNX1sSiTKtCsnriO7FROVZ3uqr95gbCSh1QEPWJTvdAjroTzvh7
	vYcPaHGJ6Ni6uDM+Kqv0tkvF65ayaBCtGgwTBk9gPPqQX5HrxgEOAVQtIbMNMQMj
	Oo91QuNpT9Dnx1I0182YQ5mOj09u9Wpx0oK/t9LZzDnhtmCbBYnMGadTb8IYul7F
	3Svyd2viG0xYmLfiWAq2CXnj9ztrwoWhjfIZQs/5z909hqEd8GRhoJ5FtXQHXuTv
	PhFEUlCW70YfasD5eZZt+1tvYLBw8YdQm5heGuDGBChfTtry9UsR+gRyN4xv+I4o
	b0OzSQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fc5awkk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 18:17:32 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34d62bb27a1so18169022eec.0
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 11:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791397052; x=1792001852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HzfN1dEYOJJZLs2bxJwMzeI90eUiWQZ53IXN9K6O594=;
        b=X5aiF7VufxbQ3JvAMC/hUbed3VLnfnx12umhu4tmEqd/+d3db4ce44RlTzEMbimAM7
         NzBBY4lJgBcAbhk7zTbojhj4urguvi5sePGz17UTNx7NgDXCiuSUr+DydiWeFGA80Dli
         NCEaKq05ii522WzO9j3JREycqldAWK+QopN2tRDEMWYpav8WmwKL6xPD/Pl/D6Ix6PMP
         NxTQTIoS7DpEfvUH0eGNvlnM7objfscvwd06tnwFb8tfhB+c6kgPSoIsK9ncOZar8xcH
         jbjJUG/f1b2J408LBAJIBTvN7xBZm9qaN7pvD7SBu2Q1CvpnJl5spxF8JJTAb9zL30Z/
         FQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791397052; x=1792001852;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HzfN1dEYOJJZLs2bxJwMzeI90eUiWQZ53IXN9K6O594=;
        b=ravcPxCsmy8nmiOMAP4vnU7g1dNScPFFiZdh01uaOLDmKIv0dSuzJBSApUmqCNdC9Y
         Tva0GM/chixhPJMQl1gz2Lau+zKROrpRzzruF9LrWggi9FNuMhxWsHJjwPyWqM2MQwwH
         tFfqakx7waDhhtd/trK7vvUqbXDi5/PcjOxj6mxhUArLcivRuH69FDk5tBndB7oRTwAM
         OAc2MmpR7IUgbkUf4f1KqfKKmbcb6rqvwb0rL9GlTn3jz25/GzTjJaK4T2Sppl+VIZjT
         H1gbGfHMTapYRV9LRXOjnfzqayv04aZ6ZYrIUYe9O1vVcJw0/4yWIR+QfvNg3xGweDv1
         SpjA==
X-Forwarded-Encrypted: i=1; AKwUvBwiQx1xByC02di915fl1qSk7Jqz0VMh821WHnKaNUInVIf+xKc7NMnNtVGK0QJKF7NA34n1nhAszCbp@vger.kernel.org
X-Gm-Message-State: AFq9FYLAv3/uRVzorcCQ2nxmGc+MdcqnC7+pR4BEFbigCkykWv+4hI6i
	jB4+1Ni98fV+/4tR9X+EMhbKwpk279OdaC3713d0PYfiCv99XMA/Qnn+GXZAiJsHsa8OmEd6SYT
	IZ9fYH+Tr7aItpIyFiJUZ+wxFzGndngTOwBmKRCfOAlXmOb6v50CxoHPGTeapfxA0
X-Gm-Gg: AYBFou22QIcawJjRNptdg+4z6Ha+PTKEyolwv68nosxE1W22G9GkL+Ea9P1c0Q2wVm0
	+YzFqZBFXS8642+lVgouT0rHCRG6E1IHTJaURFh3rX2CM/PRmgZo5PKns65NKh9twTqFw6OzZ6S
	rjsfv2Jxsphh7+ra7gWX+rX+8ZPwHDhs5W0QmnGZ8ytumdRg8pxsavKFcSPoKjCVTWV3YMjkw4x
	/nyNe59U9iFgbIDDrP9Biv57iaWbPGwbSDUXmDLW3CLXRiXm7qYAfCofCzJRAcDTzzsE0uIMUc0
	HcnLce2zyoNpdVXhdCQQS+yHV3SLpw4gxLMzwFIh6SzBS7PqJ2UVWHJbNZ326RcTPMvXtlp9/Zk
	co/LBxJZsFoC6/fXz1dcPmV0c2j8J
X-Received: by 2002:a05:693c:894f:20b0:351:69e8:d419 with SMTP id 5a478bee46e88-35169e8d438mr1958408eec.22.1791397052081;
        Wed, 07 Oct 2026 11:17:32 -0700 (PDT)
X-Received: by 2002:a05:693c:894f:20b0:351:69e8:d419 with SMTP id 5a478bee46e88-35169e8d438mr1958297eec.22.1791397050030;
        Wed, 07 Oct 2026 11:17:30 -0700 (PDT)
Received: from [192.168.1.12] ([223.230.93.214])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351735e316fsm980093eec.11.2026.10.07.11.17.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 11:17:29 -0700 (PDT)
Message-ID: <126c4b96-f50a-4ea3-8df3-a7118870a5a0@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 23:47:18 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/21] arm64: dts: apple: t8103-j274: Add
 speaker/headset jack nodes
To: James Calligeros <jcalligeros99@gmail.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, ajay.nandam@oss.qualcomm.com
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-10-7b47ed6335a8@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261004-macaudio-v2-10-7b47ed6335a8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA3MiBTYWx0ZWRfX0CQ/lH/dMzbh
 y9G2gBADRlRfqIQCvrKq57AWfkwQtXlJV7WThNzSgswqiPxGtcBu+oLmWT+0fokVKIGiTY5zUPq
 0eb7lRX9x+3H+Ggyc+z0EwldjFAIpZo=
X-Proofpoint-GUID: xB0zAuu1keWZfLrY_4M15yuO81nGoYYs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA3MiBTYWx0ZWRfX21XRBB4a/oXY
 7tEa1IN8JweiwBdXs5ytm0ZZB3k/vKxoBhL2FrVKN955hDFZf4VkfHJdR1GwyztWasyebyGuISG
 9xXF2t7xyBI8wSoe1HYzA/1CfVtaP7q6ppTFjhlbfyx6PbE+hqNQxWYctIINYwDCYKWggQm0H6T
 zSr+o7UoR7SF6EQWM/EL2BBJ9EzsH2dcK9qHLjvSlXnbnhOkjPWPbyrqA6wl9LKXVvpmUs472XP
 2wfPeB6L0WiW1gj3gCk1sbfZpbG+oayFe1dJZia1s6BWXgTBDSV92QO9oJyEswSWlGDOp/B22hc
 8JJ9ItXICGBDixKHeuTi2giKVIky3Vynn9M0OrFqcQcYyUvAG+cdlUG4AUUVGNBwUaU3pFpN8rh
 eXNvcHyR6fFTPr9RBNYq5xFEIMo1z4NFcwhN4rjsxARb8fw2SYcPRVufAE3i37z+R9BnQOCbg/+
 hLqIt5vzw/+iJDjW96w==
X-Proofpoint-ORIG-GUID: xB0zAuu1keWZfLrY_4M15yuO81nGoYYs
X-Authority-Analysis: v=2.4 cv=a6+lZkSF c=1 sm=1 tr=0 ts=6ac68cbc cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZXy6yrx+fn+bJIgs5eQ1WQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=UKJZ3Gop6vG71Bmy1WEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_06,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070072



On 10/4/2026 11:33 AM, James Calligeros wrote:
> The M1 Mac mini integrates Apple-specific variants of the TI TAS2770
> and Cirrus CS42L42. Add these nodes and advertise them to the machine
> driver via the sound node.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>   arch/arm64/boot/dts/apple/t8103-j274.dts | 67 +++++++++++++++++++++++++
>   1 file changed, 67 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/dts/apple/t8103-j274.dts
> index 1212852251e0..6121e3a89a0f 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j274.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
> @@ -75,4 +75,71 @@ &i2c2 {
>   	status = "okay";
>   };
>   
> +/* Audio codecs */
> +&i2c1 {
> +	status = "okay";
> +
> +	speaker: codec@31 {
> +		compatible = "ti,tas5770l";
> +		reg = <0x31>;

The binding documents "ti,tas5770l" in 
'Documentation/devicetree/bindings/sound/ti,tas2770.yaml', but I only 
see 'ti,tas2770' in the OF match table in 'sound/soc/codecs/tas2770.c'.

Is the expectation that this node should bind through the TAS2770 
driver? If so, should this either use a generic fallback compatible, for 
example:

compatible = "ti,tas5770l", "ti,tas2770";

or add `ti,tas5770l` to the driver's OF match table?


> +		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
> +		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
> +		#sound-dai-cells = <0>;
> +		ti,imon-slot-no = <0>;
