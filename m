Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20233E122B
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 10:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775038654; cv=none; b=iEP9Fe+ItS3+lL0Shf4SH3u0LOAJldbuNA2Gmh2U5rwOcnkYKR9ihiBehPo+hFSq/fqd0LTrlWkKumujEtB6tpkb8ET52FmcbqmDhcXHwMJscQfcD3+nKtK6CvQVqnqQWUxXUIoyaibh8V0LXxXrdynzuuYZ5JZXZ5m9xPbUtGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775038654; c=relaxed/simple;
	bh=DEYocxncDAcATk2w+s2H2eB3AWq4kyjXnOqtkGx12Dc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qY7oTG3AOJ1mf+eERs0Dpyau3mnDOjXkN0Ss9CoWk63CWjbb+FzAkFj2kH/L1ENAPBNMkULLmzXw0fmFlMNzjMQfK+NnXYaMSU6i+8dDDRk7dnRi6D1jxW+eehgwfBVMWwP93SjgutBRmX2EyHMAvqOt4AJadqt+rT79Jx96h9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OWOBsNYw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I2fK4gxI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OWOBsNYw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I2fK4gxI"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6318wc9d1459000
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 10:17:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ZrEHXpdsAUJdgyqXUpeWecTZRtz5/SYnsoDlrdt2yg=; b=OWOBsNYwyqFutoD3
	Z9ArQxqvuc13m5ebGZFvxBQm6Un4zNBzE2JpD1RY/6S+EIviMQUcJU1r6deUkjkh
	kLBZs8VyIQ5QIEs/fLWfSrs4s7HJRFHmtrczmCN8l5gMMLIDW9JdHbxuCgTLwJcA
	VVP9ReZyKLf2RW9unAIY1Ci1byA/vFJKZJdehD33tSJd53zgagMVBuTuDPJ9z5y+
	UM1JFTOSVtD+FrMkzBDk1CZh+kRHOMup+Lm/7qrzjTEJrncItJ2oTbndAl/lRBuf
	K9y6ZNnhDTht/b3egW57zm0vmRESwWxbvTWSjRMxtxhuiI/nk/A2b+Auinyagds5
	3LRB8g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8uhg1kcw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 10:17:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cfbd336c3eso255139385a.2
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 03:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775038649; x=1775643449; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9ZrEHXpdsAUJdgyqXUpeWecTZRtz5/SYnsoDlrdt2yg=;
        b=I2fK4gxIdoC6VT13WDpD/DpInjOjJ+1v0L1kKKW6S1uTL9m0Z7cWCHjAZz3suT1De2
         gdIVp7Wvs+d1jDOk4vXi8RE1zbmIs6opsojp35YC4Ps78M3BrJTFs9OsDHi4DV4JQNmB
         GU8aBtwycr0L0crWZPZlYc4ADN2ta+50rBupUl8A7vcZdRIrWjFsuQBI426fXKDmBOzB
         a3hSUXVm1X3x212hh1YyhCriKaKyfEQPpg+bDsRwNne3kyV1uONDTivGdrScDNCsKKLk
         wFLRKR5ou9g+Wdc5FdBaC5/2f15hncdkG1HW3wyVpGdB0IkGjjCI1E7vNWKzfETv3xbz
         /RRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775038649; x=1775643449;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ZrEHXpdsAUJdgyqXUpeWecTZRtz5/SYnsoDlrdt2yg=;
        b=tJ6XOxW/4VZK7/seoj8JpNm/Zg1mjsOCbNe8hHz/e6wgE300Q5xh97SjZrG4qkfCLU
         eswwa8j09BwqiOoPt50O4TyuCB1hzTDtorgtaV8gElYEUlP6oJ+3nKnBKLVGrAtRagKu
         NadX5FV3h9QKBJaF8GEd7Zz3OiBha5J0bKztAmuypeOXm9rxf1FGru5x4PrOvJDTfSkm
         hcDMK1JYPq4qCKa2pru0tQ/f1xzwSSOW5N73cjSBkh3cjAlYGUHo9vQdM6OS2P/3kQ9j
         23S9f51HwCaqxg/486ukyrqp8X//uDfYnAkFvGJpE40ExyO7vQks9Fa0JkJLqeXsmx4x
         9FwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRfIuBiCTf5F5gUD8MSx9Ge6ofTymnsqgITYJegLrpy+axceQoetRi+qzsWuRbuYis/h1gilhiqkZi@vger.kernel.org
X-Gm-Message-State: AOJu0YyUugv6iD06U/cYilmy3oTtUcpfTy/l0Arn96iDgOQLwCUARh3C
	eKUKyA1CzweG1raP+Z6uA0p2KSPentPnwtDRU8RMHaM0Ka/y5mqD4iHvnHMnyGEib8xVdPHBA06
	9aViOjbl/ozbOSC8qdRnifItQwx7kMcm8r4cGJmzHMhLElGAxb25r5Wymo0aruTFg
