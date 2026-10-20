Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792477938;
	b=Z1bKNEhZpn4aDqTV8Dq5UyDBUmTIuCY1rYLOln2DBlYfGfejfdUrD7MCefU3A8WJZTAD
	 4WWOVmzJjxaazAsdmF9GXxB4hlA6BFTlpr5EEdCfYcnTpSiEXFKqgC2QioFb8e9ZsezUn
	 wwEUk9YmD8IMxnrbhF0JqmqihowlpAmKDdiADUDOxjDnY1Wmp0Qrn3tIpz7gDVKytUVQH
	 6UWE81CTZ5NKb5DsnLkQGwexH6xEHRn6IQsNFuLzhx1TVeqwyZDInUwFdDH3UG1y4y4pv
	 xk8XNIhJs7p7P97OnQlzqKKRrW40JtWzb5Y8IytfsWYEBft0hmxPrs/UvkStnFFIv+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792477938;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tM4uJzcUE8cGnYHZwlKlpkbsbDNLRDuDbEkZ2CKoHi4=;
	b=jcp0Bf1L2bznesYSjgfvifEpTz6iQAXFYlYZNq36i9f+88oEcV8yxE75kSkX0onmCS5r
	 dGAYRq6MtpWiyEE0/PLigjPHXsCTDWmZT1aq58cQv/Si5Xw8XBmbodBrCK/6jD4FFVTZE
	 DiJ6B9BSg8tIDPUZ0LDUMIgMqCGw+F6sQPir3eBfKFW2irejkOr3BVfaC1aJ7Rpvv5SCe
	 mKD/tOV/QTk9tgpmuxrTo3OzL67nFmcXPB1PcKBvB/d8UJ+zvJkZ5Q/Msp5QdWhFTAPi2
	 r2h/SNXPznvUXyPuEVpTJO/JtFrvupunoUFxEg3RuEWq1w0XwnwJAKkxq3plsH5c85g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iAKdP7Q6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YjemuhTK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2A4606A31C
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C2A4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iAKdP7Q6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YjemuhTK
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tI0L4178063
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:32:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tM4uJzcUE8cGnYHZwlKlpkbsbDNLRDuDbEkZ2CKoHi4=; b=iAKdP7Q6l9EwQ+FD
	k1vMbc0KJs1sjjcBfe89BztPzmJH9eXvzHLjXTCa6yOTNp1/9lrM2dZWD23/NLTr
	7GAVfv0/rgOEB+x0LLpPCx/omrDuCsBC1i5KlhtnugDmOX+lEce/WFb/oFPugeos
	8QG3BMNPJl27ntPV9bHX0kBe/m11TXGWzfU4DbZpSFf500nDskx0SX44jzqEwBXE
	vxp5Xfz6lIQH7HYBSzWzDHYdhcBChKBCUcbz0D/B9W9lFLWaPd3EehHF1rL0Xnkr
	pXH2dqbvHJPkNTFShtvOPUigaPFpVVugDQ/STAdo5wb1yAQPvpSWceqQmR3Bn4pP
	2OKAmg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n15f1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:32:16 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90c4d46037eso4526796d6.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 23:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792477936; x=1793082736; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tM4uJzcUE8cGnYHZwlKlpkbsbDNLRDuDbEkZ2CKoHi4=;
        b=YjemuhTKYgxZyoW0gTQqAe5YWqmsDPEvVx24+nzApkPUwvbCI3af9SRbSIEYjcw7LR
         1cixsj0o1VsClq0KdzuciKwlZYMNJWLMEkbX68VpBK1SEHXNZZ4iTnBeOkPtZWLhEq3Q
         w59cuXPOKPCVvvwKDTeHBRP+uAQ1C0rPT+OemTwjCbZ0v5Q4dG2DO2Ls/tY4X6mIeiC1
         yH/dyLkETlRIYzV4L4PZ8yOLYzrEa6Sf1H49ACCXhoWzmH8TfPrmTJMOerSQiBIeSdq8
         m7FX2vO1LL5nQlsQwsW8dElRbO6HYR1QqoKCNd+bTXghBDKBQcBuwo65MQJ+2FL3lfge
         jPfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792477936; x=1793082736;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tM4uJzcUE8cGnYHZwlKlpkbsbDNLRDuDbEkZ2CKoHi4=;
        b=BgHjm+zVPKR/iAYB5olSkz2QHRaAC7x3VIPkBLqLr/fOBrl/OgqucqoupcGl9wF8g5
         UA4LkjeI1nrSq/hcewCUGxI/MZpIDOf2rWC6nbygPPL766FQL/+POjmPH325Wd/MxZn9
         jWfhKLQpkjCb77UGBGz511i/EkeUo0tsQS0ldsqZRBYY+uU8CLsdMDF3YGSCRp66nfAM
         O9ih99w9Kcf381Tg1oNikCdl4Baw1plLOPKhTqn1RzsRWth7ezYXuWxytp1xHWVvYTsD
         C1kNeQ92+bWjnKpCG7RVOpbQRYbYZfmduCJsER0+RUcgvjAOXWRNTKLHGOTTCXZ8H3FJ
         oo2g==
X-Forwarded-Encrypted: i=1; AKwUvBwma1SxST203wFaq7zi7OVYZeI0sK3WoTDG6RwIIHsv5C41SSsbJb1ma3JNDf+mFYhKCwv0GYKDDNCw@vger.kernel.org
X-Gm-Message-State: AFq9FYLSawkd7x//LFHYDpl1v/mpuznQUm8sd2iPoLG2CoiyvGqQpP2T
	ifp9lY66vTFx9yZ5nbcq8aYi2DXLcxUIdyYBo/s5dmFdMaRavyT6vuaFpscqAzuYga3QUkr4bdH
	Ljq42ajPUF2TQAy4IVvN8f3tISfhoQURCHaxHGGZGnqRWMM56AJkCEzHi/3a4FeuZ
