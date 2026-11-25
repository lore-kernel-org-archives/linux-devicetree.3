Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603838;
	b=ybZ1sWHgCZsLv9NbkMZLkkH1aeswPooAJj5MpEEAqbSrQJ+ZV+ZInYOArxDLBxIJQW8G
	 WKk2hyv3AvQ38CKxfXoMqvJ+B+7onduFwemWvdqSSiOl18Z3KBj44dRbSdb+Du5A1A11w
	 KFACFgPEJwHIg+ZF1m0W2X3DdLOsqOL0zyf8UjeScoibtAnoaUukAzATsAXbZqzGJQuhb
	 8e7YXxczBHJFrQFBCMikalUsOcfSlRk5fDrDlyQQefavWZDUcIFVT4pHKl9EKYG60ezVZ
	 l0+xPaO0VKbxR5xTmNJAi5ZbmoHiQDZDWAl2WsSvG2tLXPU/sOmz97baaVJoXfjQ0gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603838;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UvouIqI63TSn1C4q0DezWEvkmJNltGoCbWvIDB5fyEs=;
	b=XW5/IHv36H4C0yjwzZILmaHgVGHVlzSIk/ZL+J4z/QIhQvB5a+/Kg19fgQ9HEKl0mf7c
	 YGBmlsUcmTOR4GJ1U25x3ZXhSm8tOdxJeZbmg2i15b4J+CYs/Xyzkxo81WhxT69pHSzEW
	 r/f1PBbwcqEa3QWG+3nVorxYuI0XziTrLn8/+kh3X0xodqlK/hR5B7szkJLZVNtqzVwa2
	 hnD7SrLna5uHmYrpjsdmYmW7FGBj3P5lgWsdOzbgg+PxSawfm9KCXu81oSQUmk01dOmTn
	 L7hJMU9x6Wx6MFSQF6d6baNmvPVxcpSUwHf34oF5UhwOIF4TxyyhDpzxdQOcVYU9+Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TleGhjP9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=adri+XPa;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3009606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:50:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3009606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TleGhjP9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=adri+XPa
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mOSH555534
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:50:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UvouIqI63TSn1C4q0DezWEvkmJNltGoCbWvIDB5fyEs=; b=TleGhjP90vAJirP1
	uRWTJF5wFA/lIJlTCjId0A1sxByTdk1IgbbIx78cD8acha/op/5lohbRM8uKTlli
	o7jVVhkkt7pxpNf3Xasjb+aqLsyGZnqz3npkOaBE+cQrpWWScD+Tqh9DQIRcaN6R
	fIgVAYkl51dEHr2YUgREojZ7FZ9Cz6SIPY6beMDvTuaCKVFlsih74P/m/FXasJyl
	ZoCXDoCoX3EUm3x2TL9M7MMPzjUuxaySsDDdLlW0LJ66gjXnQpSqbAu4C5cRtygw
	uq2g1BxGdjFr3b2x4ogetoIvDYZOzxyfzCWd+FtCMB8iRD688BYaaJO162v8Uag3
	ZbXnLA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnrdsw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:50:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495e11a684so37420785a.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 02:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795603836; x=1796208636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UvouIqI63TSn1C4q0DezWEvkmJNltGoCbWvIDB5fyEs=;
        b=adri+XPa7Snh7QJ0HVyWCvU4eP/G2C+eLAsAqFPeDoZ/LDTygwnFtTxCz51FZWcEL0
         S4MevqwM4o5yO3zE0g+gun8yBxpzcijQmR9GInPjEldMfKqORAHniO9lq/TSV2xiz8jt
         nmHw6drjFHQZyIWnl4ofpoj2h+aIqrEQJ7c5KORwLtZ0mXGmtWwPEJmIlNFBwCE+e0fR
         56hmdL7vBmUpm7UP+0wcjamFTXGjmmlW0A5wZdemPMcXccU20kqDQnif1Yw66lfn6HH1
         tx/a6tJvSq7PyaAJxQp6KyuWRv2fFFjxHrQuIMEMtnlTHkulLq6nJU8tVviKz2IGs3Mv
         sSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603836; x=1796208636;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UvouIqI63TSn1C4q0DezWEvkmJNltGoCbWvIDB5fyEs=;
        b=1vpBSUDiS0Od9XDQePAVd0HvXkSInuzr18S7muYMHc/v7uGiK3CCytKNa8usZxX3cx
         3ubEdd5xiGxkzTbp6awWCwJd1egesyOFmAlfwn8XxAQNkr2rUmYdvOtuhgOvumLXP+Ri
         0KkaFmlBt++8JoS0C9wFNKH76f5xQ0XrF2qL+EJAaMPi5HqdBNSUIKcKSblUJHA+qC+k
         p0hCJChzU6DaeFJfJxDqkybtzbI1MVw/vOCRvBdAst8Bl9ju8QD/CO1H53NzKXjS7wZb
         lERYJ9gVi+lUyVxiZXPcpIf/nJGeOwzHPgNuwQqTrnVyJSGOIY8dwhBXlxjxlqLMAld+
         pilA==
