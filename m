Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D65359A89
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 20:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774385485; cv=none; b=LVVOB4jeMSmX9sGV6i+eRKLScI2M7ZSPYcyV/wiAq0z9wiJhfy3CrANsnjnaPOUsB3mPBtkaE8cYO8gQJovkLHECB5aEE56e5TWmeRRawbqTpmId9SSg+QRRsNfJjmmiJctNTdj68cT5PcUKGmafVTxMlHnJey1Yt4zH0WGyAFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774385485; c=relaxed/simple;
	bh=MTU+U57pNpsq/dzOmftTdumIq1xKapp8p1N6d4QSp3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GjL7gYRqlGGKHAtqRE5M+M2ybUT7m6OM4TFtezh7rWLREMgEe4Ebt1oVhXw6bun5O2RQlLM0cW0zgAM6QWpTAmoCruxmm+dQw8r/zehiLKjaYO+ib14agFmv0akmF4m+26BbknbC83eWqvxiI//v5vab3zHH0H3t8ZT0vsOZZN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=byJTW9Fj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bWkw73et; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="byJTW9Fj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bWkw73et"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJnpf02075801
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 20:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LasjIgiDMjJB9GBC9e0xgSJv
	HR934FQ4A1U1HCWpijY=; b=byJTW9FjRi1+CaqmpriT6yB/g+DufB/jf9emRqJt
	09A11AnuYulJOltfc1ITWNfwCPG2cohwMiESWI+prRGedmRYcpRtyQHVrlEo1tSj
	4XPPj6DIhcrn8alJV0Zo1+K7yiz5HVZ4ATmwpxyBVcW5JLCqcWRjwOMgnxWwZ1tP
	VeIMERU5bNZn6Qt/JtNsano+Mb3TInnHeRgEMJVYstahmxwKKrb1FqKSGb5tAK2M
	tOncyh5/GlZcnDBm6ERgRtAxsmFrkcvy9KiHsXKBD1ounbb2VJmf+yz1J4FWSFEX
	2vAh0vEV05Nm9TtdcwY+p/7rfyaTG4mVtYU1VFWY5Pm35w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4141061p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 20:51:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5091327215dso297886931cf.1
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 13:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774385482; x=1774990282; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LasjIgiDMjJB9GBC9e0xgSJvHR934FQ4A1U1HCWpijY=;
        b=bWkw73etfHIBRxPMhssFrE4TmkSSdXS0/k9dOUxGioYy2RBfkEX7odS2SgKjz4hdyr
         7KeTSvs6mPKFt1GYHxIcDCSznX8zVpdM6EjWnME6ZTWjhLssGfzI112aQdxLwl0pBttQ
         fYTF9jJTg55bV7/66puAr4uqbszz4tdKH75CgR66EvsJmQeW9+shrQD+DyKf1+Ac2mGJ
         +OHJcHpYB7yTdGVbPGvYV5ImRAa3S2RuvR6OjL93rN8+PjvF8990qE9MeQez1RkQ75gm
         LoOfm96WPmqaHrpCf7hLXleIgK+9Tr65FOKKCeXa6gaNcRB8iMpASBREMlaUlCVP55wr
         UZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774385482; x=1774990282;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LasjIgiDMjJB9GBC9e0xgSJvHR934FQ4A1U1HCWpijY=;
        b=os76Ehhn0Vv+o6aJWspI8ronN0jB+hIYYe6C5uLf3ABeyqyFUrooIsv30Rb3GpVv6C
         0aQy3q0bGIwvbxWdOtPLpdR93X0OhMf8qrnyJvZVPEc2up2ZZlHxgcBu+qjyvAaycEQM
         qglUl6Hc8B/H2JfIgXOWujBmSbkYSysCIPycrk7LMgdf4uY7yux9Rxd1+cjNubBXzTOv
         5dETxyHkf6dO0fGKgVqYTaVuPKdRANn60GNuXht1f+gxpijMnHr6dBz5xVMMg3NYKuNA
         nOrR0reN3ZkAvnV3t9MPbKovdxoS9Kr1rE8S1ShwEe3VExjDI93nf8PyKgoLCOksL6Wo
         Dwbg==
X-Forwarded-Encrypted: i=1; AJvYcCUaVDGV7cBykdiGcY3NrUPxv1TzjZFo6zQXWI30AVrwPymPIbgrPnLbUryHh9h/UkSNiPbfh4M/I7yB@vger.kernel.org
X-Gm-Message-State: AOJu0YyADneVaEBtpMb/j9rl2h2iu5Y1KJQC2SXhVCXfxtYfdjJ1rO/o
	i4RPZPxHzVdKH2wO5aN6OpWrX8DfefIVG6W/UYp4gQCg0f68XlTehcQAPEycYM4nJmuGzVEJzWN
	6pVXy/yj/39FTSdcD2pF6eSqZsZRnofZ9yz1LohPJLoB2UGvBxwXbEia0xqCyv7MI
