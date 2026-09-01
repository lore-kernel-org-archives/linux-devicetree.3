Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA43C47F796
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 15:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277902; cv=none; b=mgioB3jiH454LkskaXNW228Z5jHVYwbO4WNZ+M3tg/E2QxIu7COnIfFrgTMdFeJBKx88GjFZXmi6ztCS2Ah8xSljo5fiJx0lSfmV5SJfVdHwKEtzq60vzA+eA3YIlUHgmUOv/LkSUO05SXsMX8vMUndnIJ9kjntL9HhSk6kY7AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277902; c=relaxed/simple;
	bh=09he5egQgLt2FlGKJ+y9h7K5tiRzxN1RtLaZYsMsDzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bbod0LSRqVllFe7GvhnZClsrK9kjDckIqkMlvC26T6pimqPMU0QrY/HhO+nOPi9wygKLKGnvUYlxWqGQ4V6A6RcuzQk1qdWQ0cl0Zz8CnAphN1tTXYlHodXUnTKJlRkMa1NU8lR18SzDHBHRND3hJgOQ8t4I0urp/hKQ3PCN+Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IBsCKrdy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=THIAqL4e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IBsCKrdy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="THIAqL4e"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8awp2270396
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 15:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FLXuthiikXhHO9knkRoRDESDV7G87cacEj+L5hg3O0A=; b=IBsCKrdyIOT2jJh5
	uttyGrbXTRm0UCmq8i9eD1TKAU1WOeAsHrZscqk5dOqB3fXxquXSeTdKTwKnpo+c
	ICEEqQ5yzwMm4ab3upzVwNDLVLFBcZKO3TnCcDx4KmXpHaJpfBhOU7B14Okwktcr
	JvhD/g17TzXNO+2yj1hMttje604egG4iDsQPC5wnUTOL86oZdnTdpV9RGMxEPou5
	8PTTN2czqg8JbbyW5MnlryTm/FEsCFTARNjvzfEzlTbnBoWz2hHcWd8+J1N7IP8T
	OAgNMbDX/QMvYo6UCWe+6gg6QnpKL6Q8YQMXJh0WEZbL06dhQZ8lcr9j50PmL7dU
	jhzj1Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdjtx45hd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 15:51:40 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7570225606dso3313137.3
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 08:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788277899; x=1788882699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FLXuthiikXhHO9knkRoRDESDV7G87cacEj+L5hg3O0A=;
        b=THIAqL4eFv+ZgSIXoppF/WEkA9RdTJtMeYkxnBIiV48whQ6qVXnOhaInOG2pZC0kZ9
         l9EurRaq1qAvBUViAnz3IiKM4jD/fmuFDXhuN3AAaoLdRTTOs4F6Nsv4DYQ9uQ22N+Tx
         pnPIf2flv/AYzEEFAwDSmjpwKOMpatS+7/8b2fkuFKAPwjSWKC9s7pMUISsvkomcIzQw
         AVPD/c9N6HRdpGcFYiQJjSmeMCAKqMWtSCBGEQp8/ZxJowZGsbUPgLcqWIUdpZqX2Q6C
         ZjDPo9w6Vi5GfiCZzKnbkhmXo5yemnv1nMnuEpN7FPBeTxsDyfknXrHF5e9F2gNMtSFR
         5WIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277899; x=1788882699;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FLXuthiikXhHO9knkRoRDESDV7G87cacEj+L5hg3O0A=;
        b=eFPtvkgYfHldqRDT8BSKOu9GGudC6tsptqyfCtipyCp3f9BAgT0leq40BoX4cLCpVh
         6ujY/mznVP+C0KQH3FO6mElNITv1WXyyu+XGh7MqjWxe2mZQ7tr3yNkBO1HuMVpSvsoU
         nZ2NcMHKLRs/6L66ZWKOieSPdG/FjPB6aw5vznjmuHytBTXXiAnxL0xN7F908YeQpOb8
         FMkTRk0iLyu0VF1LYQZUW5d2i20+ywiDaQCziZCvI44ODVUvtidp8+VGfQimH4UMdjfp
         PUFuQimYVIY71ZXnyoDILd4nRqPZsAQ5qNpSl8Cifsc1JtBxij/TaltyTDYWAQd5BlxG
         9vAQ==
