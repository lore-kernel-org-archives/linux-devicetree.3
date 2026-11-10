Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316721;
	b=cf52EITcoeDAmqS1baq2h0RIC3DHCGp7p5xs4hVeGPYeExbyZv+BWJLUAdzbNINqXl9q
	 ufhVj/OZnxDp1wes6hV1hbMy+Kg1Yqzbg+bW8FmByp0C293lMM/HcgwaicPfh2TTngMlG
	 TInN254ZLOxrfZ9DbPtNQIzrQ79BcmQeOZfqbBM4iMhlFWvIPWvWLXgSCJPPmEKEZ59vK
	 S7s8wXPFzKYHlRO0QHfimOlPXOgLti4lx6ot8ZwaXRFrvYH17EEtpkhUTfI1K02KynvUF
	 gYJngFnJ1J1ADz12EY1Xp8kv0bElLw0svIWqEYJWZa0ZEDlSHOcNQrRAn2Ho6M64oew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316721;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=x/m8qN0MPpjVIYc6xoOnMVMeEe7+lRfm54ryIioSZqI=;
	b=5PQGHHu/0Z7AnWEg4JrLyV9UmCEfeGDghYlryHlm8a7z4NhF0qnRSE5R+98xFPKGPCTu
	 WVfV1duZM6GtEPdAoOelY/NVnTNi85WkML05vUTW2vuBb81EYrOekzaPiytBN/m3WPmA1
	 YKB+U/OPFNbAENfA3gPnLMK6STicnSezADMzAxWoAdpEiTXP2aPKq76PVG/SFZJnM9qDJ
	 tTHGhHxTW0dg5j2S+ZuD2SYPEvkpKTq6Hditz6e65DW56K9KUCgRmSTWzbwsGoaIKxNAt
	 5cSJSByNe38mUQO0A0SBCKmBAu04lwSL4pu3R5oWRWCsAOWPSNEtgMnR5kxPe7W/yaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XTPfigwt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JRqAAsPs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F68E606B6F7
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 13:18:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F68E606B6F7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XTPfigwt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JRqAAsPs
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAFul3178183
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 13:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x/m8qN0MPpjVIYc6xoOnMVMeEe7+lRfm54ryIioSZqI=; b=XTPfigwtgTvljF3i
	86m27RQrIcd+j5CVW8XsaTKNOo52BhyHmfJqrM3rLjEEC7UZBLagA+73oAuX/x2N
	A1o74BHkFVwZPfJM7w54UBMMV2lFDporMuo4nOecBtOkNv3VYLXhnrV8afoUdzzn
	W8Us1XxdQpXwiAOj5nfcJlTYsLU7OlK/QkDzJI2fKrLzdyoDBUvhur2EcsXlaGbP
	A/eH4fAitC++hP5d0tdXiceO457XGdI92TSBYYc+x/9k6qugFXNGNzQ5KpO/He9R
	9PbCkxFwPeRI5+4HnjjaPHOfqFEmXgojcBtA1f8eYrOhR9a4DJccQLqIDNua+Or6
	aB4Asg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyufry07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 13:18:39 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91eb05c8241so37176696d6.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 05:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794316718; x=1794921518; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x/m8qN0MPpjVIYc6xoOnMVMeEe7+lRfm54ryIioSZqI=;
        b=JRqAAsPsdx5yoGq5bEodeAg7/13dkNr3QGrCbZZoraPGDDWRXCVg8V4Dt0nLett8VD
         gYX7RhBDNCORBGMwEAsc/SnOM2QSWyys28r2RRjeyOcStMdCprmMnSCAfZGyVPTkHbdi
         vf0S6KDAr6NylZSdTiozxDLa9lNrAoi8jenwAxhMlVm2LJ6KtZ4QQj/QS8f3NPY4YZEv
         MP6JRps9c9GD8VL0VPJRb/BkUxnK/abzIRSA0HRqkKBVVI2qV4HCk2dGl1Ryhl2GSTaI
         EVuG1hYXVV25fJb/x97WckRa8CNLm4w1TySHHWD0kuaV+FHMomkq0leC64Mc+V20BBwl
         tcNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316718; x=1794921518;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x/m8qN0MPpjVIYc6xoOnMVMeEe7+lRfm54ryIioSZqI=;
        b=uQkNRH5B2ITiqJLsv5frCFHa+dLo5yCBDCwHjDQm0RRV6Qf5fHw4hnSK0hPowOe0J8
         YTSjbUjRhsOemvDBeArzdo3ezlvlqzcl5vkFcPe9eo93K+oVB8n0pBZC4I0gbHwWh6y5
         WIfyE7eOJcb45X4j8MivMOCNYGBZXmO2JInVRQYAV31VGgvwTCPyWw6/KTCDQ65MGCwJ
         XLJyPj7d81zf/EmFhMBUgzmFMqF06uKMdrZck0nNvAWE73uQ0qNbE/lTnrpAfSzEYedq
         oxAC+VDmnXu2st0aOsSgbirWOTfmZdc7YBEVjp2zqUxkOxOlvT63BnP40MNaYT76SGxv
         up0g==
