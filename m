Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC97C4A5C50
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 13:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440461; cv=none; b=TVlx64J2Di5A1jipmKya7l5xqeflijzq6/onIbQkNFCDzdw6VsCG5EjrhoHd1+7ypzmR0dx0xX9EPbj7Z7rz5YUBF9ks4OI76T9zpD7yGF9CHwLkgiTGjugv+STT3st6qmLd2R2cmpmAGwxdJVdzcp+i1YDdwv5MJQS48tZ5uY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440461; c=relaxed/simple;
	bh=dngGBJhK/9kgo9vJC75xcjb2iG1GFJUHs0W7aqvJjec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DeOdGPhAECOVbvDEGPngZ6TusXTNcDb9gYNQVef2lLKbC+kfsbO63EnzcB+Yf60ZGf+TCAkuzDcgPrhjRURDpPmXUNUI8e+DlRNEaDRk96Trw6kXHPX7ZOtQO9kQvAL1kckx9+iQjNLN79CFIRBL/MdNwpIGxiKK81eakiuEz8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hq1tFcTK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BwddW5Ac; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hq1tFcTK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BwddW5Ac"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHAZY212406
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 13:00:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7olCBj1l9bJRK2LK0lRET0Ob
	LnDUTxPSDB9xFroQwFg=; b=hq1tFcTKBfXI6zFiBjx9sVfm2ksuP3V83Be1RSC+
	nfwDsHHuWeZ8964uwhzm9U/rfbr+3+smtImgchO2Kya/eafmPRUsuuNyyZaWFVwt
	ejozT7B6RB96tFKLBN8u3U/EgbSQZMwyhgBaoxaq3faqPsT5O25SEOMqnz4tIH/a
	1n2kY0RThDT2y50KgR9b1krOOHmuklBxE+/p7WNoQoc3+R02vsKulDNEHqehavJ4
	T90pJbt6qi91wC3OmWrMccV0mF5MXJZGY3Y2+QKG+9tch8RYwSZGCw/1e82XO5ke
	8rYuJBfyRw9KzOwlczkO1r2OyxzuQv0SHt/6i93SR9DBSQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1pyhywe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 13:00:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936708f129aso371187485a.0
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 06:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788440447; x=1789045247; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7olCBj1l9bJRK2LK0lRET0ObLnDUTxPSDB9xFroQwFg=;
        b=BwddW5Acn4SItln+gQxVT/qFT3KlusI6/Nyvbh/i/jlPX6ndcbblHT4yzVyMPpVhOm
         eFYVHhKllCTUXqVLj7dMZNhn3djVKRytGLSFwomyNo8dVFSRY67eV+wUn+4A0v3ap4/9
         vFrw8qTkYDru6P+ok1cztthYhor6f0G45a0kEGas3ntquzzkjFYskfZchvqgPO5K2tAC
         6weAGNBCQwmFXvpSI8JmU+TG08ZFWwZke5vtR67BRt7+FaBIQ3cPfWH8+0ndZ60mjh99
         w8HpD+hsKq8IxSkPpYx1bwihdSkUqTPsDSA7VYeNvxwhcS3rtfAvCik1KioVlxFVVzuo
         uAiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788440447; x=1789045247;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7olCBj1l9bJRK2LK0lRET0ObLnDUTxPSDB9xFroQwFg=;
        b=QSj8iMoWIjX4ZZiKudjDIjCAERUmDQ+CMCVjRpPYpWhYodmertfpcyYzWxhrAv8AcC
         mlyKBsL+vdC386FbiGCmg258HK8SwGPWhGe8hYj3LdA4J4owHEMK7euSBfM3OyEoTxEB
         pMDEvhvPl7oNX8najyFEb015RN5fh/KDqU4fz4KyhQbZapeOwk0IUsz8ZTNdYhS/v+uD
         KqZbGCC+6NtLMZTPSSZmSjjJFvWj9oiFN2k/GW3iqHPa7Jq0AysyYVtq417uRVVzGXRC
         jfUbuoW+P7gf2fB3AU+CaCWXXSSyDaI7jBBlFYpau7QODhype8agxURrw3CjAllyesBV
         O/pw==
X-Forwarded-Encrypted: i=1; AKwUvByCijBeF9Q11cS9Wj0lhSx0BjWD9ngc/fR9RxxIMPGh5IFtwCaXLfKeebznzlXCJkF2WXCsOva3opDY@vger.kernel.org
X-Gm-Message-State: AFuF++ksRTqNaoZdm97liYkAhZ4M+JFAWeMReSxXBq5kN5Ql4kk/okJC
	WK1Bt30ikQE2rdP9tOUUD79c753NWpRZ9FsN/zc9IHdUXp/xrc8pTo2NLlukR0JoHY0I2hpk9eX
	9uRxr5197nrxeMnTz1+kvcS1SXYXb+Wvs4KBI7D4/G/BytqguQQnxCVrkN30mAZ9e
