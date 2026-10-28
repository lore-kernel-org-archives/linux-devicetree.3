Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198267;
	b=lPsgrN6+l7P0ZyXjx2/kkHEXCIu/QcPRLpvrAa+e2B9t0bU7hTWFGKmTBa3CuWWO3gnO
	 gS9bAWFrDaZgSyimlmuZvys9PAjPHxZiYVEk6sf4aHijzcZ2zBFrtB6wB749RnosBBoNv
	 skE1UaX0b14ZQQBUuRO4fICihYkPeg1B4Iw2+i3QOvXSNUNECyVdAey1quIYigVb/7UNA
	 /HdiD9DsWF2cq0NWdU/+X95eUCzXvmKQlEvL5NQCpP2sT130zU2T2MtQOCtMwiEWeyYbi
	 gmuhJr4QwAywhmlcRVf/jtphplDLPMUN+sHrQR+I827GNQtS+BxxDUoKlII7B3lzO6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198267;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3DAoL+yUUSVahEuOLyD24m88+Cfx9LZgZjspyLIndDY=;
	b=0313GHHHTAsON/XIUfiXr2COfOs4YQ3ABeL6jiaaFzZxzhoujlzrHUNDFjrpo/gNpLUm
	 0bwMgN4AGcLpZITGAu6tEhe5Df7ghEceBD571fvnYNlJd2m9OHuVbhySSGX8oJJbSQJfZ
	 QL7rJQjZmbvkzEaZpf4PwkvyvKB9uICmxBKnuts6Pokv7HE7quuVofzIWYDzCUwdqTY7J
	 q1FDBIUwdQWlgds5eOjehSp44/1IOlWeM8JSLqEwObBcS7uRehn+lZFJFByw+TfKg4Ver
	 kbFrRHMJeZIm9RiB8dhna4NzvBx7SeqWntFole80etBbuVMxo7Cv/gaxh62fiVheFkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FVHWF99a;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MqQ3unHq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F21606A31E
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:37:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9F21606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FVHWF99a;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MqQ3unHq
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBeAjd1606932
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:37:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3DAoL+yUUSVahEuOLyD24m88+Cfx9LZgZjspyLIndDY=; b=FVHWF99am9gDr43l
	/MBzYTpcJkCmaJmT/GUjkKS5+m8Z6Hcs/5JOnOZZKLpOHZlL+WSrwBLJtrVcyTP8
	PgJpYWqEOMGojhA2Ya+g8bpbZyfoHdbaRByTv6JcFoPQQMfAmxl8lD9dGjlsWd3d
	gX70KW7uy6zlEmverd/ApanB3UsFStWYZKR9q9GNusuiW6l+L137WR4G5QLqogdt
	TRchHeWnnDaJ4IqT0frQqv0zbXG/bS9R6wvqBIprT+Jk/0g9FVc84whZuYe9y8g2
	sLsbeoaXqP1QUiAJcYKuzc71wbUcvlsjvI9a/1k1zct4vLF1soVgFPE0k7kxhf0v
	Z3USAg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk7g7jnwr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:37:45 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eae4d7ebd2so99446e0c.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 07:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793198265; x=1793803065; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3DAoL+yUUSVahEuOLyD24m88+Cfx9LZgZjspyLIndDY=;
        b=MqQ3unHqxsCb5N7+MkV9hsH+XFJ3H2V0d8mhOdLsLf+Sl3YiNsJN6ekBNbYaGNhlSH
         rHzvGdofDFQu2vcxG59RIz9K97+LfWzG7qZB4JxJvqr3QOzuQc2sl1X2QprR9WJX91cR
         DWox09ls/plGBKUPHp1AHy/yq7jnBC9LiGCR9fbiG3dQGXDMu6lpuWlHfo7Ea+9P0a9E
         llLz75EKsUmdPon/5oy4kTQIH0l85DGNZmIfV3w4JD9Gm2O/q83Waqud+tvhheZbM/Tg
         t5ntZmK1BGKLkTAcjFq6d0fEwKqq23/LOR807DGwu/2vEIuROA9QO9ujUDMHVbCj77A7
         1eoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793198265; x=1793803065;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3DAoL+yUUSVahEuOLyD24m88+Cfx9LZgZjspyLIndDY=;
        b=bl00UTIWSK7cIOkUyXqdQ9BQpm5frDsEYUJ7njyvrSWT3MeKbduT1q95GNS8vU26Y4
         eI4/Cow+rCKPJv/t6dTqBt3qBhVvwlwIPrJTZIHJSDSB49opyyCAZtyUnkZkyxK/6P3P
         Jle9UMbVjnShAeHyTv0sUTUyo1VeDIhpyOWeiLqQqfG09KQfvaTkFof/mVxf1yVIh+Bi
         rxm8CiEidyOP2CHFdd2qUkNGIdiUly0JmtufZOLlxBK9K9mB0P3/wxoteNI257hdpU2C
         R01XyrVdt8JZDcshOvCHHWVHgweItorZHAeGWpXmwsbY11mc6EhSN7TBKivQeIqLQiR7
         +Zvg==