X-Forwarded-Encrypted: i=1; AL+hErEMbsSGFtwpEZbulBJXbCTCEypL0oVRBbiUxFVSeN88KY0MqfujkRdE2ve9wK5jwM6LB79zntIju/lE@vger.kernel.org
X-Gm-Message-State: APuU4Z/PcRRnnQSbxQchVy//vWLI8NfAlhtE5D6H1x4AcK+i07gnWG01
	CHQ0kcCTRm3WxdY7pnqt47dFrJf2qr8g5x24vBbw1feZipy2uyBu+B+Wi7juwgT6DT692+zWjbW
	8RhObxG8K+QS/I6bQSU/Nb9vcR4TCdMkvUIfDFOXQMnFetUSg8TyBgF+ZANKMPqCh
X-Gm-Gg: AYBFou1oh3VikjjbUUYz+sIG3ZNznpXFv+iBFMIkjds/4l+JyWsSDKowKhJm0Txgnm9
	1i9TBVDG0i7eMcOlgOz3ON+ky9rTpgipplc0UDZ9rgSe04j04P+vsdR7j/2LAy0BZimDUZ7b6L7
	0HQtVrp9/v+kQaO45h6RReKEM8uCs0hzdGrDAlAjjvQs8iNWD++mFnVanbi981WnG9KDpNDV717
	z7q3VcCwSU47EL5acFmjD8cN2CYb0qgiRhAh8gPZYhJUb1b8W+Ctrb6m5h5JSL0cKMSItjG2J86
	cb6GutjlM97x2iJDG7fro34kFEuECCV/YvFlBz06GLJBvGOZaYvp9vYvyZLkhVhSBAPSQlMB/5h
	9nZyDf+sMJZmoxUAHJFV1XfNRfBrVX8kKrZ4X0vhXZm4DSN29Khb4dG0Mj3iI1QNIBW4zcfvlA7
	c=
X-Received: by 2002:a05:620a:4152:b0:943:f4a1:7bb9 with SMTP id af79cd13be357-9479f3017e1mr423389485a.18.1794316718578;
        Tue, 10 Nov 2026 05:18:38 -0800 (PST)
X-Received: by 2002:a05:620a:4152:b0:943:f4a1:7bb9 with SMTP id af79cd13be357-9479f3017e1mr423383385a.18.1794316718090;
        Tue, 10 Nov 2026 05:18:38 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835f1772dsm4995698f8f.31.2026.11.10.05.18.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 05:18:37 -0800 (PST)
Message-ID: <7f052309-63b1-40d2-a4e4-29421e46d6c7@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:18:34 +0100
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
Subject: Re: [PATCH 1/3] arm64: dts: qcom: msm8916: Disable disconnected DSI
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark
 <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan
 <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20261110-display-msm-of-graph-v1-0-0f3106f817b4@oss.qualcomm.com>
 <20261110-display-msm-of-graph-v1-1-0f3106f817b4@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261110-display-msm-of-graph-v1-1-0f3106f817b4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ihgtoPjNsD92_pS_AabzqVEDDGilT3OF
X-Authority-Analysis: v=2.4 cv=S6lMU4sP c=1 sm=1 tr=0 ts=6af319af cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=udFPpGrmtiWedX3Zxo8A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: ihgtoPjNsD92_pS_AabzqVEDDGilT3OF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1MiBTYWx0ZWRfX18fz1mHPYL+K
 T+iuxNeQUOg93sPdBuBP+PDyA5P3V/I1AHSp6opxKmB9Ulo7UgJIXQgad6L5Tj6WYvcJ3EqaRvv
 uozQJMhkFDtC7xNGUmr6hLNTLDl2nqk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1MiBTYWx0ZWRfX2KvjrC7c4Fqb
 chGd7nHpkHLqf6ervCgYPpTyX0Gldeg/DyV8zctH9fcUNFvECEXC/ESxvr5SR1/Lk6yDw6uwcSK
 wi6DCz0AaDjGpkivgEMACOtJDNXcAMhvr86Emax/10zQXkd8tLWCJO/ggJbgXhul8RkNW+/6rcs
 vdR9PixzFgVGG4gfLXTvIgk21rTyoiIu8gdU47sypN5AthvqzH39MSXCGq1TBwbjkMZjlEZ7eCk
 B/YdEPumEazWzwOpCcYd9m6CgQMIXEcO0FHtNUfqmyCkOGs/NdFml1d4YUXCPQZUhlko/mUKVX6
 S6vD1z03XNVQ0AvRDjSfappi20mf/3m5BktePDhbv2tckdApU7lPD0fnWaDXbiq71UqmMokJyVw
 0Vrd0KpUPWURHP4SVFWTuR8300T74VvNsd0nLYDDBLDiG6s6mpAjGg/IVIMpUB7iO2It5kRSN7s
 hX7qHmPbDTrvZk4IOjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100052

On 10/11/2026 13:57, Krzysztof Kozlowski wrote:
> MDSS DSI and DSI PHY is useless, when nothing is attached (no panel
> description in DTS), thus should be disabled in DTS.  Linux MSM DRM
> drivers will also fail the probe.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts   | 6 ++++++
>  arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts     | 6 ++++++
>  arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts      | 6 ++++++
>  arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts | 6 ++++++
>  arch/arm64/boot/dts/qcom/msm8916.dtsi                  | 4 ++++
>  5 files changed, 28 insertions(+)
> 

Valid Sashiko feedback, I missed apq8016.

Best regards,
Krzysztof
