Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402900;
	b=zi6o0+GUrWmF8EO0elqdq6NCatWxoCXnS0e16Uh5WhmD6OlfFm3nFleO7jwDQsKLkNnb
	 hAnBkyxKDbSHAhC8iWqK74xBVRQpakx209sn92LEhsMVaCI3Fqnpz2dQSva8IXiC4dUM5
	 KQA6boJIn0V6U4dgi9C+zuShvQRc+nqantH+iaCE+Hth875YH0JKDSfxM4bVHeZI/P7Q1
	 I9xxH3PO2BzWYO6A4r1v/3isSe+TSruE7LA6wV0u8ip8vyz0fx72hodg05hVZP0YBZ+0F
	 besBbskWTyOs5rGRbMNXyLkroHGKoUs+fSVY/9ghOgE1WYoogkiSkKhH0dVjLvOs6Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402900;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tLARcSRWSvevnIhYpFOUnFGS3qKDWwMnqMdZ7F5zyEw=;
	b=110kGnNJfCq2JkKvV2RrfY4JBmgHUe8qPC+F/4bXV+NFPs+f7KQvy1RcdyECsa2ebhrZ
	 l9q6QyQBz2kdexNd857d1+c92hLMwCc6pp0BPz29DFCA+EBJvZJwFud9xRU0NmeI0cHmv
	 MW/guIfqmADQEndFVxwKGkvirFO2M7NaU5CDb8PrtDA1VZ3eQ+iU+KBi5ciNVWUBMSNly
	 190OQY+PjSO5aNquaE8y4D3OiQ/i4bWC+163XnkPWu8oX22ajd27WXBnnNAA837ZqVEKU
	 70nDr+NzM6OYb1mQuSa8kddKj7AYMWKb6jwvIwgry5g9ZjX8qcQEPefT6hUiP9RUQoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wqvouyij;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="am6zN/4D";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8077B606A33F
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 13:15:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8077B606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wqvouyij;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=am6zN/4D
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCYv7n3291898
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 13:15:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tLARcSRWSvevnIhYpFOUnFGS
	3qKDWwMnqMdZ7F5zyEw=; b=WqvouyijUrOk1DUJ6M3CdlTnuxWmS4QaeFAd3EwD
	dhrvlSAfVfJL+z5egf+CST5PQpaf3ezbv8qWApbEdOCiYEv0YTIN0wK5p6+Epd7L
	rUhTle486WvNs/YrxHY8/814TV9WQ+ZdHJIZMPs5C1sFVskfoaP9UF1YSYHqbOpo
	vYn9332qpC3woGUO6uBUHMN4BmXgYYMr7YDMvouidZ1vmAor0PJ+C1+JVdzo82/k
	MSJ/tcIS0LLK64Mi4jTF8R7EVQnqOhWukdQjg0sdys23+VgGa3jO6EcKfLf/o+3v
	7S8CNY4iOGbHA1FOXAEe/mxCxqaoF2AWWMQAf0qt6HkrKA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnp2ma6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 13:14:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb98809caso533153785a.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 05:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794402899; x=1795007699; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tLARcSRWSvevnIhYpFOUnFGS3qKDWwMnqMdZ7F5zyEw=;
        b=am6zN/4DANa5qTOawCYw89Ivzh5rTeyzSPoDH+dZIgNgIBcLZBa/9PpxAzCELSHqbX
         qBPKPDO1Xkq1ZBYpEVesppLfup6wePvXimSzpjXpbrdjIx9LOSHvVqWwZzi8FUIF1UyH
         2PuHaMNPHCTsKLSXlOBKtRa/q9SZkU0KSgBQX7n/Djm/MbXM/j4/ZoOPJeRFVLlNfpyg
         gJwhHyuW1Nx8OaTAOD6pjkM+Rs80myYMtkGz52NKRHNJ25HiaV65cvXCZaHKhsTSGNr4
         +MpW0zDo1cO7Uc/fM58xoHPcI7I3B3si21Bb3YBvtTvxQQ9sTlUhWTWXTpfE1PHaBmFT
         i73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402899; x=1795007699;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tLARcSRWSvevnIhYpFOUnFGS3qKDWwMnqMdZ7F5zyEw=;
        b=OS2bsEBQ5+uR0bwpxpJzIXHSFCB9Xx+Werh+4c+Kxx0E7dlRq4uLHqBkqLOLM++CcC
         pIm9aX26rjYvACJ3wBk0HKc4e5dBz23ClumL0XKTvAyzMT2EBeEXMwDNkICgTYc2388d
         ig8848Rv8RqmC6a30dCXKC9LGb8oktmvKZgntMZxSKoZi8pPjXdak56Lcg7UkP93tc5+
         kKSIO7+oon4+2H2ggfo59r1Jr5+A5tFWhnGK750wc/dJ20BvFgCakKapX0Y5AJPFaawV
         XqfH1XXLrCcNOAkKL1S7PL2JPsz7mK61vGTYAxJdntJl1aclxf8sz4pi3r5Y6+74h6CJ
         ibdw==