X-Forwarded-Encrypted: i=1; AKwUvBwE0LhFuJHLSljmxi+iOrXjeUg+KrTRgKUNRjlHc+uGFZcz/GMFF5E2P/8tQlYf2yxUpToM+mNXfI6E@vger.kernel.org
X-Gm-Message-State: AFq9FYIMPFqpYC+3lS8V7TLo1DfE1h8TtEw5NfbZhdc+agjdRaccSurZ
	ATzGI9b7/IPLhQVm8GPecnZud4Q0srHyRFzxARoaTf+KEIMAMUtfCuOlF8rW9CJe2lZzFLqZko3
	lO0e88SKMvZomnxb4oo9+2WrEGvhidm3PcGOgVScmRemHtRr7TI/eYAVwRLfaEknj
X-Gm-Gg: AYBFou3HMgzW4URKejQUSPT1EJRYPD3fbiIMLE0VCgJnQVN4+d14fkqm/2Sqjr/sRuM
	jEWQLMhuf2lUrmPeQRvxLvIQ0d23BsFyf+8ucKpoqye6VEBpLeWdSM8Dzlrct2n8vjTlxY07C5K
	Ur0xcbXo8C17sudkyXoCaC8B7v/EYTzt+k6RatCRyMWbsm/bh/zx8lnP/4RPod0jYMxA82E4R/9
	m1uRAmb6L32jz8RTajrAkhmz47+Y0CmjeUDb1F+z35jHUEfKvYLq5jHIWdHfNIFhc1v5hiD5TKa
	43jopN/dV5MnMy8Am87TNYXCWDQKFOZLFJeTomgaXBo/SNP4AXy6++eIG+51iyE1Ezl54Hkx7PA
	WjwlpxfKK2B+MUTHiTw4hEMM4ywU2RKOcLfLztchNLjXjG2TaIzwQ0vT0JjY+2Njx5jz0CeE=
X-Received: by 2002:ac5:cd5a:0:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5ec4cae6182mr1211477e0c.2.1793198265184;
        Wed, 28 Oct 2026 07:37:45 -0700 (PDT)
X-Received: by 2002:ac5:cd5a:0:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5ec4cae6182mr1211449e0c.2.1793198264694;
        Wed, 28 Oct 2026 07:37:44 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e784esm601408766b.19.2026.10.28.07.37.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 07:37:43 -0700 (PDT)
Message-ID: <ded7f87c-74d5-423f-acd9-efa83a472c2b@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:37:40 +0100
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
Subject: Re: [PATCH v2 2/4] phy: qcom: qmp-pcie: Add qref and refgen regulator
 vote for QCS8300 and SA8775p PHY
