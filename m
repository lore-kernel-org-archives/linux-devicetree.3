Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36873353A8B
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 06:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790575410; cv=none; b=ZZdQ7HgwZtlWpOZ1ZTzNown3tgR1BqBYD+5IGTd54YPsG6f+5m54vRyUlTpzPIKBZPgUbh1A3i32QNLAMRrnfk0mXjHvtC8BLfpqTOLr7y512UDXMDm6UBoZ3jpllyt8vJWslr6Oh2YaQhB7aJEdwh3nddxnfvcBNGDwdCa2qJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790575410; c=relaxed/simple;
	bh=jtBGmV+G6RZCfWl0qfmB7ipeAzBeiwJeiJ/xug/77Cw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Js88miZ/Ydd2Ej9cvqV3/FxaV0lFLKguywE4Oylh68x08RoIji+lYK8NmTFFHf6xdJ2OQ+g+4uumHatd7eR8e5byFdtrQEgQ0NikVcGpcP6G+l24J39L9WR41JvEEyd45djnW+rNvG5Lju6UPJjW6SUXhc0QhBFuWHhGwZvubt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MwXyitkk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xc+K/6UF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MwXyitkk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xc+K/6UF"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S0Skvt1566098
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 06:03:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TfllPCpOYcD0Q0J40ZUWiBiA0eMH8gTidifWVXwZRKM=; b=MwXyitkkxn0o88VW
	l9uaPIO/lY4hQjuEshUjTOfxwQkdFJNbJIC0x2nXV8IPoAATJPp+VfKXE/zzGZUq
	7AxOj80knHjC2avsCthYU1qqiucB8vcecCMW8FTfVZPvqrVtD2iTPnvPG+TZmnKz
	OA4LQ38+62mzKc1gkv6N5ot1OWCQUX1AGVvGbSNXdMTBqiBH6SIw9/EapQtuzpjC
	tpYcvEvzYJupGnDV+Kro/VYrNwrYGwr2Plc0/uKe3+V/wEIVJ2w4ZP9tGBWV4ang
	+l6dk1hIOOc1RBADy/vhUFthXpbi6SCtw647X+H+yFZI0nVr+ioHqSZn4D580mPZ
	SoAkoQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx5mwcrnj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 06:03:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-530d86d40acso66527451cf.3
        for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 23:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790575407; x=1791180207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TfllPCpOYcD0Q0J40ZUWiBiA0eMH8gTidifWVXwZRKM=;
        b=Xc+K/6UFd7wRKWvb/Ox0KwgBpmbsbcVUX175cyWiIi9LiNpPzwAT5Ekw4xLIzPxEDU
         zmdJVlGGgD/oulcZoPuVcmy/x5BtwrzK6cGNFSeM+LniwRuciYZxeWNOzj07k/jpyyZI
         P7rbFGKveyM6kQq7AnfSDi7YNILfNFz0B8N98n61tt44dH4N3S0ZGjmD6bs6+ty6o0h8
         i2gnVESLq9sLrqZWdNTuQ5j0+r3OPy5lH/1EwEhJmmrBzCg73Jlr08enIP5lUU9i7Gq9
         74aMH7Rp58Eyo6Aa2LWfJy+rKi4AT4W7k6XS3kRScBdKjXRRvJAMpmvO2a66NID8yTcO
         FUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790575407; x=1791180207;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TfllPCpOYcD0Q0J40ZUWiBiA0eMH8gTidifWVXwZRKM=;
        b=wRcyzFtD7OC/mFc4ijBFXSRkIsyvztIiagtZQRbOLmlrAPZXYBtDl2edMJz6GROZ/l
         E9WK3zrlw6hKqawk20BovbwajasPT2vDhHO3zt6zTRsDbOpNHLRBMG3SZitMwzJJI6dM
         9lbj6DGq3g3L3a8h59R3YVpLRZe0Kz9SvExPpaEHL3LUom7fKXaj9kKVZ9xzRxNdyAgG
         uXLgEawSGtlSeMd2lFZCDntUpNzPFoCtUeNrjij7DB/4bD6VaeTvEV/hmCaO1jGlnWgs
         i7bVMGYaZQaD454+xNztNc6UVQcTSdeH43V+15Zpzc+YkTHZUvE9tGeNgsUM6a5qMEF5
         QJ/A==
X-Forwarded-Encrypted: i=1; AKwUvByaDPtI/kipLvmBQ1gqSTQQlBOY+V4lNWP0JW4rsWijchlpSRn/m9ztgoOObKPgijFJ/o24pb4B/sEu@vger.kernel.org
X-Gm-Message-State: AFuF++lar0PlZ2NfXEIR7UYFZcLtJvu8GEGYa80V624CfjxHJB+lORoM
	mYmkOColglsp90oFAjh47jAW3kJXoyP8jEkiv6xxo3+MCrxFYWajleLmMw/UrSDv1iWfTdP9ubc
	eAnq1iZXEHfQdnqTF3+5fJmHyx33Yg5Mr5nHgr2z/qrFBD7KP/R5/C22xthqMlLr1