X-Gm-Gg: ATEYQzwn8NFDRQjSiF5WO1/FoZVAtH/Wl25GukspqMMxiDRqPvyM/MF3yC1iPVmAMKq
	e9SYxw8JhHHAJEGYXMO3J4Ov1T26M/eb3sZaSHx7tyz59kYbf+FGU82CiQnHAHq2LPvkuLaw71s
	dHA1nr1x6B/d4C/XMjPuROk2OVzVju7a5Q5n8UsrnMk7jcV3z8ebUI15ot+zZ724CmeJ/FJMbdU
	QciGN5SG0GHmg3dPIE2pgCwIketn6A1SjNnlWQ2ty17HQMMe68xK/LZQlGaMggd5xdtsc01yZqV
	4kysOsMy27VKS7pB2yr1YKFmvXtullpTR7bwteDLrJxPeY3yZMKIr8P1gfl2hIc7n4Jkc9axzTu
	zX0tqUelTeSwP0gqUf1gXMYFq0MuNr+I7xxXv67ArXdBnMw3ND4oFT9Zr9gkwDg66xZJPhamslM
	eYEp0=
X-Received: by 2002:a05:620a:44c4:b0:8c6:ca3d:4e0a with SMTP id af79cd13be357-8d1b5b8cf33mr323796985a.3.1775038649601;
        Wed, 01 Apr 2026 03:17:29 -0700 (PDT)
X-Received: by 2002:a05:620a:44c4:b0:8c6:ca3d:4e0a with SMTP id af79cd13be357-8d1b5b8cf33mr323793685a.3.1775038649096;
        Wed, 01 Apr 2026 03:17:29 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66c5b0f5c6dsm1303774a12.15.2026.04.01.03.17.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 03:17:28 -0700 (PDT)
Message-ID: <18ea1ce8-8d55-4fd9-bf13-28f59c1f43e8@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 12:17:24 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 15/15] arm64: dts: qcom: sdm845-lg-{judyln, judyp}:
 Reference memory region in fb
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
References: <20260331-judyln-dts-v7-0-fbbc4b7cc557@postmarketos.org>
 <20260331-judyln-dts-v7-15-fbbc4b7cc557@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331-judyln-dts-v7-15-fbbc4b7cc557@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA5MyBTYWx0ZWRfX0s2Crhs7IPAo
 LNew9/Z+ZpZL7AlV8ev9uoH5twvnZUlhoTrr3WMX8I1GL9eN1YIEw4wF3QvOLprscwRVy5AfNNt
 ooS1uqFK3WLtUttuvwwem0Fq84ReRe7Ajvd8TW/kv/SFU1S433wa2vImzH3C8/ES5plb7tmLX3L
 q3LYLP3HXsPZcAtlL8oyMkBWBae4akrHQWsTwyR14pz0xkXK3z+8Nu+hz9by2EMS87tcZoe9KY2
 3ItO5Jv1GI5trBPkT5A1c5lpWNvjJSomDA8WrNEukrDoqoalW3dco+lXfh+SGSmIFLlBJhXb7et
 lwNmf5k5ZO9sT9WnG7y9/aGbdf+GtKPpgic3bS0VDNb3smDMwB5oHofz3+Fvbs2EqjIAo2YCqY/
 5X2Be/HO4J6XB6//pyU9091TG7AlQclL3LIxIIOhyiofb+pzrOoV6cyiynZBC7LgYV483f/0HRF
 0M8dy3mLNZPGWm2oH0A==
X-Authority-Analysis: v=2.4 cv=YcawJgRf c=1 sm=1 tr=0 ts=69ccf0ba cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Gbw9aFdXAAAA:8 a=fzFPyQH34aG_WpUDus4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: HKJnJoyqzb_tMxBcFwRv2ViDs40Vi8j1
X-Proofpoint-ORIG-GUID: HKJnJoyqzb_tMxBcFwRv2ViDs40Vi8j1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010093

On 4/1/26 5:23 AM, Paul Sajna wrote:
> To prevent duplicating the framebuffer address and size point out the
> existing framebuffer memory region instead of specifying the address
> manually.
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 3 +--
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 2 +-
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts   | 2 +-
>  3 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> index 85dc4468b6c4..86cf4eb44084 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> @@ -98,8 +98,7 @@ spss_mem: memory@99000000 {
>  			no-map;
>  		};
>  
> -		/* Framebuffer region */
> -		memory@9d400000 {
> +		framebuffer_mem: memory@9d400000 {
>  			reg = <0x0 0x9d400000 0x0 0x2400000>;
>  			no-map;
>  		};
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> index adf41aa0146a..83e392907244 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> @@ -16,7 +16,7 @@ / {
>  	chosen {
>  		framebuffer@9d400000 {
>  			compatible = "simple-framebuffer";
> -			reg = <0x0 0x9d400000 0x0 (1440 * 3120 * 4)>;
> +			memory-region = <&framebuffer_mem>;

Because the node no longer has a 'reg' property, it must also be stripped
of its unit address

Konrad