X-Forwarded-Encrypted: i=1; AL+hErHadJfzWyHzlpIbfpmK0zZZ0MJoMUfXQ3S/78GV5uWPNyBHcLtxfLEhnNUFrswOr7kMO+JjE9DgRM34@vger.kernel.org
X-Gm-Message-State: APuU4Z+IlMnAyp+4UE/Znri5bMgh1VYLfYRG8ccZsgLpmBNbOazYX18p
	IUyM7FNWYmLJv/5CsyRHcr4egmjUE6A9LPPOvHT03+dTuFlJRe7VqACmi1nP7POaFDf3nWH9bij
	ZbdKP0PTClwCZ0B66ij1h6LQB/G7VOc3t+0eYgOYKhobicXwxvN/lTcJjfDEQDvnq
X-Gm-Gg: AYBFou2TXpXmPAt/cvXmoL/ZqaELww52XzR91THWNdNQxlg4TGblSnWJzZ34H9b2tQ8
	kKGW/F9AK4nyBNs86iw8Xyz9ZQTKltkaChOloB22X3cVRiAtGRsZN/Skt5m5fuNK4e1+DmWIMWK
	RhvXsKG1La0iNZW69HKPoXbz0ZrbyCnxGITFqTYxruVdSFEYD1elW232RJRKYi+XiWAf8tie6Dp
	c6ceZrpNYK9rGAsA9dvagD+IBEb3Q//wCdX1JAyWh8bvdZo2vCzGfF59+3JzwowrbfbueGRgf9g
	6NQKaBQ3Z3vmqpw2nvsosSHGs9x3CLMTbvIvSjQrC1Ttg/RAl7pL5p/EkjOea1nNUPYeagvT8ro
	sihrT8icqoGVkwHhLcT/uSzJTYEUe7CzCM+CIcZEuWe2wrowyKRpOjJ8HhPzj9BONQ/rrhvuFrl
	mKBK+jxvhqlJMOglB85bCPXfOG5B3+ErweYdu+5W5VQXj1kK3azjHL020ZLCteFw==
X-Received: by 2002:a05:620a:4054:b0:93f:2941:6b8d with SMTP id af79cd13be357-947afcca89emr372348385a.6.1794402898575;
        Wed, 11 Nov 2026 05:14:58 -0800 (PST)
X-Received: by 2002:a05:620a:4054:b0:93f:2941:6b8d with SMTP id af79cd13be357-947afcca89emr372340885a.6.1794402897888;
        Wed, 11 Nov 2026 05:14:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae090ea59esm9929161fa.0.2026.11.11.05.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:14:56 -0800 (PST)