X-Gm-Gg: AYBFou29PkuPxZqd9ocS3Rw2Gs7mpoi6aDJw6U+vnQzR+/swxozpojp/Lo59rHhGiDt
	xp5tq9+Z5m3LZLnQWVkEAmzvRQtje6Tv7NQJMm0ptLvYFYexm+DW5vi/Mk/6ixwbHefZJUGtHWo
	7Dl9MqGXd2ViqY06XhOISiDCYda5BtQHTcApG+U9s9vr0v+ahgXAK/XfYCsya/m4mUQaylCSDq9
	+/aAueHZa/HK4UAx1qYaqfRX44GcgJKr+IZy5oQnL/lK6b9kx3SmdAhpRwvSBZ/DAdYjNqewSrL
	x1+Co0O6a6rxG1doqc6Ibq+1uDVf+ky2uNE/KRqnUk0v8u5q0M3BqAkqvBy/9XvRsWkPsUUEvSk
	lp3UIE8zqsq6euETa6VQED4ttVjms
X-Received: by 2002:a05:622a:580a:b0:530:8853:1be5 with SMTP id d75a77b69052e-5330dbe7652mr183345921cf.10.1790575407223;
        Sun, 27 Sep 2026 23:03:27 -0700 (PDT)
X-Received: by 2002:a05:622a:580a:b0:530:8853:1be5 with SMTP id d75a77b69052e-5330dbe7652mr183345631cf.10.1790575406762;
        Sun, 27 Sep 2026 23:03:26 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0017816efsm113080805e9.9.2026.09.27.23.03.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 23:03:24 -0700 (PDT)
Message-ID: <8499ed1a-df9e-4e5a-b609-3da8499a47b5@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 08:03:18 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH 1/2] dt-bindings: display: Use consistent
 indentation in the example
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Chen-Yu Tsai
 <wens@kernel.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jernej Skrabec
 <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Liu Ying <victor.liu@nxp.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Francesco Dolcini
 <francesco@dolcini.it>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Marcus Folkesson <marcus.folkesson@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Russell King <linux@armlinux.org.uk>, Simha BN <simhavcs@gmail.com>,
        CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abel Vesa
 <abelvesa@kernel.org>,
        Chris Morgan <macromorgan@hotmail.com>,
        Martinez Canillas <javierm@redhat.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20260913123331.100293-3-krzysztof.kozlowski@oss.qualcomm.com>
 <179057359762.92994.13773102514654073802.b4-ty@b4>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <179057359762.92994.13773102514654073802.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GGhLQN4anCAkbWW2k3PvXBD4Vg90mVlQ
X-Authority-Analysis: v=2.4 cv=QvPLTlyd c=1 sm=1 tr=0 ts=6aba032f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=chZs0_0Ys9iI7aL1xjgA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: GGhLQN4anCAkbWW2k3PvXBD4Vg90mVlQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAyMyBTYWx0ZWRfXxhjITno+Gv1H
 Hk35klpByOkOLSm8pX3bI/bUgrg8kki7Zon7bV/Bqjr0WgcDs0gXy2qMBeIMhCAqkdOXhJ4SCta
 1Ceyx0j0wDEuvuWtpl9hlxUmnUou43O5Hi0OdCr29aqYlLUexFkVgE3w8ekp+i+zFDOPn6ORzoE
 nQqzdPARM1PxCr8Ur6gz1jyuXS94V0Ruz2x34ZCqlGdTsqnGr+v+P3rz6d3fInyMAND4Vxtctkm
 ux68R+h59KlGBoMfkDO4xMFrlhU6+CwZGdf1xmDPFo4gvFew0jOJg2CJmfxELTF+ljxvFf4VIgj
 YQgOOlUcUnJrwrlQTGxaUgWr9DoVKtdP++CdWEjoWIdurfjG1Kwb93X9pVrjE00zG0LJLvU248P
 Ybi+DflUkOY5JFhW6PpXD5FdKNi+pyggUuQDXAGbvE7yBW33f9YGiyBPC6gf/RJ1UwOU9oUVMVV
 OfXVitvDhYkS8N7ZWjw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAyMyBTYWx0ZWRfX/Jzsf4CwXLUV
 +W6h8Hv5rXcNoeXbyIqs8ELyEweIKntBeqm6i02g4mXi9Gy1uhDT6V8pIwQ0KUdBwkdR+0fEW9G
 vofIq1i3NkfDrgIAD36cdc/JxLJweiE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280023

On 28/09/2026 07:33, Luca Ceresoli wrote:
> 
> On Sun, 13 Sep 2026 14:33:32 +0200, Krzysztof Kozlowski wrote:
>> Correct indentation in the examples to consistent 2- or 4-spaces
>> indentation to fix dt-check-style warnings ("example 0
>> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
>> re-indenting entire example just for that is too much churn.
> 
> Applied, thanks!
> 
> [1/2] dt-bindings: display: Use consistent indentation in the example
>       commit: 370c5d9004f8b754351981d59fc26851bf943e93

Thanks, but I expected no one will pick it up, so I asked Rob to take
it, thus it is already queued.

Best regards,
Krzysztof
