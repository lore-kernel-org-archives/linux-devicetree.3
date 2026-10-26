Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023950;
	b=lyKxQS582BrH/sJZvQLgXZ/FKupdqT9SSmXh6wbD0JGf5NnTdrLgdHDsGONyyyodKzCi
	 TKmdhmvI8oH2GXjfRVYJl+BEUzObFeO+H4EqPtcZAbKhIcHwEdSAZW8sR2rfVw1uzuArk
	 vecCr6JV0Iz+ZjvofDNuT7xAZ7NO2DtUgVuSMbDhavtiGrmd8X6z/au9sGWgM5n2nEgu/
	 iG41/VuIC/hiKCgW2AMW5NSnsOZKYDWGTbE5R4FeRd/f15A86bVHxT2ZIJ8V3XBSH66kg
	 /WlO9+7LyMlmc2MPERs58inSX3GWH3pYGh1QkOdmTfb3xkNkBwhVAg/T81cPg1AS1rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023950;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=V+S+mmWNNAXdCfolmnPRQKSIRG7gGMdoVyK8C7u3kFI=;
	b=IIEc/7n10+2nbSBeVu1AEWo9t3C+SWRSaeETEbCDucRtfsIems38SoiP9jgmnWRfcVIi
	 niqnDVTtvgypUU9FnHLm3pYam/60Hi2mlFFRM6XbHv0w0QLehPokc8Hu3VAR4u7SQUKUX
	 /SmDTHDpwHHVJIyDIVlgdJbrhYnAm/1ggR/JgyFEpRmlgALhm8/hcnY1aN/KE8ERAovox
	 E7nLa02c8klYapmjItsGmKF2DC59ZEIQCVbpdswppgfXJQCxtg2ezsFEeQTQMW2sUh/Oj
	 RQYgfSP/q9zivZ7YP7o92E0pe9nPTefTlptpB4BhYtVxgtBcqYjEsNwIol/oXbgMylQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D10w3nIp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SXWwrhlx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7E1606A31A
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 14:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD7E1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D10w3nIp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SXWwrhlx
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt1lR3562064
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 14:12:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V+S+mmWNNAXdCfolmnPRQKSIRG7gGMdoVyK8C7u3kFI=; b=D10w3nIpFbkWiha/
	pHUGRcHj1bLSKe4AoVHQsMWsh6p1u47njClYFwQiltaQWWW6Dm0B3YeDkSQT6uWy
	84srggUKshvtPGri1NjFXY3pHmuducFV3fS7V06NTH9RGs+HVzG6CqU5EEOM5+3Q
	5ZXk7oAWsN72nDz2qRNRjwSyQgSaPhD0zg/cz0HK98KTyr7B8BeyTzKlyokhGatw
	4GSbKNE+7AyME0V7MoHx5XGarCc4juZ1IlTP8cypOPuCHfWVZkIC1lUVrUzqpdci
	nJHeHFqffJJGhHPFT1aVG5MyGcyyCpijvgrPzLXrR2p1/texYRCoNfpLFbMj8jUk
	/rgSCQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4s90xva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 14:12:28 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-990758837bdso117566241.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 07:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793023948; x=1793628748; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V+S+mmWNNAXdCfolmnPRQKSIRG7gGMdoVyK8C7u3kFI=;
        b=SXWwrhlxRncp96F5A02KR52zVy9QWnWaiIPY/IQ48RHmxfj9uqPISmSgpkrMCARO4l
         28LinqX/rKDS40sLj6wz+37GPiwDL1MxyP+zbpDExEVqVEDehdjbNNQHDa91NufVonrE
         38L5Ow5zGj+h9uMvsCPI3GhSoqA1/aWNakiaDPwMqyVgMG9CD5occdJCMU9OsQn/j8e7
         wIuOr8vZhKpJrBf+rsKWjULIx47Tg/l791V3PYKNhqGbFkCi2zRS/eQ+ivS9hbihx9L2
         iBzD/7KHxjoyxOde4g7PHYx+5QiKSficb7YqiK/gDuHBq7m/Ck90YSBtj9+OECfwUjok
         1msQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793023948; x=1793628748;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V+S+mmWNNAXdCfolmnPRQKSIRG7gGMdoVyK8C7u3kFI=;
        b=KBf1x/y6tOlrYmg/TPnM306fyigu3UhlgqtQaKSb9EkpCt12aP2RFx3YrAGbGZQOMN
         lUPRj3Ufps+p/Fvce9pdgolVxRyzaEwoPk7SKs/M4SemKoKRUzToaZK3IDu7s+MigjO0
         IjG+4DQ303gx01CE48dbsz+M1EWvlKWtGbTAXyX6ysb/SQ8JBlER60wk2Jw/fGtQidGR
         jgfkhGkC8wI5qClPFaJ/53uSFWWXQR9rlrUHeoNGNkp0N0AaiO0rbNPNOoPMD9h3/QWW
         U0CIS81gRhi/Yetu+5KmbS6jb25Tz7OuBim7751H/HjJ8o9SBSE2oN2SQ4fNw/Bv7hSa
         633A==