Date: Wed, 11 Nov 2026 15:14:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 5/8] arm64: dts: qcom: sm8250: Add JPEG encoder node
Message-ID: <3ti6ntq6ztczilnwv66ak7ohl63mgw4tv4mdbsiy2hrkqqqjow@rmkwrasthd5e>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
 <20261110163909.78085-6-atanas.filipov@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110163909.78085-6-atanas.filipov@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfX9x4KNdEPaoJc
 KU5QnEpt6l4+VS9/4qA9YG4NvpKMjLfUk3sTarFXv5y76+EN2EbIDSWs+yK/3CTEhziGmrPGwjQ
 sLL8H4jKjHTOWSkTNOUbjUoWqNIPwQEqmvLhOJ0XyXmsTeWUyakuBZ35KYkMZvoYDHKTczYtzTv
 sxca2w3BwTzhMYeedh0EeETfH9eoWOfLUqxX91m8KSnE0GM90vqrpDuaP0mwiPdDcYtzLDK3Tf3
 PDNFCf2suU0P8UMFOTVQDq7Xb7FragTE5bedSGFbL3pflzP7JvDlSzvi+EdO54zqqQAI5nCpN3R
 l69hjQ7h+02GBB9Mzzu0mn6WJKfiyu9jeBcGg8bVj8qa7DlNzM7MJ8XKYe6kSzpVIaK2ZTek5T8
 brsz38Elyvtp7bHJQuImWq7+ONIDNDngNFA/5r+Su+4VP/1O45L+OAx/YUBQq+hsIvUYkfg/qik
 Z9mpkoa0w3r2uLpeaUA==
X-Proofpoint-GUID: PV7fc2t9vGY-2s6YARRsO8hi5TW7H02H
X-Proofpoint-ORIG-GUID: PV7fc2t9vGY-2s6YARRsO8hi5TW7H02H
X-Authority-Analysis: v=2.4 cv=NK1AaE6g c=1 sm=1 tr=0 ts=6af46a53 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=ad0ScDXB7ZbbMzgY0o8A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfX5xWATq2IosRE
 AczZkqmQ3jgUtaw52NEO57VrxI3jNN/MxjjnghLpLcCV0NpKZG/z5/5kt/DRBlWOPV4Nqk2nn54
 mxfuPXvIBPLneDIwuoPJMA7lDFMgq04=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110052

On Tue, Nov 10, 2026 at 06:39:06PM +0200, Atanas Filipov wrote:
> Add the JPEG encoder hardware node to the SM8250 device tree so the
> qcom-jpeg V4L2 encoder driver can bind and operate on this platform.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 72 ++++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index f975c2183269a..7e8447df40188 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -4480,6 +4480,78 @@ cci1_i2c1: i2c-bus@1 {
>  			};
>  		};
>  
> +		jpeg_enc: jpeg-encoder@ac53000 {
> +			compatible = "qcom,sm8250-jpeg-enc";
> +			status = "disabled";

Drop, there is no point in keeping it disabled. (And the status is
expected to be the last property anyway).

> +
> +			reg = <0x0 0x0ac53000 0x0 0x1000>;
> +
> +			interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
> +
> +			power-domains = <&camcc TITAN_TOP_GDSC>,

TITAN_TOP_GDSC is a child of MMCX. You shouldn't need to declare mmcx
separately. Instead cast the votes on TITAN and they will propagate to
the MMCX rail.

> +					<&rpmhpd RPMHPD_MX>,
> +					<&rpmhpd RPMHPD_MMCX>;
> +			power-domain-names = "titan_top", "mx", "mmcx";
> +
> +
> +			interconnects = <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>;

Use tags instead of 0.  I guess it's QCOM_ICC_TAG_ALWAYS.

> +			interconnect-names = "camnoc";
> +
> +			iommus = <&apps_smmu 0x2040 0x400>;
> +
> +			operating-points-v2 = <&jpeg_opp_table>;
> +
> +			jpeg_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-100000000 {
> +					opp-hz = /bits/ 64 <100000000>;
> +					opp-peak-kBps = <262560>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_low_svs>;
> +				};
> +
> +				opp-200000000 {
> +					opp-hz = /bits/ 64 <200000000>;
> +					opp-peak-kBps = <524760>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_svs>;
> +				};
> +
> +				opp-400000000 {
> +					opp-hz = /bits/ 64 <400000000>;
> +					opp-peak-kBps = <978600>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-480000000 {
> +					opp-hz = /bits/ 64 <480000000>;
> +					opp-peak-kBps = <1095600>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_nom>;
> +				};
> +
> +				opp-600000000 {
> +					opp-hz = /bits/ 64 <600000000>;
> +					opp-peak-kBps = <1095600>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_turbo>;
> +				};
> +			};
> +		};
> +
>  		camss: camss@ac6a000 {
>  			compatible = "qcom,sm8250-camss";
>  			status = "disabled";
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
