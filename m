Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA2D36DA1F
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 23:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781567922; cv=none; b=lWVHcaRqd7lH2NSyLgmxAAjoD3rOFoF4SnjRDLSMzeCFbZT4cqFSPT5XJw0EWcemZiMGtzsqx6dE8juRJO/ir2YfF2lthc19zhbWJbuJMTe8FxdXfEMuJOCJJNSD0KceEUH+N4BYDKjbyxEEiHP763u/3IXjCsYArOiHfhKhmBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781567922; c=relaxed/simple;
	bh=FVSgDtBPRhge+35IFB4aqXX7KeZouUbPFNRti7SgTto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RvgcqtyL9zma9Yc7RaQkCC+sBvGBQTO+L9IispkwQCezx3jPuoOaf1q4rBObt9jDhxkqO82wyrFa7+6+MWwdvXMiwOUA00+kUEAALvxKpNlyV64v+eqoa0Ml5avacWSKyFlYsFeKa5EeMvhGZdMaMV3ezYs2hU58FRT/xrgWyFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PCL8BRAo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PB/fim1w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PCL8BRAo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PB/fim1w"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FJ2JxR1245724
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 23:58:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=meNFmdKl6fC1VkSKF346OQk3
	19zoGIXldNOR354wm8E=; b=PCL8BRAopjceVsrj15RB0rfDQq3Kn9E2TksnmRT6
	93MBQ5LJjm7kiqmAeOWWA4I9i5D5jZdnswZ8UVrgEhQQKx3h8GhHd4o+aANLZ+7o
	XHzhFdFQUMN7lu3juWti05xuzvRF7D2ej7jgIMaz48/m6eGS0QRYWgG/m5r01ohJ
	ZlLj2NdeirYltE0flhQqwvlGB7n5GSnROYFm3Enk/mXsBjkRZ50+LgGPF4IbWmpM
	SwcdIyedv30POL1CLf2DdSt8AQyLVU/DXVFuaFlr0mDLCBfrZj2wU3Nqvx57w7BV
	UZQ/VKJxXDDeqnba/D/gstufkzFMrqv3kBr5g/vJ02FZ/g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etetf3krr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 23:58:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9156cb14b1cso374625685a.1
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 16:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781567919; x=1782172719; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=meNFmdKl6fC1VkSKF346OQk319zoGIXldNOR354wm8E=;
        b=PB/fim1wQZUpFofgl/6FklROC9d5prPX6kthn02THKQ+x3SCPfNdKeS8DcMwohSWGt
         mi5b8vpZ/SWRHyBycLqr8YcptrL+NXAwidG8nE1fcSR/xFGHh4bLYaJQHLzB3AvIPWix
         WvhjxgdY69bO/Qnt+vxGckFQgeflh0D+OhEoTxMOpgchDQB1ftEQW6gb8X/SiQlpORry
         ROBhVhK0/0VnPixToOmcuvzYGdpesBJErQq7M50cSTH2Uwad6k2bt2PfR6CoD90giA+4
         KA84pe0PDYEHFXKr7+TcFikAyJRwvcFHoffdV6IEkRcz5Xpj2SJm0cJtWrhaOc/gfBRx
         KB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781567919; x=1782172719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=meNFmdKl6fC1VkSKF346OQk319zoGIXldNOR354wm8E=;
        b=WXIIlzbsgLEI5LpeKhSNwBnQJ0/qBDwyRFTrkISZZuslpP+NwZqiBSZ+41af43ZTzl
         kXkMRAWjFw89MTsBqUAEAMKYQ8/ft4sjBc+QJMmTzfabRNRGNv7t3eGk1ytCAVzbKeB8
         of9QfxXSTdigK+GDEIE30yJhMhk//lsoTXWFJhA6TLirwBb/2kAeiNU8VDt76IFR7MiP
         WZcvWohCivSd7ThM38aPW5GrQy+BgKFeFKvMGwCu2ZczyMfneV8oI+jnD2LEXrrHm7AZ
         +9onJxtTI21u9mcttz9QsBqSBLXfYdmpjzxMCmEqFb0ixGkzgj/F+FlaDa5HT1vP/lbT
         wlrA==
X-Forwarded-Encrypted: i=1; AFNElJ/0PqKeYGquISVjrEbKuzgeDTjv3ClhHqn0rvVyUl7xH/tlMFNS5VzUpJERDJfncmDoHGay0HgDYGeJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5m9GOpzg4pRnD2mEu9UgtdHsxnv/kgyMDzVIfPTeWkT5f6ira
	vmUXA4R/w5iD7ANR9x3mQD82sDxdJbX/X5/YyYR/SjdMcBN/b9zuk1qt78cb6tcjTg7Y1VT3uTj
	/mFodKdPxzbyUMZuvSkLcipuIHkQq+98JobsAFPZ/CBTPtyJWMtgMEvy9cowXZRLZ