X-Forwarded-Encrypted: i=1; AKwUvBxGBypoUryCcMmS1gVEng+141uOsjEB/whsn3LPNEfj2cPhLRxfVZ2tFtUQtGIbPNGFJ9ZFWYdP/+dY@vger.kernel.org
X-Gm-Message-State: AFq9FYK1pTP/609ewHPg43BcJSsWclhZnhAgbb3xKfZf1/ao/d3D32zP
	I72fV2rwEXqj2KCdPxSkDCkf5B4U1atgVrvqkHwXFuULcxBfICKujrD4IsDYS7pgPxsjzCGbyBe
	JyuEvz1cjL5UJ+KiKm/rPqi6INEDzeonOQwZvDhUxiv1fFx5YOtf7LhjpMf4lhjF/
X-Gm-Gg: AYBFou0ZuU9alT3P3dvuPOcupt57MlKrb6EaEwmR39VgPhoZZ2dwjmhEfQUmiZTAToA
	G9EKXIbXxmX6a0G3+a1Ay8iffEhzTNgNtlV6VY0AawGJwNoFMonKdA7MlHbNC1YHZxILwYS+jwe
	mbmKz7pyAX7WcVGpM1v6+Tqu9QSGDfWqVGwNu138Zo1ag6ot1Fn25sVmdd36KtyYXKFgzOV9xum
	dqrXFK6rOgLyDB0ffMHqA6s8Sj3sAa8Jt/CpYVtk4YEj7+w01vCSznKKLk4IJy8Ii/xTYgHqxQb
	vCb+LddSIcek5zEiUIn1/sWKl55i6n56QtNEZVkPsaKWDQbFlHCRfxBIdJOCl8S8iT6snM2dkkS
	QSQ4ENI3h2JGz5y0fYNW0VA==
X-Received: by 2002:a05:6122:6b8c:20b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ec2331473amr1934426e0c.5.1793023948010;
        Mon, 26 Oct 2026 07:12:28 -0700 (PDT)
X-Received: by 2002:a05:6122:6b8c:20b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ec2331473amr1934356e0c.5.1793023947243;
        Mon, 26 Oct 2026 07:12:27 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7bbdc6sm324825266b.87.2026.10.26.07.12.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 07:12:25 -0700 (PDT)
Message-ID: <52b1a1c4-6e04-42b1-b868-2edb132d37d8@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 15:12:24 +0100
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
Subject: Re: [PATCH v2 7/7] mfd: qcom-pm8008: Tolerate missing interrupt
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-7-b395d2b3f668@oss.qualcomm.com>
 <e68177a7-f2ef-46ed-a468-15d0d9421d98@oss.qualcomm.com>
 <ddefe6d9-1a75-46f0-9ccb-10766729e04c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ddefe6d9-1a75-46f0-9ccb-10766729e04c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NiBTYWx0ZWRfXz/ytA1CGwr6a
 NSHDvIMLH0qbLQhqVoTIgdicGo4k8kKVQhyLpq/d0J739xqXPhsaaacV+xy1YPHOATxAEMCpijM
 t8VnKc+0YIjq29MPPXdDIvVt+Zt4NhtW7xS2C51ruPzVA/ffKb2gWR1K5NFxI2pI6qTUmodyffM
 +vQ679GQP6DGypdqM6p9XEs4o2j9WZ4N88UeKXi6IOsh/9eQA5ioma/Y1d/lps2H5RlZHdP+8SR
 rfZ+rFNgR2S8cFLkd7nW7gJoRu8rU6Glrxeasoip0LF/QNXJhyfI+rzRLQAyHEst5NvRRE1LYkx
 BpwMlyE1GyB2ZDwtoexDhE62ns72MrKzVHL2TEKvRG+vjOpHVTT6js3A5KZXXM+mRDrnWJ6G0LX
 cWcfi0cp9GdFuGeGya8iOcwmsZBiTM6UxO6nZZ3mkgnv2GssVZKPfhOLwtLgWluFR9M+7HjLcij
 BVdypT84ZXGVdm1uJfw==
X-Proofpoint-ORIG-GUID: 3xXZlnFaHn90QnhnsqGRw_kEHz45iPkr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NiBTYWx0ZWRfX3H6VWJdwwJMS
 TMf5rbRFFHk6eJruO89tuC6R5wVUHy4x88xfUcxzLJIR7syl5q8EHDCh0987ENvaffv/h+4oMB7
 DIsfkfEXz+uamb+eb6RPat5Gd6yY/Y4=
X-Proofpoint-GUID: 3xXZlnFaHn90QnhnsqGRw_kEHz45iPkr
X-Authority-Analysis: v=2.4 cv=HKhWhYtv c=1 sm=1 tr=0 ts=6adf5fcc cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=zrBrzXTul4GvSfT2LqoA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260056

On 10/19/26 7:01 AM, Jishnu Prakash wrote:
> Hi Konrad,
> 
> On 10/15/2026 5:35 PM, Konrad Dybcio wrote:
>> On 10/14/26 12:32 PM, Jishnu Prakash wrote:
>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

[...]

> And another point we should note is, the MFD cell name
> "qpnp-temp-alarm" used right now does not bind to our temp-alarm
> driver and this was intentional, as explained by Johan Hovold
> in his change (mfd: pm8008: Rework to match new DT binding),
> in the last paragraph of the commit message:
> 
>     Finally, note that the temperature alarm and GPIO subdrivers need some
>     minor rework before they can be used with non-SPMI devices like the
>     PM8008. The temperature alarm MFD cell name specifically uses a "qpnp"
>     rather than "spmi" prefix to prevent binding until the driver has been
>     updated.
> 
> Since these changes are not yet done, we cannot use
> temp-alarm for PM8008 or PM8010 over I2C for now.

I read that as one more reason to shave off said diff

Konrad