X-Gm-Gg: AYBFou3N5YakzhJgubmXMBk5+2e3PEP4+QFAz4ttrFNdwyTYdwZF/tVdAbfbQp/Rz4/
	2YemwIphRiPIezfWhFiQEweu6zQgVl5/pdCpQekqLwhdooLIR+N7ydpA5JhwOMKCAYFkMHI4whD
	mB2LIBjmgKKtPhWp/8Xy1seIdhYe/QyT1ttccP/DNFG3aMH6UZyidE3rv9JO0e5dohlw9ERgSFo
	WWBxFGNQKlO53kQMgxQNylluJrNX7ZttsWdi0+VlRkcqkUxbW1MFhyG62Id/POH+HD4D3Z6wDEn
	tkTyjxgSic7PlNvRrHtYU+g1c6bQ4F3KqtE17CbKqx/EJUFyj9aui6NNSkPRKpj6IAeBl7xJzHN
	ompUa1ZVV803ovlZnLMBDaA==
X-Received: by 2002:a05:622a:164d:b0:535:6cc1:589b with SMTP id d75a77b69052e-53645c2aea6mr173775291cf.1.1792477935510;
        Mon, 19 Oct 2026 23:32:15 -0700 (PDT)
X-Received: by 2002:a05:622a:164d:b0:535:6cc1:589b with SMTP id d75a77b69052e-53645c2aea6mr173775201cf.1.1792477935127;
        Mon, 19 Oct 2026 23:32:15 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40913c615esm446762566b.42.2026.10.19.23.32.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:32:14 -0700 (PDT)
Message-ID: <d01450d9-94ad-441e-855f-540f45aefc82@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 08:32:10 +0200
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
Subject: Re: [PATCH 03/10] clk: qcom: gpucc-msm8998: set the droop detector
 bit in the right register
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
 <20261019-msm8998-fix-clocks-v1-3-370949e4d8a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-3-370949e4d8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Qarz8dqlZyVOaDhNg8f2-FfLTVNcpyl5
X-Proofpoint-ORIG-GUID: Qarz8dqlZyVOaDhNg8f2-FfLTVNcpyl5
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad70af0 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=d4jy3kBXdueBcoqUgmMA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNSBTYWx0ZWRfXyW2d6PlpFxc+
 0tkA3qNFWifXHxwcNxiUB/6WdC98o94Yee2nChWtjpwy+3d1gvJfDcqWGzmswjJWDHjOsPmjKbU
 WZqsLY9l4qSBaCDjmjgb8JXev9Ax83MSQoqgA15KWI/mwuIdv5sDbZhZ4HRIiooCuXiRD668zFo
 5rUmQoofjDv/0DefDJyuG3MWK2ju7Y0PSK7oLmuyYdV/WQEQMTM4+IEcBsLRgaCvnu9am1W9wEK
 Ude/xFvQhhPRGA6U84tKA6DjXc/t2UVSS7lKykClN1chCZkriW0JqvJXxquVWPFs1EIFyx70D9y
 /elnslaqQv+xK7JOZENksIpdZYCCGnEwjvRKqPEBTJOc3HtYzVBcdhCqhZ67VY6rsXBwe4vx2rw
 f0or2l+b89KHVnHsVpyUtabcq6MpLJ/vVZtOeIpNMm138/3qGie2AP5BFh5iqsvXRmMSIhcpRPD
 J+pgXdAqVViRC01aszQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNSBTYWx0ZWRfX15alSvyHtuMo
 Iaan/81vzccIeG+Y7y9j4X5EXNKcattY8Ln55b8y7XCNt0Ep026fhQz4aNrhCOJHfH2yyxYUJrc
 uAeGtYslM+hrrnAdJ6ct9Etul07rjh4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200025

On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> The probe means to power down the GPU droop detector to cut the leakage
> between the graphics and CX rails, but it sets bit 0 of the GFX3D branch
> register instead of GPUCC_GPU_DD_WRAP_CTRL. That force-enables the GFX3D
> clock and leaves the droop detector alone.
> 
> Write the bit to GPUCC_GPU_DD_WRAP_CTRL, as the vendor driver does.
> 
> Fixes: 3f7df5baa259 ("clk: qcom: Add MSM8998 GPU Clock Controller (GPUCC) driver")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gpucc-msm8998.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gpucc-msm8998.c b/drivers/clk/qcom/gpucc-msm8998.c
> index 066793e47f79..8da10027f1f2 100644
> --- a/drivers/clk/qcom/gpucc-msm8998.c
> +++ b/drivers/clk/qcom/gpucc-msm8998.c
> @@ -330,7 +330,7 @@ static int gpucc_msm8998_probe(struct platform_device *pdev)
>  	/* force periph logic on to avoid perf counter corruption */
>  	regmap_write_bits(regmap, gfx3d_clk.clkr.enable_reg, BIT(13), BIT(13));
>  	/* tweak droop detector (GPUCC_GPU_DD_WRAP_CTRL) to reduce leakage */
> -	regmap_write_bits(regmap, gfx3d_clk.clkr.enable_reg, BIT(0), BIT(0));
> +	regmap_write_bits(regmap, 0x430, BIT(0), BIT(0));

regmap_set_bits(), would also be nice if this was moved to the new
driver_data. with or without that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