X-Gm-Gg: AYBFou0S16tpF7QyhyG7iVlCTvldjaZBfRIfr+TAPWaJjsFu+ejqMUil1neF2yRW6ui
	GZDohnzjC9oyHjTA41j5aqEmlaKiQjurvm09tre5C7/Bt/XopOiq27r/MQ3OQLc5AItWp6SnBby
	iNaomaNImWbyikBNvXCKwuFoAEIuxRk/jyhwHPK0N5CSQ/O8KFnG5IxifLBKRQqx+8jC7Um71Oo
	zmsTF6esS518JdsUuCRZp41uWW+IuswI2IQ9vsSRGHdoURUQmjTCL9nhzzmfsEz0lcxMcpc1OWe
	fp/lmCqvsH4JT3pUuGsNbRIzh0CmXeNYeDfwxaxaSWeb4VMPfYFKMH0Qe/45Q+IuOdVXPO7cZNR
	3zZm/Uot4cfzs6A==
X-Received: by 2002:a05:620a:4504:b0:939:6de9:d52c with SMTP id af79cd13be357-9396de9d824mr670058985a.49.1788440446679;
        Thu, 03 Sep 2026 06:00:46 -0700 (PDT)
X-Received: by 2002:a05:620a:4504:b0:939:6de9:d52c with SMTP id af79cd13be357-9396de9d824mr670040785a.49.1788440445779;
        Thu, 03 Sep 2026 06:00:45 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ee9cf7sm14617219f8f.25.2026.09.03.06.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:00:44 -0700 (PDT)
Date: Thu, 3 Sep 2026 16:00:42 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Walle <mwalle@kernel.org>, Alex Elder <elder@riscstar.com>,
        Daniel Thompson <daniel@riscstar.com>, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: qcs6490-rb3gen2: enable TC9563
 embedded GPIO controller
Message-ID: <jtfr4spaxfofaygwyajtc3y4y2pfppxlmsv5bti7qikh7up23m@555urwkjq4mm>
References: <20260903-pci-tc9563-aux-v2-0-34c625b542c1@oss.qualcomm.com>
 <20260903-pci-tc9563-aux-v2-5-34c625b542c1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-pci-tc9563-aux-v2-5-34c625b542c1@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfXyoyr9D38q5Kd
 kQKlGT9c43mPThN4f/EC3ZCYuwLCVB0RcBkB4CL3DI4kmvoY0Fb+qzW1pL1tJlVbbqEhxs186Vr
 19M4GAcy+JPs0IgfpEZj17j+db6KIPL+LOq3ia/M1DgBFwORSvDwnLYZHVoH3pFtsYm1j9PTuJi
 LFKZUfDy7f6SSgI3Ue02w/qOufd9Fun3DFRv8L6M1/eL8OAgEt/d40AKoaDVU08++cBPbpLNTcT
 /YrcYzv1UzNxH+L0JaPET8XyEDUaEiIjEUnP2dW28zpUqFLFlh1kgqR+P7TMryWICQlglqAD/OF
 O8/PjWB06bfDpJrvhbpaNXp9axYA07gHnNSQAWmPb4TaC8uFTm3wkkfF5kT2zDQ+Oa+7klZdpct
 BXTzbZ9gaAfayry8aaHpWAdJzQbT6hGhYzTu8R7As4Aa2WNiZM5tqwdJmH5UgPavCrrkUTeemUx
 /0+Nbuhby9WVejGrPBA==
X-Proofpoint-ORIG-GUID: UK67bmAoT71_EMgD7IIlMbGZ7CVDLjc9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfX3Nitna8eNckY
 Htz8vLzx5ib9oSJkBPd7zZmZvgwv/0UxY3K30CwUpj2kZDlCNwkeJKn3An+O+lhVcd6e2gEcgcO
 lpNafdOZjWAPj1LZpvftoCLRYf7hGs4=
X-Proofpoint-GUID: UK67bmAoT71_EMgD7IIlMbGZ7CVDLjc9
X-Authority-Analysis: v=2.4 cv=DMO/JSNb c=1 sm=1 tr=0 ts=6a996f85 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=fFHDuP4XVuiI0RsLl8oA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030113

On 26-09-03 09:53:01, Lorenzo Bianconi wrote:
> The Toshiba TC9563 PCIe switch embeds a GPIO controller providing 37 GPIO
> lines.
> The controller is registered as an auxiliary device by the TC9563 power
> controller and accessed through the same i2c device.
> Describe the controller as a "gpio" child node of the switch and use it
> to control the PERST# reset lines of the two external downstream ports
> (pcie@1,0 and pcie@2,0), as expected by the TC9563 power controller after
> switching to the GPIO descriptor API for per-port resets.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
