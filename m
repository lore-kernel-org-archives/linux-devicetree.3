Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364711;
	b=tZIKgIcpaRZYRM5yxR3aVPEkfGf/xfkqG1/h2uj1emuJKUWp5jXkSSQ/e2R5jhDpcSYz
	 Btx4BqAhNncRbgi9CTUhHa7dSpc/0LE5Ww1Lwn/WiqzHNHukvfOsQkDnqJD6Fl9fk10rp
	 ssUrQL4BGEFydfaKoBz5a+gJ57CYrF9lMS17L+QdcoyMAlYhYD9VQ33qLC6zrz1FQosHU
	 mPFKqgcA4PUr25VFXdE+AvEnP0X965hITojW9vU0M9aM0HxT6GJaWv4A+ofTAA0zTYmQX
	 armXx2aQ1D6hvsUkYBahC/3EhNJFrj8W3tZtx3ste64sM1+7LjsSjiV4+1NVn8qWqGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364711;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=D0EDMrN3qvcGMCxD8B6G5UF0I5Wmci6lKmkeZTbIbxQ=;
	b=CtmmGHfIMf6LkEPWGjAgPvruMGpSB1Ma95z3MvkXaw8Apk9g0VG3vnbhRVtP6vDSbuds
	 wj/EkO2CJtEI3LIqxRYhzo4OCh2e7M5IkvZW9CBCbSbSK9NRNVkiNACOt6ii9CfIEhNhR
	 Crrm/P9a2dxztpwSe5x0IX/L6Mj7VD+hATL4RpX9IcMgpGIRl3AI2tl9zb54jYYi5C8Ev
	 ORR/4d1DcCwdAqO1F1rNNLghLpFgyhG2HLHyUBTl1Hq8lkzPoXYNBlUBPIiwdG0d8H1rr
	 Ir85xlsR5XZTVhB2lnH6j4sNq+w8Lb/D5fJE6222stVSYHyPLVK4NnhDhtshJVqYdWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Blypgrft;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="cke04Sh/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B99B606A31D
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:51:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B99B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Blypgrft;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cke04Sh/
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBG8J83719548
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:51:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D0EDMrN3qvcGMCxD8B6G5UF0I5Wmci6lKmkeZTbIbxQ=; b=Blypgrft/wyyMJSq
	mYY375W75c1+9WXq1BojubqxmfWXwPIf3SR4gHD/uaL4/xp/MXz+lnekH3dUu3f2
	QUk6CGan9obk+Ym1fNLrY/SUlajSzJ08omubYyIhKk+m0UkQTDB/zuFkxaYnCLL5
	PqV+OzdYYMVIaYIpWFx3VEISRxMwdMagcVooY+JAb2xA/AgCE7ckL4JY89SxKuAU
	eMwM7AFzX8vcIjOmpfQ1bcTV3eAboUZ/YG8shW/R6OgQgVHs1cIQns0t9Xyj+Vzm
	eOVhi5BvHQjUZLsgC2j9u8oYePm8hXL7jJLvdaN7mu6tr2+CkaaCPU9yE8Dg0K7X
	OvUPvw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qu2a9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:51:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc50fb0d2so17819685a.0
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 05:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793364709; x=1793969509; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D0EDMrN3qvcGMCxD8B6G5UF0I5Wmci6lKmkeZTbIbxQ=;
        b=cke04Sh/EDrAj1++jkj6IXelNAT3Z/h/Mw//P5fHf2ZJR1WDQ9RNtMFl/2F82a1ZYD
         ZXxfugK5a9R10lMdb1QZmtNvXFy1bSztjQtSsS9AsBOo2Ei5X0lyDkVPr3cNIB2N3Ucz
         76f94O1PV0XKc0VTEBu50tHdIpHCsaOwKwEZYvT/IXbmvySbUSrmysW9SqGGqgIT9wjM
         5bWCiqdo6qyyuvNsZr9PubSb5KIuytUTmglJ6t5QF4sr6Z4FHesnKiYTkC8KZrEneXXU
         6neGciSz4Ddv6jkNEHr28a4j129/RuWbjUlCuT1fBIktq2gZyprT51NPZS0y1Uu86uKN
         2czA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364709; x=1793969509;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D0EDMrN3qvcGMCxD8B6G5UF0I5Wmci6lKmkeZTbIbxQ=;
        b=lvwgr9Zii7K0HtXG3p45VXgSCF5BQtO/84UHHU+bqMMgv4lv41IJhkpy1SeuaUYi8G
         ErUhjUsfMtt2LJlm/QMuZ6RFQLKsmBcs8W5gumTQA1FVfnYBC5e0ByIWZB+lTOCkG4eH
         pFfCY9I2G7qv3T12zRJzzyXwWqXuez8cDQixt5wbWvO8NhZM9Qn+ba1Lox8qG2PE/EE6
         3NCr7WczfHW3DpqVI8Eb2XZwpVis0VQbN6zxmUX6yB3ctcPRH5RlbROU6pJIn8eUClwo
         aJdiR4MDmkyvvoIcDbbnpzjEfMPGY7auDlN6V86Y5Er9kEbpospWA5ZLmWzkg/eUZwBI
         iL0g==