X-Forwarded-Encrypted: i=1; AHgh+RrbfKuBEdpQuMV19BJrURkfiekuE3OAGI5B8lbba/0IR/i2F5FKuqHM7Ii5xM9c/4n5AvGROqBgV2tv@vger.kernel.org
X-Gm-Message-State: AFuF++nnHGzlLX9olgYEJWsd+8jo7rI19iuuCk7TmMrK72WmUMHtOCo7
	hYz8a1L8Ua/qsZrpjeKD4927C5OSOGeHnednlBcRagErgy2E0V+A7TfRoBUFpsKgiYNfbYqxNI9
	+vG4LiFGp/3UqhilgxB2I5+P/8Zk4CINqLWJtpeB5WBpL4RFhnQPcPpSy+f1RLDdx
X-Gm-Gg: AR+sD12E3jYi1Pbn4mTPCQXqhfZExAbdrpBZ9gQPKo9iyjEiMt9NtnrrDDCjiSDh3AC
	BGEr+bzJrFEX1FVcN4umJLmdmxEyxUjm2IDelhsILC827vNNeVa167WttGPUkPC6K16BBvr1qwz
	3WlsCloh/bl6tDwEs6T3YfJala8659IGSDjs+CCzj487Tcg/2BEIsTWjvF0GCr1lrM3s3E9pHAa
	yoxDLEb10xoNzlZGWFSnajjGOLJBR1gRJKzZPDcwVhOgrW3dtk3b8XwQnSpfcjMWFLwZzoLnaae
	Ikj5rm7CK5NrsOLdpSHIAqIlsH2+sFYYQan04bmRadmp2tvH+Deo2WYy3xzF3mNExQoqgYLvEx7
	Asbcm3ylRLjaPTvtezs4ktg==
X-Received: by 2002:a05:6102:f84:b0:779:7d3b:1398 with SMTP id ada2fe7eead31-78593425615mr4728001137.0.1788277898940;
        Tue, 01 Sep 2026 08:51:38 -0700 (PDT)
X-Received: by 2002:a05:6102:f84:b0:779:7d3b:1398 with SMTP id ada2fe7eead31-78593425615mr4727991137.0.1788277898479;
        Tue, 01 Sep 2026 08:51:38 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1b1fdasm630555566b.37.2026.09.01.08.51.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 08:51:37 -0700 (PDT)
Message-ID: <e7fd5417-19f9-4bbd-ad65-48230fb81c05@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 17:51:34 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/15] pinctrl: qcom: Add Kuno pinctrl driver
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
 <20260827-kuno-soc-support-v5-9-6d47636a8f09@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-9-6d47636a8f09@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=K78S2SWI c=1 sm=1 tr=0 ts=6a96f48c cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=4tAzDn1lkwtfZF03VZIA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE0MCBTYWx0ZWRfX0MhIPHwX3Y8X
 pxikslc8UWpDoXWXgHtnU0HStEC1I6iU84/5dWYruYLs/Uzx7MmkuLVRoIYpEE/19mEwUySfxR+
 6tOPgI7epcr1Fj5NQ2Sxi4SvIHW32vU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE0MCBTYWx0ZWRfX292JS48AIyed
 xFt4ulkFKcSvmhF1tDJpiXycfwZ/d5s3cpM6HNeLCfkNEuDBJIG/tThRmyWQQ8WLkCBM1Skol60
 p2+oF5HFKJgiTsALisF8SEJU91UYxoMbscvz7rmIYAy6nz/5u4lScAI1rxdsAscYWMyzQl5phW8
 cvIP/Oz1j/EJ+EFY6Em/4z4bo/QIyRfrDeiONP5veVsJyWU2+0XbYH7AD8guzzyU820DhxsCqMv
 CceLrUZQttLVTyk/cbospyNR+drngUtMBl/7DiRJyp4Qy9Fo19h0QORGWEBeiDbtuv84nQ0Hf8Y
 9p9DBmz0Fb42hxsfe1itAfln6cs5nRtGr3VUND26R7Z/FXZYVSg1os7AO4XX89aeQcN0Ys/Bpfr
 YfuZZ1tOwP46cKS9xjpEARl5hGVT4jRDyaR0cmcsDpkuXqAPOaYlCYL6HHBhA6I+jZTB1NqyHTU
 tQgXp1+V5FrbPHGCdDA==
X-Proofpoint-GUID: 2MvUa__uEdB-2dDORzTpk-IKxR8BZUtU
X-Proofpoint-ORIG-GUID: 2MvUa__uEdB-2dDORzTpk-IKxR8BZUtU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010140

On 8/27/26 7:51 PM, Hardeep Sharma wrote:
> Add the TLMM pinctrl driver for the Qualcomm Kuno platform, supporting
> 110 GPIOs and their pin multiplexing, pin configuration and gpiolib
> interface through the common pinctrl-msm driver.
> 
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