X-Gm-Gg: Acq92OEClSzgKiyX0OJn3+afDGOR8KAf9uoyAfVgVP6aPwdB1VwH4OLgfh3UPG+sP+2
	v6qxbbbqPihS5qLu7ceLVdY3o+lrgK/4P/f2sCY7XqUomvB3IbefyiwagOFgjh04xO07zR3zNmt
	Hgtf/IsqxKSqfTgvhbh59HIYpTIITGWPtR2OcGuWkFW27G8HrBGVXxMuWpRhlEcgnDRtXJHssga
	lRghlcQiPd19SMS82+JRjYMV2x8YL5aaA9qX54Zvfov6KgF8OpM0krLOVEao9M1dNDDYVSpGLzN
	pGmq83zt5QRx8b5o1zDv1MdKlJBHDJ+9sTw9crTP2KiB80v2o8rfDY5etVYVtLnv5PZi0O5CCUH
	+wXlbiz1BatocxrIQvWPS2c5mFRyvfJlQcYzMe3VDeOoYHfszopQxt7th1xKVWBeu7j7igl/18L
	RuJjcJ/Zup4KmgSkWo5iStAoihGqrBN05YwF0=
X-Received: by 2002:a05:620a:8909:b0:8ee:eb50:4f51 with SMTP id af79cd13be357-917f1c50c74mr1974879385a.54.1781567919349;
        Mon, 15 Jun 2026 16:58:39 -0700 (PDT)
X-Received: by 2002:a05:620a:8909:b0:8ee:eb50:4f51 with SMTP id af79cd13be357-917f1c50c74mr1974875685a.54.1781567918860;
        Mon, 15 Jun 2026 16:58:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3995c19af27sm2417531fa.35.2026.06.15.16.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 16:58:36 -0700 (PDT)
Date: Tue, 16 Jun 2026 02:58:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v3 2/6] arm64: dts: qcom: pmk8550: add VADC node
Message-ID: <jw6qx3reertq4opa7yjz2irjmvkgfqh5ad6ksi3ne7wg3m7yf5@qs52e6bwnamn>
References: <20260615-topic-sm8x50-adc5-gen3-v3-0-216a2b5ccb85@linaro.org>
 <20260615-topic-sm8x50-adc5-gen3-v3-2-216a2b5ccb85@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615-topic-sm8x50-adc5-gen3-v3-2-216a2b5ccb85@linaro.org>
X-Authority-Analysis: v=2.4 cv=adxRWxot c=1 sm=1 tr=0 ts=6a3091af cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=etDZx0vAmZIugf9a0wEA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 6DqvqQ9YR53XQlN8et3egotfOLLlxoo0
X-Proofpoint-ORIG-GUID: 6DqvqQ9YR53XQlN8et3egotfOLLlxoo0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDI1MyBTYWx0ZWRfX+px2dTeSlWtF
 iA4a2mYBHQ0/bUF0ZmyoGir1P3iBtIPJjgYBdxd47r7Q8n5rAelvYM8GcrgfoV9V4dku+itmg1X
 LMuSRbGmOqkEM1O7V04rRQMTnkndse4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDI1MyBTYWx0ZWRfXxAjeLMHIrd49
 UUo7pdJ5RFFR3GEwO/Cmsyi6GXYDV6nw05s9dVWIAum2wdvMR7hTibQZb7ddf4pPngDg7QlR6lb
 G+zkOUQCdq20ujb8FQ+Nfp2O1UkloZnJvtLK8JRNSzMTrj6ZAEzR43Mpf3oSVcAWRF7sd9FNA72
 eAZNQldRsWMQ+Ihy0BaaYqkXfsEwD9zZmPGTT1vnFO5o+H9ICalfsTKWT7lssnnEBWNfEV5rKBV
 V7SNITJzy4Wls3LHfL41XfX2bG+WvI+4illNpTR+JTU0lasCDy7F9M9yLXJ5THrh/U+/qxwaXki
 yM3Iwcm1qGztgLRI6TVYL4A/U6kwO7BwpF6XQ5shhZ46dGb5LiIkrLrGspVYKXJw+lKDK4vB8EM
 TrPef5qgIRE+51kjeymP365fU4ZFkWIY70WjalZmzu/cE/qy+RDOZaKPTyjPR+wvgHa04pquZ74
 OqYbLvDwhKBG2Sx2B9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150253

On Mon, Jun 15, 2026 at 07:00:08PM +0200, Neil Armstrong wrote:
> Add the VADC node and the initial pmk8550 adc channels.

Nit: PMK8550, ADC.

> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/pmk8550.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