X-Forwarded-Encrypted: i=1; AKwUvBzgatCh/OuALxstvROUXmLz3PanP+iZrf804cRJG2zaPC7Lq9pZzrXNU4vdPkQXoJ2n65R+hA1GKja2@vger.kernel.org
X-Gm-Message-State: AFq9FYIo1TTXXh+tbECANd8+I13MfSw9UCPsWo1YnBbuNRZen02PH0yc
	Z3s5AbxqeV6DV1NfzNDnLEwSGu4M6HeJiSz0TuR6qGjgRSLC3Uk9ycRnL8Ki8yb+WXKw56ggySt
	17/jX1nUCa8s8c6OXJDONFlkiiginHwoYosCJ4FkCjjVb8Zfh/hhFQD+inSVghRHf
X-Gm-Gg: AYBFou0Bi8Zjr29XSIBB+HeNnqKJENwWeUX3NcPZCFQETWBQKLhcrDVzE017Dxn0bmP
	kHNSUSCkd8fYaX1+Ked5ATqTeQKqWXuVNtMCxeif225Zil7PoOZ1byA0jC3U+P4RvEfvMnnzg3q
	93JLgipvwsVO6zwDy1yjRekh6bsu1KV0RpWE5ird5JSArc+BBENGPfdDj6tbWL5YK47N+XZk8FM
	FffxCN6rNJSWxKhff2RmBuCR+G9nuEoBB8RrO5wTlRZUtfiRWCXYyFnHpToDqHkGfNpZE5KtbH5
	BveP4TuG/aWmlSskgKxtVH4eoxV48+zj4r4dt9yPiIxlHicMdRhvmgng7jUOQsxhVzUDx0ZOLEu
	1mBUXT90tIJ8cSPDYOCtaZkodKCJWv1F3YTzu53lF22YMiwo7WMQMWun77S6W8fIJlseNCuM=
X-Received: by 2002:a05:620a:a0dc:10b0:93f:43a4:a48f with SMTP id af79cd13be357-944217268c1mr334118185a.5.1793364708760;
        Fri, 30 Oct 2026 05:51:48 -0700 (PDT)
X-Received: by 2002:a05:620a:a0dc:10b0:93f:43a4:a48f with SMTP id af79cd13be357-944217268c1mr334113685a.5.1793364708087;
        Fri, 30 Oct 2026 05:51:48 -0700 (PDT)
Received: from [10.169.205.110] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfdb92sm62678466b.13.2026.10.30.05.51.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 05:51:47 -0700 (PDT)
Message-ID: <f0a6aff5-1293-4d18-8c8b-52f06a4050f5@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 13:51:45 +0100
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
Subject: Re: [PATCH 4/5] arm64: dts: qcom: milos-nothing-asteroids: Enable IPA
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261029-asteroids-dts-updates-v1-0-79351337d681@pm.me>
 <20261029-asteroids-dts-updates-v1-4-79351337d681@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029-asteroids-dts-updates-v1-4-79351337d681@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RsqHLfujZFweHMd3O3m-wnEeeRkqZgXt
X-Proofpoint-ORIG-GUID: RsqHLfujZFweHMd3O3m-wnEeeRkqZgXt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX3Y9Q3W43uMHE
 a+fvHSATtewm+nW0hMcyp1GziAabonqH/Tc85a/ijt0P53uZS6J659VO4dT7oR8VZ2CBfTWhtJp
 Xaq49D8rmItMGeQM7ihHhp9O5fxprEe7Qf4V+Dq4Se0R+IUNECRXCS9B+c5byIitrUq7TZUISs2
 hq+q+VeaYXg2QJno7ElYeBM9rFP6Nao8Y5v+8FEAjcjqIEf6qcewCi5ujv673C4fNnK0J5FZEPo
 MBrLpA8d+VRXr3/PSMnhsUpwLgJKUXUecEcqeAuu2hnAqtXu757NScoYqOUdHEzJ0luoTjE/Lo8
 LIed6KWgoO010/a5fe+OFF5bY2JUdQuOe7Bq62nqwVXVJ/ZV3fFL+aFAPIGIppdMw1SocWjqJfg
 ecqN6WNgNqZPZtU1EoGK5YKT+DJHS5adFTBsfOyjWCVDoKZif62eoQFRkTJ4VZx7ZnFB1gnhs9L
 x6C1UzJmPHkhq9EBULA==
X-Authority-Analysis: v=2.4 cv=dPgzC+Zb c=1 sm=1 tr=0 ts=6ae492e5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2vvDfV54RvwmZ0zWTFIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX1sMdnaNWK1l2
 OT8gCYBBCsDXpnebYnuEZpMGaRTGGxg/qprZwqALfhtila6C18FEIUSIC2eoPwwJW8rujVZPNKW
 blFTzqlLAWQpUQY6iG83fEGEdCYozw0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300051

On 10/29/26 11:33 PM, Alexander Koskovich wrote:
> Configure and enable the node for IPA which enables mobile data on this
> device.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts b/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
> index 7d8afe8e95d5..af115295a20d 100644
> --- a/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
> +++ b/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
> @@ -880,6 +880,15 @@ fsa4480_sbu_mux: endpoint {
>  	};
>  };
>  
> +&ipa {
> +	firmware-name = "qcom/milos/nothing/asteroids/ipa_fws.mbn";
> +	memory-region = <&ipa_fw_mem>;
> +
> +	qcom,gsi-loader = "self";
> +
> +	status = "okay";
> +};

Actually please move gsi-loader and memory region to the SoC DTSI

https://lore.kernel.org/linux-arm-msm/20260517-ipa-loader-v1-7-3c3764c1b4a3@oss.qualcomm.com/

Konrad