X-Gm-Gg: ATEYQzy+Xqkh9y9vsqNYyuR3huES8IBfk46ITpjzo46UuSKMgqgV6Kf0LsjMMGZ7V8W
	qUWRG3eKUDBLMUbv531YKfARm1cW+wtOPr5Yfvn6h0Xl4XCyqsomw1nO/i/Hg4BvOfDqYoWpF/M
	B0LkoF0VkJY3RZ4JCKTcz+kB/Jg1tdRFLdjFbrhf2Qdhdd1xBXtIqNCmuzQSNjFnQV9GIkeISXK
	GNw7AV5l1p3jw1ihnlv5kQlfXh+wtW31FAmZRlG//wQiQMlRpoG5TNb10RTNjWjx9Q+dUtgSkjc
	Kxjm8PeXuwdr9wUL+0vAqY6ZH2YQhIIT/4igF0BjUFuMO2yFZ4B7LYW+O3nQ8j1KLFT5guPnqNm
	5AoYQCq17RKBDVo6g+QbQ6yMeW1IoPFNeN4D+l5GxRQkL3d/RFagsv0/Hl6tKLCGsc9Fk2ZxltG
	QFroxR85yjU9xwTUIvPiXM5KTifwAn3DeAkDo=
X-Received: by 2002:a05:622a:6684:b0:50b:1932:c9e with SMTP id d75a77b69052e-50b80ddf966mr11474961cf.39.1774385482003;
        Tue, 24 Mar 2026 13:51:22 -0700 (PDT)
X-Received: by 2002:a05:622a:6684:b0:50b:1932:c9e with SMTP id d75a77b69052e-50b80ddf966mr11474741cf.39.1774385481534;
        Tue, 24 Mar 2026 13:51:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9982a6csm33495351fa.25.2026.03.24.13.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 13:51:20 -0700 (PDT)
Date: Tue, 24 Mar 2026 22:51:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/6] arm64: dts: qcom: talos: Add QSPI support
Message-ID: <34cifkyw3pgky4nhcu4jwf2uveszre23kvesr7ksyjvmqhfspo@avsvwa3quvsp>
References: <20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com>
 <20260324-spi-nor-v1-3-3efe59c1c119@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324-spi-nor-v1-3-3efe59c1c119@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=fOk0HJae c=1 sm=1 tr=0 ts=69c2f94a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=LxJgUt3ayfaw469zrgcA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 4CPmIoAxYe8s3_j9rwpqCOHoDqSlPl8o
X-Proofpoint-ORIG-GUID: 4CPmIoAxYe8s3_j9rwpqCOHoDqSlPl8o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE2MSBTYWx0ZWRfXx9/G8VYQngR0
 SSmY2Y+HhO0gR0yMcDFPnOpQQimgweL1cEWmo0X2odDmNyfgLvL5S2yA6u0RQjl4AtXeS9onOSb
 JLILSNSQTsW1FfDFGV55JD2KGAOHY/JMbt6GTxW9Q0WaYJpR9q1GZ0uYEWcASFiQ75OJ2q5CEdx
 +Wvyg1PiAkwRqg5kK4Ja3s5UdLL+T7T6QAu6jhOhKAt4dDn7rRTWoj9aHSrb1moAFuMLbJxITLx
 RKVT3AFyF6XUpY2KD5AqvHuhsAF4YnlRr4H3yIR4755qoLvjqnqLp+xu+6D1P8aMHH8MRzi1CAr
 ZqzpQAXKyPFCehxNzULGgKZZoUtfKo2ODXPKSLSmmvYMmX/EM9fRyPreq9s5mpm5BakZbrl1ejV
 O3xzMthF0+bCKeanais8Qb1SgZFtqKDWlbmWLQ6+1sehFl+zin26RpIP4nSUqxWDCVE8sq19SeU
 FVqd2sQs92mtBJGpagw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240161

On Tue, Mar 24, 2026 at 06:43:20PM +0530, Viken Dadhaniya wrote:
> The Talos (QCS615) platform includes a QSPI controller used for accessing
> external flash storage. Add the QSPI OPP table, TLMM pinmux entries, and
> the QSPI controller node to enable support for this hardware.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 80 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
> index 75716b4a58d6..fd727924b8ca 100644
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> @@ -530,6 +530,25 @@ cdsp_smp2p_in: slave-kernel {
>  
>  	};
>  
> +	qspi_opp_table: opp-table-qspi {

Why is it not defined inside the QSPI device itself?

> +		compatible = "operating-points-v2";
> +
> +		opp-60000000 {
> +			opp-hz = /bits/ 64 <60000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +		};
> +
> +		opp-133250000 {
> +			opp-hz = /bits/ 64 <133250000>;
> +			required-opps = <&rpmhpd_opp_svs>;
> +		};
> +
> +		opp-266500000 {
> +			opp-hz = /bits/ 64 <266500000>;
> +			required-opps = <&rpmhpd_opp_nom>;
> +		};
> +	};
> +
>  	qup_opp_table: opp-table-qup {
>  		compatible = "operating-points-v2";
>  

-- 
With best wishes
Dmitry