X-Forwarded-Encrypted: i=1; AL+hErFoecY3PXZM5G4eFfamP4/oa2ndNVBw5CNopsefuNG3qo+Uh5N+n6hFLF7g+Xfymiaqk9Dhtm+NKifQ@vger.kernel.org
X-Gm-Message-State: APuU4Z/zO7tVfd7BpCdPYtjvliAYSsSQ0lyeYV/d8FJkIMQCfqNIynIo
	FC90O+H+W8fQ+iUw61CuwOlhsRIAzOFJoLLlI2bL3QKg6JjT09b0dBz6t+LnG4TyszfXTGDH5qY
	BtB8IvggVOpILbbXsSR3tN5OO059pLwv+Aax6qCoiP/CNIrui10gvEDD7f1qbhuEU
X-Gm-Gg: AZFdTZe4NdgvspYpfWjvXgpF7lT+0xc7xydAg+HeXQ+YBAzfsuHmdW/y0SF1CYpcgbW
	tDBaLZyWNjjqku435LPyoMTQujIghDbGKTz9xJskj3yNYNNy2dFr3ae9Uuo/5C+D8iQEgZneFF0
	sCMW9loJqkxTtOPPldPWk1BK9cBhGs/dYcp1622Lz1pkSE0OL9OY4BubUQcFS5/HQep6ipAmB2d
	RwjnvtBjIwVbLAJDIDL7+IvK2U3SBvFI/vqpEhcTrrKtOBjVFDONyoyHnopIs187QaE0yt8aNpZ
	xtzhbLzxQSeClBtOP9/YjA0VQFPoaB0WhRy4x0k/K+W31N/cncanDyStdAkjkliy69bORsJpmvb
	70YuqpEpYMzN2QNJTOie2W96rQrvdc5Jx1mx2C5IOVUo5vDkMievIR0Wnz6huhWpz1irJvHs=
X-Received: by 2002:a05:620a:a50f:b0:949:a6de:cf5 with SMTP id af79cd13be357-949bab1db0amr3229762385a.5.1795603836197;
        Wed, 25 Nov 2026 02:50:36 -0800 (PST)
X-Received: by 2002:a05:620a:a50f:b0:949:a6de:cf5 with SMTP id af79cd13be357-949bab1db0amr3229757885a.5.1795603835728;
        Wed, 25 Nov 2026 02:50:35 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea31e4sm624414666b.39.2026.11.25.02.50.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:50:35 -0800 (PST)
Message-ID: <51e487c5-b18e-4940-9353-ef5300c51122@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:50:32 +0100
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
Subject: Re: [PATCH 05/11] pinctrl: qcom: hawi: mark egpio as a GPIO pin
 function
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sean Parker <sean.parker@viasat.com>,
        Stanislav Zaikin <zstaseg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com>
 <20261124-qcom-pinctrl-egpio-v1-5-34f2c06b2658@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-pinctrl-egpio-v1-5-34f2c06b2658@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MyBTYWx0ZWRfXxMeCYY0sz4u+
 CNpKKUKrkCrDbV68SghjSTRq6pFXCMa/Lc++Hfq9mAFmw8Upa+m6y9HgsrUJ05/DtR3o991HwZo
 oUg8ep91DEP1DIWhncKIhX9S1iPFeZSHJQ7ieE8zX1J0B09+cWruDWXtdr732mlw+4NA9JpQBYO
 1YmH3zEEQlh/BrxT26civzqb7FZ1JGlblgWYTGS8xFtJ8gDf9kN2qffEksGG2txWD+u1nHNMV4q
 0g45JcuE1rigzp3jASJ5a+dH7tZgvll0Kaw8/FUc+sWL6eRxf2Z4lU5nKXE+yEeq7A3YDMGbGmX
 BCdnsgzIvUrw6dvL8V6uiyjXF+nt5hAVO0kO9ZuNHcachNnMlirMiCW1JQ9xK489OEEAMtx43r+
 OIWQCUi8GPziG0NcWuNQUM+nSVPfDwfeRHcWo2s+i1LFcuNts//eqrw3QnLomGxFfIXyQT3nemJ
 6MAoU7mYJle5i11YLtg==
X-Proofpoint-ORIG-GUID: 0pP6mBYGZFc_HowPe2tvfsiIeWVyXAZr
X-Proofpoint-GUID: 0pP6mBYGZFc_HowPe2tvfsiIeWVyXAZr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MyBTYWx0ZWRfX2kUhZhWap0d3
 cE5mozmdAzh5ZEiaqo8MndV5AN5BHNvBEvz6bGFHX0fTxwz1Ms20hUVQGA4b5FKWme3HQC6Qa0q
 MYioA23s31hs3MCX2n2U1G8DncgEPn0=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b06bd7c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=cf3dnyIY6h9DwwF8UtQA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250043

On 11/24/26 3:29 PM, Bartosz Golaszewski wrote:
> The egpio function in the hawi driver is registered as a strict pin
> function. With strict pinmux, a pin muxed to egpio cannot then be
> requested as a GPIO.
> 
> Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
> be used as a GPIO.
> 
> Fixes: 90700e10d2ad ("pinctrl: qcom: Add Hawi pinctrl driver")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
