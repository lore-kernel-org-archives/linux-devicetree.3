Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8131738887C
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 05:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784610212; cv=none; b=mRsICXHSVEFA22elbV2dqE9AvkWZHcluUr2Q9xT8MToqbJHkcoOVBr7cfqcIvU/oYJpDi+i2PLCzf3j1ubkFy7b2alkstknUhzr9UOn4tGUYzoLjHBoLNM8Itk/g4niHJAQFrF/O+NSy7QnUA9apCXN+l+h2L/6r4f/d+ruTQN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784610212; c=relaxed/simple;
	bh=sRsCIW3nhN74wIi76A5EigIHKbNUuhG2UUwuiLYSzwQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YMdcBOWWrP1thmLFqgjLpkpelGiT9KHNZ2HNrh3UcnMSTXvqYFCkJOMeRhTmcFVRJcdPE+q24mzmt8CleS+ws79+YM6pxZimlKkKf0wWLdXPLpIf99FV/oBwQMPkRiCCYhR8eZfnYkW1YIGzBmaplCYAOYCnDMxPdI+HYmt0DXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NeDx8DBq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D7J2Bvsz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NeDx8DBq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D7J2Bvsz"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNCQSf045341
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 05:03:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Y66YiQmyTPgZ51BeCWnyExMbCnlckoQpI59e8kX+d8=; b=NeDx8DBqHd6VdR1J
	fd9qT7yYvlTb5G91v1wHvoDkofeYjrFHvOK0dOrMb0SoM090A3xLPaDBq3Bl+U7w
	P806fP+1Q7U/r93JP9JBGGdOEOv0bLjA571vUA1CTM3F6ahF/9kl+nE/DkUeZC2f
	72/jMUYs01SPjYs5ogpTW5I2Ps52i8VYAYNuJpbqC8ov0K0kedqVfRQhgD2k/Ggy
	VX7PuNOLE4c8i/TrTVzpVvLf3pNFSacUDCj8d0XgSCDDSlmF37cCfVXh8BMdYL5z
	08sVxbx59We6HvhVZg9HEo3Hxu5oWnBi2nlyfJgP8Pw7yEvzJGWGy06CUAt66c3v
	wO3diA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv5tbk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 05:03:30 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb5cc1e13f8so4036102a12.3
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 22:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784610210; x=1785215010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Y66YiQmyTPgZ51BeCWnyExMbCnlckoQpI59e8kX+d8=;
        b=D7J2BvszaViywhQUo1IYMtLqoQnFRMPux3ajg3LqWTNXlhhuAtN9tg2ONBpxp7XUji
         t8oLgT2vej9OAzceY3XGvuiwsriNH8XXiyrUyuaoiwPgx+gCsv2F3P9JkijpohTcCtHv
         ExBjE3oUqnlWdOSHiDzaY/bOmZMAO1SNzyWphFWnDkUDvxAYFyUhZizglgJL5G9YBWqD
         izOM4HIxkqrY/P8j2OXrGntUCMd/msQR7sgn3RRWap98hC5OGAmhe5vNc+DbHmpM0b5b
         4ZivT3MeYu/HXjKYG9/KAjJ2OzSZupsq6jW6QB+I66QK6gOFx9TkNKR8/W6TZp8PHpBV
         O98w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784610210; x=1785215010;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Y66YiQmyTPgZ51BeCWnyExMbCnlckoQpI59e8kX+d8=;
        b=VdqGm7IwF62ApVADt5bWj+uETdViQUdu9PtFkCLu/APRCP8SI1S7xx9sed/AxEWKgd
         udCoSpj7qpc62zaJLk1IT07ikQ/J5ccGswFC09kW2uWrDyW/QeWlj5Jn9eDf6BeaccIr
         ImUntnN1qHuNTCDBGaaC/Z+ENRnJtVJ+tvjWaGN8x0+Oeesu6RMrtyxlSXV5lvCLPx4M
         W/Qp0gxrUotg3uCEBclme0NTcWkMhuAdiDVaYIv7nl9NRAdS3nhLQspMjfnoUlS3fdDz
         28mrIOUoIzRZMSqHY0g+TsWeAiW6I1i5EZW+Q76QOq9oP8besck+Sbm1WOmbeENmQZ7a
         IdAw==
X-Forwarded-Encrypted: i=1; AHgh+Ron9G9W3DxwhWq61mVFZIIelCWc/5FqN/XeRV5owg9xwsrbfIDiFoN4x3g4+dD6pVXaG3VsYMS0b8gh@vger.kernel.org
X-Gm-Message-State: AOJu0YzEY3Tjwjai0rohcI/RxjANnaoRi57WE4HqXmRTTgfNvFznvLwn
	4LnlZP2nk5xfX/RLj09AYQAM/U6aEUWTzJPoY5C0rWs9k/0/KJgdB+AMPUslIst+W6jvbv/3a7n
	HShwiaDiJ6nrCqteJsu4aeDA+63gTt2iyQ6SZzesgEWIceBu6GtxBef0t487qITl3