To: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        peter.chen@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260916102023.2054761-1-ziyue.zhang@oss.qualcomm.com>
 <20260916102023.2054761-3-ziyue.zhang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260916102023.2054761-3-ziyue.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfXzHyrx4M0NqhN
 jRS8Ro13C8m5WnVUVapDcbgU8RBorJmZ31xfU/LtSavvZqA+4L1HvLF3w8xQG3qPIhzM4sqhUCe
 fVbkluJgICo50UreW2Kz5aNEh4DXIYo=
X-Authority-Analysis: v=2.4 cv=SoIFe/O0 c=1 sm=1 tr=0 ts=6ae208b9 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=t5PPnQQkLeIUCWTc9swA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: 9ZHh74eU6fZYg0NyG_6uCuxYrfRIcaDL
X-Proofpoint-ORIG-GUID: 9ZHh74eU6fZYg0NyG_6uCuxYrfRIcaDL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX0gYnAqeul79V
 4PKW0xyZbtIUInkHzVzFaEq5blhh6rvT4TdFrL+hsw0X1i2m36m8J+JfGHAdHsWBGCYi57G6/fc
 2QUImQEvOHWwUI1QtKo2dZ+yi6OWR4Zf8cgdCytOGgmRicNtWVGPFT2NQJE8f4KbcBF7dRKK6Ik
 QGOre+KkEofOlhGXUBfknVt4NpNcv3wmczK9ZQp92GWB1qpxFj6pd+am0LVpJbswsXHNdHyg46l
 Pf9nfwT94Q9tLMPwS2CEpYYMddwEDCOpNZy149qanBA/g7djVeqPTHveLzkRgJQfr82DN68Ildf
 RzSVpnU6m35jShXDZaCqp58BzvGiNV8l8aXV9lBUv7AFLQ++ahAyh4i8cW6hkcURQ46UHKiJhov
 3d/tz5tbAZq93HAxZw6h3Ac0Hu1MKFLKEv0XEM2lVG4kHWpwbVw1jBTBcz0nP8+5R5yyO3VHWQs
 ZkXHd/I32DGPZD3y76g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280058

On 9/16/26 12:20 PM, Ziyue Zhang wrote:
> Add a new sa8775p_qmp_phy_vreg_l that includes vdda-phy, vdda-pll,
> vdda-qref, vdda-refgen and refgen supplies, and use it for QCS8300
> and SA8775p PCIe PHY configurations. This avoids modifying
> sm8550_qmp_phy_vreg_l and breaking SM8550 and SM8650.
> 
> These supplies were missing from the original driver, which was found
> to be the root cause of occasional system crashes observed on QCS8300
> and SA8775p platforms. Without voting for these supplies, the PCIe PHY
> lacks stable reference clock and voltage, so the PHY never becomes
> ready and initialization times out:
> 
>   [    7.303119] qcom-qmp-pcie-phy 1c04000.phy: phy initialization timed-out
>   [    7.309948] phy phy-1c04000.phy.0: phy poweron failed --> -110
> 
> Note that due to a hardware issue, QREF actually depends on refgen3
> rather than refgen2 as documented; refgen3 is therefore voted manually
> via the refgen supply as a workaround.
> 
> Fixes: a05b6d5135ec ("phy: qcom-qmp-pcie: add support for sa8775p")
> Fixes: ebf198f17b5a ("phy: qcom-qmp-pcie: add dual lane PHY support for QCS8300")
> Signed-off-by: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> index da83358c97ea..ab81c6e584a8 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> @@ -4094,6 +4094,10 @@ static const char * const sm8550_qmp_phy_vreg_l[] = {
>  	"vdda-phy", "vdda-pll", "vdda-qref",
>  };
>  
> +static const char * const sa8775p_qmp_phy_vreg_l[] = {
> +	"vdda-phy", "vdda-pll", "vdda-qref", "vdda-refgen", "refgen",
> +};

I think we could grab them unconditionally, as QREF/REFGEN appears
on most/all SoCs (perhaps with regulator_optional_get so that we
defer the correctness of this to dt-bindings for any specific
platform)

Konrad