X-Gm-Gg: AfdE7clpnkULg2x5Irw/SJeV90+e5YGxrUkjZxHqCimYIuevF6h5aFUiNZyVYvGdRcs
	ePt9NExbiFlnQsVS9ZhyoVzV9BgrNQf533nHy0h8iCQ4XfCLmsG2w38lwCL/otHPlEKVPtJ93YG
	5KKKKSU9JqgRkaVVNbDvGZbttnZ34yhZ6J/0azDy+0Zs581wTn+rpfDjB3zmXnY9OpSo8Pi2zOY
	p7hUrHNhee+FrtG4ihfaac4i8TPCPrtKgT6PsO/UqPxYRZrYp7lEYE9cyagca81Oxdrcla06F3b
	BKUuFgDh/rRfW2l+Z17So3WoD259JRiu2qyuJXqIxlv94eYX8IbDGWmXii3fjdWJR0ZvlfQiiAe
	hl8+3qTnGMUMWRSHsTtaj5XusEO/r4Bg=
X-Received: by 2002:a05:6a21:a8d:b0:3c3:954d:278d with SMTP id adf61e73a8af0-3c3ad5aed77mr18383777637.9.1784610210028;
        Mon, 20 Jul 2026 22:03:30 -0700 (PDT)
X-Received: by 2002:a05:6a21:a8d:b0:3c3:954d:278d with SMTP id adf61e73a8af0-3c3ad5aed77mr18383742637.9.1784610209570;
        Mon, 20 Jul 2026 22:03:29 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb517ba73b4sm5440010a12.4.2026.07.20.22.03.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 22:03:29 -0700 (PDT)
Message-ID: <26bedd34-6a5b-4b3c-b737-4f71b5b80cd2@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 10:33:24 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/6] arm64: dts: qcom: Add device tree for Nord SoC
 series
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260721044005.2882803-1-shengchao.guo@oss.qualcomm.com>
 <20260721044005.2882803-2-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260721044005.2882803-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA0OCBTYWx0ZWRfX0bqgBq4M+AqR
 B/oY6vaiTTzpCJ8g47m3TVxy4wCquVhO59ii+XKcu9pwl7kOV2zyAS2M4aUOKIysMtiWI5MT2yQ
 QvZoTatw3Sod8eZPfoKUN6V6IPRFamYO45JjlbRox/YqntwFbGoB1PeETMghGo+z12fbkj2+2ih
 L/yk1Z9MacMYW9EnRuDN70311UlXVsggtH4iqj3tPJtsnbUj4rtJ9UYWiHgBxPLMGWtBgAFSfrd
 /GsETSYH+CIA+i5xtmvReZqc8XheFueCB1Seso5zBtr9hTM/ZkS++zhHFNact2D9EVtiEJQUUJ+
 NEuM7e+ViPOWYPdpHcEht+9ArQyfND//mUgFU7ibYp1zcWDZj9vwiaXSryw/a6eJ3Y8PtPgM08Y
 /oPwlC5syHrZyWDLkr7RQ845L2nBmndMC/T7o8eDzajNTqyhTZAiH+egkXahWIwtUQb503WsBed
 oAnIbl+bs0O2aCU8usA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA0OCBTYWx0ZWRfX0vCGtkXJBElt
 5qcrgFOZsV9vhRKrgzvpPtrs9LGFBMZfX765WjG8WKtMcRfPWmEt8yEd4loRwC9b6ttNW+LvWL0
 ClwwwA7rnbirX8Fx1O71YReKeHrt+3M=
X-Authority-Analysis: v=2.4 cv=WNpPmHsR c=1 sm=1 tr=0 ts=6a5efda2 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=hLQETX_3T8l7bD8GKiAA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: BOU1dzfzsbTvOED0aYgAADxa7pRbT05W
X-Proofpoint-ORIG-GUID: BOU1dzfzsbTvOED0aYgAADxa7pRbT05W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210048

On 21-07-2026 10:10, Shawn Guo wrote:
> +		crypto: crypto@1dfa000 {
> +			compatible = "qcom,nord-qce", "qcom,sm8150-qce", "qcom,qce";
> +			reg = <0x0 0x01dfa000 0x0 0x6000>;
> +			dmas = <&cryptobam 4>, <&cryptobam 5>;
> +			dma-names = "rx", "tx";
> +			iommus = <&apps_smmu_0 0x1689 0>;
> +
> +			/* It stops nord-gearvm variant from booting to console */
What's issue you are observing Shawn?
Usually we GPCE is enabled default if soc has IP but seems nord is doing
differently here.

-- 
Regards
Kuldeep

